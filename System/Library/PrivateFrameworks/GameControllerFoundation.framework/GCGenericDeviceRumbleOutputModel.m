@implementation GCGenericDeviceRumbleOutputModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleOutputModel)init
{
  -[GCGenericDeviceRumbleOutputModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceRumbleOutputModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceRumbleOutputModel *v4;
  uint64_t v5;
  NSString *elementIdentifier;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *fields;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceRumbleOutputModel;
  v3 = a3;
  v4 = -[GCGenericDeviceRumbleOutputModel init](&v12, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("fields"));
  v9 = objc_claimAutoreleasedReturnValue();

  fields = v4->_fields;
  v4->_fields = (NSArray *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GCGenericDeviceRumbleOutputModel elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("elementIdentifier"));

  -[GCGenericDeviceRumbleOutputModel fields](self, "fields");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fields"));

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
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceRumbleOutputModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
LABEL_8:
      v9 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceRumbleOutputModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_8;
    }
  }
  -[GCGenericDeviceRumbleOutputModel elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[GCGenericDeviceRumbleOutputModel fields](self, "fields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

LABEL_11:
  return v9;
}

+ (id)description
{
  return CFSTR("Rumble Output");
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputModel elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputModel fields](self, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t elementIdentifier = %@\n\t fields = %@\n}"), v4, self, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)fields
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  id v45;
  id v46[7];
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v35 = (void *)objc_opt_new();
  v46[0] = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ElementIdentifier"), objc_opt_class(), v46);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v46[0];
  if (!v5)
  {
    if (a4)
    {
      v51[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v24;
      v51[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v6, "localizedFailureReason");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v25;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_28;
  }
  objc_msgSend(v35, "setElementIdentifier:", v5);

  v45 = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Fields"), objc_opt_class(), &v45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v45;
  if (!v7)
  {
    if (a4)
    {
      v49[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v27;
      v49[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v6, "localizedFailureReason");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v28;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_28:
    v22 = 0;
    goto LABEL_21;
  }
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10;
  v43 = __Block_byref_object_dispose__10;
  v44 = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v7, "count"));
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __91__GCGenericDeviceRumbleOutputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
  v36[3] = &unk_1EA4D40C8;
  v38 = &v39;
  v9 = v8;
  v37 = v9;
  objc_msgSend(v7, "gc_enumerateObjectsUsingBlock:", v36);
  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(v7, "count");
  if (v10 == v11)
  {
    objc_msgSend(v35, "setFields:", v9);
  }
  else if (a4)
  {
    v47[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend((id)v40[5], "localizedDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "length"))
      objc_msgSend((id)v40[5], "localizedDescription");
    else
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v31;
    v47[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend((id)v40[5], "localizedFailureReason");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &stru_1EA4D5008;
    if (v12)
      v14 = (const __CFString *)v12;
    v48[1] = v14;
    v47[2] = *MEMORY[0x1E0CB3388];
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
    v30 = (void *)v17;
    v48[2] = v17;
    v47[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v16, "gc_failingKeyPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
      v18 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v18, "arrayByAddingObject:", CFSTR("Fields"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v20;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
  }

  _Block_object_dispose(&v39, 8);
  if (v10 != v11)
  {
    v22 = 0;
    goto LABEL_23;
  }
  v6 = v35;
  objc_msgSend(v35, "build");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
LABEL_21:

LABEL_23:
  return v22;
}

void __91__GCGenericDeviceRumbleOutputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  _QWORD v42[4];
  _QWORD v43[4];
  void *v44;
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = objc_opt_class();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    v12 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v40 = 0;
    +[GCGenericDeviceRumbleOutputFieldModel modelWithDictionaryRepresentation:error:](GCGenericDeviceRumbleOutputFieldModel, "modelWithDictionaryRepresentation:error:", v11, &v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12, v40);
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
    }
    else
    {
      v42[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedDescription");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = &stru_1EA4D5008;
      v39 = (void *)v21;
      if (v21)
        v22 = (const __CFString *)v21;
      v43[0] = v22;
      v42[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedFailureReason");
      v23 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v23;
      if (!v23)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model."), objc_opt_class());
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v37 = (void *)v23;
      v43[1] = v23;
      v42[2] = *MEMORY[0x1E0CB3388];
      v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v25 = v24;
      v26 = (uint64_t)v24;
      if (!v24)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v26 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      v36 = (void *)v26;
      v43[2] = v26;
      v42[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v25, "gc_failingKeyPath");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = (void *)v27;
      else
        v29 = (void *)MEMORY[0x1E0C9AA60];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "arrayByAddingObject:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v43[3] = v31;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v32);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

      if (!v24)
      if (!v38)

      *a4 = 1;
    }

  }
  else
  {
    v45[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedFailureReason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v14;
    v45[1] = CFSTR("GCFailingKeyPathErrorKey");
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v15;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v44, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v16;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    *a4 = 1;
  }

}

@end
