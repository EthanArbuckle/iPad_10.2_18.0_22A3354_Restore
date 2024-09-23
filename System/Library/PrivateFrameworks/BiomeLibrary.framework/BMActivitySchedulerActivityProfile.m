@implementation BMActivitySchedulerActivityProfile

- (BMActivitySchedulerActivityProfile)initWithBundleID:(id)a3 activityname:(id)a4 completed:(id)a5 CPUAwakeTime:(id)a6 CPUTime:(id)a7 endBatteryTemperature:(id)a8 endTime:(id)a9 endedInIdle:(id)a10 endedOnBattery:(id)a11 networkProfSuccess:(id)a12 qosBackground:(id)a13 qosLegacy:(id)a14 qosUserInit:(id)a15 runTime:(id)a16 rusageProfSuccess:(id)a17 servicedEnergy:(id)a18 sessionProfSuccess:(id)a19 startBatteryTemperature:(id)a20 startTime:(id)a21 startedInIdle:(id)a22 startedOnBattery:(id)a23 version:(id)a24 wifiDown:(id)a25 wifiUp:(id)a26 dirtyMemoryDelta:(id)a27
{
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  BMActivitySchedulerActivityProfile *v41;
  int v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  int v51;
  double v52;
  int v53;
  int v54;
  int v55;
  int v56;
  id v59;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  objc_super v77;

  v62 = a3;
  v59 = a4;
  v61 = a4;
  v76 = a5;
  v75 = a6;
  v74 = a7;
  v73 = a8;
  v32 = a9;
  v72 = a10;
  v71 = a11;
  v70 = a12;
  v69 = a13;
  v68 = a14;
  v67 = a15;
  v66 = a16;
  v65 = a17;
  v33 = a18;
  v64 = a19;
  v63 = a20;
  v34 = a21;
  v35 = a22;
  v36 = a23;
  v37 = a24;
  v38 = a25;
  v39 = a26;
  v40 = a27;
  v77.receiver = self;
  v77.super_class = (Class)BMActivitySchedulerActivityProfile;
  v41 = -[BMEventBase init](&v77, sel_init);
  if (v41)
  {
    v41->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v41->_bundleID, a3);
    objc_storeStrong((id *)&v41->_activityname, v59);
    if (v76)
    {
      v41->_hasCompleted = 1;
      v41->_completed = objc_msgSend(v76, "BOOLValue");
    }
    else
    {
      v41->_hasCompleted = 0;
      v41->_completed = 0;
    }
    if (v75)
    {
      v41->_hasCPUAwakeTime = 1;
      v42 = objc_msgSend(v75, "intValue");
    }
    else
    {
      v41->_hasCPUAwakeTime = 0;
      v42 = -1;
    }
    v41->_CPUAwakeTime = v42;
    if (v74)
    {
      v41->_hasCPUTime = 1;
      objc_msgSend(v74, "doubleValue");
    }
    else
    {
      v41->_hasCPUTime = 0;
      v43 = -1.0;
    }
    v41->_CPUTime = v43;
    if (v73)
    {
      v41->_hasEndBatteryTemperature = 1;
      v44 = objc_msgSend(v73, "intValue");
    }
    else
    {
      v41->_hasEndBatteryTemperature = 0;
      v44 = -1;
    }
    v41->_endBatteryTemperature = v44;
    if (v32)
    {
      v41->_hasRaw_endTime = 1;
      objc_msgSend(v32, "timeIntervalSince1970");
    }
    else
    {
      v41->_hasRaw_endTime = 0;
      v45 = -1.0;
    }
    v41->_raw_endTime = v45;
    if (v72)
    {
      v41->_hasEndedInIdle = 1;
      v41->_endedInIdle = objc_msgSend(v72, "BOOLValue");
    }
    else
    {
      v41->_hasEndedInIdle = 0;
      v41->_endedInIdle = 0;
    }
    if (v71)
    {
      v41->_hasEndedOnBattery = 1;
      v41->_endedOnBattery = objc_msgSend(v71, "BOOLValue");
    }
    else
    {
      v41->_hasEndedOnBattery = 0;
      v41->_endedOnBattery = 0;
    }
    if (v70)
    {
      v41->_hasNetworkProfSuccess = 1;
      v41->_networkProfSuccess = objc_msgSend(v70, "BOOLValue");
    }
    else
    {
      v41->_hasNetworkProfSuccess = 0;
      v41->_networkProfSuccess = 0;
    }
    if (v69)
    {
      v41->_hasQosBackground = 1;
      objc_msgSend(v69, "doubleValue");
    }
    else
    {
      v41->_hasQosBackground = 0;
      v46 = -1.0;
    }
    v41->_qosBackground = v46;
    if (v68)
    {
      v41->_hasQosLegacy = 1;
      objc_msgSend(v68, "doubleValue");
    }
    else
    {
      v41->_hasQosLegacy = 0;
      v47 = -1.0;
    }
    v41->_qosLegacy = v47;
    if (v67)
    {
      v41->_hasQosUserInit = 1;
      objc_msgSend(v67, "doubleValue");
    }
    else
    {
      v41->_hasQosUserInit = 0;
      v48 = -1.0;
    }
    v41->_qosUserInit = v48;
    if (v66)
    {
      v41->_hasRunTime = 1;
      objc_msgSend(v66, "doubleValue");
    }
    else
    {
      v41->_hasRunTime = 0;
      v49 = -1.0;
    }
    v41->_runTime = v49;
    if (v65)
    {
      v41->_hasRusageProfSuccess = 1;
      v41->_rusageProfSuccess = objc_msgSend(v65, "BOOLValue");
    }
    else
    {
      v41->_hasRusageProfSuccess = 0;
      v41->_rusageProfSuccess = 0;
    }
    if (v33)
    {
      v41->_hasServicedEnergy = 1;
      v50 = objc_msgSend(v33, "intValue");
    }
    else
    {
      v41->_hasServicedEnergy = 0;
      v50 = -1;
    }
    v41->_servicedEnergy = v50;
    if (v64)
    {
      v41->_hasSessionProfSuccess = 1;
      v41->_sessionProfSuccess = objc_msgSend(v64, "BOOLValue");
    }
    else
    {
      v41->_hasSessionProfSuccess = 0;
      v41->_sessionProfSuccess = 0;
    }
    if (v63)
    {
      v41->_hasStartBatteryTemperature = 1;
      v51 = objc_msgSend(v63, "intValue");
    }
    else
    {
      v41->_hasStartBatteryTemperature = 0;
      v51 = -1;
    }
    v41->_startBatteryTemperature = v51;
    if (v34)
    {
      v41->_hasRaw_startTime = 1;
      objc_msgSend(v34, "timeIntervalSince1970");
    }
    else
    {
      v41->_hasRaw_startTime = 0;
      v52 = -1.0;
    }
    v41->_raw_startTime = v52;
    if (v35)
    {
      v41->_hasStartedInIdle = 1;
      v41->_startedInIdle = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v41->_hasStartedInIdle = 0;
      v41->_startedInIdle = 0;
    }
    if (v36)
    {
      v41->_hasStartedOnBattery = 1;
      v41->_startedOnBattery = objc_msgSend(v36, "BOOLValue");
    }
    else
    {
      v41->_hasStartedOnBattery = 0;
      v41->_startedOnBattery = 0;
    }
    if (v37)
    {
      v41->_hasVersion = 1;
      v53 = objc_msgSend(v37, "intValue");
    }
    else
    {
      v41->_hasVersion = 0;
      v53 = -1;
    }
    v41->_version = v53;
    if (v38)
    {
      v41->_hasWifiDown = 1;
      v54 = objc_msgSend(v38, "intValue");
    }
    else
    {
      v41->_hasWifiDown = 0;
      v54 = -1;
    }
    v41->_wifiDown = v54;
    if (v39)
    {
      v41->_hasWifiUp = 1;
      v55 = objc_msgSend(v39, "intValue");
    }
    else
    {
      v41->_hasWifiUp = 0;
      v55 = -1;
    }
    v41->_wifiUp = v55;
    if (v40)
    {
      v41->_hasDirtyMemoryDelta = 1;
      v56 = objc_msgSend(v40, "intValue");
    }
    else
    {
      v41->_hasDirtyMemoryDelta = 0;
      v56 = -1;
    }
    v41->_dirtyMemoryDelta = v56;
  }

  return v41;
}

