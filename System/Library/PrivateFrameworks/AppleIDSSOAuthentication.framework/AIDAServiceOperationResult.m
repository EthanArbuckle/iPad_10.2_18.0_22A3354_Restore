@implementation AIDAServiceOperationResult

- (AIDAServiceOperationResult)initWithSuccess:(BOOL)a3 error:(id)a4 type:(id)a5
{
  id v9;
  id v10;
  AIDAServiceOperationResult *v11;
  AIDAServiceOperationResult *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AIDAServiceOperationResult;
  v11 = -[AIDAServiceOperationResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_error, a4);
    v12->_success = a3;
    objc_storeStrong((id *)&v12->_type, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_opt_new();
  v5 = -[NSError copy](self->_error, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_BYTE *)(v4 + 8) = self->_success;
  v7 = -[NSString copy](self->_type, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 success;
  id v5;

  success = self->_success;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", success, CFSTR("_success"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("_error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("_type"));

}

- (AIDAServiceOperationResult)initWithCoder:(id)a3
{
  id v4;
  AIDAServiceOperationResult *v5;
  uint64_t v6;
  NSError *error;
  uint64_t v8;
  NSString *type;

  v4 = a3;
  v5 = -[AIDAServiceOperationResult init](self, "init");
  if (v5)
  {
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_success"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AIDAServiceOperationResult type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AIDAServiceOperationResult success](self, "success"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[AIDAServiceOperationResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TYPE: %@,  SUCCESS: %@,  ERROR: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
