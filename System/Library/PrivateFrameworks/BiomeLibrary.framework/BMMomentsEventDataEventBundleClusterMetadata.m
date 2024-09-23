@implementation BMMomentsEventDataEventBundleClusterMetadata

- (BMMomentsEventDataEventBundleClusterMetadata)initWithIsFiltered:(id)a3 isTopLevelActivityTypePhenotypeDetected:(id)a4 isSecondLevelActivityTypePhenotypeDetected:(id)a5 isWeekendPhenotypeDetected:(id)a6 isTimeTagPhenotypeDetected:(id)a7 isDayOfWeekPhenotypeDetected:(id)a8 isPlaceNamePhenotypeDetected:(id)a9 isCombinedPlacePhenotypeDetected:(id)a10 isEnclosingAreaNamePhenotypeDetected:(id)a11 isPersonsPhenotypeDetected:(id)a12 isPersonRelationshipPhenotypeDetected:(id)a13 isActivityTypeFromPhotoTraitsPhenotypeDetected:(id)a14 isTimeContextFromPhotoTraitsPhenotypeDetected:(id)a15 isLocationContextFromPhotoTraitsPhenotypeDetected:(id)a16 isSocialContextFromPhotoTraitsPhenotypeDetected:(id)a17 isExtraContextFromPhotoTraitsPhenotypeDetected:(id)a18 isOtherSubjectFromPhotoTraitsPhenotypeDetected:(id)a19
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BMMomentsEventDataEventBundleClusterMetadata *v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v43 = a3;
  v42 = a4;
  v41 = a5;
  v40 = a6;
  v39 = a7;
  v38 = a8;
  v37 = a9;
  v36 = a10;
  v35 = a11;
  v25 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v44.receiver = self;
  v44.super_class = (Class)BMMomentsEventDataEventBundleClusterMetadata;
  v33 = -[BMEventBase init](&v44, sel_init);
  if (v33)
  {
    v33->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v43)
    {
      v33->_hasIsFiltered = 1;
      v33->_isFiltered = objc_msgSend(v43, "BOOLValue");
    }
    else
    {
      v33->_hasIsFiltered = 0;
      v33->_isFiltered = 0;
    }
    if (v42)
    {
      v33->_hasIsTopLevelActivityTypePhenotypeDetected = 1;
      v33->_isTopLevelActivityTypePhenotypeDetected = objc_msgSend(v42, "BOOLValue");
    }
    else
    {
      v33->_hasIsTopLevelActivityTypePhenotypeDetected = 0;
      v33->_isTopLevelActivityTypePhenotypeDetected = 0;
    }
    if (v41)
    {
      v33->_hasIsSecondLevelActivityTypePhenotypeDetected = 1;
      v33->_isSecondLevelActivityTypePhenotypeDetected = objc_msgSend(v41, "BOOLValue");
    }
    else
    {
      v33->_hasIsSecondLevelActivityTypePhenotypeDetected = 0;
      v33->_isSecondLevelActivityTypePhenotypeDetected = 0;
    }
    if (v40)
    {
      v33->_hasIsWeekendPhenotypeDetected = 1;
      v33->_isWeekendPhenotypeDetected = objc_msgSend(v40, "BOOLValue");
    }
    else
    {
      v33->_hasIsWeekendPhenotypeDetected = 0;
      v33->_isWeekendPhenotypeDetected = 0;
    }
    if (v39)
    {
      v33->_hasIsTimeTagPhenotypeDetected = 1;
      v33->_isTimeTagPhenotypeDetected = objc_msgSend(v39, "BOOLValue");
    }
    else
    {
      v33->_hasIsTimeTagPhenotypeDetected = 0;
      v33->_isTimeTagPhenotypeDetected = 0;
    }
    if (v38)
    {
      v33->_hasIsDayOfWeekPhenotypeDetected = 1;
      v33->_isDayOfWeekPhenotypeDetected = objc_msgSend(v38, "BOOLValue");
    }
    else
    {
      v33->_hasIsDayOfWeekPhenotypeDetected = 0;
      v33->_isDayOfWeekPhenotypeDetected = 0;
    }
    if (v37)
    {
      v33->_hasIsPlaceNamePhenotypeDetected = 1;
      v33->_isPlaceNamePhenotypeDetected = objc_msgSend(v37, "BOOLValue");
    }
    else
    {
      v33->_hasIsPlaceNamePhenotypeDetected = 0;
      v33->_isPlaceNamePhenotypeDetected = 0;
    }
    if (v36)
    {
      v33->_hasIsCombinedPlacePhenotypeDetected = 1;
      v33->_isCombinedPlacePhenotypeDetected = objc_msgSend(v36, "BOOLValue");
    }
    else
    {
      v33->_hasIsCombinedPlacePhenotypeDetected = 0;
      v33->_isCombinedPlacePhenotypeDetected = 0;
    }
    if (v35)
    {
      v33->_hasIsEnclosingAreaNamePhenotypeDetected = 1;
      v33->_isEnclosingAreaNamePhenotypeDetected = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v33->_hasIsEnclosingAreaNamePhenotypeDetected = 0;
      v33->_isEnclosingAreaNamePhenotypeDetected = 0;
    }
    if (v25)
    {
      v33->_hasIsPersonsPhenotypeDetected = 1;
      v33->_isPersonsPhenotypeDetected = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v33->_hasIsPersonsPhenotypeDetected = 0;
      v33->_isPersonsPhenotypeDetected = 0;
    }
    if (v26)
    {
      v33->_hasIsPersonRelationshipPhenotypeDetected = 1;
      v33->_isPersonRelationshipPhenotypeDetected = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v33->_hasIsPersonRelationshipPhenotypeDetected = 0;
      v33->_isPersonRelationshipPhenotypeDetected = 0;
    }
    if (v27)
    {
      v33->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isActivityTypeFromPhotoTraitsPhenotypeDetected = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v33->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isActivityTypeFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v28)
    {
      v33->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isTimeContextFromPhotoTraitsPhenotypeDetected = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v33->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isTimeContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v29)
    {
      v33->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isLocationContextFromPhotoTraitsPhenotypeDetected = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v33->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isLocationContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v30)
    {
      v33->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isSocialContextFromPhotoTraitsPhenotypeDetected = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v33->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isSocialContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v31)
    {
      v33->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isExtraContextFromPhotoTraitsPhenotypeDetected = objc_msgSend(v31, "BOOLValue");
    }
    else
    {
      v33->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isExtraContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v32)
    {
      v33->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isOtherSubjectFromPhotoTraitsPhenotypeDetected = objc_msgSend(v32, "BOOLValue");
    }
    else
    {
      v33->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isOtherSubjectFromPhotoTraitsPhenotypeDetected = 0;
    }
  }

  return v33;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isFiltered](self, "isFiltered"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTopLevelActivityTypePhenotypeDetected](self, "isTopLevelActivityTypePhenotypeDetected"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSecondLevelActivityTypePhenotypeDetected](self, "isSecondLevelActivityTypePhenotypeDetected"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isWeekendPhenotypeDetected](self, "isWeekendPhenotypeDetected"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeTagPhenotypeDetected](self, "isTimeTagPhenotypeDetected"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isDayOfWeekPhenotypeDetected](self, "isDayOfWeekPhenotypeDetected"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPlaceNamePhenotypeDetected](self, "isPlaceNamePhenotypeDetected"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isCombinedPlacePhenotypeDetected](self, "isCombinedPlacePhenotypeDetected"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isEnclosingAreaNamePhenotypeDetected](self, "isEnclosingAreaNamePhenotypeDetected"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonsPhenotypeDetected](self, "isPersonsPhenotypeDetected"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonRelationshipPhenotypeDetected](self, "isPersonRelationshipPhenotypeDetected"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isActivityTypeFromPhotoTraitsPhenotypeDetected](self, "isActivityTypeFromPhotoTraitsPhenotypeDetected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeContextFromPhotoTraitsPhenotypeDetected](self, "isTimeContextFromPhotoTraitsPhenotypeDetected"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isLocationContextFromPhotoTraitsPhenotypeDetected](self, "isLocationContextFromPhotoTraitsPhenotypeDetected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSocialContextFromPhotoTraitsPhenotypeDetected](self, "isSocialContextFromPhotoTraitsPhenotypeDetected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isExtraContextFromPhotoTraitsPhenotypeDetected](self, "isExtraContextFromPhotoTraitsPhenotypeDetected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "isOtherSubjectFromPhotoTraitsPhenotypeDetected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMMomentsEventDataEventBundleClusterMetadata with isFiltered: %@, isTopLevelActivityTypePhenotypeDetected: %@, isSecondLevelActivityTypePhenotypeDetected: %@, isWeekendPhenotypeDetected: %@, isTimeTagPhenotypeDetected: %@, isDayOfWeekPhenotypeDetected: %@, isPlaceNamePhenotypeDetected: %@, isCombinedPlacePhenotypeDetected: %@, isEnclosingAreaNamePhenotypeDetected: %@, isPersonsPhenotypeDetected: %@, isPersonRelationshipPhenotypeDetected: %@, isActivityTypeFromPhotoTraitsPhenotypeDetected: %@, isTimeContextFromPhotoTraitsPhenotypeDetected: %@, isLocationContextFromPhotoTraitsPhenotypeDetected: %@, isSocialContextFromPhotoTraitsPhenotypeDetected: %@, isExtraContextFromPhotoTraitsPhenotypeDetected: %@, isOtherSubjectFromPhotoTraitsPhenotypeDetected: %@"), v22, v21, v20, v16, v15, v14, v13, v19, v12, v11, v10, v9, v3, v4, v5, v6,
                  v7);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
  BMMomentsEventDataEventBundleClusterMetadata *v6;
  int *v7;
  int *v8;
  int *v9;
  unint64_t v10;
  int *v11;
  int *v12;
  unint64_t v13;
  int *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  int v27;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  int *v37;
  BOOL v38;
  unint64_t v39;
  int *v40;
  unint64_t v41;
  uint64_t v42;
  int *v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  char v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  char v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char v123;
  char v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char v129;
  char v130;
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char v135;
  char v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  BMMomentsEventDataEventBundleClusterMetadata *v142;
  BMMomentsEventDataEventBundleClusterMetadata *v144;
  objc_super v145;

  v4 = a3;
  v145.receiver = self;
  v145.super_class = (Class)BMMomentsEventDataEventBundleClusterMetadata;
  v6 = -[BMEventBase init](&v145, sel_init);
  if (!v6)
    goto LABEL_184;
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = 0x1EEE16000uLL;
    v11 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isFiltered;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    v13 = 0x1EEE16000uLL;
    v14 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTopLevelActivityTypePhenotypeDetected;
    v15 = 0x1EEE16000uLL;
    v16 = 0x1EEE16000uLL;
    v17 = 0x1EEE16000uLL;
    v18 = 0x1EEE16000uLL;
    do
    {
      if (v4[*v9])
        break;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      while (1)
      {
        v22 = *v7;
        v23 = *(_QWORD *)&v4[v22];
        v24 = v23 + 1;
        if (v23 == -1 || v24 > *(_QWORD *)&v4[*v8])
          break;
        v25 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v23);
        *(_QWORD *)&v4[v22] = v24;
        v21 |= (unint64_t)(v25 & 0x7F) << v19;
        if ((v25 & 0x80) == 0)
          goto LABEL_13;
        v19 += 7;
        if (v20++ >= 9)
        {
          v21 = 0;
          v27 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v27 = v4[*v9];
      if (v4[*v9])
        v21 = 0;
LABEL_15:
      if (v27 || (v21 & 7) == 4)
        break;
      switch((v21 >> 3))
      {
        case 1u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + *(int *)(v10 + 1392)) = 1;
          while (1)
          {
            v32 = *v7;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v8])
            {
              v37 = v11;
              goto LABEL_158;
            }
            v35 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v33);
            *(_QWORD *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if ((v35 & 0x80) == 0)
              break;
            v36 = 0;
            v29 += 7;
            v37 = v11;
            v38 = v30++ > 8;
            if (v38)
              goto LABEL_162;
          }
          v37 = v11;
          goto LABEL_159;
        case 2u:
          v46 = 0;
          v47 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + *(int *)(v13 + 1400)) = 1;
          while (2)
          {
            v48 = *v7;
            v49 = *(_QWORD *)&v4[v48];
            v50 = v49 + 1;
            if (v49 == -1 || v50 > *(_QWORD *)&v4[*v8])
            {
              v37 = v14;
              goto LABEL_158;
            }
            v51 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v49);
            *(_QWORD *)&v4[v48] = v50;
            v31 |= (unint64_t)(v51 & 0x7F) << v46;
            if (v51 < 0)
            {
              v36 = 0;
              v46 += 7;
              v37 = v14;
              v38 = v47++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = v14;
          goto LABEL_159;
        case 3u:
          v52 = 0;
          v53 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + *(int *)(v15 + 1408)) = 1;
          while (2)
          {
            v54 = *v7;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSecondLevelActivityTypePhenotypeDetected;
              goto LABEL_158;
            }
            v57 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v55);
            *(_QWORD *)&v4[v54] = v56;
            v31 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v36 = 0;
              v52 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSecondLevelActivityTypePhenotypeDetected;
              v38 = v53++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSecondLevelActivityTypePhenotypeDetected;
          goto LABEL_159;
        case 4u:
          v58 = 0;
          v59 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + *(int *)(v16 + 1416)) = 1;
          while (2)
          {
            v60 = *v7;
            v61 = *(_QWORD *)&v4[v60];
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isWeekendPhenotypeDetected;
              goto LABEL_158;
            }
            v63 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v61);
            *(_QWORD *)&v4[v60] = v62;
            v31 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v36 = 0;
              v58 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isWeekendPhenotypeDetected;
              v38 = v59++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isWeekendPhenotypeDetected;
          goto LABEL_159;
        case 5u:
          v64 = 0;
          v65 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + *(int *)(v17 + 1424)) = 1;
          while (2)
          {
            v66 = *v7;
            v67 = *(_QWORD *)&v4[v66];
            v68 = v67 + 1;
            if (v67 == -1 || v68 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeTagPhenotypeDetected;
              goto LABEL_158;
            }
            v69 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v67);
            *(_QWORD *)&v4[v66] = v68;
            v31 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v36 = 0;
              v64 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeTagPhenotypeDetected;
              v38 = v65++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeTagPhenotypeDetected;
          goto LABEL_159;
        case 6u:
          v70 = 0;
          v71 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + *(int *)(v18 + 1432)) = 1;
          while (2)
          {
            v72 = *v7;
            v73 = *(_QWORD *)&v4[v72];
            v74 = v73 + 1;
            if (v73 == -1 || v74 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isDayOfWeekPhenotypeDetected;
              goto LABEL_158;
            }
            v75 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v73);
            *(_QWORD *)&v4[v72] = v74;
            v31 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v36 = 0;
              v70 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isDayOfWeekPhenotypeDetected;
              v38 = v71++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isDayOfWeekPhenotypeDetected;
          goto LABEL_159;
        case 7u:
          v76 = 0;
          v77 = 0;
          v31 = 0;
          v6->_hasIsPlaceNamePhenotypeDetected = 1;
          while (2)
          {
            v78 = *v7;
            v79 = *(_QWORD *)&v4[v78];
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPlaceNamePhenotypeDetected;
              goto LABEL_158;
            }
            v81 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v79);
            *(_QWORD *)&v4[v78] = v80;
            v31 |= (unint64_t)(v81 & 0x7F) << v76;
            if (v81 < 0)
            {
              v36 = 0;
              v76 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPlaceNamePhenotypeDetected;
              v38 = v77++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPlaceNamePhenotypeDetected;
          goto LABEL_159;
        case 8u:
          v82 = 0;
          v83 = 0;
          v31 = 0;
          v6->_hasIsCombinedPlacePhenotypeDetected = 1;
          while (2)
          {
            v84 = *v7;
            v85 = *(_QWORD *)&v4[v84];
            v86 = v85 + 1;
            if (v85 == -1 || v86 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isCombinedPlacePhenotypeDetected;
              goto LABEL_158;
            }
            v87 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v85);
            *(_QWORD *)&v4[v84] = v86;
            v31 |= (unint64_t)(v87 & 0x7F) << v82;
            if (v87 < 0)
            {
              v36 = 0;
              v82 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isCombinedPlacePhenotypeDetected;
              v38 = v83++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isCombinedPlacePhenotypeDetected;
          goto LABEL_159;
        case 9u:
          v88 = 0;
          v89 = 0;
          v31 = 0;
          v6->_hasIsEnclosingAreaNamePhenotypeDetected = 1;
          while (2)
          {
            v90 = *v7;
            v91 = *(_QWORD *)&v4[v90];
            v92 = v91 + 1;
            if (v91 == -1 || v92 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isEnclosingAreaNamePhenotypeDetected;
              goto LABEL_158;
            }
            v93 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v91);
            *(_QWORD *)&v4[v90] = v92;
            v31 |= (unint64_t)(v93 & 0x7F) << v88;
            if (v93 < 0)
            {
              v36 = 0;
              v88 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isEnclosingAreaNamePhenotypeDetected;
              v38 = v89++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isEnclosingAreaNamePhenotypeDetected;
          goto LABEL_159;
        case 0xAu:
          v94 = 0;
          v95 = 0;
          v31 = 0;
          v6->_hasIsPersonsPhenotypeDetected = 1;
          while (2)
          {
            v96 = *v7;
            v97 = *(_QWORD *)&v4[v96];
            v98 = v97 + 1;
            if (v97 == -1 || v98 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonsPhenotypeDetected;
              goto LABEL_158;
            }
            v99 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v97);
            *(_QWORD *)&v4[v96] = v98;
            v31 |= (unint64_t)(v99 & 0x7F) << v94;
            if (v99 < 0)
            {
              v36 = 0;
              v94 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonsPhenotypeDetected;
              v38 = v95++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonsPhenotypeDetected;
          goto LABEL_159;
        case 0xBu:
          v100 = 0;
          v101 = 0;
          v31 = 0;
          v6->_hasIsPersonRelationshipPhenotypeDetected = 1;
          while (2)
          {
            v102 = *v7;
            v103 = *(_QWORD *)&v4[v102];
            v104 = v103 + 1;
            if (v103 == -1 || v104 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonRelationshipPhenotypeDetected;
              goto LABEL_158;
            }
            v105 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v103);
            *(_QWORD *)&v4[v102] = v104;
            v31 |= (unint64_t)(v105 & 0x7F) << v100;
            if (v105 < 0)
            {
              v36 = 0;
              v100 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonRelationshipPhenotypeDetected;
              v38 = v101++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonRelationshipPhenotypeDetected;
          goto LABEL_159;
        case 0xCu:
          v106 = 0;
          v107 = 0;
          v31 = 0;
          v6->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            v108 = *v7;
            v109 = *(_QWORD *)&v4[v108];
            v110 = v109 + 1;
            if (v109 == -1 || v110 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isActivityTypeFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            v111 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v109);
            *(_QWORD *)&v4[v108] = v110;
            v31 |= (unint64_t)(v111 & 0x7F) << v106;
            if (v111 < 0)
            {
              v36 = 0;
              v106 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isActivityTypeFromPhotoTraitsPhenotypeDetected;
              v38 = v107++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isActivityTypeFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0xDu:
          v112 = 0;
          v113 = 0;
          v31 = 0;
          v6->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            v114 = *v7;
            v115 = *(_QWORD *)&v4[v114];
            v116 = v115 + 1;
            if (v115 == -1 || v116 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            v117 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v115);
            *(_QWORD *)&v4[v114] = v116;
            v31 |= (unint64_t)(v117 & 0x7F) << v112;
            if (v117 < 0)
            {
              v36 = 0;
              v112 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeContextFromPhotoTraitsPhenotypeDetected;
              v38 = v113++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0xEu:
          v118 = 0;
          v119 = 0;
          v31 = 0;
          v6->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            v120 = *v7;
            v121 = *(_QWORD *)&v4[v120];
            v122 = v121 + 1;
            if (v121 == -1 || v122 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isLocationContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            v123 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v121);
            *(_QWORD *)&v4[v120] = v122;
            v31 |= (unint64_t)(v123 & 0x7F) << v118;
            if (v123 < 0)
            {
              v36 = 0;
              v118 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isLocationContextFromPhotoTraitsPhenotypeDetected;
              v38 = v119++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isLocationContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0xFu:
          v124 = 0;
          v125 = 0;
          v31 = 0;
          v6->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            v126 = *v7;
            v127 = *(_QWORD *)&v4[v126];
            v128 = v127 + 1;
            if (v127 == -1 || v128 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSocialContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            v129 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v127);
            *(_QWORD *)&v4[v126] = v128;
            v31 |= (unint64_t)(v129 & 0x7F) << v124;
            if (v129 < 0)
            {
              v36 = 0;
              v124 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSocialContextFromPhotoTraitsPhenotypeDetected;
              v38 = v125++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSocialContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0x10u:
          v130 = 0;
          v131 = 0;
          v31 = 0;
          v6->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            v132 = *v7;
            v133 = *(_QWORD *)&v4[v132];
            v134 = v133 + 1;
            if (v133 == -1 || v134 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isExtraContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            v135 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v133);
            *(_QWORD *)&v4[v132] = v134;
            v31 |= (unint64_t)(v135 & 0x7F) << v130;
            if (v135 < 0)
            {
              v36 = 0;
              v130 += 7;
              v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isExtraContextFromPhotoTraitsPhenotypeDetected;
              v38 = v131++ > 8;
              if (v38)
                goto LABEL_162;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isExtraContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0x11u:
          v136 = 0;
          v137 = 0;
          v31 = 0;
          v6->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = 1;
          break;
        default:
          v39 = v10;
          v40 = v11;
          v41 = v13;
          v42 = v5;
          v43 = v14;
          v144 = v6;
          v44 = v15;
          v45 = PBReaderSkipValueWithTag();
          v18 = 0x1EEE16000;
          v15 = v44;
          v9 = (int *)MEMORY[0x1E0D82BC8];
          v6 = v144;
          v14 = v43;
          v5 = v42;
          v13 = v41;
          v16 = 0x1EEE16000;
          v11 = v40;
          v10 = v39;
          v17 = 0x1EEE16000;
          if ((v45 & 1) == 0)
            goto LABEL_183;
          continue;
      }
      while (1)
      {
        v138 = *v7;
        v139 = *(_QWORD *)&v4[v138];
        v140 = v139 + 1;
        if (v139 == -1 || v140 > *(_QWORD *)&v4[*v8])
          break;
        v141 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v139);
        *(_QWORD *)&v4[v138] = v140;
        v31 |= (unint64_t)(v141 & 0x7F) << v136;
        if ((v141 & 0x80) == 0)
        {
          v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isOtherSubjectFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        }
        v36 = 0;
        v136 += 7;
        v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isOtherSubjectFromPhotoTraitsPhenotypeDetected;
        v38 = v137++ > 8;
        if (v38)
          goto LABEL_162;
      }
      v37 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isOtherSubjectFromPhotoTraitsPhenotypeDetected;
LABEL_158:
      v4[*v9] = 1;
LABEL_159:
      v36 = v4[*v9] ? 0 : v31;
LABEL_162:
      *((_BYTE *)&v6->super.super.isa + *v37) = v36 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  if (v4[*v9])
LABEL_183:
    v142 = 0;
  else
LABEL_184:
    v142 = v6;

  return v142;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasIsFiltered)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsTopLevelActivityTypePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsSecondLevelActivityTypePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsWeekendPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsTimeTagPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsDayOfWeekPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsPlaceNamePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsCombinedPlacePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsEnclosingAreaNamePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsPersonsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsPersonRelationshipPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventDataEventBundleClusterMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundleClusterMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  BMMomentsEventDataEventBundleClusterMetadata *v37;
  void *v38;
  void *v39;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  id v105;
  id v106;
  void *v107;
  uint64_t v108;
  id v109;
  id v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  id v115;
  void *v116;
  uint64_t v117;
  id v118;
  id v119;
  void *v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  id v125;
  id v126;
  id v127;
  uint64_t v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  uint64_t v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  id v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  uint64_t v175;
  _QWORD v176[3];

  v176[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFiltered"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v142 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v139 = 0;
LABEL_4:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTopLevelActivityTypePhenotypeDetected"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v138 = 0;
          v37 = 0;
          goto LABEL_68;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v173 = *MEMORY[0x1E0CB2D50];
        v137 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isTopLevelActivityTypePhenotypeDetected"));
        v174 = v137;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v138 = 0;
        *a4 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v6);
        goto LABEL_67;
      }
      v138 = v5;
    }
    else
    {
      v138 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSecondLevelActivityTypePhenotypeDetected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v137 = 0;
          v37 = 0;
          goto LABEL_67;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v171 = *MEMORY[0x1E0CB2D50];
        v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSecondLevelActivityTypePhenotypeDetected"));
        v172 = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)v47;
        v37 = 0;
        v137 = 0;
        *a4 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v7);
LABEL_66:

LABEL_67:
        goto LABEL_68;
      }
      v137 = v6;
    }
    else
    {
      v137 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWeekendPhenotypeDetected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v14 = 0;
          v37 = 0;
          goto LABEL_66;
        }
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v169 = *MEMORY[0x1E0CB2D50];
        v135 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isWeekendPhenotypeDetected"));
        v170 = v135;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v14 = 0;
        *a4 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v39);
        goto LABEL_65;
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTimeTagPhenotypeDetected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v135 = 0;
          v37 = 0;
          v39 = v9;
          v14 = v8;
          goto LABEL_65;
        }
        v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v133 = *MEMORY[0x1E0D025B8];
        v167 = *MEMORY[0x1E0CB2D50];
        v39 = v9;
        v14 = v8;
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isTimeTagPhenotypeDetected"));
        v168 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (id)objc_msgSend(v136, "initWithDomain:code:userInfo:", v133, 2, v10);
        v37 = 0;
        v135 = 0;
        *a4 = v50;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      v131 = v9;
      v135 = v9;
    }
    else
    {
      v131 = v9;
      v135 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDayOfWeekPhenotypeDetected"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = v8;
        if (!a4)
        {
          v11 = 0;
          v37 = 0;
          v39 = v131;
          goto LABEL_64;
        }
        v130 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v128 = *MEMORY[0x1E0D025B8];
        v165 = *MEMORY[0x1E0CB2D50];
        v132 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isDayOfWeekPhenotypeDetected"));
        v166 = v132;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v130;
        v129 = (void *)v51;
        v37 = 0;
        v11 = 0;
        *a4 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v128, 2);
        v39 = v131;
        goto LABEL_63;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlaceNamePhenotypeDetected"));
    v12 = objc_claimAutoreleasedReturnValue();
    v127 = v11;
    v129 = (void *)v12;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v132 = 0;
          v37 = 0;
          v39 = v131;
          v14 = v8;
          goto LABEL_63;
        }
        v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v123 = *MEMORY[0x1E0D025B8];
        v163 = *MEMORY[0x1E0CB2D50];
        v53 = objc_alloc(MEMORY[0x1E0CB3940]);
        v88 = objc_opt_class();
        v54 = v53;
        v11 = v127;
        v14 = v8;
        v125 = (id)objc_msgSend(v54, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v88, CFSTR("isPlaceNamePhenotypeDetected"));
        v164 = v125;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v123, 2, v15);
        v37 = 0;
        v132 = 0;
        *a4 = v55;
        goto LABEL_138;
      }
      v132 = v13;
    }
    else
    {
      v132 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCombinedPlacePhenotypeDetected"));
    v14 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v125 = 0;
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v125 = v15;
LABEL_25:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnclosingAreaNamePhenotypeDetected"));
      v16 = objc_claimAutoreleasedReturnValue();
      v113 = v15;
      v120 = (void *)v16;
      if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v122 = 0;
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v122 = v17;
LABEL_28:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPersonsPhenotypeDetected"));
        v18 = objc_claimAutoreleasedReturnValue();
        v116 = (void *)v18;
        if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v118 = 0;
          goto LABEL_31;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v118 = v19;
LABEL_31:
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPersonRelationshipPhenotypeDetected"));
          v20 = objc_claimAutoreleasedReturnValue();
          v111 = (void *)v20;
          if (!v20 || (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v114 = 0;
            goto LABEL_34;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v114 = v21;
LABEL_34:
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isActivityTypeFromPhotoTraitsPhenotypeDetected"));
            v22 = objc_claimAutoreleasedReturnValue();
            v107 = (void *)v22;
            if (!v22 || (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v109 = 0;
              goto LABEL_37;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v109 = v23;
LABEL_37:
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTimeContextFromPhotoTraitsPhenotypeDetected"));
              v24 = objc_claimAutoreleasedReturnValue();
              v103 = (void *)v24;
              if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v105 = 0;
                goto LABEL_40;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v105 = v25;
LABEL_40:
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocationContextFromPhotoTraitsPhenotypeDetected"));
                v26 = objc_claimAutoreleasedReturnValue();
                v99 = (void *)v26;
                if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v101 = 0;
                  goto LABEL_43;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v101 = v27;
LABEL_43:
                  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSocialContextFromPhotoTraitsPhenotypeDetected"));
                  v28 = objc_claimAutoreleasedReturnValue();
                  v96 = (void *)v28;
                  v98 = v10;
                  if (!v28 || (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v91 = 0;
LABEL_46:
                    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExtraContextFromPhotoTraitsPhenotypeDetected"));
                    v30 = objc_claimAutoreleasedReturnValue();
                    v93 = (void *)v30;
                    v95 = v14;
                    if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v36 = 0;
                          v37 = 0;
                          v34 = v91;
                          v38 = v93;
                          goto LABEL_54;
                        }
                        v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v89 = v5;
                        v78 = v7;
                        v79 = *MEMORY[0x1E0D025B8];
                        v145 = *MEMORY[0x1E0CB2D50];
                        v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isExtraContextFromPhotoTraitsPhenotypeDetected"));
                        v146 = v35;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v80 = v79;
                        v7 = v78;
                        v5 = v89;
                        v81 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v80, 2, v33);
                        v37 = 0;
                        v36 = 0;
                        *a4 = v81;
                        v34 = v91;
                        goto LABEL_53;
                      }
                      v32 = v31;
                    }
                    else
                    {
                      v32 = 0;
                    }
                    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOtherSubjectFromPhotoTraitsPhenotypeDetected"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v91;
                    if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v36 = v32;
                        if (a4)
                        {
                          v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v90 = v5;
                          v83 = v7;
                          v84 = *MEMORY[0x1E0D025B8];
                          v143 = *MEMORY[0x1E0CB2D50];
                          v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isOtherSubjectFromPhotoTraitsPhenotypeDetected"));
                          v144 = v85;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
                          v86 = (void *)objc_claimAutoreleasedReturnValue();
                          v87 = v84;
                          v7 = v83;
                          v5 = v90;
                          *a4 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v87, 2, v86);

                        }
                        v35 = 0;
                        v37 = 0;
                        goto LABEL_53;
                      }
                      v35 = v33;
                    }
                    else
                    {
                      v35 = 0;
                    }
                    v36 = v32;
                    v37 = objc_retain(-[BMMomentsEventDataEventBundleClusterMetadata initWithIsFiltered:isTopLevelActivityTypePhenotypeDetected:isSecondLevelActivityTypePhenotypeDetected:isWeekendPhenotypeDetected:isTimeTagPhenotypeDetected:isDayOfWeekPhenotypeDetected:isPlaceNamePhenotypeDetected:isCombinedPlacePhenotypeDetected:isEnclosingAreaNamePhenotypeDetected:isPersonsPhenotypeDetected:isPersonRelationshipPhenotypeDetected:isActivityTypeFromPhotoTraitsPhenotypeDetected:isTimeContextFromPhotoTraitsPhenotypeDetected:isLocationContextFromPhotoTraitsPhenotypeDetected:isSocialContextFromPhotoTraitsPhenotypeDetected:isExtraContextFromPhotoTraitsPhenotypeDetected:isOtherSubjectFromPhotoTraitsPhenotypeDetected:](self, "initWithIsFiltered:isTopLevelActivityTypePhenotypeDetected:isSecondLevelActivityTypePhenotypeDetected:isWeekendPhenotypeDetected:isTimeTagPhenotypeDetected:isDayOfWeekPhenotypeDetected:isPlaceNamePhenotypeDetected:isCombinedPlacePhenotypeDetected:isEnclosingAreaNamePhenotypeDetected:isPersonsPhenotypeDetected:isPersonRelationshipPhenotypeDetected:isActivityTypeFromPhotoTraitsPhenotypeDetected:isTimeContextFromPhotoTraitsPhenotypeDetected:isLocationContextFromPhotoTraitsPhenotypeDetected:isSocialContextFromPhotoTraitsPhenotypeDetected:isExtraContextFromPhotoTraitsPhenotypeDetected:isOtherSubjectFromPhotoTraitsPhenotypeDetected:", v139, v138, v137, v95, v135, v127, v132, v125, v122, v118,
                              v114,
                              v109,
                              v105,
                              v101,
                              v91,
                              v32,
                              v35));
                    self = v37;
