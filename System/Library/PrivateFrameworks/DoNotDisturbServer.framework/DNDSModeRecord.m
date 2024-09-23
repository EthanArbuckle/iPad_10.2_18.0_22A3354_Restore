@implementation DNDSModeRecord

- (DNDSModeRecord)init
{
  return (DNDSModeRecord *)-[DNDSModeRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "symbolImageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "symbolDescriptorTintStyle");
  objc_msgSend(v3, "symbolDescriptorTintColorNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolDescriptorImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "semanticType");
  v10 = objc_msgSend(v3, "visibility");
  objc_msgSend(v3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderExcludedPlatforms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[DNDSModeRecord _initWithSymbolImageName:tintColorName:symbolDescriptorTintStyle:symbolDescriptorTintColorNames:symbolDescriptorImageName:name:modeIdentifier:semanticType:visibility:identifier:placeholderExcludedPlatforms:](self, "_initWithSymbolImageName:tintColorName:symbolDescriptorTintStyle:symbolDescriptorTintColorNames:symbolDescriptorImageName:name:modeIdentifier:semanticType:visibility:identifier:placeholderExcludedPlatforms:", v16, v4, v15, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (id)_initWithSymbolImageName:(id)a3 tintColorName:(id)a4 symbolDescriptorTintStyle:(unint64_t)a5 symbolDescriptorTintColorNames:(id)a6 symbolDescriptorImageName:(id)a7 name:(id)a8 modeIdentifier:(id)a9 semanticType:(int64_t)a10 visibility:(unint64_t)a11 identifier:(id)a12 placeholderExcludedPlatforms:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  DNDSModeRecord *v26;
  uint64_t v27;
  NSString *symbolImageName;
  uint64_t v29;
  NSString *tintColorName;
  uint64_t v31;
  NSArray *symbolDescriptorTintColorNames;
  uint64_t v33;
  NSString *symbolDescriptorImageName;
  uint64_t v35;
  NSString *name;
  uint64_t v37;
  NSString *modeIdentifier;
  NSUUID *v39;
  NSUUID *identifier;
  uint64_t v41;
  NSArray *placeholderExcludedPlatforms;
  objc_super v45;

  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a12;
  v25 = a13;
  v45.receiver = self;
  v45.super_class = (Class)DNDSModeRecord;
  v26 = -[DNDSModeRecord init](&v45, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v18, "copy");
    symbolImageName = v26->_symbolImageName;
    v26->_symbolImageName = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    tintColorName = v26->_tintColorName;
    v26->_tintColorName = (NSString *)v29;

    v26->_symbolDescriptorTintStyle = a5;
    v31 = objc_msgSend(v20, "copy");
    symbolDescriptorTintColorNames = v26->_symbolDescriptorTintColorNames;
    v26->_symbolDescriptorTintColorNames = (NSArray *)v31;

    v33 = objc_msgSend(v21, "copy");
    symbolDescriptorImageName = v26->_symbolDescriptorImageName;
    v26->_symbolDescriptorImageName = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    name = v26->_name;
    v26->_name = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    modeIdentifier = v26->_modeIdentifier;
    v26->_modeIdentifier = (NSString *)v37;

    v26->_semanticType = a10;
    v26->_visibility = a11;
    if (v24)
      v39 = (NSUUID *)v24;
    else
      v39 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v26->_identifier;
    v26->_identifier = v39;

    v41 = objc_msgSend(v25, "copy");
    placeholderExcludedPlatforms = v26->_placeholderExcludedPlatforms;
    v26->_placeholderExcludedPlatforms = (NSArray *)v41;

  }
  return v26;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t symbolDescriptorTintStyle;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_symbolImageName, "hash");
  v4 = -[NSString hash](self->_tintColorName, "hash") ^ v3;
  symbolDescriptorTintStyle = self->_symbolDescriptorTintStyle;
  v6 = v4 ^ symbolDescriptorTintStyle ^ -[NSArray hash](self->_symbolDescriptorTintColorNames, "hash");
  v7 = -[NSString hash](self->_symbolDescriptorImageName, "hash");
  v8 = v7 ^ -[NSString hash](self->_name, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_modeIdentifier, "hash");
  v10 = self->_semanticType ^ self->_visibility;
  v11 = v10 ^ -[NSUUID hash](self->_identifier, "hash");
  return v9 ^ v11 ^ -[NSArray hash](self->_placeholderExcludedPlatforms, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeRecord *v4;
  DNDSModeRecord *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _BOOL4 v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  _BOOL4 v56;
  int64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  DNDSModeRecord *v63;
  int v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  int v68;
  int v69;
  int v70;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
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
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[28];
  __int128 v124;
  _QWORD v125[3];

  v4 = (DNDSModeRecord *)a3;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_119;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_119;
  }
  v5 = v4;
  -[DNDSModeRecord symbolImageName](self, "symbolImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord symbolImageName](v5, "symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    -[DNDSModeRecord symbolImageName](self, "symbolImageName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v120 = 0;
      v121 = 0uLL;
      memset(v125, 0, 20);
      v124 = 0uLL;
      v12 = 0;
      v122 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_58;
    }
    v120 = (void *)v8;
    -[DNDSModeRecord symbolImageName](v5, "symbolImageName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v117 = 0;
      v124 = 0uLL;
      *(_QWORD *)((char *)v125 + 4) = 0;
      *(_QWORD *)((char *)&v125[1] + 4) = 0;
      v12 = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v125[0]) = 1;
      goto LABEL_58;
    }
    v117 = (void *)v10;
    -[DNDSModeRecord symbolImageName](self, "symbolImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeRecord symbolImageName](v5, "symbolImageName");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v11;
    if (!objc_msgSend(v11, "isEqual:"))
    {
      v124 = 1uLL;
      *(_OWORD *)((char *)v125 + 4) = 0uLL;
      v12 = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v125[0]) = 1;
      goto LABEL_58;
    }
  }
  -[DNDSModeRecord tintColorName](self, "tintColorName");
  v19 = objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord tintColorName](v5, "tintColorName");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)v19;
  v20 = v19 != (_QWORD)v118;
  LODWORD(v125[0]) = v6 != v7;
  if ((void *)v19 != v118)
  {
    -[DNDSModeRecord tintColorName](self, "tintColorName");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v116 = 0;
      *(_QWORD *)((char *)v125 + 4) = 0;
      *(_QWORD *)((char *)&v125[1] + 4) = 0;
      v9 = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      v12 = 0;
      *((_QWORD *)&v124 + 1) = 1;
      goto LABEL_58;
    }
    v22 = (void *)v21;
    -[DNDSModeRecord tintColorName](v5, "tintColorName");
    v23 = objc_claimAutoreleasedReturnValue();
    v116 = v22;
    if (!v23)
    {
      v113 = 0;
      *(_QWORD *)((char *)v125 + 4) = 0;
      *(_QWORD *)((char *)&v125[1] + 4) = 0;
      v9 = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      memset(v123, 0, 24);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      v12 = 0;
      *((_QWORD *)&v124 + 1) = 1;
      *(_DWORD *)&v123[24] = 1;
      goto LABEL_58;
    }
    v113 = (void *)v23;
    -[DNDSModeRecord tintColorName](self, "tintColorName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeRecord tintColorName](v5, "tintColorName");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      *(_DWORD *)&v123[20] = 0;
      *(_QWORD *)((char *)v125 + 4) = 0;
      *(_QWORD *)((char *)&v125[1] + 4) = 0;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[8] = 0;
      v9 = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      v12 = 0;
      *((_QWORD *)&v124 + 1) = 1;
      *(_DWORD *)&v123[24] = 1;
      v25 = 1;
LABEL_24:
      *(_DWORD *)&v123[16] = v25;
      goto LABEL_58;
    }
  }
  v26 = -[DNDSModeRecord symbolDescriptorTintStyle](self, "symbolDescriptorTintStyle");
  DWORD2(v124) = v20;
  if (v26 != -[DNDSModeRecord symbolDescriptorTintStyle](v5, "symbolDescriptorTintStyle"))
  {
    *(_DWORD *)&v123[20] = 0;
    *(_QWORD *)((char *)v125 + 4) = 0;
    *(_QWORD *)((char *)&v125[1] + 4) = 0;
    *(_QWORD *)v123 = 0;
    *(_QWORD *)&v123[8] = 0;
    v122 = 0uLL;
    v121 = 0uLL;
    v25 = v20;
    HIDWORD(v124) = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v9 = 1;
    LODWORD(v124) = v6 != v7;
    DWORD1(v124) = 1;
    v12 = 0;
    *(_DWORD *)&v123[24] = v25;
    goto LABEL_24;
  }
  -[DNDSModeRecord symbolDescriptorTintColorNames](self, "symbolDescriptorTintColorNames");
  v27 = objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord symbolDescriptorTintColorNames](v5, "symbolDescriptorTintColorNames");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v27 != v28;
  v112 = (void *)v27;
  v111 = (void *)v28;
  if (v27 != v28)
  {
    -[DNDSModeRecord symbolDescriptorTintColorNames](self, "symbolDescriptorTintColorNames");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      v108 = 0;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[8] = 0;
      *(_QWORD *)((char *)v125 + 4) = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      v43 = v20;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      v12 = 0;
      *(_DWORD *)&v123[24] = v43;
      *(_DWORD *)&v123[16] = v43;
      *(_DWORD *)&v123[20] = 1;
      HIDWORD(v125[1]) = 0;
      LODWORD(v125[2]) = 1;
      goto LABEL_58;
    }
    v108 = (void *)v30;
    -[DNDSModeRecord symbolDescriptorTintColorNames](v5, "symbolDescriptorTintColorNames");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      v105 = 0;
      *(_QWORD *)&v123[4] = 0;
      *(_QWORD *)((char *)v125 + 4) = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      v48 = v20;
      HIDWORD(v124) = 0;
      *(_DWORD *)v123 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      v12 = 0;
      *(_DWORD *)&v123[24] = v48;
      *(_DWORD *)&v123[16] = v48;
      *(_DWORD *)&v123[20] = 1;
      HIDWORD(v125[1]) = 0;
      LODWORD(v125[2]) = 1;
      *(_DWORD *)&v123[12] = 1;
      goto LABEL_58;
    }
    v105 = (void *)v31;
    -[DNDSModeRecord symbolDescriptorTintColorNames](self, "symbolDescriptorTintColorNames");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeRecord symbolDescriptorTintColorNames](v5, "symbolDescriptorTintColorNames");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v32;
    if (!objc_msgSend(v32, "isEqual:"))
    {
      *(_QWORD *)((char *)v125 + 4) = 0;
      v122 = 0uLL;
      v121 = 0uLL;
      v33 = v20;
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      v12 = 0;
      *(_DWORD *)&v123[24] = v33;
      *(_DWORD *)&v123[16] = v33;
      *(_DWORD *)&v123[20] = 1;
      HIDWORD(v125[1]) = 0;
      LODWORD(v125[2]) = 1;
      *(_QWORD *)&v123[8] = 0x100000001;
      goto LABEL_58;
    }
  }
  -[DNDSModeRecord symbolDescriptorImageName](self, "symbolDescriptorImageName");
  v34 = objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord symbolDescriptorImageName](v5, "symbolDescriptorImageName");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v34;
  v106 = (void *)v35;
  v37 = v34 == v35;
  v38 = v34 != v35;
  LODWORD(v125[2]) = v29;
  v107 = v36;
  if (!v37)
  {
    -[DNDSModeRecord symbolDescriptorImageName](self, "symbolDescriptorImageName");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v104 = 0;
      v122 = 0uLL;
      v125[1] = 0;
      v121 = 0uLL;
      v49 = v20;
      v9 = v29;
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v49;
      *(_DWORD *)&v123[12] = v9;
      *(_DWORD *)&v123[16] = v49;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v9;
      v12 = 1;
      HIDWORD(v125[0]) = 1;
      goto LABEL_58;
    }
    v104 = (void *)v39;
    -[DNDSModeRecord symbolDescriptorImageName](v5, "symbolDescriptorImageName");
    v40 = objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      v99 = 0;
      *(_QWORD *)((char *)&v122 + 4) = 0;
      v125[1] = 0;
      v121 = 0uLL;
      v55 = v20;
      LODWORD(v122) = 0;
      v9 = v29;
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v55;
      *(_DWORD *)&v123[12] = v9;
      *(_DWORD *)&v123[16] = v55;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v9;
      v12 = 1;
      HIDWORD(v125[0]) = 1;
      HIDWORD(v122) = 1;
      goto LABEL_58;
    }
    v99 = (void *)v40;
    -[DNDSModeRecord symbolDescriptorImageName](self, "symbolDescriptorImageName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeRecord symbolDescriptorImageName](v5, "symbolDescriptorImageName");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      *((_QWORD *)&v122 + 1) = 0x100000000;
      v125[1] = 0;
      v121 = 0uLL;
      v42 = v20;
      *(_QWORD *)&v122 = 0x100000000;
      v9 = LODWORD(v125[2]);
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v42;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v42;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      HIDWORD(v125[0]) = 1;
      goto LABEL_58;
    }
  }
  -[DNDSModeRecord name](self, "name");
  v44 = objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord name](v5, "name");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v125[1]) = v44 != (_QWORD)v102;
  HIDWORD(v125[0]) = v38;
  v103 = (void *)v44;
  if ((void *)v44 != v102)
  {
    -[DNDSModeRecord name](self, "name");
    v45 = objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      v98 = 0;
      v121 = 0uLL;
      v56 = v20;
      LODWORD(v122) = 0;
      v125[1] = 0x100000000;
      v9 = LODWORD(v125[2]);
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v56;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v56;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      HIDWORD(v122) = v38;
      *(_QWORD *)((char *)&v122 + 4) = v38 | 0x100000000;
      goto LABEL_58;
    }
    v98 = (void *)v45;
    -[DNDSModeRecord name](v5, "name");
    v46 = objc_claimAutoreleasedReturnValue();
    if (!v46)
    {
      v93 = 0;
      v62 = v20;
      *(_QWORD *)((char *)&v121 + 4) = 0;
      LODWORD(v122) = 0;
      v125[1] = 0x100000000;
      v9 = LODWORD(v125[2]);
      LODWORD(v121) = 0;
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[24] = v62;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v62;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      HIDWORD(v122) = v38;
      *(_QWORD *)((char *)&v122 + 4) = v38 | 0x100000000;
      HIDWORD(v121) = 1;
      goto LABEL_58;
    }
    v93 = (void *)v46;
    -[DNDSModeRecord name](self, "name");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeRecord name](v5, "name");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v47;
    if (!objc_msgSend(v47, "isEqual:"))
    {
      LODWORD(v122) = 0;
      v125[1] = 0x100000000;
      *(_QWORD *)&v121 = 0;
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      v15 = 0;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      *(_QWORD *)((char *)&v122 + 4) = v38 | 0x100000000;
      HIDWORD(v122) = v38;
      *((_QWORD *)&v121 + 1) = 0x100000001;
      goto LABEL_58;
    }
  }
  -[DNDSModeRecord modeIdentifier](self, "modeIdentifier");
  v50 = objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord modeIdentifier](v5, "modeIdentifier");
  v51 = objc_claimAutoreleasedReturnValue();
  LODWORD(v125[1]) = v50 != v51;
  v96 = (void *)v51;
  v97 = (void *)v50;
  if (v50 != v51)
  {
    -[DNDSModeRecord modeIdentifier](self, "modeIdentifier");
    v52 = objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      v92 = 0;
      *(_QWORD *)&v121 = 0;
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      HIDWORD(v122) = v38;
      DWORD2(v121) = HIDWORD(v125[1]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      v15 = 0;
      LODWORD(v122) = 1;
      *(_QWORD *)((char *)&v122 + 4) = v38 | 0x100000000;
      LODWORD(v125[1]) = 1;
      goto LABEL_58;
    }
    v92 = (void *)v52;
    -[DNDSModeRecord modeIdentifier](v5, "modeIdentifier");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {
      v89 = 0;
      *(_QWORD *)&v121 = 0x100000000;
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v9 = 1;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      HIDWORD(v122) = v38;
      DWORD2(v121) = HIDWORD(v125[1]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      v15 = 0;
      LODWORD(v122) = 1;
      *(_QWORD *)((char *)&v122 + 4) = v38 | 0x100000000;
      LODWORD(v125[1]) = 1;
      goto LABEL_58;
    }
    v89 = (void *)v53;
    -[DNDSModeRecord modeIdentifier](self, "modeIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeRecord modeIdentifier](v5, "modeIdentifier");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v54;
    if (!objc_msgSend(v54, "isEqual:"))
    {
      *(_QWORD *)v123 = 0;
      HIDWORD(v124) = 0;
      v13 = 0;
      v14 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      HIDWORD(v122) = v38;
      DWORD2(v121) = HIDWORD(v125[1]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      v15 = 0;
      LODWORD(v122) = 1;
      *(_QWORD *)((char *)&v122 + 4) = v38 | 0x100000000;
      LODWORD(v125[1]) = 1;
      *(_QWORD *)&v121 = 0x100000001;
      goto LABEL_58;
    }
  }
  v57 = -[DNDSModeRecord semanticType](self, "semanticType");
  if (v57 != -[DNDSModeRecord semanticType](v5, "semanticType")
    || (v58 = -[DNDSModeRecord visibility](self, "visibility"), v58 != -[DNDSModeRecord visibility](v5, "visibility")))
  {
    *(_QWORD *)v123 = 0;
    HIDWORD(v124) = 0;
    v14 = 0;
    v9 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v124) = v6 != v7;
    DWORD1(v124) = 1;
    *(_DWORD *)&v123[20] = 1;
    *(_DWORD *)&v123[24] = v20;
    *(_DWORD *)&v123[12] = v125[2];
    *(_DWORD *)&v123[16] = v20;
    *(_DWORD *)&v123[8] = v125[2];
    v12 = 1;
    HIDWORD(v122) = HIDWORD(v125[0]);
    *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
    HIDWORD(v121) = HIDWORD(v125[1]);
    v15 = 0;
    LODWORD(v122) = 1;
    LODWORD(v121) = v125[1];
    *(_QWORD *)((char *)&v121 + 4) = v125[1];
    v13 = 0;
    goto LABEL_58;
  }
  -[DNDSModeRecord identifier](self, "identifier");
  v59 = objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord identifier](v5, "identifier");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v59 != (_QWORD)v85;
  v86 = (void *)v59;
  if ((void *)v59 != v85)
  {
    -[DNDSModeRecord identifier](self, "identifier");
    v60 = objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      v83 = 0;
      HIDWORD(v122) = HIDWORD(v125[0]);
      *(_QWORD *)v123 = 0x100000000;
      v14 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      HIDWORD(v121) = HIDWORD(v125[1]);
      v15 = 0;
      LODWORD(v122) = 1;
      LODWORD(v121) = v125[1];
      *(_QWORD *)((char *)&v121 + 4) = v125[1];
      v13 = 0;
      HIDWORD(v124) = 1;
      goto LABEL_58;
    }
    v83 = (void *)v60;
    -[DNDSModeRecord identifier](v5, "identifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v82)
    {
      v82 = 0;
      v14 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      *(_DWORD *)&v123[8] = v125[2];
      v12 = 1;
      HIDWORD(v122) = HIDWORD(v125[0]);
      HIDWORD(v121) = HIDWORD(v125[1]);
      v15 = 0;
      LODWORD(v122) = 1;
      *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      LODWORD(v121) = v125[1];
      *(_QWORD *)((char *)&v121 + 4) = v125[1];
      v13 = 0;
      HIDWORD(v124) = 1;
      *(_QWORD *)v123 = 0x100000001;
      goto LABEL_58;
    }
    -[DNDSModeRecord identifier](self, "identifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeRecord identifier](v5, "identifier");
    v78 = v61;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v61, "isEqual:", v77))
    {
      v14 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      v12 = 1;
      HIDWORD(v122) = HIDWORD(v125[0]);
      *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      HIDWORD(v121) = HIDWORD(v125[1]);
      v15 = 0;
      LODWORD(v122) = 1;
      LODWORD(v121) = v125[1];
      *(_QWORD *)((char *)&v121 + 4) = v125[1];
      *(_DWORD *)&v123[8] = v125[2];
      HIDWORD(v124) = 1;
      *(_QWORD *)v123 = 0x100000001;
      v13 = 1;
      goto LABEL_58;
    }
  }
  -[DNDSModeRecord placeholderExcludedPlatforms](self, "placeholderExcludedPlatforms");
  v72 = objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord placeholderExcludedPlatforms](v5, "placeholderExcludedPlatforms");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v124) = v13;
  v81 = (void *)v72;
  if ((void *)v72 == v84)
  {
    v16 = 0;
    v17 = 0;
    LODWORD(v124) = v6 != v7;
    DWORD1(v124) = 1;
    *(_DWORD *)&v123[20] = 1;
    *(_DWORD *)&v123[24] = v20;
    *(_DWORD *)&v123[12] = v125[2];
    *(_DWORD *)&v123[16] = v20;
    v12 = 1;
    HIDWORD(v122) = HIDWORD(v125[0]);
    *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
    HIDWORD(v121) = HIDWORD(v125[1]);
    v15 = 0;
    LODWORD(v122) = 1;
    LODWORD(v121) = v125[1];
    *(_QWORD *)((char *)&v121 + 4) = v125[1];
    v9 = 1;
    *(_DWORD *)&v123[4] = 1;
    *(_DWORD *)&v123[8] = v125[2];
    *(_DWORD *)v123 = v13;
    v84 = (void *)v72;
    v14 = 1;
    v18 = 1;
  }
  else
  {
    -[DNDSModeRecord placeholderExcludedPlatforms](self, "placeholderExcludedPlatforms");
    v73 = objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      v80 = (void *)v73;
      -[DNDSModeRecord placeholderExcludedPlatforms](v5, "placeholderExcludedPlatforms");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        -[DNDSModeRecord placeholderExcludedPlatforms](self, "placeholderExcludedPlatforms");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeRecord placeholderExcludedPlatforms](v5, "placeholderExcludedPlatforms");
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = v74;
        v18 = objc_msgSend(v74, "isEqual:", v75);
        v9 = v75;
        LODWORD(v124) = v6 != v7;
        DWORD1(v124) = 1;
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[24] = v20;
        *(_DWORD *)&v123[12] = v125[2];
        *(_DWORD *)&v123[16] = v20;
        v12 = 1;
        HIDWORD(v122) = HIDWORD(v125[0]);
        *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
        HIDWORD(v121) = HIDWORD(v125[1]);
        LODWORD(v122) = 1;
        LODWORD(v121) = v125[1];
        *(_QWORD *)((char *)&v121 + 4) = v125[1];
        *(_DWORD *)&v123[4] = 1;
        *(_DWORD *)&v123[8] = v125[2];
        *(_DWORD *)v123 = v13;
        v14 = 1;
        v15 = 1;
        v16 = 1;
        v17 = 1;
      }
      else
      {
        v79 = 0;
        v17 = 0;
        v18 = 0;
        LODWORD(v124) = v6 != v7;
        DWORD1(v124) = 1;
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[24] = v20;
        v9 = LODWORD(v125[2]);
        *(_DWORD *)&v123[12] = v125[2];
        *(_DWORD *)&v123[16] = v20;
        v12 = 1;
        HIDWORD(v122) = HIDWORD(v125[0]);
        *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
        HIDWORD(v121) = HIDWORD(v125[1]);
        LODWORD(v122) = 1;
        LODWORD(v121) = v125[1];
        *(_QWORD *)((char *)&v121 + 4) = v125[1];
        *(_DWORD *)&v123[4] = 1;
        *(_DWORD *)&v123[8] = v125[2];
        *(_DWORD *)v123 = v13;
        v14 = 1;
        v15 = 1;
        v16 = 1;
      }
    }
    else
    {
      v80 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v124) = v6 != v7;
      DWORD1(v124) = 1;
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[24] = v20;
      v9 = LODWORD(v125[2]);
      *(_DWORD *)&v123[12] = v125[2];
      *(_DWORD *)&v123[16] = v20;
      v12 = 1;
      HIDWORD(v122) = HIDWORD(v125[0]);
      *(_QWORD *)((char *)&v122 + 4) = HIDWORD(v125[0]) | 0x100000000;
      HIDWORD(v121) = HIDWORD(v125[1]);
      LODWORD(v122) = 1;
      LODWORD(v121) = v125[1];
      *(_QWORD *)((char *)&v121 + 4) = v125[1];
      *(_DWORD *)&v123[4] = 1;
      *(_DWORD *)&v123[8] = v125[2];
      *(_DWORD *)v123 = v13;
      v14 = 1;
      v15 = 1;
    }
  }
