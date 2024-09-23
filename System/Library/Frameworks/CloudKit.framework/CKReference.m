@implementation CKReference

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKReference)init
{
  objc_class *v2;
  uint64_t v3;
  CKException *v4;
  const char *v5;
  id v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = [CKException alloc];
  v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You must call -[%@ initWithRecordID:] or -[%@ initWithRecord:] or -[%@ initWithAsset:]"), v3, v3, v3);
  objc_exception_throw(v6);
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKReference;
  return -[CKReference init](&v3, sel_init);
}

- (CKReference)initWithRecordID:(CKRecordID *)recordID action:(CKReferenceAction)action
{
  CKRecordID *v6;
  char v7;
  id v8;
  CKReference *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKReference *v13;
  uint64_t v14;
  CKRecordID *v15;
  void *v17;
  CKException *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  objc_super v29;
  id v30;

  v6 = recordID;
  v30 = 0;
  v7 = _CKCheckArgument((uint64_t)"recordID", v6, 0, 1, 0, &v30);
  v8 = v30;
  if ((v7 & 1) == 0)
  {
    v17 = v8;
    v18 = [CKException alloc];
    v22 = objc_msgSend_code(v17, v19, v20, v21);
    objc_msgSend_localizedDescription(v17, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, (uint64_t)CFSTR("%@"), v26);

    objc_exception_throw(v28);
  }

  v29.receiver = self;
  v29.super_class = (Class)CKReference;
  v9 = -[CKReference init](&v29, sel_init);
  v13 = v9;
  if (v9)
  {
    v9->_referenceAction = action;
    v14 = objc_msgSend_copy(v6, v10, v11, v12);
    v15 = v13->_recordID;
    v13->_recordID = (CKRecordID *)v14;

  }
  return v13;
}

- (CKReference)initWithRecord:(CKRecord *)record action:(CKReferenceAction)action
{
  CKRecord *v6;
  char v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  CKReference *v14;
  void *v16;
  CKException *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  id v28;

  v6 = record;
  v28 = 0;
  v7 = _CKCheckArgument((uint64_t)"record", v6, 0, 0, 0, &v28);
  v8 = v28;
  if ((v7 & 1) == 0)
  {
    v16 = v8;
    v17 = [CKException alloc];
    v21 = objc_msgSend_code(v16, v18, v19, v20);
    objc_msgSend_localizedDescription(v16, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend_initWithCode_format_(v17, v26, v21, (uint64_t)CFSTR("%@"), v25);

    objc_exception_throw(v27);
  }

  objc_msgSend_recordID(v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CKReference *)objc_msgSend_initWithRecordID_action_(self, v13, (uint64_t)v12, action);

  return v14;
}

- (void)setRecordID_modelMutation:(id)a3
{
  uint64_t v3;
  CKRecordID *v5;
  CKRecordID *recordID;

  v5 = (CKRecordID *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  recordID = self->_recordID;
  self->_recordID = v5;

}

- (void)setReferenceAction_modelMutation:(unint64_t)a3
{
  self->_referenceAction = a3;
}

- (BOOL)isEqual:(id)a3
{
  CKReference *v4;
  CKReference *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  char isEqual;

  v4 = (CKReference *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = objc_msgSend_referenceAction(self, v6, v7, v8);
      if (v9 == objc_msgSend_referenceAction(v5, v10, v11, v12))
      {
        objc_msgSend_recordID(self, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v5, v17, v18, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v16 == (void *)v20)
        {
          isEqual = 1;
          v24 = v16;
        }
        else
        {
          v24 = (void *)v20;
          objc_msgSend_recordID(self, v21, v22, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v5, v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31);

        }
      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_recordID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKReference;
  -[CKReference description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("[%@ recordID=\"%@\"]"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKReference *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)ckShortDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_recordID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return MEMORY[0x1E0C9AA70];
  if (a5)
  {
    v14[0] = CFSTR("type");
    v14[1] = CFSTR("recordID");
    v15[0] = CFSTR("reference");
    objc_msgSend_recordID(self, a2, a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v5, v6, 1, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v15, (uint64_t)v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("recordID");
    objc_msgSend_recordID(self, a2, a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)&v13, (uint64_t)&v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
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
  uint64_t v13;
  const char *v14;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_recordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, (uint64_t)CFSTR("recordID"));

  v13 = objc_msgSend_referenceAction(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v15, v14, v13, (uint64_t)CFSTR("referenceAction"));
  objc_autoreleasePoolPop(v4);

}

- (CKReference)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  CKReference *v13;

  v4 = a3;
  v7 = objc_msgSend_decodeInt64ForKey_(v4, v5, (uint64_t)CFSTR("referenceAction"), v6);
  v8 = (void *)MEMORY[0x18D76DE4C]();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("recordID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  v13 = (CKReference *)objc_msgSend_initWithRecordID_action_(self, v12, (uint64_t)v11, v7);

  return v13;
}

- (CKReferenceAction)referenceAction
{
  return self->_referenceAction;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
}

+ (unint64_t)ckReferenceActionForCKDPRecordReferenceType:(int)a3
{
  CKException *v4;
  const char *v5;
  id v6;

  if ((a3 - 1) >= 3)
  {
    v4 = [CKException alloc];
    v6 = (id)objc_msgSend_initWithCode_format_(v4, v5, 12, (uint64_t)CFSTR("Unexpected reference type"));
    objc_exception_throw(v6);
  }
  return qword_18A83D358[a3 - 1];
}

+ (int)ckdpReferenceTypeForCKReferenceAction:(unint64_t)a3
{
  int v3;

  if (a3 == 2)
    v3 = 3;
  else
    v3 = 2;
  if (a3 == 1)
    return 1;
  else
    return v3;
}

@end
