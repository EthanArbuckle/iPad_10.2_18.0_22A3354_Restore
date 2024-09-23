@implementation CSSearchContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSSearchContext)initWithQueryID:(unint64_t)a3 userQuery:(id)a4 maxItemsCount:(unint64_t)a5 keyboardLanguage:(id)a6 preferredLanguages:(id)a7
{
  id v13;
  id v14;
  id v15;
  CSSearchContext *v16;
  CSSearchContext *v17;
  NSString *markedText;
  objc_super v20;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CSSearchContext;
  v16 = -[CSSearchContext init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_queryID = a3;
    objc_storeStrong((id *)&v16->_userQuery, a4);
    v17->_maxItemsCount = a5;
    objc_storeStrong((id *)&v17->_keyboardLanguage, a6);
    objc_storeStrong((id *)&v17->_preferredLanguages, a7);
    markedText = v17->_markedText;
    v17->_markedText = 0;

    v17->_markedTextStart = 0;
  }

  return v17;
}

- (CSSearchContext)initWithQueryID:(unint64_t)a3 userQuery:(id)a4 maxItemsCount:(unint64_t)a5 keyboardLanguage:(id)a6 preferredLanguages:(id)a7 markedText:(id)a8 markedTextStart:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  CSSearchContext *v19;
  CSSearchContext *v20;
  objc_super v23;

  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CSSearchContext;
  v19 = -[CSSearchContext init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_queryID = a3;
    objc_storeStrong((id *)&v19->_userQuery, a4);
    v20->_maxItemsCount = a5;
    objc_storeStrong((id *)&v20->_keyboardLanguage, a6);
    objc_storeStrong((id *)&v20->_preferredLanguages, a7);
    objc_storeStrong((id *)&v20->_markedText, a8);
    v20->_markedTextStart = a9;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *markedText;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", self->_queryID, CFSTR("qid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userQuery, CFSTR("uq"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxItemsCount, CFSTR("mc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardLanguage, CFSTR("kl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredLanguages, CFSTR("pl"));
  markedText = self->_markedText;
  if (markedText)
  {
    objc_msgSend(v5, "encodeObject:forKey:", markedText, CFSTR("mt"));
    objc_msgSend(v5, "encodeInt64:forKey:", self->_markedTextStart, CFSTR("mts"));
  }

}

- (CSSearchContext)initWithCoder:(id)a3
{
  id v4;
  CSSearchContext *v5;
  uint64_t v6;
  NSString *userQuery;
  uint64_t v8;
  NSString *keyboardLanguage;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *preferredLanguages;
  uint64_t v15;
  NSString *markedText;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSSearchContext;
  v5 = -[CSSearchContext init](&v18, sel_init);
  if (v5)
  {
    v5->_queryID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("qid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uq"));
    v6 = objc_claimAutoreleasedReturnValue();
    userQuery = v5->_userQuery;
    v5->_userQuery = (NSString *)v6;

    v5->_maxItemsCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mc"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kl"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyboardLanguage = v5->_keyboardLanguage;
    v5->_keyboardLanguage = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("pl"));
    v13 = objc_claimAutoreleasedReturnValue();
    preferredLanguages = v5->_preferredLanguages;
    v5->_preferredLanguages = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mt"));
    v15 = objc_claimAutoreleasedReturnValue();
    markedText = v5->_markedText;
    v5->_markedText = (NSString *)v15;

    v5->_markedTextStart = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mts"));
  }

  return v5;
}

- (OS_xpc_object)xpc_dictionary
{
  xpc_object_t v3;
  const char *v4;
  NSString *keyboardLanguage;
  NSString *markedText;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "qid", self->_queryID);
  v4 = -[NSString UTF8String](self->_userQuery, "UTF8String");
  if (v4)
    xpc_dictionary_set_string(v3, "uq", v4);
  xpc_dictionary_set_uint64(v3, "mc", self->_maxItemsCount);
  keyboardLanguage = self->_keyboardLanguage;
  if (keyboardLanguage)
    xpc_dictionary_set_string(v3, "kl", -[NSString UTF8String](keyboardLanguage, "UTF8String"));
  if (-[NSArray count](self->_preferredLanguages, "count"))
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_preferredLanguages, "pl");
  markedText = self->_markedText;
  if (markedText)
  {
    xpc_dictionary_set_string(v3, "mt", -[NSString UTF8String](markedText, "UTF8String"));
    xpc_dictionary_set_uint64(v3, "mts", self->_markedTextStart);
  }
  return (OS_xpc_object *)v3;
}

- (CSSearchContext)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t uint64;
  uint64_t v7;
  CSSearchContext *v8;
  CSSearchContext *v9;
  NSString *v10;
  NSString *userQuery;
  NSString *v12;
  NSString *keyboardLanguage;
  void *v14;
  NSArray *v15;
  NSArray *preferredLanguages;
  NSString *v17;
  NSString *markedText;
  objc_super v20;

  v4 = a3;
  v5 = v4;
  if (v4 && (uint64 = xpc_dictionary_get_uint64(v4, "qid")) != 0)
  {
    v7 = uint64;
    v20.receiver = self;
    v20.super_class = (Class)CSSearchContext;
    v8 = -[CSSearchContext init](&v20, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_queryID = v7;
      v10 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "uq", v5);
      userQuery = v9->_userQuery;
      v9->_userQuery = v10;

      v9->_maxItemsCount = xpc_dictionary_get_uint64(v5, "mc");
      v12 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "kl", v5);
      keyboardLanguage = v9->_keyboardLanguage;
      v9->_keyboardLanguage = v12;

      xpc_dictionary_get_value(v5, "pl");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v14);
      preferredLanguages = v9->_preferredLanguages;
      v9->_preferredLanguages = v15;

      v17 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "mt", v5);
      markedText = v9->_markedText;
      v9->_markedText = v17;

      if (v9->_markedText)
        v9->_markedTextStart = xpc_dictionary_get_uint64(v5, "mts");
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CSSearchContext initWithQueryID:userQuery:maxItemsCount:keyboardLanguage:preferredLanguages:markedText:markedTextStart:]([CSSearchContext alloc], "initWithQueryID:userQuery:maxItemsCount:keyboardLanguage:preferredLanguages:markedText:markedTextStart:", self->_queryID, self->_userQuery, self->_maxItemsCount, self->_keyboardLanguage, self->_preferredLanguages, self->_markedText, self->_markedTextStart);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t queryID;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    queryID = self->_queryID;
    v6 = queryID == objc_msgSend(v4, "queryID");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_queryID;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %llu <%@>"), objc_opt_class(), self, self->_queryID, self->_userQuery);
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (NSString)userQuery
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)maxItemsCount
{
  return self->_maxItemsCount;
}

- (NSString)keyboardLanguage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)markedText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)markedTextStart
{
  return self->_markedTextStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
}

@end
