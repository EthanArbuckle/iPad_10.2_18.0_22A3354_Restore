@implementation GCGenericDeviceModelBuilder

- (GCGenericDeviceModelBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGenericDeviceModelBuilder;
  return -[GCGenericDeviceModelBuilder init](&v3, sel_init);
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
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "productCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModelBuilder setProductCategory:](self, "setProductCategory:", v5);

  objc_msgSend(v4, "productName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModelBuilder setProductName:](self, "setProductName:", v6);

  objc_msgSend(v4, "isFormFitting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModelBuilder setFormFitting:](self, "setFormFitting:", v7);

  objc_msgSend(v4, "driver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModelBuilder setDriver:](self, "setDriver:", v8);

  objc_msgSend(v4, "physicalInput");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceModelBuilder setPhysicalInput:](self, "setPhysicalInput:", v9);
}

- (void)reset
{
  -[GCGenericDeviceModelBuilder setProductCategory:](self, "setProductCategory:", 0);
  -[GCGenericDeviceModelBuilder setProductName:](self, "setProductName:", 0);
  -[GCGenericDeviceModelBuilder setFormFitting:](self, "setFormFitting:", 0);
  -[GCGenericDeviceModelBuilder setDriver:](self, "setDriver:", 0);
  -[GCGenericDeviceModelBuilder setPhysicalInput:](self, "setPhysicalInput:", 0);
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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;

  v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDeviceModelBuilder productCategory](self, "productCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceModel.m"), 144, CFSTR("'productCategory' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceModelBuilder productName](self, "productName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDeviceModelBuilder formFitting](self, "formFitting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  -[GCGenericDeviceModelBuilder driver](self, "driver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[4];
  v4[4] = v15;

  -[GCGenericDeviceModelBuilder physicalInput](self, "physicalInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  v19 = (void *)v4[5];
  v4[5] = v18;

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
    v8.super_class = (Class)GCGenericDeviceModelBuilder;
    v5 = -[GCGenericDeviceModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setProductCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)formFitting
{
  return self->_formFitting;
}

- (void)setFormFitting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GCGenericDeviceDriverModel)driver
{
  return self->_driver;
}

- (void)setDriver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GCGenericDevicePhysicalInputModel)physicalInput
{
  return self->_physicalInput;
}

- (void)setPhysicalInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_formFitting, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
}

- (GCGenericDeviceModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDeviceModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  GCGenericDeviceModelBuilder *v21;
  void *v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[GCGenericDeviceModelBuilder init](self, "init");
  v53 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ProductCategory"), objc_opt_class(), &v53);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v53;
  if (!v8)
  {
    if (!a4)
      goto LABEL_27;
    v66[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v23;
    v66[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v24;
    v25 = v67;
    v26 = v66;
LABEL_26:
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v25, v26, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v27);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  -[GCGenericDeviceModelBuilder setProductCategory:](v7, "setProductCategory:", v8);

  v52 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("ProductName"), objc_opt_class(), &v52);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v52;
  v9 = v11;
  if (!v10 && v11)
  {
    if (!a4)
      goto LABEL_27;
    v64[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v23;
    v64[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v9, "localizedFailureReason");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v24;
    v25 = v65;
    v26 = v64;
    goto LABEL_26;
  }
  -[GCGenericDeviceModelBuilder setProductName:](v7, "setProductName:", v10);

  v51 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("FormFitting"), objc_opt_class(), &v51);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v51;
  v9 = v13;
  if (!v12 && v13)
  {
    if (a4)
    {
      v62[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v23;
      v62[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v24;
      v25 = v63;
      v26 = v62;
      goto LABEL_26;
    }
LABEL_27:

LABEL_56:
    v21 = 0;
    goto LABEL_19;
  }
  -[GCGenericDeviceModelBuilder setFormFitting:](v7, "setFormFitting:", v12);

  v50 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("Driver"), objc_opt_class(), &v50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v50;
  v16 = v15;
  if (!v14 && v15)
  {
    if (a4)
    {
      v60[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v28;
      v60[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v16, "localizedFailureReason");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v29;
      v30 = v61;
      v31 = v60;
LABEL_32:
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v30, v31, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v32);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v18 = v16;
LABEL_33:

LABEL_54:
      goto LABEL_55;
    }
LABEL_34:
    v18 = v16;
    goto LABEL_55;
  }
  if (v14)
  {
    v49 = 0;
    +[GCGenericDeviceDriverModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDriverModel, "modelWithDictionaryRepresentation:error:", v14, &v49);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v49;

    if (!v17)
    {
      if (a4)
      {
        v58[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(v18, "localizedDescription");
        v33 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v33;
        if (!v33)
        {
          +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), v7);
          v33 = objc_claimAutoreleasedReturnValue();
        }
        v46 = (void *)v33;
        v59[0] = v33;
        v58[1] = *MEMORY[0x1E0CB2D68];
        objc_msgSend(v18, "localizedFailureReason");
        v34 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)v34;
        if (!v34)
        {
          +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("Driver"));
          v34 = objc_claimAutoreleasedReturnValue();
        }
        v44 = (void *)v34;
        v59[1] = v34;
        v58[2] = CFSTR("GCFailingKeyPathErrorKey");
        objc_msgSend(v18, "gc_failingKeyPath");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (!v35)
          v35 = (void *)MEMORY[0x1E0C9AA60];
        objc_msgSend(v35, "arrayByAddingObject:", CFSTR("Driver"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v37;
        v38 = v59;
        v39 = v58;
LABEL_51:
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v38, v39, 3);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        if (!v45)
        v29 = v46;
        if (v28)
          goto LABEL_54;
        goto LABEL_33;
      }
LABEL_55:

      goto LABEL_56;
    }
    -[GCGenericDeviceModelBuilder setDriver:](v7, "setDriver:", v17);

  }
  else
  {
    v18 = v15;
  }

  v48 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("PhysicalInput"), objc_opt_class(), &v48);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v48;
  v16 = v19;
  if (!v14 && v19)
  {
    if (a4)
    {
      v56[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v28;
      v56[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v16, "localizedFailureReason");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v29;
      v30 = v57;
      v31 = v56;
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (!v14)
  {
    v18 = v19;
    goto LABEL_18;
  }
  v47 = 0;
  +[GCGenericDevicePhysicalInputModel modelWithDictionaryRepresentation:error:](GCGenericDevicePhysicalInputModel, "modelWithDictionaryRepresentation:error:", v14, &v47);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v47;

  if (!v20)
  {
    if (a4)
    {
      v54[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v18, "localizedDescription");
      v40 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v40;
      if (!v40)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), v7);
        v40 = objc_claimAutoreleasedReturnValue();
      }
      v46 = (void *)v40;
      v55[0] = v40;
      v54[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v18, "localizedFailureReason");
      v41 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v41;
      if (!v41)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("PhysicalInput"));
        v41 = objc_claimAutoreleasedReturnValue();
      }
      v44 = (void *)v41;
      v55[1] = v41;
      v54[2] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v18, "gc_failingKeyPath");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v42;
      if (!v42)
        v42 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v42, "arrayByAddingObject:", CFSTR("PhysicalInput"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2] = v37;
      v38 = v55;
      v39 = v54;
      goto LABEL_51;
    }
    goto LABEL_55;
  }
  -[GCGenericDeviceModelBuilder setPhysicalInput:](v7, "setPhysicalInput:", v20);

LABEL_18:
  v21 = v7;
LABEL_19:

  return v21;
}

@end
