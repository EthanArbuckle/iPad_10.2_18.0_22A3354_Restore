@implementation CLSAbstractHandout

- (CLSAbstractHandout)init
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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSAbstractHandout;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSAbstractHandout)initWithCoder:(id)a3
{
  id v4;
  CLSAbstractHandout *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *instructions;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSDate *dueDate;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSDate *dateOfPublication;
  const char *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLSAbstractHandout;
  v5 = -[CLSObject initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("instructions"));
    v8 = objc_claimAutoreleasedReturnValue();
    instructions = v5->_instructions;
    v5->_instructions = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("title"));
    v12 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("dueDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("dateOfPublication"));
    v20 = objc_claimAutoreleasedReturnValue();
    dateOfPublication = v5->_dateOfPublication;
    v5->_dateOfPublication = (NSDate *)v20;

    v5->_version = objc_msgSend_decodeIntegerForKey_(v4, v22, (uint64_t)CFSTR("version"));
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
  v10.super_class = (Class)CLSAbstractHandout;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_instructions, CFSTR("instructions"), v10.receiver, v10.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_dueDate, CFSTR("dueDate"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_dateOfPublication, CFSTR("dateOfPublication"));
  objc_msgSend_encodeInteger_forKey_(v4, v9, self->_version, CFSTR("version"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *title;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  title = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)instructions
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_instructions;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setInstructions:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *instructions;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  instructions = self->_instructions;
  v12 = (id)v8;
  if (v8 | (unint64_t)instructions
    && (!v8 || !instructions || (objc_msgSend_isEqualToString_(instructions, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_instructions, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSDate)dueDate
{
  uint64_t v2;
  NSDate *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_dueDate;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setDueDate:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *dueDate;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  dueDate = self->_dueDate;
  v12 = (id)v8;
  if (v8 | (unint64_t)dueDate
    && (!v8 || !dueDate || (objc_msgSend_isEqualToDate_(dueDate, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_dueDate, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSDate)dateOfPublication
{
  uint64_t v2;
  NSDate *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_dateOfPublication;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setDateOfPublication:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *dateOfPublication;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  dateOfPublication = self->_dateOfPublication;
  v12 = (id)v8;
  if (v8 | (unint64_t)dateOfPublication
    && (!v8 || !dateOfPublication || (objc_msgSend_isEqualToDate_(dateOfPublication, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_dateOfPublication, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int64_t)version
{
  uint64_t v2;
  int64_t version;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  version = self->_version;
  objc_msgSend_unlock(self, v5, v6);
  return version;
}

- (void)setVersion:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_version != a3)
  {
    self->_version = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *instructions;
  NSString *title;
  NSDate *dueDate;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSAbstractHandout;
  -[CLSObject dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  instructions = self->_instructions;
  if (instructions)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)instructions, CFSTR("instructions"));
  title = self->_title;
  if (title)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)title, CFSTR("title"));
  dueDate = self->_dueDate;
  if (dueDate)
  {
    objc_msgSend_mediumStringFromDate_(CLSUtil, v4, (uint64_t)dueDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, CFSTR("dueDate"));

  }
  objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)self->_dateOfPublication, CFSTR("dateOfPublication"));
  return v5;
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
  v20.super_class = (Class)CLSAbstractHandout;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("dateOfPublication");
  v22[1] = CFSTR("instructions");
  v22[2] = CFSTR("title");
  v22[3] = CFSTR("dueDate");
  v22[4] = CFSTR("version");
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

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addAsset:(id)a3
{
  void *v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  int isEqualToString;
  void *v28;
  id v29;
  id v30;

  v30 = a3;
  if (objc_msgSend_type(v30, v5, v6) != 3)
  {
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  objc_msgSend_addChild_changedPropertyName_(self, v7, (uint64_t)v30, CFSTR("assets"));
  objc_msgSend_parentObjectID(v30, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  if (!v12)
  {
    objc_msgSend_objectID(self, v10, v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    if (!v3)
      goto LABEL_15;
  }
  objc_msgSend_parentObjectID(v13, v10, v11);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (v12)
    {
LABEL_11:

LABEL_16:
      v28 = v30;
      goto LABEL_17;
    }
LABEL_10:

    goto LABEL_11;
  }
  v17 = (void *)v14;
  objc_msgSend_objectID(self, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    if (v12)
      goto LABEL_11;
    goto LABEL_10;
  }
  v21 = (void *)v18;
  objc_msgSend_parentObjectID(v30, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

  if (v12)
  {

    v28 = v30;
    if (!isEqualToString)
      goto LABEL_17;
    goto LABEL_15;
  }

  v28 = v30;
  if ((isEqualToString & 1) != 0)
  {
LABEL_15:
    objc_msgSend_setParentEntityType_(v30, v10, 1);
    goto LABEL_16;
  }
LABEL_17:

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_dateOfPublication, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
