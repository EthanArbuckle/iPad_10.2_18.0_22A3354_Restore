@implementation GTUnsupportedFenumInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTUnsupportedFenumInfo)initWithFenum:(id)a3 category:(id)a4 customMessage:(id)a5 customRecoverySuggestion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GTUnsupportedFenumInfo *v15;
  GTUnsupportedFenumInfo *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GTUnsupportedFenumInfo;
  v15 = -[GTUnsupportedFenumInfo init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fenum, a3);
    objc_storeStrong((id *)&v16->_category, a4);
    objc_storeStrong((id *)&v16->_customMessage, a5);
    objc_storeStrong((id *)&v16->_customRecoverySuggestion, a6);
  }

  return v16;
}

- (GTUnsupportedFenumInfo)initWithCoder:(id)a3
{
  id v4;
  GTUnsupportedFenumInfo *v5;
  uint64_t v6;
  NSString *fenum;
  uint64_t v8;
  NSString *category;
  uint64_t v10;
  NSString *customMessage;
  uint64_t v12;
  NSString *customRecoverySuggestion;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GTUnsupportedFenumInfo;
  v5 = -[GTUnsupportedFenumInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fenum"));
    v6 = objc_claimAutoreleasedReturnValue();
    fenum = v5->_fenum;
    v5->_fenum = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v8 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customMessage"));
    v10 = objc_claimAutoreleasedReturnValue();
    customMessage = v5->_customMessage;
    v5->_customMessage = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customRecoverySuggestion"));
    v12 = objc_claimAutoreleasedReturnValue();
    customRecoverySuggestion = v5->_customRecoverySuggestion;
    v5->_customRecoverySuggestion = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fenum;
  id v5;

  fenum = self->_fenum;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fenum, CFSTR("fenum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customMessage, CFSTR("customMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customRecoverySuggestion, CFSTR("customRecoverySuggestion"));

}

- (id)asError
{
  NSString *fenum;
  void *v4;
  NSString *category;
  NSString *v6;
  NSString *customMessage;
  NSString *v8;
  NSString *customRecoverySuggestion;
  __CFString *v10;
  id v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  void *v22;

  if (-[NSString isEqualToString:](self->_fenum, "isEqualToString:", &stru_24F828350))
    fenum = 0;
  else
    fenum = self->_fenum;
  PrettifyFenumString(fenum, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](self->_category, "isEqualToString:", &stru_24F828350))
    category = 0;
  else
    category = self->_category;
  v6 = category;
  if (-[NSString isEqualToString:](self->_customMessage, "isEqualToString:", &stru_24F828350))
    customMessage = 0;
  else
    customMessage = self->_customMessage;
  v8 = customMessage;
  if (-[NSString isEqualToString:](self->_customRecoverySuggestion, "isEqualToString:", &stru_24F828350))
    customRecoverySuggestion = 0;
  else
    customRecoverySuggestion = self->_customRecoverySuggestion;
  v10 = customRecoverySuggestion;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v11;
  v13 = (uint64_t *)MEMORY[0x24BDD0FD8];
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Capturing %@ is not supported."), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x24BDD0FC8]);

    if (!v4)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported method: %@"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *v13;
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(v11, "setObject:forKey:", CFSTR("Capturing disabled. Unsupported API usage."), *MEMORY[0x24BDD0FC8]);
      if (v8)
        goto LABEL_20;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Capturing %@ is not supported."), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDD0FC8];
  }
  objc_msgSend(v12, "setObject:forKey:", v15, v16);

LABEL_19:
  if (v8)
  {
LABEL_20:
    v17 = *v13;
    objc_msgSend(v12, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("\n\n%@"), v8);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = v8;
    }
    v21 = v20;
    objc_msgSend(v12, "setObject:forKey:", v20, v17);

  }
LABEL_24:
  if (!v10)
    v10 = CFSTR("To enable capturing, disable calls to unsupported APIs and relaunch your application.");
  objc_msgSend(v12, "setObject:forKey:", v10, *MEMORY[0x24BDD0FF0]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.capture"), 1000, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)fenum
{
  return self->_fenum;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (NSString)customRecoverySuggestion
{
  return self->_customRecoverySuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRecoverySuggestion, 0);
  objc_storeStrong((id *)&self->_customMessage, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_fenum, 0);
}

@end
