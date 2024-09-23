@implementation TDDeviceTraits

- (TDDeviceTraits)initWithPlatform:(int64_t)a3
{
  TDDeviceTraits *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TDDeviceTraits;
  result = -[TDDeviceTraits init](&v4, sel_init, a3);
  if (result)
    result->_deploymentTargetValue = 11;
  return result;
}

- (TDDeviceTraits)init
{
  return -[TDDeviceTraits initWithPlatform:](self, "initWithPlatform:", CUICurrentPlatform());
}

- (void)dealloc
{
  objc_super v3;

  -[TDDeviceTraits setHostedIdiomValues:](self, "setHostedIdiomValues:", 0);
  -[TDDeviceTraits setGraphicsFeatureSetFallbackValues:](self, "setGraphicsFeatureSetFallbackValues:", 0);
  -[TDDeviceTraits setSubtypeFallbackValues:](self, "setSubtypeFallbackValues:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDDeviceTraits;
  -[TDDeviceTraits dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TDDeviceTraits scale](self, "scale");
  objc_msgSend(v4, "setScale:");
  objc_msgSend(v4, "setIdiomValue:", -[TDDeviceTraits idiomValue](self, "idiomValue"));
  objc_msgSend(v4, "setHostedIdiomValues:", -[TDDeviceTraits hostedIdiomValues](self, "hostedIdiomValues"));
  objc_msgSend(v4, "setSubtype:", -[TDDeviceTraits subtype](self, "subtype"));
  objc_msgSend(v4, "setDisplayGamutValue:", -[TDDeviceTraits displayGamutValue](self, "displayGamutValue"));
  objc_msgSend(v4, "setDeploymentTargetValue:", -[TDDeviceTraits deploymentTargetValue](self, "deploymentTargetValue"));
  objc_msgSend(v4, "setMemoryPerformanceClass:", -[TDDeviceTraits memoryPerformanceClass](self, "memoryPerformanceClass"));
  objc_msgSend(v4, "setGraphicsFeatureSetClassValue:", -[TDDeviceTraits graphicsFeatureSetClassValue](self, "graphicsFeatureSetClassValue"));
  objc_msgSend(v4, "setGraphicsFeatureSetFallbackValues:", -[TDDeviceTraits graphicsFeatureSetFallbackValues](self, "graphicsFeatureSetFallbackValues"));
  objc_msgSend(v4, "setSubtypeFallbackValues:", -[TDDeviceTraits subtypeFallbackValues](self, "subtypeFallbackValues"));
  objc_msgSend(v4, "setDynamicDisplayModeValue:", -[TDDeviceTraits dynamicDisplayModeValue](self, "dynamicDisplayModeValue"));
  return v4;
}

- (id)description
{
  objc_class *v3;
  uint64_t v4;
  NSString *v6;
  void *v7;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v3);
  -[TDDeviceTraits scale](self, "scale");
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p scale:%f idiom:%d subtype:%d gamut:%d target:%d memPerclass:%d graphicsFeature:%d graphicsfallbackValues:%@ subtypefallbackValues:%@ displayMode:%d hostedIdioms:%@>"), v6, self, v4, -[TDDeviceTraits idiomValue](self, "idiomValue"), -[TDDeviceTraits subtype](self, "subtype"), -[TDDeviceTraits displayGamutValue](self, "displayGamutValue"), -[TDDeviceTraits deploymentTargetValue](self, "deploymentTargetValue"), -[TDDeviceTraits memoryPerformanceClass](self, "memoryPerformanceClass"), -[TDDeviceTraits graphicsFeatureSetClassValue](self, "graphicsFeatureSetClassValue"), -[TDDeviceTraits graphicsFeatureSetFallbackValues](self, "graphicsFeatureSetFallbackValues"), -[TDDeviceTraits subtypeFallbackValues](self, "subtypeFallbackValues"), -[TDDeviceTraits dynamicDisplayModeValue](self, "dynamicDisplayModeValue"), -[TDDeviceTraits hostedIdioms](self, "hostedIdioms"));
}

