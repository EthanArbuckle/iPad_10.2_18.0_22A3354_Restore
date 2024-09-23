@implementation ASDPurchaseHistoryApp

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDPurchaseHistoryApp title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDPurchaseHistoryApp bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> '%@' %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  int v27;
  int v28;
  int64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  char v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  int v41;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  void *v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  int64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  int v67;
  int64_t v68;
  int v69;
  int v70;
  int v71;
  int v72;
  uint64_t v73;
  void *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  _BOOL4 v83;
  uint64_t v84;
  _BOOL4 v85;
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
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  _BYTE v141[44];
  _QWORD v142[4];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v17) = 0;
    goto LABEL_79;
  }
  v5 = v4;
  -[ASDPurchaseHistoryApp bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7
    || (-[ASDPurchaseHistoryApp bundleID](self, "bundleID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "bundleID"),
        v139 = (void *)objc_claimAutoreleasedReturnValue(),
        v140 = v8,
        objc_msgSend(v8, "isEqual:", v139)))
  {
    -[ASDPurchaseHistoryApp circularIconURLString](self, "circularIconURLString");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "circularIconURLString");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (void *)v18;
    v19 = v18 != (_QWORD)v137;
    if ((void *)v18 != v137)
    {
      -[ASDPurchaseHistoryApp circularIconURLString](self, "circularIconURLString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "circularIconURLString");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = v20;
      if (!objc_msgSend(v20, "isEqual:", v133))
      {
        *(_QWORD *)&v141[32] = 0;
        memset(v141, 0, 24);
        v10 = 0;
        v11 = 0;
        memset(v142, 0, sizeof(v142));
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[28] = 0;
        *(_DWORD *)&v141[40] = 1;
        goto LABEL_24;
      }
    }
    v21 = -[ASDPurchaseHistoryApp contentRatingFlags](self, "contentRatingFlags");
    *(_DWORD *)&v141[40] = v19;
    if (v21 != objc_msgSend(v5, "contentRatingFlags"))
    {
      memset(v141, 0, 24);
      v10 = 0;
      v11 = 0;
      memset(v142, 0, sizeof(v142));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LOBYTE(v17) = 0;
      *(_OWORD *)&v141[24] = 1uLL;
      goto LABEL_24;
    }
    -[ASDPurchaseHistoryApp datePurchased](self, "datePurchased");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "datePurchased");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = (void *)v22;
    if ((void *)v22 != v131)
    {
      -[ASDPurchaseHistoryApp datePurchased](self, "datePurchased");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "datePurchased");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v23;
      if (!objc_msgSend(v23, "isEqual:", v127))
      {
        *(_QWORD *)&v141[28] = 0;
        memset(v141, 0, 20);
        v10 = 0;
        v11 = 0;
        memset(v142, 0, sizeof(v142));
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[36] = 1;
        goto LABEL_24;
      }
    }
    -[ASDPurchaseHistoryApp developerName](self, "developerName");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "developerName");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = (void *)v24;
    v25 = v24 != (_QWORD)v129;
    *(_DWORD *)&v141[36] = v22 != (_QWORD)v131;
    if ((void *)v24 != v129)
    {
      -[ASDPurchaseHistoryApp developerName](self, "developerName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "developerName");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = v26;
      if (!objc_msgSend(v26, "isEqual:", v125))
      {
        *(_QWORD *)&v141[8] = 0;
        *(_QWORD *)v141 = 0;
        v10 = 0;
        v11 = 0;
        memset(v142, 0, sizeof(v142));
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[28] = 0;
        *(_QWORD *)&v141[16] = 0x100000001;
        *(_DWORD *)&v141[32] = 1;
        goto LABEL_24;
      }
    }
    v27 = -[ASDPurchaseHistoryApp isFamilyShared](self, "isFamilyShared");
    *(_DWORD *)&v141[32] = v25;
    if (v27 != objc_msgSend(v5, "isFamilyShared")
      || (v28 = -[ASDPurchaseHistoryApp isFirstParty](self, "isFirstParty"),
          v28 != objc_msgSend(v5, "isFirstParty"))
      || (v29 = -[ASDPurchaseHistoryApp genreID](self, "genreID"), v29 != objc_msgSend(v5, "genreID")))
    {
      *(_QWORD *)&v141[8] = 0;
      *(_QWORD *)v141 = 0;
      v10 = 0;
      v11 = 0;
      memset(v142, 0, sizeof(v142));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[28] = 0;
      *(_QWORD *)&v141[16] = 0x100000001;
      goto LABEL_24;
    }
    -[ASDPurchaseHistoryApp genreName](self, "genreName");
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genreName");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = (void *)v30;
    v31 = v30 != (_QWORD)v123;
    if ((void *)v30 != v123)
    {
      -[ASDPurchaseHistoryApp genreName](self, "genreName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "genreName");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v32;
      if (!objc_msgSend(v32, "isEqual:", v121))
      {
        *(_QWORD *)v141 = 0;
        v10 = 0;
        v11 = 0;
        memset(v142, 0, sizeof(v142));
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_QWORD *)&v141[16] = 0x100000001;
        *(_QWORD *)&v141[8] = 0x100000000;
        *(_DWORD *)&v141[28] = 1;
        goto LABEL_24;
      }
    }
    v43 = -[ASDPurchaseHistoryApp hasMessagesExtension](self, "hasMessagesExtension");
    *(_DWORD *)&v141[28] = v31;
    if (v43 != objc_msgSend(v5, "hasMessagesExtension")
      || (v44 = -[ASDPurchaseHistoryApp isHidden](self, "isHidden"), v44 != objc_msgSend(v5, "isHidden"))
      || (v45 = -[ASDPurchaseHistoryApp isHiddenFromSpringboard](self, "isHiddenFromSpringboard"),
          v45 != objc_msgSend(v5, "isHiddenFromSpringboard")))
    {
      *(_QWORD *)v141 = 0;
      v10 = 0;
      v11 = 0;
      memset(v142, 0, sizeof(v142));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(_QWORD *)&v141[16] = 0x100000001;
      *(_QWORD *)&v141[8] = 0x100000000;
      goto LABEL_24;
    }
    -[ASDPurchaseHistoryApp iconURLString](self, "iconURLString");
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconURLString");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = (void *)v46;
    HIDWORD(v142[3]) = v46 != (_QWORD)v119;
    if ((void *)v46 != v119)
    {
      -[ASDPurchaseHistoryApp iconURLString](self, "iconURLString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "iconURLString");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v47;
      if (!objc_msgSend(v47, "isEqual:", v117))
      {
        *(_QWORD *)&v141[4] = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        memset(v142, 0, 28);
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_QWORD *)&v141[16] = 0x100000001;
        *(_DWORD *)v141 = 1;
        HIDWORD(v142[3]) = 1;
        goto LABEL_24;
      }
    }
    v48 = -[ASDPurchaseHistoryApp isArcade](self, "isArcade");
    if (v48 != objc_msgSend(v5, "isArcade")
      || (v49 = -[ASDPurchaseHistoryApp is32BitOnly](self, "is32BitOnly"),
          v49 != objc_msgSend(v5, "is32BitOnly"))
      || (v50 = -[ASDPurchaseHistoryApp isPreorder](self, "isPreorder"),
          v50 != objc_msgSend(v5, "isPreorder")))
    {
      *(_QWORD *)&v141[4] = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v142, 0, 28);
      v15 = 0;
      v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_QWORD *)&v141[16] = 0x100000001;
      *(_DWORD *)v141 = 1;
      goto LABEL_24;
    }
    -[ASDPurchaseHistoryApp longTitle](self, "longTitle");
    v51 = objc_claimAutoreleasedReturnValue();
    v136 = v5;
    objc_msgSend(v5, "longTitle");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (void *)v51;
    LODWORD(v142[3]) = v51 != (_QWORD)v115;
    if ((void *)v51 != v115)
    {
      -[ASDPurchaseHistoryApp longTitle](self, "longTitle");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "longTitle");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v52;
      if (!objc_msgSend(v52, "isEqual:", v113))
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        memset(v142, 0, 24);
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_QWORD *)&v141[16] = 0x100000001;
        *(_QWORD *)v141 = 1;
        *(_QWORD *)&v141[8] = 0x100000001;
        LODWORD(v142[3]) = 1;
