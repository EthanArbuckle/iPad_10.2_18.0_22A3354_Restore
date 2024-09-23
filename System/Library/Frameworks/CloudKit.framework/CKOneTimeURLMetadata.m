@implementation CKOneTimeURLMetadata

- (CKOneTimeURLMetadata)initWithSharingKeyBytes:(id)a3 sharingKeySeed:(id)a4 participantID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKOneTimeURLMetadata *v14;
  uint64_t v15;
  NSData *sharingKeyBytes;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSData *sharingKeySeed;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *participantID;
  CKEncryptedData *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  CKEncryptedData *encryptedOneTimeFullToken;
  objc_super v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)CKOneTimeURLMetadata;
  v14 = -[CKOneTimeURLMetadata init](&v37, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    sharingKeyBytes = v14->_sharingKeyBytes;
    v14->_sharingKeyBytes = (NSData *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    sharingKeySeed = v14->_sharingKeySeed;
    v14->_sharingKeySeed = (NSData *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v25;

    v27 = [CKEncryptedData alloc];
    objc_msgSend_oneTimeFullTokenProtoMessageData(v14, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_initWithData_(v27, v32, (uint64_t)v31, v33);
    encryptedOneTimeFullToken = v14->_encryptedOneTimeFullToken;
    v14->_encryptedOneTimeFullToken = (CKEncryptedData *)v34;

  }
  return v14;
}

- (CKOneTimeURLMetadata)initWithEncryptedOneTimeFullToken:(id)a3 participantID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKOneTimeURLMetadata *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKDPOneTimeFullTokenInfo *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSData *sharingKeyBytes;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSData *sharingKeySeed;
  uint64_t v46;
  NSString *participantID;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CKEncryptedData *encryptedOneTimeFullToken;
  objc_super v54;

  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)CKOneTimeURLMetadata;
  v11 = -[CKOneTimeURLMetadata init](&v54, sel_init);
  if (v11)
  {
    objc_msgSend_data(v6, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16 = [CKDPOneTimeFullTokenInfo alloc];
      objc_msgSend_encryptedOneTimeFullToken(v11, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend_initWithData_(v16, v25, (uint64_t)v24, v26);

      objc_msgSend_sharingKeyBytes(v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_copy(v31, v32, v33, v34);
      sharingKeyBytes = v11->_sharingKeyBytes;
      v11->_sharingKeyBytes = (NSData *)v35;

      objc_msgSend_sharingKeySeed(v27, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_copy(v40, v41, v42, v43);
      sharingKeySeed = v11->_sharingKeySeed;
      v11->_sharingKeySeed = (NSData *)v44;

    }
    v46 = objc_msgSend_copy(v7, v13, v14, v15);
    participantID = v11->_participantID;
    v11->_participantID = (NSString *)v46;

    v51 = objc_msgSend_copy(v6, v48, v49, v50);
    encryptedOneTimeFullToken = v11->_encryptedOneTimeFullToken;
    v11->_encryptedOneTimeFullToken = (CKEncryptedData *)v51;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;

  v25 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_encryptedOneTimeFullToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, (uint64_t)CFSTR("encryptedOneTimeFullToken"));

  objc_msgSend_participantID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v14, (uint64_t)v13, (uint64_t)CFSTR("participantID"));

  objc_msgSend_sharingKeySeed(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, (uint64_t)CFSTR("sharingKeySeed"));

  objc_msgSend_sharingKeyBytes(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, (uint64_t)CFSTR("sharingKeyBytes"));

  objc_autoreleasePoolPop(v4);
}

- (CKOneTimeURLMetadata)initWithCoder:(id)a3
{
  id v4;
  CKOneTimeURLMetadata *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKEncryptedData *encryptedOneTimeFullToken;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *participantID;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSData *sharingKeySeed;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSData *sharingKeyBytes;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKOneTimeURLMetadata;
  v5 = -[CKOneTimeURLMetadata init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("encryptedOneTimeFullToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    encryptedOneTimeFullToken = v5->_encryptedOneTimeFullToken;
    v5->_encryptedOneTimeFullToken = (CKEncryptedData *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("participantID"));
    v13 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("sharingKeySeed"));
    v17 = objc_claimAutoreleasedReturnValue();
    sharingKeySeed = v5->_sharingKeySeed;
    v5->_sharingKeySeed = (NSData *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("sharingKeyBytes"));
    v21 = objc_claimAutoreleasedReturnValue();
    sharingKeyBytes = v5->_sharingKeyBytes;
    v5->_sharingKeyBytes = (NSData *)v21;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = (void *)objc_msgSend_allocWithZone_(CKOneTimeURLMetadata, a2, (uint64_t)a3, v3);
  v10 = (_QWORD *)objc_msgSend_init(v6, v7, v8, v9);
  v13 = objc_msgSend_copyWithZone_(self->_encryptedOneTimeFullToken, v11, (uint64_t)a3, v12);
  v14 = (void *)v10[1];
  v10[1] = v13;

  v17 = objc_msgSend_copyWithZone_(self->_participantID, v15, (uint64_t)a3, v16);
  v18 = (void *)v10[4];
  v10[4] = v17;

  v21 = objc_msgSend_copyWithZone_(self->_sharingKeySeed, v19, (uint64_t)a3, v20);
  v22 = (void *)v10[3];
  v10[3] = v21;

  v25 = objc_msgSend_copyWithZone_(self->_sharingKeyBytes, v23, (uint64_t)a3, v24);
  v26 = (void *)v10[2];
  v10[2] = v25;

  return v10;
}

- (id)oneTimeFullTokenProtoMessageData
{
  CKDPOneTimeFullTokenInfo *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v3 = objc_alloc_init(CKDPOneTimeFullTokenInfo);
  objc_msgSend_sharingKeyBytes(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSharingKeyBytes_(v3, v8, (uint64_t)v7, v9);

  objc_msgSend_setSharingKeyType_(v3, v10, 0, v11);
  objc_msgSend_sharingKeySeed(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSharingKeySeed_(v3, v16, (uint64_t)v15, v17);

  objc_msgSend_data(v3, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)oneTimeFullToken
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CKDPOneTimeFullTokenInfo *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSData *v41;
  NSData *sharingKeyBytes;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSData *v50;
  NSData *sharingKeySeed;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  __int16 v77;
  _QWORD v78[3];

  v78[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_encryptedOneTimeFullToken(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_encryptedOneTimeFullToken(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKBase64URLSafeString(v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [CKDPOneTimeFullTokenInfo alloc];
    objc_msgSend_encryptedOneTimeFullToken(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend_initWithData_(v22, v31, (uint64_t)v30, v32);

    objc_msgSend_sharingKeyBytes(v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (NSData *)objc_msgSend_copy(v37, v38, v39, v40);
    sharingKeyBytes = self->_sharingKeyBytes;
    self->_sharingKeyBytes = v41;

    objc_msgSend_sharingKeySeed(v33, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (NSData *)objc_msgSend_copy(v46, v47, v48, v49);
    sharingKeySeed = self->_sharingKeySeed;
    self->_sharingKeySeed = v50;

LABEL_3:
    v77 = 0;
    v76 = 32;
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v52, (uint64_t)&v76, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKBase64URLSafeString(v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v78[0] = v57;
    v78[1] = v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v58, (uint64_t)v78, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v59, v60, (uint64_t)&stru_1E1F66ED0, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    return v62;
  }
  objc_msgSend_sharingKeyBytes(self, v10, v11, v12);
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v68 = (void *)v64;
    objc_msgSend_sharingKeySeed(self, v65, v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend_oneTimeFullTokenProtoMessageData(self, v70, v71, v72);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKBase64URLSafeString(v33, v73, v74, v75);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  return 0;
}

- (id)oneTimeShortSharingTokenData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_oneTimeFullToken(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5;
  if (v5)
  {
    v18[0] = CFSTR("one-time-link-encryption-key");
    v18[1] = v5;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v8, v9, (uint64_t)&stru_1E1F66ED0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharingKeySeed(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CKHKDFSHA256(v15, v11, 16);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)oneTimeShortSharingToken
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_oneTimeShortSharingTokenData(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKBase64URLSafeString(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)oneTimeShortTokenWithRoutingKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_oneTimeShortSharingToken(self, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v18 = "Couldn't get a one-time short sharing token";
    v19 = v17;
    v20 = 2;
    goto LABEL_14;
  }
  if (objc_msgSend_length(v4, v8, v9, v10) != 3)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v21 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 138543362;
    v25 = v4;
    v18 = "Routing key is invalid: \"%{public}@\";
    v19 = v21;
    v20 = 12;
LABEL_14:
    _os_log_error_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v23[0] = v4;
  v23[1] = v11;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v13, v14, (uint64_t)&stru_1E1F66ED0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v16;
}

- (NSData)oneTimeShortSharingTokenHashData
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  CC_LONG v12;
  const char *v13;
  void *v14;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_oneTimeShortSharingToken(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = (const void *)objc_msgSend_UTF8String(v4, v5, v6, v7, 0, 0, 0, 0);
    v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v8, v10, 4, v11);
    CC_SHA256(v9, v12, (unsigned __int8 *)&v16);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)&v16, 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return (NSData *)v14;
}

- (NSData)encryptedOneTimeFullTokenData
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  objc_msgSend_oneTimeFullToken(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oneTimeShortSharingTokenData(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptFullToken_shortSharingTokenData_(CKRecord, v10, (uint64_t)v5, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v11;
}

- (CKEncryptedData)encryptedOneTimeFullToken
{
  return self->_encryptedOneTimeFullToken;
}

- (void)setEncryptedOneTimeFullToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)sharingKeyBytes
{
  return self->_sharingKeyBytes;
}

- (NSData)sharingKeySeed
{
  return self->_sharingKeySeed;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_sharingKeySeed, 0);
  objc_storeStrong((id *)&self->_sharingKeyBytes, 0);
  objc_storeStrong((id *)&self->_encryptedOneTimeFullToken, 0);
}

@end
