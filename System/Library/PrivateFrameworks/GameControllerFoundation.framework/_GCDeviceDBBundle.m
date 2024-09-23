@implementation _GCDeviceDBBundle

- (_GCDeviceDBBundle)initWithBundle:(id)a3 error:(id *)a4
{
  id v8;
  _GCDeviceDBBundle *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *devices;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  uint64_t v53;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  _GCDeviceDBBundle *v68;
  void *v69;
  _QWORD v70[4];
  id v71;
  _GCDeviceDBBundle *v72;
  id v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  id v81;
  objc_super v82;
  _QWORD v83[4];
  _QWORD v84[4];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[5];

  v92[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v82.receiver = self;
  v82.super_class = (Class)_GCDeviceDBBundle;
  v9 = -[_GCDeviceDBBundle init](&v82, sel_init);
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_GCDeviceDBBundle.m"), 24, CFSTR("Invalid parameter not satisfying: %s"), "bundle");

  }
  objc_storeStrong((id *)&v9->_bundle, a3);
  objc_msgSend(v8, "configurationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", 0x1EA4D51A8);

  if ((v11 & 1) == 0)
  {
    if (a4)
    {
      v24 = *MEMORY[0x1E0CB2D50];
      v92[0] = CFSTR("Failed to initialize Device DB Bundle.");
      v25 = *MEMORY[0x1E0CB2D68];
      v91[0] = v24;
      v91[1] = v25;
      objc_msgSend(v8, "configurationType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("The provided bundle has the wrong configuration type: '%@'."), v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v26;
      v91[2] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v8, "bundleURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "path");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = CFSTR("<missing path>");
      if (v28)
        v30 = (const __CFString *)v28;
      v92[2] = v30;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_29;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "compatibilityVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[GCVersion currentSourceVersion](GCVersion, "currentSourceVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isGreaterThanSourceVersion:", v13);

  if (!v14)
  {
    objc_msgSend(v8, "infoDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      if (!a4)
      {
LABEL_30:

        goto LABEL_31;
      }
      v47 = *MEMORY[0x1E0CB2D68];
      v87[0] = *MEMORY[0x1E0CB2D50];
      v87[1] = v47;
      v88[0] = CFSTR("Failed to initialize Device DB Bundle.");
      v88[1] = CFSTR("The provided bundle did not return an Info Dictionary.");
      v87[2] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v8, "bundleURL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "path");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v49;
      v51 = CFSTR("<missing path>");
      if (v49)
        v51 = (const __CFString *)v49;
      v88[2] = v51;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v88, v87, 3);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v52);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
      a4 = 0;
      goto LABEL_30;
    }
    v81 = 0;
    objc_msgSend(v17, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Devices"), objc_opt_class(), &v81);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v81;
    if (!v32)
    {
      if (a4)
      {
        v56 = *MEMORY[0x1E0CB2D50];
        v86[0] = CFSTR("Failed to initialize Device DB Bundle.");
        v57 = *MEMORY[0x1E0CB2D68];
        v85[0] = v56;
        v85[1] = v57;
        v58 = v33;
        objc_msgSend(v33, "localizedFailureReason");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v59;
        v85[2] = *MEMORY[0x1E0CB2AA0];
        objc_msgSend(v8, "bundleURL");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "path");
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v61;
        v63 = CFSTR("<missing path>");
        if (v61)
          v63 = (const __CFString *)v61;
        v86[2] = v63;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v64);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v33 = v58;
      }

      goto LABEL_29;
    }
    v69 = v33;
    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__16;
    v79 = __Block_byref_object_dispose__16;
    v80 = 0;
    v34 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v32, "count"));
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __42___GCDeviceDBBundle_initWithBundle_error___block_invoke;
    v70[3] = &unk_1EA4D4798;
    v74 = &v75;
    v35 = v8;
    v71 = v35;
    v68 = v9;
    v72 = v68;
    v36 = v34;
    v73 = v36;
    objc_msgSend(v32, "gc_enumerateObjectsUsingBlock:", v70);
    v37 = (void *)v76[5];
    if (v37)
    {
      if (!a4)
        goto LABEL_28;
      v38 = *MEMORY[0x1E0CB2D50];
      v84[0] = CFSTR("Failed to initialize Device DB Bundle.");
      v39 = *MEMORY[0x1E0CB2D68];
      v83[0] = v38;
      v83[1] = v39;
      objc_msgSend(v37, "localizedFailureReason");
      v67 = objc_claimAutoreleasedReturnValue();
      v84[1] = v67;
      v83[2] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v35, "bundleURL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "path");
      v40 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v40;
      v41 = CFSTR("<missing path>");
      if (v40)
        v41 = (const __CFString *)v40;
      v84[2] = v41;
      v83[3] = 0x1EA4D51E8;
      -[NSError gc_dbFailingPath]((void *)v76[5]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (!v42)
        v42 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v42, "arrayByAddingObject:", CFSTR("Devices"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v84[3] = v44;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v84, v83, 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v45);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      devices = (void *)v67;
    }
    else
    {
      v53 = objc_msgSend(v36, "copy");
      devices = v68->_devices;
      v68->_devices = (NSArray *)v53;
    }

LABEL_28:
    _Block_object_dispose(&v75, 8);

    if (!v37)
    {
      a4 = v68;
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (a4)
  {
    v15 = *MEMORY[0x1E0CB2D50];
    v90[0] = CFSTR("Failed to initialize Device DB Bundle.");
    v16 = *MEMORY[0x1E0CB2D68];
    v89[0] = v15;
    v89[1] = v16;
    objc_msgSend(v8, "compatibilityVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Bundle requires version '%@'."), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v18;
    v89[2] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v8, "bundleURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("<missing path>");
    if (v20)
      v22 = (const __CFString *)v20;
    v90[2] = v22;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 5, v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
LABEL_31:

  return (_GCDeviceDBBundle *)a4;
}

- (NSString)identifier
{
  return -[_GCConfigurationBundle identifier](self->_bundle, "identifier");
}

- (GCVersion)version
{
  return -[_GCConfigurationBundle version](self->_bundle, "version");
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[_GCDeviceDBBundle identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDeviceDBBundle version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%@ (v%@)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[_GCDeviceDBBundle identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDeviceDBBundle version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%@ (v%@)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDeviceDBBundle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDeviceDBBundle version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> %@ (v%@)"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