LABEL_99:
        v5 = v136;
        goto LABEL_24;
      }
    }
    v53 = -[ASDPurchaseHistoryApp mediaKind](self, "mediaKind");
    if (v53 != objc_msgSend(v136, "mediaKind"))
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      memset(v142, 0, 24);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[24] = 1;
      *(_QWORD *)&v141[16] = 0x100000001;
      *(_QWORD *)v141 = 1;
      *(_QWORD *)&v141[8] = 0x100000001;
      goto LABEL_99;
    }
    -[ASDPurchaseHistoryApp ovalIconURLString](self, "ovalIconURLString");
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "ovalIconURLString");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (void *)v54;
    HIDWORD(v142[2]) = v54 != (_QWORD)v111;
    if ((void *)v54 != v111)
    {
      -[ASDPurchaseHistoryApp ovalIconURLString](self, "ovalIconURLString");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "ovalIconURLString");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v55;
      if (!objc_msgSend(v55, "isEqual:", v107))
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        memset(v142, 0, 20);
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_QWORD *)&v141[16] = 0x100000001;
        *(_QWORD *)v141 = 0x100000001;
        *(_QWORD *)&v141[8] = 0x100000001;
        HIDWORD(v142[2]) = 1;
        goto LABEL_99;
      }
    }
    -[ASDPurchaseHistoryApp preflightPackageURL](self, "preflightPackageURL");
    v56 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "preflightPackageURL");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = (void *)v56;
    LODWORD(v142[2]) = v56 != (_QWORD)v109;
    if ((void *)v56 != v109)
    {
      -[ASDPurchaseHistoryApp preflightPackageURL](self, "preflightPackageURL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "preflightPackageURL");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v57;
      if (!objc_msgSend(v57, "isEqual:", v103))
      {
        v11 = 0;
        v142[0] = 0;
        v142[1] = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        v10 = 1;
        LODWORD(v142[2]) = 1;
        goto LABEL_99;
      }
    }
    -[ASDPurchaseHistoryApp productURL](self, "productURL");
    v58 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "productURL");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = (void *)v58;
    HIDWORD(v142[1]) = v58 != (_QWORD)v105;
    if ((void *)v58 != v105)
    {
      -[ASDPurchaseHistoryApp productURL](self, "productURL");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "productURL");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v59;
      if (!objc_msgSend(v59, "isEqual:", v101))
      {
        v12 = 0;
        *(_QWORD *)((char *)v142 + 4) = 0;
        v13 = 0;
        v14 = 0;
        LODWORD(v142[0]) = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        v10 = 1;
        v11 = 1;
        HIDWORD(v142[1]) = 1;
        goto LABEL_99;
      }
    }
    v60 = -[ASDPurchaseHistoryApp purchaserDSID](self, "purchaserDSID");
    if (v60 != objc_msgSend(v136, "purchaserDSID"))
    {
      v12 = 0;
      *(_QWORD *)((char *)v142 + 4) = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v142[0]) = 0;
      v15 = 0;
      v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      v10 = 1;
      v11 = 1;
      goto LABEL_99;
    }
    -[ASDPurchaseHistoryApp redownloadParams](self, "redownloadParams");
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "redownloadParams");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)v61;
    LODWORD(v142[1]) = v61 != (_QWORD)v99;
    if ((void *)v61 != v99)
    {
      -[ASDPurchaseHistoryApp redownloadParams](self, "redownloadParams");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "redownloadParams");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v62;
      if (!objc_msgSend(v62, "isEqual:", v95))
      {
        v13 = 0;
        v142[0] = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        v10 = 1;
        v11 = 1;
        v12 = 1;
        LODWORD(v142[1]) = 1;
        goto LABEL_99;
      }
    }
    -[ASDPurchaseHistoryApp requiredCapabilities](self, "requiredCapabilities");
    v63 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "requiredCapabilities");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)v63;
    HIDWORD(v142[0]) = v63 != (_QWORD)v97;
    if ((void *)v63 != v97)
    {
      -[ASDPurchaseHistoryApp requiredCapabilities](self, "requiredCapabilities");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "requiredCapabilities");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v64;
      if (!objc_msgSend(v64, "isEqual:", v91))
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[24] = 1;
        *(_QWORD *)&v141[16] = 0x100000001;
        *(_QWORD *)v141 = 0x100000001;
        *(_QWORD *)&v141[8] = 0x100000001;
        v10 = 1;
        v11 = 1;
        v12 = 1;
        v13 = 1;
        v142[0] = 0x100000000;
        goto LABEL_99;
      }
    }
    -[ASDPurchaseHistoryApp appCapabilities](self, "appCapabilities");
    v65 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "appCapabilities");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)v65;
    LODWORD(v142[0]) = v65 != (_QWORD)v93;
    if ((void *)v65 != v93)
    {
      -[ASDPurchaseHistoryApp appCapabilities](self, "appCapabilities");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "appCapabilities");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v66;
      if (!objc_msgSend(v66, "isEqual:", v89))
      {
        v15 = 0;
        v16 = 0;
        LOBYTE(v17) = 0;
        *(_DWORD *)&v141[20] = 1;
        *(_DWORD *)&v141[24] = 1;
        *(_DWORD *)&v141[12] = 1;
        *(_DWORD *)&v141[16] = 1;
        *(_DWORD *)v141 = 1;
        *(_DWORD *)&v141[4] = 1;
        *(_DWORD *)&v141[8] = 1;
        v10 = 1;
        v11 = 1;
        v12 = 1;
        v13 = 1;
        v14 = 1;
        LODWORD(v142[0]) = 1;
        goto LABEL_99;
      }
    }
    v67 = -[ASDPurchaseHistoryApp isCustomBrowserEngineApp](self, "isCustomBrowserEngineApp");
    if (v67 != objc_msgSend(v136, "isCustomBrowserEngineApp")
      || (v68 = -[ASDPurchaseHistoryApp storeItemID](self, "storeItemID"), v68 != objc_msgSend(v136, "storeItemID"))
      || (v69 = -[ASDPurchaseHistoryApp supportsIPad](self, "supportsIPad"),
          v69 != objc_msgSend(v136, "supportsIPad"))
      || (v70 = -[ASDPurchaseHistoryApp supportsIPhone](self, "supportsIPhone"),
          v70 != objc_msgSend(v136, "supportsIPhone"))
      || (v71 = -[ASDPurchaseHistoryApp supportsMac](self, "supportsMac"),
          v71 != objc_msgSend(v136, "supportsMac"))
      || (v72 = -[ASDPurchaseHistoryApp supportsRealityDevice](self, "supportsRealityDevice"),
          v72 != objc_msgSend(v136, "supportsRealityDevice")))
    {
      v15 = 0;
      v16 = 0;
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v14 = 1;
      goto LABEL_99;
    }
    -[ASDPurchaseHistoryApp title](self, "title");
    v73 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "title");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)v73;
    v85 = v73 != (_QWORD)v87;
    if ((void *)v73 == v87
      || (-[ASDPurchaseHistoryApp title](self, "title"),
          v74 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v136, "title"),
          v86 = v74,
          v84 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v74, "isEqual:")))
    {
      v75 = -[ASDPurchaseHistoryApp watchAppDeliveredIniOSApp](self, "watchAppDeliveredIniOSApp");
      if (v75 == objc_msgSend(v136, "watchAppDeliveredIniOSApp"))
      {
        v76 = -[ASDPurchaseHistoryApp watchAppRunsIndependently](self, "watchAppRunsIndependently");
        if (v76 == objc_msgSend(v136, "watchAppRunsIndependently"))
        {
          v77 = -[ASDPurchaseHistoryApp watchOnly](self, "watchOnly");
          if (v77 == objc_msgSend(v136, "watchOnly"))
          {
            v78 = -[ASDPurchaseHistoryApp supportsLayeredImage](self, "supportsLayeredImage");
            if (v78 == objc_msgSend(v136, "supportsLayeredImage"))
            {
              v79 = -[ASDPurchaseHistoryApp hasP3](self, "hasP3");
              if (v79 == objc_msgSend(v136, "hasP3"))
              {
                v80 = -[ASDPurchaseHistoryApp optedInForMacOSEligibility](self, "optedInForMacOSEligibility");
                if (v80 == objc_msgSend(v136, "optedInForMacOSEligibility"))
                {
                  v81 = -[ASDPurchaseHistoryApp optedInForXROSEligibility](self, "optedInForXROSEligibility");
                  if (v81 == objc_msgSend(v136, "optedInForXROSEligibility"))
                  {
                    v82 = -[ASDPurchaseHistoryApp currentlyOptedInForMacOSEligibility](self, "currentlyOptedInForMacOSEligibility");
                    if (v82 == objc_msgSend(v136, "currentlyOptedInForMacOSEligibility"))
                    {
                      v83 = -[ASDPurchaseHistoryApp currentlyOptedInForXROSEligibility](self, "currentlyOptedInForXROSEligibility");
                      v5 = v136;
                      v17 = v83 ^ objc_msgSend(v136, "currentlyOptedInForXROSEligibility") ^ 1;
                      *(_DWORD *)&v141[20] = 1;
                      *(_DWORD *)&v141[24] = 1;
                      *(_DWORD *)&v141[12] = 1;
                      *(_DWORD *)&v141[16] = 1;
                      *(_DWORD *)v141 = 1;
                      *(_DWORD *)&v141[4] = 1;
                      *(_DWORD *)&v141[8] = 1;
                      v10 = 1;
                      v11 = 1;
                      v12 = 1;
                      v13 = 1;
                      v14 = 1;
                      v15 = 1;
                      v16 = v85;
                      goto LABEL_137;
                    }
                  }
                }
              }
            }
          }
        }
      }
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v14 = 1;
      v15 = 1;
      v16 = v85;
    }
    else
    {
      LOBYTE(v17) = 0;
      *(_DWORD *)&v141[20] = 1;
      *(_DWORD *)&v141[24] = 1;
      *(_DWORD *)&v141[12] = 1;
      *(_DWORD *)&v141[16] = 1;
      *(_DWORD *)v141 = 1;
      *(_DWORD *)&v141[4] = 1;
      *(_DWORD *)&v141[8] = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v14 = 1;
      v15 = 1;
      v16 = 1;
    }
    v5 = v136;
