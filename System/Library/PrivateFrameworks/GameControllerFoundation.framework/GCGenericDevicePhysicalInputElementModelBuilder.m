@implementation GCGenericDevicePhysicalInputElementModelBuilder

- (GCGenericDevicePhysicalInputElementModelBuilder)init
{
  uint64_t v4;
  objc_super v6;

  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
    -[GCGenericDevicePhysicalInputElementModelBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDevicePhysicalInputElementModelBuilder;
  return -[GCGenericDevicePhysicalInputElementModelBuilder init](&v6, sel_init);
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
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModelBuilder setIdentifier:](self, "setIdentifier:", v5);

  objc_msgSend(v4, "names");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModelBuilder setNames:](self, "setNames:", v6);

  objc_msgSend(v4, "isAnalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModelBuilder setAnalog:](self, "setAnalog:", v7);

  objc_msgSend(v4, "localizedNameKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModelBuilder setLocalizedNameKey:](self, "setLocalizedNameKey:", v8);

  objc_msgSend(v4, "symbolName");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDevicePhysicalInputElementModelBuilder setSymbolName:](self, "setSymbolName:", v9);
}

- (void)reset
{
  -[GCGenericDevicePhysicalInputElementModelBuilder setIdentifier:](self, "setIdentifier:", 0);
  -[GCGenericDevicePhysicalInputElementModelBuilder setNames:](self, "setNames:", 0);
  -[GCGenericDevicePhysicalInputElementModelBuilder setAnalog:](self, "setAnalog:", 0);
  -[GCGenericDevicePhysicalInputElementModelBuilder setLocalizedNameKey:](self, "setLocalizedNameKey:", 0);
  -[GCGenericDevicePhysicalInputElementModelBuilder setSymbolName:](self, "setSymbolName:", 0);
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
  void *v22;
  void *v23;

  v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDevicePhysicalInputElementModelBuilder identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDevicePhysicalInputElementModel.m"), 154, CFSTR("'identifier' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDevicePhysicalInputElementModelBuilder names](self, "names");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDevicePhysicalInputElementModel.m"), 158, CFSTR("'names' can not be nil"));

  }
  if (!objc_msgSend(v8, "count"))
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDevicePhysicalInputElementModel.m"), 159, CFSTR("'names' can not be empty"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDevicePhysicalInputElementModelBuilder isAnalog](self, "isAnalog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  -[GCGenericDevicePhysicalInputElementModelBuilder localizedNameKey](self, "localizedNameKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[4];
  v4[4] = v15;

  -[GCGenericDevicePhysicalInputElementModelBuilder symbolName](self, "symbolName");
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
    v8.super_class = (Class)GCGenericDevicePhysicalInputElementModelBuilder;
    v5 = -[GCGenericDevicePhysicalInputElementModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)isAnalog
{
  return self->_analog;
}

- (void)setAnalog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedNameKey
{
  return self->_localizedNameKey;
}

- (void)setLocalizedNameKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_localizedNameKey, 0);
  objc_storeStrong((id *)&self->_analog, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (GCGenericDevicePhysicalInputElementModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  GCGenericDevicePhysicalInputElementModelBuilder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  GCGenericDevicePhysicalInputElementModelBuilder *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  id v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[4];

  v74[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[GCGenericDevicePhysicalInputElementModelBuilder init](self, "init");
  v62 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Identifier"), objc_opt_class(), &v62);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v62;
  if (!v8)
  {
    if (a4)
    {
      v73[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v24;
      v73[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v25;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
  -[GCGenericDevicePhysicalInputElementModelBuilder setIdentifier:](v7, "setIdentifier:", v8);

  v61 = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Aliases"), objc_opt_class(), &v61);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v61;
  if (!v10)
  {
    if (a4)
    {
      v71[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v27;
      v71[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v28;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy_;
  v59 = __Block_byref_object_dispose_;
  v60 = 0;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __105__GCGenericDevicePhysicalInputElementModelBuilder_Serialization__initWithDictionaryRepresentation_error___block_invoke;
  v54[3] = &unk_1EA4D2B10;
  v54[4] = &v55;
  objc_msgSend(v10, "gc_enumerateObjectsUsingBlock:", v54);
  v12 = v56[5];
  if (v12)
  {
    if (a4)
    {
      v69[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v50;
      v69[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend((id)v56[5], "localizedFailureReason");
      v30 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v30;
      v31 = &stru_1EA4D5008;
      if (v30)
        v31 = (const __CFString *)v30;
      v70[1] = v31;
      v69[2] = *MEMORY[0x1E0CB3388];
      v32 = v56[5];
      if (v32)
      {
        v33 = (void *)v56[5];
        v34 = (uint64_t)v33;
      }
      else
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v34 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v56[5];
      }
      v47 = (void *)v34;
      v70[2] = v34;
      v69[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v33, "gc_failingKeyPath");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (!v44)
        v44 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v44, "arrayByAddingObject:", CFSTR("Aliases"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v70[3] = v48;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v46);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v32)
    }
  }
  else
  {
    -[GCGenericDevicePhysicalInputElementModelBuilder setNames:](v7, "setNames:", v10);
  }
  _Block_object_dispose(&v55, 8);

  if (v12)
  {
LABEL_6:
    v13 = 0;
    goto LABEL_20;
  }
  v53 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("Analog"), objc_opt_class(), &v53);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v53;
  v16 = v15;
  if (!v14 && v15)
  {
    if (a4)
    {
      v67[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v35;
      v67[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v16, "localizedFailureReason");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v36;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v37);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
  if (v14)
    -[GCGenericDevicePhysicalInputElementModelBuilder setAnalog:](v7, "setAnalog:", v14);

  v52 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("LocalizedNameKey"), objc_opt_class(), &v52);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v52;
  v19 = v18;
  if (!v17 && v18)
  {
    if (a4)
    {
      v65[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v38;
      v65[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v19, "localizedFailureReason");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v39;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
  if (v17)
    -[GCGenericDevicePhysicalInputElementModelBuilder setLocalizedNameKey:](v7, "setLocalizedNameKey:", v17);

  v51 = 0;
  objc_msgSend(v6, "gc_objectForKey:ofClass:error:", CFSTR("SymbolName"), objc_opt_class(), &v51);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v51;
  v22 = v21;
  if (!v20 && v21)
  {
    if (a4)
    {
      v63[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), objc_msgSend((id)objc_opt_class(), "modelClass"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v41;
      v63[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v22, "localizedFailureReason");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v42;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
  if (v20)
    -[GCGenericDevicePhysicalInputElementModelBuilder setSymbolName:](v7, "setSymbolName:", v20);

  v13 = v7;
LABEL_20:

  return v13;
}

void __105__GCGenericDevicePhysicalInputElementModelBuilder_Serialization__initWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
{
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = objc_opt_class();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v10 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
  {
    v21[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "localizedFailureReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v21[1] = CFSTR("GCFailingKeyPathErrorKey");
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    *a4 = 1;
  }

}

@end
