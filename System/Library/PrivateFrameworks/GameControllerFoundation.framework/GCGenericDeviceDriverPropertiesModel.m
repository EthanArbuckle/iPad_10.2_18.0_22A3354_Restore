@implementation GCGenericDeviceDriverPropertiesModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDriverPropertiesModel)init
{
  -[GCGenericDeviceDriverPropertiesModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceDriverPropertiesModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDriverPropertiesModel *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *properties;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDriverPropertiesModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDriverPropertiesModel init](&v10, sel_init);
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("properties"));
  v7 = objc_claimAutoreleasedReturnValue();

  properties = v4->_properties;
  v4->_properties = (NSSet *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCGenericDeviceDriverPropertiesModel properties](self, "properties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("properties"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceDriverPropertiesModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
LABEL_7:
      v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceDriverPropertiesModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_7;
    }
  }
  -[GCGenericDeviceDriverPropertiesModel properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

LABEL_8:
  return v7;
}

+ (id)description
{
  return CFSTR("Driver Properties");
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverPropertiesModel properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t properties = %@\n}"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)properties
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

+ (GCGenericDeviceDriverPropertiesModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  id v45[7];
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[2];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v34 = (void *)objc_opt_new();
  v45[0] = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Properties"), objc_opt_class(), v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v45[0];
  if (v5)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__13;
    v43 = __Block_byref_object_dispose__13;
    v44 = 0;
    v6 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __95__GCGenericDeviceDriverPropertiesModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
    v35[3] = &unk_1EA4D2C30;
    v38 = &v39;
    v8 = v6;
    v36 = v8;
    v9 = v7;
    v37 = v9;
    objc_msgSend(v5, "gc_enumerateObjectsUsingBlock:", v35);
    v10 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(v5, "count");
    if (v10 == v11)
    {
      objc_msgSend(v34, "setProperties:", v9);
    }
    else if (a4)
    {
      v46[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend((id)v40[5], "localizedDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "length"))
        objc_msgSend((id)v40[5], "localizedDescription");
      else
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v29;
      v46[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend((id)v40[5], "localizedFailureReason");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = &stru_1EA4D5008;
      if (v12)
        v14 = (const __CFString *)v12;
      v47[1] = v14;
      v46[2] = *MEMORY[0x1E0CB3388];
      v15 = v40[5];
      if (v15)
      {
        v16 = (void *)v40[5];
        v17 = (uint64_t)v16;
      }
      else
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v17 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v40[5];
      }
      v28 = (void *)v17;
      v47[2] = v17;
      v46[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v16, "gc_failingKeyPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
        v18 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v18, "arrayByAddingObject:", CFSTR("Properties"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v20;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v15)
    }

    _Block_object_dispose(&v39, 8);
    if (v10 != v11)
    {
      v23 = 0;
      goto LABEL_22;
    }
    v22 = v34;
    objc_msgSend(v34, "build");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
  }
  else
  {
    if (a4)
    {
      v48[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v25;
      v48[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v33, "localizedFailureReason");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v26;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = 0;
    v22 = v33;
  }

LABEL_22:
  return (GCGenericDeviceDriverPropertiesModel *)v23;
}

void __95__GCGenericDeviceDriverPropertiesModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
{
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id obj;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[4];
  _QWORD v55[4];
  void *v56;
  _QWORD v57[2];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = objc_opt_class();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    v12 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v49 = 0;
    +[GCGenericDeviceDriverPropertyModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDriverPropertyModel, "modelWithDictionaryRepresentation:error:", v11, &v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12, v49);
    if (v13)
    {
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "member:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v52[0] = *MEMORY[0x1E0CB2D68];
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Duplicate definition of '%@' with name '%@'."), objc_opt_class(), v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = v16;
        v52[1] = CFSTR("GCFailingKeyPathErrorKey");
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v17;
        +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v51, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v18;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

        *a4 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
      }

    }
    else
    {
      v54[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedDescription");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = &stru_1EA4D5008;
      v48 = (void *)v30;
      if (v30)
        v31 = (const __CFString *)v30;
      v55[0] = v31;
      v54[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedFailureReason");
      v32 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v32;
      if (!v32)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model."), objc_opt_class());
        v32 = objc_claimAutoreleasedReturnValue();
      }
      v46 = (void *)v32;
      v55[1] = v32;
      v54[2] = *MEMORY[0x1E0CB3388];
      v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v34 = v33;
      v35 = (uint64_t)v33;
      if (!v33)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v35 = objc_claimAutoreleasedReturnValue();
        v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      v45 = (void *)v35;
      v55[2] = v35;
      v54[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v34, "gc_failingKeyPath");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
        v38 = (void *)v36;
      else
        v38 = (void *)MEMORY[0x1E0C9AA60];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "arrayByAddingObject:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v55[3] = v40;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v41);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v44 = *(void **)(v43 + 40);
      *(_QWORD *)(v43 + 40) = v42;

      if (!v33)
      if (!v47)

      *a4 = 1;
    }

  }
  else
  {
    v57[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedFailureReason");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v23;
    v57[1] = CFSTR("GCFailingKeyPathErrorKey");
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v24;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v56, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v25;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    *a4 = 1;
  }

}

@end
