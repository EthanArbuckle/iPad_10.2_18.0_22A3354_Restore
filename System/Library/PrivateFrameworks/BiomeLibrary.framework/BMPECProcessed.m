@implementation BMPECProcessed

- (BMPECProcessed)initWithArtAssetProcessedCount:(id)a3 natureAssetProcessedCount:(id)a4 animalsAssetProcessedCount:(id)a5 birdsAssetProcessedCount:(id)a6 insectsAssetProcessedCount:(id)a7 reptilesAssetProcessedCount:(id)a8 mammalsAssetProcessedCount:(id)a9 landmarkAssetProcessedCount:(id)a10 naturalLandmarkProcessedAssetCount:(id)a11 mediaAssetProcessedCount:(id)a12 bookAssetProcessedCount:(id)a13 albumAssetProcessedCount:(id)a14 catsAssetProcessedCount:(id)a15 dogsAssetProcessedCount:(id)a16 apparelAssetProcessedCount:(id)a17 foodAssetProcessedCount:(id)a18 storefrontAssetProcessedCount:(id)a19 signSymbolAssetProcessedCount:(id)a20 laundryCareSymbolAssetProcessedCount:(id)a21 autoSymbolAssetProcessedCount:(id)a22 brandLogoSymbolAssetProcessedCount:(id)a23 object2DAssetProcessedCount:(id)a24 barcodeDetectionAssetProcessedCount:(id)a25 sculptureAssetProcessedCount:(id)a26 skylineAssetProcessedCount:(id)a27 artAssetSuccessesCount:(id)a28 natureAssetSuccessesCount:(id)a29 animalsAssetSuccessesCount:(id)a30 birdsAssetSuccessesCount:(id)a31 insectsAssetSuccessesCount:(id)a32 reptilesAssetSuccessesCount:(id)a33 mammalsAssetSuccessesCount:(id)a34 landmarkAssetSuccessesCount:(id)a35 naturalLandmarkSuccessesAssetCount:(id)a36 mediaAssetSuccessesCount:(id)a37 bookAssetSuccessesCount:(id)a38 albumAssetSuccessesCount:(id)a39 catsAssetSuccessesCount:(id)a40 dogsAssetSuccessesCount:(id)a41 apparelAssetSuccessesCount:(id)a42 foodAssetSuccessesCount:(id)a43 storefrontAssetSuccessesCount:(id)a44 signSymbolAssetSuccessesCount:(id)a45 laundryCareSymbolAssetSuccessesCount:(id)a46 autoSymbolAssetSuccessesCount:(id)a47 brandLogoSymbolAssetSuccessesCount:(id)a48 object2DAssetSuccessesCount:(id)a49 barcodeDetectionAssetSuccessesCount:(id)a50 sculptureAssetSuccessesCount:(id)a51 skylineAssetSuccessesCount:(id)a52
{
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  BMPECProcessed *v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  BMPECProcessed *v116;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  objc_super v161;

  v160 = a3;
  v159 = a4;
  v158 = a5;
  v157 = a6;
  v156 = a7;
  v155 = a8;
  v153 = a9;
  v152 = a10;
  v151 = a11;
  v150 = a12;
  v149 = a13;
  v148 = a14;
  v147 = a15;
  v146 = a16;
  v145 = a17;
  v144 = a18;
  v143 = a19;
  v142 = a20;
  v141 = a21;
  v140 = a22;
  v139 = a23;
  v138 = a24;
  v137 = a25;
  v136 = a26;
  v135 = a27;
  v134 = a28;
  v133 = a29;
  v132 = a30;
  v131 = a31;
  v130 = a32;
  v129 = a33;
  v128 = a34;
  v127 = a35;
  v126 = a36;
  v125 = a37;
  v124 = a38;
  v123 = a39;
  v122 = a40;
  v121 = a41;
  v120 = a42;
  v119 = a43;
  v56 = a44;
  v57 = a45;
  v58 = a46;
  v59 = a47;
  v60 = a48;
  v61 = a49;
  v62 = a50;
  v63 = a51;
  v64 = a52;
  v161.receiver = self;
  v161.super_class = (Class)BMPECProcessed;
  v65 = -[BMEventBase init](&v161, sel_init);

  if (v65)
  {
    v65->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v160)
    {
      v65->_hasArtAssetProcessedCount = 1;
      v66 = objc_msgSend(v160, "intValue");
    }
    else
    {
      v65->_hasArtAssetProcessedCount = 0;
      v66 = -1;
    }
    v65->_artAssetProcessedCount = v66;
    if (v159)
    {
      v65->_hasNatureAssetProcessedCount = 1;
      v67 = objc_msgSend(v159, "intValue");
    }
    else
    {
      v65->_hasNatureAssetProcessedCount = 0;
      v67 = -1;
    }
    v65->_natureAssetProcessedCount = v67;
    if (v158)
    {
      v65->_hasAnimalsAssetProcessedCount = 1;
      v68 = objc_msgSend(v158, "intValue");
    }
    else
    {
      v65->_hasAnimalsAssetProcessedCount = 0;
      v68 = -1;
    }
    v65->_animalsAssetProcessedCount = v68;
    if (v157)
    {
      v65->_hasBirdsAssetProcessedCount = 1;
      v69 = objc_msgSend(v157, "intValue");
    }
    else
    {
      v65->_hasBirdsAssetProcessedCount = 0;
      v69 = -1;
    }
    v65->_birdsAssetProcessedCount = v69;
    if (v156)
    {
      v65->_hasInsectsAssetProcessedCount = 1;
      v70 = objc_msgSend(v156, "intValue");
    }
    else
    {
      v65->_hasInsectsAssetProcessedCount = 0;
      v70 = -1;
    }
    v65->_insectsAssetProcessedCount = v70;
    if (v155)
    {
      v65->_hasReptilesAssetProcessedCount = 1;
      v71 = objc_msgSend(v155, "intValue");
    }
    else
    {
      v65->_hasReptilesAssetProcessedCount = 0;
      v71 = -1;
    }
    v65->_reptilesAssetProcessedCount = v71;
    if (v153)
    {
      v65->_hasMammalsAssetProcessedCount = 1;
      v72 = objc_msgSend(v153, "intValue");
    }
    else
    {
      v65->_hasMammalsAssetProcessedCount = 0;
      v72 = -1;
    }
    v65->_mammalsAssetProcessedCount = v72;
    if (v152)
    {
      v65->_hasLandmarkAssetProcessedCount = 1;
      v73 = objc_msgSend(v152, "intValue");
    }
    else
    {
      v65->_hasLandmarkAssetProcessedCount = 0;
      v73 = -1;
    }
    v65->_landmarkAssetProcessedCount = v73;
    if (v151)
    {
      v65->_hasNaturalLandmarkProcessedAssetCount = 1;
      v74 = objc_msgSend(v151, "intValue");
    }
    else
    {
      v65->_hasNaturalLandmarkProcessedAssetCount = 0;
      v74 = -1;
    }
    v65->_naturalLandmarkProcessedAssetCount = v74;
    if (v150)
    {
      v65->_hasMediaAssetProcessedCount = 1;
      v75 = objc_msgSend(v150, "intValue");
    }
    else
    {
      v65->_hasMediaAssetProcessedCount = 0;
      v75 = -1;
    }
    v65->_mediaAssetProcessedCount = v75;
    if (v149)
    {
      v65->_hasBookAssetProcessedCount = 1;
      v76 = objc_msgSend(v149, "intValue");
    }
    else
    {
      v65->_hasBookAssetProcessedCount = 0;
      v76 = -1;
    }
    v65->_bookAssetProcessedCount = v76;
    if (v148)
    {
      v65->_hasAlbumAssetProcessedCount = 1;
      v77 = objc_msgSend(v148, "intValue");
    }
    else
    {
      v65->_hasAlbumAssetProcessedCount = 0;
      v77 = -1;
    }
    v65->_albumAssetProcessedCount = v77;
    if (v147)
    {
      v65->_hasCatsAssetProcessedCount = 1;
      v78 = objc_msgSend(v147, "intValue");
    }
    else
    {
      v65->_hasCatsAssetProcessedCount = 0;
      v78 = -1;
    }
    v65->_catsAssetProcessedCount = v78;
    if (v146)
    {
      v65->_hasDogsAssetProcessedCount = 1;
      v79 = objc_msgSend(v146, "intValue");
    }
    else
    {
      v65->_hasDogsAssetProcessedCount = 0;
      v79 = -1;
    }
    v65->_dogsAssetProcessedCount = v79;
    if (v145)
    {
      v65->_hasApparelAssetProcessedCount = 1;
      v80 = objc_msgSend(v145, "intValue");
    }
    else
    {
      v65->_hasApparelAssetProcessedCount = 0;
      v80 = -1;
    }
    v65->_apparelAssetProcessedCount = v80;
    if (v144)
    {
      v65->_hasFoodAssetProcessedCount = 1;
      v81 = objc_msgSend(v144, "intValue");
    }
    else
    {
      v65->_hasFoodAssetProcessedCount = 0;
      v81 = -1;
    }
    v65->_foodAssetProcessedCount = v81;
    if (v143)
    {
      v65->_hasStorefrontAssetProcessedCount = 1;
      v82 = objc_msgSend(v143, "intValue");
    }
    else
    {
      v65->_hasStorefrontAssetProcessedCount = 0;
      v82 = -1;
    }
    v65->_storefrontAssetProcessedCount = v82;
    if (v142)
    {
      v65->_hasSignSymbolAssetProcessedCount = 1;
      v83 = objc_msgSend(v142, "intValue");
    }
    else
    {
      v65->_hasSignSymbolAssetProcessedCount = 0;
      v83 = -1;
    }
    v65->_signSymbolAssetProcessedCount = v83;
    if (v141)
    {
      v65->_hasLaundryCareSymbolAssetProcessedCount = 1;
      v84 = objc_msgSend(v141, "intValue");
    }
    else
    {
      v65->_hasLaundryCareSymbolAssetProcessedCount = 0;
      v84 = -1;
    }
    v65->_laundryCareSymbolAssetProcessedCount = v84;
    if (v140)
    {
      v65->_hasAutoSymbolAssetProcessedCount = 1;
      v85 = objc_msgSend(v140, "intValue");
    }
    else
    {
      v65->_hasAutoSymbolAssetProcessedCount = 0;
      v85 = -1;
    }
    v65->_autoSymbolAssetProcessedCount = v85;
    if (v139)
    {
      v65->_hasBrandLogoSymbolAssetProcessedCount = 1;
      v86 = objc_msgSend(v139, "intValue");
    }
    else
    {
      v65->_hasBrandLogoSymbolAssetProcessedCount = 0;
      v86 = -1;
    }
    v65->_brandLogoSymbolAssetProcessedCount = v86;
    if (v138)
    {
      v65->_hasObject2DAssetProcessedCount = 1;
      v87 = objc_msgSend(v138, "intValue");
    }
    else
    {
      v65->_hasObject2DAssetProcessedCount = 0;
      v87 = -1;
    }
    v65->_object2DAssetProcessedCount = v87;
    if (v137)
    {
      v65->_hasBarcodeDetectionAssetProcessedCount = 1;
      v88 = objc_msgSend(v137, "intValue");
    }
    else
    {
      v65->_hasBarcodeDetectionAssetProcessedCount = 0;
      v88 = -1;
    }
    v65->_barcodeDetectionAssetProcessedCount = v88;
    if (v136)
    {
      v65->_hasSculptureAssetProcessedCount = 1;
      v89 = objc_msgSend(v136, "intValue");
    }
    else
    {
      v65->_hasSculptureAssetProcessedCount = 0;
      v89 = -1;
    }
    v65->_sculptureAssetProcessedCount = v89;
    if (v135)
    {
      v65->_hasSkylineAssetProcessedCount = 1;
      v90 = objc_msgSend(v135, "intValue");
    }
    else
    {
      v65->_hasSkylineAssetProcessedCount = 0;
      v90 = -1;
    }
    v65->_skylineAssetProcessedCount = v90;
    if (v134)
    {
      v65->_hasArtAssetSuccessesCount = 1;
      v91 = objc_msgSend(v134, "intValue");
    }
    else
    {
      v65->_hasArtAssetSuccessesCount = 0;
      v91 = -1;
    }
    v65->_artAssetSuccessesCount = v91;
    if (v133)
    {
      v65->_hasNatureAssetSuccessesCount = 1;
      v92 = objc_msgSend(v133, "intValue");
    }
    else
    {
      v65->_hasNatureAssetSuccessesCount = 0;
      v92 = -1;
    }
    v65->_natureAssetSuccessesCount = v92;
    if (v132)
    {
      v65->_hasAnimalsAssetSuccessesCount = 1;
      v93 = objc_msgSend(v132, "intValue");
    }
    else
    {
      v65->_hasAnimalsAssetSuccessesCount = 0;
      v93 = -1;
    }
    v65->_animalsAssetSuccessesCount = v93;
    if (v131)
    {
      v65->_hasBirdsAssetSuccessesCount = 1;
      v94 = objc_msgSend(v131, "intValue");
    }
    else
    {
      v65->_hasBirdsAssetSuccessesCount = 0;
      v94 = -1;
    }
    v65->_birdsAssetSuccessesCount = v94;
    if (v130)
    {
      v65->_hasInsectsAssetSuccessesCount = 1;
      v95 = objc_msgSend(v130, "intValue");
    }
    else
    {
      v65->_hasInsectsAssetSuccessesCount = 0;
      v95 = -1;
    }
    v65->_insectsAssetSuccessesCount = v95;
    if (v129)
    {
      v65->_hasReptilesAssetSuccessesCount = 1;
      v96 = objc_msgSend(v129, "intValue");
    }
    else
    {
      v65->_hasReptilesAssetSuccessesCount = 0;
      v96 = -1;
    }
    v65->_reptilesAssetSuccessesCount = v96;
    if (v128)
    {
      v65->_hasMammalsAssetSuccessesCount = 1;
      v97 = objc_msgSend(v128, "intValue");
    }
    else
    {
      v65->_hasMammalsAssetSuccessesCount = 0;
      v97 = -1;
    }
    v65->_mammalsAssetSuccessesCount = v97;
    if (v127)
    {
      v65->_hasLandmarkAssetSuccessesCount = 1;
      v98 = objc_msgSend(v127, "intValue");
    }
    else
    {
      v65->_hasLandmarkAssetSuccessesCount = 0;
      v98 = -1;
    }
    v65->_landmarkAssetSuccessesCount = v98;
    if (v126)
    {
      v65->_hasNaturalLandmarkSuccessesAssetCount = 1;
      v99 = objc_msgSend(v126, "intValue");
    }
    else
    {
      v65->_hasNaturalLandmarkSuccessesAssetCount = 0;
      v99 = -1;
    }
    v65->_naturalLandmarkSuccessesAssetCount = v99;
    if (v125)
    {
      v65->_hasMediaAssetSuccessesCount = 1;
      v100 = objc_msgSend(v125, "intValue");
    }
    else
    {
      v65->_hasMediaAssetSuccessesCount = 0;
      v100 = -1;
    }
    v65->_mediaAssetSuccessesCount = v100;
    if (v124)
    {
      v65->_hasBookAssetSuccessesCount = 1;
      v101 = objc_msgSend(v124, "intValue");
    }
    else
    {
      v65->_hasBookAssetSuccessesCount = 0;
      v101 = -1;
    }
    v65->_bookAssetSuccessesCount = v101;
    if (v123)
    {
      v65->_hasAlbumAssetSuccessesCount = 1;
      v102 = objc_msgSend(v123, "intValue");
    }
    else
    {
      v65->_hasAlbumAssetSuccessesCount = 0;
      v102 = -1;
    }
    v65->_albumAssetSuccessesCount = v102;
    if (v122)
    {
      v65->_hasCatsAssetSuccessesCount = 1;
      v103 = objc_msgSend(v122, "intValue");
    }
    else
    {
      v65->_hasCatsAssetSuccessesCount = 0;
      v103 = -1;
    }
    v65->_catsAssetSuccessesCount = v103;
    if (v121)
    {
      v65->_hasDogsAssetSuccessesCount = 1;
      v104 = objc_msgSend(v121, "intValue");
    }
    else
    {
      v65->_hasDogsAssetSuccessesCount = 0;
      v104 = -1;
    }
    v65->_dogsAssetSuccessesCount = v104;
    if (v120)
    {
      v65->_hasApparelAssetSuccessesCount = 1;
      v105 = objc_msgSend(v120, "intValue");
    }
    else
    {
      v65->_hasApparelAssetSuccessesCount = 0;
      v105 = -1;
    }
    v65->_apparelAssetSuccessesCount = v105;
    if (v119)
    {
      v65->_hasFoodAssetSuccessesCount = 1;
      v106 = objc_msgSend(v119, "intValue");
    }
    else
    {
      v65->_hasFoodAssetSuccessesCount = 0;
      v106 = -1;
    }
    v65->_foodAssetSuccessesCount = v106;
    if (v56)
    {
      v65->_hasStorefrontAssetSuccessesCount = 1;
      v107 = objc_msgSend(v56, "intValue");
    }
    else
    {
      v65->_hasStorefrontAssetSuccessesCount = 0;
      v107 = -1;
    }
    v65->_storefrontAssetSuccessesCount = v107;
    if (v57)
    {
      v65->_hasSignSymbolAssetSuccessesCount = 1;
      v108 = objc_msgSend(v57, "intValue");
    }
    else
    {
      v65->_hasSignSymbolAssetSuccessesCount = 0;
      v108 = -1;
    }
    v65->_signSymbolAssetSuccessesCount = v108;
    if (v58)
    {
      v65->_hasLaundryCareSymbolAssetSuccessesCount = 1;
      v109 = objc_msgSend(v58, "intValue");
    }
    else
    {
      v65->_hasLaundryCareSymbolAssetSuccessesCount = 0;
      v109 = -1;
    }
    v65->_laundryCareSymbolAssetSuccessesCount = v109;
    if (v59)
    {
      v65->_hasAutoSymbolAssetSuccessesCount = 1;
      v110 = objc_msgSend(v59, "intValue");
    }
    else
    {
      v65->_hasAutoSymbolAssetSuccessesCount = 0;
      v110 = -1;
    }
    v65->_autoSymbolAssetSuccessesCount = v110;
    if (v60)
    {
      v65->_hasBrandLogoSymbolAssetSuccessesCount = 1;
      v111 = objc_msgSend(v60, "intValue");
    }
    else
    {
      v65->_hasBrandLogoSymbolAssetSuccessesCount = 0;
      v111 = -1;
    }
    v65->_brandLogoSymbolAssetSuccessesCount = v111;
    if (v61)
    {
      v65->_hasObject2DAssetSuccessesCount = 1;
      v112 = objc_msgSend(v61, "intValue");
    }
    else
    {
      v65->_hasObject2DAssetSuccessesCount = 0;
      v112 = -1;
    }
    v65->_object2DAssetSuccessesCount = v112;
    if (v62)
    {
      v65->_hasBarcodeDetectionAssetSuccessesCount = 1;
      v113 = objc_msgSend(v62, "intValue");
    }
    else
    {
      v65->_hasBarcodeDetectionAssetSuccessesCount = 0;
      v113 = -1;
    }
    v65->_barcodeDetectionAssetSuccessesCount = v113;
    if (v63)
    {
      v65->_hasSculptureAssetSuccessesCount = 1;
      v114 = objc_msgSend(v63, "intValue");
    }
    else
    {
      v65->_hasSculptureAssetSuccessesCount = 0;
      v114 = -1;
    }
    v65->_sculptureAssetSuccessesCount = v114;
    if (v64)
    {
      v65->_hasSkylineAssetSuccessesCount = 1;
      v115 = objc_msgSend(v64, "intValue");
    }
    else
    {
      v65->_hasSkylineAssetSuccessesCount = 0;
      v115 = -1;
    }
    v65->_skylineAssetSuccessesCount = v115;
  }
  v116 = v65;

  return v116;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed artAssetProcessedCount](self, "artAssetProcessedCount"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed natureAssetProcessedCount](self, "natureAssetProcessedCount"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed animalsAssetProcessedCount](self, "animalsAssetProcessedCount"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed birdsAssetProcessedCount](self, "birdsAssetProcessedCount"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed insectsAssetProcessedCount](self, "insectsAssetProcessedCount"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed reptilesAssetProcessedCount](self, "reptilesAssetProcessedCount"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mammalsAssetProcessedCount](self, "mammalsAssetProcessedCount"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed landmarkAssetProcessedCount](self, "landmarkAssetProcessedCount"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed naturalLandmarkProcessedAssetCount](self, "naturalLandmarkProcessedAssetCount"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mediaAssetProcessedCount](self, "mediaAssetProcessedCount"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed bookAssetProcessedCount](self, "bookAssetProcessedCount"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed albumAssetProcessedCount](self, "albumAssetProcessedCount"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed catsAssetProcessedCount](self, "catsAssetProcessedCount"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed dogsAssetProcessedCount](self, "dogsAssetProcessedCount"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed apparelAssetProcessedCount](self, "apparelAssetProcessedCount"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed foodAssetProcessedCount](self, "foodAssetProcessedCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed storefrontAssetProcessedCount](self, "storefrontAssetProcessedCount"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed signSymbolAssetProcessedCount](self, "signSymbolAssetProcessedCount"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetProcessedCount](self, "laundryCareSymbolAssetProcessedCount"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed autoSymbolAssetProcessedCount](self, "autoSymbolAssetProcessedCount"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetProcessedCount](self, "brandLogoSymbolAssetProcessedCount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed object2DAssetProcessedCount](self, "object2DAssetProcessedCount"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetProcessedCount](self, "barcodeDetectionAssetProcessedCount"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed sculptureAssetProcessedCount](self, "sculptureAssetProcessedCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed skylineAssetProcessedCount](self, "skylineAssetProcessedCount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed artAssetSuccessesCount](self, "artAssetSuccessesCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed natureAssetSuccessesCount](self, "natureAssetSuccessesCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed animalsAssetSuccessesCount](self, "animalsAssetSuccessesCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed birdsAssetSuccessesCount](self, "birdsAssetSuccessesCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed insectsAssetSuccessesCount](self, "insectsAssetSuccessesCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed reptilesAssetSuccessesCount](self, "reptilesAssetSuccessesCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mammalsAssetSuccessesCount](self, "mammalsAssetSuccessesCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed landmarkAssetSuccessesCount](self, "landmarkAssetSuccessesCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed naturalLandmarkSuccessesAssetCount](self, "naturalLandmarkSuccessesAssetCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mediaAssetSuccessesCount](self, "mediaAssetSuccessesCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed bookAssetSuccessesCount](self, "bookAssetSuccessesCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed albumAssetSuccessesCount](self, "albumAssetSuccessesCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed catsAssetSuccessesCount](self, "catsAssetSuccessesCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed dogsAssetSuccessesCount](self, "dogsAssetSuccessesCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed apparelAssetSuccessesCount](self, "apparelAssetSuccessesCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed foodAssetSuccessesCount](self, "foodAssetSuccessesCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed storefrontAssetSuccessesCount](self, "storefrontAssetSuccessesCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed signSymbolAssetSuccessesCount](self, "signSymbolAssetSuccessesCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetSuccessesCount](self, "laundryCareSymbolAssetSuccessesCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed autoSymbolAssetSuccessesCount](self, "autoSymbolAssetSuccessesCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetSuccessesCount](self, "brandLogoSymbolAssetSuccessesCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed object2DAssetSuccessesCount](self, "object2DAssetSuccessesCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetSuccessesCount](self, "barcodeDetectionAssetSuccessesCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed sculptureAssetSuccessesCount](self, "sculptureAssetSuccessesCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed skylineAssetSuccessesCount](self, "skylineAssetSuccessesCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "initWithFormat:", CFSTR("BMPECProcessed with artAssetProcessedCount: %@, natureAssetProcessedCount: %@, animalsAssetProcessedCount: %@, birdsAssetProcessedCount: %@, insectsAssetProcessedCount: %@, reptilesAssetProcessedCount: %@, mammalsAssetProcessedCount: %@, landmarkAssetProcessedCount: %@, naturalLandmarkProcessedAssetCount: %@, mediaAssetProcessedCount: %@, bookAssetProcessedCount: %@, albumAssetProcessedCount: %@, catsAssetProcessedCount: %@, dogsAssetProcessedCount: %@, apparelAssetProcessedCount: %@, foodAssetProcessedCount: %@, storefrontAssetProcessedCount: %@, signSymbolAssetProcessedCount: %@, laundryCareSymbolAssetProcessedCount: %@, autoSymbolAssetProcessedCount: %@, brandLogoSymbolAssetProcessedCount: %@, object2DAssetProcessedCount: %@, barcodeDetectionAssetProcessedCount: %@, sculptureAssetProcessedCount: %@, skylineAssetProcessedCount: %@, artAssetSuccessesCount: %@, natureAssetSuccessesCount: %@, animalsAssetSuccessesCount: %@, birdsAssetSuccessesCount: %@, insectsAssetSuccessesCount: %@, reptilesAssetSuccessesCount: %@, mammalsAssetSuccessesCount: %@, landmarkAssetSuccessesCount: %@, naturalLandmarkSuccessesAssetCount: %@, mediaAssetSuccessesCount: %@, bookAssetSuccessesCount: %@, albumAssetSuccessesCount: %@, catsAssetSuccessesCount: %@, dogsAssetSuccessesCount: %@, apparelAssetSuccessesCount: %@, foodAssetSuccessesCount: %@, storefrontAssetSuccessesCount: %@, signSymbolAssetSuccessesCount: %@, laundryCareSymbolAssetSuccessesCount: %@, autoSymbolAssetSuccessesCount: %@, brandLogoSymbolAssetSuccessesCount: %@, object2DAssetSuccessesCount: %@, barcodeDetectionAssetSuccessesCount: %@, sculptureAssetSuccessesCount: %@, skylineAssetSuccessesCount: %@"), v52, v55, v54, v53, v49, v51, v50, v48, v45, v47, v44, v46, v41, v43, v40, v38,
              v42,
              v39,
              v35,
              v37,
              v34,
              v32,
              v36,
              v31,
              v33,
              v30,
              v29,
              v28,
              v26,
              v17,
              v27,
              v16,
              v25,
              v24,
              v23,
              v15,
              v22,
              v14,
              v21,
              v13,
              v20,
              v12,
              v11,
              v10,
              v9,
              v3,
              v4,
              v5,
              v6,
              v7);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPECProcessed *v5;
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
  char v158;
  unsigned int v159;
  uint64_t v160;
  unint64_t v161;
  char v162;
  char v163;
  unsigned int v164;
  uint64_t v165;
  unint64_t v166;
  char v167;
  char v168;
  unsigned int v169;
  uint64_t v170;
  unint64_t v171;
  char v172;
  char v173;
  unsigned int v174;
  uint64_t v175;
  unint64_t v176;
  char v177;
  char v178;
  unsigned int v179;
  uint64_t v180;
  unint64_t v181;
  char v182;
  char v183;
  unsigned int v184;
  uint64_t v185;
  unint64_t v186;
  char v187;
  char v188;
  unsigned int v189;
  uint64_t v190;
  unint64_t v191;
  char v192;
  char v193;
  unsigned int v194;
  uint64_t v195;
  unint64_t v196;
  char v197;
  char v198;
  unsigned int v199;
  uint64_t v200;
  unint64_t v201;
  char v202;
  char v203;
  unsigned int v204;
  uint64_t v205;
  unint64_t v206;
  char v207;
  char v208;
  unsigned int v209;
  uint64_t v210;
  unint64_t v211;
  char v212;
  char v213;
  unsigned int v214;
  uint64_t v215;
  unint64_t v216;
  char v217;
  char v218;
  unsigned int v219;
  uint64_t v220;
  unint64_t v221;
  char v222;
  char v223;
  unsigned int v224;
  uint64_t v225;
  unint64_t v226;
  char v227;
  char v228;
  unsigned int v229;
  uint64_t v230;
  unint64_t v231;
  char v232;
  char v233;
  unsigned int v234;
  uint64_t v235;
  unint64_t v236;
  char v237;
  char v238;
  unsigned int v239;
  uint64_t v240;
  unint64_t v241;
  char v242;
  char v243;
  unsigned int v244;
  uint64_t v245;
  unint64_t v246;
  char v247;
  char v248;
  unsigned int v249;
  uint64_t v250;
  unint64_t v251;
  char v252;
  char v253;
  unsigned int v254;
  uint64_t v255;
  unint64_t v256;
  char v257;
  char v258;
  unsigned int v259;
  uint64_t v260;
  unint64_t v261;
  char v262;
  char v263;
  unsigned int v264;
  uint64_t v265;
  unint64_t v266;
  char v267;
  char v268;
  unsigned int v269;
  uint64_t v270;
  unint64_t v271;
  char v272;
  BMPECProcessed *v273;
  objc_super v275;

  v4 = a3;
  v275.receiver = self;
  v275.super_class = (Class)BMPECProcessed;
  v5 = -[BMEventBase init](&v275, sel_init);
  if (!v5)
    goto LABEL_481;
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
          v5->_hasArtAssetProcessedCount = 1;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__artAssetProcessedCount;
              goto LABEL_422;
            }
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              break;
            v25 = 0;
            v19 += 7;
            v26 = &OBJC_IVAR___BMPECProcessed__artAssetProcessedCount;
            v27 = v20++ > 8;
            if (v27)
              goto LABEL_426;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__artAssetProcessedCount;
          goto LABEL_423;
        case 2u:
          v28 = 0;
          v29 = 0;
          v21 = 0;
          v5->_hasNatureAssetProcessedCount = 1;
          while (2)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__natureAssetProcessedCount;
              goto LABEL_422;
            }
            v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 1;
            v21 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v25 = 0;
              v28 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__natureAssetProcessedCount;
              v27 = v29++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__natureAssetProcessedCount;
          goto LABEL_423;
        case 3u:
          v33 = 0;
          v34 = 0;
          v21 = 0;
          v5->_hasAnimalsAssetProcessedCount = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetProcessedCount;
              goto LABEL_422;
            }
            v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
            *(_QWORD *)&v4[v35] = v36 + 1;
            v21 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v25 = 0;
              v33 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetProcessedCount;
              v27 = v34++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetProcessedCount;
          goto LABEL_423;
        case 4u:
          v38 = 0;
          v39 = 0;
          v21 = 0;
          v5->_hasBirdsAssetProcessedCount = 1;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            if (v41 == -1 || v41 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetProcessedCount;
              goto LABEL_422;
            }
            v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
            *(_QWORD *)&v4[v40] = v41 + 1;
            v21 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v25 = 0;
              v38 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetProcessedCount;
              v27 = v39++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetProcessedCount;
          goto LABEL_423;
        case 5u:
          v43 = 0;
          v44 = 0;
          v21 = 0;
          v5->_hasInsectsAssetProcessedCount = 1;
          while (2)
          {
            v45 = *v6;
            v46 = *(_QWORD *)&v4[v45];
            if (v46 == -1 || v46 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetProcessedCount;
              goto LABEL_422;
            }
            v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v46);
            *(_QWORD *)&v4[v45] = v46 + 1;
            v21 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              v25 = 0;
              v43 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetProcessedCount;
              v27 = v44++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetProcessedCount;
          goto LABEL_423;
        case 6u:
          v48 = 0;
          v49 = 0;
          v21 = 0;
          v5->_hasReptilesAssetProcessedCount = 1;
          while (2)
          {
            v50 = *v6;
            v51 = *(_QWORD *)&v4[v50];
            if (v51 == -1 || v51 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetProcessedCount;
              goto LABEL_422;
            }
            v52 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v51);
            *(_QWORD *)&v4[v50] = v51 + 1;
            v21 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              v25 = 0;
              v48 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetProcessedCount;
              v27 = v49++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetProcessedCount;
          goto LABEL_423;
        case 7u:
          v53 = 0;
          v54 = 0;
          v21 = 0;
          v5->_hasMammalsAssetProcessedCount = 1;
          while (2)
          {
            v55 = *v6;
            v56 = *(_QWORD *)&v4[v55];
            if (v56 == -1 || v56 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetProcessedCount;
              goto LABEL_422;
            }
            v57 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v56);
            *(_QWORD *)&v4[v55] = v56 + 1;
            v21 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              v25 = 0;
              v53 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetProcessedCount;
              v27 = v54++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetProcessedCount;
          goto LABEL_423;
        case 8u:
          v58 = 0;
          v59 = 0;
          v21 = 0;
          v5->_hasLandmarkAssetProcessedCount = 1;
          while (2)
          {
            v60 = *v6;
            v61 = *(_QWORD *)&v4[v60];
            if (v61 == -1 || v61 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetProcessedCount;
              goto LABEL_422;
            }
            v62 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v61);
            *(_QWORD *)&v4[v60] = v61 + 1;
            v21 |= (unint64_t)(v62 & 0x7F) << v58;
            if (v62 < 0)
            {
              v25 = 0;
              v58 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetProcessedCount;
              v27 = v59++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetProcessedCount;
          goto LABEL_423;
        case 9u:
          v63 = 0;
          v64 = 0;
          v21 = 0;
          v5->_hasNaturalLandmarkProcessedAssetCount = 1;
          while (2)
          {
            v65 = *v6;
            v66 = *(_QWORD *)&v4[v65];
            if (v66 == -1 || v66 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkProcessedAssetCount;
              goto LABEL_422;
            }
            v67 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v66);
            *(_QWORD *)&v4[v65] = v66 + 1;
            v21 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v25 = 0;
              v63 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkProcessedAssetCount;
              v27 = v64++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkProcessedAssetCount;
          goto LABEL_423;
        case 0xAu:
          v68 = 0;
          v69 = 0;
          v21 = 0;
          v5->_hasMediaAssetProcessedCount = 1;
          while (2)
          {
            v70 = *v6;
            v71 = *(_QWORD *)&v4[v70];
            if (v71 == -1 || v71 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetProcessedCount;
              goto LABEL_422;
            }
            v72 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v71);
            *(_QWORD *)&v4[v70] = v71 + 1;
            v21 |= (unint64_t)(v72 & 0x7F) << v68;
            if (v72 < 0)
            {
              v25 = 0;
              v68 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetProcessedCount;
              v27 = v69++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetProcessedCount;
          goto LABEL_423;
        case 0xBu:
          v73 = 0;
          v74 = 0;
          v21 = 0;
          v5->_hasBookAssetProcessedCount = 1;
          while (2)
          {
            v75 = *v6;
            v76 = *(_QWORD *)&v4[v75];
            if (v76 == -1 || v76 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__bookAssetProcessedCount;
              goto LABEL_422;
            }
            v77 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v76);
            *(_QWORD *)&v4[v75] = v76 + 1;
            v21 |= (unint64_t)(v77 & 0x7F) << v73;
            if (v77 < 0)
            {
              v25 = 0;
              v73 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__bookAssetProcessedCount;
              v27 = v74++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__bookAssetProcessedCount;
          goto LABEL_423;
        case 0xCu:
          v78 = 0;
          v79 = 0;
          v21 = 0;
          v5->_hasAlbumAssetProcessedCount = 1;
          while (2)
          {
            v80 = *v6;
            v81 = *(_QWORD *)&v4[v80];
            if (v81 == -1 || v81 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__albumAssetProcessedCount;
              goto LABEL_422;
            }
            v82 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v81);
            *(_QWORD *)&v4[v80] = v81 + 1;
            v21 |= (unint64_t)(v82 & 0x7F) << v78;
            if (v82 < 0)
            {
              v25 = 0;
              v78 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__albumAssetProcessedCount;
              v27 = v79++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__albumAssetProcessedCount;
          goto LABEL_423;
        case 0xDu:
          v83 = 0;
          v84 = 0;
          v21 = 0;
          v5->_hasCatsAssetProcessedCount = 1;
          while (2)
          {
            v85 = *v6;
            v86 = *(_QWORD *)&v4[v85];
            if (v86 == -1 || v86 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__catsAssetProcessedCount;
              goto LABEL_422;
            }
            v87 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v86);
            *(_QWORD *)&v4[v85] = v86 + 1;
            v21 |= (unint64_t)(v87 & 0x7F) << v83;
            if (v87 < 0)
            {
              v25 = 0;
              v83 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__catsAssetProcessedCount;
              v27 = v84++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__catsAssetProcessedCount;
          goto LABEL_423;
        case 0xEu:
          v88 = 0;
          v89 = 0;
          v21 = 0;
          v5->_hasDogsAssetProcessedCount = 1;
          while (2)
          {
            v90 = *v6;
            v91 = *(_QWORD *)&v4[v90];
            if (v91 == -1 || v91 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetProcessedCount;
              goto LABEL_422;
            }
            v92 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v91);
            *(_QWORD *)&v4[v90] = v91 + 1;
            v21 |= (unint64_t)(v92 & 0x7F) << v88;
            if (v92 < 0)
            {
              v25 = 0;
              v88 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetProcessedCount;
              v27 = v89++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetProcessedCount;
          goto LABEL_423;
        case 0xFu:
          v93 = 0;
          v94 = 0;
          v21 = 0;
          v5->_hasApparelAssetProcessedCount = 1;
          while (2)
          {
            v95 = *v6;
            v96 = *(_QWORD *)&v4[v95];
            if (v96 == -1 || v96 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetProcessedCount;
              goto LABEL_422;
            }
            v97 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v96);
            *(_QWORD *)&v4[v95] = v96 + 1;
            v21 |= (unint64_t)(v97 & 0x7F) << v93;
            if (v97 < 0)
            {
              v25 = 0;
              v93 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetProcessedCount;
              v27 = v94++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetProcessedCount;
          goto LABEL_423;
        case 0x10u:
          v98 = 0;
          v99 = 0;
          v21 = 0;
          v5->_hasFoodAssetProcessedCount = 1;
          while (2)
          {
            v100 = *v6;
            v101 = *(_QWORD *)&v4[v100];
            if (v101 == -1 || v101 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__foodAssetProcessedCount;
              goto LABEL_422;
            }
            v102 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v101);
            *(_QWORD *)&v4[v100] = v101 + 1;
            v21 |= (unint64_t)(v102 & 0x7F) << v98;
            if (v102 < 0)
            {
              v25 = 0;
              v98 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__foodAssetProcessedCount;
              v27 = v99++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__foodAssetProcessedCount;
          goto LABEL_423;
        case 0x11u:
          v103 = 0;
          v104 = 0;
          v21 = 0;
          v5->_hasStorefrontAssetProcessedCount = 1;
          while (2)
          {
            v105 = *v6;
            v106 = *(_QWORD *)&v4[v105];
            if (v106 == -1 || v106 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetProcessedCount;
              goto LABEL_422;
            }
            v107 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v106);
            *(_QWORD *)&v4[v105] = v106 + 1;
            v21 |= (unint64_t)(v107 & 0x7F) << v103;
            if (v107 < 0)
            {
              v25 = 0;
              v103 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetProcessedCount;
              v27 = v104++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetProcessedCount;
          goto LABEL_423;
        case 0x12u:
          v108 = 0;
          v109 = 0;
          v21 = 0;
          v5->_hasSignSymbolAssetProcessedCount = 1;
          while (2)
          {
            v110 = *v6;
            v111 = *(_QWORD *)&v4[v110];
            if (v111 == -1 || v111 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            v112 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v111);
            *(_QWORD *)&v4[v110] = v111 + 1;
            v21 |= (unint64_t)(v112 & 0x7F) << v108;
            if (v112 < 0)
            {
              v25 = 0;
              v108 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetProcessedCount;
              v27 = v109++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x13u:
          v113 = 0;
          v114 = 0;
          v21 = 0;
          v5->_hasLaundryCareSymbolAssetProcessedCount = 1;
          while (2)
          {
            v115 = *v6;
            v116 = *(_QWORD *)&v4[v115];
            if (v116 == -1 || v116 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            v117 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v116);
            *(_QWORD *)&v4[v115] = v116 + 1;
            v21 |= (unint64_t)(v117 & 0x7F) << v113;
            if (v117 < 0)
            {
              v25 = 0;
              v113 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetProcessedCount;
              v27 = v114++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x14u:
          v118 = 0;
          v119 = 0;
          v21 = 0;
          v5->_hasAutoSymbolAssetProcessedCount = 1;
          while (2)
          {
            v120 = *v6;
            v121 = *(_QWORD *)&v4[v120];
            if (v121 == -1 || v121 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            v122 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v121);
            *(_QWORD *)&v4[v120] = v121 + 1;
            v21 |= (unint64_t)(v122 & 0x7F) << v118;
            if (v122 < 0)
            {
              v25 = 0;
              v118 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetProcessedCount;
              v27 = v119++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x15u:
          v123 = 0;
          v124 = 0;
          v21 = 0;
          v5->_hasBrandLogoSymbolAssetProcessedCount = 1;
          while (2)
          {
            v125 = *v6;
            v126 = *(_QWORD *)&v4[v125];
            if (v126 == -1 || v126 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetProcessedCount;
              goto LABEL_422;
            }
            v127 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v126);
            *(_QWORD *)&v4[v125] = v126 + 1;
            v21 |= (unint64_t)(v127 & 0x7F) << v123;
            if (v127 < 0)
            {
              v25 = 0;
              v123 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetProcessedCount;
              v27 = v124++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetProcessedCount;
          goto LABEL_423;
        case 0x16u:
          v128 = 0;
          v129 = 0;
          v21 = 0;
          v5->_hasObject2DAssetProcessedCount = 1;
          while (2)
          {
            v130 = *v6;
            v131 = *(_QWORD *)&v4[v130];
            if (v131 == -1 || v131 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetProcessedCount;
              goto LABEL_422;
            }
            v132 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v131);
            *(_QWORD *)&v4[v130] = v131 + 1;
            v21 |= (unint64_t)(v132 & 0x7F) << v128;
            if (v132 < 0)
            {
              v25 = 0;
              v128 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetProcessedCount;
              v27 = v129++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetProcessedCount;
          goto LABEL_423;
        case 0x17u:
          v133 = 0;
          v134 = 0;
          v21 = 0;
          v5->_hasBarcodeDetectionAssetProcessedCount = 1;
          while (2)
          {
            v135 = *v6;
            v136 = *(_QWORD *)&v4[v135];
            if (v136 == -1 || v136 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetProcessedCount;
              goto LABEL_422;
            }
            v137 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v136);
            *(_QWORD *)&v4[v135] = v136 + 1;
            v21 |= (unint64_t)(v137 & 0x7F) << v133;
            if (v137 < 0)
            {
              v25 = 0;
              v133 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetProcessedCount;
              v27 = v134++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetProcessedCount;
          goto LABEL_423;
        case 0x18u:
          v138 = 0;
          v139 = 0;
          v21 = 0;
          v5->_hasSculptureAssetProcessedCount = 1;
          while (2)
          {
            v140 = *v6;
            v141 = *(_QWORD *)&v4[v140];
            if (v141 == -1 || v141 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetProcessedCount;
              goto LABEL_422;
            }
            v142 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v141);
            *(_QWORD *)&v4[v140] = v141 + 1;
            v21 |= (unint64_t)(v142 & 0x7F) << v138;
            if (v142 < 0)
            {
              v25 = 0;
              v138 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetProcessedCount;
              v27 = v139++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetProcessedCount;
          goto LABEL_423;
        case 0x19u:
          v143 = 0;
          v144 = 0;
          v21 = 0;
          v5->_hasSkylineAssetProcessedCount = 1;
          while (2)
          {
            v145 = *v6;
            v146 = *(_QWORD *)&v4[v145];
            if (v146 == -1 || v146 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetProcessedCount;
              goto LABEL_422;
            }
            v147 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v146);
            *(_QWORD *)&v4[v145] = v146 + 1;
            v21 |= (unint64_t)(v147 & 0x7F) << v143;
            if (v147 < 0)
            {
              v25 = 0;
              v143 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetProcessedCount;
              v27 = v144++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetProcessedCount;
          goto LABEL_423;
        case 0x1Au:
          v148 = 0;
          v149 = 0;
          v21 = 0;
          v5->_hasArtAssetSuccessesCount = 1;
          while (2)
          {
            v150 = *v6;
            v151 = *(_QWORD *)&v4[v150];
            if (v151 == -1 || v151 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__artAssetSuccessesCount;
              goto LABEL_422;
            }
            v152 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v151);
            *(_QWORD *)&v4[v150] = v151 + 1;
            v21 |= (unint64_t)(v152 & 0x7F) << v148;
            if (v152 < 0)
            {
              v25 = 0;
              v148 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__artAssetSuccessesCount;
              v27 = v149++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__artAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Bu:
          v153 = 0;
          v154 = 0;
          v21 = 0;
          v5->_hasNatureAssetSuccessesCount = 1;
          while (2)
          {
            v155 = *v6;
            v156 = *(_QWORD *)&v4[v155];
            if (v156 == -1 || v156 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__natureAssetSuccessesCount;
              goto LABEL_422;
            }
            v157 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v156);
            *(_QWORD *)&v4[v155] = v156 + 1;
            v21 |= (unint64_t)(v157 & 0x7F) << v153;
            if (v157 < 0)
            {
              v25 = 0;
              v153 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__natureAssetSuccessesCount;
              v27 = v154++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__natureAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Cu:
          v158 = 0;
          v159 = 0;
          v21 = 0;
          v5->_hasAnimalsAssetSuccessesCount = 1;
          while (2)
          {
            v160 = *v6;
            v161 = *(_QWORD *)&v4[v160];
            if (v161 == -1 || v161 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetSuccessesCount;
              goto LABEL_422;
            }
            v162 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v161);
            *(_QWORD *)&v4[v160] = v161 + 1;
            v21 |= (unint64_t)(v162 & 0x7F) << v158;
            if (v162 < 0)
            {
              v25 = 0;
              v158 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetSuccessesCount;
              v27 = v159++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__animalsAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Du:
          v163 = 0;
          v164 = 0;
          v21 = 0;
          v5->_hasBirdsAssetSuccessesCount = 1;
          while (2)
          {
            v165 = *v6;
            v166 = *(_QWORD *)&v4[v165];
            if (v166 == -1 || v166 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetSuccessesCount;
              goto LABEL_422;
            }
            v167 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v166);
            *(_QWORD *)&v4[v165] = v166 + 1;
            v21 |= (unint64_t)(v167 & 0x7F) << v163;
            if (v167 < 0)
            {
              v25 = 0;
              v163 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetSuccessesCount;
              v27 = v164++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__birdsAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Eu:
          v168 = 0;
          v169 = 0;
          v21 = 0;
          v5->_hasInsectsAssetSuccessesCount = 1;
          while (2)
          {
            v170 = *v6;
            v171 = *(_QWORD *)&v4[v170];
            if (v171 == -1 || v171 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetSuccessesCount;
              goto LABEL_422;
            }
            v172 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v171);
            *(_QWORD *)&v4[v170] = v171 + 1;
            v21 |= (unint64_t)(v172 & 0x7F) << v168;
            if (v172 < 0)
            {
              v25 = 0;
              v168 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetSuccessesCount;
              v27 = v169++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__insectsAssetSuccessesCount;
          goto LABEL_423;
        case 0x1Fu:
          v173 = 0;
          v174 = 0;
          v21 = 0;
          v5->_hasReptilesAssetSuccessesCount = 1;
          while (2)
          {
            v175 = *v6;
            v176 = *(_QWORD *)&v4[v175];
            if (v176 == -1 || v176 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetSuccessesCount;
              goto LABEL_422;
            }
            v177 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v176);
            *(_QWORD *)&v4[v175] = v176 + 1;
            v21 |= (unint64_t)(v177 & 0x7F) << v173;
            if (v177 < 0)
            {
              v25 = 0;
              v173 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetSuccessesCount;
              v27 = v174++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__reptilesAssetSuccessesCount;
          goto LABEL_423;
        case 0x20u:
          v178 = 0;
          v179 = 0;
          v21 = 0;
          v5->_hasMammalsAssetSuccessesCount = 1;
          while (2)
          {
            v180 = *v6;
            v181 = *(_QWORD *)&v4[v180];
            if (v181 == -1 || v181 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetSuccessesCount;
              goto LABEL_422;
            }
            v182 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v181);
            *(_QWORD *)&v4[v180] = v181 + 1;
            v21 |= (unint64_t)(v182 & 0x7F) << v178;
            if (v182 < 0)
            {
              v25 = 0;
              v178 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetSuccessesCount;
              v27 = v179++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__mammalsAssetSuccessesCount;
          goto LABEL_423;
        case 0x21u:
          v183 = 0;
          v184 = 0;
          v21 = 0;
          v5->_hasLandmarkAssetSuccessesCount = 1;
          while (2)
          {
            v185 = *v6;
            v186 = *(_QWORD *)&v4[v185];
            if (v186 == -1 || v186 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetSuccessesCount;
              goto LABEL_422;
            }
            v187 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v186);
            *(_QWORD *)&v4[v185] = v186 + 1;
            v21 |= (unint64_t)(v187 & 0x7F) << v183;
            if (v187 < 0)
            {
              v25 = 0;
              v183 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetSuccessesCount;
              v27 = v184++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__landmarkAssetSuccessesCount;
          goto LABEL_423;
        case 0x22u:
          v188 = 0;
          v189 = 0;
          v21 = 0;
          v5->_hasNaturalLandmarkSuccessesAssetCount = 1;
          while (2)
          {
            v190 = *v6;
            v191 = *(_QWORD *)&v4[v190];
            if (v191 == -1 || v191 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkSuccessesAssetCount;
              goto LABEL_422;
            }
            v192 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v191);
            *(_QWORD *)&v4[v190] = v191 + 1;
            v21 |= (unint64_t)(v192 & 0x7F) << v188;
            if (v192 < 0)
            {
              v25 = 0;
              v188 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkSuccessesAssetCount;
              v27 = v189++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__naturalLandmarkSuccessesAssetCount;
          goto LABEL_423;
        case 0x23u:
          v193 = 0;
          v194 = 0;
          v21 = 0;
          v5->_hasMediaAssetSuccessesCount = 1;
          while (2)
          {
            v195 = *v6;
            v196 = *(_QWORD *)&v4[v195];
            if (v196 == -1 || v196 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetSuccessesCount;
              goto LABEL_422;
            }
            v197 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v196);
            *(_QWORD *)&v4[v195] = v196 + 1;
            v21 |= (unint64_t)(v197 & 0x7F) << v193;
            if (v197 < 0)
            {
              v25 = 0;
              v193 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetSuccessesCount;
              v27 = v194++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__mediaAssetSuccessesCount;
          goto LABEL_423;
        case 0x24u:
          v198 = 0;
          v199 = 0;
          v21 = 0;
          v5->_hasBookAssetSuccessesCount = 1;
          while (2)
          {
            v200 = *v6;
            v201 = *(_QWORD *)&v4[v200];
            if (v201 == -1 || v201 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__bookAssetSuccessesCount;
              goto LABEL_422;
            }
            v202 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v201);
            *(_QWORD *)&v4[v200] = v201 + 1;
            v21 |= (unint64_t)(v202 & 0x7F) << v198;
            if (v202 < 0)
            {
              v25 = 0;
              v198 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__bookAssetSuccessesCount;
              v27 = v199++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__bookAssetSuccessesCount;
          goto LABEL_423;
        case 0x25u:
          v203 = 0;
          v204 = 0;
          v21 = 0;
          v5->_hasAlbumAssetSuccessesCount = 1;
          while (2)
          {
            v205 = *v6;
            v206 = *(_QWORD *)&v4[v205];
            if (v206 == -1 || v206 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__albumAssetSuccessesCount;
              goto LABEL_422;
            }
            v207 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v206);
            *(_QWORD *)&v4[v205] = v206 + 1;
            v21 |= (unint64_t)(v207 & 0x7F) << v203;
            if (v207 < 0)
            {
              v25 = 0;
              v203 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__albumAssetSuccessesCount;
              v27 = v204++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__albumAssetSuccessesCount;
          goto LABEL_423;
        case 0x26u:
          v208 = 0;
          v209 = 0;
          v21 = 0;
          v5->_hasCatsAssetSuccessesCount = 1;
          while (2)
          {
            v210 = *v6;
            v211 = *(_QWORD *)&v4[v210];
            if (v211 == -1 || v211 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__catsAssetSuccessesCount;
              goto LABEL_422;
            }
            v212 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v211);
            *(_QWORD *)&v4[v210] = v211 + 1;
            v21 |= (unint64_t)(v212 & 0x7F) << v208;
            if (v212 < 0)
            {
              v25 = 0;
              v208 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__catsAssetSuccessesCount;
              v27 = v209++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__catsAssetSuccessesCount;
          goto LABEL_423;
        case 0x27u:
          v213 = 0;
          v214 = 0;
          v21 = 0;
          v5->_hasDogsAssetSuccessesCount = 1;
          while (2)
          {
            v215 = *v6;
            v216 = *(_QWORD *)&v4[v215];
            if (v216 == -1 || v216 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetSuccessesCount;
              goto LABEL_422;
            }
            v217 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v216);
            *(_QWORD *)&v4[v215] = v216 + 1;
            v21 |= (unint64_t)(v217 & 0x7F) << v213;
            if (v217 < 0)
            {
              v25 = 0;
              v213 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetSuccessesCount;
              v27 = v214++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__dogsAssetSuccessesCount;
          goto LABEL_423;
        case 0x28u:
          v218 = 0;
          v219 = 0;
          v21 = 0;
          v5->_hasApparelAssetSuccessesCount = 1;
          while (2)
          {
            v220 = *v6;
            v221 = *(_QWORD *)&v4[v220];
            if (v221 == -1 || v221 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetSuccessesCount;
              goto LABEL_422;
            }
            v222 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v221);
            *(_QWORD *)&v4[v220] = v221 + 1;
            v21 |= (unint64_t)(v222 & 0x7F) << v218;
            if (v222 < 0)
            {
              v25 = 0;
              v218 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetSuccessesCount;
              v27 = v219++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__apparelAssetSuccessesCount;
          goto LABEL_423;
        case 0x29u:
          v223 = 0;
          v224 = 0;
          v21 = 0;
          v5->_hasFoodAssetSuccessesCount = 1;
          while (2)
          {
            v225 = *v6;
            v226 = *(_QWORD *)&v4[v225];
            if (v226 == -1 || v226 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__foodAssetSuccessesCount;
              goto LABEL_422;
            }
            v227 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v226);
            *(_QWORD *)&v4[v225] = v226 + 1;
            v21 |= (unint64_t)(v227 & 0x7F) << v223;
            if (v227 < 0)
            {
              v25 = 0;
              v223 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__foodAssetSuccessesCount;
              v27 = v224++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__foodAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Au:
          v228 = 0;
          v229 = 0;
          v21 = 0;
          v5->_hasStorefrontAssetSuccessesCount = 1;
          while (2)
          {
            v230 = *v6;
            v231 = *(_QWORD *)&v4[v230];
            if (v231 == -1 || v231 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetSuccessesCount;
              goto LABEL_422;
            }
            v232 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v231);
            *(_QWORD *)&v4[v230] = v231 + 1;
            v21 |= (unint64_t)(v232 & 0x7F) << v228;
            if (v232 < 0)
            {
              v25 = 0;
              v228 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetSuccessesCount;
              v27 = v229++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__storefrontAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Bu:
          v233 = 0;
          v234 = 0;
          v21 = 0;
          v5->_hasSignSymbolAssetSuccessesCount = 1;
          while (2)
          {
            v235 = *v6;
            v236 = *(_QWORD *)&v4[v235];
            if (v236 == -1 || v236 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            v237 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v236);
            *(_QWORD *)&v4[v235] = v236 + 1;
            v21 |= (unint64_t)(v237 & 0x7F) << v233;
            if (v237 < 0)
            {
              v25 = 0;
              v233 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetSuccessesCount;
              v27 = v234++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__signSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Cu:
          v238 = 0;
          v239 = 0;
          v21 = 0;
          v5->_hasLaundryCareSymbolAssetSuccessesCount = 1;
          while (2)
          {
            v240 = *v6;
            v241 = *(_QWORD *)&v4[v240];
            if (v241 == -1 || v241 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            v242 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v241);
            *(_QWORD *)&v4[v240] = v241 + 1;
            v21 |= (unint64_t)(v242 & 0x7F) << v238;
            if (v242 < 0)
            {
              v25 = 0;
              v238 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetSuccessesCount;
              v27 = v239++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__laundryCareSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Du:
          v243 = 0;
          v244 = 0;
          v21 = 0;
          v5->_hasAutoSymbolAssetSuccessesCount = 1;
          while (2)
          {
            v245 = *v6;
            v246 = *(_QWORD *)&v4[v245];
            if (v246 == -1 || v246 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            v247 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v246);
            *(_QWORD *)&v4[v245] = v246 + 1;
            v21 |= (unint64_t)(v247 & 0x7F) << v243;
            if (v247 < 0)
            {
              v25 = 0;
              v243 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetSuccessesCount;
              v27 = v244++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__autoSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Eu:
          v248 = 0;
          v249 = 0;
          v21 = 0;
          v5->_hasBrandLogoSymbolAssetSuccessesCount = 1;
          while (2)
          {
            v250 = *v6;
            v251 = *(_QWORD *)&v4[v250];
            if (v251 == -1 || v251 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetSuccessesCount;
              goto LABEL_422;
            }
            v252 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v251);
            *(_QWORD *)&v4[v250] = v251 + 1;
            v21 |= (unint64_t)(v252 & 0x7F) << v248;
            if (v252 < 0)
            {
              v25 = 0;
              v248 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetSuccessesCount;
              v27 = v249++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__brandLogoSymbolAssetSuccessesCount;
          goto LABEL_423;
        case 0x2Fu:
          v253 = 0;
          v254 = 0;
          v21 = 0;
          v5->_hasObject2DAssetSuccessesCount = 1;
          while (2)
          {
            v255 = *v6;
            v256 = *(_QWORD *)&v4[v255];
            if (v256 == -1 || v256 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetSuccessesCount;
              goto LABEL_422;
            }
            v257 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v256);
            *(_QWORD *)&v4[v255] = v256 + 1;
            v21 |= (unint64_t)(v257 & 0x7F) << v253;
            if (v257 < 0)
            {
              v25 = 0;
              v253 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetSuccessesCount;
              v27 = v254++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__object2DAssetSuccessesCount;
          goto LABEL_423;
        case 0x30u:
          v258 = 0;
          v259 = 0;
          v21 = 0;
          v5->_hasBarcodeDetectionAssetSuccessesCount = 1;
          while (2)
          {
            v260 = *v6;
            v261 = *(_QWORD *)&v4[v260];
            if (v261 == -1 || v261 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetSuccessesCount;
              goto LABEL_422;
            }
            v262 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v261);
            *(_QWORD *)&v4[v260] = v261 + 1;
            v21 |= (unint64_t)(v262 & 0x7F) << v258;
            if (v262 < 0)
            {
              v25 = 0;
              v258 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetSuccessesCount;
              v27 = v259++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__barcodeDetectionAssetSuccessesCount;
          goto LABEL_423;
        case 0x31u:
          v263 = 0;
          v264 = 0;
          v21 = 0;
          v5->_hasSculptureAssetSuccessesCount = 1;
          while (2)
          {
            v265 = *v6;
            v266 = *(_QWORD *)&v4[v265];
            if (v266 == -1 || v266 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetSuccessesCount;
              goto LABEL_422;
            }
            v267 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v266);
            *(_QWORD *)&v4[v265] = v266 + 1;
            v21 |= (unint64_t)(v267 & 0x7F) << v263;
            if (v267 < 0)
            {
              v25 = 0;
              v263 += 7;
              v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetSuccessesCount;
              v27 = v264++ > 8;
              if (v27)
                goto LABEL_426;
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMPECProcessed__sculptureAssetSuccessesCount;
          goto LABEL_423;
        case 0x32u:
          v268 = 0;
          v269 = 0;
          v21 = 0;
          v5->_hasSkylineAssetSuccessesCount = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_480;
          continue;
      }
      while (1)
      {
        v270 = *v6;
        v271 = *(_QWORD *)&v4[v270];
        if (v271 == -1 || v271 >= *(_QWORD *)&v4[*v7])
          break;
        v272 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v271);
        *(_QWORD *)&v4[v270] = v271 + 1;
        v21 |= (unint64_t)(v272 & 0x7F) << v268;
        if ((v272 & 0x80) == 0)
        {
          v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetSuccessesCount;
          goto LABEL_423;
        }
        v25 = 0;
        v268 += 7;
        v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetSuccessesCount;
        v27 = v269++ > 8;
        if (v27)
          goto LABEL_426;
      }
      v26 = &OBJC_IVAR___BMPECProcessed__skylineAssetSuccessesCount;
LABEL_422:
      v4[*v8] = 1;
LABEL_423:
      v25 = v4[*v8] ? 0 : v21;
LABEL_426:
      *(_DWORD *)((char *)&v5->super.super.isa + *v26) = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_480:
    v273 = 0;
  else
LABEL_481:
    v273 = v5;

  return v273;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasArtAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNatureAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAnimalsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBirdsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasInsectsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasReptilesAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasMammalsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasLandmarkAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNaturalLandmarkProcessedAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasMediaAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBookAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAlbumAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCatsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasDogsAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasApparelAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasFoodAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasStorefrontAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSignSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasLaundryCareSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAutoSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBrandLogoSymbolAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasObject2DAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBarcodeDetectionAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSculptureAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSkylineAssetProcessedCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasArtAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNatureAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAnimalsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBirdsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasInsectsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasReptilesAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasMammalsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasLandmarkAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNaturalLandmarkSuccessesAssetCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasMediaAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBookAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAlbumAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCatsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasDogsAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasApparelAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasFoodAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasStorefrontAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSignSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasLaundryCareSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAutoSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBrandLogoSymbolAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasObject2DAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasBarcodeDetectionAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSculptureAssetSuccessesCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSkylineAssetSuccessesCount)
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
  -[BMPECProcessed writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPECProcessed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
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
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  BMPECProcessed *v38;
  id v39;
  uint64_t v40;
  void *v41;
  BMPECProcessed *v42;
  id v43;
  id *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  id *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id *v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id *v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id *v82;
  uint64_t v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  id v152;
  id *v153;
  uint64_t v154;
  id v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id *v161;
  id v162;
  uint64_t v163;
  id v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  id *v169;
  uint64_t v170;
  id v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  _QWORD *v177;
  uint64_t v178;
  id v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  id v187;
  void *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  id *v192;
  id v193;
  uint64_t v194;
  id v195;
  void *v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  id *v200;
  id v201;
  uint64_t v202;
  id v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  id *v207;
  id v208;
  uint64_t v209;
  id v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  id *v214;
  id v215;
  uint64_t v216;
  id v217;
  void *v218;
  void *v219;
  uint64_t v220;
  uint64_t v221;
  id *v222;
  id v223;
  uint64_t v224;
  id v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  id *v229;
  id v230;
  uint64_t v231;
  id v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  id *v236;
  id v237;
  uint64_t v238;
  id v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  id *v243;
  id v244;
  uint64_t v245;
  id v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  id *v250;
  id v251;
  uint64_t v252;
  id v253;
  void *v254;
  uint64_t v255;
  uint64_t v256;
  id *v257;
  id v258;
  uint64_t v259;
  id v260;
  void *v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  id *v265;
  id v266;
  uint64_t v267;
  id v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  id *v272;
  id v273;
  uint64_t v274;
  id v275;
  void *v276;
  void *v277;
  uint64_t v278;
  uint64_t v279;
  id *v280;
  id v281;
  uint64_t v282;
  id v283;
  void *v284;
  uint64_t v285;
  uint64_t v286;
  id *v287;
  id v288;
  uint64_t v289;
  id v290;
  void *v291;
  id v292;
  uint64_t v293;
  uint64_t v294;
  id v295;
  id *v296;
  id v297;
  uint64_t v298;
  id v299;
  void *v300;
  uint64_t v301;
  uint64_t v302;
  id *v303;
  id v304;
  uint64_t v305;
  id v306;
  void *v307;
  uint64_t v308;
  uint64_t v309;
  id *v310;
  id v311;
  uint64_t v312;
  id v313;
  void *v314;
  uint64_t v315;
  uint64_t v316;
  id *v317;
  id v318;
  uint64_t v319;
  id v320;
  void *v321;
  uint64_t v322;
  uint64_t v323;
  id *v324;
  id v325;
  uint64_t v326;
  id v327;
  void *v328;
  uint64_t v329;
  uint64_t v330;
  id *v331;
  id v332;
  uint64_t v333;
  id v334;
  void *v335;
  uint64_t v336;
  uint64_t v337;
  id *v338;
  id v339;
  uint64_t v340;
  id v341;
  void *v342;
  void *v343;
  uint64_t v344;
  id *v345;
  id v346;
  uint64_t v347;
  id v348;
  void *v349;
  void *v350;
  uint64_t v351;
  id *v352;
  id v353;
  uint64_t v354;
  id v355;
  void *v356;
  id v357;
  uint64_t v358;
  uint64_t v359;
  id *v360;
  id v361;
  uint64_t v362;
  id v363;
  void *v364;
  uint64_t v365;
  uint64_t v366;
  id *v367;
  id v368;
  uint64_t v369;
  id v370;
  void *v371;
  uint64_t v372;
  uint64_t v373;
  id *v374;
  id v375;
  uint64_t v376;
  id v377;
  void *v378;
  uint64_t v379;
  uint64_t v380;
  id *v381;
  id v382;
  uint64_t v383;
  id v384;
  void *v385;
  uint64_t v386;
  uint64_t v387;
  id *v388;
  id v389;
  uint64_t v390;
  id v391;
  void *v392;
  uint64_t v393;
  uint64_t v394;
  BMPECProcessed *v395;
  id v396;
  uint64_t v397;
  id v398;
  uint64_t v399;
  id v400;
  uint64_t v401;
  id v402;
  id v403;
  BMPECProcessed *v404;
  id v405;
  uint64_t v406;
  id v407;
  BMPECProcessed *v408;
  void *v409;
  id v410;
  uint64_t v411;
  id v412;
  id v413;
  uint64_t v414;
  id v415;
  void *v416;
  id v417;
  uint64_t v418;
  id v419;
  id v420;
  uint64_t v421;
  id v422;
  id v423;
  void *v424;
  void *v425;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  id v470;
  void *v471;
  id v472;
  void *v473;
  id v474;
  void *v475;
  id v476;
  void *v477;
  id v478;
  void *v479;
  void *v480;
  void *v481;
  id v482;
  id v483;
  void *v484;
  void *v485;
  id v486;
  id v487;
  void *v488;
  id v489;
  id v490;
  void *v491;
  void *v492;
  id v493;
  void *v494;
  id v495;
  id v496;
  void *v497;
  id v498;
  void *v499;
  id v500;
  void *v501;
  id v502;
  void *v503;
  id v504;
  void *v505;
  id v506;
  void *v507;
  id v508;
  void *v509;
  id v510;
  id v511;
  void *v512;
  void *v513;
  id v514;
  void *v515;
  void *v516;
  id v517;
  void *v518;
  id v519;
  id v520;
  void *v521;
  id v522;
  void *v523;
  id v524;
  void *v525;
  id v526;
  id v527;
  void *v528;
  void *v529;
  id v530;
  void *v531;
  id v532;
  id v533;
  void *v534;
  id v535;
  void *v536;
  _QWORD *v537;
  void *v538;
  _QWORD *v539;
  id v540;
  void *v541;
  id v542;
  void *v543;
  id v544;
  id v545;
  id v546;
  void *v547;
  id v548;
  void *v549;
  id v550;
  void *v551;
  id v552;
  id v553;
  id v554;
  id v555;
  void *v556;
  id v557;
  id v558;
  id v559;
  id v560;
  id v561;
  id v562;
  id v563;
  id v564;
  id v565;
  id v566;
  id v567;
  id v568;
  id v569;
  id v570;
  id v571;
  id v572;
  id v573;
  id v574;
  id v575;
  id v576;
  id v577;
  id v578;
  id v579;
  id v580;
  id v581;
  id v582;
  id v583;
  id v584;
  id v585;
  id v586;
  id v587;
  id v588;
  id v589;
  id v590;
  id v591;
  id v592;
  id v593;
  id v594;
  id v595;
  uint64_t v596;
  id v597;
  id v598;
  void *v599;
  void *v600;
  void *v601;
  id v602;
  id v603;
  void *v604;
  id v605;
  uint64_t v606;
  id v607;
  id v608;
  id v609;
  id v610;
  void *v611;
  uint64_t v612;
  void *v613;
  uint64_t v614;
  void *v615;
  uint64_t v616;
  void *v617;
  uint64_t v618;
  id v619;
  uint64_t v620;
  id v621;
  uint64_t v622;
  id v623;
  uint64_t v624;
  id v625;
  uint64_t v626;
  id v627;
  uint64_t v628;
  id v629;
  uint64_t v630;
  id v631;
  uint64_t v632;
  id v633;
  uint64_t v634;
  id v635;
  uint64_t v636;
  void *v637;
  uint64_t v638;
  id v639;
  uint64_t v640;
  id v641;
  uint64_t v642;
  id v643;
  uint64_t v644;
  id v645;
  uint64_t v646;
  id v647;
  uint64_t v648;
  id v649;
  uint64_t v650;
  id v651;
  uint64_t v652;
  id v653;
  uint64_t v654;
  id v655;
  uint64_t v656;
  id v657;
  uint64_t v658;
  id v659;
  uint64_t v660;
  id v661;
  uint64_t v662;
  void *v663;
  uint64_t v664;
  id v665;
  uint64_t v666;
  void *v667;
  uint64_t v668;
  id v669;
  uint64_t v670;
  id v671;
  uint64_t v672;
  id v673;
  uint64_t v674;
  id v675;
  uint64_t v676;
  id v677;
  uint64_t v678;
  void *v679;
  uint64_t v680;
  id v681;
  uint64_t v682;
  id v683;
  uint64_t v684;
  void *v685;
  uint64_t v686;
  void *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  id v693;
  uint64_t v694;
  void *v695;
  uint64_t v696;
  id v697;
  uint64_t v698;
  id v699;
  uint64_t v700;
  id v701;
  uint64_t v702;
  void *v703;
  uint64_t v704;
  id v705;
  uint64_t v706;
  id v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  _QWORD v711[3];

  v711[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artAssetProcessedCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("natureAssetProcessedCount"));
    v611 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v611 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v610 = v8;
      v9 = a4;
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v610 = v8;
      v9 = a4;
      v10 = v611;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animalsAssetProcessedCount"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v607 = v10;
        v12 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v607 = v10;
        v12 = v11;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("birdsAssetProcessedCount"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v601 = v13;
          v608 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v601 = v13;
          v608 = v13;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("insectsAssetProcessedCount"));
          v14 = objc_claimAutoreleasedReturnValue();
          v604 = (void *)v14;
          if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v602 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v602 = v15;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reptilesAssetProcessedCount"));
            v16 = objc_claimAutoreleasedReturnValue();
            v600 = (void *)v16;
            if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v557 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v557 = v17;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mammalsAssetProcessedCount"));
              v18 = objc_claimAutoreleasedReturnValue();
              v599 = (void *)v18;
              if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v597 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v597 = v19;
LABEL_22:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("landmarkAssetProcessedCount"));
                v20 = objc_claimAutoreleasedReturnValue();
                v556 = (void *)v20;
                if (!v20 || (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v552 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v552 = v21;
LABEL_25:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("naturalLandmarkProcessedAssetCount"));
                  v22 = objc_claimAutoreleasedReturnValue();
                  v551 = (void *)v22;
                  if (!v22 || (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v24 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v24 = v23;
LABEL_28:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaAssetProcessedCount"));
                    v25 = objc_claimAutoreleasedReturnValue();
                    v549 = (void *)v25;
                    if (!v25 || (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v544 = 0;
LABEL_31:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bookAssetProcessedCount"));
                      v27 = objc_claimAutoreleasedReturnValue();
                      v547 = (void *)v27;
                      if (v27 && (v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v9)
                          {
                            v545 = 0;
                            v38 = 0;
                            v48 = v601;
                            v8 = v610;
LABEL_455:
                            v157 = v544;
                            goto LABEL_456;
                          }
                          v169 = v9;
                          v546 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v564 = v12;
                          v170 = *MEMORY[0x1E0D025B8];
                          v690 = *MEMORY[0x1E0CB2D50];
                          v171 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v434 = objc_opt_class();
                          v172 = v171;
                          v8 = v610;
                          v173 = objc_msgSend(v172, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v434, CFSTR("bookAssetProcessedCount"));
                          v691 = v173;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v691, &v690, 1);
                          v174 = objc_claimAutoreleasedReturnValue();
                          v175 = v170;
                          v12 = v564;
                          v543 = (void *)v174;
                          v176 = (id)objc_msgSend(v546, "initWithDomain:code:userInfo:", v175, 2);
                          v38 = 0;
                          v545 = 0;
                          *v169 = v176;
                          v177 = (_QWORD *)v173;
                          v48 = v601;
                          goto LABEL_454;
                        }
                        v545 = v28;
                      }
                      else
                      {
                        v545 = 0;
                      }
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("albumAssetProcessedCount"));
                      v29 = objc_claimAutoreleasedReturnValue();
                      v540 = v24;
                      v543 = (void *)v29;
                      if (!v29 || (v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v31 = 0;
LABEL_37:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("catsAssetProcessedCount"));
                        v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                        v539 = v31;
                        v541 = v32;
                        if (!v32)
                          goto LABEL_85;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v32 = 0;
                          goto LABEL_85;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v32 = v32;
LABEL_85:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dogsAssetProcessedCount"));
                          v89 = objc_claimAutoreleasedReturnValue();
                          v537 = v32;
                          v538 = (void *)v89;
                          if (!v89 || (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v535 = 0;
                            goto LABEL_88;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v535 = v90;
LABEL_88:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("apparelAssetProcessedCount"));
                            v91 = objc_claimAutoreleasedReturnValue();
                            v536 = (void *)v91;
                            if (!v91 || (v92 = (void *)v91, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v533 = 0;
                              goto LABEL_91;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v533 = v92;
LABEL_91:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("foodAssetProcessedCount"));
                              v93 = objc_claimAutoreleasedReturnValue();
                              v534 = (void *)v93;
                              if (!v93 || (v94 = (void *)v93, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v532 = 0;
LABEL_94:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storefrontAssetProcessedCount"));
                                v95 = objc_claimAutoreleasedReturnValue();
                                v531 = (void *)v95;
                                if (v95 && (v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v9)
                                    {
                                      v530 = 0;
                                      v38 = 0;
                                      v48 = v601;
                                      v8 = v610;
LABEL_448:
                                      v197 = v533;
                                      goto LABEL_449;
                                    }
                                    v214 = v9;
                                    v215 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v570 = v12;
                                    v216 = *MEMORY[0x1E0D025B8];
                                    v678 = *MEMORY[0x1E0CB2D50];
                                    v217 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v440 = objc_opt_class();
                                    v218 = v217;
                                    v8 = v610;
                                    v219 = (void *)objc_msgSend(v218, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v440, CFSTR("storefrontAssetProcessedCount"));
                                    v679 = v219;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v679, &v678, 1);
                                    v220 = objc_claimAutoreleasedReturnValue();
                                    v221 = v216;
                                    v12 = v570;
                                    v529 = (void *)v220;
                                    v38 = 0;
                                    v530 = 0;
                                    *v214 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v221, 2);
                                    v48 = v601;
                                    goto LABEL_267;
                                  }
                                  v530 = v96;
                                }
                                else
                                {
                                  v530 = 0;
                                }
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signSymbolAssetProcessedCount"));
                                v97 = objc_claimAutoreleasedReturnValue();
                                v529 = (void *)v97;
                                if (!v97 || (v98 = (void *)v97, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v526 = 0;
                                  goto LABEL_100;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v526 = v98;
LABEL_100:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("laundryCareSymbolAssetProcessedCount"));
                                  v99 = objc_claimAutoreleasedReturnValue();
                                  v528 = (void *)v99;
                                  if (!v99
                                    || (v100 = (void *)v99, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v527 = 0;
                                    goto LABEL_103;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v527 = v100;
LABEL_103:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autoSymbolAssetProcessedCount"));
                                    v101 = objc_claimAutoreleasedReturnValue();
                                    v525 = (void *)v101;
                                    if (!v101
                                      || (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v524 = 0;
                                      goto LABEL_106;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v524 = v102;
LABEL_106:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("brandLogoSymbolAssetProcessedCount"));
                                      v103 = objc_claimAutoreleasedReturnValue();
                                      v523 = (void *)v103;
                                      if (!v103
                                        || (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v522 = 0;
                                        goto LABEL_109;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v522 = v104;
LABEL_109:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("object2DAssetProcessedCount"));
                                        v105 = objc_claimAutoreleasedReturnValue();
                                        v521 = (void *)v105;
                                        if (!v105
                                          || (v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v520 = 0;
LABEL_112:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("barcodeDetectionAssetProcessedCount"));
                                          v107 = objc_claimAutoreleasedReturnValue();
                                          v518 = (void *)v107;
                                          if (v107
                                            && (v108 = (void *)v107,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) == 0))
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v9)
                                              {
                                                v517 = 0;
                                                v38 = 0;
                                                v48 = v601;
                                                v8 = v610;
LABEL_441:
                                                v219 = v526;
                                                goto LABEL_442;
                                              }
                                              v257 = v9;
                                              v258 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v576 = v12;
                                              v259 = *MEMORY[0x1E0D025B8];
                                              v666 = *MEMORY[0x1E0CB2D50];
                                              v260 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v446 = objc_opt_class();
                                              v261 = v260;
                                              v8 = v610;
                                              v262 = (void *)objc_msgSend(v261, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v446, CFSTR("barcodeDetectionAssetProcessedCount"));
                                              v667 = v262;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v667, &v666, 1);
                                              v263 = objc_claimAutoreleasedReturnValue();
                                              v264 = v259;
                                              v12 = v576;
                                              v516 = (void *)v263;
                                              v38 = 0;
                                              v517 = 0;
                                              *v257 = (id)objc_msgSend(v258, "initWithDomain:code:userInfo:", v264, 2);
                                              v48 = v601;
                                              goto LABEL_298;
                                            }
                                            v517 = v108;
                                          }
                                          else
                                          {
                                            v517 = 0;
                                          }
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sculptureAssetProcessedCount"));
                                          v109 = objc_claimAutoreleasedReturnValue();
                                          v516 = (void *)v109;
                                          if (!v109
                                            || (v110 = (void *)v109,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v519 = 0;
LABEL_118:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("skylineAssetProcessedCount"));
                                            v111 = objc_claimAutoreleasedReturnValue();
                                            v515 = (void *)v111;
                                            if (v111
                                              && (v112 = (void *)v111,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                              {
                                                if (!v9)
                                                {
                                                  v514 = 0;
                                                  v38 = 0;
                                                  v48 = v601;
                                                  v8 = v610;
LABEL_438:
                                                  v262 = v519;
                                                  goto LABEL_439;
                                                }
                                                v272 = v9;
                                                v273 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v578 = v12;
                                                v274 = *MEMORY[0x1E0D025B8];
                                                v662 = *MEMORY[0x1E0CB2D50];
                                                v275 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v448 = objc_opt_class();
                                                v276 = v275;
                                                v8 = v610;
                                                v277 = (void *)objc_msgSend(v276, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v448, CFSTR("skylineAssetProcessedCount"));
                                                v663 = v277;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v663, &v662, 1);
                                                v278 = objc_claimAutoreleasedReturnValue();
                                                v279 = v274;
                                                v12 = v578;
                                                v513 = (void *)v278;
                                                v38 = 0;
                                                v514 = 0;
                                                *v272 = (id)objc_msgSend(v273, "initWithDomain:code:userInfo:", v279, 2);
                                                v48 = v601;
                                                goto LABEL_309;
                                              }
                                              v514 = v112;
                                            }
                                            else
                                            {
                                              v514 = 0;
                                            }
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artAssetSuccessesCount"));
                                            v113 = objc_claimAutoreleasedReturnValue();
                                            v513 = (void *)v113;
                                            if (!v113
                                              || (v114 = (void *)v113,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v510 = 0;
LABEL_124:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("natureAssetSuccessesCount"));
                                              v115 = objc_claimAutoreleasedReturnValue();
                                              v512 = (void *)v115;
                                              if (v115
                                                && (v116 = (void *)v115,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  if (!v9)
                                                  {
                                                    v511 = 0;
                                                    v38 = 0;
                                                    v48 = v601;
                                                    v8 = v610;
LABEL_435:
                                                    v277 = v510;
                                                    goto LABEL_436;
                                                  }
                                                  v287 = v9;
                                                  v288 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v580 = v12;
                                                  v289 = *MEMORY[0x1E0D025B8];
                                                  v658 = *MEMORY[0x1E0CB2D50];
                                                  v290 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v450 = objc_opt_class();
                                                  v291 = v290;
                                                  v8 = v610;
                                                  v292 = v533;
                                                  v508 = (id)objc_msgSend(v291, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v450, CFSTR("natureAssetSuccessesCount"));
                                                  v659 = v508;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v659, &v658, 1);
                                                  v293 = objc_claimAutoreleasedReturnValue();
                                                  v294 = v289;
                                                  v12 = v580;
                                                  v509 = (void *)v293;
                                                  v38 = 0;
                                                  v511 = 0;
                                                  *v287 = (id)objc_msgSend(v288, "initWithDomain:code:userInfo:", v294, 2);
                                                  v48 = v601;
                                                  v32 = v537;
LABEL_434:
                                                  v533 = v292;

                                                  goto LABEL_435;
                                                }
                                                v511 = v116;
                                              }
                                              else
                                              {
                                                v511 = 0;
                                              }
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animalsAssetSuccessesCount"));
                                              v117 = objc_claimAutoreleasedReturnValue();
                                              v509 = (void *)v117;
                                              if (v117
                                                && (v118 = (void *)v117,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  v295 = v519;
                                                  if (!v9)
                                                  {
                                                    v508 = 0;
                                                    v38 = 0;
                                                    v48 = v601;
                                                    v8 = v610;
LABEL_433:
                                                    v292 = v533;
                                                    goto LABEL_434;
                                                  }
                                                  v296 = v9;
                                                  v297 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v581 = v12;
                                                  v298 = *MEMORY[0x1E0D025B8];
                                                  v656 = *MEMORY[0x1E0CB2D50];
                                                  v299 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v451 = objc_opt_class();
                                                  v300 = v299;
                                                  v8 = v610;
                                                  v506 = (id)objc_msgSend(v300, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v451, CFSTR("animalsAssetSuccessesCount"));
                                                  v657 = v506;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v657, &v656, 1);
                                                  v301 = objc_claimAutoreleasedReturnValue();
                                                  v302 = v298;
                                                  v12 = v581;
                                                  v507 = (void *)v301;
                                                  v38 = 0;
                                                  v508 = 0;
                                                  *v296 = (id)objc_msgSend(v297, "initWithDomain:code:userInfo:", v302, 2);
                                                  v48 = v601;
                                                  v32 = v537;
                                                  goto LABEL_432;
                                                }
                                                v508 = v118;
                                              }
                                              else
                                              {
                                                v508 = 0;
                                              }
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("birdsAssetSuccessesCount"));
                                              v119 = objc_claimAutoreleasedReturnValue();
                                              v507 = (void *)v119;
                                              if (!v119
                                                || (v120 = (void *)v119,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v506 = 0;
                                                goto LABEL_133;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v506 = v120;
LABEL_133:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("insectsAssetSuccessesCount"));
                                                v121 = objc_claimAutoreleasedReturnValue();
                                                v505 = (void *)v121;
                                                if (!v121
                                                  || (v122 = (void *)v121,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v504 = 0;
                                                  goto LABEL_136;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v504 = v122;
LABEL_136:
                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reptilesAssetSuccessesCount"));
                                                  v123 = objc_claimAutoreleasedReturnValue();
                                                  v503 = (void *)v123;
                                                  if (!v123
                                                    || (v124 = (void *)v123,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v502 = 0;
                                                    goto LABEL_139;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v502 = v124;
LABEL_139:
                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mammalsAssetSuccessesCount"));
                                                    v125 = objc_claimAutoreleasedReturnValue();
                                                    v501 = (void *)v125;
                                                    if (!v125
                                                      || (v126 = (void *)v125,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v500 = 0;
                                                      goto LABEL_142;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v500 = v126;
LABEL_142:
                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("landmarkAssetSuccessesCount"));
                                                      v127 = objc_claimAutoreleasedReturnValue();
                                                      v499 = (void *)v127;
                                                      if (!v127
                                                        || (v128 = (void *)v127,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v498 = 0;
LABEL_145:
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("naturalLandmarkSuccessesAssetCount"));
                                                        v129 = objc_claimAutoreleasedReturnValue();
                                                        v497 = (void *)v129;
                                                        if (v129
                                                          && (v130 = (void *)v129,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              v496 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
LABEL_426:
                                                              v295 = v519;
                                                              goto LABEL_427;
                                                            }
                                                            v338 = v9;
                                                            v339 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v587 = v12;
                                                            v340 = *MEMORY[0x1E0D025B8];
                                                            v644 = *MEMORY[0x1E0CB2D50];
                                                            v341 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v457 = objc_opt_class();
                                                            v342 = v341;
                                                            v8 = v610;
                                                            v495 = (id)objc_msgSend(v342, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v457, CFSTR("naturalLandmarkSuccessesAssetCount"));
                                                            v645 = v495;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v645, &v644, 1);
                                                            v343 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v344 = v340;
                                                            v12 = v587;
                                                            v38 = 0;
                                                            v496 = 0;
                                                            *v338 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v344, 2, v343);
                                                            v48 = v601;
                                                            v32 = v537;
LABEL_425:

                                                            goto LABEL_426;
                                                          }
                                                          v496 = v130;
                                                        }
                                                        else
                                                        {
                                                          v496 = 0;
                                                        }
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaAssetSuccessesCount"));
                                                        v131 = objc_claimAutoreleasedReturnValue();
                                                        v494 = (void *)v131;
                                                        if (v131
                                                          && (v132 = (void *)v131,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              v495 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
LABEL_424:
                                                              v343 = v494;
                                                              goto LABEL_425;
                                                            }
                                                            v345 = v9;
                                                            v346 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v588 = v12;
                                                            v347 = *MEMORY[0x1E0D025B8];
                                                            v642 = *MEMORY[0x1E0CB2D50];
                                                            v348 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v458 = objc_opt_class();
                                                            v349 = v348;
                                                            v8 = v610;
                                                            v493 = (id)objc_msgSend(v349, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v458, CFSTR("mediaAssetSuccessesCount"));
                                                            v643 = v493;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v643, &v642, 1);
                                                            v350 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v351 = v347;
                                                            v12 = v588;
                                                            v38 = 0;
                                                            v495 = 0;
                                                            *v345 = (id)objc_msgSend(v346, "initWithDomain:code:userInfo:", v351, 2, v350);
                                                            v48 = v601;
                                                            v32 = v537;
LABEL_423:

                                                            goto LABEL_424;
                                                          }
                                                          v495 = v132;
                                                        }
                                                        else
                                                        {
                                                          v495 = 0;
                                                        }
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bookAssetSuccessesCount"));
                                                        v133 = objc_claimAutoreleasedReturnValue();
                                                        v492 = (void *)v133;
                                                        if (v133
                                                          && (v134 = (void *)v133,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                        {
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                          {
                                                            if (!v9)
                                                            {
                                                              v493 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
LABEL_422:
                                                              v350 = v492;
                                                              goto LABEL_423;
                                                            }
                                                            v352 = v9;
                                                            v353 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v589 = v12;
                                                            v354 = *MEMORY[0x1E0D025B8];
                                                            v640 = *MEMORY[0x1E0CB2D50];
                                                            v355 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v459 = objc_opt_class();
                                                            v356 = v355;
                                                            v8 = v610;
                                                            v357 = v519;
                                                            v490 = (id)objc_msgSend(v356, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v459, CFSTR("bookAssetSuccessesCount"));
                                                            v641 = v490;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v641, &v640, 1);
                                                            v358 = objc_claimAutoreleasedReturnValue();
                                                            v359 = v354;
                                                            v12 = v589;
                                                            v491 = (void *)v358;
                                                            v38 = 0;
                                                            v493 = 0;
                                                            *v352 = (id)objc_msgSend(v353, "initWithDomain:code:userInfo:", v359, 2);
                                                            v48 = v601;
                                                            goto LABEL_365;
                                                          }
                                                          v493 = v134;
                                                        }
                                                        else
                                                        {
                                                          v493 = 0;
                                                        }
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("albumAssetSuccessesCount"));
                                                        v135 = objc_claimAutoreleasedReturnValue();
                                                        v491 = (void *)v135;
                                                        if (!v135
                                                          || (v136 = (void *)v135,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v490 = 0;
LABEL_157:
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("catsAssetSuccessesCount"));
                                                          v137 = objc_claimAutoreleasedReturnValue();
                                                          v488 = (void *)v137;
                                                          if (v137
                                                            && (v138 = (void *)v137,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                            {
                                                              if (!v9)
                                                              {
                                                                v489 = 0;
                                                                v38 = 0;
                                                                v48 = v601;
                                                                v8 = v610;
LABEL_419:
                                                                v357 = v519;
                                                                goto LABEL_420;
                                                              }
                                                              v367 = v9;
                                                              v368 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v591 = v12;
                                                              v369 = *MEMORY[0x1E0D025B8];
                                                              v636 = *MEMORY[0x1E0CB2D50];
                                                              v370 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                              v461 = objc_opt_class();
                                                              v371 = v370;
                                                              v8 = v610;
                                                              v149 = (void *)objc_msgSend(v371, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v461, CFSTR("catsAssetSuccessesCount"));
                                                              v637 = v149;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v637, &v636, 1);
                                                              v372 = objc_claimAutoreleasedReturnValue();
                                                              v373 = v369;
                                                              v12 = v591;
                                                              v485 = (void *)v372;
                                                              v38 = 0;
                                                              v489 = 0;
                                                              *v367 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v373, 2);
                                                              v48 = v601;
                                                              goto LABEL_376;
                                                            }
                                                            v489 = v138;
                                                          }
                                                          else
                                                          {
                                                            v489 = 0;
                                                          }
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dogsAssetSuccessesCount"));
                                                          v139 = objc_claimAutoreleasedReturnValue();
                                                          v485 = (void *)v139;
                                                          if (!v139
                                                            || (v140 = (void *)v139,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v486 = 0;
                                                            goto LABEL_163;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v486 = v140;
LABEL_163:
                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("apparelAssetSuccessesCount"));
                                                            v141 = objc_claimAutoreleasedReturnValue();
                                                            v484 = (void *)v141;
                                                            if (!v141
                                                              || (v142 = (void *)v141,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v487 = 0;
                                                              goto LABEL_166;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v487 = v142;
LABEL_166:
                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("foodAssetSuccessesCount"));
                                                              v143 = objc_claimAutoreleasedReturnValue();
                                                              v481 = (void *)v143;
                                                              if (!v143
                                                                || (v144 = (void *)v143,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v482 = 0;
                                                                goto LABEL_169;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v482 = v144;
LABEL_169:
                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storefrontAssetSuccessesCount"));
                                                                v145 = objc_claimAutoreleasedReturnValue();
                                                                v480 = (void *)v145;
                                                                if (!v145
                                                                  || (v146 = (void *)v145,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v483 = 0;
                                                                  goto LABEL_172;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v483 = v146;
LABEL_172:
                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signSymbolAssetSuccessesCount"));
                                                                  v147 = objc_claimAutoreleasedReturnValue();
                                                                  v479 = (void *)v147;
                                                                  if (!v147
                                                                    || (v148 = (void *)v147,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v548 = 0;
                                                                    goto LABEL_175;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v548 = v148;
LABEL_175:
                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("laundryCareSymbolAssetSuccessesCount"));
                                                                    v477 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if (!v477
                                                                      || (objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v478 = 0;
LABEL_178:
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autoSymbolAssetSuccessesCount"));
                                                                      v149 = v486;
                                                                      v475 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (v475
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v404 = self;
                                                                          if (!v9)
                                                                          {
                                                                            v476 = 0;
                                                                            v38 = 0;
                                                                            v48 = v601;
                                                                            v8 = v610;
                                                                            goto LABEL_412;
                                                                          }
                                                                          v405 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v406 = *MEMORY[0x1E0D025B8];
                                                                          v622 = *MEMORY[0x1E0CB2D50];
                                                                          v474 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("autoSymbolAssetSuccessesCount"));
                                                                          v623 = v474;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v623, &v622, 1);
                                                                          v473 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v407 = (id)objc_msgSend(v405, "initWithDomain:code:userInfo:", v406, 2);
                                                                          v38 = 0;
                                                                          v476 = 0;
                                                                          *v9 = v407;
                                                                          self = v404;
                                                                          v48 = v601;
                                                                          v8 = v610;
                                                                          goto LABEL_411;
                                                                        }
                                                                        v476 = v475;
                                                                      }
                                                                      else
                                                                      {
                                                                        v476 = 0;
                                                                      }
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("brandLogoSymbolAssetSuccessesCount"));
                                                                      v473 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (v473
                                                                        && (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v409 = v11;
                                                                          if (!v9)
                                                                          {
                                                                            v474 = 0;
                                                                            v38 = 0;
                                                                            v48 = v601;
                                                                            v8 = v610;
                                                                            v149 = v486;
                                                                            goto LABEL_411;
                                                                          }
                                                                          v410 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v411 = *MEMORY[0x1E0D025B8];
                                                                          v620 = *MEMORY[0x1E0CB2D50];
                                                                          v472 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("brandLogoSymbolAssetSuccessesCount"));
                                                                          v621 = v472;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v621, &v620, 1);
                                                                          v471 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v412 = (id)objc_msgSend(v410, "initWithDomain:code:userInfo:", v411, 2);
                                                                          v38 = 0;
                                                                          v474 = 0;
                                                                          *v9 = v412;
                                                                          goto LABEL_470;
                                                                        }
                                                                        v474 = v473;
                                                                      }
                                                                      else
                                                                      {
                                                                        v474 = 0;
                                                                      }
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("object2DAssetSuccessesCount"));
                                                                      v471 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      if (!v471
                                                                        || (objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v472 = 0;
                                                                        goto LABEL_187;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v472 = v471;
LABEL_187:
                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("barcodeDetectionAssetSuccessesCount"));
                                                                        v469 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        if (!v469
                                                                          || (objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          v470 = 0;
                                                                          v150 = v487;
                                                                          v151 = v489;
LABEL_190:
                                                                          v487 = v150;
                                                                          v486 = v149;
                                                                          v489 = v151;
                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sculptureAssetSuccessesCount"));
                                                                          v152 = (id)objc_claimAutoreleasedReturnValue();
                                                                          v468 = v152;
                                                                          if (!v152)
                                                                          {
LABEL_379:
                                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("skylineAssetSuccessesCount"));
                                                                            v402 = (id)objc_claimAutoreleasedReturnValue();
                                                                            v466 = v402;
                                                                            v467 = v152;
                                                                            if (!v402)
                                                                            {
LABEL_382:
                                                                              v48 = v601;
                                                                              v8 = v610;
                                                                              v403 = v533;
LABEL_383:
                                                                              v465 = v402;
                                                                              v533 = v403;
                                                                              self = objc_retain(-[BMPECProcessed initWithArtAssetProcessedCount:natureAssetProcessedCount:animalsAssetProcessedCount:birdsAssetProcessedCount:insectsAssetProcessedCount:reptilesAssetProcessedCount:mammalsAssetProcessedCount:landmarkAssetProcessedCount:naturalLandmarkProcessedAssetCount:mediaAssetProcessedCount:bookAssetProcessedCount:albumAssetProcessedCount:catsAssetProcessedCount:dogsAssetProcessedCount:apparelAssetProcessedCount:foodAssetProcessedCount:storefrontAssetProcessedCount:signSymbolAssetProcessedCount:laundryCareSymbolAssetProcessedCount:autoSymbolAssetProcessedCount:brandLogoSymbolAssetProcessedCount:object2DAssetProcessedCount:barcodeDetectionAssetProcessedCount:sculptureAssetProcessedCount:skylineAssetProcessedCount:artAssetSuccessesCount:natureAssetSuccessesCount:animalsAssetSuccessesCount:birdsAssetSuccessesCount:insectsAssetSuccessesCount:reptilesAssetSuccessesCount:mammalsAssetSuccessesCount:landmarkAssetSuccessesCount:naturalLandmarkSuccessesAssetCount:mediaAssetSuccessesCount:bookAssetSuccessesCount:albumAssetSuccessesCount:catsAssetSuccessesCount:dogsAssetSuccessesCount:apparelAssetSuccessesCount:foodAssetSuccessesCount:storefrontAssetSuccessesCount:signSymbolAssetSuccessesCount:laundryCareSymbolAssetSuccessesCount:autoSymbolAssetSuccessesCount:brandLogoSymbolAssetSuccessesCount:object2DAssetSuccessesCount:barcodeDetectionAssetSuccessesCount:sculptureAssetSuccessesCount:skylineAssetSuccessesCount:](self, "initWithArtAssetProcessedCount:natureAssetProcessedCount:animalsAssetProcessedCount:birdsAssetProcessedCount:insectsAssetProcessedCount:reptilesAssetProcessedCount:mammalsAssetProcessedCount:landmarkAssetProcessedCount:naturalLandmarkProcessedAssetCount:mediaAssetProcessedCount:bookAssetProcessedCount:albumAssetProcessedCount:catsAssetProcessedCount:dogsAssetProcessedCount:apparelAssetProcessedCount:foodAssetProcessedCount:storefrontAssetProcessedCount:signSymbolAssetProcessedCount:laundryCareSymbolAssetProcessedCount:aut"
                                                                                         "oSymbolAssetProcessedCount:bran"
                                                                                         "dLogoSymbolAssetProcessedCount:"
                                                                                         "object2DAssetProcessedCount:bar"
                                                                                         "codeDetectionAssetProcessedCoun"
                                                                                         "t:sculptureAssetProcessedCount:"
                                                                                         "skylineAssetProcessedCount:artA"
                                                                                         "ssetSuccessesCount:natureAssetS"
                                                                                         "uccessesCount:animalsAssetSucce"
                                                                                         "ssesCount:birdsAssetSuccessesCo"
                                                                                         "unt:insectsAssetSuccessesCount:"
                                                                                         "reptilesAssetSuccessesCount:mam"
                                                                                         "malsAssetSuccessesCount:landmar"
                                                                                         "kAssetSuccessesCount:naturalLan"
                                                                                         "dmarkSuccessesAssetCount:mediaA"
                                                                                         "ssetSuccessesCount:bookAssetSuc"
                                                                                         "cessesCount:albumAssetSuccesses"
                                                                                         "Count:catsAssetSuccessesCount:d"
                                                                                         "ogsAssetSuccessesCount:apparelA"
                                                                                         "ssetSuccessesCount:foodAssetSuc"
                                                                                         "cessesCount:storefrontAssetSucc"
                                                                                         "essesCount:signSymbolAssetSucce"
                                                                                         "ssesCount:laundryCareSymbolAsse"
                                                                                         "tSuccessesCount:autoSymbolAsset"
                                                                                         "SuccessesCount:brandLogoSymbolA"
                                                                                         "ssetSuccessesCount:object2DAsse"
                                                                                         "tSuccessesCount:barcodeDetectio"
                                                                                         "nAssetSuccessesCount:sculptureA"
                                                                                         "ssetSuccessesCount:skylineAssetSuccessesCount:",
                                                                                         v8,
                                                                                         v607,
                                                                                         v12,
                                                                                         v608,
                                                                                         v602,
                                                                                         v557,
                                                                                         v597,
                                                                                         v552,
                                                                                         v540,
                                                                                         v544,
                                                                                         v545,
                                                                                         v539,
                                                                                         v32,
                                                                                         v535,
                                                                                         v403,
                                                                                         v532,
                                                                                         v530,
                                                                                         v526,
                                                                                         v527,
                                                                                         v524,
                                                                                         v522,
                                                                                         v520,
                                                                                         v517,
                                                                                         v519,
                                                                                         v514,
                                                                                         v510,
                                                                                         v511,
                                                                                         v508,
                                                                                         v506,
                                                                                         v504,
                                                                                         v502,
                                                                                         v500,
                                                                                         v498,
                                                                                         v496,
                                                                                         v495,
                                                                                         v493,
                                                                                         v490,
                                                                                         v489,
                                                                                         v486,
                                                                                         v487,
                                                                                         v482,
                                                                                         v483,
                                                                                         v548,
                                                                                         v478,
                                                                                         v476,
                                                                                         v474,
                                                                                         v472,
                                                                                         v470,
                                                                                         v152,
                                                                                         v402));
                                                                              v38 = self;
LABEL_407:

LABEL_408:
                                                                              v149 = v486;

LABEL_409:
LABEL_410:

LABEL_411:
                                                                              goto LABEL_412;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v402 = 0;
                                                                              goto LABEL_382;
                                                                            }
                                                                            v408 = self;
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v402 = v466;
                                                                              v8 = v610;
                                                                              v48 = v601;
                                                                              v403 = v533;
                                                                              goto LABEL_383;
                                                                            }
                                                                            if (v9)
                                                                            {
                                                                              v423 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v596 = *MEMORY[0x1E0D025B8];
                                                                              v612 = *MEMORY[0x1E0CB2D50];
                                                                              v424 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("skylineAssetSuccessesCount"));
                                                                              v613 = v424;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v613, &v612, 1);
                                                                              v425 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              *v9 = (id)objc_msgSend(v423, "initWithDomain:code:userInfo:", v596, 2, v425);

                                                                            }
                                                                            v465 = 0;
                                                                            v38 = 0;
                                                                            self = v408;
                                                                            v8 = v610;
LABEL_406:
                                                                            v48 = v601;
                                                                            v32 = v537;
                                                                            goto LABEL_407;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v152 = 0;
                                                                            goto LABEL_379;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v152 = v152;
                                                                            goto LABEL_379;
                                                                          }
                                                                          v595 = v12;
                                                                          v555 = v6;
                                                                          v416 = v610;
                                                                          if (v9)
                                                                          {
                                                                            v420 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v421 = *MEMORY[0x1E0D025B8];
                                                                            v614 = *MEMORY[0x1E0CB2D50];
                                                                            v465 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sculptureAssetSuccessesCount"));
                                                                            v615 = v465;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v615, &v614, 1);
                                                                            v466 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v422 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                            v38 = 0;
                                                                            v467 = 0;
                                                                            *v9 = v422;
                                                                            v8 = v610;
                                                                            v6 = v555;
                                                                            goto LABEL_406;
                                                                          }
                                                                          v467 = 0;
                                                                          v38 = 0;
LABEL_474:
                                                                          v8 = v416;
                                                                          v6 = v555;
                                                                          v12 = v595;
                                                                          v48 = v601;
                                                                          goto LABEL_408;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v470 = v469;
                                                                          v151 = v489;
                                                                          v149 = v486;
                                                                          v150 = v487;
                                                                          goto LABEL_190;
                                                                        }
                                                                        v595 = v12;
                                                                        v555 = v6;
                                                                        v416 = v610;
                                                                        if (v9)
                                                                        {
                                                                          v417 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v418 = *MEMORY[0x1E0D025B8];
                                                                          v616 = *MEMORY[0x1E0CB2D50];
                                                                          v467 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("barcodeDetectionAssetSuccessesCount"));
                                                                          v617 = v467;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v617, &v616, 1);
                                                                          v468 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v419 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                          v38 = 0;
                                                                          v470 = 0;
                                                                          *v9 = v419;
                                                                          goto LABEL_474;
                                                                        }
                                                                        v470 = 0;
                                                                        v38 = 0;
                                                                        v8 = v610;
                                                                        v6 = v555;
                                                                        v48 = v601;
LABEL_472:
                                                                        v32 = v537;
                                                                        v149 = v486;
                                                                        goto LABEL_409;
                                                                      }
                                                                      v409 = v11;
                                                                      if (v9)
                                                                      {
                                                                        v413 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v414 = *MEMORY[0x1E0D025B8];
                                                                        v618 = *MEMORY[0x1E0CB2D50];
                                                                        v470 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("object2DAssetSuccessesCount"));
                                                                        v619 = v470;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v619, &v618, 1);
                                                                        v469 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v415 = (id)objc_msgSend(v413, "initWithDomain:code:userInfo:", v414, 2);
                                                                        v38 = 0;
                                                                        v472 = 0;
                                                                        *v9 = v415;
                                                                        v48 = v601;
                                                                        v8 = v610;
                                                                        goto LABEL_472;
                                                                      }
                                                                      v472 = 0;
                                                                      v38 = 0;
LABEL_470:
                                                                      v48 = v601;
                                                                      v8 = v610;
                                                                      v11 = v409;
                                                                      v32 = v537;
                                                                      v149 = v486;
                                                                      goto LABEL_410;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v478 = v477;
                                                                      goto LABEL_178;
                                                                    }
                                                                    v395 = self;
                                                                    if (v9)
                                                                    {
                                                                      v400 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v401 = *MEMORY[0x1E0D025B8];
                                                                      v624 = *MEMORY[0x1E0CB2D50];
                                                                      v476 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("laundryCareSymbolAssetSuccessesCount"));
                                                                      v625 = v476;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v625, &v624, 1);
                                                                      v475 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v38 = 0;
                                                                      v478 = 0;
                                                                      *v9 = (id)objc_msgSend(v400, "initWithDomain:code:userInfo:", v401, 2);
                                                                      self = v395;
                                                                      v48 = v601;
                                                                      v8 = v610;
                                                                      v149 = v486;
LABEL_412:

                                                                      goto LABEL_413;
                                                                    }
                                                                    v478 = 0;
                                                                    v38 = 0;
LABEL_402:
                                                                    self = v395;
                                                                    v48 = v601;
                                                                    v8 = v610;
                                                                    v149 = v486;
LABEL_413:

                                                                    goto LABEL_414;
                                                                  }
                                                                  v395 = self;
                                                                  if (v9)
                                                                  {
                                                                    v398 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v399 = *MEMORY[0x1E0D025B8];
                                                                    v626 = *MEMORY[0x1E0CB2D50];
                                                                    v478 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("signSymbolAssetSuccessesCount"));
                                                                    v627 = v478;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v627, &v626, 1);
                                                                    v477 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v38 = 0;
                                                                    v548 = 0;
                                                                    *v9 = (id)objc_msgSend(v398, "initWithDomain:code:userInfo:", v399, 2);
                                                                    goto LABEL_402;
                                                                  }
                                                                  v548 = 0;
                                                                  v38 = 0;
LABEL_398:
                                                                  self = v395;
                                                                  v48 = v601;
                                                                  v8 = v610;
                                                                  v149 = v486;
LABEL_414:

                                                                  goto LABEL_415;
                                                                }
                                                                v395 = self;
                                                                if (v9)
                                                                {
                                                                  v396 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v397 = *MEMORY[0x1E0D025B8];
                                                                  v628 = *MEMORY[0x1E0CB2D50];
                                                                  v548 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("storefrontAssetSuccessesCount"));
                                                                  v629 = v548;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v629, &v628, 1);
                                                                  v479 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v38 = 0;
                                                                  v483 = 0;
                                                                  *v9 = (id)objc_msgSend(v396, "initWithDomain:code:userInfo:", v397, 2);
                                                                  goto LABEL_398;
                                                                }
                                                                v483 = 0;
                                                                v38 = 0;
                                                                v48 = v601;
                                                                v8 = v610;
                                                                v149 = v486;
LABEL_415:

                                                                goto LABEL_416;
                                                              }
                                                              if (v9)
                                                              {
                                                                v388 = v9;
                                                                v389 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v594 = v12;
                                                                v390 = *MEMORY[0x1E0D025B8];
                                                                v630 = *MEMORY[0x1E0CB2D50];
                                                                v391 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                                v464 = objc_opt_class();
                                                                v392 = v391;
                                                                v8 = v610;
                                                                v149 = v486;
                                                                v483 = (id)objc_msgSend(v392, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v464, CFSTR("foodAssetSuccessesCount"));
                                                                v631 = v483;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v631, &v630, 1);
                                                                v393 = objc_claimAutoreleasedReturnValue();
                                                                v394 = v390;
                                                                v12 = v594;
                                                                v480 = (void *)v393;
                                                                v38 = 0;
                                                                v482 = 0;
                                                                *v388 = (id)objc_msgSend(v389, "initWithDomain:code:userInfo:", v394, 2);
                                                                v48 = v601;
                                                                v32 = v537;
                                                                goto LABEL_415;
                                                              }
                                                              v482 = 0;
                                                              v38 = 0;
                                                              v48 = v601;
                                                              v8 = v610;
                                                              v149 = v486;
LABEL_416:

                                                              goto LABEL_417;
                                                            }
                                                            if (v9)
                                                            {
                                                              v381 = v9;
                                                              v382 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v593 = v12;
                                                              v383 = *MEMORY[0x1E0D025B8];
                                                              v632 = *MEMORY[0x1E0CB2D50];
                                                              v384 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                              v463 = objc_opt_class();
                                                              v385 = v384;
                                                              v8 = v610;
                                                              v149 = v486;
                                                              v482 = (id)objc_msgSend(v385, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v463, CFSTR("apparelAssetSuccessesCount"));
                                                              v633 = v482;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v633, &v632, 1);
                                                              v386 = objc_claimAutoreleasedReturnValue();
                                                              v387 = v383;
                                                              v12 = v593;
                                                              v481 = (void *)v386;
                                                              v38 = 0;
                                                              v487 = 0;
                                                              *v381 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v387, 2);
                                                              v48 = v601;
                                                              v32 = v537;
                                                              goto LABEL_416;
                                                            }
                                                            v487 = 0;
                                                            v38 = 0;
                                                            v48 = v601;
                                                            v8 = v610;
                                                            v149 = v486;
LABEL_417:

                                                            goto LABEL_418;
                                                          }
                                                          if (v9)
                                                          {
                                                            v374 = v9;
                                                            v375 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v592 = v12;
                                                            v376 = *MEMORY[0x1E0D025B8];
                                                            v634 = *MEMORY[0x1E0CB2D50];
                                                            v377 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                            v462 = objc_opt_class();
                                                            v378 = v377;
                                                            v8 = v610;
                                                            v487 = (id)objc_msgSend(v378, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v462, CFSTR("dogsAssetSuccessesCount"));
                                                            v635 = v487;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v635, &v634, 1);
                                                            v379 = objc_claimAutoreleasedReturnValue();
                                                            v380 = v376;
                                                            v12 = v592;
                                                            v484 = (void *)v379;
                                                            v38 = 0;
                                                            v149 = 0;
                                                            *v374 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v380, 2);
                                                            v48 = v601;
                                                            v32 = v537;
                                                            goto LABEL_417;
                                                          }
                                                          v149 = 0;
                                                          v38 = 0;
                                                          v48 = v601;
                                                          v8 = v610;
LABEL_376:
                                                          v32 = v537;
LABEL_418:

                                                          goto LABEL_419;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v490 = v136;
                                                          goto LABEL_157;
                                                        }
                                                        v357 = v519;
                                                        if (v9)
                                                        {
                                                          v360 = v9;
                                                          v361 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v590 = v12;
                                                          v362 = *MEMORY[0x1E0D025B8];
                                                          v638 = *MEMORY[0x1E0CB2D50];
                                                          v363 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                          v460 = objc_opt_class();
                                                          v364 = v363;
                                                          v8 = v610;
                                                          v489 = (id)objc_msgSend(v364, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v460, CFSTR("albumAssetSuccessesCount"));
                                                          v639 = v489;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v639, &v638, 1);
                                                          v365 = objc_claimAutoreleasedReturnValue();
                                                          v366 = v362;
                                                          v12 = v590;
                                                          v488 = (void *)v365;
                                                          v38 = 0;
                                                          v490 = 0;
                                                          *v360 = (id)objc_msgSend(v361, "initWithDomain:code:userInfo:", v366, 2);
                                                          v48 = v601;
                                                          v32 = v537;
LABEL_420:

                                                          goto LABEL_421;
                                                        }
                                                        v490 = 0;
                                                        v38 = 0;
                                                        v48 = v601;
                                                        v8 = v610;
LABEL_365:
                                                        v32 = v537;
LABEL_421:
                                                        v519 = v357;

                                                        goto LABEL_422;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v498 = v128;
                                                        goto LABEL_145;
                                                      }
                                                      if (v9)
                                                      {
                                                        v331 = v9;
                                                        v332 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v586 = v12;
                                                        v333 = *MEMORY[0x1E0D025B8];
                                                        v646 = *MEMORY[0x1E0CB2D50];
                                                        v334 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                        v456 = objc_opt_class();
                                                        v335 = v334;
                                                        v8 = v610;
                                                        v295 = v519;
                                                        v496 = (id)objc_msgSend(v335, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v456, CFSTR("landmarkAssetSuccessesCount"));
                                                        v647 = v496;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v647, &v646, 1);
                                                        v336 = objc_claimAutoreleasedReturnValue();
                                                        v337 = v333;
                                                        v12 = v586;
                                                        v497 = (void *)v336;
                                                        v38 = 0;
                                                        v498 = 0;
                                                        *v331 = (id)objc_msgSend(v332, "initWithDomain:code:userInfo:", v337, 2);
                                                        v48 = v601;
                                                        v32 = v537;
LABEL_427:

                                                        goto LABEL_428;
                                                      }
                                                      v498 = 0;
                                                      v38 = 0;
                                                      v48 = v601;
                                                      v8 = v610;
                                                      v295 = v519;
LABEL_428:

                                                      goto LABEL_429;
                                                    }
                                                    if (v9)
                                                    {
                                                      v324 = v9;
                                                      v325 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v585 = v12;
                                                      v326 = *MEMORY[0x1E0D025B8];
                                                      v648 = *MEMORY[0x1E0CB2D50];
                                                      v327 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                      v455 = objc_opt_class();
                                                      v328 = v327;
                                                      v8 = v610;
                                                      v295 = v519;
                                                      v498 = (id)objc_msgSend(v328, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v455, CFSTR("mammalsAssetSuccessesCount"));
                                                      v649 = v498;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v649, &v648, 1);
                                                      v329 = objc_claimAutoreleasedReturnValue();
                                                      v330 = v326;
                                                      v12 = v585;
                                                      v499 = (void *)v329;
                                                      v38 = 0;
                                                      v500 = 0;
                                                      *v324 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v330, 2);
                                                      v48 = v601;
                                                      v32 = v537;
                                                      goto LABEL_428;
                                                    }
                                                    v500 = 0;
                                                    v38 = 0;
                                                    v48 = v601;
                                                    v8 = v610;
                                                    v295 = v519;
LABEL_429:

                                                    goto LABEL_430;
                                                  }
                                                  if (v9)
                                                  {
                                                    v317 = v9;
                                                    v318 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v584 = v12;
                                                    v319 = *MEMORY[0x1E0D025B8];
                                                    v650 = *MEMORY[0x1E0CB2D50];
                                                    v320 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                    v454 = objc_opt_class();
                                                    v321 = v320;
                                                    v8 = v610;
                                                    v295 = v519;
                                                    v500 = (id)objc_msgSend(v321, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v454, CFSTR("reptilesAssetSuccessesCount"));
                                                    v651 = v500;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v651, &v650, 1);
                                                    v322 = objc_claimAutoreleasedReturnValue();
                                                    v323 = v319;
                                                    v12 = v584;
                                                    v501 = (void *)v322;
                                                    v38 = 0;
                                                    v502 = 0;
                                                    *v317 = (id)objc_msgSend(v318, "initWithDomain:code:userInfo:", v323, 2);
                                                    v48 = v601;
                                                    v32 = v537;
                                                    goto LABEL_429;
                                                  }
                                                  v502 = 0;
                                                  v38 = 0;
                                                  v48 = v601;
                                                  v8 = v610;
                                                  v295 = v519;
LABEL_430:

                                                  goto LABEL_431;
                                                }
                                                if (v9)
                                                {
                                                  v310 = v9;
                                                  v311 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v583 = v12;
                                                  v312 = *MEMORY[0x1E0D025B8];
                                                  v652 = *MEMORY[0x1E0CB2D50];
                                                  v313 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                  v453 = objc_opt_class();
                                                  v314 = v313;
                                                  v8 = v610;
                                                  v295 = v519;
                                                  v502 = (id)objc_msgSend(v314, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v453, CFSTR("insectsAssetSuccessesCount"));
                                                  v653 = v502;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v653, &v652, 1);
                                                  v315 = objc_claimAutoreleasedReturnValue();
                                                  v316 = v312;
                                                  v12 = v583;
                                                  v503 = (void *)v315;
                                                  v38 = 0;
                                                  v504 = 0;
                                                  *v310 = (id)objc_msgSend(v311, "initWithDomain:code:userInfo:", v316, 2);
                                                  v48 = v601;
                                                  v32 = v537;
                                                  goto LABEL_430;
                                                }
                                                v504 = 0;
                                                v38 = 0;
                                                v48 = v601;
                                                v8 = v610;
                                                v295 = v519;
LABEL_431:

                                                goto LABEL_432;
                                              }
                                              if (v9)
                                              {
                                                v303 = v9;
                                                v304 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v582 = v12;
                                                v305 = *MEMORY[0x1E0D025B8];
                                                v654 = *MEMORY[0x1E0CB2D50];
                                                v306 = objc_alloc(MEMORY[0x1E0CB3940]);
                                                v452 = objc_opt_class();
                                                v307 = v306;
                                                v8 = v610;
                                                v295 = v519;
                                                v504 = (id)objc_msgSend(v307, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v452, CFSTR("birdsAssetSuccessesCount"));
                                                v655 = v504;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v655, &v654, 1);
                                                v308 = objc_claimAutoreleasedReturnValue();
                                                v309 = v305;
                                                v12 = v582;
                                                v505 = (void *)v308;
                                                v38 = 0;
                                                v506 = 0;
                                                *v303 = (id)objc_msgSend(v304, "initWithDomain:code:userInfo:", v309, 2);
                                                v48 = v601;
                                                v32 = v537;
                                                goto LABEL_431;
                                              }
                                              v506 = 0;
                                              v38 = 0;
                                              v48 = v601;
                                              v8 = v610;
                                              v295 = v519;
LABEL_432:
                                              v519 = v295;

                                              goto LABEL_433;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v510 = v114;
                                              goto LABEL_124;
                                            }
                                            if (v9)
                                            {
                                              v280 = v9;
                                              v281 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v579 = v12;
                                              v282 = *MEMORY[0x1E0D025B8];
                                              v660 = *MEMORY[0x1E0CB2D50];
                                              v283 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v449 = objc_opt_class();
                                              v284 = v283;
                                              v8 = v610;
                                              v511 = (id)objc_msgSend(v284, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v449, CFSTR("artAssetSuccessesCount"));
                                              v661 = v511;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v661, &v660, 1);
                                              v285 = objc_claimAutoreleasedReturnValue();
                                              v286 = v282;
                                              v12 = v579;
                                              v512 = (void *)v285;
                                              v38 = 0;
                                              v277 = 0;
                                              *v280 = (id)objc_msgSend(v281, "initWithDomain:code:userInfo:", v286, 2);
                                              v48 = v601;
                                              v32 = v537;
LABEL_436:

                                              goto LABEL_437;
                                            }
                                            v277 = 0;
                                            v38 = 0;
                                            v48 = v601;
                                            v8 = v610;
LABEL_309:
                                            v32 = v537;
LABEL_437:

                                            goto LABEL_438;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v519 = v110;
                                            goto LABEL_118;
                                          }
                                          if (v9)
                                          {
                                            v265 = v9;
                                            v266 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v577 = v12;
                                            v267 = *MEMORY[0x1E0D025B8];
                                            v664 = *MEMORY[0x1E0CB2D50];
                                            v268 = objc_alloc(MEMORY[0x1E0CB3940]);
                                            v447 = objc_opt_class();
                                            v269 = v268;
                                            v8 = v610;
                                            v514 = (id)objc_msgSend(v269, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v447, CFSTR("sculptureAssetProcessedCount"));
                                            v665 = v514;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v665, &v664, 1);
                                            v270 = objc_claimAutoreleasedReturnValue();
                                            v271 = v267;
                                            v12 = v577;
                                            v515 = (void *)v270;
                                            v38 = 0;
                                            v262 = 0;
                                            *v265 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v271, 2);
                                            v48 = v601;
                                            v32 = v537;
LABEL_439:

                                            goto LABEL_440;
                                          }
                                          v262 = 0;
                                          v38 = 0;
                                          v48 = v601;
                                          v8 = v610;
LABEL_298:
                                          v32 = v537;
LABEL_440:

                                          goto LABEL_441;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v520 = v106;
                                          goto LABEL_112;
                                        }
                                        if (v9)
                                        {
                                          v250 = v9;
                                          v251 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v575 = v12;
                                          v252 = *MEMORY[0x1E0D025B8];
                                          v668 = *MEMORY[0x1E0CB2D50];
                                          v253 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v445 = objc_opt_class();
                                          v254 = v253;
                                          v8 = v610;
                                          v219 = v526;
                                          v517 = (id)objc_msgSend(v254, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v445, CFSTR("object2DAssetProcessedCount"));
                                          v669 = v517;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v669, &v668, 1);
                                          v255 = objc_claimAutoreleasedReturnValue();
                                          v256 = v252;
                                          v12 = v575;
                                          v518 = (void *)v255;
                                          v38 = 0;
                                          v520 = 0;
                                          *v250 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v256, 2);
                                          v48 = v601;
                                          v32 = v537;
LABEL_442:

                                          goto LABEL_443;
                                        }
                                        v520 = 0;
                                        v38 = 0;
                                        v48 = v601;
                                        v8 = v610;
                                        v219 = v526;
LABEL_443:

                                        goto LABEL_444;
                                      }
                                      if (v9)
                                      {
                                        v243 = v9;
                                        v244 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v574 = v12;
                                        v245 = *MEMORY[0x1E0D025B8];
                                        v670 = *MEMORY[0x1E0CB2D50];
                                        v246 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v444 = objc_opt_class();
                                        v247 = v246;
                                        v8 = v610;
                                        v219 = v526;
                                        v520 = (id)objc_msgSend(v247, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v444, CFSTR("brandLogoSymbolAssetProcessedCount"));
                                        v671 = v520;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v671, &v670, 1);
                                        v248 = objc_claimAutoreleasedReturnValue();
                                        v249 = v245;
                                        v12 = v574;
                                        v521 = (void *)v248;
                                        v38 = 0;
                                        v522 = 0;
                                        *v243 = (id)objc_msgSend(v244, "initWithDomain:code:userInfo:", v249, 2);
                                        v48 = v601;
                                        v32 = v537;
                                        goto LABEL_443;
                                      }
                                      v522 = 0;
                                      v38 = 0;
                                      v48 = v601;
                                      v8 = v610;
                                      v219 = v526;
LABEL_444:

                                      goto LABEL_445;
                                    }
                                    if (v9)
                                    {
                                      v236 = v9;
                                      v237 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v573 = v12;
                                      v238 = *MEMORY[0x1E0D025B8];
                                      v672 = *MEMORY[0x1E0CB2D50];
                                      v239 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v443 = objc_opt_class();
                                      v240 = v239;
                                      v8 = v610;
                                      v219 = v526;
                                      v522 = (id)objc_msgSend(v240, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v443, CFSTR("autoSymbolAssetProcessedCount"));
                                      v673 = v522;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v673, &v672, 1);
                                      v241 = objc_claimAutoreleasedReturnValue();
                                      v242 = v238;
                                      v12 = v573;
                                      v523 = (void *)v241;
                                      v38 = 0;
                                      v524 = 0;
                                      *v236 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v242, 2);
                                      v48 = v601;
                                      v32 = v537;
                                      goto LABEL_444;
                                    }
                                    v524 = 0;
                                    v38 = 0;
                                    v48 = v601;
                                    v8 = v610;
                                    v219 = v526;
LABEL_445:

                                    goto LABEL_446;
                                  }
                                  if (v9)
                                  {
                                    v229 = v9;
                                    v230 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v572 = v12;
                                    v231 = *MEMORY[0x1E0D025B8];
                                    v674 = *MEMORY[0x1E0CB2D50];
                                    v232 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v442 = objc_opt_class();
                                    v233 = v232;
                                    v8 = v610;
                                    v219 = v526;
                                    v524 = (id)objc_msgSend(v233, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v442, CFSTR("laundryCareSymbolAssetProcessedCount"));
                                    v675 = v524;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v675, &v674, 1);
                                    v234 = objc_claimAutoreleasedReturnValue();
                                    v235 = v231;
                                    v12 = v572;
                                    v525 = (void *)v234;
                                    v38 = 0;
                                    v527 = 0;
                                    *v229 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v235, 2);
                                    v48 = v601;
                                    v32 = v537;
                                    goto LABEL_445;
                                  }
                                  v527 = 0;
                                  v38 = 0;
                                  v48 = v601;
                                  v8 = v610;
                                  v219 = v526;
