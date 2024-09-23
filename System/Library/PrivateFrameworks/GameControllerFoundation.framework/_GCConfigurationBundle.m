@implementation _GCConfigurationBundle

- (_GCConfigurationBundle)initWithPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _GCConfigurationBundle *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  GCVersion *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  GCVersion *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const __CFString *v54;
  id *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const __CFString *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  objc_super v79;
  objc_super v80;
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[5];

  v96[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_getAssociatedObject(v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_setAssociatedObject(v6, self, self, 0);
    v79.receiver = self;
    v79.super_class = (Class)_GCConfigurationBundle;
    v9 = -[_GCConfigurationBundle _initUniqueWithPath:](&v79, sel__initUniqueWithPath_, v6);
    objc_setAssociatedObject(v6, v9, 0, 0);
    if (!v9)
    {
      v8 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v9, "infoDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (a4)
      {
        v41 = *MEMORY[0x1E0CB2D68];
        v95[0] = *MEMORY[0x1E0CB2D50];
        v95[1] = v41;
        v96[0] = CFSTR("Invalid bundle.");
        v96[1] = CFSTR("Missing information property list.");
        v95[2] = *MEMORY[0x1E0CB2AA0];
        objc_msgSend(v9, "bundleURL");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "path");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v43;
        v45 = CFSTR("<missing path>");
        if (v43)
          v45 = (const __CFString *)v43;
        v96[2] = v45;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_1F03A6B68, 1, v46);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v8 = 0;
      v26 = 0;
      goto LABEL_23;
    }
    v78 = 0;
    v74 = v10;
    objc_msgSend(v10, "gc_requiredObjectForKey:ofClass:error:", CFSTR("CompatibilityVersion"), objc_opt_class(), &v78);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v78;
    v13 = v12;
    if (!v11)
    {
      if (!a4)
        goto LABEL_16;
      v47 = *MEMORY[0x1E0CB2D50];
      v94[0] = CFSTR("Invalid bundle information property list.");
      v48 = *MEMORY[0x1E0CB2D68];
      v93[0] = v47;
      v93[1] = v48;
      objc_msgSend(v12, "localizedFailureReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v11;
      v93[2] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v9, "bundleURL");
      v14 = (GCVersion *)objc_claimAutoreleasedReturnValue();
      -[GCVersion path](v14, "path");
      v49 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v49;
      v50 = CFSTR("<missing path>");
      if (v49)
        v50 = (const __CFString *)v49;
      v94[2] = v50;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_1F03A6B68, 1, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v14 = -[GCVersion initWithString:]([GCVersion alloc], "initWithString:", v11);
    if (v14)
    {
      +[GCVersion currentSourceVersion](GCVersion, "currentSourceVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GCVersion isGreaterThanSourceVersion:](v14, "isGreaterThanSourceVersion:", v15);

      if (!v16)
      {
        v27 = -[GCVersion copy](v14, "copy");
        v28 = (void *)v9[11];
        v9[11] = v27;

        v29 = *MEMORY[0x1E0C9AE78];
        v77 = 0;
        objc_msgSend(v74, "gc_requiredObjectForKey:ofClass:error:", v29, objc_opt_class(), &v77);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v77;
        v13 = v31;
        if (v30)
        {

          v32 = *MEMORY[0x1E0C9AE90];
          v76 = 0;
          objc_msgSend(v74, "gc_requiredObjectForKey:ofClass:error:", v32, objc_opt_class(), &v76);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v76;
          v13 = v33;
          if (v11)
          {
            v34 = -[GCVersion initWithString:]([GCVersion alloc], "initWithString:", v11);
            v14 = v34;
            if (!v34)
            {
              if (!a4)
                goto LABEL_15;
              v66 = *MEMORY[0x1E0CB2D50];
              v84[0] = CFSTR("Invalid bundle information property list.");
              v67 = *MEMORY[0x1E0CB2D68];
              v83[0] = v66;
              v83[1] = v67;
              +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid %@."), v11, v32);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v84[1] = v19;
              v83[2] = *MEMORY[0x1E0CB2AA0];
              objc_msgSend(v9, "bundleURL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "path");
              v68 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v68;
              v69 = CFSTR("<missing path>");
              if (v68)
                v69 = (const __CFString *)v68;
              v84[2] = v69;
              +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_1F03A6B68, 1, v24);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            }
            v35 = (void *)v9[9];
            v9[9] = v34;

            v75 = 0;
            v26 = v74;
            objc_msgSend(v74, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ConfigurationType"), objc_opt_class(), &v75);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v75;
            v13 = v37;
            if (v36)
            {
              v38 = objc_msgSend(v36, "copy");
              v39 = (void *)v9[10];
              v9[10] = v38;

              v8 = v9;
              goto LABEL_23;
            }
            if (!a4)
            {
LABEL_16:

              v8 = 0;
              v26 = v74;
LABEL_23:

              goto LABEL_24;
            }
            v55 = a4;
            v70 = *MEMORY[0x1E0CB2D50];
            v82[0] = CFSTR("Invalid bundle information property list.");
            v71 = *MEMORY[0x1E0CB2D68];
            v81[0] = v70;
            v81[1] = v71;
            objc_msgSend(v37, "localizedFailureReason");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v82[1] = v11;
            v81[2] = *MEMORY[0x1E0CB2AA0];
            objc_msgSend(v9, "bundleURL");
            v14 = (GCVersion *)objc_claimAutoreleasedReturnValue();
            -[GCVersion path](v14, "path");
            v72 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v72;
            v73 = CFSTR("<missing path>");
            if (v72)
              v73 = (const __CFString *)v72;
            v82[2] = v73;
            v60 = v82;
            v61 = v81;
          }
          else
          {
            if (!a4)
              goto LABEL_16;
            v55 = a4;
            v62 = *MEMORY[0x1E0CB2D50];
            v86[0] = CFSTR("Invalid bundle information property list.");
            v63 = *MEMORY[0x1E0CB2D68];
            v85[0] = v62;
            v85[1] = v63;
            objc_msgSend(v33, "localizedFailureReason");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v86[1] = v11;
            v85[2] = *MEMORY[0x1E0CB2AA0];
            objc_msgSend(v9, "bundleURL");
            v14 = (GCVersion *)objc_claimAutoreleasedReturnValue();
            -[GCVersion path](v14, "path");
            v64 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v64;
            v65 = CFSTR("<missing path>");
            if (v64)
              v65 = (const __CFString *)v64;
            v86[2] = v65;
            v60 = v86;
            v61 = v85;
          }
        }
        else
        {
          if (!a4)
            goto LABEL_16;
          v55 = a4;
          v56 = *MEMORY[0x1E0CB2D50];
          v88[0] = CFSTR("Invalid bundle information property list.");
          v57 = *MEMORY[0x1E0CB2D68];
          v87[0] = v56;
          v87[1] = v57;
          objc_msgSend(v31, "localizedFailureReason");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v88[1] = v11;
          v87[2] = *MEMORY[0x1E0CB2AA0];
          objc_msgSend(v9, "bundleURL");
          v14 = (GCVersion *)objc_claimAutoreleasedReturnValue();
          -[GCVersion path](v14, "path");
          v58 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v58;
          v59 = CFSTR("<missing path>");
          if (v58)
            v59 = (const __CFString *)v58;
          v88[2] = v59;
          v60 = v88;
          v61 = v87;
        }
        +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v60, v61, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_1F03A6B68, 1, v20);
        *v55 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (!a4)
      {
LABEL_15:

        goto LABEL_16;
      }
      v17 = *MEMORY[0x1E0CB2D50];
      v90[0] = CFSTR("Failed to initialize Configuration DB Bundle.");
      v18 = *MEMORY[0x1E0CB2D68];
      v89[0] = v17;
      v89[1] = v18;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Bundle requires framework version '%@'."), v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = v19;
      v89[2] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v9, "bundleURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = CFSTR("<missing path>");
      if (v21)
        v23 = (const __CFString *)v21;
      v90[2] = v23;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 2;
    }
    else
    {
      if (!a4)
        goto LABEL_15;
      v51 = *MEMORY[0x1E0CB2D50];
      v92[0] = CFSTR("Invalid bundle information property list.");
      v52 = *MEMORY[0x1E0CB2D68];
      v91[0] = v51;
      v91[1] = v52;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' format: '%@'"), CFSTR("CompatibilityVersion"), v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v19;
      v91[2] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v9, "bundleURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v53 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v53;
      v54 = CFSTR("<missing path>");
      if (v53)
        v54 = (const __CFString *)v53;
      v92[2] = v54;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 1;
    }
    +[NSError gc_ConfigurationError:userInfo:]((uint64_t)&off_1F03A6B68, v25, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  v80.receiver = self;
  v80.super_class = (Class)_GCConfigurationBundle;
  v8 = -[_GCConfigurationBundle initWithPath:](&v80, sel_initWithPath_, v6);
LABEL_24:

  return v8;
}

- (_GCConfigurationBundle)initWithPath:(id)a3
{
  return -[_GCConfigurationBundle initWithPath:error:](self, "initWithPath:error:", a3, 0);
}

- (_GCConfigurationBundle)init
{
  -[_GCConfigurationBundle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[_GCConfigurationBundle identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCConfigurationBundle version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%@ (v%@)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[_GCConfigurationBundle identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCConfigurationBundle version](self, "version");
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
  -[_GCConfigurationBundle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCConfigurationBundle version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> %@ (v%@)"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (GCVersion)version
{
  return (GCVersion *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)configurationType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (GCVersion)compatibilityVersion
{
  return (GCVersion *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_configurationType, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
