@implementation FPTestingOperation

- (FPTestingOperation)initWithOperationIdentifier:(id)a3
{
  id v5;
  FPTestingOperation *v6;
  FPTestingOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPTestingOperation;
  v6 = -[FPTestingOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_operationIdentifier, a3);

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_operationIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[1], "isEqualToString:", self->_operationIdentifier);
  else
    v5 = 0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_operationIdentifier, CFSTR("_operationIdentifier"));
}

- (FPTestingOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FPTestingOperation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_operationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[FPTestingOperation initWithOperationIdentifier:](self, "initWithOperationIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should be implemented by subclasses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPTestingOperation type]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPTestingOperations.m", 67, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (id)asIngestion
{
  return 0;
}

- (id)asLookup
{
  return 0;
}

- (id)asCreation
{
  return 0;
}

- (id)asModification
{
  return 0;
}

- (id)asDeletion
{
  return 0;
}

- (id)asContentFetch
{
  return 0;
}

- (id)asChildrenEnumeration
{
  return 0;
}

- (id)asCollisionResolution
{
  return 0;
}

- (NSString)description
{
  return self->_operationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationIdentifier, 0);
}

@end