LABEL_446:

                                  goto LABEL_447;
                                }
                                if (v9)
                                {
                                  v222 = v9;
                                  v223 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v571 = v12;
                                  v224 = *MEMORY[0x1E0D025B8];
                                  v676 = *MEMORY[0x1E0CB2D50];
                                  v225 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v441 = objc_opt_class();
                                  v226 = v225;
                                  v8 = v610;
                                  v527 = (id)objc_msgSend(v226, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v441, CFSTR("signSymbolAssetProcessedCount"));
                                  v677 = v527;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v677, &v676, 1);
                                  v227 = objc_claimAutoreleasedReturnValue();
                                  v228 = v224;
                                  v12 = v571;
                                  v528 = (void *)v227;
                                  v38 = 0;
                                  v219 = 0;
                                  *v222 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v228, 2);
                                  v48 = v601;
                                  v32 = v537;
                                  goto LABEL_446;
                                }
                                v219 = 0;
                                v38 = 0;
                                v48 = v601;
                                v8 = v610;
LABEL_267:
                                v32 = v537;
LABEL_447:

                                goto LABEL_448;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v532 = v94;
                                goto LABEL_94;
                              }
                              if (v9)
                              {
                                v207 = v9;
                                v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v569 = v12;
                                v209 = *MEMORY[0x1E0D025B8];
                                v680 = *MEMORY[0x1E0CB2D50];
                                v210 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v439 = objc_opt_class();
                                v211 = v210;
                                v8 = v610;
                                v197 = v533;
                                v530 = (id)objc_msgSend(v211, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v439, CFSTR("foodAssetProcessedCount"));
                                v681 = v530;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v681, &v680, 1);
                                v212 = objc_claimAutoreleasedReturnValue();
                                v213 = v209;
                                v12 = v569;
                                v531 = (void *)v212;
                                v38 = 0;
                                v532 = 0;
                                *v207 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v213, 2);
                                v48 = v601;
                                v32 = v537;
