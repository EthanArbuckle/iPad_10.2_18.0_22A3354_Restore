@implementation BMPerBatchDomainSpecificAssetCounts

- (BMPerBatchDomainSpecificAssetCounts)initWithParsedAssetCount:(id)a3 anyDomainAssetCount:(id)a4 artAssetCount:(id)a5 natureAssetCount:(id)a6 animalsAssetCount:(id)a7 birdsAssetCount:(id)a8 insectsAssetCount:(id)a9 reptilesAssetCount:(id)a10 mammalsAssetCount:(id)a11 landmarkAssetCount:(id)a12 naturalLandmarkAssetCount:(id)a13 mediaAssetCount:(id)a14 bookAssetCount:(id)a15 albumAssetCount:(id)a16 catsAssetCount:(id)a17 dogsAssetCount:(id)a18 apparelAssetCount:(id)a19 foodAssetCount:(id)a20 storefrontAssetCount:(id)a21 signSymbolAssetCount:(id)a22 laundryCareSymbolAssetCount:(id)a23 autoSymbolAssetCount:(id)a24 brandLogoSymbolAssetCount:(id)a25 object2DAssetCount:(id)a26 barcodeDetectionAssetCount:(id)a27 sculptureAssetCount:(id)a28 skylineAssetCount:(id)a29
{
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  BMPerBatchDomainSpecificAssetCounts *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  objc_super v91;

  v90 = a3;
  v89 = a4;
  v88 = a5;
  v87 = a6;
  v86 = a7;
  v85 = a8;
  v84 = a9;
  v83 = a10;
  v82 = a11;
  v81 = a12;
  v80 = a13;
  v79 = a14;
  v78 = a15;
  v77 = a16;
  v76 = a17;
  v75 = a18;
  v74 = a19;
  v73 = a20;
  v34 = a21;
  v35 = a22;
  v36 = a23;
  v37 = a24;
  v38 = a25;
  v39 = a26;
  v40 = a27;
  v41 = a28;
  v42 = a29;
  v91.receiver = self;
  v91.super_class = (Class)BMPerBatchDomainSpecificAssetCounts;
  v43 = -[BMEventBase init](&v91, sel_init);
  if (v43)
  {
    v43->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v90)
    {
      v43->_hasParsedAssetCount = 1;
      v44 = objc_msgSend(v90, "intValue");
    }
    else
    {
      v43->_hasParsedAssetCount = 0;
      v44 = -1;
    }
    v43->_parsedAssetCount = v44;
    if (v89)
    {
      v43->_hasAnyDomainAssetCount = 1;
      v45 = objc_msgSend(v89, "intValue");
    }
    else
    {
      v43->_hasAnyDomainAssetCount = 0;
      v45 = -1;
    }
    v43->_anyDomainAssetCount = v45;
    if (v88)
    {
      v43->_hasArtAssetCount = 1;
      v46 = objc_msgSend(v88, "intValue");
    }
    else
    {
      v43->_hasArtAssetCount = 0;
      v46 = -1;
    }
    v43->_artAssetCount = v46;
    if (v87)
    {
      v43->_hasNatureAssetCount = 1;
      v47 = objc_msgSend(v87, "intValue");
    }
    else
    {
      v43->_hasNatureAssetCount = 0;
      v47 = -1;
    }
    v43->_natureAssetCount = v47;
    if (v86)
    {
      v43->_hasAnimalsAssetCount = 1;
      v48 = objc_msgSend(v86, "intValue");
    }
    else
    {
      v43->_hasAnimalsAssetCount = 0;
      v48 = -1;
    }
    v43->_animalsAssetCount = v48;
    if (v85)
    {
      v43->_hasBirdsAssetCount = 1;
      v49 = objc_msgSend(v85, "intValue");
    }
    else
    {
      v43->_hasBirdsAssetCount = 0;
      v49 = -1;
    }
    v43->_birdsAssetCount = v49;
    if (v84)
    {
      v43->_hasInsectsAssetCount = 1;
      v50 = objc_msgSend(v84, "intValue");
    }
    else
    {
      v43->_hasInsectsAssetCount = 0;
      v50 = -1;
    }
    v43->_insectsAssetCount = v50;
    if (v83)
    {
      v43->_hasReptilesAssetCount = 1;
      v51 = objc_msgSend(v83, "intValue");
    }
    else
    {
      v43->_hasReptilesAssetCount = 0;
      v51 = -1;
    }
    v43->_reptilesAssetCount = v51;
    if (v82)
    {
      v43->_hasMammalsAssetCount = 1;
      v52 = objc_msgSend(v82, "intValue");
    }
    else
    {
      v43->_hasMammalsAssetCount = 0;
      v52 = -1;
    }
    v43->_mammalsAssetCount = v52;
    if (v81)
    {
      v43->_hasLandmarkAssetCount = 1;
      v53 = objc_msgSend(v81, "intValue");
    }
    else
    {
      v43->_hasLandmarkAssetCount = 0;
      v53 = -1;
    }
    v43->_landmarkAssetCount = v53;
    if (v80)
    {
      v43->_hasNaturalLandmarkAssetCount = 1;
      v54 = objc_msgSend(v80, "intValue");
    }
    else
    {
      v43->_hasNaturalLandmarkAssetCount = 0;
      v54 = -1;
    }
    v43->_naturalLandmarkAssetCount = v54;
    if (v79)
    {
      v43->_hasMediaAssetCount = 1;
      v55 = objc_msgSend(v79, "intValue");
    }
    else
    {
      v43->_hasMediaAssetCount = 0;
      v55 = -1;
    }
    v43->_mediaAssetCount = v55;
    if (v78)
    {
      v43->_hasBookAssetCount = 1;
      v56 = objc_msgSend(v78, "intValue");
    }
    else
    {
      v43->_hasBookAssetCount = 0;
      v56 = -1;
    }
    v43->_bookAssetCount = v56;
    if (v77)
    {
      v43->_hasAlbumAssetCount = 1;
      v57 = objc_msgSend(v77, "intValue");
    }
    else
    {
      v43->_hasAlbumAssetCount = 0;
      v57 = -1;
    }
    v43->_albumAssetCount = v57;
    if (v76)
    {
      v43->_hasCatsAssetCount = 1;
      v58 = objc_msgSend(v76, "intValue");
    }
    else
    {
      v43->_hasCatsAssetCount = 0;
      v58 = -1;
    }
    v43->_catsAssetCount = v58;
    if (v75)
    {
      v43->_hasDogsAssetCount = 1;
      v59 = objc_msgSend(v75, "intValue");
    }
    else
    {
      v43->_hasDogsAssetCount = 0;
      v59 = -1;
    }
    v43->_dogsAssetCount = v59;
    if (v74)
    {
      v43->_hasApparelAssetCount = 1;
      v60 = objc_msgSend(v74, "intValue");
    }
    else
    {
      v43->_hasApparelAssetCount = 0;
      v60 = -1;
    }
    v43->_apparelAssetCount = v60;
    if (v73)
    {
      v43->_hasFoodAssetCount = 1;
      v61 = objc_msgSend(v73, "intValue");
    }
    else
    {
      v43->_hasFoodAssetCount = 0;
      v61 = -1;
    }
    v43->_foodAssetCount = v61;
    if (v34)
    {
      v43->_hasStorefrontAssetCount = 1;
      v62 = objc_msgSend(v34, "intValue");
    }
    else
    {
      v43->_hasStorefrontAssetCount = 0;
      v62 = -1;
    }
    v43->_storefrontAssetCount = v62;
    if (v35)
    {
      v43->_hasSignSymbolAssetCount = 1;
      v63 = objc_msgSend(v35, "intValue");
    }
    else
    {
      v43->_hasSignSymbolAssetCount = 0;
      v63 = -1;
    }
    v43->_signSymbolAssetCount = v63;
    if (v36)
    {
      v43->_hasLaundryCareSymbolAssetCount = 1;
      v64 = objc_msgSend(v36, "intValue");
    }
    else
    {
      v43->_hasLaundryCareSymbolAssetCount = 0;
      v64 = -1;
    }
    v43->_laundryCareSymbolAssetCount = v64;
    if (v37)
    {
      v43->_hasAutoSymbolAssetCount = 1;
      v65 = objc_msgSend(v37, "intValue");
    }
    else
    {
      v43->_hasAutoSymbolAssetCount = 0;
      v65 = -1;
    }
    v43->_autoSymbolAssetCount = v65;
    if (v38)
    {
      v43->_hasBrandLogoSymbolAssetCount = 1;
      v66 = objc_msgSend(v38, "intValue");
    }
    else
    {
      v43->_hasBrandLogoSymbolAssetCount = 0;
      v66 = -1;
    }
    v43->_brandLogoSymbolAssetCount = v66;
    if (v39)
    {
      v43->_hasObject2DAssetCount = 1;
      v67 = objc_msgSend(v39, "intValue");
    }
    else
    {
      v43->_hasObject2DAssetCount = 0;
      v67 = -1;
    }
    v43->_object2DAssetCount = v67;
    if (v40)
    {
      v43->_hasBarcodeDetectionAssetCount = 1;
      v68 = objc_msgSend(v40, "intValue");
    }
    else
    {
      v43->_hasBarcodeDetectionAssetCount = 0;
      v68 = -1;
    }
    v43->_barcodeDetectionAssetCount = v68;
    if (v41)
    {
      v43->_hasSculptureAssetCount = 1;
      v69 = objc_msgSend(v41, "intValue");
    }
    else
    {
      v43->_hasSculptureAssetCount = 0;
      v69 = -1;
    }
    v43->_sculptureAssetCount = v69;
    if (v42)
    {
      v43->_hasSkylineAssetCount = 1;
      v70 = objc_msgSend(v42, "intValue");
    }
    else
    {
      v43->_hasSkylineAssetCount = 0;
      v70 = -1;
    }
    v43->_skylineAssetCount = v70;
  }

  return v43;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts parsedAssetCount](self, "parsedAssetCount"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts anyDomainAssetCount](self, "anyDomainAssetCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts artAssetCount](self, "artAssetCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts natureAssetCount](self, "natureAssetCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts animalsAssetCount](self, "animalsAssetCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts birdsAssetCount](self, "birdsAssetCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts insectsAssetCount](self, "insectsAssetCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts reptilesAssetCount](self, "reptilesAssetCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mammalsAssetCount](self, "mammalsAssetCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts landmarkAssetCount](self, "landmarkAssetCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts naturalLandmarkAssetCount](self, "naturalLandmarkAssetCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mediaAssetCount](self, "mediaAssetCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts bookAssetCount](self, "bookAssetCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts albumAssetCount](self, "albumAssetCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts catsAssetCount](self, "catsAssetCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts dogsAssetCount](self, "dogsAssetCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts apparelAssetCount](self, "apparelAssetCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts foodAssetCount](self, "foodAssetCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts storefrontAssetCount](self, "storefrontAssetCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts signSymbolAssetCount](self, "signSymbolAssetCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts laundryCareSymbolAssetCount](self, "laundryCareSymbolAssetCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts autoSymbolAssetCount](self, "autoSymbolAssetCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts brandLogoSymbolAssetCount](self, "brandLogoSymbolAssetCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts object2DAssetCount](self, "object2DAssetCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts barcodeDetectionAssetCount](self, "barcodeDetectionAssetCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts sculptureAssetCount](self, "sculptureAssetCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts skylineAssetCount](self, "skylineAssetCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("BMPerBatchDomainSpecificAssetCounts with parsedAssetCount: %@, anyDomainAssetCount: %@, artAssetCount: %@, natureAssetCount: %@, animalsAssetCount: %@, birdsAssetCount: %@, insectsAssetCount: %@, reptilesAssetCount: %@, mammalsAssetCount: %@, landmarkAssetCount: %@, naturalLandmarkAssetCount: %@, mediaAssetCount: %@, bookAssetCount: %@, albumAssetCount: %@, catsAssetCount: %@, dogsAssetCount: %@, apparelAssetCount: %@, foodAssetCount: %@, storefrontAssetCount: %@, signSymbolAssetCount: %@, laundryCareSymbolAssetCount: %@, autoSymbolAssetCount: %@, brandLogoSymbolAssetCount: %@, object2DAssetCount: %@, barcodeDetectionAssetCount: %@, sculptureAssetCount: %@, skylineAssetCount: %@"), v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v18, v17, v16, v15,
                  v14,
                  v13,
                  v12,
                  v11,
                  v10,
                  v9,
                  v8,
                  v3,
                  v4,
                  v5,
                  v6);

  return (NSString *)v20;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPerBatchDomainSpecificAssetCounts *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  int v25;
  int *v26;
  BOOL v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  unint64_t v101;
  char v102;
  char v103;
  unsigned int v104;
  uint64_t v105;
  unint64_t v106;
  char v107;
  char v108;
  unsigned int v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  char v113;
  unsigned int v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  char v118;
  unsigned int v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  char v123;
  unsigned int v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  unint64_t v131;
  char v132;
  char v133;
  unsigned int v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  char v138;
  unsigned int v139;
  uint64_t v140;
  unint64_t v141;
  char v142;
  char v143;
  unsigned int v144;
  uint64_t v145;
  unint64_t v146;
  char v147;
  char v148;
  unsigned int v149;
  uint64_t v150;
  unint64_t v151;
  char v152;
  char v153;
  unsigned int v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  BMPerBatchDomainSpecificAssetCounts *v158;
  objc_super v160;

  v4 = a3;
  v160.receiver = self;
  v160.super_class = (Class)BMPerBatchDomainSpecificAssetCounts;
  v5 = -[BMEventBase init](&v160, sel_init);
  if (!v5)
    goto LABEL_274;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v5->_hasParsedAssetCount = 1;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__parsedAssetCount;
              goto LABEL_238;
            }
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              break;
            v25 = 0;
            v19 += 7;
            v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__parsedAssetCount;
            v27 = v20++ > 8;
            if (v27)
              goto LABEL_242;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__parsedAssetCount;
          goto LABEL_239;
        case 2u:
          v28 = 0;
          v29 = 0;
          v21 = 0;
          v5->_hasAnyDomainAssetCount = 1;
          while (2)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__anyDomainAssetCount;
              goto LABEL_238;
            }
            v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 1;
            v21 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v25 = 0;
              v28 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__anyDomainAssetCount;
              v27 = v29++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__anyDomainAssetCount;
          goto LABEL_239;
        case 3u:
          v33 = 0;
          v34 = 0;
          v21 = 0;
          v5->_hasArtAssetCount = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__artAssetCount;
              goto LABEL_238;
            }
            v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
            *(_QWORD *)&v4[v35] = v36 + 1;
            v21 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v25 = 0;
              v33 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__artAssetCount;
              v27 = v34++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__artAssetCount;
          goto LABEL_239;
        case 4u:
          v38 = 0;
          v39 = 0;
          v21 = 0;
          v5->_hasNatureAssetCount = 1;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            if (v41 == -1 || v41 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__natureAssetCount;
              goto LABEL_238;
            }
            v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
            *(_QWORD *)&v4[v40] = v41 + 1;
            v21 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v25 = 0;
              v38 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__natureAssetCount;
              v27 = v39++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__natureAssetCount;
          goto LABEL_239;
        case 5u:
          v43 = 0;
          v44 = 0;
          v21 = 0;
          v5->_hasAnimalsAssetCount = 1;
          while (2)
          {
            v45 = *v6;
            v46 = *(_QWORD *)&v4[v45];
            if (v46 == -1 || v46 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__animalsAssetCount;
              goto LABEL_238;
            }
            v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v46);
            *(_QWORD *)&v4[v45] = v46 + 1;
            v21 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              v25 = 0;
              v43 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__animalsAssetCount;
              v27 = v44++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__animalsAssetCount;
          goto LABEL_239;
        case 6u:
          v48 = 0;
          v49 = 0;
          v21 = 0;
          v5->_hasBirdsAssetCount = 1;
          while (2)
          {
            v50 = *v6;
            v51 = *(_QWORD *)&v4[v50];
            if (v51 == -1 || v51 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__birdsAssetCount;
              goto LABEL_238;
            }
            v52 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v51);
            *(_QWORD *)&v4[v50] = v51 + 1;
            v21 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              v25 = 0;
              v48 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__birdsAssetCount;
              v27 = v49++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__birdsAssetCount;
          goto LABEL_239;
        case 7u:
          v53 = 0;
          v54 = 0;
          v21 = 0;
          v5->_hasInsectsAssetCount = 1;
          while (2)
          {
            v55 = *v6;
            v56 = *(_QWORD *)&v4[v55];
            if (v56 == -1 || v56 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__insectsAssetCount;
              goto LABEL_238;
            }
            v57 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v56);
            *(_QWORD *)&v4[v55] = v56 + 1;
            v21 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              v25 = 0;
              v53 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__insectsAssetCount;
              v27 = v54++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__insectsAssetCount;
          goto LABEL_239;
        case 8u:
          v58 = 0;
          v59 = 0;
          v21 = 0;
          v5->_hasReptilesAssetCount = 1;
          while (2)
          {
            v60 = *v6;
            v61 = *(_QWORD *)&v4[v60];
            if (v61 == -1 || v61 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__reptilesAssetCount;
              goto LABEL_238;
            }
            v62 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v61);
            *(_QWORD *)&v4[v60] = v61 + 1;
            v21 |= (unint64_t)(v62 & 0x7F) << v58;
            if (v62 < 0)
            {
              v25 = 0;
              v58 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__reptilesAssetCount;
              v27 = v59++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__reptilesAssetCount;
          goto LABEL_239;
        case 9u:
          v63 = 0;
          v64 = 0;
          v21 = 0;
          v5->_hasMammalsAssetCount = 1;
          while (2)
          {
            v65 = *v6;
            v66 = *(_QWORD *)&v4[v65];
            if (v66 == -1 || v66 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mammalsAssetCount;
              goto LABEL_238;
            }
            v67 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v66);
            *(_QWORD *)&v4[v65] = v66 + 1;
            v21 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v25 = 0;
              v63 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mammalsAssetCount;
              v27 = v64++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mammalsAssetCount;
          goto LABEL_239;
        case 0xAu:
          v68 = 0;
          v69 = 0;
          v21 = 0;
          v5->_hasLandmarkAssetCount = 1;
          while (2)
          {
            v70 = *v6;
            v71 = *(_QWORD *)&v4[v70];
            if (v71 == -1 || v71 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__landmarkAssetCount;
              goto LABEL_238;
            }
            v72 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v71);
            *(_QWORD *)&v4[v70] = v71 + 1;
            v21 |= (unint64_t)(v72 & 0x7F) << v68;
            if (v72 < 0)
            {
              v25 = 0;
              v68 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__landmarkAssetCount;
              v27 = v69++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__landmarkAssetCount;
          goto LABEL_239;
        case 0xBu:
          v73 = 0;
          v74 = 0;
          v21 = 0;
          v5->_hasNaturalLandmarkAssetCount = 1;
          while (2)
          {
            v75 = *v6;
            v76 = *(_QWORD *)&v4[v75];
            if (v76 == -1 || v76 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__naturalLandmarkAssetCount;
              goto LABEL_238;
            }
            v77 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v76);
            *(_QWORD *)&v4[v75] = v76 + 1;
            v21 |= (unint64_t)(v77 & 0x7F) << v73;
            if (v77 < 0)
            {
              v25 = 0;
              v73 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__naturalLandmarkAssetCount;
              v27 = v74++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__naturalLandmarkAssetCount;
          goto LABEL_239;
        case 0xCu:
          v78 = 0;
          v79 = 0;
          v21 = 0;
          v5->_hasMediaAssetCount = 1;
          while (2)
          {
            v80 = *v6;
            v81 = *(_QWORD *)&v4[v80];
            if (v81 == -1 || v81 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mediaAssetCount;
              goto LABEL_238;
            }
            v82 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v81);
            *(_QWORD *)&v4[v80] = v81 + 1;
            v21 |= (unint64_t)(v82 & 0x7F) << v78;
            if (v82 < 0)
            {
              v25 = 0;
              v78 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mediaAssetCount;
              v27 = v79++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__mediaAssetCount;
          goto LABEL_239;
        case 0xDu:
          v83 = 0;
          v84 = 0;
          v21 = 0;
          v5->_hasBookAssetCount = 1;
          while (2)
          {
            v85 = *v6;
            v86 = *(_QWORD *)&v4[v85];
            if (v86 == -1 || v86 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__bookAssetCount;
              goto LABEL_238;
            }
            v87 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v86);
            *(_QWORD *)&v4[v85] = v86 + 1;
            v21 |= (unint64_t)(v87 & 0x7F) << v83;
            if (v87 < 0)
            {
              v25 = 0;
              v83 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__bookAssetCount;
              v27 = v84++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__bookAssetCount;
          goto LABEL_239;
        case 0xEu:
          v88 = 0;
          v89 = 0;
          v21 = 0;
          v5->_hasAlbumAssetCount = 1;
          while (2)
          {
            v90 = *v6;
            v91 = *(_QWORD *)&v4[v90];
            if (v91 == -1 || v91 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__albumAssetCount;
              goto LABEL_238;
            }
            v92 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v91);
            *(_QWORD *)&v4[v90] = v91 + 1;
            v21 |= (unint64_t)(v92 & 0x7F) << v88;
            if (v92 < 0)
            {
              v25 = 0;
              v88 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__albumAssetCount;
              v27 = v89++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__albumAssetCount;
          goto LABEL_239;
        case 0xFu:
          v93 = 0;
          v94 = 0;
          v21 = 0;
          v5->_hasCatsAssetCount = 1;
          while (2)
          {
            v95 = *v6;
            v96 = *(_QWORD *)&v4[v95];
            if (v96 == -1 || v96 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__catsAssetCount;
              goto LABEL_238;
            }
            v97 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v96);
            *(_QWORD *)&v4[v95] = v96 + 1;
            v21 |= (unint64_t)(v97 & 0x7F) << v93;
            if (v97 < 0)
            {
              v25 = 0;
              v93 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__catsAssetCount;
              v27 = v94++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__catsAssetCount;
          goto LABEL_239;
        case 0x10u:
          v98 = 0;
          v99 = 0;
          v21 = 0;
          v5->_hasDogsAssetCount = 1;
          while (2)
          {
            v100 = *v6;
            v101 = *(_QWORD *)&v4[v100];
            if (v101 == -1 || v101 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__dogsAssetCount;
              goto LABEL_238;
            }
            v102 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v101);
            *(_QWORD *)&v4[v100] = v101 + 1;
            v21 |= (unint64_t)(v102 & 0x7F) << v98;
            if (v102 < 0)
            {
              v25 = 0;
              v98 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__dogsAssetCount;
              v27 = v99++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__dogsAssetCount;
          goto LABEL_239;
        case 0x11u:
          v103 = 0;
          v104 = 0;
          v21 = 0;
          v5->_hasApparelAssetCount = 1;
          while (2)
          {
            v105 = *v6;
            v106 = *(_QWORD *)&v4[v105];
            if (v106 == -1 || v106 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__apparelAssetCount;
              goto LABEL_238;
            }
            v107 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v106);
            *(_QWORD *)&v4[v105] = v106 + 1;
            v21 |= (unint64_t)(v107 & 0x7F) << v103;
            if (v107 < 0)
            {
              v25 = 0;
              v103 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__apparelAssetCount;
              v27 = v104++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__apparelAssetCount;
          goto LABEL_239;
        case 0x12u:
          v108 = 0;
          v109 = 0;
          v21 = 0;
          v5->_hasFoodAssetCount = 1;
          while (2)
          {
            v110 = *v6;
            v111 = *(_QWORD *)&v4[v110];
            if (v111 == -1 || v111 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__foodAssetCount;
              goto LABEL_238;
            }
            v112 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v111);
            *(_QWORD *)&v4[v110] = v111 + 1;
            v21 |= (unint64_t)(v112 & 0x7F) << v108;
            if (v112 < 0)
            {
              v25 = 0;
              v108 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__foodAssetCount;
              v27 = v109++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__foodAssetCount;
          goto LABEL_239;
        case 0x13u:
          v113 = 0;
          v114 = 0;
          v21 = 0;
          v5->_hasStorefrontAssetCount = 1;
          while (2)
          {
            v115 = *v6;
            v116 = *(_QWORD *)&v4[v115];
            if (v116 == -1 || v116 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__storefrontAssetCount;
              goto LABEL_238;
            }
            v117 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v116);
            *(_QWORD *)&v4[v115] = v116 + 1;
            v21 |= (unint64_t)(v117 & 0x7F) << v113;
            if (v117 < 0)
            {
              v25 = 0;
              v113 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__storefrontAssetCount;
              v27 = v114++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__storefrontAssetCount;
          goto LABEL_239;
        case 0x14u:
          v118 = 0;
          v119 = 0;
          v21 = 0;
          v5->_hasSignSymbolAssetCount = 1;
          while (2)
          {
            v120 = *v6;
            v121 = *(_QWORD *)&v4[v120];
            if (v121 == -1 || v121 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__signSymbolAssetCount;
              goto LABEL_238;
            }
            v122 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v121);
            *(_QWORD *)&v4[v120] = v121 + 1;
            v21 |= (unint64_t)(v122 & 0x7F) << v118;
            if (v122 < 0)
            {
              v25 = 0;
              v118 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__signSymbolAssetCount;
              v27 = v119++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__signSymbolAssetCount;
          goto LABEL_239;
        case 0x15u:
          v123 = 0;
          v124 = 0;
          v21 = 0;
          v5->_hasLaundryCareSymbolAssetCount = 1;
          while (2)
          {
            v125 = *v6;
            v126 = *(_QWORD *)&v4[v125];
            if (v126 == -1 || v126 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__laundryCareSymbolAssetCount;
              goto LABEL_238;
            }
            v127 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v126);
            *(_QWORD *)&v4[v125] = v126 + 1;
            v21 |= (unint64_t)(v127 & 0x7F) << v123;
            if (v127 < 0)
            {
              v25 = 0;
              v123 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__laundryCareSymbolAssetCount;
              v27 = v124++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__laundryCareSymbolAssetCount;
          goto LABEL_239;
        case 0x16u:
          v128 = 0;
          v129 = 0;
          v21 = 0;
          v5->_hasAutoSymbolAssetCount = 1;
          while (2)
          {
            v130 = *v6;
            v131 = *(_QWORD *)&v4[v130];
            if (v131 == -1 || v131 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__autoSymbolAssetCount;
              goto LABEL_238;
            }
            v132 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v131);
            *(_QWORD *)&v4[v130] = v131 + 1;
            v21 |= (unint64_t)(v132 & 0x7F) << v128;
            if (v132 < 0)
            {
              v25 = 0;
              v128 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__autoSymbolAssetCount;
              v27 = v129++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__autoSymbolAssetCount;
          goto LABEL_239;
        case 0x17u:
          v133 = 0;
          v134 = 0;
          v21 = 0;
          v5->_hasBrandLogoSymbolAssetCount = 1;
          while (2)
          {
            v135 = *v6;
            v136 = *(_QWORD *)&v4[v135];
            if (v136 == -1 || v136 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__brandLogoSymbolAssetCount;
              goto LABEL_238;
            }
            v137 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v136);
            *(_QWORD *)&v4[v135] = v136 + 1;
            v21 |= (unint64_t)(v137 & 0x7F) << v133;
            if (v137 < 0)
            {
              v25 = 0;
              v133 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__brandLogoSymbolAssetCount;
              v27 = v134++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__brandLogoSymbolAssetCount;
          goto LABEL_239;
        case 0x18u:
          v138 = 0;
          v139 = 0;
          v21 = 0;
          v5->_hasObject2DAssetCount = 1;
          while (2)
          {
            v140 = *v6;
            v141 = *(_QWORD *)&v4[v140];
            if (v141 == -1 || v141 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__object2DAssetCount;
              goto LABEL_238;
            }
            v142 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v141);
            *(_QWORD *)&v4[v140] = v141 + 1;
            v21 |= (unint64_t)(v142 & 0x7F) << v138;
            if (v142 < 0)
            {
              v25 = 0;
              v138 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__object2DAssetCount;
              v27 = v139++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__object2DAssetCount;
          goto LABEL_239;
        case 0x19u:
          v143 = 0;
          v144 = 0;
          v21 = 0;
          v5->_hasBarcodeDetectionAssetCount = 1;
          while (2)
          {
            v145 = *v6;
            v146 = *(_QWORD *)&v4[v145];
            if (v146 == -1 || v146 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__barcodeDetectionAssetCount;
              goto LABEL_238;
            }
            v147 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v146);
            *(_QWORD *)&v4[v145] = v146 + 1;
            v21 |= (unint64_t)(v147 & 0x7F) << v143;
            if (v147 < 0)
            {
              v25 = 0;
              v143 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__barcodeDetectionAssetCount;
              v27 = v144++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__barcodeDetectionAssetCount;
          goto LABEL_239;
        case 0x1Au:
          v148 = 0;
          v149 = 0;
          v21 = 0;
          v5->_hasSculptureAssetCount = 1;
          while (2)
          {
            v150 = *v6;
            v151 = *(_QWORD *)&v4[v150];
            if (v151 == -1 || v151 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__sculptureAssetCount;
              goto LABEL_238;
            }
            v152 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v151);
            *(_QWORD *)&v4[v150] = v151 + 1;
            v21 |= (unint64_t)(v152 & 0x7F) << v148;
            if (v152 < 0)
            {
              v25 = 0;
              v148 += 7;
              v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__sculptureAssetCount;
              v27 = v149++ > 8;
              if (v27)
                goto LABEL_242;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__sculptureAssetCount;
          goto LABEL_239;
        case 0x1Bu:
          v153 = 0;
          v154 = 0;
          v21 = 0;
          v5->_hasSkylineAssetCount = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_273;
          continue;
      }
      while (1)
      {
        v155 = *v6;
        v156 = *(_QWORD *)&v4[v155];
        if (v156 == -1 || v156 >= *(_QWORD *)&v4[*v7])
          break;
        v157 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v156);
        *(_QWORD *)&v4[v155] = v156 + 1;
        v21 |= (unint64_t)(v157 & 0x7F) << v153;
        if ((v157 & 0x80) == 0)
        {
          v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__skylineAssetCount;
          goto LABEL_239;
        }
        v25 = 0;
        v153 += 7;
        v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__skylineAssetCount;
        v27 = v154++ > 8;
        if (v27)
          goto LABEL_242;
      }
      v26 = &OBJC_IVAR___BMPerBatchDomainSpecificAssetCounts__skylineAssetCount;
LABEL_238:
      v4[*v8] = 1;
LABEL_239:
      v25 = v4[*v8] ? 0 : v21;
LABEL_242:
      *(_DWORD *)((char *)&v5->super.super.isa + *v26) = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_273:
    v158 = 0;
  else
LABEL_274:
    v158 = v5;

  return v158;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasParsedAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAnyDomainAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasArtAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNatureAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAnimalsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBirdsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasInsectsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasReptilesAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasMammalsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasLandmarkAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNaturalLandmarkAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasMediaAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBookAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAlbumAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCatsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasDogsAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasApparelAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasFoodAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasStorefrontAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSignSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasLaundryCareSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAutoSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBrandLogoSymbolAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasObject2DAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBarcodeDetectionAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSculptureAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSkylineAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPerBatchDomainSpecificAssetCounts writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPerBatchDomainSpecificAssetCounts)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
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
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  BMPerBatchDomainSpecificAssetCounts *v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  id v166;
  id v167;
  id v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  id v179;
  void *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  void *v185;
  id v186;
  id v187;
  void *v188;
  id v189;
  id v190;
  void *v191;
  id v192;
  id v193;
  void *v194;
  id v195;
  id v196;
  void *v197;
  id v198;
  id v199;
  void *v200;
  id v201;
  id v202;
  void *v203;
  id v204;
  id v205;
  void *v206;
  id v207;
  id v208;
  void *v209;
  id v210;
  id v211;
  id v212;
  id v213;
  void *v214;
  id v215;
  id v216;
  void *v217;
  id v218;
  id v219;
  void *v220;
  id v221;
  id v222;
  void *v223;
  id v224;
  id v225;
  void *v226;
  void *v227;
  uint64_t v228;
  id v229;
  id v230;
  void *v231;
  id v232;
  id v233;
  void *v234;
  id v235;
  id v236;
  void *v237;
  id *v238;
  void *v239;
  uint64_t v240;
  void *v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  uint64_t v249;
  void *v250;
  uint64_t v251;
  void *v252;
  uint64_t v253;
  id v254;
  uint64_t v255;
  id v256;
  uint64_t v257;
  id v258;
  uint64_t v259;
  id v260;
  uint64_t v261;
  id v262;
  uint64_t v263;
  id v264;
  uint64_t v265;
  id v266;
  uint64_t v267;
  id v268;
  uint64_t v269;
  id v270;
  uint64_t v271;
  id v272;
  uint64_t v273;
  id v274;
  uint64_t v275;
  id v276;
  uint64_t v277;
  id v278;
  uint64_t v279;
  id v280;
  uint64_t v281;
  id v282;
  uint64_t v283;
  id v284;
  uint64_t v285;
  id v286;
  uint64_t v287;
  id v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  id v292;
  uint64_t v293;
  id v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  id v298;
  uint64_t v299;
  id v300;
  uint64_t v301;
  _QWORD v302[3];

  v302[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parsedAssetCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v247 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v247 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("anyDomainAssetCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v246 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v246 = v7;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artAssetCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v245 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v245 = v8;
LABEL_10:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("natureAssetCount"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v238 = a4;
          v239 = v9;
          v243 = 0;
LABEL_13:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("animalsAssetCount"));
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            v235 = 0;
            goto LABEL_27;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v235 = v10;
            v10 = 0;
            goto LABEL_27;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v235 = v10;
            v10 = v10;
LABEL_27:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("birdsAssetCount"));
            v11 = objc_claimAutoreleasedReturnValue();
            v241 = v10;
            v237 = (void *)v11;
            if (!v11 || (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v236 = 0;
              goto LABEL_30;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v236 = v12;
LABEL_30:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("insectsAssetCount"));
              v13 = objc_claimAutoreleasedReturnValue();
              v234 = (void *)v13;
              if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v233 = 0;
                goto LABEL_33;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v233 = v14;
LABEL_33:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reptilesAssetCount"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v16 = 0;
                  goto LABEL_36;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v16 = v15;
LABEL_36:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mammalsAssetCount"));
                  v17 = objc_claimAutoreleasedReturnValue();
                  v226 = v15;
                  v231 = (void *)v17;
                  if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v229 = 0;
                    goto LABEL_39;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v229 = v18;
LABEL_39:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("landmarkAssetCount"));
                    v19 = objc_claimAutoreleasedReturnValue();
                    v227 = (void *)v19;
                    if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v224 = 0;
                      goto LABEL_42;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v224 = v20;
LABEL_42:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("naturalLandmarkAssetCount"));
                      v21 = objc_claimAutoreleasedReturnValue();
                      v223 = (void *)v21;
                      if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v221 = 0;
                        goto LABEL_45;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v221 = v22;
LABEL_45:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaAssetCount"));
                        v23 = objc_claimAutoreleasedReturnValue();
                        v220 = (void *)v23;
                        if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v218 = 0;
                          goto LABEL_48;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v218 = v24;
LABEL_48:
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bookAssetCount"));
                          v25 = objc_claimAutoreleasedReturnValue();
                          v217 = (void *)v25;
                          if (!v25 || (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v215 = 0;
                            goto LABEL_51;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v215 = v26;
LABEL_51:
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("albumAssetCount"));
                            v27 = objc_claimAutoreleasedReturnValue();
                            v214 = (void *)v27;
                            if (!v27 || (v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v212 = 0;
                              goto LABEL_54;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v212 = v28;
LABEL_54:
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("catsAssetCount"));
                              v29 = objc_claimAutoreleasedReturnValue();
                              v209 = (void *)v29;
                              if (!v29 || (v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v210 = 0;
                                goto LABEL_57;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v210 = v30;
LABEL_57:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dogsAssetCount"));
                                v31 = objc_claimAutoreleasedReturnValue();
                                v206 = (void *)v31;
                                if (!v31 || (v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v207 = 0;
                                  goto LABEL_60;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v207 = v32;
LABEL_60:
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("apparelAssetCount"));
                                  v33 = objc_claimAutoreleasedReturnValue();
                                  v203 = (void *)v33;
                                  if (!v33
                                    || (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v204 = 0;
                                    goto LABEL_63;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v204 = v34;
LABEL_63:
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("foodAssetCount"));
                                    v35 = objc_claimAutoreleasedReturnValue();
                                    v200 = (void *)v35;
                                    if (!v35
                                      || (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v201 = 0;
                                      goto LABEL_66;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v201 = v36;
LABEL_66:
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storefrontAssetCount"));
                                      v37 = objc_claimAutoreleasedReturnValue();
                                      v197 = (void *)v37;
                                      if (!v37
                                        || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v198 = 0;
                                        goto LABEL_69;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v198 = v38;
LABEL_69:
                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("signSymbolAssetCount"));
                                        v39 = objc_claimAutoreleasedReturnValue();
                                        v194 = (void *)v39;
                                        if (!v39
                                          || (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v195 = 0;
                                          goto LABEL_72;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v195 = v40;
LABEL_72:
                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("laundryCareSymbolAssetCount"));
                                          v41 = objc_claimAutoreleasedReturnValue();
                                          v191 = (void *)v41;
                                          if (!v41
                                            || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v192 = 0;
                                            goto LABEL_75;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v192 = v42;
LABEL_75:
                                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("autoSymbolAssetCount"));
                                            v43 = objc_claimAutoreleasedReturnValue();
                                            v188 = (void *)v43;
                                            if (!v43
                                              || (v44 = (void *)v43,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v189 = 0;
                                              goto LABEL_78;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v189 = v44;
LABEL_78:
                                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("brandLogoSymbolAssetCount"));
                                              v45 = objc_claimAutoreleasedReturnValue();
                                              v185 = (void *)v45;
                                              if (!v45
                                                || (v46 = (void *)v45,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v186 = 0;
                                                goto LABEL_81;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v186 = v46;
LABEL_81:
                                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("object2DAssetCount"));
                                                v47 = objc_claimAutoreleasedReturnValue();
                                                v180 = (void *)v47;
                                                if (!v47
                                                  || (v48 = (void *)v47,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v183 = 0;
                                                  goto LABEL_84;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v183 = v48;
LABEL_84:
                                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("barcodeDetectionAssetCount"));
                                                  v49 = objc_claimAutoreleasedReturnValue();
                                                  v177 = (void *)v49;
                                                  if (!v49
                                                    || (v50 = (void *)v49,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v181 = 0;
                                                    goto LABEL_87;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v181 = v50;
LABEL_87:
                                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sculptureAssetCount"));
                                                    v51 = objc_claimAutoreleasedReturnValue();
                                                    v176 = (void *)v51;
                                                    if (!v51
                                                      || (v52 = (void *)v51,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v178 = 0;
LABEL_90:
                                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("skylineAssetCount"));
                                                      v53 = (id)objc_claimAutoreleasedReturnValue();
                                                      v175 = v53;
                                                      if (!v53)
                                                      {
LABEL_93:
                                                        v55 = v239;
LABEL_94:
                                                        v56 = v53;
                                                        v57 = objc_retain(-[BMPerBatchDomainSpecificAssetCounts initWithParsedAssetCount:anyDomainAssetCount:artAssetCount:natureAssetCount:animalsAssetCount:birdsAssetCount:insectsAssetCount:reptilesAssetCount:mammalsAssetCount:landmarkAssetCount:naturalLandmarkAssetCount:mediaAssetCount:bookAssetCount:albumAssetCount:catsAssetCount:dogsAssetCount:apparelAssetCount:foodAssetCount:storefrontAssetCount:signSymbolAssetCount:laundryCareSymbolAssetCount:autoSymbolAssetCount:brandLogoSymbolAssetCount:object2DAssetCount:barcodeDetectionAssetCount:sculptureAssetCount:skylineAssetCount:](self, "initWithParsedAssetCount:anyDomainAssetCount:artAssetCount:natureAssetCount:animalsAssetCount:birdsAssetCount:insectsAssetCount:reptilesAssetCount:mammalsAssetCount:landmarkAssetCount:naturalLandmarkAssetCount:mediaAssetCount:bookAssetCount:albumAssetCount:catsAssetCount:dogsAssetCount:apparelAssetCount:foodAssetCount:storefrontAssetCount:signSymbolAssetCount:laundryCareSymbolAssetCount:autoSymbolAssetCount:brandLogoSymbolAssetCount:object2DAssetCount:barcodeDetectionAssetCount:sculptureAssetCount:skylineAssetCount:", v247, v246, v245, v243, v10, v236, v233,
                                                                  v16,
                                                                  v229,
                                                                  v224,
                                                                  v221,
                                                                  v218,
                                                                  v215,
                                                                  v212,
                                                                  v210,
                                                                  v207,
                                                                  v204,
                                                                  v201,
                                                                  v198,
                                                                  v195,
                                                                  v192,
                                                                  v189,
                                                                  v186,
                                                                  v183,
                                                                  v181,
                                                                  v178,
                                                                  v53));
                                                        self = v57;
                                                        v10 = v235;
LABEL_230:

LABEL_231:
LABEL_232:

LABEL_233:
LABEL_234:

LABEL_235:
                                                        goto LABEL_236;
                                                      }
                                                      v54 = v53;
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v53 = 0;
                                                        goto LABEL_93;
                                                      }
                                                      objc_opt_class();
                                                      v55 = v239;
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v53 = v54;
                                                        goto LABEL_94;
                                                      }
                                                      if (v238)
                                                      {
                                                        v167 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v168 = v16;
                                                        v169 = *MEMORY[0x1E0D025B8];
                                                        v249 = *MEMORY[0x1E0CB2D50];
                                                        v170 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("skylineAssetCount"));
                                                        v250 = v170;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v250, &v249, 1);
                                                        v171 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v172 = v167;
                                                        v55 = v239;
                                                        v173 = v169;
                                                        v16 = v168;
                                                        *v238 = (id)objc_msgSend(v172, "initWithDomain:code:userInfo:", v173, 2, v171);

                                                      }
                                                      v56 = 0;
                                                      v57 = 0;
LABEL_229:
                                                      v10 = v235;
                                                      v15 = v226;
                                                      goto LABEL_230;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v178 = v52;
                                                      goto LABEL_90;
                                                    }
                                                    if (v238)
                                                    {
                                                      v179 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v162 = v16;
                                                      v163 = *MEMORY[0x1E0D025B8];
                                                      v251 = *MEMORY[0x1E0CB2D50];
                                                      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sculptureAssetCount"));
                                                      v252 = v56;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v252, &v251, 1);
                                                      v164 = objc_claimAutoreleasedReturnValue();
                                                      v165 = v163;
                                                      v16 = v162;
                                                      v175 = (void *)v164;
                                                      v166 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v165, 2);
                                                      v57 = 0;
                                                      v178 = 0;
                                                      *v238 = v166;
                                                      v55 = v239;
                                                      goto LABEL_229;
                                                    }
                                                    v178 = 0;
                                                    v57 = 0;
LABEL_266:
                                                    v55 = v239;
                                                    v10 = v235;
                                                    goto LABEL_231;
                                                  }
                                                  if (v238)
                                                  {
                                                    v182 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v157 = v16;
                                                    v158 = *MEMORY[0x1E0D025B8];
                                                    v253 = *MEMORY[0x1E0CB2D50];
                                                    v178 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("barcodeDetectionAssetCount"));
                                                    v254 = v178;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v254, &v253, 1);
                                                    v159 = objc_claimAutoreleasedReturnValue();
                                                    v160 = v158;
                                                    v16 = v157;
                                                    v176 = (void *)v159;
                                                    v161 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v160, 2);
                                                    v57 = 0;
                                                    v181 = 0;
                                                    *v238 = v161;
                                                    goto LABEL_266;
                                                  }
                                                  v181 = 0;
                                                  v57 = 0;
LABEL_264:
                                                  v55 = v239;
                                                  v10 = v235;
                                                  goto LABEL_232;
                                                }
                                                if (v238)
                                                {
                                                  v184 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v152 = v16;
                                                  v153 = *MEMORY[0x1E0D025B8];
                                                  v255 = *MEMORY[0x1E0CB2D50];
                                                  v181 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("object2DAssetCount"));
                                                  v256 = v181;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v256, &v255, 1);
                                                  v154 = objc_claimAutoreleasedReturnValue();
                                                  v155 = v153;
                                                  v16 = v152;
                                                  v177 = (void *)v154;
                                                  v156 = (id)objc_msgSend(v184, "initWithDomain:code:userInfo:", v155, 2);
                                                  v57 = 0;
                                                  v183 = 0;
                                                  *v238 = v156;
                                                  goto LABEL_264;
                                                }
                                                v183 = 0;
                                                v57 = 0;
LABEL_262:
                                                v55 = v239;
                                                v10 = v235;
                                                goto LABEL_233;
                                              }
                                              if (v238)
                                              {
                                                v187 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v147 = v16;
                                                v148 = *MEMORY[0x1E0D025B8];
                                                v257 = *MEMORY[0x1E0CB2D50];
                                                v183 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("brandLogoSymbolAssetCount"));
                                                v258 = v183;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
                                                v149 = objc_claimAutoreleasedReturnValue();
                                                v150 = v148;
                                                v16 = v147;
                                                v180 = (void *)v149;
                                                v151 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v150, 2);
                                                v57 = 0;
                                                v186 = 0;
                                                *v238 = v151;
                                                goto LABEL_262;
                                              }
                                              v186 = 0;
                                              v57 = 0;
LABEL_260:
                                              v55 = v239;
                                              v10 = v235;
                                              goto LABEL_234;
                                            }
                                            if (v238)
                                            {
                                              v190 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v142 = v16;
                                              v143 = *MEMORY[0x1E0D025B8];
                                              v259 = *MEMORY[0x1E0CB2D50];
                                              v186 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("autoSymbolAssetCount"));
                                              v260 = v186;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v260, &v259, 1);
                                              v144 = objc_claimAutoreleasedReturnValue();
                                              v145 = v143;
                                              v16 = v142;
                                              v185 = (void *)v144;
                                              v146 = (id)objc_msgSend(v190, "initWithDomain:code:userInfo:", v145, 2);
                                              v57 = 0;
                                              v189 = 0;
                                              *v238 = v146;
                                              goto LABEL_260;
                                            }
                                            v189 = 0;
                                            v57 = 0;
LABEL_258:
                                            v55 = v239;
                                            v10 = v235;
                                            goto LABEL_235;
                                          }
                                          if (v238)
                                          {
                                            v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v137 = v16;
                                            v138 = *MEMORY[0x1E0D025B8];
                                            v261 = *MEMORY[0x1E0CB2D50];
                                            v189 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("laundryCareSymbolAssetCount"));
                                            v262 = v189;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v262, &v261, 1);
                                            v139 = objc_claimAutoreleasedReturnValue();
                                            v140 = v138;
                                            v16 = v137;
                                            v188 = (void *)v139;
                                            v141 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v140, 2);
                                            v57 = 0;
                                            v192 = 0;
                                            *v238 = v141;
                                            goto LABEL_258;
                                          }
                                          v192 = 0;
                                          v57 = 0;
LABEL_225:
                                          v55 = v239;
                                          v10 = v235;
LABEL_236:

                                          goto LABEL_237;
                                        }
                                        if (v238)
                                        {
                                          v196 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v132 = v16;
                                          v133 = *MEMORY[0x1E0D025B8];
                                          v263 = *MEMORY[0x1E0CB2D50];
                                          v192 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("signSymbolAssetCount"));
                                          v264 = v192;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v264, &v263, 1);
                                          v134 = objc_claimAutoreleasedReturnValue();
                                          v135 = v133;
                                          v16 = v132;
                                          v191 = (void *)v134;
                                          v136 = (id)objc_msgSend(v196, "initWithDomain:code:userInfo:", v135, 2);
                                          v57 = 0;
                                          v195 = 0;
                                          *v238 = v136;
                                          goto LABEL_225;
                                        }
                                        v195 = 0;
                                        v57 = 0;
LABEL_221:
                                        v55 = v239;
                                        v10 = v235;
LABEL_237:

                                        goto LABEL_238;
                                      }
                                      if (v238)
                                      {
                                        v199 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v127 = v16;
                                        v128 = *MEMORY[0x1E0D025B8];
                                        v265 = *MEMORY[0x1E0CB2D50];
                                        v195 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("storefrontAssetCount"));
                                        v266 = v195;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v266, &v265, 1);
                                        v129 = objc_claimAutoreleasedReturnValue();
                                        v130 = v128;
                                        v16 = v127;
                                        v194 = (void *)v129;
                                        v131 = (id)objc_msgSend(v199, "initWithDomain:code:userInfo:", v130, 2);
                                        v57 = 0;
                                        v198 = 0;
                                        *v238 = v131;
                                        goto LABEL_221;
                                      }
                                      v198 = 0;
                                      v57 = 0;
