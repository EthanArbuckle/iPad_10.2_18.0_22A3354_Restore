@implementation ASAuthorizationPublicKeyCredentialParameters

- (ASAuthorizationPublicKeyCredentialParameters)initWithAlgorithm:(ASCOSEAlgorithmIdentifier)algorithm
{
  ASAuthorizationPublicKeyCredentialParameters *v4;
  ASAuthorizationPublicKeyCredentialParameters *v5;
  ASAuthorizationPublicKeyCredentialParameters *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationPublicKeyCredentialParameters;
  v4 = -[ASAuthorizationPublicKeyCredentialParameters init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_algorithm = algorithm;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAlgorithm:", -[ASAuthorizationPublicKeyCredentialParameters algorithm](self, "algorithm"));
}

- (ASAuthorizationPublicKeyCredentialParameters)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASAuthorizationPublicKeyCredentialParameters *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algorithm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASAuthorizationPublicKeyCredentialParameters initWithAlgorithm:](self, "initWithAlgorithm:", objc_msgSend(v5, "integerValue"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[ASAuthorizationPublicKeyCredentialParameters algorithm](self, "algorithm"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("algorithm"));

}

- (ASCOSEAlgorithmIdentifier)algorithm
{
  return self->_algorithm;
}

@end
