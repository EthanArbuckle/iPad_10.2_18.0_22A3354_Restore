@implementation CLSSettingsVisibilityController

+ (id)shared
{
  if (qword_1ED0FB8E0 != -1)
    dispatch_once(&qword_1ED0FB8E0, &unk_1E9749C30);
  return (id)qword_1ED0FB8D8;
}

- (CLSSettingsVisibilityController)init
{
  const char *v2;
  uint64_t v3;
  CLSSettingsVisibilityController *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  CLSSettingsVisibilityController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSSettingsVisibilityController;
  v4 = -[CLSSettingsVisibilityController init](&v11, sel_init);
  if (v4)
  {
    if (!objc_msgSend_isInternalProcess(CLSEntitlements, v2, v3))
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)v4, sel_currentUserDidChange_, CFSTR("CLSCurrentUserDidChangeNotificationName"), 0);

    v4->_lock._os_unfair_lock_opaque = 0;
  }
  v9 = v4;
LABEL_6:

  return v9;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)CLSSettingsVisibilityController;
  -[CLSSettingsVisibilityController dealloc](&v6, sel_dealloc);
}

- (void)currentUserDidChange:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  CLSCurrentUser *v11;
  CLSCurrentUser *currentUser;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_msgSend_userInfo(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("CLSCurrentUserInfoKey"));
  v11 = (CLSCurrentUser *)objc_claimAutoreleasedReturnValue();
  currentUser = self->_currentUser;
  self->_currentUser = v11;

  objc_msgSend_unlock(self, v13, v14);
  dispatch_async(MEMORY[0x1E0C80D38], &unk_1E974C158);
}

- (id)cachedCurrentUserAppleID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_person(self->_currentUser, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appleID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentUser
{
  uint64_t v2;
  CLSCurrentUser *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_currentUser;
  objc_msgSend_unlock(self, v5, v6);
  if (qword_1ED0FB348 != -1)
    dispatch_once(&qword_1ED0FB348, &unk_1E974C178);
  return v4;
}

- (BOOL)settingsUIVisible
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  char isStudent;

  objc_msgSend_currentUser(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isInstructor(v3, v4, v5) & 1) != 0)
    isStudent = 1;
  else
    isStudent = objc_msgSend_isStudent(v3, v6, v7);

  return isStudent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUser, 0);
}

@end