LABEL_137:
    v9 = (void *)v84;
    goto LABEL_24;
  }
  memset(v141, 0, sizeof(v141));
  v10 = 0;
  v11 = 0;
  memset(v142, 0, sizeof(v142));
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  LOBYTE(v17) = 0;
LABEL_24:
  if (v16)
  {
    v135 = v4;
    v33 = v5;
    v34 = v17;
    v17 = v14;
    v35 = v13;
    v36 = v12;
    v37 = v7;
    v38 = v6;
    v39 = v11;
    v40 = v10;
    v41 = v15;

    v15 = v41;
    v10 = v40;
    v11 = v39;
    v6 = v38;
    v7 = v37;
    v12 = v36;
    v13 = v35;
    v14 = v17;
    LOBYTE(v17) = v34;
    v5 = v33;
    v4 = v135;
  }
  if (v15)
  {

  }
  if (LODWORD(v142[0]))
  {

  }
  if (v14)
  {

  }
  if (HIDWORD(v142[0]))
  {

  }
  if (v13)
  {

  }
  if (LODWORD(v142[1]))
  {

  }
  if (v12)
  {

  }
  if (HIDWORD(v142[1]))
  {

  }
  if (v11)
  {

  }
  if (LODWORD(v142[2]))
  {

  }
  if (v10)
  {

  }
  if (HIDWORD(v142[2]))
  {

  }
  if (*(_DWORD *)&v141[4])
  {

  }
  if (LODWORD(v142[3]))
  {

  }
  if (*(_DWORD *)&v141[8])
  {

  }
  if (HIDWORD(v142[3]))
  {

  }
  if (*(_DWORD *)v141)
  {

  }
  if (*(_DWORD *)&v141[28])
  {

  }
  if (*(_DWORD *)&v141[12])
  {

  }
  if (*(_DWORD *)&v141[32])
  {

  }
  if (*(_DWORD *)&v141[16])
  {

  }
  if (*(_DWORD *)&v141[36])
  {

  }
  if (*(_DWORD *)&v141[20])
  {

  }
  if (*(_DWORD *)&v141[40])
  {

  }
  if (*(_DWORD *)&v141[24])
  {

  }
  if (v6 != v7)
  {

  }
