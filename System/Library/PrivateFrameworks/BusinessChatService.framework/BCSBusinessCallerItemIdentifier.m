@implementation BCSBusinessCallerItemIdentifier

- (BCSBusinessCallerItemIdentifier)initWithPhoneNumber:(id)a3
{
  return -[BCSBusinessCallerItemIdentifier initWithTruncatedHash:](self, "initWithTruncatedHash:", +[BCSBusinessCallerItemIdentifier _truncatedHashForPhoneNumber:](BCSBusinessCallerItemIdentifier, "_truncatedHashForPhoneNumber:", a3));
}

- (BCSBusinessCallerItemIdentifier)initWithTruncatedHash:(int64_t)a3
{
  BCSBusinessCallerItemIdentifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCSBusinessCallerItemIdentifier;
  result = -[BCSBusinessCallerItemIdentifier init](&v5, sel_init);
  if (result)
    result->_computedTruncatedHash = a3;
  return result;
}

- (NSObject)itemIdentifier
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BCSBusinessCallerItemIdentifier truncatedHash](self, "truncatedHash"));
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[BCSBusinessCallerItemIdentifier type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    v6 = -[BCSBusinessCallerItemIdentifier truncatedHash](self, "truncatedHash");
    v7 = v6 == objc_msgSend(v4, "truncatedHash");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)type
{
  return 3;
}

- (NSString)pirKey
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BCSBusinessCallerItemIdentifier truncatedHash](self, "truncatedHash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
    v4[1] = -[BCSBusinessCallerItemIdentifier computedTruncatedHash](self, "computedTruncatedHash");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  int64_t computedTruncatedHash;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  computedTruncatedHash = self->_computedTruncatedHash;
  v5 = a3;
  objc_msgSend(v3, "numberWithLongLong:", computedTruncatedHash);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("TruncatedHash"));

}

- (BCSBusinessCallerItemIdentifier)initWithCoder:(id)a3
{
  id v4;
  BCSBusinessCallerItemIdentifier *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCSBusinessCallerItemIdentifier;
  v5 = -[BCSBusinessCallerItemIdentifier init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TruncatedHash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_computedTruncatedHash = objc_msgSend(v6, "longLongValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_truncatedHashForPhoneNumber:(id)a3
{
  void *v3;
  int64_t v4;

  +[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:](BCSPhoneNumberNormalizer, "normalizedPhoneNumberForPhoneNumber:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[BCSHashService SHA256TruncatedHashForInputString:includedBytes:](BCSHashService, "SHA256TruncatedHashForInputString:includedBytes:", v3, 8);

  return v4;
}

- (int64_t)computedTruncatedHash
{
  return self->_computedTruncatedHash;
}

@end
