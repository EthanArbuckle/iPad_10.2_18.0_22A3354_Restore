@implementation HMINMSConfiguration

- (HMINMSConfiguration)initWithThresholdWithLabels:(id)a3 metricWithLabels:(id)a4 thresholdDefault:(id)a5 metricDefault:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMINMSConfiguration *v15;
  HMINMSConfiguration *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMINMSConfiguration;
  v15 = -[HMINMSConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_thresholdWithLabels, a3);
    objc_storeStrong((id *)&v16->_metricWithLabels, a4);
    objc_storeStrong((id *)&v16->_thresholdDefault, a5);
    objc_storeStrong((id *)&v16->_metricDefault, a6);
  }

  return v16;
}

- (id)thresholdForLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[HMINMSConfiguration thresholdWithLabels](self, "thresholdWithLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[HMINMSConfiguration thresholdDefault](self, "thresholdDefault");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (int64_t)metricForLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  -[HMINMSConfiguration metricWithLabels](self, "metricWithLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMINMSConfiguration metricWithLabels](self, "metricWithLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

  }
  else
  {
    -[HMINMSConfiguration metricDefault](self, "metricDefault");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "intValue");
  }

  return v9;
}

- (NSDictionary)thresholdWithLabels
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)metricWithLabels
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)thresholdDefault
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)metricDefault
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricDefault, 0);
  objc_storeStrong((id *)&self->_thresholdDefault, 0);
  objc_storeStrong((id *)&self->_metricWithLabels, 0);
  objc_storeStrong((id *)&self->_thresholdWithLabels, 0);
}

@end
