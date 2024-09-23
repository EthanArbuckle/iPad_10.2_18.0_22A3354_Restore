@implementation CLSProgressEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSProgressEvent)initWithAttachmentID:(id)a3 classID:(id)a4 handoutID:(id)a5 eventType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  CLSProgressEvent *v14;
  CLSProgressEvent *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLSProgressEvent;
  v14 = -[CLSInsightEvent initWithType:](&v17, sel_initWithType_, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attachmentID, a3);
    objc_storeStrong((id *)&v15->_classID, a4);
    objc_storeStrong((id *)&v15->_handoutID, a5);
  }

  return v15;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CLSProgressEvent;
  v5 = -[CLSInsightEvent validateObject:](&v31, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_attachmentID, v6, v7))
    {
      if (objc_msgSend_length(self->_classID, v8, v9))
      {
        if (objc_msgSend_length(self->_handoutID, v10, v11))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        v12 = (void *)MEMORY[0x1E0CB3940];
        v22 = (void *)MEMORY[0x1E0CB34D0];
        v23 = objc_opt_class();
        objc_msgSend_bundleForClass_(v22, v24, v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v16, v25, (uint64_t)CFSTR("ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_HANDOUT_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v18 = (void *)MEMORY[0x1E0CB34D0];
        v19 = objc_opt_class();
        objc_msgSend_bundleForClass_(v18, v20, v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v16, v21, (uint64_t)CFSTR("ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_CLASS_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0CB34D0];
      v14 = objc_opt_class();
      objc_msgSend_bundleForClass_(v13, v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v16, v17, (uint64_t)CFSTR("ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_ATTACHMENT_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v12, v27, (uint64_t)v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v29, (uint64_t)a3, 2, self, v28);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CLSProgressEvent)initWithCoder:(id)a3
{
  id v4;
  CLSProgressEvent *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *activityID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *attachmentID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *classID;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *handoutID;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *recipientPersonID;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSString *objectIDPath;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  NSString *handoutAuthorizedObjectID;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  CLSActivityReportItem *activityItemInfo;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  CLSRange *rangeInfo;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  CLSTimeInterval *timeIntervalInfo;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  NSString *primaryActivityItemIdentifier;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)CLSProgressEvent;
  v5 = -[CLSInsightEvent initWithCoder:](&v53, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("activityID"));
    v8 = objc_claimAutoreleasedReturnValue();
    activityID = v5->_activityID;
    v5->_activityID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("attachmentID"));
    v12 = objc_claimAutoreleasedReturnValue();
    attachmentID = v5->_attachmentID;
    v5->_attachmentID = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("classID"));
    v16 = objc_claimAutoreleasedReturnValue();
    classID = v5->_classID;
    v5->_classID = (NSString *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("handoutID"));
    v20 = objc_claimAutoreleasedReturnValue();
    handoutID = v5->_handoutID;
    v5->_handoutID = (NSString *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("recipientPersonID"));
    v24 = objc_claimAutoreleasedReturnValue();
    recipientPersonID = v5->_recipientPersonID;
    v5->_recipientPersonID = (NSString *)v24;

    v5->_handoutAttachmentType = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)CFSTR("handoutAttachmentType"));
    v5->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)CFSTR("contextType"));
    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, CFSTR("objectIDPath"));
    v30 = objc_claimAutoreleasedReturnValue();
    objectIDPath = v5->_objectIDPath;
    v5->_objectIDPath = (NSString *)v30;

    v32 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, CFSTR("handoutAuthorizedObjectID"));
    v34 = objc_claimAutoreleasedReturnValue();
    handoutAuthorizedObjectID = v5->_handoutAuthorizedObjectID;
    v5->_handoutAuthorizedObjectID = (NSString *)v34;

    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, CFSTR("activityItemInfo"));
    v38 = objc_claimAutoreleasedReturnValue();
    activityItemInfo = v5->_activityItemInfo;
    v5->_activityItemInfo = (CLSActivityReportItem *)v38;

    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, CFSTR("rangeInfo"));
    v42 = objc_claimAutoreleasedReturnValue();
    rangeInfo = v5->_rangeInfo;
    v5->_rangeInfo = (CLSRange *)v42;

    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, CFSTR("timeIntervalInfo"));
    v46 = objc_claimAutoreleasedReturnValue();
    timeIntervalInfo = v5->_timeIntervalInfo;
    v5->_timeIntervalInfo = (CLSTimeInterval *)v46;

    v48 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v48, CFSTR("primaryActivityItemIdentifier"));
    v50 = objc_claimAutoreleasedReturnValue();
    primaryActivityItemIdentifier = v5->_primaryActivityItemIdentifier;
    v5->_primaryActivityItemIdentifier = (NSString *)v50;

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
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLSProgressEvent;
  v4 = a3;
  -[CLSInsightEvent encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_activityID, CFSTR("activityID"), v18.receiver, v18.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_attachmentID, CFSTR("attachmentID"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_classID, CFSTR("classID"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_handoutID, CFSTR("handoutID"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_recipientPersonID, CFSTR("recipientPersonID"));
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_handoutAttachmentType, CFSTR("handoutAttachmentType"));
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_contextType, CFSTR("contextType"));
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_objectIDPath, CFSTR("objectIDPath"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_handoutAuthorizedObjectID, CFSTR("handoutAuthorizedObjectID"));
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_activityItemInfo, CFSTR("activityItemInfo"));
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)self->_rangeInfo, CFSTR("rangeInfo"));
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)self->_timeIntervalInfo, CFSTR("timeIntervalInfo"));
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_primaryActivityItemIdentifier, CFSTR("primaryActivityItemIdentifier"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CLSProgressEvent;
  -[CLSInsightEvent dictionaryRepresentation](&v30, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_activityID, CFSTR("activityID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_attachmentID, CFSTR("attachmentID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_classID, CFSTR("classID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)self->_handoutID, CFSTR("handoutID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)self->_recipientPersonID, CFSTR("recipientPersonID"));
  NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("handoutAttachmentType"));

  DefaultNameFromContextType(self->_contextType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, CFSTR("contextType"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)self->_objectIDPath, CFSTR("objectIDPath"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)self->_handoutAuthorizedObjectID, CFSTR("handoutAuthorizedObjectID"));
  objc_msgSend_dictionaryRepresentation(self->_activityItemInfo, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, CFSTR("activityItemInfo"));

  objc_msgSend_dictionaryRepresentation(self->_rangeInfo, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, CFSTR("rangeInfo"));

  objc_msgSend_dictionaryRepresentation(self->_timeIntervalInfo, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v26, CFSTR("timeIntervalInfo"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)self->_primaryActivityItemIdentifier, CFSTR("primaryActivityItemIdentifier"));
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
  _QWORD v22[14];

  v22[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSProgressEvent;
  -[CLSInsightEvent mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("activityID");
  v22[1] = CFSTR("attachmentID");
  v22[2] = CFSTR("classID");
  v22[3] = CFSTR("handoutID");
  v22[4] = CFSTR("recipientPersonID");
  v22[5] = CFSTR("handoutAttachmentType");
  v22[6] = CFSTR("contextType");
  v22[7] = CFSTR("objectIDPath");
  v22[8] = CFSTR("handoutAuthorizedObjectID");
  v22[9] = CFSTR("activityItemInfo");
  v22[10] = CFSTR("rangeInfo");
  v22[11] = CFSTR("timeIntervalInfo");
  v22[12] = CFSTR("primaryActivityItemIdentifier");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 13);
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

- (void)setAppIdentifier:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  char isEqualToString;
  const char *v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v4 = (uint64_t)a3;
  objc_msgSend_appIdentifier(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v4 | v7)
  {
    v10 = (void *)v7;
    objc_msgSend_appIdentifier(self, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    if (v4 && v11)
    {
      objc_msgSend_appIdentifier(self, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v15, v16, v4);

      if ((isEqualToString & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    v20 = (void *)objc_msgSend_copy((void *)v4, v18, v19);
    v21.receiver = self;
    v21.super_class = (Class)CLSProgressEvent;
    -[CLSObject setAppIdentifier:](&v21, sel_setAppIdentifier_, v20);

  }
LABEL_8:

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
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  unint64_t contextType;
  void *v17;
  const char *v18;
  NSString *objectIDPath;
  NSString *handoutAuthorizedObjectID;
  CLSActivityReportItem *activityItemInfo;
  CLSRange *rangeInfo;
  CLSTimeInterval *timeIntervalInfo;
  NSString *primaryActivityItemIdentifier;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CLSProgressEvent;
  -[CLSInsightEvent description](&v26, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("activityID"), self->_activityID);
  objc_msgSend_appendFormat_(v6, v8, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("attachmentID"), self->_attachmentID);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("classID"), self->_classID);
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("handoutID"), self->_handoutID);
  objc_msgSend_appendFormat_(v6, v11, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("recipientPersonID"), self->_recipientPersonID);
  NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("handoutAttachmentType"), v13);

  contextType = self->_contextType;
  if (contextType)
  {
    DefaultNameFromContextType(contextType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v18, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("contextType"), v17);

  }
  objectIDPath = self->_objectIDPath;
  if (objectIDPath)
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("objectIDPath"), objectIDPath);
  handoutAuthorizedObjectID = self->_handoutAuthorizedObjectID;
  if (handoutAuthorizedObjectID)
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("handoutAuthorizedObjectID"), handoutAuthorizedObjectID);
  activityItemInfo = self->_activityItemInfo;
  if (activityItemInfo)
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("activityItemInfo"), activityItemInfo);
  rangeInfo = self->_rangeInfo;
  if (rangeInfo)
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("rangeInfo"), rangeInfo);
  timeIntervalInfo = self->_timeIntervalInfo;
  if (timeIntervalInfo)
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("timeIntervalInfo"), timeIntervalInfo);
  primaryActivityItemIdentifier = self->_primaryActivityItemIdentifier;
  if (primaryActivityItemIdentifier)
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("primaryActivityItemIdentifier"), primaryActivityItemIdentifier);
  return v6;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)handoutID
{
  return self->_handoutID;
}

