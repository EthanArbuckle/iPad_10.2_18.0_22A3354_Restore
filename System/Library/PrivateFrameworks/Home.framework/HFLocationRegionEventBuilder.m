@implementation HFLocationRegionEventBuilder

- (HFLocationRegionEventBuilder)initWithEvent:(id)a3
{
  id v4;
  HFLocationRegionEventBuilder *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFLocationRegionEventBuilder;
  v5 = -[HFEventBuilder initWithEvent:](&v10, sel_initWithEvent_, v4);
  if (v5)
  {
    objc_msgSend(v4, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "region");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFLocationRegionEventBuilder setRegion:](v5, "setRegion:", v8);

    }
  }

  return v5;
}

- (unint64_t)locationEventType
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x1E0CBA5E8];
  -[HFLocationRegionEventBuilder region](self, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_locationEventTypeForRegion:", v3);

  return v4;
}

- (id)buildNewEventsFromCurrentState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFLocationRegionEventBuilder region](self, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_alloc(MEMORY[0x1E0CBA5E8]);
    -[HFLocationRegionEventBuilder region](self, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithRegion:", v6);
    objc_msgSend(v4, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)isRegionAtHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[HFLocationRegionEventBuilder region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CBA5E8];
    -[HFLocationRegionEventBuilder region](self, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hf_isRegion:atHome:", v7, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLocationRegionEventBuilder region](self, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("region"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)eventType
{
  return CFSTR("HFEventTypeLocation");
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CBA4D0];
  v5 = a3;
  -[HFLocationRegionEventBuilder region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationEventUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:region:forUser:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)comparisonKey
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)HFLocationRegionEventBuilder;
  -[HFEventBuilder comparisonKey](&v15, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFLocationRegionEventBuilder region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  -[HFLocationRegionEventBuilder region](self, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v10 = v9;
  -[HFLocationRegionEventBuilder region](self, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "radius");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%f,%f:%f"), v4, v7, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFLocationRegionEventBuilder;
  -[HFEventBuilder compareToObject:](&v9, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__HFLocationRegionEventBuilder_Comparison__compareToObject___block_invoke;
    v7[3] = &unk_1EA72C9C0;
    v7[4] = self;
    v8 = v4;

  }
  return v5;
}

BOOL __60__HFLocationRegionEventBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;

  objc_msgSend(*(id *)(a1 + 32), "region");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  if (v4 == v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "center");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "region");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "center");
    if (v9 == v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "region");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "radius");
      v15 = v14;
      objc_msgSend(*(id *)(a1 + 40), "region");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "radius");
      v12 = v15 != v17;

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

@end
