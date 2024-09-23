@implementation BMLocationHashedCoordinates

- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 floor:(id)a6 speedBucket:(int)a7 altitudeBucket:(int)a8 distanceBucketFromHome:(int)a9 distanceBucketFromWork:(int)a10 distanceBucketFromGym:(int)a11 distanceBucketFromSchool:(int)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMLocationHashedCoordinates *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  objc_super v28;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v28.receiver = self;
  v28.super_class = (Class)BMLocationHashedCoordinates;
  v22 = -[BMEventBase init](&v28, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v18)
    {
      v22->_hasLocationHashAt300Meters = 1;
      v23 = objc_msgSend(v18, "unsignedLongLongValue");
    }
    else
    {
      v23 = 0;
      v22->_hasLocationHashAt300Meters = 0;
    }
    v22->_locationHashAt300Meters = v23;
    if (v19)
    {
      v22->_hasLocationHashAt2500Meters = 1;
      v24 = objc_msgSend(v19, "unsignedLongLongValue");
    }
    else
    {
      v24 = 0;
      v22->_hasLocationHashAt2500Meters = 0;
    }
    v22->_locationHashAt2500Meters = v24;
    if (v20)
    {
      v22->_hasLocationHashAt156Kilometers = 1;
      v25 = objc_msgSend(v20, "unsignedLongLongValue");
    }
    else
    {
      v25 = 0;
      v22->_hasLocationHashAt156Kilometers = 0;
    }
    v22->_locationHashAt156Kilometers = v25;
    if (v21)
    {
      v22->_hasFloor = 1;
      v26 = objc_msgSend(v21, "intValue");
    }
    else
    {
      v22->_hasFloor = 0;
      v26 = -1;
    }
    v22->_floor = v26;
    v22->_speedBucket = a7;
    v22->_altitudeBucket = a8;
    v22->_distanceBucketFromHome = a9;
    v22->_distanceBucketFromWork = a10;
    v22->_distanceBucketFromGym = a11;
    v22->_distanceBucketFromSchool = a12;
  }

  return v22;
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
  id v14;
  id v15;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt300Meters](self, "locationHashAt300Meters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt2500Meters](self, "locationHashAt2500Meters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt156Kilometers](self, "locationHashAt156Kilometers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates floor](self, "floor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationHashedCoordinatesSpeedRangeAsString(-[BMLocationHashedCoordinates speedBucket](self, "speedBucket"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationHashedCoordinatesAltitudeRangeAsString(-[BMLocationHashedCoordinates altitudeBucket](self, "altitudeBucket"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationHashedCoordinatesDistanceRangeAsString(-[BMLocationHashedCoordinates distanceBucketFromHome](self, "distanceBucketFromHome"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationHashedCoordinatesDistanceRangeAsString(-[BMLocationHashedCoordinates distanceBucketFromWork](self, "distanceBucketFromWork"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationHashedCoordinatesDistanceRangeAsString(-[BMLocationHashedCoordinates distanceBucketFromGym](self, "distanceBucketFromGym"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationHashedCoordinatesDistanceRangeAsString(-[BMLocationHashedCoordinates distanceBucketFromSchool](self, "distanceBucketFromSchool"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMLocationHashedCoordinates with locationHashAt300Meters: %@, locationHashAt2500Meters: %@, locationHashAt156Kilometers: %@, floor: %@, speedBucket: %@, altitudeBucket: %@, distanceBucketFromHome: %@, distanceBucketFromWork: %@, distanceBucketFromGym: %@, distanceBucketFromSchool: %@"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationHashedCoordinates *v5;
  int *v6;
  int *v7;
  int *v8;
  unint64_t v9;
  unint64_t v10;
  int *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  BOOL v29;
  int v30;
  char v32;
  unsigned int v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  BMLocationHashedCoordinates *v94;
  BMLocationHashedCoordinates *v96;
  objc_super v97;

  v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)BMLocationHashedCoordinates;
  v5 = -[BMEventBase init](&v97, sel_init);
  if (!v5)
    goto LABEL_149;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = 0x1EEE16000uLL;
    v10 = 0x1EEE16000uLL;
    v11 = (int *)MEMORY[0x1E0D82BB8];
    v12 = 0x1EEE16000uLL;
    v13 = 0x1EEE16000uLL;
    v14 = 0x1EEE16000uLL;
    v15 = 0x1EEE16000uLL;
    v16 = 0x1EEE16000uLL;
    v17 = 0x1EEE16000uLL;
    v18 = 0x1EEE16000uLL;
    v19 = 0x1EEE16000uLL;
    v20 = 0x1EEE16000uLL;
    v21 = 0x1EEE16000uLL;
    v22 = 0x1EEE16000uLL;
    do
    {
      if (v4[*v8])
        break;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      while (1)
      {
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        if (v27 == -1 || v27 >= *(_QWORD *)&v4[*v7])
          break;
        v28 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v27);
        *(_QWORD *)&v4[v26] = v27 + 1;
        v25 |= (unint64_t)(v28 & 0x7F) << v23;
        if ((v28 & 0x80) == 0)
          goto LABEL_13;
        v23 += 7;
        v29 = v24++ >= 9;
        if (v29)
        {
          v25 = 0;
          v30 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v30 = v4[*v8];
      if (v4[*v8])
        v25 = 0;
LABEL_15:
      if (v30 || (v25 & 7) == 4)
        break;
      switch((v25 >> 3))
      {
        case 1u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *((_BYTE *)&v5->super.super.isa + *(int *)(v9 + 3952)) = 1;
          while (1)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
              break;
            v37 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v36);
            *(_QWORD *)&v4[v35] = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if ((v37 & 0x80) == 0)
              goto LABEL_93;
            v32 += 7;
            v29 = v33++ >= 9;
            if (v29)
            {
              v34 = 0;
              goto LABEL_95;
            }
          }
          v4[*v8] = 1;
LABEL_93:
          if (v4[*v8])
            v34 = 0;
LABEL_95:
          v92 = *(int *)(v10 + 3956);
          goto LABEL_104;
        case 2u:
          v38 = 0;
          v39 = 0;
          v34 = 0;
          *((_BYTE *)&v5->super.super.isa + *(int *)(v12 + 3960)) = 1;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            if (v41 == -1 || v41 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v41);
              *(_QWORD *)&v4[v40] = v41 + 1;
              v34 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                v29 = v39++ >= 9;
                if (v29)
                {
                  v34 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v34 = 0;
LABEL_99:
          v92 = *(int *)(v13 + 3964);
          goto LABEL_104;
        case 3u:
          v43 = 0;
          v44 = 0;
          v34 = 0;
          *((_BYTE *)&v5->super.super.isa + *(int *)(v14 + 3968)) = 1;
          while (2)
          {
            v45 = *v6;
            v46 = *(_QWORD *)&v4[v45];
            if (v46 == -1 || v46 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v46);
              *(_QWORD *)&v4[v45] = v46 + 1;
              v34 |= (unint64_t)(v47 & 0x7F) << v43;
              if (v47 < 0)
              {
                v43 += 7;
                v29 = v44++ >= 9;
                if (v29)
                {
                  v34 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v34 = 0;
LABEL_103:
          v92 = *(int *)(v15 + 3972);
LABEL_104:
          *(Class *)((char *)&v5->super.super.isa + v92) = (Class)v34;
          continue;
        case 8u:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          *((_BYTE *)&v5->super.super.isa + *(int *)(v16 + 3976)) = 1;
          while (2)
          {
            v58 = *v6;
            v59 = *(_QWORD *)&v4[v58];
            if (v59 == -1 || v59 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v59);
              *(_QWORD *)&v4[v58] = v59 + 1;
              v57 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v29 = v56++ >= 9;
                if (v29)
                {
                  LODWORD(v57) = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v57) = 0;
LABEL_108:
          *(_DWORD *)((char *)&v5->super.super.isa + *(int *)(v17 + 3980)) = v57;
          continue;
        case 9u:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          while (2)
          {
            v64 = *v6;
            v65 = *(_QWORD *)&v4[v64];
            if (v65 == -1 || v65 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v65);
              *(_QWORD *)&v4[v64] = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                v29 = v62++ >= 9;
                if (v29)
                {
                  LODWORD(v63) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v63) = 0;
LABEL_112:
          if (v63 >= 0xB)
            LODWORD(v63) = 0;
          v93 = *(int *)(v18 + 3984);
          goto LABEL_145;
        case 0xAu:
          v67 = 0;
          v68 = 0;
          v63 = 0;
          while (2)
          {
            v69 = *v6;
            v70 = *(_QWORD *)&v4[v69];
            if (v70 == -1 || v70 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v70);
              *(_QWORD *)&v4[v69] = v70 + 1;
              v63 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                v29 = v68++ >= 9;
                if (v29)
                {
                  LODWORD(v63) = 0;
                  goto LABEL_118;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v63) = 0;
LABEL_118:
          if (v63 >= 0xA)
            LODWORD(v63) = 0;
          v93 = *(int *)(v19 + 3988);
          goto LABEL_145;
        case 0xBu:
          v72 = 0;
          v73 = 0;
          v63 = 0;
          while (2)
          {
            v74 = *v6;
            v75 = *(_QWORD *)&v4[v74];
            if (v75 == -1 || v75 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v76 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v75);
              *(_QWORD *)&v4[v74] = v75 + 1;
              v63 |= (unint64_t)(v76 & 0x7F) << v72;
              if (v76 < 0)
              {
                v72 += 7;
                v29 = v73++ >= 9;
                if (v29)
                {
                  LODWORD(v63) = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v63) = 0;
LABEL_124:
          if (v63 >= 0xA)
            LODWORD(v63) = 0;
          v93 = *(int *)(v20 + 3992);
          goto LABEL_145;
        case 0xCu:
          v77 = 0;
          v78 = 0;
          v63 = 0;
          while (2)
          {
            v79 = *v6;
            v80 = *(_QWORD *)&v4[v79];
            if (v80 == -1 || v80 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v80);
              *(_QWORD *)&v4[v79] = v80 + 1;
              v63 |= (unint64_t)(v81 & 0x7F) << v77;
              if (v81 < 0)
              {
                v77 += 7;
                v29 = v78++ >= 9;
                if (v29)
                {
                  LODWORD(v63) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v63) = 0;
LABEL_130:
          if (v63 >= 0xA)
            LODWORD(v63) = 0;
          v93 = *(int *)(v21 + 3996);
          goto LABEL_145;
        case 0xDu:
          v82 = 0;
          v83 = 0;
          v63 = 0;
          while (2)
          {
            v84 = *v6;
            v85 = *(_QWORD *)&v4[v84];
            if (v85 == -1 || v85 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v85);
              *(_QWORD *)&v4[v84] = v85 + 1;
              v63 |= (unint64_t)(v86 & 0x7F) << v82;
              if (v86 < 0)
              {
                v82 += 7;
                v29 = v83++ >= 9;
                if (v29)
                {
                  LODWORD(v63) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v63) = 0;
LABEL_136:
          if (v63 >= 0xA)
            LODWORD(v63) = 0;
          v93 = *(int *)(v22 + 4000);
          goto LABEL_145;
        case 0xEu:
          v87 = 0;
          v88 = 0;
          v63 = 0;
          break;
        default:
          v48 = v9;
          v49 = v10;
          v50 = v12;
          v51 = v13;
          v52 = v14;
          v96 = v5;
          v53 = v15;
          v54 = PBReaderSkipValueWithTag();
          v22 = 0x1EEE16000;
          v16 = 0x1EEE16000;
          v15 = v53;
          v8 = (int *)MEMORY[0x1E0D82BC8];
          v5 = v96;
          v14 = v52;
          v17 = 0x1EEE16000;
          v13 = v51;
          v18 = 0x1EEE16000;
          v12 = v50;
          v21 = 0x1EEE16000;
          v10 = v49;
          v20 = 0x1EEE16000;
          v9 = v48;
          v19 = 0x1EEE16000;
          if (!v54)
            goto LABEL_148;
          continue;
      }
      while (1)
      {
        v89 = *v6;
        v90 = *(_QWORD *)&v4[v89];
        if (v90 == -1 || v90 >= *(_QWORD *)&v4[*v7])
          break;
        v91 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v90);
        *(_QWORD *)&v4[v89] = v90 + 1;
        v63 |= (unint64_t)(v91 & 0x7F) << v87;
        if ((v91 & 0x80) == 0)
          goto LABEL_140;
        v87 += 7;
        v29 = v88++ >= 9;
        if (v29)
        {
          LODWORD(v63) = 0;
          goto LABEL_142;
        }
      }
      v4[*v8] = 1;
LABEL_140:
      if (v4[*v8])
        LODWORD(v63) = 0;
LABEL_142:
      if (v63 >= 0xA)
        LODWORD(v63) = 0;
      v93 = 52;
LABEL_145:
      *(_DWORD *)((char *)&v5->super.super.isa + v93) = v63;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_148:
    v94 = 0;
  else
LABEL_149:
    v94 = v5;

  return v94;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasLocationHashAt300Meters)
    PBDataWriterWriteUint64Field();
  if (self->_hasLocationHashAt2500Meters)
    PBDataWriterWriteUint64Field();
  if (self->_hasLocationHashAt156Kilometers)
    PBDataWriterWriteUint64Field();
  if (self->_hasFloor)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationHashedCoordinates writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationHashedCoordinates)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id *v25;
  id v26;
  uint64_t v27;
  id *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  id *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id *v46;
  void *v47;
  void *v48;
  BMLocationHashedCoordinates *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  id v55;
  unsigned int v56;
  unsigned int v57;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id *v65;
  id v66;
  id *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  id *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id *v79;
  uint64_t v80;
  id v81;
  id *v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id v113;
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
  void *v132;
  uint64_t v133;
  _QWORD v134[3];

  v134[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationHashAt300Meters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v113 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationHashAt2500Meters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v18 = 0;
          goto LABEL_82;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v131 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("locationHashAt2500Meters"));
        v132 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v8);
        v18 = 0;
        v25 = a4;
        a4 = 0;
        *v25 = v24;
        goto LABEL_81;
      }
      v108 = v7;
    }
    else
    {
      v108 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationHashAt156Kilometers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v23 = 0;
          v18 = v108;
          goto LABEL_81;
        }
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v129 = *MEMORY[0x1E0CB2D50];
        v28 = a4;
        v29 = v8;
        v30 = objc_alloc(MEMORY[0x1E0CB3940]);
        v91 = objc_opt_class();
        v31 = v30;
        v8 = v29;
        v111 = (id)objc_msgSend(v31, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v91, CFSTR("locationHashAt156Kilometers"));
        v130 = v111;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v26;
        v10 = (void *)v32;
        v23 = 0;
        a4 = 0;
        *v28 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v27, 2, v32);
        v18 = v108;
LABEL_80:

LABEL_81:
        goto LABEL_82;
      }
      v107 = v8;
    }
    else
    {
      v107 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("floor"));
    v9 = objc_claimAutoreleasedReturnValue();
    v109 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v111 = 0;
          v23 = v107;
          v18 = v108;
          goto LABEL_80;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = *MEMORY[0x1E0D025B8];
        v127 = *MEMORY[0x1E0CB2D50];
        v36 = a4;
        v37 = v8;
        v38 = objc_alloc(MEMORY[0x1E0CB3940]);
        v92 = objc_opt_class();
        v39 = v38;
        v8 = v37;
        v112 = (id)objc_msgSend(v39, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v92, CFSTR("floor"));
        v128 = v112;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v34;
        v10 = v109;
        v104 = (void *)v40;
        v111 = 0;
        a4 = 0;
        *v36 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v35, 2);
        v23 = v107;
        v18 = v108;
        goto LABEL_79;
      }
      v111 = v10;
    }
    else
    {
      v111 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("speedBucket"));
    v11 = objc_claimAutoreleasedReturnValue();
    v104 = (void *)v11;
    v105 = v7;
    if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v112 = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v112 = 0;
            v23 = v107;
            v18 = v108;
            v10 = v109;
            goto LABEL_79;
          }
          v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v60 = *MEMORY[0x1E0D025B8];
          v125 = *MEMORY[0x1E0CB2D50];
          v61 = v8;
          v62 = objc_alloc(MEMORY[0x1E0CB3940]);
          v94 = objc_opt_class();
          v63 = v62;
          v8 = v61;
          v110 = (id)objc_msgSend(v63, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v94, CFSTR("speedBucket"));
          v126 = v110;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2);
          v112 = 0;
          v65 = a4;
          a4 = 0;
          *v65 = v64;
          goto LABEL_102;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationHashedCoordinatesSpeedRangeFromString(v12));
        v112 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v112 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("altitudeBucket"));
    v13 = objc_claimAutoreleasedReturnValue();
    v101 = (void *)v13;
    if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v110 = 0;
LABEL_19:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceBucketFromHome"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v100 = v15;
      if (!v15)
        goto LABEL_50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = 0;
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v15;
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationHashedCoordinatesDistanceRangeFromString(v15));
        v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceBucketFromWork"));
        v42 = objc_claimAutoreleasedReturnValue();
        v98 = v8;
        v99 = (void *)v42;
        if (!v42 || (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v103 = 0;
LABEL_53:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceBucketFromGym"));
          v44 = objc_claimAutoreleasedReturnValue();
          v10 = v109;
          v97 = (void *)v44;
          if (v44 && (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = a4;
              v102 = v45;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v102 = 0;
                  v23 = v107;
                  v18 = v108;
                  goto LABEL_75;
                }
                v82 = a4;
                v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v84 = v6;
                v85 = *MEMORY[0x1E0D025B8];
                v117 = *MEMORY[0x1E0CB2D50];
                v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("distanceBucketFromGym"));
                v118 = v50;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = v85;
                v6 = v84;
                v87 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v86, 2, v47);
                v102 = 0;
                a4 = 0;
                *v82 = v87;
                v23 = v107;
                v18 = v108;
                goto LABEL_74;
              }
              v46 = a4;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationHashedCoordinatesDistanceRangeFromString(v45));
              v102 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v46 = a4;
            v102 = 0;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceBucketFromSchool"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v5;
          if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v48 = v6;
              v49 = self;
              v51 = v47;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v46)
                {
                  v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v106 = *MEMORY[0x1E0D025B8];
                  v115 = *MEMORY[0x1E0CB2D50];
                  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("distanceBucketFromSchool"));
                  v116 = v89;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  *v46 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v106, 2, v90);

                }
                v50 = 0;
                a4 = 0;
                v23 = v107;
                v18 = v108;
                v10 = v109;
                goto LABEL_74;
              }
              v48 = v6;
              v49 = self;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationHashedCoordinatesDistanceRangeFromString(v47));
              v51 = (id)objc_claimAutoreleasedReturnValue();
            }
            v50 = v51;
          }
          else
          {
            v48 = v6;
            v49 = self;
            v50 = 0;
          }
          v52 = objc_msgSend(v112, "intValue");
          v53 = objc_msgSend(v110, "intValue");
          v54 = objc_msgSend(v15, "intValue");
          v55 = v15;
          v56 = objc_msgSend(v103, "intValue");
          v57 = objc_msgSend(v102, "intValue");
          v95 = __PAIR64__(objc_msgSend(v50, "intValue"), v57);
          v93 = __PAIR64__(v56, v54);
          v15 = v55;
          v23 = v107;
          v18 = v108;
          a4 = -[BMLocationHashedCoordinates initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:](v49, "initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:", v113, v108, v107, v111, v52, v53, v93, v95);
          self = (BMLocationHashedCoordinates *)a4;
          v6 = v48;
          v7 = v105;
          v10 = v109;
          v5 = v96;