- (id)_idiomToTraitString:(int64_t)a3
{
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;

  v3 = *(_QWORD *)(MEMORY[0x24BE28D50] + 16);
  if (v3)
  {
    if (*MEMORY[0x24BE28D50] == a3)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    for (i = (uint64_t *)(MEMORY[0x24BE28D50] + 40); ; i += 3)
    {
      v3 = *i;
      if (!*i)
        break;
      v5 = *(i - 2);
      if (v5 == a3)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    }
  }
  return 0;
}

- (int64_t)_idiomFromTraitString:(id)a3
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  int64_t *v6;

  v3 = objc_msgSend(a3, "UTF8String");
  if (!v3)
    return -1;
  v4 = (const char *)v3;
  v5 = *(const char **)(MEMORY[0x24BE28D50] + 16);
  if (!v5)
  {
LABEL_6:
    if (!strcasecmp("reality", v4))
      return 8;
    return -1;
  }
  v6 = (int64_t *)MEMORY[0x24BE28D50];
  while (strcasecmp(v5, v4))
  {
    v5 = (const char *)v6[5];
    v6 += 3;
    if (!v5)
      goto LABEL_6;
  }
  return *v6;
}

- (void)setIdiom:(id)a3
{
  -[TDDeviceTraits setIdiomValue:](self, "setIdiomValue:", -[TDDeviceTraits _idiomFromTraitString:](self, "_idiomFromTraitString:", a3));
}

- (NSString)idiom
{
  return (NSString *)-[TDDeviceTraits _idiomToTraitString:](self, "_idiomToTraitString:", -[TDDeviceTraits idiom](self, "idiom"));
}

- (void)setHostedIdioms:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TDDeviceTraits _idiomFromTraitString:](self, "_idiomFromTraitString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++))));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[TDDeviceTraits setHostedIdiomValues:](self, "setHostedIdiomValues:", v5);

}

- (NSArray)hostedIdioms
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[TDDeviceTraits hostedIdiomValues](self, "hostedIdiomValues", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", -[TDDeviceTraits _idiomToTraitString:](self, "_idiomToTraitString:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "integerValue")));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (id)_graphicsFeatureSetClassToTraitString:(int64_t)a3
{
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;

  v3 = *(_QWORD *)(MEMORY[0x24BE28D40] + 16);
  if (v3)
  {
    if (*MEMORY[0x24BE28D40] == a3)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    for (i = (uint64_t *)(MEMORY[0x24BE28D40] + 40); ; i += 3)
    {
      v3 = *i;
      if (!*i)
        break;
      v5 = *(i - 2);
      if (v5 == a3)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    }
  }
  return 0;
}

- (int64_t)_graphicsFeatureSetClassFromTraitString:(id)a3
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  int64_t *v6;
  const char *v7;

  v3 = objc_msgSend(a3, "UTF8String");
  if (!v3)
    return -1;
  v4 = (const char *)v3;
  v5 = *(const char **)(MEMORY[0x24BE28D48] + 16);
  if (v5)
  {
    v6 = (int64_t *)MEMORY[0x24BE28D48];
    while (strcasecmp(v5, v4))
    {
      v5 = (const char *)v6[5];
      v6 += 3;
      if (!v5)
        goto LABEL_6;
    }
    return *v6;
  }
LABEL_6:
  v7 = *(const char **)(MEMORY[0x24BE28D40] + 16);
  if (!v7)
    return -1;
  v6 = (int64_t *)MEMORY[0x24BE28D40];
  while (strcasecmp(v7, v4))
  {
    v7 = (const char *)v6[5];
    v6 += 3;
    if (!v7)
      return -1;
  }
  return *v6;
}

- (void)setGraphicsFeatureSetClass:(id)a3
{
  -[TDDeviceTraits setGraphicsFeatureSetClassValue:](self, "setGraphicsFeatureSetClassValue:", -[TDDeviceTraits _graphicsFeatureSetClassFromTraitString:](self, "_graphicsFeatureSetClassFromTraitString:", a3));
}

- (NSString)graphicsFeatureSetClass
{
  return (NSString *)-[TDDeviceTraits _graphicsFeatureSetClassToTraitString:](self, "_graphicsFeatureSetClassToTraitString:", -[TDDeviceTraits graphicsFeatureSetClassValue](self, "graphicsFeatureSetClassValue"));
}

