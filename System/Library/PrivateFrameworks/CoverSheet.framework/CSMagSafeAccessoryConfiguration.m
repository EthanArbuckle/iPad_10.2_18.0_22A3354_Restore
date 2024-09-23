@implementation CSMagSafeAccessoryConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1)
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_10);
  return (id)defaultConfiguration___defaultConfiguration;
}

void __55__CSMagSafeAccessoryConfiguration_defaultConfiguration__block_invoke()
{
  CSMagSafeAccessoryConfiguration *v0;
  void *v1;

  v0 = -[CSMagSafeAccessoryConfiguration initWithStaticViewNeeded:]([CSMagSafeAccessoryConfiguration alloc], "initWithStaticViewNeeded:", 0);
  v1 = (void *)defaultConfiguration___defaultConfiguration;
  defaultConfiguration___defaultConfiguration = (uint64_t)v0;

}

+ (id)batteryCaseConfiguration
{
  if (batteryCaseConfiguration_onceToken != -1)
    dispatch_once(&batteryCaseConfiguration_onceToken, &__block_literal_global_1);
  return (id)batteryCaseConfiguration___batteryCaseConfiguration;
}

void __59__CSMagSafeAccessoryConfiguration_batteryCaseConfiguration__block_invoke()
{
  CSMagSafeAccessoryConfiguration *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[CSMagSafeAccessoryConfiguration initWithStaticViewNeeded:]([CSMagSafeAccessoryConfiguration alloc], "initWithStaticViewNeeded:", 0);
  v1 = (void *)batteryCaseConfiguration___batteryCaseConfiguration;
  batteryCaseConfiguration___batteryCaseConfiguration = (uint64_t)v0;

  v2 = (void *)batteryCaseConfiguration___batteryCaseConfiguration;
  +[CSMagSafeRingConfiguration auxiliaryConfiguration](CSMagSafeRingConfiguration, "auxiliaryConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAuxiliaryRing:", v3);

}

+ (id)staticViewConfiguration
{
  if (staticViewConfiguration_onceToken != -1)
    dispatch_once(&staticViewConfiguration_onceToken, &__block_literal_global_3);
  return (id)staticViewConfiguration___staticViewConfiguration;
}

void __58__CSMagSafeAccessoryConfiguration_staticViewConfiguration__block_invoke()
{
  CSMagSafeAccessoryConfiguration *v0;
  void *v1;

  v0 = -[CSMagSafeAccessoryConfiguration initWithStaticViewNeeded:]([CSMagSafeAccessoryConfiguration alloc], "initWithStaticViewNeeded:", 1);
  v1 = (void *)staticViewConfiguration___staticViewConfiguration;
  staticViewConfiguration___staticViewConfiguration = (uint64_t)v0;

}

+ (id)configuration:(id)a3 withBatteryPack:(BOOL)a4
{
  return (id)objc_msgSend(a3, "copy");
}

- (CSMagSafeAccessoryConfiguration)initWithStaticViewNeeded:(BOOL)a3
{
  CSMagSafeAccessoryConfiguration *v4;
  CSMagSafeAccessoryConfiguration *v5;
  CSMagSafeRingConfiguration *v6;
  CSLayoutStrategy *v7;
  CSLayoutStrategy *layoutStrategy;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSMagSafeAccessoryConfiguration;
  v4 = -[CSMagSafeAccessoryConfiguration init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_staticViewNeeded = a3;
    if (a3)
      +[CSMagSafeRingConfiguration staticConfiguration](CSMagSafeRingConfiguration, "staticConfiguration");
    else
      +[CSMagSafeRingConfiguration defaultConfiguration](CSMagSafeRingConfiguration, "defaultConfiguration");
    v6 = (CSMagSafeRingConfiguration *)objc_claimAutoreleasedReturnValue();
    v5->_ring = v6;

    v7 = objc_alloc_init(CSLayoutStrategy);
    layoutStrategy = v5->_layoutStrategy;
    v5->_layoutStrategy = v7;

    -[CSLayoutStrategy setPersistentLayout:](v5->_layoutStrategy, "setPersistentLayout:", v5);
  }
  return v5;
}

