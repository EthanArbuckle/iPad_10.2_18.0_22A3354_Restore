@implementation ATXCandidate

- (ATXCandidate)initWithBiomeStoreData:(id)a3
{
  id v5;
  ATXCandidate *v6;
  ATXCandidate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidate;
  v6 = -[ATXCandidate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_biomeStoreData, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXCandidate *v4;
  ATXCandidate *v5;
  BOOL v6;

  v4 = (ATXCandidate *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCandidate isEqualToATXCandidate:](self, "isEqualToATXCandidate:", v5);

  return v6;
}

- (BOOL)isEqualToATXCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXCandidate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXCandidate identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BMStoreData *biomeStoreData;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;

  biomeStoreData = self->_biomeStoreData;
  v5 = a3;
  -[BMStoreData serialize](biomeStoreData, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("biomeStoreData"));

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("biomeStoreDataClassName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMStoreData dataVersion](self->_biomeStoreData, "dataVersion"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("biomeStoreDataDataVersion"));

}

- (ATXCandidate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ATXCandidate *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_relevance_model();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("biomeStoreData"), v4, 1, CFSTR("com.apple.duetexpertd.ATXCandidate"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_relevance_model();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("biomeStoreDataClassName"), v4, 1, CFSTR("com.apple.duetexpertd.ATXCandidate"), -1, v11);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0D81610];
      v14 = objc_opt_class();
      __atxlog_handle_relevance_model();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("biomeStoreDataDataVersion"), v4, 1, CFSTR("com.apple.duetexpertd.ATXCandidate"), -1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (ATXCandidate *)NSClassFromString(v12);
        if (v17)
        {
          -[ATXCandidate eventWithData:dataVersion:](v17, "eventWithData:dataVersion:", v8, objc_msgSend(v16, "unsignedIntValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            self = -[ATXCandidate initWithBiomeStoreData:](self, "initWithBiomeStoreData:", v18);
            v17 = self;
          }
          else
          {
            v17 = 0;
          }

        }
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BMStoreData)biomeStoreData
{
  return self->_biomeStoreData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStoreData, 0);
}

@end
