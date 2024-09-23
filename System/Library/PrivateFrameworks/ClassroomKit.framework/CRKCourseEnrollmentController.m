@implementation CRKCourseEnrollmentController

+ (CRKCourseEnrollmentController)sharedEnrollmentController
{
  void *WeakRetained;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKCourseEnrollmentController.m"), 60, CFSTR("%@ must be called from the main thread"), v7);

  }
  WeakRetained = objc_loadWeakRetained(&sSharedController);
  if (!WeakRetained)
  {
    WeakRetained = (void *)objc_opt_new();
    objc_storeWeak(&sSharedController, WeakRetained);
  }
  return (CRKCourseEnrollmentController *)WeakRetained;
}

- (CRKCourseEnrollmentController)init
{
  void *v3;
  CRKCourseEnrollmentController *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKCourseEnrollmentController initWithStudentDaemonProxy:](self, "initWithStudentDaemonProxy:", v3);

  return v4;
}

- (CRKCourseEnrollmentController)initWithStudentDaemonProxy:(id)a3
{
  id v6;
  CRKCourseEnrollmentController *v7;
  CRKSecureCodedUserDefaultsObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CRKSecureCodedUserDefaultsObject *mStoredCourses;
  uint64_t v14;
  NSHashTable *observers;
  uint64_t v16;
  NSSet *activeInstructors;
  void *v18;
  void *v19;
  void *v21;
  objc_super v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKCourseEnrollmentController.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonProxy"));

  }
  v22.receiver = self;
  v22.super_class = (Class)CRKCourseEnrollmentController;
  v7 = -[CRKCourseEnrollmentController init](&v22, sel_init);
  if (v7)
  {
    v8 = [CRKSecureCodedUserDefaultsObject alloc];
    v9 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CRKSecureCodedUserDefaultsObject initWithKey:classes:](v8, "initWithKey:classes:", CFSTR("ClassroomSettingsStoreCoursesKey"), v11);
    mStoredCourses = v7->mStoredCourses;
    v7->mStoredCourses = (CRKSecureCodedUserDefaultsObject *)v12;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    objc_storeStrong((id *)&v7->_studentDaemonProxy, a3);
    v16 = objc_opt_new();
    activeInstructors = v7->_activeInstructors;
    v7->_activeInstructors = (NSSet *)v16;

    v7->_iCloudAccountStatus = 0;
    objc_msgSend(v6, "addObserver:", v7);
    if (objc_msgSend(v6, "isConnected"))
      -[CRKCourseEnrollmentController daemonProxyDidConnect:](v7, "daemonProxyDidConnect:", v6);
    else
      objc_msgSend(v6, "connect");
    -[CRKCourseEnrollmentController fetchStoredCourses](v7, "fetchStoredCourses");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel_applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourseEnrollmentController daemonProxyDidDisconnect:](self, "daemonProxyDidDisconnect:", v3);

  v4.receiver = self;
  v4.super_class = (Class)CRKCourseEnrollmentController;
  -[CRKCourseEnrollmentController dealloc](&v4, sel_dealloc);
}

- (void)addEnrollmentObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKCourseEnrollmentController observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)courseWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CRKCourseEnrollmentController courses](self, "courses", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "courseIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)invitationWithCourseIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CRKCourseEnrollmentController courseInvitations](self, "courseInvitations", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "courseIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)instructorUsersForCourse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v5, "instructorsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crk_setByCopyingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKCourseEnrollmentController anonymousInstructorUsersForCourse:](self, "anonymousInstructorUsersForCourse:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isCourseActive:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CRKCourseEnrollmentController activeInstructors](self, "activeInstructors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__CRKCourseEnrollmentController_isCourseActive___block_invoke;
  v8[3] = &unk_24D9C8238;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "crk_containsObjectMatchingPredicate:", v8);

  return (char)v4;
}

