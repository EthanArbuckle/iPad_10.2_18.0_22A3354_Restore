@implementation IDSGroupEncryptionKeyMaterial

- (IDSGroupEncryptionKeyMaterial)initWithIndex:(id)a3 groupID:(id)a4 participantID:(unint64_t)a5
{
  id v8;
  id v9;
  IDSGroupEncryptionKeyMaterial *v10;
  uint64_t v11;
  uint64_t v12;
  NSData *keyMaterial;
  NSData *keySalt;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  NSUUID *keyIndex;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  NSDate *createdAt;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  NSMutableSet *devicesToBeSent;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  NSString *groupID;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  double v40;
  IDSGroupEncryptionKeyMaterial *v41;
  NSObject *v42;
  NSObject *v43;
  CFTypeRef cf;
  objc_super v46;
  uint8_t buf[4];
  CFTypeRef v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)IDSGroupEncryptionKeyMaterial;
  v10 = -[IDSGroupEncryptionKeyMaterial init](&v46, sel_init);
  if (!v10)
    goto LABEL_13;
  cf = 0;
  if (qword_1EE40B1F0 != -1)
    dispatch_once(&qword_1EE40B1F0, &unk_1E3C1B750);
  if (off_1EE40B1E8 && (v11 = off_1EE40B1E8(0, &cf)) != 0 && !cf)
  {
    if (qword_1EE40B200 != -1)
      dispatch_once(&qword_1EE40B200, &unk_1E3C1BDD0);
    if (off_1EE40B1F8)
    {
      v12 = off_1EE40B1F8(0, &cf);
      if (v12)
      {
        if (!cf)
        {
          keyMaterial = v10->_keyMaterial;
          v10->_keyMaterial = (NSData *)v11;

          keySalt = v10->_keySalt;
          v10->_keySalt = (NSData *)v12;

          v18 = objc_msgSend_copy(v8, v15, v16, v17);
          keyIndex = v10->_keyIndex;
          v10->_keyIndex = (NSUUID *)v18;

          objc_msgSend_date(MEMORY[0x1E0C99D68], v20, v21, v22);
          v23 = objc_claimAutoreleasedReturnValue();
          createdAt = v10->_createdAt;
          v10->_createdAt = (NSDate *)v23;

          objc_msgSend_set(MEMORY[0x1E0C99E20], v25, v26, v27);
          v28 = objc_claimAutoreleasedReturnValue();
          devicesToBeSent = v10->_devicesToBeSent;
          v10->_devicesToBeSent = (NSMutableSet *)v28;

          v33 = objc_msgSend_copy(v9, v30, v31, v32);
          groupID = v10->_groupID;
          v10->_groupID = (NSString *)v33;

          v10->_isGeneratedLocally = 1;
          v38 = objc_msgSend_locallyGeneratedKeysCounter(IDSGroupEncryptionKeyMaterial, v35, v36, v37)+ 1;
          objc_msgSend_setLocallyGeneratedKeysCounter_(IDSGroupEncryptionKeyMaterial, v39, v38, v40);
          v10->_generationCounter = v38;
          v10->_participantID = a5;
          v10->_shortKeyIndexLength = 0;
LABEL_13:
          v41 = v10;
          goto LABEL_29;
        }
      }
    }
    OSLogHandleForTransportCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = cf;
      _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "_SecMWCreateSessionSalt for Key Salt (error %@)", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("IDSRTEncryptionKeyMaterial"), CFSTR("IDS"), CFSTR("_SecMWCreateSessionSalt for Key Salt (error %@)"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSRTEncryptionKeyMaterial"), CFSTR("_SecMWCreateSessionSalt for Key Salt (error %@)"));
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = cf;
      _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "SecMWCreateSessionSeed for Key Material (error %@)", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("IDSRTEncryptionKeyMaterial"), CFSTR("IDS"), CFSTR("SecMWCreateSessionSeed for Key Material (error %@)"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSRTEncryptionKeyMaterial"), CFSTR("SecMWCreateSessionSeed for Key Material (error %@)"));
      }
    }
  }
  if (cf)
    CFRelease(cf);
  v41 = 0;
