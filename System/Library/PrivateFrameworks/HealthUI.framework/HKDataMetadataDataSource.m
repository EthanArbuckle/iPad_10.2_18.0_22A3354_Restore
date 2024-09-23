@implementation HKDataMetadataDataSource

- (HKDataMetadataDataSource)initWithSample:(id)a3 unitPreferenceController:(id)a4
{
  id v6;
  id v7;
  HKDataMetadataDataSource *v8;
  uint64_t v9;
  HKSample *sample;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKDataMetadataDataSource;
  v8 = -[HKDataMetadataDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sample = v8->_sample;
    v8->_sample = (HKSample *)v9;

    objc_storeStrong((id *)&v8->_unitPreferenceController, a4);
  }

  return v8;
}

- (void)addDetailValuesToSection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKSample metadata](self->_sample, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HKDataMetadataDataSource_addDetailValuesToSection___block_invoke;
  v7[3] = &unk_1E9C46148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __53__HKDataMetadataDataSource_addDetailValuesToSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  const __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  __CFString *v114;
  __CFString *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  int v135;
  __CFString *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  const __CFString *v150;
  void *v151;
  void *v152;
  const __CFString *v153;
  const __CFString *v154;
  const __CFString *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  HKWorkoutDurationNumberFormatter *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  int v181;
  __CFString *v182;
  __CFString *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  const __CFString *v195;
  void *v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  __CFString *v207;
  uint64_t v208;
  _QWORD v209[2];
  _QWORD v210[2];
  _QWORD v211[2];
  _QWORD v212[2];
  _QWORD v213[2];
  _QWORD v214[2];
  _QWORD v215[4];

  v215[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (MACancelDownloadErrorDomain_block_invoke_onceToken != -1)
    dispatch_once(&MACancelDownloadErrorDomain_block_invoke_onceToken, &__block_literal_global_83);
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5550]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HEART_RATE_SENSOR_LOCATION_%@"), v6);
LABEL_7:
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = (void *)v9;
LABEL_9:

LABEL_10:
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54D0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BODY_TEMP_SENSOR_LOCATION_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55E0]))
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v10 = 0;
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "isDaylightSavingTimeForDate:", v18);

    if (v19)
      v20 = 2;
    else
      v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName:locale:", v20, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5618]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HK_WEATHER_CONDITION_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5628]))
  {
    _HKWeatherTemperatureUnit();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeFahrenheitUnit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v7, "isEqual:", v21);
    v23 = CFSTR("DEGREES_CELSIUS_NUMBERED_UNIT");
    if (v22)
      v23 = CFSTR("DEGREES_FAHRENHEIT_NUMBERED_UNIT");
    v8 = v23;

    if (!objc_msgSend(v6, "isCompatibleWithUnit:", v7))
    {
      v10 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v6, "doubleValueForUnit:", v7);
    v25 = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForNumberWithDecimalPrecision(v26, 2, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", v8, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v30, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormatValueAndUnit(v27, v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5620]))
  {
    objc_msgSend(v6, "_unit");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v32);
    v34 = v33;

    HKIntegerFormatter();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringFromNumber:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("PERCENT_NUMBERED_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@%@"), v37, v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5568]))
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v6, "isCompatibleWithUnit:", v41);

    if (v42)
    {
      v43 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(*(id *)(a1 + 40), "displayTypeController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "unitController");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "hk_localizedStringForAssociatedDistanceQuantity:displayTypeController:unitController:", v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_79;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55C0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SWIMMING_LOCATION_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55C8]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SWIMMING_STROKE_STYLE_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5560]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSULIN_DELIVERY_REASON_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54C8]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MEAL_TIME_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55F0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VO2_MAX_TEST_TYPE_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54B0]))
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kcal/(kg*hr)"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v44);
    v46 = v45;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForNumberWithDecimalPrecision(v7, 1, 0);
    v47 = objc_claimAutoreleasedReturnValue();
LABEL_52:
    v10 = (void *)v47;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5578]))
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("lx"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v48);
    v50 = v49;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "healthStore");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "displayTypeWithIdentifier:", &unk_1E9CED2B0);
    v204 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValue(v53, v204, *(void **)(*(_QWORD *)(a1 + 32) + 16), 0, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("MAXIMUM_LIGHT_INTENSITY_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormatValueAndUnit(v54, v56);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("MAXIMUM_LIGHT_INTENSITY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v58 = objc_claimAutoreleasedReturnValue();

LABEL_55:
    v11 = 0;
    v5 = (id)v58;
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5520]) & 1) != 0)
  {
LABEL_57:
    v10 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5470]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    v61 = CFSTR("ACTIVITY_TYPE");
    v62 = CFSTR("HealthUI-Localizable");
    goto LABEL_60;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5590]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = CFSTR("HealthUI-Localizable");
    objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("PHYSICAL_EFFORT_ESTIMATION_TYPE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v58 = objc_claimAutoreleasedReturnValue();

    v67 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PHYSICAL_EFFORT_ESTIMATION_%ld"), v67);
LABEL_68:
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "localizedStringForKey:value:table:", v70, &stru_1E9C4C428, v66);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_69:
    goto LABEL_55;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54E0]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = CFSTR("HealthUI-Localizable");
    objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("CYCLING_FUNCTIONAL_THRESHOLD_POWER_TEST_TYPE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v58 = objc_claimAutoreleasedReturnValue();

    v69 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CYCLING_FUNCTIONAL_THRESHOLD_POWER_TEST_%ld"), v69);
    goto LABEL_68;
  }
  v72 = *MEMORY[0x1E0CB5528];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5528]))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "metadata");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = *MEMORY[0x1E0CB7298];
    objc_msgSend(v73, "objectForKey:", *MEMORY[0x1E0CB7298]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v13)
    {
      objc_msgSend(v75, "localizedStringForKey:value:table:", v74, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HEART_RATE_CONTEXT_%@"), v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v13, "integerValue");
      if (v77 == 9)
      {
        v205 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Cinnamon"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        HKConditionallyRedactedHeartRhythmString();
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v214[0] = v72;
        v214[1] = CFSTR("StreamingECG");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v214, 2);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        HKUIJoinStringsForAutomationIdentifier(v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "addText:detail:baseIdentifier:", v94, v15, v96);

LABEL_94:
        v10 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v78 = *(void **)(a1 + 40);
      if (v77 == 10)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v215[0] = v72;
        v215[1] = CFSTR("OxygenSaturation");
        v81 = (void *)MEMORY[0x1E0C99D20];
        v82 = v215;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v213[0] = v72;
        v213[1] = CFSTR("HeartRateContext");
        v81 = (void *)MEMORY[0x1E0C99D20];
        v82 = v213;
      }
    }
    else
    {
      objc_msgSend(v75, "localizedStringForKey:value:table:", v72, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HEART_RATE_MOTION_CONTEXT_%@"), v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v212[0] = v72;
      v212[1] = CFSTR("Sample");
      v81 = (void *)MEMORY[0x1E0C99D20];
      v82 = v212;
    }
    objc_msgSend(v81, "arrayWithObjects:count:", v82, 2);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addText:detail:baseIdentifier:", v80, v15, v95);
    goto LABEL_94;
  }
  v83 = *MEMORY[0x1E0CB7230];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7230]))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mediaSourceDisplayNamesForSample:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v87 = *(void **)(a1 + 40);
      v211[0] = v83;
      v211[1] = CFSTR("Sample");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 2);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier(v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "addText:detail:baseIdentifier:", v84, v86, v89);

    }
    goto LABEL_79;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55D0]) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55D8])))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sourceRevision");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "source");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "_hasFirstPartyBundleID");

    if ((v92 & 1) != 0)
      goto LABEL_57;
    goto LABEL_79;
  }
  if (objc_msgSend((id)MACancelDownloadErrorDomain_block_invoke___metadataKeysExpectingBoolean, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
      v93 = CFSTR("YES");
    else
      v93 = CFSTR("NO");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v93, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v47 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54A8]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = (void *)MEMORY[0x1E0CB6CD0];
      v98 = v6;
      objc_msgSend(v97, "decibelAWeightedSoundPressureLevelUnit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "doubleValueForUnit:", v7);
      v100 = v99;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "healthStore");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "displayTypeWithIdentifier:", &unk_1E9CED2C8);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v100);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      HKFormattedStringFromValue(v103, v8, *(void **)(*(_QWORD *)(a1 + 32) + 16), 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("SPL_DECIBEL_UNIT_LONG_FORM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();

      HKFormatValueAndUnit(v27, v105);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
      goto LABEL_9;
    }
  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54F8]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5500]))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "healthStore");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "displayTypeWithIdentifier:", &unk_1E9CED2E0);
    v108 = objc_claimAutoreleasedReturnValue();

    v206 = (void *)v108;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unitForDisplayType:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v109, "isEqual:", v110) & 1) != 0)
      objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
    else
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v109, "isEqual:", v112);
    v114 = CFSTR("METERS_NUMBERLESS_UNIT");
    if (v113)
      v114 = CFSTR("FEET_NUMBERLESS_UNIT");
    v115 = v114;

    if (objc_msgSend(v6, "isCompatibleWithUnit:", v111))
    {
      objc_msgSend(v6, "doubleValueForUnit:", v111);
      v117 = v116;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      HKLocalizedStringForNumberWithDecimalPrecision(v118, 2, 0);
      v201 = (void *)objc_claimAutoreleasedReturnValue();

      v119 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "localizedStringForKey:value:table:", v115, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "localizedStringWithFormat:", v121, v117);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      HKFormatValueAndUnit(v201, v122);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    goto LABEL_11;
  }
  v123 = *MEMORY[0x1E0CB7260];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7260]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BLOOD_OXYGEN_CONTEXT_%@"), v6);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "localizedStringForKey:value:table:", v125, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    v129 = *(void **)(a1 + 40);
    v210[0] = v123;
    v210[1] = CFSTR("Sample");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v210, 2);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "addText:detail:baseIdentifier:", v126, v128, v131);

    goto LABEL_79;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54C0]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v132 = v6;
      _HKBarometricPressureUnit();
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "inchesOfMercuryUnit");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend(v133, "isEqual:", v134);

      v136 = CFSTR("HECTOPASCALS_NUMBERED_UNIT");
      if (v135)
        v136 = CFSTR("INCHES_OF_MERCURY_NUMBERED_UNIT");
      v207 = v136;
      v11 = objc_msgSend(v132, "isCompatibleWithUnit:", v133);
      if (v11)
      {
        if (v135)
          v137 = 2;
        else
          v137 = 0;
        objc_msgSend(v132, "doubleValueForUnit:", v133);
        v139 = v138;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        HKLocalizedStringForNumberWithDecimalPrecision(v140, v137, 0);
        v202 = (void *)objc_claimAutoreleasedReturnValue();

        v141 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "localizedStringForKey:value:table:", v207, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "localizedStringWithFormat:", v143, v139);
        v144 = (void *)objc_claimAutoreleasedReturnValue();

        HKFormatValueAndUnit(v202, v144);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }

      goto LABEL_12;
    }
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5490]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "localizedStringForKey:value:table:", CFSTR("ECG_ALGORITHM_VERSION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Cinnamon"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v147 = objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v5 = (id)v147;
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7320]) & 1) != 0)
    goto LABEL_57;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55F8]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = v148;
    v150 = CFSTR("CARDIO_FITNESS_VALUE");