LABEL_53:

                    v38 = v93;
                    v14 = v95;
                    v10 = v98;
LABEL_54:

                    v39 = v131;
                    v15 = v113;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
LABEL_59:

LABEL_60:
LABEL_61:

                    v11 = v127;
LABEL_62:

LABEL_63:
                    goto LABEL_64;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v91 = v29;
                    goto LABEL_46;
                  }
                  if (a4)
                  {
                    v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v92 = *MEMORY[0x1E0D025B8];
                    v147 = *MEMORY[0x1E0CB2D50];
                    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSocialContextFromPhotoTraitsPhenotypeDetected"));
                    v148 = v36;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = 0;
                    v34 = 0;
                    *a4 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v92, 2, v38);
                    goto LABEL_54;
                  }
                  v34 = 0;
                  v37 = 0;
LABEL_160:
                  v39 = v131;
                  goto LABEL_55;
                }
                if (a4)
                {
                  v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v97 = *MEMORY[0x1E0D025B8];
                  v149 = *MEMORY[0x1E0CB2D50];
                  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isLocationContextFromPhotoTraitsPhenotypeDetected"));
                  v150 = v34;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
                  v74 = objc_claimAutoreleasedReturnValue();
                  v75 = v97;
                  v96 = (void *)v74;
                  v76 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v75, 2);
                  v37 = 0;
                  v101 = 0;
                  *a4 = v76;
                  goto LABEL_160;
                }
                v101 = 0;
                v37 = 0;
