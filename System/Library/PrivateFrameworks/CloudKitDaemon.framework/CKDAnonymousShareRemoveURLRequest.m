@implementation CKDAnonymousShareRemoveURLRequest

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (CKDAnonymousShareRemoveURLRequest)initWithOperation:(id)a3 encryptedAnonymousSharesToRemove:(id)a4
{
  id v7;
  CKDAnonymousShareRemoveURLRequest *v8;
  CKDAnonymousShareRemoveURLRequest *v9;
  uint64_t v10;
  NSMutableDictionary *encryptedAnonymousShareHashToRemoveByRequestID;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDAnonymousShareRemoveURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v13, sel_initWithOperation_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_encryptedAnonymousSharesToRemove, a4);
    v10 = objc_opt_new();
    encryptedAnonymousShareHashToRemoveByRequestID = v9->_encryptedAnonymousShareHashToRemoveByRequestID;
    v9->_encryptedAnonymousShareHashToRemoveByRequestID = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDAnonymousShareRemoveURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_encryptedAnonymousSharesToRemove(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("hashes"));
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRequestOperations
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45 = (id)objc_opt_new();
  objc_msgSend_encryptedAnonymousSharesToRemove(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v8;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v46, v50, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v47;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v15);
        v17 = objc_msgSend_operationType(self, v11, v12);
        objc_msgSend_operationRequestWithType_(self, v18, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_opt_new();
        objc_msgSend_setAnonymousShareRemoveRequest_(v19, v21, (uint64_t)v20);

        objc_msgSend_anonymousShareRemoveRequest(v19, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAnonymousShareTupleHash_(v24, v25, v16);
        objc_msgSend_encryptedAnonymousSharesToRemove(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v28, v29, v16);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEncryptedShareTuple_(v24, v31, (uint64_t)v30);

        objc_msgSend_encryptedAnonymousShareHashToRemoveByRequestID(self, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v19, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v34, v41, v16, v40);

        objc_msgSend_addObject_(v45, v42, (uint64_t)v19);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v46, v50, 16);
    }
    while (v13);
  }

  return v45;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  const char *v22;
  uint64_t v23;
  void *v24;

  v4 = a3;
  objc_msgSend_encryptedAnonymousShareHashToRemoveByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_anonymousShareRemovedBlock(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_anonymousShareRemovedBlock(self, v19, v20);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v21)[2](v21, v15, v24);

  }
  return 0;
}

- (id)anonymousShareRemovedBlock
{
  return self->_anonymousShareRemovedBlock;
}

- (void)setAnonymousShareRemovedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSDictionary)encryptedAnonymousSharesToRemove
{
  return self->_encryptedAnonymousSharesToRemove;
}

- (void)setEncryptedAnonymousSharesToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, a3);
}

- (NSMutableDictionary)encryptedAnonymousShareHashToRemoveByRequestID
{
  return self->_encryptedAnonymousShareHashToRemoveByRequestID;
}

- (void)setEncryptedAnonymousShareHashToRemoveByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedAnonymousShareHashToRemoveByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedAnonymousShareHashToRemoveByRequestID, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, 0);
  objc_storeStrong(&self->_anonymousShareRemovedBlock, 0);
}

@end
