@implementation DNDClientEventDetails

- (DNDClientEventDetails)init
{
  return (DNDClientEventDetails *)-[DNDClientEventDetails _initWithDetails:](self, "_initWithDetails:", 0);
}

- (id)_initWithDetails:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "platform");
  v17 = objc_msgSend(v3, "type");
  v16 = objc_msgSend(v3, "urgency");
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterCriteria");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "notifyAnyway");
  v8 = objc_msgSend(v3, "behavior");
  objc_msgSend(v3, "forwardingBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v7;
  v13 = -[DNDClientEventDetails _initWithIdentifier:bundleIdentifier:platform:type:urgency:sender:threadIdentifier:filterCriteria:notifyAnyway:behavior:forwardingBehavior:title:subtitle:body:](self, "_initWithIdentifier:bundleIdentifier:platform:type:urgency:sender:threadIdentifier:filterCriteria:notifyAnyway:behavior:forwardingBehavior:title:subtitle:body:", v20, v19, v18, v17, v16, v4, v5, v6, v15, v8, v9, v10, v11, v12);

  return v13;
}

- (id)_initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 platform:(unint64_t)a5 type:(unint64_t)a6 urgency:(unint64_t)a7 sender:(id)a8 threadIdentifier:(id)a9 filterCriteria:(id)a10 notifyAnyway:(BOOL)a11 behavior:(unint64_t)a12 forwardingBehavior:(id)a13 title:(id)a14 subtitle:(id)a15 body:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  DNDClientEventDetails *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSString *v32;
  void *identifier;
  uint64_t v34;
  NSString *v35;
  uint64_t v36;
  NSString *bundleIdentifier;
  uint64_t v38;
  DNDContactHandle *sender;
  uint64_t v40;
  NSString *threadIdentifier;
  uint64_t v42;
  NSString *filterCriteria;
  uint64_t v44;
  NSString *title;
  uint64_t v46;
  NSString *subtitle;
  uint64_t v48;
  NSString *body;
  void *v51;
  void *v52;
  id v56;
  objc_super v57;

  v19 = a3;
  v20 = a4;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v56 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v57.receiver = self;
  v57.super_class = (Class)DNDClientEventDetails;
  v27 = -[DNDClientEventDetails init](&v57, sel_init);
  if (v27)
  {
    v51 = v23;
    v52 = v22;
    v28 = v21;
    v29 = v20;
    v30 = (void *)objc_msgSend(v19, "copy");
    v31 = v30;
    if (v30)
    {
      v32 = v30;
      identifier = v27->_identifier;
      v27->_identifier = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v27->_identifier;
      v27->_identifier = (NSString *)v34;

    }
    v20 = v29;
    v36 = objc_msgSend(v29, "copy");
    bundleIdentifier = v27->_bundleIdentifier;
    v27->_bundleIdentifier = (NSString *)v36;

    v27->_platform = a5;
    v27->_type = a6;
    v27->_urgency = a7;
    v21 = v28;
    v38 = objc_msgSend(v28, "copy");
    sender = v27->_sender;
    v27->_sender = (DNDContactHandle *)v38;

    v22 = v52;
    v40 = objc_msgSend(v52, "copy");
    threadIdentifier = v27->_threadIdentifier;
    v27->_threadIdentifier = (NSString *)v40;

    v23 = v51;
    v42 = objc_msgSend(v51, "copy");
    filterCriteria = v27->_filterCriteria;
    v27->_filterCriteria = (NSString *)v42;

    v27->_notifyAnyway = a11;
    v27->_behavior = a12;
    objc_storeStrong((id *)&v27->_forwardingBehavior, a13);
    v44 = objc_msgSend(v24, "copy");
    title = v27->_title;
    v27->_title = (NSString *)v44;

    v46 = objc_msgSend(v25, "copy");
    subtitle = v27->_subtitle;
    v27->_subtitle = (NSString *)v46;

    v48 = objc_msgSend(v26, "copy");
    body = v27->_body;
    v27->_body = (NSString *)v48;

  }
  return v27;
}

