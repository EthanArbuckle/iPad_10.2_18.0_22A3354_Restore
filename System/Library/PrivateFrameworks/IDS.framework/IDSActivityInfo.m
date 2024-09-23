@implementation IDSActivityInfo

+ (id)activityInfoWithSubActivity:(id)a3 tokens:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_initWithSubActivity:", v6);
      if (v9)
      {
        v10 = objc_msgSend(v8, "copy");
        v11 = (void *)v9[5];
        v9[5] = v10;

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)activityInfoWithSubActivity:(id)a3 URIs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_initWithSubActivity:", v6);
      if (v9)
      {
        v10 = objc_msgSend(v8, "copy");
        v11 = (void *)v9[6];
        v9[6] = v10;

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)activityInfoWithSubActivity:(id)a3 devices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_initWithSubActivity:", v6);
      if (v9)
      {
        objc_msgSend(v8, "__imArrayByApplyingBlock:", &unk_1E2C5F850);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v9[4];
        v9[4] = v10;

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)_initWithSubActivity:(id)a3
{
  id v5;
  IDSActivityInfo *v6;
  id *p_isa;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  double v17;
  id *v18;
  NSObject *v19;
  id v20;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IDSActivityInfo;
  v6 = -[IDSActivityInfo init](&v22, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (!v6)
    goto LABEL_7;
  objc_storeStrong((id *)&v6->_subActivity, a3);
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("presence-subscription-ttl-sec"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 3888000);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setSecond:", objc_msgSend(v11, "unsignedLongValue"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v13, v12, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = p_isa[2];
  p_isa[2] = (id)v15;

  objc_msgSend(p_isa[2], "timeIntervalSinceNow");
  if (v17 >= 0.0)
  {

LABEL_7:
    v18 = p_isa;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = p_isa[2];
    *(_DWORD *)buf = 138412290;
    v24 = v20;
    _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Expiration dates in the past are not allowed: %@", buf, 0xCu);
  }

  v18 = 0;
LABEL_11:

  return v18;
}

- (id)description
{
  NSArray *tokens;
  __CFString *v4;
  void *v5;

  tokens = self->_tokens;
  if (tokens)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" tokens: %@"), tokens);
  }
  else if (self->_URIs)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" URIs: %@"), self->_URIs);
  }
  else
  {
    if (!self->_deviceUniqueIDs)
    {
      v4 = &stru_1E2C65AE8;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" deviceUniqueIDs: %@"), self->_deviceUniqueIDs);
  }
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; subactivity: %@ expirationDate: %@%@>"),
    objc_opt_class(),
    self,
    self->_subActivity,
    self->_expirationDate,
    v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subActivity;
  id v5;

  subActivity = self->_subActivity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subActivity, CFSTR("subActivity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appContext, CFSTR("appcontext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUniqueIDs, CFSTR("deviceids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokens, CFSTR("tokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_URIs, CFSTR("uris"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (IDSActivityInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  IDSActivityInfo *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subActivity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appcontext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("deviceids"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("tokens"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("uris"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[IDSActivityInfo _initWithSubActivity:](self, "_initWithSubActivity:", v5);
  v21 = (IDSActivityInfo *)v20;
  if (v20)
  {
    objc_storeStrong(v20 + 3, v6);
    objc_storeStrong((id *)&v21->_deviceUniqueIDs, v10);
    objc_storeStrong((id *)&v21->_tokens, v14);
    objc_storeStrong((id *)&v21->_URIs, v18);
    objc_storeStrong((id *)&v21->_expirationDate, v19);
  }

  return v21;
}

- (BOOL)isIdentical:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "tokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSActivityInfo tokens](self, "tokens");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v4, "URIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "URIs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSActivityInfo URIs](self, "URIs");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v7;
    v10 = objc_msgSend(v6, "isEqual:", v7);

    if ((v10 & 1) != 0)
    {
LABEL_6:
      objc_msgSend(v4, "subActivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSActivityInfo subActivity](self, "subActivity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v11, "isEqualToString:", v12);

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "deviceUniqueIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_10;
  objc_msgSend(v4, "deviceUniqueIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSActivityInfo deviceUniqueIDs](self, "deviceUniqueIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
    goto LABEL_6;
LABEL_9:
  LODWORD(v13) = 0;
LABEL_10:
  objc_msgSend(v4, "appContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = 0;
  else
    v18 = (char)v13;
  if (v17 && (_DWORD)v13)
  {
    objc_msgSend(v4, "appContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSActivityInfo appContext](self, "appContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "isEqualToData:", v20);

  }
  return v18;
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSData)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)deviceUniqueIDs
{
  return self->_deviceUniqueIDs;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSArray)URIs
{
  return self->_URIs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URIs, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_deviceUniqueIDs, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_subActivity, 0);
}

@end