LABEL_158:
                v39 = v131;
                goto LABEL_56;
              }
              if (a4)
              {
                v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v100 = *MEMORY[0x1E0D025B8];
                v151 = *MEMORY[0x1E0CB2D50];
                v101 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isTimeContextFromPhotoTraitsPhenotypeDetected"));
                v152 = v101;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
                v71 = objc_claimAutoreleasedReturnValue();
                v72 = v100;
                v99 = (void *)v71;
                v73 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v72, 2);
                v37 = 0;
                v105 = 0;
                *a4 = v73;
                goto LABEL_158;
              }
              v105 = 0;
              v37 = 0;
LABEL_156:
              v39 = v131;
              goto LABEL_57;
            }
            if (a4)
            {
              v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v104 = *MEMORY[0x1E0D025B8];
              v153 = *MEMORY[0x1E0CB2D50];
              v105 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isActivityTypeFromPhotoTraitsPhenotypeDetected"));
              v154 = v105;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
              v68 = objc_claimAutoreleasedReturnValue();
              v69 = v104;
              v103 = (void *)v68;
              v70 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v69, 2);
              v37 = 0;
              v109 = 0;
              *a4 = v70;
              goto LABEL_156;
            }
            v109 = 0;
            v37 = 0;
LABEL_154:
            v39 = v131;
            goto LABEL_58;
          }
          if (a4)
          {
            v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v108 = *MEMORY[0x1E0D025B8];
            v155 = *MEMORY[0x1E0CB2D50];
            v109 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isPersonRelationshipPhenotypeDetected"));
            v156 = v109;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
            v65 = objc_claimAutoreleasedReturnValue();
            v66 = v108;
            v107 = (void *)v65;
            v67 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v66, 2);
            v37 = 0;
            v114 = 0;
            *a4 = v67;
            goto LABEL_154;
          }
          v114 = 0;
          v37 = 0;