- (void)setGraphicsFeatureSetFallbacks:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TDDeviceTraits _graphicsFeatureSetClassFromTraitString:](self, "_graphicsFeatureSetClassFromTraitString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++))));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[TDDeviceTraits setGraphicsFeatureSetFallbackValues:](self, "setGraphicsFeatureSetFallbackValues:", v5);

}

- (NSArray)graphicsFeatureSetFallbacks
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[TDDeviceTraits graphicsFeatureSetFallbackValues](self, "graphicsFeatureSetFallbackValues", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", -[TDDeviceTraits _graphicsFeatureSetClassToTraitString:](self, "_graphicsFeatureSetClassToTraitString:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "integerValue")));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (id)_displayGamutToTraitString:(int64_t)a3
{
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;

  v3 = *(_QWORD *)(MEMORY[0x24BE28D20] + 16);
  if (v3)
  {
    if (*MEMORY[0x24BE28D20] == a3)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    for (i = (uint64_t *)(MEMORY[0x24BE28D20] + 40); ; i += 3)
    {
      v3 = *i;
      if (!*i)
        break;
      v5 = *(i - 2);
      if (v5 == a3)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    }
  }
  return 0;
}

- (int64_t)_displayGamutFromTraitString:(id)a3
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  int64_t *v6;

  v3 = objc_msgSend(a3, "UTF8String");
  if (!v3)
    return -1;
  v4 = (const char *)v3;
  v5 = *(const char **)(MEMORY[0x24BE28D20] + 16);
  if (!v5)
    return -1;
  v6 = (int64_t *)MEMORY[0x24BE28D20];
  while (strcasecmp(v5, v4))
  {
    v5 = (const char *)v6[5];
    v6 += 3;
    if (!v5)
      return -1;
  }
  return *v6;
}

- (void)setDisplayGamut:(id)a3
{
  -[TDDeviceTraits setDisplayGamutValue:](self, "setDisplayGamutValue:", -[TDDeviceTraits _displayGamutFromTraitString:](self, "_displayGamutFromTraitString:", a3));
}

- (NSString)displayGamut
{
  return (NSString *)-[TDDeviceTraits _displayGamutToTraitString:](self, "_displayGamutToTraitString:", -[TDDeviceTraits displayGamutValue](self, "displayGamutValue"));
}

- (id)_deploymentTargetToTraitString:(int64_t)a3
{
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;

  v3 = *(_QWORD *)(MEMORY[0x24BE28D10] + 16);
  if (v3)
  {
    if (*MEMORY[0x24BE28D10] == a3)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    for (i = (uint64_t *)(MEMORY[0x24BE28D10] + 40); ; i += 3)
    {
      v3 = *i;
      if (!*i)
        break;
      v5 = *(i - 2);
      if (v5 == a3)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    }
  }
  return 0;
}

- (int64_t)_deploymentTargetFromTraitString:(id)a3
{
  if (-[TDDeviceTraits idiomValue](self, "idiomValue") && -[TDDeviceTraits idiomValue](self, "idiomValue") != 6)
  {
    -[TDDeviceTraits idiomValue](self, "idiomValue");
  }
  else if (self->_platform == -1)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDDeviceTraits.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_platform != kCUIThemeSchemaPlatformUnknown"));
  }
  objc_msgSend(a3, "UTF8String");
  return (int)CUIParseDeploymentTarget();
}

- (void)setDeploymentTarget:(id)a3
{
  int64_t v4;

  v4 = -[TDDeviceTraits _deploymentTargetFromTraitString:](self, "_deploymentTargetFromTraitString:", a3);
  if ((v4 & 0x8000000000000000) == 0)
    -[TDDeviceTraits setDeploymentTargetValue:](self, "setDeploymentTargetValue:", v4);
}

- (NSString)deploymentTarget
{
  return (NSString *)-[TDDeviceTraits _deploymentTargetToTraitString:](self, "_deploymentTargetToTraitString:", -[TDDeviceTraits deploymentTargetValue](self, "deploymentTargetValue"));
}

