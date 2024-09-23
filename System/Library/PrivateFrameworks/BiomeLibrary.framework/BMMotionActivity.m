@implementation BMMotionActivity

- (BMMotionActivity)initWithStationary:(id)a3 walking:(id)a4 running:(id)a5 automotive:(id)a6 cycling:(id)a7 unknown:(id)a8 startDate:(id)a9 confidence:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BMMotionActivity *v23;
  double v24;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMMotionActivity;
  v23 = -[BMEventBase init](&v26, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v23->_hasStationary = 1;
      v23->_stationary = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v23->_hasStationary = 0;
      v23->_stationary = 0;
    }
    if (v17)
    {
      v23->_hasWalking = 1;
      v23->_walking = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v23->_hasWalking = 0;
      v23->_walking = 0;
    }
    if (v18)
    {
      v23->_hasRunning = 1;
      v23->_running = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v23->_hasRunning = 0;
      v23->_running = 0;
    }
    if (v19)
    {
      v23->_hasAutomotive = 1;
      v23->_automotive = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v23->_hasAutomotive = 0;
      v23->_automotive = 0;
    }
    if (v20)
    {
      v23->_hasCycling = 1;
      v23->_cycling = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v23->_hasCycling = 0;
      v23->_cycling = 0;
    }
    if (v21)
    {
      v23->_hasUnknown = 1;
      v23->_unknown = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v23->_hasUnknown = 0;
      v23->_unknown = 0;
    }
    if (v22)
    {
      v23->_hasRaw_startDate = 1;
      objc_msgSend(v22, "timeIntervalSince1970");
    }
    else
    {
      v23->_hasRaw_startDate = 0;
      v24 = -1.0;
    }
    v23->_raw_startDate = v24;
    v23->_confidence = a10;
  }

  return v23;
}

- (NSString)description
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity stationary](self, "stationary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity walking](self, "walking"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity running](self, "running"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity automotive](self, "automotive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity cycling](self, "cycling"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity unknown](self, "unknown"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMotionActivity startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMMotionActivityConfidenceAsString(-[BMMotionActivity confidence](self, "confidence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMotionActivity with stationary: %@, walking: %@, running: %@, automotive: %@, cycling: %@, unknown: %@, startDate: %@, confidence: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMotionActivity *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
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
  uint64_t v62;
  unint64_t v63;
  double v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  BOOL v72;
  uint64_t v73;
  BMMotionActivity *v74;
  objc_super v76;

  v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)BMMotionActivity;
  v5 = -[BMEventBase init](&v76, sel_init);
  if (!v5)
    goto LABEL_111;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasStationary = 1;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_75;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_77;
            }
          }
          v4[*v8] = 1;
LABEL_75:
          if (v4[*v8])
            v22 = 0;