LABEL_150:
          v39 = v131;
          goto LABEL_59;
        }
        if (a4)
        {
          v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v112 = *MEMORY[0x1E0D025B8];
          v157 = *MEMORY[0x1E0CB2D50];
          v114 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isPersonsPhenotypeDetected"));
          v158 = v114;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = v112;
          v111 = (void *)v62;
          v64 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v63, 2);
          v37 = 0;
          v118 = 0;
          *a4 = v64;
          goto LABEL_150;
        }
        v118 = 0;
        v37 = 0;
LABEL_146:
        v39 = v131;
        goto LABEL_60;
      }
      if (a4)
      {
        v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v117 = *MEMORY[0x1E0D025B8];
        v159 = *MEMORY[0x1E0CB2D50];
        v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isEnclosingAreaNamePhenotypeDetected"));
        v160 = v118;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v117;
        v116 = (void *)v59;
        v61 = (id)objc_msgSend(v124, "initWithDomain:code:userInfo:", v60, 2);
        v37 = 0;
        v122 = 0;
        *a4 = v61;
        goto LABEL_146;
      }
      v122 = 0;
      v37 = 0;
LABEL_142:
      v39 = v131;
      goto LABEL_61;
    }
    if (a4)
    {
      v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v121 = *MEMORY[0x1E0D025B8];
      v161 = *MEMORY[0x1E0CB2D50];
      v122 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isCombinedPlacePhenotypeDetected"));
      v162 = v122;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v121;
      v120 = (void *)v56;
      v58 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v57, 2);
      v37 = 0;
      v125 = 0;
      *a4 = v58;
      goto LABEL_142;
    }
    v125 = 0;
    v37 = 0;