- (BOOL)shouldAlwaysInterrupt
{
  return self->_urgency == 2;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v26;

  -[DNDClientEventDetails identifier](self, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v26, "hash");
  -[DNDClientEventDetails bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  v6 = -[DNDClientEventDetails platform](self, "platform");
  v7 = v6 ^ -[DNDClientEventDetails type](self, "type");
  v8 = v5 ^ v7 ^ -[DNDClientEventDetails urgency](self, "urgency");
  -[DNDClientEventDetails sender](self, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[DNDClientEventDetails threadIdentifier](self, "threadIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[DNDClientEventDetails filterCriteria](self, "filterCriteria");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");
  v15 = -[DNDClientEventDetails notifyAnyway](self, "notifyAnyway");
  v16 = v15 ^ -[DNDClientEventDetails behavior](self, "behavior");
  -[DNDClientEventDetails forwardingBehavior](self, "forwardingBehavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14 ^ v16 ^ objc_msgSend(v17, "hash");
  -[DNDClientEventDetails title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[DNDClientEventDetails subtitle](self, "subtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[DNDClientEventDetails body](self, "body");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18 ^ v22 ^ objc_msgSend(v23, "hash");

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  DNDClientEventDetails *v4;
  DNDClientEventDetails *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  DNDClientEventDetails *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  _BOOL4 v53;
  unint64_t v54;
  uint64_t v55;
  _BOOL4 v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  DNDClientEventDetails *v63;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _BYTE v111[20];
  _BYTE v112[12];
  _BYTE v113[36];
  uint64_t v114;
  _BYTE v115[20];
  uint64_t v116;

  v4 = (DNDClientEventDetails *)a3;
  if (self == v4)
  {
    v17 = 1;
    goto LABEL_94;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_94;
  }
  v5 = v4;
  -[DNDClientEventDetails identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDClientEventDetails identifier](v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 != v7;
  if (v6 == v7)
    goto LABEL_10;
  -[DNDClientEventDetails identifier](self, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v110 = 0;
    v116 = 0;
    v114 = 0;
    memset(v113, 0, sizeof(v113));
    memset(v111, 0, sizeof(v111));
    memset(v112, 0, sizeof(v112));
    memset(v115, 0, sizeof(v115));
    LODWORD(v12) = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_29;
  }
  v110 = (void *)v9;
  -[DNDClientEventDetails identifier](v5, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v107 = 0;
    v114 = 0;
    *(_QWORD *)&v115[8] = 0;
    memset(v113, 0, sizeof(v113));
    v116 = 0;
    memset(v111, 0, sizeof(v111));
    memset(v112, 0, sizeof(v112));
    *(_QWORD *)v115 = 0;
    LODWORD(v12) = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    *(_DWORD *)&v115[16] = 1;
    goto LABEL_29;
  }
  v107 = (void *)v10;
  -[DNDClientEventDetails identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDClientEventDetails identifier](v5, "identifier");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v11;
  if (objc_msgSend(v11, "isEqual:"))
  {
LABEL_10:
    -[DNDClientEventDetails bundleIdentifier](self, "bundleIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails bundleIdentifier](v5, "bundleIdentifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)v18;
    v19 = v18 != (_QWORD)v108;
    *(_DWORD *)&v115[16] = v6 != v7;
    if ((void *)v18 != v108)
    {
      -[DNDClientEventDetails bundleIdentifier](self, "bundleIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v106 = 0;
        memset(v113, 0, sizeof(v113));
        v116 = 0;
        *(_QWORD *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        LODWORD(v12) = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_DWORD *)v115 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v115[12] = 1;
        goto LABEL_29;
      }
      v106 = (void *)v20;
      -[DNDClientEventDetails bundleIdentifier](v5, "bundleIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v103 = 0;
        memset(v113, 0, 32);
        v116 = 0;
        *(_QWORD *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        LODWORD(v12) = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_DWORD *)v115 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v115[12] = 1;
        *(_DWORD *)&v113[32] = 1;
        goto LABEL_29;
      }
      v103 = (void *)v21;
      -[DNDClientEventDetails bundleIdentifier](self, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDClientEventDetails bundleIdentifier](v5, "bundleIdentifier");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v22;
      if (!objc_msgSend(v22, "isEqual:"))
      {
        v116 = 0;
        *(_QWORD *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        *(_QWORD *)v112 = 0;
        memset(&v113[4], 0, 28);
        LODWORD(v12) = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = 1;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v115[12] = 1;
        v23 = 1;
LABEL_25:
        *(_DWORD *)&v112[8] = 0;
        *(_DWORD *)v113 = v23;
        goto LABEL_29;
      }
    }
    v24 = -[DNDClientEventDetails platform](self, "platform");
    *(_DWORD *)&v115[12] = v19;
    if (v24 != -[DNDClientEventDetails platform](v5, "platform")
      || (v25 = -[DNDClientEventDetails type](self, "type"), v25 != -[DNDClientEventDetails type](v5, "type"))
      || (v26 = -[DNDClientEventDetails urgency](self, "urgency"), v26 != -[DNDClientEventDetails urgency](v5, "urgency")))
    {
      v116 = 0;
      *(_QWORD *)&v115[4] = 0;
      memset(v111, 0, sizeof(v111));
      *(_QWORD *)v112 = 0;
      memset(&v113[4], 0, 28);
      LODWORD(v12) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(_DWORD *)v115 = 0;
      *(_DWORD *)&v113[32] = v19;
      v114 = (v6 != v7) | 0x100000000;
      v23 = v19;
      v13 = 0;
      goto LABEL_25;
    }
    -[DNDClientEventDetails sender](self, "sender");
    v27 = objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails sender](v5, "sender");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)v27;
    v28 = v27 == (_QWORD)v99;
    v29 = v27 != (_QWORD)v99;
    if (!v28)
    {
      -[DNDClientEventDetails sender](self, "sender");
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        v98 = 0;
        *(_QWORD *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        memset(&v113[4], 0, 24);
        *(_DWORD *)v113 = v19;
        LODWORD(v12) = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = v19;
        v114 = (v6 != v7) | 0x100000000;
        v13 = 0;
        *(_DWORD *)&v113[28] = 1;
        v116 = 0x100000000;
        goto LABEL_29;
      }
      v98 = (void *)v30;
      -[DNDClientEventDetails sender](v5, "sender");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        v95 = 0;
        *(_QWORD *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        memset(&v113[4], 0, 20);
        *(_DWORD *)v113 = v19;
        LODWORD(v12) = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = v19;
        v114 = (v6 != v7) | 0x100000000;
        v13 = 0;
        *(_DWORD *)&v113[28] = 1;
        v116 = 0x100000000;
        *(_DWORD *)&v113[24] = 1;
        goto LABEL_29;
      }
      v95 = (void *)v31;
      -[DNDClientEventDetails sender](self, "sender");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDClientEventDetails sender](v5, "sender");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v32;
      if (!objc_msgSend(v32, "isEqual:"))
      {
        *(_QWORD *)&v115[4] = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        *(_QWORD *)&v113[4] = 0;
        *(_DWORD *)v113 = v19;
        LODWORD(v12) = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_DWORD *)v115 = 0;
        *(_DWORD *)&v113[32] = v19;
        v114 = (v6 != v7) | 0x100000000;
        v13 = 0;
        *(_DWORD *)&v113[24] = 1;
        *(_DWORD *)&v113[28] = 1;
        v116 = 0x100000000;
        *(_DWORD *)&v113[12] = 0;
        *(_QWORD *)&v113[16] = 1;
        goto LABEL_29;
      }
    }
    -[DNDClientEventDetails threadIdentifier](self, "threadIdentifier");
    v41 = objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails threadIdentifier](v5, "threadIdentifier");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v41 != v42;
    HIDWORD(v116) = v29;
    v96 = (void *)v42;
    v97 = (void *)v41;
    if (v41 != v42)
    {
      -[DNDClientEventDetails threadIdentifier](self, "threadIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v94 = 0;
        LODWORD(v116) = 0;
        memset(v111, 0, sizeof(v111));
        memset(v112, 0, sizeof(v112));
        *(_QWORD *)&v113[4] = 0;
        *(_QWORD *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v115[8] = 1;
        goto LABEL_29;
      }
      -[DNDClientEventDetails threadIdentifier](v5, "threadIdentifier");
      v44 = objc_claimAutoreleasedReturnValue();
      v94 = (void *)v12;
      if (!v44)
      {
        v89 = 0;
        *(_QWORD *)v111 = 0;
        *(_QWORD *)&v111[8] = 0;
        LODWORD(v116) = 0;
        memset(v112, 0, sizeof(v112));
        *(_QWORD *)&v113[4] = 0;
        *(_QWORD *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v115[8] = 1;
        *(_DWORD *)&v111[16] = 1;
        goto LABEL_29;
      }
      v89 = (void *)v44;
      -[DNDClientEventDetails threadIdentifier](self, "threadIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDClientEventDetails threadIdentifier](v5, "threadIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v45;
      if (!objc_msgSend(v45, "isEqual:"))
      {
        LODWORD(v116) = 0;
        *(_QWORD *)v111 = 0;
        memset(v112, 0, sizeof(v112));
        *(_QWORD *)&v113[4] = 0;
        *(_QWORD *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v115[8] = 1;
        *(_DWORD *)&v111[16] = 1;
        *(_QWORD *)&v111[8] = 1;
        goto LABEL_29;
      }
    }
    -[DNDClientEventDetails filterCriteria](self, "filterCriteria");
    v46 = objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails filterCriteria](v5, "filterCriteria");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v46;
    v92 = (void *)v47;
    v28 = v46 == v47;
    v49 = v46 != v47;
    *(_DWORD *)&v115[8] = v43;
    v93 = v48;
    if (!v28)
    {
      -[DNDClientEventDetails filterCriteria](self, "filterCriteria");
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        v88 = 0;
        v56 = v43;
        *(_QWORD *)v111 = 0;
        memset(v112, 0, sizeof(v112));
        *(_QWORD *)&v113[4] = 0;
        *(_QWORD *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v111[16] = v56;
        *(_DWORD *)&v111[8] = v56;
        *(_DWORD *)&v111[12] = 1;
        LODWORD(v116) = 1;
        goto LABEL_29;
      }
      v88 = (void *)v50;
      -[DNDClientEventDetails filterCriteria](v5, "filterCriteria");
      v51 = objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        v85 = 0;
        *(_QWORD *)v111 = 0x100000000;
        memset(v112, 0, sizeof(v112));
        *(_QWORD *)&v113[4] = 0;
        *(_QWORD *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)&v111[16] = v43;
        *(_DWORD *)&v111[8] = v43;
        v14 = 0;
        LODWORD(v116) = 1;
        goto LABEL_29;
      }
      LODWORD(v116) = v49;
      v85 = (void *)v51;
      -[DNDClientEventDetails filterCriteria](self, "filterCriteria");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDClientEventDetails filterCriteria](v5, "filterCriteria");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v52;
      if (!objc_msgSend(v52, "isEqual:"))
      {
        memset(v112, 0, sizeof(v112));
        *(_QWORD *)&v113[4] = 0;
        *(_QWORD *)v115 = 0;
        *(_DWORD *)v113 = v19;
        *(_DWORD *)&v113[12] = 0;
        *(_DWORD *)&v113[16] = v29;
        LODWORD(v12) = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[32] = v19;
        v13 = 0;
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v113[24] = v29;
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)&v111[16] = v43;
        *(_DWORD *)&v111[8] = v43;
        v14 = 0;
        LODWORD(v116) = 1;
        *(_QWORD *)v111 = 0x100000001;
        goto LABEL_29;
      }
      v49 = v116;
    }
    v53 = -[DNDClientEventDetails notifyAnyway](self, "notifyAnyway");
    LODWORD(v116) = v49;
    if (v53 != -[DNDClientEventDetails notifyAnyway](v5, "notifyAnyway")
      || (v54 = -[DNDClientEventDetails behavior](self, "behavior"),
          v54 != -[DNDClientEventDetails behavior](v5, "behavior")))
    {
      memset(v112, 0, sizeof(v112));
      *(_QWORD *)&v113[4] = 0;
      *(_QWORD *)v115 = 0;
      *(_DWORD *)v113 = v19;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[32] = v19;
      v13 = 0;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[12] = 0;
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)&v111[16] = v43;
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = v43;
      v14 = 0;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      goto LABEL_29;
    }
    -[DNDClientEventDetails forwardingBehavior](self, "forwardingBehavior");
    v55 = objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails forwardingBehavior](v5, "forwardingBehavior");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)v55;
    if ((void *)v55 != v81)
    {
      *(_QWORD *)&v113[4] = 0;
      *(_QWORD *)v115 = 0;
      *(_QWORD *)&v112[4] = 0;
      *(_DWORD *)&v113[12] = 0;
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[32] = v19;
      *(_DWORD *)v113 = v19;
      v13 = 0;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)&v111[16] = v43;
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = v43;
      v14 = 0;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      *(_DWORD *)v112 = 1;
      goto LABEL_29;
    }
    -[DNDClientEventDetails title](self, "title");
    v57 = objc_claimAutoreleasedReturnValue();
    v63 = v5;
    -[DNDClientEventDetails title](v5, "title");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)v57;
    *(_DWORD *)&v115[4] = v57 != (_QWORD)v79;
    if ((void *)v57 == v79)
      goto LABEL_122;
    -[DNDClientEventDetails title](self, "title");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v78)
    {
      v78 = 0;
      *(_QWORD *)&v112[4] = 0;
      *(_QWORD *)&v113[8] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(_QWORD *)v115 = 0x100000000;
      v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
      *(_DWORD *)v113 = *(_DWORD *)&v115[12];
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      v81 = v82;
      *(_DWORD *)v112 = 1;
      *(_DWORD *)&v113[4] = 1;
      goto LABEL_138;
    }
    -[DNDClientEventDetails title](v5, "title");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v77)
    {
      v77 = 0;
      *(_QWORD *)&v113[8] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(_QWORD *)v115 = 0x100000000;
      v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
      *(_DWORD *)&v112[8] = 0;
      *(_DWORD *)v113 = *(_DWORD *)&v115[12];
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      v81 = v82;
      *(_QWORD *)v112 = 0x100000001;
      *(_DWORD *)&v113[4] = 1;
      goto LABEL_138;
    }
    -[DNDClientEventDetails title](self, "title");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails title](v63, "title");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v58;
    if (objc_msgSend(v58, "isEqual:"))
    {
LABEL_122:
      -[DNDClientEventDetails subtitle](self, "subtitle");
      v59 = objc_claimAutoreleasedReturnValue();
      -[DNDClientEventDetails subtitle](v63, "subtitle");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)v59;
      *(_DWORD *)v115 = v59 != (_QWORD)v75;
      if ((void *)v59 == v75)
        goto LABEL_128;
      -[DNDClientEventDetails subtitle](self, "subtitle");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v74)
      {
        v74 = 0;
        *(_QWORD *)&v113[8] = 0x100000000;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
        *(_DWORD *)v113 = *(_DWORD *)&v115[12];
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[24] = HIDWORD(v116);
        *(_DWORD *)&v113[16] = HIDWORD(v116);
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[4] = v49;
        *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)v111 = v49;
        LODWORD(v12) = 0;
        v81 = v82;
        *(_DWORD *)v112 = 1;
        *(_DWORD *)&v113[4] = 1;
        *(_DWORD *)&v112[4] = v57 != (_QWORD)v79;
        *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
        *(_DWORD *)v115 = 1;
        goto LABEL_138;
      }
      -[DNDClientEventDetails subtitle](v63, "subtitle");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v71)
      {
        v71 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
        *(_DWORD *)v113 = *(_DWORD *)&v115[12];
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[24] = HIDWORD(v116);
        *(_DWORD *)&v113[16] = HIDWORD(v116);
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[4] = v49;
        *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)v111 = v49;
        LODWORD(v12) = 0;
        v81 = v82;
        *(_DWORD *)v112 = 1;
        *(_DWORD *)&v113[4] = 1;
        *(_DWORD *)&v112[4] = v57 != (_QWORD)v79;
        *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
        *(_DWORD *)v115 = 1;
        *(_QWORD *)&v113[8] = 0x100000001;
        goto LABEL_138;
      }
      -[DNDClientEventDetails subtitle](self, "subtitle");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDClientEventDetails subtitle](v63, "subtitle");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v60;
      if (objc_msgSend(v60, "isEqual:"))
      {
LABEL_128:
        -[DNDClientEventDetails body](self, "body");
        v61 = objc_claimAutoreleasedReturnValue();
        -[DNDClientEventDetails body](v63, "body");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (void *)v61;
        if ((void *)v61 == v72)
        {
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v114 = (v6 != v7) | 0x100000000;
          *(_DWORD *)&v113[32] = v19;
          *(_DWORD *)v113 = v19;
          *(_DWORD *)&v113[24] = HIDWORD(v116);
          *(_DWORD *)&v113[28] = 1;
          *(_DWORD *)&v113[16] = HIDWORD(v116);
          *(_DWORD *)&v113[20] = 1;
          *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
          *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
          *(_DWORD *)&v111[12] = 1;
          *(_DWORD *)v111 = v49;
          *(_DWORD *)&v111[4] = v49;
          v81 = v82;
          *(_DWORD *)v112 = 1;
          *(_DWORD *)&v112[4] = v57 != (_QWORD)v79;
          *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
          *(_DWORD *)&v113[12] = 1;
          *(_DWORD *)&v113[4] = 1;
          *(_DWORD *)&v113[8] = *(_DWORD *)v115;
          LODWORD(v12) = *(_DWORD *)v115;
          v72 = (void *)v61;
          v13 = 1;
          v17 = 1;
        }
        else
        {
          -[DNDClientEventDetails body](self, "body");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
          {
            -[DNDClientEventDetails body](v63, "body");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              -[DNDClientEventDetails body](self, "body");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v63;
              -[DNDClientEventDetails body](v63, "body");
              v8 = objc_claimAutoreleasedReturnValue();
              v64 = v62;
              v17 = objc_msgSend(v62, "isEqual:", v8);
              v114 = *(unsigned int *)&v115[16] | 0x100000000;
              *(_DWORD *)&v113[32] = v19;
              *(_DWORD *)v113 = v19;
              *(_DWORD *)&v113[24] = HIDWORD(v116);
              *(_DWORD *)&v113[28] = 1;
              *(_DWORD *)&v113[16] = HIDWORD(v116);
              *(_DWORD *)&v113[20] = 1;
              *(_DWORD *)&v111[16] = v43;
              *(_DWORD *)&v111[8] = v43;
              *(_DWORD *)&v111[12] = 1;
              *(_DWORD *)v111 = v49;
              *(_DWORD *)&v111[4] = v49;
              v81 = v82;
              *(_DWORD *)v112 = 1;
              *(_DWORD *)&v112[4] = *(_DWORD *)&v115[4];
              *(_DWORD *)&v112[8] = *(_DWORD *)&v115[4];
              *(_DWORD *)&v113[12] = 1;
              *(_DWORD *)&v113[4] = 1;
              *(_DWORD *)&v113[8] = *(_DWORD *)v115;
              LODWORD(v12) = *(_DWORD *)v115;
              v13 = 1;
              v14 = 1;
              v15 = 1;
              v16 = 1;
              goto LABEL_29;
            }
            v67 = 0;
            v16 = 0;
            v17 = 0;
            v114 = (v6 != v7) | 0x100000000;
            *(_DWORD *)&v113[32] = v19;
            *(_DWORD *)v113 = v19;
            *(_DWORD *)&v113[24] = HIDWORD(v116);
            *(_DWORD *)&v113[28] = 1;
            *(_DWORD *)&v113[16] = HIDWORD(v116);
            *(_DWORD *)&v113[20] = 1;
            *(_DWORD *)&v111[16] = v43;
            *(_DWORD *)&v111[8] = v43;
            *(_DWORD *)&v111[12] = 1;
            *(_DWORD *)v111 = v49;
            *(_DWORD *)&v111[4] = v49;
            v81 = v82;
            *(_DWORD *)v112 = 1;
            *(_DWORD *)&v112[4] = v57 != (_QWORD)v79;
            *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
            *(_DWORD *)&v113[12] = 1;
            *(_DWORD *)&v113[4] = 1;
            *(_DWORD *)&v113[8] = *(_DWORD *)v115;
            LODWORD(v12) = *(_DWORD *)v115;
            v13 = 1;
            v14 = 1;
            v15 = 1;
          }
          else
          {
            v68 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v114 = (v6 != v7) | 0x100000000;
            *(_DWORD *)&v113[32] = v19;
            *(_DWORD *)v113 = v19;
            *(_DWORD *)&v113[24] = HIDWORD(v116);
            *(_DWORD *)&v113[28] = 1;
            *(_DWORD *)&v113[16] = HIDWORD(v116);
            *(_DWORD *)&v113[20] = 1;
            *(_DWORD *)&v111[16] = v43;
            *(_DWORD *)&v111[8] = v43;
            *(_DWORD *)&v111[12] = 1;
            *(_DWORD *)v111 = v49;
            *(_DWORD *)&v111[4] = v49;
            v81 = v82;
            *(_DWORD *)v112 = 1;
            *(_DWORD *)&v112[4] = v57 != (_QWORD)v79;
            *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
            *(_DWORD *)&v113[12] = 1;
            *(_DWORD *)&v113[4] = 1;
            *(_DWORD *)&v113[8] = *(_DWORD *)v115;
            LODWORD(v12) = *(_DWORD *)v115;
            v13 = 1;
            v14 = 1;
          }
        }
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v114 = (v6 != v7) | 0x100000000;
        *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
        *(_DWORD *)v113 = *(_DWORD *)&v115[12];
        *(_DWORD *)&v113[24] = HIDWORD(v116);
        *(_DWORD *)&v113[28] = 1;
        *(_DWORD *)&v113[16] = HIDWORD(v116);
        *(_DWORD *)&v113[20] = 1;
        *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
        *(_DWORD *)&v111[12] = 1;
        *(_DWORD *)v111 = v49;
        *(_DWORD *)&v111[4] = v49;
        v81 = v82;
        *(_DWORD *)v112 = 1;
        *(_DWORD *)&v112[4] = v57 != (_QWORD)v79;
        *(_DWORD *)&v112[8] = *(_DWORD *)&v112[4];
        *(_DWORD *)v115 = 1;
        *(_DWORD *)&v113[4] = 1;
        *(_QWORD *)&v113[8] = 0x100000001;
        LODWORD(v12) = 1;
      }
    }
    else
    {
      *(_QWORD *)&v113[8] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(_QWORD *)v115 = 0x100000000;
      v114 = (v6 != v7) | 0x100000000;
      *(_DWORD *)&v113[32] = *(_DWORD *)&v115[12];
      *(_DWORD *)v113 = *(_DWORD *)&v115[12];
      *(_DWORD *)&v113[28] = 1;
      *(_DWORD *)&v113[24] = HIDWORD(v116);
      *(_DWORD *)&v113[16] = HIDWORD(v116);
      *(_DWORD *)&v113[20] = 1;
      *(_DWORD *)&v111[16] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[4] = v49;
      *(_DWORD *)&v111[8] = *(_DWORD *)&v115[8];
      *(_DWORD *)&v111[12] = 1;
      *(_DWORD *)v111 = v49;
      LODWORD(v12) = 0;
      v81 = v82;
      *(_QWORD *)v112 = 0x100000001;
      *(_DWORD *)&v113[4] = 1;
      *(_DWORD *)&v112[8] = 1;
    }
