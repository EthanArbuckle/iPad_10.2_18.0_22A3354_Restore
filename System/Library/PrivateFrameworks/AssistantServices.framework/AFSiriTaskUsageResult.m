@implementation AFSiriTaskUsageResult

- (id)_initWithOriginatingAceID:(id)a3
{
  id v4;
  AFSiriTaskUsageResult *v5;
  uint64_t v6;
  NSString *originatingAceID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriTaskUsageResult;
  v5 = -[AFSiriTaskUsageResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    originatingAceID = v5->_originatingAceID;
    v5->_originatingAceID = (NSString *)v6;

  }
  return v5;
}

- (id)_originatingAceID
{
  return self->_originatingAceID;
}

- (id)_resultDescription
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSiriTaskUsageResult.m"), 33, CFSTR("_resultDescription must be overridden in subclasses."));

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(": %p;"), self);
  if (-[NSString length](self->_originatingAceID, "length"))
  {
    objc_msgSend(v3, "appendString:", CFSTR(" originatingAceID="));
    objc_msgSend(v3, "appendString:", self->_originatingAceID);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_originatingAceID, CFSTR("OriginatingAceIDKeyIdentifier"));
}

- (AFSiriTaskUsageResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFSiriTaskUsageResult *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OriginatingAceIDKeyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AFSiriTaskUsageResult _initWithOriginatingAceID:](self, "_initWithOriginatingAceID:", v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingAceID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
