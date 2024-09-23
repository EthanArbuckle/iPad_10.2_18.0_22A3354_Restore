@implementation EKSequenceToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKSequenceToken)initWithCADSequenceToken:(id)a3
{
  id v4;
  EKSequenceToken *v5;
  uint64_t v6;
  NSDictionary *sequenceNumbers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKSequenceToken;
  v5 = -[EKSequenceToken init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "allDBSequenceMap");
    v6 = objc_claimAutoreleasedReturnValue();
    sequenceNumbers = v5->_sequenceNumbers;
    v5->_sequenceNumbers = (NSDictionary *)v6;

  }
  return v5;
}

- (EKSequenceToken)initWithCoder:(id)a3
{
  id v4;
  EKSequenceToken *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *sequenceNumbers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKSequenceToken;
  v5 = -[EKSequenceToken init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("sequenceNumbers"));
    v7 = objc_claimAutoreleasedReturnValue();
    sequenceNumbers = v5->_sequenceNumbers;
    v5->_sequenceNumbers = (NSDictionary *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sequenceNumbers, CFSTR("sequenceNumbers"));
}

- (id)CADToken
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0F8]), "initWithAllDBSequenceMap:", self->_sequenceNumbers);
}

- (int)legacyToken
{
  NSDictionary *sequenceNumbers;
  void *v3;
  void *v4;
  int v5;

  sequenceNumbers = self->_sequenceNumbers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sequenceNumbers, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "intValue");
  else
    v5 = -1;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumbers, 0);
}

@end
