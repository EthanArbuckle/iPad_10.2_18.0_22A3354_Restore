@implementation BMSiriAssistantSuggestionFeaturesUserSegmentation

- (BMSiriAssistantSuggestionFeaturesUserSegmentation)initWithIs2x3:(id)a3 siriWasDisabled:(id)a4 siriWasdictationOnly:(id)a5 active6MonthsOrMoreAgo:(id)a6 active28To6MonthsDaysAgo:(id)a7 active14To28DaysAgo:(id)a8 active7To14DaysAgo:(id)a9 activeWithin7days:(id)a10 activeWithin7days1Turn:(id)a11 activeWithin7Days2To3Turns:(id)a12 activeWithin7Days4PlusTurns:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMSiriAssistantSuggestionFeaturesUserSegmentation *v26;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v18 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriAssistantSuggestionFeaturesUserSegmentation;
  v26 = -[BMEventBase init](&v32, sel_init);
  if (v26)
  {
    v26->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v18)
    {
      v26->_hasIs2x3 = 1;
      v26->_is2x3 = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v26->_hasIs2x3 = 0;
      v26->_is2x3 = 0;
    }
    if (v31)
    {
      v26->_hasSiriWasDisabled = 1;
      v26->_siriWasDisabled = objc_msgSend(v31, "BOOLValue");
    }
    else
    {
      v26->_hasSiriWasDisabled = 0;
      v26->_siriWasDisabled = 0;
    }
    if (v30)
    {
      v26->_hasSiriWasdictationOnly = 1;
      v26->_siriWasdictationOnly = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v26->_hasSiriWasdictationOnly = 0;
      v26->_siriWasdictationOnly = 0;
    }
    if (v29)
    {
      v26->_hasActive6MonthsOrMoreAgo = 1;
      v26->_active6MonthsOrMoreAgo = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v26->_hasActive6MonthsOrMoreAgo = 0;
      v26->_active6MonthsOrMoreAgo = 0;
    }
    if (v19)
    {
      v26->_hasActive28To6MonthsDaysAgo = 1;
      v26->_active28To6MonthsDaysAgo = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v26->_hasActive28To6MonthsDaysAgo = 0;
      v26->_active28To6MonthsDaysAgo = 0;
    }
    if (v20)
    {
      v26->_hasActive14To28DaysAgo = 1;
      v26->_active14To28DaysAgo = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v26->_hasActive14To28DaysAgo = 0;
      v26->_active14To28DaysAgo = 0;
    }
    if (v21)
    {
      v26->_hasActive7To14DaysAgo = 1;
      v26->_active7To14DaysAgo = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v26->_hasActive7To14DaysAgo = 0;
      v26->_active7To14DaysAgo = 0;
    }
    if (v22)
    {
      v26->_hasActiveWithin7days = 1;
      v26->_activeWithin7days = objc_msgSend(v22, "BOOLValue");
    }
    else
    {
      v26->_hasActiveWithin7days = 0;
      v26->_activeWithin7days = 0;
    }
    if (v23)
    {
      v26->_hasActiveWithin7days1Turn = 1;
      v26->_activeWithin7days1Turn = objc_msgSend(v23, "BOOLValue");
    }
    else
    {
      v26->_hasActiveWithin7days1Turn = 0;
      v26->_activeWithin7days1Turn = 0;
    }
    if (v24)
    {
      v26->_hasActiveWithin7Days2To3Turns = 1;
      v26->_activeWithin7Days2To3Turns = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v26->_hasActiveWithin7Days2To3Turns = 0;
      v26->_activeWithin7Days2To3Turns = 0;
    }
    if (v25)
    {
      v26->_hasActiveWithin7Days4PlusTurns = 1;
      v26->_activeWithin7Days4PlusTurns = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v26->_hasActiveWithin7Days4PlusTurns = 0;
      v26->_activeWithin7Days4PlusTurns = 0;
    }
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
  id v14;
  void *v15;
  void *v16;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation is2x3](self, "is2x3"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasDisabled](self, "siriWasDisabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasdictationOnly](self, "siriWasdictationOnly"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active6MonthsOrMoreAgo](self, "active6MonthsOrMoreAgo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active28To6MonthsDaysAgo](self, "active28To6MonthsDaysAgo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active14To28DaysAgo](self, "active14To28DaysAgo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active7To14DaysAgo](self, "active7To14DaysAgo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days](self, "activeWithin7days"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days1Turn](self, "activeWithin7days1Turn"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days2To3Turns](self, "activeWithin7Days2To3Turns"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days4PlusTurns](self, "activeWithin7Days4PlusTurns"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesUserSegmentation with is2x3: %@, siriWasDisabled: %@, siriWasdictationOnly: %@, active6MonthsOrMoreAgo: %@, active28To6MonthsDaysAgo: %@, active14To28DaysAgo: %@, active7To14DaysAgo: %@, activeWithin7days: %@, activeWithin7days1Turn: %@, activeWithin7Days2To3Turns: %@, activeWithin7Days4PlusTurns: %@"), v13, v12, v16, v3, v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
  BMSiriAssistantSuggestionFeaturesUserSegmentation *v6;
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
  int *v39;
  int *v40;
  int *v41;
  uint64_t v42;
  int *v43;
  int *v44;
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
  BMSiriAssistantSuggestionFeaturesUserSegmentation *v106;
  BMSiriAssistantSuggestionFeaturesUserSegmentation *v108;
  objc_super v109;

  v4 = a3;
  v109.receiver = self;
  v109.super_class = (Class)BMSiriAssistantSuggestionFeaturesUserSegmentation;
  v6 = -[BMEventBase init](&v109, sel_init);
  if (!v6)
    goto LABEL_130;
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v11 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__is2x3;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    v13 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v14 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasDisabled;
    v15 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v16 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v17 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v18 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
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
          *((_BYTE *)&v6->super.super.isa + v10[202]) = 1;
          while (1)
          {
            v32 = *v7;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v8])
            {
              v37 = v11;
              goto LABEL_110;
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
              goto LABEL_114;
          }
          v37 = v11;
          goto LABEL_111;
        case 2u:
          v46 = 0;
          v47 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v13[204]) = 1;
          while (2)
          {
            v48 = *v7;
            v49 = *(_QWORD *)&v4[v48];
            v50 = v49 + 1;
            if (v49 == -1 || v50 > *(_QWORD *)&v4[*v8])
            {
              v37 = v14;
              goto LABEL_110;
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
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = v14;
          goto LABEL_111;
        case 3u:
          v52 = 0;
          v53 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v15[206]) = 1;
          while (2)
          {
            v54 = *v7;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasdictationOnly;
              goto LABEL_110;
            }
            v57 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v55);
            *(_QWORD *)&v4[v54] = v56;
            v31 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v36 = 0;
              v52 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasdictationOnly;
              v38 = v53++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__siriWasdictationOnly;
          goto LABEL_111;
        case 4u:
          v58 = 0;
          v59 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v16[208]) = 1;
          while (2)
          {
            v60 = *v7;
            v61 = *(_QWORD *)&v4[v60];
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active6MonthsOrMoreAgo;
              goto LABEL_110;
            }
            v63 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v61);
            *(_QWORD *)&v4[v60] = v62;
            v31 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v36 = 0;
              v58 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active6MonthsOrMoreAgo;
              v38 = v59++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active6MonthsOrMoreAgo;
          goto LABEL_111;
        case 5u:
          v64 = 0;
          v65 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v17[210]) = 1;
          while (2)
          {
            v66 = *v7;
            v67 = *(_QWORD *)&v4[v66];
            v68 = v67 + 1;
            if (v67 == -1 || v68 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active28To6MonthsDaysAgo;
              goto LABEL_110;
            }
            v69 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v67);
            *(_QWORD *)&v4[v66] = v68;
            v31 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v36 = 0;
              v64 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active28To6MonthsDaysAgo;
              v38 = v65++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active28To6MonthsDaysAgo;
          goto LABEL_111;
        case 6u:
          v70 = 0;
          v71 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v18[212]) = 1;
          while (2)
          {
            v72 = *v7;
            v73 = *(_QWORD *)&v4[v72];
            v74 = v73 + 1;
            if (v73 == -1 || v74 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active14To28DaysAgo;
              goto LABEL_110;
            }
            v75 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v73);
            *(_QWORD *)&v4[v72] = v74;
            v31 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v36 = 0;
              v70 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active14To28DaysAgo;
              v38 = v71++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active14To28DaysAgo;
          goto LABEL_111;
        case 7u:
          v76 = 0;
          v77 = 0;
          v31 = 0;
          v6->_hasActive7To14DaysAgo = 1;
          while (2)
          {
            v78 = *v7;
            v79 = *(_QWORD *)&v4[v78];
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active7To14DaysAgo;
              goto LABEL_110;
            }
            v81 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v79);
            *(_QWORD *)&v4[v78] = v80;
            v31 |= (unint64_t)(v81 & 0x7F) << v76;
            if (v81 < 0)
            {
              v36 = 0;
              v76 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active7To14DaysAgo;
              v38 = v77++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__active7To14DaysAgo;
          goto LABEL_111;
        case 8u:
          v82 = 0;
          v83 = 0;
          v31 = 0;
          v6->_hasActiveWithin7days = 1;
          while (2)
          {
            v84 = *v7;
            v85 = *(_QWORD *)&v4[v84];
            v86 = v85 + 1;
            if (v85 == -1 || v86 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days;
              goto LABEL_110;
            }
            v87 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v85);
            *(_QWORD *)&v4[v84] = v86;
            v31 |= (unint64_t)(v87 & 0x7F) << v82;
            if (v87 < 0)
            {
              v36 = 0;
              v82 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days;
              v38 = v83++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days;
          goto LABEL_111;
        case 9u:
          v88 = 0;
          v89 = 0;
          v31 = 0;
          v6->_hasActiveWithin7days1Turn = 1;
          while (2)
          {
            v90 = *v7;
            v91 = *(_QWORD *)&v4[v90];
            v92 = v91 + 1;
            if (v91 == -1 || v92 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days1Turn;
              goto LABEL_110;
            }
            v93 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v91);
            *(_QWORD *)&v4[v90] = v92;
            v31 |= (unint64_t)(v93 & 0x7F) << v88;
            if (v93 < 0)
            {
              v36 = 0;
              v88 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days1Turn;
              v38 = v89++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7days1Turn;
          goto LABEL_111;
        case 0xAu:
          v94 = 0;
          v95 = 0;
          v31 = 0;
          v6->_hasActiveWithin7Days2To3Turns = 1;
          while (2)
          {
            v96 = *v7;
            v97 = *(_QWORD *)&v4[v96];
            v98 = v97 + 1;
            if (v97 == -1 || v98 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days2To3Turns;
              goto LABEL_110;
            }
            v99 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v97);
            *(_QWORD *)&v4[v96] = v98;
            v31 |= (unint64_t)(v99 & 0x7F) << v94;
            if (v99 < 0)
            {
              v36 = 0;
              v94 += 7;
              v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days2To3Turns;
              v38 = v95++ > 8;
              if (v38)
                goto LABEL_114;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days2To3Turns;
          goto LABEL_111;
        case 0xBu:
          v100 = 0;
          v101 = 0;
          v31 = 0;
          v6->_hasActiveWithin7Days4PlusTurns = 1;
          break;
        default:
          v39 = v10;
          v40 = v11;
          v41 = v13;
          v42 = v5;
          v43 = v14;
          v108 = v6;
          v44 = v15;
          v45 = PBReaderSkipValueWithTag();
          v18 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v15 = v44;
          v9 = (int *)MEMORY[0x1E0D82BC8];
          v6 = v108;
          v14 = v43;
          v5 = v42;
          v13 = v41;
          v16 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v11 = v40;
          v10 = v39;
          v17 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          if ((v45 & 1) == 0)
            goto LABEL_129;
          continue;
      }
      while (1)
      {
        v102 = *v7;
        v103 = *(_QWORD *)&v4[v102];
        v104 = v103 + 1;
        if (v103 == -1 || v104 > *(_QWORD *)&v4[*v8])
          break;
        v105 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v103);
        *(_QWORD *)&v4[v102] = v104;
        v31 |= (unint64_t)(v105 & 0x7F) << v100;
        if ((v105 & 0x80) == 0)
        {
          v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days4PlusTurns;
          goto LABEL_111;
        }
        v36 = 0;
        v100 += 7;
        v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days4PlusTurns;
        v38 = v101++ > 8;
        if (v38)
          goto LABEL_114;
      }
      v37 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesUserSegmentation__activeWithin7Days4PlusTurns;
LABEL_110:
      v4[*v9] = 1;
LABEL_111:
      v36 = v4[*v9] ? 0 : v31;
LABEL_114:
      *((_BYTE *)&v6->super.super.isa + *v37) = v36 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  if (v4[*v9])
LABEL_129:
    v106 = 0;
  else
LABEL_130:
    v106 = v6;

  return v106;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasIs2x3)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasSiriWasDisabled)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasSiriWasdictationOnly)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActive6MonthsOrMoreAgo)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActive28To6MonthsDaysAgo)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActive14To28DaysAgo)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActive7To14DaysAgo)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActiveWithin7days)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActiveWithin7days1Turn)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActiveWithin7Days2To3Turns)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasActiveWithin7Days4PlusTurns)
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
  -[BMSiriAssistantSuggestionFeaturesUserSegmentation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesUserSegmentation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id *v37;
  id *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  id *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  id *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id *v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  id *v84;
  uint64_t v85;
  id v86;
  id *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  BMSiriAssistantSuggestionFeaturesUserSegmentation *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  _QWORD v132[3];

  v132[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("is2x3"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriWasDisabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          goto LABEL_45;
        }
        v38 = a4;
        v39 = v8;
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v129 = *MEMORY[0x1E0CB2D50];
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("siriWasDisabled"));
        v130 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v40;
        v8 = v39;
        v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v41, 2, v12);
        a4 = 0;
        v10 = 0;
        *v38 = v43;
        goto LABEL_44;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriWasdictationOnly"));
    v11 = objc_claimAutoreleasedReturnValue();
    v109 = v10;
    v110 = self;
    v107 = (void *)v11;
    v108 = v8;
    v106 = v9;
    if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v29 = 0;
          goto LABEL_44;
        }
        v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = *MEMORY[0x1E0D025B8];
        v127 = *MEMORY[0x1E0CB2D50];
        v46 = a4;
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("siriWasdictationOnly"));
        v128 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v44;
        v8 = v108;
        a4 = 0;
        v29 = 0;
        *v46 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v45, 2, v30);