LABEL_129:
    objc_msgSend(v148, "localizedStringForKey:value:table:", v150, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
    v63 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_formattedValueTextForVO2MaxQuantityObject:key:section:", v6, v63, *(_QWORD *)(a1 + 40));
    v64 = objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5570]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = v148;
    v150 = CFSTR("CARDIO_FITNESS_NOTIFICATION_THRESHOLD");
    goto LABEL_129;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7368]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v151;
    v153 = CFSTR("CARDIO_FITNESS_RELATED_MEDICATIONS");
    v154 = CFSTR("HealthUI-Localizable-CardioFitness");
LABEL_132:
    objc_msgSend(v151, "localizedStringForKey:value:table:", v153, &stru_1E9C4C428, v154);
    v58 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
      v155 = CFSTR("YES");
    else
      v155 = CFSTR("NO");
    objc_msgSend(v70, "localizedStringForKey:value:table:", v155, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54F0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DEVICE_PLACEMENT_SIDE_%@"), v6);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5478]))
  {
    objc_msgSend(v6, "stringValue");
    v156 = objc_claimAutoreleasedReturnValue();
LABEL_140:
    v10 = (void *)v156;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54A0]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "localizedStringForKey:value:table:", CFSTR("IRN_ALGORITHM_VERSION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-IRN2"));
    v63 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringValue");
    v64 = objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5598]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v151;
    v153 = CFSTR("METADATA_TITLE_QUANTITY_CLAMPED_TO_LOWER_BOUND");
    v154 = CFSTR("HealthUI-Localizable-AFibBurden");
    goto LABEL_132;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB54E8]))
  {
    HKLocalizedStringForDateAndTemplate(v6, 10);
    v156 = objc_claimAutoreleasedReturnValue();
    goto LABEL_140;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5548]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = CFSTR("HealthUI-Localizable-Lyon");
    objc_msgSend(v158, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_RECOVERY_TEST_TYPE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Lyon"));
    v58 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HEART_RATE_RECOVERY_TEST_TYPE_%@"), v6);
    goto LABEL_68;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5538]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    v61 = CFSTR("HEART_RATE_RECOVERY_ACTIVITY_TYPE");
    v62 = CFSTR("HealthUI-Localizable-Lyon");
