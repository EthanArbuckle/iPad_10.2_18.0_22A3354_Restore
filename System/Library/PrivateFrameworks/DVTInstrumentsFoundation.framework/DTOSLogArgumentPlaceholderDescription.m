@implementation DTOSLogArgumentPlaceholderDescription

- (DTOSLogArgumentPlaceholderDescription)initWithPlaceholderToken:(id)a3
{
  id v5;
  DTOSLogArgumentPlaceholderDescription *v6;
  void *v7;
  NSString *v8;
  id v9;
  void *placeholderObjectValue;
  NSString *v11;
  void *v12;
  NSString *placeholderKey;
  NSString *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSString *v25;
  NSString *v26;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DTOSLogArgumentPlaceholderDescription;
  v6 = -[DTOSLogArgumentPlaceholderDescription init](&v28, sel_init);
  objc_storeStrong((id *)&v6->_placeholderToken, a3);
  -[NSString componentsSeparatedByString:](v6->_placeholderToken, "componentsSeparatedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    v6->_placeholderKind = 0;
    placeholderKey = v6->_placeholderKey;
    v6->_placeholderKey = (NSString *)&stru_24EB2CF78;

    v14 = (NSString *)v5;
LABEL_13:
    placeholderObjectValue = v6->_placeholderObjectValue;
    v6->_placeholderObjectValue = v14;
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    v8 = v6->_placeholderKey;
    v6->_placeholderKey = (NSString *)CFSTR("builtin");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (qword_25576FA78 != -1)
      dispatch_once(&qword_25576FA78, &unk_24EB292A8);
    objc_msgSend((id)qword_25576FA70, "objectForKeyedSubscript:", v9);
    placeholderObjectValue = (void *)objc_claimAutoreleasedReturnValue();

    if (placeholderObjectValue)
    {
      v6->_placeholderKind = 1;
      v11 = placeholderObjectValue;
      v12 = v6->_placeholderObjectValue;
      v6->_placeholderObjectValue = v11;
    }
    else
    {
      -[NSString componentsSeparatedByString:](v6->_placeholderToken, "componentsSeparatedByString:", CFSTR("="));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count") == 2
        && (objc_msgSend(v12, "objectAtIndexedSubscript:", 0),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("name")),
            v20,
            v21))
      {
        v6->_placeholderKind = 2;
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6->_placeholderKind = 0;
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v26 = v6->_placeholderObjectValue;
      v6->_placeholderObjectValue = (NSString *)v22;

    }
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "count") != 2)
  {
    v6->_placeholderKind = 0;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v6->_placeholderKey;
    v6->_placeholderKey = (NSString *)v18;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  placeholderObjectValue = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(placeholderObjectValue, "isEqualToString:", CFSTR("xcode"))
    && (objc_msgSend(v7, "objectAtIndexedSubscript:", 1),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = XREngineeringTypeIDForMnemonic(),
        v15,
        v16))
  {
    v6->_placeholderKind = 1;
    objc_storeStrong((id *)&v6->_placeholderKey, placeholderObjectValue);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_msgSend(placeholderObjectValue, "isEqualToString:", CFSTR("name"));
    v24 = 2;
    if (!v23)
      v24 = 0;
    v6->_placeholderKind = v24;
    objc_storeStrong((id *)&v6->_placeholderKey, placeholderObjectValue);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v25 = v6->_placeholderObjectValue;
  v6->_placeholderObjectValue = (NSString *)v17;

LABEL_24:
  return v6;
}

- (unint64_t)hash
{
  return MEMORY[0x24BEDD108](self->_placeholderToken, sel_hash);
}

- (int64_t)placeholderKind
{
  return self->_placeholderKind;
}

- (NSString)placeholderToken
{
  return self->_placeholderToken;
}

- (NSString)placeholderKey
{
  return self->_placeholderKey;
}

- (NSString)placeholderObjectValue
{
  return self->_placeholderObjectValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderObjectValue, 0);
  objc_storeStrong((id *)&self->_placeholderKey, 0);
  objc_storeStrong((id *)&self->_placeholderToken, 0);
}

@end