LABEL_449:

                                goto LABEL_450;
                              }
                              v532 = 0;
                              v38 = 0;
                              v48 = v601;
                              v8 = v610;
                              v197 = v533;
LABEL_450:

                              goto LABEL_451;
                            }
                            if (v9)
                            {
                              v200 = v9;
                              v201 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v568 = v12;
                              v202 = *MEMORY[0x1E0D025B8];
                              v682 = *MEMORY[0x1E0CB2D50];
                              v203 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v438 = objc_opt_class();
                              v204 = v203;
                              v8 = v610;
                              v532 = (id)objc_msgSend(v204, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v438, CFSTR("apparelAssetProcessedCount"));
                              v683 = v532;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v683, &v682, 1);
                              v205 = objc_claimAutoreleasedReturnValue();
                              v206 = v202;
                              v12 = v568;
                              v534 = (void *)v205;
                              v38 = 0;
                              v197 = 0;
                              *v200 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v206, 2);
                              v48 = v601;
                              v32 = v537;
                              goto LABEL_450;
                            }
                            v197 = 0;
                            v38 = 0;
                            v48 = v601;
                            v8 = v610;
LABEL_251:
                            v32 = v537;
LABEL_451:

                            v189 = v535;
                            goto LABEL_452;
                          }
                          if (v9)
                          {
                            v192 = v9;
                            v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v567 = v12;
                            v194 = *MEMORY[0x1E0D025B8];
                            v684 = *MEMORY[0x1E0CB2D50];
                            v195 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v437 = objc_opt_class();
                            v196 = v195;
                            v8 = v610;
                            v197 = (void *)objc_msgSend(v196, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v437, CFSTR("dogsAssetProcessedCount"));
                            v685 = v197;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v685, &v684, 1);
                            v198 = objc_claimAutoreleasedReturnValue();
                            v199 = v194;
                            v12 = v567;
                            v536 = (void *)v198;
                            v38 = 0;
                            v535 = 0;
                            *v192 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v199, 2);
                            v48 = v601;
                            goto LABEL_251;
                          }
                          v189 = 0;
                          v38 = 0;
                          v48 = v601;
                          v8 = v610;
