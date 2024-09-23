@implementation HMMTRReportDescription

- (HMMTRReportDescription)initWithClusterId:(id)a3 attributeIds:(id)a4 eventIds:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRReportDescription *v12;
  HMMTRReportDescription *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRReportDescription;
  v12 = -[HMMTRReportDescription init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clusterId, a3);
    objc_storeStrong((id *)&v13->_attributeIds, a4);
    objc_storeStrong((id *)&v13->_eventIds, a5);
  }

  return v13;
}

- (NSNumber)clusterId
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeIds
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)eventIds
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (id)mapValue
{
  return self->_mapValue;
}

- (void)setMapValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)mapEvent
{
  return self->_mapEvent;
}

- (void)setMapEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)clusterClass
{
  return self->_clusterClass;
}

- (void)setClusterClass:(id)a3
{
  objc_storeStrong((id *)&self->_clusterClass, a3);
}

- (NSString)clusterSelector
{
  return self->_clusterSelector;
}

- (void)setClusterSelector:(id)a3
{
  objc_storeStrong((id *)&self->_clusterSelector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterSelector, 0);
  objc_storeStrong((id *)&self->_clusterClass, 0);
  objc_storeStrong(&self->_mapEvent, 0);
  objc_storeStrong(&self->_mapValue, 0);
  objc_storeStrong((id *)&self->_eventIds, 0);
  objc_storeStrong((id *)&self->_attributeIds, 0);
  objc_storeStrong((id *)&self->_clusterId, 0);
}

@end