- (NSString)description
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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

  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMActivitySchedulerActivityProfile bundleID](self, "bundleID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMActivitySchedulerActivityProfile activityname](self, "activityname");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile completed](self, "completed"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile CPUAwakeTime](self, "CPUAwakeTime"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMActivitySchedulerActivityProfile CPUTime](self, "CPUTime");
  objc_msgSend(v3, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile endBatteryTemperature](self, "endBatteryTemperature"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMActivitySchedulerActivityProfile endTime](self, "endTime");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile endedInIdle](self, "endedInIdle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile endedOnBattery](self, "endedOnBattery"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile networkProfSuccess](self, "networkProfSuccess"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMActivitySchedulerActivityProfile qosBackground](self, "qosBackground");
  objc_msgSend(v4, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMActivitySchedulerActivityProfile qosLegacy](self, "qosLegacy");
  objc_msgSend(v5, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMActivitySchedulerActivityProfile qosUserInit](self, "qosUserInit");
  objc_msgSend(v6, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMActivitySchedulerActivityProfile runTime](self, "runTime");
  objc_msgSend(v7, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile rusageProfSuccess](self, "rusageProfSuccess"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile servicedEnergy](self, "servicedEnergy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile sessionProfSuccess](self, "sessionProfSuccess"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile startBatteryTemperature](self, "startBatteryTemperature"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMActivitySchedulerActivityProfile startTime](self, "startTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile startedInIdle](self, "startedInIdle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile startedOnBattery](self, "startedOnBattery"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile version](self, "version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiDown](self, "wifiDown"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiUp](self, "wifiUp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile dirtyMemoryDelta](self, "dirtyMemoryDelta"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("BMActivitySchedulerActivityProfile with bundleID: %@, activityname: %@, completed: %@, CPUAwakeTime: %@, CPUTime: %@, endBatteryTemperature: %@, endTime: %@, endedInIdle: %@, endedOnBattery: %@, networkProfSuccess: %@, qosBackground: %@, qosLegacy: %@, qosUserInit: %@, runTime: %@, rusageProfSuccess: %@, servicedEnergy: %@, sessionProfSuccess: %@, startBatteryTemperature: %@, startTime: %@, startedInIdle: %@, startedOnBattery: %@, version: %@, wifiDown: %@, wifiUp: %@, dirtyMemoryDelta: %@"), v35, v34, v33, v32, v31, v29, v28, v27, v25, v30, v26, v21, v24, v20, v17, v19,
                  v18,
                  v16,
                  v8,
                  v15,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13);

  return (NSString *)v23;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMActivitySchedulerActivityProfile *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  objc_class *v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  char v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  char v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char v124;
  char v125;
  unsigned int v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char v130;
  char v131;
  unsigned int v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char v136;
  char v137;
  unsigned int v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  char v142;
  BOOL v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  BMActivitySchedulerActivityProfile *v147;
  objc_super v149;

  v4 = a3;
  v149.receiver = self;
  v149.super_class = (Class)BMActivitySchedulerActivityProfile;
  v5 = -[BMEventBase init](&v149, sel_init);
  if (!v5)
    goto LABEL_242;
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
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 120;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 128;
LABEL_24:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasCompleted = 1;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_161:
          v143 = v25 != 0;
          v144 = 48;
          goto LABEL_206;
        case 4u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasCPUAwakeTime = 1;
          while (2)
          {
            v33 = *v6;
            v34 = *(_QWORD *)&v4[v33];
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
              *(_QWORD *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_165;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_165:
          v145 = 84;
          goto LABEL_223;
        case 5u:
          v5->_hasCPUTime = 1;
          v37 = *v6;
          v38 = *(_QWORD *)&v4[v37];
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v39 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v38);
            *(_QWORD *)&v4[v37] = v38 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v39 = 0;
          }
          v146 = 136;
          goto LABEL_238;
        case 6u:
          v40 = 0;
          v41 = 0;
          v32 = 0;
          v5->_hasEndBatteryTemperature = 1;
          while (2)
          {
            v42 = *v6;
            v43 = *(_QWORD *)&v4[v42];
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
              *(_QWORD *)&v4[v42] = v44;
              v32 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                v17 = v41++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_169;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_169:
          v145 = 88;
          goto LABEL_223;
        case 7u:
          v5->_hasRaw_endTime = 1;
          v46 = *v6;
          v47 = *(_QWORD *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v39 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v47);
            *(_QWORD *)&v4[v46] = v47 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v39 = 0;
          }
          v146 = 24;
          goto LABEL_238;
        case 8u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v5->_hasEndedInIdle = 1;
          while (2)
          {
            v51 = *v6;
            v52 = *(_QWORD *)&v4[v51];
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v52);
              *(_QWORD *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                v17 = v49++ >= 9;
                if (v17)
                {
                  v50 = 0;
                  goto LABEL_173;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v50 = 0;
LABEL_173:
          v143 = v50 != 0;
          v144 = 53;
          goto LABEL_206;
        case 9u:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v5->_hasEndedOnBattery = 1;
          while (2)
          {
            v58 = *v6;
            v59 = *(_QWORD *)&v4[v58];
            v60 = v59 + 1;
            if (v59 == -1 || v60 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v59);
              *(_QWORD *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                v17 = v56++ >= 9;
                if (v17)
                {
                  v57 = 0;
                  goto LABEL_177;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v57 = 0;
LABEL_177:
          v143 = v57 != 0;
          v144 = 55;
          goto LABEL_206;
        case 0xAu:
          v62 = 0;
          v63 = 0;
          v64 = 0;
          v5->_hasNetworkProfSuccess = 1;
          while (2)
          {
            v65 = *v6;
            v66 = *(_QWORD *)&v4[v65];
            v67 = v66 + 1;
            if (v66 == -1 || v67 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v66);
              *(_QWORD *)&v4[v65] = v67;
              v64 |= (unint64_t)(v68 & 0x7F) << v62;
              if (v68 < 0)
              {
                v62 += 7;
                v17 = v63++ >= 9;
                if (v17)
                {
                  v64 = 0;
                  goto LABEL_181;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v64 = 0;
LABEL_181:
          v143 = v64 != 0;
          v144 = 57;
          goto LABEL_206;
        case 0xBu:
          v5->_hasQosBackground = 1;
          v69 = *v6;
          v70 = *(_QWORD *)&v4[v69];
          if (v70 <= 0xFFFFFFFFFFFFFFF7 && v70 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v39 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v70);
            *(_QWORD *)&v4[v69] = v70 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v39 = 0;
          }
          v146 = 144;
          goto LABEL_238;
        case 0xCu:
          v5->_hasQosLegacy = 1;
          v71 = *v6;
          v72 = *(_QWORD *)&v4[v71];
          if (v72 <= 0xFFFFFFFFFFFFFFF7 && v72 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v39 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v72);
            *(_QWORD *)&v4[v71] = v72 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v39 = 0;
          }
          v146 = 152;
          goto LABEL_238;
        case 0xDu:
          v5->_hasQosUserInit = 1;
          v73 = *v6;
          v74 = *(_QWORD *)&v4[v73];
          if (v74 <= 0xFFFFFFFFFFFFFFF7 && v74 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v39 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v74);
            *(_QWORD *)&v4[v73] = v74 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v39 = 0;
          }
          v146 = 160;
          goto LABEL_238;
        case 0xEu:
          v5->_hasRunTime = 1;
          v75 = *v6;
          v76 = *(_QWORD *)&v4[v75];
          if (v76 <= 0xFFFFFFFFFFFFFFF7 && v76 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v39 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v76);
            *(_QWORD *)&v4[v75] = v76 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v39 = 0;
          }
          v146 = 168;
          goto LABEL_238;
        case 0xFu:
          v77 = 0;
          v78 = 0;
          v79 = 0;
          v5->_hasRusageProfSuccess = 1;
          while (2)
          {
            v80 = *v6;
            v81 = *(_QWORD *)&v4[v80];
            v82 = v81 + 1;
            if (v81 == -1 || v82 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v83 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v81);
              *(_QWORD *)&v4[v80] = v82;
              v79 |= (unint64_t)(v83 & 0x7F) << v77;
              if (v83 < 0)
              {
                v77 += 7;
                v17 = v78++ >= 9;
                if (v17)
                {
                  v79 = 0;
                  goto LABEL_185;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v79 = 0;
LABEL_185:
          v143 = v79 != 0;
          v144 = 63;
          goto LABEL_206;
        case 0x10u:
          v84 = 0;
          v85 = 0;
          v32 = 0;
          v5->_hasServicedEnergy = 1;
          while (2)
          {
            v86 = *v6;
            v87 = *(_QWORD *)&v4[v86];
            v88 = v87 + 1;
            if (v87 == -1 || v88 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v89 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v87);
              *(_QWORD *)&v4[v86] = v88;
              v32 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                v17 = v85++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_189;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_189:
          v145 = 92;
          goto LABEL_223;
        case 0x11u:
          v90 = 0;
          v91 = 0;
          v92 = 0;
          v5->_hasSessionProfSuccess = 1;
          while (2)
          {
            v93 = *v6;
            v94 = *(_QWORD *)&v4[v93];
            v95 = v94 + 1;
            if (v94 == -1 || v95 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v96 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v94);
              *(_QWORD *)&v4[v93] = v95;
              v92 |= (unint64_t)(v96 & 0x7F) << v90;
              if (v96 < 0)
              {
                v90 += 7;
                v17 = v91++ >= 9;
                if (v17)
                {
                  v92 = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v92 = 0;
LABEL_193:
          v143 = v92 != 0;
          v144 = 66;
          goto LABEL_206;
        case 0x12u:
          v97 = 0;
          v98 = 0;
          v32 = 0;
          v5->_hasStartBatteryTemperature = 1;
          while (2)
          {
            v99 = *v6;
            v100 = *(_QWORD *)&v4[v99];
            v101 = v100 + 1;
            if (v100 == -1 || v101 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v102 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v100);
              *(_QWORD *)&v4[v99] = v101;
              v32 |= (unint64_t)(v102 & 0x7F) << v97;
              if (v102 < 0)
              {
                v97 += 7;
                v17 = v98++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_197:
          v145 = 96;
          goto LABEL_223;
        case 0x13u:
          v5->_hasRaw_startTime = 1;
          v103 = *v6;
          v104 = *(_QWORD *)&v4[v103];
          if (v104 <= 0xFFFFFFFFFFFFFFF7 && v104 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v39 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v104);
            *(_QWORD *)&v4[v103] = v104 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v39 = 0;
          }
          v146 = 40;
LABEL_238:
          *(Class *)((char *)&v5->super.super.isa + v146) = v39;
          continue;
        case 0x14u:
          v105 = 0;
          v106 = 0;
          v107 = 0;
          v5->_hasStartedInIdle = 1;
          while (2)
          {
            v108 = *v6;
            v109 = *(_QWORD *)&v4[v108];
            v110 = v109 + 1;
            if (v109 == -1 || v110 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v111 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v109);
              *(_QWORD *)&v4[v108] = v110;
              v107 |= (unint64_t)(v111 & 0x7F) << v105;
              if (v111 < 0)
              {
                v105 += 7;
                v17 = v106++ >= 9;
                if (v17)
                {
                  v107 = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v107 = 0;
LABEL_201:
          v143 = v107 != 0;
          v144 = 69;
          goto LABEL_206;
        case 0x15u:
          v112 = 0;
          v113 = 0;
          v114 = 0;
          v5->_hasStartedOnBattery = 1;
          while (2)
          {
            v115 = *v6;
            v116 = *(_QWORD *)&v4[v115];
            v117 = v116 + 1;
            if (v116 == -1 || v117 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v118 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v116);
              *(_QWORD *)&v4[v115] = v117;
              v114 |= (unint64_t)(v118 & 0x7F) << v112;
              if (v118 < 0)
              {
                v112 += 7;
                v17 = v113++ >= 9;
                if (v17)
                {
                  v114 = 0;
                  goto LABEL_205;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v114 = 0;
LABEL_205:
          v143 = v114 != 0;
          v144 = 71;
LABEL_206:
          *((_BYTE *)&v5->super.super.isa + v144) = v143;
          continue;
        case 0x16u:
          v119 = 0;
          v120 = 0;
          v32 = 0;
          v5->_hasVersion = 1;
          while (2)
          {
            v121 = *v6;
            v122 = *(_QWORD *)&v4[v121];
            v123 = v122 + 1;
            if (v122 == -1 || v123 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v124 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v122);
              *(_QWORD *)&v4[v121] = v123;
              v32 |= (unint64_t)(v124 & 0x7F) << v119;
              if (v124 < 0)
              {
                v119 += 7;
                v17 = v120++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_210;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_210:
          v145 = 100;
          goto LABEL_223;
        case 0x17u:
          v125 = 0;
          v126 = 0;
          v32 = 0;
          v5->_hasWifiDown = 1;
          while (2)
          {
            v127 = *v6;
            v128 = *(_QWORD *)&v4[v127];
            v129 = v128 + 1;
            if (v128 == -1 || v129 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v130 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v128);
              *(_QWORD *)&v4[v127] = v129;
              v32 |= (unint64_t)(v130 & 0x7F) << v125;
              if (v130 < 0)
              {
                v125 += 7;
                v17 = v126++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_214;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_214:
          v145 = 104;
          goto LABEL_223;
        case 0x18u:
          v131 = 0;
          v132 = 0;
          v32 = 0;
          v5->_hasWifiUp = 1;
          while (2)
          {
            v133 = *v6;
            v134 = *(_QWORD *)&v4[v133];
            v135 = v134 + 1;
            if (v134 == -1 || v135 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v136 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v134);
              *(_QWORD *)&v4[v133] = v135;
              v32 |= (unint64_t)(v136 & 0x7F) << v131;
              if (v136 < 0)
              {
                v131 += 7;
                v17 = v132++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_218;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v32) = 0;
LABEL_218:
          v145 = 108;
          goto LABEL_223;
        case 0x19u:
          v137 = 0;
          v138 = 0;
          v32 = 0;
          v5->_hasDirtyMemoryDelta = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_241;
          continue;
      }
      while (1)
      {
        v139 = *v6;
        v140 = *(_QWORD *)&v4[v139];
        v141 = v140 + 1;
        if (v140 == -1 || v141 > *(_QWORD *)&v4[*v7])
          break;
        v142 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v140);
        *(_QWORD *)&v4[v139] = v141;
        v32 |= (unint64_t)(v142 & 0x7F) << v137;
        if ((v142 & 0x80) == 0)
          goto LABEL_220;
        v137 += 7;
        v17 = v138++ >= 9;
        if (v17)
        {
          LODWORD(v32) = 0;
          goto LABEL_222;
        }
      }
      v4[*v8] = 1;
LABEL_220:
      if (v4[*v8])
        LODWORD(v32) = 0;
LABEL_222:
      v145 = 112;
LABEL_223:
      *(_DWORD *)((char *)&v5->super.super.isa + v145) = v32;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_241:
    v147 = 0;
  else
LABEL_242:
    v147 = v5;

  return v147;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_activityname)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasCompleted)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasCPUAwakeTime)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasCPUTime)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasEndBatteryTemperature)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRaw_endTime)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasEndedInIdle)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasEndedOnBattery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasNetworkProfSuccess)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasQosBackground)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasQosLegacy)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasQosUserInit)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRunTime)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRusageProfSuccess)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasServicedEnergy)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasSessionProfSuccess)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasStartBatteryTemperature)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRaw_startTime)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasStartedInIdle)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasStartedOnBattery)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasVersion)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasWifiDown)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasWifiUp)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasDirtyMemoryDelta)
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
  -[BMActivitySchedulerActivityProfile writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMActivitySchedulerActivityProfile)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  BMActivitySchedulerActivityProfile *v20;
  id v21;
  id *v22;
  BMActivitySchedulerActivityProfile *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  BMActivitySchedulerActivityProfile *v29;
  id v30;
  void *v31;
  BMActivitySchedulerActivityProfile *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id *v40;
  BMActivitySchedulerActivityProfile *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id *v47;
  BMActivitySchedulerActivityProfile *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id *v54;
  BMActivitySchedulerActivityProfile *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  BMActivitySchedulerActivityProfile *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  BMActivitySchedulerActivityProfile *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  BMActivitySchedulerActivityProfile *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  BMActivitySchedulerActivityProfile *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  BMActivitySchedulerActivityProfile *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  BMActivitySchedulerActivityProfile *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  BMActivitySchedulerActivityProfile *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  BMActivitySchedulerActivityProfile *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  id v125;
  id v126;
  BMActivitySchedulerActivityProfile *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  BMActivitySchedulerActivityProfile *v133;
  id v134;
  void *v135;
  id v136;
  id v137;
  BMActivitySchedulerActivityProfile *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  BMActivitySchedulerActivityProfile *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  BMActivitySchedulerActivityProfile *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  id v166;
  BMActivitySchedulerActivityProfile *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  BMActivitySchedulerActivityProfile *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  BMActivitySchedulerActivityProfile *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  BMActivitySchedulerActivityProfile *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  id v186;
  void *v187;
  void *v188;
  BMActivitySchedulerActivityProfile *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  BMActivitySchedulerActivityProfile *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  uint64_t v198;
  BMActivitySchedulerActivityProfile *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  id v204;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  void *v210;
  id v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  id v217;
  id v218;
  id v219;
  void *v220;
  id v221;
  void *v222;
  id v223;
  void *v224;
  id v225;
  void *v226;
  id v227;
  void *v228;
  id v229;
  void *v230;
  id v231;
  void *v232;
  id v233;
  id v234;
  void *v235;
  id v236;
  void *v237;
  void *v238;
  id v239;
  void *v240;
  id v241;
  id v242;
  void *v243;
  void *v244;
  id v245;
  void *v246;
  id v247;
  id v248;
  void *v249;
  id v250;
  void *v251;
  id v252;
  id v253;
  id v254;
  uint64_t v255;
  void *v256;
  uint64_t v257;
  void *v258;
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
  id v290;
  uint64_t v291;
  id v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  id v296;
  uint64_t v297;
  id v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  uint64_t v303;
  _QWORD v304[3];

  v304[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v254 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v254 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityname"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v253 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v253 = v8;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("completed"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v250 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v250 = v9;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CPUAwakeTime"));
        v10 = objc_claimAutoreleasedReturnValue();
        v251 = (void *)v10;
        if (!v10 || (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v247 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v247 = v11;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CPUTime"));
          v12 = objc_claimAutoreleasedReturnValue();
          v249 = (void *)v12;
          if (!v12 || (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v248 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v248 = v13;
LABEL_16:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endBatteryTemperature"));
            v14 = objc_claimAutoreleasedReturnValue();
            v246 = (void *)v14;
            if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v245 = 0;
LABEL_19:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endTime"));
              v16 = (id)objc_claimAutoreleasedReturnValue();
              v244 = v16;
              if (!v16)
              {
LABEL_53:
                v241 = v16;
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endedInIdle"));
                v64 = objc_claimAutoreleasedReturnValue();
                v243 = (void *)v64;
                if (!v64)
                {
                  v242 = 0;
                  v66 = a4;
                  goto LABEL_59;
                }
                v65 = (void *)v64;
                objc_opt_class();
                v66 = a4;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v242 = 0;
                  goto LABEL_59;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v242 = v65;
LABEL_59:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endedOnBattery"));
                  v67 = objc_claimAutoreleasedReturnValue();
                  v240 = (void *)v67;
                  if (!v67 || (v68 = (void *)v67, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v239 = 0;
                    goto LABEL_62;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v239 = v68;
LABEL_62:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("networkProfSuccess"));
                    v69 = objc_claimAutoreleasedReturnValue();
                    v237 = (void *)v69;
                    if (!v69 || (v70 = (void *)v69, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v236 = 0;
                      goto LABEL_65;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v236 = v70;
LABEL_65:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("qosBackground"));
                      v71 = objc_claimAutoreleasedReturnValue();
                      v235 = (void *)v71;
                      if (!v71 || (v72 = (void *)v71, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v234 = 0;
                        goto LABEL_68;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v234 = v72;
LABEL_68:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("qosLegacy"));
                        v73 = objc_claimAutoreleasedReturnValue();
                        v232 = (void *)v73;
                        if (!v73 || (v74 = (void *)v73, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v233 = 0;
                          goto LABEL_71;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v233 = v74;
LABEL_71:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("qosUserInit"));
                          v75 = objc_claimAutoreleasedReturnValue();
                          v230 = (void *)v75;
                          if (!v75 || (v76 = (void *)v75, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v231 = 0;
                            goto LABEL_74;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v231 = v76;
LABEL_74:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("runTime"));
                            v77 = objc_claimAutoreleasedReturnValue();
                            v228 = (void *)v77;
                            if (!v77 || (v78 = (void *)v77, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v229 = 0;
                              goto LABEL_77;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v229 = v78;
LABEL_77:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rusageProfSuccess"));
                              v79 = objc_claimAutoreleasedReturnValue();
                              v226 = (void *)v79;
                              if (!v79 || (v80 = (void *)v79, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v227 = 0;
                                goto LABEL_80;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v227 = v80;
LABEL_80:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("servicedEnergy"));
                                v81 = objc_claimAutoreleasedReturnValue();
                                v224 = (void *)v81;
                                if (!v81 || (v82 = (void *)v81, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v225 = 0;
                                  goto LABEL_83;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v225 = v82;
LABEL_83:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionProfSuccess"));
                                  v83 = objc_claimAutoreleasedReturnValue();
                                  v222 = (void *)v83;
                                  if (!v83
                                    || (v84 = (void *)v83, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v223 = 0;
                                    goto LABEL_86;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v223 = v84;
LABEL_86:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startBatteryTemperature"));
                                    v85 = objc_claimAutoreleasedReturnValue();
                                    v220 = (void *)v85;
                                    if (!v85
                                      || (v86 = (void *)v85, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v221 = 0;
                                      goto LABEL_89;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v221 = v86;
LABEL_89:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startTime"));
                                      v87 = objc_claimAutoreleasedReturnValue();
                                      v216 = (void *)v87;
                                      if (!v87
                                        || (v88 = (void *)v87, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v218 = 0;
                                        goto LABEL_161;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v124 = v88;
                                        v125 = objc_alloc(MEMORY[0x1E0C99D68]);
                                        objc_msgSend(v124, "doubleValue");
                                        v218 = (id)objc_msgSend(v125, "initWithTimeIntervalSince1970:");
LABEL_160:

                                        goto LABEL_161;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v124 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                        v152 = v88;
                                        objc_msgSend(v124, "dateFromString:", v152);
                                        v218 = (id)objc_claimAutoreleasedReturnValue();

                                        goto LABEL_160;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v218 = v88;
LABEL_161:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startedInIdle"));
                                        v153 = objc_claimAutoreleasedReturnValue();
                                        v214 = (void *)v153;
                                        if (!v153
                                          || (v154 = (void *)v153, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v217 = 0;
                                          goto LABEL_164;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v217 = v154;
LABEL_164:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startedOnBattery"));
                                          v155 = objc_claimAutoreleasedReturnValue();
                                          v213 = (void *)v155;
                                          if (!v155
                                            || (v156 = (void *)v155,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v215 = 0;
                                            goto LABEL_167;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v215 = v156;
LABEL_167:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
                                            v157 = objc_claimAutoreleasedReturnValue();
                                            v210 = (void *)v157;
                                            if (!v157
                                              || (v158 = (void *)v157,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v212 = 0;
                                              goto LABEL_170;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v212 = v158;
LABEL_170:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wifiDown"));
                                              v159 = objc_claimAutoreleasedReturnValue();
                                              v208 = (void *)v159;
                                              if (!v159
                                                || (v160 = (void *)v159,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v211 = 0;
                                                goto LABEL_173;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v211 = v160;
LABEL_173:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wifiUp"));
                                                v161 = objc_claimAutoreleasedReturnValue();
                                                v207 = (void *)v161;
                                                if (!v161
                                                  || (v162 = (void *)v161,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v209 = 0;
LABEL_176:
                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dirtyMemoryDelta"));
                                                  v163 = (id)objc_claimAutoreleasedReturnValue();
                                                  v206 = v163;
                                                  if (!v163)
                                                  {
LABEL_179:
                                                    v25 = v250;
                                                    v38 = v247;
LABEL_180:
                                                    v165 = v163;
                                                    v61 = v241;
                                                    self = objc_retain(-[BMActivitySchedulerActivityProfile initWithBundleID:activityname:completed:CPUAwakeTime:CPUTime:endBatteryTemperature:endTime:endedInIdle:endedOnBattery:networkProfSuccess:qosBackground:qosLegacy:qosUserInit:runTime:rusageProfSuccess:servicedEnergy:sessionProfSuccess:startBatteryTemperature:startTime:startedInIdle:startedOnBattery:version:wifiDown:wifiUp:dirtyMemoryDelta:](self, "initWithBundleID:activityname:completed:CPUAwakeTime:CPUTime:endBatteryTemperature:endTime:endedInIdle:endedOnBattery:networkProfSuccess:qosBackground:qosLegacy:qosUserInit:runTime:rusageProfSuccess:servicedEnergy:sessionProfSuccess:startBatteryTemperature:startTime:startedInIdle:startedOnBattery:version:wifiDown:wifiUp:dirtyMemoryDelta:", v254, v253, v25, v38, v248, v245, v241, v242, v239, v236, v234,
                                                               v233,
                                                               v231,
                                                               v229,
                                                               v227,
                                                               v225,
                                                               v223,
                                                               v221,
                                                               v218,
                                                               v217,
                                                               v215,
                                                               v212,
                                                               v211,
                                                               v209,
                                                               v163));
                                                    v20 = self;
LABEL_220:

LABEL_221:
LABEL_222:

LABEL_223:
LABEL_224:

LABEL_225:
                                                    goto LABEL_226;
                                                  }
                                                  v164 = v163;
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v163 = 0;
                                                    goto LABEL_179;
                                                  }
                                                  objc_opt_class();
                                                  v25 = v250;
                                                  v38 = v247;
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v163 = v164;
                                                    goto LABEL_180;
                                                  }
                                                  if (v66)
                                                  {
                                                    v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v194 = self;
                                                    v195 = *MEMORY[0x1E0D025B8];
                                                    v255 = *MEMORY[0x1E0CB2D50];
                                                    v196 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("dirtyMemoryDelta"));
                                                    v256 = v196;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v256, &v255, 1);
                                                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v198 = v195;
                                                    self = v194;
                                                    *v66 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v198, 2, v197);

                                                    v38 = v247;
                                                    v25 = v250;

                                                  }
                                                  v165 = 0;
                                                  v20 = 0;
LABEL_219:
                                                  v61 = v241;
                                                  goto LABEL_220;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v209 = v162;
                                                  goto LABEL_176;
                                                }
                                                if (v66)
                                                {
                                                  v186 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v238 = v7;
                                                  v187 = v8;
                                                  v188 = v9;
                                                  v189 = self;
                                                  v190 = *MEMORY[0x1E0D025B8];
                                                  v257 = *MEMORY[0x1E0CB2D50];
                                                  v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("wifiUp"));
                                                  v258 = v165;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
                                                  v191 = objc_claimAutoreleasedReturnValue();
                                                  v192 = v190;
                                                  self = v189;
                                                  v9 = v188;
                                                  v8 = v187;
                                                  v7 = v238;
                                                  v206 = (void *)v191;
                                                  v20 = 0;
                                                  v209 = 0;
                                                  *v66 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v192, 2);
                                                  v25 = v250;
                                                  v38 = v247;
                                                  goto LABEL_219;
                                                }
                                                v209 = 0;
                                                v20 = 0;
LABEL_256:
                                                v25 = v250;
                                                v38 = v247;
                                                v61 = v241;
                                                goto LABEL_221;
                                              }
                                              if (v66)
                                              {
                                                v181 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v182 = self;
                                                v183 = *MEMORY[0x1E0D025B8];
                                                v259 = *MEMORY[0x1E0CB2D50];
                                                v209 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("wifiDown"));
                                                v260 = v209;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v260, &v259, 1);
                                                v184 = objc_claimAutoreleasedReturnValue();
                                                v185 = v183;
                                                self = v182;
                                                v207 = (void *)v184;
                                                v20 = 0;
                                                v211 = 0;
                                                *v66 = (id)objc_msgSend(v181, "initWithDomain:code:userInfo:", v185, 2);
                                                goto LABEL_256;
                                              }
                                              v211 = 0;
                                              v20 = 0;
LABEL_254:
                                              v25 = v250;
                                              v38 = v247;
                                              v61 = v241;
                                              goto LABEL_222;
                                            }
                                            if (v66)
                                            {
                                              v176 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v177 = self;
                                              v178 = *MEMORY[0x1E0D025B8];
                                              v261 = *MEMORY[0x1E0CB2D50];
                                              v211 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("version"));
                                              v262 = v211;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v262, &v261, 1);
                                              v179 = objc_claimAutoreleasedReturnValue();
                                              v180 = v178;
                                              self = v177;
                                              v208 = (void *)v179;
                                              v20 = 0;
                                              v212 = 0;
                                              *v66 = (id)objc_msgSend(v176, "initWithDomain:code:userInfo:", v180, 2);
                                              goto LABEL_254;
                                            }
                                            v212 = 0;
                                            v20 = 0;
LABEL_249:
                                            v25 = v250;
                                            v38 = v247;
                                            v61 = v241;
                                            goto LABEL_223;
                                          }
                                          if (v66)
                                          {
                                            v171 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v172 = self;
                                            v173 = *MEMORY[0x1E0D025B8];
                                            v263 = *MEMORY[0x1E0CB2D50];
                                            v212 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("startedOnBattery"));
                                            v264 = v212;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v264, &v263, 1);
                                            v174 = objc_claimAutoreleasedReturnValue();
                                            v175 = v173;
                                            self = v172;
                                            v210 = (void *)v174;
                                            v20 = 0;
                                            v215 = 0;
                                            *v66 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v175, 2);
                                            goto LABEL_249;
                                          }
                                          v215 = 0;
                                          v20 = 0;
LABEL_247:
                                          v25 = v250;
                                          v38 = v247;
                                          v61 = v241;
                                          goto LABEL_224;
                                        }
                                        if (v66)
                                        {
                                          v166 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v167 = self;
                                          v168 = *MEMORY[0x1E0D025B8];
                                          v265 = *MEMORY[0x1E0CB2D50];
                                          v215 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("startedInIdle"));
                                          v266 = v215;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v266, &v265, 1);
                                          v169 = objc_claimAutoreleasedReturnValue();
                                          v170 = v168;
                                          self = v167;
                                          v213 = (void *)v169;
                                          v20 = 0;
                                          v217 = 0;
                                          *v66 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v170, 2);
                                          goto LABEL_247;
                                        }
                                        v217 = 0;
                                        v20 = 0;
LABEL_252:
                                        v25 = v250;
                                        v38 = v247;
                                        v61 = v241;
                                        goto LABEL_225;
                                      }
                                      if (v66)
                                      {
                                        v219 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v200 = self;
                                        v201 = *MEMORY[0x1E0D025B8];
                                        v267 = *MEMORY[0x1E0CB2D50];
                                        v217 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startTime"));
                                        v268 = v217;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v268, &v267, 1);
                                        v202 = objc_claimAutoreleasedReturnValue();
                                        v203 = v201;
                                        self = v200;
                                        v214 = (void *)v202;
                                        v204 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v203, 2);
                                        v218 = 0;
                                        v20 = 0;
                                        *v66 = v204;
                                        goto LABEL_252;
                                      }
                                      v218 = 0;
                                      v20 = 0;
LABEL_155:
                                      v25 = v250;
                                      v38 = v247;
                                      v61 = v241;
LABEL_226:

                                      goto LABEL_227;
                                    }
                                    if (v66)
                                    {
                                      v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v148 = self;
                                      v149 = *MEMORY[0x1E0D025B8];
                                      v269 = *MEMORY[0x1E0CB2D50];
                                      v218 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("startBatteryTemperature"));
                                      v270 = v218;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v270, &v269, 1);
                                      v150 = objc_claimAutoreleasedReturnValue();
                                      v151 = v149;
                                      self = v148;
                                      v216 = (void *)v150;
                                      v221 = 0;
                                      v20 = 0;
                                      *v66 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v151, 2);
                                      goto LABEL_155;
                                    }
                                    v221 = 0;
                                    v20 = 0;
LABEL_215:
                                    v25 = v250;
                                    v38 = v247;
                                    v61 = v241;
LABEL_227:

                                    goto LABEL_228;
                                  }
                                  if (v66)
                                  {
                                    v142 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v143 = self;
                                    v144 = *MEMORY[0x1E0D025B8];
                                    v271 = *MEMORY[0x1E0CB2D50];
                                    v221 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sessionProfSuccess"));
                                    v272 = v221;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v272, &v271, 1);
                                    v145 = objc_claimAutoreleasedReturnValue();
                                    v146 = v144;
                                    self = v143;
                                    v220 = (void *)v145;
                                    v223 = 0;
                                    v20 = 0;
                                    *v66 = (id)objc_msgSend(v142, "initWithDomain:code:userInfo:", v146, 2);
                                    goto LABEL_215;
                                  }
                                  v223 = 0;
                                  v20 = 0;
