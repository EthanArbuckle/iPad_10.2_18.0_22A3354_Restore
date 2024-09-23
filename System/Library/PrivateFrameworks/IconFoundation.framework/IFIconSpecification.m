@implementation IFIconSpecification

+ (id)defaultIconSpecification
{
  return +[IFIconSpecification iosAppIconSpecification](IFIconSpecification, "iosAppIconSpecification");
}

- (double)maxScale
{
  return self->_maxScale;
}

+ (id)iosAppIconSpecification
{
  if (iosAppIconSpecification_onceToken != -1)
    dispatch_once(&iosAppIconSpecification_onceToken, &__block_literal_global_70);
  return (id)iosAppIconSpecification_iconSpecification;
}

- (CGSize)maxSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_maxSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

void __60__IFIconSpecification_Constructors__iosAppIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  IFImageSpecification *v6;
  IFImageSpecification *v7;
  IFImageSpecification *v8;
  IFImageSpecification *v9;
  IFImageSpecification *v10;
  IFImageSpecification *v11;
  IFImageSpecification *v12;
  IFImageSpecification *v13;
  IFImageSpecification *v14;
  IFImageSpecification *v15;
  IFImageSpecification *v16;
  IFImageSpecification *v17;
  IFImageSpecification *v18;
  IFImageSpecification *v19;
  void *v20;
  IFImageSpecification *v21;
  IFImageSpecification *v22;
  void *v23;
  IFImageSpecification *v24;
  IFImageSpecification *v25;
  void *v26;
  IFImageSpecification *v27;
  IFImageSpecification *v28;
  IFImageSpecification *v29;
  IFImageSpecification *v30;
  void *v31;
  IFImageSpecification *v32;
  IFImageSpecification *v33;
  void *v34;
  IFImageSpecification *v35;
  IFImageSpecification *v36;
  void *v37;
  IFImageSpecification *v38;
  IFImageSpecification *v39;
  void *v40;
  IFImageSpecification *v41;
  void *v42;
  ISVariantIconSpecification *v43;
  id v44;
  IFIconSpecification *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  IFImageSpecification *v49;
  void *v50;
  IFImageSpecification *v51;
  void *v52;
  IFImageSpecification *v53;
  void *v54;
  IFImageSpecification *v55;
  void *v56;
  IFImageSpecification *v57;
  void *v58;
  void *v59;
  IFImageSpecification *v60;
  void *v61;
  IFImageSpecification *v62;
  void *v63;
  IFImageSpecification *v64;
  void *v65;
  IFImageSpecification *v66;
  void *v67;
  IFImageSpecification *v68;
  void *v69;
  IFImageSpecification *v70;
  void *v71;
  IFImageSpecification *v72;
  void *v73;
  IFImageSpecification *v74;
  void *v75;
  IFImageSpecification *v76;
  void *v77;
  IFImageSpecification *v78;
  void *v79;
  IFImageSpecification *v80;
  void *v81;
  IFImageSpecification *v82;
  void *v83;
  IFImageSpecification *v84;
  void *v85;
  IFImageSpecification *v86;
  void *v87;
  id v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  _QWORD v92[3];
  const __CFString *v93;
  _QWORD v94[2];
  _QWORD v95[2];
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  _QWORD v101[2];
  _QWORD v102[2];
  const __CFString *v103;
  _QWORD v104[2];
  _QWORD v105[2];
  const __CFString *v106;
  const __CFString *v107;
  const __CFString *v108;
  const __CFString *v109;
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  _QWORD v116[26];

  v116[24] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v115 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v87, 20.0, 20.0, 1.0);
  v116[0] = v86;
  v1 = [IFImageSpecification alloc];
  v114 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v85, 29.0, 29.0, 1.0);
  v116[1] = v84;
  v2 = [IFImageSpecification alloc];
  v113 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v83, 40.0, 40.0, 1.0);
  v116[2] = v82;
  v3 = [IFImageSpecification alloc];
  v112[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v112[1] = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v81, 60.0, 60.0, 1.0);
  v116[3] = v80;
  v4 = [IFImageSpecification alloc];
  v111[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v111[1] = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v79, 76.0, 76.0, 1.0);
  v116[4] = v78;
  v5 = [IFImageSpecification alloc];
  v110[0] = CFSTR("IFImageSpecificationTagAppStore");
  v110[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v77, 1024.0, 1024.0, 1.0);
  v116[5] = v76;
  v6 = [IFImageSpecification alloc];
  v109 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v75, 20.0, 20.0, 2.0);
  v116[6] = v74;
  v7 = [IFImageSpecification alloc];
  v108 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v73, 29.0, 29.0, 2.0);
  v116[7] = v72;
  v8 = [IFImageSpecification alloc];
  v107 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v71, 38.0, 38.0, 2.0);
  v116[8] = v70;
  v9 = [IFImageSpecification alloc];
  v106 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v69, 40.0, 40.0, 2.0);
  v116[9] = v68;
  v10 = [IFImageSpecification alloc];
  v105[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v105[1] = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v67, 60.0, 60.0, 2.0);
  v116[10] = v66;
  v11 = [IFImageSpecification alloc];
  v104[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v104[1] = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v65, 64.0, 64.0, 2.0);
  v116[11] = v64;
  v12 = [IFImageSpecification alloc];
  v103 = CFSTR("IFImageSpecificationTagHomeScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v63, 68.0, 68.0, 2.0);
  v116[12] = v62;
  v13 = [IFImageSpecification alloc];
  v102[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v102[1] = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v61, 76.0, 76.0, 2.0);
  v116[13] = v60;
  v14 = [IFImageSpecification alloc];
  v101[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v101[1] = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[IFImageSpecification initWithSize:scale:tags:](v14, "initWithSize:scale:tags:", v58, 83.5, 83.5, 2.0);
  v116[14] = v57;
  v15 = [IFImageSpecification alloc];
  v100 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[IFImageSpecification initWithSize:scale:tags:](v15, "initWithSize:scale:tags:", v56, 176.0, 176.0, 2.0);
  v116[15] = v55;
  v16 = [IFImageSpecification alloc];
  v99 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v54, 20.0, 20.0, 3.0);
  v116[16] = v53;
  v17 = [IFImageSpecification alloc];
  v98 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[IFImageSpecification initWithSize:scale:tags:](v17, "initWithSize:scale:tags:", v52, 29.0, 29.0, 3.0);
  v116[17] = v51;
  v18 = [IFImageSpecification alloc];
  v97 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[IFImageSpecification initWithSize:scale:tags:](v18, "initWithSize:scale:tags:", v50, 38.0, 38.0, 3.0);
  v116[18] = v49;
  v19 = [IFImageSpecification alloc];
  v96 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 40.0, 40.0, 3.0);
  v116[19] = v21;
  v22 = [IFImageSpecification alloc];
  v95[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v95[1] = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v23, 60.0, 60.0, 3.0);
  v116[20] = v24;
  v25 = [IFImageSpecification alloc];
  v94[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v94[1] = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[IFImageSpecification initWithSize:scale:tags:](v25, "initWithSize:scale:tags:", v26, 64.0, 64.0, 3.0);
  v116[21] = v27;
  v28 = [IFImageSpecification alloc];
  v29 = -[IFImageSpecification initWithSize:scale:tags:](v28, "initWithSize:scale:tags:", MEMORY[0x1E0C9AA60], 76.0, 76.0, 3.0);
  v116[22] = v29;
  v30 = [IFImageSpecification alloc];
  v93 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[IFImageSpecification initWithSize:scale:tags:](v30, "initWithSize:scale:tags:", v31, 176.0, 176.0, 3.0);
  v116[23] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 24);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = [IFImageSpecification alloc];
  v91 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[IFImageSpecification initWithSize:scale:tags:](v33, "initWithSize:scale:tags:", v34, 60.0, 60.0, 1.0);
  v92[0] = v35;
  v36 = [IFImageSpecification alloc];
  v90 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[IFImageSpecification initWithSize:scale:tags:](v36, "initWithSize:scale:tags:", v37, 60.0, 60.0, 2.0);
  v92[1] = v38;
  v39 = [IFImageSpecification alloc];
  v89 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[IFImageSpecification initWithSize:scale:tags:](v39, "initWithSize:scale:tags:", v40, 60.0, 60.0, 3.0);
  v92[2] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = [ISVariantIconSpecification alloc];
  v44 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v43, "_initWithName:imageSpecifiactions:variants:", CFSTR("Template Icon"), v42, MEMORY[0x1E0C9AA60]);

  v45 = [IFIconSpecification alloc];
  v88 = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v45, "_initWithName:imageSpecifiactions:variants:", CFSTR("Application Icon"), v59, v46);
  v48 = (void *)iosAppIconSpecification_iconSpecification;
  iosAppIconSpecification_iconSpecification = v47;

}