LABEL_43:

        v10 = v109;
        self = v110;
        v9 = v106;
        v12 = v107;
LABEL_44:

        goto LABEL_45;
      }
      v105 = v12;
    }
    else
    {
      v105 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("active6MonthsOrMoreAgo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = v13;
        if (!a4)
        {
          v14 = 0;
          v29 = v105;
          goto LABEL_43;
        }
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v125 = *MEMORY[0x1E0CB2D50];
        v50 = a4;
        v104 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("active6MonthsOrMoreAgo"));
        v126 = v104;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v48;
        v8 = v108;
        v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v49, 2, v15);
        a4 = 0;
        v14 = 0;
        *v50 = v52;
        v29 = v105;
        goto LABEL_42;
      }
      v103 = v13;
      v14 = v13;
    }
    else
    {
      v103 = v13;
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("active28To6MonthsDaysAgo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v104 = 0;
          v29 = v105;
          v30 = v103;
          goto LABEL_42;
        }
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v54 = *MEMORY[0x1E0D025B8];
        v123 = *MEMORY[0x1E0CB2D50];
        v55 = a4;
        v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("active28To6MonthsDaysAgo"));
        v124 = v56;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = v53;
        v8 = v108;
        v59 = v54;
        v19 = (id)v56;
        v102 = (void *)v57;
        a4 = 0;
        v104 = 0;
        *v55 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 2);
        v29 = v105;
        v30 = v103;
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      v16 = v15;
      v104 = v15;
    }
    else
    {
      v16 = v15;
      v104 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("active14To28DaysAgo"));
    v17 = objc_claimAutoreleasedReturnValue();
    v102 = (void *)v17;
    if (v17 && (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v19 = 0;
          v29 = v105;
          v30 = v103;
          v15 = v16;
          goto LABEL_41;
        }
        v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v61 = *MEMORY[0x1E0D025B8];
        v121 = *MEMORY[0x1E0CB2D50];
        v62 = a4;
        v101 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("active14To28DaysAgo"));
        v122 = v101;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        a4 = 0;
        v19 = 0;
        *v62 = v63;
        goto LABEL_98;
      }
      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("active7To14DaysAgo"));
    v20 = objc_claimAutoreleasedReturnValue();
    v100 = (void *)v20;
    if (!v20 || (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v101 = 0;
LABEL_22:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activeWithin7days"));
      v15 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v99 = 0;
            v29 = v105;
            v30 = v103;
            goto LABEL_39;
          }
          v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v71 = v22;
          v72 = v19;
          v73 = *MEMORY[0x1E0D025B8];
          v117 = *MEMORY[0x1E0CB2D50];
          v95 = v14;
          v74 = a4;
          v98 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("activeWithin7days"));
          v118 = v98;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = v70;
          v8 = v108;
          v77 = v73;
          v19 = v72;
          v22 = v71;
          v96 = (void *)v75;
          a4 = 0;
          v99 = 0;
          *v74 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
          v14 = v95;
          goto LABEL_101;
        }
        v99 = v22;
      }
      else
      {
        v99 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activeWithin7days1Turn"));
      v23 = objc_claimAutoreleasedReturnValue();
      v96 = (void *)v23;
      v97 = v19;
      if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v98 = 0;
LABEL_28:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activeWithin7Days2To3Turns"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v14;
        if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v26 = 0;
              goto LABEL_37;
            }
            v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v83 = v22;
            v84 = a4;
            v85 = *MEMORY[0x1E0D025B8];
            v113 = *MEMORY[0x1E0CB2D50];
            v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("activeWithin7Days2To3Turns"));
            v114 = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v85, 2, v27);
            a4 = 0;
            v26 = 0;
            *v84 = v86;
            v22 = v83;
            v14 = v94;
            goto LABEL_36;
          }
          v92 = v22;
          v26 = v25;
        }
        else
        {
          v92 = v22;
          v26 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activeWithin7Days4PlusTurns"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v87 = a4;
              v91 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v90 = *MEMORY[0x1E0D025B8];
              v111 = *MEMORY[0x1E0CB2D50];
              v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("activeWithin7Days4PlusTurns"));
              v112 = v88;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              *v87 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v90, 2, v89);

              v28 = 0;
              a4 = 0;
            }
            else
            {
              v28 = 0;
            }
            v14 = v94;
            goto LABEL_35;
          }
          v28 = v27;
        }
        else
        {
          v28 = 0;
        }
        a4 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation initWithIs2x3:siriWasDisabled:siriWasdictationOnly:active6MonthsOrMoreAgo:active28To6MonthsDaysAgo:active14To28DaysAgo:active7To14DaysAgo:activeWithin7days:activeWithin7days1Turn:activeWithin7Days2To3Turns:activeWithin7Days4PlusTurns:](v110, "initWithIs2x3:siriWasDisabled:siriWasdictationOnly:active6MonthsOrMoreAgo:active28To6MonthsDaysAgo:active14To28DaysAgo:active7To14DaysAgo:activeWithin7days:activeWithin7days1Turn:activeWithin7Days2To3Turns:activeWithin7Days4PlusTurns:", v108, v109, v105, v14, v104, v97, v101, v99, v98, v26, v28);
        v110 = (BMSiriAssistantSuggestionFeaturesUserSegmentation *)a4;
