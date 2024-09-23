@implementation ACHAchievement

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  int v69;
  int v70;
  int v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  int v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  int64_t v109;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ACHAchievement template](self, "template");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "template");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_10;
    -[ACHAchievement section](self, "section");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "section");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_10;
    }
    -[ACHAchievement progress](self, "progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_value");
    objc_msgSend(v5, "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_value");
    v16 = HKCompareDoubles();

    if (v16)
      goto LABEL_10;
    -[ACHAchievement goal](self, "goal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_value");
    objc_msgSend(v5, "goal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_value");
    v19 = HKCompareDoubles();

    if (v19)
      goto LABEL_10;
    -[ACHAchievement earnedInstances](self, "earnedInstances");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "earnedInstances");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqual:", v22))
    {

    }
    else
    {
      -[ACHAchievement relevantEarnedInstance](self, "relevantEarnedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "relevantEarnedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v23, "isEqual:", v24))
      {

        v13 = 0;
        goto LABEL_22;
      }
      v25 = -[ACHAchievement earnedInstanceCount](self, "earnedInstanceCount");
      v26 = objc_msgSend(v5, "earnedInstanceCount");

      if (v25 != v26)
        goto LABEL_10;
    }
    v27 = -[ACHAchievement prerequisiteMet](self, "prerequisiteMet");
    if (v27 == objc_msgSend(v5, "prerequisiteMet"))
    {
      -[ACHAchievement localizationBundleURLString](self, "localizationBundleURLString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizationBundleURLString");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v28 == (void *)v29)
      {

      }
      else
      {
        v30 = (void *)v29;
        v31 = objc_msgSend(v28, "isEqualToString:", v29);

        if (!v31)
          goto LABEL_10;
      }
      -[ACHAchievement resourceBundleURLString](self, "resourceBundleURLString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resourceBundleURLString");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        v35 = objc_msgSend(v32, "isEqualToString:", v33);

        if (!v35)
          goto LABEL_10;
      }
      -[ACHAchievement propertyListBundleURLString](self, "propertyListBundleURLString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "propertyListBundleURLString");
      v37 = objc_claimAutoreleasedReturnValue();
      if (v36 == (void *)v37)
      {

      }
      else
      {
        v38 = (void *)v37;
        v39 = objc_msgSend(v36, "isEqualToString:", v37);

        if (!v39)
          goto LABEL_10;
      }
      -[ACHAchievement stickerBundleURLString](self, "stickerBundleURLString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stickerBundleURLString");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40 == (void *)v41)
      {

      }
      else
      {
        v42 = (void *)v41;
        v43 = objc_msgSend(v40, "isEqualToString:", v41);

        if (!v43)
          goto LABEL_10;
      }
      -[ACHAchievement textureFilenames](self, "textureFilenames");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textureFilenames");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v44 == (void *)v45)
      {

      }
      else
      {
        v46 = (void *)v45;
        v47 = objc_msgSend(v44, "isEqual:", v45);

        if (!v47)
          goto LABEL_10;
      }
      -[ACHAchievement badgeModelFilenames](self, "badgeModelFilenames");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "badgeModelFilenames");
      v49 = objc_claimAutoreleasedReturnValue();
      if (v48 == (void *)v49)
      {

      }
      else
      {
        v50 = (void *)v49;
        v51 = objc_msgSend(v48, "isEqual:", v49);

        if (!v51)
          goto LABEL_10;
      }
      -[ACHAchievement glyphTextureFilename](self, "glyphTextureFilename");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "glyphTextureFilename");
      v53 = objc_claimAutoreleasedReturnValue();
      if (v52 == (void *)v53)
      {

      }
      else
      {
        v54 = (void *)v53;
        v55 = objc_msgSend(v52, "isEqual:", v53);

        if (!v55)
          goto LABEL_10;
      }
      -[ACHAchievement glyphPositionOffsetX](self, "glyphPositionOffsetX");
      objc_msgSend(v5, "glyphPositionOffsetX");
      if (HKCompareDoubles())
        goto LABEL_10;
      -[ACHAchievement glyphPositionOffsetY](self, "glyphPositionOffsetY");
      objc_msgSend(v5, "glyphPositionOffsetY");
      if (HKCompareDoubles())
        goto LABEL_10;
      -[ACHAchievement glyphTextureScale](self, "glyphTextureScale");
      objc_msgSend(v5, "glyphTextureScale");
      if (HKCompareDoubles())
        goto LABEL_10;
      -[ACHAchievement badgeShapeName](self, "badgeShapeName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "badgeShapeName");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v56 == (void *)v57)
      {

        goto LABEL_55;
      }
      v58 = (void *)v57;
      v59 = objc_msgSend(v56, "isEqual:", v57);

      if (v59)
      {
LABEL_55:
        -[ACHAchievement badgeMetalColor](self, "badgeMetalColor");
        v61 = v60;
        v63 = v62;
        v65 = v64;
        objc_msgSend(v5, "badgeMetalColor");
        if (!ACHAchievementColorsAreEqual(v61, v63, v65, v66, v67, v68))
          goto LABEL_10;
        v69 = -[ACHAchievement badgeUsesFullColorEnamel](self, "badgeUsesFullColorEnamel");
        if (v69 != objc_msgSend(v5, "badgeUsesFullColorEnamel"))
          goto LABEL_10;
        v70 = -[ACHAchievement unearnedUsesTwoToneEnamel](self, "unearnedUsesTwoToneEnamel");
        if (v70 != objc_msgSend(v5, "unearnedUsesTwoToneEnamel"))
          goto LABEL_10;
        v71 = -[ACHAchievement faceHasMetalInlay](self, "faceHasMetalInlay");
        if (v71 != objc_msgSend(v5, "faceHasMetalInlay"))
          goto LABEL_10;
        -[ACHAchievement badgeEnamelColor](self, "badgeEnamelColor");
        v73 = v72;
        v75 = v74;
        v77 = v76;
        objc_msgSend(v5, "badgeEnamelColor");
        if (!ACHAchievementColorsAreEqual(v73, v75, v77, v78, v79, v80))
          goto LABEL_10;
        v81 = -[ACHAchievement badgeUsesTriColorEnamel](self, "badgeUsesTriColorEnamel");
        if (v81 != objc_msgSend(v5, "badgeUsesTriColorEnamel"))
          goto LABEL_10;
        -[ACHAchievement enamelTriColor1](self, "enamelTriColor1");
        v83 = v82;
        v85 = v84;
        v87 = v86;
        objc_msgSend(v5, "enamelTriColor1");
        if (!ACHAchievementColorsAreEqual(v83, v85, v87, v88, v89, v90))
          goto LABEL_10;
        -[ACHAchievement enamelTriColor2](self, "enamelTriColor2");
        v92 = v91;
        v94 = v93;
        v96 = v95;
        objc_msgSend(v5, "enamelTriColor2");
        if (!ACHAchievementColorsAreEqual(v92, v94, v96, v97, v98, v99))
          goto LABEL_10;
        -[ACHAchievement enamelTriColor3](self, "enamelTriColor3");
        v101 = v100;
        v103 = v102;
        v105 = v104;
        objc_msgSend(v5, "enamelTriColor3");
        if (!ACHAchievementColorsAreEqual(v101, v103, v105, v106, v107, v108))
          goto LABEL_10;
        v109 = -[ACHAchievement badgeModelVersion](self, "badgeModelVersion");
        if (v109 != objc_msgSend(v5, "badgeModelVersion"))
          goto LABEL_10;
        -[ACHAchievement customPlaceholderValues](self, "customPlaceholderValues");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "customPlaceholderValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 == v22)
          v13 = 1;
        else
          v13 = objc_msgSend(v21, "isEqual:", v22);
LABEL_22:

        goto LABEL_11;
      }
    }