- (CGRect)visibleScreenCoordinatesForSleeve
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CSMagSafeAccessoryConfiguration layoutStrategy](self, "layoutStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "suggestedVisibleFrameForSleeveInScreenCoordinates:forceCenteredX:", 1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)timeLabelBaselineY
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t *v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v34;
  int v35;
  double v36;
  int v37;
  double v38;
  double v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  int v45;
  int v46;
  double v47;
  double v48;
  int v49;
  int v50;
  int v51;
  int v52;
  double v53;
  int v54;
  double v55;
  double v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  int v62;
  int v63;
  int v64;
  double v65;
  double v66;
  int v67;
  double v68;
  double v69;
  double v70;
  int v71;
  double v72;
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
  int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[12];
  _BYTE v133[40];
  _BYTE v134[12];
  __int128 v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;

  v3 = __sb__runningInSpringBoard();
  v4 = (uint64_t)&CSTimeLabelPortraitBaselineY;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v120, "userInterfaceIdiom") != 1)
    {
      v5 = 0;
      v6 = 1;
      goto LABEL_10;
    }
  }
  v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "_referenceBounds");
    }
    v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v27 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v143 = v7 ^ 1;
      v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v140 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v141 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FED8;
      goto LABEL_67;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_10:
  v8 = __sb__runningInSpringBoard();
  v143 = v5;
  v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_19;
    }
  }
  v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "_referenceBounds");
    }
    v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v140 = v7 ^ 1;
      v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FF00;
      goto LABEL_67;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_19:
  v11 = __sb__runningInSpringBoard();
  v140 = v9;
  v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = 0;
      v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_28;
    }
  }
  v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_referenceBounds");
    }
    v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v138 = v7 ^ 1;
      v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v125 = 0;
      v124 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FEF0;
      goto LABEL_67;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_28:
  v14 = __sb__runningInSpringBoard();
  v138 = v12;
  v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v15 = 0;
      v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v117, "userInterfaceIdiom") != 1)
    {
      v15 = 0;
      v2 = 1;
      goto LABEL_37;
    }
  }
  v2 = v14 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "_referenceBounds");
  }
  v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v136 = v7 ^ 1;
    v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v135 = 0uLL;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v142 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FEF8;
    goto LABEL_67;
  }
LABEL_37:
  v17 = __sb__runningInSpringBoard();
  v136 = v15;
  v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v142 = 0;
      v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "userInterfaceIdiom") != 1)
    {
      v142 = 0;
      v4 = 1;
      goto LABEL_47;
    }
  }
  v4 = v17 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "_referenceBounds");
  }
  v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(_QWORD *)&v135 = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FEE8;
    goto LABEL_67;
  }
LABEL_47:
  v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v115, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "_referenceBounds");
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FEE0;
    goto LABEL_67;
  }
LABEL_178:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_180;
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FED0;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v113, "userInterfaceIdiom") == 1)
    goto LABEL_186;
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(_QWORD *)v134 = 0;
    goto LABEL_194;
  }
  v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_184;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_QWORD *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "_referenceBounds");
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FEB0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "_referenceBounds");
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_208;
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FEB8;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(_QWORD *)&v133[28] = 0;
    goto LABEL_222;
  }
  v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_212;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "_referenceBounds");
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FEC0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "_referenceBounds");
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_236;
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FEC8;
    goto LABEL_67;
  }
LABEL_236:
  v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v105, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_referenceBounds");
    }
    v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FEA0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v102, "userInterfaceIdiom"))
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_referenceBounds");
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_266;
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v133[4] = 0;
    *(_QWORD *)&v132[4] = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FEA8;
    goto LABEL_67;
  }
