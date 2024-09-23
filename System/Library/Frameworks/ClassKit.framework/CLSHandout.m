@implementation CLSHandout

- (CLSClass)effectiveClass
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  objc_msgSend_recipients(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_classID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataStore(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_graph(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vertexWithVertexID_(v16, v17, (uint64_t)v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSClass *)v18;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSHandout;
  result = -[CLSAbstractHandout _init](&v3, sel__init);
  if (result)
  {
    *((_QWORD *)result + 25) = 0;
    *((_QWORD *)result + 27) = 0;
    *((_QWORD *)result + 29) = 1;
  }
  return result;
}

- (BOOL)validateObject:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSHandout;
  return -[CLSObject validateObject:](&v4, sel_validateObject_, a3);
}

- (void)_adjustPublishingStateIfNeeded
{
  char v3;
  const char *v4;
  uint64_t v5;
  int64_t publishingState;
  BOOL v7;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  NSError *v22;
  NSError *publishError;

  v3 = CLSExecutableLinkedOnOrAfter_iOS13_2_macOS_10_15_1();
  publishingState = self->_publishingState;
  if ((v3 & 1) == 0 && publishingState >= 5)
  {
    self->_publishingState = 1;
LABEL_8:
    objc_msgSend_dateLastModified(self, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceNow(v10, v11, v12);
    v14 = fabs(v13);

    if (v14 > 43200.0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromHandoutPublishingState(self->_publishingState, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("publishingState was stuck at '%@' for over 12 hours"), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_createErrorWithCode_description_(v16, v21, 313, v20);
      v22 = (NSError *)objc_claimAutoreleasedReturnValue();
      publishError = self->_publishError;
      self->_publishError = v22;

      self->_publishingState = 4;
    }
    return;
  }
  v7 = (unint64_t)publishingState > 6;
  v8 = (1 << publishingState) & 0x6A;
  if (!v7 && v8 != 0)
    goto LABEL_8;
}

- (CLSHandout)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSHandout *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSError *publishError;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSDate *dateLastReviewed;
  const char *v23;
  const char *v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSHandout;
  v6 = -[CLSAbstractHandout initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_reviewed = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("reviewed")) != 0;
    v6->_state = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)CFSTR("state"));
    v6->_substate = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)CFSTR("substate"));
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, CFSTR("flags"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_flags = objc_msgSend_unsignedIntegerValue(v11, v12, v13);

    v6->_publishingState = objc_msgSend_decodeIntegerForKey_(v4, v14, (uint64_t)CFSTR("publishingState"));
    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("publishError"));
    v17 = objc_claimAutoreleasedReturnValue();
    publishError = v6->_publishError;
    v6->_publishError = (NSError *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("dateLastReviewed"));
    v21 = objc_claimAutoreleasedReturnValue();
    dateLastReviewed = v6->_dateLastReviewed;
    v6->_dateLastReviewed = (NSDate *)v21;

    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("type"));
    objc_msgSend__adjustPublishingStateIfNeeded(v6, v24, v25);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSHandout;
  v4 = a3;
  -[CLSAbstractHandout encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_reviewed, CFSTR("reviewed"), v15.receiver, v15.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_state, CFSTR("state"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_substate, CFSTR("substate"));
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v8, self->_flags);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, CFSTR("flags"));

  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_publishingState, CFSTR("publishingState"));
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_publishError, CFSTR("publishError"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_dateLastReviewed, CFSTR("dateLastReviewed"));
  objc_msgSend_encodeInteger_forKey_(v4, v14, self->_type, CFSTR("type"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isReviewed
{
  uint64_t v2;
  BOOL reviewed;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  reviewed = self->_reviewed;
  objc_msgSend_unlock(self, v5, v6);
  return reviewed;
}

- (void)setReviewed:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_reviewed == v3)
  {
    objc_msgSend_unlock(self, v5, v6);
  }
  else
  {
    self->_reviewed = v3;
    objc_msgSend_setModified_(self, v5, 1);
    objc_msgSend_unlock(self, v7, v8);
    if (objc_msgSend_isReviewed(self, v9, v10))
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v11, v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLastReviewedDate_(self, v13, (uint64_t)v14);

    }
  }
}

- (NSDate)lastReviewedDate
{
  uint64_t v2;
  NSDate *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_dateLastReviewed;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setLastReviewedDate:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *dateLastReviewed;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  dateLastReviewed = self->_dateLastReviewed;
  v12 = (id)v8;
  if (v8 | (unint64_t)dateLastReviewed
    && (!v8 || !dateLastReviewed || (objc_msgSend_isEqualToDate_(dateLastReviewed, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_dateLastReviewed, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (CLSSchedule)schedule
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)&unk_1E9749BB0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSSchedule *)v5;
}

- (void)setSchedule:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend_schedule(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_schedule(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeChild_changedPropertyName_(self, v10, (uint64_t)v9, CFSTR("schedule"));

  }
  v11 = v12;
  if (v12)
  {
    objc_msgSend_addChild_changedPropertyName_(self, v7, (uint64_t)v12, CFSTR("schedule"));
    v11 = v12;
  }

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
  _QWORD v22[10];

  v22[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSHandout;
  -[CLSAbstractHandout mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("reviewed");
  v22[1] = CFSTR("state");
  v22[2] = CFSTR("substate");
  v22[3] = CFSTR("publishingState");
  v22[4] = CFSTR("publishError");
  v22[5] = CFSTR("dateLastReviewed");
  v22[6] = CFSTR("flags");
  v22[7] = CFSTR("type");
  v22[8] = CFSTR("dateLastModified");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 9);
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

- (void)addHandoutAttachment:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("attachments"));
}

- (void)removeHandoutAttachment:(id)a3
{
  objc_msgSend_removeChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("attachments"));
}

- (void)addHandoutRecipient:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("recipients"));
}

