@implementation GCGenericDeviceRumbleModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleModel)init
{
  -[GCGenericDeviceRumbleModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceRumbleModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceRumbleModel *v4;
  float v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *actuators;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *nodes;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *outputs;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)GCGenericDeviceRumbleModel;
  v3 = a3;
  v4 = -[GCGenericDeviceRumbleModel init](&v19, sel_init);
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("dispatchFrequency"));
  v4->_dispatchFrequency = v5;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("actuators"));
  v8 = objc_claimAutoreleasedReturnValue();
  actuators = v4->_actuators;
  v4->_actuators = (NSArray *)v8;

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v21, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("nodes"));
  v12 = objc_claimAutoreleasedReturnValue();
  nodes = v4->_nodes;
  v4->_nodes = (NSArray *)v12;

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("outputs"));
  v16 = objc_claimAutoreleasedReturnValue();

  outputs = v4->_outputs;
  v4->_outputs = (NSArray *)v16;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[GCGenericDeviceRumbleModel dispatchFrequency](self, "dispatchFrequency");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("dispatchFrequency"));
  -[GCGenericDeviceRumbleModel actuators](self, "actuators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actuators"));

  -[GCGenericDeviceRumbleModel nodes](self, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nodes"));

  -[GCGenericDeviceRumbleModel outputs](self, "outputs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("outputs"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceRumbleModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      goto LABEL_10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceRumbleModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_10;
    }
  }
  -[GCGenericDeviceRumbleModel dispatchFrequency](self, "dispatchFrequency");
  v6 = v5;
  objc_msgSend(v4, "dispatchFrequency");
  if (v6 != v7)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_15;
  }
  -[GCGenericDeviceRumbleModel actuators](self, "actuators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actuators");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v9))
  {
    -[GCGenericDeviceRumbleModel nodes](self, "nodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", v11))
    {
      -[GCGenericDeviceRumbleModel outputs](self, "outputs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "outputs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

LABEL_15:
  return v14;
}

+ (id)description
{
  return CFSTR("Rumble");
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleModel dispatchFrequency](self, "dispatchFrequency");
  v6 = v5;
  -[GCGenericDeviceRumbleModel actuators](self, "actuators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleModel nodes](self, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleModel outputs](self, "outputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t dispatchFrequency = %f\n\t actuators = %@\n\t nodes = %@\n\t outputs = %@\n}"), v4, self, *(_QWORD *)&v6, v9, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (float)dispatchFrequency
{
  return self->_dispatchFrequency;
}

- (NSArray)actuators
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)nodes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)outputs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_actuators, 0);
}

+ (GCGenericDeviceRumbleModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v77;
  void *v78;
  id v79;
  void *v80;
  _QWORD v81[4];
  id v82;
  uint64_t *v83;
  id v84;
  _QWORD v85[4];
  id v86;
  uint64_t *v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  id v99;
  id v100[7];
  _QWORD v101[4];
  _QWORD v102[4];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[4];
  _QWORD v106[4];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[4];

  v114[2] = *MEMORY[0x1E0C80C00];
  v80 = (void *)objc_opt_new();
  v100[0] = 0;
  v77 = a3;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("DispatchFrequency"), objc_opt_class(), v100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v100[0];
  if (!v5)
  {
    if (a4)
    {
      v113[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = v57;
      v113[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v6, "localizedFailureReason");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v114[1] = v58;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v59);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v55 = 0;
    v54 = v6;
    goto LABEL_57;
  }
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v80, "setDispatchFrequency:");

  v99 = 0;
  objc_msgSend(v77, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Actuators"), objc_opt_class(), &v99);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v99;
  if (!v7)
  {
    if (a4)
    {
      v111[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v60;
      v111[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v79, "localizedFailureReason");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v112[1] = v61;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v62);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_69;
  }
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__15;
  v97 = __Block_byref_object_dispose__15;
  v98 = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v7, "count"));
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke;
  v89[3] = &unk_1EA4D2C30;
  v92 = &v93;
  v10 = v8;
  v90 = v10;
  v11 = v9;
  v91 = v11;
  objc_msgSend(v7, "gc_enumerateObjectsUsingBlock:", v89);
  v12 = objc_msgSend(v11, "count");
  v13 = objc_msgSend(v7, "count");
  if (v12 == v13)
  {
    objc_msgSend(v80, "setActuators:", v11);
  }
  else if (a4)
  {
    v109[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend((id)v94[5], "localizedDescription");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "length"))
      objc_msgSend((id)v94[5], "localizedDescription");
    else
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v70;
    v109[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend((id)v94[5], "localizedFailureReason");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &stru_1EA4D5008;
    if (v14)
      v16 = (const __CFString *)v14;
    v110[1] = v16;
    v109[2] = *MEMORY[0x1E0CB3388];
    v17 = v94[5];
    if (v17)
    {
      v18 = (void *)v94[5];
      v19 = (uint64_t)v18;
    }
    else
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v19 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v94[5];
    }
    v69 = (void *)v19;
    v110[2] = v19;
    v109[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v18, "gc_failingKeyPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
      v20 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v20, "arrayByAddingObject:", CFSTR("Actuators"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v110[3] = v22;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v110, v109, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v17)
  }

  _Block_object_dispose(&v93, 8);
  if (v12 != v13)
    goto LABEL_58;
  v88 = 0;
  objc_msgSend(v77, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Nodes"), objc_opt_class(), &v88);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v88;
  if (!v24)
  {
    if (a4)
    {
      v107[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v63;
      v107[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v79, "localizedFailureReason");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v64;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v65);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_69;
  }
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__15;
  v97 = __Block_byref_object_dispose__15;
  v98 = 0;
  v25 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v24, "count"));
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_2;
  v85[3] = &unk_1EA4D40C8;
  v87 = &v93;
  v26 = v25;
  v86 = v26;
  objc_msgSend(v24, "gc_enumerateObjectsUsingBlock:", v85);
  v27 = objc_msgSend(v26, "count");
  v28 = objc_msgSend(v24, "count");
  if (v27 == v28)
  {
    objc_msgSend(v80, "setNodes:", v26);
  }
  else if (a4)
  {
    v105[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend((id)v94[5], "localizedDescription");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v74, "length"))
      objc_msgSend((id)v94[5], "localizedDescription");
    else
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v71;
    v105[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend((id)v94[5], "localizedFailureReason");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = &stru_1EA4D5008;
    if (v29)
      v31 = (const __CFString *)v29;
    v106[1] = v31;
    v105[2] = *MEMORY[0x1E0CB3388];
    v32 = v94[5];
    if (v32)
    {
      v33 = (void *)v94[5];
      v34 = v33;
    }
    else
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v94[5];
    }
    v106[2] = v34;
    v105[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v33, "gc_failingKeyPath");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (!v35)
      v35 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v35, "arrayByAddingObject:", CFSTR("Nodes"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v106[3] = v37;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v106, v105, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v38);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v32)
  }

  _Block_object_dispose(&v93, 8);
  if (v27 != v28)
    goto LABEL_58;
  v84 = 0;
  objc_msgSend(v77, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Outputs"), objc_opt_class(), &v84);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v84;
  if (!v39)
  {
    if (a4)
    {
      v103[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v104[0] = v66;
      v103[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v79, "localizedFailureReason");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v104[1] = v67;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v68);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_69:
    v55 = 0;
    v54 = v79;
    goto LABEL_57;
  }
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__15;
  v97 = __Block_byref_object_dispose__15;
  v98 = 0;
  v40 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v39, "count"));
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_3;
  v81[3] = &unk_1EA4D40C8;
  v83 = &v93;
  v41 = v40;
  v82 = v41;
  objc_msgSend(v39, "gc_enumerateObjectsUsingBlock:", v81);
  v42 = objc_msgSend(v41, "count");
  v43 = objc_msgSend(v39, "count");
  if (v42 == v43)
  {
    objc_msgSend(v80, "setOutputs:", v41);
  }
  else if (a4)
  {
    v101[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend((id)v94[5], "localizedDescription");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "length"))
      objc_msgSend((id)v94[5], "localizedDescription");
    else
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v72;
    v101[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend((id)v94[5], "localizedFailureReason");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    v46 = &stru_1EA4D5008;
    if (v44)
      v46 = (const __CFString *)v44;
    v102[1] = v46;
    v101[2] = *MEMORY[0x1E0CB3388];
    v47 = v94[5];
    if (v47)
    {
      v48 = (void *)v94[5];
      v49 = v48;
    }
    else
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)v94[5];
    }
    v102[2] = v49;
    v101[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v48, "gc_failingKeyPath");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (!v50)
      v50 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v50, "arrayByAddingObject:", CFSTR("Outputs"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v102[3] = v52;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v102, v101, 4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v53);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v47)
  }

  _Block_object_dispose(&v93, 8);
  if (v42 != v43)
  {
LABEL_58:
    v55 = 0;
    goto LABEL_59;
  }
  v54 = v80;
  objc_msgSend(v80, "build");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
LABEL_57:

LABEL_59:
  return (GCGenericDeviceRumbleModel *)v55;
}

void __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
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
    +[GCGenericDeviceRumbleActuatorModel modelWithDictionaryRepresentation:error:](GCGenericDeviceRumbleActuatorModel, "modelWithDictionaryRepresentation:error:", v11, &v54);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12, v54);
    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v13, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "member:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v57[0] = *MEMORY[0x1E0CB2D68];
        v17 = objc_opt_class();
        objc_msgSend(v13, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Duplicate definition of '%@' with name '%@'."), v17, v18);
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
        objc_msgSend(v13, "name");
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

void __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_2(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
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
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  }
  else
  {
    v21[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedFailureReason");
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
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    *a4 = 1;
  }

}

void __85__GCGenericDeviceRumbleModel_Serialization__modelWithDictionaryRepresentation_error___block_invoke_3(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
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
    +[GCGenericDeviceRumbleOutputModel modelWithDictionaryRepresentation:error:](GCGenericDeviceRumbleOutputModel, "modelWithDictionaryRepresentation:error:", v11, &v40);
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
