@implementation CKDRemoveAnonymousShareFromSharedDBOperation

- (CKDRemoveAnonymousShareFromSharedDBOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDRemoveAnonymousShareFromSharedDBOperation *v9;
  uint64_t v10;
  NSDictionary *encryptedAnonymousSharesToRemove;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id anonymousShareRemovedBlock;
  const char *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKDRemoveAnonymousShareFromSharedDBOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v18, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_encryptedAnonymousSharesToRemove(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    encryptedAnonymousSharesToRemove = v9->_encryptedAnonymousSharesToRemove;
    v9->_encryptedAnonymousSharesToRemove = (NSDictionary *)v10;

    objc_msgSend_anonymousShareRemovedBlock(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    anonymousShareRemovedBlock = v9->_anonymousShareRemovedBlock;
    v9->_anonymousShareRemovedBlock = (id)v14;

    objc_msgSend_setDatabaseScope_(v9, v16, 3);
  }

  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/RemoveAnonymousShareFromSharedDB", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    objc_msgSend_error(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend__removeAnonymousShareFromSharedDB(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
  {
    v5 = CFSTR("Call _removeAnonymousShareFromSharedDB");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDRemoveAnonymousShareFromSharedDBOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)operationType
{
  return 271;
}

- (void)_removeAnonymousShareFromSharedDB
{
  CKDAnonymousShareRemoveURLRequest *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id from;
  id location;

  v3 = [CKDAnonymousShareRemoveURLRequest alloc];
  objc_msgSend_encryptedAnonymousSharesToRemove(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_initWithOperation_encryptedAnonymousSharesToRemove_(v3, v7, (uint64_t)self, v6);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  objc_msgSend_stateTransitionGroup(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v11);

  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1BEAD6334;
  v23[3] = &unk_1E7832FB0;
  objc_copyWeak(&v24, &location);
  objc_msgSend_setAnonymousShareRemovedBlock_(v8, v13, (uint64_t)v23);
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = sub_1BEAD63C4;
  v20[3] = &unk_1E782E468;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  objc_msgSend_setCompletionBlock_(v8, v14, (uint64_t)v20);
  objc_msgSend_setRequest_(self, v15, (uint64_t)v8);
  objc_msgSend_container(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v18, v19, (uint64_t)v8);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (NSDictionary)encryptedAnonymousSharesToRemove
{
  return self->_encryptedAnonymousSharesToRemove;
}

- (void)setEncryptedAnonymousSharesToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, a3);
}

- (id)anonymousShareRemovedBlock
{
  return self->_anonymousShareRemovedBlock;
}

- (void)setAnonymousShareRemovedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anonymousShareRemovedBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, 0);
}

@end