LABEL_138:
    v39 = v131;
    goto LABEL_62;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v139 = v142;
    goto LABEL_4;
  }
  if (!a4)
  {
    v37 = 0;
    v139 = 0;
    goto LABEL_69;
  }
  v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v42 = *MEMORY[0x1E0D025B8];
  v175 = *MEMORY[0x1E0CB2D50];
  v138 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFiltered"));
  v176[0] = v138;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v176, &v175, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v139 = 0;
  *a4 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v5);
LABEL_68:

LABEL_69:
  return v37;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
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
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[17];
  _QWORD v59[19];

  v59[17] = *MEMORY[0x1E0C80C00];
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsFiltered](self, "hasIsFiltered"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isFiltered](self, "isFiltered"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTopLevelActivityTypePhenotypeDetected](self, "hasIsTopLevelActivityTypePhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTopLevelActivityTypePhenotypeDetected](self, "isTopLevelActivityTypePhenotypeDetected"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsSecondLevelActivityTypePhenotypeDetected](self, "hasIsSecondLevelActivityTypePhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSecondLevelActivityTypePhenotypeDetected](self, "isSecondLevelActivityTypePhenotypeDetected"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsWeekendPhenotypeDetected](self, "hasIsWeekendPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isWeekendPhenotypeDetected](self, "isWeekendPhenotypeDetected"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeTagPhenotypeDetected](self, "hasIsTimeTagPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeTagPhenotypeDetected](self, "isTimeTagPhenotypeDetected"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsDayOfWeekPhenotypeDetected](self, "hasIsDayOfWeekPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isDayOfWeekPhenotypeDetected](self, "isDayOfWeekPhenotypeDetected"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPlaceNamePhenotypeDetected](self, "hasIsPlaceNamePhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPlaceNamePhenotypeDetected](self, "isPlaceNamePhenotypeDetected"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsCombinedPlacePhenotypeDetected](self, "hasIsCombinedPlacePhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isCombinedPlacePhenotypeDetected](self, "isCombinedPlacePhenotypeDetected"));
    v57 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v57 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsEnclosingAreaNamePhenotypeDetected](self, "hasIsEnclosingAreaNamePhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isEnclosingAreaNamePhenotypeDetected](self, "isEnclosingAreaNamePhenotypeDetected"));
    v56 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonsPhenotypeDetected](self, "hasIsPersonsPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonsPhenotypeDetected](self, "isPersonsPhenotypeDetected"));
    v55 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v55 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonRelationshipPhenotypeDetected](self, "hasIsPersonRelationshipPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonRelationshipPhenotypeDetected](self, "isPersonRelationshipPhenotypeDetected"));
    v54 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v54 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsActivityTypeFromPhotoTraitsPhenotypeDetected](self, "hasIsActivityTypeFromPhotoTraitsPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isActivityTypeFromPhotoTraitsPhenotypeDetected](self, "isActivityTypeFromPhotoTraitsPhenotypeDetected"));
    v53 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v53 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeContextFromPhotoTraitsPhenotypeDetected](self, "hasIsTimeContextFromPhotoTraitsPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeContextFromPhotoTraitsPhenotypeDetected](self, "isTimeContextFromPhotoTraitsPhenotypeDetected"));
    v52 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsLocationContextFromPhotoTraitsPhenotypeDetected](self, "hasIsLocationContextFromPhotoTraitsPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isLocationContextFromPhotoTraitsPhenotypeDetected](self, "isLocationContextFromPhotoTraitsPhenotypeDetected"));
    v51 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsSocialContextFromPhotoTraitsPhenotypeDetected](self, "hasIsSocialContextFromPhotoTraitsPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSocialContextFromPhotoTraitsPhenotypeDetected](self, "isSocialContextFromPhotoTraitsPhenotypeDetected"));
    v50 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsExtraContextFromPhotoTraitsPhenotypeDetected](self, "hasIsExtraContextFromPhotoTraitsPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isExtraContextFromPhotoTraitsPhenotypeDetected](self, "isExtraContextFromPhotoTraitsPhenotypeDetected"));
    v49 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }
  if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "isOtherSubjectFromPhotoTraitsPhenotypeDetected"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v58[0] = CFSTR("isFiltered");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v11;
  v59[0] = v11;
  v58[1] = CFSTR("isTopLevelActivityTypePhenotypeDetected");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v12;
  v59[1] = v12;
  v58[2] = CFSTR("isSecondLevelActivityTypePhenotypeDetected");
  v13 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v13;
  v59[2] = v13;
  v58[3] = CFSTR("isWeekendPhenotypeDetected");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v14;
  v59[3] = v14;
  v58[4] = CFSTR("isTimeTagPhenotypeDetected");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v15;
  v59[4] = v15;
  v58[5] = CFSTR("isDayOfWeekPhenotypeDetected");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v16;
  v59[5] = v16;
  v58[6] = CFSTR("isPlaceNamePhenotypeDetected");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v17;
  v59[6] = v17;
  v58[7] = CFSTR("isCombinedPlacePhenotypeDetected");
  v18 = (uint64_t)v57;
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v59[7] = v18;
  v58[8] = CFSTR("isEnclosingAreaNamePhenotypeDetected");
  v19 = (uint64_t)v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v48 = v3;
  v59[8] = v19;
  v58[9] = CFSTR("isPersonsPhenotypeDetected");
  v20 = (uint64_t)v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v45 = v9;
  v59[9] = v20;
  v58[10] = CFSTR("isPersonRelationshipPhenotypeDetected");
  v21 = (uint64_t)v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v47 = v4;
  v32 = v21;
  v59[10] = v21;
  v58[11] = CFSTR("isActivityTypeFromPhotoTraitsPhenotypeDetected");
  v22 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v19;
  v36 = (void *)v18;
  v46 = v7;
  v59[11] = v22;
  v58[12] = CFSTR("isTimeContextFromPhotoTraitsPhenotypeDetected");
  v23 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v8;
  v25 = v5;
  v59[12] = v23;
  v58[13] = CFSTR("isLocationContextFromPhotoTraitsPhenotypeDetected");
  v26 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v6;
  v59[13] = v26;
  v58[14] = CFSTR("isSocialContextFromPhotoTraitsPhenotypeDetected");
  v28 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v20;
  v59[14] = v28;
  v58[15] = CFSTR("isExtraContextFromPhotoTraitsPhenotypeDetected");
  v29 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59[15] = v29;
  v58[16] = CFSTR("isOtherSubjectFromPhotoTraitsPhenotypeDetected");
  v30 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59[16] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 17, v32);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)

  if (!v49)
  if (!v50)

  if (!v51)
  if (!v52)

  if (!v53)
  if (!v54)

  if (!v55)
  if (!v56)

  if (v57)
  {
    if (v45)
      goto LABEL_106;
  }
  else
  {

    if (v45)
    {
LABEL_106:
      if (v24)
        goto LABEL_107;
      goto LABEL_115;
    }
  }

  if (v24)
  {
LABEL_107:
    if (v46)
      goto LABEL_108;
    goto LABEL_116;
  }