LABEL_74:

          v45 = v97;
LABEL_75:

          v8 = v98;
LABEL_76:

LABEL_77:
LABEL_78:

LABEL_79:
          goto LABEL_80;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v103 = v43;
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationHashedCoordinatesDistanceRangeFromString(v43));
          v103 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_53;
        }
        if (a4)
        {
          v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v79 = a4;
          v80 = *MEMORY[0x1E0D025B8];
          v119 = *MEMORY[0x1E0CB2D50];
          v102 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("distanceBucketFromWork"));
          v120 = v102;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v80, 2, v45);
          v103 = 0;
          a4 = 0;
          *v79 = v81;
          v23 = v107;
          v18 = v108;
          v10 = v109;
          goto LABEL_75;
        }
        v103 = 0;
        v18 = v108;
LABEL_106:
        v23 = v107;
        v10 = v109;
        goto LABEL_76;
      }
      if (a4)
      {
        v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v73 = v8;
        v74 = *MEMORY[0x1E0D025B8];
        v121 = *MEMORY[0x1E0CB2D50];
        v75 = a4;
        v103 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("distanceBucketFromHome"));
        v122 = v103;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
        v76 = objc_claimAutoreleasedReturnValue();
        v77 = v74;
        v8 = v73;
        v99 = (void *)v76;
        v15 = 0;
        a4 = 0;
        *v75 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v77, 2);
        v7 = v105;
        v18 = v108;
        goto LABEL_106;
      }
      v15 = 0;
