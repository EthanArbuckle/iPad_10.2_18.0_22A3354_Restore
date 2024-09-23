@implementation CKContextFingerprint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextFingerprint)initWithCoder:(id)a3
{
  id v4;
  CKContextFingerprint *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKContextFingerprint;
  v5 = -[CKContextFingerprint init](&v7, sel_init);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ type:%i"), objc_opt_class(), self->_type);
}

+ (id)parse:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "rangeOfString:", CFSTR("CKContextFingerprintMinHash ")))
  {
    v4 = 0;
  }
  else
  {
    +[CKContextFingerprintMinHash parse:](CKContextFingerprintMinHash, "parse:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
