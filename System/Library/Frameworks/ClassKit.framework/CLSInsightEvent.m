@implementation CLSInsightEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedInfoDictionaryClasses
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return (id)objc_msgSend_initWithObjects_(v2, v8, v3, v4, v5, v6, v7, 0);
}

- (CLSInsightEvent)init
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
  return (id)objc_msgSend_initWithType_(self, a2, 0);
}

- (CLSInsightEvent)initWithType:(int64_t)a3
{
  CLSInsightEvent *v4;
  const char *v5;
  CLSInsightEvent *v6;
  void *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSInsightEvent;
  v4 = -[CLSObject _init](&v10, sel__init);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setType_(v4, v5, a3);
    v7 = (void *)objc_opt_new();
    objc_msgSend_setInfo_(v6, v8, (uint64_t)v7);

  }
  return v6;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSInsightEvent;
  v5 = -[CLSObject validateObject:](&v17, sel_validateObject_);
  if (v5)
  {
    if (self->_type)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (void *)MEMORY[0x1E0CB34D0];
      v8 = objc_opt_class();
      objc_msgSend_bundleForClass_(v7, v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v10, v11, (uint64_t)CFSTR("ERROR_DESCRIPTION_UNKNOWN_INSIGHT_EVENT_TYPE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v15, (uint64_t)a3, 2, self, v14);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CLSInsightEvent)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSInsightEvent *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSMutableDictionary *info;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSInsightEvent;
  v6 = -[CLSObject initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("type"));
    objc_msgSend_supportedInfoDictionaryClasses(CLSInsightEvent, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v10, (uint64_t)v9, CFSTR("info"));
    v11 = objc_claimAutoreleasedReturnValue();
    info = v6->_info;
    v6->_info = (NSMutableDictionary *)v11;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSInsightEvent;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_type, CFSTR("type"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_info, CFSTR("info"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSInsightEvent;
  -[CLSObject dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromInsightEventType(self->_type, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)v5, CFSTR("type"));

  objc_msgSend__infoDictDescription(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("info"));

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
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSInsightEvent;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("type");
  v22[1] = CFSTR("info");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 2);
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
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSInsightEvent;
  -[CLSObject description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  NSStringFromInsightEventType(self->_type, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (type: %@)"), v8);

  objc_msgSend__infoDictDescription(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (info: %@)"), v12);

  return v6;
}

- (id)_infoDictDescription
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  NSMutableDictionary *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend_count(self->_info, v4, v5);
  v28 = (void *)objc_msgSend_initWithCapacity_(v3, v7, v6);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_info;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, v33, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend_objectForKey_(self->_info, v11, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v16;
        if (v16)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_description(v16, v17, v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v20, v22, (uint64_t)CFSTR("%@: %@"), v15, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v28, v24, (uint64_t)v23);

        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v29, v33, 16);
    }
    while (v12);
  }

  objc_msgSend_componentsJoinedByString_(v28, v25, (uint64_t)CFSTR(", "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
