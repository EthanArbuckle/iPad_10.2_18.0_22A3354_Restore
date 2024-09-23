@implementation CKSyncEngineStateSerialization

- (CKSyncEngineStateSerialization)initWithData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKSyncEngineStateSerialization *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSyncEngineStateSerialization;
  v8 = -[CKSyncEngineStateSerialization init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    data = v8->_data;
    v8->_data = (NSData *)v9;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v4;
  const char *v5;
  id v6;

  data = self->_data;
  v4 = a3;
  NSStringFromSelector(sel_data);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)data, (uint64_t)v6);

}

- (NSData)data
{
  return self->_data;
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("StateSerialization");
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v4 = a3;
  objc_msgSend_data(self, v5, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v8, (uint64_t)CFSTR("data"), (uint64_t)v9, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKSyncEngineStateSerialization)init
{
  CKException *v2;
  const char *v3;
  id v4;

  v2 = [CKException alloc];
  v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("%s is unavailable"), "-[CKSyncEngineStateSerialization init]");
  objc_exception_throw(v4);
}

- (CKSyncEngineStateSerialization)initWithCoder:(id)a3
{
  id v4;
  CKSyncEngineStateSerialization *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSyncEngineStateSerialization;
  v5 = -[CKSyncEngineStateSerialization init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_data);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v9;

  }
  return v5;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineStateSerialization *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineStateSerialization *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
