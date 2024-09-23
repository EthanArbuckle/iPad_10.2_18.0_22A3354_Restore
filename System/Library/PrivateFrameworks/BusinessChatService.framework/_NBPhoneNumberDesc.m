@implementation _NBPhoneNumberDesc

- (_NBPhoneNumberDesc)initWithEntry:(id)a3
{
  id v4;
  _NBPhoneNumberDesc *v5;
  _NBPhoneNumberDesc *v6;
  uint64_t v7;
  NSString *nationalNumberPattern;
  uint64_t v9;
  NSString *possibleNumberPattern;
  uint64_t v11;
  NSArray *possibleLength;
  uint64_t v13;
  NSArray *possibleLengthLocalOnly;
  uint64_t v15;
  NSString *exampleNumber;
  uint64_t v17;
  NSData *nationalNumberMatcherData;
  uint64_t v19;
  NSData *possibleNumberMatcherData;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_NBPhoneNumberDesc;
  v5 = -[_NBPhoneNumberDesc init](&v22, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "nb_safeStringAtIndex:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    nationalNumberPattern = v6->_nationalNumberPattern;
    v6->_nationalNumberPattern = (NSString *)v7;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 3);
    v9 = objc_claimAutoreleasedReturnValue();
    possibleNumberPattern = v6->_possibleNumberPattern;
    v6->_possibleNumberPattern = (NSString *)v9;

    objc_msgSend(v4, "nb_safeArrayAtIndex:", 9);
    v11 = objc_claimAutoreleasedReturnValue();
    possibleLength = v6->_possibleLength;
    v6->_possibleLength = (NSArray *)v11;

    objc_msgSend(v4, "nb_safeArrayAtIndex:", 10);
    v13 = objc_claimAutoreleasedReturnValue();
    possibleLengthLocalOnly = v6->_possibleLengthLocalOnly;
    v6->_possibleLengthLocalOnly = (NSArray *)v13;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 6);
    v15 = objc_claimAutoreleasedReturnValue();
    exampleNumber = v6->_exampleNumber;
    v6->_exampleNumber = (NSString *)v15;

    objc_msgSend(v4, "nb_safeDataAtIndex:", 7);
    v17 = objc_claimAutoreleasedReturnValue();
    nationalNumberMatcherData = v6->_nationalNumberMatcherData;
    v6->_nationalNumberMatcherData = (NSData *)v17;

    objc_msgSend(v4, "nb_safeDataAtIndex:", 8);
    v19 = objc_claimAutoreleasedReturnValue();
    possibleNumberMatcherData = v6->_possibleNumberMatcherData;
    v6->_possibleNumberMatcherData = (NSData *)v19;

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_NBPhoneNumberDesc nationalNumberPattern](self, "nationalNumberPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberDesc possibleNumberPattern](self, "possibleNumberPattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberDesc possibleLength](self, "possibleLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberDesc possibleLengthLocalOnly](self, "possibleLengthLocalOnly");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumberDesc exampleNumber](self, "exampleNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("nationalNumberPattern[%@] possibleNumberPattern[%@] possibleLength[%@] possibleLengthLocalOnly[%@] exampleNumber[%@]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)nationalNumberPattern
{
  return self->_nationalNumberPattern;
}

- (NSString)possibleNumberPattern
{
  return self->_possibleNumberPattern;
}

- (NSArray)possibleLength
{
  return self->_possibleLength;
}

- (NSArray)possibleLengthLocalOnly
{
  return self->_possibleLengthLocalOnly;
}

- (NSString)exampleNumber
{
  return self->_exampleNumber;
}

- (NSData)nationalNumberMatcherData
{
  return self->_nationalNumberMatcherData;
}

- (NSData)possibleNumberMatcherData
{
  return self->_possibleNumberMatcherData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleNumberMatcherData, 0);
  objc_storeStrong((id *)&self->_nationalNumberMatcherData, 0);
  objc_storeStrong((id *)&self->_exampleNumber, 0);
  objc_storeStrong((id *)&self->_possibleLengthLocalOnly, 0);
  objc_storeStrong((id *)&self->_possibleLength, 0);
  objc_storeStrong((id *)&self->_possibleNumberPattern, 0);
  objc_storeStrong((id *)&self->_nationalNumberPattern, 0);
}

@end