LABEL_35:
        v22 = v92;
LABEL_36:

LABEL_37:
        v8 = v108;
        v29 = v105;
        v30 = v103;
        v19 = v97;
LABEL_38:

LABEL_39:
LABEL_40:

        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v98 = v24;
        goto LABEL_28;
      }
      if (a4)
      {
        v78 = a4;
        v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v80 = *MEMORY[0x1E0D025B8];
        v115 = *MEMORY[0x1E0CB2D50];
        v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("activeWithin7days1Turn"));
        v116 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2, v25);
        a4 = 0;
        v98 = 0;
        *v78 = v81;
        goto LABEL_37;
      }
      v98 = 0;
LABEL_101:
      v29 = v105;
      v30 = v103;
      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = v21;
      goto LABEL_22;
    }
    if (a4)
    {
      v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v65 = v19;
      v66 = *MEMORY[0x1E0D025B8];
      v119 = *MEMORY[0x1E0CB2D50];
      v67 = a4;
      v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("active7To14DaysAgo"));
      v120 = v99;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
      v93 = objc_claimAutoreleasedReturnValue();
      v68 = v64;
      v8 = v108;
      v69 = v66;
      v19 = v65;
      a4 = 0;
      v101 = 0;
      *v67 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2, v93);
      v29 = v105;
      v30 = v103;
      v15 = v16;
      v22 = (void *)v93;
      goto LABEL_39;
    }
    v101 = 0;
