@implementation INPaymentMethod

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[INPaymentMethod name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INPaymentMethod name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
  }
  else
  {
    INPaymentMethodTypeGetLocalizedName(-[INPaymentMethod type](self, "type"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_intents_localizedCopyWithLocalizer:(id)a3
{
  id v4;
  id v5;
  INPaymentMethodType v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[INPaymentMethod type](self, "type");
  -[INPaymentMethod name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizeForLanguage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPaymentMethod identificationHint](self, "identificationHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPaymentMethod icon](self, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithType:name:identificationHint:icon:", v6, v9, v10, v11);

  return v12;
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  char v15;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v12 = v8;

    objc_msgSend(v12, "name");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v11 = (void *)v13;

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v12 = v10;

    objc_msgSend(v12, "if_flatMap:", &__block_literal_global_20687);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:
  -[INPaymentMethod name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_intents_compareValue:relation:", v11, a4);

  return v15;
}

id __87__INPaymentMethod_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_arrayWithObjectIfNonNil:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD *);
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = (void (**)(id, void *, _QWORD *))a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INPaymentMethod copy](self, "copy");
    -[INPaymentMethod icon](self, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __77__INPaymentMethod_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E2292618;
      v10[4] = v8;
      v11 = v7;
      v6[2](v6, v9, v10);

    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }

  }
}

uint64_t __77__INPaymentMethod_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setIcon:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INPaymentMethod icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INPaymentMethod icon](self, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[INPaymentMethod icon](self, "icon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[INPaymentMethod icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cacheableObjectForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[INPaymentMethod icon](self, "icon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cacheableObjectForIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[INPaymentMethod icon](self, "icon");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_imageSize");
        objc_msgSend(v12, "_setImageSize:");

      }
    }
  }

}

- (INPaymentMethod)initWithType:(INPaymentMethodType)type name:(NSString *)name identificationHint:(NSString *)identificationHint icon:(INImage *)icon
{
  NSString *v10;
  NSString *v11;
  INImage *v12;
  INPaymentMethod *v13;
  INPaymentMethod *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  INImage *v18;
  uint64_t v19;
  NSString *v20;
  objc_super v22;

  v10 = name;
  v11 = identificationHint;
  v12 = icon;
  v22.receiver = self;
  v22.super_class = (Class)INPaymentMethod;
  v13 = -[INPaymentMethod init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = type;
    v15 = -[NSString copy](v10, "copy");
    v16 = v14->_name;
    v14->_name = (NSString *)v15;

    v17 = -[INImage copy](v12, "copy");
    v18 = v14->_icon;
    v14->_icon = (INImage *)v17;

    v19 = -[NSString copy](v11, "copy");
    v20 = v14->_identificationHint;
    v14->_identificationHint = (NSString *)v19;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_name, "hash");
  v6 = v5 ^ -[INImage hash](self->_icon, "hash");
  v7 = v6 ^ -[NSString hash](self->_identificationHint, "hash") ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INPaymentMethod *v4;
  INPaymentMethod *v5;
  NSString *name;
  INImage *icon;
  NSString *identificationHint;
  BOOL v9;

  v4 = (INPaymentMethod *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = 0;
      if (self->_type == v5->_type)
      {
        name = self->_name;
        if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
        {
          icon = self->_icon;
          if (icon == v5->_icon || -[INImage isEqual:](icon, "isEqual:"))
          {
            identificationHint = self->_identificationHint;
            if (identificationHint == v5->_identificationHint
              || -[NSString isEqual:](identificationHint, "isEqual:"))
            {
              v9 = 1;
            }
          }
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INPaymentMethod)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INPaymentMethod *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("identificationHint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INPaymentMethod initWithType:name:identificationHint:icon:](self, "initWithType:name:identificationHint:icon:", v5, v9, v14, v10);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identificationHint, CFSTR("identificationHint"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_type - 1;
  if (v8 > 7)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E228CC88[v8];
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:", self->_name);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("name"));

  objc_msgSend(v6, "encodeObject:", self->_icon);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("icon"));

  objc_msgSend(v6, "encodeObject:", self->_identificationHint);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("identificationHint"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPaymentMethod descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INPaymentMethod;
  -[INPaymentMethod description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPaymentMethod _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *name;
  void *v5;
  INImage *icon;
  void *v7;
  NSString *identificationHint;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("name");
  name = self->_name;
  v5 = name;
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v5;
  v12[2] = CFSTR("icon");
  icon = self->_icon;
  v7 = icon;
  if (!icon)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v7;
  v12[3] = CFSTR("identificationHint");
  identificationHint = self->_identificationHint;
  v9 = identificationHint;
  if (!identificationHint)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (identificationHint)
  {
    if (icon)
      goto LABEL_9;
LABEL_12:

    if (name)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!icon)
    goto LABEL_12;
LABEL_9:
  if (!name)
    goto LABEL_13;
LABEL_10:

  return v10;
}

- (INPaymentMethodType)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (INImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identificationHint
{
  return self->_identificationHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identificationHint, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (INPaymentMethod)applePayPaymentMethod
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__INPaymentMethod_applePayPaymentMethod__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applePayPaymentMethod_onceToken != -1)
    dispatch_once(&applePayPaymentMethod_onceToken, block);
  return (INPaymentMethod *)(id)applePayPaymentMethod_me;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INPaymentMethodTypeWithString(v9);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("icon"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identificationHint"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:identificationHint:icon:", v10, v11, v15, v14);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __40__INPaymentMethod_applePayPaymentMethod__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithType:name:identificationHint:icon:", 8, 0, 0, 0);
  v2 = (void *)applePayPaymentMethod_me;
  applePayPaymentMethod_me = v1;

}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

@end
