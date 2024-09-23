@implementation BMAppleIDChildSetup

- (BMAppleIDChildSetup)initWithIsNewChildAccount:(id)a3 startDate:(id)a4 endDate:(id)a5 completedSetup:(id)a6 lastViewedScreen:(int)a7 appUsage:(id)a8 askToBuy:(id)a9 commSafety:(id)a10 screenDistance:(id)a11 age:(id)a12 flowType:(int)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMAppleIDChildSetup *v26;
  double v27;
  double v28;
  unsigned int v29;
  id v32;
  objc_super v33;

  v18 = a3;
  v32 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v33.receiver = self;
  v33.super_class = (Class)BMAppleIDChildSetup;
  v26 = -[BMEventBase init](&v33, sel_init);
  if (v26)
  {
    v26->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v18)
    {
      v26->_hasIsNewChildAccount = 1;
      v26->_isNewChildAccount = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v18 = 0;
      v26->_hasIsNewChildAccount = 0;
      v26->_isNewChildAccount = 0;
    }
    if (v32)
    {
      v26->_hasRaw_startDate = 1;
      objc_msgSend(v32, "timeIntervalSince1970");
    }
    else
    {
      v26->_hasRaw_startDate = 0;
      v27 = -1.0;
    }
    v26->_raw_startDate = v27;
    if (v19)
    {
      v26->_hasRaw_endDate = 1;
      objc_msgSend(v19, "timeIntervalSince1970");
    }
    else
    {
      v26->_hasRaw_endDate = 0;
      v28 = -1.0;
    }
    v26->_raw_endDate = v28;
    if (v20)
    {
      v26->_hasCompletedSetup = 1;
      v26->_completedSetup = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v26->_hasCompletedSetup = 0;
      v26->_completedSetup = 0;
    }
    v26->_lastViewedScreen = a7;
    if (v21)
    {
      v26->_hasAppUsage = 1;
      v26->_appUsage = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v26->_hasAppUsage = 0;
      v26->_appUsage = 0;
    }
    if (v22)
    {
      v26->_hasAskToBuy = 1;
      v26->_askToBuy = objc_msgSend(v22, "BOOLValue");
    }
    else
    {
      v26->_hasAskToBuy = 0;
      v26->_askToBuy = 0;
    }
    if (v23)
    {
      v26->_hasCommSafety = 1;
      v26->_commSafety = objc_msgSend(v23, "BOOLValue");
    }
    else
    {
      v26->_hasCommSafety = 0;
      v26->_commSafety = 0;
    }
    if (v24)
    {
      v26->_hasScreenDistance = 1;
      v26->_screenDistance = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v26->_hasScreenDistance = 0;
      v26->_screenDistance = 0;
    }
    if (v25)
    {
      v26->_hasAge = 1;
      v29 = objc_msgSend(v25, "unsignedIntValue");
    }
    else
    {
      v29 = 0;
      v26->_hasAge = 0;
    }
    v26->_age = v29;
    v26->_flowType = a13;
  }

  return v26;
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup isNewChildAccount](self, "isNewChildAccount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppleIDChildSetup startDate](self, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppleIDChildSetup endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup completedSetup](self, "completedSetup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppleIDChildSetupChildSetupScreenAsString(-[BMAppleIDChildSetup lastViewedScreen](self, "lastViewedScreen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup appUsage](self, "appUsage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup askToBuy](self, "askToBuy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup commSafety](self, "commSafety"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup screenDistance](self, "screenDistance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAppleIDChildSetup age](self, "age"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppleIDChildSetupFlowTypeAsString(-[BMAppleIDChildSetup flowType](self, "flowType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMAppleIDChildSetup with isNewChildAccount: %@, startDate: %@, endDate: %@, completedSetup: %@, lastViewedScreen: %@, appUsage: %@, askToBuy: %@, commSafety: %@, screenDistance: %@, age: %@, flowType: %@"), v14, v13, v3, v12, v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppleIDChildSetup *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  int *v13;
  int *v14;
  int *v15;
  int *v16;
  int *v17;
  int *v18;
  int *v19;
  int *v20;
  int *v21;
  char v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  BOOL v29;
  int v30;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  int *v39;
  int *v40;
  int *v41;
  int *v42;
  int *v43;
  int *v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  objc_class *v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
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
  BOOL v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  BMAppleIDChildSetup *v110;
  BMAppleIDChildSetup *v112;
  objc_super v113;

  v4 = a3;
  v113.receiver = self;
  v113.super_class = (Class)BMAppleIDChildSetup;
  v5 = -[BMEventBase init](&v113, sel_init);
  if (!v5)
    goto LABEL_141;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v10 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v11 = (int *)MEMORY[0x1E0D82BB8];
    v12 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v13 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v14 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v15 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v16 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v17 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v18 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v19 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v20 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v21 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    do
    {
      if (v4[*v8])
        break;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      while (1)
      {
        v25 = *v6;
        v26 = *(_QWORD *)&v4[v25];
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
          break;
        v28 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v26);
        *(_QWORD *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_13;
        v22 += 7;
        v29 = v23++ >= 9;
        if (v29)
        {
          v24 = 0;
          v30 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v30 = v4[*v8];
      if (v4[*v8])
        v24 = 0;
LABEL_15:
      if (v30 || (v24 & 7) == 4)
        break;
      switch((v24 >> 3))
      {
        case 1u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *((_BYTE *)&v5->super.super.isa + v9[872]) = 1;
          while (1)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
              break;
            v38 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v36);
            *(_QWORD *)&v4[v35] = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if ((v38 & 0x80) == 0)
              goto LABEL_92;
            v32 += 7;
            v29 = v33++ >= 9;
            if (v29)
            {
              v34 = 0;
              goto LABEL_94;
            }
          }
          v4[*v8] = 1;
LABEL_92:
          if (v4[*v8])
            v34 = 0;
LABEL_94:
          v106 = v34 != 0;
          v107 = v10[873];
          goto LABEL_121;
        case 2u:
          *((_BYTE *)&v5->super.super.isa + v12[874]) = 1;
          v46 = *v6;
          v47 = *(_QWORD *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v48 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v47);
            *(_QWORD *)&v4[v46] = v47 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v48 = 0;
          }
          v109 = v13[875];
          goto LABEL_137;
        case 3u:
          *((_BYTE *)&v5->super.super.isa + v14[876]) = 1;
          v49 = *v6;
          v50 = *(_QWORD *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v48 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v50);
            *(_QWORD *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v48 = 0;
          }
          v109 = v15[877];
LABEL_137:
          *(Class *)((char *)&v5->super.super.isa + v109) = v48;
          continue;
        case 4u:
          v51 = 0;
          v52 = 0;
          v53 = 0;
          *((_BYTE *)&v5->super.super.isa + v16[878]) = 1;
          while (2)
          {
            v54 = *v6;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v55);
              *(_QWORD *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                v29 = v52++ >= 9;
                if (v29)
                {
                  v53 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v53 = 0;
LABEL_98:
          v106 = v53 != 0;
          v107 = v17[879];
          goto LABEL_121;
        case 5u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          while (2)
          {
            v61 = *v6;
            v62 = *(_QWORD *)&v4[v61];
            v63 = v62 + 1;
            if (v62 == -1 || v63 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v62);
              *(_QWORD *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                v29 = v59++ >= 9;
                if (v29)
                {
                  LODWORD(v60) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v60) = 0;
LABEL_102:
          if (v60 >= 9)
            LODWORD(v60) = 0;
          v108 = v18[880];
          goto LABEL_132;
        case 6u:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          *((_BYTE *)&v5->super.super.isa + v19[881]) = 1;
          while (2)
          {
            v68 = *v6;
            v69 = *(_QWORD *)&v4[v68];
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v69);
              *(_QWORD *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                v29 = v66++ >= 9;
                if (v29)
                {
                  v67 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v67 = 0;
LABEL_108:
          v106 = v67 != 0;
          v107 = v20[882];
          goto LABEL_121;
        case 7u:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          *((_BYTE *)&v5->super.super.isa + v21[883]) = 1;
          while (2)
          {
            v75 = *v6;
            v76 = *(_QWORD *)&v4[v75];
            v77 = v76 + 1;
            if (v76 == -1 || v77 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v78 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v76);
              *(_QWORD *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                v29 = v73++ >= 9;
                if (v29)
                {
                  v74 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v74 = 0;
LABEL_112:
          v106 = v74 != 0;
          v107 = 54;
          goto LABEL_121;
        case 8u:
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v5->_hasCommSafety = 1;
          while (2)
          {
            v82 = *v6;
            v83 = *(_QWORD *)&v4[v82];
            v84 = v83 + 1;
            if (v83 == -1 || v84 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v83);
              *(_QWORD *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                v29 = v80++ >= 9;
                if (v29)
                {
                  v81 = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v81 = 0;
LABEL_116:
          v106 = v81 != 0;
          v107 = 56;
          goto LABEL_121;
        case 9u:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          v5->_hasScreenDistance = 1;
          while (2)
          {
            v89 = *v6;
            v90 = *(_QWORD *)&v4[v89];
            v91 = v90 + 1;
            if (v90 == -1 || v91 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v90);
              *(_QWORD *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                v29 = v87++ >= 9;
                if (v29)
                {
                  v88 = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v88 = 0;
LABEL_120:
          v106 = v88 != 0;
          v107 = 58;
LABEL_121:
          *((_BYTE *)&v5->super.super.isa + v107) = v106;
          continue;
        case 0xAu:
          v93 = 0;
          v94 = 0;
          v95 = 0;
          v5->_hasAge = 1;
          while (2)
          {
            v96 = *v6;
            v97 = *(_QWORD *)&v4[v96];
            v98 = v97 + 1;
            if (v97 == -1 || v98 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v99 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v97);
              *(_QWORD *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                v29 = v94++ >= 9;
                if (v29)
                {
                  LODWORD(v95) = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v95) = 0;
LABEL_125:
          v5->_age = v95;
          continue;
        case 0xBu:
          v100 = 0;
          v101 = 0;
          v60 = 0;
          break;
        default:
          v39 = v9;
          v40 = v10;
          v41 = v12;
          v42 = v13;
          v43 = v14;
          v112 = v5;
          v44 = v15;
          v45 = PBReaderSkipValueWithTag();
          v21 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
          v15 = v44;
          v8 = (int *)MEMORY[0x1E0D82BC8];
          v5 = v112;
          v14 = v43;
          v16 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
          v13 = v42;
          v17 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
          v12 = v41;
          v20 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
          v10 = v40;
          v19 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
          v9 = v39;
          v18 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
          if (!v45)
            goto LABEL_140;
          continue;
      }
      while (1)
      {
        v102 = *v6;
        v103 = *(_QWORD *)&v4[v102];
        v104 = v103 + 1;
        if (v103 == -1 || v104 > *(_QWORD *)&v4[*v7])
          break;
        v105 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v103);
        *(_QWORD *)&v4[v102] = v104;
        v60 |= (unint64_t)(v105 & 0x7F) << v100;
        if ((v105 & 0x80) == 0)
          goto LABEL_127;
        v100 += 7;
        v29 = v101++ >= 9;
        if (v29)
        {
          LODWORD(v60) = 0;
          goto LABEL_129;
        }
      }
      v4[*v8] = 1;
LABEL_127:
      if (v4[*v8])
        LODWORD(v60) = 0;
LABEL_129:
      if (v60 >= 3)
        LODWORD(v60) = 0;
      v108 = 76;
LABEL_132:
      *(_DWORD *)((char *)&v5->super.super.isa + v108) = v60;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_140:
    v110 = 0;
  else
LABEL_141:
    v110 = v5;

  return v110;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasIsNewChildAccount)
    PBDataWriterWriteBOOLField();
  if (self->_hasRaw_startDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_endDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasCompletedSetup)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasAppUsage)
    PBDataWriterWriteBOOLField();
  if (self->_hasAskToBuy)
    PBDataWriterWriteBOOLField();
  if (self->_hasCommSafety)
    PBDataWriterWriteBOOLField();
  if (self->_hasScreenDistance)
    PBDataWriterWriteBOOLField();
  if (self->_hasAge)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppleIDChildSetup writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppleIDChildSetup)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  BMAppleIDChildSetup *v17;
  id *v18;
  objc_class *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  id v25;
  BMAppleIDChildSetup *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  BMAppleIDChildSetup *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BMAppleIDChildSetup *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  id *v53;
  uint64_t v54;
  id v55;
  id *v56;
  id v57;
  uint64_t v58;
  id *v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  id *v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v78;
  BMAppleIDChildSetup *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  id *v97;
  id *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id *v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  BMAppleIDChildSetup *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  id *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  _QWORD v136[3];

  v136[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isNewChildAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v113 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (objc_class *)MEMORY[0x1E0C99D68];
        v13 = v8;
        v14 = [v12 alloc];
        objc_msgSend(v13, "doubleValue");
        v16 = v15;

        v9 = (id)objc_msgSend(v14, "initWithTimeIntervalSince1970:", v16);
      }
      else
      {
        v31 = (BMAppleIDChildSetup *)a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v32, "dateFromString:", v8);
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v9 = 0;
              v30 = v113;
              goto LABEL_100;
            }
            v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v79 = self;
            v80 = *MEMORY[0x1E0D025B8];
            v133 = *MEMORY[0x1E0CB2D50];
            v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startDate"));
            v134 = v112;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
            v81 = objc_claimAutoreleasedReturnValue();
            v82 = v80;
            self = v79;
            v110 = (void *)v81;
            v83 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v82, 2);
            v9 = 0;
            v31 = 0;
            *a4 = v83;
            goto LABEL_119;
          }
          v9 = v8;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    v110 = (void *)v10;
    if (!v10 || (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v112 = 0;
      goto LABEL_24;
    }
    v17 = self;
    v18 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (objc_class *)MEMORY[0x1E0C99D68];
      v20 = v11;
      v21 = [v19 alloc];
      objc_msgSend(v20, "doubleValue");
      v23 = v22;

      v24 = (id)objc_msgSend(v21, "initWithTimeIntervalSince1970:", v23);
LABEL_16:
      v112 = v24;
LABEL_23:
      self = v17;
LABEL_24:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("completedSetup"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = self;
      if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v35 = v7;
        v109 = 0;
LABEL_27:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastViewedScreen"));
        v36 = objc_claimAutoreleasedReturnValue();
        v103 = v34;
        v105 = (void *)v36;
        if (v36 && (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v111 = v37;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v111 = 0;
                v31 = 0;
                v30 = v113;
                a4 = v109;
                v50 = v37;
                v7 = v35;
                self = v114;
                goto LABEL_97;
              }
              v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v69 = v9;
              v70 = *MEMORY[0x1E0D025B8];
              v127 = *MEMORY[0x1E0CB2D50];
              v108 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("lastViewedScreen"));
              v128 = v108;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
              v71 = objc_claimAutoreleasedReturnValue();
              v72 = v70;
              v9 = v69;
              v50 = v37;
              v106 = (void *)v71;
              v73 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v72, 2);
              v111 = 0;
              v31 = 0;
              *a4 = v73;
              v30 = v113;
              a4 = v109;
              v7 = v35;
              self = v114;
              goto LABEL_96;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppleIDChildSetupChildSetupScreenFromString(v37));
            v111 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v111 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appUsage"));
        v38 = objc_claimAutoreleasedReturnValue();
        v7 = v35;
        v101 = v8;
        v106 = (void *)v38;
        if (v38 && (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v108 = 0;
              v31 = 0;
              a4 = v109;
              v30 = v113;
              self = v114;
              v50 = v105;
              goto LABEL_96;
            }
            v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v53 = a4;
            v54 = *MEMORY[0x1E0D025B8];
            v125 = *MEMORY[0x1E0CB2D50];
            v107 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("appUsage"));
            v126 = v107;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = 0;
            v31 = 0;
            *v53 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v54, 2, v40);
            v30 = v113;
            self = v114;
            v34 = v103;
            a4 = v109;
            v50 = v105;
LABEL_95:

            v8 = v101;
LABEL_96:

            goto LABEL_97;
          }
          v108 = v39;
        }
        else
        {
          v108 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("askToBuy"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v9;
        if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v107 = 0;
              v31 = 0;
              a4 = v109;
              v30 = v113;
              v50 = v105;
              goto LABEL_94;
            }
            v56 = a4;
            v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v58 = *MEMORY[0x1E0D025B8];
            v123 = *MEMORY[0x1E0CB2D50];
            v102 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("askToBuy"));
            v124 = v102;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = 0;
            v31 = 0;
            *v56 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v41);
            goto LABEL_110;
          }
          v107 = v40;
        }
        else
        {
          v107 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("commSafety"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v102 = 0;
LABEL_39:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("screenDistance"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = a4;
          v99 = v7;
          if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v100 = 0;
                v31 = 0;
                goto LABEL_92;
              }
              v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v66 = *MEMORY[0x1E0D025B8];
              v119 = *MEMORY[0x1E0CB2D50];
              v67 = a4;
              v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("screenDistance"));
              v120 = v45;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = 0;
              v31 = 0;
              *v67 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v43);
              goto LABEL_91;
            }
            v100 = v42;
          }
          else
          {
            v100 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("age"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v97)
              {
                v45 = 0;
                v31 = 0;
                goto LABEL_91;
              }
              v44 = v114;
              v95 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v74 = *MEMORY[0x1E0D025B8];
              v117 = *MEMORY[0x1E0CB2D50];
              v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("age"));
              v118 = v47;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v74, 2, v46);
              v45 = 0;
              v31 = 0;
              *v97 = v75;
              goto LABEL_90;
            }
            v44 = v114;
            v45 = v43;
          }
          else
          {
            v44 = v114;
            v45 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flowType"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v55 = v46;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v97)
                {
                  v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v94 = *MEMORY[0x1E0D025B8];
                  v115 = *MEMORY[0x1E0CB2D50];
                  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("flowType"));
                  v116 = v90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  *v97 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v94, 2, v91);

                }
                v47 = 0;
                v31 = 0;
                goto LABEL_90;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppleIDChildSetupFlowTypeFromString(v46));
              v55 = (id)objc_claimAutoreleasedReturnValue();
            }
            v47 = v55;
          }
          else
          {
            v47 = 0;
          }
          v76 = objc_msgSend(v111, "intValue");
          LODWORD(v93) = objc_msgSend(v47, "intValue");
          v31 = -[BMAppleIDChildSetup initWithIsNewChildAccount:startDate:endDate:completedSetup:lastViewedScreen:appUsage:askToBuy:commSafety:screenDistance:age:flowType:](v44, "initWithIsNewChildAccount:startDate:endDate:completedSetup:lastViewedScreen:appUsage:askToBuy:commSafety:screenDistance:age:flowType:", v113, v104, v112, v109, v76, v108, v107, v102, v100, v45, v93);
          v44 = v31;
