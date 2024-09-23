@implementation ANSTDescriptor

- (ANSTDescriptor)init
{
  ANSTDescriptor *result;

  result = (ANSTDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTDescriptor)initWithName:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  ANSTDescriptor *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *name;
  void *v15;
  void *v16;
  const char *v17;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ANSTDescriptor;
  v9 = -[ANSTDescriptor init](&v18, sel_init);
  if (!v9)
    goto LABEL_4;
  if (objc_msgSend_length(v6, v7, v8))
  {
    v12 = objc_msgSend_copy(v6, v10, v11);
    name = v9->_name;
    v9->_name = (NSString *)v12;

LABEL_4:
    a4 = v9;
    goto LABEL_5;
  }
  if (a4)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0BA0];
    v20[0] = CFSTR("Descriptor name should not be empty.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, (uint64_t)CFSTR("ANSTErrorDomain"), 7, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_5:

  return (ANSTDescriptor *)a4;
}

- (BOOL)isEqual:(id)a3
{
  ANSTDescriptor *v4;
  ANSTDescriptor *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char isEqualToString;

  v4 = (ANSTDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToString = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_name(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v5, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v8, v12, (uint64_t)v11);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_name(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@ %p> %@"), v5, self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_name(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithName_error_(v7, v11, (uint64_t)v10, 0);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;

  v4 = a3;
  objc_msgSend_name(self, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v9, v7);

}

- (ANSTDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  ANSTDescriptor *v12;
  uint64_t v13;
  NSString *name;
  ANSTDescriptor *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v23.receiver = self;
    v23.super_class = (Class)ANSTDescriptor;
    v12 = -[ANSTDescriptor init](&v23, sel_init);
    if (v12)
    {
      v13 = objc_msgSend_copy(v8, v10, v11);
      name = v12->_name;
      v12->_name = (NSString *)v13;

    }
    self = v12;
    v15 = self;
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0B88];
    v24 = *MEMORY[0x24BDD0BA0];
    v25[0] = CFSTR("Descriptor name was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, v17, 4865, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v21, (uint64_t)v20);

    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