LABEL_79:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  unsigned int v5;
  uint64_t v6;
  id v7;

  if (self)
  {
    v4 = self->_currentlyOptedInForMacOSEligibility << 16;
    if (self->_currentlyOptedInForXROSEligibility)
      v4 |= 0x200000u;
    v5 = v4 | self->_familyShared;
    if (self->_firstParty)
      v5 |= 2u;
    if (self->_hasMessagesExtension)
      v5 |= 4u;
    if (self->_hasP3)
      v5 |= 0x2000u;
    if (self->_hidden)
      v5 |= 8u;
    if (self->_hiddenFromSpringboard)
      v5 |= 0x10u;
    if (self->_isArcade)
      v5 |= 0x2000000u;
    if (self->_is32BitOnly)
      v5 |= 0x20u;
    if (self->_isPreorder)
      v5 |= 0x40u;
    if (self->_optedInForMacOSEligibility)
      v5 |= 0x4000u;
    if (self->_optedInForXROSEligibility)
      v5 |= 0x400000u;
    if (self->_requiresRosetta)
      v5 |= 0x80000u;
    if (self->_runsOnAppleSilicon)
      v5 |= 0x40000u;
    if (self->_runsOnIntel)
      v5 |= 0x20000u;
    if (self->_supportsIPad)
      v5 |= 0x80u;
    if (self->_supportsIPhone)
      v5 |= 0x100u;
    if (self->_supportsLayeredImage)
      v5 |= 0x1000u;
    if (self->_supportsMac)
      v5 |= 0x8000u;
    if (self->_supportsRealityDevice)
      v5 |= 0x800000u;
    if (self->_watchAppDeliveredIniOSApp)
      v5 |= 0x200u;
    if (self->_watchAppRunsIndependently)
      v5 |= 0x400u;
    if (self->_watchOnly)
      v5 |= 0x800u;
    if (self->_customBrowserEngineApp)
      v6 = v5 | 0x1000000;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = a3;
  objc_msgSend(v7, "encodeInt32:forKey:", v6, CFSTR("A"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_bundleID, CFSTR("B"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_circularIconURLString, CFSTR("T"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_contentRatingFlags, CFSTR("C"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_datePurchased, CFSTR("D"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_developerName, CFSTR("E"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_iconURLString, CFSTR("F"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_longTitle, CFSTR("G"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_mediaKind, CFSTR("U"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_ovalIconURLString, CFSTR("H"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_preflightPackageURL, CFSTR("I"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_purchaserDSID, CFSTR("J"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_redownloadParams, CFSTR("K"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_requiredCapabilities, CFSTR("L"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_storeItemID, CFSTR("M"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_purchaseToken, CFSTR("N"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_lockerItemID, CFSTR("O"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_productURL, CFSTR("P"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_genreID, CFSTR("Q"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_genreName, CFSTR("R"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_title, CFSTR("S"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_appCapabilities, CFSTR("Z"));

}

- (ASDPurchaseHistoryApp)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  unsigned int v6;
  uint32x4_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  objc_super v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ASDPurchaseHistoryApp;
  v5 = -[ASDPurchaseHistoryApp init](&v42, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("A"));
    v5[8] = v6 & 1;
    v5[9] = (v6 & 2) != 0;
    v5[10] = (v6 & 4) != 0;
    v5[11] = (v6 & 0x2000) != 0;
    v5[12] = (v6 & 8) != 0;
    v5[13] = (v6 & 0x10) != 0;
    v5[15] = (v6 & 0x2000000) != 0;
    v5[16] = (v6 & 0x20) != 0;
    v5[17] = (v6 & 0x40) != 0;
    v7 = (uint32x4_t)vdupq_n_s32(v6);
    v8 = (int16x8_t)vshlq_u32(v7, (uint32x4_t)xmmword_19A0BDEF0);
    *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v8), (int8x8_t)0x1000100010001);
    *(_DWORD *)(v5 + 18) = vmovn_s16(v8).u32[0];
    v5[23] = (v6 & 0x80000) != 0;
    v5[25] = (v6 & 0x40000) != 0;
    v5[24] = (v6 & 0x20000) != 0;
    v5[26] = (v6 & 0x80) != 0;
    v9 = (int16x8_t)vshlq_u32(v7, (uint32x4_t)xmmword_19A0BDF00);
    *(int8x8_t *)v9.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v9), (int8x8_t)0x1000100010001);
    *(_DWORD *)(v5 + 27) = vmovn_s16(v9).u32[0];
    v5[31] = (v6 & 0x200) != 0;
    v5[32] = (v6 & 0x400) != 0;
    v5[33] = (v6 & 0x800) != 0;
    v5[14] = HIBYTE(v6) & 1;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("T"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v12;

    *((_QWORD *)v5 + 9) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("C"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("D"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("E"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("F"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("G"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v20;

    *((_DWORD *)v5 + 9) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("U"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("H"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v5 + 17);
    *((_QWORD *)v5 + 17) = v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("I"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v24;

    *((_QWORD *)v5 + 20) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("J"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("K"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("L"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v5 + 22);
    *((_QWORD *)v5 + 22) = v31;

    *((_QWORD *)v5 + 23) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("M"));
    *((_DWORD *)v5 + 10) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("N"));
    *((_QWORD *)v5 + 25) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("O"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("P"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v33;

    *((_QWORD *)v5 + 12) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Q"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("R"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("S"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Z"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v39;

  }
  return (ASDPurchaseHistoryApp *)v5;
}

- (BOOL)hasAnyMacOSCompatibleIOSVersion
{
  return self->_optedInForMacOSEligibility;
}

- (NSArray)appCapabilities
{
  return self->_appCapabilities;
}

- (void)setAppCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)circularIconURLString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCircularIconURLString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (int64_t)contentRatingFlags
{
  return self->_contentRatingFlags;
}

- (void)setContentRatingFlags:(int64_t)a3
{
  self->_contentRatingFlags = a3;
}

- (NSDate)datePurchased
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDatePurchased:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)developerName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeveloperName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)isFamilyShared
{
  return self->_familyShared;
}

- (void)setFamilyShared:(BOOL)a3
{
  self->_familyShared = a3;
}

- (BOOL)isFirstParty
{
  return self->_firstParty;
}

- (void)setFirstParty:(BOOL)a3
{
  self->_firstParty = a3;
}

- (int64_t)genreID
{
  return self->_genreID;
}

- (void)setGenreID:(int64_t)a3
{
  self->_genreID = a3;
}

- (NSString)genreName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGenreName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (BOOL)hasP3
{
  return self->_hasP3;
}

- (void)setHasP3:(BOOL)a3
{
  self->_hasP3 = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHiddenFromSpringboard
{
  return self->_hiddenFromSpringboard;
}

- (void)setHiddenFromSpringboard:(BOOL)a3
{
  self->_hiddenFromSpringboard = a3;
}

- (BOOL)isCustomBrowserEngineApp
{
  return self->_customBrowserEngineApp;
}

- (void)setCustomBrowserEngineApp:(BOOL)a3
{
  self->_customBrowserEngineApp = a3;
}

- (NSString)iconURLString
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIconURLString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (BOOL)isArcade
{
  return self->_isArcade;
}

- (void)setIsArcade:(BOOL)a3
{
  self->_isArcade = a3;
}

- (BOOL)is32BitOnly
{
  return self->_is32BitOnly;
}

- (void)setIs32BitOnly:(BOOL)a3
{
  self->_is32BitOnly = a3;
}

- (BOOL)isPreorder
{
  return self->_isPreorder;
}

- (void)setIsPreorder:(BOOL)a3
{
  self->_isPreorder = a3;
}

- (BOOL)currentlyOptedInForMacOSEligibility
{
  return self->_currentlyOptedInForMacOSEligibility;
}

- (void)setCurrentlyOptedInForMacOSEligibility:(BOOL)a3
{
  self->_currentlyOptedInForMacOSEligibility = a3;
}

- (BOOL)currentlyOptedInForXROSEligibility
{
  return self->_currentlyOptedInForXROSEligibility;
}

- (void)setCurrentlyOptedInForXROSEligibility:(BOOL)a3
{
  self->_currentlyOptedInForXROSEligibility = a3;
}

- (BOOL)optedInForMacOSEligibility
{
  return self->_optedInForMacOSEligibility;
}

- (void)setOptedInForMacOSEligibility:(BOOL)a3
{
  self->_optedInForMacOSEligibility = a3;
}

- (BOOL)optedInForXROSEligibility
{
  return self->_optedInForXROSEligibility;
}

- (void)setOptedInForXROSEligibility:(BOOL)a3
{
  self->_optedInForXROSEligibility = a3;
}

- (BOOL)isVerifiedForMacOS
{
  return self->_isVerifiedForMacOS;
}

- (void)setIsVerifiedForMacOS:(BOOL)a3
{
  self->_isVerifiedForMacOS = a3;
}

- (NSString)longTitle
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLongTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSArray)macAppRequiredCapabilities
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMacAppRequiredCapabilities:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (void)setMediaKind:(unsigned int)a3
{
  self->_mediaKind = a3;
}

- (BOOL)requiresRosetta
{
  return self->_requiresRosetta;
}

- (void)setRequiresRosetta:(BOOL)a3
{
  self->_requiresRosetta = a3;
}

- (BOOL)runsOnIntel
{
  return self->_runsOnIntel;
}

- (void)setRunsOnIntel:(BOOL)a3
{
  self->_runsOnIntel = a3;
}

- (BOOL)runsOnAppleSilicon
{
  return self->_runsOnAppleSilicon;
}

- (void)setRunsOnAppleSilicon:(BOOL)a3
{
  self->_runsOnAppleSilicon = a3;
}

- (NSString)ovalIconURLString
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setOvalIconURLString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSURL)preflightPackageURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPreflightPackageURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSURL)productURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setProductURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (int64_t)purchaserDSID
{
  return self->_purchaserDSID;
}

- (void)setPurchaserDSID:(int64_t)a3
{
  self->_purchaserDSID = a3;
}

- (NSString)redownloadParams
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRedownloadParams:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSArray)requiredCapabilities
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequiredCapabilities:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (BOOL)supportsIPad
{
  return self->_supportsIPad;
}

- (void)setSupportsIPad:(BOOL)a3
{
  self->_supportsIPad = a3;
}

- (BOOL)supportsIPhone
{
  return self->_supportsIPhone;
}

- (void)setSupportsIPhone:(BOOL)a3
{
  self->_supportsIPhone = a3;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (void)setSupportsLayeredImage:(BOOL)a3
{
  self->_supportsLayeredImage = a3;
}

- (BOOL)supportsMac
{
  return self->_supportsMac;
}

- (void)setSupportsMac:(BOOL)a3
{
  self->_supportsMac = a3;
}

- (BOOL)supportsRealityDevice
{
  return self->_supportsRealityDevice;
}

- (void)setSupportsRealityDevice:(BOOL)a3
{
  self->_supportsRealityDevice = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (BOOL)watchAppDeliveredIniOSApp
{
  return self->_watchAppDeliveredIniOSApp;
}

- (void)setWatchAppDeliveredIniOSApp:(BOOL)a3
{
  self->_watchAppDeliveredIniOSApp = a3;
}

- (BOOL)watchAppRunsIndependently
{
  return self->_watchAppRunsIndependently;
}

- (void)setWatchAppRunsIndependently:(BOOL)a3
{
  self->_watchAppRunsIndependently = a3;
}

- (BOOL)watchOnly
{
  return self->_watchOnly;
}

- (void)setWatchOnly:(BOOL)a3
{
  self->_watchOnly = a3;
}

- (unsigned)purchaseToken
{
  return self->_purchaseToken;
}

- (void)setPurchaseToken:(unsigned int)a3
{
  self->_purchaseToken = a3;
}

- (unint64_t)lockerItemID
{
  return self->_lockerItemID;
}

- (void)setLockerItemID:(unint64_t)a3
{
  self->_lockerItemID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_redownloadParams, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_preflightPackageURL, 0);
  objc_storeStrong((id *)&self->_ovalIconURLString, 0);
  objc_storeStrong((id *)&self->_macAppRequiredCapabilities, 0);
  objc_storeStrong((id *)&self->_longTitle, 0);
  objc_storeStrong((id *)&self->_iconURLString, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_datePurchased, 0);
  objc_storeStrong((id *)&self->_circularIconURLString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appCapabilities, 0);
}

@end
