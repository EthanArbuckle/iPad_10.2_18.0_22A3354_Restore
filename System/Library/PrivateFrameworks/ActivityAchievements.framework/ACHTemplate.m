@implementation ACHTemplate

- (ACHTemplate)initWithCodable:(id)a3
{
  id v4;
  ACHTemplate *v5;
  void *v6;
  void *v7;
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
  const char *v43;
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
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  __CFString *v67;
  __CFString *v68;
  ACHSyncIdentity *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  objc_super v79;

  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)ACHTemplate;
  v5 = -[ACHTemplate init](&v79, sel_init);
  if (v5)
  {
    -[ACHTemplate setKey:](v5, "setKey:", objc_msgSend(v4, "key"));
    objc_msgSend(v4, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[ACHTemplate setUniqueName:](v5, "setUniqueName:", v7);

    -[ACHTemplate setVersion:](v5, "setVersion:", objc_msgSend(v4, "version"));
    -[ACHTemplate setMinimumEngineVersion:](v5, "setMinimumEngineVersion:", objc_msgSend(v4, "minimumEngineVersion"));
    v8 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "createdDate");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setCreatedDate:](v5, "setCreatedDate:", v9);

    -[ACHTemplate setCreatorDevice:](v5, "setCreatorDevice:", objc_msgSend(v4, "creatorDevice"));
    objc_msgSend(v4, "sourceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[ACHTemplate setSourceName:](v5, "setSourceName:", v11);

    objc_msgSend(v4, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[ACHTemplate setPredicate:](v5, "setPredicate:", v13);

    objc_msgSend(v4, "gracePredicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[ACHTemplate setGracePredicate:](v5, "setGracePredicate:", v15);

    objc_msgSend(v4, "valueExpression");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    -[ACHTemplate setValueExpression:](v5, "setValueExpression:", v17);

    objc_msgSend(v4, "graceValueExpression");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    -[ACHTemplate setGraceValueExpression:](v5, "setGraceValueExpression:", v19);

    objc_msgSend(v4, "progressExpression");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    -[ACHTemplate setProgressExpression:](v5, "setProgressExpression:", v21);

    objc_msgSend(v4, "graceProgressExpression");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    -[ACHTemplate setGraceProgressExpression:](v5, "setGraceProgressExpression:", v23);

    objc_msgSend(v4, "goalExpression");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[ACHTemplate setGoalExpression:](v5, "setGoalExpression:", v25);

    objc_msgSend(v4, "graceGoalExpression");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    -[ACHTemplate setGraceGoalExpression:](v5, "setGraceGoalExpression:", v27);

    -[ACHTemplate setTriggers:](v5, "setTriggers:", objc_msgSend(v4, "triggers"));
    -[ACHTemplate setEarnLimit:](v5, "setEarnLimit:", objc_msgSend(v4, "earnLimit"));
    objc_msgSend(v4, "visibilityPredicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    -[ACHTemplate setVisibilityPredicate:](v5, "setVisibilityPredicate:", v29);

    objc_msgSend(v4, "graceVisibilityPredicate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    -[ACHTemplate setGraceVisibilityPredicate:](v5, "setGraceVisibilityPredicate:", v31);

    objc_msgSend(v4, "visibilityStartDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setVisibilityStart:](v5, "setVisibilityStart:", v33);

    objc_msgSend(v4, "visibilityEndDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setVisibilityEnd:](v5, "setVisibilityEnd:", v35);

    objc_msgSend(v4, "availabilityPredicate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    -[ACHTemplate setAvailabilityPredicate:](v5, "setAvailabilityPredicate:", v37);

    objc_msgSend(v4, "availabilityStartDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAvailabilityStart:](v5, "setAvailabilityStart:", v39);

    objc_msgSend(v4, "availabilityEndDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAvailabilityEnd:](v5, "setAvailabilityEnd:", v41);

    objc_msgSend(v4, "availableCountryCodes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ACHTemplateAvailableCountryCodesFromString(v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAvailableCountryCodes:](v5, "setAvailableCountryCodes:", v44);

    objc_msgSend(v4, "alertabilityPredicate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "copy");
    -[ACHTemplate setAlertabilityPredicate:](v5, "setAlertabilityPredicate:", v46);

    objc_msgSend(v4, "alertDates");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    ACHTemplateAlertDatesFromString(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAlertDates:](v5, "setAlertDates:", v48);

    -[ACHTemplate setDuplicateRemovalStrategy:](v5, "setDuplicateRemovalStrategy:", objc_msgSend(v4, "duplicateRemovalStrategy"));
    -[ACHTemplate setDuplicateRemovalCalendarUnit:](v5, "setDuplicateRemovalCalendarUnit:", objc_msgSend(v4, "duplicateRemovalCalendarUnit"));
    -[ACHTemplate setEarnDateStrategy:](v5, "setEarnDateStrategy:", objc_msgSend(v4, "earnDateStrategy"));
    objc_msgSend(v4, "canonicalUnit");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = (void *)MEMORY[0x24BDD4048];
      objc_msgSend(v4, "canonicalUnit");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "unitFromString:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHTemplate setCanonicalUnit:](v5, "setCanonicalUnit:", v52);

    }
    else
    {
      -[ACHTemplate setCanonicalUnit:](v5, "setCanonicalUnit:", 0);
    }

    -[ACHTemplate setDisplayOrder:](v5, "setDisplayOrder:", objc_msgSend(v4, "displayOrder"));
    -[ACHTemplate setDisplaysEarnedInstanceCount:](v5, "setDisplaysEarnedInstanceCount:", objc_msgSend(v4, "displaysEarnedInstanceCount"));
    objc_msgSend(v4, "availableSuffixes");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    ACHTemplateAvailableSuffixesFromString(v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAvailableSuffixes:](v5, "setAvailableSuffixes:", v55);

    -[ACHTemplate setAvailableOnPairedDevice:](v5, "setAvailableOnPairedDevice:", objc_msgSend(v4, "availableOnPairedDevice"));
    -[ACHTemplate setMobileAssetVersion:](v5, "setMobileAssetVersion:", objc_msgSend(v4, "mobileAssetVersion"));
    objc_msgSend(v4, "dailyTarget");
    -[ACHTemplate setDailyTarget:](v5, "setDailyTarget:");
    objc_msgSend(v4, "dailyTargetCanonicalUnit");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v57 = (void *)MEMORY[0x24BDD4048];
      objc_msgSend(v4, "dailyTargetCanonicalUnit");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "unitFromString:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHTemplate setDailyTargetCanonicalUnit:](v5, "setDailyTargetCanonicalUnit:", v59);

    }
    else
    {
      -[ACHTemplate setDailyTargetCanonicalUnit:](v5, "setDailyTargetCanonicalUnit:", 0);
    }

    if (objc_msgSend(v4, "hasSyncIdentity"))
    {
      objc_msgSend(v4, "syncIdentity");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "hardwareIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "syncIdentity");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "databaseIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61 && v63)
      {
        objc_msgSend(v4, "syncIdentity");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "instanceDiscriminator");
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = (void *)v65;
        v67 = &stru_24D1281D8;
        if (v65)
          v67 = (__CFString *)v65;
        v68 = v67;

        v69 = -[ACHSyncIdentity initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:]([ACHSyncIdentity alloc], "initWithHardwareIdentifier:databaseIdentifier:instanceDiscriminator:", v61, v63, v68);
        -[ACHTemplate setSyncIdentity:](v5, "setSyncIdentity:", v69);
      }
      else
      {
        ACHLogTemplates();
        v69 = (ACHSyncIdentity *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v69->super, OS_LOG_TYPE_ERROR))
          -[ACHTemplate initWithCodable:].cold.1(&v69->super, v70, v71, v72, v73, v74, v75, v76);
      }

    }
    objc_msgSend(v4, "prerequisiteTemplateName");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setPrerequisiteTemplateName:](v5, "setPrerequisiteTemplateName:", v77);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
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
  unint64_t v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  void *v75;
  uint64_t v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  void *v85;
  int v86;
  int v87;
  unint64_t v88;
  int v89;
  int v90;
  unint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  int v95;
  void *v96;
  uint64_t v97;
  void *v98;
  int v99;
  int v100;
  unint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  int v105;
  void *v106;
  void *v107;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ACHTemplate key](self, "key");
    if (v6 != objc_msgSend(v5, "key"))
      goto LABEL_63;
    -[ACHTemplate uniqueName](self, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (!v9)
      goto LABEL_63;
    v10 = -[ACHTemplate version](self, "version");
    if (v10 != objc_msgSend(v5, "version"))
      goto LABEL_63;
    v11 = -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion");
    if (v11 != objc_msgSend(v5, "minimumEngineVersion"))
      goto LABEL_63;
    -[ACHTemplate createdDate](self, "createdDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v5, "createdDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = vabdd_f64(v14, v16);

    if (v17 > 1.0)
      goto LABEL_63;
    v18 = -[ACHTemplate creatorDevice](self, "creatorDevice");
    if (v18 != objc_msgSend(v5, "creatorDevice"))
      goto LABEL_63;
    -[ACHTemplate sourceName](self, "sourceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceName");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      v22 = objc_msgSend(v19, "isEqualToString:", v20);

      if (!v22)
        goto LABEL_63;
    }
    -[ACHTemplate predicate](self, "predicate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v24 == (void *)v25)
    {

    }
    else
    {
      v26 = (void *)v25;
      v27 = objc_msgSend(v24, "isEqualToString:", v25);

      if (!v27)
        goto LABEL_63;
    }
    -[ACHTemplate gracePredicate](self, "gracePredicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gracePredicate");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v28 == (void *)v29)
    {

    }
    else
    {
      v30 = (void *)v29;
      v31 = objc_msgSend(v28, "isEqualToString:", v29);

      if (!v31)
        goto LABEL_63;
    }
    -[ACHTemplate valueExpression](self, "valueExpression");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueExpression");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      v35 = objc_msgSend(v32, "isEqualToString:", v33);

      if (!v35)
        goto LABEL_63;
    }
    -[ACHTemplate graceValueExpression](self, "graceValueExpression");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "graceValueExpression");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v36 == (void *)v37)
    {

    }
    else
    {
      v38 = (void *)v37;
      v39 = objc_msgSend(v36, "isEqualToString:", v37);

      if (!v39)
        goto LABEL_63;
    }
    -[ACHTemplate progressExpression](self, "progressExpression");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "progressExpression");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      v43 = objc_msgSend(v40, "isEqualToString:", v41);

      if (!v43)
        goto LABEL_63;
    }
    -[ACHTemplate graceProgressExpression](self, "graceProgressExpression");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "graceProgressExpression");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v44 == (void *)v45)
    {

    }
    else
    {
      v46 = (void *)v45;
      v47 = objc_msgSend(v44, "isEqualToString:", v45);

      if (!v47)
        goto LABEL_63;
    }
    -[ACHTemplate goalExpression](self, "goalExpression");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "goalExpression");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v48 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      v51 = objc_msgSend(v48, "isEqualToString:", v49);

      if (!v51)
        goto LABEL_63;
    }
    -[ACHTemplate graceGoalExpression](self, "graceGoalExpression");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "graceGoalExpression");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v52 == (void *)v53)
    {

    }
    else
    {
      v54 = (void *)v53;
      v55 = objc_msgSend(v52, "isEqualToString:", v53);

      if (!v55)
        goto LABEL_63;
    }
    v56 = -[ACHTemplate triggers](self, "triggers");
    if (v56 != objc_msgSend(v5, "triggers"))
      goto LABEL_63;
    v57 = -[ACHTemplate earnLimit](self, "earnLimit");
    if (v57 != objc_msgSend(v5, "earnLimit"))
      goto LABEL_63;
    -[ACHTemplate visibilityPredicate](self, "visibilityPredicate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibilityPredicate");
    v59 = objc_claimAutoreleasedReturnValue();
    if (v58 == (void *)v59)
    {

    }
    else
    {
      v60 = (void *)v59;
      v61 = objc_msgSend(v58, "isEqualToString:", v59);

      if (!v61)
        goto LABEL_63;
    }
    -[ACHTemplate graceVisibilityPredicate](self, "graceVisibilityPredicate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "graceVisibilityPredicate");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v62 == (void *)v63)
    {

    }
    else
    {
      v64 = (void *)v63;
      v65 = objc_msgSend(v62, "isEqualToString:", v63);

      if (!v65)
        goto LABEL_63;
    }
    v66 = (uint64_t)-[ACHTemplate packedVisibilityStart](self, "packedVisibilityStart");
    if (((objc_msgSend(v5, "packedVisibilityStart") ^ v66) & 0x1FFFFFFFFLL) != 0)
      goto LABEL_63;
    v67 = (uint64_t)-[ACHTemplate packedVisibilityEnd](self, "packedVisibilityEnd");
    if (((objc_msgSend(v5, "packedVisibilityEnd") ^ v67) & 0x1FFFFFFFFLL) != 0)
      goto LABEL_63;
    -[ACHTemplate availabilityPredicate](self, "availabilityPredicate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availabilityPredicate");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v68 == (void *)v69)
    {

    }
    else
    {
      v70 = (void *)v69;
      v71 = objc_msgSend(v68, "isEqualToString:", v69);

      if (!v71)
        goto LABEL_63;
    }
    v72 = (uint64_t)-[ACHTemplate packedAvailabilityStart](self, "packedAvailabilityStart");
    if (((objc_msgSend(v5, "packedAvailabilityStart") ^ v72) & 0x1FFFFFFFFLL) != 0)
      goto LABEL_63;
    v73 = (uint64_t)-[ACHTemplate packedAvailabilityEnd](self, "packedAvailabilityEnd");
    if (((objc_msgSend(v5, "packedAvailabilityEnd") ^ v73) & 0x1FFFFFFFFLL) != 0)
      goto LABEL_63;
    -[ACHTemplate availableCountryCodes](self, "availableCountryCodes");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableCountryCodes");
    v76 = objc_claimAutoreleasedReturnValue();
    if (v75 == (void *)v76)
    {

    }
    else
    {
      v77 = (void *)v76;
      v78 = objc_msgSend(v75, "isEqual:", v76);

      if (!v78)
        goto LABEL_63;
    }
    -[ACHTemplate alertabilityPredicate](self, "alertabilityPredicate");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertabilityPredicate");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v79 == (void *)v80)
    {

    }
    else
    {
      v81 = (void *)v80;
      v82 = objc_msgSend(v79, "isEqualToString:", v80);

      if (!v82)
        goto LABEL_63;
    }
    -[ACHTemplate alertDates](self, "alertDates");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertDates");
    v84 = objc_claimAutoreleasedReturnValue();
    if (v83 == (void *)v84)
    {

    }
    else
    {
      v85 = (void *)v84;
      v86 = objc_msgSend(v83, "isEqual:", v84);

      if (!v86)
        goto LABEL_63;
    }
    v87 = -[ACHTemplate duplicateRemovalStrategy](self, "duplicateRemovalStrategy");
    if (v87 != objc_msgSend(v5, "duplicateRemovalStrategy"))
      goto LABEL_63;
    v88 = -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit");
    if (v88 != objc_msgSend(v5, "duplicateRemovalCalendarUnit"))
      goto LABEL_63;
    v89 = -[ACHTemplate earnDateStrategy](self, "earnDateStrategy");
    if (v89 != objc_msgSend(v5, "earnDateStrategy"))
      goto LABEL_63;
    v90 = -[ACHTemplate displaysEarnedInstanceCount](self, "displaysEarnedInstanceCount");
    if (v90 != objc_msgSend(v5, "displaysEarnedInstanceCount"))
      goto LABEL_63;
    v91 = -[ACHTemplate displayOrder](self, "displayOrder");
    if (v91 != objc_msgSend(v5, "displayOrder"))
      goto LABEL_63;
    -[ACHTemplate canonicalUnit](self, "canonicalUnit");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canonicalUnit");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v92 == (void *)v93)
    {

    }
    else
    {
      v94 = (void *)v93;
      v95 = objc_msgSend(v92, "isEqual:", v93);

      if (!v95)
        goto LABEL_63;
    }
    -[ACHTemplate availableSuffixes](self, "availableSuffixes");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableSuffixes");
    v97 = objc_claimAutoreleasedReturnValue();
    if (v96 == (void *)v97)
    {

    }
    else
    {
      v98 = (void *)v97;
      v99 = objc_msgSend(v96, "isEqual:", v97);

      if (!v99)
        goto LABEL_63;
    }
    v100 = -[ACHTemplate availableOnPairedDevice](self, "availableOnPairedDevice");
    if (v100 != objc_msgSend(v5, "availableOnPairedDevice"))
      goto LABEL_63;
    v101 = -[ACHTemplate mobileAssetVersion](self, "mobileAssetVersion");
    if (v101 != objc_msgSend(v5, "mobileAssetVersion"))
      goto LABEL_63;
    -[ACHTemplate dailyTarget](self, "dailyTarget");
    objc_msgSend(v5, "dailyTarget");
    if (HKCompareDoubles())
      goto LABEL_63;
    -[ACHTemplate dailyTargetCanonicalUnit](self, "dailyTargetCanonicalUnit");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dailyTargetCanonicalUnit");
    v103 = objc_claimAutoreleasedReturnValue();
    if (v102 == (void *)v103)
    {

LABEL_98:
      -[ACHTemplate prerequisiteTemplateName](self, "prerequisiteTemplateName");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prerequisiteTemplateName");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      if (v106 == v107)
        v23 = 1;
      else
        v23 = objc_msgSend(v106, "isEqual:", v107);

      goto LABEL_64;
    }
    v104 = (void *)v103;
    v105 = objc_msgSend(v102, "isEqual:", v103);

    if (v105)
      goto LABEL_98;
