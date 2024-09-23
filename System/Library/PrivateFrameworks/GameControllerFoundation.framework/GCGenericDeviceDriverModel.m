@implementation GCGenericDeviceDriverModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDriverModel)init
{
  -[GCGenericDeviceDriverModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceDriverModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDriverModel *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *elements;
  uint64_t v9;
  GCGenericDeviceDriverPropertiesModel *properties;
  uint64_t v11;
  GCGenericDeviceInputEventDriverModel *input;
  uint64_t v13;
  GCGenericDeviceRumbleModel *rumble;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDriverModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDriverModel init](&v16, sel_init);
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("elements"));
  v7 = objc_claimAutoreleasedReturnValue();
  elements = v4->_elements;
  v4->_elements = (NSSet *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("properties"));
  v9 = objc_claimAutoreleasedReturnValue();
  properties = v4->_properties;
  v4->_properties = (GCGenericDeviceDriverPropertiesModel *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
  v11 = objc_claimAutoreleasedReturnValue();
  input = v4->_input;
  v4->_input = (GCGenericDeviceInputEventDriverModel *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rumble"));
  v13 = objc_claimAutoreleasedReturnValue();

  rumble = v4->_rumble;
  v4->_rumble = (GCGenericDeviceRumbleModel *)v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[GCGenericDeviceDriverModel elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("elements"));

  -[GCGenericDeviceDriverModel properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("properties"));

  -[GCGenericDeviceDriverModel input](self, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("input"));

  -[GCGenericDeviceDriverModel rumble](self, "rumble");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("rumble"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceDriverModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_10;
    }
LABEL_6:
    -[GCGenericDeviceDriverModel elements](self, "elements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "elements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7))
    {
      v11 = 0;
LABEL_26:

      goto LABEL_27;
    }
    -[GCGenericDeviceDriverModel properties](self, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[GCGenericDeviceDriverModel properties](self, "properties");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "properties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v10))
      {
        v11 = 0;
        goto LABEL_24;
      }
      v27 = v10;
    }
    -[GCGenericDeviceDriverModel input](self, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v25 = v12;
    }
    else
    {
      -[GCGenericDeviceDriverModel input](self, "input");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "input");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqual:"))
      {
        v11 = 0;
        goto LABEL_22;
      }
      v24 = v14;
      v25 = v12;
    }
    -[GCGenericDeviceDriverModel rumble](self, "rumble");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rumble");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

      v11 = 1;
    }
    else
    {
      v17 = (void *)v16;
      -[GCGenericDeviceDriverModel rumble](self, "rumble");
      v23 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rumble");
      v22 = v3;
      v19 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v18, "isEqual:", v20);

      v9 = v19;
      v3 = v22;

      v8 = v23;
    }
    v14 = v24;
    v12 = v25;
    if (v25 == v13)
    {
LABEL_23:

      v10 = v27;
      if (v8 == v9)
      {
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:

      goto LABEL_25;
    }
LABEL_22:

    goto LABEL_23;
  }
  if ((-[GCGenericDeviceDriverModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    goto LABEL_6;
LABEL_10:
  v11 = 0;
LABEL_27:

  return v11;
}

+ (id)description
{
  return CFSTR("Driver");
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
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverModel elements](self, "elements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "debugDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverModel properties](self, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "debugDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverModel input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverModel rumble](self, "rumble");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t elements = %@\n\t properties = %@\n\t input = %@\n\t rumble = %@\n}"), v14, self, v4, v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSSet)elements
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDriverPropertiesModel)properties
{
  return (GCGenericDeviceDriverPropertiesModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceInputEventDriverModel)input
{
  return (GCGenericDeviceInputEventDriverModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceRumbleModel)rumble
{
  return (GCGenericDeviceRumbleModel *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rumble, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

+ (GCGenericDeviceDriverModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
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
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
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
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  id v98[7];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[4];
  _QWORD v104[4];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[2];
  _QWORD v114[4];

  v114[2] = *MEMORY[0x1E0C80C00];
  v81 = (void *)objc_opt_new();
  v98[0] = 0;
  v80 = a3;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Elements"), objc_opt_class(), v98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v98[0];
  if (!v5)
  {
    if (a4)
    {
      v113[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = v38;
      v113[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v76, "localizedFailureReason");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v114[1] = v39;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = 0;
    v36 = v76;
    goto LABEL_39;
  }
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__12;
  v96 = __Block_byref_object_dispose__12;
  v97 = 0;
  v6 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v5, "count"));
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __85__GCGenericDeviceDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
  v88[3] = &unk_1EA4D2C30;
  v91 = &v92;
  v8 = v6;
  v89 = v8;
  v9 = v7;
  v90 = v9;
  objc_msgSend(v5, "gc_enumerateObjectsUsingBlock:", v88);
  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(v5, "count");
  if (v10 == v11)
  {
    objc_msgSend(v81, "setElements:", v9);
  }
  else if (a4)
  {
    v111[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend((id)v93[5], "localizedDescription");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "length"))
      objc_msgSend((id)v93[5], "localizedDescription");
    else
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v72;
    v111[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend((id)v93[5], "localizedFailureReason");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &stru_1EA4D5008;
    if (v12)
      v14 = (const __CFString *)v12;
    v112[1] = v14;
    v111[2] = *MEMORY[0x1E0CB3388];
    v15 = v93[5];
    if (v15)
    {
      v16 = (void *)v93[5];
      v17 = (uint64_t)v16;
    }
    else
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v17 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v93[5];
    }
    v71 = (void *)v17;
    v112[2] = v17;
    v111[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v16, "gc_failingKeyPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
      v18 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v18, "arrayByAddingObject:", CFSTR("Elements"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v112[3] = v20;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v112, v111, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
  }

  _Block_object_dispose(&v92, 8);
  if (v10 == v11)
  {
    v87 = 0;
    objc_msgSend(v80, "gc_objectForKey:ofClass:error:", CFSTR("Properties"), objc_opt_class(), &v87);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v87;
    v24 = v23;
    if (!v22 && v23)
    {
      if (!a4)
      {
        v26 = v23;
        goto LABEL_99;
      }
      v109[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v41;
      v109[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v24, "localizedFailureReason");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v42;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v43);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v26 = v24;
    }
    else
    {
      if (!v22)
      {
        v26 = v23;
        goto LABEL_26;
      }
      v86 = 0;
      +[GCGenericDeviceDriverPropertiesModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDriverPropertiesModel, "modelWithDictionaryRepresentation:error:", v22, &v86);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v86;

      if (v25)
      {
        objc_msgSend(v81, "setProperties:", v25);

LABEL_26:
        v85 = 0;
        objc_msgSend(v80, "gc_objectForKey:ofClass:error:", CFSTR("Input"), objc_opt_class(), &v85);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v85;
        v30 = v29;
        if (!v28 && v29)
        {
          if (!a4)
          {
            v26 = v29;
            goto LABEL_101;
          }
          v105[0] = *MEMORY[0x1E0CB2D50];
          +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v106[0] = v44;
          v105[1] = *MEMORY[0x1E0CB2D68];
          objc_msgSend(v30, "localizedFailureReason");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v106[1] = v45;
          +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v46);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v26 = v30;
        }
        else
        {
          if (!v28)
          {
            v26 = v29;
            goto LABEL_32;
          }
          v84 = 0;
          +[GCGenericDeviceInputEventDriverModel modelWithDictionaryRepresentation:error:](GCGenericDeviceInputEventDriverModel, "modelWithDictionaryRepresentation:error:", v28, &v84);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v84;

          if (v31)
          {
            objc_msgSend(v81, "setInput:", v31);

LABEL_32:
            v83 = 0;
            objc_msgSend(v80, "gc_objectForKey:ofClass:error:", CFSTR("Rumble"), objc_opt_class(), &v83);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v83;
            v34 = v33;
            if (!v32 && v33)
            {
              if (!a4)
              {
                v26 = v33;
                goto LABEL_103;
              }
              v101[0] = *MEMORY[0x1E0CB2D50];
              +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v102[0] = v47;
              v101[1] = *MEMORY[0x1E0CB2D68];
              objc_msgSend(v34, "localizedFailureReason");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v102[1] = v48;
              +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v49);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              v26 = v34;
            }
            else
            {
              if (!v32)
              {
                v26 = v33;
                goto LABEL_38;
              }
              v82 = 0;
              +[GCGenericDeviceRumbleModel modelWithDictionaryRepresentation:error:](GCGenericDeviceRumbleModel, "modelWithDictionaryRepresentation:error:", v32, &v82);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v82;

              if (v35)
              {
                objc_msgSend(v81, "setRumble:", v35);

LABEL_38:
                v36 = v81;
                objc_msgSend(v81, "build");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = 0;
LABEL_39:

                goto LABEL_40;
              }
              if (!a4)
                goto LABEL_103;
              v99[0] = *MEMORY[0x1E0CB2D50];
              objc_msgSend(v26, "localizedDescription");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v47;
              if (!v47)
              {
                +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v100[0] = v48;
              v99[1] = *MEMORY[0x1E0CB2D68];
              objc_msgSend(v26, "localizedFailureReason");
              v64 = objc_claimAutoreleasedReturnValue();
              v65 = (void *)v64;
              if (!v64)
              {
                +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("Input"));
                v64 = objc_claimAutoreleasedReturnValue();
              }
              v79 = (void *)v64;
              v100[1] = v64;
              v99[2] = *MEMORY[0x1E0CB3388];
              v66 = v26;
              if (!v26)
              {
                +[NSNull null](&off_1F03A9C88, "null");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v100[2] = v66;
              v99[3] = CFSTR("GCFailingKeyPathErrorKey");
              objc_msgSend(v26, "gc_failingKeyPath");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v67;
              if (!v67)
                v67 = (void *)MEMORY[0x1E0C9AA60];
              objc_msgSend(v67, "arrayByAddingObject:", CFSTR("Input"));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v100[3] = v69;
              +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v100, v99, 4);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v70);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              if (!v26)
              if (!v65)

              if (v47)
                goto LABEL_97;
            }

LABEL_97:
LABEL_103:

            goto LABEL_104;
          }
          if (!a4)
            goto LABEL_101;
          v103[0] = *MEMORY[0x1E0CB2D50];
          objc_msgSend(v26, "localizedDescription");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (!v44)
          {
            +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v104[0] = v45;
          v103[1] = *MEMORY[0x1E0CB2D68];
          objc_msgSend(v26, "localizedFailureReason");
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v57;
          if (!v57)
          {
            +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("Input"));
            v57 = objc_claimAutoreleasedReturnValue();
          }
          v78 = (void *)v57;
          v104[1] = v57;
          v103[2] = *MEMORY[0x1E0CB3388];
          v59 = v26;
          if (!v26)
          {
            +[NSNull null](&off_1F03A9C88, "null");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v104[2] = v59;
          v103[3] = CFSTR("GCFailingKeyPathErrorKey");
          objc_msgSend(v26, "gc_failingKeyPath");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (!v60)
            v60 = (void *)MEMORY[0x1E0C9AA60];
          objc_msgSend(v60, "arrayByAddingObject:", CFSTR("Input"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v104[3] = v62;
          +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v104, v103, 4);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v63);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          if (!v26)
          if (!v58)

          if (v44)
            goto LABEL_82;
        }

LABEL_82:
LABEL_101:

        goto LABEL_104;
      }
      if (!a4)
      {
LABEL_99:

LABEL_104:
        v27 = 0;
        v36 = v26;
        goto LABEL_39;
      }
      v107[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v26, "localizedDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (!v41)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v108[0] = v42;
      v107[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v26, "localizedFailureReason");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v50;
      if (!v50)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("Input"));
        v50 = objc_claimAutoreleasedReturnValue();
      }
      v77 = (void *)v50;
      v108[1] = v50;
      v107[2] = *MEMORY[0x1E0CB3388];
      v52 = v26;
      if (!v26)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v108[2] = v52;
      v107[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v26, "gc_failingKeyPath");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (!v53)
        v53 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v53, "arrayByAddingObject:", CFSTR("Properties"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v108[3] = v55;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v108, v107, 4);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v56);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v26)
      if (!v51)

      if (v41)
      {
LABEL_67:

        goto LABEL_99;
      }
    }

    goto LABEL_67;
  }
  v27 = 0;
LABEL_40:

  return (GCGenericDeviceDriverModel *)v27;
}

void __85__GCGenericDeviceDriverModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
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
  uint64_t v17;
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
  if (v11)
  {
    v12 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v54 = 0;
    +[GCGenericDeviceElementModel modelWithDictionaryRepresentation:error:](GCGenericDeviceElementModel, "modelWithDictionaryRepresentation:error:", v11, &v54);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12, v54);
    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "member:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v57[0] = *MEMORY[0x1E0CB2D68];
        v17 = objc_opt_class();
        objc_msgSend(v13, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Duplicate definition of '%@' with identifier '%@'."), v17, v18);
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
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
        v26 = *(void **)(a1 + 32);
        objc_msgSend(v13, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v27);

      }
    }
    else
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
    }

  }
  else
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
  }

}

@end
