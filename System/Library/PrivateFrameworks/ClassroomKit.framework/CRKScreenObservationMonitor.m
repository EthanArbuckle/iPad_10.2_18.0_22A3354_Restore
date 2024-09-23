@implementation CRKScreenObservationMonitor

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CRKScreenObservationMonitor studentConnection](self, "studentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CRKScreenObservationMonitor observersDidChangeObservation](self, "observersDidChangeObservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CRKScreenObservationMonitor enrollmentStatusDidChangeSubscription](self, "enrollmentStatusDidChangeSubscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  v6.receiver = self;
  v6.super_class = (Class)CRKScreenObservationMonitor;
  -[CRKScreenObservationMonitor dealloc](&v6, sel_dealloc);
}

- (CRKScreenObservationMonitor)initWithStudentConnectionPrimitives:(id)a3 darwinNotificationPublisher:(id)a4 featureDataStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKScreenObservationMonitor *v12;
  CRKScreenObservationMonitor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKScreenObservationMonitor;
  v12 = -[CRKScreenObservationMonitor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_studentConnectionPrimitives, a3);
    objc_storeStrong((id *)&v13->_darwinNotificationPublisher, a4);
    objc_storeStrong((id *)&v13->_featureDataStore, a5);
    -[CRKScreenObservationMonitor beginObservingEnrollmentStatus](v13, "beginObservingEnrollmentStatus");
    -[CRKScreenObservationMonitor connectToStudentdIfNeeded](v13, "connectToStudentdIfNeeded");
  }

  return v13;
}

- (CRKScreenObservationMonitor)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRKScreenObservationMonitor *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "makePrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "makeFeatureDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v8 = -[CRKScreenObservationMonitor initWithStudentConnectionPrimitives:darwinNotificationPublisher:featureDataStore:](self, "initWithStudentConnectionPrimitives:darwinNotificationPublisher:featureDataStore:", v4, v7, v6);

  return v8;
}

- (BOOL)hasObservingInstructors
{
  void *v2;
  BOOL v3;

  -[CRKScreenObservationMonitor observingInstructorsByCourse](self, "observingInstructorsByCourse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingHasObservingInstructors
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("observingInstructorsByCourse"));
}

+ (BOOL)automaticallyNotifiesObserversOfObservingInstructorsByCourse
{
  return 0;
}

- (void)setObservingInstructorsByCourse:(id)a3
{
  unint64_t v4;
  NSDictionary *observingInstructorsByCourse;
  char v6;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;

  v4 = (unint64_t)a3;
  observingInstructorsByCourse = self->_observingInstructorsByCourse;
  if (v4 | (unint64_t)observingInstructorsByCourse)
  {
    v10 = (void *)v4;
    v6 = -[NSDictionary isEqual:](observingInstructorsByCourse, "isEqual:", v4);
    v4 = (unint64_t)v10;
    if ((v6 & 1) == 0)
    {
      -[CRKScreenObservationMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("observingInstructorsByCourse"));
      v7 = (NSDictionary *)objc_msgSend(v10, "copy");
      v8 = self->_observingInstructorsByCourse;
      self->_observingInstructorsByCourse = v7;

      -[CRKScreenObservationMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("observingInstructorsByCourse"));
      -[CRKScreenObservationMonitor delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "screenObservationMonitor:observationStatusDidChange:", self, self->_observingInstructorsByCourse);

      v4 = (unint64_t)v10;
    }
  }

}

- (id)instructorIdentifiersByCourseIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[CRKScreenObservationMonitor observingInstructorsByCourse](self, "observingInstructorsByCourse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke_2;
  v7[3] = &unk_24D9C87E0;
  v7[4] = self;
  objc_msgSend(v4, "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_68, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "courseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "observingInstructorsByCourse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "crk_mapUsingBlock:", &__block_literal_global_8_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIdentifier");
}