- (void)removeHandoutRecipient:(id)a3
{
  objc_msgSend_removeChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("recipients"));
}

- (NSArray)recipients
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (NSArray)attachments
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (NSArray)collaborationStates
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (NSArray)attachmentCollaborationStates
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_attachments(self, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, v29, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_collaborationStates(v14, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend_count(v15, v16, v17);

        if (v18)
        {
          objc_msgSend_collaborationStates(v14, v9, v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v3, v20, (uint64_t)v19);

        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v25, v29, 16);
    }
    while (v11);
  }

  v23 = (void *)objc_msgSend_copy(v3, v21, v22);
  return (NSArray *)v23;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CLSHandout;
  -[CLSObject description](&v36, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  v9 = objc_msgSend_type(self, v7, v8);
  NSStringFromHandoutType(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v12, (uint64_t)CFSTR(" (type: %@)"), v11);

  objc_msgSend_title(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v16, (uint64_t)CFSTR(" (title: %@)"), v15);

  v19 = objc_msgSend_state(self, v17, v18);
  NSStringFromHandoutState(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v22, (uint64_t)CFSTR(" (state: %@)"), v21);

  v25 = objc_msgSend_substate(self, v23, v24);
  NSStringFromHandoutSubstate(v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v28, (uint64_t)CFSTR(" (substate: %@)"), v27);

  v31 = objc_msgSend_publishingState(self, v29, v30);
  NSStringFromHandoutPublishingState(v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v34, (uint64_t)CFSTR(" (publishing-state: %@)"), v33);

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  NSError *publishError;
  NSDate *dateLastReviewed;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)CLSHandout;
  -[CLSAbstractHandout dictionaryRepresentation](&v50, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHandoutType(self->_type, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)v5, CFSTR("type"));

  NSStringFromHandoutState(self->_state, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, CFSTR("state"));

  NSStringFromHandoutSubstate(self->_substate, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, CFSTR("substate"));

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v13, self->_flags);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, CFSTR("flags"));

  NSStringFromHandoutPublishingState(self->_publishingState, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, CFSTR("publishingState"));

  publishError = self->_publishError;
  if (publishError)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)publishError, CFSTR("publishError"));
  dateLastReviewed = self->_dateLastReviewed;
  if (dateLastReviewed)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)dateLastReviewed, CFSTR("dateLastReviewed"));
  objc_msgSend_collaborationStates(self, v19, (uint64_t)dateLastReviewed);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)objc_opt_new();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v26 = v24;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v46, v51, 16);
    if (v28)
    {
      v31 = v28;
      v32 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(v26);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v46 + 1) + 8 * i), v29, v30, (_QWORD)v46);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v25, v35, (uint64_t)v34);

        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v46, v51, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v3, v36, (uint64_t)v25, CFSTR("collaborationStates"));
  }
  objc_msgSend_schedule(self, v22, v23, (_QWORD)v46);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend_schedule(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryRepresentation(v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v43, CFSTR("schedule"));

  }
  return v3;
}

- (void)addAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_type(v8, v4, v5) != 3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend_becomeChildOf_(v8, v6, (uint64_t)self);

}

- (void)removeAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_type(v8, v4, v5) != 3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend_removeChild_changedPropertyName_(self, v6, (uint64_t)v8, CFSTR("assets"));

}

- (NSDate)dateLastReviewed
{
  return self->_dateLastReviewed;
}

- (void)setDateLastReviewed:(id)a3
{
  objc_storeStrong((id *)&self->_dateLastReviewed, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)substate
{
  return self->_substate;
}

- (void)setSubstate:(unint64_t)a3
{
  self->_substate = a3;
}

- (int64_t)publishingState
{
  return self->_publishingState;
}

- (void)setPublishingState:(int64_t)a3
{
  self->_publishingState = a3;
}

- (NSError)publishError
{
  return self->_publishError;
}

- (void)setPublishError:(id)a3
{
  objc_storeStrong((id *)&self->_publishError, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishError, 0);
  objc_storeStrong((id *)&self->_dateLastReviewed, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40CE9C8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB950 != -1)
    dispatch_once(&qword_1ED0FB950, block);
  return (id)qword_1ED0FB948;
}

@end
