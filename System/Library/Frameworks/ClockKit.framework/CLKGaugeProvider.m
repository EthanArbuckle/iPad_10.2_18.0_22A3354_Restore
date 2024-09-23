@implementation CLKGaugeProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKGaugeProvider;
  return -[CLKGaugeProvider init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v5;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("_StyleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gaugeColors, CFSTR("_GaugeColorsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gaugeColorLocations, CFSTR("_GaugeColorLocationsKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_finalized, CFSTR("Finalized"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityLabel, CFSTR("AccessibilityLabel"));

}

- (CLKGaugeProvider)initWithCoder:(id)a3
{
  id v4;
  CLKGaugeProvider *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *gaugeColors;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *gaugeColorLocations;
  uint64_t v16;
  NSString *accessibilityLabel;

  v4 = a3;
  v5 = -[CLKGaugeProvider _init](self, "_init");
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_StyleKey"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_GaugeColorsKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    gaugeColors = v5->_gaugeColors;
    v5->_gaugeColors = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_GaugeColorLocationsKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    gaugeColorLocations = v5->_gaugeColorLocations;
    v5->_gaugeColorLocations = (NSArray *)v14;

    v5->_finalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Finalized"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccessibilityLabel"));
    v16 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v16;

  }
  return v5;
}

- (BOOL)needsTimerUpdates
{
  objc_opt_class();
  CLKRequestConcreteImplementation(self);
  return 0;
}

- (double)progressFractionForNow:(id)a3
{
  objc_opt_class();
  CLKRequestConcreteImplementation(self);
  return 0.0;
}

- (id)startUpdatesWithHandler:(id)a3
{
  objc_opt_class();
  CLKRequestConcreteImplementation(self);
  return &unk_24CC16D68;
}

- (void)stopUpdatesForToken:(id)a3
{
  objc_opt_class();
  CLKRequestConcreteImplementation(self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t style;
  NSArray *gaugeColors;
  void *v7;
  NSArray *gaugeColorLocations;
  void *v9;
  NSString *accessibilityLabel;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (style = self->_style, style == objc_msgSend(v4, "style")))
  {
    gaugeColors = self->_gaugeColors;
    objc_msgSend(v4, "gaugeColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (CLKEqualObjects(gaugeColors, v7))
    {
      gaugeColorLocations = self->_gaugeColorLocations;
      objc_msgSend(v4, "gaugeColorLocations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (CLKEqualObjects(gaugeColorLocations, v9))
      {
        accessibilityLabel = self->_accessibilityLabel;
        objc_msgSend(v4, "accessibilityLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CLKEqualObjects(accessibilityLabel, v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_style);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "hash");
  v5 = (double)(unint64_t)-[NSArray hash](self->_gaugeColors, "hash") * 1000000.0 + v4 * 10000000.0;
  v6 = v5 + (double)(unint64_t)-[NSArray hash](self->_gaugeColorLocations, "hash") * 100000.0;
  v7 = (unint64_t)(v6 + (double)-[NSString hash](self->_accessibilityLabel, "hash") * 10000.0);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (self->_finalized)
    return self;
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 16) = self->_style;
  objc_storeStrong((id *)(v4 + 24), self->_gaugeColors);
  objc_storeStrong((id *)(v4 + 32), self->_gaugeColorLocations);
  v5 = -[NSString copy](self->_accessibilityLabel, "copy");
  v6 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v5;

  return (id)v4;
}

+ (CLKGaugeProvider)providerWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v4;
  NSString *v5;
  Class v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("class"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("class"), v5);
  v6 = NSClassFromString(v5);
  if ((-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("class: %@ must be a CLKGaugeProvider class"), v5);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithJSONObjectRepresentation:", v4);

  return (CLKGaugeProvider *)v7;
}

- (CLKGaugeProvider)initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSArray *gaugeColors;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  NSArray *gaugeColorLocations;
  void *v22;
  void *v24;
  void *v25;
  CLKGaugeProvider *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = -[CLKGaugeProvider _init](self, "_init");
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v4);
    v27 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaugeStyle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26->_style = objc_msgSend(v24, "integerValue");
    else
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a integer - invalid value: %@"), CFSTR("gaugeStyle"), v24);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaugeColors"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v6 = v25;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v33 != v8)
                objc_enumerationMutation(v6);
              v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithJSONObjectRepresentation:", v10);
                -[NSArray addObject:](v5, "addObject:", v11);

              }
              else
              {
                objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value in key '%@' must be a dictionary - invalid value: %@"), CFSTR("gaugeColors"), v10);
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v7);
        }

        gaugeColors = v26->_gaugeColors;
        v26->_gaugeColors = v5;

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a array - invalid value: %@"), CFSTR("gaugeColors"), v25);
      }
    }
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("gaugeColorLocations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v15 = v13;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v15);
              v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v14, "addObject:", v19);
              else
                objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for gaugeColorLocation must be a number - invalid value: %@"), v19);
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v16);
        }

        if (objc_msgSend(v14, "count"))
        {
          v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v14);
          gaugeColorLocations = v26->_gaugeColorLocations;
          v26->_gaugeColorLocations = (NSArray *)v20;

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a array - invalid value: %@"), CFSTR("gaugeColorLocations"), v13);
      }
    }
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("accessibilityLabel"), v22);
      objc_storeStrong((id *)&v26->_accessibilityLabel, v22);
    }

    v4 = v27;
  }

  return v26;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *gaugeColorLocations;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("class"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_style);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("gaugeStyle"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_gaugeColors;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "JSONObjectRepresentation", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("gaugeColors"));
  gaugeColorLocations = self->_gaugeColorLocations;
  if (gaugeColorLocations)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", gaugeColorLocations, CFSTR("gaugeColorLocations"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accessibilityLabel, CFSTR("accessibilityLabel"), (_QWORD)v16);

  return v3;
}