LABEL_58:
  if (v17)
  {
    v63 = v5;
    v64 = v12;
    v65 = v7;
    v66 = v6;
    v67 = v13;
    v68 = v14;
    v69 = v15;
    v70 = v16;

    v16 = v70;
    v15 = v69;
    v14 = v68;
    v13 = v67;
    v6 = v66;
    v7 = v65;
    v12 = v64;
    v5 = v63;
  }
  if (v16)

  if (v15)
  {

    if (!v14)
      goto LABEL_64;
LABEL_121:

    if (!v13)
      goto LABEL_66;
    goto LABEL_65;
  }
  if (v14)
    goto LABEL_121;
LABEL_64:
  if (v13)
  {
LABEL_65:

  }
LABEL_66:
  if (*(_DWORD *)v123)

  if (HIDWORD(v124))
  if (*(_DWORD *)&v123[4])
  {

  }
  if ((_DWORD)v121)
  {

  }
  if (DWORD1(v121))

  if (LODWORD(v125[1]))
  if ((_DWORD)v122)
  {

  }
  if (DWORD2(v121))
  {

  }
  if (HIDWORD(v121))

  if (HIDWORD(v125[1]))
  if (DWORD2(v122))
  {

  }
  if (DWORD1(v122))
  {

  }
  if (HIDWORD(v122))

  if (HIDWORD(v125[0]))
  if (v12)
  {

  }
  if (*(_DWORD *)&v123[8])
  {

  }
  if (*(_DWORD *)&v123[12])

  if (LODWORD(v125[2]))
  if (*(_DWORD *)&v123[20])
  {

  }
  if (*(_DWORD *)&v123[16])
  {

  }
  if (*(_DWORD *)&v123[24])

  if (DWORD2(v124))
  if (DWORD1(v124))
  {

  }
  if ((_DWORD)v124)
  {

  }
  if (LODWORD(v125[0]))

  if (v6 != v7)