LABEL_452:

                          goto LABEL_453;
                        }
                        v32 = v9;
                        if (v9)
                        {
                          v185 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v566 = v12;
                          v186 = *MEMORY[0x1E0D025B8];
                          v686 = *MEMORY[0x1E0CB2D50];
                          v187 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v436 = objc_opt_class();
                          v188 = v187;
                          v8 = v610;
                          v189 = (void *)objc_msgSend(v188, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v436, CFSTR("catsAssetProcessedCount"));
                          v687 = v189;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v687, &v686, 1);
                          v190 = objc_claimAutoreleasedReturnValue();
                          v191 = v186;
                          v12 = v566;
                          v538 = (void *)v190;
                          v38 = 0;
                          *v32 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v191, 2);
                          v32 = 0;
                          v48 = v601;
                          goto LABEL_452;
                        }
                        v38 = 0;
                        v48 = v601;
                        v8 = v610;
LABEL_453:

                        v24 = v540;
                        v177 = v539;
                        goto LABEL_454;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v31 = v30;
                        goto LABEL_37;
                      }
                      v177 = v9;
                      if (v9)
                      {
                        v542 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v565 = v12;
                        v178 = *MEMORY[0x1E0D025B8];
                        v688 = *MEMORY[0x1E0CB2D50];
                        v179 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v435 = objc_opt_class();
                        v180 = v179;
                        v8 = v610;
                        v181 = objc_msgSend(v180, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v435, CFSTR("albumAssetProcessedCount"));
                        v689 = v181;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v689, &v688, 1);
                        v182 = objc_claimAutoreleasedReturnValue();
                        v183 = v542;
                        v184 = v178;
                        v12 = v565;
                        v541 = (void *)v182;
                        v38 = 0;
                        v539 = 0;
                        *v177 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
                        v32 = (_QWORD *)v181;
                        v48 = v601;
                        goto LABEL_453;
                      }
                      v38 = 0;
                      v48 = v601;
                      v8 = v610;
