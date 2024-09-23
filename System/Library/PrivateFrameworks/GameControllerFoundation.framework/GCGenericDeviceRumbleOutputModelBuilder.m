@implementation GCGenericDeviceRumbleOutputModelBuilder

- (GCGenericDeviceRumbleOutputModelBuilder)init
{
  GCGenericDeviceRumbleOutputModelBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleOutputModelBuilder;
  v2 = -[GCGenericDeviceRumbleOutputModelBuilder init](&v4, sel_init);
  -[GCGenericDeviceRumbleOutputModelBuilder reset](v2, "reset");
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
  id v6;

  v4 = a3;
  objc_msgSend(v4, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputModelBuilder setElementIdentifier:](self, "setElementIdentifier:", v5);

  objc_msgSend(v4, "fields");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceRumbleOutputModelBuilder setFields:](self, "setFields:", v6);
}

- (void)reset
{
  -[GCGenericDeviceRumbleOutputModelBuilder setElementIdentifier:](self, "setElementIdentifier:", 0);
  -[GCGenericDeviceRumbleOutputModelBuilder setFields:](self, "setFields:", 0);
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
  void *v12;
  void *v13;

  v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDeviceRumbleOutputModelBuilder elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleOutputModel.m"), 129, CFSTR("'elementIdentifier' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceRumbleOutputModelBuilder fields](self, "fields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleOutputModel.m"), 133, CFSTR("'fields' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

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
    v8.super_class = (Class)GCGenericDeviceRumbleOutputModelBuilder;
    v5 = -[GCGenericDeviceRumbleOutputModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)setElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