LABEL_29:

  return v41;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  IDSGroupEncryptionKeyMaterial *isGeneratedLocally_createdAt_generationCounter_participantID;
  int v23;

  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend_date(v10, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  isGeneratedLocally_createdAt_generationCounter_participantID = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(self, v19, (uint64_t)v14, v20, v13, v12, v11, 0, v18, v23, 0);

  return isGeneratedLocally_createdAt_generationCounter_participantID;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 participantID:(unint64_t)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  IDSGroupEncryptionKeyMaterial *isGeneratedLocally_createdAt_generationCounter_participantID;
  int v25;

  v12 = (void *)MEMORY[0x1E0C99D68];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend_date(v12, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  isGeneratedLocally_createdAt_generationCounter_participantID = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(self, v21, (uint64_t)v16, v22, v15, v14, v13, 0, v20, v25, a7);

  return isGeneratedLocally_createdAt_generationCounter_participantID;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 generationCounter:(unsigned int)a7 participantID:(unint64_t)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  IDSGroupEncryptionKeyMaterial *isGeneratedLocally_createdAt_generationCounter_participantID;
  unsigned int v27;

  v14 = (void *)MEMORY[0x1E0C99D68];
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend_date(v14, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = a7;
  isGeneratedLocally_createdAt_generationCounter_participantID = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(self, v23, (uint64_t)v18, v24, v17, v16, v15, 0, v22, v27, a8);

  return isGeneratedLocally_createdAt_generationCounter_participantID;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 isGeneratedLocally:(BOOL)a7 createdAt:(id)a8 generationCounter:(unsigned int)a9 participantID:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  IDSGroupEncryptionKeyMaterial *v23;
  double v24;
  uint64_t v25;
  NSData *keyMaterial;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  NSData *keySalt;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  NSUUID *keyIndex;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  NSString *groupID;
  objc_super v43;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v43.receiver = self;
  v43.super_class = (Class)IDSGroupEncryptionKeyMaterial;
  v23 = -[IDSGroupEncryptionKeyMaterial init](&v43, sel_init);
  if (v23)
  {
    v25 = objc_msgSend_copy(v16, v21, v22, v24);
    keyMaterial = v23->_keyMaterial;
    v23->_keyMaterial = (NSData *)v25;

    v30 = objc_msgSend_copy(v17, v27, v28, v29);
    keySalt = v23->_keySalt;
    v23->_keySalt = (NSData *)v30;

    v35 = objc_msgSend_copy(v18, v32, v33, v34);
    keyIndex = v23->_keyIndex;
    v23->_keyIndex = (NSUUID *)v35;

    objc_storeStrong((id *)&v23->_createdAt, a8);
    v23->_isGeneratedLocally = a7;
    v23->_generationCounter = a9;
    v40 = objc_msgSend_copy(v19, v37, v38, v39);
    groupID = v23->_groupID;
    v23->_groupID = (NSString *)v40;

    v23->_participantID = a10;
    v23->_shortKeyIndexLength = 0;
  }

  return v23;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 isGeneratedLocally:(BOOL)a7 createdAt:(id)a8 generationCounter:(unsigned int)a9 participantID:(unint64_t)a10 shortKeyIndexLength:(unsigned __int8)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  IDSGroupEncryptionKeyMaterial *v24;
  double v25;
  uint64_t v26;
  NSData *keyMaterial;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  NSData *keySalt;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  NSUUID *keyIndex;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  NSString *groupID;
  objc_super v44;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v44.receiver = self;
  v44.super_class = (Class)IDSGroupEncryptionKeyMaterial;
  v24 = -[IDSGroupEncryptionKeyMaterial init](&v44, sel_init);
  if (v24)
  {
    v26 = objc_msgSend_copy(v17, v22, v23, v25);
    keyMaterial = v24->_keyMaterial;
    v24->_keyMaterial = (NSData *)v26;

    v31 = objc_msgSend_copy(v18, v28, v29, v30);
    keySalt = v24->_keySalt;
    v24->_keySalt = (NSData *)v31;

    v36 = objc_msgSend_copy(v19, v33, v34, v35);
    keyIndex = v24->_keyIndex;
    v24->_keyIndex = (NSUUID *)v36;

    objc_storeStrong((id *)&v24->_createdAt, a8);
    v24->_isGeneratedLocally = a7;
    v24->_generationCounter = a9;
    v41 = objc_msgSend_copy(v20, v38, v39, v40);
    groupID = v24->_groupID;
    v24->_groupID = (NSString *)v41;

    v24->_participantID = a10;
    v24->_shortKeyIndexLength = a11;
  }

  return v24;
}

- (IDSGroupEncryptionKeyMaterial)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  int v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  double v44;
  IDSGroupEncryptionKeyMaterial *isGeneratedLocally_createdAt_generationCounter_participantID_shortKeyIndexLength;
  int v47;
  char v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("keyMaterial"), v6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v7, (uint64_t)CFSTR("keySalt"), v8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("keyIndex"), v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)CFSTR("groupID"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v14, (uint64_t)CFSTR("isGeneratedLocally"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_BOOLValue(v16, v17, v18, v19);
  objc_msgSend_objectForKeyedSubscript_(v4, v20, (uint64_t)CFSTR("createdAt"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v23, (uint64_t)CFSTR("generationCounter"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_unsignedIntValue(v25, v26, v27, v28);
  objc_msgSend_objectForKeyedSubscript_(v4, v30, (uint64_t)CFSTR("participantID"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_unsignedLongLongValue(v32, v33, v34, v35);
  objc_msgSend_objectForKeyedSubscript_(v4, v37, (uint64_t)CFSTR("smkil"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_msgSend_unsignedIntValue(v39, v40, v41, v42);
  v47 = v29;
  isGeneratedLocally_createdAt_generationCounter_participantID_shortKeyIndexLength = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_shortKeyIndexLength_(self, v43, (uint64_t)v52, v44, v51, v50, v13, v49, v22, v47, v36, v48);

  return isGeneratedLocally_createdAt_generationCounter_participantID_shortKeyIndexLength;
}

- (void)changeCreatedAt:(id)a3
{
  id v4;
  NSObject *v5;
  NSDate *createdAt;
  const char *v7;
  uint64_t v8;
  double v9;
  NSDate *v10;
  NSDate *v11;
  NSDate *v12;
  id v13;
  uint8_t buf[4];
  NSDate *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    createdAt = self->_createdAt;
    *(_DWORD *)buf = 138412546;
    v15 = createdAt;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "change CreatedAt from %@ to %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v12 = self->_createdAt;
      v13 = v4;
      _IDSLogTransport(CFSTR("IDSRTEncryptionKeyMaterial"), CFSTR("IDS"), CFSTR("change CreatedAt from %@ to %@"));
      if (_IDSShouldLog())
      {
        v12 = self->_createdAt;
        v13 = v4;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSRTEncryptionKeyMaterial"), CFSTR("change CreatedAt from %@ to %@"));
      }
    }
  }
  v10 = (NSDate *)objc_msgSend_copy(v4, v7, v8, v9, v12, v13);
  v11 = self->_createdAt;
  self->_createdAt = v10;

}

- (void)sentToDevice:(id)a3
{
  double v3;

  objc_msgSend_addObject_(self->_devicesToBeSent, a2, (uint64_t)a3, v3);
}

- (void)removeDeviceFromSentToDevice:(id)a3
{
  double v3;

  objc_msgSend_removeObject_(self->_devicesToBeSent, a2, (uint64_t)a3, v3);
}

+ (unsigned)locallyGeneratedKeysCounter
{
  return dword_1EE40B208;
}

+ (void)setLocallyGeneratedKeysCounter:(unsigned int)a3
{
  dword_1EE40B208 = a3;
}

+ (NSUUID)keyOriginIdentifier
{
  if (qword_1EE40B210 != -1)
    dispatch_once(&qword_1EE40B210, &unk_1E3C20858);
  return (NSUUID *)(id)qword_1EE40B218;
}

- (BOOL)isEqualToRealTimeEncryptionKeyMaterial:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  char isEqual;

  if (self == a3)
    return 1;
  objc_msgSend_keyIndex(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyIndex(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v5, v10, (uint64_t)v9, v11);

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToRealTimeEncryptionKeyMaterial;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToRealTimeEncryptionKeyMaterial = objc_msgSend_isEqualToRealTimeEncryptionKeyMaterial_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToRealTimeEncryptionKeyMaterial = 0;

  return isEqualToRealTimeEncryptionKeyMaterial;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  objc_msgSend_keyIndex(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const __CFString *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  double v38;
  unsigned int v39;
  const char *v40;
  double v41;
  void *v42;
  void *v44;

  v44 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend_keyIndex(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyMaterial(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keySalt(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_ratchetIndex(self, v16, v17, v18);
  objc_msgSend_createdAt(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isGeneratedLocally(self, v24, v25, v26))
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  v31 = objc_msgSend_generationCounter(self, v27, v28, v29);
  v35 = objc_msgSend_participantID(self, v32, v33, v34);
  v39 = objc_msgSend_shortKeyIndexLength(self, v36, v37, v38);
  objc_msgSend_stringWithFormat_(v44, v40, (uint64_t)CFSTR("<%@: %p KeyIndex: %@, KeyMaterial: %@, KeySalt: %@, ratchetIndex: %d, createdAt: %@, isGeneratedLocally: %@, counter:%u, participantID: %llu, smkil: %u>"), v41, v3, self, v7, v11, v15, v19, v23, v30, v31, v35, v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)debugDescription
{
  const char *v3;
  uint64_t v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  unsigned int v42;
  const char *v43;
  double v44;
  void *v45;
  uint64_t v47;
  void *v48;

  v48 = (void *)MEMORY[0x1E0CB3940];
  v47 = objc_opt_class();
  objc_msgSend_keyIndex(self, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createdAt(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isGeneratedLocally(self, v15, v16, v17))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend_keySalt(self, v18, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyMaterial(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_ratchetIndex(self, v27, v28, v29);
  v34 = objc_msgSend_generationCounter(self, v31, v32, v33);
  v38 = objc_msgSend_participantID(self, v35, v36, v37);
  v42 = objc_msgSend_shortKeyIndexLength(self, v39, v40, v41);
  objc_msgSend_stringWithFormat_(v48, v43, (uint64_t)CFSTR("<%@: %p KeyIndex: %@, groupID: %@, createdAt: %@, isGeneratedLocally: %@, KeySalt: %@, KeyMaterial: %@, ratchetIndex: %d, counter: %u, participantID: %llu, smkil: %u>"), v44, v47, self, v6, v10, v14, v21, v22, v26, v30, v34, v38, v42);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSGroupEncryptionKeyMaterial *v4;
  const char *v5;
  double v6;
  unsigned int generationCounter;

  v4 = [IDSGroupEncryptionKeyMaterial alloc];
  generationCounter = self->_generationCounter;
  return (id)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(v4, v5, (uint64_t)self->_keyMaterial, v6, self->_keySalt, self->_keyIndex, self->_groupID, self->_isGeneratedLocally, self->_createdAt, generationCounter, self->_participantID);
}

- (int64_t)compare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unsigned int v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  int64_t v15;
  unsigned int v16;
  const char *v17;
  uint64_t v18;
  double v19;

  v4 = a3;
  v8 = objc_msgSend_generationCounter(self, v5, v6, v7);
  if (v8 >= objc_msgSend_generationCounter(v4, v9, v10, v11))
  {
    v16 = objc_msgSend_generationCounter(self, v12, v13, v14);
    v15 = v16 > objc_msgSend_generationCounter(v4, v17, v18, v19);
  }
  else
  {
    v15 = -1;
  }

  return v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  NSDate *createdAt;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  _QWORD v18[9];
  NSUUID *keyIndex;
  __int128 v20;
  NSString *groupID;
  void *v22;
  void *v23;
  NSDate *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  keyIndex = self->_keyIndex;
  v18[0] = CFSTR("keyIndex");
  v18[1] = CFSTR("keySalt");
  v20 = *(_OWORD *)&self->_keySalt;
  v18[2] = CFSTR("keyMaterial");
  v18[3] = CFSTR("groupID");
  groupID = self->_groupID;
  v18[4] = CFSTR("isGeneratedLocally");
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, self->_isGeneratedLocally, *(double *)&v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v3;
  v18[5] = CFSTR("generationCounter");
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v4, self->_generationCounter, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  createdAt = self->_createdAt;
  v23 = v6;
  v24 = createdAt;
  v18[6] = CFSTR("createdAt");
  v18[7] = CFSTR("participantID");
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v8, self->_participantID, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  v18[8] = CFSTR("smkil");
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v11, self->_shortKeyIndexLength, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)&keyIndex, v15, v18, 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isSentToClient
{
  return self->_isSentToClient;
}

- (void)setIsSentToClient:(BOOL)a3
{
  self->_isSentToClient = a3;
}

- (BOOL)isGeneratedLocally
{
  return self->_isGeneratedLocally;
}

- (void)setIsGeneratedLocally:(BOOL)a3
{
  self->_isGeneratedLocally = a3;
}

- (NSUUID)keyIndex
{
  return self->_keyIndex;
}

- (NSData)keySalt
{
  return self->_keySalt;
}

- (NSData)keyMaterial
{
  return self->_keyMaterial;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (void)setGenerationCounter:(unsigned int)a3
{
  self->_generationCounter = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(unint64_t)a3
{
  self->_participantID = a3;
}

- (int)ratchetIndex
{
  return self->_ratchetIndex;
}

- (void)setRatchetIndex:(int)a3
{
  self->_ratchetIndex = a3;
}

- (unsigned)shortKeyIndexLength
{
  return self->_shortKeyIndexLength;
}

- (void)setShortKeyIndexLength:(unsigned __int8)a3
{
  self->_shortKeyIndexLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_devicesToBeSent, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_keyMaterial, 0);
  objc_storeStrong((id *)&self->_keySalt, 0);
  objc_storeStrong((id *)&self->_keyIndex, 0);
}

@end