LABEL_266:
  v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "_referenceBounds");
    }
    v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v132[4] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FE70;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v98, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "_referenceBounds");
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_295;
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE78;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    v130 = 0;
    goto LABEL_306;
  }
  v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_299;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v93, "userInterfaceIdiom"))
    {
      v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "_referenceBounds");
    }
    v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FE60;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "_referenceBounds");
    }
    v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_320;
  }
  else
  {
    v7 = 0;
  }
LABEL_316:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v131) = v7;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE68;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    v128 = 0;
    goto LABEL_334;
  }
  v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_324;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "userInterfaceIdiom"))
    {
      v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "_referenceBounds");
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v129 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FE90;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v92, "userInterfaceIdiom"))
    {
      HIDWORD(v127) = 0;
      v129 = 1;
      goto LABEL_344;
    }
  }
  v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_referenceBounds");
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_348;
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v127) = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE98;
    goto LABEL_67;
  }
LABEL_348:
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "userInterfaceIdiom"))
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_referenceBounds");
    }
    v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v125 = 0;
      v126 = 0;
      LODWORD(v124) = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FE80;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v86, "userInterfaceIdiom"))
    {
      v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "_referenceBounds");
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_378;
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v125 = 0;
    LODWORD(v124) = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE88;
    goto LABEL_67;
  }
LABEL_378:
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "userInterfaceIdiom"))
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "_referenceBounds");
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v123 = 0;
      LODWORD(v125) = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FE50;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "_referenceBounds");
    }
    v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_405;
  }
  else
  {
    v7 = 0;
  }
LABEL_398:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE58;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE30;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE38;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE20;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE28;
    goto LABEL_67;
  }
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "userInterfaceIdiom"))
    {
      v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "_referenceBounds");
    }
    v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FE40;
      goto LABEL_67;
    }
  }
  else
  {
    v122 = 0;
  }
LABEL_425:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "userInterfaceIdiom"))
    {
      v19 = 0;
      v18 = 1;
      goto LABEL_435;
    }
  }
  v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_referenceBounds");
    }
    v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048FE48;
      goto LABEL_67;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_435:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v20 = 0;
      v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v7, "userInterfaceIdiom"))
    {
      v21 = 0;
      v20 = 1;
      goto LABEL_445;
    }
  }
  v20 = v5 ^ 1;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048FE18;
    goto LABEL_67;
  }
LABEL_445:
  v4 = __sb__runningInSpringBoard();
  if ((_DWORD)v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v22 = 0;
      v23 = 0;
LABEL_462:
      v24 = &CSTimeLabelPortraitBaselineY;
      goto LABEL_67;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom"))
    {
      v23 = 0;
      v22 = 1;
      goto LABEL_462;
    }
  }
  v22 = v4 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "_referenceBounds");
  }
  v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_462;
  v24 = &qword_1D048FE10;
LABEL_67:
  v32 = *(double *)v24;
  if (v23)

  if (v22)
  if (v21)

  if (v20)
  if (v19)

  if (v18)
  if (v122)

  if ((_DWORD)v123)
  if ((_DWORD)v125)

  if (HIDWORD(v123))
  if ((_DWORD)v124)

  if (HIDWORD(v125))
  if ((_DWORD)v126)

  if (HIDWORD(v126))
  if (HIDWORD(v124))

  if ((_DWORD)v127)
  if (HIDWORD(v127))

  if (v129)
  if ((_DWORD)v128)

  if (HIDWORD(v128))
  if ((_DWORD)v131)

  if (HIDWORD(v131))
  if ((_DWORD)v130)

  if (HIDWORD(v130))
  if (*(_DWORD *)&v132[4])

  if (*(_DWORD *)&v132[8])
  if (*(_DWORD *)&v133[4])

  if (*(_DWORD *)&v133[8])
  if (*(_DWORD *)v132)

  if (*(_DWORD *)v133)
  if (*(_DWORD *)&v133[12])

  if (*(_DWORD *)&v133[20])
  if (*(_DWORD *)&v133[16])

  if (*(_DWORD *)&v133[24])
  if (*(_DWORD *)&v133[28])

  if (*(_DWORD *)&v133[32])
  if (*(_DWORD *)&v133[36])

  if (*(_DWORD *)&v134[8])
  if (*(_DWORD *)&v134[4])

  if (*(_DWORD *)v134)
  if ((_DWORD)v135)

  if (DWORD1(v135))
  if (DWORD2(v135))

  if (v142)
  {

    if (!HIDWORD(v135))
      goto LABEL_155;
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136)
      goto LABEL_156;
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137)
      goto LABEL_157;
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138)
      goto LABEL_158;
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139)
      goto LABEL_159;
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144)
      return v32;
    goto LABEL_173;
  }