LABEL_98:
    v29 = v105;
    v30 = v103;
    v15 = v16;
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    goto LABEL_46;
  }
  v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v33 = *MEMORY[0x1E0D025B8];
  v131 = *MEMORY[0x1E0CB2D50];
  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("is2x3"));
  v132[0] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, &v131, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33;
  v10 = (id)v34;
  v36 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v35, 2, v9);
  v37 = a4;
  a4 = 0;
  v8 = 0;
  *v37 = v36;
LABEL_45:

LABEL_46:
  return (BMSiriAssistantSuggestionFeaturesUserSegmentation *)a4;
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[11];
  _QWORD v37[13];

  v37[11] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasIs2x3](self, "hasIs2x3"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation is2x3](self, "is2x3"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasSiriWasDisabled](self, "hasSiriWasDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasDisabled](self, "siriWasDisabled"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasSiriWasdictationOnly](self, "hasSiriWasdictationOnly"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasdictationOnly](self, "siriWasdictationOnly"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive6MonthsOrMoreAgo](self, "hasActive6MonthsOrMoreAgo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active6MonthsOrMoreAgo](self, "active6MonthsOrMoreAgo"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive28To6MonthsDaysAgo](self, "hasActive28To6MonthsDaysAgo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active28To6MonthsDaysAgo](self, "active28To6MonthsDaysAgo"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive14To28DaysAgo](self, "hasActive14To28DaysAgo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active14To28DaysAgo](self, "active14To28DaysAgo"));
    v35 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive7To14DaysAgo](self, "hasActive7To14DaysAgo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation active7To14DaysAgo](self, "active7To14DaysAgo"));
    v34 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7days](self, "hasActiveWithin7days"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days](self, "activeWithin7days"));
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7days1Turn](self, "hasActiveWithin7days1Turn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days1Turn](self, "activeWithin7days1Turn"));
    v32 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days2To3Turns](self, "hasActiveWithin7Days2To3Turns"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days2To3Turns](self, "activeWithin7Days2To3Turns"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days4PlusTurns](self, "hasActiveWithin7Days4PlusTurns"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days4PlusTurns](self, "activeWithin7Days4PlusTurns"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v36[0] = CFSTR("is2x3");
  v10 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v10;
  v37[0] = v10;
  v36[1] = CFSTR("siriWasDisabled");
  v11 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v11;
  v37[1] = v11;
  v36[2] = CFSTR("siriWasdictationOnly");
  v12 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v12;
  v37[2] = v12;
  v36[3] = CFSTR("active6MonthsOrMoreAgo");
  v13 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v31 = v3;
  v24 = (void *)v13;
  v37[3] = v13;
  v36[4] = CFSTR("active28To6MonthsDaysAgo");
  v14 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v30 = v4;
  v23 = (void *)v14;
  v37[4] = v14;
  v36[5] = CFSTR("active14To28DaysAgo");
  v15 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v5;
  v37[5] = v15;
  v36[6] = CFSTR("active7To14DaysAgo");
  v16 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v6;
  v37[6] = v16;
  v36[7] = CFSTR("activeWithin7days");
  v18 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[7] = v18;
  v36[8] = CFSTR("activeWithin7days1Turn");
  v19 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[8] = v19;
  v36[9] = CFSTR("activeWithin7Days2To3Turns");
  v20 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[9] = v20;
  v36[10] = CFSTR("activeWithin7Days4PlusTurns");
  v21 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[10] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 11);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_58;
  }
  else
  {

    if (v8)
      goto LABEL_58;
  }