LABEL_217:
                                      v55 = v239;
                                      v10 = v235;
LABEL_238:

                                      goto LABEL_239;
                                    }
                                    if (v238)
                                    {
                                      v202 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v122 = v16;
                                      v123 = *MEMORY[0x1E0D025B8];
                                      v267 = *MEMORY[0x1E0CB2D50];
                                      v198 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("foodAssetCount"));
                                      v268 = v198;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v268, &v267, 1);
                                      v124 = objc_claimAutoreleasedReturnValue();
                                      v125 = v123;
                                      v16 = v122;
                                      v197 = (void *)v124;
                                      v126 = (id)objc_msgSend(v202, "initWithDomain:code:userInfo:", v125, 2);
                                      v57 = 0;
                                      v201 = 0;
                                      *v238 = v126;
                                      goto LABEL_217;
                                    }
                                    v201 = 0;
                                    v57 = 0;
LABEL_213:
                                    v55 = v239;
                                    v10 = v235;
LABEL_239:

                                    goto LABEL_240;
                                  }
                                  if (v238)
                                  {
                                    v205 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v117 = v16;
                                    v118 = *MEMORY[0x1E0D025B8];
                                    v269 = *MEMORY[0x1E0CB2D50];
                                    v201 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("apparelAssetCount"));
                                    v270 = v201;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v270, &v269, 1);
                                    v119 = objc_claimAutoreleasedReturnValue();
                                    v120 = v118;
                                    v16 = v117;
                                    v200 = (void *)v119;
                                    v121 = (id)objc_msgSend(v205, "initWithDomain:code:userInfo:", v120, 2);
                                    v57 = 0;
                                    v204 = 0;
                                    *v238 = v121;
                                    goto LABEL_213;
                                  }
                                  v204 = 0;
                                  v57 = 0;