LABEL_172:
  if (v144)
LABEL_173:

  return v32;
}

- (double)windowedAccessoryInset
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t *v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v34;
  int v35;
  double v36;
  int v37;
  double v38;
  double v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  int v45;
  int v46;
  double v47;
  double v48;
  int v49;
  int v50;
  int v51;
  int v52;
  double v53;
  int v54;
  double v55;
  double v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  int v62;
  int v63;
  int v64;
  double v65;
  double v66;
  int v67;
  double v68;
  double v69;
  double v70;
  int v71;
  double v72;
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
  int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[12];
  _BYTE v133[40];
  _BYTE v134[12];
  __int128 v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;

  v3 = __sb__runningInSpringBoard();
  v4 = (uint64_t)&CSWindowedAccessoryInset;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v120, "userInterfaceIdiom") != 1)
    {
      v5 = 0;
      v6 = 1;
      goto LABEL_10;
    }
  }
  v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "_referenceBounds");
    }
    v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v27 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v143 = v7 ^ 1;
      v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v140 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v141 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04902D8;
      goto LABEL_67;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_10:
  v8 = __sb__runningInSpringBoard();
  v143 = v5;
  v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_19;
    }
  }
  v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "_referenceBounds");
    }
    v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v140 = v7 ^ 1;
      v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490300;
      goto LABEL_67;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_19:
  v11 = __sb__runningInSpringBoard();
  v140 = v9;
  v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = 0;
      v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_28;
    }
  }
  v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_referenceBounds");
    }
    v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v138 = v7 ^ 1;
      v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v125 = 0;
      v124 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04902F0;
      goto LABEL_67;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_28:
  v14 = __sb__runningInSpringBoard();
  v138 = v12;
  v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v15 = 0;
      v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v117, "userInterfaceIdiom") != 1)
    {
      v15 = 0;
      v2 = 1;
      goto LABEL_37;
    }
  }
  v2 = v14 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "_referenceBounds");
  }
  v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v136 = v7 ^ 1;
    v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v135 = 0uLL;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v142 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04902F8;
    goto LABEL_67;
  }
LABEL_37:
  v17 = __sb__runningInSpringBoard();
  v136 = v15;
  v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v142 = 0;
      v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "userInterfaceIdiom") != 1)
    {
      v142 = 0;
      v4 = 1;
      goto LABEL_47;
    }
  }
  v4 = v17 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "_referenceBounds");
  }
  v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(_QWORD *)&v135 = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04902E8;
    goto LABEL_67;
  }
LABEL_47:
  v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v115, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "_referenceBounds");
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04902E0;
    goto LABEL_67;
  }
LABEL_178:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_180;
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04902D0;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v113, "userInterfaceIdiom") == 1)
    goto LABEL_186;
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(_QWORD *)v134 = 0;
    goto LABEL_194;
  }
  v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_184;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_QWORD *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "_referenceBounds");
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04902B0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "_referenceBounds");
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_208;
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04902B8;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(_QWORD *)&v133[28] = 0;
    goto LABEL_222;
  }
  v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_212;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "_referenceBounds");
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04902C0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "_referenceBounds");
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_236;
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04902C8;
    goto LABEL_67;
  }
