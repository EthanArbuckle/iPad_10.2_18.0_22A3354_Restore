@implementation GCGenericDevicePhysicalInputDpadModelBuilder

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
  v6.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  v4 = a3;
  -[GCGenericDevicePhysicalInputElementModelBuilder initializeWithModel:](&v6, sel_initializeWithModel_, v4);
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceUpExtendedEventFieldIndex:](self, "setSourceUpExtendedEventFieldIndex:", objc_msgSend(v4, "sourceUpExtendedEventFieldIndex", v6.receiver, v6.super_class));
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceDownExtendedEventFieldIndex:](self, "setSourceDownExtendedEventFieldIndex:", objc_msgSend(v4, "sourceDownExtendedEventFieldIndex"));
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceLeftExtendedEventFieldIndex:](self, "setSourceLeftExtendedEventFieldIndex:", objc_msgSend(v4, "sourceLeftExtendedEventFieldIndex"));
  v5 = objc_msgSend(v4, "sourceRightExtendedEventFieldIndex");

  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceRightExtendedEventFieldIndex:](self, "setSourceRightExtendedEventFieldIndex:", v5);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  -[GCGenericDevicePhysicalInputElementModelBuilder reset](&v3, sel_reset);
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceUpExtendedEventFieldIndex:](self, "setSourceUpExtendedEventFieldIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceDownExtendedEventFieldIndex:](self, "setSourceDownExtendedEventFieldIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceLeftExtendedEventFieldIndex:](self, "setSourceLeftExtendedEventFieldIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceRightExtendedEventFieldIndex:](self, "setSourceRightExtendedEventFieldIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (id)build
{
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  -[GCGenericDevicePhysicalInputElementModelBuilder build](&v5, sel_build);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3[6] = -[GCGenericDevicePhysicalInputDpadModelBuilder sourceUpExtendedEventFieldIndex](self, "sourceUpExtendedEventFieldIndex");
  v3[7] = -[GCGenericDevicePhysicalInputDpadModelBuilder sourceDownExtendedEventFieldIndex](self, "sourceDownExtendedEventFieldIndex");
  v3[8] = -[GCGenericDevicePhysicalInputDpadModelBuilder sourceLeftExtendedEventFieldIndex](self, "sourceLeftExtendedEventFieldIndex");
  v3[9] = -[GCGenericDevicePhysicalInputDpadModelBuilder sourceRightExtendedEventFieldIndex](self, "sourceRightExtendedEventFieldIndex");
  return v3;
}

- (int64_t)sourceUpExtendedEventFieldIndex
{
  return self->_sourceUpExtendedEventFieldIndex;
}

- (void)setSourceUpExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceUpExtendedEventFieldIndex = a3;
}

- (int64_t)sourceDownExtendedEventFieldIndex
{
  return self->_sourceDownExtendedEventFieldIndex;
}

- (void)setSourceDownExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceDownExtendedEventFieldIndex = a3;
}

- (int64_t)sourceLeftExtendedEventFieldIndex
{
  return self->_sourceLeftExtendedEventFieldIndex;
}

- (void)setSourceLeftExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceLeftExtendedEventFieldIndex = a3;
}

- (int64_t)sourceRightExtendedEventFieldIndex
{
  return self->_sourceRightExtendedEventFieldIndex;
}

- (void)setSourceRightExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceRightExtendedEventFieldIndex = a3;
}

- (GCGenericDevicePhysicalInputDpadModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDevicePhysicalInputDpadModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  GCGenericDevicePhysicalInputDpadModelBuilder *v18;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  v7 = -[GCGenericDevicePhysicalInputElementModelBuilder initWithDictionaryRepresentation:error:](&v29, sel_initWithDictionaryRepresentation_error_, v6, a4);
  if (!v7)
    goto LABEL_33;
  v28 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("UpValueSource"), objc_opt_class(), &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    if (a4)
    {
      v36[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v20;
      v36[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v21;
      v22 = v37;
      v23 = v36;
LABEL_31:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v23, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v8)
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceUpExtendedEventFieldIndex:](v7, "setSourceUpExtendedEventFieldIndex:", objc_msgSend(v8, "integerValue"));

  v27 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("DownValueSource"), objc_opt_class(), &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  v10 = v13;
  if (!v12 && v13)
  {
    if (a4)
    {
      v34[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v20;
      v34[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v21;
      v22 = v35;
      v23 = v34;
      goto LABEL_31;
    }
LABEL_32:

LABEL_33:
    v18 = 0;
    goto LABEL_22;
  }
  if (v12)
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceDownExtendedEventFieldIndex:](v7, "setSourceDownExtendedEventFieldIndex:", objc_msgSend(v12, "integerValue"));

  v26 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("LeftValueSource"), objc_opt_class(), &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v26;
  v10 = v15;
  if (!v14 && v15)
  {
    if (a4)
    {
      v32[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v20;
      v32[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v21;
      v22 = v33;
      v23 = v32;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v14)
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceLeftExtendedEventFieldIndex:](v7, "setSourceLeftExtendedEventFieldIndex:", objc_msgSend(v14, "integerValue"));

  v25 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("RightValueSource"), objc_opt_class(), &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v25;
  v10 = v17;
  if (!v16 && v17)
  {
    if (a4)
    {
      v30[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v20;
      v30[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v21;
      v22 = v31;
      v23 = v30;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v16)
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceRightExtendedEventFieldIndex:](v7, "setSourceRightExtendedEventFieldIndex:", objc_msgSend(v16, "integerValue"));

  v18 = v7;
LABEL_22:

  return v18;
}

@end