LABEL_58:
  if (!v32)

  if (!v33)
  if (!v34)

  if (!v35)
  if (!v7)

  if (v17)
  {
    if (v29)
      goto LABEL_70;
  }
  else
  {

    if (v29)
    {
LABEL_70:
      if (v30)
        goto LABEL_71;
LABEL_77:

      if (v31)
        goto LABEL_72;
LABEL_78:

      goto LABEL_72;
    }
  }

  if (!v30)
    goto LABEL_77;
LABEL_71:
  if (!v31)
    goto LABEL_78;
LABEL_72:

  return v28;
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
  _BOOL4 v16;
  int v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasIs2x3](self, "hasIs2x3")
      || objc_msgSend(v5, "hasIs2x3"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasIs2x3](self, "hasIs2x3"))
        goto LABEL_58;
      if (!objc_msgSend(v5, "hasIs2x3"))
        goto LABEL_58;
      v6 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation is2x3](self, "is2x3");
      if (v6 != objc_msgSend(v5, "is2x3"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasSiriWasDisabled](self, "hasSiriWasDisabled")
      || objc_msgSend(v5, "hasSiriWasDisabled"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasSiriWasDisabled](self, "hasSiriWasDisabled"))
        goto LABEL_58;
      if (!objc_msgSend(v5, "hasSiriWasDisabled"))
        goto LABEL_58;
      v7 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasDisabled](self, "siriWasDisabled");
      if (v7 != objc_msgSend(v5, "siriWasDisabled"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasSiriWasdictationOnly](self, "hasSiriWasdictationOnly")
      || objc_msgSend(v5, "hasSiriWasdictationOnly"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasSiriWasdictationOnly](self, "hasSiriWasdictationOnly"))goto LABEL_58;
      if (!objc_msgSend(v5, "hasSiriWasdictationOnly"))
        goto LABEL_58;
      v8 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation siriWasdictationOnly](self, "siriWasdictationOnly");
      if (v8 != objc_msgSend(v5, "siriWasdictationOnly"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive6MonthsOrMoreAgo](self, "hasActive6MonthsOrMoreAgo")|| objc_msgSend(v5, "hasActive6MonthsOrMoreAgo"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive6MonthsOrMoreAgo](self, "hasActive6MonthsOrMoreAgo"))goto LABEL_58;
      if (!objc_msgSend(v5, "hasActive6MonthsOrMoreAgo"))
        goto LABEL_58;
      v9 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation active6MonthsOrMoreAgo](self, "active6MonthsOrMoreAgo");
      if (v9 != objc_msgSend(v5, "active6MonthsOrMoreAgo"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive28To6MonthsDaysAgo](self, "hasActive28To6MonthsDaysAgo")|| objc_msgSend(v5, "hasActive28To6MonthsDaysAgo"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive28To6MonthsDaysAgo](self, "hasActive28To6MonthsDaysAgo"))goto LABEL_58;
      if (!objc_msgSend(v5, "hasActive28To6MonthsDaysAgo"))
        goto LABEL_58;
      v10 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation active28To6MonthsDaysAgo](self, "active28To6MonthsDaysAgo");
      if (v10 != objc_msgSend(v5, "active28To6MonthsDaysAgo"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive14To28DaysAgo](self, "hasActive14To28DaysAgo")
      || objc_msgSend(v5, "hasActive14To28DaysAgo"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive14To28DaysAgo](self, "hasActive14To28DaysAgo"))
        goto LABEL_58;
      if (!objc_msgSend(v5, "hasActive14To28DaysAgo"))
        goto LABEL_58;
      v11 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation active14To28DaysAgo](self, "active14To28DaysAgo");
      if (v11 != objc_msgSend(v5, "active14To28DaysAgo"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive7To14DaysAgo](self, "hasActive7To14DaysAgo")
      || objc_msgSend(v5, "hasActive7To14DaysAgo"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActive7To14DaysAgo](self, "hasActive7To14DaysAgo"))
        goto LABEL_58;
      if (!objc_msgSend(v5, "hasActive7To14DaysAgo"))
        goto LABEL_58;
      v12 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation active7To14DaysAgo](self, "active7To14DaysAgo");
      if (v12 != objc_msgSend(v5, "active7To14DaysAgo"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7days](self, "hasActiveWithin7days")
      || objc_msgSend(v5, "hasActiveWithin7days"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7days](self, "hasActiveWithin7days"))
        goto LABEL_58;
      if (!objc_msgSend(v5, "hasActiveWithin7days"))
        goto LABEL_58;
      v13 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days](self, "activeWithin7days");
      if (v13 != objc_msgSend(v5, "activeWithin7days"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7days1Turn](self, "hasActiveWithin7days1Turn")|| objc_msgSend(v5, "hasActiveWithin7days1Turn"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7days1Turn](self, "hasActiveWithin7days1Turn"))goto LABEL_58;
      if (!objc_msgSend(v5, "hasActiveWithin7days1Turn"))
        goto LABEL_58;
      v14 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7days1Turn](self, "activeWithin7days1Turn");
      if (v14 != objc_msgSend(v5, "activeWithin7days1Turn"))
        goto LABEL_58;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days2To3Turns](self, "hasActiveWithin7Days2To3Turns")|| objc_msgSend(v5, "hasActiveWithin7Days2To3Turns"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days2To3Turns](self, "hasActiveWithin7Days2To3Turns"))goto LABEL_58;
      if (!objc_msgSend(v5, "hasActiveWithin7Days2To3Turns"))
        goto LABEL_58;
      v15 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days2To3Turns](self, "activeWithin7Days2To3Turns");
      if (v15 != objc_msgSend(v5, "activeWithin7Days2To3Turns"))
        goto LABEL_58;
    }
    if (!-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days4PlusTurns](self, "hasActiveWithin7Days4PlusTurns")&& !objc_msgSend(v5, "hasActiveWithin7Days4PlusTurns"))
    {
      LOBYTE(v17) = 1;
      goto LABEL_59;
    }
    if (-[BMSiriAssistantSuggestionFeaturesUserSegmentation hasActiveWithin7Days4PlusTurns](self, "hasActiveWithin7Days4PlusTurns")&& objc_msgSend(v5, "hasActiveWithin7Days4PlusTurns"))
    {
      v16 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation activeWithin7Days4PlusTurns](self, "activeWithin7Days4PlusTurns");
      v17 = v16 ^ objc_msgSend(v5, "activeWithin7Days4PlusTurns") ^ 1;
    }
    else
    {
LABEL_58:
      LOBYTE(v17) = 0;
    }