LABEL_90:
          v114 = v44;

LABEL_91:
          v7 = v99;
          goto LABEL_92;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v102 = v41;
          goto LABEL_39;
        }
        if (a4)
        {
          v59 = a4;
          v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v121 = *MEMORY[0x1E0CB2D50];
          v62 = v7;
          v63 = objc_alloc(MEMORY[0x1E0CB3940]);
          v92 = objc_opt_class();
          v64 = v63;
          v7 = v62;
          v100 = (id)objc_msgSend(v64, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v92, CFSTR("commSafety"));
          v122 = v100;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = 0;
          v31 = 0;
          *v59 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2, v42);
LABEL_92:
          v50 = v105;

          v30 = v113;
          v34 = v103;
          a4 = v109;
LABEL_93:

          v9 = v104;
LABEL_94:
          self = v114;
          goto LABEL_95;
        }
        v102 = 0;
        v31 = 0;
LABEL_110:
        a4 = v109;
        v30 = v113;
        v50 = v105;
        goto LABEL_93;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v7;
        v109 = v34;
        goto LABEL_27;
      }
      if (a4)
      {
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v129 = *MEMORY[0x1E0CB2D50];
        v98 = a4;
        v111 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("completedSetup"));
        v130 = v111;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v50);
        a4 = 0;
        v31 = 0;
        *v98 = v51;
        v30 = v113;
        self = v114;
