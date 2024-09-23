@implementation SUUIMediaQuerySizeFeature

- (SUUIMediaQuerySizeFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v6;
  SUUIMediaQuerySizeFeature *v7;
  float v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SUUIMediaQuerySizeFeature;
  v7 = -[SUUIMediaQueryFeature initWithFeatureName:value:](&v10, sel_initWithFeatureName_value_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "floatValue");
    v7->_value = v8;
  }

  return v7;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("min-width")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("max-width")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("min-height")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("max-height")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("width")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("height"));
  }

  return v4;
}

- (BOOL)evaluateWithValues:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  float v8;
  BOOL v9;
  __CFString *v10;
  float v11;
  __CFString *v12;

  v4 = a3;
  -[SUUIMediaQueryFeature featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("min-width")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("max-width")))
    {
      v10 = CFSTR("width");
LABEL_6:
      objc_msgSend(v4, "objectForKey:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v9 = self->_value >= v11;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("width")))
    {
      v12 = CFSTR("width");
    }
    else
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("min-height")))
      {
        v6 = CFSTR("height");
        goto LABEL_3;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("max-height")))
      {
        v10 = CFSTR("height");
        goto LABEL_6;
      }
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("height")))
      {
        v9 = 0;
        goto LABEL_11;
      }
      v12 = CFSTR("height");
    }
    objc_msgSend(v4, "objectForKey:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "longValue") == (uint64_t)self->_value;
    goto LABEL_10;
  }
  v6 = CFSTR("width");
LABEL_3:
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = self->_value <= v8;
LABEL_10:

LABEL_11:
  return v9;
}

- (id)requiredKeys
{
  void *v2;
  __CFString **v3;
  void *v4;
  __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[SUUIMediaQueryFeature featureName](self, "featureName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("min-width")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("max-width")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("width")))
  {
    v7[0] = 0x2511FEE08;
    v3 = (__CFString **)v7;
  }
  else
  {
    v6 = CFSTR("height");
    v3 = &v6;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SUUIMediaQuerySizeFeature;
  -[SUUIMediaQuerySizeFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMediaQueryFeature featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@, %.0f]"), v4, v5, *(_QWORD *)&self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