LABEL_207:
                                  v55 = v239;
                                  v10 = v235;
LABEL_240:

                                  goto LABEL_241;
                                }
                                if (v238)
                                {
                                  v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v112 = v16;
                                  v113 = *MEMORY[0x1E0D025B8];
                                  v271 = *MEMORY[0x1E0CB2D50];
                                  v204 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("dogsAssetCount"));
                                  v272 = v204;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v272, &v271, 1);
                                  v114 = objc_claimAutoreleasedReturnValue();
                                  v115 = v113;
                                  v16 = v112;
                                  v203 = (void *)v114;
                                  v116 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v115, 2);
                                  v57 = 0;
                                  v207 = 0;
                                  *v238 = v116;
                                  goto LABEL_207;
                                }
                                v207 = 0;
                                v57 = 0;
LABEL_201:
                                v55 = v239;
                                v10 = v235;
LABEL_241:

                                goto LABEL_242;
                              }
                              if (v238)
                              {
                                v211 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v107 = v16;
                                v108 = *MEMORY[0x1E0D025B8];
                                v273 = *MEMORY[0x1E0CB2D50];
                                v207 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("catsAssetCount"));
                                v274 = v207;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v274, &v273, 1);
                                v109 = objc_claimAutoreleasedReturnValue();
                                v110 = v108;
                                v16 = v107;
                                v206 = (void *)v109;
                                v111 = (id)objc_msgSend(v211, "initWithDomain:code:userInfo:", v110, 2);
                                v57 = 0;
                                v210 = 0;
                                *v238 = v111;
                                goto LABEL_201;
                              }
                              v210 = 0;
                              v57 = 0;