uint64_t __66__IFIconSpecification__initWithName_imageSpecifiactions_variants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "scale");
  v7 = v6;
  objc_msgSend(v5, "scale");
  if (v7 < v8)
  {
LABEL_5:
    v12 = -1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "scale");
  v10 = v9;
  objc_msgSend(v5, "scale");
  if (v10 <= v11)
  {
    objc_msgSend(v4, "dimension");
    v14 = v13;
    objc_msgSend(v5, "dimension");
    if (v14 >= v15)
    {
      objc_msgSend(v4, "dimension");
      v18 = v17;
      objc_msgSend(v5, "dimension");
      v12 = v18 > v19;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v12 = 1;
LABEL_6:

  return v12;
}

- (id)_initWithName:(id)a3 imageSpecifiactions:(id)a4 variants:(id)a5
{
  id v8;
  id v9;
  id v10;
  IFIconSpecification *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSArray *imageSpecifications;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  void *v63;
  CGFloat v64;
  CGFloat v65;
  void *v66;
  CGFloat v67;
  CGFloat v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  uint64_t v73;
  NSArray *variants;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v82.receiver = self;
  v82.super_class = (Class)IFIconSpecification;
  v11 = -[IFIconSpecification init](&v82, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v14 = objc_claimAutoreleasedReturnValue();
    imageSpecifications = v11->_imageSpecifications;
    v11->_imageSpecifications = (NSArray *)v14;

    v16 = (void *)objc_opt_new();
    if (-[NSArray count](v11->_imageSpecifications, "count"))
    {
      v17 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v11->_imageSpecifications, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[NSArray objectAtIndexedSubscript:](v11->_imageSpecifications, "objectAtIndexedSubscript:", v17 - 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        if (++v17 >= -[NSArray count](v11->_imageSpecifications, "count"))
        {
          v20 = 0;
        }
        else
        {
          -[NSArray objectAtIndexedSubscript:](v11->_imageSpecifications, "objectAtIndexedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v18, "setSmallerSpecification:", v19);
        objc_msgSend(v19, "setLargerSpecification:", v18);
        objc_msgSend(v18, "setLargerSpecification:", v20);
        objc_msgSend(v20, "setSmallerSpecification:", v18);
        objc_msgSend(v18, "scale");
        v22 = v21;
        objc_msgSend(v19, "scale");
        if (v22 != v23 || (objc_msgSend(v18, "scale"), v25 = v24, objc_msgSend(v20, "scale"), v25 != v26))
          objc_msgSend(v16, "addObject:", v18);

      }
      while (v17 < -[NSArray count](v11->_imageSpecifications, "count"));
    }
    v76 = v9;
    v77 = v8;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v27 = v16;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v79 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v32, "smallerSpecification", v76, v77, (_QWORD)v78);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "largerSpecification");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "scale");
          v36 = v35;
          objc_msgSend(v33, "scale");
          if (v36 != v37)
          {
            if (v33)
            {
              do
              {
                objc_msgSend(v33, "scale");
                v39 = v38;
                objc_msgSend(v32, "scale");
                if (v39 == v40)
                  break;
                objc_msgSend(v33, "dimension");
                v42 = v41;
                objc_msgSend(v33, "scale");
                v44 = v42 * v43;
                objc_msgSend(v32, "dimension");
                v46 = v45;
                objc_msgSend(v32, "scale");
                if (v44 < v46 * v47)
                  break;
                objc_msgSend(v33, "smallerSpecification");
                v48 = objc_claimAutoreleasedReturnValue();

                v33 = (void *)v48;
              }
              while (v48);
            }
            objc_msgSend(v32, "setSmallerSpecification:", v33);
          }
          objc_msgSend(v32, "scale");
          v50 = v49;
          objc_msgSend(v34, "scale");
          if (v50 != v51)
          {
            if (v34)
            {
              do
              {
                objc_msgSend(v34, "scale");
                v53 = v52;
                objc_msgSend(v32, "scale");
                if (v53 == v54)
                  break;
                objc_msgSend(v34, "dimension");
                v56 = v55;
                objc_msgSend(v34, "scale");
                v58 = v56 * v57;
                objc_msgSend(v32, "dimension");
                v60 = v59;
                objc_msgSend(v32, "scale");
                if (v58 > v60 * v61)
                  break;
                objc_msgSend(v34, "largerSpecification");
                v62 = objc_claimAutoreleasedReturnValue();

                v34 = (void *)v62;
              }
              while (v62);
            }
            objc_msgSend(v32, "setLargerSpecification:", v34);
          }

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
      }
      while (v29);
    }

    -[NSArray lastObject](v11->_imageSpecifications, "lastObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "size");
    v11->_maxSize.width = v64;
    v11->_maxSize.height = v65;

    -[NSArray firstObject](v11->_imageSpecifications, "firstObject");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "size");
    v11->_minSize.width = v67;
    v11->_minSize.height = v68;

    -[NSArray lastObject](v11->_imageSpecifications, "lastObject");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "scale");
    v11->_maxScale = v70;

    -[NSArray firstObject](v11->_imageSpecifications, "firstObject");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "scale");
    v11->_minScale = v72;

    v73 = objc_msgSend(v10, "copy");
    variants = v11->_variants;
    v11->_variants = (NSArray *)v73;

    v9 = v76;
    v8 = v77;
  }

  return v11;
}