LABEL_209:
                                  v25 = v250;
                                  v38 = v247;
                                  v61 = v241;
LABEL_228:

                                  goto LABEL_229;
                                }
                                if (v66)
                                {
                                  v137 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v138 = self;
                                  v139 = *MEMORY[0x1E0D025B8];
                                  v273 = *MEMORY[0x1E0CB2D50];
                                  v223 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("servicedEnergy"));
                                  v274 = v223;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v274, &v273, 1);
                                  v140 = objc_claimAutoreleasedReturnValue();
                                  v141 = v139;
                                  self = v138;
                                  v222 = (void *)v140;
                                  v225 = 0;
                                  v20 = 0;
                                  *v66 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v141, 2);
                                  goto LABEL_209;
                                }
                                v225 = 0;
                                v20 = 0;
LABEL_205:
                                v25 = v250;
                                v38 = v247;
                                v61 = v241;
LABEL_229:

                                goto LABEL_230;
                              }
                              if (v66)
                              {
                                v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v127 = self;
                                v128 = *MEMORY[0x1E0D025B8];
                                v275 = *MEMORY[0x1E0CB2D50];
                                v225 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rusageProfSuccess"));
                                v276 = v225;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v276, &v275, 1);
                                v129 = objc_claimAutoreleasedReturnValue();
                                v130 = v128;
                                self = v127;
                                v224 = (void *)v129;
                                v227 = 0;
                                v20 = 0;
                                *v66 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v130, 2);
                                goto LABEL_205;
                              }
                              v227 = 0;
                              v20 = 0;
