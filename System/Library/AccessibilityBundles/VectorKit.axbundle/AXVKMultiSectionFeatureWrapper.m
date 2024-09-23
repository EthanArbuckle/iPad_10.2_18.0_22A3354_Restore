@implementation AXVKMultiSectionFeatureWrapper

- (AXVKMultiSectionFeatureWrapper)initWithFeature:(id)a3
{
  id v4;
  AXVKMultiSectionFeatureWrapper *v5;
  uint64_t v6;
  GEOMultiSectionFeature *feature;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXVKMultiSectionFeatureWrapper;
  v5 = -[AXVKMultiSectionFeatureWrapper init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      GEOMultiSectionFeatureRetain();
      v6 = objc_claimAutoreleasedReturnValue();
      feature = v5->_feature;
      v5->_feature = (GEOMultiSectionFeature *)v6;

    }
    v5->_creationTime = CFAbsoluteTimeGetCurrent();
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_feature)
    GEOMultiSectionFeatureRelease();
  v3.receiver = self;
  v3.super_class = (Class)AXVKMultiSectionFeatureWrapper;
  -[AXVKMultiSectionFeatureWrapper dealloc](&v3, sel_dealloc);
}

- (void)setFeature:(id)a3
{
  GEOMultiSectionFeature *v4;
  GEOMultiSectionFeature *feature;
  GEOMultiSectionFeature *v6;
  GEOMultiSectionFeature *v7;
  GEOMultiSectionFeature *v8;

  v4 = (GEOMultiSectionFeature *)a3;
  feature = self->_feature;
  if (feature != v4)
  {
    v8 = v4;
    if (feature)
      GEOMultiSectionFeatureRelease();
    v6 = v8;
    if (v8)
    {
      GEOMultiSectionFeatureRetain();
      v6 = (GEOMultiSectionFeature *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_feature;
    self->_feature = v6;

    v4 = v8;
  }

}

- (GEOMultiSectionFeature)feature
{
  return self->_feature;
}

- (id)featureName
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[GEOMultiSectionFeature feature](self->_feature, "feature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "name");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Unknown");
  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXVKMultiSectionFeatureWrapper featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AXVKMultiSectionFeatureWrapper *v4;
  AXVKMultiSectionFeatureWrapper *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (AXVKMultiSectionFeatureWrapper *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXVKMultiSectionFeatureWrapper feature](self, "feature");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXVKMultiSectionFeatureWrapper feature](v5, "feature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = AXVKMultiSectionFeatureEqualToMultiSectionFeature(v6, v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_creationTime
                          + (double)(unint64_t)(53 * AXVKMultiSectionFeatureHash(self->_feature) + 2809));
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