LABEL_97:

LABEL_98:
LABEL_99:

        goto LABEL_100;
      }
      v31 = 0;
LABEL_107:
      v30 = v113;
      goto LABEL_98;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v33, "dateFromString:", v11);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v11;
      goto LABEL_16;
    }
    if (a4)
    {
      v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v85 = v9;
      v86 = *MEMORY[0x1E0D025B8];
      v131 = *MEMORY[0x1E0CB2D50];
      a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("endDate"));
      v132 = a4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
      v87 = objc_claimAutoreleasedReturnValue();
      v88 = v86;
      v9 = v85;
      v89 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v88, 2, v87);
      v112 = 0;
      v31 = 0;
      *v18 = v89;
      self = v17;
      v34 = (void *)v87;
      goto LABEL_107;
    }
    v112 = 0;
    v31 = 0;
    self = v17;
LABEL_119:
    v30 = v113;
    goto LABEL_99;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = self;
    v27 = *MEMORY[0x1E0D025B8];
    v135 = *MEMORY[0x1E0CB2D50];
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isNewChildAccount"));
    v136[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, &v135, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    self = v26;
    v29 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v28, 2, v8);
    v30 = 0;
    v31 = 0;
    *a4 = v29;
LABEL_100:

    goto LABEL_101;
  }
  v30 = 0;
  v31 = 0;