uint64_t __48__CRKCourseEnrollmentController_isCourseActive___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "instructor:isForCourse:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)isStudentScreenBeingObservedForCourse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CRKCourseEnrollmentController activeInstructors](self, "activeInstructors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__CRKCourseEnrollmentController_isStudentScreenBeingObservedForCourse___block_invoke;
  v8[3] = &unk_24D9C8238;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "crk_containsObjectMatchingPredicate:", v8);

  return (char)v4;
}

uint64_t __71__CRKCourseEnrollmentController_isStudentScreenBeingObservedForCourse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "isObservingStudentScreen"))
    v4 = objc_msgSend(*(id *)(a1 + 32), "instructor:isForCourse:", v3, *(_QWORD *)(a1 + 40));
  else
    v4 = 0;

  return v4;
}

- (BOOL)isInstructorWithIdentifier:(id)a3 disconnectableForCourse:(id)a4
{
  void *v4;
  char v5;

  -[CRKCourseEnrollmentController activeInstructorsWithIdentifier:forCourse:](self, "activeInstructorsWithIdentifier:forCourse:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "crk_containsObjectMatchingPredicate:", &__block_literal_global_34);

  return v5;
}

uint64_t __84__CRKCourseEnrollmentController_isInstructorWithIdentifier_disconnectableForCourse___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowsStudentInitiatedDisconnection");
}

- (BOOL)isInstructorWithIdentifier:(id)a3 activeForCourse:(id)a4
{
  void *v4;
  BOOL v5;

  -[CRKCourseEnrollmentController activeInstructorsWithIdentifier:forCourse:](self, "activeInstructorsWithIdentifier:forCourse:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)isInstructorWithIdentifier:(id)a3 observingStudentScreenForCourse:(id)a4
{
  void *v4;
  char v5;

  -[CRKCourseEnrollmentController activeInstructorsWithIdentifier:forCourse:](self, "activeInstructorsWithIdentifier:forCourse:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "crk_containsObjectMatchingPredicate:", &__block_literal_global_31);

  return v5;
}

uint64_t __92__CRKCourseEnrollmentController_isInstructorWithIdentifier_observingStudentScreenForCourse___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isObservingStudentScreen");
}

- (void)disconnectInstructorWithIdentifier:(id)a3 forCourse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setInstructorIdentifier:", v7);

  objc_msgSend(v6, "courseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setCourseIdentifier:", v8);
  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueuedOperationForRequest:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addTarget:selector:forOperationEvents:", self, sel_disconnectOperationDidFinish_, 6);
}

- (void)disconnectOperationDidFinish:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKCourseEnrollmentController disconnectOperationDidFinish:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("CRKCourseEnrollmentController.m"), 201, CFSTR("expected %@, got %@"), v10, v12);

  }
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _CRKLogSettings();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKCourseEnrollmentController disconnectOperationDidFinish:].cold.1(v4, v6);

  }
}

+ (id)keyPathsForValuesAffectingSupportsRemoteLearning
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("configurationType"));
}

- (BOOL)supportsRemoteLearning
{
  return -[CRKCourseEnrollmentController configurationType](self, "configurationType") == 4;
}

- (void)userDidActivateSettingsPane
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _CRKLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "User did activate Settings pane", v7, 2u);
  }

  v4 = (void *)objc_opt_new();
  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueuedOperationForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addTarget:selector:forOperationEvents:", self, sel_notifyDaemonOfSettingsPaneActivationOperationDidFail_, 4);
}

- (void)notifyDaemonOfSettingsPaneActivationOperationDidFail:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _CRKLogGeneral_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CRKCourseEnrollmentController notifyDaemonOfSettingsPaneActivationOperationDidFail:].cold.1(v3, v4);

}

- (void)daemonProxyDidConnect:(id)a3
{
  -[CRKCourseEnrollmentController fetchCourses](self, "fetchCourses", a3);
  -[CRKCourseEnrollmentController fetchCourseInvitations](self, "fetchCourseInvitations");
  -[CRKCourseEnrollmentController fetchActiveInstructors](self, "fetchActiveInstructors");
  -[CRKCourseEnrollmentController startLongRunningOperations](self, "startLongRunningOperations");
}

