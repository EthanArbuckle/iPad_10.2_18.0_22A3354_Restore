@implementation GCGenericDeviceDriverModelBuilder

- (GCGenericDeviceDriverModelBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceDriverModelBuilder;
  return -[GCGenericDeviceDriverModelBuilder init](&v3, sel_init);
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
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverModelBuilder setElements:](self, "setElements:", v5);

  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverModelBuilder setProperties:](self, "setProperties:", v6);

  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverModelBuilder setInput:](self, "setInput:", v7);

  objc_msgSend(v4, "rumble");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDriverModelBuilder setRumble:](self, "setRumble:", v8);
}

- (void)reset
{
  -[GCGenericDeviceDriverModelBuilder setElements:](self, "setElements:", 0);
  -[GCGenericDeviceDriverModelBuilder setProperties:](self, "setProperties:", 0);
  -[GCGenericDeviceDriverModelBuilder setInput:](self, "setInput:", 0);
  -[GCGenericDeviceDriverModelBuilder setRumble:](self, "setRumble:", 0);
}

- (id)build
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;

  v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDeviceDriverModelBuilder elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDriverModel.m"), 140, CFSTR("'elements' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDriverModelBuilder properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDeviceDriverModelBuilder input](self, "input");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  -[GCGenericDeviceDriverModelBuilder rumble](self, "rumble");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[4];
  v4[4] = v15;

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
    v8.super_class = (Class)GCGenericDeviceDriverModelBuilder;
    v5 = -[GCGenericDeviceDriverModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (NSSet)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GCGenericDeviceDriverPropertiesModel)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GCGenericDeviceInputEventDriverModel)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GCGenericDeviceRumbleModel)rumble
{
  return self->_rumble;
}

- (void)setRumble:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rumble, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