LABEL_138:
    v5 = v63;
    goto LABEL_29;
  }
  memset(v113, 0, sizeof(v113));
  v116 = 0;
  memset(v111, 0, sizeof(v111));
  memset(v112, 0, sizeof(v112));
  *(_OWORD *)v115 = 0uLL;
  LODWORD(v12) = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  *(_DWORD *)&v115[16] = 1;
  v114 = 1;
LABEL_29:
  if (v16)
  {
    v33 = v5;
    v34 = v7;
    v35 = v6;
    v36 = v12;
    v37 = v13;
    v38 = v14;
    v39 = v15;

    v15 = v39;
    v14 = v38;
    v13 = v37;
    LODWORD(v12) = v36;
    v6 = v35;
    v7 = v34;
    v5 = v33;
  }
  if (v15)

  if (v14)
  if (v13)
  {

  }
  if ((_DWORD)v12)
  {

  }
  if (*(_DWORD *)&v113[8])

  if (*(_DWORD *)v115)
  if (*(_DWORD *)&v113[12])
  {

  }
  if (*(_DWORD *)&v112[8])
  {

  }
  if (*(_DWORD *)&v112[4])

  if (*(_DWORD *)&v115[4])
  if (*(_DWORD *)&v113[4])
  {

  }
  if (*(_DWORD *)v112)
  {

  }
  if (*(_DWORD *)v111)
  {

  }
  if (*(_DWORD *)&v111[4])

  if ((_DWORD)v116)
  if (*(_DWORD *)&v111[12])
  {

  }
  if (*(_DWORD *)&v111[8])
  {

  }
  if (*(_DWORD *)&v111[16])

  if (*(_DWORD *)&v115[8])
  if (*(_DWORD *)&v113[20])
  {

  }
  if (*(_DWORD *)&v113[16])
  {

  }
  if (*(_DWORD *)&v113[24])

  if (HIDWORD(v116))
  if (*(_DWORD *)&v113[28])
  {

  }
  if (*(_DWORD *)v113)
  {

  }
  if (*(_DWORD *)&v113[32])

  if (*(_DWORD *)&v115[12])
  if (HIDWORD(v114))
  {

  }
  if ((_DWORD)v114)
  {

  }
  if (*(_DWORD *)&v115[16])

  if (v6 != v7)
