@implementation CKDShareAccessRequestURLRequest

- (CKDShareAccessRequestURLRequest)initWithOperation:(id)a3 shareMetadatasToRequestAccess:(id)a4
{
  id v7;
  CKDShareAccessRequestURLRequest *v8;
  CKDShareAccessRequestURLRequest *v9;
  uint64_t v10;
  NSMutableDictionary *shareMetadataByRequestID;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDShareAccessRequestURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v13, sel_initWithOperation_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_shareMetadatasToRequestAccess, a4);
    v10 = objc_opt_new();
    shareMetadataByRequestID = v9->_shareMetadataByRequestID;
    v9->_shareMetadataByRequestID = (NSMutableDictionary *)v10;

  }
  return v9;
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
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
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
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  id obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v43 = (id)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend_shareMetadatasToRequestAccess(self, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v44, v48, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v45;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
        v13 = objc_msgSend_operationType(self, v7, v8);
        objc_msgSend_operationRequestWithType_(self, v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_opt_new();
        objc_msgSend_setShareAccessRequest_(v15, v17, (uint64_t)v16);
        objc_msgSend_routingKey(v12, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRoutingKey_(v16, v21, (uint64_t)v20);

        objc_msgSend_shortTokenHash(v12, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setShortTokenHash_(v16, v25, (uint64_t)v24);

        objc_msgSend_userInformationRequestAccess(v12, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUserInformationRequestAccess_(v16, v29, (uint64_t)v28);

        objc_msgSend_shareMetadataByRequestID(self, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v15, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v32, v39, (uint64_t)v12, v38);

        objc_msgSend_addObject_(v43, v40, (uint64_t)v15);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v44, v48, 16);
    }
    while (v9);
  }

  return v43;
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
  const char *v25;
  uint64_t v26;
  void *v27;

  v4 = a3;
  objc_msgSend_shareMetadataByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_shareAccessRequestedBlock(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_shareAccessRequestedBlock(self, v19, v20);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareURL(v15, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v21)[2](v21, v24, v27);

  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a3;
  objc_msgSend_shareMetadataByRequestID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v27, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_shareAccessRequestedBlock(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_shareAccessRequestedBlock(self, v18, v19);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareURL(v14, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v27, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v20)[2](v20, v23, v26);

  }
}

- (id)shareAccessRequestedBlock
{
  return self->_shareAccessRequestedBlock;
}

- (void)setShareAccessRequestedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSArray)shareMetadatasToRequestAccess
{
  return self->_shareMetadatasToRequestAccess;
}

- (void)setShareMetadatasToRequestAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSMutableDictionary)shareMetadataByRequestID
{
  return self->_shareMetadataByRequestID;
}

- (void)setShareMetadataByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadataByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadataByRequestID, 0);
  objc_storeStrong((id *)&self->_shareMetadatasToRequestAccess, 0);
  objc_storeStrong(&self->_shareAccessRequestedBlock, 0);
}

@end
