@implementation _CHSWidgetConfigurationHost

- (_CHSWidgetConfigurationHost)initWithIdentifier:(id)a3 configurations:(id)a4 metricsSpecification:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CHSWidgetConfigurationHost *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSArray *configurations;
  uint64_t v16;
  CHSWidgetMetricsSpecification *metricsSpecification;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_CHSWidgetConfigurationHost;
  v11 = -[_CHSWidgetConfigurationHost init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    configurations = v11->_configurations;
    v11->_configurations = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    metricsSpecification = v11->_metricsSpecification;
    v11->_metricsSpecification = (CHSWidgetMetricsSpecification *)v16;

  }
  return v11;
}

- (NSString)identifier
{
  return (NSString *)(id)-[NSString copy](self->_identifier, "copy");
}

- (NSArray)widgetConfigurations
{
  return (NSArray *)(id)-[NSArray copy](self->_configurations, "copy");
}

- (id)widgetConfigurationsForApplicationContainerBundleIdentifier:(id)a3
{
  id v4;
  NSArray *configurations;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  configurations = self->_configurations;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91___CHSWidgetConfigurationHost_widgetConfigurationsForApplicationContainerBundleIdentifier___block_invoke;
  v11[3] = &unk_1E2A5B058;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](configurations, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CHSWidgetMetricsSpecification)metricsSpecification
{
  return (CHSWidgetMetricsSpecification *)(id)-[CHSWidgetMetricsSpecification copy](self->_metricsSpecification, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_CHSWidgetConfigurationHost initWithIdentifier:configurations:metricsSpecification:]([_CHSWidgetConfigurationHost alloc], "initWithIdentifier:configurations:metricsSpecification:", self->_identifier, self->_configurations, self->_metricsSpecification);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsSpecification, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
