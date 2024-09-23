@implementation DNDSScheduleSettingsRecord

- (DNDSScheduleSettingsRecord)init
{
  return (DNDSScheduleSettingsRecord *)-[DNDSScheduleSettingsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "lastUpdatedTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleEnabledSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timePeriodStartTimeHour");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timePeriodStartTimeMinute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timePeriodEndTimeHour");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timePeriodEndTimeMinute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timePeriodWeekdays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bedtimeBehaviorEnabledSetting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[DNDSScheduleSettingsRecord _initWithLastUpdatedTimestamp:scheduleEnabledSetting:timePeriodStartTimeHour:timePeriodStartTimeMinute:timePeriodEndTimeHour:timePeriodEndTimeMinute:timePeriodWeekdays:bedtimeBehaviorEnabledSetting:](self, "_initWithLastUpdatedTimestamp:scheduleEnabledSetting:timePeriodStartTimeHour:timePeriodStartTimeMinute:timePeriodEndTimeHour:timePeriodEndTimeMinute:timePeriodWeekdays:bedtimeBehaviorEnabledSetting:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (id)_initWithLastUpdatedTimestamp:(id)a3 scheduleEnabledSetting:(id)a4 timePeriodStartTimeHour:(id)a5 timePeriodStartTimeMinute:(id)a6 timePeriodEndTimeHour:(id)a7 timePeriodEndTimeMinute:(id)a8 timePeriodWeekdays:(id)a9 bedtimeBehaviorEnabledSetting:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  DNDSScheduleSettingsRecord *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v50;
  objc_super v51;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v51.receiver = self;
  v51.super_class = (Class)DNDSScheduleSettingsRecord;
  v24 = -[DNDSScheduleSettingsRecord init](&v51, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    v50 = v16;
    v26 = (void *)v25;
    if (v25)
      v27 = (void *)v25;
    else
      v27 = &unk_1E86DE4F0;
    objc_storeStrong((id *)&v24->_lastUpdatedTimestamp, v27);

    v28 = objc_msgSend(v17, "copy");
    v29 = (void *)v28;
    if (v28)
      v30 = (void *)v28;
    else
      v30 = &unk_1E86DE4F0;
    objc_storeStrong((id *)&v24->_scheduleEnabledSetting, v30);

    v31 = objc_msgSend(v18, "copy");
    v32 = (void *)v31;
    if (v31)
      v33 = (void *)v31;
    else
      v33 = &unk_1E86DE4F0;
    objc_storeStrong((id *)&v24->_timePeriodStartTimeHour, v33);

    v34 = objc_msgSend(v19, "copy");
    v35 = (void *)v34;
    if (v34)
      v36 = (void *)v34;
    else
      v36 = &unk_1E86DE4F0;
    objc_storeStrong((id *)&v24->_timePeriodStartTimeMinute, v36);

    v37 = objc_msgSend(v20, "copy");
    v38 = (void *)v37;
    if (v37)
      v39 = (void *)v37;
    else
      v39 = &unk_1E86DE4F0;
    objc_storeStrong((id *)&v24->_timePeriodEndTimeHour, v39);

    v40 = objc_msgSend(v21, "copy");
    v41 = (void *)v40;
    if (v40)
      v42 = (void *)v40;
    else
      v42 = &unk_1E86DE4F0;
    objc_storeStrong((id *)&v24->_timePeriodEndTimeMinute, v42);

    v43 = objc_msgSend(v22, "copy");
    v44 = (void *)v43;
    if (v43)
      v45 = (void *)v43;
    else
      v45 = &unk_1E86DE508;
    objc_storeStrong((id *)&v24->_timePeriodWeekdays, v45);

    v46 = objc_msgSend(v23, "copy");
    v47 = (void *)v46;
    if (v46)
      v48 = (void *)v46;
    else
      v48 = &unk_1E86DE4F0;
    objc_storeStrong((id *)&v24->_bedtimeBehaviorEnabledSetting, v48);

    v16 = v50;
  }

  return v24;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](self, "lastUpdatedTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSScheduleSettingsRecord scheduleEnabledSetting](self, "scheduleEnabledSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](self, "timePeriodStartTimeHour");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](self, "timePeriodStartTimeMinute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](self, "timePeriodEndTimeHour");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](self, "timePeriodEndTimeMinute");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[DNDSScheduleSettingsRecord timePeriodWeekdays](self, "timePeriodWeekdays");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  DNDSScheduleSettingsRecord *v4;
  DNDSScheduleSettingsRecord *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _BOOL4 v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _BOOL4 v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  DNDSScheduleSettingsRecord *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  void *v76;
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
  void *v122;
  _BYTE v123[44];
  _QWORD v124[5];
  __int128 v125;

  v4 = (DNDSScheduleSettingsRecord *)a3;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_124;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_124;
  }
  v5 = v4;
  -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](self, "lastUpdatedTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](v5, "lastUpdatedTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](self, "lastUpdatedTimestamp");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v122 = 0;
      v125 = 0uLL;
      v12 = 0;
      v13 = 0;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, sizeof(v124));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_64;
    }
    v122 = (void *)v8;
    -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](v5, "lastUpdatedTimestamp");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v119 = 0;
      v12 = 0;
      v13 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 36);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[4]) = 1;
      goto LABEL_64;
    }
    v119 = (void *)v10;
    -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](self, "lastUpdatedTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](v5, "lastUpdatedTimestamp");
    v115 = v11;
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqual:"))
    {
      v124[3] = 0;
      v12 = 0;
      v13 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v124[4] = 0x100000000;
      HIDWORD(v124[2]) = 1;
      goto LABEL_64;
    }
  }
  -[DNDSScheduleSettingsRecord scheduleEnabledSetting](self, "scheduleEnabledSetting");
  v19 = objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord scheduleEnabledSetting](v5, "scheduleEnabledSetting");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v19 != v20;
  HIDWORD(v124[4]) = v6 != v7;
  v120 = (void *)v20;
  v121 = (void *)v19;
  if (v19 != v20)
  {
    -[DNDSScheduleSettingsRecord scheduleEnabledSetting](self, "scheduleEnabledSetting");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v118 = 0;
      v12 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      LODWORD(v124[3]) = 1;
      *(_QWORD *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      v13 = 0;
      goto LABEL_64;
    }
    v118 = (void *)v22;
    -[DNDSScheduleSettingsRecord scheduleEnabledSetting](v5, "scheduleEnabledSetting");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v113 = 0;
      v124[0] = 0;
      v124[1] = 0;
      v12 = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      LODWORD(v124[3]) = 1;
      *(_QWORD *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      v13 = 0;
      LODWORD(v124[2]) = 1;
      goto LABEL_64;
    }
    v113 = (void *)v23;
    -[DNDSScheduleSettingsRecord scheduleEnabledSetting](self, "scheduleEnabledSetting");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSScheduleSettingsRecord scheduleEnabledSetting](v5, "scheduleEnabledSetting");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      v12 = 0;
      v124[0] = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      LODWORD(v124[3]) = 1;
      *(_QWORD *)((char *)&v124[3] + 4) = 0x100000000;
      LODWORD(v124[2]) = 1;
      HIDWORD(v124[2]) = v6 != v7;
      v13 = 0;
      v124[1] = 1;
      goto LABEL_64;
    }
  }
  -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](self, "timePeriodStartTimeHour");
  v25 = objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](v5, "timePeriodStartTimeHour");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v25 != v26;
  LODWORD(v124[4]) = v21;
  v116 = (void *)v26;
  v117 = (void *)v25;
  if (v25 != v26)
  {
    -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](self, "timePeriodStartTimeHour");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v112 = 0;
      v9 = 0;
      v124[0] = 0;
      v125 = 0uLL;
      v40 = v21;
      v12 = 0;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v13 = 0;
      LODWORD(v124[2]) = v40;
      v124[1] = v40 | 0x100000000;
      goto LABEL_64;
    }
    v112 = (void *)v28;
    -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](v5, "timePeriodStartTimeHour");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v107 = 0;
      v9 = 0;
      v124[0] = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v13 = 0;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = 1;
      goto LABEL_64;
    }
    v107 = (void *)v29;
    -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](self, "timePeriodStartTimeHour");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](v5, "timePeriodStartTimeHour");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v30;
    if (!objc_msgSend(v30, "isEqual:"))
    {
      v124[0] = 0;
      v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = 1;
      v13 = 1;
      goto LABEL_64;
    }
  }
  -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](self, "timePeriodStartTimeMinute");
  v31 = objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](v5, "timePeriodStartTimeMinute");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v31;
  v110 = (void *)v32;
  v34 = v31 == v32;
  v35 = v31 != v32;
  HIDWORD(v124[3]) = v27;
  v111 = v33;
  if (v34)
  {
    HIDWORD(v125) = v35;
  }
  else
  {
    -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](self, "timePeriodStartTimeMinute");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      v106 = 0;
      *(_QWORD *)((char *)&v125 + 4) = 0;
      v46 = v27;
      memset(v123, 0, sizeof(v123));
      LODWORD(v125) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v46;
      v13 = v46;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      goto LABEL_64;
    }
    v106 = (void *)v36;
    -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](v5, "timePeriodStartTimeMinute");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      v101 = 0;
      *(_QWORD *)((char *)&v125 + 4) = 0;
      v54 = v27;
      memset(v123, 0, 28);
      LODWORD(v125) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v54;
      v13 = v54;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_OWORD *)&v123[28] = 1uLL;
      goto LABEL_64;
    }
    HIDWORD(v125) = v35;
    v101 = (void *)v37;
    -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](self, "timePeriodStartTimeMinute");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](v5, "timePeriodStartTimeMinute");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(_QWORD *)&v123[36] = 0;
      *(_QWORD *)((char *)&v125 + 4) = 0;
      v39 = v27;
      memset(v123, 0, 24);
      LODWORD(v125) = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v39;
      v13 = v39;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 0;
      *(_QWORD *)&v123[24] = 0x100000001;
      goto LABEL_64;
    }
  }
  -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](self, "timePeriodEndTimeHour");
  v41 = objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](v5, "timePeriodEndTimeHour");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD2(v125) = v41 != (_QWORD)v104;
  v105 = (void *)v41;
  if ((void *)v41 != v104)
  {
    -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](self, "timePeriodEndTimeHour");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      v100 = 0;
      *(_QWORD *)&v125 = 0;
      v55 = v27;
      memset(v123, 0, 24);
      *(_QWORD *)&v123[32] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      v12 = v55;
      v13 = v55;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      goto LABEL_64;
    }
    v100 = (void *)v42;
    -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](v5, "timePeriodEndTimeHour");
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      v95 = 0;
      *(_QWORD *)&v123[12] = 0;
      *(_DWORD *)&v123[20] = 0;
      *(_QWORD *)&v125 = 0;
      v60 = v27;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[32] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v60;
      v13 = v60;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_DWORD *)&v123[8] = 1;
      goto LABEL_64;
    }
    v95 = (void *)v43;
    -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](self, "timePeriodEndTimeHour");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](v5, "timePeriodEndTimeHour");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v44;
    if (!objc_msgSend(v44, "isEqual:"))
    {
      *(_QWORD *)&v125 = 0;
      v45 = v27;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[32] = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v45;
      v13 = v45;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_OWORD *)&v123[8] = 0x100000001uLL;
      goto LABEL_64;
    }
  }
  -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](self, "timePeriodEndTimeMinute");
  v47 = objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](v5, "timePeriodEndTimeMinute");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v47;
  v34 = v47 == v48;
  v50 = v47 != v48;
  v98 = (void *)v48;
  v99 = v49;
  if (v34)
  {
    DWORD1(v125) = v50;
  }
  else
  {
    -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](self, "timePeriodEndTimeMinute");
    v51 = objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      v94 = 0;
      v61 = v27;
      *(_QWORD *)v123 = 0;
      *(_QWORD *)&v123[16] = 0x100000000;
      *(_QWORD *)&v123[32] = 0;
      *(_QWORD *)&v125 = 0x100000000;
      v9 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v61;
      v13 = v61;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[8] = DWORD2(v125);
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      goto LABEL_64;
    }
    v94 = (void *)v51;
    -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](v5, "timePeriodEndTimeMinute");
    v52 = objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      v89 = 0;
      *(_QWORD *)&v123[16] = 0x100000000;
      *(_QWORD *)&v123[32] = 0;
      *(_QWORD *)&v125 = 0x100000000;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_QWORD *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
    DWORD1(v125) = v50;
    v89 = (void *)v52;
    -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](self, "timePeriodEndTimeMinute");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](v5, "timePeriodEndTimeMinute");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v53;
    if (!objc_msgSend(v53, "isEqual:"))
    {
      *(_QWORD *)&v123[32] = 0;
      *(_QWORD *)&v125 = 0x100000000;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_QWORD *)&v123[12] = DWORD2(v125) | 0x100000000;
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
  }
  -[DNDSScheduleSettingsRecord timePeriodWeekdays](self, "timePeriodWeekdays");
  v56 = objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodWeekdays](v5, "timePeriodWeekdays");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v125) = v56 != (_QWORD)v92;
  v93 = (void *)v56;
  if ((void *)v56 != v92)
  {
    -[DNDSScheduleSettingsRecord timePeriodWeekdays](self, "timePeriodWeekdays");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!v57)
    {
      v88 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[32] = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      goto LABEL_64;
    }
    v88 = (void *)v57;
    -[DNDSScheduleSettingsRecord timePeriodWeekdays](v5, "timePeriodWeekdays");
    v58 = objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      v84 = 0;
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 1;
      goto LABEL_64;
    }
    v84 = (void *)v58;
    -[DNDSScheduleSettingsRecord timePeriodWeekdays](self, "timePeriodWeekdays");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSScheduleSettingsRecord timePeriodWeekdays](v5, "timePeriodWeekdays");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v59;
    if (!objc_msgSend(v59, "isEqual:"))
    {
      v9 = 0;
      v16 = 0;
      v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      v15 = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[32] = 1;
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      v124[0] = 0x100000001;
      goto LABEL_64;
    }
  }
  -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
  v62 = objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](v5, "bedtimeBehaviorEnabledSetting");
  v63 = objc_claimAutoreleasedReturnValue();
  v9 = v62;
  if (v62 == v63)
  {
    v16 = 0;
    v17 = 0;
    HIDWORD(v124[2]) = v6 != v7;
    LODWORD(v124[3]) = 1;
    LODWORD(v124[2]) = v21;
    v124[1] = v21 | 0x100000000;
    v12 = v27;
    v13 = v27;
    v15 = 0;
    *(_DWORD *)&v123[24] = HIDWORD(v125);
    *(_DWORD *)&v123[28] = HIDWORD(v125);
    *(_DWORD *)&v123[40] = 1;
    *(_DWORD *)&v123[12] = DWORD2(v125);
    *(_DWORD *)&v123[20] = 1;
    *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
    *(_DWORD *)&v123[16] = DWORD1(v125);
    *(_DWORD *)&v123[36] = 1;
    *(_DWORD *)&v123[32] = v125;
    v124[0] = v125 | 0x100000000;
    v87 = (void *)v62;
    v14 = 1;
    v123[0] = 1;
  }
  else
  {
    v87 = (void *)v63;
    -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v83 = (void *)v64;
      -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](v5, "bedtimeBehaviorEnabledSetting");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v80 = (void *)v65;
        -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](v5, "bedtimeBehaviorEnabledSetting");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v66;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        v12 = v27;
        v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[36] = 1;
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        v123[0] = objc_msgSend(v66, "isEqual:");
        *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
        *(_DWORD *)&v123[32] = v125;
        v124[0] = v125 | 0x100000000;
        v14 = 1;
        v15 = 1;
        v16 = 1;
        v17 = 1;
      }
      else
      {
        v80 = 0;
        v17 = 0;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        v12 = v27;
        v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        v123[0] = 0;
        *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[32] = v125;
        *(_DWORD *)&v123[36] = 1;
        v124[0] = v125 | 0x100000000;
        v14 = 1;
        v15 = 1;
        v16 = 1;
      }
    }
    else
    {
      v83 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      v12 = v27;
      v13 = v27;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v123[0] = 0;
      *(_QWORD *)&v123[4] = *(_QWORD *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[32] = v125;
      *(_DWORD *)&v123[36] = 1;
      v124[0] = v125 | 0x100000000;
      v14 = 1;
      v15 = 1;
    }
    v9 = v62;
  }
