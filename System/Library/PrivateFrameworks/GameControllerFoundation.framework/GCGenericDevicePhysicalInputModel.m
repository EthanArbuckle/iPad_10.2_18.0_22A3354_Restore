@implementation GCGenericDevicePhysicalInputModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputModel)init
{
  -[GCGenericDevicePhysicalInputModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDevicePhysicalInputModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDevicePhysicalInputModel *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSSet *elements;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDevicePhysicalInputModel;
  v3 = a3;
  v4 = -[GCGenericDevicePhysicalInputModel init](&v10, sel_init);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("elements"));
  v7 = objc_claimAutoreleasedReturnValue();

  elements = v4->_elements;
  v4->_elements = (NSSet *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCGenericDevicePhysicalInputModel elements](self, "elements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("elements"));

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
    if ((-[GCGenericDevicePhysicalInputModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
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
      || !-[GCGenericDevicePhysicalInputModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_7;
    }
  }
  -[GCGenericDevicePhysicalInputModel elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

LABEL_8:
  return v7;
}

+ (id)description
{
  return CFSTR("Physical Input");
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("{\n"));
  objc_msgSend(v3, "appendString:", CFSTR("\t elements = ["));
  -[GCGenericDevicePhysicalInputModel elements](self, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t %@,"), v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\t]\n"));
  objc_msgSend(v3, "appendString:", CFSTR("}"));

  return v3;
}

uint64_t __56__GCGenericDevicePhysicalInputModel_redactedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSSet)elements
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

+ (GCGenericDevicePhysicalInputModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
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
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Elements"), objc_opt_class(), v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v45[0];
  if (v5)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__14;
    v43 = __Block_byref_object_dispose__14;
    v44 = 0;
    v6 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __92__GCGenericDevicePhysicalInputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
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
      objc_msgSend(v34, "setElements:", v9);
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
      objc_msgSend(v18, "arrayByAddingObject:", CFSTR("Elements"));
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
  return (GCGenericDevicePhysicalInputModel *)v23;
}

void __92__GCGenericDevicePhysicalInputModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  _BYTE *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _BYTE *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  id obj;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  _QWORD v67[4];
  _QWORD v68[4];
  void *v69;
  _QWORD v70[2];
  _QWORD v71[4];

  v71[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_opt_class();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  v56 = v7;
  (*((void (**)(id, uint64_t, id *))v7 + 2))(v7, v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    v11 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v61 = 0;
    +[GCGenericDevicePhysicalInputElementModel modelWithDictionaryRepresentation:error:](GCGenericDevicePhysicalInputElementModel, "modelWithDictionaryRepresentation:error:", v10, &v61);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11, v61);
    if (v12)
    {
      v13 = a3;
      v54 = a4;
      objc_msgSend(v12, "names");
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v58 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "member:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v64[0] = *MEMORY[0x1E0CB2D68];
              +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Duplicate definition of '%@' with name '%@'."), objc_opt_class(), v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v65[0] = v21;
              v64[1] = CFSTR("GCFailingKeyPathErrorKey");
              +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), v13);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v22;
              +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v63, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v65[1] = v23;
              +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v24);
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v27 = *(void **)(v26 + 40);
              *(_QWORD *)(v26 + 40) = v25;

              *v54 = 1;
              goto LABEL_13;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v16)
            continue;
          break;
        }
      }

      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v14);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
LABEL_13:

    }
    else
    {
      v67[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedDescription");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      v37 = &stru_1EA4D5008;
      if (v35)
        v37 = (const __CFString *)v35;
      v68[0] = v37;
      v67[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedFailureReason");
      v38 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)v38;
      if (!v38)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model."), objc_opt_class());
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v39 = a4;
      v53 = (void *)v38;
      v68[1] = v38;
      v67[2] = *MEMORY[0x1E0CB3388];
      v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v41 = v40;
      v42 = (uint64_t)v40;
      if (!v40)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v42 = objc_claimAutoreleasedReturnValue();
        v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      v52 = (void *)v42;
      v68[2] = v42;
      v67[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v41, "gc_failingKeyPath");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      if (v43)
        v45 = (void *)v43;
      else
        v45 = (void *)MEMORY[0x1E0C9AA60];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "arrayByAddingObject:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v68[3] = v47;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v68, v67, 4);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v48);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v51 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = v49;

      if (!v40)
      if (!v55)

      *v39 = 1;
    }

  }
  else
  {
    v70[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedFailureReason");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v28;
    v70[1] = CFSTR("GCFailingKeyPathErrorKey");
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v29;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v69, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v30;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    *a4 = 1;
  }

}

@end