LABEL_200:
                              v25 = v250;
                              v38 = v247;
                              v61 = v241;
LABEL_230:

                              goto LABEL_231;
                            }
                            if (v66)
                            {
                              v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v120 = self;
                              v121 = *MEMORY[0x1E0D025B8];
                              v277 = *MEMORY[0x1E0CB2D50];
                              v227 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("runTime"));
                              v278 = v227;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v278, &v277, 1);
                              v122 = objc_claimAutoreleasedReturnValue();
                              v123 = v121;
                              self = v120;
                              v226 = (void *)v122;
                              v229 = 0;
                              v20 = 0;
                              *v66 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v123, 2);
                              goto LABEL_200;
                            }
                            v229 = 0;
                            v20 = 0;
LABEL_194:
                            v25 = v250;
                            v38 = v247;
                            v61 = v241;
LABEL_231:

                            goto LABEL_232;
                          }
                          if (v66)
                          {
                            v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v115 = self;
                            v116 = *MEMORY[0x1E0D025B8];
                            v279 = *MEMORY[0x1E0CB2D50];
                            v229 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("qosUserInit"));
                            v280 = v229;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v280, &v279, 1);
                            v117 = objc_claimAutoreleasedReturnValue();
                            v118 = v116;
                            self = v115;
                            v228 = (void *)v117;
                            v231 = 0;
                            v20 = 0;
                            *v66 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v118, 2);
                            goto LABEL_194;
                          }
                          v231 = 0;
                          v20 = 0;