LABEL_60:
    objc_msgSend(v59, "localizedStringForKey:value:table:", v61, &stru_1E9C4C428, v62);
    v63 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "unsignedIntegerValue");
    if (_HKWorkoutActivityTypeIsValid())
    {
      HKUILocalizedWorkoutTypeName();
      v64 = objc_claimAutoreleasedReturnValue();
LABEL_62:
      v10 = (void *)v64;
LABEL_63:
      v11 = 0;
      v5 = (id)v63;
      goto LABEL_12;
    }
LABEL_172:
    v11 = 0;
    v5 = (id)v63;
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5530]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_RECOVERY_ACTIVITY_DURATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Lyon"));
    v63 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v6;
    if (objc_msgSend(v161, "isCompatibleWithUnit:", v160))
    {
      v162 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "doubleValueForUnit:", v163);
      objc_msgSend(v162, "numberWithDouble:");
      v164 = (void *)objc_claimAutoreleasedReturnValue();

      v165 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
      -[HKTimePeriodWithSecondsNumberFormatter setAllowMillisecondPrecision:](v165, "setAllowMillisecondPrecision:", 1);
      -[HKTimePeriodWithSecondsNumberFormatter stringFromNumber:displayType:unitController:](v165, "stringFromNumber:displayType:unitController:", v164, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_158:
      goto LABEL_159;
    }
    goto LABEL_157;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5540]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_RECOVERY_MAX_OBSERVED_HEART_RATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Lyon"));
    v63 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v6;
    if (objc_msgSend(v161, "isCompatibleWithUnit:", v160))
    {
      objc_msgSend(v161, "doubleValueForUnit:", v160);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      HKLocalizedStringForNumberWithDecimalPrecision(v167, 0, 0);
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      v169 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "localizedStringForKey:value:table:", CFSTR("BEATS_PER_MINUTE_NUMBERLESS_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "localizedStringWithFormat:", v171, 0);
      v172 = (void *)objc_claimAutoreleasedReturnValue();

      HKFormatValueAndUnit(v168, v172);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_158;
    }
LABEL_157:
    v10 = 0;
    goto LABEL_158;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55E8]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = CFSTR("HealthUI-Localizable");
    objc_msgSend(v173, "localizedStringForKey:value:table:", CFSTR("USER_MOTION_CONTEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v58 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("USER_MOTION_CONTEXT_%@"), v6);
    goto LABEL_68;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55B0]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "localizedStringForKey:value:table:", CFSTR("SESSION_ESTIMATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v63 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_172;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sampleType");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForType:", v160);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_159:

    goto LABEL_63;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7338]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "localizedStringForKey:value:table:", CFSTR("SKIN_SURFACE_TEMPERATURE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v208 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "healthStore");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "displayTypeWithIdentifier:", &unk_1E9CED2F8);
    v178 = objc_claimAutoreleasedReturnValue();

    v203 = (void *)v178;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unitForDisplayType:", v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeFahrenheitUnit");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend(v179, "isEqual:", v180);
    v182 = CFSTR("DEGREES_CELSIUS_NUMBERED_UNIT");
    if (v181)
      v182 = CFSTR("DEGREES_FAHRENHEIT_NUMBERED_UNIT");
    v183 = v182;

    v184 = v6;
    if (objc_msgSend(v184, "isCompatibleWithUnit:", v179))
    {
      objc_msgSend(v184, "doubleValueForUnit:", v179);
      v186 = v185;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      HKLocalizedStringForNumberWithDecimalPrecision(v187, 2, 0);
      v188 = (void *)objc_claimAutoreleasedReturnValue();

      v189 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "localizedStringForKey:value:table:", v183, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "localizedStringWithFormat:", v191, v186);
      v192 = (void *)objc_claimAutoreleasedReturnValue();

      HKFormatValueAndUnit(v188, v192);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    v11 = 0;
    v5 = (id)v208;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB72C8]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "localizedStringForKey:value:table:", CFSTR("INTERNAL_LIVEON_ALGORITHM_VERSION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v63 = objc_claimAutoreleasedReturnValue();

    goto LABEL_172;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB55A0]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
      v195 = CFSTR("YES");
    else
      v195 = CFSTR("NO");
    objc_msgSend(v194, "localizedStringForKey:value:table:", v195, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sampleType");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "identifier");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v197, "isEqualToString:", *MEMORY[0x1E0CB5D98]);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "localizedStringForKey:value:table:", CFSTR("BEYOND_MAXIMUM_DEPTH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Charon"));
      v199 = objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v5 = (id)v199;
    }
