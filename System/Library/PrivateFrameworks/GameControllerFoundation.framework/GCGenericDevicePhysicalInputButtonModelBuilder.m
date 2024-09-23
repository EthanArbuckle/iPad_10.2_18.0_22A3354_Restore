@implementation GCGenericDevicePhysicalInputButtonModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  v4 = a3;
  -[GCGenericDevicePhysicalInputElementModelBuilder initializeWithModel:](&v6, sel_initializeWithModel_, v4);
  v5 = objc_msgSend(v4, "sourceExtendedEventFieldIndex", v6.receiver, v6.super_class);

  -[GCGenericDevicePhysicalInputButtonModelBuilder setSourceExtendedEventFieldIndex:](self, "setSourceExtendedEventFieldIndex:", v5);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  -[GCGenericDevicePhysicalInputElementModelBuilder reset](&v3, sel_reset);
  -[GCGenericDevicePhysicalInputButtonModelBuilder setSourceExtendedEventFieldIndex:](self, "setSourceExtendedEventFieldIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (id)build
{
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  -[GCGenericDevicePhysicalInputElementModelBuilder build](&v5, sel_build);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3[6] = -[GCGenericDevicePhysicalInputButtonModelBuilder sourceExtendedEventFieldIndex](self, "sourceExtendedEventFieldIndex");
  return v3;
}

- (int64_t)sourceExtendedEventFieldIndex
{
  return self->_sourceExtendedEventFieldIndex;
}

- (void)setSourceExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceExtendedEventFieldIndex = a3;
}

- (GCGenericDevicePhysicalInputButtonModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDevicePhysicalInputButtonModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  GCGenericDevicePhysicalInputButtonModelBuilder *v12;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  v7 = -[GCGenericDevicePhysicalInputElementModelBuilder initWithDictionaryRepresentation:error:](&v18, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
  {
LABEL_14:
    v12 = 0;
    goto LABEL_10;
  }
  v17 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("PressedValueSource"), objc_opt_class(), &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    if (a4)
    {
      v19[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v14;
      v19[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v15;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_14;
  }
  if (v8)
    -[GCGenericDevicePhysicalInputButtonModelBuilder setSourceExtendedEventFieldIndex:](v7, "setSourceExtendedEventFieldIndex:", objc_msgSend(v8, "integerValue"));

  v12 = v7;
LABEL_10:

  return v12;
}

@end
