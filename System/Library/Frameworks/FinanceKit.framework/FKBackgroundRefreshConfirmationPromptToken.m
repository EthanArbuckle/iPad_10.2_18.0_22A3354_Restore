@implementation FKBackgroundRefreshConfirmationPromptToken

- (FKBackgroundRefreshConfirmationPromptToken)initWithFullyQualifiedAccountIdentifier:(id)a3 sequenceNumber:(int64_t)a4
{
  id v6;
  FKBackgroundRefreshConfirmationPromptToken *v7;
  uint64_t v8;
  FKFullyQualifiedAccountIdentifier *fqaid;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FKBackgroundRefreshConfirmationPromptToken;
  v7 = -[FKBackgroundRefreshConfirmationPromptToken init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    fqaid = v7->_fqaid;
    v7->_fqaid = (FKFullyQualifiedAccountIdentifier *)v8;

    v7->_sequenceNumber = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FKBackgroundRefreshConfirmationPromptToken initWithFullyQualifiedAccountIdentifier:sequenceNumber:]([FKBackgroundRefreshConfirmationPromptToken alloc], "initWithFullyQualifiedAccountIdentifier:sequenceNumber:", self->_fqaid, self->_sequenceNumber);
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_fqaid);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sequenceNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = FKCombinedHash(17, v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FKBackgroundRefreshConfirmationPromptToken *v4;
  FKBackgroundRefreshConfirmationPromptToken *v5;
  FKBackgroundRefreshConfirmationPromptToken *v6;
  BOOL v7;

  v4 = (FKBackgroundRefreshConfirmationPromptToken *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_fqaid, v6->_fqaid))
      v7 = self->_sequenceNumber == v6->_sequenceNumber;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (FKFullyQualifiedAccountIdentifier)fqaid
{
  return self->_fqaid;
}

- (void)setFqaid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fqaid, 0);
}

@end
