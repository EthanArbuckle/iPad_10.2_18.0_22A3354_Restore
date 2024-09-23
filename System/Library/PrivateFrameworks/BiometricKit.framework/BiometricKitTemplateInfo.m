@implementation BiometricKitTemplateInfo

- (BiometricKitTemplateInfo)init
{
  BiometricKitTemplateInfo *v2;
  BiometricKitTemplateInfo *v3;
  NSArray *topology;
  NSDictionary *details;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BiometricKitTemplateInfo;
  v2 = -[BiometricKitTemplateInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    topology = v2->_topology;
    v2->_topology = 0;

    details = v3->_details;
    v3->_details = 0;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BiometricKitTemplateInfo setTopology:](self, "setTopology:", 0);
  -[BiometricKitTemplateInfo setDetails:](self, "setDetails:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BiometricKitTemplateInfo;
  -[BiometricKitTemplateInfo dealloc](&v3, sel_dealloc);
}

- (NSArray)topology
{
  return self->_topology;
}

- (void)setTopology:(id)a3
{
  objc_storeStrong((id *)&self->_topology, a3);
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_topology, 0);
}

@end