LABEL_195:
                              v55 = v239;
                              v10 = v235;
LABEL_242:

                              goto LABEL_243;
                            }
                            if (v238)
                            {
                              v213 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v102 = v16;
                              v103 = *MEMORY[0x1E0D025B8];
                              v275 = *MEMORY[0x1E0CB2D50];
                              v210 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("albumAssetCount"));
                              v276 = v210;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v276, &v275, 1);
                              v104 = objc_claimAutoreleasedReturnValue();
                              v105 = v103;
                              v16 = v102;
                              v209 = (void *)v104;
                              v106 = (id)objc_msgSend(v213, "initWithDomain:code:userInfo:", v105, 2);
                              v57 = 0;
                              v212 = 0;
                              *v238 = v106;
                              goto LABEL_195;
                            }
                            v212 = 0;
                            v57 = 0;
LABEL_189:
                            v55 = v239;
                            v10 = v235;
LABEL_243:

                            goto LABEL_244;
                          }
                          if (v238)
                          {
                            v216 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v97 = v16;
                            v98 = *MEMORY[0x1E0D025B8];
                            v277 = *MEMORY[0x1E0CB2D50];
                            v212 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bookAssetCount"));
                            v278 = v212;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v278, &v277, 1);
                            v99 = objc_claimAutoreleasedReturnValue();
                            v100 = v98;
                            v16 = v97;
                            v214 = (void *)v99;
                            v101 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v100, 2);
                            v57 = 0;
                            v215 = 0;
                            *v238 = v101;
                            goto LABEL_189;
                          }
                          v215 = 0;
                          v57 = 0;
