@implementation CLSAdminRequest

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSAdminRequest;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSAdminRequest)initWithType:(int64_t)a3 requestorID:(id)a4 organizationID:(id)a5
{
  id v9;
  id v10;
  CLSAdminRequest *v11;
  CLSAdminRequest *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CLSAdminRequest;
  v11 = -[CLSObject _init](&v14, sel__init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_requestorID, a4);
    objc_storeStrong((id *)&v12->_organizationID, a5);
    v12->_status = 1;
    v12->_approval = 1;
  }

  return v12;
}

- (CLSAdminRequest)initWithType:(int64_t)a3 requestorEmail:(id)a4 organizationID:(id)a5
{
  id v8;
  id v9;
  CLSAdminRequest *v10;
  const char *v11;
  CLSAdminRequest *v12;
  uint64_t v13;
  NSString *requestorID;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLSAdminRequest;
  v10 = -[CLSObject _init](&v16, sel__init);
  v12 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_msgSend_identifierForRequestorEmail_(CLSAdminRequestor, v11, (uint64_t)v8);
    v13 = objc_claimAutoreleasedReturnValue();
    requestorID = v12->_requestorID;
    v12->_requestorID = (NSString *)v13;

    objc_storeStrong((id *)&v12->_organizationID, a5);
    v12->_status = 1;
    v12->_approval = 1;
  }

  return v12;
}

- (CLSAdminRequest)initWithType:(int64_t)a3
{
  CLSAdminRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSAdminRequest;
  result = -[CLSObject _init](&v5, sel__init);
  if (result)
  {
    result->_type = a3;
    result->_status = 1;
    result->_approval = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_type(self, v8, v9);
  objc_msgSend_requestorID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v13, v14, v15);
  objc_msgSend_organizationID(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_copy(v19, v20, v21);
  v24 = (void *)objc_msgSend_initWithType_requestorID_organizationID_(v7, v23, v10, v16, v22);

  v27 = objc_msgSend_status(self, v25, v26);
  objc_msgSend_setStatus_(v24, v28, v27);
  v31 = objc_msgSend_approval(self, v29, v30);
  objc_msgSend_setApproval_(v24, v32, v31);
  objc_msgSend_bundleIdentifier(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend_copy(v35, v36, v37);
  objc_msgSend_setBundleIdentifier_(v24, v39, (uint64_t)v38);

  objc_msgSend_dateCompleted(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_copy(v42, v43, v44);
  objc_msgSend_setDateCompleted_(v24, v46, (uint64_t)v45);

  objc_msgSend_responderNote(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend_copy(v49, v50, v51);
  objc_msgSend_setResponderNote_(v24, v53, (uint64_t)v52);

  return v24;
}

- (CLSAdminRequest)initWithCoder:(id)a3
{
  id v4;
  CLSAdminRequest *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *organizationID;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSString *requestorID;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSString *bundleIdentifier;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSDate *dateCompleted;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSString *responderNote;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLSAdminRequest;
  v5 = -[CLSObject initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("organizationID"));
    v8 = objc_claimAutoreleasedReturnValue();
    organizationID = v5->_organizationID;
    v5->_organizationID = (NSString *)v8;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("type"));
    v5->_status = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("status"));
    v5->_approval = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)CFSTR("approval"));
    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, CFSTR("requestorID"));
    v15 = objc_claimAutoreleasedReturnValue();
    requestorID = v5->_requestorID;
    v5->_requestorID = (NSString *)v15;

    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, CFSTR("bundleIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, CFSTR("dateCompleted"));
    v23 = objc_claimAutoreleasedReturnValue();
    dateCompleted = v5->_dateCompleted;
    v5->_dateCompleted = (NSDate *)v23;

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, CFSTR("responderNote"));
    v27 = objc_claimAutoreleasedReturnValue();
    responderNote = v5->_responderNote;
    v5->_responderNote = (NSString *)v27;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLSAdminRequest;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_organizationID, CFSTR("organizationID"), v13.receiver, v13.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_type, CFSTR("type"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_status, CFSTR("status"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_approval, CFSTR("approval"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_requestorID, CFSTR("requestorID"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_dateCompleted, CFSTR("dateCompleted"));
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_responderNote, CFSTR("responderNote"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSAdminRequest;
  -[CLSObject mergeWithObject:](&v22, sel_mergeWithObject_, v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_opt_class();
  objc_msgSend__propertyNames(v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v23, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v11, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v17, (uint64_t)v16, v15);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v23, 16);
    }
    while (v12);
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *organizationID;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  NSString *bundleIdentifier;
  NSDate *dateCompleted;
  NSString *requestorID;
  NSString *responderNote;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CLSAdminRequest;
  -[CLSObject dictionaryRepresentation](&v21, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  organizationID = self->_organizationID;
  if (organizationID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)organizationID, CFSTR("organizationID"));
  objc_msgSend_stringForType_(CLSAdminRequest, v4, self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v8, (uint64_t)v7, CFSTR("type"));

  objc_msgSend_stringForStatus_(CLSAdminRequest, v9, self->_status);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v11, (uint64_t)v10, CFSTR("status"));

  objc_msgSend_stringForApproval_(CLSAdminRequest, v12, self->_approval);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v14, (uint64_t)v13, CFSTR("approval"));

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)bundleIdentifier, CFSTR("bundleIdentifier"));
  dateCompleted = self->_dateCompleted;
  if (dateCompleted)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)dateCompleted, CFSTR("dateCompleted"));
  requestorID = self->_requestorID;
  if (requestorID)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)requestorID, CFSTR("requestorID"));
  responderNote = self->_responderNote;
  if (responderNote)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)responderNote, CFSTR("responderNote"));
  return v5;
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E974B7D0[a3 - 1];
}