LABEL_77:
          v72 = v22 != 0;
          v73 = 32;
          goto LABEL_98;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v5->_hasWalking = 1;
          while (2)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
              *(_QWORD *)&v4[v30] = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                v17 = v28++ >= 9;
                if (v17)
                {
                  v29 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v29 = 0;
LABEL_81:
          v72 = v29 != 0;
          v73 = 34;
          goto LABEL_98;
        case 3u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v5->_hasRunning = 1;
          while (2)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v4[v37];
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
              *(_QWORD *)&v4[v37] = v39;
              v36 |= (unint64_t)(v40 & 0x7F) << v34;
              if (v40 < 0)
              {
                v34 += 7;
                v17 = v35++ >= 9;
                if (v17)
                {
                  v36 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v36 = 0;
LABEL_85:
          v72 = v36 != 0;
          v73 = 36;
          goto LABEL_98;
        case 4u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v5->_hasAutomotive = 1;
          while (2)
          {
            v44 = *v6;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
              *(_QWORD *)&v4[v44] = v46;
              v43 |= (unint64_t)(v47 & 0x7F) << v41;
              if (v47 < 0)
              {
                v41 += 7;
                v17 = v42++ >= 9;
                if (v17)
                {
                  v43 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v43 = 0;
LABEL_89:
          v72 = v43 != 0;
          v73 = 38;
          goto LABEL_98;
        case 5u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v5->_hasCycling = 1;
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
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v50 = 0;
LABEL_93:
          v72 = v50 != 0;
          v73 = 40;
          goto LABEL_98;
        case 6u:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v5->_hasUnknown = 1;
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
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v57 = 0;
LABEL_97:
          v72 = v57 != 0;
          v73 = 42;
LABEL_98:
          *((_BYTE *)&v5->super.super.isa + v73) = v72;
          continue;
        case 7u:
          v5->_hasRaw_startDate = 1;
          v62 = *v6;
          v63 = *(_QWORD *)&v4[v62];
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v64 = *(double *)(*(_QWORD *)&v4[*v9] + v63);
            *(_QWORD *)&v4[v62] = v63 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v64 = 0.0;
          }
          v5->_raw_startDate = v64;
          continue;
        case 8u:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_110;
          continue;
      }
      while (1)
      {
        v68 = *v6;
        v69 = *(_QWORD *)&v4[v68];
        v70 = v69 + 1;
        if (v69 == -1 || v70 > *(_QWORD *)&v4[*v7])
          break;
        v71 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v69);
        *(_QWORD *)&v4[v68] = v70;
        v67 |= (unint64_t)(v71 & 0x7F) << v65;
        if ((v71 & 0x80) == 0)
          goto LABEL_102;
        v65 += 7;
        v17 = v66++ >= 9;
        if (v17)
        {
          LODWORD(v67) = 0;
          goto LABEL_104;
        }
      }
      v4[*v8] = 1;
LABEL_102:
      if (v4[*v8])
        LODWORD(v67) = 0;
LABEL_104:
      if (v67 >= 4)
        LODWORD(v67) = 0;
      v5->_confidence = v67;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_110:
    v74 = 0;
  else
LABEL_111:
    v74 = v5;

  return v74;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasStationary)
    PBDataWriterWriteBOOLField();
  if (self->_hasWalking)
    PBDataWriterWriteBOOLField();
  if (self->_hasRunning)
    PBDataWriterWriteBOOLField();
  if (self->_hasAutomotive)
    PBDataWriterWriteBOOLField();
  if (self->_hasCycling)
    PBDataWriterWriteBOOLField();
  if (self->_hasUnknown)
    PBDataWriterWriteBOOLField();
  if (self->_hasRaw_startDate)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMotionActivity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMotionActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  BMMotionActivity *v31;
  id v32;
  id *v33;
  uint64_t v34;
  void *v35;
  id v36;
  objc_class *v37;
  id v38;
  id v39;
  double v40;
  double v41;
  id v42;
  id v43;
  id *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  id *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  BMMotionActivity *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  _QWORD v114[3];

  v114[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stationary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v6;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("walking"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v31 = 0;
          goto LABEL_70;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = a4;
        v34 = *MEMORY[0x1E0D025B8];
        v111 = *MEMORY[0x1E0CB2D50];
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("walking"));
        v112 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v34, 2, v11);
        v10 = 0;
        v31 = 0;
        *v33 = v36;
        goto LABEL_69;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("running"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = self;
    v94 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          v31 = 0;
          goto LABEL_69;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = a4;
        v45 = *MEMORY[0x1E0D025B8];
        v109 = *MEMORY[0x1E0CB2D50];
        v46 = v8;
        v47 = objc_alloc(MEMORY[0x1E0CB3940]);
        v82 = objc_opt_class();
        v48 = v47;
        v8 = v46;
        v95 = (id)objc_msgSend(v48, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v82, CFSTR("running"));
        v110 = v95;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v43;
        v10 = v94;
        v51 = v45;
        v52 = (void *)v49;
        v35 = 0;
        v31 = 0;
        *v44 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v49);
LABEL_68:

LABEL_69:
        goto LABEL_70;
      }
      v25 = v7;
      v13 = v9;
      v14 = v25;
      v15 = v11;
      v93 = v11;
    }
    else
    {
      v12 = v7;
      v13 = v9;
      v14 = v12;
      v15 = v11;
      v93 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("automotive"));
    v16 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v16;
    v90 = v14;
    if (v16 && (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v95 = 0;
          v31 = 0;
          v52 = v92;
          v35 = v93;
          v11 = v15;
          v76 = v14;
          v9 = v13;
          v7 = v76;
          self = v97;
          goto LABEL_68;
        }
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v54 = a4;
        v96 = *MEMORY[0x1E0D025B8];
        v107 = *MEMORY[0x1E0CB2D50];
        v55 = v8;
        v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("automotive"));
        v108 = v56;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = v53;
        v10 = v94;
        v91 = (void *)v57;
        v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v96, 2);
        v95 = 0;
        v31 = 0;
        *v54 = v59;
        v35 = v93;
        v11 = v15;
        v9 = v13;
        self = v97;
        v60 = (void *)v56;
        v8 = v55;
        goto LABEL_67;
      }
      v95 = v17;
    }
    else
    {
      v95 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cycling"));
    v18 = objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v91 = (void *)v18;
    if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v9 = v13;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v97;
        if (!a4)
        {
          v60 = 0;
          v31 = 0;
          goto LABEL_66;
        }
        v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v62 = v8;
        v63 = *MEMORY[0x1E0D025B8];
        v105 = *MEMORY[0x1E0CB2D50];
        v64 = a4;
        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cycling"));
        v106 = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v61;
        v10 = v94;
        v68 = v63;
        v8 = v62;
        v88 = (void *)v66;
        v60 = 0;
        v31 = 0;
        *v64 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2);