- (void)daemonProxy:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  void *v6;
  int v7;
  id v8;

  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.studentd.configuration.didchange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v7)
  {
    -[CRKCourseEnrollmentController fetchConfiguration](self, "fetchConfiguration");
    -[CRKCourseEnrollmentController fetchCourses](self, "fetchCourses");
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("CRKActiveInstructorsDidChange")))
  {
    -[CRKCourseEnrollmentController fetchActiveInstructors](self, "fetchActiveInstructors");
  }

}

- (void)applicationWillEnterForeground:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _CRKLogSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Connecting to studentd because Settings will enter the foreground", v6, 2u);
  }

  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connect");

}

- (void)applicationDidEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _CRKLogSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Disconnecting from studentd because Settings entered the background", v6, 2u);
  }

  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnect");

}

- (void)startLongRunningOperations
{
  -[CRKCourseEnrollmentController stopLongRunningOperations](self, "stopLongRunningOperations");
  -[CRKCourseEnrollmentController fetchConfiguration](self, "fetchConfiguration");
}

- (void)stopLongRunningOperations
{
  -[CRKCourseEnrollmentController stopBrowsingForInvitations](self, "stopBrowsingForInvitations");
  self->mConfigurationFetched = 0;
}

- (void)updateInvitationBrowsingStatus
{
  if (-[CRKCourseEnrollmentController canBrowseForInvitations](self, "canBrowseForInvitations"))
  {
    if (!self->mBrowseOperation)
      -[CRKCourseEnrollmentController startBrowsingForInvitations](self, "startBrowsingForInvitations");
  }
  else
  {
    -[CRKCourseEnrollmentController stopBrowsingForInvitations](self, "stopBrowsingForInvitations");
  }
}

- (BOOL)canBrowseForInvitations
{
  void *v3;
  char v4;
  unint64_t v5;
  _BOOL8 v6;

  +[CRKSystemInfo sharedSystemInfo](CRKSystemInfo, "sharedSystemInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEphemeralMultiUser");

  if ((v4 & 1) != 0)
    return 0;
  v5 = -[CRKCourseEnrollmentController configurationType](self, "configurationType");
  if (!self->mConfigurationFetched)
    return 0;
  v6 = (v5 >> 1) & 1;
  return !-[CRKCourseEnrollmentController configurationType](self, "configurationType") || v6;
}

- (void)startBrowsingForInvitations
{
  void *v3;
  void *v4;
  CATRemoteTaskOperation *v5;
  CATRemoteTaskOperation *mBrowseOperation;

  -[CRKCourseEnrollmentController stopBrowsingForInvitations](self, "stopBrowsingForInvitations");
  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "enqueuedOperationForRequest:", v4);
  v5 = (CATRemoteTaskOperation *)objc_claimAutoreleasedReturnValue();
  mBrowseOperation = self->mBrowseOperation;
  self->mBrowseOperation = v5;

  -[CATRemoteTaskOperation setNotificationDelegate:](self->mBrowseOperation, "setNotificationDelegate:", self);
}

- (void)stopBrowsingForInvitations
{
  CATRemoteTaskOperation *mBrowseOperation;

  -[CATRemoteTaskOperation cancel](self->mBrowseOperation, "cancel");
  -[CATRemoteTaskOperation setNotificationDelegate:](self->mBrowseOperation, "setNotificationDelegate:", 0);
  mBrowseOperation = self->mBrowseOperation;
  self->mBrowseOperation = 0;

}

- (void)fetchConfiguration
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueuedOperationForRequest:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addTarget:selector:forOperationEvents:", self, sel_fetchConfigurationTypeOperationDidFinish_, 6);
}

