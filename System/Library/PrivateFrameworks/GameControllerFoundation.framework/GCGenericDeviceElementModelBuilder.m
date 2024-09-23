@implementation GCGenericDeviceElementModelBuilder

- (GCGenericDeviceElementModelBuilder)init
{
  GCGenericDeviceElementModelBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceElementModelBuilder;
  v2 = -[GCGenericDeviceElementModelBuilder init](&v4, sel_init);
  -[GCGenericDeviceElementModelBuilder reset](v2, "reset");
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
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceElementModelBuilder setPredicate:](self, "setPredicate:", v5);

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceElementModelBuilder setIdentifier:](self, "setIdentifier:", v6);

  -[GCGenericDeviceElementModelBuilder setOptional:](self, "setOptional:", objc_msgSend(v4, "optional"));
  -[GCGenericDeviceElementModelBuilder setTypeOverride:](self, "setTypeOverride:", objc_msgSend(v4, "typeOverride"));
  -[GCGenericDeviceElementModelBuilder setCalibrationMin:](self, "setCalibrationMin:", objc_msgSend(v4, "calibrationMin"));
  v7 = objc_msgSend(v4, "calibrationMax");

  -[GCGenericDeviceElementModelBuilder setCalibrationMax:](self, "setCalibrationMax:", v7);
}

- (void)reset
{
  -[GCGenericDeviceElementModelBuilder setPredicate:](self, "setPredicate:", 0);
  -[GCGenericDeviceElementModelBuilder setIdentifier:](self, "setIdentifier:", 0);
  -[GCGenericDeviceElementModelBuilder setOptional:](self, "setOptional:", 0);
  -[GCGenericDeviceElementModelBuilder setTypeOverride:](self, "setTypeOverride:", 0);
  -[GCGenericDeviceElementModelBuilder setCalibrationMax:](self, "setCalibrationMax:", 0);
  -[GCGenericDeviceElementModelBuilder setCalibrationMin:](self, "setCalibrationMin:", 0);
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
  -[GCGenericDeviceElementModelBuilder predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceElementModel.m"), 167, CFSTR("'predicate' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[2];
  v4[2] = v6;

  -[GCGenericDeviceElementModelBuilder identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceElementModel.m"), 171, CFSTR("'identifier' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  *((_BYTE *)v4 + 32) = -[GCGenericDeviceElementModelBuilder optional](self, "optional");
  *((_DWORD *)v4 + 9) = -[GCGenericDeviceElementModelBuilder typeOverride](self, "typeOverride");
  v4[5] = -[GCGenericDeviceElementModelBuilder calibrationMin](self, "calibrationMin");
  v4[6] = -[GCGenericDeviceElementModelBuilder calibrationMax](self, "calibrationMax");

  return v4;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)optional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (int)typeOverride
{
  return self->_typeOverride;
}

- (void)setTypeOverride:(int)a3
{
  self->_typeOverride = a3;
}

- (int64_t)calibrationMin
{
  return self->_calibrationMin;
}

- (void)setCalibrationMin:(int64_t)a3
{
  self->_calibrationMin = a3;
}

- (int64_t)calibrationMax
{
  return self->_calibrationMax;
}

- (void)setCalibrationMax:(int64_t)a3
{
  self->_calibrationMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
