@implementation HKDisplayTypeChartingRules

- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3 chartingOptions:(unint64_t)a4 preferredTimeScope:(int64_t)a5
{
  char v6;
  HKDisplayTypeChartingRules *v8;
  HKDisplayTypeChartingRules *v9;
  NSNumber *maximumYAxisLabelCount;
  NSNumber *maximumYAxisLabelWidth;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKDisplayTypeChartingRules;
  v8 = -[HKDisplayTypeChartingRules init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_defaultChartStyle = a3;
    if (_DefaultDecimalPrecisionRule_onceToken != -1)
      dispatch_once(&_DefaultDecimalPrecisionRule_onceToken, &__block_literal_global_38);
    objc_storeStrong((id *)&v9->_allowedDecimalPrecisionRule, (id)_DefaultDecimalPrecisionRule_defaultPrecisionRule);
    maximumYAxisLabelCount = v9->_maximumYAxisLabelCount;
    v9->_maximumYAxisLabelCount = 0;

    maximumYAxisLabelWidth = v9->_maximumYAxisLabelWidth;
    v9->_maximumYAxisLabelWidth = (NSNumber *)&unk_1E9CED4E8;

    v9->_preferredTimeScope = a5;
    v9->_shouldDisplayUnitForAxisLabels = v6 & 1;
    v9->_shouldShowInitialLollipop = (v6 & 2) == 0;
    v9->_shouldInvertYAxis = (v6 & 4) != 0;
    v9->_shouldConnectSamplesWithLines = (v6 & 8) == 0;
    v9->_shouldRoundYAxisDuringExpansion = (v6 & 0x10) == 0;
  }
  return v9;
}

- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3 chartingOptions:(unint64_t)a4
{
  return -[HKDisplayTypeChartingRules initWithDefaultChartStyle:chartingOptions:preferredTimeScope:](self, "initWithDefaultChartStyle:chartingOptions:preferredTimeScope:", a3, a4, 5);
}

- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3
{
  return -[HKDisplayTypeChartingRules initWithDefaultChartStyle:chartingOptions:](self, "initWithDefaultChartStyle:chartingOptions:", a3, 0);
}

- (id)allowedDecimalPrecisionRuleForUnit:(id)a3
{
  HKDecimalPrecisionRule *v5;
  void *v6;
  void *v7;
  HKDecimalPrecisionRule *v8;

  v5 = self->_allowedDecimalPrecisionRule;
  if (a3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_perUnitDecimalPrecision, "objectForKeyedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;

      v5 = v8;
    }

  }
  return v5;
}

- (HKInteractiveChartsAxisScalingRule)axisScalingRule
{
  return self->_axisScalingRule;
}

- (void)setCompactChartAxisScalingRule:(id)a3
{
  objc_storeStrong((id *)&self->_compactChartAxisScalingRule, a3);
}

- (void)setChartStyle:(int64_t)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("chartStyle"), a4);

}

- (void)setLineChartUsesValueAxisAnnotation:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("lineChartUsesValueAxisAnnotation"), a4);

}

- (void)setLineChartUsesPointMarkerImage:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("lineChartUsesPointMarkerImage"), a4);

}

- (void)setLineChartFlatLastValue:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("lineChartFlatLastValue"), a4);

}

- (void)setLineChartExtendLastValue:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("lineChartExtendLastValue"), a4);

}

- (void)_setRule:(id)a3 forKey:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  NSMutableDictionary *rulesByTimeScope;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  rulesByTimeScope = self->_rulesByTimeScope;
  if (!rulesByTimeScope)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = self->_rulesByTimeScope;
    self->_rulesByTimeScope = v10;

    rulesByTimeScope = self->_rulesByTimeScope;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](rulesByTimeScope, "objectForKeyedSubscript:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rulesByTimeScope, "setObject:forKeyedSubscript:", v12, v8);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v13);

}

- (void)setLineChartExtendFirstValue:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("lineChartExtendFirstValue"), a4);

}

