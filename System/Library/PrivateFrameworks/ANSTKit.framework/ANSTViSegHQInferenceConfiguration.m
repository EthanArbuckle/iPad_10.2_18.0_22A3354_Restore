@implementation ANSTViSegHQInferenceConfiguration

+ (id)availableInferenceResolutionForVersion:(unint64_t)a3
{
  NSObject *v5;

  if (a3 == 0x20000)
    return &unk_2506EDB10;
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    sub_235910170(a3, v5);

  return (id)MEMORY[0x24BDBD1A8];
}

- (ANSTViSegHQInferenceConfiguration)init
{
  ANSTViSegHQInferenceConfiguration *result;

  result = (ANSTViSegHQInferenceConfiguration *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (ANSTViSegHQInferenceConfiguration)new
{
  ANSTViSegHQInferenceConfiguration *result;

  result = (ANSTViSegHQInferenceConfiguration *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQInferenceConfiguration)initWithVersion:(unint64_t)a3 resolution:(int64_t)a4
{
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  char v11;
  ANSTViSegHQInferenceConfiguration *v12;
  ANSTViSegHQInferenceConfiguration *v13;
  NSObject *v14;
  objc_super v16;

  objc_msgSend_availableInferenceResolutionForVersion_(ANSTViSegHQInferenceConfiguration, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_containsObject_(v7, v10, (uint64_t)v9);

  if ((v11 & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)ANSTViSegHQInferenceConfiguration;
    v12 = -[ANSTViSegHQInferenceConfiguration init](&v16, sel_init);
    if (v12)
    {
      v12->_version = a3;
      v12->_resolution = a4;
      v12->_useE5 = 0;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_2359101F8(v14);

    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  ANSTViSegHQInferenceConfiguration *v4;
  ANSTViSegHQInferenceConfiguration *v5;
  ANSTViSegHQInferenceConfiguration *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;

  v4 = (ANSTViSegHQInferenceConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v17 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9 = objc_msgSend_version(self, v7, v8);
    if (v9 == objc_msgSend_version(v6, v10, v11))
    {
      v14 = objc_msgSend_resolution(self, v12, v13);
      v17 = v14 == objc_msgSend_resolution(v6, v15, v16);
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = objc_msgSend_version(self, a2, v2);
  objc_msgSend_numberWithUnsignedInteger_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v7, v8, v9);

  v11 = (void *)MEMORY[0x24BDD16E0];
  v14 = objc_msgSend_resolution(self, v12, v13);
  objc_msgSend_numberWithInteger_(v11, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v16, v17, v18) ^ v10;

  return v19;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("<%@ %p> {\n"), v5, self);

  v9 = objc_msgSend_version(self, v7, v8);
  ANSTViSegHQInferenceVersionToNSString(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v12, (uint64_t)CFSTR("  version %@\n"), v11);

  v15 = objc_msgSend_resolution(self, v13, v14);
  ANSTViSegHQInferenceResolutionToNSString(v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v18, (uint64_t)CFSTR("  resolution %@\n"), v17);

  v21 = objc_msgSend_useE5(self, v19, v20);
  objc_msgSend_appendFormat_(v3, v22, (uint64_t)CFSTR("  useE5 %d\n"), v21);
  objc_msgSend_appendString_(v3, v23, (uint64_t)CFSTR("}"));
  v26 = (void *)objc_msgSend_copy(v3, v24, v25);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ANSTViSegHQInferenceConfiguration *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  v4 = [ANSTViSegHQInferenceConfiguration alloc];
  v6 = (void *)objc_msgSend_initWithVersion_resolution_(v4, v5, self->_version, self->_resolution);
  v9 = objc_msgSend_useE5(self, v7, v8);
  objc_msgSend_setUseE5_(v6, v10, v9);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  id v28;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  v8 = objc_msgSend_version(self, v6, v7);
  objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)v10, v11);

  v13 = (void *)MEMORY[0x24BDD16E0];
  v16 = objc_msgSend_resolution(self, v14, v15);
  objc_msgSend_numberWithInteger_(v13, v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_resolution);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v20, (uint64_t)v18, v19);

  v21 = (void *)MEMORY[0x24BDD16E0];
  v24 = objc_msgSend_useE5(self, v22, v23);
  objc_msgSend_numberWithBool_(v21, v25, v24);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_useE5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)v28, v26);

}

- (ANSTViSegHQInferenceConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  ANSTViSegHQInferenceConfiguration *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0B88];
    v44 = *MEMORY[0x24BDD0BA0];
    v45[0] = CFSTR("ViSegHQ inference configuration version was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v45, &v44, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, v25, 4865, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v27, (uint64_t)v20);
LABEL_8:
    v23 = 0;
    goto LABEL_9;
  }
  self->_version = objc_msgSend_integerValue(v8, v9, v10);
  v11 = objc_opt_class();
  NSStringFromSelector(sel_resolution);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v28 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0B88];
    v42 = *MEMORY[0x24BDD0BA0];
    v43 = CFSTR("-resolution was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)&v43, &v42, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, v29, 4865, v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v32, (uint64_t)v31);

    goto LABEL_8;
  }
  self->_resolution = objc_msgSend_integerValue(v14, v15, v16);
  v17 = objc_opt_class();
  NSStringFromSelector(sel_useE5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v33 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0B88];
    v40 = *MEMORY[0x24BDD0BA0];
    v41 = CFSTR("-useE5 was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v21, (uint64_t)&v41, &v40, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v36, v34, 4865, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v38, (uint64_t)v37);

    goto LABEL_8;
  }
  self->_useE5 = objc_msgSend_BOOLValue(v20, v21, v22);
  v23 = self;
LABEL_9:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (BOOL)useE5
{
  return self->_useE5;
}

- (void)setUseE5:(BOOL)a3
{
  self->_useE5 = a3;
}

@end