LABEL_94:

  return v17;
}

- (id)description
{
  return -[DNDClientEventDetails _descriptionForRedacted:](self, "_descriptionForRedacted:", 0);
}

- (id)redactedDescription
{
  return -[DNDClientEventDetails _descriptionForRedacted:](self, "_descriptionForRedacted:", 1);
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = a3;
  v31 = (void *)MEMORY[0x1E0CB3940];
  v29 = objc_opt_class();
  -[DNDClientEventDetails identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[DNDClientEventDetails bundleIdentifier](self, "bundleIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromDNDPlatform(-[DNDClientEventDetails platform](self, "platform"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DNDClientEventDetails type](self, "type");
  if (v6 > 4)
    v7 = CFSTR("<unknown>");
  else
    v7 = off_1E39B5E68[v6];
  v28 = v7;
  v8 = -[DNDClientEventDetails urgency](self, "urgency");
  v9 = CFSTR("<unknown>");
  if (v8 <= 2)
    v9 = off_1E39B5E90[v8];
  v27 = v9;
  -[DNDClientEventDetails sender](self, "sender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)v10;
  v33 = (void *)v5;
  v32 = v3;
  v30 = v10;
  if (v3)
  {
    objc_msgSend(v10, "redactedDescription");
    v34 = objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails threadIdentifier](self, "threadIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dnd_privacyObfuscatedString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails filterCriteria](self, "filterCriteria");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dnd_privacyObfuscatedString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DNDClientEventDetails threadIdentifier](self, "threadIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDClientEventDetails filterCriteria](self, "filterCriteria");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v11;
  }
  v12 = -[DNDClientEventDetails notifyAnyway](self, "notifyAnyway");
  v13 = -[DNDClientEventDetails behavior](self, "behavior");
  v14 = CFSTR("Legacy");
  if (v13 != 1)
    v14 = CFSTR("<unknown>");
  if (!v13)
    v14 = CFSTR("Default");
  v15 = v14;
  -[DNDClientEventDetails forwardingBehavior](self, "forwardingBehavior");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDClientEventDetails title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dnd_privacyObfuscatedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDClientEventDetails subtitle](self, "subtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dnd_privacyObfuscatedString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDClientEventDetails body](self, "body");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dnd_privacyObfuscatedString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@: %p; identifier: '%@'; bundleIdentifier: %@; platform: %@; type: %@; urgency: %@; sender: %@; threadIdentifier: %@; filterCritera: %@; notifyAnyway: %d; behavior: %@; forwardingBehavior: %@; title: %@; subtitle: %@; body: %@>"),
    v29,
    self,
    v33,
    v36,
    v35,
    v28,
    v27,
    v34,
    v38,
    v37,
    v12,
    v15,
    v16,
    v18,
    v20,
    v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {

    v37 = v26;
    v38 = (void *)v34;
  }

  return v23;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDClientEventDetails _initWithDetails:]([DNDMutableClientEventDetails alloc], "_initWithDetails:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDClientEventDetails)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DNDClientEventDetails *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("platform"));
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  v16 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("urgency"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterCriteria"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("notifyAnyway"));
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("behavior"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("forwardingBehavior"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v7;
  v13 = -[DNDClientEventDetails _initWithIdentifier:bundleIdentifier:platform:type:urgency:sender:threadIdentifier:filterCriteria:notifyAnyway:behavior:forwardingBehavior:title:subtitle:body:](self, "_initWithIdentifier:bundleIdentifier:platform:type:urgency:sender:threadIdentifier:filterCriteria:notifyAnyway:behavior:forwardingBehavior:title:subtitle:body:", v20, v19, v18, v17, v16, v4, v5, v6, v15, v8, v9, v10, v11, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[DNDClientEventDetails identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[DNDClientEventDetails bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails platform](self, "platform"), CFSTR("platform"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails urgency](self, "urgency"), CFSTR("urgency"));
  -[DNDClientEventDetails sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sender"));

  -[DNDClientEventDetails threadIdentifier](self, "threadIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("threadIdentifier"));

  -[DNDClientEventDetails filterCriteria](self, "filterCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("filterCriteria"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DNDClientEventDetails notifyAnyway](self, "notifyAnyway"), CFSTR("notifyAnyway"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDClientEventDetails behavior](self, "behavior"), CFSTR("behavior"));
  -[DNDClientEventDetails forwardingBehavior](self, "forwardingBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("forwardingBehavior"));

  -[DNDClientEventDetails title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("title"));

  -[DNDClientEventDetails subtitle](self, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("subtitle"));

  -[DNDClientEventDetails body](self, "body");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("body"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)urgency
{
  return self->_urgency;
}

- (DNDContactHandle)sender
{
  return self->_sender;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (BOOL)notifyAnyway
{
  return self->_notifyAnyway;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (DNDClientEventBehavior)forwardingBehavior
{
  return self->_forwardingBehavior;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_forwardingBehavior, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