LABEL_454:

                      goto LABEL_455;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v544 = v26;
                      goto LABEL_31;
                    }
                    if (v9)
                    {
                      v161 = v9;
                      v162 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v563 = v12;
                      v163 = *MEMORY[0x1E0D025B8];
                      v692 = *MEMORY[0x1E0CB2D50];
                      v164 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v433 = objc_opt_class();
                      v165 = v164;
                      v8 = v610;
                      v545 = (id)objc_msgSend(v165, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v433, CFSTR("mediaAssetProcessedCount"));
                      v693 = v545;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v693, &v692, 1);
                      v166 = objc_claimAutoreleasedReturnValue();
                      v167 = v163;
                      v12 = v563;
                      v547 = (void *)v166;
                      v168 = (id)objc_msgSend(v162, "initWithDomain:code:userInfo:", v167, 2);
                      v38 = 0;
                      v157 = 0;
                      *v161 = v168;
                      v48 = v601;
LABEL_456:

                      goto LABEL_457;
                    }
                    v157 = 0;
                    v38 = 0;
                    v48 = v601;
                    v8 = v610;
LABEL_457:

                    v63 = v557;
                    goto LABEL_458;
                  }
                  if (v9)
                  {
                    v153 = v9;
                    v550 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v562 = v12;
                    v154 = *MEMORY[0x1E0D025B8];
                    v694 = *MEMORY[0x1E0CB2D50];
                    v155 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v432 = objc_opt_class();
                    v156 = v155;
                    v8 = v610;
                    v157 = (void *)objc_msgSend(v156, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v432, CFSTR("naturalLandmarkProcessedAssetCount"));
                    v695 = v157;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v695, &v694, 1);
                    v158 = objc_claimAutoreleasedReturnValue();
                    v159 = v550;
                    v160 = v154;
                    v12 = v562;
                    v549 = (void *)v158;
                    v38 = 0;
                    v24 = 0;
                    *v153 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
                    v48 = v601;
                    goto LABEL_457;
                  }
                  v24 = 0;
                  v38 = 0;
                  v48 = v601;
                  v63 = v557;
                  v8 = v610;
LABEL_458:

                  goto LABEL_459;
                }
                if (v9)
                {
                  v82 = v9;
                  v553 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v561 = v12;
                  v83 = *MEMORY[0x1E0D025B8];
                  v696 = *MEMORY[0x1E0CB2D50];
                  v84 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v431 = objc_opt_class();
                  v85 = v84;
                  v8 = v610;
                  v63 = v557;
                  v24 = (id)objc_msgSend(v85, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v431, CFSTR("landmarkAssetProcessedCount"));
                  v697 = v24;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v697, &v696, 1);
                  v86 = objc_claimAutoreleasedReturnValue();
                  v87 = v83;
                  v12 = v561;
                  v551 = (void *)v86;
                  v88 = (id)objc_msgSend(v553, "initWithDomain:code:userInfo:", v87, 2);
                  v38 = 0;
                  v552 = 0;
                  *v82 = v88;
                  v48 = v601;
                  goto LABEL_458;
                }
                v552 = 0;
                v38 = 0;
                v48 = v601;
                v63 = v557;
                v8 = v610;