- (BOOL)validate
{
  NSArray *gaugeColors;
  uint64_t v4;
  NSObject *v6;
  void *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  NSUInteger v11;
  id v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  NSUInteger v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  gaugeColors = self->_gaugeColors;
  if (!gaugeColors)
    return 1;
  if (!self->_gaugeColorLocations)
    return 1;
  v4 = -[NSArray count](gaugeColors, "count");
  if (v4 == -[NSArray count](self->_gaugeColorLocations, "count"))
    return 1;
  CLKLoggingObjectForDomain(10);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = self->_gaugeColors;
    v9 = v7;
    v10 = -[NSArray count](v8, "count");
    v11 = -[NSArray count](self->_gaugeColorLocations, "count");
    v13 = 138413570;
    v14 = CFSTR("gaugeColors");
    v15 = 2112;
    v16 = CFSTR("gaugeColorLocations");
    v17 = 2112;
    v18 = v7;
    v19 = 2048;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    v23 = 2112;
    v24 = (id)objc_opt_class();
    v12 = v24;
    _os_log_fault_impl(&dword_2114F4000, v6, OS_LOG_TYPE_FAULT, "Properties '%@' and '%@' on %@ have different counts (%lu and %lu). They must have the same count when passing %@ to the complication data handler.", (uint8_t *)&v13, 0x3Eu);

  }
  return 0;
}

- (void)finalize
{
  self->_finalized = 1;
}

- (CLKGaugeProviderStyle)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSArray)gaugeColors
{
  return self->_gaugeColors;
}

- (void)setGaugeColors:(id)a3
{
  objc_storeStrong((id *)&self->_gaugeColors, a3);
}

- (NSArray)gaugeColorLocations
{
  return self->_gaugeColorLocations;
}

- (void)setGaugeColorLocations:(id)a3
{
  objc_storeStrong((id *)&self->_gaugeColorLocations, a3);
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  objc_storeStrong((id *)&self->_accessibilityLabel, accessibilityLabel);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_gaugeColorLocations, 0);
  objc_storeStrong((id *)&self->_gaugeColors, 0);
}

@end
