@implementation _GCDeviceDBBundleDevice

- (_GCDeviceDBBundleDevice)initWithBundle:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  _GCDeviceDBBundleDevice *v12;
  void *v13;
  id v14;
  void *v15;
  GCVersion *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSString *identifier;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *ioMatchingPredicates;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *personalityPaths;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _GCDeviceDBBundleDevice *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v87;
  _QWORD v88[4];
  id v89;
  uint64_t *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  id v101;
  id v102;
  id v103;
  objc_super v104;
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[2];
  _QWORD v112[2];
  uint64_t v113;
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  const __CFString *v118;
  _QWORD v119[3];
  _QWORD v120[3];
  _QWORD v121[2];
  _QWORD v122[4];

  v122[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v87 = v9;
  if (!v9)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDeviceDBBundleDevice.m"), 41, CFSTR("Invalid parameter not satisfying: %s"), "bundle != nil");

    if (v11)
      goto LABEL_3;
LABEL_36:
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDeviceDBBundleDevice.m"), 42, CFSTR("Invalid parameter not satisfying: %s"), "dict != nil");

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_36;
LABEL_3:
  v104.receiver = self;
  v104.super_class = (Class)_GCDeviceDBBundleDevice;
  v12 = -[_GCDeviceDBBundleDevice init](&v104, sel_init);
  objc_storeStrong((id *)&v12->_bundle, a3);
  v103 = 0;
  objc_msgSend(v11, "gc_objectForKey:ofClass:error:", CFSTR("CompatibilityVersion"), objc_opt_class(), &v103);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v103;
  v15 = v14;
  if (!v13 && v14)
  {
    if (a5)
    {
      v57 = *MEMORY[0x1E0CB2D50];
      v122[0] = CFSTR("Invalid device definition");
      v58 = *MEMORY[0x1E0CB2D68];
      v121[0] = v57;
      v121[1] = v58;
      objc_msgSend(v14, "localizedFailureReason");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v122[1] = v59;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v60);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_56;
  }
  if (v13)
  {
    v16 = -[GCVersion initWithString:]([GCVersion alloc], "initWithString:", v13);
    if (!v16)
    {
      if (!a5)
        goto LABEL_11;
      v71 = *MEMORY[0x1E0CB2D50];
      v120[0] = CFSTR("Invalid device definition.");
      v72 = *MEMORY[0x1E0CB2D68];
      v119[0] = v71;
      v119[1] = v72;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid version."), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v120[1] = v21;
      v119[2] = 0x1EA4D51E8;
      v118 = CFSTR("CompatibilityVersion");
      +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v118, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v120[2] = v22;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v120, v119, 3);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v73);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    +[GCVersion currentSourceVersion](GCVersion, "currentSourceVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[GCVersion isGreaterThanSourceVersion:](v16, "isGreaterThanSourceVersion:", v17);

    if (v18)
    {
      if (!a5)
      {
LABEL_11:

LABEL_56:
        v54 = 0;
        goto LABEL_57;
      }
      v19 = *MEMORY[0x1E0CB2D50];
      v117[0] = CFSTR("Incompatible device definition.");
      v20 = *MEMORY[0x1E0CB2D68];
      v116[0] = v19;
      v116[1] = v20;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Device definition requires version '%@'."), v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v117[1] = v21;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 5, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    v16 = 0;
  }

  v102 = 0;
  objc_msgSend(v11, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Identifier"), objc_opt_class(), &v102);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v102;
  v25 = v24;
  if (!v23)
  {
    if (a5)
    {
      v61 = *MEMORY[0x1E0CB2D50];
      v115[0] = CFSTR("Invalid device definition");
      v62 = *MEMORY[0x1E0CB2D68];
      v114[0] = v61;
      v114[1] = v62;
      objc_msgSend(v24, "localizedFailureReason");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v63;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v64);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_56;
  }
  identifier = v12->_identifier;
  v12->_identifier = (NSString *)v23;

  objc_msgSend(v11, "gc_objectForKey:ofClass:error:", CFSTR("IOPropertyMatch"), objc_opt_class(), 0);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
  {
    v113 = v27;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v113, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    goto LABEL_17;
  }
  v101 = 0;
  objc_msgSend(v11, "gc_requiredObjectForKey:ofClass:error:", CFSTR("IOPropertyMatch"), objc_opt_class(), &v101);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v101;
  v30 = v31;
  if (v29)
  {
LABEL_17:
    v95 = 0;
    v96 = &v95;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__9;
    v99 = __Block_byref_object_dispose__9;
    v100 = 0;
    v32 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v29, "count"));
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke;
    v92[3] = &unk_1EA4D40C8;
    v94 = &v95;
    v33 = v32;
    v93 = v33;
    objc_msgSend(v29, "gc_enumerateObjectsUsingBlock:", v92);
    v34 = objc_msgSend(v33, "count");
    if (v34 == objc_msgSend(v29, "count"))
    {
      v35 = objc_msgSend(v33, "copy");
      v36 = 0;
      ioMatchingPredicates = v12->_ioMatchingPredicates;
      v12->_ioMatchingPredicates = (NSArray *)v35;
    }
    else
    {
      if (!a5)
      {
        v36 = 1;
        goto LABEL_20;
      }
      v65 = *MEMORY[0x1E0CB2D50];
      v110[0] = CFSTR("Invalid device definition.");
      v66 = *MEMORY[0x1E0CB2D68];
      v109[0] = v65;
      v109[1] = v66;
      objc_msgSend((id)v96[5], "localizedFailureReason");
      v67 = objc_claimAutoreleasedReturnValue();
      ioMatchingPredicates = (void *)v67;
      v68 = &stru_1EA4D5008;
      if (v67)
        v68 = (const __CFString *)v67;
      v110[1] = v68;
      v109[2] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend((id)v96[5], "gc_failingKeyPath");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v69;
      if (!v69)
        v69 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v69, "arrayByAddingObject:", CFSTR("IOPropertyMatch"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v110[2] = v83;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v110, v109, 3);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v70);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v36 = 1;
    }

LABEL_20:
    _Block_object_dispose(&v95, 8);

LABEL_21:
    goto LABEL_22;
  }
  if (a5)
  {
    v74 = *MEMORY[0x1E0CB2D50];
    v112[0] = CFSTR("Invalid device definition");
    v75 = *MEMORY[0x1E0CB2D68];
    v111[0] = v74;
    v111[1] = v75;
    objc_msgSend(v31, "localizedFailureReason");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v29;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v76);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v36 = 1;
    goto LABEL_21;
  }
  v36 = 1;
