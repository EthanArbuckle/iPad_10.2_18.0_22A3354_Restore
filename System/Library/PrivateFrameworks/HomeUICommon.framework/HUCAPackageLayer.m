@implementation HUCAPackageLayer

- (HUCAPackageLayer)initWithName:(id)a3 layer:(id)a4
{
  id v7;
  id v8;
  HUCAPackageLayer *v9;
  HUCAPackageLayer *v10;
  uint64_t v11;
  NSSet *tags;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCAPackageLayer;
  v9 = -[HUCAPackageLayer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_layer, a4);
    objc_msgSend((id)objc_opt_class(), "_tagsForName:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    tags = v10->_tags;
    v10->_tags = (NSSet *)v11;

  }
  return v10;
}

+ (id)_tagsForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v7 = 1;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_allTags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if (v10)
        objc_msgSend(v5, "addObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v6, "count"));
  }

  return v5;
}

- (void)applyModifiers:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[HUCAPackageLayer tags](self, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("color"));

  if (v5)
    -[HUCAPackageLayer _applyPrimaryColorWithModifiers:](self, "_applyPrimaryColorWithModifiers:", v6);

}

- (NSSet)tags
{
  return self->_tags;
}

+ (id)_allTags
{
  if (_MergedGlobals_5 != -1)
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_5);
  return (id)qword_25433F620;
}

void __28__HUCAPackageLayer__allTags__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("color");
  v4[1] = CFSTR("secondaryColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_25433F620;
  qword_25433F620 = v2;

}

- (void)_applyPrimaryColorWithModifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  -[HUCAPackageLayer layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[HUCAPackageLayer name](self, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCAPackageLayer layer](self, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v21;
      v27 = 2112;
      v28 = v24;
      _os_log_error_impl(&dword_23EB80000, v8, OS_LOG_TYPE_ERROR, "Package layer (%@) of type '%@' requested to modify primary color but isn't a valid CAShapeLayer", (uint8_t *)&v25, 0x16u);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE68]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE60]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v12 = 0;
  else
    v12 = v10 == 0;
  if (!v12 || v11 != 0)
  {
    v14 = 1.0;
    v15 = 1.0;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v15 = v16;
    }
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v14 = v17;
    }
    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      v19 = v18;
    }
    else
    {
      v19 = 1.0;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v15, v14, 1.0, v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setFillColor:", objc_msgSend(v20, "CGColor"));

  }
}

- (NSString)name
{
  return self->_name;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
