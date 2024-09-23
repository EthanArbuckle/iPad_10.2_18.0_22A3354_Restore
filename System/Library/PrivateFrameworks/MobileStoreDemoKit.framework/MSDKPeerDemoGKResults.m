@implementation MSDKPeerDemoGKResults

- (MSDKPeerDemoGKResults)initWithEnrollmentResult:(BOOL)a3 andResidualErrors:(id)a4
{
  _BOOL8 v4;
  id v6;
  MSDKPeerDemoGKResults *v7;
  MSDKPeerDemoGKResults *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MSDKPeerDemoGKResults;
  v7 = -[MSDKPeerDemoGKResults init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MSDKPeerDemoGKResults setEnrollmentResult:](v7, "setEnrollmentResult:", v4);
    -[MSDKPeerDemoGKResults setResidualErrors:](v8, "setResidualErrors:", v6);
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSDKPeerDemoGKResults enrollmentResult](self, "enrollmentResult");
  -[MSDKPeerDemoGKResults residualErrors](self, "residualErrors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: EnrollmentResult=%d ResidualErrors=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoGKResults)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoGKResults *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDKPeerDemoGKResults;
  v5 = -[MSDKPeerDemoGKResults init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnrollmentResult"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoGKResults setEnrollmentResult:](v5, "setEnrollmentResult:", v6 != 0);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("ResidualErrors"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoGKResults setResidualErrors:](v5, "setResidualErrors:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[MSDKPeerDemoGKResults enrollmentResult](self, "enrollmentResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("EnrollmentResult"));

  -[MSDKPeerDemoGKResults residualErrors](self, "residualErrors");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("ResidualErrors"));

}

- (BOOL)enrollmentResult
{
  return self->_enrollmentResult;
}

- (void)setEnrollmentResult:(BOOL)a3
{
  self->_enrollmentResult = a3;
}

- (NSArray)residualErrors
{
  return self->_residualErrors;
}

- (void)setResidualErrors:(id)a3
{
  objc_storeStrong((id *)&self->_residualErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residualErrors, 0);
}

@end