LABEL_115:

  if (v46)
  {
LABEL_108:
    if (v27)
      goto LABEL_109;
    goto LABEL_117;
  }
LABEL_116:

  if (v27)
  {
LABEL_109:
    if (v25)
      goto LABEL_110;
    goto LABEL_118;
  }
LABEL_117:

  if (v25)
  {
LABEL_110:
    if (v47)
      goto LABEL_111;
LABEL_119:

    if (v48)
      goto LABEL_112;
LABEL_120:

    goto LABEL_112;
  }
LABEL_118:

  if (!v47)
    goto LABEL_119;
LABEL_111:
  if (!v48)
    goto LABEL_120;
LABEL_112:

  return v44;
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
  _BOOL4 v22;
  int v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsFiltered](self, "hasIsFiltered")
      || objc_msgSend(v5, "hasIsFiltered"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsFiltered](self, "hasIsFiltered"))
        goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsFiltered"))
        goto LABEL_88;
      v6 = -[BMMomentsEventDataEventBundleClusterMetadata isFiltered](self, "isFiltered");
      if (v6 != objc_msgSend(v5, "isFiltered"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTopLevelActivityTypePhenotypeDetected](self, "hasIsTopLevelActivityTypePhenotypeDetected")|| objc_msgSend(v5, "hasIsTopLevelActivityTypePhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsTopLevelActivityTypePhenotypeDetected](self, "hasIsTopLevelActivityTypePhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsTopLevelActivityTypePhenotypeDetected"))
        goto LABEL_88;
      v7 = -[BMMomentsEventDataEventBundleClusterMetadata isTopLevelActivityTypePhenotypeDetected](self, "isTopLevelActivityTypePhenotypeDetected");
      if (v7 != objc_msgSend(v5, "isTopLevelActivityTypePhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsSecondLevelActivityTypePhenotypeDetected](self, "hasIsSecondLevelActivityTypePhenotypeDetected")|| objc_msgSend(v5, "hasIsSecondLevelActivityTypePhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsSecondLevelActivityTypePhenotypeDetected](self, "hasIsSecondLevelActivityTypePhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsSecondLevelActivityTypePhenotypeDetected"))
        goto LABEL_88;
      v8 = -[BMMomentsEventDataEventBundleClusterMetadata isSecondLevelActivityTypePhenotypeDetected](self, "isSecondLevelActivityTypePhenotypeDetected");
      if (v8 != objc_msgSend(v5, "isSecondLevelActivityTypePhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsWeekendPhenotypeDetected](self, "hasIsWeekendPhenotypeDetected")|| objc_msgSend(v5, "hasIsWeekendPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsWeekendPhenotypeDetected](self, "hasIsWeekendPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsWeekendPhenotypeDetected"))
        goto LABEL_88;
      v9 = -[BMMomentsEventDataEventBundleClusterMetadata isWeekendPhenotypeDetected](self, "isWeekendPhenotypeDetected");
      if (v9 != objc_msgSend(v5, "isWeekendPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeTagPhenotypeDetected](self, "hasIsTimeTagPhenotypeDetected")|| objc_msgSend(v5, "hasIsTimeTagPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeTagPhenotypeDetected](self, "hasIsTimeTagPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsTimeTagPhenotypeDetected"))
        goto LABEL_88;
      v10 = -[BMMomentsEventDataEventBundleClusterMetadata isTimeTagPhenotypeDetected](self, "isTimeTagPhenotypeDetected");
      if (v10 != objc_msgSend(v5, "isTimeTagPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsDayOfWeekPhenotypeDetected](self, "hasIsDayOfWeekPhenotypeDetected")|| objc_msgSend(v5, "hasIsDayOfWeekPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsDayOfWeekPhenotypeDetected](self, "hasIsDayOfWeekPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsDayOfWeekPhenotypeDetected"))
        goto LABEL_88;
      v11 = -[BMMomentsEventDataEventBundleClusterMetadata isDayOfWeekPhenotypeDetected](self, "isDayOfWeekPhenotypeDetected");
      if (v11 != objc_msgSend(v5, "isDayOfWeekPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPlaceNamePhenotypeDetected](self, "hasIsPlaceNamePhenotypeDetected")|| objc_msgSend(v5, "hasIsPlaceNamePhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsPlaceNamePhenotypeDetected](self, "hasIsPlaceNamePhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsPlaceNamePhenotypeDetected"))
        goto LABEL_88;
      v12 = -[BMMomentsEventDataEventBundleClusterMetadata isPlaceNamePhenotypeDetected](self, "isPlaceNamePhenotypeDetected");
      if (v12 != objc_msgSend(v5, "isPlaceNamePhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsCombinedPlacePhenotypeDetected](self, "hasIsCombinedPlacePhenotypeDetected")|| objc_msgSend(v5, "hasIsCombinedPlacePhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsCombinedPlacePhenotypeDetected](self, "hasIsCombinedPlacePhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsCombinedPlacePhenotypeDetected"))
        goto LABEL_88;
      v13 = -[BMMomentsEventDataEventBundleClusterMetadata isCombinedPlacePhenotypeDetected](self, "isCombinedPlacePhenotypeDetected");
      if (v13 != objc_msgSend(v5, "isCombinedPlacePhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsEnclosingAreaNamePhenotypeDetected](self, "hasIsEnclosingAreaNamePhenotypeDetected")|| objc_msgSend(v5, "hasIsEnclosingAreaNamePhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsEnclosingAreaNamePhenotypeDetected](self, "hasIsEnclosingAreaNamePhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsEnclosingAreaNamePhenotypeDetected"))
        goto LABEL_88;
      v14 = -[BMMomentsEventDataEventBundleClusterMetadata isEnclosingAreaNamePhenotypeDetected](self, "isEnclosingAreaNamePhenotypeDetected");
      if (v14 != objc_msgSend(v5, "isEnclosingAreaNamePhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonsPhenotypeDetected](self, "hasIsPersonsPhenotypeDetected")|| objc_msgSend(v5, "hasIsPersonsPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonsPhenotypeDetected](self, "hasIsPersonsPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsPersonsPhenotypeDetected"))
        goto LABEL_88;
      v15 = -[BMMomentsEventDataEventBundleClusterMetadata isPersonsPhenotypeDetected](self, "isPersonsPhenotypeDetected");
      if (v15 != objc_msgSend(v5, "isPersonsPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonRelationshipPhenotypeDetected](self, "hasIsPersonRelationshipPhenotypeDetected")|| objc_msgSend(v5, "hasIsPersonRelationshipPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonRelationshipPhenotypeDetected](self, "hasIsPersonRelationshipPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsPersonRelationshipPhenotypeDetected"))
        goto LABEL_88;
      v16 = -[BMMomentsEventDataEventBundleClusterMetadata isPersonRelationshipPhenotypeDetected](self, "isPersonRelationshipPhenotypeDetected");
      if (v16 != objc_msgSend(v5, "isPersonRelationshipPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsActivityTypeFromPhotoTraitsPhenotypeDetected](self, "hasIsActivityTypeFromPhotoTraitsPhenotypeDetected")|| objc_msgSend(v5, "hasIsActivityTypeFromPhotoTraitsPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsActivityTypeFromPhotoTraitsPhenotypeDetected](self, "hasIsActivityTypeFromPhotoTraitsPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsActivityTypeFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
      v17 = -[BMMomentsEventDataEventBundleClusterMetadata isActivityTypeFromPhotoTraitsPhenotypeDetected](self, "isActivityTypeFromPhotoTraitsPhenotypeDetected");
      if (v17 != objc_msgSend(v5, "isActivityTypeFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeContextFromPhotoTraitsPhenotypeDetected](self, "hasIsTimeContextFromPhotoTraitsPhenotypeDetected")|| objc_msgSend(v5, "hasIsTimeContextFromPhotoTraitsPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeContextFromPhotoTraitsPhenotypeDetected](self, "hasIsTimeContextFromPhotoTraitsPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsTimeContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
      v18 = -[BMMomentsEventDataEventBundleClusterMetadata isTimeContextFromPhotoTraitsPhenotypeDetected](self, "isTimeContextFromPhotoTraitsPhenotypeDetected");
      if (v18 != objc_msgSend(v5, "isTimeContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsLocationContextFromPhotoTraitsPhenotypeDetected](self, "hasIsLocationContextFromPhotoTraitsPhenotypeDetected")|| objc_msgSend(v5, "hasIsLocationContextFromPhotoTraitsPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsLocationContextFromPhotoTraitsPhenotypeDetected](self, "hasIsLocationContextFromPhotoTraitsPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsLocationContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
      v19 = -[BMMomentsEventDataEventBundleClusterMetadata isLocationContextFromPhotoTraitsPhenotypeDetected](self, "isLocationContextFromPhotoTraitsPhenotypeDetected");
      if (v19 != objc_msgSend(v5, "isLocationContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsSocialContextFromPhotoTraitsPhenotypeDetected](self, "hasIsSocialContextFromPhotoTraitsPhenotypeDetected")|| objc_msgSend(v5, "hasIsSocialContextFromPhotoTraitsPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsSocialContextFromPhotoTraitsPhenotypeDetected](self, "hasIsSocialContextFromPhotoTraitsPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsSocialContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
      v20 = -[BMMomentsEventDataEventBundleClusterMetadata isSocialContextFromPhotoTraitsPhenotypeDetected](self, "isSocialContextFromPhotoTraitsPhenotypeDetected");
      if (v20 != objc_msgSend(v5, "isSocialContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsExtraContextFromPhotoTraitsPhenotypeDetected](self, "hasIsExtraContextFromPhotoTraitsPhenotypeDetected")|| objc_msgSend(v5, "hasIsExtraContextFromPhotoTraitsPhenotypeDetected"))
    {
      if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsExtraContextFromPhotoTraitsPhenotypeDetected](self, "hasIsExtraContextFromPhotoTraitsPhenotypeDetected"))goto LABEL_88;
      if (!objc_msgSend(v5, "hasIsExtraContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
      v21 = -[BMMomentsEventDataEventBundleClusterMetadata isExtraContextFromPhotoTraitsPhenotypeDetected](self, "isExtraContextFromPhotoTraitsPhenotypeDetected");
      if (v21 != objc_msgSend(v5, "isExtraContextFromPhotoTraitsPhenotypeDetected"))
        goto LABEL_88;
    }
    if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected")&& !objc_msgSend(v5, "hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected"))
    {
      LOBYTE(v23) = 1;
      goto LABEL_89;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected")&& objc_msgSend(v5, "hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected"))
    {
      v22 = -[BMMomentsEventDataEventBundleClusterMetadata isOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "isOtherSubjectFromPhotoTraitsPhenotypeDetected");
      v23 = v22 ^ objc_msgSend(v5, "isOtherSubjectFromPhotoTraitsPhenotypeDetected") ^ 1;
    }
    else
    {
LABEL_88:
      LOBYTE(v23) = 0;
    }
LABEL_89:

    goto LABEL_90;
  }
  LOBYTE(v23) = 0;
LABEL_90:

  return v23;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (BOOL)hasIsFiltered
{
  return self->_hasIsFiltered;
}

- (void)setHasIsFiltered:(BOOL)a3
{
  self->_hasIsFiltered = a3;
}

- (BOOL)isTopLevelActivityTypePhenotypeDetected
{
  return self->_isTopLevelActivityTypePhenotypeDetected;
}

- (BOOL)hasIsTopLevelActivityTypePhenotypeDetected
{
  return self->_hasIsTopLevelActivityTypePhenotypeDetected;
}

- (void)setHasIsTopLevelActivityTypePhenotypeDetected:(BOOL)a3
{
  self->_hasIsTopLevelActivityTypePhenotypeDetected = a3;
}

- (BOOL)isSecondLevelActivityTypePhenotypeDetected
{
  return self->_isSecondLevelActivityTypePhenotypeDetected;
}

- (BOOL)hasIsSecondLevelActivityTypePhenotypeDetected
{
  return self->_hasIsSecondLevelActivityTypePhenotypeDetected;
}

- (void)setHasIsSecondLevelActivityTypePhenotypeDetected:(BOOL)a3
{
  self->_hasIsSecondLevelActivityTypePhenotypeDetected = a3;
}

- (BOOL)isWeekendPhenotypeDetected
{
  return self->_isWeekendPhenotypeDetected;
}

- (BOOL)hasIsWeekendPhenotypeDetected
{
  return self->_hasIsWeekendPhenotypeDetected;
}

- (void)setHasIsWeekendPhenotypeDetected:(BOOL)a3
{
  self->_hasIsWeekendPhenotypeDetected = a3;
}

- (BOOL)isTimeTagPhenotypeDetected
{
  return self->_isTimeTagPhenotypeDetected;
}

- (BOOL)hasIsTimeTagPhenotypeDetected
{
  return self->_hasIsTimeTagPhenotypeDetected;
}

- (void)setHasIsTimeTagPhenotypeDetected:(BOOL)a3
{
  self->_hasIsTimeTagPhenotypeDetected = a3;
}

- (BOOL)isDayOfWeekPhenotypeDetected
{
  return self->_isDayOfWeekPhenotypeDetected;
}

- (BOOL)hasIsDayOfWeekPhenotypeDetected
{
  return self->_hasIsDayOfWeekPhenotypeDetected;
}

- (void)setHasIsDayOfWeekPhenotypeDetected:(BOOL)a3
{
  self->_hasIsDayOfWeekPhenotypeDetected = a3;
}

- (BOOL)isPlaceNamePhenotypeDetected
{
  return self->_isPlaceNamePhenotypeDetected;
}

- (BOOL)hasIsPlaceNamePhenotypeDetected
{
  return self->_hasIsPlaceNamePhenotypeDetected;
}

- (void)setHasIsPlaceNamePhenotypeDetected:(BOOL)a3
{
  self->_hasIsPlaceNamePhenotypeDetected = a3;
}

- (BOOL)isCombinedPlacePhenotypeDetected
{
  return self->_isCombinedPlacePhenotypeDetected;
}

- (BOOL)hasIsCombinedPlacePhenotypeDetected
{
  return self->_hasIsCombinedPlacePhenotypeDetected;
}

- (void)setHasIsCombinedPlacePhenotypeDetected:(BOOL)a3
{
  self->_hasIsCombinedPlacePhenotypeDetected = a3;
}

- (BOOL)isEnclosingAreaNamePhenotypeDetected
{
  return self->_isEnclosingAreaNamePhenotypeDetected;
}

- (BOOL)hasIsEnclosingAreaNamePhenotypeDetected
{
  return self->_hasIsEnclosingAreaNamePhenotypeDetected;
}

- (void)setHasIsEnclosingAreaNamePhenotypeDetected:(BOOL)a3
{
  self->_hasIsEnclosingAreaNamePhenotypeDetected = a3;
}

- (BOOL)isPersonsPhenotypeDetected
{
  return self->_isPersonsPhenotypeDetected;
}

- (BOOL)hasIsPersonsPhenotypeDetected
{
  return self->_hasIsPersonsPhenotypeDetected;
}

- (void)setHasIsPersonsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsPersonsPhenotypeDetected = a3;
}

- (BOOL)isPersonRelationshipPhenotypeDetected
{
  return self->_isPersonRelationshipPhenotypeDetected;
}

- (BOOL)hasIsPersonRelationshipPhenotypeDetected
{
  return self->_hasIsPersonRelationshipPhenotypeDetected;
}

- (void)setHasIsPersonRelationshipPhenotypeDetected:(BOOL)a3
{
  self->_hasIsPersonRelationshipPhenotypeDetected = a3;
}

- (BOOL)isActivityTypeFromPhotoTraitsPhenotypeDetected
{
  return self->_isActivityTypeFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)hasIsActivityTypeFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsActivityTypeFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)isTimeContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isTimeContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)hasIsTimeContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsTimeContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)isLocationContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isLocationContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)hasIsLocationContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsLocationContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)isSocialContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isSocialContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)hasIsSocialContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsSocialContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)isExtraContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isExtraContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)hasIsExtraContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsExtraContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)isOtherSubjectFromPhotoTraitsPhenotypeDetected
{
  return self->_isOtherSubjectFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsOtherSubjectFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = a3;
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

    v4 = -[BMMomentsEventDataEventBundleClusterMetadata initByReadFrom:]([BMMomentsEventDataEventBundleClusterMetadata alloc], "initByReadFrom:", v7);
    v4[13] = 0;

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
  _QWORD v21[19];

  v21[17] = *MEMORY[0x1E0C80C00];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFiltered"), 0, 0, 1, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTopLevelActivityTypePhenotypeDetected"), 0, 0, 2, 12, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSecondLevelActivityTypePhenotypeDetected"), 0, 0, 3, 12, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isWeekendPhenotypeDetected"), 0, 0, 4, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTimeTagPhenotypeDetected"), 0, 0, 5, 12, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isDayOfWeekPhenotypeDetected"), 0, 0, 6, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPlaceNamePhenotypeDetected"), 0, 0, 7, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCombinedPlacePhenotypeDetected"), 0, 0, 8, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isEnclosingAreaNamePhenotypeDetected"), 0, 0, 9, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPersonsPhenotypeDetected"), 0, 0, 10, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPersonRelationshipPhenotypeDetected"), 0, 0, 11, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActivityTypeFromPhotoTraitsPhenotypeDetected"), 0, 0, 12, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTimeContextFromPhotoTraitsPhenotypeDetected"), 0, 0, 13, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isLocationContextFromPhotoTraitsPhenotypeDetected"), 0, 0, 14, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSocialContextFromPhotoTraitsPhenotypeDetected"), 0, 0, 15, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isExtraContextFromPhotoTraitsPhenotypeDetected"), 0, 0, 16, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isOtherSubjectFromPhotoTraitsPhenotypeDetected"), 0, 0, 17, 12, 0);
  v21[0] = v20;
  v21[1] = v19;
  v21[2] = v18;
  v21[3] = v17;
  v21[4] = v16;
  v21[5] = v15;
  v21[6] = v14;
  v21[7] = v2;
  v21[8] = v3;
  v21[9] = v4;
  v21[10] = v5;
  v21[11] = v13;
  v21[12] = v6;
  v21[13] = v7;
  v21[14] = v12;
  v21[15] = v8;
  v21[16] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 17);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A740;
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
  _QWORD v21[19];

  v21[17] = *MEMORY[0x1E0C80C00];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFiltered"), 1, 12, 0);
  v21[0] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTopLevelActivityTypePhenotypeDetected"), 2, 12, 0);
  v21[1] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSecondLevelActivityTypePhenotypeDetected"), 3, 12, 0);
  v21[2] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isWeekendPhenotypeDetected"), 4, 12, 0);
  v21[3] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTimeTagPhenotypeDetected"), 5, 12, 0);
  v21[4] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isDayOfWeekPhenotypeDetected"), 6, 12, 0);
  v21[5] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPlaceNamePhenotypeDetected"), 7, 12, 0);
  v21[6] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCombinedPlacePhenotypeDetected"), 8, 12, 0);
  v21[7] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isEnclosingAreaNamePhenotypeDetected"), 9, 12, 0);
  v21[8] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPersonsPhenotypeDetected"), 10, 12, 0);
  v21[9] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPersonRelationshipPhenotypeDetected"), 11, 12, 0);
  v21[10] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActivityTypeFromPhotoTraitsPhenotypeDetected"), 12, 12, 0);
  v21[11] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTimeContextFromPhotoTraitsPhenotypeDetected"), 13, 12, 0);
  v21[12] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isLocationContextFromPhotoTraitsPhenotypeDetected"), 14, 12, 0);
  v21[13] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSocialContextFromPhotoTraitsPhenotypeDetected"), 15, 12, 0);
  v21[14] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isExtraContextFromPhotoTraitsPhenotypeDetected"), 16, 12, 0);
  v21[15] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isOtherSubjectFromPhotoTraitsPhenotypeDetected"), 17, 12, 0);
  v21[16] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
