@implementation CKDInitiateParticipantVettingURLRequest

- (CKDInitiateParticipantVettingURLRequest)initWithOperation:(id)a3 shareRecordID:(id)a4 encryptedKey:(id)a5 participantID:(id)a6 baseToken:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKDInitiateParticipantVettingURLRequest *v17;
  CKDInitiateParticipantVettingURLRequest *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKDInitiateParticipantVettingURLRequest;
  v17 = -[CKDURLRequest initWithOperation:](&v20, sel_initWithOperation_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_shareRecordID, a4);
    objc_storeStrong((id *)&v18->_encryptedKey, a5);
    objc_storeStrong((id *)&v18->_participantID, a6);
    objc_storeStrong((id *)&v18->_baseToken, a7);
  }

  return v18;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDInitiateParticipantVettingURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v13, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_shareRecordID(self, v5, v6, v13.receiver, v13.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("shareRecordID"));

  objc_msgSend_participantID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, CFSTR("participantID"));

}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_shareRecordID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);

  v11.receiver = self;
  v11.super_class = (Class)CKDInitiateParticipantVettingURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v11, sel_fillOutRequestProperties_, v4);

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
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  void *v43;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setShareVettingInitiateRequest_(v6, v8, (uint64_t)v7);

  objc_msgSend_translator(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareRecordID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pShareIdentifierFromRecordID_(v11, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareVettingInitiateRequest(v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareId_(v19, v20, (uint64_t)v16);

  objc_msgSend_encryptedKey(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareVettingInitiateRequest(v6, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEncryptedKey_(v26, v27, (uint64_t)v23);

  objc_msgSend_participantID(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareVettingInitiateRequest(v6, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParticipantId_(v33, v34, (uint64_t)v30);

  objc_msgSend_baseToken(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareVettingInitiateRequest(v6, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseToken_(v40, v41, (uint64_t)v37);

  v45[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v42, (uint64_t)v45, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

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
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char hasVettingError;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int hasError;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  v4 = a3;
  objc_msgSend_vettingInitiationRequestCompletionBlock(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend_hasShareVettingInitiateResponse(v4, v8, v9) & 1) != 0)
    {
      objc_msgSend_vettingInitiationRequestCompletionBlock(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend_shareVettingInitiateResponse(v4, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        hasVettingError = objc_msgSend_hasVettingError(v15, v16, v17);

        objc_msgSend_vettingInitiationRequestCompletionBlock(self, v19, v20);
        v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if ((hasVettingError & 1) != 0)
        {
          objc_msgSend_shareVettingInitiateResponse(v4, v21, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend_vettingError(v24, v25, v26) - 2;
          if (v29 >= 4)
            v30 = 1;
          else
            v30 = v29 + 2;
          objc_msgSend_result(v4, v27, v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, void *))v23)[2](v23, v30, v31);

        }
        else
        {
          objc_msgSend_result(v4, v21, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, 0, v24);
        }
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend_result(v4, v10, v11);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      hasError = objc_msgSend_hasError(v32, v33, v34);

      if (hasError)
      {
        objc_msgSend_vettingInitiationRequestCompletionBlock(self, v36, v37);
        v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v4, v38, v39);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *))v23)[2](v23, -1, v24);
LABEL_12:

      }
    }
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
  void (**v9)(_QWORD, _QWORD, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend_vettingInitiationRequestCompletionBlock(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_vettingInitiationRequestCompletionBlock(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v13, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, -1, v12);

  }
}

- (id)vettingInitiationRequestCompletionBlock
{
  return self->_vettingInitiationRequestCompletionBlock;
}

- (void)setVettingInitiationRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong(&self->_vettingInitiationRequestCompletionBlock, 0);
}

@end
