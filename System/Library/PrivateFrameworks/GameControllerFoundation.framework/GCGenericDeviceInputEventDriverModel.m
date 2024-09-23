@implementation GCGenericDeviceInputEventDriverModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceInputEventDriverModel)init
{
  -[GCGenericDeviceInputEventDriverModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceInputEventDriverModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceInputEventDriverModel *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *gamepadEventFields;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceInputEventDriverModel;
  v3 = a3;
  v4 = -[GCGenericDeviceInputEventDriverModel init](&v10, sel_init);
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("gamepadEventFields"));
  v7 = objc_claimAutoreleasedReturnValue();

  gamepadEventFields = v4->_gamepadEventFields;
  v4->_gamepadEventFields = (NSSet *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCGenericDeviceInputEventDriverModel gamepadEventFields](self, "gamepadEventFields");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("gamepadEventFields"));

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
    if ((-[GCGenericDeviceInputEventDriverModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
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
      || !-[GCGenericDeviceInputEventDriverModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_7;
    }
  }
  -[GCGenericDeviceInputEventDriverModel gamepadEventFields](self, "gamepadEventFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gamepadEventFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

LABEL_8:
  return v7;
}

+ (id)description
{
  return CFSTR("Input Event Driver");
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
  -[GCGenericDeviceInputEventDriverModel gamepadEventFields](self, "gamepadEventFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t gamepadEventFields = %@\n}"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)gamepadEventFields
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gamepadEventFields, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
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
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("GamepadEventFields"), objc_opt_class(), v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v45[0];
  if (v5)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__0;
    v43 = __Block_byref_object_dispose__0;
    v44 = 0;
    v6 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __95__GCGenericDeviceInputEventDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
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
      objc_msgSend(v34, "setGamepadEventFields:", v9);
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
      objc_msgSend(v18, "arrayByAddingObject:", CFSTR("GamepadEventFields"));
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
  return v23;
}

void __95__GCGenericDeviceInputEventDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
{
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id obj;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[4];
  _QWORD v60[4];
  void *v61;
  _QWORD v62[2];
  _QWORD v63[4];

  v63[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = objc_opt_class();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
  {
    v62[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedFailureReason");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v28;
    v62[1] = CFSTR("GCFailingKeyPathErrorKey");
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v29;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v61, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v30;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    *a4 = 1;
    goto LABEL_9;
  }
  v12 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v54 = 0;
  +[GCGenericDeviceInputGamepadEventFieldModel modelWithDictionaryRepresentation:error:](GCGenericDeviceInputGamepadEventFieldModel, "modelWithDictionaryRepresentation:error:", v11, &v54);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, v54);
  if (!v13)
  {
    v59[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedDescription");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = &stru_1EA4D5008;
    v53 = (void *)v35;
    if (v35)
      v36 = (const __CFString *)v35;
    v60[0] = v36;
    v59[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedFailureReason");
    v37 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v37;
    if (!v37)
    {
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model."), objc_opt_class());
      v37 = objc_claimAutoreleasedReturnValue();
    }
    v51 = (void *)v37;
    v60[1] = v37;
    v59[2] = *MEMORY[0x1E0CB3388];
    v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v39 = v38;
    v40 = (uint64_t)v38;
    if (!v38)
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v40 = objc_claimAutoreleasedReturnValue();
      v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    v50 = (void *)v40;
    v60[2] = v40;
    v59[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v39, "gc_failingKeyPath");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (void *)v41;
    else
      v43 = (void *)MEMORY[0x1E0C9AA60];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "arrayByAddingObject:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v45;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v60, v59, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v46);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v49 = *(void **)(v48 + 40);
    *(_QWORD *)(v48 + 40) = v47;

    if (!v38)
    if (!v52)

    *a4 = 1;
    goto LABEL_8;
  }
  v14 = objc_msgSend(v13, "extendedIndex");
  if (v14 < 0)
    goto LABEL_7;
  v15 = v14;
  v16 = *(void **)(a1 + 32);
  +[NSNumber numberWithInteger:](&off_1F03A9E90, "numberWithInteger:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "member:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v26 = *(void **)(a1 + 32);
    +[NSNumber numberWithInteger:](&off_1F03A9E90, "numberWithInteger:", objc_msgSend(v13, "extendedIndex"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v27);

LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
    goto LABEL_8;
  }
  v57[0] = *MEMORY[0x1E0CB2D68];
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Duplicate definition of '%@' with ExtendedIndex '%zi'."), objc_opt_class(), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v19;
  v57[1] = CFSTR("GCFailingKeyPathErrorKey");
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v20;
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v56, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v21;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  *a4 = 1;
LABEL_8:

LABEL_9:
}

@end