- (void)fetchConfigurationTypeOperationDidFinish:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKCourseEnrollmentController.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchConfigurationTypeOperation"));

  }
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _CRKLogSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CRKCourseEnrollmentController fetchConfigurationTypeOperationDidFinish:].cold.1(v5, v7);

  }
  else
  {
    objc_msgSend(v5, "resultObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCourseEnrollmentController setConfigurationType:](self, "setConfigurationType:", objc_msgSend(v8, "configurationType"));
    -[CRKCourseEnrollmentController setSignedInToStudentMAID:](self, "setSignedInToStudentMAID:", objc_msgSend(v8, "isSignedInToStudentMAID"));
    self->mConfigurationFetched = 1;
    -[CRKCourseEnrollmentController updateInvitationBrowsingStatus](self, "updateInvitationBrowsingStatus");
    -[CRKCourseEnrollmentController updateSettingsUIVisibility](self, "updateSettingsUIVisibility");

  }
}

- (void)fetchCourses
{
  void *v3;
  void *v4;
  id v5;

  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "enqueuedOperationForRequest:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTarget:selector:forOperationEvents:", self, sel_fetchCoursesOperationDidFinish_, 6);
}

- (void)fetchCoursesOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a3, "resultObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "courses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourseEnrollmentController coursesBySortingCourses:](self, "coursesBySortingCourses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourseEnrollmentController activeCourseIdentifiers](self, "activeCourseIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CRKCourseEnrollmentController setCourses:](self, "setCourses:", v5);
  -[CRKCourseEnrollmentController activeCourseIdentifiers](self, "activeCourseIdentifiers");
  v7 = objc_claimAutoreleasedReturnValue();
  -[CRKCourseEnrollmentController didUpdateCourses](self, "didUpdateCourses");
  if (v6 | v7 && (objc_msgSend((id)v6, "isEqual:", v7) & 1) == 0)
    -[CRKCourseEnrollmentController didUpdateActiveCourses](self, "didUpdateActiveCourses");
  -[CRKCourseEnrollmentController updateSettingsUIVisibility](self, "updateSettingsUIVisibility");

}

- (void)setCourses:(id)a3
{
  objc_storeStrong((id *)&self->_courses, a3);
  -[CRKCourseEnrollmentController storeCourses](self, "storeCourses");
}

- (void)fetchStoredCourses
{
  NSArray *v3;
  NSArray *courses;

  -[CRKSecureCodedUserDefaultsObject value](self->mStoredCourses, "value");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  courses = self->_courses;
  self->_courses = v3;

}

- (void)storeCourses
{
  id v3;
  id v4;

  -[CRKCourseEnrollmentController courses](self, "courses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v3 = v4;
  else
    v3 = 0;
  -[CRKSecureCodedUserDefaultsObject setValue:](self->mStoredCourses, "setValue:", v3);

}

- (void)fetchCourseInvitations
{
  void *v3;
  void *v4;
  id v5;

  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "enqueuedOperationForRequest:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTarget:selector:forOperationEvents:", self, sel_fetchCourseInvitationsOperationDidFinish_, 6);
}

- (void)fetchCourseInvitationsOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "resultObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "courseInvitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("courseName"), 1, sel_localizedStandardCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingDescriptors:", v8);

  -[CRKCourseEnrollmentController setCourseInvitations:](self, "setCourseInvitations:", v6);
  objc_msgSend(v4, "acceptedInvitationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourseEnrollmentController setAcceptedInvitationIdentifiers:](self, "setAcceptedInvitationIdentifiers:", v9);

  -[CRKCourseEnrollmentController didUpdateInvitations](self, "didUpdateInvitations");
  -[CRKCourseEnrollmentController updateSettingsUIVisibility](self, "updateSettingsUIVisibility");

}

- (void)fetchActiveInstructors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CRKCourseEnrollmentController fetchActiveInstructorsOperation](self, "fetchActiveInstructorsOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CRKCourseEnrollmentController studentDaemonProxy](self, "studentDaemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "enqueuedOperationForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCourseEnrollmentController setFetchActiveInstructorsOperation:](self, "setFetchActiveInstructorsOperation:", v6);

  -[CRKCourseEnrollmentController fetchActiveInstructorsOperation](self, "fetchActiveInstructorsOperation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:selector:forOperationEvents:", self, sel_fetchActiveInstructorsOperationDidFinish_, 6);

}

