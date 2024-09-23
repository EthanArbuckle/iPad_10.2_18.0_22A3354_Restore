@implementation AXShotflowConfiguration

- (AXShotflowConfiguration)initWithURL:(id)a3
{
  id v4;
  AXShotflowConfiguration *v5;
  void *v6;
  NSArray *filterThresholds;
  NSNumber *networkThreshold;
  NSNumber *nmsThreshold;
  NSArray *defaultBoxesSidesNormalized;
  NSArray *ratios;
  void *v12;
  void *v13;
  uint64_t isKindOfClass;
  _BOOL8 v15;
  AXShotflowConfiguration *v16;
  id v18;
  id v19;
  id obj;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AXShotflowConfiguration;
  v5 = -[AXShotflowConfiguration init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    filterThresholds = v5->_filterThresholds;
    v5->_filterThresholds = (NSArray *)&unk_1E6289608;

    networkThreshold = v5->_networkThreshold;
    v5->_networkThreshold = (NSNumber *)&unk_1E6288C88;

    nmsThreshold = v5->_nmsThreshold;
    v5->_nmsThreshold = (NSNumber *)&unk_1E6288C58;

    defaultBoxesSidesNormalized = v5->_defaultBoxesSidesNormalized;
    v5->_defaultBoxesSidesNormalized = (NSArray *)&unk_1E6289620;

    ratios = v5->_ratios;
    v5->_ratios = (NSArray *)&unk_1E6289638;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("filterThresholds"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("networkThreshold"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("nmsThreshold"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("defaultBoxesSidesNormalized"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("ratios"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (__38__AXMindNetConfiguration_initWithURL___block_invoke((uint64_t)v13, v12))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
          {
            v15 = __38__AXMindNetConfiguration_initWithURL___block_invoke(isKindOfClass, v18);
            if (v15 && __38__AXMindNetConfiguration_initWithURL___block_invoke(v15, v13))
            {
              objc_storeStrong((id *)&v5->_filterThresholds, v12);
              objc_storeStrong((id *)&v5->_networkThreshold, obj);
              objc_storeStrong((id *)&v5->_nmsThreshold, v19);
              objc_storeStrong((id *)&v5->_defaultBoxesSidesNormalized, v18);
              objc_storeStrong((id *)&v5->_ratios, v13);
            }
          }
        }
      }

    }
    v16 = v5;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filterThresholds: %@\nnetworkThreshold: %@\nnmsThreshold: %@\ndefaultBoxesSidesNormalized: %@\nratios: %@"), self->_filterThresholds, self->_networkThreshold, self->_nmsThreshold, self->_defaultBoxesSidesNormalized, self->_ratios);
}

- (NSArray)filterThresholds
{
  return self->_filterThresholds;
}

- (NSNumber)networkThreshold
{
  return self->_networkThreshold;
}

- (NSNumber)nmsThreshold
{
  return self->_nmsThreshold;
}

- (NSArray)defaultBoxesSidesNormalized
{
  return self->_defaultBoxesSidesNormalized;
}

- (NSArray)ratios
{
  return self->_ratios;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratios, 0);
  objc_storeStrong((id *)&self->_defaultBoxesSidesNormalized, 0);
  objc_storeStrong((id *)&self->_nmsThreshold, 0);
  objc_storeStrong((id *)&self->_networkThreshold, 0);
  objc_storeStrong((id *)&self->_filterThresholds, 0);
}

@end
