@implementation CHRemoteRecognitionMathRequest

- (CHRemoteRecognitionMathRequest)initWithCoder:(id)a3
{
  id v4;
  CHRemoteRecognitionMathRequest *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSSet *declaredVariables;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSArray *locales;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CHRemoteRecognitionMathRequest;
  v5 = -[CHRemoteRecognitionRequest initWithCoder:](&v37, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v39, 2, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v11, (uint64_t)v10, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, (uint64_t)CFSTR("declaredVariables"), v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    declaredVariables = v5->_declaredVariables;
    v5->_declaredVariables = (NSSet *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v38, 2, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v21, v26, (uint64_t)v25, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("locales"), v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    locales = v5->_locales;
    v5->_locales = (NSArray *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHRemoteRecognitionMathRequest;
  -[CHRemoteRecognitionRequest encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_declaredVariables, (uint64_t)CFSTR("declaredVariables"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_locales, (uint64_t)CFSTR("locales"), v9, v10);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setDeclaredVariables:(id)a3
{
  NSSet *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSSet *v16;
  NSSet *declaredVariables;
  uint8_t v18[16];

  v4 = (NSSet *)a3;
  if (objc_msgSend_hasBeenSubmitted(self, v5, v6, v7, v8, v9))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v15 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1BE607000, v15, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v18, 2u);
    }

  }
  if (self->_declaredVariables != v4)
  {
    v16 = (NSSet *)objc_msgSend_copy(v4, v10, v11, v12, v13, v14);
    declaredVariables = self->_declaredVariables;
    self->_declaredVariables = v16;

  }
}

- (BOOL)isEqualToRemoteRecognitionMathRequest:(id)a3
{
  CHRemoteRecognitionMathRequest *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isEqualToSet;
  objc_super v35;

  v4 = (CHRemoteRecognitionMathRequest *)a3;
  if (self == v4)
  {
    isEqualToSet = 1;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)CHRemoteRecognitionMathRequest;
    if (-[CHRemoteRecognitionRequest isEqualToRemoteRecognitionRequest:](&v35, sel_isEqualToRemoteRecognitionRequest_, v4))
    {
      objc_msgSend_declaredVariables(self, v5, v6, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_declaredVariables(v4, v11, v12, v13, v14, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v21)
      {
        isEqualToSet = 1;
      }
      else
      {
        objc_msgSend_declaredVariables(self, v16, v17, v18, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_declaredVariables(v4, v23, v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToSet = objc_msgSend_isEqualToSet_(v22, v29, (uint64_t)v28, v30, v31, v32);

      }
    }
    else
    {
      isEqualToSet = 0;
    }
  }

  return isEqualToSet;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteRecognitionMathRequest;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteRecognitionMathRequest = objc_msgSend_isEqualToRemoteRecognitionMathRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionMathRequest;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend_declaredVariables(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, (uint64_t)v25, 16, v9);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v7);
        v10 ^= objc_msgSend_hash(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v18++), v11, v12, v13, v14, v15);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v21, (uint64_t)v25, 16, v15);
    }
    while (v16);
  }

  v20.receiver = self;
  v20.super_class = (Class)CHRemoteRecognitionMathRequest;
  return -[CHRemoteRecognitionRequest hash](&v20, sel_hash) ^ v10;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_super v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CHRemoteRecognitionMathRequest;
  -[CHRemoteRecognitionRequest description](&v36, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)CHRemoteRecognitionMathRequest;
  -[CHRemoteRecognitionRequest description](&v35, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_length(v4, v5, v6, v7, v8, v9);
  objc_msgSend_substringToIndex_(v3, v11, v10 - 1, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_declaredVariables(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);
  objc_msgSend_stringWithFormat_(v16, v29, (uint64_t)CFSTR("%@, declared variables=[%lu])"), v30, v31, v32, v15, v28);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
}

@end
