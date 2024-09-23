@implementation AMSChannelLinkParams

- (AMSChannelLinkParams)initWithString:(id)a3
{
  id v5;
  AMSChannelLinkParams *v6;
  uint64_t v7;
  NSDictionary *dictionary;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSChannelLinkParams;
  v6 = -[AMSChannelLinkParams init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_queryDictionaryFromString:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;

    objc_storeStrong((id *)&v6->_linkParamsString, a3);
  }

  return v6;
}

- (NSString)adamId
{
  void *v2;
  void *v3;
  id v4;

  -[AMSChannelLinkParams dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("adamId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

+ (id)_queryDictionaryFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setQuery:", v3);
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "queryItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AMSChannelLinkParams dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

  -[AMSChannelLinkParams linkParamsString](self, "linkParamsString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("linkParamsString"));

}

- (AMSChannelLinkParams)initWithCoder:(id)a3
{
  id v4;
  AMSChannelLinkParams *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *dictionary;
  uint64_t v9;
  NSString *linkParamsString;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSChannelLinkParams;
  v5 = -[AMSChannelLinkParams init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("dictionary"));
    v7 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkParamsString"));
    v9 = objc_claimAutoreleasedReturnValue();
    linkParamsString = v5->_linkParamsString;
    v5->_linkParamsString = (NSString *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)linkParamsString
{
  return self->_linkParamsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkParamsString, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
