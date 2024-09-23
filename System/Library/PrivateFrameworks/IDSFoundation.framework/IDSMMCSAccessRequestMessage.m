@implementation IDSMMCSAccessRequestMessage

- (IDSMMCSAccessRequestMessage)init
{
  IDSMMCSAccessRequestMessage *v2;
  const char *v3;
  double v4;
  IDSMMCSAccessRequestMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSMMCSAccessRequestMessage;
  v2 = -[IDSMessage init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setWantsResponse_(v2, v3, 1, v4);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)IDSMMCSAccessRequestMessage;
  v4 = -[IDSMessage copyWithZone:](&v36, sel_copyWithZone_, a3);
  v8 = (void *)objc_msgSend_copy(self->_downloadAuths, v5, v6, v7);
  objc_msgSend_setDownloadAuths_(v4, v9, (uint64_t)v8, v10);

  v14 = (void *)objc_msgSend_copy(self->_downloadingDeviceToken, v11, v12, v13);
  objc_msgSend_setDownloadingDeviceToken_(v4, v15, (uint64_t)v14, v16);

  v20 = (void *)objc_msgSend_copy(self->_sessionToken, v17, v18, v19);
  objc_msgSend_setSessionToken_(v4, v21, (uint64_t)v20, v22);

  v26 = (void *)objc_msgSend_copy(self->_downloadingDeviceID, v23, v24, v25);
  objc_msgSend_setDownloadingDeviceID_(v4, v27, (uint64_t)v26, v28);

  v32 = (void *)objc_msgSend_copy(self->_senderID, v29, v30, v31);
  objc_msgSend_setSenderID_(v4, v33, (uint64_t)v32, v34);

  return v4;
}

- (int64_t)command
{
  return 154;
}

- (int64_t)responseCommand
{
  return 154;
}

- (id)requiredKeys
{
  id v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_addObject_(v2, v3, (uint64_t)CFSTR("dal"), v4);
  objc_msgSend_addObject_(v2, v5, (uint64_t)CFSTR("t"), v6);
  objc_msgSend_addObject_(v2, v7, (uint64_t)CFSTR("sT"), v8);
  objc_msgSend_addObject_(v2, v9, (uint64_t)CFSTR("tP"), v10);
  objc_msgSend_addObject_(v2, v11, (uint64_t)CFSTR("sP"), v12);
  return v2;
}

- (id)messageBody
{
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  __CFDictionary *v7;
  id v8;
  NSArray *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  double v21;
  id v22;
  NSData *v23;
  NSData *v24;
  NSString *v25;
  NSString *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)IDSMMCSAccessRequestMessage;
  -[IDSMessage messageBody](&v32, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_downloadAuths;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, v11, v33, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v9);
        objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v13, v14, v15, (_QWORD)v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v8, v20, (uint64_t)v19, v21);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v13, (uint64_t)&v28, v15, v33, 16);
    }
    while (v16);
  }

  v22 = v8;
  if (v22)
  {
    CFDictionarySetValue(v7, CFSTR("dal"), v22);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF1108();
  }

  v23 = self->_downloadingDeviceToken;
  if (v23)
  {
    CFDictionarySetValue(v7, CFSTR("t"), v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF1088();
  }

  v24 = self->_sessionToken;
  if (v24)
  {
    CFDictionarySetValue(v7, CFSTR("sT"), v24);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF1008();
  }

  v25 = self->_downloadingDeviceID;
  if (v25)
  {
    CFDictionarySetValue(v7, CFSTR("tP"), v25);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF0F88();
  }

  v26 = self->_senderID;
  if (v26)
  {
    CFDictionarySetValue(v7, CFSTR("sP"), v26);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF0F08();
  }

  return v7;
}

- (NSArray)downloadAuths
{
  return self->_downloadAuths;
}

- (void)setDownloadAuths:(id)a3
{
  objc_storeStrong((id *)&self->_downloadAuths, a3);
}

- (NSData)downloadingDeviceToken
{
  return self->_downloadingDeviceToken;
}

- (void)setDownloadingDeviceToken:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingDeviceToken, a3);
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (NSString)downloadingDeviceID
{
  return self->_downloadingDeviceID;
}

- (void)setDownloadingDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingDeviceID, a3);
}

- (NSString)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
  objc_storeStrong((id *)&self->_senderID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_downloadingDeviceID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_downloadingDeviceToken, 0);
  objc_storeStrong((id *)&self->_downloadAuths, 0);
}

@end