LABEL_63:
    v23 = 0;
LABEL_64:

    goto LABEL_65;
  }
  v23 = 0;
LABEL_65:

  return v23;
}

- (NSString)uniqueName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)key
{
  return self->_key;
}

- (NSString)prerequisiteTemplateName
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unsigned)earnLimit
{
  return self->_earnLimit;
}

- (HKUnit)canonicalUnit
{
  return (HKUnit *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)alertabilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)availabilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSArray)availableCountryCodes
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (unsigned)minimumEngineVersion
{
  return self->_minimumEngineVersion;
}

- (unsigned)earnDateStrategy
{
  return self->_earnDateStrategy;
}

- (unsigned)duplicateRemovalStrategy
{
  return self->_duplicateRemovalStrategy;
}

- (unint64_t)duplicateRemovalCalendarUnit
{
  return self->_duplicateRemovalCalendarUnit;
}

- (BOOL)displaysEarnedInstanceCount
{
  return self->_displaysEarnedInstanceCount;
}

- (unint64_t)displayOrder
{
  return self->_displayOrder;
}

- (double)dailyTarget
{
  return self->_dailyTarget;
}

- (HKUnit)dailyTargetCanonicalUnit
{
  return (HKUnit *)objc_getProperty(self, a2, 248, 1);
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (NSDate)createdDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSSet)alertDates
{
  return (NSSet *)objc_getProperty(self, a2, 192, 1);
}