LABEL_157:
                          v25 = v250;
                          v38 = v247;
                          v61 = v241;
LABEL_232:

                          goto LABEL_233;
                        }
                        if (v66)
                        {
                          v109 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v110 = self;
                          v111 = *MEMORY[0x1E0D025B8];
                          v281 = *MEMORY[0x1E0CB2D50];
                          v231 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("qosLegacy"));
                          v282 = v231;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v282, &v281, 1);
                          v112 = objc_claimAutoreleasedReturnValue();
                          v113 = v111;
                          self = v110;
                          v230 = (void *)v112;
                          v233 = 0;
                          v20 = 0;
                          *v66 = (id)objc_msgSend(v109, "initWithDomain:code:userInfo:", v113, 2);
                          goto LABEL_157;
                        }
                        v233 = 0;
                        v20 = 0;
LABEL_152:
                        v25 = v250;
                        v38 = v247;
                        v61 = v241;
LABEL_233:

                        goto LABEL_234;
                      }
                      if (v66)
                      {
                        v104 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v105 = self;
                        v106 = *MEMORY[0x1E0D025B8];
                        v283 = *MEMORY[0x1E0CB2D50];
                        v233 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("qosBackground"));
                        v284 = v233;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v284, &v283, 1);
                        v107 = objc_claimAutoreleasedReturnValue();
                        v108 = v106;
                        self = v105;
                        v232 = (void *)v107;
                        v234 = 0;
                        v20 = 0;
                        *v66 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v108, 2);
                        goto LABEL_152;
                      }
                      v234 = 0;
                      v20 = 0;
LABEL_148:
                      v25 = v250;
                      v38 = v247;
                      v61 = v241;
LABEL_234:

                      goto LABEL_235;
                    }
                    if (v66)
                    {
                      v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v100 = self;
                      v101 = *MEMORY[0x1E0D025B8];
                      v285 = *MEMORY[0x1E0CB2D50];
                      v234 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("networkProfSuccess"));
                      v286 = v234;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v286, &v285, 1);
                      v102 = objc_claimAutoreleasedReturnValue();
                      v103 = v101;
                      self = v100;
                      v235 = (void *)v102;
                      v236 = 0;
                      v20 = 0;
                      *v66 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v103, 2);
                      goto LABEL_148;
                    }
                    v236 = 0;
                    v20 = 0;
LABEL_142:
                    v25 = v250;
                    v38 = v247;
                    v61 = v241;
LABEL_235:

                    goto LABEL_236;
                  }
                  if (v66)
                  {
                    v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v95 = self;
                    v96 = *MEMORY[0x1E0D025B8];
                    v287 = *MEMORY[0x1E0CB2D50];
                    v236 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("endedOnBattery"));
                    v288 = v236;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v288, &v287, 1);
                    v97 = objc_claimAutoreleasedReturnValue();
                    v98 = v96;
                    self = v95;
                    v237 = (void *)v97;
                    v239 = 0;
                    v20 = 0;
                    *v66 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v98, 2);
                    goto LABEL_142;
                  }
                  v239 = 0;
                  v20 = 0;
LABEL_136:
                  v25 = v250;
                  v38 = v247;
                  v61 = v241;
LABEL_236:

                  goto LABEL_237;
                }
                if (a4)
                {
                  v89 = self;
                  v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v91 = *MEMORY[0x1E0D025B8];
                  v289 = *MEMORY[0x1E0CB2D50];
                  v239 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("endedInIdle"));
                  v290 = v239;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
                  v92 = objc_claimAutoreleasedReturnValue();
                  v93 = v90;
                  self = v89;
                  v240 = (void *)v92;
                  v242 = 0;
                  v20 = 0;
                  *v66 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2);
                  goto LABEL_136;
                }
                v242 = 0;
                v20 = 0;
                v25 = v250;
                v38 = v247;
                v61 = v241;
LABEL_237:

                goto LABEL_238;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = 0;
                goto LABEL_53;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = v16;
                v29 = self;
                v30 = objc_alloc(MEMORY[0x1E0C99D68]);
                objc_msgSend(v28, "doubleValue");
                v31 = v30;
                self = v29;
                v16 = (id)objc_msgSend(v31, "initWithTimeIntervalSince1970:");
LABEL_52:

                goto LABEL_53;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                v62 = self;
                v63 = v16;
                objc_msgSend(v28, "dateFromString:", v63);
                v16 = (id)objc_claimAutoreleasedReturnValue();

                self = v62;
                goto LABEL_52;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = v16;
                goto LABEL_53;
              }
              if (a4)
              {
                v131 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v132 = *MEMORY[0x1E0D025B8];
                v291 = *MEMORY[0x1E0CB2D50];
                v133 = self;
                v134 = objc_alloc(MEMORY[0x1E0CB3940]);
                v205 = objc_opt_class();
                v135 = v134;
                self = v133;
                v242 = (id)objc_msgSend(v135, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), v205, CFSTR("endTime"));
                v292 = v242;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
                v243 = (void *)objc_claimAutoreleasedReturnValue();
                v136 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v132, 2);
                v61 = 0;
                v20 = 0;
                *a4 = v136;
                v25 = v250;
                v38 = v247;
                goto LABEL_237;
              }
              v61 = 0;
              v20 = 0;
LABEL_48:
              v25 = v250;
              v38 = v247;
LABEL_238:

              goto LABEL_239;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v245 = v15;
              goto LABEL_19;
            }
            if (a4)
            {
              v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v54 = a4;
              v55 = self;
              v56 = *MEMORY[0x1E0D025B8];
              v293 = *MEMORY[0x1E0CB2D50];
              v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("endBatteryTemperature"));
              v294 = v57;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v294, &v293, 1);
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = v56;
              self = v55;
              v244 = (void *)v58;
              v60 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v59, 2);
              v245 = 0;
              v20 = 0;
              *v54 = v60;
              v61 = (void *)v57;
              goto LABEL_48;
            }
            v245 = 0;
            v20 = 0;
LABEL_125:
            v25 = v250;
            v38 = v247;
LABEL_239:

            goto LABEL_240;
          }
          if (a4)
          {
            v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v47 = a4;
            v48 = self;
            v49 = *MEMORY[0x1E0D025B8];
            v295 = *MEMORY[0x1E0CB2D50];
            v245 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("CPUTime"));
            v296 = v245;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
            v50 = objc_claimAutoreleasedReturnValue();
            v51 = v49;
            self = v48;
            v246 = (void *)v50;
            v52 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v51, 2);
            v248 = 0;
            v20 = 0;
            *v47 = v52;
            goto LABEL_125;
          }
          v248 = 0;
          v20 = 0;
          v25 = v250;
          v38 = v247;
LABEL_240:

          goto LABEL_241;
        }
        if (a4)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = a4;
          v41 = self;
          v42 = *MEMORY[0x1E0D025B8];
          v297 = *MEMORY[0x1E0CB2D50];
          v248 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("CPUAwakeTime"));
          v298 = v248;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v42;
          self = v41;
          v249 = (void *)v43;
          v45 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v44, 2);
          v38 = 0;
          v20 = 0;
          *v40 = v45;
          v25 = v250;
          goto LABEL_240;
        }
        v38 = 0;
        v20 = 0;
        v25 = v250;
LABEL_241:

        goto LABEL_242;
      }
      if (a4)
      {
        v252 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = self;
        v33 = *MEMORY[0x1E0D025B8];
        v299 = *MEMORY[0x1E0CB2D50];
        v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("completed"));
        v300 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v300, &v299, 1);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v252;
        v37 = v33;
        self = v32;
        v38 = (void *)v34;
        v251 = (void *)v35;
        v25 = 0;
        v20 = 0;
        *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2);
        goto LABEL_241;
      }
      v25 = 0;
      v20 = 0;