- (void)fetchActiveInstructorsOperationDidFinish:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;

  v4 = a3;
  -[CRKCourseEnrollmentController fetchActiveInstructorsOperation](self, "fetchActiveInstructorsOperation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CRKCourseEnrollmentController setFetchActiveInstructorsOperation:](self, "setFetchActiveInstructorsOperation:", 0);
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      _CRKLogGeneral_2();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CRKCourseEnrollmentController fetchActiveInstructorsOperationDidFinish:].cold.1((uint64_t)v6, v7, v8);

    }
    else
    {
      objc_msgSend(v4, "resultObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v9, "instructors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      -[CRKCourseEnrollmentController activeInstructors](self, "activeInstructors");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13 | v12)
      {
        v14 = (void *)v13;
        -[CRKCourseEnrollmentController activeInstructors](self, "activeInstructors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v12);

        if ((v16 & 1) == 0)
        {
          -[CRKCourseEnrollmentController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeInstructors"));
          -[CRKCourseEnrollmentController activeCourseIdentifiers](self, "activeCourseIdentifiers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&self->_activeInstructors, (id)v12);
          -[CRKCourseEnrollmentController activeCourseIdentifiers](self, "activeCourseIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[CRKCourseEnrollmentController updateScreenObservingInstructors](self, "updateScreenObservingInstructors");
          -[CRKCourseEnrollmentController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activeInstructors"));
          if (v17 != v18)
          {
            -[CRKCourseEnrollmentController courses](self, "courses");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRKCourseEnrollmentController coursesBySortingCourses:](self, "coursesBySortingCourses:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRKCourseEnrollmentController setCourses:](self, "setCourses:", v21);

            -[CRKCourseEnrollmentController didUpdateActiveCourses](self, "didUpdateActiveCourses");
          }
          if (v19)
            -[CRKCourseEnrollmentController didUpdateCourses](self, "didUpdateCourses");

        }
      }

    }
  }

}

- (BOOL)updateScreenObservingInstructors
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  CRKCourseEnrollmentController *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = self;
  -[CRKCourseEnrollmentController activeInstructors](self, "activeInstructors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v9, "isObservingStudentScreen"))
        {
          objc_msgSend(v9, "sessionIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "groupIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = (void *)objc_opt_new();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v12);
          }
          objc_msgSend(v9, "userIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v3, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "sortUsingSelector:", sel_compare_);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v17);
  }

  v20 = objc_msgSend(v3, "copy");
  -[CRKCourseEnrollmentController observingInstructorIdentifiersByCourseIdentifiers](v27, "observingInstructorIdentifiersByCourseIdentifiers");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21 | v20
    && (v22 = (void *)v21,
        -[CRKCourseEnrollmentController observingInstructorIdentifiersByCourseIdentifiers](v27, "observingInstructorIdentifiersByCourseIdentifiers"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v24 = objc_msgSend(v23, "isEqual:", v20), v23, v22, (v24 & 1) == 0))
  {
    -[CRKCourseEnrollmentController setObservingInstructorIdentifiersByCourseIdentifiers:](v27, "setObservingInstructorIdentifiersByCourseIdentifiers:", v20);
    v25 = 1;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)coursesBySortingCourses:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__CRKCourseEnrollmentController_coursesBySortingCourses___block_invoke;
  v4[3] = &unk_24D9C82C0;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __57__CRKCourseEnrollmentController_coursesBySortingCourses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "isCourseActive:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "isCourseActive:", v6);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v12 = -1;
  }
  else if ((v8 ^ 1 | v7) == 1)
  {
    objc_msgSend(v5, "courseName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "courseName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "localizedStandardCompare:", v11);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)activeCourses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[CRKCourseEnrollmentController courses](self, "courses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__CRKCourseEnrollmentController_activeCourses__block_invoke;
  v8[3] = &unk_24D9C82E8;
  v8[4] = self;
  objc_msgSend(v4, "crk_filterUsingBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__CRKCourseEnrollmentController_activeCourses__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCourseActive:", a2);
}

- (id)activeCourseIdentifiers
{
  void *v2;
  void *v3;

  -[CRKCourseEnrollmentController activeCourses](self, "activeCourses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_74);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __56__CRKCourseEnrollmentController_activeCourseIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "courseIdentifier");
}

- (id)activeInstructorsWithIdentifier:(id)a3 forCourse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CRKCourseEnrollmentController activeInstructors](self, "activeInstructors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__CRKCourseEnrollmentController_activeInstructorsWithIdentifier_forCourse___block_invoke;
  v13[3] = &unk_24D9C8350;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "crk_filterUsingBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __75__CRKCourseEnrollmentController_activeInstructorsWithIdentifier_forCourse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = a1;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  LODWORD(v3) = objc_msgSend(v3, "instructor:isForCourse:", v5, v4);
  objc_msgSend(v5, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v6, "isEqual:", *(_QWORD *)(v2 + 48));
  return v3 & v2;
}

- (BOOL)instructor:(id)a3 isForCourse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "courseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v5;
}

- (id)anonymousInstructorUsersForCourse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  CRKCourseEnrollmentController *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "instructorsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKCourseEnrollmentController activeInstructors](self, "activeInstructors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__CRKCourseEnrollmentController_anonymousInstructorUsersForCourse___block_invoke;
  v14[3] = &unk_24D9C8378;
  v15 = v4;
  v16 = v8;
  v17 = self;
  v10 = v8;
  v11 = v4;
  objc_msgSend(v9, "crk_mapUsingBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __67__CRKCourseEnrollmentController_anonymousInstructorUsersForCourse___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "courseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "sessionIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "groupIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      goto LABEL_10;
    }
    v3 = (void *)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "courseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v6)
  {

    if (!v11)
      goto LABEL_11;
  }
  else
  {

    if ((v11 & 1) == 0)
      goto LABEL_11;
  }
LABEL_10:
  v12 = *(void **)(a1 + 40);
  objc_msgSend(v5, "userIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v12, "containsObject:", v13);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "syntheticUserForAnonymousInstructor:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_11:
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)syntheticUserForAnonymousInstructor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserIdentifier:", v5);

  objc_msgSend(v3, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDisplayName:", v6);
  objc_msgSend(v4, "setRole:", 2);
  return v4;
}

- (void)updateSettingsUIVisibility
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  -[CRKCourseEnrollmentController courses](self, "courses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[CRKCourseEnrollmentController courseInvitations](self, "courseInvitations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v4 = 1;
    else
      v4 = -[CRKCourseEnrollmentController isSignedInToStudentMAID](self, "isSignedInToStudentMAID");

  }
  -[CRKCourseEnrollmentController settingsUIVisible](self, "settingsUIVisible");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[CRKCourseEnrollmentController settingsUIVisible](self, "settingsUIVisible"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLValue"),
        v8,
        v7,
        v4 != v9))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCourseEnrollmentController setSettingsUIVisible:](self, "setSettingsUIVisible:", v10);

    -[CRKCourseEnrollmentController didUpdateSettingsUIVisibility](self, "didUpdateSettingsUIVisibility");
  }
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CRKCourseInvitationsUpdatedNotification")))
  {
    -[CRKCourseEnrollmentController fetchCourseInvitations](self, "fetchCourseInvitations");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("CRKCourseInvitationDidFailNotification")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Course"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Reason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCourseEnrollmentController invitationWithIdentifierDidFail:withLocalizedReason:](self, "invitationWithIdentifierDidFail:withLocalizedReason:", v8, v9);

  }
}