LABEL_236:
  v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v105, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_referenceBounds");
    }
    v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04902A0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v102, "userInterfaceIdiom"))
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_referenceBounds");
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_266;
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v133[4] = 0;
    *(_QWORD *)&v132[4] = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04902A8;
    goto LABEL_67;
  }
LABEL_266:
  v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "_referenceBounds");
    }
    v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v132[4] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490270;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v98, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "_referenceBounds");
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_295;
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490278;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    v130 = 0;
    goto LABEL_306;
  }
  v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_299;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v93, "userInterfaceIdiom"))
    {
      v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "_referenceBounds");
    }
    v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490260;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "_referenceBounds");
    }
    v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_320;
  }
  else
  {
    v7 = 0;
  }
LABEL_316:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v131) = v7;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490268;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    v128 = 0;
    goto LABEL_334;
  }
  v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_324;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "userInterfaceIdiom"))
    {
      v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "_referenceBounds");
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v129 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490290;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v92, "userInterfaceIdiom"))
    {
      HIDWORD(v127) = 0;
      v129 = 1;
      goto LABEL_344;
    }
  }
  v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_referenceBounds");
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_348;
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v127) = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490298;
    goto LABEL_67;
  }
LABEL_348:
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "userInterfaceIdiom"))
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_referenceBounds");
    }
    v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v125 = 0;
      v126 = 0;
      LODWORD(v124) = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490280;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v86, "userInterfaceIdiom"))
    {
      v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "_referenceBounds");
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_378;
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v125 = 0;
    LODWORD(v124) = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490288;
    goto LABEL_67;
  }
LABEL_378:
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "userInterfaceIdiom"))
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "_referenceBounds");
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v123 = 0;
      LODWORD(v125) = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490250;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "_referenceBounds");
    }
    v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_405;
  }
  else
  {
    v7 = 0;
  }
LABEL_398:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490258;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490230;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490238;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490220;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490228;
    goto LABEL_67;
  }
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "userInterfaceIdiom"))
    {
      v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "_referenceBounds");
    }
    v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490240;
      goto LABEL_67;
    }
  }
  else
  {
    v122 = 0;
  }
LABEL_425:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "userInterfaceIdiom"))
    {
      v19 = 0;
      v18 = 1;
      goto LABEL_435;
    }
  }
  v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_referenceBounds");
    }
    v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490248;
      goto LABEL_67;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_435:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v20 = 0;
      v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v7, "userInterfaceIdiom"))
    {
      v21 = 0;
      v20 = 1;
      goto LABEL_445;
    }
  }
  v20 = v5 ^ 1;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490218;
    goto LABEL_67;
  }
LABEL_445:
  v4 = __sb__runningInSpringBoard();
  if ((_DWORD)v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v22 = 0;
      v23 = 0;
LABEL_462:
      v24 = &CSWindowedAccessoryInset;
      goto LABEL_67;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom"))
    {
      v23 = 0;
      v22 = 1;
      goto LABEL_462;
    }
  }
  v22 = v4 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "_referenceBounds");
  }
  v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_462;
  v24 = &qword_1D0490210;