LABEL_64:
  v67 = v9;
  if (v17)
  {
    v68 = v5;
    v69 = v13;
    v70 = v7;
    v71 = v6;
    v72 = v14;
    v73 = v12;
    v74 = v15;
    v75 = v16;

    v9 = v67;
    v16 = v75;
    v15 = v74;
    v12 = v73;
    v14 = v72;
    v6 = v71;
    v7 = v70;
    v13 = v69;
    v5 = v68;
  }
  if (v16)
  {

    v9 = v67;
  }
  if (v15)
  {

    v9 = v67;
  }
  if (v14)
  {
    v76 = (void *)v9;

  }
  if (LODWORD(v124[0]))
  {

  }
  if (*(_DWORD *)&v123[32])

  if ((_DWORD)v125)
  if (*(_DWORD *)&v123[36])
  {

  }
  if (*(_DWORD *)&v123[16])
  {

  }
  if (*(_DWORD *)&v123[4])

  if (DWORD1(v125))
  if (*(_DWORD *)&v123[20])
  {

  }
  if (*(_DWORD *)&v123[12])
  {

  }
  if (*(_DWORD *)&v123[8])

  if (DWORD2(v125))
  if (*(_DWORD *)&v123[40])
  {

  }
  if (*(_DWORD *)&v123[24])
  {

  }
  if (*(_DWORD *)&v123[28])

  if (HIDWORD(v125))
  if (HIDWORD(v124[0]))
  {

    if (!v13)
    {
LABEL_104:
      if (!v12)
        goto LABEL_105;
LABEL_127:

      if (!HIDWORD(v124[3]))
        goto LABEL_107;
      goto LABEL_106;
    }
  }
  else if (!v13)
  {
    goto LABEL_104;
  }

  if (v12)
    goto LABEL_127;
