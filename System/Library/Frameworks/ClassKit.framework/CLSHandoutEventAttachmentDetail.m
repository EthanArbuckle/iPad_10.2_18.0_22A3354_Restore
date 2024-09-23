@implementation CLSHandoutEventAttachmentDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSHandoutEventAttachmentDetail)initWithAttachmentID:(id)a3 handoutAttachmentType:(int)a4 contextType:(int64_t)a5 appIdentifier:(id)a6
{
  id v11;
  id v12;
  id *v13;
  CLSHandoutEventAttachmentDetail *v14;
  const char *v15;
  objc_super v17;

  v11 = a3;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CLSHandoutEventAttachmentDetail;
  v13 = -[CLSObject _init](&v17, sel__init);
  v14 = (CLSHandoutEventAttachmentDetail *)v13;
  if (v13)
  {
    objc_storeStrong(v13 + 14, a3);
    v14->_handoutAttachmentType = a4;
    v14->_contextType = a5;
    objc_msgSend_setAppIdentifier_(v14, v15, (uint64_t)v12);
  }

  return v14;
}

- (CLSHandoutEventAttachmentDetail)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)_init
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_initWithAttachmentID_handoutAttachmentType_contextType_appIdentifier_, &stru_1E974C8A0);
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSHandoutEventAttachmentDetail;
  v5 = -[CLSObject validateObject:](&v19, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_attachmentID, v6, v7))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (void *)MEMORY[0x1E0CB34D0];
      v10 = objc_opt_class();
      objc_msgSend_bundleForClass_(v9, v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v12, v13, (uint64_t)CFSTR("ERROR_DESCRIPTION_HANDOUT_EVENT_DETAIL_NO_ATTACHMENT_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v8, v15, (uint64_t)v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v17, (uint64_t)a3, 2, self, v16);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CLSHandoutEventAttachmentDetail)initWithCoder:(id)a3
{
  id v4;
  CLSHandoutEventAttachmentDetail *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *attachmentID;
  const char *v10;
  const char *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSHandoutEventAttachmentDetail;
  v5 = -[CLSObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("attachmentID"));
    v8 = objc_claimAutoreleasedReturnValue();
    attachmentID = v5->_attachmentID;
    v5->_attachmentID = (NSString *)v8;

    v5->_handoutAttachmentType = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("handoutAttachmentType"));
    v5->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("contextType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSHandoutEventAttachmentDetail;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_attachmentID, CFSTR("attachmentID"), v8.receiver, v8.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_handoutAttachmentType, CFSTR("handoutAttachmentType"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_contextType, CFSTR("contextType"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSHandoutEventAttachmentDetail;
  -[CLSObject dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_attachmentID, CFSTR("attachmentID"));
  NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("handoutAttachmentType"));

  DefaultNameFromContextType(self->_contextType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, CFSTR("contextType"));

  return v3;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSHandoutEventAttachmentDetail;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("attachmentID");
  v22[1] = CFSTR("handoutAttachmentType");
  v22[2] = CFSTR("contextType");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 3);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CLSHandoutEventAttachmentDetail;
  -[CLSObject description](&v22, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (attachmentID: %@)"), self->_attachmentID);
  NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (handoutAttachmentType: %@)"), v9);

  DefaultNameFromContextType(self->_contextType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v12, (uint64_t)CFSTR(" (contextType: %@)"), v11);

  objc_msgSend_appIdentifier(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_appIdentifier(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v19, (uint64_t)CFSTR(" (appIdentifier: %@)"), v18);

  }
  v20 = (void *)objc_msgSend_copy(v6, v16, v17);

  return v20;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (int)handoutAttachmentType
{
  return self->_handoutAttachmentType;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end