- (IFIconSpecification)init
{
  IFIconSpecification *v2;
  IFIconSpecification *v3;
  NSArray *imageSpecifications;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IFIconSpecification;
  v2 = -[IFIconSpecification init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    imageSpecifications = v2->_imageSpecifications;
    v2->_imageSpecifications = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_maxSize = 0u;
    v3->_minSize = 0u;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v3->_maxScale = _Q0;
  }
  return v3;
}

- (id)imageSpecificationForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  height = a3.height;
  width = a3.width;
  v33 = *MEMORY[0x1E0C80C00];
  -[NSArray lastObject](self->_imageSpecifications, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  if (v10 >= a4)
    v10 = a4;
  if (width <= height)
    width = height;
  -[NSArray firstObject](self->_imageSpecifications, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = self->_imageSpecifications;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
LABEL_7:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
      objc_msgSend(v17, "scale", (_QWORD)v28);
      if (v18 >= v10)
      {
        objc_msgSend(v17, "size");
        v20 = v19;
        objc_msgSend(v17, "size");
        v22 = v21;
        objc_msgSend(v17, "size");
        v25 = v20 <= v22 ? v24 : v23;
        v26 = v17;

        v11 = v26;
        if (v25 >= width)
          break;
      }
      if (v14 == ++v16)
      {
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v26 = v11;
        if (v14)
          goto LABEL_7;
        break;
      }
    }
  }
  else
  {
    v26 = v11;
  }

  return v26;
}

- (NSArray)allImageSpecifications
{
  return (NSArray *)(id)-[NSArray copy](self->_imageSpecifications, "copy");
}

- (NSArray)allVariants
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IFIconSpecification variants](self, "variants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "addObject:", v9);
        objc_msgSend(v9, "allVariants");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (id)imageSpecificationsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IFIconSpecification allImageSpecifications](self, "allImageSpecifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageSpecificationsWithTags:(id)a3 withoutTags:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("IFImageSpecificationTagAll"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", CFSTR("IFImageSpecificationTagInternal"));
  if (v8)
  {
    v10 = objc_msgSend(v7, "containsObject:", CFSTR("IFImageSpecificationTagPrivate"));

    if ((v10 & 1) == 0)
      objc_msgSend(v9, "addObject:", CFSTR("IFImageSpecificationTagPrivate"));
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(tags, $tag, $tag IN %@).@count == 0"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(tags, $tag, $tag IN %@).@count > 0 && SUBQUERY(tags, $tag, $tag IN %@).@count == 0"), v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[IFIconSpecification imageSpecificationsMatchingPredicate:](self, "imageSpecificationsMatchingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)description
{
  return -[NSArray description](self->_imageSpecifications, "description");
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CGSize)minSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_minSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)minScale
{
  return self->_minScale;
}

- (NSArray)variants
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)imageSpecifications
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSpecifications, 0);
  objc_storeStrong((id *)&self->_variants, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)macosIconSpecification
{
  if (macosIconSpecification_onceToken != -1)
    dispatch_once(&macosIconSpecification_onceToken, &__block_literal_global_57);
  return (id)macosIconSpecification_iconSpecification;
}