- (void)setHandoutID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)recipientPersonID
{
  return self->_recipientPersonID;
}

- (void)setRecipientPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int)handoutAttachmentType
{
  return self->_handoutAttachmentType;
}

- (void)setHandoutAttachmentType:(int)a3
{
  self->_handoutAttachmentType = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (NSString)objectIDPath
{
  return self->_objectIDPath;
}

- (void)setObjectIDPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)handoutAuthorizedObjectID
{
  return self->_handoutAuthorizedObjectID;
}

- (void)setHandoutAuthorizedObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (CLSActivityReportItem)activityItemInfo
{
  return self->_activityItemInfo;
}

- (void)setActivityItemInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (CLSRange)rangeInfo
{
  return self->_rangeInfo;
}

- (void)setRangeInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (CLSTimeInterval)timeIntervalInfo
{
  return self->_timeIntervalInfo;
}

- (void)setTimeIntervalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_timeIntervalInfo, a3);
}

- (NSString)primaryActivityItemIdentifier
{
  return self->_primaryActivityItemIdentifier;
}

- (void)setPrimaryActivityItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_primaryActivityItemIdentifier, 0);
  objc_storeStrong((id *)&self->_timeIntervalInfo, 0);
  objc_storeStrong((id *)&self->_rangeInfo, 0);
  objc_storeStrong((id *)&self->_activityItemInfo, 0);
  objc_storeStrong((id *)&self->_handoutAuthorizedObjectID, 0);
  objc_storeStrong((id *)&self->_objectIDPath, 0);
  objc_storeStrong((id *)&self->_recipientPersonID, 0);
  objc_storeStrong((id *)&self->_handoutID, 0);
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end