LABEL_119:

  return v18;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v17 = objc_opt_class();
  -[DNDSModeRecord symbolImageName](self, "symbolImageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord tintColorName](self, "tintColorName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DNDSModeRecord symbolDescriptorTintStyle](self, "symbolDescriptorTintStyle");
  -[DNDSModeRecord symbolDescriptorTintColorNames](self, "symbolDescriptorTintColorNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord symbolDescriptorImageName](self, "symbolDescriptorImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord modeIdentifier](self, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DNDSModeRecord semanticType](self, "semanticType");
  v8 = -[DNDSModeRecord visibility](self, "visibility");
  -[DNDSModeRecord identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord placeholderExcludedPlatforms](self, "placeholderExcludedPlatforms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p; symbolImageName: %@; tintColorName: %@; symbolDescriptorTintStyle: %lu; symbolDescriptorTintColorNames: %@; symbolDescriptorImageName: %@; name: %@; modeIdentifier: %@; semanticType: %zd; visibility: %lu; identifier: %@; placeholderExcludedPlatforms; %@>"),
    v17,
    self,
    v16,
    v15,
    v14,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSModeRecord _initWithRecord:]([DNDSMutableModeRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("symbolImageName"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("tintColorName"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("symbolDescriptorTintStyle"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v20, "integerValue");
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("symbolDescriptorTintColorNames"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("symbolDescriptorImageName"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("name"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("modeIdentifier"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("semanticType"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v16, "integerValue");
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("visibility"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v15, "integerValue");
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("identifier"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
  else
    v11 = 0;
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("excludedPlatforms"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSymbolImageName:tintColorName:symbolDescriptorTintStyle:symbolDescriptorTintColorNames:symbolDescriptorImageName:name:modeIdentifier:semanticType:visibility:identifier:placeholderExcludedPlatforms:", v22, v21, v6, v19, v18, v17, v7, v8, v9, v11, v12);

  return v14;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "healingSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_modeIdentifier, CFSTR("modeIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_semanticType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("semanticType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_visibility);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("visibility"));

  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_tintColorName, CFSTR("tintColorName"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_symbolImageName, CFSTR("symbolImageName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_symbolDescriptorTintStyle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("symbolDescriptorTintStyle"));

  -[DNDSModeRecord symbolDescriptorTintColorNames](self, "symbolDescriptorTintColorNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v13, CFSTR("symbolDescriptorTintColorNames"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_symbolDescriptorImageName, CFSTR("symbolDescriptorImageName"));
  return v8;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSString)tintColorName
{
  return self->_tintColorName;
}

- (unint64_t)symbolDescriptorTintStyle
{
  return self->_symbolDescriptorTintStyle;
}

- (NSArray)symbolDescriptorTintColorNames
{
  return self->_symbolDescriptorTintColorNames;
}

- (NSString)symbolDescriptorImageName
{
  return self->_symbolDescriptorImageName;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (int64_t)semanticType
{
  return self->_semanticType;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)placeholderExcludedPlatforms
{
  return self->_placeholderExcludedPlatforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderExcludedPlatforms, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_symbolDescriptorImageName, 0);
  objc_storeStrong((id *)&self->_symbolDescriptorTintColorNames, 0);
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
}

@end
