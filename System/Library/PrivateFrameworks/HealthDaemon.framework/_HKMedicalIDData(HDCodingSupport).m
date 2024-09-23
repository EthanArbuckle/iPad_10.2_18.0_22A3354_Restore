@implementation _HKMedicalIDData(HDCodingSupport)

- (HDCodableMedicalIDData)codableRepresentationForSync
{
  HDCodableMedicalIDData *v2;
  void *v3;
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
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
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
  void *v63;
  void *v64;
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
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  HDCodableMedicalIDData *v123;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HDCodableMedicalIDData);
  -[HDCodableMedicalIDData setIsDisabled:](v2, "setIsDisabled:", objc_msgSend(a1, "isDisabled"));
  objc_msgSend(a1, "isDisabledModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "isDisabledModifiedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setIsDisabledModifiedDate:](v2, "setIsDisabledModifiedDate:");

  }
  -[HDCodableMedicalIDData setShareDuringEmergency:](v2, "setShareDuringEmergency:", objc_msgSend(a1, "shareDuringEmergency"));
  objc_msgSend(a1, "shareDuringEmergencyModifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "shareDuringEmergencyModifiedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setShareDuringEmergencyModifiedDate:](v2, "setShareDuringEmergencyModifiedDate:");

  }
  objc_msgSend(a1, "pictureData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setPictureData:](v2, "setPictureData:", v7);

  objc_msgSend(a1, "pictureDataModifiedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "pictureDataModifiedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setPictureDataModifiedDate:](v2, "setPictureDataModifiedDate:");

  }
  objc_msgSend(a1, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setName:](v2, "setName:", v10);

  objc_msgSend(a1, "nameModifiedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "nameModifiedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setNameModifiedDate:](v2, "setNameModifiedDate:");

  }
  objc_msgSend(a1, "gregorianBirthday");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_codableDateComponentsForCalendarUnits:", *MEMORY[0x1E0CB70C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setGregorianBirthday:](v2, "setGregorianBirthday:", v14);

  objc_msgSend(a1, "gregorianBirthdayModifiedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1, "gregorianBirthdayModifiedDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setGregorianBirthdayModifiedDate:](v2, "setGregorianBirthdayModifiedDate:");

  }
  objc_msgSend(a1, "primaryLanguageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setPrimaryLanguageCode:](v2, "setPrimaryLanguageCode:", v17);

  objc_msgSend(a1, "primaryLanguageCodeModifiedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(a1, "primaryLanguageCodeModifiedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setPrimaryLanguageCodeModifiedDate:](v2, "setPrimaryLanguageCodeModifiedDate:");

  }
  objc_msgSend(a1, "height");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "codableRepresentationForSync");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setHeight:](v2, "setHeight:", v21);

  objc_msgSend(a1, "heightModifiedDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(a1, "heightModifiedDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setHeightModifiedDate:](v2, "setHeightModifiedDate:");

  }
  objc_msgSend(a1, "weight");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "codableRepresentationForSync");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setWeight:](v2, "setWeight:", v25);

  objc_msgSend(a1, "weightModifiedDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(a1, "weightModifiedDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setWeightModifiedDate:](v2, "setWeightModifiedDate:");

  }
  -[HDCodableMedicalIDData setBloodType:](v2, "setBloodType:", objc_msgSend(a1, "bloodType"));
  objc_msgSend(a1, "bloodTypeModifiedDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(a1, "bloodTypeModifiedDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setBloodTypeModifiedDate:](v2, "setBloodTypeModifiedDate:");

  }
  objc_msgSend(a1, "isOrganDonor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(a1, "isOrganDonor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicalIDData setIsOrganDonor:](v2, "setIsOrganDonor:", objc_msgSend(v31, "longLongValue"));

  }
  objc_msgSend(a1, "isOrganDonorModifiedDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(a1, "isOrganDonorModifiedDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setIsOrganDonorModifiedDate:](v2, "setIsOrganDonorModifiedDate:");

  }
  objc_msgSend(a1, "emergencyContacts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    objc_msgSend(a1, "emergencyContacts");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v142;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v142 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * v41), "codableRepresentationForSync");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

          ++v41;
        }
        while (v39 != v41);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
      }
      while (v39);
    }

    -[HDCodableMedicalIDData setEmergencyContacts:](v2, "setEmergencyContacts:", v36);
  }
  objc_msgSend(a1, "emergencyContactsModifiedDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(a1, "emergencyContactsModifiedDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setEmergencyContactsModifiedDate:](v2, "setEmergencyContactsModifiedDate:");

  }
  objc_msgSend(a1, "clinicalContacts");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");

  if (v46)
  {
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    objc_msgSend(a1, "clinicalContacts");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v138;
      do
      {
        v52 = 0;
        do
        {
          if (*(_QWORD *)v138 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * v52), "codableRepresentationForSync");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v53);

          ++v52;
        }
        while (v50 != v52);
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
      }
      while (v50);
    }

    -[HDCodableMedicalIDData setClinicalContacts:](v2, "setClinicalContacts:", v47);
  }
  objc_msgSend(a1, "clinicalContactsModifiedDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(a1, "clinicalContactsModifiedDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setClinicalContactsModifiedDate:](v2, "setClinicalContactsModifiedDate:");

  }
  objc_msgSend(a1, "medicalConditions");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setMedicalConditions:](v2, "setMedicalConditions:", v56);

  objc_msgSend(a1, "medicalConditionsModifiedDate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(a1, "medicalConditionsModifiedDate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setMedicalConditionsModifiedDate:](v2, "setMedicalConditionsModifiedDate:");

  }
  objc_msgSend(a1, "medicalNotes");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setMedicalNotes:](v2, "setMedicalNotes:", v59);

  objc_msgSend(a1, "medicalNotesModifiedDate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend(a1, "medicalNotesModifiedDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setMedicalNotesModifiedDate:](v2, "setMedicalNotesModifiedDate:");

  }
  objc_msgSend(a1, "allergyInfo");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setAllergyInfo:](v2, "setAllergyInfo:", v62);

  objc_msgSend(a1, "allergyInfoModifiedDate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(a1, "allergyInfoModifiedDate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setAllergyInfoModifiedDate:](v2, "setAllergyInfoModifiedDate:");

  }
  objc_msgSend(a1, "medicationInfo");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalIDData setMedicationInfo:](v2, "setMedicationInfo:", v65);

  objc_msgSend(a1, "medicationInfoModifiedDate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    objc_msgSend(a1, "medicationInfoModifiedDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setMedicationInfoModifiedDate:](v2, "setMedicationInfoModifiedDate:");

  }
  objc_msgSend(a1, "pregnancyStartDate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(a1, "pregnancyStartDate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setPregnancyStartDate:](v2, "setPregnancyStartDate:");

  }
  objc_msgSend(a1, "pregnancyStartDateModifiedDate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(a1, "pregnancyStartDateModifiedDate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setPregnancyStartDateModifiedDate:](v2, "setPregnancyStartDateModifiedDate:");

  }
  objc_msgSend(a1, "pregnancyEstimatedDueDate");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(a1, "pregnancyEstimatedDueDate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setPregnancyEstimatedDueDate:](v2, "setPregnancyEstimatedDueDate:");

  }
  objc_msgSend(a1, "pregnancyEstimatedDueDateModifiedDate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(a1, "pregnancyEstimatedDueDateModifiedDate");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setPregnancyEstimatedDueDateModifiedDate:](v2, "setPregnancyEstimatedDueDateModifiedDate:");

  }
  objc_msgSend(a1, "medicationsList");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "count");

  if (v77)
  {
    v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    objc_msgSend(a1, "medicationsList");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v134;
      do
      {
        v83 = 0;
        do
        {
          if (*(_QWORD *)v134 != v82)
            objc_enumerationMutation(v79);
          objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * v83), "codableRepresentationForSync");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "addObject:", v84);

          ++v83;
        }
        while (v81 != v83);
        v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
      }
      while (v81);
    }

    -[HDCodableMedicalIDData setMedicationsLists:](v2, "setMedicationsLists:", v78);
  }
  objc_msgSend(a1, "medicationsListModifiedDate");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(a1, "medicationsListModifiedDate");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setMedicationsListModifiedDate:](v2, "setMedicationsListModifiedDate:");

  }
  objc_msgSend(a1, "medicationsListVersion");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend(a1, "medicationsListVersion");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicalIDData setMedicationsListVersion:](v2, "setMedicationsListVersion:", objc_msgSend(v88, "longLongValue"));

  }
  objc_msgSend(a1, "medicationsListVersionModifiedDate");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(a1, "medicationsListVersionModifiedDate");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setMedicationsListVersionModifiedDate:](v2, "setMedicationsListVersionModifiedDate:");

  }
  objc_msgSend(a1, "allergiesList");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "count");

  if (v92)
  {
    v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    objc_msgSend(a1, "allergiesList");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v130;
      do
      {
        v98 = 0;
        do
        {
          if (*(_QWORD *)v130 != v97)
            objc_enumerationMutation(v94);
          objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * v98), "codableRepresentationForSync");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObject:", v99);

          ++v98;
        }
        while (v96 != v98);
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
      }
      while (v96);
    }

    -[HDCodableMedicalIDData setAllergiesLists:](v2, "setAllergiesLists:", v93);
  }
  objc_msgSend(a1, "allergiesListModifiedDate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    objc_msgSend(a1, "allergiesListModifiedDate");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setAllergiesListModifiedDate:](v2, "setAllergiesListModifiedDate:");

  }
  objc_msgSend(a1, "allergiesListVersion");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    objc_msgSend(a1, "allergiesListVersion");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicalIDData setAllergiesListVersion:](v2, "setAllergiesListVersion:", objc_msgSend(v103, "longLongValue"));

  }
  objc_msgSend(a1, "allergiesListVersionModifiedDate");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    objc_msgSend(a1, "allergiesListVersionModifiedDate");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setAllergiesListVersionModifiedDate:](v2, "setAllergiesListVersionModifiedDate:");

  }
  objc_msgSend(a1, "conditionsList");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "count");

  if (v107)
  {
    v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    objc_msgSend(a1, "conditionsList", 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
    if (v110)
    {
      v111 = v110;
      v112 = *(_QWORD *)v126;
      do
      {
        v113 = 0;
        do
        {
          if (*(_QWORD *)v126 != v112)
            objc_enumerationMutation(v109);
          objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * v113), "codableRepresentationForSync");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "addObject:", v114);

          ++v113;
        }
        while (v111 != v113);
        v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
      }
      while (v111);
    }

    -[HDCodableMedicalIDData setConditionsLists:](v2, "setConditionsLists:", v108);
  }
  objc_msgSend(a1, "conditionsListModifiedDate");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    objc_msgSend(a1, "conditionsListModifiedDate");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setConditionsListModifiedDate:](v2, "setConditionsListModifiedDate:");

  }
  objc_msgSend(a1, "conditionsListVersion");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    objc_msgSend(a1, "conditionsListVersion");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicalIDData setConditionsListVersion:](v2, "setConditionsListVersion:", objc_msgSend(v118, "longLongValue"));

  }
  objc_msgSend(a1, "conditionsListVersionModifiedDate");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (v119)
  {
    objc_msgSend(a1, "conditionsListVersionModifiedDate");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setConditionsListVersionModifiedDate:](v2, "setConditionsListVersionModifiedDate:");

  }
  objc_msgSend(a1, "dateSaved");
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  if (v121)
  {
    objc_msgSend(a1, "dateSaved");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "timeIntervalSinceReferenceDate");
    -[HDCodableMedicalIDData setDateSaved:](v2, "setDateSaved:");

  }
  v123 = v2;

  return v123;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0CB6FD8]);
    objc_msgSend(v5, "setIsDisabled:", objc_msgSend(v4, "isDisabled"));
    if ((objc_msgSend(v4, "hasIsDisabledModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "isDisabledModifiedDate");
      HDDecodeDateForValue();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIsDisabledModifiedDate:", v6);

    }
    else
    {
      objc_msgSend(v5, "setIsDisabledModifiedDate:", 0);
    }
    objc_msgSend(v5, "setShareDuringEmergency:", objc_msgSend(v4, "shareDuringEmergency"));
    if ((objc_msgSend(v4, "hasShareDuringEmergencyModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "shareDuringEmergencyModifiedDate");
      HDDecodeDateForValue();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setShareDuringEmergencyModifiedDate:", v8);

    }
    else
    {
      objc_msgSend(v5, "setShareDuringEmergencyModifiedDate:", 0);
    }
    objc_msgSend(v4, "pictureData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPictureData:", v9);

    if ((objc_msgSend(v4, "hasPictureDataModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "pictureDataModifiedDate");
      HDDecodeDateForValue();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPictureDataModifiedDate:", v10);

    }
    else
    {
      objc_msgSend(v5, "setPictureDataModifiedDate:", 0);
    }
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v11);

    if ((objc_msgSend(v4, "hasNameModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "nameModifiedDate");
      HDDecodeDateForValue();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNameModifiedDate:", v12);

    }
    else
    {
      objc_msgSend(v5, "setNameModifiedDate:", 0);
    }
    v13 = (void *)MEMORY[0x1E0C99D78];
    objc_msgSend(v4, "gregorianBirthday");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_dateComponentsWithCodableDateComponents:calendarUnits:", v14, *MEMORY[0x1E0CB70C8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGregorianBirthday:", v15);

    if ((objc_msgSend(v4, "hasGregorianBirthdayModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "gregorianBirthdayModifiedDate");
      HDDecodeDateForValue();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setGregorianBirthdayModifiedDate:", v16);

    }
    else
    {
      objc_msgSend(v5, "setGregorianBirthdayModifiedDate:", 0);
    }
    objc_msgSend(v4, "primaryLanguageCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrimaryLanguageCode:", v17);

    if ((objc_msgSend(v4, "hasPrimaryLanguageCodeModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "primaryLanguageCodeModifiedDate");
      HDDecodeDateForValue();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPrimaryLanguageCodeModifiedDate:", v18);

    }
    else
    {
      objc_msgSend(v5, "setPrimaryLanguageCodeModifiedDate:", 0);
    }
    v19 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v4, "height");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createWithCodable:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHeight:", v21);

    if ((objc_msgSend(v4, "hasHeightModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "heightModifiedDate");
      HDDecodeDateForValue();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHeightModifiedDate:", v22);

    }
    else
    {
      objc_msgSend(v5, "setHeightModifiedDate:", 0);
    }
    v23 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v4, "weight");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createWithCodable:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWeight:", v25);

    if ((objc_msgSend(v4, "hasWeightModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "weightModifiedDate");
      HDDecodeDateForValue();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWeightModifiedDate:", v26);

    }
    else
    {
      objc_msgSend(v5, "setWeightModifiedDate:", 0);
    }
    if (objc_msgSend(v4, "hasBloodType"))
      v27 = (int)objc_msgSend(v4, "bloodType");
    else
      v27 = 0;
    objc_msgSend(v5, "setBloodType:", v27);
    if ((objc_msgSend(v4, "hasBloodTypeModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "bloodTypeModifiedDate");
      HDDecodeDateForValue();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBloodTypeModifiedDate:", v28);

    }
    else
    {
      objc_msgSend(v5, "setBloodTypeModifiedDate:", 0);
    }
    if ((objc_msgSend(v4, "hasIsOrganDonor") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "isOrganDonor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIsOrganDonor:", v29);

    }
    else
    {
      objc_msgSend(v5, "setIsOrganDonor:", 0);
    }
    if ((objc_msgSend(v4, "hasIsOrganDonorModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "isOrganDonorModifiedDate");
      HDDecodeDateForValue();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIsOrganDonorModifiedDate:", v30);

    }
    else
    {
      objc_msgSend(v5, "setIsOrganDonorModifiedDate:", 0);
    }
    objc_msgSend(v4, "emergencyContacts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v120 = 0u;
      objc_msgSend(v4, "emergencyContacts");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v118;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v118 != v37)
              objc_enumerationMutation(v34);
            objc_msgSend(MEMORY[0x1E0CB6F88], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v38));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v39);

            ++v38;
          }
          while (v36 != v38);
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
        }
        while (v36);
      }

      objc_msgSend(v5, "setEmergencyContacts:", v33);
    }
    if ((objc_msgSend(v4, "hasEmergencyContactsModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "emergencyContactsModifiedDate");
      HDDecodeDateForValue();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEmergencyContactsModifiedDate:", v40);

    }
    else
    {
      objc_msgSend(v5, "setEmergencyContactsModifiedDate:", 0);
    }
    objc_msgSend(v4, "clinicalContacts");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42)
    {
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      objc_msgSend(v4, "clinicalContacts");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v114;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v114 != v47)
              objc_enumerationMutation(v44);
            objc_msgSend(MEMORY[0x1E0CB6F28], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v48));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addObject:", v49);

            ++v48;
          }
          while (v46 != v48);
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
        }
        while (v46);
      }

      objc_msgSend(v5, "setClinicalContacts:", v43);
    }
    if ((objc_msgSend(v4, "hasClinicalContactsModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "clinicalContactsModifiedDate");
      HDDecodeDateForValue();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setClinicalContactsModifiedDate:", v50);

    }
    else
    {
      objc_msgSend(v5, "setClinicalContactsModifiedDate:", 0);
    }
    objc_msgSend(v4, "medicalConditions");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMedicalConditions:", v51);

    if ((objc_msgSend(v4, "hasMedicalConditionsModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "medicalConditionsModifiedDate");
      HDDecodeDateForValue();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMedicalConditionsModifiedDate:", v52);

    }
    else
    {
      objc_msgSend(v5, "setMedicalConditionsModifiedDate:", 0);
    }
    objc_msgSend(v4, "medicalNotes");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMedicalNotes:", v53);

    if ((objc_msgSend(v4, "hasMedicalNotesModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "medicalNotesModifiedDate");
      HDDecodeDateForValue();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMedicalNotesModifiedDate:", v54);

    }
    else
    {
      objc_msgSend(v5, "setMedicalNotesModifiedDate:", 0);
    }
    objc_msgSend(v4, "allergyInfo");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllergyInfo:", v55);

    if ((objc_msgSend(v4, "hasAllergyInfoModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "allergyInfoModifiedDate");
      HDDecodeDateForValue();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllergyInfoModifiedDate:", v56);

    }
    else
    {
      objc_msgSend(v5, "setAllergyInfoModifiedDate:", 0);
    }
    objc_msgSend(v4, "medicationInfo");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMedicationInfo:", v57);

    if ((objc_msgSend(v4, "hasMedicationInfoModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "medicationInfoModifiedDate");
      HDDecodeDateForValue();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMedicationInfoModifiedDate:", v58);

    }
    else
    {
      objc_msgSend(v5, "setMedicationInfoModifiedDate:", 0);
    }
    if ((objc_msgSend(v4, "hasPregnancyStartDate") & 1) != 0)
    {
      objc_msgSend(v4, "pregnancyStartDate");
      HDDecodeDateForValue();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPregnancyStartDate:", v59);

    }
    else
    {
      objc_msgSend(v5, "setPregnancyStartDate:", 0);
    }
    if ((objc_msgSend(v4, "hasPregnancyStartDateModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "pregnancyStartDateModifiedDate");
      HDDecodeDateForValue();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPregnancyStartDateModifiedDate:", v60);

    }
    else
    {
      objc_msgSend(v5, "setPregnancyStartDateModifiedDate:", 0);
    }
    if ((objc_msgSend(v4, "hasPregnancyEstimatedDueDate") & 1) != 0)
    {
      objc_msgSend(v4, "pregnancyEstimatedDueDate");
      HDDecodeDateForValue();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPregnancyEstimatedDueDate:", v61);

    }
    else
    {
      objc_msgSend(v5, "setPregnancyEstimatedDueDate:", 0);
    }
    if ((objc_msgSend(v4, "hasPregnancyEstimatedDueDateModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "pregnancyEstimatedDueDateModifiedDate");
      HDDecodeDateForValue();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPregnancyEstimatedDueDateModifiedDate:", v62);

    }
    else
    {
      objc_msgSend(v5, "setPregnancyEstimatedDueDateModifiedDate:", 0);
    }
    objc_msgSend(v4, "medicationsLists");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "count");

    if (v64)
    {
      v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      objc_msgSend(v4, "medicationsLists");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v110;
        do
        {
          v70 = 0;
          do
          {
            if (*(_QWORD *)v110 != v69)
              objc_enumerationMutation(v66);
            objc_msgSend(MEMORY[0x1E0CB6FE0], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v70));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObject:", v71);

            ++v70;
          }
          while (v68 != v70);
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
        }
        while (v68);
      }

      objc_msgSend(v5, "setMedicationsList:", v65);
    }
    if ((objc_msgSend(v4, "hasMedicationsListModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "medicationsListModifiedDate");
      HDDecodeDateForValue();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMedicationsListModifiedDate:", v72);

    }
    else
    {
      objc_msgSend(v5, "setMedicationsListModifiedDate:", 0);
    }
    if ((objc_msgSend(v4, "hasMedicationsListVersion") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "medicationsListVersion"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMedicationsListVersion:", v73);

    }
    else
    {
      objc_msgSend(v5, "setMedicationsListVersion:", 0);
    }
    if ((objc_msgSend(v4, "hasMedicationsListVersionModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "medicationsListVersionModifiedDate");
      HDDecodeDateForValue();
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMedicationsListVersionModifiedDate:", v74);

    }
    else
    {
      objc_msgSend(v5, "setMedicationsListVersionModifiedDate:", 0);
    }
    objc_msgSend(v4, "allergiesLists");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "count");

    if (v76)
    {
      v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      objc_msgSend(v4, "allergiesLists");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
      if (v79)
      {
        v80 = v79;
        v81 = *(_QWORD *)v106;
        do
        {
          v82 = 0;
          do
          {
            if (*(_QWORD *)v106 != v81)
              objc_enumerationMutation(v78);
            objc_msgSend(MEMORY[0x1E0CB6FC8], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v82));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v83);

            ++v82;
          }
          while (v80 != v82);
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
        }
        while (v80);
      }

      objc_msgSend(v5, "setAllergiesList:", v77);
    }
    if ((objc_msgSend(v4, "hasAllergiesListModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "allergiesListModifiedDate");
      HDDecodeDateForValue();
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllergiesListModifiedDate:", v84);

    }
    else
    {
      objc_msgSend(v5, "setAllergiesListModifiedDate:", 0);
    }
    if ((objc_msgSend(v4, "hasAllergiesListVersion") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "allergiesListVersion"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllergiesListVersion:", v85);

    }
    else
    {
      objc_msgSend(v5, "setAllergiesListVersion:", 0);
    }
    if ((objc_msgSend(v4, "hasAllergiesListVersionModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "allergiesListVersionModifiedDate");
      HDDecodeDateForValue();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllergiesListVersionModifiedDate:", v86);

    }
    else
    {
      objc_msgSend(v5, "setAllergiesListVersionModifiedDate:", 0);
    }
    objc_msgSend(v4, "conditionsLists");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "count");

    if (v88)
    {
      v89 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      objc_msgSend(v4, "conditionsLists", 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
      if (v91)
      {
        v92 = v91;
        v93 = *(_QWORD *)v102;
        do
        {
          v94 = 0;
          do
          {
            if (*(_QWORD *)v102 != v93)
              objc_enumerationMutation(v90);
            objc_msgSend(MEMORY[0x1E0CB6FD0], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v94));
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "addObject:", v95);

            ++v94;
          }
          while (v92 != v94);
          v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
        }
        while (v92);
      }

      objc_msgSend(v5, "setConditionsList:", v89);
    }
    if ((objc_msgSend(v4, "hasConditionsListModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "conditionsListModifiedDate");
      HDDecodeDateForValue();
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setConditionsListModifiedDate:", v96);

    }
    else
    {
      objc_msgSend(v5, "setConditionsListModifiedDate:", 0);
    }
    if ((objc_msgSend(v4, "hasConditionsListVersion") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "conditionsListVersion"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setConditionsListVersion:", v97);

    }
    else
    {
      objc_msgSend(v5, "setConditionsListVersion:", 0);
    }
    if ((objc_msgSend(v4, "hasConditionsListVersionModifiedDate") & 1) != 0)
    {
      objc_msgSend(v4, "conditionsListVersionModifiedDate");
      HDDecodeDateForValue();
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setConditionsListVersionModifiedDate:", v98);

    }
    else
    {
      objc_msgSend(v5, "setConditionsListVersionModifiedDate:", 0);
    }
    if ((objc_msgSend(v4, "hasDateSaved") & 1) != 0)
    {
      objc_msgSend(v4, "dateSaved");
      HDDecodeDateForValue();
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDateSaved:", v99);

    }
    else
    {
      objc_msgSend(v5, "setDateSaved:", 0);
    }
    v7 = v5;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