void __59__IFIconSpecification_Constructors__macosIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  IFImageSpecification *v6;
  IFImageSpecification *v7;
  IFImageSpecification *v8;
  IFImageSpecification *v9;
  IFImageSpecification *v10;
  void *v11;
  IFImageSpecification *v12;
  IFImageSpecification *v13;
  void *v14;
  IFImageSpecification *v15;
  IFImageSpecification *v16;
  void *v17;
  IFImageSpecification *v18;
  IFImageSpecification *v19;
  void *v20;
  IFImageSpecification *v21;
  IFImageSpecification *v22;
  IFImageSpecification *v23;
  IFImageSpecification *v24;
  IFImageSpecification *v25;
  IFImageSpecification *v26;
  void *v27;
  IFImageSpecification *v28;
  IFImageSpecification *v29;
  void *v30;
  IFImageSpecification *v31;
  IFImageSpecification *v32;
  void *v33;
  IFImageSpecification *v34;
  IFImageSpecification *v35;
  void *v36;
  IFImageSpecification *v37;
  void *v38;
  ISVariantIconSpecification *v39;
  id v40;
  IFIconSpecification *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  IFImageSpecification *v45;
  void *v46;
  IFImageSpecification *v47;
  void *v48;
  IFImageSpecification *v49;
  void *v50;
  IFImageSpecification *v51;
  void *v52;
  IFImageSpecification *v53;
  void *v54;
  IFImageSpecification *v55;
  void *v56;
  IFImageSpecification *v57;
  IFImageSpecification *v58;
  void *v59;
  void *v60;
  IFImageSpecification *v61;
  IFImageSpecification *v62;
  void *v63;
  void *v64;
  void *v65;
  IFImageSpecification *v66;
  IFImageSpecification *v67;
  void *v68;
  void *v69;
  IFImageSpecification *v70;
  IFImageSpecification *v71;
  void *v72;
  void *v73;
  id v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  _QWORD v83[8];
  _QWORD v84[2];
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  _QWORD v88[2];
  _QWORD v89[2];
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  _QWORD v95[2];
  _QWORD v96[2];
  const __CFString *v97;
  _QWORD v98[16];

  v98[14] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v97 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v72, 16.0, 16.0, 1.0);
  v98[0] = v70;
  v1 = [IFImageSpecification alloc];
  v96[0] = CFSTR("IFImageSpecificationTagOptional");
  v96[1] = CFSTR("IFImageSpecificationTagInternal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v68, 18.0, 18.0, 1.0);
  v98[1] = v66;
  v2 = [IFImageSpecification alloc];
  v95[0] = CFSTR("IFImageSpecificationTagOptional");
  v95[1] = CFSTR("IFImageSpecificationTagInternal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v63, 24.0, 24.0, 1.0);
  v98[2] = v61;
  v3 = [IFImageSpecification alloc];
  v94 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v59, 32.0, 32.0, 1.0);
  v98[3] = v57;
  v4 = [IFImageSpecification alloc];
  v93 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v56, 128.0, 128.0, 1.0);
  v98[4] = v55;
  v5 = [IFImageSpecification alloc];
  v92 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v54, 256.0, 256.0, 1.0);
  v98[5] = v53;
  v6 = [IFImageSpecification alloc];
  v91 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v52, 512.0, 512.0, 1.0);
  v98[6] = v51;
  v7 = [IFImageSpecification alloc];
  v90 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v50, 16.0, 16.0, 2.0);
  v98[7] = v49;
  v8 = [IFImageSpecification alloc];
  v89[0] = CFSTR("IFImageSpecificationTagOptional");
  v89[1] = CFSTR("IFImageSpecificationTagInternal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v48, 18.0, 18.0, 2.0);
  v98[8] = v47;
  v9 = [IFImageSpecification alloc];
  v88[0] = CFSTR("IFImageSpecificationTagOptional");
  v88[1] = CFSTR("IFImageSpecificationTagInternal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v46, 24.0, 24.0, 2.0);
  v98[9] = v45;
  v10 = [IFImageSpecification alloc];
  v87 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v11, 32.0, 32.0, 2.0);
  v98[10] = v12;
  v13 = [IFImageSpecification alloc];
  v86 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 128.0, 128.0, 2.0);
  v98[11] = v15;
  v16 = [IFImageSpecification alloc];
  v85 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v17, 256.0, 256.0, 2.0);
  v98[12] = v18;
  v19 = [IFImageSpecification alloc];
  v84[0] = CFSTR("IFImageSpecificationTagRequired");
  v84[1] = CFSTR("IFImageSpecificationTagAppStore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 512.0, 512.0, 2.0);
  v98[13] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 14);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [IFImageSpecification alloc];
  v82 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v73, 16.0, 16.0, 1.0);
  v83[0] = v71;
  v23 = [IFImageSpecification alloc];
  v81 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[IFImageSpecification initWithSize:scale:tags:](v23, "initWithSize:scale:tags:", v69, 18.0, 18.0, 1.0);
  v83[1] = v67;
  v24 = [IFImageSpecification alloc];
  v80 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[IFImageSpecification initWithSize:scale:tags:](v24, "initWithSize:scale:tags:", v64, 24.0, 24.0, 1.0);
  v83[2] = v62;
  v25 = [IFImageSpecification alloc];
  v79 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[IFImageSpecification initWithSize:scale:tags:](v25, "initWithSize:scale:tags:", v60, 32.0, 32.0, 1.0);
  v83[3] = v58;
  v26 = [IFImageSpecification alloc];
  v78 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[IFImageSpecification initWithSize:scale:tags:](v26, "initWithSize:scale:tags:", v27, 16.0, 16.0, 2.0);
  v83[4] = v28;
  v29 = [IFImageSpecification alloc];
  v77 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[IFImageSpecification initWithSize:scale:tags:](v29, "initWithSize:scale:tags:", v30, 18.0, 18.0, 2.0);
  v83[5] = v31;
  v32 = [IFImageSpecification alloc];
  v76 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[IFImageSpecification initWithSize:scale:tags:](v32, "initWithSize:scale:tags:", v33, 24.0, 24.0, 2.0);
  v83[6] = v34;
  v35 = [IFImageSpecification alloc];
  v75 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[IFImageSpecification initWithSize:scale:tags:](v35, "initWithSize:scale:tags:", v36, 32.0, 32.0, 2.0);
  v83[7] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = [ISVariantIconSpecification alloc];
  v40 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v39, "_initWithName:imageSpecifiactions:variants:", CFSTR("Template Icon"), v38, MEMORY[0x1E0C9AA60]);

  v41 = [IFIconSpecification alloc];
  v74 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v41, "_initWithName:imageSpecifiactions:variants:", CFSTR("Application Icon"), v65, v42);
  v44 = (void *)macosIconSpecification_iconSpecification;
  macosIconSpecification_iconSpecification = v43;

}

+ (id)macosDocumentIconSpecification
{
  if (macosDocumentIconSpecification_onceToken != -1)
    dispatch_once(&macosDocumentIconSpecification_onceToken, &__block_literal_global_66);
  return (id)macosDocumentIconSpecification_iconSpecification;
}

