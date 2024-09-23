@implementation DIIdentityElement

- (DIIdentityElement)initWithIdentifier:(id)a3
{
  NSString *v4;
  DIIdentityElement *v5;
  NSString *identifier;
  objc_super v8;

  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)DIIdentityElement;
  v5 = -[DIIdentityElement init](&v8, sel_init);
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

+ (DIIdentityElement)givenNameElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys givenName](_TtC7CoreIDV27IdentityElementRawValueKeys, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)familyNameElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys familyName](_TtC7CoreIDV27IdentityElementRawValueKeys, "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)sexElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys sex](_TtC7CoreIDV27IdentityElementRawValueKeys, "sex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)portraitElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys portrait](_TtC7CoreIDV27IdentityElementRawValueKeys, "portrait");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)addressElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys address](_TtC7CoreIDV27IdentityElementRawValueKeys, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)issuingAuthorityElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys issuingAuthority](_TtC7CoreIDV27IdentityElementRawValueKeys, "issuingAuthority");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)documentDHSComplianceStatusElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys documentDHSComplianceStatus](_TtC7CoreIDV27IdentityElementRawValueKeys, "documentDHSComplianceStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)documentExpirationDateElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys documentExpirationDate](_TtC7CoreIDV27IdentityElementRawValueKeys, "documentExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)documentNumberElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys documentNumber](_TtC7CoreIDV27IdentityElementRawValueKeys, "documentNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)documentIssueDateElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys documentIssueDate](_TtC7CoreIDV27IdentityElementRawValueKeys, "documentIssueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)drivingPrivilegesElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys drivingPrivileges](_TtC7CoreIDV27IdentityElementRawValueKeys, "drivingPrivileges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)ageElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys age](_TtC7CoreIDV27IdentityElementRawValueKeys, "age");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (DIIdentityElement)dateOfBirthElement
{
  DIIdentityElement *v2;
  void *v3;
  DIIdentityElement *v4;

  v2 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys dateOfBirth](_TtC7CoreIDV27IdentityElementRawValueKeys, "dateOfBirth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIdentityElement initWithIdentifier:](v2, "initWithIdentifier:", v3);

  return v4;
}

+ (id)ageThresholdElementWithAge:(int64_t)a3
{
  DIIdentityElement *v4;
  void *v5;
  DIIdentityElement *v6;

  v4 = [DIIdentityElement alloc];
  +[IdentityElementRawValueKeys ageIsOver:](_TtC7CoreIDV27IdentityElementRawValueKeys, "ageIsOver:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DIIdentityElement initWithIdentifier:](v4, "initWithIdentifier:", v5);

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
