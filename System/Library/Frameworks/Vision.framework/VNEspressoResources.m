@implementation VNEspressoResources

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  void *v2;
  uint64_t v3;
  _QWORD v4[2];
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  objc_copyStruct(v4, &self->_network, 16, 1, 0);
  v2 = (void *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)plan
{
  return self->_plan;
}

- (VNEspressoResources)initWithModelPath:(id)a3 networkConfigurationName:(id)a4 network:(id)a5 plan:(void *)a6 context:(void *)a7
{
  uint64_t v9;
  void *var0;
  id v13;
  id v14;
  VNEspressoResources *v15;
  uint64_t v16;
  NSString *modelPath;
  uint64_t v18;
  NSString *networkConfigurationName;
  VNEspressoResources *v20;
  objc_super v22;

  v9 = *(_QWORD *)&a5.var1;
  var0 = a5.var0;
  v13 = a3;
  v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VNEspressoResources;
  v15 = -[VNEspressoResources init](&v22, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    modelPath = v15->_modelPath;
    v15->_modelPath = (NSString *)v16;

    v18 = objc_msgSend(v14, "copy");
    networkConfigurationName = v15->_networkConfigurationName;
    v15->_networkConfigurationName = (NSString *)v18;

    v15->_network.plan = var0;
    *(_QWORD *)&v15->_network.network_index = v9;
    v15->_plan = a6;
    v15->_context = a7;
    v20 = v15;
  }

  return v15;
}

- (void)free
{
  espresso_plan_destroy();
  self->_plan = 0;
  espresso_context_destroy();
  self->_context = 0;
  self->_network.plan = 0;
  self->_network.network_index = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[VNEspressoResources free](self, "free");
  v3.receiver = self;
  v3.super_class = (Class)VNEspressoResources;
  -[VNEspressoResources dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNEspressoResources modelPath](self, "modelPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Model: %@, network: %p, plan: %p: context: %p"), v4, &self->_network, self->_plan, self->_context);

  return v5;
}

- (void)context
{
  return self->_context;
}

- (NSString)modelPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)networkConfigurationName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationName, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
}

@end