void __67__IFIconSpecification_Constructors__macosDocumentIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  IFImageSpecification *v6;
  void *v7;
  IFImageSpecification *v8;
  IFImageSpecification *v9;
  void *v10;
  IFImageSpecification *v11;
  IFImageSpecification *v12;
  void *v13;
  IFImageSpecification *v14;
  IFImageSpecification *v15;
  void *v16;
  IFImageSpecification *v17;
  IFImageSpecification *v18;
  IFImageSpecification *v19;
  IFImageSpecification *v20;
  IFImageSpecification *v21;
  IFImageSpecification *v22;
  void *v23;
  IFImageSpecification *v24;
  IFImageSpecification *v25;
  void *v26;
  IFImageSpecification *v27;
  IFImageSpecification *v28;
  void *v29;
  IFImageSpecification *v30;
  IFImageSpecification *v31;
  void *v32;
  IFImageSpecification *v33;
  void *v34;
  ISVariantIconSpecification *v35;
  id v36;
  IFIconSpecification *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  IFImageSpecification *v41;
  void *v42;
  IFImageSpecification *v43;
  void *v44;
  IFImageSpecification *v45;
  IFImageSpecification *v46;
  void *v47;
  void *v48;
  IFImageSpecification *v49;
  IFImageSpecification *v50;
  void *v51;
  void *v52;
  IFImageSpecification *v53;
  IFImageSpecification *v54;
  void *v55;
  void *v56;
  IFImageSpecification *v57;
  IFImageSpecification *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  _QWORD v71[8];
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  _QWORD v82[12];

  v82[10] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v81 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v59, 16.0, 16.0, 1.0);
  v82[0] = v57;
  v1 = [IFImageSpecification alloc];
  v80 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v55, 32.0, 32.0, 1.0);
  v82[1] = v53;
  v2 = [IFImageSpecification alloc];
  v79 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v51, 128.0, 128.0, 1.0);
  v82[2] = v49;
  v3 = [IFImageSpecification alloc];
  v78 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v47, 256.0, 256.0, 1.0);
  v82[3] = v45;
  v4 = [IFImageSpecification alloc];
  v77 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v44, 512.0, 512.0, 1.0);
  v82[4] = v43;
  v5 = [IFImageSpecification alloc];
  v76 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v42, 16.0, 16.0, 2.0);
  v82[5] = v41;
  v6 = [IFImageSpecification alloc];
  v75 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v7, 32.0, 32.0, 2.0);
  v82[6] = v8;
  v9 = [IFImageSpecification alloc];
  v74 = CFSTR("IFImageSpecificationTagRecomended");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v10, 128.0, 128.0, 2.0);
  v82[7] = v11;
  v12 = [IFImageSpecification alloc];
  v73 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v13, 256.0, 256.0, 2.0);
  v82[8] = v14;
  v15 = [IFImageSpecification alloc];
  v72 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[IFImageSpecification initWithSize:scale:tags:](v15, "initWithSize:scale:tags:", v16, 512.0, 512.0, 2.0);
  v82[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 10);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [IFImageSpecification alloc];
  v70 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[IFImageSpecification initWithSize:scale:tags:](v18, "initWithSize:scale:tags:", v60, 16.0, 16.0, 1.0);
  v71[0] = v58;
  v19 = [IFImageSpecification alloc];
  v69 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v56, 18.0, 18.0, 1.0);
  v71[1] = v54;
  v20 = [IFImageSpecification alloc];
  v68 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[IFImageSpecification initWithSize:scale:tags:](v20, "initWithSize:scale:tags:", v52, 24.0, 24.0, 1.0);
  v71[2] = v50;
  v21 = [IFImageSpecification alloc];
  v67 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[IFImageSpecification initWithSize:scale:tags:](v21, "initWithSize:scale:tags:", v48, 32.0, 32.0, 1.0);
  v71[3] = v46;
  v22 = [IFImageSpecification alloc];
  v66 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v23, 16.0, 16.0, 2.0);
  v71[4] = v24;
  v25 = [IFImageSpecification alloc];
  v65 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[IFImageSpecification initWithSize:scale:tags:](v25, "initWithSize:scale:tags:", v26, 18.0, 18.0, 2.0);
  v71[5] = v27;
  v28 = [IFImageSpecification alloc];
  v64 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[IFImageSpecification initWithSize:scale:tags:](v28, "initWithSize:scale:tags:", v29, 24.0, 24.0, 2.0);
  v71[6] = v30;
  v31 = [IFImageSpecification alloc];
  v63 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[IFImageSpecification initWithSize:scale:tags:](v31, "initWithSize:scale:tags:", v32, 32.0, 32.0, 2.0);
  v71[7] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = [ISVariantIconSpecification alloc];
  v36 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v35, "_initWithName:imageSpecifiactions:variants:", CFSTR("Template Icon"), v34, MEMORY[0x1E0C9AA60]);

  v37 = [IFIconSpecification alloc];
  v62 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v37, "_initWithName:imageSpecifiactions:variants:", CFSTR("Document Icon"), v61, v38);
  v40 = (void *)macosDocumentIconSpecification_iconSpecification;
  macosDocumentIconSpecification_iconSpecification = v39;

}

+ (id)macosTemplateIconSpecification
{
  if (macosTemplateIconSpecification_onceToken != -1)
    dispatch_once(&macosTemplateIconSpecification_onceToken, &__block_literal_global_69);
  return (id)macosTemplateIconSpecification_iconSpecification;
}

void __67__IFIconSpecification_Constructors__macosTemplateIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  void *v5;
  IFImageSpecification *v6;
  IFImageSpecification *v7;
  void *v8;
  IFImageSpecification *v9;
  IFImageSpecification *v10;
  void *v11;
  IFImageSpecification *v12;
  IFImageSpecification *v13;
  void *v14;
  IFImageSpecification *v15;
  void *v16;
  IFIconSpecification *v17;
  uint64_t v18;
  void *v19;
  IFImageSpecification *v20;
  void *v21;
  IFImageSpecification *v22;
  void *v23;
  IFImageSpecification *v24;
  void *v25;
  IFImageSpecification *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[10];

  v36[8] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v35 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v27, 16.0, 16.0, 1.0);
  v36[0] = v26;
  v1 = [IFImageSpecification alloc];
  v34 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v25, 18.0, 18.0, 1.0);
  v36[1] = v24;
  v2 = [IFImageSpecification alloc];
  v33 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v23, 24.0, 24.0, 1.0);
  v36[2] = v22;
  v3 = [IFImageSpecification alloc];
  v32 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v21, 32.0, 32.0, 1.0);
  v36[3] = v20;
  v4 = [IFImageSpecification alloc];
  v31 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v5, 16.0, 16.0, 2.0);
  v36[4] = v6;
  v7 = [IFImageSpecification alloc];
  v30 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v8, 18.0, 18.0, 2.0);
  v36[5] = v9;
  v10 = [IFImageSpecification alloc];
  v29 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v11, 24.0, 24.0, 2.0);
  v36[6] = v12;
  v13 = [IFImageSpecification alloc];
  v28 = CFSTR("IFImageSpecificationTagOptional");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 32.0, 32.0, 2.0);
  v36[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [IFIconSpecification alloc];
  v18 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v17, "_initWithName:imageSpecifiactions:variants:", CFSTR("Template Icon"), v16, MEMORY[0x1E0C9AA60]);
  v19 = (void *)macosTemplateIconSpecification_iconSpecification;
  macosTemplateIconSpecification_iconSpecification = v18;

}

+ (id)iosDocumentGlyphSpecification
{
  if (iosDocumentGlyphSpecification_onceToken != -1)
    dispatch_once(&iosDocumentGlyphSpecification_onceToken, &__block_literal_global_71);
  return (id)iosDocumentGlyphSpecification_iconSpecification;
}

void __66__IFIconSpecification_Constructors__iosDocumentGlyphSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  void *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  void *v6;
  IFImageSpecification *v7;
  IFImageSpecification *v8;
  void *v9;
  IFImageSpecification *v10;
  IFImageSpecification *v11;
  void *v12;
  IFImageSpecification *v13;
  void *v14;
  IFIconSpecification *v15;
  uint64_t v16;
  void *v17;
  IFImageSpecification *v18;
  void *v19;
  IFImageSpecification *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[8];

  v28[6] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v27 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v21, 20.0, 20.0, 1.0);
  v28[0] = v20;
  v1 = [IFImageSpecification alloc];
  v26 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v19, 144.0, 144.0, 1.0);
  v28[1] = v18;
  v2 = [IFImageSpecification alloc];
  v25 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v3, 20.0, 20.0, 2.0);
  v28[2] = v4;
  v5 = [IFImageSpecification alloc];
  v24 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v6, 144.0, 144.0, 2.0);
  v28[3] = v7;
  v8 = [IFImageSpecification alloc];
  v23 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v9, 20.0, 20.0, 3.0);
  v28[4] = v10;
  v11 = [IFImageSpecification alloc];
  v22 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v12, 144.0, 144.0, 3.0);
  v28[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [IFIconSpecification alloc];
  v16 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v15, "_initWithName:imageSpecifiactions:variants:", CFSTR("Document Glyph"), v14, MEMORY[0x1E0C9AA60]);
  v17 = (void *)iosDocumentGlyphSpecification_iconSpecification;
  iosDocumentGlyphSpecification_iconSpecification = v16;

}