+ (int64_t)typeFromString:(id)a3
{
  const char *v3;
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  int64_t v8;
  const char *v10;
  const char *v11;
  const char *v12;

  v4 = a3;
  if (v4
    && (objc_msgSend_isEqualToString_(&stru_1E974C8A0, v3, (uint64_t)v4) & 1) == 0
    && objc_msgSend_caseInsensitiveCompare_(CFSTR("none"), v5, (uint64_t)v4))
  {
    if ((objc_msgSend_isEqualToString_(CFSTR("emailVerification"), v6, (uint64_t)v4) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("createMAIDAccount"), v7, (uint64_t)v4) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("resetPassword"), v10, (uint64_t)v4) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("resetVerificationCode"), v11, (uint64_t)v4) & 1) != 0)
    {
      v8 = 4;
    }
    else if (objc_msgSend_isEqualToString_(CFSTR("resendAccountCredentials"), v12, (uint64_t)v4))
    {
      v8 = 5;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)stringForStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E974B7F8[a3 - 1];
}

+ (int64_t)statusFromString:(id)a3
{
  const char *v3;
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  int64_t v8;
  const char *v10;
  const char *v11;

  v4 = a3;
  if (v4
    && (objc_msgSend_isEqualToString_(&stru_1E974C8A0, v3, (uint64_t)v4) & 1) == 0
    && objc_msgSend_caseInsensitiveCompare_(CFSTR("none"), v5, (uint64_t)v4))
  {
    if ((objc_msgSend_isEqualToString_(CFSTR("new"), v6, (uint64_t)v4) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("issued"), v7, (uint64_t)v4) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("completed"), v10, (uint64_t)v4) & 1) != 0)
    {
      v8 = 3;
    }
    else if (objc_msgSend_isEqualToString_(CFSTR("failed"), v11, (uint64_t)v4))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)stringForApproval:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E974B818[a3 - 1];
}

+ (int64_t)approvalFromString:(id)a3
{
  const char *v3;
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  int64_t v8;
  const char *v10;
  const char *v11;
  const char *v12;

  v4 = a3;
  if (v4
    && (objc_msgSend_isEqualToString_(&stru_1E974C8A0, v3, (uint64_t)v4) & 1) == 0
    && objc_msgSend_caseInsensitiveCompare_(CFSTR("none"), v5, (uint64_t)v4))
  {
    if ((objc_msgSend_isEqualToString_(CFSTR("none"), v6, (uint64_t)v4) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("pending"), v7, (uint64_t)v4) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("approved"), v10, (uint64_t)v4) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend_isEqualToString_(CFSTR("declined"), v11, (uint64_t)v4) & 1) != 0)
    {
      v8 = 4;
    }
    else if (objc_msgSend_isEqualToString_(CFSTR("approvedCredentialEmailNotAllowed"), v12, (uint64_t)v4))
    {
      v8 = 5;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_propertyNames
{
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("organizationID");
  v3[1] = CFSTR("type");
  v3[2] = CFSTR("status");
  v3[3] = CFSTR("approval");
  v3[4] = CFSTR("requestorID");
  v3[5] = CFSTR("bundleIdentifier");
  v3[6] = CFSTR("dateCompleted");
  v3[7] = CFSTR("responderNote");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)organizationID
{
  return self->_organizationID;
}

- (void)setOrganizationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)approval
{
  return self->_approval;
}

- (void)setApproval:(int64_t)a3
{
  self->_approval = a3;
}

- (NSString)requestorID
{
  return self->_requestorID;
}

- (void)setRequestorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDate)dateCompleted
{
  return self->_dateCompleted;
}

- (void)setDateCompleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)responderNote
{
  return self->_responderNote;
}

- (void)setResponderNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderNote, 0);
  objc_storeStrong((id *)&self->_dateCompleted, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requestorID, 0);
  objc_storeStrong((id *)&self->_organizationID, 0);
}

@end