LABEL_183:
                          v55 = v239;
                          v10 = v235;
LABEL_244:

                          goto LABEL_245;
                        }
                        if (v238)
                        {
                          v219 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v92 = v16;
                          v93 = *MEMORY[0x1E0D025B8];
                          v279 = *MEMORY[0x1E0CB2D50];
                          v215 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mediaAssetCount"));
                          v280 = v215;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v280, &v279, 1);
                          v94 = objc_claimAutoreleasedReturnValue();
                          v95 = v93;
                          v16 = v92;
                          v217 = (void *)v94;
                          v96 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v95, 2);
                          v57 = 0;
                          v218 = 0;
                          *v238 = v96;
                          goto LABEL_183;
                        }
                        v218 = 0;
                        v57 = 0;
LABEL_177:
                        v55 = v239;
                        v10 = v235;
LABEL_245:

                        goto LABEL_246;
                      }
                      if (v238)
                      {
                        v222 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v87 = v16;
                        v88 = *MEMORY[0x1E0D025B8];
                        v281 = *MEMORY[0x1E0CB2D50];
                        v218 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("naturalLandmarkAssetCount"));
                        v282 = v218;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v282, &v281, 1);
                        v89 = objc_claimAutoreleasedReturnValue();
                        v90 = v88;
                        v16 = v87;
                        v220 = (void *)v89;
                        v91 = (id)objc_msgSend(v222, "initWithDomain:code:userInfo:", v90, 2);
                        v57 = 0;
                        v221 = 0;
                        *v238 = v91;
                        goto LABEL_177;
                      }
                      v221 = 0;
                      v57 = 0;
LABEL_171:
                      v55 = v239;
                      v10 = v235;
LABEL_246:

                      goto LABEL_247;
                    }
                    if (v238)
                    {
                      v225 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v82 = v16;
                      v83 = *MEMORY[0x1E0D025B8];
                      v283 = *MEMORY[0x1E0CB2D50];
                      v221 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("landmarkAssetCount"));
                      v284 = v221;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v284, &v283, 1);
                      v84 = objc_claimAutoreleasedReturnValue();
                      v85 = v83;
                      v16 = v82;
                      v223 = (void *)v84;
                      v86 = (id)objc_msgSend(v225, "initWithDomain:code:userInfo:", v85, 2);
                      v57 = 0;
                      v224 = 0;
                      *v238 = v86;
                      goto LABEL_171;
                    }
                    v224 = 0;
                    v57 = 0;
LABEL_165:
                    v55 = v239;
                    v10 = v235;
LABEL_247:

                    goto LABEL_248;
                  }
                  if (v238)
                  {
                    v230 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v77 = v16;
                    v78 = *MEMORY[0x1E0D025B8];
                    v285 = *MEMORY[0x1E0CB2D50];
                    v224 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mammalsAssetCount"));
                    v286 = v224;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v286, &v285, 1);
                    v79 = objc_claimAutoreleasedReturnValue();
                    v80 = v78;
                    v16 = v77;
                    v227 = (void *)v79;
                    v81 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v80, 2);
                    v57 = 0;
                    v229 = 0;
                    *v238 = v81;
                    goto LABEL_165;
                  }
                  v229 = 0;
                  v57 = 0;
                  v55 = v239;
                  v10 = v235;
LABEL_248:

                  goto LABEL_249;
                }
                v16 = v238;
                if (v238)
                {
                  v232 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v228 = *MEMORY[0x1E0D025B8];
                  v287 = *MEMORY[0x1E0CB2D50];
                  v229 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("reptilesAssetCount"));
                  v288 = v229;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v288, &v287, 1);
                  v75 = objc_claimAutoreleasedReturnValue();
                  v76 = v232;
                  v231 = (void *)v75;
                  v57 = 0;
                  *v238 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v228, 2);
                  v16 = 0;
                  v55 = v239;
                  v10 = v235;
                  goto LABEL_248;
                }
                v57 = 0;
LABEL_154:
                v55 = v239;
                v10 = v235;
LABEL_249:

                goto LABEL_250;
              }
              if (v238)
              {
                v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v71 = *MEMORY[0x1E0D025B8];
                v289 = *MEMORY[0x1E0CB2D50];
                v72 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("insectsAssetCount"));
                v290 = v72;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
                v73 = objc_claimAutoreleasedReturnValue();
                v74 = v71;
                v16 = (id)v72;
                v57 = 0;
                v233 = 0;
                *v238 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v74, 2, v73);
                v15 = (void *)v73;
                goto LABEL_154;
              }
              v233 = 0;
              v57 = 0;
LABEL_148:
              v55 = v239;
              v10 = v235;
LABEL_250:

              goto LABEL_251;
            }
            if (v238)
            {
              v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v69 = *MEMORY[0x1E0D025B8];
              v291 = *MEMORY[0x1E0CB2D50];
              v233 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("birdsAssetCount"));
              v292 = v233;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
              v234 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = 0;
              v236 = 0;
              *v238 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2);
              goto LABEL_148;
            }
            v236 = 0;
            v57 = 0;
            v55 = v239;
            v10 = v235;
LABEL_251:

            goto LABEL_252;
          }
          if (v238)
          {
            v242 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v66 = *MEMORY[0x1E0D025B8];
            v293 = *MEMORY[0x1E0CB2D50];
            v236 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("animalsAssetCount"));
            v294 = v236;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v294, &v293, 1);
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (id)objc_msgSend(v242, "initWithDomain:code:userInfo:", v66, 2);
            v57 = 0;
            v241 = 0;
            *v238 = v67;
            v55 = v239;
            goto LABEL_251;
          }
          v241 = 0;
          v57 = 0;
          v55 = v239;
LABEL_252:

          goto LABEL_253;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v238 = a4;
          v239 = v9;
          v243 = v9;
          goto LABEL_13;
        }
        v55 = v9;
        if (a4)
        {
          v244 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v240 = *MEMORY[0x1E0D025B8];
          v295 = *MEMORY[0x1E0CB2D50];
          v64 = a4;
          v241 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("natureAssetCount"));
          v296 = v241;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v65 = (id)objc_msgSend(v244, "initWithDomain:code:userInfo:", v240, 2, v10);
          v57 = 0;
          v243 = 0;
          *v64 = v65;
          goto LABEL_252;
        }
        v243 = 0;
        v57 = 0;
