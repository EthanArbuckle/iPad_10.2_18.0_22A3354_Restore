@implementation GCGenericDeviceRumbleActuatorModelBuilder

- (GCGenericDeviceRumbleActuatorModelBuilder)init
{
  GCGenericDeviceRumbleActuatorModelBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleActuatorModelBuilder;
  v2 = -[GCGenericDeviceRumbleActuatorModelBuilder init](&v4, sel_init);
  -[GCGenericDeviceRumbleActuatorModelBuilder reset](v2, "reset");
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;

  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleActuatorModelBuilder setName:](self, "setName:", v4);

}

- (void)reset
{
  -[GCGenericDeviceRumbleActuatorModelBuilder setName:](self, "setName:", 0);
}

- (id)build
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDeviceRumbleActuatorModelBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleActuatorModel.m"), 116, CFSTR("'name' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

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
    v8.super_class = (Class)GCGenericDeviceRumbleActuatorModelBuilder;
    v5 = -[GCGenericDeviceRumbleActuatorModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