LABEL_67:
  v32 = *(double *)v24;
  if (v23)

  if (v22)
  if (v21)

  if (v20)
  if (v19)

  if (v18)
  if (v122)

  if ((_DWORD)v123)
  if ((_DWORD)v125)

  if (HIDWORD(v123))
  if ((_DWORD)v124)

  if (HIDWORD(v125))
  if ((_DWORD)v126)

  if (HIDWORD(v126))
  if (HIDWORD(v124))

  if ((_DWORD)v127)
  if (HIDWORD(v127))

  if (v129)
  if ((_DWORD)v128)

  if (HIDWORD(v128))
  if ((_DWORD)v131)

  if (HIDWORD(v131))
  if ((_DWORD)v130)

  if (HIDWORD(v130))
  if (*(_DWORD *)&v132[4])

  if (*(_DWORD *)&v132[8])
  if (*(_DWORD *)&v133[4])

  if (*(_DWORD *)&v133[8])
  if (*(_DWORD *)v132)

  if (*(_DWORD *)v133)
  if (*(_DWORD *)&v133[12])

  if (*(_DWORD *)&v133[20])
  if (*(_DWORD *)&v133[16])

  if (*(_DWORD *)&v133[24])
  if (*(_DWORD *)&v133[28])

  if (*(_DWORD *)&v133[32])
  if (*(_DWORD *)&v133[36])

  if (*(_DWORD *)&v134[8])
  if (*(_DWORD *)&v134[4])

  if (*(_DWORD *)v134)
  if ((_DWORD)v135)

  if (DWORD1(v135))
  if (DWORD2(v135))

  if (v142)
  {

    if (!HIDWORD(v135))
      goto LABEL_155;
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136)
      goto LABEL_156;
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137)
      goto LABEL_157;
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138)
      goto LABEL_158;
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139)
      goto LABEL_159;
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144)
      return v32;
    goto LABEL_173;
  }
LABEL_172:
  if (v144)
LABEL_173:

  return v32;
}

- (double)bottomContentInset
{
  return 66.0;
}

- (double)prominentBaselineToListY
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t *v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v34;
  int v35;
  double v36;
  int v37;
  double v38;
  double v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  int v45;
  int v46;
  double v47;
  double v48;
  int v49;
  int v50;
  int v51;
  int v52;
  double v53;
  int v54;
  double v55;
  double v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  int v62;
  int v63;
  int v64;
  double v65;
  double v66;
  int v67;
  double v68;
  double v69;
  double v70;
  int v71;
  double v72;
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
  int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[12];
  _BYTE v133[40];
  _BYTE v134[12];
  __int128 v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;

  v3 = __sb__runningInSpringBoard();
  v4 = (uint64_t)&CSProminentBaselineToListY;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v120, "userInterfaceIdiom") != 1)
    {
      v5 = 0;
      v6 = 1;
      goto LABEL_10;
    }
  }
  v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "_referenceBounds");
    }
    v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v27 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v143 = v7 ^ 1;
      v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v140 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v141 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04900D8;
      goto LABEL_67;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_10:
  v8 = __sb__runningInSpringBoard();
  v143 = v5;
  v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_19;
    }
  }
  v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "_referenceBounds");
    }
    v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v140 = v7 ^ 1;
      v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490100;
      goto LABEL_67;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_19:
  v11 = __sb__runningInSpringBoard();
  v140 = v9;
  v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = 0;
      v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_28;
    }
  }
  v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_referenceBounds");
    }
    v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v138 = v7 ^ 1;
      v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v125 = 0;
      v124 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04900F0;
      goto LABEL_67;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_28:
  v14 = __sb__runningInSpringBoard();
  v138 = v12;
  v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v15 = 0;
      v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v117, "userInterfaceIdiom") != 1)
    {
      v15 = 0;
      v2 = 1;
      goto LABEL_37;
    }
  }
  v2 = v14 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "_referenceBounds");
  }
  v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v136 = v7 ^ 1;
    v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v135 = 0uLL;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v142 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04900F8;
    goto LABEL_67;
  }
LABEL_37:
  v17 = __sb__runningInSpringBoard();
  v136 = v15;
  v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v142 = 0;
      v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "userInterfaceIdiom") != 1)
    {
      v142 = 0;
      v4 = 1;
      goto LABEL_47;
    }
  }
  v4 = v17 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "_referenceBounds");
  }
  v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(_QWORD *)&v135 = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04900E8;
    goto LABEL_67;
  }
LABEL_47:
  v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v115, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "_referenceBounds");
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04900E0;
    goto LABEL_67;
  }
