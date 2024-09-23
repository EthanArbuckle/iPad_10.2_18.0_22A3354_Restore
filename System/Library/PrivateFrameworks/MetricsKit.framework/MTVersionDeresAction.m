@implementation MTVersionDeresAction

- (MTVersionDeresAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6;
  MTVersionDeresAction *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTVersionDeresAction;
  v7 = -[MTTreatmentAction initWithField:configDictionary:](&v11, sel_initWithField_configDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("precision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v8, "length"))
    {
      v9 = objc_msgSend(v8, "integerValue");
    }
    else
    {
      v9 = -1;
    }
    -[MTVersionDeresAction setPrecision:](v7, "setPrecision:", v9);

  }
  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTVersionDeresAction;
  -[MTTreatmentAction performAction:context:](&v10, sel_performAction_context_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") <= self->_precision)
    {
      v8 = v5;
    }
    else
    {
      objc_msgSend(v6, "subarrayWithRange:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v7;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(unint64_t)a3
{
  self->_precision = a3;
}

@end