LABEL_22:

  if (v36)
    goto LABEL_56;
  v91 = 0;
  objc_msgSend(v11, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Personalities"), objc_opt_class(), &v91);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v91;
  if (!v38)
  {
    if (a5)
    {
      v77 = *MEMORY[0x1E0CB2D50];
      v108[0] = CFSTR("Invalid device definition");
      v78 = *MEMORY[0x1E0CB2D68];
      v107[0] = v77;
      v107[1] = v78;
      v79 = v39;
      objc_msgSend(v39, "localizedFailureReason");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v80;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v81);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v39 = v79;
    }

    goto LABEL_56;
  }
  v84 = v39;
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__9;
  v99 = __Block_byref_object_dispose__9;
  v100 = 0;
  v40 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v38, "count"));
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke_2;
  v88[3] = &unk_1EA4D40C8;
  v90 = &v95;
  v41 = v40;
  v89 = v41;
  objc_msgSend(v38, "gc_enumerateObjectsUsingBlock:", v88);
  v42 = objc_msgSend(v41, "count");
  v43 = objc_msgSend(v38, "count");
  if (v42 == v43)
  {
    v44 = objc_msgSend(v41, "copy");
    personalityPaths = v12->_personalityPaths;
    v12->_personalityPaths = (NSArray *)v44;
  }
  else
  {
    if (!a5)
      goto LABEL_33;
    v46 = *MEMORY[0x1E0CB2D50];
    v106[0] = CFSTR("Invalid device definition.");
    v47 = *MEMORY[0x1E0CB2D68];
    v105[0] = v46;
    v105[1] = v47;
    objc_msgSend((id)v96[5], "localizedFailureReason");
    v48 = objc_claimAutoreleasedReturnValue();
    personalityPaths = (void *)v48;
    v49 = &stru_1EA4D5008;
    if (v48)
      v49 = (const __CFString *)v48;
    v106[1] = v49;
    v105[2] = 0x1EA4D51E8;
    -[NSError gc_dbFailingPath]((void *)v96[5]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (!v50)
      v50 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v50, "arrayByAddingObject:", CFSTR("Personalities"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v52;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v53);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_33:

  _Block_object_dispose(&v95, 8);
  if (v42 != v43)
    goto LABEL_56;
  v54 = v12;
LABEL_57:

  return v54;
}

- (_GCDeviceDBBundleDevice)init
{
  -[_GCDeviceDBBundleDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)personalities
{
  _GCDeviceDBBundleDevicePersonalitiesEnumerator *v3;
  NSBundle *bundle;
  void *v5;
  _GCDeviceDBBundleDevicePersonalitiesEnumerator *v6;

  v3 = [_GCDeviceDBBundleDevicePersonalitiesEnumerator alloc];
  bundle = self->_bundle;
  -[NSArray objectEnumerator](self->_personalityPaths, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_GCDeviceDBBundleDevicePersonalitiesEnumerator initWithBundle:personalityPaths:](v3, "initWithBundle:personalityPaths:", bundle, v5);

  return v6;
}

- (id)redactedDescription
{
  return self->_identifier;
}

- (id)description
{
  return self->_identifier;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)ioMatchingPredicates
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalityPaths, 0);
  objc_storeStrong((id *)&self->_ioMatchingPredicates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
