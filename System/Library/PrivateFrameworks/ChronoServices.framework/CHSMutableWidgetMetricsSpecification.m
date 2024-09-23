@implementation CHSMutableWidgetMetricsSpecification

- (id)_initWithMetricsByFamily:(id)a3 alternates:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v11.receiver = self;
  v11.super_class = (Class)CHSMutableWidgetMetricsSpecification;
  v9 = -[CHSWidgetMetricsSpecification _initWithMetricsByFamily:alternates:](&v11, sel__initWithMetricsByFamily_alternates_, v7, v8);

  return v9;
}

- (void)setMetrics:(id)a3 forFamily:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CHSMutableWidgetMetricsSpecification metricsByFamily](self, "metricsByFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, v7);
  else
    objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (void)setAlternateMetrics:(id)a3 forFamily:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CHSMutableWidgetMetricsSpecification alternatesByFamily](self, "alternatesByFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, v7);
  else
    objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetMetricsSpecification initWithMetricsSpecification:](+[CHSWidgetMetricsSpecification allocWithZone:](CHSWidgetMetricsSpecification, "allocWithZone:", a3), "initWithMetricsSpecification:", self);
}

- (NSMutableDictionary)metricsByFamily
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSMutableWidgetMetricsSpecification;
  -[CHSWidgetMetricsSpecification metricsByFamily](&v3, sel_metricsByFamily);
  return (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableDictionary)alternatesByFamily
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSMutableWidgetMetricsSpecification;
  -[CHSWidgetMetricsSpecification alternatesByFamily](&v3, sel_alternatesByFamily);
  return (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

@end