LABEL_253:

        goto LABEL_254;
      }
      if (a4)
      {
        v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v63 = *MEMORY[0x1E0D025B8];
        v297 = *MEMORY[0x1E0CB2D50];
        v243 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("artAssetCount"));
        v298 = v243;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v245 = 0;
        *a4 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2, v55);
        goto LABEL_253;
      }
      v245 = 0;
      v57 = 0;
LABEL_254:

      goto LABEL_255;
    }
    if (a4)
    {
      v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v61 = *MEMORY[0x1E0D025B8];
      v299 = *MEMORY[0x1E0CB2D50];
      v245 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("anyDomainAssetCount"));
      v300 = v245;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v300, &v299, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0;
      v246 = 0;
      *a4 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2, v8);
      goto LABEL_254;
    }
    v246 = 0;
    v57 = 0;
LABEL_255:

    goto LABEL_256;
  }
  if (a4)
  {
    v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v59 = *MEMORY[0x1E0D025B8];
    v301 = *MEMORY[0x1E0CB2D50];
    v246 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("parsedAssetCount"));
    v302[0] = v246;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v302, &v301, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v247 = 0;
    *a4 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 2, v7);
    goto LABEL_255;
  }
  v57 = 0;
  v247 = 0;
LABEL_256:

  return v57;
}

