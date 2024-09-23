@implementation CNEncodedFetchResponse

- (NSData)data
{
  return self->_data;
}

- (void)setMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_matchInfo, a3);
}

- (void)setIdentifierAccountingData:(id)a3
{
  objc_storeStrong((id *)&self->_identifierAccountingData, a3);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDictionary)matchInfo
{
  return self->_matchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierAccountingData, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSSet)identifierAccountingData
{
  return self->_identifierAccountingData;
}

+ (id)emptyResponse
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setData:", v3);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNEncodedFetchResponse)initWithCoder:(id)a3
{
  id v4;
  CNEncodedFetchResponse *v5;
  void *v6;
  uint64_t v7;
  NSData *data;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *matchInfo;
  CNEncodedFetchResponse *v17;

  v4 = a3;
  v5 = -[CNEncodedFetchResponse init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_matchInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    matchInfo = v5->_matchInfo;
    v5->_matchInfo = (NSDictionary *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("_data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchInfo, CFSTR("_matchInfo"));

}

@end
