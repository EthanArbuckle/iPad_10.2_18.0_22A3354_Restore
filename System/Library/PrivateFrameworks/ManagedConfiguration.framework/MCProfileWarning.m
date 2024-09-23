@implementation MCProfileWarning

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MCProfileWarning)initWithLocalizedTitle:(id)a3 localizedBody:(id)a4 isLongForm:(BOOL)a5
{
  id v9;
  id v10;
  MCProfileWarning *v11;
  MCProfileWarning *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCProfileWarning;
  v11 = -[MCProfileWarning init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_localizedTitle, a3);
    objc_storeStrong((id *)&v12->_localizedBody, a4);
    v12->_isLongForm = a5;
  }

  return v12;
}

+ (id)warningWithLocalizedTitle:(id)a3 localizedBody:(id)a4 isLongForm:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocalizedTitle:localizedBody:isLongForm:", v9, v8, v5);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedTitle;
  id v5;

  localizedTitle = self->_localizedTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedBody, CFSTR("localizedBody"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLongForm, CFSTR("isLongForm"));

}

- (MCProfileWarning)initWithCoder:(id)a3
{
  id v4;
  MCProfileWarning *v5;
  uint64_t v6;
  NSString *localizedTitle;
  uint64_t v8;
  NSString *localizedBody;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCProfileWarning;
  v5 = -[MCProfileWarning init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedBody"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedBody = v5->_localizedBody;
    v5->_localizedBody = (NSString *)v8;

    v5->_isLongForm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLongForm"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MCProfileWarning *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = (MCProfileWarning *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[MCProfileWarning isEqualToProfileWarning:](self, "isEqualToProfileWarning:", v4);
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)MCProfileWarning;
      v5 = -[MCProfileWarning isEqual:](&v8, sel_isEqual_, v4);
    }
    v6 = v5;
  }

  return v6;
}

- (BOOL)isEqualToProfileWarning:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MCProfileWarning localizedTitle](self, "localizedTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[MCProfileWarning localizedTitle](self, "localizedTitle"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "localizedTitle"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToString:", v4)))
      {
        -[MCProfileWarning localizedBody](self, "localizedBody");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedBody");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 == (void *)v11)
        {

          v9 = 1;
        }
        else
        {
          v12 = (void *)v11;
          -[MCProfileWarning localizedBody](self, "localizedBody");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localizedBody");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v13, "isEqualToString:", v14);

        }
        if (v7 == v8)
          goto LABEL_12;
      }
      else
      {
        v9 = 0;
      }

LABEL_12:
      goto LABEL_13;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_localizedTitle, "hash");
  return -[NSString hash](self->_localizedBody, "hash") ^ v3;
}

- (id)serializedDictionary
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedTitle, CFSTR("Title"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedBody, CFSTR("Body"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLongForm);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Long Form"));

  return v3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localizedBody
{
  return self->_localizedBody;
}

- (void)setLocalizedBody:(id)a3
{
  objc_storeStrong((id *)&self->_localizedBody, a3);
}

- (BOOL)isLongForm
{
  return self->_isLongForm;
}

- (void)setIsLongForm:(BOOL)a3
{
  self->_isLongForm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedBody, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