+ (id)iosDocumentIconSpecification
{
  if (iosDocumentIconSpecification_onceToken != -1)
    dispatch_once(&iosDocumentIconSpecification_onceToken, &__block_literal_global_74);
  return (id)iosDocumentIconSpecification_iconSpecification;
}

void __65__IFIconSpecification_Constructors__iosDocumentIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  IFImageSpecification *v6;
  IFImageSpecification *v7;
  IFImageSpecification *v8;
  IFImageSpecification *v9;
  IFImageSpecification *v10;
  IFImageSpecification *v11;
  IFImageSpecification *v12;
  IFImageSpecification *v13;
  void *v14;
  IFImageSpecification *v15;
  IFImageSpecification *v16;
  void *v17;
  IFImageSpecification *v18;
  IFImageSpecification *v19;
  void *v20;
  IFImageSpecification *v21;
  void *v22;
  IFIconSpecification *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  IFImageSpecification *v27;
  void *v28;
  IFImageSpecification *v29;
  void *v30;
  IFImageSpecification *v31;
  void *v32;
  IFImageSpecification *v33;
  void *v34;
  IFImageSpecification *v35;
  void *v36;
  IFImageSpecification *v37;
  void *v38;
  IFImageSpecification *v39;
  void *v40;
  IFImageSpecification *v41;
  void *v42;
  IFImageSpecification *v43;
  void *v44;
  IFImageSpecification *v45;
  void *v46;
  IFImageSpecification *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[17];

  v64[15] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v63[0] = CFSTR("IFImageSpecificationTagRequired");
  v63[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v48, 34.0);
  v64[0] = v47;
  v1 = [IFImageSpecification alloc];
  v62[0] = CFSTR("IFImageSpecificationTagRequired");
  v62[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v46, 37.0);
  v64[1] = v45;
  v2 = [IFImageSpecification alloc];
  v61[0] = CFSTR("IFImageSpecificationTagRequired");
  v61[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v44, 64.0, 84.0, 1.0);
  v64[2] = v43;
  v3 = [IFImageSpecification alloc];
  v60[0] = CFSTR("IFImageSpecificationTagRequired");
  v60[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v42, 96.0, 128.0, 1.0);
  v64[3] = v41;
  v4 = [IFImageSpecification alloc];
  v59[0] = CFSTR("IFImageSpecificationTagRequired");
  v59[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v40, 240.0, 320.0, 1.0);
  v64[4] = v39;
  v5 = [IFImageSpecification alloc];
  v58[0] = CFSTR("IFImageSpecificationTagRequired");
  v58[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v38, 34.0, 44.0, 2.0);
  v64[5] = v37;
  v6 = [IFImageSpecification alloc];
  v57[0] = CFSTR("IFImageSpecificationTagRequired");
  v57[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v36, 37.0, 48.0, 2.0);
  v64[6] = v35;
  v7 = [IFImageSpecification alloc];
  v56[0] = CFSTR("IFImageSpecificationTagRequired");
  v56[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v34, 64.0, 84.0, 2.0);
  v64[7] = v33;
  v8 = [IFImageSpecification alloc];
  v55[0] = CFSTR("IFImageSpecificationTagRequired");
  v55[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v32, 96.0, 128.0, 2.0);
  v64[8] = v31;
  v9 = [IFImageSpecification alloc];
  v54[0] = CFSTR("IFImageSpecificationTagRequired");
  v54[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v30, 240.0, 320.0, 2.0);
  v64[9] = v29;
  v10 = [IFImageSpecification alloc];
  v53[0] = CFSTR("IFImageSpecificationTagRequired");
  v53[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v28, 34.0, 44.0, 3.0);
  v64[10] = v27;
  v11 = [IFImageSpecification alloc];
  v52[0] = CFSTR("IFImageSpecificationTagRequired");
  v52[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v26, 37.0, 48.0, 3.0);
  v64[11] = v12;
  v13 = [IFImageSpecification alloc];
  v51[0] = CFSTR("IFImageSpecificationTagRequired");
  v51[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 64.0, 84.0, 3.0);
  v64[12] = v15;
  v16 = [IFImageSpecification alloc];
  v50[0] = CFSTR("IFImageSpecificationTagRequired");
  v50[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v17, 96.0, 128.0, 3.0);
  v64[13] = v18;
  v19 = [IFImageSpecification alloc];
  v49[0] = CFSTR("IFImageSpecificationTagRequired");
  v49[1] = CFSTR("IFImageSpecificationTagPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 240.0, 320.0, 3.0);
  v64[14] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [IFIconSpecification alloc];
  v24 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v23, "_initWithName:imageSpecifiactions:variants:", CFSTR("Document Icon"), v22, MEMORY[0x1E0C9AA60]);
  v25 = (void *)iosDocumentIconSpecification_iconSpecification;
  iosDocumentIconSpecification_iconSpecification = v24;

}

+ (id)iosMessagesAppIconSpecification
{
  if (iosMessagesAppIconSpecification_onceToken != -1)
    dispatch_once(&iosMessagesAppIconSpecification_onceToken, &__block_literal_global_75);
  return (id)iosMessagesAppIconSpecification_iconSpecification;
}