LABEL_178:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_180;
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04900D0;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v113, "userInterfaceIdiom") == 1)
    goto LABEL_186;
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(_QWORD *)v134 = 0;
    goto LABEL_194;
  }
  v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_184;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_QWORD *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "_referenceBounds");
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04900B0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "_referenceBounds");
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_208;
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04900B8;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(_QWORD *)&v133[28] = 0;
    goto LABEL_222;
  }
  v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_212;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "_referenceBounds");
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04900C0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "_referenceBounds");
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_236;
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04900C8;
    goto LABEL_67;
  }
LABEL_236:
  v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v105, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_referenceBounds");
    }
    v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D04900A0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v102, "userInterfaceIdiom"))
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_referenceBounds");
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_266;
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v133[4] = 0;
    *(_QWORD *)&v132[4] = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D04900A8;
    goto LABEL_67;
  }
LABEL_266:
  v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "_referenceBounds");
    }
    v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v132[4] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490070;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v98, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "_referenceBounds");
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_295;
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490078;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    v130 = 0;
    goto LABEL_306;
  }
  v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_299;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v93, "userInterfaceIdiom"))
    {
      v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "_referenceBounds");
    }
    v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490060;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "_referenceBounds");
    }
    v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_320;
  }
  else
  {
    v7 = 0;
  }
LABEL_316:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v131) = v7;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490068;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    v128 = 0;
    goto LABEL_334;
  }
  v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_324;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "userInterfaceIdiom"))
    {
      v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "_referenceBounds");
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v129 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490090;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v92, "userInterfaceIdiom"))
    {
      HIDWORD(v127) = 0;
      v129 = 1;
      goto LABEL_344;
    }
  }
  v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_referenceBounds");
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_348;
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v127) = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490098;
    goto LABEL_67;
  }
LABEL_348:
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "userInterfaceIdiom"))
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_referenceBounds");
    }
    v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v125 = 0;
      v126 = 0;
      LODWORD(v124) = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490080;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v86, "userInterfaceIdiom"))
    {
      v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "_referenceBounds");
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_378;
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v125 = 0;
    LODWORD(v124) = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490088;
    goto LABEL_67;
  }
LABEL_378:
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "userInterfaceIdiom"))
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "_referenceBounds");
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v123 = 0;
      LODWORD(v125) = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490050;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "_referenceBounds");
    }
    v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_405;
  }
  else
  {
    v7 = 0;
  }
LABEL_398:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490058;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490030;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490038;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490020;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490028;
    goto LABEL_67;
  }
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "userInterfaceIdiom"))
    {
      v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "_referenceBounds");
    }
    v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490040;
      goto LABEL_67;
    }
  }
  else
  {
    v122 = 0;
  }
LABEL_425:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "userInterfaceIdiom"))
    {
      v19 = 0;
      v18 = 1;
      goto LABEL_435;
    }
  }
  v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_referenceBounds");
    }
    v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D0490048;
      goto LABEL_67;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_435:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v20 = 0;
      v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v7, "userInterfaceIdiom"))
    {
      v21 = 0;
      v20 = 1;
      goto LABEL_445;
    }
  }
  v20 = v5 ^ 1;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D0490018;
    goto LABEL_67;
  }
LABEL_445:
  v4 = __sb__runningInSpringBoard();
  if ((_DWORD)v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v22 = 0;
      v23 = 0;
LABEL_462:
      v24 = &CSProminentBaselineToListY;
      goto LABEL_67;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom"))
    {
      v23 = 0;
      v22 = 1;
      goto LABEL_462;
    }
  }
  v22 = v4 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "_referenceBounds");
  }
  v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_462;
  v24 = &qword_1D0490010;