LABEL_459:

                goto LABEL_460;
              }
              if (v9)
              {
                v75 = v9;
                v598 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v560 = v12;
                v76 = *MEMORY[0x1E0D025B8];
                v698 = *MEMORY[0x1E0CB2D50];
                v77 = objc_alloc(MEMORY[0x1E0CB3940]);
                v430 = objc_opt_class();
                v78 = v77;
                v8 = v610;
                v63 = v557;
                v552 = (id)objc_msgSend(v78, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v430, CFSTR("mammalsAssetProcessedCount"));
                v699 = v552;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v699, &v698, 1);
                v79 = objc_claimAutoreleasedReturnValue();
                v80 = v76;
                v12 = v560;
                v556 = (void *)v79;
                v81 = (id)objc_msgSend(v598, "initWithDomain:code:userInfo:", v80, 2);
                v38 = 0;
                v597 = 0;
                *v75 = v81;
                v48 = v601;
                goto LABEL_459;
              }
              v597 = 0;
              v38 = 0;
              v48 = v601;
              v63 = v557;
              v8 = v610;
LABEL_460:

              goto LABEL_461;
            }
            if (v9)
            {
              v67 = v9;
              v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v559 = v12;
              v69 = *MEMORY[0x1E0D025B8];
              v700 = *MEMORY[0x1E0CB2D50];
              v70 = objc_alloc(MEMORY[0x1E0CB3940]);
              v429 = objc_opt_class();
              v71 = v70;
              v8 = v610;
              v597 = (id)objc_msgSend(v71, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v429, CFSTR("reptilesAssetProcessedCount"));
              v701 = v597;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v701, &v700, 1);
              v72 = objc_claimAutoreleasedReturnValue();
              v73 = v69;
              v12 = v559;
              v599 = (void *)v72;
              v74 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v73, 2);
              v38 = 0;
              v63 = 0;
              *v67 = v74;
              v48 = v601;
              goto LABEL_460;
            }
            v63 = 0;
            v38 = 0;
            v48 = v601;
            v8 = v610;
LABEL_461:

            v10 = v607;
            goto LABEL_462;
          }
          if (v9)
          {
            v57 = v9;
            v603 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v558 = v12;
            v58 = *MEMORY[0x1E0D025B8];
            v702 = *MEMORY[0x1E0CB2D50];
            v59 = objc_alloc(MEMORY[0x1E0CB3940]);
            v428 = objc_opt_class();
            v60 = v59;
            v8 = v610;
            v61 = v11;
            v62 = v57;
            v63 = (void *)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v428, CFSTR("insectsAssetProcessedCount"));
            v703 = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v703, &v702, 1);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = v58;
            v12 = v558;
            v600 = (void *)v64;
            v66 = (id)objc_msgSend(v603, "initWithDomain:code:userInfo:", v65, 2);
            v38 = 0;
            v602 = 0;
            *v62 = v66;
            v11 = v61;
            v48 = v601;
            goto LABEL_461;
          }
          v602 = 0;
          v38 = 0;
          v48 = v601;
          v10 = v607;
          v8 = v610;
LABEL_462:

          goto LABEL_463;
        }
        v48 = v13;
        if (v9)
        {
          v609 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v606 = *MEMORY[0x1E0D025B8];
          v704 = *MEMORY[0x1E0CB2D50];
          v50 = v11;
          v51 = v9;
          v52 = objc_alloc(MEMORY[0x1E0CB3940]);
          v427 = objc_opt_class();
          v53 = v52;
          v8 = v610;
          v10 = v607;
          v602 = (id)objc_msgSend(v53, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v427, CFSTR("birdsAssetProcessedCount"));
          v705 = v602;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v705, &v704, 1);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v606;
          v604 = (void *)v54;
          v56 = (id)objc_msgSend(v609, "initWithDomain:code:userInfo:", v55, 2);
          v38 = 0;
          v608 = 0;
          *v51 = v56;
          v11 = v50;
          goto LABEL_462;
        }
        v608 = 0;
        v38 = 0;
        v10 = v607;
        v8 = v610;
LABEL_463:

        goto LABEL_464;
      }
      if (v9)
      {
        v605 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v47 = *MEMORY[0x1E0D025B8];
        v706 = *MEMORY[0x1E0CB2D50];
        v608 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("animalsAssetProcessedCount"));
        v707 = v608;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v707, &v706, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (id)objc_msgSend(v605, "initWithDomain:code:userInfo:", v47, 2, v48);
        v38 = 0;
        v12 = 0;
        *v9 = v49;
        v8 = v610;
        goto LABEL_463;
      }
      v12 = 0;
      v38 = 0;
      v8 = v610;
LABEL_464:

      goto LABEL_465;
    }
    if (a4)
    {
      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0D025B8];
      v708 = *MEMORY[0x1E0CB2D50];
      v554 = v6;
      v41 = v7;
      v42 = self;
      v43 = v8;
      v44 = a4;
      v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("natureAssetProcessedCount"));
      v709 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v709, &v708, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v40;
      v12 = (id)v45;
      v38 = 0;
      v10 = 0;
      *v44 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v46, 2, v11);
      v8 = v43;
      self = v42;
      v7 = v41;
      v6 = v554;
      goto LABEL_464;
    }
    v10 = 0;
    v38 = 0;
LABEL_465:

    goto LABEL_466;
  }
  if (a4)
  {
    v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = *MEMORY[0x1E0D025B8];
    v710 = *MEMORY[0x1E0CB2D50];
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("artAssetProcessedCount"));
    v711[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v711, &v710, 1);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v33;
    v10 = (id)v35;
    v611 = (void *)v36;
    v38 = 0;
    v8 = 0;
    *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v34, 2);
    goto LABEL_465;
  }
  v38 = 0;
  v8 = 0;