- (void)setAxisScalingRule:(id)a3
{
  objc_storeStrong((id *)&self->_axisScalingRule, a3);
}

- (void)setAllowedDecimalPrecisionRule:(id)a3 perUnitPrecisionRules:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (v8)
    objc_storeStrong((id *)&self->_allowedDecimalPrecisionRule, a3);
  if (v7)
    objc_storeStrong((id *)&self->_perUnitDecimalPrecision, a4);

}

- (void)setRemoteChartConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_remoteChartConfiguration, a3);
}

- (void)setIntervalComponents:(id)a3 forTimeScope:(int64_t)a4
{
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", a3, CFSTR("intervalComponents"), a4);
}

- (void)setChartPointRadius:(double)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("radius"), a4);

}

- (void)setChartPointLineWidth:(double)a3 forTimeScope:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeChartingRules _setRule:forKey:timeScope:](self, "_setRule:forKey:timeScope:", v6, CFSTR("lineWidth"), a4);

}

- (int64_t)chartStyleForTimeScope:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t defaultChartStyle;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("chartStyle"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    defaultChartStyle = objc_msgSend(v4, "integerValue");
  else
    defaultChartStyle = self->_defaultChartStyle;

  return defaultChartStyle;
}

- (id)_ruleForKey:(id)a3 timeScope:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_rulesByTimeScope, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)chartStyleContainsHorizontalGridlines:(int64_t)a3
{
  return (unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFFDLL;
}

+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 axisScalingRule:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "chartingRulesWithDefaultChartStyle:chartStyleForTimeScopes:axisScalingRule:preferredTimeScope:chartingOptions:", a3, 0, v5, 5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKDisplayTypeChartingRules *)v6;
}

+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 chartStyleForTimeScopes:(id)a4 axisScalingRule:(id)a5 preferredTimeScope:(int64_t)a6 chartingOptions:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;

  v11 = a5;
  v12 = a4;
  objc_msgSend((id)objc_opt_class(), "chartingRulesWithDefaultChartStyle:chartStyleForTimeScopes:axisScalingRule:compactAxisScalingRule:preferredTimeScope:chartingOptions:", a3, v12, v11, 0, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKDisplayTypeChartingRules *)v13;
}

+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 chartStyleForTimeScopes:(id)a4 axisScalingRule:(id)a5 compactAxisScalingRule:(id)a6 preferredTimeScope:(int64_t)a7 chartingOptions:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  HKDisplayTypeChartingRules *v16;
  _QWORD v18[4];
  HKDisplayTypeChartingRules *v19;

  v13 = a4;
  v14 = a6;
  v15 = a5;
  v16 = -[HKDisplayTypeChartingRules initWithDefaultChartStyle:chartingOptions:]([HKDisplayTypeChartingRules alloc], "initWithDefaultChartStyle:chartingOptions:", a3, a8);
  -[HKDisplayTypeChartingRules setAxisScalingRule:](v16, "setAxisScalingRule:", v15);

  -[HKDisplayTypeChartingRules setCompactChartAxisScalingRule:](v16, "setCompactChartAxisScalingRule:", v14);
  -[HKDisplayTypeChartingRules setPreferredTimeScope:](v16, "setPreferredTimeScope:", a7);
  if (v13)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __163__HKDisplayTypeChartingRules_chartingRulesWithDefaultChartStyle_chartStyleForTimeScopes_axisScalingRule_compactAxisScalingRule_preferredTimeScope_chartingOptions___block_invoke;
    v18[3] = &unk_1E9C429A8;
    v19 = v16;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  return v16;
}

uint64_t __163__HKDisplayTypeChartingRules_chartingRulesWithDefaultChartStyle_chartStyleForTimeScopes_axisScalingRule_compactAxisScalingRule_preferredTimeScope_chartingOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = objc_msgSend(a3, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v4, "setChartStyle:forTimeScope:", v6, v7);
}