LABEL_12:
    if (v10)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5610]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = CFSTR("HealthUI-Localizable");
    objc_msgSend(v200, "localizedStringForKey:value:table:", CFSTR("WATER_SALINITY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v58 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WATER_SALINITY_%@"), v6);
    goto LABEL_68;
  }
LABEL_79:
  v11 = 0;
LABEL_13:
  objc_msgSend(v6, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  if ((_HKMetadataKeyIsPrivate() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sampleType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v209[0] = v15;
    v209[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addText:detail:baseIdentifier:", v10, v13, v17);
    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "addAdditionalDetailValuesToSection:key:value:", *(_QWORD *)(a1 + 40), v5, v6);
    goto LABEL_17;
  }
LABEL_18:

}

void __53__HKDataMetadataDataSource_addDetailValuesToSection___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB5608], *MEMORY[0x1E0CB5558], *MEMORY[0x1E0CB54D8], *MEMORY[0x1E0CB5600], *MEMORY[0x1E0CB5518], *MEMORY[0x1E0CB5588], *MEMORY[0x1E0CB55B8], *MEMORY[0x1E0CB5488], *MEMORY[0x1E0CB5498], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MACancelDownloadErrorDomain_block_invoke___metadataKeysExpectingBoolean;
  MACancelDownloadErrorDomain_block_invoke___metadataKeysExpectingBoolean = v0;

}

