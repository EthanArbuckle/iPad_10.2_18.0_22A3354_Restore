@implementation ADRoutingInfoMessage

- (NSString)payload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  -[ADRoutingInfoMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2) & 1) != 0)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, &v15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v15)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@] RoutingInfo dictionary failed to serialize"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("iAdServerRequestLogging"), v8, 16);

      v9 = CFSTR("{}");
    }
    else
    {
      objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@] RoutingInfo dictionary isn't a valid dictionary"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdServerRequestLogging"), v13, 16);

    v9 = CFSTR("{}");
  }

  return (NSString *)v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  if ((MGGetBoolAnswer() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADRoutingInfoMessage environmentURL](self, "environmentURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("environmentUrl"));
    v5 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSString)environmentURL
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  v4 = -[ADRoutingInfoMessage routingInfoType](self, "routingInfoType");
  if (v4 == 1)
  {
    -[ADRoutingInfoMessage storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("GibraltarAdServerURL");
    goto LABEL_5;
  }
  if (!v4)
  {
    -[ADRoutingInfoMessage storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("ToroAdServerURL");
LABEL_5:
    objc_msgSend(v5, "stringForKey:", v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v2;
}

- (ADCorePreferencesStoring)storage
{
  return self->_storage;
}

- (unint64_t)routingInfoType
{
  return self->_routingInfoType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (ADRoutingInfoMessage)initWithRoutingType:(unint64_t)a3 preferencesStore:(id)a4
{
  id v7;
  ADRoutingInfoMessage *v8;
  ADRoutingInfoMessage *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ADRoutingInfoMessage;
  v8 = -[ADRoutingInfoMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_routingInfoType = a3;
    objc_storeStrong((id *)&v8->_storage, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ADRoutingInfoMessage;
  -[ADRoutingInfoMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADRoutingInfoMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRoutingInfoType:(unint64_t)a3
{
  self->_routingInfoType = a3;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

@end
