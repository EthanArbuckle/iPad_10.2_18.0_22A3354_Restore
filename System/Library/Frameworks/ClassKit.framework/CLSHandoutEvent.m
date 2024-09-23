@implementation CLSHandoutEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSHandoutEvent)initWithClassID:(id)a3 handoutID:(id)a4 eventType:(int64_t)a5
{
  id v9;
  id v10;
  CLSHandoutEvent *v11;
  CLSHandoutEvent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSHandoutEvent;
  v11 = -[CLSInsightEvent initWithType:](&v14, sel_initWithType_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_classID, a3);
    objc_storeStrong((id *)&v12->_handoutID, a4);
  }

  return v12;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CLSHandoutEvent;
  v5 = -[CLSInsightEvent validateObject:](&v25, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_classID, v6, v7))
    {
      if (objc_msgSend_length(self->_handoutID, v8, v9))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      v16 = (void *)MEMORY[0x1E0CB34D0];
      v17 = objc_opt_class();
      objc_msgSend_bundleForClass_(v16, v18, v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v19, (uint64_t)CFSTR("ERROR_DESCRIPTION_HANDOUT_EVENT_NO_HANDOUT_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (void *)MEMORY[0x1E0CB34D0];
      v12 = objc_opt_class();
      objc_msgSend_bundleForClass_(v11, v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v15, (uint64_t)CFSTR("ERROR_DESCRIPTION_HANDOUT_EVENT_NO_CLASS_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v21, (uint64_t)v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v23, (uint64_t)a3, 2, self, v22);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CLSHandoutEvent)initWithCoder:(id)a3
{
  id v4;
  CLSHandoutEvent *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *classID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *handoutID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSDate *dueDate;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSArray *recipientIDs;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSArray *attachmentDetails;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CLSHandoutEvent;
  v5 = -[CLSInsightEvent initWithCoder:](&v35, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("classID"));
    v8 = objc_claimAutoreleasedReturnValue();
    classID = v5->_classID;
    v5->_classID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("handoutID"));
    v12 = objc_claimAutoreleasedReturnValue();
    handoutID = v5->_handoutID;
    v5->_handoutID = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("dueDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v37, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, CFSTR("recipientIDs"));
    v24 = objc_claimAutoreleasedReturnValue();
    recipientIDs = v5->_recipientIDs;
    v5->_recipientIDs = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v36, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v26, v29, (uint64_t)v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, CFSTR("attachmentDetails"));
    v32 = objc_claimAutoreleasedReturnValue();
    attachmentDetails = v5->_attachmentDetails;
    v5->_attachmentDetails = (NSArray *)v32;

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSHandoutEvent;
  v4 = a3;
  -[CLSInsightEvent encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_classID, CFSTR("classID"), v10.receiver, v10.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_handoutID, CFSTR("handoutID"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_dueDate, CFSTR("dueDate"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_recipientIDs, CFSTR("recipientIDs"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_attachmentDetails, CFSTR("attachmentDetails"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  NSDate *dueDate;
  NSArray *recipientIDs;
  NSArray *attachmentDetails;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSHandoutEvent;
  -[CLSInsightEvent dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_classID, CFSTR("classID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_handoutID, CFSTR("handoutID"));
  dueDate = self->_dueDate;
  if (dueDate)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)dueDate, CFSTR("dueDate"));
  recipientIDs = self->_recipientIDs;
  if (recipientIDs)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)recipientIDs, CFSTR("recipientIDs"));
  attachmentDetails = self->_attachmentDetails;
  if (attachmentDetails)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)attachmentDetails, CFSTR("attachmentDetails"));
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
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSHandoutEvent;
  -[CLSInsightEvent mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("classID");
  v22[1] = CFSTR("handoutID");
  v22[2] = CFSTR("dueDate");
  v22[3] = CFSTR("recipientIDs");
  v22[4] = CFSTR("attachmentDetails");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 5);
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
  const char *v9;
  const char *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLSHandoutEvent;
  -[CLSInsightEvent description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (classID: %@)"), self->_classID);
  objc_msgSend_appendFormat_(v6, v8, (uint64_t)CFSTR(" (handoutID: %@)"), self->_handoutID);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (dueDate: %@)"), self->_dueDate);
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (recipientIDs: %@)"), self->_recipientIDs);
  objc_msgSend_appendFormat_(v6, v11, (uint64_t)CFSTR(" (attachmentDetails: %@)"), self->_attachmentDetails);
  return v6;
}

- (NSString)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)handoutID
{
  return self->_handoutID;
}

- (void)setHandoutID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_dueDate, a3);
}

- (NSArray)recipientIDs
{
  return self->_recipientIDs;
}

- (void)setRecipientIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)attachmentDetails
{
  return self->_attachmentDetails;
}

- (void)setAttachmentDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentDetails, 0);
  objc_storeStrong((id *)&self->_recipientIDs, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_handoutID, 0);
  objc_storeStrong((id *)&self->_classID, 0);
}

@end