- (id)_formattedValueTextForVO2MaxQuantityObject:(id)a3 key:(id)a4 section:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v6 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v7, "displayTypeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayTypeWithIdentifier:", &unk_1E9CED310);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "unitController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unitForDisplayType:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", v12);
    v14 = v13;
    objc_msgSend(v10, "presentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "adjustedValueForDaemonValue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormattedStringFromValueForContext(v17, v10, v11, 0, 0, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HKFormatterIncludesUnitForDisplayTypeInContext(v10, 1, v11) & 1) != 0)
    {
      v19 = v18;
    }
    else
    {
      objc_msgSend(v11, "localizedDisplayNameForDisplayType:value:nameContext:", v10, v17, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HKFormatValueAndUnit(v18, v20);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)addAdditionalDetailValuesToSection:(id)a3 key:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CB54C0]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SCANDIUM_OVERLAY_LOW_AIR_PRESSURE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v8;
      HKOxygenSaturationLowBarometricPressureThresholdQuantity();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "hk_isGreaterThanQuantity:", v12);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
        v16 = CFSTR("NO");
      else
        v16 = CFSTR("YES");
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = *MEMORY[0x1E0CB5CF0];
      v20[1] = CFSTR("HighElevationEnvironment");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addText:detail:baseIdentifier:", v17, v10, v19);

    }
  }

}

- (id)_mediaSourceDisplayNamesForSample:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HKSample metadata](self->_sample, "metadata", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB7230]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    v8 = 0x1E0CB3000;
    if (v7)
    {
      v9 = v7;
      v29 = v5;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = 0;
          objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v16, 1, &v31);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "localizedName");
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;
              objc_msgSend(v30, "addObject:", v19);

            }
          }
          else
          {
            v21 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.WebKit.WebContent"));
            v10 |= v21;
            v11 |= v21 ^ 1;
          }

        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v9);

      if ((v10 & 1) != 0)
      {
        v8 = 0x1E0CB3000uLL;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MEDIA_SOURCE_WEB_CONTENT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v23);

        v5 = v29;
        if ((v11 & 1) == 0)
          goto LABEL_20;
      }
      else
      {
        v5 = v29;
        v8 = 0x1E0CB3000uLL;
        if ((v11 & 1) == 0)
        {
LABEL_20:
          objc_msgSend(*(id *)(v8 + 1232), "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CHART_COMMA_SEPARATOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "componentsJoinedByString:", v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_21;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MEDIA_SOURCE_OTHER_SOURCE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v25);

    }
    goto LABEL_20;
  }
  v24 = 0;
LABEL_21:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