- (void)enrollmentStatusDidChange
{
  void *v3;
  int v4;

  -[CRKScreenObservationMonitor featureDataStore](self, "featureDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClassroomStudentRoleEnabled");

  if (v4)
    -[CRKScreenObservationMonitor connectToStudentdIfNeeded](self, "connectToStudentdIfNeeded");
  else
    -[CRKScreenObservationMonitor disconnectFromStudentdIfNeeded](self, "disconnectFromStudentdIfNeeded");
}

- (void)beginObservingEnrollmentStatus
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Unable to register for enrollment status changes", v1, 2u);
}

void __61__CRKScreenObservationMonitor_beginObservingEnrollmentStatus__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enrollmentStatusDidChange");

}

- (void)connectToStudentdIfNeeded
{
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[CRKScreenObservationMonitor featureDataStore](self, "featureDataStore");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isClassroomStudentRoleEnabled") & 1) == 0)
    {
LABEL_5:

      return;
    }
    -[CRKScreenObservationMonitor studentConnection](self, "studentConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

      goto LABEL_5;
    }
    v5 = -[CRKScreenObservationMonitor isConnecting](self, "isConnecting");

    if (!v5)
    {
      -[CRKScreenObservationMonitor setConnecting:](self, "setConnecting:", 1);
      objc_initWeak(&location, self);
      -[CRKScreenObservationMonitor studentConnectionPrimitives](self, "studentConnectionPrimitives");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x24BDAC760];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke;
      v11[3] = &unk_24D9C9638;
      objc_copyWeak(&v12, &location);
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke_2;
      v9[3] = &unk_24D9C7A60;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v6, "connectWithCompletion:invalidationHandler:", v11, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[CRKScreenObservationMonitor performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

void __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didEstablishStudentConnection:", v3);

}

void __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didLoseStudentConnection");

}

- (void)disconnectFromStudentdIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKScreenObservationMonitor studentConnection](self, "studentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKScreenObservationMonitor observersDidChangeObservation](self, "observersDidChangeObservation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[CRKScreenObservationMonitor setObserversDidChangeObservation:](self, "setObserversDidChangeObservation:", 0);
    -[CRKScreenObservationMonitor studentConnection](self, "studentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[CRKScreenObservationMonitor setStudentConnection:](self, "setStudentConnection:", 0);
    -[CRKScreenObservationMonitor setObservingInstructorsByCourse:](self, "setObservingInstructorsByCourse:", MEMORY[0x24BDBD1B8]);
  }
}

- (void)didEstablishStudentConnection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKScreenObservationMonitor.m"), 185, CFSTR("%@ must be called from the main thread"), v9);

  }
  objc_initWeak(&location, self);
  -[CRKScreenObservationMonitor setStudentConnection:](self, "setStudentConnection:", v5);
  -[CRKScreenObservationMonitor setConnecting:](self, "setConnecting:", 0);
  -[CRKScreenObservationMonitor observersDidChangeObservation](self, "observersDidChangeObservation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__CRKScreenObservationMonitor_didEstablishStudentConnection___block_invoke;
  v10[3] = &unk_24D9C9660;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "observeNotificationWithName:handler:", CFSTR("CRKActiveInstructorsDidChange"), v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKScreenObservationMonitor setObserversDidChangeObservation:](self, "setObserversDidChangeObservation:", v7);

  -[CRKScreenObservationMonitor fetchObservingInstructorsByCourse](self, "fetchObservingInstructorsByCourse");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __61__CRKScreenObservationMonitor_didEstablishStudentConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchObservingInstructorsByCourse");

}

- (void)didLoseStudentConnection
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKScreenObservationMonitor.m"), 198, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[CRKScreenObservationMonitor observersDidChangeObservation](self, "observersDidChangeObservation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CRKScreenObservationMonitor setObserversDidChangeObservation:](self, "setObserversDidChangeObservation:", 0);
  -[CRKScreenObservationMonitor studentConnection](self, "studentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[CRKScreenObservationMonitor setStudentConnection:](self, "setStudentConnection:", 0);
  -[CRKScreenObservationMonitor connectToStudentdIfNeeded](self, "connectToStudentdIfNeeded");
}