LABEL_242:

      goto LABEL_243;
    }
    if (a4)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = a4;
      v23 = self;
      v24 = *MEMORY[0x1E0D025B8];
      v301 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activityname"));
      v302 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v302, &v301, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      self = v23;
      v27 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v26, 2, v9);
      v253 = 0;
      v20 = 0;
      *v22 = v27;
      goto LABEL_242;
    }
    v253 = 0;
    v20 = 0;
LABEL_243:

    goto LABEL_244;
  }
  if (a4)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0D025B8];
    v303 = *MEMORY[0x1E0CB2D50];
    v253 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
    v304[0] = v253;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v304, &v303, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v8);
    v254 = 0;
    v20 = 0;
    *a4 = v19;
    goto LABEL_243;
  }
  v254 = 0;
  v20 = 0;
LABEL_244:

  return v20;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
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
  id v91;
  id v92;
  id v93;
  _QWORD v94[25];
  _QWORD v95[27];

  v95[25] = *MEMORY[0x1E0C80C00];
  -[BMActivitySchedulerActivityProfile bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMActivitySchedulerActivityProfile activityname](self, "activityname");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMActivitySchedulerActivityProfile hasCompleted](self, "hasCompleted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile completed](self, "completed"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasCPUAwakeTime](self, "hasCPUAwakeTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile CPUAwakeTime](self, "CPUAwakeTime"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (!-[BMActivitySchedulerActivityProfile hasCPUTime](self, "hasCPUTime")
    || (-[BMActivitySchedulerActivityProfile CPUTime](self, "CPUTime"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMActivitySchedulerActivityProfile CPUTime](self, "CPUTime");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMActivitySchedulerActivityProfile CPUTime](self, "CPUTime");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMActivitySchedulerActivityProfile hasEndBatteryTemperature](self, "hasEndBatteryTemperature"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile endBatteryTemperature](self, "endBatteryTemperature"));
    v76 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76 = 0;
  }
  -[BMActivitySchedulerActivityProfile endTime](self, "endTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMActivitySchedulerActivityProfile endTime](self, "endTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v75 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v75 = 0;
  }

  if (-[BMActivitySchedulerActivityProfile hasEndedInIdle](self, "hasEndedInIdle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile endedInIdle](self, "endedInIdle"));
    v93 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v93 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasEndedOnBattery](self, "hasEndedOnBattery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile endedOnBattery](self, "endedOnBattery"));
    v92 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v92 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasNetworkProfSuccess](self, "hasNetworkProfSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile networkProfSuccess](self, "networkProfSuccess"));
    v91 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v91 = 0;
  }
  if (!-[BMActivitySchedulerActivityProfile hasQosBackground](self, "hasQosBackground")
    || (-[BMActivitySchedulerActivityProfile qosBackground](self, "qosBackground"), fabs(v13) == INFINITY))
  {
    v90 = 0;
  }
  else
  {
    -[BMActivitySchedulerActivityProfile qosBackground](self, "qosBackground");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMActivitySchedulerActivityProfile qosBackground](self, "qosBackground");
    objc_msgSend(v14, "numberWithDouble:");
    v90 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMActivitySchedulerActivityProfile hasQosLegacy](self, "hasQosLegacy")
    || (-[BMActivitySchedulerActivityProfile qosLegacy](self, "qosLegacy"), fabs(v15) == INFINITY))
  {
    v89 = 0;
  }
  else
  {
    -[BMActivitySchedulerActivityProfile qosLegacy](self, "qosLegacy");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[BMActivitySchedulerActivityProfile qosLegacy](self, "qosLegacy");
    objc_msgSend(v16, "numberWithDouble:");
    v89 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMActivitySchedulerActivityProfile hasQosUserInit](self, "hasQosUserInit")
    || (-[BMActivitySchedulerActivityProfile qosUserInit](self, "qosUserInit"), fabs(v17) == INFINITY))
  {
    v88 = 0;
  }
  else
  {
    -[BMActivitySchedulerActivityProfile qosUserInit](self, "qosUserInit");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[BMActivitySchedulerActivityProfile qosUserInit](self, "qosUserInit");
    objc_msgSend(v18, "numberWithDouble:");
    v88 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMActivitySchedulerActivityProfile hasRunTime](self, "hasRunTime")
    || (-[BMActivitySchedulerActivityProfile runTime](self, "runTime"), fabs(v19) == INFINITY))
  {
    v87 = 0;
  }
  else
  {
    -[BMActivitySchedulerActivityProfile runTime](self, "runTime");
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[BMActivitySchedulerActivityProfile runTime](self, "runTime");
    objc_msgSend(v20, "numberWithDouble:");
    v87 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMActivitySchedulerActivityProfile hasRusageProfSuccess](self, "hasRusageProfSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile rusageProfSuccess](self, "rusageProfSuccess"));
    v86 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v86 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasServicedEnergy](self, "hasServicedEnergy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile servicedEnergy](self, "servicedEnergy"));
    v85 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v85 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasSessionProfSuccess](self, "hasSessionProfSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile sessionProfSuccess](self, "sessionProfSuccess"));
    v84 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v84 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasStartBatteryTemperature](self, "hasStartBatteryTemperature"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile startBatteryTemperature](self, "startBatteryTemperature"));
    v83 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v83 = 0;
  }
  -[BMActivitySchedulerActivityProfile startTime](self, "startTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[BMActivitySchedulerActivityProfile startTime](self, "startTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSince1970");
    objc_msgSend(v22, "numberWithDouble:");
    v82 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v82 = 0;
  }

  if (-[BMActivitySchedulerActivityProfile hasStartedInIdle](self, "hasStartedInIdle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile startedInIdle](self, "startedInIdle"));
    v81 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v81 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasStartedOnBattery](self, "hasStartedOnBattery"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMActivitySchedulerActivityProfile startedOnBattery](self, "startedOnBattery"));
    v80 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasVersion](self, "hasVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile version](self, "version"));
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v79 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasWifiDown](self, "hasWifiDown"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiDown](self, "wifiDown"));
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v78 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasWifiUp](self, "hasWifiUp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiUp](self, "wifiUp"));
    v77 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v77 = 0;
  }
  if (-[BMActivitySchedulerActivityProfile hasDirtyMemoryDelta](self, "hasDirtyMemoryDelta"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerActivityProfile dirtyMemoryDelta](self, "dirtyMemoryDelta"));
    v74 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }
  v94[0] = CFSTR("bundleID");
  v24 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v67 = (void *)v24;
  v95[0] = v24;
  v94[1] = CFSTR("activityname");
  v25 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v25;
  v95[1] = v25;
  v94[2] = CFSTR("completed");
  v26 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v26;
  v95[2] = v26;
  v94[3] = CFSTR("CPUAwakeTime");
  v27 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v27;
  v95[3] = v27;
  v94[4] = CFSTR("CPUTime");
  v28 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v28;
  v95[4] = v28;
  v94[5] = CFSTR("endBatteryTemperature");
  v29 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v69 = v6;
  v62 = (void *)v29;
  v95[5] = v29;
  v94[6] = CFSTR("endTime");
  v30 = (uint64_t)v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v4;
  v61 = (void *)v30;
  v95[6] = v30;
  v94[7] = CFSTR("endedInIdle");
  v32 = (uint64_t)v93;
  if (!v93)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v95[7] = v32;
  v94[8] = CFSTR("endedOnBattery");
  v33 = v92;
  if (!v92)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v95[8] = v33;
  v94[9] = CFSTR("networkProfSuccess");
  v34 = (uint64_t)v91;
  if (!v91)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v95[9] = v34;
  v94[10] = CFSTR("qosBackground");
  v35 = (uint64_t)v90;
  if (!v90)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v95[10] = v35;
  v94[11] = CFSTR("qosLegacy");
  v36 = (uint64_t)v89;
  if (!v89)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v95[11] = v36;
  v94[12] = CFSTR("qosUserInit");
  v37 = (uint64_t)v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v37;
  v95[12] = v37;
  v94[13] = CFSTR("runTime");
  v38 = (uint64_t)v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v38;
  v95[13] = v38;
  v94[14] = CFSTR("rusageProfSuccess");
  v39 = (uint64_t)v86;
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v39;
  v95[14] = v39;
  v94[15] = CFSTR("servicedEnergy");
  v41 = (uint64_t)v85;
  if (!v85)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v41;
  v95[15] = v41;
  v94[16] = CFSTR("sessionProfSuccess");
  v42 = (uint64_t)v84;
  if (!v84)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v73 = v5;
  v55 = (void *)v42;
  v95[16] = v42;
  v94[17] = CFSTR("startBatteryTemperature");
  v43 = (uint64_t)v83;
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v35;
  v54 = (void *)v43;
  v95[17] = v43;
  v94[18] = CFSTR("startTime");
  v44 = (uint64_t)v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v44;
  v95[18] = v44;
  v94[19] = CFSTR("startedInIdle");
  v45 = v81;
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v72 = v9;
  v95[19] = v45;
  v94[20] = CFSTR("startedOnBattery");
  v46 = v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v36;
  v95[20] = v46;
  v94[21] = CFSTR("version");
  v47 = v79;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v32;
  v95[21] = v47;
  v94[22] = CFSTR("wifiDown");
  v48 = v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v34;
  v95[22] = v48;
  v94[23] = CFSTR("wifiUp");
  v49 = v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v95[23] = v49;
  v94[24] = CFSTR("dirtyMemoryDelta");
  v50 = v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v95[24] = v50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 25);
  v68 = (id)objc_claimAutoreleasedReturnValue();
  if (!v74)

  v51 = v40;
  if (!v77)
  {

    v51 = v40;
  }
  if (!v78)
  {

    v51 = v40;
  }
  if (!v79)
  {

    v51 = v40;
  }
  if (!v80)
  {

    v51 = v40;
  }
  if (!v81)
  {

    v51 = v40;
  }
  if (!v82)
  {

    v51 = v40;
  }
  if (!v83)
  {

    v51 = v40;
  }
  if (!v84)
  {

    v51 = v40;
  }
  if (!v85)
  {

    v51 = v40;
  }
  if (!v86)

  if (!v87)
  if (!v88)

  if (!v89)
  if (!v90)

  if (!v91)
  if (!v92)

  if (v93)
  {
    if (v75)
      goto LABEL_161;
  }
  else
  {

    if (v75)
    {
LABEL_161:
      if (v76)
        goto LABEL_162;
      goto LABEL_170;
    }
  }

  if (v76)
  {
LABEL_162:
    if (v72)
      goto LABEL_163;
    goto LABEL_171;
  }