LABEL_65:

LABEL_66:
        v35 = v93;
LABEL_67:

        v52 = v92;
        v7 = v90;
        goto LABEL_68;
      }
      v86 = a4;
      v87 = v19;
    }
    else
    {
      v86 = a4;
      v87 = 0;
      v9 = v13;
    }
    self = v97;
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("unknown"));
    v20 = objc_claimAutoreleasedReturnValue();
    v88 = (void *)v20;
    v89 = v8;
    if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          v65 = 0;
          v31 = 0;
          v60 = v87;
          goto LABEL_65;
        }
        v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v70 = *MEMORY[0x1E0D025B8];
        v103 = *MEMORY[0x1E0CB2D50];
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("unknown"));
        v104 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0;
        v31 = 0;
        *v86 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2, v23);
        goto LABEL_49;
      }
      v22 = v21;
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("startDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v24 = 0;
LABEL_53:
      objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("confidence"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72)
      {
        objc_opt_class();
        v60 = v87;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v73 = 0;
        }
        else
        {
          v65 = v22;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v74 = v72;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v86)
              {
                v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v84 = *MEMORY[0x1E0D025B8];
                v99 = *MEMORY[0x1E0CB2D50];
                v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("confidence"));
                v100 = v77;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *v86 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v84, 2, v78);

              }
              v73 = 0;
              v31 = 0;
              goto LABEL_63;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMotionActivityConfidenceFromString(v72));
            v74 = (id)objc_claimAutoreleasedReturnValue();
          }
          v73 = v74;
        }
      }
      else
      {
        v73 = 0;
        v60 = v87;
      }
      LODWORD(v83) = objc_msgSend(v73, "intValue");
      v65 = v22;
      v31 = -[BMMotionActivity initWithStationary:walking:running:automotive:cycling:unknown:startDate:confidence:](v97, "initWithStationary:walking:running:automotive:cycling:unknown:startDate:confidence:", v89, v94, v93, v95, v60, v22, v24, v83);
      v97 = v31;
LABEL_63:

      goto LABEL_64;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = (objc_class *)MEMORY[0x1E0C99D68];
      v38 = v23;
      v39 = [v37 alloc];
      objc_msgSend(v38, "doubleValue");
      v41 = v40;

      v42 = (id)objc_msgSend(v39, "initWithTimeIntervalSince1970:", v41);
LABEL_40:
      v24 = v42;
      goto LABEL_53;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v71, "dateFromString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_53;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v23;
      goto LABEL_40;
    }
    v65 = v22;
    if (v86)
    {
      v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v80 = *MEMORY[0x1E0D025B8];
      v101 = *MEMORY[0x1E0CB2D50];
      v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startDate"));
      v102 = v73;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2, v72);
      v24 = 0;
      v31 = 0;
      *v86 = v81;
      v60 = v87;
      goto LABEL_63;
    }
    v24 = 0;
    v31 = 0;