LABEL_101:

  return v31;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[11];
  _QWORD v43[13];

  v43[11] = *MEMORY[0x1E0C80C00];
  if (-[BMAppleIDChildSetup hasIsNewChildAccount](self, "hasIsNewChildAccount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup isNewChildAccount](self, "isNewChildAccount"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMAppleIDChildSetup startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppleIDChildSetup startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMAppleIDChildSetup endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppleIDChildSetup endDate](self, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if (-[BMAppleIDChildSetup hasCompletedSetup](self, "hasCompletedSetup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup completedSetup](self, "completedSetup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppleIDChildSetup lastViewedScreen](self, "lastViewedScreen"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (-[BMAppleIDChildSetup hasAppUsage](self, "hasAppUsage"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup appUsage](self, "appUsage"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  if (-[BMAppleIDChildSetup hasAskToBuy](self, "hasAskToBuy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup askToBuy](self, "askToBuy"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
  if (-[BMAppleIDChildSetup hasCommSafety](self, "hasCommSafety"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup commSafety](self, "commSafety"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  if (-[BMAppleIDChildSetup hasScreenDistance](self, "hasScreenDistance"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppleIDChildSetup screenDistance](self, "screenDistance"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  if (-[BMAppleIDChildSetup hasAge](self, "hasAge"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAppleIDChildSetup age](self, "age"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppleIDChildSetup flowType](self, "flowType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = CFSTR("isNewChildAccount");
  v16 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v16;
  v43[0] = v16;
  v42[1] = CFSTR("startDate");
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v17;
  v43[1] = v17;
  v42[2] = CFSTR("endDate");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v18;
  v43[2] = v18;
  v42[3] = CFSTR("completedSetup");
  v19 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v3;
  v30 = (void *)v19;
  v43[3] = v19;
  v42[4] = CFSTR("lastViewedScreen");
  v20 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v7;
  v29 = (void *)v20;
  v43[4] = v20;
  v42[5] = CFSTR("appUsage");
  v21 = v41;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v11;
  v43[5] = v21;
  v42[6] = CFSTR("askToBuy");
  v22 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[6] = v22;
  v42[7] = CFSTR("commSafety");
  v23 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v13;
  v43[7] = v23;
  v42[8] = CFSTR("screenDistance");
  v25 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[8] = v25;
  v42[9] = CFSTR("age");
  v26 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[9] = v26;
  v42[10] = CFSTR("flowType");
  v27 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[10] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 11);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v14)
      goto LABEL_52;
  }
  else
  {

    if (v14)
      goto LABEL_52;
  }

LABEL_52:
  if (!v38)

  if (!v39)
  if (!v40)

  if (!v41)
  if (!v24)

  if (v12)
  {
    if (v35)
      goto LABEL_64;
  }
  else
  {

    if (v35)
    {
LABEL_64:
      if (v36)
        goto LABEL_65;
LABEL_71:

      if (v37)
        goto LABEL_66;
LABEL_72:

      goto LABEL_66;
    }
  }

  if (!v36)
    goto LABEL_71;
LABEL_65:
  if (!v37)
    goto LABEL_72;
LABEL_66:

  return v34;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_startDate);
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

- (NSDate)endDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_endDate);
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
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMAppleIDChildSetup hasIsNewChildAccount](self, "hasIsNewChildAccount")
      || objc_msgSend(v5, "hasIsNewChildAccount"))
    {
      if (!-[BMAppleIDChildSetup hasIsNewChildAccount](self, "hasIsNewChildAccount"))
        goto LABEL_48;
      if (!objc_msgSend(v5, "hasIsNewChildAccount"))
        goto LABEL_48;
      v6 = -[BMAppleIDChildSetup isNewChildAccount](self, "isNewChildAccount");
      if (v6 != objc_msgSend(v5, "isNewChildAccount"))
        goto LABEL_48;
    }
    -[BMAppleIDChildSetup startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMAppleIDChildSetup startDate](self, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_48;
    }
    -[BMAppleIDChildSetup endDate](self, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMAppleIDChildSetup endDate](self, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_48;
    }
    if (!-[BMAppleIDChildSetup hasCompletedSetup](self, "hasCompletedSetup")
      && !objc_msgSend(v5, "hasCompletedSetup")
      || -[BMAppleIDChildSetup hasCompletedSetup](self, "hasCompletedSetup")
      && objc_msgSend(v5, "hasCompletedSetup")
      && (v20 = -[BMAppleIDChildSetup completedSetup](self, "completedSetup"),
          v20 == objc_msgSend(v5, "completedSetup")))
    {
      v21 = -[BMAppleIDChildSetup lastViewedScreen](self, "lastViewedScreen");
      if (v21 == objc_msgSend(v5, "lastViewedScreen"))
      {
        if (!-[BMAppleIDChildSetup hasAppUsage](self, "hasAppUsage") && !objc_msgSend(v5, "hasAppUsage")
          || -[BMAppleIDChildSetup hasAppUsage](self, "hasAppUsage")
          && objc_msgSend(v5, "hasAppUsage")
          && (v22 = -[BMAppleIDChildSetup appUsage](self, "appUsage"), v22 == objc_msgSend(v5, "appUsage")))
        {
          if (!-[BMAppleIDChildSetup hasAskToBuy](self, "hasAskToBuy")
            && !objc_msgSend(v5, "hasAskToBuy")
            || -[BMAppleIDChildSetup hasAskToBuy](self, "hasAskToBuy")
            && objc_msgSend(v5, "hasAskToBuy")
            && (v23 = -[BMAppleIDChildSetup askToBuy](self, "askToBuy"),
                v23 == objc_msgSend(v5, "askToBuy")))
          {
            if (!-[BMAppleIDChildSetup hasCommSafety](self, "hasCommSafety")
              && !objc_msgSend(v5, "hasCommSafety")
              || -[BMAppleIDChildSetup hasCommSafety](self, "hasCommSafety")
              && objc_msgSend(v5, "hasCommSafety")
              && (v24 = -[BMAppleIDChildSetup commSafety](self, "commSafety"),
                  v24 == objc_msgSend(v5, "commSafety")))
            {
              if (!-[BMAppleIDChildSetup hasScreenDistance](self, "hasScreenDistance")
                && !objc_msgSend(v5, "hasScreenDistance")
                || -[BMAppleIDChildSetup hasScreenDistance](self, "hasScreenDistance")
                && objc_msgSend(v5, "hasScreenDistance")
                && (v25 = -[BMAppleIDChildSetup screenDistance](self, "screenDistance"),
                    v25 == objc_msgSend(v5, "screenDistance")))
              {
                if (!-[BMAppleIDChildSetup hasAge](self, "hasAge") && !objc_msgSend(v5, "hasAge")
                  || -[BMAppleIDChildSetup hasAge](self, "hasAge")
                  && objc_msgSend(v5, "hasAge")
                  && (v26 = -[BMAppleIDChildSetup age](self, "age"), v26 == objc_msgSend(v5, "age")))
                {
                  v27 = -[BMAppleIDChildSetup flowType](self, "flowType");
                  v13 = v27 == objc_msgSend(v5, "flowType");
LABEL_49:

                  goto LABEL_50;
                }
              }
            }
          }
        }
      }
    }
LABEL_48:
    v13 = 0;
    goto LABEL_49;
  }
  v13 = 0;