LABEL_59:

    goto LABEL_60;
  }
  LOBYTE(v17) = 0;
LABEL_60:

  return v17;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)is2x3
{
  return self->_is2x3;
}

- (BOOL)hasIs2x3
{
  return self->_hasIs2x3;
}

- (void)setHasIs2x3:(BOOL)a3
{
  self->_hasIs2x3 = a3;
}

- (BOOL)siriWasDisabled
{
  return self->_siriWasDisabled;
}

- (BOOL)hasSiriWasDisabled
{
  return self->_hasSiriWasDisabled;
}

- (void)setHasSiriWasDisabled:(BOOL)a3
{
  self->_hasSiriWasDisabled = a3;
}

- (BOOL)siriWasdictationOnly
{
  return self->_siriWasdictationOnly;
}

- (BOOL)hasSiriWasdictationOnly
{
  return self->_hasSiriWasdictationOnly;
}

- (void)setHasSiriWasdictationOnly:(BOOL)a3
{
  self->_hasSiriWasdictationOnly = a3;
}

- (BOOL)active6MonthsOrMoreAgo
{
  return self->_active6MonthsOrMoreAgo;
}

- (BOOL)hasActive6MonthsOrMoreAgo
{
  return self->_hasActive6MonthsOrMoreAgo;
}