LABEL_104:
      v23 = v107;
      v18 = v108;
      v10 = v109;
      goto LABEL_77;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v110 = v14;
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationHashedCoordinatesAltitudeRangeFromString(v14));
      v110 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    if (a4)
    {
      v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v67 = a4;
      v68 = v8;
      v69 = *MEMORY[0x1E0D025B8];
      v123 = *MEMORY[0x1E0CB2D50];
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("altitudeBucket"));
      v124 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = v69;
      v8 = v68;
      v100 = (void *)v70;
      v110 = 0;
      a4 = 0;
      *v67 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v71, 2);
      goto LABEL_104;
    }
    v110 = 0;
LABEL_102:
    v7 = v105;
    v23 = v107;
    v18 = v108;
    v10 = v109;
    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0D025B8];
    v133 = *MEMORY[0x1E0CB2D50];
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("locationHashAt300Meters"));
    v134[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, &v133, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v7);
    v113 = 0;
    v20 = a4;
    a4 = 0;
    *v20 = v19;
LABEL_82:

    goto LABEL_83;
  }
  v113 = 0;
LABEL_83:

  return (BMLocationHashedCoordinates *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[10];
  _QWORD v37[12];

  v37[10] = *MEMORY[0x1E0C80C00];
  if (-[BMLocationHashedCoordinates hasLocationHashAt300Meters](self, "hasLocationHashAt300Meters"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt300Meters](self, "locationHashAt300Meters"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMLocationHashedCoordinates hasLocationHashAt2500Meters](self, "hasLocationHashAt2500Meters"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt2500Meters](self, "locationHashAt2500Meters"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMLocationHashedCoordinates hasLocationHashAt156Kilometers](self, "hasLocationHashAt156Kilometers"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt156Kilometers](self, "locationHashAt156Kilometers"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMLocationHashedCoordinates hasFloor](self, "hasFloor"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates floor](self, "floor"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates speedBucket](self, "speedBucket"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates altitudeBucket](self, "altitudeBucket"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromHome](self, "distanceBucketFromHome"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromWork](self, "distanceBucketFromWork"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromGym](self, "distanceBucketFromGym"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromSchool](self, "distanceBucketFromSchool"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = CFSTR("locationHashAt300Meters");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v12;
  v37[0] = v12;
  v36[1] = CFSTR("locationHashAt2500Meters");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v13;
  v37[1] = v13;
  v36[2] = CFSTR("locationHashAt156Kilometers");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v3;
  v27 = (void *)v14;
  v37[2] = v14;
  v36[3] = CFSTR("floor");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v4;
  v26 = (void *)v15;
  v37[3] = v15;
  v36[4] = CFSTR("speedBucket");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v5;
  v25 = (void *)v16;
  v37[4] = v16;
  v36[5] = CFSTR("altitudeBucket");
  v17 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v6;
  v37[5] = v17;
  v36[6] = CFSTR("distanceBucketFromHome");
  v18 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v37[6] = v18;
  v36[7] = CFSTR("distanceBucketFromWork");
  v20 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v8;
  v37[7] = v20;
  v36[8] = CFSTR("distanceBucketFromGym");
  v22 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[8] = v22;
  v36[9] = CFSTR("distanceBucketFromSchool");
  v23 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[9] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 10);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_35;
  }
  else
  {

    if (v10)
      goto LABEL_35;
  }

LABEL_35:
  if (!v9)

  if (!v35)
  if (!v21)

  if (!v19)
  if (!v31)

  if (v32)
  {
    if (v33)
      goto LABEL_47;
LABEL_52:

    if (v34)
      goto LABEL_48;
LABEL_53:

    goto LABEL_48;
  }

  if (!v33)
    goto LABEL_52;
LABEL_47:
  if (!v34)
    goto LABEL_53;
LABEL_48:

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMLocationHashedCoordinates hasLocationHashAt300Meters](self, "hasLocationHashAt300Meters")
      || objc_msgSend(v5, "hasLocationHashAt300Meters"))
    {
      if (!-[BMLocationHashedCoordinates hasLocationHashAt300Meters](self, "hasLocationHashAt300Meters"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasLocationHashAt300Meters"))
        goto LABEL_29;
      v6 = -[BMLocationHashedCoordinates locationHashAt300Meters](self, "locationHashAt300Meters");
      if (v6 != objc_msgSend(v5, "locationHashAt300Meters"))
        goto LABEL_29;
    }
    if (-[BMLocationHashedCoordinates hasLocationHashAt2500Meters](self, "hasLocationHashAt2500Meters")
      || objc_msgSend(v5, "hasLocationHashAt2500Meters"))
    {
      if (!-[BMLocationHashedCoordinates hasLocationHashAt2500Meters](self, "hasLocationHashAt2500Meters"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasLocationHashAt2500Meters"))
        goto LABEL_29;
      v7 = -[BMLocationHashedCoordinates locationHashAt2500Meters](self, "locationHashAt2500Meters");
      if (v7 != objc_msgSend(v5, "locationHashAt2500Meters"))
        goto LABEL_29;
    }
    if ((!-[BMLocationHashedCoordinates hasLocationHashAt156Kilometers](self, "hasLocationHashAt156Kilometers")
       && !objc_msgSend(v5, "hasLocationHashAt156Kilometers")
       || -[BMLocationHashedCoordinates hasLocationHashAt156Kilometers](self, "hasLocationHashAt156Kilometers")
       && objc_msgSend(v5, "hasLocationHashAt156Kilometers")
       && (v8 = -[BMLocationHashedCoordinates locationHashAt156Kilometers](self, "locationHashAt156Kilometers"),
           v8 == objc_msgSend(v5, "locationHashAt156Kilometers")))
      && (!-[BMLocationHashedCoordinates hasFloor](self, "hasFloor") && !objc_msgSend(v5, "hasFloor")
       || -[BMLocationHashedCoordinates hasFloor](self, "hasFloor")
       && objc_msgSend(v5, "hasFloor")
       && (v9 = -[BMLocationHashedCoordinates floor](self, "floor"), v9 == objc_msgSend(v5, "floor")))
      && (v10 = -[BMLocationHashedCoordinates speedBucket](self, "speedBucket"),
          v10 == objc_msgSend(v5, "speedBucket"))
      && (v11 = -[BMLocationHashedCoordinates altitudeBucket](self, "altitudeBucket"),
          v11 == objc_msgSend(v5, "altitudeBucket"))
      && (v12 = -[BMLocationHashedCoordinates distanceBucketFromHome](self, "distanceBucketFromHome"),
          v12 == objc_msgSend(v5, "distanceBucketFromHome"))
      && (v13 = -[BMLocationHashedCoordinates distanceBucketFromWork](self, "distanceBucketFromWork"),
          v13 == objc_msgSend(v5, "distanceBucketFromWork"))
      && (v14 = -[BMLocationHashedCoordinates distanceBucketFromGym](self, "distanceBucketFromGym"),
          v14 == objc_msgSend(v5, "distanceBucketFromGym")))
    {
      v15 = -[BMLocationHashedCoordinates distanceBucketFromSchool](self, "distanceBucketFromSchool");
      v16 = v15 == objc_msgSend(v5, "distanceBucketFromSchool");
    }
    else
    {
LABEL_29:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unint64_t)locationHashAt300Meters
{
  return self->_locationHashAt300Meters;
}

- (BOOL)hasLocationHashAt300Meters
{
  return self->_hasLocationHashAt300Meters;
}

- (void)setHasLocationHashAt300Meters:(BOOL)a3
{
  self->_hasLocationHashAt300Meters = a3;
}

- (unint64_t)locationHashAt2500Meters
{
  return self->_locationHashAt2500Meters;
}

- (BOOL)hasLocationHashAt2500Meters
{
  return self->_hasLocationHashAt2500Meters;
}

- (void)setHasLocationHashAt2500Meters:(BOOL)a3
{
  self->_hasLocationHashAt2500Meters = a3;
}

- (unint64_t)locationHashAt156Kilometers
{
  return self->_locationHashAt156Kilometers;
}

- (BOOL)hasLocationHashAt156Kilometers
{
  return self->_hasLocationHashAt156Kilometers;
}

- (void)setHasLocationHashAt156Kilometers:(BOOL)a3
{
  self->_hasLocationHashAt156Kilometers = a3;
}

- (int)floor
{
  return self->_floor;
}

- (BOOL)hasFloor
{
  return self->_hasFloor;
}

- (void)setHasFloor:(BOOL)a3
{
  self->_hasFloor = a3;
}

- (int)speedBucket
{
  return self->_speedBucket;
}

- (int)altitudeBucket
{
  return self->_altitudeBucket;
}

- (int)distanceBucketFromHome
{
  return self->_distanceBucketFromHome;
}

- (int)distanceBucketFromWork
{
  return self->_distanceBucketFromWork;
}

- (int)distanceBucketFromGym
{
  return self->_distanceBucketFromGym;
}

- (int)distanceBucketFromSchool
{
  return self->_distanceBucketFromSchool;
}

- (double)distanceFromHomeOfCurrentLocationInMeters
{
  return self->_distanceFromHomeOfCurrentLocationInMeters;
}

- (BOOL)hasDistanceFromHomeOfCurrentLocationInMeters
{
  return self->_hasDistanceFromHomeOfCurrentLocationInMeters;
}

- (void)setHasDistanceFromHomeOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromHomeOfCurrentLocationInMeters = a3;
}

- (double)distanceFromWorkOfCurrentLocationInMeters
{
  return self->_distanceFromWorkOfCurrentLocationInMeters;
}

- (BOOL)hasDistanceFromWorkOfCurrentLocationInMeters
{
  return self->_hasDistanceFromWorkOfCurrentLocationInMeters;
}

- (void)setHasDistanceFromWorkOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromWorkOfCurrentLocationInMeters = a3;
}

- (double)distanceFromSchoolOfCurrentLocationInMeters
{
  return self->_distanceFromSchoolOfCurrentLocationInMeters;
}

- (BOOL)hasDistanceFromSchoolOfCurrentLocationInMeters
{
  return self->_hasDistanceFromSchoolOfCurrentLocationInMeters;
}

- (void)setHasDistanceFromSchoolOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromSchoolOfCurrentLocationInMeters = a3;
}

- (double)distanceFromGymOfCurrentLocationInMeters
{
  return self->_distanceFromGymOfCurrentLocationInMeters;
}

- (BOOL)hasDistanceFromGymOfCurrentLocationInMeters
{
  return self->_hasDistanceFromGymOfCurrentLocationInMeters;
}

- (void)setHasDistanceFromGymOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromGymOfCurrentLocationInMeters = a3;
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

    v4 = -[BMLocationHashedCoordinates initByReadFrom:]([BMLocationHashedCoordinates alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locationHashAt300Meters"), 0, 0, 1, 5, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locationHashAt2500Meters"), 0, 0, 2, 5, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locationHashAt156Kilometers"), 0, 0, 3, 5, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceFromHomeOfCurrentLocationInMeters"), 1, 0, 4, 1, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceFromWorkOfCurrentLocationInMeters"), 1, 0, 5, 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceFromSchoolOfCurrentLocationInMeters"), 1, 0, 6, 1, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceFromGymOfCurrentLocationInMeters"), 1, 0, 7, 1, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("floor"), 0, 0, 8, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("speedBucket"), 0, 0, 9, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("altitudeBucket"), 0, 0, 10, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceBucketFromHome"), 0, 0, 11, 4, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceBucketFromWork"), 0, 0, 12, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceBucketFromGym"), 0, 0, 13, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceBucketFromSchool"), 0, 0, 14, 4, 0);
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v13;
  v18[9] = v6;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AD10;
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
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationHashAt300Meters"), 1, 5, 0);
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationHashAt2500Meters"), 2, 5, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationHashAt156Kilometers"), 3, 5, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceFromHomeOfCurrentLocationInMeters"), 4, 1, 0);
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceFromWorkOfCurrentLocationInMeters"), 5, 1, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceFromSchoolOfCurrentLocationInMeters"), 6, 1, 0);
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceFromGymOfCurrentLocationInMeters"), 7, 1, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("floor"), 8, 2, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("speedBucket"), 9, 4, 0);
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("altitudeBucket"), 10, 4, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceBucketFromHome"), 11, 4, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceBucketFromWork"), 12, 4, 0);
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceBucketFromGym"), 13, 4, 0);
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceBucketFromSchool"), 14, 4, 0);
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 distanceFromHomeOfCurrentLocationInMeters:(id)a6 distanceFromWorkOfCurrentLocationInMeters:(id)a7 distanceFromSchoolOfCurrentLocationInMeters:(id)a8 distanceFromGymOfCurrentLocationInMeters:(id)a9 floor:(id)a10 speedBucket:(int)a11 altitudeBucket:(int)a12
{
  return -[BMLocationHashedCoordinates initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:distanceFromHomeOfCurrentLocationInMeters:distanceFromWorkOfCurrentLocationInMeters:distanceFromSchoolOfCurrentLocationInMeters:distanceFromGymOfCurrentLocationInMeters:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:](self, "initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:distanceFromHomeOfCurrentLocationInMeters:distanceFromWorkOfCurrentLocationInMeters:distanceFromSchoolOfCurrentLocationInMeters:distanceFromGymOfCurrentLocationInMeters:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:", a3, a4, a5, 0, 0, 0, 0, a10, __PAIR64__(a12, a11), 0, 0);
}

- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 distanceFromHomeOfCurrentLocationInMeters:(id)a6 distanceFromWorkOfCurrentLocationInMeters:(id)a7 distanceFromSchoolOfCurrentLocationInMeters:(id)a8 distanceFromGymOfCurrentLocationInMeters:(id)a9 floor:(id)a10 speedBucket:(int)a11 altitudeBucket:(int)a12 distanceBucketFromHome:(int)a13 distanceBucketFromWork:(int)a14 distanceBucketFromGym:(int)a15 distanceBucketFromSchool:(int)a16
{
  return -[BMLocationHashedCoordinates initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:](self, "initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:", a3, a4, a5, a10, a11, a12);
}

@end