LABEL_170:

  if (v72)
  {
LABEL_163:
    if (v69)
      goto LABEL_164;
    goto LABEL_172;
  }
LABEL_171:

  if (v69)
  {
LABEL_164:
    if (v73)
      goto LABEL_165;
    goto LABEL_173;
  }
LABEL_172:

  if (v73)
  {
LABEL_165:
    if (v31)
      goto LABEL_166;
LABEL_174:

    if (v3)
      goto LABEL_167;
LABEL_175:

    goto LABEL_167;
  }
LABEL_173:

  if (!v31)
    goto LABEL_174;
LABEL_166:
  if (!v3)
    goto LABEL_175;
LABEL_167:

  return v68;
}

- (NSDate)endTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_endTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_endTime);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)startTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_startTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_startTime);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMActivitySchedulerActivityProfile bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMActivitySchedulerActivityProfile bundleID](self, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_124;
    }
    -[BMActivitySchedulerActivityProfile activityname](self, "activityname");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityname");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMActivitySchedulerActivityProfile activityname](self, "activityname");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityname");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasCompleted](self, "hasCompleted")
      || objc_msgSend(v5, "hasCompleted"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasCompleted](self, "hasCompleted"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasCompleted"))
        goto LABEL_124;
      v19 = -[BMActivitySchedulerActivityProfile completed](self, "completed");
      if (v19 != objc_msgSend(v5, "completed"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasCPUAwakeTime](self, "hasCPUAwakeTime")
      || objc_msgSend(v5, "hasCPUAwakeTime"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasCPUAwakeTime](self, "hasCPUAwakeTime"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasCPUAwakeTime"))
        goto LABEL_124;
      v20 = -[BMActivitySchedulerActivityProfile CPUAwakeTime](self, "CPUAwakeTime");
      if (v20 != objc_msgSend(v5, "CPUAwakeTime"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasCPUTime](self, "hasCPUTime")
      || objc_msgSend(v5, "hasCPUTime"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasCPUTime](self, "hasCPUTime"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasCPUTime"))
        goto LABEL_124;
      -[BMActivitySchedulerActivityProfile CPUTime](self, "CPUTime");
      v22 = v21;
      objc_msgSend(v5, "CPUTime");
      if (v22 != v23)
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasEndBatteryTemperature](self, "hasEndBatteryTemperature")
      || objc_msgSend(v5, "hasEndBatteryTemperature"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasEndBatteryTemperature](self, "hasEndBatteryTemperature"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasEndBatteryTemperature"))
        goto LABEL_124;
      v24 = -[BMActivitySchedulerActivityProfile endBatteryTemperature](self, "endBatteryTemperature");
      if (v24 != objc_msgSend(v5, "endBatteryTemperature"))
        goto LABEL_124;
    }
    -[BMActivitySchedulerActivityProfile endTime](self, "endTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endTime");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMActivitySchedulerActivityProfile endTime](self, "endTime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endTime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasEndedInIdle](self, "hasEndedInIdle")
      || objc_msgSend(v5, "hasEndedInIdle"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasEndedInIdle](self, "hasEndedInIdle"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasEndedInIdle"))
        goto LABEL_124;
      v31 = -[BMActivitySchedulerActivityProfile endedInIdle](self, "endedInIdle");
      if (v31 != objc_msgSend(v5, "endedInIdle"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasEndedOnBattery](self, "hasEndedOnBattery")
      || objc_msgSend(v5, "hasEndedOnBattery"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasEndedOnBattery](self, "hasEndedOnBattery"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasEndedOnBattery"))
        goto LABEL_124;
      v32 = -[BMActivitySchedulerActivityProfile endedOnBattery](self, "endedOnBattery");
      if (v32 != objc_msgSend(v5, "endedOnBattery"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasNetworkProfSuccess](self, "hasNetworkProfSuccess")
      || objc_msgSend(v5, "hasNetworkProfSuccess"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasNetworkProfSuccess](self, "hasNetworkProfSuccess"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasNetworkProfSuccess"))
        goto LABEL_124;
      v33 = -[BMActivitySchedulerActivityProfile networkProfSuccess](self, "networkProfSuccess");
      if (v33 != objc_msgSend(v5, "networkProfSuccess"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasQosBackground](self, "hasQosBackground")
      || objc_msgSend(v5, "hasQosBackground"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasQosBackground](self, "hasQosBackground"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasQosBackground"))
        goto LABEL_124;
      -[BMActivitySchedulerActivityProfile qosBackground](self, "qosBackground");
      v35 = v34;
      objc_msgSend(v5, "qosBackground");
      if (v35 != v36)
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasQosLegacy](self, "hasQosLegacy")
      || objc_msgSend(v5, "hasQosLegacy"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasQosLegacy](self, "hasQosLegacy"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasQosLegacy"))
        goto LABEL_124;
      -[BMActivitySchedulerActivityProfile qosLegacy](self, "qosLegacy");
      v38 = v37;
      objc_msgSend(v5, "qosLegacy");
      if (v38 != v39)
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasQosUserInit](self, "hasQosUserInit")
      || objc_msgSend(v5, "hasQosUserInit"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasQosUserInit](self, "hasQosUserInit"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasQosUserInit"))
        goto LABEL_124;
      -[BMActivitySchedulerActivityProfile qosUserInit](self, "qosUserInit");
      v41 = v40;
      objc_msgSend(v5, "qosUserInit");
      if (v41 != v42)
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasRunTime](self, "hasRunTime")
      || objc_msgSend(v5, "hasRunTime"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasRunTime](self, "hasRunTime"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasRunTime"))
        goto LABEL_124;
      -[BMActivitySchedulerActivityProfile runTime](self, "runTime");
      v44 = v43;
      objc_msgSend(v5, "runTime");
      if (v44 != v45)
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasRusageProfSuccess](self, "hasRusageProfSuccess")
      || objc_msgSend(v5, "hasRusageProfSuccess"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasRusageProfSuccess](self, "hasRusageProfSuccess"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasRusageProfSuccess"))
        goto LABEL_124;
      v46 = -[BMActivitySchedulerActivityProfile rusageProfSuccess](self, "rusageProfSuccess");
      if (v46 != objc_msgSend(v5, "rusageProfSuccess"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasServicedEnergy](self, "hasServicedEnergy")
      || objc_msgSend(v5, "hasServicedEnergy"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasServicedEnergy](self, "hasServicedEnergy"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasServicedEnergy"))
        goto LABEL_124;
      v47 = -[BMActivitySchedulerActivityProfile servicedEnergy](self, "servicedEnergy");
      if (v47 != objc_msgSend(v5, "servicedEnergy"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasSessionProfSuccess](self, "hasSessionProfSuccess")
      || objc_msgSend(v5, "hasSessionProfSuccess"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasSessionProfSuccess](self, "hasSessionProfSuccess"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasSessionProfSuccess"))
        goto LABEL_124;
      v48 = -[BMActivitySchedulerActivityProfile sessionProfSuccess](self, "sessionProfSuccess");
      if (v48 != objc_msgSend(v5, "sessionProfSuccess"))
        goto LABEL_124;
    }
    if (-[BMActivitySchedulerActivityProfile hasStartBatteryTemperature](self, "hasStartBatteryTemperature")
      || objc_msgSend(v5, "hasStartBatteryTemperature"))
    {
      if (!-[BMActivitySchedulerActivityProfile hasStartBatteryTemperature](self, "hasStartBatteryTemperature"))
        goto LABEL_124;
      if (!objc_msgSend(v5, "hasStartBatteryTemperature"))
        goto LABEL_124;
      v49 = -[BMActivitySchedulerActivityProfile startBatteryTemperature](self, "startBatteryTemperature");
      if (v49 != objc_msgSend(v5, "startBatteryTemperature"))
        goto LABEL_124;
    }
    -[BMActivitySchedulerActivityProfile startTime](self, "startTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startTime");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v50 == (void *)v51)
    {

    }
    else
    {
      v52 = (void *)v51;
      -[BMActivitySchedulerActivityProfile startTime](self, "startTime");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startTime");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "isEqual:", v54);

      if (!v55)
        goto LABEL_124;
    }
    if (!-[BMActivitySchedulerActivityProfile hasStartedInIdle](self, "hasStartedInIdle")
      && !objc_msgSend(v5, "hasStartedInIdle")
      || -[BMActivitySchedulerActivityProfile hasStartedInIdle](self, "hasStartedInIdle")
      && objc_msgSend(v5, "hasStartedInIdle")
      && (v56 = -[BMActivitySchedulerActivityProfile startedInIdle](self, "startedInIdle"),
          v56 == objc_msgSend(v5, "startedInIdle")))
    {
      if (!-[BMActivitySchedulerActivityProfile hasStartedOnBattery](self, "hasStartedOnBattery")
        && !objc_msgSend(v5, "hasStartedOnBattery")
        || -[BMActivitySchedulerActivityProfile hasStartedOnBattery](self, "hasStartedOnBattery")
        && objc_msgSend(v5, "hasStartedOnBattery")
        && (v57 = -[BMActivitySchedulerActivityProfile startedOnBattery](self, "startedOnBattery"),
            v57 == objc_msgSend(v5, "startedOnBattery")))
      {
        if (!-[BMActivitySchedulerActivityProfile hasVersion](self, "hasVersion")
          && !objc_msgSend(v5, "hasVersion")
          || -[BMActivitySchedulerActivityProfile hasVersion](self, "hasVersion")
          && objc_msgSend(v5, "hasVersion")
          && (v58 = -[BMActivitySchedulerActivityProfile version](self, "version"),
              v58 == objc_msgSend(v5, "version")))
        {
          if (!-[BMActivitySchedulerActivityProfile hasWifiDown](self, "hasWifiDown")
            && !objc_msgSend(v5, "hasWifiDown")
            || -[BMActivitySchedulerActivityProfile hasWifiDown](self, "hasWifiDown")
            && objc_msgSend(v5, "hasWifiDown")
            && (v59 = -[BMActivitySchedulerActivityProfile wifiDown](self, "wifiDown"),
                v59 == objc_msgSend(v5, "wifiDown")))
          {
            if (!-[BMActivitySchedulerActivityProfile hasWifiUp](self, "hasWifiUp")
              && !objc_msgSend(v5, "hasWifiUp")
              || -[BMActivitySchedulerActivityProfile hasWifiUp](self, "hasWifiUp")
              && objc_msgSend(v5, "hasWifiUp")
              && (v60 = -[BMActivitySchedulerActivityProfile wifiUp](self, "wifiUp"),
                  v60 == objc_msgSend(v5, "wifiUp")))
            {
              if (!-[BMActivitySchedulerActivityProfile hasDirtyMemoryDelta](self, "hasDirtyMemoryDelta")
                && !objc_msgSend(v5, "hasDirtyMemoryDelta"))
              {
                v12 = 1;
                goto LABEL_125;
              }
              if (-[BMActivitySchedulerActivityProfile hasDirtyMemoryDelta](self, "hasDirtyMemoryDelta")
                && objc_msgSend(v5, "hasDirtyMemoryDelta"))
              {
                v61 = -[BMActivitySchedulerActivityProfile dirtyMemoryDelta](self, "dirtyMemoryDelta");
                v12 = v61 == objc_msgSend(v5, "dirtyMemoryDelta");
LABEL_125:

                goto LABEL_126;
              }
            }
          }
        }
      }
    }
LABEL_124:
    v12 = 0;
    goto LABEL_125;
  }
  v12 = 0;
LABEL_126:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)activityname
{
  return self->_activityname;
}

- (BOOL)completed
{
  return self->_completed;
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (void)setHasCompleted:(BOOL)a3
{
  self->_hasCompleted = a3;
}

- (int)CPUAwakeTime
{
  return self->_CPUAwakeTime;
}

- (BOOL)hasCPUAwakeTime
{
  return self->_hasCPUAwakeTime;
}

- (void)setHasCPUAwakeTime:(BOOL)a3
{
  self->_hasCPUAwakeTime = a3;
}

- (double)CPUTime
{
  return self->_CPUTime;
}

- (BOOL)hasCPUTime
{
  return self->_hasCPUTime;
}

- (void)setHasCPUTime:(BOOL)a3
{
  self->_hasCPUTime = a3;
}

- (int)endBatteryTemperature
{
  return self->_endBatteryTemperature;
}

- (BOOL)hasEndBatteryTemperature
{
  return self->_hasEndBatteryTemperature;
}

- (void)setHasEndBatteryTemperature:(BOOL)a3
{
  self->_hasEndBatteryTemperature = a3;
}

- (BOOL)endedInIdle
{
  return self->_endedInIdle;
}

- (BOOL)hasEndedInIdle
{
  return self->_hasEndedInIdle;
}

- (void)setHasEndedInIdle:(BOOL)a3
{
  self->_hasEndedInIdle = a3;
}

- (BOOL)endedOnBattery
{
  return self->_endedOnBattery;
}

- (BOOL)hasEndedOnBattery
{
  return self->_hasEndedOnBattery;
}

- (void)setHasEndedOnBattery:(BOOL)a3
{
  self->_hasEndedOnBattery = a3;
}

- (BOOL)networkProfSuccess
{
  return self->_networkProfSuccess;
}

- (BOOL)hasNetworkProfSuccess
{
  return self->_hasNetworkProfSuccess;
}

- (void)setHasNetworkProfSuccess:(BOOL)a3
{
  self->_hasNetworkProfSuccess = a3;
}

- (double)qosBackground
{
  return self->_qosBackground;
}

- (BOOL)hasQosBackground
{
  return self->_hasQosBackground;
}

- (void)setHasQosBackground:(BOOL)a3
{
  self->_hasQosBackground = a3;
}

- (double)qosLegacy
{
  return self->_qosLegacy;
}

- (BOOL)hasQosLegacy
{
  return self->_hasQosLegacy;
}

- (void)setHasQosLegacy:(BOOL)a3
{
  self->_hasQosLegacy = a3;
}

- (double)qosUserInit
{
  return self->_qosUserInit;
}

- (BOOL)hasQosUserInit
{
  return self->_hasQosUserInit;
}

- (void)setHasQosUserInit:(BOOL)a3
{
  self->_hasQosUserInit = a3;
}

- (double)runTime
{
  return self->_runTime;
}

- (BOOL)hasRunTime
{
  return self->_hasRunTime;
}

- (void)setHasRunTime:(BOOL)a3
{
  self->_hasRunTime = a3;
}

- (BOOL)rusageProfSuccess
{
  return self->_rusageProfSuccess;
}

- (BOOL)hasRusageProfSuccess
{
  return self->_hasRusageProfSuccess;
}

- (void)setHasRusageProfSuccess:(BOOL)a3
{
  self->_hasRusageProfSuccess = a3;
}

- (int)servicedEnergy
{
  return self->_servicedEnergy;
}

- (BOOL)hasServicedEnergy
{
  return self->_hasServicedEnergy;
}

- (void)setHasServicedEnergy:(BOOL)a3
{
  self->_hasServicedEnergy = a3;
}

- (BOOL)sessionProfSuccess
{
  return self->_sessionProfSuccess;
}

- (BOOL)hasSessionProfSuccess
{
  return self->_hasSessionProfSuccess;
}

- (void)setHasSessionProfSuccess:(BOOL)a3
{
  self->_hasSessionProfSuccess = a3;
}

- (int)startBatteryTemperature
{
  return self->_startBatteryTemperature;
}

- (BOOL)hasStartBatteryTemperature
{
  return self->_hasStartBatteryTemperature;
}

- (void)setHasStartBatteryTemperature:(BOOL)a3
{
  self->_hasStartBatteryTemperature = a3;
}

- (BOOL)startedInIdle
{
  return self->_startedInIdle;
}

- (BOOL)hasStartedInIdle
{
  return self->_hasStartedInIdle;
}

- (void)setHasStartedInIdle:(BOOL)a3
{
  self->_hasStartedInIdle = a3;
}

- (BOOL)startedOnBattery
{
  return self->_startedOnBattery;
}

- (BOOL)hasStartedOnBattery
{
  return self->_hasStartedOnBattery;
}

- (void)setHasStartedOnBattery:(BOOL)a3
{
  self->_hasStartedOnBattery = a3;
}

- (int)version
{
  return self->_version;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (int)wifiDown
{
  return self->_wifiDown;
}

- (BOOL)hasWifiDown
{
  return self->_hasWifiDown;
}

- (void)setHasWifiDown:(BOOL)a3
{
  self->_hasWifiDown = a3;
}

- (int)wifiUp
{
  return self->_wifiUp;
}

- (BOOL)hasWifiUp
{
  return self->_hasWifiUp;
}

- (void)setHasWifiUp:(BOOL)a3
{
  self->_hasWifiUp = a3;
}

- (int)dirtyMemoryDelta
{
  return self->_dirtyMemoryDelta;
}

- (BOOL)hasDirtyMemoryDelta
{
  return self->_hasDirtyMemoryDelta;
}

- (void)setHasDirtyMemoryDelta:(BOOL)a3
{
  self->_hasDirtyMemoryDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityname, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
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

    v4 = -[BMActivitySchedulerActivityProfile initByReadFrom:]([BMActivitySchedulerActivityProfile alloc], "initByReadFrom:", v7);
    v4[20] = 0;

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
  _QWORD v29[27];

  v29[25] = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 1, 13, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityname"), 2, 0, 2, 13, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("completed"), 0, 0, 3, 12, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("CPUAwakeTime"), 0, 0, 4, 2, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("CPUTime"), 1, 0, 5, 0, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endBatteryTemperature"), 0, 0, 6, 2, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endTime"), 3, 0, 7, 0, 2);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endedInIdle"), 0, 0, 8, 12, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endedOnBattery"), 0, 0, 9, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("networkProfSuccess"), 0, 0, 10, 12, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("qosBackground"), 1, 0, 11, 0, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("qosLegacy"), 1, 0, 12, 0, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("qosUserInit"), 1, 0, 13, 0, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("runTime"), 1, 0, 14, 0, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rusageProfSuccess"), 0, 0, 15, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("servicedEnergy"), 0, 0, 16, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionProfSuccess"), 0, 0, 17, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startBatteryTemperature"), 0, 0, 18, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startTime"), 3, 0, 19, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startedInIdle"), 0, 0, 20, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startedOnBattery"), 0, 0, 21, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("version"), 0, 0, 22, 2, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wifiDown"), 0, 0, 23, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wifiUp"), 0, 0, 24, 2, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dirtyMemoryDelta"), 0, 0, 25, 2, 0);
  v29[0] = v28;
  v29[1] = v27;
  v29[2] = v26;
  v29[3] = v25;
  v29[4] = v24;
  v29[5] = v23;
  v29[6] = v22;
  v29[7] = v21;
  v29[8] = v20;
  v29[9] = v19;
  v29[10] = v18;
  v29[11] = v17;
  v29[12] = v16;
  v29[13] = v15;
  v29[14] = v14;
  v29[15] = v2;
  v29[16] = v3;
  v29[17] = v4;
  v29[18] = v13;
  v29[19] = v5;
  v29[20] = v6;
  v29[21] = v7;
  v29[22] = v12;
  v29[23] = v8;
  v29[24] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 25);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C030;
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
  _QWORD v29[27];

  v29[25] = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 1, 13, 0);
  v29[0] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityname"), 2, 13, 0);
  v29[1] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("completed"), 3, 12, 0);
  v29[2] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("CPUAwakeTime"), 4, 2, 0);
  v29[3] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("CPUTime"), 5, 0, 0);
  v29[4] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endBatteryTemperature"), 6, 2, 0);
  v29[5] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endTime"), 7, 0, 0);
  v29[6] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endedInIdle"), 8, 12, 0);
  v29[7] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endedOnBattery"), 9, 12, 0);
  v29[8] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("networkProfSuccess"), 10, 12, 0);
  v29[9] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("qosBackground"), 11, 0, 0);
  v29[10] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("qosLegacy"), 12, 0, 0);
  v29[11] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("qosUserInit"), 13, 0, 0);
  v29[12] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("runTime"), 14, 0, 0);
  v29[13] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rusageProfSuccess"), 15, 12, 0);
  v29[14] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("servicedEnergy"), 16, 2, 0);
  v29[15] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionProfSuccess"), 17, 12, 0);
  v29[16] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startBatteryTemperature"), 18, 2, 0);
  v29[17] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startTime"), 19, 0, 0);
  v29[18] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startedInIdle"), 20, 12, 0);
  v29[19] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startedOnBattery"), 21, 12, 0);
  v29[20] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("version"), 22, 2, 0);
  v29[21] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("wifiDown"), 23, 2, 0);
  v29[22] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("wifiUp"), 24, 2, 0);
  v29[23] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dirtyMemoryDelta"), 25, 2, 0);
  v29[24] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