- (id)observersRespondingToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[CRKCourseEnrollmentController observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__CRKCourseEnrollmentController_observersRespondingToSelector___block_invoke;
  v8[3] = &__block_descriptor_40_e57_B16__0__NSObject_CRKCourseEnrollmentControllerObserver__8l;
  v8[4] = a3;
  objc_msgSend(v5, "crk_filterUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__CRKCourseEnrollmentController_observersRespondingToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)didUpdateSettingsUIVisibility
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[CRKCourseEnrollmentController observersRespondingToSelector:](self, "observersRespondingToSelector:", sel_enrollmentControllerDidUpdateSettingsUIVisibility_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "enrollmentControllerDidUpdateSettingsUIVisibility:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)didUpdateCourses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[CRKCourseEnrollmentController observersRespondingToSelector:](self, "observersRespondingToSelector:", sel_enrollmentControllerDidUpdateCourses_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "enrollmentControllerDidUpdateCourses:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)didUpdateActiveCourses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[CRKCourseEnrollmentController observersRespondingToSelector:](self, "observersRespondingToSelector:", sel_enrollmentControllerDidUpdateActiveCourses_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "enrollmentControllerDidUpdateActiveCourses:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)didUpdateInvitations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[CRKCourseEnrollmentController observersRespondingToSelector:](self, "observersRespondingToSelector:", sel_enrollmentControllerDidUpdateInvitations_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "enrollmentControllerDidUpdateInvitations:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)invitationWithIdentifierDidFail:(id)a3 withLocalizedReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CRKCourseEnrollmentController observersRespondingToSelector:](self, "observersRespondingToSelector:", sel_enrollmentController_invitationWithIdentifierDidFail_localizedReason_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "enrollmentController:invitationWithIdentifierDidFail:localizedReason:", self, v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (NSNumber)settingsUIVisible
{
  return self->_settingsUIVisible;
}

- (void)setSettingsUIVisible:(id)a3
{
  objc_storeStrong((id *)&self->_settingsUIVisible, a3);
}

- (CRKStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (int64_t)iCloudAccountStatus
{
  return self->_iCloudAccountStatus;
}

- (NSArray)courses
{
  return self->_courses;
}

- (NSArray)courseInvitations
{
  return self->_courseInvitations;
}

- (void)setCourseInvitations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)acceptedInvitationIdentifiers
{
  return self->_acceptedInvitationIdentifiers;
}

- (void)setAcceptedInvitationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)observingInstructorIdentifiersByCourseIdentifiers
{
  return self->_observingInstructorIdentifiersByCourseIdentifiers;
}

- (void)setObservingInstructorIdentifiersByCourseIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_observingInstructorIdentifiersByCourseIdentifiers, a3);
}

