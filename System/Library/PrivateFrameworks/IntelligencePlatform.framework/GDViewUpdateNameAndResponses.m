@implementation GDViewUpdateNameAndResponses

- (GDViewUpdateNameAndResponses)initWithName:(id)a3 responses:(id)a4
{
  id v7;
  id v8;
  GDViewUpdateNameAndResponses *v9;
  GDViewUpdateNameAndResponses *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDViewUpdateNameAndResponses;
  v9 = -[GDViewUpdateNameAndResponses init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_responses, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  const char *v7;
  NSArray *responses;
  const char *v9;
  id v10;

  name = self->_name;
  v5 = a3;
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)name, v6);

  responses = self->_responses;
  NSStringFromSelector(sel_responses);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)responses, v10);

}

- (GDViewUpdateNameAndResponses)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  GDViewUpdateNameAndResponses *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  NSStringFromSelector(sel_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, v7, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend_error(v4, v10, v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = (void *)MEMORY[0x1AF45451C]();
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v20 = (void *)objc_msgSend_initWithObjects_(v16, v19, v17, v18, 0);
    objc_autoreleasePoolPop(v15);
    NSStringFromSelector(sel_responses);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_robustDecodeObjectOfClasses_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v14, v22, (uint64_t)v20, v21, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23
      && (objc_msgSend_error(v4, v24, v25), v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, !v26))
    {
      self = (GDViewUpdateNameAndResponses *)(id)objc_msgSend_initWithName_responses_(self, v27, (uint64_t)v9, v23);
      v13 = self;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("<GDViewUpdateNameAndRequests %@, responses: %@>"), self->_name, self->_responses);
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)responses
{
  return self->_responses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