- (id)jsonDictionary
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[27];
  _QWORD v90[29];

  v90[27] = *MEMORY[0x1E0C80C00];
  if (-[BMPerBatchDomainSpecificAssetCounts hasParsedAssetCount](self, "hasParsedAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts parsedAssetCount](self, "parsedAssetCount"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasAnyDomainAssetCount](self, "hasAnyDomainAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts anyDomainAssetCount](self, "anyDomainAssetCount"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasArtAssetCount](self, "hasArtAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts artAssetCount](self, "artAssetCount"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasNatureAssetCount](self, "hasNatureAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts natureAssetCount](self, "natureAssetCount"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasAnimalsAssetCount](self, "hasAnimalsAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts animalsAssetCount](self, "animalsAssetCount"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasBirdsAssetCount](self, "hasBirdsAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts birdsAssetCount](self, "birdsAssetCount"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasInsectsAssetCount](self, "hasInsectsAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts insectsAssetCount](self, "insectsAssetCount"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasReptilesAssetCount](self, "hasReptilesAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts reptilesAssetCount](self, "reptilesAssetCount"));
    v88 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v88 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasMammalsAssetCount](self, "hasMammalsAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mammalsAssetCount](self, "mammalsAssetCount"));
    v87 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v87 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasLandmarkAssetCount](self, "hasLandmarkAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts landmarkAssetCount](self, "landmarkAssetCount"));
    v86 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v86 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasNaturalLandmarkAssetCount](self, "hasNaturalLandmarkAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts naturalLandmarkAssetCount](self, "naturalLandmarkAssetCount"));
    v85 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v85 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasMediaAssetCount](self, "hasMediaAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts mediaAssetCount](self, "mediaAssetCount"));
    v84 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v84 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasBookAssetCount](self, "hasBookAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts bookAssetCount](self, "bookAssetCount"));
    v83 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v83 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasAlbumAssetCount](self, "hasAlbumAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts albumAssetCount](self, "albumAssetCount"));
    v82 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v82 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasCatsAssetCount](self, "hasCatsAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts catsAssetCount](self, "catsAssetCount"));
    v81 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v81 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasDogsAssetCount](self, "hasDogsAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts dogsAssetCount](self, "dogsAssetCount"));
    v80 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasApparelAssetCount](self, "hasApparelAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts apparelAssetCount](self, "apparelAssetCount"));
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v79 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasFoodAssetCount](self, "hasFoodAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts foodAssetCount](self, "foodAssetCount"));
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v78 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasStorefrontAssetCount](self, "hasStorefrontAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts storefrontAssetCount](self, "storefrontAssetCount"));
    v77 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v77 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasSignSymbolAssetCount](self, "hasSignSymbolAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts signSymbolAssetCount](self, "signSymbolAssetCount"));
    v76 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasLaundryCareSymbolAssetCount](self, "hasLaundryCareSymbolAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts laundryCareSymbolAssetCount](self, "laundryCareSymbolAssetCount"));
    v75 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v75 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasAutoSymbolAssetCount](self, "hasAutoSymbolAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts autoSymbolAssetCount](self, "autoSymbolAssetCount"));
    v74 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasBrandLogoSymbolAssetCount](self, "hasBrandLogoSymbolAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts brandLogoSymbolAssetCount](self, "brandLogoSymbolAssetCount"));
    v73 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v73 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasObject2DAssetCount](self, "hasObject2DAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts object2DAssetCount](self, "object2DAssetCount"));
    v72 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v72 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasBarcodeDetectionAssetCount](self, "hasBarcodeDetectionAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts barcodeDetectionAssetCount](self, "barcodeDetectionAssetCount"));
    v71 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v71 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasSculptureAssetCount](self, "hasSculptureAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts sculptureAssetCount](self, "sculptureAssetCount"));
    v70 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v70 = 0;
  }
  if (-[BMPerBatchDomainSpecificAssetCounts hasSkylineAssetCount](self, "hasSkylineAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPerBatchDomainSpecificAssetCounts skylineAssetCount](self, "skylineAssetCount"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v89[0] = CFSTR("parsedAssetCount");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v11;
  v90[0] = v11;
  v89[1] = CFSTR("anyDomainAssetCount");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v12;
  v90[1] = v12;
  v89[2] = CFSTR("artAssetCount");
  v13 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v13;
  v90[2] = v13;
  v89[3] = CFSTR("natureAssetCount");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v14;
  v90[3] = v14;
  v89[4] = CFSTR("animalsAssetCount");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v15;
  v90[4] = v15;
  v89[5] = CFSTR("birdsAssetCount");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v16;
  v90[5] = v16;
  v89[6] = CFSTR("insectsAssetCount");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v17;
  v90[6] = v17;
  v89[7] = CFSTR("reptilesAssetCount");
  v18 = (uint64_t)v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v90[7] = v18;
  v89[8] = CFSTR("mammalsAssetCount");
  v19 = (uint64_t)v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v90[8] = v19;
  v89[9] = CFSTR("landmarkAssetCount");
  v20 = (uint64_t)v86;
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v64 = v9;
  v53 = (void *)v20;
  v90[9] = v20;
  v89[10] = CFSTR("naturalLandmarkAssetCount");
  v21 = (uint64_t)v85;
  if (!v85)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = v7;
  v66 = (void *)v21;
  v90[10] = v21;
  v89[11] = CFSTR("mediaAssetCount");
  v23 = (uint64_t)v84;
  if (!v84)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = v3;
  v65 = (void *)v23;
  v90[11] = v23;
  v89[12] = CFSTR("bookAssetCount");
  v25 = (uint64_t)v83;
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v25;
  v90[12] = v25;
  v89[13] = CFSTR("albumAssetCount");
  v27 = (uint64_t)v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v27;
  v90[13] = v27;
  v89[14] = CFSTR("catsAssetCount");
  v28 = (uint64_t)v81;
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v28;
  v90[14] = v28;
  v89[15] = CFSTR("dogsAssetCount");
  v29 = (uint64_t)v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v29;
  v90[15] = v29;
  v89[16] = CFSTR("apparelAssetCount");
  v30 = (uint64_t)v79;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v68 = v4;
  v49 = (void *)v30;
  v90[16] = v30;
  v89[17] = CFSTR("foodAssetCount");
  v31 = (uint64_t)v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v31;
  v90[17] = v31;
  v89[18] = CFSTR("storefrontAssetCount");
  v32 = (uint64_t)v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v67 = v5;
  v47 = (void *)v32;
  v90[18] = v32;
  v89[19] = CFSTR("signSymbolAssetCount");
  v33 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v33;
  v90[19] = v33;
  v89[20] = CFSTR("laundryCareSymbolAssetCount");
  v34 = (uint64_t)v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v69 = v10;
  v45 = (void *)v34;
  v90[20] = v34;
  v89[21] = CFSTR("autoSymbolAssetCount");
  v35 = (uint64_t)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v19;
  v44 = (void *)v35;
  v90[21] = v35;
  v89[22] = CFSTR("brandLogoSymbolAssetCount");
  v36 = v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v18;
  v90[22] = v36;
  v89[23] = CFSTR("object2DAssetCount");
  v37 = v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v22;
  v90[23] = v37;
  v89[24] = CFSTR("barcodeDetectionAssetCount");
  v39 = v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v90[24] = v39;
  v89[25] = CFSTR("sculptureAssetCount");
  v40 = v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v90[25] = v40;
  v89[26] = CFSTR("skylineAssetCount");
  v41 = v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v90[26] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 27);
  v63 = (id)objc_claimAutoreleasedReturnValue();
  if (!v69)

  v42 = v26;
  if (!v70)
  {

    v42 = v26;
  }
  if (!v71)
  {

    v42 = v26;
  }
  if (!v72)
  {

    v42 = v26;
  }
  if (!v73)
  {

    v42 = v26;
  }
  if (!v74)
  {

    v42 = v26;
  }
  if (!v75)
  {

    v42 = v26;
  }
  if (!v76)
  {

    v42 = v26;
  }
  if (!v77)
  {

    v42 = v26;
  }
  if (!v78)
  {

    v42 = v26;
  }
  if (!v79)
  {

    v42 = v26;
  }
  if (!v80)
  {

    v42 = v26;
  }
  if (!v81)
  {

    v42 = v26;
  }
  if (!v82)
  {

    v42 = v26;
  }
  if (!v83)

  if (!v84)
  if (!v85)

  if (!v86)
  if (!v87)

  if (v88)
  {
    if (v64)
      goto LABEL_176;
  }
  else
  {

    if (v64)
    {
LABEL_176:
      if (v8)
        goto LABEL_177;
      goto LABEL_185;
    }
  }

  if (v8)
  {
LABEL_177:
    if (v38)
      goto LABEL_178;
    goto LABEL_186;
  }
LABEL_185:

  if (v38)
  {
LABEL_178:
    if (v6)
      goto LABEL_179;
    goto LABEL_187;
  }
LABEL_186:

  if (v6)
  {
LABEL_179:
    if (v67)
      goto LABEL_180;
    goto LABEL_188;
  }
LABEL_187:

  if (v67)
  {
LABEL_180:
    if (v68)
      goto LABEL_181;
LABEL_189:

    if (v24)
      goto LABEL_182;
LABEL_190:

    goto LABEL_182;
  }
LABEL_188:

  if (!v68)
    goto LABEL_189;
LABEL_181:
  if (!v24)
    goto LABEL_190;
LABEL_182:

  return v63;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  BOOL v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMPerBatchDomainSpecificAssetCounts hasParsedAssetCount](self, "hasParsedAssetCount")
      || objc_msgSend(v5, "hasParsedAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasParsedAssetCount](self, "hasParsedAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasParsedAssetCount"))
        goto LABEL_138;
      v6 = -[BMPerBatchDomainSpecificAssetCounts parsedAssetCount](self, "parsedAssetCount");
      if (v6 != objc_msgSend(v5, "parsedAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasAnyDomainAssetCount](self, "hasAnyDomainAssetCount")
      || objc_msgSend(v5, "hasAnyDomainAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasAnyDomainAssetCount](self, "hasAnyDomainAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasAnyDomainAssetCount"))
        goto LABEL_138;
      v7 = -[BMPerBatchDomainSpecificAssetCounts anyDomainAssetCount](self, "anyDomainAssetCount");
      if (v7 != objc_msgSend(v5, "anyDomainAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasArtAssetCount](self, "hasArtAssetCount")
      || objc_msgSend(v5, "hasArtAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasArtAssetCount](self, "hasArtAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasArtAssetCount"))
        goto LABEL_138;
      v8 = -[BMPerBatchDomainSpecificAssetCounts artAssetCount](self, "artAssetCount");
      if (v8 != objc_msgSend(v5, "artAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasNatureAssetCount](self, "hasNatureAssetCount")
      || objc_msgSend(v5, "hasNatureAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasNatureAssetCount](self, "hasNatureAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasNatureAssetCount"))
        goto LABEL_138;
      v9 = -[BMPerBatchDomainSpecificAssetCounts natureAssetCount](self, "natureAssetCount");
      if (v9 != objc_msgSend(v5, "natureAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasAnimalsAssetCount](self, "hasAnimalsAssetCount")
      || objc_msgSend(v5, "hasAnimalsAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasAnimalsAssetCount](self, "hasAnimalsAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasAnimalsAssetCount"))
        goto LABEL_138;
      v10 = -[BMPerBatchDomainSpecificAssetCounts animalsAssetCount](self, "animalsAssetCount");
      if (v10 != objc_msgSend(v5, "animalsAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasBirdsAssetCount](self, "hasBirdsAssetCount")
      || objc_msgSend(v5, "hasBirdsAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasBirdsAssetCount](self, "hasBirdsAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasBirdsAssetCount"))
        goto LABEL_138;
      v11 = -[BMPerBatchDomainSpecificAssetCounts birdsAssetCount](self, "birdsAssetCount");
      if (v11 != objc_msgSend(v5, "birdsAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasInsectsAssetCount](self, "hasInsectsAssetCount")
      || objc_msgSend(v5, "hasInsectsAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasInsectsAssetCount](self, "hasInsectsAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasInsectsAssetCount"))
        goto LABEL_138;
      v12 = -[BMPerBatchDomainSpecificAssetCounts insectsAssetCount](self, "insectsAssetCount");
      if (v12 != objc_msgSend(v5, "insectsAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasReptilesAssetCount](self, "hasReptilesAssetCount")
      || objc_msgSend(v5, "hasReptilesAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasReptilesAssetCount](self, "hasReptilesAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasReptilesAssetCount"))
        goto LABEL_138;
      v13 = -[BMPerBatchDomainSpecificAssetCounts reptilesAssetCount](self, "reptilesAssetCount");
      if (v13 != objc_msgSend(v5, "reptilesAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasMammalsAssetCount](self, "hasMammalsAssetCount")
      || objc_msgSend(v5, "hasMammalsAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasMammalsAssetCount](self, "hasMammalsAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasMammalsAssetCount"))
        goto LABEL_138;
      v14 = -[BMPerBatchDomainSpecificAssetCounts mammalsAssetCount](self, "mammalsAssetCount");
      if (v14 != objc_msgSend(v5, "mammalsAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasLandmarkAssetCount](self, "hasLandmarkAssetCount")
      || objc_msgSend(v5, "hasLandmarkAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasLandmarkAssetCount](self, "hasLandmarkAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasLandmarkAssetCount"))
        goto LABEL_138;
      v15 = -[BMPerBatchDomainSpecificAssetCounts landmarkAssetCount](self, "landmarkAssetCount");
      if (v15 != objc_msgSend(v5, "landmarkAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasNaturalLandmarkAssetCount](self, "hasNaturalLandmarkAssetCount")
      || objc_msgSend(v5, "hasNaturalLandmarkAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasNaturalLandmarkAssetCount](self, "hasNaturalLandmarkAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasNaturalLandmarkAssetCount"))
        goto LABEL_138;
      v16 = -[BMPerBatchDomainSpecificAssetCounts naturalLandmarkAssetCount](self, "naturalLandmarkAssetCount");
      if (v16 != objc_msgSend(v5, "naturalLandmarkAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasMediaAssetCount](self, "hasMediaAssetCount")
      || objc_msgSend(v5, "hasMediaAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasMediaAssetCount](self, "hasMediaAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasMediaAssetCount"))
        goto LABEL_138;
      v17 = -[BMPerBatchDomainSpecificAssetCounts mediaAssetCount](self, "mediaAssetCount");
      if (v17 != objc_msgSend(v5, "mediaAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasBookAssetCount](self, "hasBookAssetCount")
      || objc_msgSend(v5, "hasBookAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasBookAssetCount](self, "hasBookAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasBookAssetCount"))
        goto LABEL_138;
      v18 = -[BMPerBatchDomainSpecificAssetCounts bookAssetCount](self, "bookAssetCount");
      if (v18 != objc_msgSend(v5, "bookAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasAlbumAssetCount](self, "hasAlbumAssetCount")
      || objc_msgSend(v5, "hasAlbumAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasAlbumAssetCount](self, "hasAlbumAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasAlbumAssetCount"))
        goto LABEL_138;
      v19 = -[BMPerBatchDomainSpecificAssetCounts albumAssetCount](self, "albumAssetCount");
      if (v19 != objc_msgSend(v5, "albumAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasCatsAssetCount](self, "hasCatsAssetCount")
      || objc_msgSend(v5, "hasCatsAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasCatsAssetCount](self, "hasCatsAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasCatsAssetCount"))
        goto LABEL_138;
      v20 = -[BMPerBatchDomainSpecificAssetCounts catsAssetCount](self, "catsAssetCount");
      if (v20 != objc_msgSend(v5, "catsAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasDogsAssetCount](self, "hasDogsAssetCount")
      || objc_msgSend(v5, "hasDogsAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasDogsAssetCount](self, "hasDogsAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasDogsAssetCount"))
        goto LABEL_138;
      v21 = -[BMPerBatchDomainSpecificAssetCounts dogsAssetCount](self, "dogsAssetCount");
      if (v21 != objc_msgSend(v5, "dogsAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasApparelAssetCount](self, "hasApparelAssetCount")
      || objc_msgSend(v5, "hasApparelAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasApparelAssetCount](self, "hasApparelAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasApparelAssetCount"))
        goto LABEL_138;
      v22 = -[BMPerBatchDomainSpecificAssetCounts apparelAssetCount](self, "apparelAssetCount");
      if (v22 != objc_msgSend(v5, "apparelAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasFoodAssetCount](self, "hasFoodAssetCount")
      || objc_msgSend(v5, "hasFoodAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasFoodAssetCount](self, "hasFoodAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasFoodAssetCount"))
        goto LABEL_138;
      v23 = -[BMPerBatchDomainSpecificAssetCounts foodAssetCount](self, "foodAssetCount");
      if (v23 != objc_msgSend(v5, "foodAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasStorefrontAssetCount](self, "hasStorefrontAssetCount")
      || objc_msgSend(v5, "hasStorefrontAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasStorefrontAssetCount](self, "hasStorefrontAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasStorefrontAssetCount"))
        goto LABEL_138;
      v24 = -[BMPerBatchDomainSpecificAssetCounts storefrontAssetCount](self, "storefrontAssetCount");
      if (v24 != objc_msgSend(v5, "storefrontAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasSignSymbolAssetCount](self, "hasSignSymbolAssetCount")
      || objc_msgSend(v5, "hasSignSymbolAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasSignSymbolAssetCount](self, "hasSignSymbolAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasSignSymbolAssetCount"))
        goto LABEL_138;
      v25 = -[BMPerBatchDomainSpecificAssetCounts signSymbolAssetCount](self, "signSymbolAssetCount");
      if (v25 != objc_msgSend(v5, "signSymbolAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasLaundryCareSymbolAssetCount](self, "hasLaundryCareSymbolAssetCount")
      || objc_msgSend(v5, "hasLaundryCareSymbolAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasLaundryCareSymbolAssetCount](self, "hasLaundryCareSymbolAssetCount"))goto LABEL_138;
      if (!objc_msgSend(v5, "hasLaundryCareSymbolAssetCount"))
        goto LABEL_138;
      v26 = -[BMPerBatchDomainSpecificAssetCounts laundryCareSymbolAssetCount](self, "laundryCareSymbolAssetCount");
      if (v26 != objc_msgSend(v5, "laundryCareSymbolAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasAutoSymbolAssetCount](self, "hasAutoSymbolAssetCount")
      || objc_msgSend(v5, "hasAutoSymbolAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasAutoSymbolAssetCount](self, "hasAutoSymbolAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasAutoSymbolAssetCount"))
        goto LABEL_138;
      v27 = -[BMPerBatchDomainSpecificAssetCounts autoSymbolAssetCount](self, "autoSymbolAssetCount");
      if (v27 != objc_msgSend(v5, "autoSymbolAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasBrandLogoSymbolAssetCount](self, "hasBrandLogoSymbolAssetCount")
      || objc_msgSend(v5, "hasBrandLogoSymbolAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasBrandLogoSymbolAssetCount](self, "hasBrandLogoSymbolAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasBrandLogoSymbolAssetCount"))
        goto LABEL_138;
      v28 = -[BMPerBatchDomainSpecificAssetCounts brandLogoSymbolAssetCount](self, "brandLogoSymbolAssetCount");
      if (v28 != objc_msgSend(v5, "brandLogoSymbolAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasObject2DAssetCount](self, "hasObject2DAssetCount")
      || objc_msgSend(v5, "hasObject2DAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasObject2DAssetCount](self, "hasObject2DAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasObject2DAssetCount"))
        goto LABEL_138;
      v29 = -[BMPerBatchDomainSpecificAssetCounts object2DAssetCount](self, "object2DAssetCount");
      if (v29 != objc_msgSend(v5, "object2DAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasBarcodeDetectionAssetCount](self, "hasBarcodeDetectionAssetCount")
      || objc_msgSend(v5, "hasBarcodeDetectionAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasBarcodeDetectionAssetCount](self, "hasBarcodeDetectionAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasBarcodeDetectionAssetCount"))
        goto LABEL_138;
      v30 = -[BMPerBatchDomainSpecificAssetCounts barcodeDetectionAssetCount](self, "barcodeDetectionAssetCount");
      if (v30 != objc_msgSend(v5, "barcodeDetectionAssetCount"))
        goto LABEL_138;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasSculptureAssetCount](self, "hasSculptureAssetCount")
      || objc_msgSend(v5, "hasSculptureAssetCount"))
    {
      if (!-[BMPerBatchDomainSpecificAssetCounts hasSculptureAssetCount](self, "hasSculptureAssetCount"))
        goto LABEL_138;
      if (!objc_msgSend(v5, "hasSculptureAssetCount"))
        goto LABEL_138;
      v31 = -[BMPerBatchDomainSpecificAssetCounts sculptureAssetCount](self, "sculptureAssetCount");
      if (v31 != objc_msgSend(v5, "sculptureAssetCount"))
        goto LABEL_138;
    }
    if (!-[BMPerBatchDomainSpecificAssetCounts hasSkylineAssetCount](self, "hasSkylineAssetCount")
      && !objc_msgSend(v5, "hasSkylineAssetCount"))
    {
      v33 = 1;
      goto LABEL_139;
    }
    if (-[BMPerBatchDomainSpecificAssetCounts hasSkylineAssetCount](self, "hasSkylineAssetCount")
      && objc_msgSend(v5, "hasSkylineAssetCount"))
    {
      v32 = -[BMPerBatchDomainSpecificAssetCounts skylineAssetCount](self, "skylineAssetCount");
      v33 = v32 == objc_msgSend(v5, "skylineAssetCount");
    }
    else
    {
LABEL_138:
      v33 = 0;
    }
LABEL_139:

    goto LABEL_140;
  }
  v33 = 0;
LABEL_140:

  return v33;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)parsedAssetCount
{
  return self->_parsedAssetCount;
}

- (BOOL)hasParsedAssetCount
{
  return self->_hasParsedAssetCount;
}

- (void)setHasParsedAssetCount:(BOOL)a3
{
  self->_hasParsedAssetCount = a3;
}

- (int)anyDomainAssetCount
{
  return self->_anyDomainAssetCount;
}

- (BOOL)hasAnyDomainAssetCount
{
  return self->_hasAnyDomainAssetCount;
}

- (void)setHasAnyDomainAssetCount:(BOOL)a3
{
  self->_hasAnyDomainAssetCount = a3;
}

- (int)artAssetCount
{
  return self->_artAssetCount;
}

- (BOOL)hasArtAssetCount
{
  return self->_hasArtAssetCount;
}

- (void)setHasArtAssetCount:(BOOL)a3
{
  self->_hasArtAssetCount = a3;
}

- (int)natureAssetCount
{
  return self->_natureAssetCount;
}

- (BOOL)hasNatureAssetCount
{
  return self->_hasNatureAssetCount;
}

- (void)setHasNatureAssetCount:(BOOL)a3
{
  self->_hasNatureAssetCount = a3;
}

- (int)animalsAssetCount
{
  return self->_animalsAssetCount;
}

- (BOOL)hasAnimalsAssetCount
{
  return self->_hasAnimalsAssetCount;
}

- (void)setHasAnimalsAssetCount:(BOOL)a3
{
  self->_hasAnimalsAssetCount = a3;
}

- (int)birdsAssetCount
{
  return self->_birdsAssetCount;
}

- (BOOL)hasBirdsAssetCount
{
  return self->_hasBirdsAssetCount;
}

- (void)setHasBirdsAssetCount:(BOOL)a3
{
  self->_hasBirdsAssetCount = a3;
}

- (int)insectsAssetCount
{
  return self->_insectsAssetCount;
}

- (BOOL)hasInsectsAssetCount
{
  return self->_hasInsectsAssetCount;
}

- (void)setHasInsectsAssetCount:(BOOL)a3
{
  self->_hasInsectsAssetCount = a3;
}

- (int)reptilesAssetCount
{
  return self->_reptilesAssetCount;
}

- (BOOL)hasReptilesAssetCount
{
  return self->_hasReptilesAssetCount;
}

- (void)setHasReptilesAssetCount:(BOOL)a3
{
  self->_hasReptilesAssetCount = a3;
}

- (int)mammalsAssetCount
{
  return self->_mammalsAssetCount;
}

- (BOOL)hasMammalsAssetCount
{
  return self->_hasMammalsAssetCount;
}

- (void)setHasMammalsAssetCount:(BOOL)a3
{
  self->_hasMammalsAssetCount = a3;
}

- (int)landmarkAssetCount
{
  return self->_landmarkAssetCount;
}

- (BOOL)hasLandmarkAssetCount
{
  return self->_hasLandmarkAssetCount;
}

- (void)setHasLandmarkAssetCount:(BOOL)a3
{
  self->_hasLandmarkAssetCount = a3;
}

- (int)naturalLandmarkAssetCount
{
  return self->_naturalLandmarkAssetCount;
}

- (BOOL)hasNaturalLandmarkAssetCount
{
  return self->_hasNaturalLandmarkAssetCount;
}

- (void)setHasNaturalLandmarkAssetCount:(BOOL)a3
{
  self->_hasNaturalLandmarkAssetCount = a3;
}

- (int)mediaAssetCount
{
  return self->_mediaAssetCount;
}

- (BOOL)hasMediaAssetCount
{
  return self->_hasMediaAssetCount;
}

- (void)setHasMediaAssetCount:(BOOL)a3
{
  self->_hasMediaAssetCount = a3;
}

- (int)bookAssetCount
{
  return self->_bookAssetCount;
}

- (BOOL)hasBookAssetCount
{
  return self->_hasBookAssetCount;
}

- (void)setHasBookAssetCount:(BOOL)a3
{
  self->_hasBookAssetCount = a3;
}

- (int)albumAssetCount
{
  return self->_albumAssetCount;
}

- (BOOL)hasAlbumAssetCount
{
  return self->_hasAlbumAssetCount;
}

- (void)setHasAlbumAssetCount:(BOOL)a3
{
  self->_hasAlbumAssetCount = a3;
}

- (int)catsAssetCount
{
  return self->_catsAssetCount;
}

- (BOOL)hasCatsAssetCount
{
  return self->_hasCatsAssetCount;
}

- (void)setHasCatsAssetCount:(BOOL)a3
{
  self->_hasCatsAssetCount = a3;
}

- (int)dogsAssetCount
{
  return self->_dogsAssetCount;
}

- (BOOL)hasDogsAssetCount
{
  return self->_hasDogsAssetCount;
}

- (void)setHasDogsAssetCount:(BOOL)a3
{
  self->_hasDogsAssetCount = a3;
}

- (int)apparelAssetCount
{
  return self->_apparelAssetCount;
}

- (BOOL)hasApparelAssetCount
{
  return self->_hasApparelAssetCount;
}

- (void)setHasApparelAssetCount:(BOOL)a3
{
  self->_hasApparelAssetCount = a3;
}

- (int)foodAssetCount
{
  return self->_foodAssetCount;
}

- (BOOL)hasFoodAssetCount
{
  return self->_hasFoodAssetCount;
}

- (void)setHasFoodAssetCount:(BOOL)a3
{
  self->_hasFoodAssetCount = a3;
}

- (int)storefrontAssetCount
{
  return self->_storefrontAssetCount;
}

- (BOOL)hasStorefrontAssetCount
{
  return self->_hasStorefrontAssetCount;
}

- (void)setHasStorefrontAssetCount:(BOOL)a3
{
  self->_hasStorefrontAssetCount = a3;
}

- (int)signSymbolAssetCount
{
  return self->_signSymbolAssetCount;
}

- (BOOL)hasSignSymbolAssetCount
{
  return self->_hasSignSymbolAssetCount;
}

- (void)setHasSignSymbolAssetCount:(BOOL)a3
{
  self->_hasSignSymbolAssetCount = a3;
}

- (int)laundryCareSymbolAssetCount
{
  return self->_laundryCareSymbolAssetCount;
}

- (BOOL)hasLaundryCareSymbolAssetCount
{
  return self->_hasLaundryCareSymbolAssetCount;
}

- (void)setHasLaundryCareSymbolAssetCount:(BOOL)a3
{
  self->_hasLaundryCareSymbolAssetCount = a3;
}

- (int)autoSymbolAssetCount
{
  return self->_autoSymbolAssetCount;
}

- (BOOL)hasAutoSymbolAssetCount
{
  return self->_hasAutoSymbolAssetCount;
}

- (void)setHasAutoSymbolAssetCount:(BOOL)a3
{
  self->_hasAutoSymbolAssetCount = a3;
}

- (int)brandLogoSymbolAssetCount
{
  return self->_brandLogoSymbolAssetCount;
}

- (BOOL)hasBrandLogoSymbolAssetCount
{
  return self->_hasBrandLogoSymbolAssetCount;
}

- (void)setHasBrandLogoSymbolAssetCount:(BOOL)a3
{
  self->_hasBrandLogoSymbolAssetCount = a3;
}

- (int)object2DAssetCount
{
  return self->_object2DAssetCount;
}

- (BOOL)hasObject2DAssetCount
{
  return self->_hasObject2DAssetCount;
}

- (void)setHasObject2DAssetCount:(BOOL)a3
{
  self->_hasObject2DAssetCount = a3;
}

- (int)barcodeDetectionAssetCount
{
  return self->_barcodeDetectionAssetCount;
}

- (BOOL)hasBarcodeDetectionAssetCount
{
  return self->_hasBarcodeDetectionAssetCount;
}

- (void)setHasBarcodeDetectionAssetCount:(BOOL)a3
{
  self->_hasBarcodeDetectionAssetCount = a3;
}

- (int)sculptureAssetCount
{
  return self->_sculptureAssetCount;
}

- (BOOL)hasSculptureAssetCount
{
  return self->_hasSculptureAssetCount;
}

- (void)setHasSculptureAssetCount:(BOOL)a3
{
  self->_hasSculptureAssetCount = a3;
}

- (int)skylineAssetCount
{
  return self->_skylineAssetCount;
}

- (BOOL)hasSkylineAssetCount
{
  return self->_hasSkylineAssetCount;
}

- (void)setHasSkylineAssetCount:(BOOL)a3
{
  self->_hasSkylineAssetCount = a3;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMPerBatchDomainSpecificAssetCounts initByReadFrom:]([BMPerBatchDomainSpecificAssetCounts alloc], "initByReadFrom:", v7);
    v4[11] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[29];

  v31[27] = *MEMORY[0x1E0C80C00];
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("parsedAssetCount"), 0, 0, 1, 2, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("anyDomainAssetCount"), 0, 0, 2, 2, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("artAssetCount"), 0, 0, 3, 2, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("natureAssetCount"), 0, 0, 4, 2, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("animalsAssetCount"), 0, 0, 5, 2, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("birdsAssetCount"), 0, 0, 6, 2, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("insectsAssetCount"), 0, 0, 7, 2, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reptilesAssetCount"), 0, 0, 8, 2, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mammalsAssetCount"), 0, 0, 9, 2, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("landmarkAssetCount"), 0, 0, 10, 2, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("naturalLandmarkAssetCount"), 0, 0, 11, 2, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaAssetCount"), 0, 0, 12, 2, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bookAssetCount"), 0, 0, 13, 2, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("albumAssetCount"), 0, 0, 14, 2, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("catsAssetCount"), 0, 0, 15, 2, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dogsAssetCount"), 0, 0, 16, 2, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("apparelAssetCount"), 0, 0, 17, 2, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("foodAssetCount"), 0, 0, 18, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("storefrontAssetCount"), 0, 0, 19, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("signSymbolAssetCount"), 0, 0, 20, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("laundryCareSymbolAssetCount"), 0, 0, 21, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("autoSymbolAssetCount"), 0, 0, 22, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("brandLogoSymbolAssetCount"), 0, 0, 23, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("object2DAssetCount"), 0, 0, 24, 2, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("barcodeDetectionAssetCount"), 0, 0, 25, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sculptureAssetCount"), 0, 0, 26, 2, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("skylineAssetCount"), 0, 0, 27, 2, 0);
  v31[0] = v30;
  v31[1] = v29;
  v31[2] = v28;
  v31[3] = v27;
  v31[4] = v26;
  v31[5] = v25;
  v31[6] = v24;
  v31[7] = v23;
  v31[8] = v22;
  v31[9] = v21;
  v31[10] = v20;
  v31[11] = v19;
  v31[12] = v18;
  v31[13] = v17;
  v31[14] = v16;
  v31[15] = v15;
  v31[16] = v14;
  v31[17] = v2;
  v31[18] = v3;
  v31[19] = v4;
  v31[20] = v13;
  v31[21] = v5;
  v31[22] = v6;
  v31[23] = v7;
  v31[24] = v12;
  v31[25] = v8;
  v31[26] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 27);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E6A0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[29];

  v31[27] = *MEMORY[0x1E0C80C00];
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parsedAssetCount"), 1, 2, 0);
  v31[0] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("anyDomainAssetCount"), 2, 2, 0);
  v31[1] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("artAssetCount"), 3, 2, 0);
  v31[2] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("natureAssetCount"), 4, 2, 0);
  v31[3] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("animalsAssetCount"), 5, 2, 0);
  v31[4] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("birdsAssetCount"), 6, 2, 0);
  v31[5] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("insectsAssetCount"), 7, 2, 0);
  v31[6] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reptilesAssetCount"), 8, 2, 0);
  v31[7] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mammalsAssetCount"), 9, 2, 0);
  v31[8] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("landmarkAssetCount"), 10, 2, 0);
  v31[9] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("naturalLandmarkAssetCount"), 11, 2, 0);
  v31[10] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaAssetCount"), 12, 2, 0);
  v31[11] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bookAssetCount"), 13, 2, 0);
  v31[12] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("albumAssetCount"), 14, 2, 0);
  v31[13] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("catsAssetCount"), 15, 2, 0);
  v31[14] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dogsAssetCount"), 16, 2, 0);
  v31[15] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("apparelAssetCount"), 17, 2, 0);
  v31[16] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("foodAssetCount"), 18, 2, 0);
  v31[17] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("storefrontAssetCount"), 19, 2, 0);
  v31[18] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("signSymbolAssetCount"), 20, 2, 0);
  v31[19] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("laundryCareSymbolAssetCount"), 21, 2, 0);
  v31[20] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("autoSymbolAssetCount"), 22, 2, 0);
  v31[21] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("brandLogoSymbolAssetCount"), 23, 2, 0);
  v31[22] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("object2DAssetCount"), 24, 2, 0);
  v31[23] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("barcodeDetectionAssetCount"), 25, 2, 0);
  v31[24] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sculptureAssetCount"), 26, 2, 0);
  v31[25] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("skylineAssetCount"), 27, 2, 0);
  v31[26] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