- (void)fetchObservingInstructorsByCourse
{
  void *v3;
  CRKFetchObservingInstructorsByCourseOperation *v4;
  void *v5;
  CRKFetchObservingInstructorsByCourseOperation *v6;
  void *v7;
  void *v8;
  id v9;

  -[CRKScreenObservationMonitor fetchObservingInstructorsByCourseOperation](self, "fetchObservingInstructorsByCourseOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4 = [CRKFetchObservingInstructorsByCourseOperation alloc];
  -[CRKScreenObservationMonitor studentConnection](self, "studentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKFetchObservingInstructorsByCourseOperation initWithRequestPerformer:](v4, "initWithRequestPerformer:", v5);
  -[CRKScreenObservationMonitor setFetchObservingInstructorsByCourseOperation:](self, "setFetchObservingInstructorsByCourseOperation:", v6);

  -[CRKScreenObservationMonitor fetchObservingInstructorsByCourseOperation](self, "fetchObservingInstructorsByCourseOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:selector:forOperationEvents:", self, sel_fetchObservingInstructorsByCourseOperationDidFinish_, 6);

  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKScreenObservationMonitor fetchObservingInstructorsByCourseOperation](self, "fetchObservingInstructorsByCourseOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v8);

}

- (void)fetchObservingInstructorsByCourseOperationDidFinish:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  -[CRKScreenObservationMonitor fetchObservingInstructorsByCourseOperation](self, "fetchObservingInstructorsByCourseOperation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _CRKLogGeneral_7();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CRKScreenObservationMonitor fetchObservingInstructorsByCourseOperationDidFinish:].cold.1(v4, v7);

    }
    else
    {
      objc_msgSend(v4, "resultObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKScreenObservationMonitor setObservingInstructorsByCourse:](self, "setObservingInstructorsByCourse:", v8);

    }
  }

}

- (CRKScreenObservationMonitorDelegate)delegate
{
  return (CRKScreenObservationMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)observingInstructorsByCourse
{
  return self->_observingInstructorsByCourse;
}

- (CRKStudentConnectionPrimitives)studentConnectionPrimitives
{
  return self->_studentConnectionPrimitives;
}

- (CRKDarwinNotificationPublisher)darwinNotificationPublisher
{
  return self->_darwinNotificationPublisher;
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (CRKStudentConnection)studentConnection
{
  return self->_studentConnection;
}

- (void)setStudentConnection:(id)a3
{
  objc_storeStrong((id *)&self->_studentConnection, a3);
}

- (CRKObservation)observersDidChangeObservation
{
  return self->_observersDidChangeObservation;
}

- (void)setObserversDidChangeObservation:(id)a3
{
  objc_storeStrong((id *)&self->_observersDidChangeObservation, a3);
}

- (CRKCancelable)enrollmentStatusDidChangeSubscription
{
  return self->_enrollmentStatusDidChangeSubscription;
}

- (void)setEnrollmentStatusDidChangeSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentStatusDidChangeSubscription, a3);
}

- (CRKFetchObservingInstructorsByCourseOperation)fetchObservingInstructorsByCourseOperation
{
  return self->_fetchObservingInstructorsByCourseOperation;
}

- (void)setFetchObservingInstructorsByCourseOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchObservingInstructorsByCourseOperation, a3);
}

- (BOOL)isConnecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchObservingInstructorsByCourseOperation, 0);
  objc_storeStrong((id *)&self->_enrollmentStatusDidChangeSubscription, 0);
  objc_storeStrong((id *)&self->_observersDidChangeObservation, 0);
  objc_storeStrong((id *)&self->_studentConnection, 0);
  objc_storeStrong((id *)&self->_featureDataStore, 0);
  objc_storeStrong((id *)&self->_darwinNotificationPublisher, 0);
  objc_storeStrong((id *)&self->_studentConnectionPrimitives, 0);
  objc_storeStrong((id *)&self->_observingInstructorsByCourse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)fetchObservingInstructorsByCourseOperationDidFinish:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Error fetching observing instructors: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