- (id)intervalComponentsForTimeScope:(int64_t)a3
{
  void *v4;
  id v6;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("intervalComponents"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    v4 = v6;
    switch(a3)
    {
      case 0:
      case 1:
        objc_msgSend(v6, "setYear:", 1);
        break;
      case 2:
        objc_msgSend(v6, "setMonth:", 1);
        break;
      case 3:
        objc_msgSend(v6, "setWeekOfYear:", 1);
        break;
      case 4:
      case 5:
      case 8:
        objc_msgSend(v6, "setDay:", 1);
        break;
      case 6:
        objc_msgSend(v6, "setHour:", 1);
        break;
      case 7:
        objc_msgSend(v6, "setMinute:", 15);
        break;
      default:
        return v4;
    }
  }
  return v4;
}

- (double)chartPointLineWidthForTimeScope:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("lineWidth"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 1.5;
  }

  return v6;
}

- (double)chartPointRadiusForTimeScope:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("radius"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 2.5;
  }

  return v6;
}

- (BOOL)lineChartFlatLastValueForTimeScope:(int64_t)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("lineChartFlatLastValue"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)lineChartExtendLastValueForTimeScope:(int64_t)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("lineChartExtendLastValue"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)lineChartExtendFirstValueForTimeScope:(int64_t)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("lineChartExtendFirstValue"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)lineChartUsesPointMarkerImageForTimeScope:(int64_t)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("lineChartUsesPointMarkerImage"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (BOOL)lineChartUsesValueAxisAnnotationForTimeScope:(int64_t)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HKDisplayTypeChartingRules _ruleForKey:timeScope:](self, "_ruleForKey:timeScope:", CFSTR("lineChartUsesValueAxisAnnotation"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldDisplayUnitForAxisLabels
{
  return self->_shouldDisplayUnitForAxisLabels;
}

- (BOOL)shouldShowInitialLollipop
{
  return self->_shouldShowInitialLollipop;
}

- (BOOL)shouldInvertYAxis
{
  return self->_shouldInvertYAxis;
}

- (BOOL)shouldConnectSamplesWithLines
{
  return self->_shouldConnectSamplesWithLines;
}

- (BOOL)shouldRoundYAxisDuringExpansion
{
  return self->_shouldRoundYAxisDuringExpansion;
}

- (NSNumber)maximumYAxisLabelCount
{
  return self->_maximumYAxisLabelCount;
}

- (void)setMaximumYAxisLabelCount:(id)a3
{
  objc_storeStrong((id *)&self->_maximumYAxisLabelCount, a3);
}

- (NSNumber)maximumYAxisLabelWidth
{
  return self->_maximumYAxisLabelWidth;
}

- (void)setMaximumYAxisLabelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_maximumYAxisLabelWidth, a3);
}

- (int64_t)defaultChartStyle
{
  return self->_defaultChartStyle;
}

- (HKInteractiveChartsAxisScalingRule)compactChartAxisScalingRule
{
  return self->_compactChartAxisScalingRule;
}

- (int64_t)preferredTimeScope
{
  return self->_preferredTimeScope;
}

- (void)setPreferredTimeScope:(int64_t)a3
{
  self->_preferredTimeScope = a3;
}

- (HKRemoteChartConfiguration)remoteChartConfiguration
{
  return self->_remoteChartConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteChartConfiguration, 0);
  objc_storeStrong((id *)&self->_compactChartAxisScalingRule, 0);
  objc_storeStrong((id *)&self->_axisScalingRule, 0);
  objc_storeStrong((id *)&self->_maximumYAxisLabelWidth, 0);
  objc_storeStrong((id *)&self->_maximumYAxisLabelCount, 0);
  objc_storeStrong((id *)&self->_perUnitDecimalPrecision, 0);
  objc_storeStrong((id *)&self->_allowedDecimalPrecisionRule, 0);
  objc_storeStrong((id *)&self->_rulesByTimeScope, 0);
}

@end