- (unint64_t)mobileAssetVersion
{
  return self->_mobileAssetVersion;
}

- (NSArray)availableSuffixes
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)availableOnPairedDevice
{
  return self->_availableOnPairedDevice;
}

- (NSDateComponents)availabilityStart
{
  uint64_t v2;

  v2 = (uint64_t)-[ACHTemplate packedAvailabilityStart](self, "packedAvailabilityStart");
  if ((v2 & 0x100000000) == 0)
    return (NSDateComponents *)0;
  ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  return (NSDateComponents *)(id)objc_claimAutoreleasedReturnValue();
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedAvailabilityStart
{
  unsigned int dest;
  unsigned __int8 v4;

  objc_copyStruct(&dest, &self->_packedVisibilityEnd.day, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (NSDateComponents)availabilityEnd
{
  uint64_t v2;

  v2 = (uint64_t)-[ACHTemplate packedAvailabilityEnd](self, "packedAvailabilityEnd");
  if ((v2 & 0x100000000) == 0)
    return (NSDateComponents *)0;
  ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  return (NSDateComponents *)(id)objc_claimAutoreleasedReturnValue();
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedAvailabilityEnd
{
  unsigned int dest;
  unsigned __int8 v4;

  objc_copyStruct(&dest, &self->_packedAvailabilityStart.month, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (NSString)goalExpression
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)progressExpression
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)visibilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)graceProgressExpression
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)graceVisibilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)predicate
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)graceGoalExpression
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)valueExpression
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)graceValueExpression
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)gracePredicate
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (ACHSyncIdentity)syncIdentity
{
  return (ACHSyncIdentity *)objc_getProperty(self, a2, 256, 1);
}

