@implementation _GCDeviceDBPersonality

- (_GCDeviceDBPersonality)initWithDictionary:(id)a3 error:(id *)a4
{
  id v7;
  _GCDeviceDBPersonality *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  GCVersion *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  GCVersion *compatibilityVersion;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  GCVersion *v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GCVersion *obsoletedInVersion;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSPredicate *ioMatchingPredicate;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  GCGenericDeviceModel *model;
  _GCDeviceDBPersonality *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  objc_super v90;
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[2];
  _QWORD v94[2];
  const __CFString *v95;
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  const __CFString *v102;
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  const __CFString *v109;
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[2];
  _QWORD v113[4];

  v113[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDeviceDBPersonality.m"), 34, CFSTR("Invalid parameter not satisfying: %s"), "dict != nil");

  }
  v90.receiver = self;
  v90.super_class = (Class)_GCDeviceDBPersonality;
  v8 = -[_GCDeviceDBPersonality init](&v90, sel_init);
  v9 = objc_opt_class();
  v89 = 0;
  objc_msgSend(v7, "gc_requiredObjectForKey:ofClass:error:", CFSTR("CompatibilityVersion"), v9, &v89);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v89;
  v12 = v11;
  if (!v10)
  {
    if (a4)
    {
      v57 = *MEMORY[0x1E0CB2D50];
      v113[0] = CFSTR("Invalid 'Personality' definition.");
      v58 = *MEMORY[0x1E0CB2D68];
      v112[0] = v57;
      v112[1] = v58;
      objc_msgSend(v11, "localizedFailureReason");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v59;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v60);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_60;
  }
  v13 = -[GCVersion initWithString:]([GCVersion alloc], "initWithString:", v10);
  if (!v13)
  {
    if (!a4)
      goto LABEL_9;
    v61 = *MEMORY[0x1E0CB2D50];
    v111[0] = CFSTR("Invalid 'Personality' definition.");
    v62 = *MEMORY[0x1E0CB2D68];
    v110[0] = v61;
    v110[1] = v62;
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid version."), v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v111[1] = v18;
    v110[2] = 0x1EA4D51E8;
    v109 = CFSTR("CompatibilityVersion");
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v109, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v111[2] = v19;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v111, v110, 3);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v63);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  +[GCVersion currentSourceVersion](GCVersion, "currentSourceVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GCVersion isGreaterThanSourceVersion:](v13, "isGreaterThanSourceVersion:", v14);

  if (v15)
  {
    if (!a4)
    {
LABEL_9:

LABEL_60:
      v46 = 0;
      goto LABEL_61;
    }
    v16 = *MEMORY[0x1E0CB2D50];
    v108[0] = CFSTR("Incompatible 'Personality' definition.");
    v17 = *MEMORY[0x1E0CB2D68];
    v107[0] = v16;
    v107[1] = v17;
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Personality definition requires version '%@'."), v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v108[1] = v18;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 5, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  compatibilityVersion = v8->_compatibilityVersion;
  v8->_compatibilityVersion = v13;

  v21 = objc_opt_class();
  v88 = 0;
  objc_msgSend(v7, "gc_objectForKey:ofClass:error:", CFSTR("ObsoletedInVersion"), v21, &v88);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v88;
  v24 = v23;
  if (!v22 && v23)
  {
    if (!a4)
      goto LABEL_20;
    v64 = *MEMORY[0x1E0CB2D50];
    v106[0] = CFSTR("Invalid 'Personality' definition.");
    v65 = *MEMORY[0x1E0CB2D68];
    v105[0] = v64;
    v105[1] = v65;
    objc_msgSend(v23, "localizedFailureReason");
    v25 = (GCVersion *)objc_claimAutoreleasedReturnValue();
    v106[1] = v25;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v30);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v22)
  {
    v25 = -[GCVersion initWithString:]([GCVersion alloc], "initWithString:", v22);
    if (!v25)
    {
      if (!a4)
        goto LABEL_19;
      v69 = *MEMORY[0x1E0CB2D50];
      v104[0] = CFSTR("Invalid 'Personality' definition.");
      v70 = *MEMORY[0x1E0CB2D68];
      v103[0] = v69;
      v103[1] = v70;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid version."), v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v104[1] = v30;
      v103[2] = 0x1EA4D51E8;
      v102 = CFSTR("ObsoletedInVersion");
      +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v102, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v104[2] = v31;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v104, v103, 3);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v71);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

      goto LABEL_19;
    }
    +[GCVersion currentSourceVersion](GCVersion, "currentSourceVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[GCVersion isLessThanOrEqualToSourceVersion:](v25, "isLessThanOrEqualToSourceVersion:", v26);

    if (v27)
    {
      if (!a4)
      {
LABEL_19:

LABEL_20:
        goto LABEL_60;
      }
      v28 = *MEMORY[0x1E0CB2D50];
      v101[0] = CFSTR("Incompatible 'Personality' definition.");
      v29 = *MEMORY[0x1E0CB2D68];
      v100[0] = v28;
      v100[1] = v29;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Personality definition requires version not greater than '%@'."), v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v101[1] = v30;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v101, v100, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 5, v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    obsoletedInVersion = v8->_obsoletedInVersion;
    v8->_obsoletedInVersion = v25;

  }
  v33 = objc_opt_class();
  v87 = 0;
  objc_msgSend(v7, "gc_objectForKey:ofClass:error:", CFSTR("IOPropertyMatchingPredicate"), v33, &v87);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v87;
  v36 = v35;
  if (!v34 && v35)
  {
    if (!a4)
    {
LABEL_59:

      goto LABEL_60;
    }
    v66 = *MEMORY[0x1E0CB2D50];
    v99[0] = CFSTR("Invalid 'Personality' definition.");
    v67 = *MEMORY[0x1E0CB2D68];
    v98[0] = v66;
    v98[1] = v67;
    objc_msgSend(v35, "localizedFailureReason");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v68;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v83);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_58:
    goto LABEL_59;
  }
  if (!v34)
    goto LABEL_27;
  +[NSPredicate predicateWithFormat:](&off_1F03AA788, "predicateWithFormat:", v34);
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("String is not a valid predicate: '%@'."), v34);
    v76 = objc_claimAutoreleasedReturnValue();
    v68 = (void *)v76;
    if (a4)
    {
      v77 = *MEMORY[0x1E0CB2D68];
      v96[0] = *MEMORY[0x1E0CB2D50];
      v96[1] = v77;
      v97[0] = CFSTR("Invalid 'Personality' definition.");
      v97[1] = v76;
      v96[2] = *MEMORY[0x1E0CB3388];
      v78 = (uint64_t)v36;
      if (!v36)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v78 = objc_claimAutoreleasedReturnValue();
      }
      v84 = (void *)v78;
      v97[2] = v78;
      v96[3] = 0x1EA4D51E8;
      v95 = CFSTR("IOPropertyMatchingPredicate");
      +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v95, 1);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v97[3] = v79;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v97, v96, 4);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v80);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v36)
    }
    goto LABEL_58;
  }
  ioMatchingPredicate = v8->_ioMatchingPredicate;
  v8->_ioMatchingPredicate = (NSPredicate *)v37;