- (CATRemoteTaskOperation)fetchActiveInstructorsOperation
{
  return self->_fetchActiveInstructorsOperation;
}

- (void)setFetchActiveInstructorsOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchActiveInstructorsOperation, a3);
}

- (NSSet)activeInstructors
{
  return self->_activeInstructors;
}

- (void)setActiveInstructors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isSignedInToStudentMAID
{
  return self->_signedInToStudentMAID;
}

- (void)setSignedInToStudentMAID:(BOOL)a3
{
  self->_signedInToStudentMAID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeInstructors, 0);
  objc_storeStrong((id *)&self->_fetchActiveInstructorsOperation, 0);
  objc_storeStrong((id *)&self->_observingInstructorIdentifiersByCourseIdentifiers, 0);
  objc_storeStrong((id *)&self->_acceptedInvitationIdentifiers, 0);
  objc_storeStrong((id *)&self->_courseInvitations, 0);
  objc_storeStrong((id *)&self->_courses, 0);
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->_settingsUIVisible, 0);
  objc_storeStrong((id *)&self->mStoredCourses, 0);
  objc_storeStrong((id *)&self->mBrowseOperation, 0);
}

- (void)disconnectOperationDidFinish:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "instructorIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Failed to disconnect from instructor: %{public}@ course: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)notifyDaemonOfSettingsPaneActivationOperationDidFail:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a2, v5, "Failed to notify daemon ot Settings pane activation: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)fetchConfigurationTypeOperationDidFinish:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a2, v4, "Failed to fetch student configuration type: %{public}@", (uint8_t *)&v5);

}

- (void)fetchActiveInstructorsOperationDidFinish:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a2, a3, "Failed to fetch active instructors: %{public}@", (uint8_t *)&v3);
}

@end
