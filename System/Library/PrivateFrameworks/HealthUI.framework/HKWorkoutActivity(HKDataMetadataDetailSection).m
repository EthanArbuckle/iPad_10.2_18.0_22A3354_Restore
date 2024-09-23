@implementation HKWorkoutActivity(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HKWorkoutDurationNumberFormatter *v10;
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
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
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
  double v88;
  double v89;
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
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id obja;
  id obj;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _QWORD v116[17];

  v116[15] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKDateFormatterFromTemplate(32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  v102 = v5;
  v103 = v4;
  v106 = a1;
  if (v8)
  {
    objc_msgSend(a1, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v9);
    v10 = (HKWorkoutDurationNumberFormatter *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA820);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v10, v12, v13);
  }
  else
  {
    v10 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
    -[HKTimePeriodWithSecondsNumberFormatter setAllowMillisecondPrecision:](v10, "setAllowMillisecondPrecision:", 1);
    objc_msgSend(a1, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v15);
    v16 = a1;
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "duration");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTimePeriodWithSecondsNumberFormatter stringFromNumber:displayType:unitController:](v10, "stringFromNumber:displayType:unitController:", v18, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DURATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA838);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v13, v20, v21);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("START_TIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA850);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v11, v23, v24);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("END_TIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA868);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v12, v26, v27);

  }
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v116[0] = obja;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v107;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A88]);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v104;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D78]);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v101;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v116[4] = v100;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C90]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v116[5] = v99;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v116[6] = v98;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v116[7] = v28;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C70]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v116[8] = v29;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D50]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v116[9] = v30;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D58]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v116[10] = v31;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D38]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v116[11] = v32;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D40]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v116[12] = v33;
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D48]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v116[13] = v34;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D80]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v116[14] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v36;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
  v38 = v103;
  v39 = v106;
  if (!v37)
    goto LABEL_21;
  v40 = v37;
  v41 = *(_QWORD *)v112;
  v105 = *(_QWORD *)v112;
  do
  {
    v42 = 0;
    v108 = v40;
    do
    {
      if (*(_QWORD *)v112 != v41)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v42);
      objc_msgSend(v39, "statisticsForType:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        objc_msgSend(v38, "displayTypeController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "displayTypeForObjectType:", v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "unitController");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "unitForDisplayType:", v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = objc_msgSend(v43, "aggregationStyle");
        if (v49 == 1)
        {
          objc_msgSend(v44, "averageQuantity");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          v51 = v50;
          objc_msgSend(v50, "doubleValueForUnit:", v48);
          v53 = v52;

          objc_msgSend(v46, "presentation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "adjustedValueForDaemonValue:", v55);
          v56 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "unitController");
          v57 = v38;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          HKFormattedStringFromValueForContext((void *)v56, v46, v58, 0, 0, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "unitController");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v56) = HKFormatterIncludesUnitForDisplayTypeInContext(v46, 1, v60);

          if ((v56 & 1) != 0)
          {
            v61 = v59;
          }
          else
          {
            objc_msgSend(v57, "unitController");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "localizedDisplayNameForDisplayType:value:nameContext:", v46, 0, 3);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            HKFormatValueAndUnit(v59, v63);
            v61 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v46, "localization");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "displayName");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA880);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addText:detail:baseIdentifier:", v61, v65, v66);

          v38 = v57;
          v41 = v105;
          v39 = v106;
          v40 = v108;
        }
        else if (!v49)
        {
          objc_msgSend(v44, "sumQuantity");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }

      }
      ++v42;
    }
    while (v40 != v42);
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
  }
  while (v40);
LABEL_21:

  objc_msgSend(v39, "workoutConfiguration");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "locationType");

  if ((unint64_t)(v68 - 1) > 2)
    v69 = 0;
  else
    v69 = off_1E9C461A8[v68 - 1];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedStringForKey:value:table:", v69, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SESSION_LOCATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA898);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "addText:detail:baseIdentifier:", v71, v73, v74);

  objc_msgSend(v106, "workoutConfiguration");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "activityType");

  if (v76 == 6)
  {
    objc_msgSend(v106, "workoutConfiguration");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "swimmingLocationType");
    _HKWorkoutSwimmingLocationTypeName();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("HKSwimmingLocationType"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA8B0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "addText:detail:baseIdentifier:", v78, v80, v81);

    objc_msgSend(v103, "displayTypeController");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "displayTypeWithIdentifier:", &unk_1E9CED328);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v103, "unitController");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "unitForDisplayType:", v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v106, "workoutConfiguration");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "lapLength");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "doubleValueForUnit:", v85);
    v89 = v88;

    objc_msgSend(v83, "presentation");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "adjustedValueForDaemonValue:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "unitController");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValueForContext(v92, v83, v93, 0, 0, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("HKLapLength"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA8C8);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "addText:detail:baseIdentifier:", v94, v96, v97);

  }
}

@end