LABEL_27:
  v39 = objc_opt_class();
  v86 = 0;
  objc_msgSend(v7, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Model"), v39, &v86);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v86;
  v42 = v41;
  if (!v40)
  {
    if (a4)
    {
      v72 = *MEMORY[0x1E0CB2D50];
      v94[0] = CFSTR("Invalid 'Personality' definition.");
      v73 = *MEMORY[0x1E0CB2D68];
      v93[0] = v72;
      v93[1] = v73;
      objc_msgSend(v41, "localizedFailureReason");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v74;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v75);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_60;
  }
  v85 = 0;
  +[GCGenericDeviceModel modelWithDictionaryRepresentation:error:](GCGenericDeviceModel, "modelWithDictionaryRepresentation:error:", v40, &v85);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v85;

  if (!v43)
  {
    if (a4)
    {
      v91[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v44, "localizedDescription");
      v47 = objc_claimAutoreleasedReturnValue();
      v82 = (void *)v47;
      v48 = CFSTR("Invalid 'Personality' definition.");
      if (v47)
        v48 = (const __CFString *)v47;
      v92[0] = v48;
      v91[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v44, "localizedFailureReason");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v49;
      v51 = CFSTR("Invalid 'Model' definition.");
      if (v49)
        v51 = (const __CFString *)v49;
      v92[1] = v51;
      v91[2] = 0x1EA4D51E8;
      objc_msgSend(v44, "gc_failingKeyPath");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if (!v52)
        v52 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v52, "arrayByAddingObject:", CFSTR("Model"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v92[2] = v54;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v55);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_60;
  }
  model = v8->_model;
  v8->_model = (GCGenericDeviceModel *)v43;

  v46 = v8;
LABEL_61:

  return v46;
}

- (_GCDeviceDBPersonality)initWithURL:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _GCDeviceDBPersonality *v16;
  id *p_isa;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _UNKNOWN **v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    a4 = 0;
    goto LABEL_11;
  }
  v33 = 0;
  +[NSData dataWithContentsOfURL:options:error:](&off_1F03AA018, "dataWithContentsOfURL:options:error:", v7, 0, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;
  v10 = v9;
  if (!v8)
  {
    if (!a4)
      goto LABEL_9;
    v19 = *MEMORY[0x1E0CB2D68];
    v36[0] = *MEMORY[0x1E0CB2D50];
    v36[1] = v19;
    v37[0] = CFSTR("Invalid device personality");
    v37[1] = CFSTR("Error loading file.");
    v36[2] = *MEMORY[0x1E0CB3388];
    v13 = v9;
    if (!v9)
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37[2] = v13;
    v36[3] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v7, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v20;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 2, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
    a4 = 0;
    if (v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  v32 = 0;
  +[NSPropertyListSerialization propertyListWithData:options:format:error:](&off_1F03AA8A0, "propertyListWithData:options:format:error:", v8, 0, 0, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  v13 = v12;
  if (v11)
  {
    v31 = 0;
    self = -[_GCDeviceDBPersonality initWithDictionary:error:](self, "initWithDictionary:error:", v11, &v31);
    v14 = v31;
    v15 = v14;
    if (self)
    {
      objc_storeStrong((id *)&self->_url, a3);
      self = self;
      v16 = self;
    }
    else
    {
      objc_msgSend(v14, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

      objc_msgSend(v7, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB2AA0]);

      if (a4)
      {
        objc_msgSend(v15, "domain");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", v28, objc_msgSend(v15, "code"), v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      p_isa = 0;
      goto LABEL_7;
    }
    v29 = &off_1F03A6B68;
    v22 = *MEMORY[0x1E0CB2D68];
    v34[0] = *MEMORY[0x1E0CB2D50];
    v34[1] = v22;
    v35[0] = CFSTR("Invalid device personality");
    v35[1] = CFSTR("Property list syntax error.");
    v34[2] = *MEMORY[0x1E0CB3388];
    v15 = v12;
    if (!v12)
    {
      +[NSNull null](&off_1F03A9C88, "null", &off_1F03A6B68);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35[2] = v15;
    v34[3] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v7, "path", v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v23;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:](v30, 3, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    p_isa = 0;
    if (v13)
      goto LABEL_7;
  }

  p_isa = (id *)&v16->super.isa;
LABEL_7:

LABEL_8:
  a4 = p_isa;
LABEL_9:

LABEL_11:
  return (_GCDeviceDBPersonality *)a4;
}

- (_GCDeviceDBPersonality)init
{
  -[_GCDeviceDBPersonality doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCVersion)compatibilityVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 16, 1);
}

- (GCVersion)obsoletedInVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 24, 1);
}

- (NSPredicate)ioMatchingPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDeviceModel)model
{
  return (GCGenericDeviceModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_ioMatchingPredicate, 0);
  objc_storeStrong((id *)&self->_obsoletedInVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