LABEL_49:
    v60 = v87;
LABEL_64:

    self = v97;
    v8 = v89;
    v10 = v94;
    goto LABEL_65;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = a4;
    v28 = *MEMORY[0x1E0D025B8];
    v113 = *MEMORY[0x1E0CB2D50];
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stationary"));
    v114[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v26;
    v10 = (id)v29;
    v8 = 0;
    v31 = 0;
    *v27 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v9);
LABEL_70:

    goto LABEL_71;
  }
  v8 = 0;
  v31 = 0;
LABEL_71:

  return v31;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v28;
  void *v29;
  _QWORD v30[8];
  _QWORD v31[10];

  v31[8] = *MEMORY[0x1E0C80C00];
  if (-[BMMotionActivity hasStationary](self, "hasStationary"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity stationary](self, "stationary"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMMotionActivity hasWalking](self, "hasWalking"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity walking](self, "walking"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMMotionActivity hasRunning](self, "hasRunning"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity running](self, "running"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMMotionActivity hasAutomotive](self, "hasAutomotive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity automotive](self, "automotive"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  if (-[BMMotionActivity hasCycling](self, "hasCycling"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity cycling](self, "cycling"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  if (-[BMMotionActivity hasUnknown](self, "hasUnknown"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMotionActivity unknown](self, "unknown"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[BMMotionActivity startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMotionActivity startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMotionActivity confidence](self, "confidence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("stationary");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v12;
  v31[0] = v12;
  v30[1] = CFSTR("walking");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v13;
  v31[1] = v13;
  v30[2] = CFSTR("running");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v3;
  v23 = (void *)v14;
  v31[2] = v14;
  v30[3] = CFSTR("automotive");
  v15 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v4;
  v31[3] = v15;
  v30[4] = CFSTR("cycling");
  v16 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v5;
  v31[4] = v16;
  v30[5] = CFSTR("unknown");
  v18 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = v18;
  v30[6] = CFSTR("startDate");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[6] = v19;
  v30[7] = CFSTR("confidence");
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[7] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_40;
LABEL_50:

    if (v6)
      goto LABEL_41;
    goto LABEL_51;
  }

  if (!v10)
    goto LABEL_50;
LABEL_40:
  if (v6)
    goto LABEL_41;
LABEL_51:

LABEL_41:
  if (!v28)

  if (!v29)
  if (v17)
  {
    if (v26)
      goto LABEL_47;
LABEL_53:

    if (v27)
      goto LABEL_48;
LABEL_54:

    goto LABEL_48;
  }

  if (!v26)
    goto LABEL_53;
LABEL_47:
  if (!v27)
    goto LABEL_54;
LABEL_48:

  return v21;
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_37;
  }
  v5 = v4;
  if (-[BMMotionActivity hasStationary](self, "hasStationary") || objc_msgSend(v5, "hasStationary"))
  {
    if (!-[BMMotionActivity hasStationary](self, "hasStationary"))
      goto LABEL_34;
    if (!objc_msgSend(v5, "hasStationary"))
      goto LABEL_34;
    v6 = -[BMMotionActivity stationary](self, "stationary");
    if (v6 != objc_msgSend(v5, "stationary"))
      goto LABEL_34;
  }
  if (-[BMMotionActivity hasWalking](self, "hasWalking") || objc_msgSend(v5, "hasWalking"))
  {
    if (!-[BMMotionActivity hasWalking](self, "hasWalking"))
      goto LABEL_34;
    if (!objc_msgSend(v5, "hasWalking"))
      goto LABEL_34;
    v7 = -[BMMotionActivity walking](self, "walking");
    if (v7 != objc_msgSend(v5, "walking"))
      goto LABEL_34;
  }
  if (-[BMMotionActivity hasRunning](self, "hasRunning") || objc_msgSend(v5, "hasRunning"))
  {
    if (!-[BMMotionActivity hasRunning](self, "hasRunning"))
      goto LABEL_34;
    if (!objc_msgSend(v5, "hasRunning"))
      goto LABEL_34;
    v8 = -[BMMotionActivity running](self, "running");
    if (v8 != objc_msgSend(v5, "running"))
      goto LABEL_34;
  }
  if (-[BMMotionActivity hasAutomotive](self, "hasAutomotive") || objc_msgSend(v5, "hasAutomotive"))
  {
    if (!-[BMMotionActivity hasAutomotive](self, "hasAutomotive"))
      goto LABEL_34;
    if (!objc_msgSend(v5, "hasAutomotive"))
      goto LABEL_34;
    v9 = -[BMMotionActivity automotive](self, "automotive");
    if (v9 != objc_msgSend(v5, "automotive"))
      goto LABEL_34;
  }
  if (-[BMMotionActivity hasCycling](self, "hasCycling") || objc_msgSend(v5, "hasCycling"))
  {
    if (!-[BMMotionActivity hasCycling](self, "hasCycling"))
      goto LABEL_34;
    if (!objc_msgSend(v5, "hasCycling"))
      goto LABEL_34;
    v10 = -[BMMotionActivity cycling](self, "cycling");
    if (v10 != objc_msgSend(v5, "cycling"))
      goto LABEL_34;
  }
  if (-[BMMotionActivity hasUnknown](self, "hasUnknown") || objc_msgSend(v5, "hasUnknown"))
  {
    if (!-[BMMotionActivity hasUnknown](self, "hasUnknown"))
      goto LABEL_34;
    if (!objc_msgSend(v5, "hasUnknown"))
      goto LABEL_34;
    v11 = -[BMMotionActivity unknown](self, "unknown");
    if (v11 != objc_msgSend(v5, "unknown"))
      goto LABEL_34;
  }
  -[BMMotionActivity startDate](self, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {

    goto LABEL_39;
  }
  v14 = (void *)v13;
  -[BMMotionActivity startDate](self, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {
LABEL_39:
    v20 = -[BMMotionActivity confidence](self, "confidence");
    v18 = v20 == objc_msgSend(v5, "confidence");
    goto LABEL_35;
  }
LABEL_34:
  v18 = 0;
LABEL_35:

LABEL_37:
  return v18;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)stationary
{
  return self->_stationary;
}

- (BOOL)hasStationary
{
  return self->_hasStationary;
}

- (void)setHasStationary:(BOOL)a3
{
  self->_hasStationary = a3;
}

- (BOOL)walking
{
  return self->_walking;
}

- (BOOL)hasWalking
{
  return self->_hasWalking;
}

- (void)setHasWalking:(BOOL)a3
{
  self->_hasWalking = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (BOOL)hasRunning
{
  return self->_hasRunning;
}

- (void)setHasRunning:(BOOL)a3
{
  self->_hasRunning = a3;
}

- (BOOL)automotive
{
  return self->_automotive;
}

- (BOOL)hasAutomotive
{
  return self->_hasAutomotive;
}

- (void)setHasAutomotive:(BOOL)a3
{
  self->_hasAutomotive = a3;
}

- (BOOL)cycling
{
  return self->_cycling;
}

- (BOOL)hasCycling
{
  return self->_hasCycling;
}

- (void)setHasCycling:(BOOL)a3
{
  self->_hasCycling = a3;
}

- (BOOL)unknown
{
  return self->_unknown;
}

- (BOOL)hasUnknown
{
  return self->_hasUnknown;
}

- (void)setHasUnknown:(BOOL)a3
{
  self->_hasUnknown = a3;
}

- (int)confidence
{
  return self->_confidence;
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

    v4 = -[BMMotionActivity initByReadFrom:]([BMMotionActivity alloc], "initByReadFrom:", v7);
    v4[11] = 0;

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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stationary"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("walking"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("running"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("automotive"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cycling"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("unknown"), 0, 0, 6, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startDate"), 3, 0, 7, 0, 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 0, 0, 8, 4, 0);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1ECE8;
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stationary"), 1, 12, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("walking"), 2, 12, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("running"), 3, 12, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("automotive"), 4, 12, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cycling"), 5, 12, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("unknown"), 6, 12, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startDate"), 7, 0, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 8, 4, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