LABEL_105:
  if (HIDWORD(v124[3]))
LABEL_106:

LABEL_107:
  if (HIDWORD(v124[1]))
  {

  }
  if (LODWORD(v124[1]))
  {

  }
  if (LODWORD(v124[2]))

  if (LODWORD(v124[4]))
  if (LODWORD(v124[3]))
  {

  }
  if (HIDWORD(v124[2]))
  {

  }
  if (HIDWORD(v124[4]))

  if (v6 != v7)
  v18 = v123[0];
LABEL_124:

  return v18;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](self, "lastUpdatedTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord scheduleEnabledSetting](self, "scheduleEnabledSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](self, "timePeriodStartTimeHour");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](self, "timePeriodStartTimeMinute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](self, "timePeriodEndTimeHour");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](self, "timePeriodEndTimeMinute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord timePeriodWeekdays](self, "timePeriodWeekdays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p; lastUpdatedTimestamp: %@; scheduleEnabledSetting: %@; timePeriodStartTimeHour: %@; timePeriodStartTimeMinute: %@; timePeriodEndTimeHour: %@; timePeriodEndTimeMinute: %@; timePeriodWeekdays: %@; bedtimeBehaviorEnabledSetting: %@>"),
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSScheduleSettingsRecord _initWithRecord:]([DNDSMutableScheduleSettingsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("lastUpdatedTimestamp"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("scheduleEnabledSetting"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("timePeriodStartTimeHour"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("timePeriodStartTimeMinute"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("timePeriodEndTimeHour"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("timePeriodEndTimeMinute"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("timePeriodWeekdays"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("bedtimeBehaviorEnabledSetting"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithLastUpdatedTimestamp:scheduleEnabledSetting:timePeriodStartTimeHour:timePeriodStartTimeMinute:timePeriodEndTimeHour:timePeriodEndTimeMinute:timePeriodWeekdays:bedtimeBehaviorEnabledSetting:", v6, v7, v8, v9, v10, v11, v12, v13);
  return v14;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSScheduleSettingsRecord lastUpdatedTimestamp](self, "lastUpdatedTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("lastUpdatedTimestamp"));

  -[DNDSScheduleSettingsRecord scheduleEnabledSetting](self, "scheduleEnabledSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("scheduleEnabledSetting"));

  -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](self, "timePeriodStartTimeHour");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("timePeriodStartTimeHour"));

  -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](self, "timePeriodStartTimeMinute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("timePeriodStartTimeMinute"));

  -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](self, "timePeriodEndTimeHour");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("timePeriodEndTimeHour"));

  -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](self, "timePeriodEndTimeMinute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("timePeriodEndTimeMinute"));

  -[DNDSScheduleSettingsRecord timePeriodWeekdays](self, "timePeriodWeekdays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timePeriodWeekdays"));

  -[DNDSScheduleSettingsRecord bedtimeBehaviorEnabledSetting](self, "bedtimeBehaviorEnabledSetting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("bedtimeBehaviorEnabledSetting"));

  return v4;
}

- (NSNumber)lastUpdatedTimestamp
{
  return self->_lastUpdatedTimestamp;
}

- (NSNumber)scheduleEnabledSetting
{
  return self->_scheduleEnabledSetting;
}

- (NSNumber)timePeriodStartTimeHour
{
  return self->_timePeriodStartTimeHour;
}

- (NSNumber)timePeriodStartTimeMinute
{
  return self->_timePeriodStartTimeMinute;
}

- (NSNumber)timePeriodEndTimeHour
{
  return self->_timePeriodEndTimeHour;
}

- (NSNumber)timePeriodEndTimeMinute
{
  return self->_timePeriodEndTimeMinute;
}

- (NSNumber)timePeriodWeekdays
{
  return self->_timePeriodWeekdays;
}

- (NSNumber)bedtimeBehaviorEnabledSetting
{
  return self->_bedtimeBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bedtimeBehaviorEnabledSetting, 0);
  objc_storeStrong((id *)&self->_timePeriodWeekdays, 0);
  objc_storeStrong((id *)&self->_timePeriodEndTimeMinute, 0);
  objc_storeStrong((id *)&self->_timePeriodEndTimeHour, 0);
  objc_storeStrong((id *)&self->_timePeriodStartTimeMinute, 0);
  objc_storeStrong((id *)&self->_timePeriodStartTimeHour, 0);
  objc_storeStrong((id *)&self->_scheduleEnabledSetting, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTimestamp, 0);
}

+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("overrideStatus"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("overrideStatusLastCalculatedTime"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 2 || v9 == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v9;
  }
  v13 = v12;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("overrides"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_firstObjectOfClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3710], "dnds_secureLegacyUnarchiverForReadingFromData:error:", v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  objc_msgSend(a1, "recordForLegacyBehaviorOverride:lastUpdated:", v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v18;
}

+ (id)recordForLegacyBehaviorOverride:(id)a3 lastUpdated:(id)a4
{
  id v5;
  id v6;
  DNDSMutableScheduleSettingsRecord *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(DNDSMutableScheduleSettingsRecord);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setLastUpdatedTimestamp:](v7, "setLastUpdatedTimestamp:", v11);

  if (objc_msgSend(v6, "mode") == 3)
    v12 = 2;
  else
    v12 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setScheduleEnabledSetting:](v7, "setScheduleEnabledSetting:", v13);

  objc_msgSend(v6, "effectiveIntervals");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "startComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "hour"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodStartTimeHour:](v7, "setTimePeriodStartTimeHour:", v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "minute"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodStartTimeMinute:](v7, "setTimePeriodStartTimeMinute:", v18);

  objc_msgSend(v15, "endComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "hour"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodEndTimeHour:](v7, "setTimePeriodEndTimeHour:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "minute"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableScheduleSettingsRecord setTimePeriodEndTimeMinute:](v7, "setTimePeriodEndTimeMinute:", v21);

  -[DNDSMutableScheduleSettingsRecord setBedtimeBehaviorEnabledSetting:](v7, "setBedtimeBehaviorEnabledSetting:", &unk_1E86DE628);
  return v7;
}

- (id)legacyBehaviorOverride
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  DNDSLegacyBehaviorOverrideEffectiveInterval *v9;
  uint64_t v10;
  void *v11;
  DNDSLegacyBehaviorOverrideEffectiveInterval *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  DNDSLegacyBehaviorOverride *v16;
  void *v17;
  DNDSLegacyBehaviorOverride *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  -[DNDSScheduleSettingsRecord timePeriodStartTimeHour](self, "timePeriodStartTimeHour");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHour:", objc_msgSend(v4, "unsignedIntegerValue"));

  -[DNDSScheduleSettingsRecord timePeriodStartTimeMinute](self, "timePeriodStartTimeMinute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinute:", objc_msgSend(v5, "unsignedIntegerValue"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  -[DNDSScheduleSettingsRecord timePeriodEndTimeHour](self, "timePeriodEndTimeHour");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHour:", objc_msgSend(v7, "unsignedIntegerValue"));

  -[DNDSScheduleSettingsRecord timePeriodEndTimeMinute](self, "timePeriodEndTimeMinute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinute:", objc_msgSend(v8, "unsignedIntegerValue"));

  v9 = [DNDSLegacyBehaviorOverrideEffectiveInterval alloc];
  v10 = *MEMORY[0x1E0C996C8];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DNDSLegacyBehaviorOverrideEffectiveInterval initWithStartComponents:endComponents:calendarIdentifier:repeatInterval:identifier:](v9, "initWithStartComponents:endComponents:calendarIdentifier:repeatInterval:identifier:", v3, v6, v10, 16, v11);

  -[DNDSScheduleSettingsRecord scheduleEnabledSetting](self, "scheduleEnabledSetting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsignedIntegerValue");
  v14 = DNDResolvedScheduleEnabledSetting();

  if (v14 == 2)
    v15 = 3;
  else
    v15 = 0;
  v16 = [DNDSLegacyBehaviorOverride alloc];
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[DNDSLegacyBehaviorOverride initWithOverrideType:mode:effectiveIntervals:](v16, "initWithOverrideType:mode:effectiveIntervals:", 1, v15, v17);

  return v18;
}

@end