LABEL_67:
  v32 = *(double *)v24;
  if (v23)

  if (v22)
  if (v21)

  if (v20)
  if (v19)

  if (v18)
  if (v122)

  if ((_DWORD)v123)
  if ((_DWORD)v125)

  if (HIDWORD(v123))
  if ((_DWORD)v124)

  if (HIDWORD(v125))
  if ((_DWORD)v126)

  if (HIDWORD(v126))
  if (HIDWORD(v124))

  if ((_DWORD)v127)
  if (HIDWORD(v127))

  if (v129)
  if ((_DWORD)v128)

  if (HIDWORD(v128))
  if ((_DWORD)v131)

  if (HIDWORD(v131))
  if ((_DWORD)v130)

  if (HIDWORD(v130))
  if (*(_DWORD *)&v132[4])

  if (*(_DWORD *)&v132[8])
  if (*(_DWORD *)&v133[4])

  if (*(_DWORD *)&v133[8])
  if (*(_DWORD *)v132)

  if (*(_DWORD *)v133)
  if (*(_DWORD *)&v133[12])

  if (*(_DWORD *)&v133[20])
  if (*(_DWORD *)&v133[16])

  if (*(_DWORD *)&v133[24])
  if (*(_DWORD *)&v133[28])

  if (*(_DWORD *)&v133[32])
  if (*(_DWORD *)&v133[36])

  if (*(_DWORD *)&v134[8])
  if (*(_DWORD *)&v134[4])

  if (*(_DWORD *)v134)
  if ((_DWORD)v135)

  if (DWORD1(v135))
  if (DWORD2(v135))

  if (v142)
  {

    if (!HIDWORD(v135))
      goto LABEL_155;
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136)
      goto LABEL_156;
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137)
      goto LABEL_157;
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138)
      goto LABEL_158;
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139)
      goto LABEL_159;
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144)
      return v32;
    goto LABEL_173;
  }
LABEL_172:
  if (v144)
LABEL_173:

  return v32;
}

- (double)dateBaselineToComplicationY
{
  return 0.0;
}

- (double)complicationContainerHeight
{
  return 0.0;
}

- (double)listMinY
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[CSMagSafeAccessoryConfiguration timeLabelBaselineY](self, "timeLabelBaselineY");
  v4 = v3;
  -[CSMagSafeAccessoryConfiguration timeToSubtitleLabelBaselineDifferenceY](self, "timeToSubtitleLabelBaselineDifferenceY");
  v6 = v4 + v5;
  -[CSMagSafeAccessoryConfiguration prominentBaselineToListY](self, "prominentBaselineToListY");
  return v6 + v7;
}

- (double)timeLabelOffsetForScrollPercent:(double)a3
{
  return 0.0;
}

- (double)timeToSubtitleLabelBaselineDifferenceY
{
  return 37.0;
}

- (BOOL)containsCenteredDateTimeLayout
{
  return 1;
}

- (double)dateTimeMostExtremeLeadingX
{
  void *v2;
  double MidX;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  MidX = CGRectGetMidX(v5);

  return MidX;
}

- (double)dateTimeMostExtremeTrailingX
{
  void *v2;
  double MidX;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  MidX = CGRectGetMidX(v5);

  return MidX;
}

- (double)dateTimeSubtitleMaximumWidth
{
  return 0.0;
}

- (CSMagSafeRingConfiguration)ring
{
  return self->_ring;
}

- (void)setRing:(id)a3
{
  self->_ring = (CSMagSafeRingConfiguration *)a3;
}

- (CSMagSafeRingConfiguration)auxiliaryRing
{
  return self->_auxiliaryRing;
}

- (void)setAuxiliaryRing:(id)a3
{
  self->_auxiliaryRing = (CSMagSafeRingConfiguration *)a3;
}

- (BOOL)staticViewNeeded
{
  return self->_staticViewNeeded;
}

- (void)setStaticViewNeeded:(BOOL)a3
{
  self->_staticViewNeeded = a3;
}

- (double)staticViewRingDiameter
{
  return self->_staticViewRingDiameter;
}

- (void)setStaticViewRingDiameter:(double)a3
{
  self->_staticViewRingDiameter = a3;
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void)setLayoutStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStrategy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
}

@end