- (void)setHasActive6MonthsOrMoreAgo:(BOOL)a3
{
  self->_hasActive6MonthsOrMoreAgo = a3;
}

- (BOOL)active28To6MonthsDaysAgo
{
  return self->_active28To6MonthsDaysAgo;
}

- (BOOL)hasActive28To6MonthsDaysAgo
{
  return self->_hasActive28To6MonthsDaysAgo;
}

- (void)setHasActive28To6MonthsDaysAgo:(BOOL)a3
{
  self->_hasActive28To6MonthsDaysAgo = a3;
}

- (BOOL)active14To28DaysAgo
{
  return self->_active14To28DaysAgo;
}

- (BOOL)hasActive14To28DaysAgo
{
  return self->_hasActive14To28DaysAgo;
}

- (void)setHasActive14To28DaysAgo:(BOOL)a3
{
  self->_hasActive14To28DaysAgo = a3;
}

- (BOOL)active7To14DaysAgo
{
  return self->_active7To14DaysAgo;
}

- (BOOL)hasActive7To14DaysAgo
{
  return self->_hasActive7To14DaysAgo;
}

- (void)setHasActive7To14DaysAgo:(BOOL)a3
{
  self->_hasActive7To14DaysAgo = a3;
}

- (BOOL)activeWithin7days
{
  return self->_activeWithin7days;
}