- (void)setVisibilityStart:(id)a3
{
  id v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "year");
    v6 = objc_msgSend(v8, "month");
    v7 = v5 | ((unint64_t)v6 << 16) | (objc_msgSend(v8, "day") << 24) | 0x100000000;
  }
  else
  {
    v7 = 0;
  }
  -[ACHTemplate setPackedVisibilityStart:](self, "setPackedVisibilityStart:", v7);

}

- (void)setVisibilityPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)setVisibilityEnd:(id)a3
{
  id v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "year");
    v6 = objc_msgSend(v8, "month");
    v7 = v5 | ((unint64_t)v6 << 16) | (objc_msgSend(v8, "day") << 24) | 0x100000000;
  }
  else
  {
    v7 = 0;
  }
  -[ACHTemplate setPackedVisibilityEnd:](self, "setPackedVisibilityEnd:", v7);

}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void)setValueExpression:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setUniqueName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setTriggers:(unint64_t)a3
{
  self->_triggers = a3;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setProgressExpression:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setPrerequisiteTemplateName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setPackedVisibilityStart:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src;

  src = a3;
  objc_copyStruct(&self->_availableOnPairedDevice + 1, &src, 5, 1, 0);
}

- (void)setPackedVisibilityEnd:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src;

  src = a3;
  objc_copyStruct(&self->_packedVisibilityStart.valid, &src, 5, 1, 0);
}

- (void)setMobileAssetVersion:(unint64_t)a3
{
  self->_mobileAssetVersion = a3;
}

- (void)setMinimumEngineVersion:(unsigned __int8)a3
{
  self->_minimumEngineVersion = a3;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (void)setGraceVisibilityPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void)setGraceValueExpression:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setGraceProgressExpression:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setGracePredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setGraceGoalExpression:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setGoalExpression:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setEarnLimit:(unsigned __int8)a3
{
  self->_earnLimit = a3;
}

- (void)setEarnDateStrategy:(unsigned __int8)a3
{
  self->_earnDateStrategy = a3;
}

- (void)setDuplicateRemovalStrategy:(unsigned __int8)a3
{
  self->_duplicateRemovalStrategy = a3;
}

- (void)setDuplicateRemovalCalendarUnit:(unint64_t)a3
{
  self->_duplicateRemovalCalendarUnit = a3;
}

- (void)setDisplaysEarnedInstanceCount:(BOOL)a3
{
  self->_displaysEarnedInstanceCount = a3;
}

- (void)setDisplayOrder:(unint64_t)a3
{
  self->_displayOrder = a3;
}

- (void)setDailyTargetCanonicalUnit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void)setDailyTarget:(double)a3
{
  self->_dailyTarget = a3;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setCanonicalUnit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void)setAvailableSuffixes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void)setAvailableOnPairedDevice:(BOOL)a3
{
  self->_availableOnPairedDevice = a3;
}

- (void)setAvailableCountryCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setAvailabilityStart:(id)a3
{
  id v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "year");
    v6 = objc_msgSend(v8, "month");
    v7 = v5 | ((unint64_t)v6 << 16) | (objc_msgSend(v8, "day") << 24) | 0x100000000;
  }
  else
  {
    v7 = 0;
  }
  -[ACHTemplate setPackedAvailabilityStart:](self, "setPackedAvailabilityStart:", v7);

}

- (void)setPackedAvailabilityStart:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src;

  src = a3;
  objc_copyStruct(&self->_packedVisibilityEnd.day, &src, 5, 1, 0);
}

- (void)setAvailabilityPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void)setAvailabilityEnd:(id)a3
{
  id v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "year");
    v6 = objc_msgSend(v8, "month");
    v7 = v5 | ((unint64_t)v6 << 16) | (objc_msgSend(v8, "day") << 24) | 0x100000000;
  }
  else
  {
    v7 = 0;
  }
  -[ACHTemplate setPackedAvailabilityEnd:](self, "setPackedAvailabilityEnd:", v7);

}