LABEL_466:

  return v38;
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
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
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
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  _QWORD v156[50];
  _QWORD v157[52];

  v157[50] = *MEMORY[0x1E0C80C00];
  if (-[BMPECProcessed hasArtAssetProcessedCount](self, "hasArtAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed artAssetProcessedCount](self, "artAssetProcessedCount"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (-[BMPECProcessed hasNatureAssetProcessedCount](self, "hasNatureAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed natureAssetProcessedCount](self, "natureAssetProcessedCount"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMPECProcessed hasAnimalsAssetProcessedCount](self, "hasAnimalsAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed animalsAssetProcessedCount](self, "animalsAssetProcessedCount"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMPECProcessed hasBirdsAssetProcessedCount](self, "hasBirdsAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed birdsAssetProcessedCount](self, "birdsAssetProcessedCount"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMPECProcessed hasInsectsAssetProcessedCount](self, "hasInsectsAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed insectsAssetProcessedCount](self, "insectsAssetProcessedCount"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMPECProcessed hasReptilesAssetProcessedCount](self, "hasReptilesAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed reptilesAssetProcessedCount](self, "reptilesAssetProcessedCount"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMPECProcessed hasMammalsAssetProcessedCount](self, "hasMammalsAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mammalsAssetProcessedCount](self, "mammalsAssetProcessedCount"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMPECProcessed hasLandmarkAssetProcessedCount](self, "hasLandmarkAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed landmarkAssetProcessedCount](self, "landmarkAssetProcessedCount"));
    v155 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v155 = 0;
  }
  if (-[BMPECProcessed hasNaturalLandmarkProcessedAssetCount](self, "hasNaturalLandmarkProcessedAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed naturalLandmarkProcessedAssetCount](self, "naturalLandmarkProcessedAssetCount"));
    v154 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v154 = 0;
  }
  if (-[BMPECProcessed hasMediaAssetProcessedCount](self, "hasMediaAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mediaAssetProcessedCount](self, "mediaAssetProcessedCount"));
    v153 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v153 = 0;
  }
  if (-[BMPECProcessed hasBookAssetProcessedCount](self, "hasBookAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed bookAssetProcessedCount](self, "bookAssetProcessedCount"));
    v152 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v152 = 0;
  }
  if (-[BMPECProcessed hasAlbumAssetProcessedCount](self, "hasAlbumAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed albumAssetProcessedCount](self, "albumAssetProcessedCount"));
    v151 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v151 = 0;
  }
  if (-[BMPECProcessed hasCatsAssetProcessedCount](self, "hasCatsAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed catsAssetProcessedCount](self, "catsAssetProcessedCount"));
    v150 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v150 = 0;
  }
  if (-[BMPECProcessed hasDogsAssetProcessedCount](self, "hasDogsAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed dogsAssetProcessedCount](self, "dogsAssetProcessedCount"));
    v149 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v149 = 0;
  }
  if (-[BMPECProcessed hasApparelAssetProcessedCount](self, "hasApparelAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed apparelAssetProcessedCount](self, "apparelAssetProcessedCount"));
    v148 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v148 = 0;
  }
  if (-[BMPECProcessed hasFoodAssetProcessedCount](self, "hasFoodAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed foodAssetProcessedCount](self, "foodAssetProcessedCount"));
    v147 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v147 = 0;
  }
  if (-[BMPECProcessed hasStorefrontAssetProcessedCount](self, "hasStorefrontAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed storefrontAssetProcessedCount](self, "storefrontAssetProcessedCount"));
    v146 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v146 = 0;
  }
  if (-[BMPECProcessed hasSignSymbolAssetProcessedCount](self, "hasSignSymbolAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed signSymbolAssetProcessedCount](self, "signSymbolAssetProcessedCount"));
    v145 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v145 = 0;
  }
  if (-[BMPECProcessed hasLaundryCareSymbolAssetProcessedCount](self, "hasLaundryCareSymbolAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetProcessedCount](self, "laundryCareSymbolAssetProcessedCount"));
    v144 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v144 = 0;
  }
  if (-[BMPECProcessed hasAutoSymbolAssetProcessedCount](self, "hasAutoSymbolAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed autoSymbolAssetProcessedCount](self, "autoSymbolAssetProcessedCount"));
    v143 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v143 = 0;
  }
  if (-[BMPECProcessed hasBrandLogoSymbolAssetProcessedCount](self, "hasBrandLogoSymbolAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetProcessedCount](self, "brandLogoSymbolAssetProcessedCount"));
    v142 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v142 = 0;
  }
  if (-[BMPECProcessed hasObject2DAssetProcessedCount](self, "hasObject2DAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed object2DAssetProcessedCount](self, "object2DAssetProcessedCount"));
    v141 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v141 = 0;
  }
  if (-[BMPECProcessed hasBarcodeDetectionAssetProcessedCount](self, "hasBarcodeDetectionAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetProcessedCount](self, "barcodeDetectionAssetProcessedCount"));
    v140 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v140 = 0;
  }
  if (-[BMPECProcessed hasSculptureAssetProcessedCount](self, "hasSculptureAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed sculptureAssetProcessedCount](self, "sculptureAssetProcessedCount"));
    v139 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v139 = 0;
  }
  if (-[BMPECProcessed hasSkylineAssetProcessedCount](self, "hasSkylineAssetProcessedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed skylineAssetProcessedCount](self, "skylineAssetProcessedCount"));
    v138 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v138 = 0;
  }
  if (-[BMPECProcessed hasArtAssetSuccessesCount](self, "hasArtAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed artAssetSuccessesCount](self, "artAssetSuccessesCount"));
    v137 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v137 = 0;
  }
  if (-[BMPECProcessed hasNatureAssetSuccessesCount](self, "hasNatureAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed natureAssetSuccessesCount](self, "natureAssetSuccessesCount"));
    v136 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v136 = 0;
  }
  if (-[BMPECProcessed hasAnimalsAssetSuccessesCount](self, "hasAnimalsAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed animalsAssetSuccessesCount](self, "animalsAssetSuccessesCount"));
    v135 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v135 = 0;
  }
  if (-[BMPECProcessed hasBirdsAssetSuccessesCount](self, "hasBirdsAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed birdsAssetSuccessesCount](self, "birdsAssetSuccessesCount"));
    v134 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v134 = 0;
  }
  if (-[BMPECProcessed hasInsectsAssetSuccessesCount](self, "hasInsectsAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed insectsAssetSuccessesCount](self, "insectsAssetSuccessesCount"));
    v133 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v133 = 0;
  }
  if (-[BMPECProcessed hasReptilesAssetSuccessesCount](self, "hasReptilesAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed reptilesAssetSuccessesCount](self, "reptilesAssetSuccessesCount"));
    v132 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v132 = 0;
  }
  if (-[BMPECProcessed hasMammalsAssetSuccessesCount](self, "hasMammalsAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mammalsAssetSuccessesCount](self, "mammalsAssetSuccessesCount"));
    v131 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v131 = 0;
  }
  if (-[BMPECProcessed hasLandmarkAssetSuccessesCount](self, "hasLandmarkAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed landmarkAssetSuccessesCount](self, "landmarkAssetSuccessesCount"));
    v130 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v130 = 0;
  }
  if (-[BMPECProcessed hasNaturalLandmarkSuccessesAssetCount](self, "hasNaturalLandmarkSuccessesAssetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed naturalLandmarkSuccessesAssetCount](self, "naturalLandmarkSuccessesAssetCount"));
    v129 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v129 = 0;
  }
  if (-[BMPECProcessed hasMediaAssetSuccessesCount](self, "hasMediaAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed mediaAssetSuccessesCount](self, "mediaAssetSuccessesCount"));
    v128 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v128 = 0;
  }
  if (-[BMPECProcessed hasBookAssetSuccessesCount](self, "hasBookAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed bookAssetSuccessesCount](self, "bookAssetSuccessesCount"));
    v127 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v127 = 0;
  }
  if (-[BMPECProcessed hasAlbumAssetSuccessesCount](self, "hasAlbumAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed albumAssetSuccessesCount](self, "albumAssetSuccessesCount"));
    v126 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v126 = 0;
  }
  if (-[BMPECProcessed hasCatsAssetSuccessesCount](self, "hasCatsAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed catsAssetSuccessesCount](self, "catsAssetSuccessesCount"));
    v125 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v125 = 0;
  }
  if (-[BMPECProcessed hasDogsAssetSuccessesCount](self, "hasDogsAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed dogsAssetSuccessesCount](self, "dogsAssetSuccessesCount"));
    v124 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v124 = 0;
  }
  if (-[BMPECProcessed hasApparelAssetSuccessesCount](self, "hasApparelAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed apparelAssetSuccessesCount](self, "apparelAssetSuccessesCount"));
    v123 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v123 = 0;
  }
  if (-[BMPECProcessed hasFoodAssetSuccessesCount](self, "hasFoodAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed foodAssetSuccessesCount](self, "foodAssetSuccessesCount"));
    v122 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v122 = 0;
  }
  if (-[BMPECProcessed hasStorefrontAssetSuccessesCount](self, "hasStorefrontAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed storefrontAssetSuccessesCount](self, "storefrontAssetSuccessesCount"));
    v121 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v121 = 0;
  }
  if (-[BMPECProcessed hasSignSymbolAssetSuccessesCount](self, "hasSignSymbolAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed signSymbolAssetSuccessesCount](self, "signSymbolAssetSuccessesCount"));
    v120 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v120 = 0;
  }
  if (-[BMPECProcessed hasLaundryCareSymbolAssetSuccessesCount](self, "hasLaundryCareSymbolAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed laundryCareSymbolAssetSuccessesCount](self, "laundryCareSymbolAssetSuccessesCount"));
    v119 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v119 = 0;
  }
  if (-[BMPECProcessed hasAutoSymbolAssetSuccessesCount](self, "hasAutoSymbolAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed autoSymbolAssetSuccessesCount](self, "autoSymbolAssetSuccessesCount"));
    v118 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v118 = 0;
  }
  if (-[BMPECProcessed hasBrandLogoSymbolAssetSuccessesCount](self, "hasBrandLogoSymbolAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed brandLogoSymbolAssetSuccessesCount](self, "brandLogoSymbolAssetSuccessesCount"));
    v117 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v117 = 0;
  }
  if (-[BMPECProcessed hasObject2DAssetSuccessesCount](self, "hasObject2DAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed object2DAssetSuccessesCount](self, "object2DAssetSuccessesCount"));
    v116 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v116 = 0;
  }
  if (-[BMPECProcessed hasBarcodeDetectionAssetSuccessesCount](self, "hasBarcodeDetectionAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed barcodeDetectionAssetSuccessesCount](self, "barcodeDetectionAssetSuccessesCount"));
    v115 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v115 = 0;
  }
  if (-[BMPECProcessed hasSculptureAssetSuccessesCount](self, "hasSculptureAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed sculptureAssetSuccessesCount](self, "sculptureAssetSuccessesCount"));
    v114 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v114 = 0;
  }
  if (-[BMPECProcessed hasSkylineAssetSuccessesCount](self, "hasSkylineAssetSuccessesCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPECProcessed skylineAssetSuccessesCount](self, "skylineAssetSuccessesCount"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v156[0] = CFSTR("artAssetProcessedCount");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v105 = (void *)v11;
  v157[0] = v11;
  v156[1] = CFSTR("natureAssetProcessedCount");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v104 = (void *)v12;
  v157[1] = v12;
  v156[2] = CFSTR("animalsAssetProcessedCount");
  v13 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v103 = (void *)v13;
  v157[2] = v13;
  v156[3] = CFSTR("birdsAssetProcessedCount");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v102 = (void *)v14;
  v157[3] = v14;
  v156[4] = CFSTR("insectsAssetProcessedCount");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v101 = (void *)v15;
  v157[4] = v15;
  v156[5] = CFSTR("reptilesAssetProcessedCount");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)v16;
  v157[5] = v16;
  v156[6] = CFSTR("mammalsAssetProcessedCount");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)v17;
  v157[6] = v17;
  v156[7] = CFSTR("landmarkAssetProcessedCount");
  v18 = (uint64_t)v155;
  if (!v155)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v157[7] = v18;
  v156[8] = CFSTR("naturalLandmarkProcessedAssetCount");
  v19 = (uint64_t)v154;
  if (!v154)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v157[8] = v19;
  v156[9] = CFSTR("mediaAssetProcessedCount");
  v20 = (uint64_t)v153;
  if (!v153)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v110 = (void *)v20;
  v157[9] = v20;
  v156[10] = CFSTR("bookAssetProcessedCount");
  v21 = (uint64_t)v152;
  if (!v152)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v107 = v7;
  v109 = (void *)v21;
  v157[10] = v21;
  v156[11] = CFSTR("albumAssetProcessedCount");
  v22 = (uint64_t)v151;
  if (!v151)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = v6;
  v96 = (void *)v22;
  v157[11] = v22;
  v156[12] = CFSTR("catsAssetProcessedCount");
  v24 = (uint64_t)v150;
  if (!v150)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v24;
  v157[12] = v24;
  v156[13] = CFSTR("dogsAssetProcessedCount");
  v26 = (uint64_t)v149;
  if (!v149)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v26;
  v157[13] = v26;
  v156[14] = CFSTR("apparelAssetProcessedCount");
  v27 = (uint64_t)v148;
  if (!v148)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v27;
  v157[14] = v27;
  v156[15] = CFSTR("foodAssetProcessedCount");
  v28 = (uint64_t)v147;
  if (!v147)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v93 = (void *)v28;
  v157[15] = v28;
  v156[16] = CFSTR("storefrontAssetProcessedCount");
  v29 = (uint64_t)v146;
  if (!v146)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v29;
  v157[16] = v29;
  v156[17] = CFSTR("signSymbolAssetProcessedCount");
  v30 = (uint64_t)v145;
  if (!v145)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v91 = (void *)v30;
  v157[17] = v30;
  v156[18] = CFSTR("laundryCareSymbolAssetProcessedCount");
  v31 = (uint64_t)v144;
  if (!v144)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)v31;
  v157[18] = v31;
  v156[19] = CFSTR("autoSymbolAssetProcessedCount");
  v32 = (uint64_t)v143;
  if (!v143)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v89 = (void *)v32;
  v157[19] = v32;
  v156[20] = CFSTR("brandLogoSymbolAssetProcessedCount");
  v33 = (uint64_t)v142;
  if (!v142)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v88 = (void *)v33;
  v157[20] = v33;
  v156[21] = CFSTR("object2DAssetProcessedCount");
  v34 = (uint64_t)v141;
  if (!v141)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v87 = (void *)v34;
  v157[21] = v34;
  v156[22] = CFSTR("barcodeDetectionAssetProcessedCount");
  v35 = (uint64_t)v140;
  if (!v140)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v86 = (void *)v35;
  v157[22] = v35;
  v156[23] = CFSTR("sculptureAssetProcessedCount");
  v36 = (uint64_t)v139;
  if (!v139)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v85 = (void *)v36;
  v157[23] = v36;
  v156[24] = CFSTR("skylineAssetProcessedCount");
  v37 = (uint64_t)v138;
  if (!v138)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v84 = (void *)v37;
  v157[24] = v37;
  v156[25] = CFSTR("artAssetSuccessesCount");
  v38 = (uint64_t)v137;
  if (!v137)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v83 = (void *)v38;
  v157[25] = v38;
  v156[26] = CFSTR("natureAssetSuccessesCount");
  v39 = (uint64_t)v136;
  if (!v136)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v82 = (void *)v39;
  v157[26] = v39;
  v156[27] = CFSTR("animalsAssetSuccessesCount");
  v40 = (uint64_t)v135;
  if (!v135)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)v40;
  v157[27] = v40;
  v156[28] = CFSTR("birdsAssetSuccessesCount");
  v41 = (uint64_t)v134;
  if (!v134)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v41;
  v157[28] = v41;
  v156[29] = CFSTR("insectsAssetSuccessesCount");
  v42 = (uint64_t)v133;
  if (!v133)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v42;
  v157[29] = v42;
  v156[30] = CFSTR("reptilesAssetSuccessesCount");
  v43 = (uint64_t)v132;
  if (!v132)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v43;
  v157[30] = v43;
  v156[31] = CFSTR("mammalsAssetSuccessesCount");
  v44 = (uint64_t)v131;
  if (!v131)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v77 = (void *)v44;
  v157[31] = v44;
  v156[32] = CFSTR("landmarkAssetSuccessesCount");
  v45 = (uint64_t)v130;
  if (!v130)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v76 = (void *)v45;
  v157[32] = v45;
  v156[33] = CFSTR("naturalLandmarkSuccessesAssetCount");
  v46 = (uint64_t)v129;
  if (!v129)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v46;
  v157[33] = v46;
  v156[34] = CFSTR("mediaAssetSuccessesCount");
  v47 = (uint64_t)v128;
  if (!v128)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v47;
  v157[34] = v47;
  v156[35] = CFSTR("bookAssetSuccessesCount");
  v48 = (uint64_t)v127;
  if (!v127)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v48;
  v157[35] = v48;
  v156[36] = CFSTR("albumAssetSuccessesCount");
  v49 = (uint64_t)v126;
  if (!v126)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v49;
  v157[36] = v49;
  v156[37] = CFSTR("catsAssetSuccessesCount");
  v50 = (uint64_t)v125;
  if (!v125)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v50;
  v157[37] = v50;
  v156[38] = CFSTR("dogsAssetSuccessesCount");
  v51 = (uint64_t)v124;
  if (!v124)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v112 = v3;
  v70 = (void *)v51;
  v157[38] = v51;
  v156[39] = CFSTR("apparelAssetSuccessesCount");
  v52 = (uint64_t)v123;
  if (!v123)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v52;
  v157[39] = v52;
  v156[40] = CFSTR("foodAssetSuccessesCount");
  v53 = (uint64_t)v122;
  if (!v122)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v53;
  v157[40] = v53;
  v156[41] = CFSTR("storefrontAssetSuccessesCount");
  v54 = (uint64_t)v121;
  if (!v121)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  v111 = v9;
  v67 = (void *)v54;
  v157[41] = v54;
  v156[42] = CFSTR("signSymbolAssetSuccessesCount");
  v55 = (uint64_t)v120;
  if (!v120)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)v18;
  v66 = (void *)v55;
  v157[42] = v55;
  v156[43] = CFSTR("laundryCareSymbolAssetSuccessesCount");
  v56 = (uint64_t)v119;
  if (!v119)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)v19;
  v65 = (void *)v56;
  v157[43] = v56;
  v156[44] = CFSTR("autoSymbolAssetSuccessesCount");
  v57 = v118;
  if (!v118)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v157[44] = v57;
  v156[45] = CFSTR("brandLogoSymbolAssetSuccessesCount");
  v58 = v117;
  if (!v117)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v113 = v10;
  v108 = v8;
  v157[45] = v58;
  v156[46] = CFSTR("object2DAssetSuccessesCount");
  v59 = v116;
  if (!v116)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v157[46] = v59;
  v156[47] = CFSTR("barcodeDetectionAssetSuccessesCount");
  v60 = v115;
  if (!v115)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v157[47] = v60;
  v156[48] = CFSTR("sculptureAssetSuccessesCount");
  v61 = v114;
  if (!v114)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v157[48] = v61;
  v156[49] = CFSTR("skylineAssetSuccessesCount");
  v62 = v113;
  if (!v113)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v157[49] = v62;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 50);
  v106 = (id)objc_claimAutoreleasedReturnValue();
  if (!v113)

  v63 = v25;
  if (!v114)
  {

    v63 = v25;
  }
  if (!v115)
  {

    v63 = v25;
  }
  if (!v116)
  {

    v63 = v25;
  }
  if (!v117)
  {

    v63 = v25;
  }
  if (!v118)
  {

    v63 = v25;
  }
  if (!v119)
  {

    v63 = v25;
  }
  if (!v120)
  {

    v63 = v25;
  }
  if (!v121)
  {

    v63 = v25;
  }
  if (!v122)
  {

    v63 = v25;
  }
  if (!v123)
  {

    v63 = v25;
  }
  if (!v124)
  {

    v63 = v25;
  }
  if (!v125)
  {

    v63 = v25;
  }
  if (!v126)
  {

    v63 = v25;
  }
  if (!v127)
  {

    v63 = v25;
  }
  if (!v128)
  {

    v63 = v25;
  }
  if (!v129)
  {

    v63 = v25;
  }
  if (!v130)
  {

    v63 = v25;
  }
  if (!v131)
  {

    v63 = v25;
  }
  if (!v132)
  {

    v63 = v25;
  }
  if (!v133)
  {

    v63 = v25;
  }
  if (!v134)
  {

    v63 = v25;
  }
  if (!v135)
  {

    v63 = v25;
  }
  if (!v136)
  {

    v63 = v25;
  }
  if (!v137)
  {

    v63 = v25;
  }
  if (!v138)
  {

    v63 = v25;
  }
  if (!v139)
  {

    v63 = v25;
  }
  if (!v140)
  {

    v63 = v25;
  }
  if (!v141)
  {

    v63 = v25;
  }
  if (!v142)
  {

    v63 = v25;
  }
  if (!v143)
  {

    v63 = v25;
  }
  if (!v144)
  {

    v63 = v25;
  }
  if (!v145)
  {

    v63 = v25;
  }
  if (!v146)
  {

    v63 = v25;
  }
  if (!v147)
  {

    v63 = v25;
  }
  if (!v148)
  {

    v63 = v25;
  }
  if (!v149)
  {

    v63 = v25;
  }
  if (!v150)

  if (!v151)
  if (!v152)

  if (!v153)
  if (!v154)

  if (v155)
  {
    if (v111)
      goto LABEL_337;
  }
  else
  {

    if (v111)
    {
LABEL_337:
      if (v108)
        goto LABEL_338;
      goto LABEL_346;
    }
  }

  if (v108)
  {
LABEL_338:
    if (v107)
      goto LABEL_339;
    goto LABEL_347;
  }
LABEL_346:

  if (v107)
  {
LABEL_339:
    if (v23)
      goto LABEL_340;
    goto LABEL_348;
  }
LABEL_347:

  if (v23)
  {
LABEL_340:
    if (v5)
      goto LABEL_341;
    goto LABEL_349;
  }
LABEL_348:

  if (v5)
  {
LABEL_341:
    if (v4)
      goto LABEL_342;
LABEL_350:

    if (v112)
      goto LABEL_343;
LABEL_351:

    goto LABEL_343;
  }
LABEL_349:

  if (!v4)
    goto LABEL_350;
LABEL_342:
  if (!v112)
    goto LABEL_351;
LABEL_343:

  return v106;
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
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
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
  BOOL v56;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v56 = 0;
    goto LABEL_255;
  }
  v5 = v4;
  if (-[BMPECProcessed hasArtAssetProcessedCount](self, "hasArtAssetProcessedCount")
    || objc_msgSend(v5, "hasArtAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasArtAssetProcessedCount](self, "hasArtAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasArtAssetProcessedCount"))
      goto LABEL_252;
    v6 = -[BMPECProcessed artAssetProcessedCount](self, "artAssetProcessedCount");
    if (v6 != objc_msgSend(v5, "artAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasNatureAssetProcessedCount](self, "hasNatureAssetProcessedCount")
    || objc_msgSend(v5, "hasNatureAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasNatureAssetProcessedCount](self, "hasNatureAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNatureAssetProcessedCount"))
      goto LABEL_252;
    v7 = -[BMPECProcessed natureAssetProcessedCount](self, "natureAssetProcessedCount");
    if (v7 != objc_msgSend(v5, "natureAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasAnimalsAssetProcessedCount](self, "hasAnimalsAssetProcessedCount")
    || objc_msgSend(v5, "hasAnimalsAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasAnimalsAssetProcessedCount](self, "hasAnimalsAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasAnimalsAssetProcessedCount"))
      goto LABEL_252;
    v8 = -[BMPECProcessed animalsAssetProcessedCount](self, "animalsAssetProcessedCount");
    if (v8 != objc_msgSend(v5, "animalsAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBirdsAssetProcessedCount](self, "hasBirdsAssetProcessedCount")
    || objc_msgSend(v5, "hasBirdsAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasBirdsAssetProcessedCount](self, "hasBirdsAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBirdsAssetProcessedCount"))
      goto LABEL_252;
    v9 = -[BMPECProcessed birdsAssetProcessedCount](self, "birdsAssetProcessedCount");
    if (v9 != objc_msgSend(v5, "birdsAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasInsectsAssetProcessedCount](self, "hasInsectsAssetProcessedCount")
    || objc_msgSend(v5, "hasInsectsAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasInsectsAssetProcessedCount](self, "hasInsectsAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasInsectsAssetProcessedCount"))
      goto LABEL_252;
    v10 = -[BMPECProcessed insectsAssetProcessedCount](self, "insectsAssetProcessedCount");
    if (v10 != objc_msgSend(v5, "insectsAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasReptilesAssetProcessedCount](self, "hasReptilesAssetProcessedCount")
    || objc_msgSend(v5, "hasReptilesAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasReptilesAssetProcessedCount](self, "hasReptilesAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasReptilesAssetProcessedCount"))
      goto LABEL_252;
    v11 = -[BMPECProcessed reptilesAssetProcessedCount](self, "reptilesAssetProcessedCount");
    if (v11 != objc_msgSend(v5, "reptilesAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasMammalsAssetProcessedCount](self, "hasMammalsAssetProcessedCount")
    || objc_msgSend(v5, "hasMammalsAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasMammalsAssetProcessedCount](self, "hasMammalsAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasMammalsAssetProcessedCount"))
      goto LABEL_252;
    v12 = -[BMPECProcessed mammalsAssetProcessedCount](self, "mammalsAssetProcessedCount");
    if (v12 != objc_msgSend(v5, "mammalsAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasLandmarkAssetProcessedCount](self, "hasLandmarkAssetProcessedCount")
    || objc_msgSend(v5, "hasLandmarkAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasLandmarkAssetProcessedCount](self, "hasLandmarkAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasLandmarkAssetProcessedCount"))
      goto LABEL_252;
    v13 = -[BMPECProcessed landmarkAssetProcessedCount](self, "landmarkAssetProcessedCount");
    if (v13 != objc_msgSend(v5, "landmarkAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasNaturalLandmarkProcessedAssetCount](self, "hasNaturalLandmarkProcessedAssetCount")
    || objc_msgSend(v5, "hasNaturalLandmarkProcessedAssetCount"))
  {
    if (!-[BMPECProcessed hasNaturalLandmarkProcessedAssetCount](self, "hasNaturalLandmarkProcessedAssetCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNaturalLandmarkProcessedAssetCount"))
      goto LABEL_252;
    v14 = -[BMPECProcessed naturalLandmarkProcessedAssetCount](self, "naturalLandmarkProcessedAssetCount");
    if (v14 != objc_msgSend(v5, "naturalLandmarkProcessedAssetCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasMediaAssetProcessedCount](self, "hasMediaAssetProcessedCount")
    || objc_msgSend(v5, "hasMediaAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasMediaAssetProcessedCount](self, "hasMediaAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasMediaAssetProcessedCount"))
      goto LABEL_252;
    v15 = -[BMPECProcessed mediaAssetProcessedCount](self, "mediaAssetProcessedCount");
    if (v15 != objc_msgSend(v5, "mediaAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBookAssetProcessedCount](self, "hasBookAssetProcessedCount")
    || objc_msgSend(v5, "hasBookAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasBookAssetProcessedCount](self, "hasBookAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBookAssetProcessedCount"))
      goto LABEL_252;
    v16 = -[BMPECProcessed bookAssetProcessedCount](self, "bookAssetProcessedCount");
    if (v16 != objc_msgSend(v5, "bookAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasAlbumAssetProcessedCount](self, "hasAlbumAssetProcessedCount")
    || objc_msgSend(v5, "hasAlbumAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasAlbumAssetProcessedCount](self, "hasAlbumAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasAlbumAssetProcessedCount"))
      goto LABEL_252;
    v17 = -[BMPECProcessed albumAssetProcessedCount](self, "albumAssetProcessedCount");
    if (v17 != objc_msgSend(v5, "albumAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasCatsAssetProcessedCount](self, "hasCatsAssetProcessedCount")
    || objc_msgSend(v5, "hasCatsAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasCatsAssetProcessedCount](self, "hasCatsAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasCatsAssetProcessedCount"))
      goto LABEL_252;
    v18 = -[BMPECProcessed catsAssetProcessedCount](self, "catsAssetProcessedCount");
    if (v18 != objc_msgSend(v5, "catsAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasDogsAssetProcessedCount](self, "hasDogsAssetProcessedCount")
    || objc_msgSend(v5, "hasDogsAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasDogsAssetProcessedCount](self, "hasDogsAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasDogsAssetProcessedCount"))
      goto LABEL_252;
    v19 = -[BMPECProcessed dogsAssetProcessedCount](self, "dogsAssetProcessedCount");
    if (v19 != objc_msgSend(v5, "dogsAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasApparelAssetProcessedCount](self, "hasApparelAssetProcessedCount")
    || objc_msgSend(v5, "hasApparelAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasApparelAssetProcessedCount](self, "hasApparelAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasApparelAssetProcessedCount"))
      goto LABEL_252;
    v20 = -[BMPECProcessed apparelAssetProcessedCount](self, "apparelAssetProcessedCount");
    if (v20 != objc_msgSend(v5, "apparelAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasFoodAssetProcessedCount](self, "hasFoodAssetProcessedCount")
    || objc_msgSend(v5, "hasFoodAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasFoodAssetProcessedCount](self, "hasFoodAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasFoodAssetProcessedCount"))
      goto LABEL_252;
    v21 = -[BMPECProcessed foodAssetProcessedCount](self, "foodAssetProcessedCount");
    if (v21 != objc_msgSend(v5, "foodAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasStorefrontAssetProcessedCount](self, "hasStorefrontAssetProcessedCount")
    || objc_msgSend(v5, "hasStorefrontAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasStorefrontAssetProcessedCount](self, "hasStorefrontAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasStorefrontAssetProcessedCount"))
      goto LABEL_252;
    v22 = -[BMPECProcessed storefrontAssetProcessedCount](self, "storefrontAssetProcessedCount");
    if (v22 != objc_msgSend(v5, "storefrontAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasSignSymbolAssetProcessedCount](self, "hasSignSymbolAssetProcessedCount")
    || objc_msgSend(v5, "hasSignSymbolAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasSignSymbolAssetProcessedCount](self, "hasSignSymbolAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasSignSymbolAssetProcessedCount"))
      goto LABEL_252;
    v23 = -[BMPECProcessed signSymbolAssetProcessedCount](self, "signSymbolAssetProcessedCount");
    if (v23 != objc_msgSend(v5, "signSymbolAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasLaundryCareSymbolAssetProcessedCount](self, "hasLaundryCareSymbolAssetProcessedCount")
    || objc_msgSend(v5, "hasLaundryCareSymbolAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasLaundryCareSymbolAssetProcessedCount](self, "hasLaundryCareSymbolAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasLaundryCareSymbolAssetProcessedCount"))
      goto LABEL_252;
    v24 = -[BMPECProcessed laundryCareSymbolAssetProcessedCount](self, "laundryCareSymbolAssetProcessedCount");
    if (v24 != objc_msgSend(v5, "laundryCareSymbolAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasAutoSymbolAssetProcessedCount](self, "hasAutoSymbolAssetProcessedCount")
    || objc_msgSend(v5, "hasAutoSymbolAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasAutoSymbolAssetProcessedCount](self, "hasAutoSymbolAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasAutoSymbolAssetProcessedCount"))
      goto LABEL_252;
    v25 = -[BMPECProcessed autoSymbolAssetProcessedCount](self, "autoSymbolAssetProcessedCount");
    if (v25 != objc_msgSend(v5, "autoSymbolAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBrandLogoSymbolAssetProcessedCount](self, "hasBrandLogoSymbolAssetProcessedCount")
    || objc_msgSend(v5, "hasBrandLogoSymbolAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasBrandLogoSymbolAssetProcessedCount](self, "hasBrandLogoSymbolAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBrandLogoSymbolAssetProcessedCount"))
      goto LABEL_252;
    v26 = -[BMPECProcessed brandLogoSymbolAssetProcessedCount](self, "brandLogoSymbolAssetProcessedCount");
    if (v26 != objc_msgSend(v5, "brandLogoSymbolAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasObject2DAssetProcessedCount](self, "hasObject2DAssetProcessedCount")
    || objc_msgSend(v5, "hasObject2DAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasObject2DAssetProcessedCount](self, "hasObject2DAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasObject2DAssetProcessedCount"))
      goto LABEL_252;
    v27 = -[BMPECProcessed object2DAssetProcessedCount](self, "object2DAssetProcessedCount");
    if (v27 != objc_msgSend(v5, "object2DAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBarcodeDetectionAssetProcessedCount](self, "hasBarcodeDetectionAssetProcessedCount")
    || objc_msgSend(v5, "hasBarcodeDetectionAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasBarcodeDetectionAssetProcessedCount](self, "hasBarcodeDetectionAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBarcodeDetectionAssetProcessedCount"))
      goto LABEL_252;
    v28 = -[BMPECProcessed barcodeDetectionAssetProcessedCount](self, "barcodeDetectionAssetProcessedCount");
    if (v28 != objc_msgSend(v5, "barcodeDetectionAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasSculptureAssetProcessedCount](self, "hasSculptureAssetProcessedCount")
    || objc_msgSend(v5, "hasSculptureAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasSculptureAssetProcessedCount](self, "hasSculptureAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasSculptureAssetProcessedCount"))
      goto LABEL_252;
    v29 = -[BMPECProcessed sculptureAssetProcessedCount](self, "sculptureAssetProcessedCount");
    if (v29 != objc_msgSend(v5, "sculptureAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasSkylineAssetProcessedCount](self, "hasSkylineAssetProcessedCount")
    || objc_msgSend(v5, "hasSkylineAssetProcessedCount"))
  {
    if (!-[BMPECProcessed hasSkylineAssetProcessedCount](self, "hasSkylineAssetProcessedCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasSkylineAssetProcessedCount"))
      goto LABEL_252;
    v30 = -[BMPECProcessed skylineAssetProcessedCount](self, "skylineAssetProcessedCount");
    if (v30 != objc_msgSend(v5, "skylineAssetProcessedCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasArtAssetSuccessesCount](self, "hasArtAssetSuccessesCount")
    || objc_msgSend(v5, "hasArtAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasArtAssetSuccessesCount](self, "hasArtAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasArtAssetSuccessesCount"))
      goto LABEL_252;
    v31 = -[BMPECProcessed artAssetSuccessesCount](self, "artAssetSuccessesCount");
    if (v31 != objc_msgSend(v5, "artAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasNatureAssetSuccessesCount](self, "hasNatureAssetSuccessesCount")
    || objc_msgSend(v5, "hasNatureAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasNatureAssetSuccessesCount](self, "hasNatureAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNatureAssetSuccessesCount"))
      goto LABEL_252;
    v32 = -[BMPECProcessed natureAssetSuccessesCount](self, "natureAssetSuccessesCount");
    if (v32 != objc_msgSend(v5, "natureAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasAnimalsAssetSuccessesCount](self, "hasAnimalsAssetSuccessesCount")
    || objc_msgSend(v5, "hasAnimalsAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasAnimalsAssetSuccessesCount](self, "hasAnimalsAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasAnimalsAssetSuccessesCount"))
      goto LABEL_252;
    v33 = -[BMPECProcessed animalsAssetSuccessesCount](self, "animalsAssetSuccessesCount");
    if (v33 != objc_msgSend(v5, "animalsAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBirdsAssetSuccessesCount](self, "hasBirdsAssetSuccessesCount")
    || objc_msgSend(v5, "hasBirdsAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasBirdsAssetSuccessesCount](self, "hasBirdsAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBirdsAssetSuccessesCount"))
      goto LABEL_252;
    v34 = -[BMPECProcessed birdsAssetSuccessesCount](self, "birdsAssetSuccessesCount");
    if (v34 != objc_msgSend(v5, "birdsAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasInsectsAssetSuccessesCount](self, "hasInsectsAssetSuccessesCount")
    || objc_msgSend(v5, "hasInsectsAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasInsectsAssetSuccessesCount](self, "hasInsectsAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasInsectsAssetSuccessesCount"))
      goto LABEL_252;
    v35 = -[BMPECProcessed insectsAssetSuccessesCount](self, "insectsAssetSuccessesCount");
    if (v35 != objc_msgSend(v5, "insectsAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasReptilesAssetSuccessesCount](self, "hasReptilesAssetSuccessesCount")
    || objc_msgSend(v5, "hasReptilesAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasReptilesAssetSuccessesCount](self, "hasReptilesAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasReptilesAssetSuccessesCount"))
      goto LABEL_252;
    v36 = -[BMPECProcessed reptilesAssetSuccessesCount](self, "reptilesAssetSuccessesCount");
    if (v36 != objc_msgSend(v5, "reptilesAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasMammalsAssetSuccessesCount](self, "hasMammalsAssetSuccessesCount")
    || objc_msgSend(v5, "hasMammalsAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasMammalsAssetSuccessesCount](self, "hasMammalsAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasMammalsAssetSuccessesCount"))
      goto LABEL_252;
    v37 = -[BMPECProcessed mammalsAssetSuccessesCount](self, "mammalsAssetSuccessesCount");
    if (v37 != objc_msgSend(v5, "mammalsAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasLandmarkAssetSuccessesCount](self, "hasLandmarkAssetSuccessesCount")
    || objc_msgSend(v5, "hasLandmarkAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasLandmarkAssetSuccessesCount](self, "hasLandmarkAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasLandmarkAssetSuccessesCount"))
      goto LABEL_252;
    v38 = -[BMPECProcessed landmarkAssetSuccessesCount](self, "landmarkAssetSuccessesCount");
    if (v38 != objc_msgSend(v5, "landmarkAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasNaturalLandmarkSuccessesAssetCount](self, "hasNaturalLandmarkSuccessesAssetCount")
    || objc_msgSend(v5, "hasNaturalLandmarkSuccessesAssetCount"))
  {
    if (!-[BMPECProcessed hasNaturalLandmarkSuccessesAssetCount](self, "hasNaturalLandmarkSuccessesAssetCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasNaturalLandmarkSuccessesAssetCount"))
      goto LABEL_252;
    v39 = -[BMPECProcessed naturalLandmarkSuccessesAssetCount](self, "naturalLandmarkSuccessesAssetCount");
    if (v39 != objc_msgSend(v5, "naturalLandmarkSuccessesAssetCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasMediaAssetSuccessesCount](self, "hasMediaAssetSuccessesCount")
    || objc_msgSend(v5, "hasMediaAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasMediaAssetSuccessesCount](self, "hasMediaAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasMediaAssetSuccessesCount"))
      goto LABEL_252;
    v40 = -[BMPECProcessed mediaAssetSuccessesCount](self, "mediaAssetSuccessesCount");
    if (v40 != objc_msgSend(v5, "mediaAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBookAssetSuccessesCount](self, "hasBookAssetSuccessesCount")
    || objc_msgSend(v5, "hasBookAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasBookAssetSuccessesCount](self, "hasBookAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBookAssetSuccessesCount"))
      goto LABEL_252;
    v41 = -[BMPECProcessed bookAssetSuccessesCount](self, "bookAssetSuccessesCount");
    if (v41 != objc_msgSend(v5, "bookAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasAlbumAssetSuccessesCount](self, "hasAlbumAssetSuccessesCount")
    || objc_msgSend(v5, "hasAlbumAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasAlbumAssetSuccessesCount](self, "hasAlbumAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasAlbumAssetSuccessesCount"))
      goto LABEL_252;
    v42 = -[BMPECProcessed albumAssetSuccessesCount](self, "albumAssetSuccessesCount");
    if (v42 != objc_msgSend(v5, "albumAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasCatsAssetSuccessesCount](self, "hasCatsAssetSuccessesCount")
    || objc_msgSend(v5, "hasCatsAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasCatsAssetSuccessesCount](self, "hasCatsAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasCatsAssetSuccessesCount"))
      goto LABEL_252;
    v43 = -[BMPECProcessed catsAssetSuccessesCount](self, "catsAssetSuccessesCount");
    if (v43 != objc_msgSend(v5, "catsAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasDogsAssetSuccessesCount](self, "hasDogsAssetSuccessesCount")
    || objc_msgSend(v5, "hasDogsAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasDogsAssetSuccessesCount](self, "hasDogsAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasDogsAssetSuccessesCount"))
      goto LABEL_252;
    v44 = -[BMPECProcessed dogsAssetSuccessesCount](self, "dogsAssetSuccessesCount");
    if (v44 != objc_msgSend(v5, "dogsAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasApparelAssetSuccessesCount](self, "hasApparelAssetSuccessesCount")
    || objc_msgSend(v5, "hasApparelAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasApparelAssetSuccessesCount](self, "hasApparelAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasApparelAssetSuccessesCount"))
      goto LABEL_252;
    v45 = -[BMPECProcessed apparelAssetSuccessesCount](self, "apparelAssetSuccessesCount");
    if (v45 != objc_msgSend(v5, "apparelAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasFoodAssetSuccessesCount](self, "hasFoodAssetSuccessesCount")
    || objc_msgSend(v5, "hasFoodAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasFoodAssetSuccessesCount](self, "hasFoodAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasFoodAssetSuccessesCount"))
      goto LABEL_252;
    v46 = -[BMPECProcessed foodAssetSuccessesCount](self, "foodAssetSuccessesCount");
    if (v46 != objc_msgSend(v5, "foodAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasStorefrontAssetSuccessesCount](self, "hasStorefrontAssetSuccessesCount")
    || objc_msgSend(v5, "hasStorefrontAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasStorefrontAssetSuccessesCount](self, "hasStorefrontAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasStorefrontAssetSuccessesCount"))
      goto LABEL_252;
    v47 = -[BMPECProcessed storefrontAssetSuccessesCount](self, "storefrontAssetSuccessesCount");
    if (v47 != objc_msgSend(v5, "storefrontAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasSignSymbolAssetSuccessesCount](self, "hasSignSymbolAssetSuccessesCount")
    || objc_msgSend(v5, "hasSignSymbolAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasSignSymbolAssetSuccessesCount](self, "hasSignSymbolAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasSignSymbolAssetSuccessesCount"))
      goto LABEL_252;
    v48 = -[BMPECProcessed signSymbolAssetSuccessesCount](self, "signSymbolAssetSuccessesCount");
    if (v48 != objc_msgSend(v5, "signSymbolAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasLaundryCareSymbolAssetSuccessesCount](self, "hasLaundryCareSymbolAssetSuccessesCount")
    || objc_msgSend(v5, "hasLaundryCareSymbolAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasLaundryCareSymbolAssetSuccessesCount](self, "hasLaundryCareSymbolAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasLaundryCareSymbolAssetSuccessesCount"))
      goto LABEL_252;
    v49 = -[BMPECProcessed laundryCareSymbolAssetSuccessesCount](self, "laundryCareSymbolAssetSuccessesCount");
    if (v49 != objc_msgSend(v5, "laundryCareSymbolAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasAutoSymbolAssetSuccessesCount](self, "hasAutoSymbolAssetSuccessesCount")
    || objc_msgSend(v5, "hasAutoSymbolAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasAutoSymbolAssetSuccessesCount](self, "hasAutoSymbolAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasAutoSymbolAssetSuccessesCount"))
      goto LABEL_252;
    v50 = -[BMPECProcessed autoSymbolAssetSuccessesCount](self, "autoSymbolAssetSuccessesCount");
    if (v50 != objc_msgSend(v5, "autoSymbolAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBrandLogoSymbolAssetSuccessesCount](self, "hasBrandLogoSymbolAssetSuccessesCount")
    || objc_msgSend(v5, "hasBrandLogoSymbolAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasBrandLogoSymbolAssetSuccessesCount](self, "hasBrandLogoSymbolAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBrandLogoSymbolAssetSuccessesCount"))
      goto LABEL_252;
    v51 = -[BMPECProcessed brandLogoSymbolAssetSuccessesCount](self, "brandLogoSymbolAssetSuccessesCount");
    if (v51 != objc_msgSend(v5, "brandLogoSymbolAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasObject2DAssetSuccessesCount](self, "hasObject2DAssetSuccessesCount")
    || objc_msgSend(v5, "hasObject2DAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasObject2DAssetSuccessesCount](self, "hasObject2DAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasObject2DAssetSuccessesCount"))
      goto LABEL_252;
    v52 = -[BMPECProcessed object2DAssetSuccessesCount](self, "object2DAssetSuccessesCount");
    if (v52 != objc_msgSend(v5, "object2DAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasBarcodeDetectionAssetSuccessesCount](self, "hasBarcodeDetectionAssetSuccessesCount")
    || objc_msgSend(v5, "hasBarcodeDetectionAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasBarcodeDetectionAssetSuccessesCount](self, "hasBarcodeDetectionAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasBarcodeDetectionAssetSuccessesCount"))
      goto LABEL_252;
    v53 = -[BMPECProcessed barcodeDetectionAssetSuccessesCount](self, "barcodeDetectionAssetSuccessesCount");
    if (v53 != objc_msgSend(v5, "barcodeDetectionAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (-[BMPECProcessed hasSculptureAssetSuccessesCount](self, "hasSculptureAssetSuccessesCount")
    || objc_msgSend(v5, "hasSculptureAssetSuccessesCount"))
  {
    if (!-[BMPECProcessed hasSculptureAssetSuccessesCount](self, "hasSculptureAssetSuccessesCount"))
      goto LABEL_252;
    if (!objc_msgSend(v5, "hasSculptureAssetSuccessesCount"))
      goto LABEL_252;
    v54 = -[BMPECProcessed sculptureAssetSuccessesCount](self, "sculptureAssetSuccessesCount");
    if (v54 != objc_msgSend(v5, "sculptureAssetSuccessesCount"))
      goto LABEL_252;
  }
  if (!-[BMPECProcessed hasSkylineAssetSuccessesCount](self, "hasSkylineAssetSuccessesCount")
    && !objc_msgSend(v5, "hasSkylineAssetSuccessesCount"))
  {
    v56 = 1;
    goto LABEL_253;
  }
  if (-[BMPECProcessed hasSkylineAssetSuccessesCount](self, "hasSkylineAssetSuccessesCount")
    && objc_msgSend(v5, "hasSkylineAssetSuccessesCount"))
  {
    v55 = -[BMPECProcessed skylineAssetSuccessesCount](self, "skylineAssetSuccessesCount");
    v56 = v55 == objc_msgSend(v5, "skylineAssetSuccessesCount");
  }
  else
  {
LABEL_252:
    v56 = 0;
  }
LABEL_253:

LABEL_255:
  return v56;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)artAssetProcessedCount
{
  return self->_artAssetProcessedCount;
}

- (BOOL)hasArtAssetProcessedCount
{
  return self->_hasArtAssetProcessedCount;
}

- (void)setHasArtAssetProcessedCount:(BOOL)a3
{
  self->_hasArtAssetProcessedCount = a3;
}

- (int)natureAssetProcessedCount
{
  return self->_natureAssetProcessedCount;
}

- (BOOL)hasNatureAssetProcessedCount
{
  return self->_hasNatureAssetProcessedCount;
}

- (void)setHasNatureAssetProcessedCount:(BOOL)a3
{
  self->_hasNatureAssetProcessedCount = a3;
}

- (int)animalsAssetProcessedCount
{
  return self->_animalsAssetProcessedCount;
}

- (BOOL)hasAnimalsAssetProcessedCount
{
  return self->_hasAnimalsAssetProcessedCount;
}

- (void)setHasAnimalsAssetProcessedCount:(BOOL)a3
{
  self->_hasAnimalsAssetProcessedCount = a3;
}

- (int)birdsAssetProcessedCount
{
  return self->_birdsAssetProcessedCount;
}

- (BOOL)hasBirdsAssetProcessedCount
{
  return self->_hasBirdsAssetProcessedCount;
}

- (void)setHasBirdsAssetProcessedCount:(BOOL)a3
{
  self->_hasBirdsAssetProcessedCount = a3;
}

- (int)insectsAssetProcessedCount
{
  return self->_insectsAssetProcessedCount;
}

- (BOOL)hasInsectsAssetProcessedCount
{
  return self->_hasInsectsAssetProcessedCount;
}

- (void)setHasInsectsAssetProcessedCount:(BOOL)a3
{
  self->_hasInsectsAssetProcessedCount = a3;
}

- (int)reptilesAssetProcessedCount
{
  return self->_reptilesAssetProcessedCount;
}

- (BOOL)hasReptilesAssetProcessedCount
{
  return self->_hasReptilesAssetProcessedCount;
}

- (void)setHasReptilesAssetProcessedCount:(BOOL)a3
{
  self->_hasReptilesAssetProcessedCount = a3;
}

- (int)mammalsAssetProcessedCount
{
  return self->_mammalsAssetProcessedCount;
}

- (BOOL)hasMammalsAssetProcessedCount
{
  return self->_hasMammalsAssetProcessedCount;
}

- (void)setHasMammalsAssetProcessedCount:(BOOL)a3
{
  self->_hasMammalsAssetProcessedCount = a3;
}

- (int)landmarkAssetProcessedCount
{
  return self->_landmarkAssetProcessedCount;
}

- (BOOL)hasLandmarkAssetProcessedCount
{
  return self->_hasLandmarkAssetProcessedCount;
}

- (void)setHasLandmarkAssetProcessedCount:(BOOL)a3
{
  self->_hasLandmarkAssetProcessedCount = a3;
}

- (int)naturalLandmarkProcessedAssetCount
{
  return self->_naturalLandmarkProcessedAssetCount;
}

- (BOOL)hasNaturalLandmarkProcessedAssetCount
{
  return self->_hasNaturalLandmarkProcessedAssetCount;
}

- (void)setHasNaturalLandmarkProcessedAssetCount:(BOOL)a3
{
  self->_hasNaturalLandmarkProcessedAssetCount = a3;
}

- (int)mediaAssetProcessedCount
{
  return self->_mediaAssetProcessedCount;
}

- (BOOL)hasMediaAssetProcessedCount
{
  return self->_hasMediaAssetProcessedCount;
}

- (void)setHasMediaAssetProcessedCount:(BOOL)a3
{
  self->_hasMediaAssetProcessedCount = a3;
}

- (int)bookAssetProcessedCount
{
  return self->_bookAssetProcessedCount;
}

- (BOOL)hasBookAssetProcessedCount
{
  return self->_hasBookAssetProcessedCount;
}

- (void)setHasBookAssetProcessedCount:(BOOL)a3
{
  self->_hasBookAssetProcessedCount = a3;
}

- (int)albumAssetProcessedCount
{
  return self->_albumAssetProcessedCount;
}

- (BOOL)hasAlbumAssetProcessedCount
{
  return self->_hasAlbumAssetProcessedCount;
}

- (void)setHasAlbumAssetProcessedCount:(BOOL)a3
{
  self->_hasAlbumAssetProcessedCount = a3;
}

- (int)catsAssetProcessedCount
{
  return self->_catsAssetProcessedCount;
}

- (BOOL)hasCatsAssetProcessedCount
{
  return self->_hasCatsAssetProcessedCount;
}

- (void)setHasCatsAssetProcessedCount:(BOOL)a3
{
  self->_hasCatsAssetProcessedCount = a3;
}

- (int)dogsAssetProcessedCount
{
  return self->_dogsAssetProcessedCount;
}

- (BOOL)hasDogsAssetProcessedCount
{
  return self->_hasDogsAssetProcessedCount;
}

- (void)setHasDogsAssetProcessedCount:(BOOL)a3
{
  self->_hasDogsAssetProcessedCount = a3;
}

- (int)apparelAssetProcessedCount
{
  return self->_apparelAssetProcessedCount;
}

- (BOOL)hasApparelAssetProcessedCount
{
  return self->_hasApparelAssetProcessedCount;
}

- (void)setHasApparelAssetProcessedCount:(BOOL)a3
{
  self->_hasApparelAssetProcessedCount = a3;
}

- (int)foodAssetProcessedCount
{
  return self->_foodAssetProcessedCount;
}

- (BOOL)hasFoodAssetProcessedCount
{
  return self->_hasFoodAssetProcessedCount;
}

- (void)setHasFoodAssetProcessedCount:(BOOL)a3
{
  self->_hasFoodAssetProcessedCount = a3;
}

- (int)storefrontAssetProcessedCount
{
  return self->_storefrontAssetProcessedCount;
}

- (BOOL)hasStorefrontAssetProcessedCount
{
  return self->_hasStorefrontAssetProcessedCount;
}

- (void)setHasStorefrontAssetProcessedCount:(BOOL)a3
{
  self->_hasStorefrontAssetProcessedCount = a3;
}

- (int)signSymbolAssetProcessedCount
{
  return self->_signSymbolAssetProcessedCount;
}

- (BOOL)hasSignSymbolAssetProcessedCount
{
  return self->_hasSignSymbolAssetProcessedCount;
}

- (void)setHasSignSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasSignSymbolAssetProcessedCount = a3;
}

- (int)laundryCareSymbolAssetProcessedCount
{
  return self->_laundryCareSymbolAssetProcessedCount;
}

- (BOOL)hasLaundryCareSymbolAssetProcessedCount
{
  return self->_hasLaundryCareSymbolAssetProcessedCount;
}

- (void)setHasLaundryCareSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasLaundryCareSymbolAssetProcessedCount = a3;
}

- (int)autoSymbolAssetProcessedCount
{
  return self->_autoSymbolAssetProcessedCount;
}

- (BOOL)hasAutoSymbolAssetProcessedCount
{
  return self->_hasAutoSymbolAssetProcessedCount;
}

- (void)setHasAutoSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasAutoSymbolAssetProcessedCount = a3;
}

- (int)brandLogoSymbolAssetProcessedCount
{
  return self->_brandLogoSymbolAssetProcessedCount;
}

- (BOOL)hasBrandLogoSymbolAssetProcessedCount
{
  return self->_hasBrandLogoSymbolAssetProcessedCount;
}

- (void)setHasBrandLogoSymbolAssetProcessedCount:(BOOL)a3
{
  self->_hasBrandLogoSymbolAssetProcessedCount = a3;
}

- (int)object2DAssetProcessedCount
{
  return self->_object2DAssetProcessedCount;
}

- (BOOL)hasObject2DAssetProcessedCount
{
  return self->_hasObject2DAssetProcessedCount;
}

- (void)setHasObject2DAssetProcessedCount:(BOOL)a3
{
  self->_hasObject2DAssetProcessedCount = a3;
}

- (int)barcodeDetectionAssetProcessedCount
{
  return self->_barcodeDetectionAssetProcessedCount;
}

- (BOOL)hasBarcodeDetectionAssetProcessedCount
{
  return self->_hasBarcodeDetectionAssetProcessedCount;
}

- (void)setHasBarcodeDetectionAssetProcessedCount:(BOOL)a3
{
  self->_hasBarcodeDetectionAssetProcessedCount = a3;
}

- (int)sculptureAssetProcessedCount
{
  return self->_sculptureAssetProcessedCount;
}

- (BOOL)hasSculptureAssetProcessedCount
{
  return self->_hasSculptureAssetProcessedCount;
}

- (void)setHasSculptureAssetProcessedCount:(BOOL)a3
{
  self->_hasSculptureAssetProcessedCount = a3;
}

- (int)skylineAssetProcessedCount
{
  return self->_skylineAssetProcessedCount;
}

- (BOOL)hasSkylineAssetProcessedCount
{
  return self->_hasSkylineAssetProcessedCount;
}

- (void)setHasSkylineAssetProcessedCount:(BOOL)a3
{
  self->_hasSkylineAssetProcessedCount = a3;
}

- (int)artAssetSuccessesCount
{
  return self->_artAssetSuccessesCount;
}

- (BOOL)hasArtAssetSuccessesCount
{
  return self->_hasArtAssetSuccessesCount;
}

- (void)setHasArtAssetSuccessesCount:(BOOL)a3
{
  self->_hasArtAssetSuccessesCount = a3;
}

- (int)natureAssetSuccessesCount
{
  return self->_natureAssetSuccessesCount;
}

- (BOOL)hasNatureAssetSuccessesCount
{
  return self->_hasNatureAssetSuccessesCount;
}

- (void)setHasNatureAssetSuccessesCount:(BOOL)a3
{
  self->_hasNatureAssetSuccessesCount = a3;
}

- (int)animalsAssetSuccessesCount
{
  return self->_animalsAssetSuccessesCount;
}

- (BOOL)hasAnimalsAssetSuccessesCount
{
  return self->_hasAnimalsAssetSuccessesCount;
}

- (void)setHasAnimalsAssetSuccessesCount:(BOOL)a3
{
  self->_hasAnimalsAssetSuccessesCount = a3;
}

- (int)birdsAssetSuccessesCount
{
  return self->_birdsAssetSuccessesCount;
}

- (BOOL)hasBirdsAssetSuccessesCount
{
  return self->_hasBirdsAssetSuccessesCount;
}

- (void)setHasBirdsAssetSuccessesCount:(BOOL)a3
{
  self->_hasBirdsAssetSuccessesCount = a3;
}

- (int)insectsAssetSuccessesCount
{
  return self->_insectsAssetSuccessesCount;
}

- (BOOL)hasInsectsAssetSuccessesCount
{
  return self->_hasInsectsAssetSuccessesCount;
}

- (void)setHasInsectsAssetSuccessesCount:(BOOL)a3
{
  self->_hasInsectsAssetSuccessesCount = a3;
}

- (int)reptilesAssetSuccessesCount
{
  return self->_reptilesAssetSuccessesCount;
}

- (BOOL)hasReptilesAssetSuccessesCount
{
  return self->_hasReptilesAssetSuccessesCount;
}

- (void)setHasReptilesAssetSuccessesCount:(BOOL)a3
{
  self->_hasReptilesAssetSuccessesCount = a3;
}

- (int)mammalsAssetSuccessesCount
{
  return self->_mammalsAssetSuccessesCount;
}

- (BOOL)hasMammalsAssetSuccessesCount
{
  return self->_hasMammalsAssetSuccessesCount;
}

- (void)setHasMammalsAssetSuccessesCount:(BOOL)a3
{
  self->_hasMammalsAssetSuccessesCount = a3;
}

- (int)landmarkAssetSuccessesCount
{
  return self->_landmarkAssetSuccessesCount;
}

- (BOOL)hasLandmarkAssetSuccessesCount
{
  return self->_hasLandmarkAssetSuccessesCount;
}

- (void)setHasLandmarkAssetSuccessesCount:(BOOL)a3
{
  self->_hasLandmarkAssetSuccessesCount = a3;
}

- (int)naturalLandmarkSuccessesAssetCount
{
  return self->_naturalLandmarkSuccessesAssetCount;
}

- (BOOL)hasNaturalLandmarkSuccessesAssetCount
{
  return self->_hasNaturalLandmarkSuccessesAssetCount;
}

- (void)setHasNaturalLandmarkSuccessesAssetCount:(BOOL)a3
{
  self->_hasNaturalLandmarkSuccessesAssetCount = a3;
}

- (int)mediaAssetSuccessesCount
{
  return self->_mediaAssetSuccessesCount;
}

- (BOOL)hasMediaAssetSuccessesCount
{
  return self->_hasMediaAssetSuccessesCount;
}

- (void)setHasMediaAssetSuccessesCount:(BOOL)a3
{
  self->_hasMediaAssetSuccessesCount = a3;
}

- (int)bookAssetSuccessesCount
{
  return self->_bookAssetSuccessesCount;
}

- (BOOL)hasBookAssetSuccessesCount
{
  return self->_hasBookAssetSuccessesCount;
}

- (void)setHasBookAssetSuccessesCount:(BOOL)a3
{
  self->_hasBookAssetSuccessesCount = a3;
}

- (int)albumAssetSuccessesCount
{
  return self->_albumAssetSuccessesCount;
}

- (BOOL)hasAlbumAssetSuccessesCount
{
  return self->_hasAlbumAssetSuccessesCount;
}

- (void)setHasAlbumAssetSuccessesCount:(BOOL)a3
{
  self->_hasAlbumAssetSuccessesCount = a3;
}

- (int)catsAssetSuccessesCount
{
  return self->_catsAssetSuccessesCount;
}

- (BOOL)hasCatsAssetSuccessesCount
{
  return self->_hasCatsAssetSuccessesCount;
}

- (void)setHasCatsAssetSuccessesCount:(BOOL)a3
{
  self->_hasCatsAssetSuccessesCount = a3;
}

- (int)dogsAssetSuccessesCount
{
  return self->_dogsAssetSuccessesCount;
}

- (BOOL)hasDogsAssetSuccessesCount
{
  return self->_hasDogsAssetSuccessesCount;
}

- (void)setHasDogsAssetSuccessesCount:(BOOL)a3
{
  self->_hasDogsAssetSuccessesCount = a3;
}

- (int)apparelAssetSuccessesCount
{
  return self->_apparelAssetSuccessesCount;
}

- (BOOL)hasApparelAssetSuccessesCount
{
  return self->_hasApparelAssetSuccessesCount;
}

- (void)setHasApparelAssetSuccessesCount:(BOOL)a3
{
  self->_hasApparelAssetSuccessesCount = a3;
}

- (int)foodAssetSuccessesCount
{
  return self->_foodAssetSuccessesCount;
}

- (BOOL)hasFoodAssetSuccessesCount
{
  return self->_hasFoodAssetSuccessesCount;
}

- (void)setHasFoodAssetSuccessesCount:(BOOL)a3
{
  self->_hasFoodAssetSuccessesCount = a3;
}

- (int)storefrontAssetSuccessesCount
{
  return self->_storefrontAssetSuccessesCount;
}

- (BOOL)hasStorefrontAssetSuccessesCount
{
  return self->_hasStorefrontAssetSuccessesCount;
}

- (void)setHasStorefrontAssetSuccessesCount:(BOOL)a3
{
  self->_hasStorefrontAssetSuccessesCount = a3;
}

- (int)signSymbolAssetSuccessesCount
{
  return self->_signSymbolAssetSuccessesCount;
}

- (BOOL)hasSignSymbolAssetSuccessesCount
{
  return self->_hasSignSymbolAssetSuccessesCount;
}

- (void)setHasSignSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasSignSymbolAssetSuccessesCount = a3;
}

- (int)laundryCareSymbolAssetSuccessesCount
{
  return self->_laundryCareSymbolAssetSuccessesCount;
}

- (BOOL)hasLaundryCareSymbolAssetSuccessesCount
{
  return self->_hasLaundryCareSymbolAssetSuccessesCount;
}

- (void)setHasLaundryCareSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasLaundryCareSymbolAssetSuccessesCount = a3;
}

- (int)autoSymbolAssetSuccessesCount
{
  return self->_autoSymbolAssetSuccessesCount;
}

- (BOOL)hasAutoSymbolAssetSuccessesCount
{
  return self->_hasAutoSymbolAssetSuccessesCount;
}

- (void)setHasAutoSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasAutoSymbolAssetSuccessesCount = a3;
}

- (int)brandLogoSymbolAssetSuccessesCount
{
  return self->_brandLogoSymbolAssetSuccessesCount;
}

- (BOOL)hasBrandLogoSymbolAssetSuccessesCount
{
  return self->_hasBrandLogoSymbolAssetSuccessesCount;
}

- (void)setHasBrandLogoSymbolAssetSuccessesCount:(BOOL)a3
{
  self->_hasBrandLogoSymbolAssetSuccessesCount = a3;
}

- (int)object2DAssetSuccessesCount
{
  return self->_object2DAssetSuccessesCount;
}

- (BOOL)hasObject2DAssetSuccessesCount
{
  return self->_hasObject2DAssetSuccessesCount;
}

- (void)setHasObject2DAssetSuccessesCount:(BOOL)a3
{
  self->_hasObject2DAssetSuccessesCount = a3;
}

- (int)barcodeDetectionAssetSuccessesCount
{
  return self->_barcodeDetectionAssetSuccessesCount;
}

- (BOOL)hasBarcodeDetectionAssetSuccessesCount
{
  return self->_hasBarcodeDetectionAssetSuccessesCount;
}

- (void)setHasBarcodeDetectionAssetSuccessesCount:(BOOL)a3
{
  self->_hasBarcodeDetectionAssetSuccessesCount = a3;
}

- (int)sculptureAssetSuccessesCount
{
  return self->_sculptureAssetSuccessesCount;
}

- (BOOL)hasSculptureAssetSuccessesCount
{
  return self->_hasSculptureAssetSuccessesCount;
}

- (void)setHasSculptureAssetSuccessesCount:(BOOL)a3
{
  self->_hasSculptureAssetSuccessesCount = a3;
}

- (int)skylineAssetSuccessesCount
{
  return self->_skylineAssetSuccessesCount;
}

- (BOOL)hasSkylineAssetSuccessesCount
{
  return self->_hasSkylineAssetSuccessesCount;
}

- (void)setHasSkylineAssetSuccessesCount:(BOOL)a3
{
  self->_hasSkylineAssetSuccessesCount = a3;
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

    v4 = -[BMPECProcessed initByReadFrom:]([BMPECProcessed alloc], "initByReadFrom:", v7);
    v4[17] = 0;

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
  void *v10;
  id v12;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  _QWORD v54[52];

  v54[50] = *MEMORY[0x1E0C80C00];
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("artAssetProcessedCount"), 0, 0, 1, 2, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("natureAssetProcessedCount"), 0, 0, 2, 2, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("animalsAssetProcessedCount"), 0, 0, 3, 2, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("birdsAssetProcessedCount"), 0, 0, 4, 2, 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("insectsAssetProcessedCount"), 0, 0, 5, 2, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reptilesAssetProcessedCount"), 0, 0, 6, 2, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mammalsAssetProcessedCount"), 0, 0, 7, 2, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("landmarkAssetProcessedCount"), 0, 0, 8, 2, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("naturalLandmarkProcessedAssetCount"), 0, 0, 9, 2, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaAssetProcessedCount"), 0, 0, 10, 2, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bookAssetProcessedCount"), 0, 0, 11, 2, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("albumAssetProcessedCount"), 0, 0, 12, 2, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("catsAssetProcessedCount"), 0, 0, 13, 2, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dogsAssetProcessedCount"), 0, 0, 14, 2, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("apparelAssetProcessedCount"), 0, 0, 15, 2, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("foodAssetProcessedCount"), 0, 0, 16, 2, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("storefrontAssetProcessedCount"), 0, 0, 17, 2, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("signSymbolAssetProcessedCount"), 0, 0, 18, 2, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("laundryCareSymbolAssetProcessedCount"), 0, 0, 19, 2, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("autoSymbolAssetProcessedCount"), 0, 0, 20, 2, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("brandLogoSymbolAssetProcessedCount"), 0, 0, 21, 2, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("object2DAssetProcessedCount"), 0, 0, 22, 2, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("barcodeDetectionAssetProcessedCount"), 0, 0, 23, 2, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sculptureAssetProcessedCount"), 0, 0, 24, 2, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("skylineAssetProcessedCount"), 0, 0, 25, 2, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("artAssetSuccessesCount"), 0, 0, 26, 2, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("natureAssetSuccessesCount"), 0, 0, 27, 2, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("animalsAssetSuccessesCount"), 0, 0, 28, 2, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("birdsAssetSuccessesCount"), 0, 0, 29, 2, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("insectsAssetSuccessesCount"), 0, 0, 30, 2, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reptilesAssetSuccessesCount"), 0, 0, 31, 2, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mammalsAssetSuccessesCount"), 0, 0, 32, 2, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("landmarkAssetSuccessesCount"), 0, 0, 33, 2, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("naturalLandmarkSuccessesAssetCount"), 0, 0, 34, 2, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaAssetSuccessesCount"), 0, 0, 35, 2, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bookAssetSuccessesCount"), 0, 0, 36, 2, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("albumAssetSuccessesCount"), 0, 0, 37, 2, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("catsAssetSuccessesCount"), 0, 0, 38, 2, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dogsAssetSuccessesCount"), 0, 0, 39, 2, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("apparelAssetSuccessesCount"), 0, 0, 40, 2, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("foodAssetSuccessesCount"), 0, 0, 41, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("storefrontAssetSuccessesCount"), 0, 0, 42, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("signSymbolAssetSuccessesCount"), 0, 0, 43, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("laundryCareSymbolAssetSuccessesCount"), 0, 0, 44, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("autoSymbolAssetSuccessesCount"), 0, 0, 45, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("brandLogoSymbolAssetSuccessesCount"), 0, 0, 46, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("object2DAssetSuccessesCount"), 0, 0, 47, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("barcodeDetectionAssetSuccessesCount"), 0, 0, 48, 2, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sculptureAssetSuccessesCount"), 0, 0, 49, 2, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("skylineAssetSuccessesCount"), 0, 0, 50, 2, 0);
  v54[0] = v52;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v48;
  v54[6] = v47;
  v54[7] = v46;
  v54[8] = v45;
  v54[9] = v44;
  v54[10] = v43;
  v54[11] = v42;
  v54[12] = v41;
  v54[13] = v40;
  v54[14] = v39;
  v54[15] = v38;
  v54[16] = v37;
  v54[17] = v36;
  v54[18] = v35;
  v54[19] = v34;
  v54[20] = v33;
  v54[21] = v32;
  v54[22] = v31;
  v54[23] = v30;
  v54[24] = v29;
  v54[25] = v28;
  v54[26] = v27;
  v54[27] = v26;
  v54[28] = v25;
  v54[29] = v24;
  v54[30] = v23;
  v54[31] = v22;
  v54[32] = v21;
  v54[33] = v20;
  v54[34] = v19;
  v54[35] = v18;
  v54[36] = v17;
  v54[37] = v16;
  v54[38] = v15;
  v54[39] = v14;
  v54[40] = v2;
  v54[41] = v3;
  v54[42] = v4;
  v54[43] = v5;
  v54[44] = v6;
  v54[45] = v7;
  v54[46] = v8;
  v54[47] = v13;
  v54[48] = v9;
  v54[49] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 50);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F200B0;
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
  id v13;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  _QWORD v54[52];

  v54[50] = *MEMORY[0x1E0C80C00];
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("artAssetProcessedCount"), 1, 2, 0);
  v54[0] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("natureAssetProcessedCount"), 2, 2, 0);
  v54[1] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("animalsAssetProcessedCount"), 3, 2, 0);
  v54[2] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("birdsAssetProcessedCount"), 4, 2, 0);
  v54[3] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("insectsAssetProcessedCount"), 5, 2, 0);
  v54[4] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reptilesAssetProcessedCount"), 6, 2, 0);
  v54[5] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mammalsAssetProcessedCount"), 7, 2, 0);
  v54[6] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("landmarkAssetProcessedCount"), 8, 2, 0);
  v54[7] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("naturalLandmarkProcessedAssetCount"), 9, 2, 0);
  v54[8] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaAssetProcessedCount"), 10, 2, 0);
  v54[9] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bookAssetProcessedCount"), 11, 2, 0);
  v54[10] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("albumAssetProcessedCount"), 12, 2, 0);
  v54[11] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("catsAssetProcessedCount"), 13, 2, 0);
  v54[12] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dogsAssetProcessedCount"), 14, 2, 0);
  v54[13] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("apparelAssetProcessedCount"), 15, 2, 0);
  v54[14] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("foodAssetProcessedCount"), 16, 2, 0);
  v54[15] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("storefrontAssetProcessedCount"), 17, 2, 0);
  v54[16] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("signSymbolAssetProcessedCount"), 18, 2, 0);
  v54[17] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("laundryCareSymbolAssetProcessedCount"), 19, 2, 0);
  v54[18] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("autoSymbolAssetProcessedCount"), 20, 2, 0);
  v54[19] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("brandLogoSymbolAssetProcessedCount"), 21, 2, 0);
  v54[20] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("object2DAssetProcessedCount"), 22, 2, 0);
  v54[21] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("barcodeDetectionAssetProcessedCount"), 23, 2, 0);
  v54[22] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sculptureAssetProcessedCount"), 24, 2, 0);
  v54[23] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("skylineAssetProcessedCount"), 25, 2, 0);
  v54[24] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("artAssetSuccessesCount"), 26, 2, 0);
  v54[25] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("natureAssetSuccessesCount"), 27, 2, 0);
  v54[26] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("animalsAssetSuccessesCount"), 28, 2, 0);
  v54[27] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("birdsAssetSuccessesCount"), 29, 2, 0);
  v54[28] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("insectsAssetSuccessesCount"), 30, 2, 0);
  v54[29] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reptilesAssetSuccessesCount"), 31, 2, 0);
  v54[30] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mammalsAssetSuccessesCount"), 32, 2, 0);
  v54[31] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("landmarkAssetSuccessesCount"), 33, 2, 0);
  v54[32] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("naturalLandmarkSuccessesAssetCount"), 34, 2, 0);
  v54[33] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaAssetSuccessesCount"), 35, 2, 0);
  v54[34] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bookAssetSuccessesCount"), 36, 2, 0);
  v54[35] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("albumAssetSuccessesCount"), 37, 2, 0);
  v54[36] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("catsAssetSuccessesCount"), 38, 2, 0);
  v54[37] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dogsAssetSuccessesCount"), 39, 2, 0);
  v54[38] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("apparelAssetSuccessesCount"), 40, 2, 0);
  v54[39] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("foodAssetSuccessesCount"), 41, 2, 0);
  v54[40] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("storefrontAssetSuccessesCount"), 42, 2, 0);
  v54[41] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("signSymbolAssetSuccessesCount"), 43, 2, 0);
  v54[42] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("laundryCareSymbolAssetSuccessesCount"), 44, 2, 0);
  v54[43] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("autoSymbolAssetSuccessesCount"), 45, 2, 0);
  v54[44] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("brandLogoSymbolAssetSuccessesCount"), 46, 2, 0);
  v54[45] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("object2DAssetSuccessesCount"), 47, 2, 0);
  v54[46] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("barcodeDetectionAssetSuccessesCount"), 48, 2, 0);
  v54[47] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sculptureAssetSuccessesCount"), 49, 2, 0);
  v54[48] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("skylineAssetSuccessesCount"), 50, 2, 0);
  v54[49] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 50);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