void __68__IFIconSpecification_Constructors__iosMessagesAppIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  IFImageSpecification *v6;
  void *v7;
  IFImageSpecification *v8;
  IFImageSpecification *v9;
  void *v10;
  IFImageSpecification *v11;
  IFImageSpecification *v12;
  void *v13;
  IFImageSpecification *v14;
  IFImageSpecification *v15;
  void *v16;
  IFImageSpecification *v17;
  void *v18;
  IFIconSpecification *v19;
  uint64_t v20;
  void *v21;
  IFImageSpecification *v22;
  void *v23;
  IFImageSpecification *v24;
  void *v25;
  IFImageSpecification *v26;
  void *v27;
  IFImageSpecification *v28;
  void *v29;
  IFImageSpecification *v30;
  void *v31;
  IFImageSpecification *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  _QWORD v44[12];

  v44[10] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v43 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v33, 27.0, 20.0, 2.0);
  v44[0] = v32;
  v1 = [IFImageSpecification alloc];
  v42 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v31, 32.0, 24.0, 2.0);
  v44[1] = v30;
  v2 = [IFImageSpecification alloc];
  v41 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v29, 60.0, 45.0, 2.0);
  v44[2] = v28;
  v3 = [IFImageSpecification alloc];
  v40 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v27, 67.0, 50.0, 2.0);
  v44[3] = v26;
  v4 = [IFImageSpecification alloc];
  v39 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v25, 74.0, 55.0, 2.0);
  v44[4] = v24;
  v5 = [IFImageSpecification alloc];
  v38 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v23, 27.0, 20.0, 3.0);
  v44[5] = v22;
  v6 = [IFImageSpecification alloc];
  v37 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v7, 32.0, 24.0, 3.0);
  v44[6] = v8;
  v9 = [IFImageSpecification alloc];
  v36 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v10, 60.0, 45.0, 3.0);
  v44[7] = v11;
  v12 = [IFImageSpecification alloc];
  v35 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v13, 67.0, 50.0, 3.0);
  v44[8] = v14;
  v15 = [IFImageSpecification alloc];
  v34 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[IFImageSpecification initWithSize:scale:tags:](v15, "initWithSize:scale:tags:", v16, 74.0, 55.0, 3.0);
  v44[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [IFIconSpecification alloc];
  v20 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v19, "_initWithName:imageSpecifiactions:variants:", CFSTR("Messages Application Icon"), v18, MEMORY[0x1E0C9AA60]);
  v21 = (void *)iosMessagesAppIconSpecification_iconSpecification;
  iosMessagesAppIconSpecification_iconSpecification = v20;

}

+ (id)watchAppIconSpecification
{
  if (watchAppIconSpecification_onceToken != -1)
    dispatch_once(&watchAppIconSpecification_onceToken, &__block_literal_global_78);
  return (id)watchAppIconSpecification_iconSpecification;
}

void __62__IFIconSpecification_Constructors__watchAppIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  IFImageSpecification *v6;
  IFImageSpecification *v7;
  IFImageSpecification *v8;
  IFImageSpecification *v9;
  IFImageSpecification *v10;
  IFImageSpecification *v11;
  IFImageSpecification *v12;
  IFImageSpecification *v13;
  void *v14;
  IFImageSpecification *v15;
  IFImageSpecification *v16;
  void *v17;
  IFImageSpecification *v18;
  IFImageSpecification *v19;
  void *v20;
  IFImageSpecification *v21;
  IFImageSpecification *v22;
  void *v23;
  IFImageSpecification *v24;
  void *v25;
  IFIconSpecification *v26;
  uint64_t v27;
  void *v28;
  IFImageSpecification *v29;
  void *v30;
  IFImageSpecification *v31;
  void *v32;
  IFImageSpecification *v33;
  void *v34;
  IFImageSpecification *v35;
  void *v36;
  IFImageSpecification *v37;
  void *v38;
  IFImageSpecification *v39;
  void *v40;
  IFImageSpecification *v41;
  void *v42;
  IFImageSpecification *v43;
  void *v44;
  IFImageSpecification *v45;
  void *v46;
  IFImageSpecification *v47;
  void *v48;
  IFImageSpecification *v49;
  void *v50;
  IFImageSpecification *v51;
  void *v52;
  IFImageSpecification *v53;
  void *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  _QWORD v71[2];
  _QWORD v72[19];

  v72[17] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v71[0] = CFSTR("IFImageSpecificationTagAppStore");
  v71[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v54, 1024.0, 1024.0, 1.0);
  v72[0] = v53;
  v1 = [IFImageSpecification alloc];
  v70 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v52, 24.0, 24.0, 2.0);
  v72[1] = v51;
  v2 = [IFImageSpecification alloc];
  v69 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v50, 27.5, 27.5, 2.0);
  v72[2] = v49;
  v3 = [IFImageSpecification alloc];
  v68 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v48, 29.0, 29.0, 2.0);
  v72[3] = v47;
  v4 = [IFImageSpecification alloc];
  v67 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v46, 33.0, 33.0, 2.0);
  v72[4] = v45;
  v5 = [IFImageSpecification alloc];
  v66[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v66[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v44, 40.0, 40.0, 2.0);
  v72[5] = v43;
  v6 = [IFImageSpecification alloc];
  v65[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v65[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v42, 44.0, 44.0, 2.0);
  v72[6] = v41;
  v7 = [IFImageSpecification alloc];
  v64[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v64[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v40, 46.0, 46.0, 2.0);
  v72[7] = v39;
  v8 = [IFImageSpecification alloc];
  v63[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v63[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v38, 50.0, 50.0, 2.0);
  v72[8] = v37;
  v9 = [IFImageSpecification alloc];
  v62[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v62[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v36, 51.0, 51.0, 2.0);
  v72[9] = v35;
  v10 = [IFImageSpecification alloc];
  v61[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v61[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v34, 54.0, 54.0, 2.0);
  v72[10] = v33;
  v11 = [IFImageSpecification alloc];
  v60 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v32, 86.0, 86.0, 2.0);
  v72[11] = v31;
  v12 = [IFImageSpecification alloc];
  v59 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v30, 98.0, 98.0, 2.0);
  v72[12] = v29;
  v13 = [IFImageSpecification alloc];
  v58 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 108.0, 108.0, 2.0);
  v72[13] = v15;
  v16 = [IFImageSpecification alloc];
  v57 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v17, 117.0, 117.0, 2.0);
  v72[14] = v18;
  v19 = [IFImageSpecification alloc];
  v56 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 129.0, 129.0, 2.0);
  v72[15] = v21;
  v22 = [IFImageSpecification alloc];
  v55 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v23, 29.0, 29.0, 3.0);
  v72[16] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = [IFIconSpecification alloc];
  v27 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v26, "_initWithName:imageSpecifiactions:variants:", CFSTR("Application Icon"), v25, MEMORY[0x1E0C9AA60]);
  v28 = (void *)watchAppIconSpecification_iconSpecification;
  watchAppIconSpecification_iconSpecification = v27;

}

+ (id)tvAppIconSpecification
{
  if (tvAppIconSpecification_onceToken != -1)
    dispatch_once(&tvAppIconSpecification_onceToken, &__block_literal_global_79);
  return (id)tvAppIconSpecification_iconSpecification;
}

