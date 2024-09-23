@implementation CKDeviceToDeviceShareInvitationToken

- (CKDeviceToDeviceShareInvitationToken)init
{
  CKException *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, (uint64_t)CFSTR("You can't call init on %@"), v4);

  objc_exception_throw(v6);
}

- (CKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_msgSend_initWithSharingInvitationData_shareURL_participantID_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (CKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4 participantID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKDeviceToDeviceShareInvitationToken *v14;
  uint64_t v15;
  NSData *sharingInvitationData;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSURL *shareURL;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *participantID;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKDeviceToDeviceShareInvitationToken;
  v14 = -[CKDeviceToDeviceShareInvitationToken init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    sharingInvitationData = v14->_sharingInvitationData;
    v14->_sharingInvitationData = (NSData *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    shareURL = v14->_shareURL;
    v14->_shareURL = (NSURL *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v25;

  }
  return v14;
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
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_sharingInvitationData(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, (uint64_t)CFSTR("ShareInvitationData"));

  objc_msgSend_shareURL(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, (uint64_t)CFSTR("ShareURL"));

  objc_msgSend_participantID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v19, (uint64_t)v18, (uint64_t)CFSTR("ParticipantID"));

  objc_autoreleasePoolPop(v4);
}

- (CKDeviceToDeviceShareInvitationToken)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  CKDeviceToDeviceShareInvitationToken *v19;
  NSObject *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint8_t v26[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend__strictSecureDecodingEnabled(v4, v5, v6, v7) & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v21 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_fault_impl(&dword_18A5C5000, v21, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Must use strict secure decoding to decode a CKDeviceToDeviceShareInvitationToken. Any attempt to decode a CKDeviceToDeviceShareInvitationToken without strict secure decoding enabled will return nil. See -[NSKeyedArchiver _enableStrictSecureDecodingMode] or +[NSKeyedArchiver _strictlyUnarchivedObjectOfClasses:].", v26, 2u);
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Must use strict secure decoding to decode a CKDeviceToDeviceShareInvitationToken."));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v24, (uint64_t)v23, v25);

    v19 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x18D76DE4C]();
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("ShareInvitationData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("ShareURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("ParticipantID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v8);
    self = (CKDeviceToDeviceShareInvitationToken *)(id)objc_msgSend_initWithSharingInvitationData_shareURL_participantID_(self, v18, (uint64_t)v11, (uint64_t)v14, v17);

    v19 = self;
  }

  return v19;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  objc_msgSend_shareURL(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR(", shareURL=%@"), v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E1F66ED0;
  }
  objc_msgSend_participantID(self, v5, v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_participantID(self, v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR(", participantID=%@"), v17, v15);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = &stru_1E1F66ED0;
  }

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_sharingInvitationData(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v19, v24, (uint64_t)CFSTR("sharingInvitationData=%@%@%@"), v25, v23, v9, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDeviceToDeviceShareInvitationToken *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  CKDeviceToDeviceShareInvitationToken *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  CKDeviceToDeviceShareInvitationToken *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;

  v4 = (CKDeviceToDeviceShareInvitationToken *)a3;
  if (v4 == self)
  {
    v35 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    {
      v8 = v4;
      objc_msgSend_shareURL(self, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareURL(v8, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CKObjectsAreBothNilOrEqual(v12, v16);

      if (v17
        && (objc_msgSend_sharingInvitationData(self, v18, v19, v20),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_sharingInvitationData(v8, v22, v23, v24),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = CKObjectsAreBothNilOrEqual(v21, v25),
            v25,
            v21,
            v26))
      {
        objc_msgSend_participantID(self, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_participantID(v8, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = CKObjectsAreBothNilOrEqual(v30, v34);

      }
      else
      {
        v35 = 0;
      }

    }
    else
    {
      v35 = 0;
    }
  }

  return v35;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_sharingInvitationData(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_shareURL(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_participantID(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
}

@end