LABEL_50:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isNewChildAccount
{
  return self->_isNewChildAccount;
}

- (BOOL)hasIsNewChildAccount
{
  return self->_hasIsNewChildAccount;
}

- (void)setHasIsNewChildAccount:(BOOL)a3
{
  self->_hasIsNewChildAccount = a3;
}

- (BOOL)completedSetup
{
  return self->_completedSetup;
}

- (BOOL)hasCompletedSetup
{
  return self->_hasCompletedSetup;
}

- (void)setHasCompletedSetup:(BOOL)a3
{
  self->_hasCompletedSetup = a3;
}

- (int)lastViewedScreen
{
  return self->_lastViewedScreen;
}

- (BOOL)appUsage
{
  return self->_appUsage;
}

- (BOOL)hasAppUsage
{
  return self->_hasAppUsage;
}

- (void)setHasAppUsage:(BOOL)a3
{
  self->_hasAppUsage = a3;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (BOOL)hasAskToBuy
{
  return self->_hasAskToBuy;
}

- (void)setHasAskToBuy:(BOOL)a3
{
  self->_hasAskToBuy = a3;
}

- (BOOL)commSafety
{
  return self->_commSafety;
}

- (BOOL)hasCommSafety
{
  return self->_hasCommSafety;
}

- (void)setHasCommSafety:(BOOL)a3
{
  self->_hasCommSafety = a3;
}

- (BOOL)screenDistance
{
  return self->_screenDistance;
}

- (BOOL)hasScreenDistance
{
  return self->_hasScreenDistance;
}

- (void)setHasScreenDistance:(BOOL)a3
{
  self->_hasScreenDistance = a3;
}

- (unsigned)age
{
  return self->_age;
}

- (BOOL)hasAge
{
  return self->_hasAge;
}

- (void)setHasAge:(BOOL)a3
{
  self->_hasAge = a3;
}

- (int)flowType
{
  return self->_flowType;
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

    v4 = -[BMAppleIDChildSetup initByReadFrom:]([BMAppleIDChildSetup alloc], "initByReadFrom:", v7);
    v4[16] = 0;

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
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNewChildAccount"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startDate"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endDate"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("completedSetup"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastViewedScreen"), 0, 0, 5, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appUsage"), 0, 0, 6, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("askToBuy"), 0, 0, 7, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("commSafety"), 0, 0, 8, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("screenDistance"), 0, 0, 9, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("age"), 0, 0, 10, 4, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("flowType"), 0, 0, 11, 4, 0);
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D9F8;
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
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNewChildAccount"), 1, 12, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startDate"), 2, 0, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endDate"), 3, 0, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("completedSetup"), 4, 12, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastViewedScreen"), 5, 4, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appUsage"), 6, 12, 0);
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("askToBuy"), 7, 12, 0);
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("commSafety"), 8, 12, 0);
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("screenDistance"), 9, 12, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("age"), 10, 4, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("flowType"), 11, 4, 0);
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