void __59__IFIconSpecification_Constructors__tvAppIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  void *v6;
  IFImageSpecification *v7;
  IFImageSpecification *v8;
  void *v9;
  IFImageSpecification *v10;
  IFImageSpecification *v11;
  void *v12;
  IFImageSpecification *v13;
  void *v14;
  IFIconSpecification *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  IFImageSpecification *v19;
  void *v20;
  IFImageSpecification *v21;
  void *v22;
  IFImageSpecification *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[9];

  v32[7] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v31[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v31[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v24, 250.0, 150.0, 1.0);
  v32[0] = v23;
  v1 = [IFImageSpecification alloc];
  v30[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v30[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v22, 300.0, 180.0, 1.0);
  v32[1] = v21;
  v2 = [IFImageSpecification alloc];
  v29[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v29[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v20, 400.0, 240.0, 1.0);
  v32[2] = v19;
  v3 = [IFImageSpecification alloc];
  v28[0] = CFSTR("IFImageSpecificationTagAppStore");
  v28[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v18, 1280.0, 768.0, 1.0);
  v32[3] = v4;
  v5 = [IFImageSpecification alloc];
  v27[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v27[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v6, 250.0, 150.0, 2.0);
  v32[4] = v7;
  v8 = [IFImageSpecification alloc];
  v26[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v26[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v9, 300.0, 180.0, 2.0);
  v32[5] = v10;
  v11 = [IFImageSpecification alloc];
  v25[0] = CFSTR("IFImageSpecificationTagHomeScreen");
  v25[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v12, 400.0, 240.0, 2.0);
  v32[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [IFIconSpecification alloc];
  v16 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v15, "_initWithName:imageSpecifiactions:variants:", CFSTR("Application Icon"), v14, MEMORY[0x1E0C9AA60]);
  v17 = (void *)tvAppIconSpecification_iconSpecification;
  tvAppIconSpecification_iconSpecification = v16;

}

+ (id)rOSAppIconSpecification
{
  if (rOSAppIconSpecification_onceToken != -1)
    dispatch_once(&rOSAppIconSpecification_onceToken, &__block_literal_global_80);
  return (id)rOSAppIconSpecification_iconSpecification;
}

void __60__IFIconSpecification_Constructors__rOSAppIconSpecification__block_invoke()
{
  IFImageSpecification *v0;
  IFImageSpecification *v1;
  IFImageSpecification *v2;
  IFImageSpecification *v3;
  IFImageSpecification *v4;
  IFImageSpecification *v5;
  IFImageSpecification *v6;
  IFImageSpecification *v7;
  IFImageSpecification *v8;
  IFImageSpecification *v9;
  IFImageSpecification *v10;
  IFImageSpecification *v11;
  void *v12;
  IFImageSpecification *v13;
  IFImageSpecification *v14;
  void *v15;
  IFImageSpecification *v16;
  IFImageSpecification *v17;
  void *v18;
  IFImageSpecification *v19;
  IFImageSpecification *v20;
  void *v21;
  IFImageSpecification *v22;
  void *v23;
  IFIconSpecification *v24;
  uint64_t v25;
  void *v26;
  IFImageSpecification *v27;
  void *v28;
  IFImageSpecification *v29;
  void *v30;
  IFImageSpecification *v31;
  void *v32;
  IFImageSpecification *v33;
  void *v34;
  IFImageSpecification *v35;
  void *v36;
  IFImageSpecification *v37;
  void *v38;
  IFImageSpecification *v39;
  void *v40;
  IFImageSpecification *v41;
  void *v42;
  IFImageSpecification *v43;
  void *v44;
  IFImageSpecification *v45;
  void *v46;
  IFImageSpecification *v47;
  void *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  _QWORD v63[2];
  _QWORD v64[17];

  v64[15] = *MEMORY[0x1E0C80C00];
  v0 = [IFImageSpecification alloc];
  v63[0] = CFSTR("IFImageSpecificationTagAppStore");
  v63[1] = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v48, 1024.0, 1024.0, 1.0);
  v64[0] = v47;
  v1 = [IFImageSpecification alloc];
  v62 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v46, 32.0, 32.0, 2.0);
  v64[1] = v45;
  v2 = [IFImageSpecification alloc];
  v61 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v44, 44.0, 44.0, 2.0);
  v64[2] = v43;
  v3 = [IFImageSpecification alloc];
  v60 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v42, 52.0, 52.0, 2.0);
  v64[3] = v41;
  v4 = [IFImageSpecification alloc];
  v59 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v40, 88.0, 88.0, 2.0);
  v64[4] = v39;
  v5 = [IFImageSpecification alloc];
  v58 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v38, 128.0, 128.0, 2.0);
  v64[5] = v37;
  v6 = [IFImageSpecification alloc];
  v57 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v36, 512.0, 512.0, 2.0);
  v64[6] = v35;
  v7 = [IFImageSpecification alloc];
  v56 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v34, 32.0, 32.0, 3.0);
  v64[7] = v33;
  v8 = [IFImageSpecification alloc];
  v55 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v32, 44.0, 44.0, 3.0);
  v64[8] = v31;
  v9 = [IFImageSpecification alloc];
  v54 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v30, 20.0, 20.0, 2.0);
  v64[9] = v29;
  v10 = [IFImageSpecification alloc];
  v53 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v28, 24.0, 24.0, 2.0);
  v64[10] = v27;
  v11 = [IFImageSpecification alloc];
  v52 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v12, 40.0, 40.0, 2.0);
  v64[11] = v13;
  v14 = [IFImageSpecification alloc];
  v51 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IFImageSpecification initWithSize:scale:tags:](v14, "initWithSize:scale:tags:", v15, 64.0, 64.0, 2.0);
  v64[12] = v16;
  v17 = [IFImageSpecification alloc];
  v50 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[IFImageSpecification initWithSize:scale:tags:](v17, "initWithSize:scale:tags:", v18, 96.0, 96.0, 2.0);
  v64[13] = v19;
  v20 = [IFImageSpecification alloc];
  v49 = CFSTR("IFImageSpecificationTagRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[IFImageSpecification initWithSize:scale:tags:](v20, "initWithSize:scale:tags:", v21, 24.0, 24.0, 3.0);
  v64[14] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [IFIconSpecification alloc];
  v25 = -[IFIconSpecification _initWithName:imageSpecifiactions:variants:](v24, "_initWithName:imageSpecifiactions:variants:", CFSTR("Application Icon"), v23, MEMORY[0x1E0C9AA60]);
  v26 = (void *)rOSAppIconSpecification_iconSpecification;
  rOSAppIconSpecification_iconSpecification = v25;

}

@end