- (id)_dynamicDisplayModeToTraitString:(int64_t)a3
{
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;

  v3 = *(_QWORD *)(MEMORY[0x24BE28D30] + 16);
  if (v3)
  {
    if (*MEMORY[0x24BE28D30] == a3)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    for (i = (uint64_t *)(MEMORY[0x24BE28D30] + 40); ; i += 3)
    {
      v3 = *i;
      if (!*i)
        break;
      v5 = *(i - 2);
      if (v5 == a3)
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    }
  }
  return 0;
}

- (int64_t)_dynamicDisplayModeFromTraitString:(id)a3
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  int64_t *v6;

  v3 = objc_msgSend(a3, "UTF8String");
  if (!v3)
    return -1;
  v4 = (const char *)v3;
  v5 = *(const char **)(MEMORY[0x24BE28D30] + 16);
  if (!v5)
    return -1;
  v6 = (int64_t *)MEMORY[0x24BE28D30];
  while (strcasecmp(v5, v4))
  {
    v5 = (const char *)v6[5];
    v6 += 3;
    if (!v5)
      return -1;
  }
  return *v6;
}

- (NSString)dynamicDisplayMode
{
  return (NSString *)-[TDDeviceTraits _dynamicDisplayModeFromTraitString:](self, "_dynamicDisplayModeFromTraitString:", -[TDDeviceTraits dynamicDisplayModeValue](self, "dynamicDisplayModeValue"));
}

- (void)setDynamicDisplayMode:(id)a3
{
  int64_t v4;

  v4 = -[TDDeviceTraits _dynamicDisplayModeFromTraitString:](self, "_dynamicDisplayModeFromTraitString:", a3);
  if ((v4 & 0x8000000000000000) == 0)
    -[TDDeviceTraits setDynamicDisplayModeValue:](self, "setDynamicDisplayModeValue:", v4);
}

- (NSArray)subtypeFallbackValues
{
  NSArray *v3;

  if (-[NSArray count](self->_subtypeFallbackValues, "count"))
    return self->_subtypeFallbackValues;
  v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[TDDeviceTraits idiomValue](self, "idiomValue") == 5)
  {
    -[TDDeviceTraits subtype](self, "subtype");
    CUIWatchSubTypeFallbackOrder();
  }
  -[NSArray addObject:](v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0));

  self->_subtypeFallbackValues = v3;
  return v3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)idiomValue
{
  return self->_idiomValue;
}

- (void)setIdiomValue:(int64_t)a3
{
  self->_idiomValue = a3;
}

- (NSArray)hostedIdiomValues
{
  return self->_hostedIdiomValues;
}

- (void)setHostedIdiomValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (int64_t)displayGamutValue
{
  return self->_displayGamutValue;
}

- (void)setDisplayGamutValue:(int64_t)a3
{
  self->_displayGamutValue = a3;
}

- (int64_t)deploymentTargetValue
{
  return self->_deploymentTargetValue;
}

- (void)setDeploymentTargetValue:(int64_t)a3
{
  self->_deploymentTargetValue = a3;
}

- (int64_t)memoryPerformanceClass
{
  return self->_memoryPerformanceClass;
}

- (void)setMemoryPerformanceClass:(int64_t)a3
{
  self->_memoryPerformanceClass = a3;
}

- (int64_t)graphicsPerformanceClass
{
  return self->_graphicsPerformanceClass;
}

- (void)setGraphicsPerformanceClass:(int64_t)a3
{
  self->_graphicsPerformanceClass = a3;
}

- (int64_t)graphicsFeatureSetClassValue
{
  return self->_graphicsFeatureSetClassValue;
}

- (void)setGraphicsFeatureSetClassValue:(int64_t)a3
{
  self->_graphicsFeatureSetClassValue = a3;
}

- (NSArray)graphicsFeatureSetFallbackValues
{
  return self->_graphicsFeatureSetFallbackValues;
}

- (void)setGraphicsFeatureSetFallbackValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setSubtypeFallbackValues:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (int64_t)dynamicDisplayModeValue
{
  return self->_dynamicDisplayModeValue;
}

- (void)setDynamicDisplayModeValue:(int64_t)a3
{
  self->_dynamicDisplayModeValue = a3;
}

@end