LABEL_10:
    v13 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (ACHTemplate)template
{
  return (ACHTemplate *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ACHAchievement template](self, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "key");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[ACHAchievement relevantEarnedInstance](self, "relevantEarnedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[ACHAchievement earnedInstanceCount](self, "earnedInstanceCount");
  }
  else
  {
    -[ACHAchievement earnedInstances](self, "earnedInstances");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count");

  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)ACHAchievement;
  -[ACHAchievement description](&v13, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement template](self, "template");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: %@, %@ earned instances"), v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)shallowCopyWithRelevantEarnedInstance:(id)a3
{
  id v4;
  ACHAchievement *v5;
  void *v6;
  ACHAchievement *v7;
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
  void *v19;
  void *v20;

  v4 = a3;
  v5 = [ACHAchievement alloc];
  -[ACHAchievement template](self, "template");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACHAchievement initWithTemplate:relevantEarnedInstance:earnedInstanceCount:](v5, "initWithTemplate:relevantEarnedInstance:earnedInstanceCount:", v6, v4, -[ACHAchievement earnedInstanceCount](self, "earnedInstanceCount"));

  -[ACHAchievement localizationBundleURLString](self, "localizationBundleURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setLocalizationBundleURLString:](v7, "setLocalizationBundleURLString:", v8);

  -[ACHAchievement resourceBundleURLString](self, "resourceBundleURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setResourceBundleURLString:](v7, "setResourceBundleURLString:", v9);

  -[ACHAchievement resourceBundleURLString](self, "resourceBundleURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setResourceBundleURLString:](v7, "setResourceBundleURLString:", v10);

  -[ACHAchievement propertyListBundleURLString](self, "propertyListBundleURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setPropertyListBundleURLString:](v7, "setPropertyListBundleURLString:", v11);

  -[ACHAchievement stickerBundleURL](self, "stickerBundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setStickerBundleURL:](v7, "setStickerBundleURL:", v12);

  -[ACHAchievement textureFilenames](self, "textureFilenames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setTextureFilenames:](v7, "setTextureFilenames:", v13);

  -[ACHAchievement glyphTextureFilename](self, "glyphTextureFilename");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setGlyphTextureFilename:](v7, "setGlyphTextureFilename:", v14);

  -[ACHAchievement glyphPositionOffsetX](self, "glyphPositionOffsetX");
  -[ACHAchievement setGlyphPositionOffsetX:](v7, "setGlyphPositionOffsetX:");
  -[ACHAchievement glyphPositionOffsetY](self, "glyphPositionOffsetY");
  -[ACHAchievement setGlyphPositionOffsetY:](v7, "setGlyphPositionOffsetY:");
  -[ACHAchievement badgeModelFilenames](self, "badgeModelFilenames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setBadgeModelFilenames:](v7, "setBadgeModelFilenames:", v15);

  -[ACHAchievement glyphTextureScale](self, "glyphTextureScale");
  -[ACHAchievement setGlyphTextureScale:](v7, "setGlyphTextureScale:");
  -[ACHAchievement badgeShapeName](self, "badgeShapeName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setBadgeShapeName:](v7, "setBadgeShapeName:", v16);

  -[ACHAchievement setBadgeUsesFullColorEnamel:](v7, "setBadgeUsesFullColorEnamel:", -[ACHAchievement badgeUsesFullColorEnamel](self, "badgeUsesFullColorEnamel"));
  -[ACHAchievement setUnearnedUsesTwoToneEnamel:](v7, "setUnearnedUsesTwoToneEnamel:", -[ACHAchievement unearnedUsesTwoToneEnamel](self, "unearnedUsesTwoToneEnamel"));
  -[ACHAchievement setFaceHasMetalInlay:](v7, "setFaceHasMetalInlay:", -[ACHAchievement faceHasMetalInlay](self, "faceHasMetalInlay"));
  -[ACHAchievement badgeEnamelColor](self, "badgeEnamelColor");
  -[ACHAchievement setBadgeEnamelColor:](v7, "setBadgeEnamelColor:");
  -[ACHAchievement badgeMetalColor](self, "badgeMetalColor");
  -[ACHAchievement setBadgeMetalColor:](v7, "setBadgeMetalColor:");
  -[ACHAchievement setBadgeUsesTriColorEnamel:](v7, "setBadgeUsesTriColorEnamel:", -[ACHAchievement badgeUsesTriColorEnamel](self, "badgeUsesTriColorEnamel"));
  -[ACHAchievement enamelTriColor1](self, "enamelTriColor1");
  -[ACHAchievement setEnamelTriColor1:](v7, "setEnamelTriColor1:");
  -[ACHAchievement enamelTriColor2](self, "enamelTriColor2");
  -[ACHAchievement setEnamelTriColor2:](v7, "setEnamelTriColor2:");
  -[ACHAchievement enamelTriColor3](self, "enamelTriColor3");
  -[ACHAchievement setEnamelTriColor3:](v7, "setEnamelTriColor3:");
  -[ACHAchievement progress](self, "progress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setProgress:](v7, "setProgress:", v17);

  -[ACHAchievement goal](self, "goal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setGoal:](v7, "setGoal:", v18);

  -[ACHAchievement customPlaceholderValues](self, "customPlaceholderValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setCustomPlaceholderValues:](v7, "setCustomPlaceholderValues:", v19);

  -[ACHAchievement section](self, "section");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setSection:](v7, "setSection:", v20);

  -[ACHAchievement setBadgeModelVersion:](v7, "setBadgeModelVersion:", -[ACHAchievement badgeModelVersion](self, "badgeModelVersion"));
  -[ACHAchievement setPrerequisiteMet:](v7, "setPrerequisiteMet:", -[ACHAchievement prerequisiteMet](self, "prerequisiteMet"));
  return v7;
}

- (BOOL)hasClientRequiredURLs
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[ACHAchievement localizationBundleURL](self, "localizationBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ACHAchievement resourceBundleURL](self, "resourceBundleURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ACHAchievement propertyListBundleURL](self, "propertyListBundleURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ACHAchievement)initWithCodable:(id)a3
{
  id v4;
  ACHTemplate *v5;
  void *v6;
  ACHTemplate *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  ACHEarnedInstance *v14;
  void *v15;
  ACHAchievement *v16;
  ACHEarnedInstance *v17;
  void *v18;
  ACHEarnedInstance *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v62;
  ACHTemplate *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [ACHTemplate alloc];
  objc_msgSend(v4, "achievementTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACHTemplate initWithCodable:](v5, "initWithCodable:", v6);

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v4, "earnedInstances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v70 != v12)
          objc_enumerationMutation(v9);
        v14 = -[ACHEarnedInstance initWithCodable:]([ACHEarnedInstance alloc], "initWithCodable:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  v16 = -[ACHAchievement initWithTemplate:earnedInstances:](self, "initWithTemplate:earnedInstances:", v7, v15);

  if (objc_msgSend(v4, "hasRelevantEarnedInstance"))
  {
    v17 = [ACHEarnedInstance alloc];
    objc_msgSend(v4, "relevantEarnedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ACHEarnedInstance initWithCodable:](v17, "initWithCodable:", v18);
    -[ACHAchievement setRelevantEarnedInstance:](v16, "setRelevantEarnedInstance:", v19);

  }
  if (objc_msgSend(v4, "hasEarnedInstanceCount"))
    v20 = objc_msgSend(v4, "earnedInstanceCount");
  else
    v20 = objc_msgSend(v8, "count");
  -[ACHAchievement setEarnedInstanceCount:](v16, "setEarnedInstanceCount:", v20);
  if (objc_msgSend(v4, "hasResourceBundleURL"))
  {
    objc_msgSend(v4, "resourceBundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievement setResourceBundleURLString:](v16, "setResourceBundleURLString:", v21);

  }
  if (objc_msgSend(v4, "hasPropertyListBundleURL"))
  {
    objc_msgSend(v4, "propertyListBundleURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievement setPropertyListBundleURLString:](v16, "setPropertyListBundleURLString:", v22);

  }
  if (objc_msgSend(v4, "hasLocalizationBundleURL"))
  {
    objc_msgSend(v4, "localizationBundleURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievement setLocalizationBundleURLString:](v16, "setLocalizationBundleURLString:", v23);

  }
  if (objc_msgSend(v4, "hasStickerBundleURL"))
  {
    objc_msgSend(v4, "stickerBundleURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievement setStickerBundleURLString:](v16, "setStickerBundleURLString:", v24);

  }
  objc_msgSend(v4, "textureFilenames");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setTextureFilenames:](v16, "setTextureFilenames:", v25);

  objc_msgSend(v4, "badgeModelFilenames");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setBadgeModelFilenames:](v16, "setBadgeModelFilenames:", v26);

  objc_msgSend(v4, "glyphTextureScale");
  -[ACHAchievement setGlyphTextureScale:](v16, "setGlyphTextureScale:");
  objc_msgSend(v4, "glyphTextureFilename");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setGlyphTextureFilename:](v16, "setGlyphTextureFilename:", v27);

  objc_msgSend(v4, "glyphPositionOffsetX");
  -[ACHAchievement setGlyphPositionOffsetX:](v16, "setGlyphPositionOffsetX:");
  objc_msgSend(v4, "glyphPositionOffsetY");
  -[ACHAchievement setGlyphPositionOffsetY:](v16, "setGlyphPositionOffsetY:");
  objc_msgSend(v4, "badgeShapeName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setBadgeShapeName:](v16, "setBadgeShapeName:", v28);

  if (objc_msgSend(v4, "hasBadgeMetalColor"))
  {
    objc_msgSend(v4, "badgeMetalColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v30 = ACHAchievementColorFromACHCodableColor(v29);
    -[ACHAchievement setBadgeMetalColor:](v16, "setBadgeMetalColor:", v30);

  }
  -[ACHAchievement setBadgeUsesFullColorEnamel:](v16, "setBadgeUsesFullColorEnamel:", objc_msgSend(v4, "badgeUsesFullColorEnamel"));
  -[ACHAchievement setUnearnedUsesTwoToneEnamel:](v16, "setUnearnedUsesTwoToneEnamel:", objc_msgSend(v4, "unearnedUsesTwoToneEnamel"));
  -[ACHAchievement setFaceHasMetalInlay:](v16, "setFaceHasMetalInlay:", objc_msgSend(v4, "faceHasMetalInlay"));
  if (objc_msgSend(v4, "hasBadgeEnamelColor"))
  {
    objc_msgSend(v4, "badgeEnamelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v32 = ACHAchievementColorFromACHCodableColor(v31);
    -[ACHAchievement setBadgeEnamelColor:](v16, "setBadgeEnamelColor:", v32);

  }
  -[ACHAchievement setBadgeUsesTriColorEnamel:](v16, "setBadgeUsesTriColorEnamel:", objc_msgSend(v4, "badgeUsesTriColorEnamel"));
  if (objc_msgSend(v4, "badgeUsesTriColorEnamel"))
  {
    if (objc_msgSend(v4, "hasEnamelTriColor1"))
    {
      objc_msgSend(v4, "enamelTriColor1");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v34 = ACHAchievementColorFromACHCodableColor(v33);
      -[ACHAchievement setEnamelTriColor1:](v16, "setEnamelTriColor1:", v34);

    }
    if (objc_msgSend(v4, "hasEnamelTriColor2"))
    {
      objc_msgSend(v4, "enamelTriColor2");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v36 = ACHAchievementColorFromACHCodableColor(v35);
      -[ACHAchievement setEnamelTriColor2:](v16, "setEnamelTriColor2:", v36);

    }
    if (objc_msgSend(v4, "hasEnamelTriColor3"))
    {
      objc_msgSend(v4, "enamelTriColor3");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v38 = ACHAchievementColorFromACHCodableColor(v37);
      -[ACHAchievement setEnamelTriColor3:](v16, "setEnamelTriColor3:", v38);

    }
  }
  if (objc_msgSend(v4, "hasProgressValue") && objc_msgSend(v4, "hasProgressUnitString"))
  {
    v39 = (void *)MEMORY[0x24BDD3E50];
    v40 = (void *)MEMORY[0x24BDD4048];
    objc_msgSend(v4, "progressUnitString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "unitFromString:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "progressValue");
    objc_msgSend(v39, "quantityWithUnit:doubleValue:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievement setProgress:](v16, "setProgress:", v43);

  }
  if (objc_msgSend(v4, "hasGoalValue") && objc_msgSend(v4, "hasGoalUnitString"))
  {
    v44 = (void *)MEMORY[0x24BDD3E50];
    v45 = (void *)MEMORY[0x24BDD4048];
    objc_msgSend(v4, "goalUnitString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "unitFromString:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "goalValue");
    objc_msgSend(v44, "quantityWithUnit:doubleValue:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHAchievement setGoal:](v16, "setGoal:", v48);

  }
  if (objc_msgSend(v4, "customPlaceholderValuesCount"))
  {
    v62 = v8;
    v63 = v7;
    v64 = v4;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(v4, "customPlaceholderValues");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v66;
      v53 = (void *)MEMORY[0x24BDBD1B8];
      do
      {
        v54 = 0;
        v55 = v53;
        do
        {
          if (*(_QWORD *)v66 != v52)
            objc_enumerationMutation(v49);
          v56 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v54);
          objc_msgSend(v56, "placeholder");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v57;
          objc_msgSend(v56, "value");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v58;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "hk_dictionaryByAddingEntriesFromDictionary:", v59);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          ++v54;
          v55 = v53;
        }
        while (v51 != v54);
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (v51);
    }
    else
    {
      v53 = (void *)MEMORY[0x24BDBD1B8];
    }

    -[ACHAchievement setCustomPlaceholderValues:](v16, "setCustomPlaceholderValues:", v53);
    v7 = v63;
    v4 = v64;
    v8 = v62;
  }
  objc_msgSend(v4, "section");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setSection:](v16, "setSection:", v60);

  if (objc_msgSend(v4, "hasBadgeModelVersion"))
    -[ACHAchievement setBadgeModelVersion:](v16, "setBadgeModelVersion:", objc_msgSend(v4, "badgeModelVersion"));
  -[ACHAchievement setPrerequisiteMet:](v16, "setPrerequisiteMet:", objc_msgSend(v4, "prerequisiteMet"));

  return v16;
}

- (void)setResourceBundleURLString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  self->_unearnedUsesTwoToneEnamel = a3;
}

- (void)setTextureFilenames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setSection:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setPrerequisiteMet:(BOOL)a3
{
  self->_prerequisiteMet = a3;
}

- (void)setLocalizationBundleURLString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setGlyphTextureScale:(double)a3
{
  self->_glyphTextureScale = a3;
}

- (void)setGlyphTextureFilename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setGlyphPositionOffsetY:(double)a3
{
  self->_glyphPositionOffsetY = a3;
}

- (void)setGlyphPositionOffsetX:(double)a3
{
  self->_glyphPositionOffsetX = a3;
}

- (void)setFaceHasMetalInlay:(BOOL)a3
{
  self->_faceHasMetalInlay = a3;
}

- (void)setBadgeUsesTriColorEnamel:(BOOL)a3
{
  self->_badgeUsesTriColorEnamel = a3;
}

- (void)setBadgeUsesFullColorEnamel:(BOOL)a3
{
  self->_badgeUsesFullColorEnamel = a3;
}

- (void)setBadgeShapeName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setBadgeModelVersion:(int64_t)a3
{
  self->_badgeModelVersion = a3;
}

- (void)setBadgeModelFilenames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setBadgeMetalColor:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src;

  src = a3;
  objc_copyStruct(&self->_badgeMetalColor, &src, 12, 1, 0);
}

- (void)setBadgeEnamelColor:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src;

  src = a3;
  objc_copyStruct(&self->_badgeEnamelColor, &src, 12, 1, 0);
}

- (void)setPropertyListBundleURLString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void)setEarnedInstanceCount:(unint64_t)a3
{
  self->_earnedInstanceCount = a3;
}

- (ACHAchievement)initWithTemplate:(id)a3 earnedInstances:(id)a4
{
  id v7;
  id v8;
  ACHAchievement *v9;
  ACHAchievement *v10;
  uint64_t v11;
  NSArray *earnedInstances;
  NSArray *v13;
  _QWORD v15[4];
  NSArray *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ACHAchievement;
  v9 = -[ACHAchievement init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_template, a3);
    v10->_prerequisiteMet = 1;
    if (v8)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke;
      v15[3] = &unk_24D1272D0;
      v16 = (NSArray *)v7;
      objc_msgSend(v8, "hk_filter:", v15);
      v11 = objc_claimAutoreleasedReturnValue();
      earnedInstances = v10->_earnedInstances;
      v10->_earnedInstances = (NSArray *)v11;

      v13 = v16;
    }
    else
    {
      v13 = v10->_earnedInstances;
      v10->_earnedInstances = (NSArray *)MEMORY[0x24BDBD1A8];
    }

  }
  return v10;
}

- (NSString)section
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)earnedInstanceCount
{
  return self->_earnedInstanceCount;
}

- (BOOL)badgeUsesTriColorEnamel
{
  return self->_badgeUsesTriColorEnamel;
}

- (NSString)propertyListBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)localizationBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (HKQuantity)goal
{
  return (HKQuantity *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)unearned
{
  void *v3;
  BOOL v4;
  void *v5;

  -[ACHAchievement earnedInstances](self, "earnedInstances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[ACHAchievement relevantEarnedInstance](self, "relevantEarnedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (ACHEarnedInstance)relevantEarnedInstance
{
  return (ACHEarnedInstance *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)earnedInstances
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)prerequisiteMet
{
  return self->_prerequisiteMet;
}

- (HKQuantity)progress
{
  return (HKQuantity *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)badgeShapeName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)badgeModelFilenames
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)unearnedUsesTwoToneEnamel
{
  return self->_unearnedUsesTwoToneEnamel;
}

- (NSArray)textureFilenames
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (double)glyphTextureScale
{
  return self->_glyphTextureScale;
}

- (NSString)glyphTextureFilename
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (double)glyphPositionOffsetY
{
  return self->_glyphPositionOffsetY;
}

- (double)glyphPositionOffsetX
{
  return self->_glyphPositionOffsetX;
}

- (BOOL)faceHasMetalInlay
{
  return self->_faceHasMetalInlay;
}

- (BOOL)badgeUsesFullColorEnamel
{
  return self->_badgeUsesFullColorEnamel;
}

- (int64_t)badgeModelVersion
{
  return self->_badgeModelVersion;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)badgeMetalColor
{
  float v2;
  float v3;
  float v4;
  _DWORD dest[3];
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  objc_copyStruct(dest, &self->_badgeMetalColor, 12, 1, 0);
  v2 = *(float *)dest;
  v3 = *(float *)&dest[1];
  v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)badgeEnamelColor
{
  float v2;
  float v3;
  float v4;
  _DWORD dest[3];
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  objc_copyStruct(dest, &self->_badgeEnamelColor, 12, 1, 0);
  v2 = *(float *)dest;
  v3 = *(float *)&dest[1];
  v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)stickerBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSDictionary)customPlaceholderValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (NSURL)resourceBundleURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[ACHAchievement resourceBundleURLString](self, "resourceBundleURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSString)resourceBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSURL)propertyListBundleURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[ACHAchievement propertyListBundleURLString](self, "propertyListBundleURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSURL)localizationBundleURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[ACHAchievement localizationBundleURLString](self, "localizationBundleURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setGoal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor3
{
  float v2;
  float v3;
  float v4;
  _DWORD dest[3];
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  objc_copyStruct(dest, &self->_enamelTriColor3, 12, 1, 0);
  v2 = *(float *)dest;
  v3 = *(float *)&dest[1];
  v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor2
{
  float v2;
  float v3;
  float v4;
  _DWORD dest[3];
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  objc_copyStruct(dest, &self->_enamelTriColor2, 12, 1, 0);
  v2 = *(float *)dest;
  v3 = *(float *)&dest[1];
  v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor1
{
  float v2;
  float v3;
  float v4;
  _DWORD dest[3];
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  objc_copyStruct(dest, &self->_enamelTriColor1, 12, 1, 0);
  v2 = *(float *)dest;
  v3 = *(float *)&dest[1];
  v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSURL)stickerBundleURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[ACHAchievement stickerBundleURLString](self, "stickerBundleURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (void)setStickerBundleURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setStickerBundleURLString:](self, "setStickerBundleURLString:", v4);

}

- (void)setStickerBundleURLString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void)setEnamelTriColor3:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src;

  src = a3;
  objc_copyStruct(&self->_enamelTriColor3, &src, 12, 1, 0);
}

- (void)setEnamelTriColor2:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src;

  src = a3;
  objc_copyStruct(&self->_enamelTriColor2, &src, 12, 1, 0);
}

- (void)setEnamelTriColor1:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src;

  src = a3;
  objc_copyStruct(&self->_enamelTriColor1, &src, 12, 1, 0);
}

- (void)setCustomPlaceholderValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (ACHAchievement)initWithTemplate:(id)a3 relevantEarnedInstance:(id)a4 earnedInstanceCount:(unint64_t)a5
{
  id v9;
  id v10;
  ACHAchievement *v11;
  ACHAchievement *v12;
  void *v13;
  void *v14;
  char v15;
  ACHEarnedInstance *v16;
  NSObject *p_super;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ACHAchievement;
  v11 = -[ACHAchievement init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_template, a3);
    if (v10
      && (objc_msgSend(v10, "templateUniqueName"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "uniqueName"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v13, "isEqual:", v14),
          v14,
          v13,
          (v15 & 1) == 0))
    {
      ACHLogDefault();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[ACHAchievement initWithTemplate:relevantEarnedInstance:earnedInstanceCount:].cold.1(v9, p_super);
    }
    else
    {
      v16 = (ACHEarnedInstance *)v10;
      p_super = &v12->_relevantEarnedInstance->super;
      v12->_relevantEarnedInstance = v16;
    }

    v12->_earnedInstanceCount = a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBundleURLString, 0);
  objc_storeStrong((id *)&self->_propertyListBundleURLString, 0);
  objc_storeStrong((id *)&self->_resourceBundleURLString, 0);
  objc_storeStrong((id *)&self->_localizationBundleURLString, 0);
  objc_storeStrong((id *)&self->_customPlaceholderValues, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_badgeShapeName, 0);
  objc_storeStrong((id *)&self->_glyphTextureFilename, 0);
  objc_storeStrong((id *)&self->_textureFilenames, 0);
  objc_storeStrong((id *)&self->_badgeModelFilenames, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_earnedInstances, 0);
  objc_storeStrong((id *)&self->_relevantEarnedInstance, 0);
  objc_storeStrong((id *)&self->_template, 0);
}

uint64_t __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(v3, "templateUniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  objc_msgSend(v6, "uniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    ACHLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke_cold_1(v5, (uint64_t)v3, v9);

  }
  return v8;
}

- (id)shallowCopyReplacingEarnedInstances:(id)a3
{
  id v4;
  ACHAchievement *v5;
  void *v6;
  ACHAchievement *v7;
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
  void *v19;
  void *v20;

  v4 = a3;
  v5 = [ACHAchievement alloc];
  -[ACHAchievement template](self, "template");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACHAchievement initWithTemplate:earnedInstances:](v5, "initWithTemplate:earnedInstances:", v6, v4);

  -[ACHAchievement localizationBundleURLString](self, "localizationBundleURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setLocalizationBundleURLString:](v7, "setLocalizationBundleURLString:", v8);

  -[ACHAchievement resourceBundleURLString](self, "resourceBundleURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setResourceBundleURLString:](v7, "setResourceBundleURLString:", v9);

  -[ACHAchievement resourceBundleURLString](self, "resourceBundleURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setResourceBundleURLString:](v7, "setResourceBundleURLString:", v10);

  -[ACHAchievement propertyListBundleURLString](self, "propertyListBundleURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setPropertyListBundleURLString:](v7, "setPropertyListBundleURLString:", v11);

  -[ACHAchievement stickerBundleURL](self, "stickerBundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setStickerBundleURL:](v7, "setStickerBundleURL:", v12);

  -[ACHAchievement textureFilenames](self, "textureFilenames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setTextureFilenames:](v7, "setTextureFilenames:", v13);

  -[ACHAchievement glyphTextureFilename](self, "glyphTextureFilename");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setGlyphTextureFilename:](v7, "setGlyphTextureFilename:", v14);

  -[ACHAchievement glyphPositionOffsetX](self, "glyphPositionOffsetX");
  -[ACHAchievement setGlyphPositionOffsetX:](v7, "setGlyphPositionOffsetX:");
  -[ACHAchievement glyphPositionOffsetY](self, "glyphPositionOffsetY");
  -[ACHAchievement setGlyphPositionOffsetY:](v7, "setGlyphPositionOffsetY:");
  -[ACHAchievement badgeModelFilenames](self, "badgeModelFilenames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setBadgeModelFilenames:](v7, "setBadgeModelFilenames:", v15);

  -[ACHAchievement glyphTextureScale](self, "glyphTextureScale");
  -[ACHAchievement setGlyphTextureScale:](v7, "setGlyphTextureScale:");
  -[ACHAchievement badgeShapeName](self, "badgeShapeName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setBadgeShapeName:](v7, "setBadgeShapeName:", v16);

  -[ACHAchievement setBadgeUsesFullColorEnamel:](v7, "setBadgeUsesFullColorEnamel:", -[ACHAchievement badgeUsesFullColorEnamel](self, "badgeUsesFullColorEnamel"));
  -[ACHAchievement setUnearnedUsesTwoToneEnamel:](v7, "setUnearnedUsesTwoToneEnamel:", -[ACHAchievement unearnedUsesTwoToneEnamel](self, "unearnedUsesTwoToneEnamel"));
  -[ACHAchievement setFaceHasMetalInlay:](v7, "setFaceHasMetalInlay:", -[ACHAchievement faceHasMetalInlay](self, "faceHasMetalInlay"));
  -[ACHAchievement badgeEnamelColor](self, "badgeEnamelColor");
  -[ACHAchievement setBadgeEnamelColor:](v7, "setBadgeEnamelColor:");
  -[ACHAchievement badgeMetalColor](self, "badgeMetalColor");
  -[ACHAchievement setBadgeMetalColor:](v7, "setBadgeMetalColor:");
  -[ACHAchievement setBadgeUsesTriColorEnamel:](v7, "setBadgeUsesTriColorEnamel:", -[ACHAchievement badgeUsesTriColorEnamel](self, "badgeUsesTriColorEnamel"));
  -[ACHAchievement enamelTriColor1](self, "enamelTriColor1");
  -[ACHAchievement setEnamelTriColor1:](v7, "setEnamelTriColor1:");
  -[ACHAchievement enamelTriColor2](self, "enamelTriColor2");
  -[ACHAchievement setEnamelTriColor2:](v7, "setEnamelTriColor2:");
  -[ACHAchievement enamelTriColor3](self, "enamelTriColor3");
  -[ACHAchievement setEnamelTriColor3:](v7, "setEnamelTriColor3:");
  -[ACHAchievement progress](self, "progress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setProgress:](v7, "setProgress:", v17);

  -[ACHAchievement goal](self, "goal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setGoal:](v7, "setGoal:", v18);

  -[ACHAchievement customPlaceholderValues](self, "customPlaceholderValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setCustomPlaceholderValues:](v7, "setCustomPlaceholderValues:", v19);

  -[ACHAchievement section](self, "section");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setSection:](v7, "setSection:", v20);

  -[ACHAchievement setBadgeModelVersion:](v7, "setBadgeModelVersion:", -[ACHAchievement badgeModelVersion](self, "badgeModelVersion"));
  -[ACHAchievement setPrerequisiteMet:](v7, "setPrerequisiteMet:", -[ACHAchievement prerequisiteMet](self, "prerequisiteMet"));
  return v7;
}

- (BOOL)isRingsBased
{
  uint64_t v3;
  char v4;
  void *v5;

  -[ACHAchievement section](self, "section");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)v3, "isEqualToString:", CFSTR("ACTIVITY"));

  -[ACHAchievement template](self, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v3) = objc_msgSend(v5, "triggers");

  if ((v3 & 0x3FC) != 0)
    return 1;
  else
    return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHAchievement)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  ACHCodableAchievement *v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = -[ACHCodableAchievement initWithData:]([ACHCodableAchievement alloc], "initWithData:", v8);
    if (v9)
    {
      self = -[ACHAchievement initWithCodable:](self, "initWithCodable:", v9);

      v9 = (ACHCodableAchievement *)self;
    }
  }
  else
  {
    v9 = 0;
  }

  return (ACHAchievement *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v8 = a3;
  ACHCodableFromAchievement(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, v7);

  }
}

- (void)setLocalizationBundleURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setLocalizationBundleURLString:](self, "setLocalizationBundleURLString:", v4);

}

- (void)setResourceBundleURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setResourceBundleURLString:](self, "setResourceBundleURLString:", v4);

}

- (void)setPropertyListBundleURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHAchievement setPropertyListBundleURLString:](self, "setPropertyListBundleURLString:", v4);

}

- (void)setRelevantEarnedInstance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)initWithTemplate:(void *)a1 relevantEarnedInstance:(NSObject *)a2 earnedInstanceCount:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_214029000, a2, OS_LOG_TYPE_ERROR, "Earned instance isn't associated with this template %@", (uint8_t *)&v4, 0xCu);

}

void __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_214029000, a3, OS_LOG_TYPE_ERROR, "Earned instance not added to achievement for template %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
