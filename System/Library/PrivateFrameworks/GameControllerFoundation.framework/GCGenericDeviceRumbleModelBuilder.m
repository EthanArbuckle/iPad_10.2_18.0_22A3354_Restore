@implementation GCGenericDeviceRumbleModelBuilder

- (GCGenericDeviceRumbleModelBuilder)init
{
  GCGenericDeviceRumbleModelBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleModelBuilder;
  v2 = -[GCGenericDeviceRumbleModelBuilder init](&v4, sel_init);
  -[GCGenericDeviceRumbleModelBuilder reset](v2, "reset");
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "dispatchFrequency");
  -[GCGenericDeviceRumbleModelBuilder setDispatchFrequency:](self, "setDispatchFrequency:");
  objc_msgSend(v4, "actuators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleModelBuilder setActuators:](self, "setActuators:", v5);

  objc_msgSend(v4, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleModelBuilder setNodes:](self, "setNodes:", v6);

  objc_msgSend(v4, "outputs");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceRumbleModelBuilder setOutputs:](self, "setOutputs:", v7);
}

- (void)reset
{
  double v2;

  LODWORD(v2) = 0;
  -[GCGenericDeviceRumbleModelBuilder setDispatchFrequency:](self, "setDispatchFrequency:", v2);
  -[GCGenericDeviceRumbleModelBuilder setActuators:](self, "setActuators:", 0);
  -[GCGenericDeviceRumbleModelBuilder setNodes:](self, "setNodes:", 0);
  -[GCGenericDeviceRumbleModelBuilder setOutputs:](self, "setOutputs:", 0);
}

- (id)build
{
  float *v4;
  float v5;
  float v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (float *)objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDeviceRumbleModelBuilder dispatchFrequency](self, "dispatchFrequency");
  v6 = v5;
  if (v5 <= 0.0)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleModel.m"), 148, CFSTR("'dispatchFrequency' can not be 0"));

  }
  v4[2] = v6;
  -[GCGenericDeviceRumbleModelBuilder actuators](self, "actuators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleModel.m"), 152, CFSTR("'actuators' can not be nil"));

  }
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v8;

  -[GCGenericDeviceRumbleModelBuilder nodes](self, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleModel.m"), 156, CFSTR("'nodes' can not be nil"));

  }
  v11 = objc_msgSend(v10, "copy");
  v12 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v11;

  -[GCGenericDeviceRumbleModelBuilder outputs](self, "outputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleModel.m"), 160, CFSTR("'outputs' can not be nil"));

  }
  v14 = objc_msgSend(v13, "copy");
  v15 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v14;

  return v4;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "modelClass"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isEqual:", self);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GCGenericDeviceRumbleModelBuilder;
    v5 = -[GCGenericDeviceRumbleModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (float)dispatchFrequency
{
  return self->_dispatchFrequency;
}

- (void)setDispatchFrequency:(float)a3
{
  self->_dispatchFrequency = a3;
}

- (NSArray)actuators
{
  return self->_actuators;
}

- (void)setActuators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_actuators, 0);
}

@end