- (BOOL)hasActiveWithin7days
{
  return self->_hasActiveWithin7days;
}

- (void)setHasActiveWithin7days:(BOOL)a3
{
  self->_hasActiveWithin7days = a3;
}

- (BOOL)activeWithin7days1Turn
{
  return self->_activeWithin7days1Turn;
}

- (BOOL)hasActiveWithin7days1Turn
{
  return self->_hasActiveWithin7days1Turn;
}

- (void)setHasActiveWithin7days1Turn:(BOOL)a3
{
  self->_hasActiveWithin7days1Turn = a3;
}

- (BOOL)activeWithin7Days2To3Turns
{
  return self->_activeWithin7Days2To3Turns;
}

- (BOOL)hasActiveWithin7Days2To3Turns
{
  return self->_hasActiveWithin7Days2To3Turns;
}

- (void)setHasActiveWithin7Days2To3Turns:(BOOL)a3
{
  self->_hasActiveWithin7Days2To3Turns = a3;
}

- (BOOL)activeWithin7Days4PlusTurns
{
  return self->_activeWithin7Days4PlusTurns;
}

- (BOOL)hasActiveWithin7Days4PlusTurns
{
  return self->_hasActiveWithin7Days4PlusTurns;
}

- (void)setHasActiveWithin7Days4PlusTurns:(BOOL)a3
{
  self->_hasActiveWithin7Days4PlusTurns = a3;
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

    v4 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation initByReadFrom:]([BMSiriAssistantSuggestionFeaturesUserSegmentation alloc], "initByReadFrom:", v7);
    v4[10] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("is2x3"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriWasDisabled"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriWasdictationOnly"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("active6MonthsOrMoreAgo"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("active28To6MonthsDaysAgo"), 0, 0, 5, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("active14To28DaysAgo"), 0, 0, 6, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("active7To14DaysAgo"), 0, 0, 7, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activeWithin7days"), 0, 0, 8, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activeWithin7days1Turn"), 0, 0, 9, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activeWithin7Days2To3Turns"), 0, 0, 10, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activeWithin7Days4PlusTurns"), 0, 0, 11, 12, 0);
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
  return &unk_1E5F1B238;
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
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("is2x3"), 1, 12, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriWasDisabled"), 2, 12, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriWasdictationOnly"), 3, 12, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("active6MonthsOrMoreAgo"), 4, 12, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("active28To6MonthsDaysAgo"), 5, 12, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("active14To28DaysAgo"), 6, 12, 0);
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("active7To14DaysAgo"), 7, 12, 0);
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activeWithin7days"), 8, 12, 0);
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activeWithin7days1Turn"), 9, 12, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activeWithin7Days2To3Turns"), 10, 12, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activeWithin7Days4PlusTurns"), 11, 12, 0);
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
