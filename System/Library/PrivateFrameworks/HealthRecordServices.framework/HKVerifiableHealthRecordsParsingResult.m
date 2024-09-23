@implementation HKVerifiableHealthRecordsParsingResult

- (HKVerifiableHealthRecordsParsingResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKVerifiableHealthRecordsParsingResult)initWithOptions:(unint64_t)a3 localizedTypeDisplayNames:(id)a4
{
  id v6;
  HKVerifiableHealthRecordsParsingResult *v7;
  HKVerifiableHealthRecordsParsingResult *v8;
  uint64_t v9;
  NSArray *localizedTypeDisplayNames;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableHealthRecordsParsingResult;
  v7 = -[HKVerifiableHealthRecordsParsingResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_options = a3;
    v9 = objc_msgSend(v6, "copy");
    localizedTypeDisplayNames = v8->_localizedTypeDisplayNames;
    v8->_localizedTypeDisplayNames = (NSArray *)v9;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKVerifiableHealthRecordsParsingResult *v4;
  HKVerifiableHealthRecordsParsingResult *v5;
  HKVerifiableHealthRecordsParsingResult *v6;
  unint64_t options;
  NSArray *localizedTypeDisplayNames;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  char v13;

  v4 = (HKVerifiableHealthRecordsParsingResult *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (options = self->_options, options == -[HKVerifiableHealthRecordsParsingResult options](v6, "options")))
    {
      localizedTypeDisplayNames = self->_localizedTypeDisplayNames;
      -[HKVerifiableHealthRecordsParsingResult localizedTypeDisplayNames](v6, "localizedTypeDisplayNames");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (localizedTypeDisplayNames == v9)
      {
        v13 = 1;
      }
      else
      {
        -[HKVerifiableHealthRecordsParsingResult localizedTypeDisplayNames](v6, "localizedTypeDisplayNames");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = self->_localizedTypeDisplayNames;
          -[HKVerifiableHealthRecordsParsingResult localizedTypeDisplayNames](v6, "localizedTypeDisplayNames");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSArray isEqualToArray:](v11, "isEqualToArray:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t options;
  id v5;

  options = self->_options;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTypeDisplayNames, CFSTR("localizedTypeDisplayNames"));

}

- (HKVerifiableHealthRecordsParsingResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HKVerifiableHealthRecordsParsingResult *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("options")) & 1) != 0)
  {
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("localizedTypeDisplayNames"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKVerifiableHealthRecordsParsingResult initWithOptions:localizedTypeDisplayNames:]([HKVerifiableHealthRecordsParsingResult alloc], "initWithOptions:localizedTypeDisplayNames:", v5, v7);

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)localizedTypeDisplayNames
{
  return self->_localizedTypeDisplayNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTypeDisplayNames, 0);
}

@end