- (void)setPackedAvailabilityEnd:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src;

  src = a3;
  objc_copyStruct(&self->_packedAvailabilityStart.month, &src, 5, 1, 0);
}

- (void)setAlertabilityPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void)setAlertDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
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

  v3 = -[ACHTemplate key](self, "key");
  -[ACHTemplate uniqueName](self, "uniqueName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v53, "hash");
  v5 = v4 ^ v3 ^ -[ACHTemplate version](self, "version");
  v6 = v5 ^ -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion");
  -[ACHTemplate createdDate](self, "createdDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v52, "hash");
  v8 = v6 ^ v7 ^ -[ACHTemplate creatorDevice](self, "creatorDevice");
  -[ACHTemplate sourceName](self, "sourceName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v51, "hash");
  -[ACHTemplate predicate](self, "predicate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v50, "hash");
  -[ACHTemplate gracePredicate](self, "gracePredicate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v49, "hash");
  -[ACHTemplate valueExpression](self, "valueExpression");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v11 ^ objc_msgSend(v48, "hash");
  -[ACHTemplate graceValueExpression](self, "graceValueExpression");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v47, "hash");
  -[ACHTemplate progressExpression](self, "progressExpression");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 ^ objc_msgSend(v46, "hash");
  -[ACHTemplate graceProgressExpression](self, "graceProgressExpression");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v45, "hash");
  -[ACHTemplate goalExpression](self, "goalExpression");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v44, "hash");
  -[ACHTemplate graceGoalExpression](self, "graceGoalExpression");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12 ^ v16 ^ objc_msgSend(v43, "hash");
  v18 = -[ACHTemplate triggers](self, "triggers");
  v19 = v18 ^ -[ACHTemplate earnLimit](self, "earnLimit");
  -[ACHTemplate visibilityPredicate](self, "visibilityPredicate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 ^ objc_msgSend(v42, "hash");
  -[ACHTemplate graceVisibilityPredicate](self, "graceVisibilityPredicate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[ACHTemplate alertabilityPredicate](self, "alertabilityPredicate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17 ^ v22 ^ objc_msgSend(v23, "hash");
  -[ACHTemplate alertDates](self, "alertDates");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hash");
  v27 = v26 ^ -[ACHTemplate duplicateRemovalStrategy](self, "duplicateRemovalStrategy");
  v28 = v27 ^ -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit");
  v29 = v28 ^ -[ACHTemplate earnDateStrategy](self, "earnDateStrategy");
  v30 = v29 ^ -[ACHTemplate displayOrder](self, "displayOrder");
  v31 = v24 ^ v30 ^ -[ACHTemplate displaysEarnedInstanceCount](self, "displaysEarnedInstanceCount");
  -[ACHTemplate canonicalUnit](self, "canonicalUnit");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hash");
  -[ACHTemplate dailyTargetCanonicalUnit](self, "dailyTargetCanonicalUnit");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33 ^ objc_msgSend(v34, "hash");
  v36 = (void *)MEMORY[0x24BDD16E0];
  -[ACHTemplate dailyTarget](self, "dailyTarget");
  objc_msgSend(v36, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v35 ^ objc_msgSend(v37, "hash");
  -[ACHTemplate prerequisiteTemplateName](self, "prerequisiteTemplateName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v31 ^ v38 ^ objc_msgSend(v39, "hash");

  return v40;
}

- (NSDateComponents)visibilityStart
{
  uint64_t v2;

  v2 = (uint64_t)-[ACHTemplate packedVisibilityStart](self, "packedVisibilityStart");
  if ((v2 & 0x100000000) == 0)
    return (NSDateComponents *)0;
  ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  return (NSDateComponents *)(id)objc_claimAutoreleasedReturnValue();
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedVisibilityStart
{
  unsigned int dest;
  unsigned __int8 v4;

  objc_copyStruct(&dest, &self->_availableOnPairedDevice + 1, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (NSDateComponents)visibilityEnd
{
  uint64_t v2;

  v2 = (uint64_t)-[ACHTemplate packedVisibilityEnd](self, "packedVisibilityEnd");
  if ((v2 & 0x100000000) == 0)
    return (NSDateComponents *)0;
  ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  return (NSDateComponents *)(id)objc_claimAutoreleasedReturnValue();
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedVisibilityEnd
{
  unsigned int dest;
  unsigned __int8 v4;

  objc_copyStruct(&dest, &self->_packedVisibilityStart.valid, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (NSString)sourceName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerequisiteTemplateName, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_dailyTargetCanonicalUnit, 0);
  objc_storeStrong((id *)&self->_availableSuffixes, 0);
  objc_storeStrong((id *)&self->_canonicalUnit, 0);
  objc_storeStrong((id *)&self->_alertDates, 0);
  objc_storeStrong((id *)&self->_alertabilityPredicate, 0);
  objc_storeStrong((id *)&self->_availableCountryCodes, 0);
  objc_storeStrong((id *)&self->_availabilityPredicate, 0);
  objc_storeStrong((id *)&self->_graceVisibilityPredicate, 0);
  objc_storeStrong((id *)&self->_visibilityPredicate, 0);
  objc_storeStrong((id *)&self->_graceGoalExpression, 0);
  objc_storeStrong((id *)&self->_goalExpression, 0);
  objc_storeStrong((id *)&self->_graceProgressExpression, 0);
  objc_storeStrong((id *)&self->_progressExpression, 0);
  objc_storeStrong((id *)&self->_graceValueExpression, 0);
  objc_storeStrong((id *)&self->_valueExpression, 0);
  objc_storeStrong((id *)&self->_gracePredicate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
}

- (ACHTemplate)init
{
  ACHTemplate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACHTemplate;
  result = -[ACHTemplate init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)((char *)&result->_packedVisibilityEnd.year + 1) = 0;
    *(_QWORD *)(&result->_availableOnPairedDevice + 1) = 0;
    *(_DWORD *)&result->_packedAvailabilityStart.day = 0;
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  unsigned __int8 v35;
  __CFString *v36;
  int v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  objc_super v46;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v46.receiver = self;
  v46.super_class = (Class)ACHTemplate;
  -[ACHTemplate description](&v46, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("(Key: %lu\n"), -[ACHTemplate key](self, "key"));
  -[ACHTemplate uniqueName](self, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Unique Name: %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("Version: %lu\n"), -[ACHTemplate version](self, "version"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Minimum Engine Version: %lu\n"), -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion"));
  -[ACHTemplate createdDate](self, "createdDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Created Date (MM-dd-yyyy HH:mm:ss): %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("Creator Device [1 = Watch, 2= Phone]: %lu\n"), -[ACHTemplate creatorDevice](self, "creatorDevice"));
  -[ACHTemplate sourceName](self, "sourceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Source Name: %@\n"), v7);

  -[ACHTemplate predicate](self, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Predicate: %@\n"), v8);

  -[ACHTemplate gracePredicate](self, "gracePredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Grace Predicate: %@\n"), v9);

  -[ACHTemplate valueExpression](self, "valueExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Value Expression: %@\n"), v10);

  -[ACHTemplate graceValueExpression](self, "graceValueExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Grace Value Expression: %@\n"), v11);

  -[ACHTemplate progressExpression](self, "progressExpression");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Progress Expression: %@\n"), v12);

  -[ACHTemplate graceProgressExpression](self, "graceProgressExpression");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Grace Progress Expression: %@\n"), v13);

  -[ACHTemplate goalExpression](self, "goalExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Goal Expression: %@\n"), v14);

  -[ACHTemplate graceGoalExpression](self, "graceGoalExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Grace Goal Expression: %@\n"), v15);

  -[ACHTemplate dailyTarget](self, "dailyTarget");
  objc_msgSend(v3, "appendFormat:", CFSTR("dailyTarget: %f\n"), v16);
  -[ACHTemplate dailyTargetCanonicalUnit](self, "dailyTargetCanonicalUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dailyTargetUnit: %@\n"), v17);

  ACHTriggerOptionsToString(-[ACHTemplate triggers](self, "triggers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Triggers: %@\n"), v18);

  objc_msgSend(v3, "appendFormat:", CFSTR("Earn Limit: %lu\n"), -[ACHTemplate earnLimit](self, "earnLimit"));
  -[ACHTemplate visibilityPredicate](self, "visibilityPredicate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Visibility Predicate: %@\n"), v19);

  -[ACHTemplate graceVisibilityPredicate](self, "graceVisibilityPredicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Grace Visibility Predicate: %@\n"), v20);

  -[ACHTemplate visibilityStart](self, "visibilityStart");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Visibility Start (YYYY-MM-dd): %@\n"), v22);

  -[ACHTemplate visibilityEnd](self, "visibilityEnd");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Visibility End (YYYY-MM-dd): %@\n"), v24);

  -[ACHTemplate availabilityPredicate](self, "availabilityPredicate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Availability Predicate: %@\n"), v25);

  -[ACHTemplate availabilityStart](self, "availabilityStart");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Availability Start (YYYY-MM-dd): %@\n"), v27);

  -[ACHTemplate availabilityEnd](self, "availabilityEnd");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Availability End (YYYY-MM-dd): %@\n"), v29);

  -[ACHTemplate availableCountryCodes](self, "availableCountryCodes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate _displayStringForStringValues:](self, "_displayStringForStringValues:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Available Countries: %@\n"), v31);

  -[ACHTemplate alertabilityPredicate](self, "alertabilityPredicate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Alertability Predicate: %@\n"), v32);

  -[ACHTemplate alertDates](self, "alertDates");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate _displayStringForAlertDates:](self, "_displayStringForAlertDates:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Alert Dates (YYYY-MM-dd): %@\n"), v34);

  v35 = -[ACHTemplate duplicateRemovalStrategy](self, "duplicateRemovalStrategy") - 1;
  if (v35 > 3u)
    v36 = 0;
  else
    v36 = off_24D1276A8[(char)v35];
  objc_msgSend(v3, "appendFormat:", CFSTR("Duplicate Removal Strategy: %@\n"), v36);
  objc_msgSend(v3, "appendFormat:", CFSTR("Duplicate Removal Calendar Unit: %ld\n"), -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit"));
  v37 = -[ACHTemplate earnDateStrategy](self, "earnDateStrategy");
  v38 = CFSTR("Current Date");
  if (v37 != 1)
    v38 = 0;
  if (v37 == 2)
    v38 = CFSTR("Yesterday");
  objc_msgSend(v3, "appendFormat:", CFSTR("Earn Date Strategy: %@\n"), v38);
  -[ACHTemplate canonicalUnit](self, "canonicalUnit");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Canonical Unit: %@\n"), v39);

  objc_msgSend(v3, "appendFormat:", CFSTR("Display Order: %lu\n"), -[ACHTemplate displayOrder](self, "displayOrder"));
  if (-[ACHTemplate displaysEarnedInstanceCount](self, "displaysEarnedInstanceCount"))
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Displays Earned Instance Count: %@\n"), v40);
  -[ACHTemplate availableSuffixes](self, "availableSuffixes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate _displayStringForStringValues:](self, "_displayStringForStringValues:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Available Suffixes: %@\n"), v42);

  if (-[ACHTemplate availableOnPairedDevice](self, "availableOnPairedDevice"))
    v43 = CFSTR("YES");
  else
    v43 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Available On Paired Device: %@\n"), v43);
  objc_msgSend(v3, "appendFormat:", CFSTR("Mobile Asset Version: %lu\n"), -[ACHTemplate mobileAssetVersion](self, "mobileAssetVersion"));
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  v44 = (void *)objc_msgSend(v3, "copy");

  return v44;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  unsigned __int8 v35;
  __CFString *v36;
  int v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  objc_super v46;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v46.receiver = self;
  v46.super_class = (Class)ACHTemplate;
  -[ACHTemplate description](&v46, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("(key: %lu\n"), -[ACHTemplate key](self, "key"));
  -[ACHTemplate uniqueName](self, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("uniqueName: %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("version: %lu\n"), -[ACHTemplate version](self, "version"));
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumEngineVersion: %lu\n"), -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion"));
  -[ACHTemplate createdDate](self, "createdDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("createdDate (MM-dd-yyyy HH:mm:ss): %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("creatorDevice [1 = Watch, 2= Phone]: %lu\n"), -[ACHTemplate creatorDevice](self, "creatorDevice"));
  -[ACHTemplate sourceName](self, "sourceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sourceName: %@\n"), v7);

  -[ACHTemplate predicate](self, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("predicate: %@\n"), v8);

  -[ACHTemplate gracePredicate](self, "gracePredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("gracePredicate: %@\n"), v9);

  -[ACHTemplate valueExpression](self, "valueExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("valueExpression: %@\n"), v10);

  -[ACHTemplate graceValueExpression](self, "graceValueExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("graceValueExpression: %@\n"), v11);

  -[ACHTemplate progressExpression](self, "progressExpression");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("progressExpression: %@\n"), v12);

  -[ACHTemplate graceProgressExpression](self, "graceProgressExpression");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("graceProgressExpression: %@\n"), v13);

  -[ACHTemplate goalExpression](self, "goalExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("goalExpression: %@\n"), v14);

  -[ACHTemplate graceGoalExpression](self, "graceGoalExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("graceGoalExpression: %@\n"), v15);

  -[ACHTemplate dailyTarget](self, "dailyTarget");
  objc_msgSend(v3, "appendFormat:", CFSTR("dailyTarget: %f\n"), v16);
  -[ACHTemplate dailyTargetCanonicalUnit](self, "dailyTargetCanonicalUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dailyTargetUnit: %@\n"), v17);

  ACHTriggerOptionsToString(-[ACHTemplate triggers](self, "triggers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("triggers: %@\n"), v18);

  objc_msgSend(v3, "appendFormat:", CFSTR("earnLimit: %lu\n"), -[ACHTemplate earnLimit](self, "earnLimit"));
  -[ACHTemplate visibilityPredicate](self, "visibilityPredicate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("visibilityPredicate: %@\n"), v19);

  -[ACHTemplate graceVisibilityPredicate](self, "graceVisibilityPredicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("graceVisibilityPredicate: %@\n"), v20);

  -[ACHTemplate visibilityStart](self, "visibilityStart");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("visibilityStart (YYYY-MM-dd): %@\n"), v22);

  -[ACHTemplate visibilityEnd](self, "visibilityEnd");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("visibilityEnd (YYYY-MM-dd): %@\n"), v24);

  -[ACHTemplate availabilityPredicate](self, "availabilityPredicate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availabilityPredicate: %@\n"), v25);

  -[ACHTemplate availabilityStart](self, "availabilityStart");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availabilityStart (YYYY-MM-dd): %@\n"), v27);

  -[ACHTemplate availabilityEnd](self, "availabilityEnd");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availabilityEnd (YYYY-MM-dd): %@\n"), v29);

  -[ACHTemplate availableCountryCodes](self, "availableCountryCodes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate _displayStringForStringValues:](self, "_displayStringForStringValues:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availableCountryCodes: %@\n"), v31);

  -[ACHTemplate alertabilityPredicate](self, "alertabilityPredicate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("alertabilityPredicate: %@\n"), v32);

  -[ACHTemplate alertDates](self, "alertDates");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate _displayStringForAlertDates:](self, "_displayStringForAlertDates:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("alertDates (YYYY-MM-dd): %@\n"), v34);

  v35 = -[ACHTemplate duplicateRemovalStrategy](self, "duplicateRemovalStrategy") - 1;
  if (v35 > 3u)
    v36 = 0;
  else
    v36 = off_24D1276A8[(char)v35];
  objc_msgSend(v3, "appendFormat:", CFSTR("duplicateRemovalStrategy: %@\n"), v36);
  objc_msgSend(v3, "appendFormat:", CFSTR("duplicateRemovalCalendarUnit: %ld\n"), -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit"));
  v37 = -[ACHTemplate earnDateStrategy](self, "earnDateStrategy");
  v38 = CFSTR("Current Date");
  if (v37 != 1)
    v38 = 0;
  if (v37 == 2)
    v38 = CFSTR("Yesterday");
  objc_msgSend(v3, "appendFormat:", CFSTR("earnDateStrategy: %@\n"), v38);
  -[ACHTemplate canonicalUnit](self, "canonicalUnit");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("canonicalUnit: %@\n"), v39);

  objc_msgSend(v3, "appendFormat:", CFSTR("displayOrder: %lu\n"), -[ACHTemplate displayOrder](self, "displayOrder"));
  if (-[ACHTemplate displaysEarnedInstanceCount](self, "displaysEarnedInstanceCount"))
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("displaysEarnedInstanceCount: %@\n"), v40);
  -[ACHTemplate availableSuffixes](self, "availableSuffixes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate _displayStringForStringValues:](self, "_displayStringForStringValues:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availableSuffixes: %@\n"), v42);

  if (-[ACHTemplate availableOnPairedDevice](self, "availableOnPairedDevice"))
    v43 = CFSTR("YES");
  else
    v43 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("availableOnPairedDevice: %@\n"), v43);
  objc_msgSend(v3, "appendFormat:", CFSTR("mobileAssetVersion: %lu\n"), -[ACHTemplate mobileAssetVersion](self, "mobileAssetVersion"));
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  v44 = (void *)objc_msgSend(v3, "copy");

  return v44;
}

- (id)_displayStringForAlertDates:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate _displayStringForStringValues:](self, "_displayStringForStringValues:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __43__ACHTemplate__displayStringForAlertDates___block_invoke(uint64_t a1, void *a2)
{
  return ACHYearMonthDayStringFromDateComponents(a2);
}

- (id)_displayStringForStringValues:(id)a3
{
  void *v3;
  void *v4;

  ACHTemplateStringFromStrings(a3, CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{ %@ }"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setKey:", -[ACHTemplate key](self, "key"));
  -[ACHTemplate uniqueName](self, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setUniqueName:", v7);

  objc_msgSend(v5, "setVersion:", -[ACHTemplate version](self, "version"));
  objc_msgSend(v5, "setMinimumEngineVersion:", -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion"));
  -[ACHTemplate createdDate](self, "createdDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setCreatedDate:", v9);

  objc_msgSend(v5, "setCreatorDevice:", -[ACHTemplate creatorDevice](self, "creatorDevice"));
  -[ACHTemplate sourceName](self, "sourceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setSourceName:", v11);

  -[ACHTemplate predicate](self, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setPredicate:", v13);

  -[ACHTemplate gracePredicate](self, "gracePredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setGracePredicate:", v15);

  -[ACHTemplate valueExpression](self, "valueExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setValueExpression:", v17);

  -[ACHTemplate graceValueExpression](self, "graceValueExpression");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setGraceValueExpression:", v19);

  -[ACHTemplate progressExpression](self, "progressExpression");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setProgressExpression:", v21);

  -[ACHTemplate graceProgressExpression](self, "graceProgressExpression");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setGraceProgressExpression:", v23);

  -[ACHTemplate goalExpression](self, "goalExpression");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v5, "setGoalExpression:", v25);

  -[ACHTemplate graceGoalExpression](self, "graceGoalExpression");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v5, "setGraceGoalExpression:", v27);

  objc_msgSend(v5, "setTriggers:", -[ACHTemplate triggers](self, "triggers"));
  objc_msgSend(v5, "setEarnLimit:", -[ACHTemplate earnLimit](self, "earnLimit"));
  -[ACHTemplate visibilityPredicate](self, "visibilityPredicate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
  objc_msgSend(v5, "setVisibilityPredicate:", v29);

  -[ACHTemplate graceVisibilityPredicate](self, "graceVisibilityPredicate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
  objc_msgSend(v5, "setGraceVisibilityPredicate:", v31);

  objc_msgSend(v5, "setPackedVisibilityStart:", -[ACHTemplate packedVisibilityStart](self, "packedVisibilityStart") & 0xFFFFFFFFFFLL);
  objc_msgSend(v5, "setPackedVisibilityEnd:", -[ACHTemplate packedVisibilityEnd](self, "packedVisibilityEnd") & 0xFFFFFFFFFFLL);
  -[ACHTemplate availabilityPredicate](self, "availabilityPredicate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copyWithZone:", a3);
  objc_msgSend(v5, "setAvailabilityPredicate:", v33);

  objc_msgSend(v5, "setPackedAvailabilityStart:", -[ACHTemplate packedAvailabilityStart](self, "packedAvailabilityStart") & 0xFFFFFFFFFFLL);
  objc_msgSend(v5, "setPackedAvailabilityEnd:", -[ACHTemplate packedAvailabilityEnd](self, "packedAvailabilityEnd") & 0xFFFFFFFFFFLL);
  -[ACHTemplate availableCountryCodes](self, "availableCountryCodes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "copyWithZone:", a3);
  objc_msgSend(v5, "setAvailableCountryCodes:", v35);

  -[ACHTemplate alertabilityPredicate](self, "alertabilityPredicate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlertabilityPredicate:", v37);

  -[ACHTemplate alertDates](self, "alertDates");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlertDates:", v39);

  objc_msgSend(v5, "setDuplicateRemovalStrategy:", -[ACHTemplate duplicateRemovalStrategy](self, "duplicateRemovalStrategy"));
  objc_msgSend(v5, "setDuplicateRemovalCalendarUnit:", -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit"));
  objc_msgSend(v5, "setEarnDateStrategy:", -[ACHTemplate earnDateStrategy](self, "earnDateStrategy"));
  -[ACHTemplate canonicalUnit](self, "canonicalUnit");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copyWithZone:", a3);
  objc_msgSend(v5, "setCanonicalUnit:", v41);

  objc_msgSend(v5, "setDisplayOrder:", -[ACHTemplate displayOrder](self, "displayOrder"));
  objc_msgSend(v5, "setDisplaysEarnedInstanceCount:", -[ACHTemplate displaysEarnedInstanceCount](self, "displaysEarnedInstanceCount"));
  -[ACHTemplate availableSuffixes](self, "availableSuffixes");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAvailableSuffixes:", v42);

  objc_msgSend(v5, "setAvailableOnPairedDevice:", -[ACHTemplate availableOnPairedDevice](self, "availableOnPairedDevice"));
  objc_msgSend(v5, "setMobileAssetVersion:", -[ACHTemplate mobileAssetVersion](self, "mobileAssetVersion"));
  -[ACHTemplate dailyTarget](self, "dailyTarget");
  objc_msgSend(v5, "setDailyTarget:");
  -[ACHTemplate dailyTargetCanonicalUnit](self, "dailyTargetCanonicalUnit");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDailyTargetCanonicalUnit:", v43);

  -[ACHTemplate prerequisiteTemplateName](self, "prerequisiteTemplateName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copyWithZone:", a3);
  objc_msgSend(v5, "setPrerequisiteTemplateName:", v45);

  return v5;
}

- (BOOL)_isValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate uniqueName](self, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "length"))
  {
    v6 = 1;
  }
  else
  {
    ACHLogTemplates();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACHTemplate _isValid].cold.5((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    v6 = 0;
  }
  -[ACHTemplate predicate](self, "predicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (objc_msgSend(v15, "length"))
      goto LABEL_14;
    ACHLogTemplates();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACHTemplate _isValid].cold.4(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  else
  {
    ACHLogTemplates();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACHTemplate _isValid].cold.3(v16, v24, v25, v26, v27, v28, v29, v30);
  }

  v6 = 0;
LABEL_14:
  v31 = -[ACHTemplate duplicateRemovalStrategy](self, "duplicateRemovalStrategy");
  if ((v31 - 5) <= 0xFBu)
  {
    v32 = v31;
    ACHLogTemplates();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ACHTemplate _isValid].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);

    v6 = 0;
  }
  v40 = -[ACHTemplate earnDateStrategy](self, "earnDateStrategy");
  if ((v40 - 3) <= 0xFDu)
  {
    v41 = v40;
    ACHLogTemplates();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[ACHTemplate _isValid].cold.1(v41, v42, v43, v44, v45, v46, v47, v48);

    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHTemplate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  ACHCodableTemplate *v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = -[ACHCodableTemplate initWithData:]([ACHCodableTemplate alloc], "initWithData:", v8);
    if (v9)
    {
      self = -[ACHTemplate initWithCodable:](self, "initWithCodable:", v9);

      v9 = (ACHCodableTemplate *)self;
    }
  }
  else
  {
    v9 = 0;
  }

  return (ACHTemplate *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v8 = a3;
  ACHCodableFromTemplate(self);
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

- (void)setSyncIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void)_isValid
{
  OUTLINED_FUNCTION_0_1(&dword_214029000, a2, a3, "Invalid template unique name: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCodable:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_214029000, a1, a3, "Unable to decode sync identity.", a5, a6, a7, a8, 0);
}

@end
