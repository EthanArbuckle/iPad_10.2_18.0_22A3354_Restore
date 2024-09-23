@implementation BMiCloudSubscription

- (BMiCloudSubscription)initWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9 displayEntry:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BMiCloudSubscription *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v30.receiver = self;
  v30.super_class = (Class)BMiCloudSubscription;
  v22 = -[BMEventBase init](&v30, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v22->_hasMlServerScore = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v22->_hasMlServerScore = 0;
      v23 = -1.0;
    }
    v22->_mlServerScore = v23;
    if (v17)
    {
      v22->_hasTotalQuota = 1;
      v24 = objc_msgSend(v17, "longLongValue");
    }
    else
    {
      v22->_hasTotalQuota = 0;
      v24 = -1;
    }
    v22->_totalQuota = v24;
    if (v18)
    {
      v22->_hasTotalUsed = 1;
      v25 = objc_msgSend(v18, "longLongValue");
    }
    else
    {
      v22->_hasTotalUsed = 0;
      v25 = -1;
    }
    v22->_totalUsed = v25;
    if (v19)
    {
      v22->_hasTotalAvailable = 1;
      v26 = objc_msgSend(v19, "longLongValue");
    }
    else
    {
      v22->_hasTotalAvailable = 0;
      v26 = -1;
    }
    v22->_totalAvailable = v26;
    if (v20)
    {
      v22->_hasBundleQuotaInBytes = 1;
      v27 = objc_msgSend(v20, "longLongValue");
    }
    else
    {
      v22->_hasBundleQuotaInBytes = 0;
      v27 = -1;
    }
    v22->_bundleQuotaInBytes = v27;
    if (v21)
    {
      v22->_hasCommerceQuotaInBytes = 1;
      v28 = objc_msgSend(v21, "longLongValue");
    }
    else
    {
      v22->_hasCommerceQuotaInBytes = 0;
      v28 = -1;
    }
    v22->_commerceQuotaInBytes = v28;
    v22->_iCloudSubscriptionEventType = a9;
    v22->_displayEntry = a10;
  }

  return v22;
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
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMiCloudSubscription mlServerScore](self, "mlServerScore");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription totalQuota](self, "totalQuota"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription totalUsed](self, "totalUsed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription totalAvailable](self, "totalAvailable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription bundleQuotaInBytes](self, "bundleQuotaInBytes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription commerceQuotaInBytes](self, "commerceQuotaInBytes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMiCloudSubscriptionEventTypeAsString(-[BMiCloudSubscription iCloudSubscriptionEventType](self, "iCloudSubscriptionEventType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BMiCloudSubscriptionEntryTypeAsString(-[BMiCloudSubscription displayEntry](self, "displayEntry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMiCloudSubscription with mlServerScore: %@, totalQuota: %@, totalUsed: %@, totalAvailable: %@, bundleQuotaInBytes: %@, commerceQuotaInBytes: %@, iCloudSubscriptionEventType: %@, displayEntry: %@"), v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMiCloudSubscription *v5;
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
  unint64_t v21;
  double v22;
  char v23;
  unsigned int v24;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
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
  uint64_t v67;
  uint64_t v68;
  BMiCloudSubscription *v69;
  objc_super v71;

  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BMiCloudSubscription;
  v5 = -[BMEventBase init](&v71, sel_init);
  if (!v5)
    goto LABEL_113;
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
          v5->_hasMlServerScore = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0.0;
          }
          v5->_mlServerScore = v22;
          continue;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasTotalQuota = 1;
          while (1)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
              break;
            v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
            *(_QWORD *)&v4[v26] = v28;
            v25 = (objc_class *)(((unint64_t)(v29 & 0x7F) << v23) | (unint64_t)v25);
            if ((v29 & 0x80) == 0)
              goto LABEL_75;
            v23 += 7;
            v17 = v24++ >= 9;
            if (v17)
            {
              v25 = 0;
              goto LABEL_77;
            }
          }
          v4[*v8] = 1;
LABEL_75:
          if (v4[*v8])
            v25 = 0;
LABEL_77:
          v67 = 48;
          goto LABEL_94;
        case 3u:
          v30 = 0;
          v31 = 0;
          v25 = 0;
          v5->_hasTotalUsed = 1;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v34;
              v25 = (objc_class *)(((unint64_t)(v35 & 0x7F) << v30) | (unint64_t)v25);
              if (v35 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_81:
          v67 = 56;
          goto LABEL_94;
        case 4u:
          v36 = 0;
          v37 = 0;
          v25 = 0;
          v5->_hasTotalAvailable = 1;
          while (2)
          {
            v38 = *v6;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v25 = (objc_class *)(((unint64_t)(v41 & 0x7F) << v36) | (unint64_t)v25);
              if (v41 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_85:
          v67 = 64;
          goto LABEL_94;
        case 5u:
          v42 = 0;
          v43 = 0;
          v25 = 0;
          v5->_hasBundleQuotaInBytes = 1;
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
              v25 = (objc_class *)(((unint64_t)(v47 & 0x7F) << v42) | (unint64_t)v25);
              if (v47 < 0)
              {
                v42 += 7;
                v17 = v43++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_89:
          v67 = 72;
          goto LABEL_94;
        case 6u:
          v48 = 0;
          v49 = 0;
          v25 = 0;
          v5->_hasCommerceQuotaInBytes = 1;
          while (2)
          {
            v50 = *v6;
            v51 = *(_QWORD *)&v4[v50];
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v51);
              *(_QWORD *)&v4[v50] = v52;
              v25 = (objc_class *)(((unint64_t)(v53 & 0x7F) << v48) | (unint64_t)v25);
              if (v53 < 0)
              {
                v48 += 7;
                v17 = v49++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_93:
          v67 = 80;
LABEL_94:
          *(Class *)((char *)&v5->super.super.isa + v67) = v25;
          continue;
        case 7u:
          v54 = 0;
          v55 = 0;
          v56 = 0;
          while (2)
          {
            v57 = *v6;
            v58 = *(_QWORD *)&v4[v57];
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v58);
              *(_QWORD *)&v4[v57] = v59;
              v56 |= (unint64_t)(v60 & 0x7F) << v54;
              if (v60 < 0)
              {
                v54 += 7;
                v17 = v55++ >= 9;
                if (v17)
                {
                  LODWORD(v56) = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v56) = 0;
LABEL_98:
          if (v56 >= 6)
            LODWORD(v56) = 0;
          v68 = 28;
          goto LABEL_107;
        case 8u:
          v61 = 0;
          v62 = 0;
          v56 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_112;
          continue;
      }
      while (1)
      {
        v63 = *v6;
        v64 = *(_QWORD *)&v4[v63];
        v65 = v64 + 1;
        if (v64 == -1 || v65 > *(_QWORD *)&v4[*v7])
          break;
        v66 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v64);
        *(_QWORD *)&v4[v63] = v65;
        v56 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0)
          goto LABEL_102;
        v61 += 7;
        v17 = v62++ >= 9;
        if (v17)
        {
          LODWORD(v56) = 0;
          goto LABEL_104;
        }
      }
      v4[*v8] = 1;
LABEL_102:
      if (v4[*v8])
        LODWORD(v56) = 0;
LABEL_104:
      if (v56 >= 5)
        LODWORD(v56) = 0;
      v68 = 32;
LABEL_107:
      *(_DWORD *)((char *)&v5->super.super.isa + v68) = v56;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_112:
    v69 = 0;
  else
LABEL_113:
    v69 = v5;

  return v69;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasMlServerScore)
    PBDataWriterWriteDoubleField();
  if (self->_hasTotalQuota)
    PBDataWriterWriteInt64Field();
  if (self->_hasTotalUsed)
    PBDataWriterWriteInt64Field();
  if (self->_hasTotalAvailable)
    PBDataWriterWriteInt64Field();
  if (self->_hasBundleQuotaInBytes)
    PBDataWriterWriteInt64Field();
  if (self->_hasCommerceQuotaInBytes)
    PBDataWriterWriteInt64Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMiCloudSubscription writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMiCloudSubscription)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BMiCloudSubscription *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  BMiCloudSubscription *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  id *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  BMiCloudSubscription *v68;
  id v69;
  id v70;
  id *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mlServerScore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalQuota"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v22 = 0;
          goto LABEL_70;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v85 = *MEMORY[0x1E0CB2D50];
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalQuota"));
        v86 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v23;
        v11 = (void *)v26;
        v10 = 0;
        v22 = 0;
        *v71 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v24, 2, v26);
        goto LABEL_69;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalUsed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v25 = 0;
          v22 = 0;
          goto LABEL_69;
        }
        v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v83 = *MEMORY[0x1E0CB2D50];
        v30 = v10;
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v57 = objc_opt_class();
        v32 = v31;
        v10 = v30;
        v72 = (id)objc_msgSend(v32, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v57, CFSTR("totalUsed"));
        v84 = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v29;
        v35 = (void *)v33;
        v25 = 0;
        v22 = 0;
        *v71 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v34, 2, v33);
LABEL_68:

LABEL_69:
        goto LABEL_70;
      }
      v61 = v9;
      v12 = v7;
      v13 = self;
      v69 = v11;
    }
    else
    {
      v61 = v9;
      v12 = v7;
      v13 = self;
      v69 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalAvailable"));
    v14 = objc_claimAutoreleasedReturnValue();
    v59 = v11;
    v64 = (void *)v14;
    if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v72 = 0;
          v22 = 0;
          v25 = v69;
          self = v13;
          v7 = v12;
          v9 = v61;
          v35 = v64;
          goto LABEL_68;
        }
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = v10;
        v38 = *MEMORY[0x1E0D025B8];
        v81 = *MEMORY[0x1E0CB2D50];
        v39 = a4;
        v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalAvailable"));
        v82 = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v36;
        v11 = v59;
        v41 = v38;
        v10 = v37;
        v72 = 0;
        v22 = 0;
        *v39 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v16);
        v25 = v69;
        self = v13;
        v7 = v12;
        v9 = v61;
        goto LABEL_67;
      }
      v72 = v15;
    }
    else
    {
      v72 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleQuotaInBytes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = v13;
    v66 = v8;
    if (v16)
    {
      objc_opt_class();
      v7 = v12;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        v9 = v61;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v71)
          {
            v67 = 0;
            v22 = 0;
            goto LABEL_66;
          }
          v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v43 = v10;
          v44 = *MEMORY[0x1E0D025B8];
          v79 = *MEMORY[0x1E0CB2D50];
          v65 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleQuotaInBytes"));
          v80 = v65;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v42;
          v11 = v59;
          v46 = v44;
          v10 = v43;
          v67 = 0;
          v22 = 0;
          *v71 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v17);
LABEL_65:

          v8 = v66;
LABEL_66:
          v25 = v69;
LABEL_67:

          v35 = v64;
          goto LABEL_68;
        }
        v67 = v16;
LABEL_24:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("commerceQuotaInBytes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = self;
        v60 = v10;
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v71)
            {
              v65 = 0;
              v22 = 0;
              goto LABEL_65;
            }
            v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v48 = *MEMORY[0x1E0D025B8];
            v77 = *MEMORY[0x1E0CB2D50];
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("commerceQuotaInBytes"));
            v78 = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0;
            v22 = 0;
            *v71 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v18);
            goto LABEL_64;
          }
          v65 = v17;
        }
        else
        {
          v65 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iCloudSubscriptionEventType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = v18;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v71)
              {
                v19 = 0;
                v22 = 0;
                goto LABEL_64;
              }
              v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v53 = *MEMORY[0x1E0D025B8];
              v75 = *MEMORY[0x1E0CB2D50];
              v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("iCloudSubscriptionEventType"));
              v76 = v50;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v53, 2, v49);
              v19 = 0;
              v22 = 0;
              *v71 = v54;
              goto LABEL_63;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMiCloudSubscriptionEventTypeFromString(v18));
            v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v28;
        }
        else
        {
          v19 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayEntry"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v51 = v49;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v71)
              {
                v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v58 = *MEMORY[0x1E0D025B8];
                v73 = *MEMORY[0x1E0CB2D50];
                v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("displayEntry"));
                v74 = v55;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *v71 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v58, 2, v56);

              }
              v50 = 0;
              v22 = 0;
              goto LABEL_63;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMiCloudSubscriptionEntryTypeFromString(v49));
            v51 = (id)objc_claimAutoreleasedReturnValue();
          }
          v50 = v51;
        }
        else
        {
          v50 = 0;
        }
        v22 = -[BMiCloudSubscription initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:](v68, "initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", v66, v60, v69, v72, v67, v65, __PAIR64__(objc_msgSend(v50, "intValue"), objc_msgSend(v19, "intValue")));
        v68 = v22;
LABEL_63:

LABEL_64:
        self = v68;
        v11 = v59;
        v10 = v60;
        goto LABEL_65;
      }
      v67 = 0;
    }
    else
    {
      v67 = 0;
      v7 = v12;
    }
    v9 = v61;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0D025B8];
    v87 = *MEMORY[0x1E0CB2D50];
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mlServerScore"));
    v88[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v22 = 0;
    *v71 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v9);
LABEL_70:

    goto LABEL_71;
  }
  v8 = 0;
  v22 = 0;
LABEL_71:

  return v22;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[8];
  _QWORD v29[10];

  v29[8] = *MEMORY[0x1E0C80C00];
  if (!-[BMiCloudSubscription hasMlServerScore](self, "hasMlServerScore")
    || (-[BMiCloudSubscription mlServerScore](self, "mlServerScore"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMiCloudSubscription mlServerScore](self, "mlServerScore");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMiCloudSubscription mlServerScore](self, "mlServerScore");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  if (-[BMiCloudSubscription hasTotalQuota](self, "hasTotalQuota"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription totalQuota](self, "totalQuota"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMiCloudSubscription hasTotalUsed](self, "hasTotalUsed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription totalUsed](self, "totalUsed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMiCloudSubscription hasTotalAvailable](self, "hasTotalAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription totalAvailable](self, "totalAvailable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  if (-[BMiCloudSubscription hasBundleQuotaInBytes](self, "hasBundleQuotaInBytes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription bundleQuotaInBytes](self, "bundleQuotaInBytes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  if (-[BMiCloudSubscription hasCommerceQuotaInBytes](self, "hasCommerceQuotaInBytes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMiCloudSubscription commerceQuotaInBytes](self, "commerceQuotaInBytes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMiCloudSubscription iCloudSubscriptionEventType](self, "iCloudSubscriptionEventType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMiCloudSubscription displayEntry](self, "displayEntry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("mlServerScore");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v11;
  v29[0] = v11;
  v28[1] = CFSTR("totalQuota");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v29[1] = v12;
  v28[2] = CFSTR("totalUsed");
  v13 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v5;
  v21 = (void *)v13;
  v29[2] = v13;
  v28[3] = CFSTR("totalAvailable");
  v14 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v6;
  v29[3] = v14;
  v28[4] = CFSTR("bundleQuotaInBytes");
  v15 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[4] = v15;
  v28[5] = CFSTR("commerceQuotaInBytes");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[5] = v16;
  v28[6] = CFSTR("iCloudSubscriptionEventType");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[6] = v17;
  v28[7] = CFSTR("displayEntry");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_38;
LABEL_48:

    if (v8)
      goto LABEL_39;
    goto LABEL_49;
  }

  if (!v9)
    goto LABEL_48;
LABEL_38:
  if (v8)
    goto LABEL_39;
LABEL_49:

LABEL_39:
  if (!v26)

  if (!v27)
  if (v7)
  {
    if (v24)
      goto LABEL_45;
LABEL_51:

    if (v25)
      goto LABEL_46;
LABEL_52:

    goto LABEL_46;
  }

  if (!v24)
    goto LABEL_51;
LABEL_45:
  if (!v25)
    goto LABEL_52;
LABEL_46:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int v14;
  int v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMiCloudSubscription hasMlServerScore](self, "hasMlServerScore")
      || objc_msgSend(v5, "hasMlServerScore"))
    {
      if (!-[BMiCloudSubscription hasMlServerScore](self, "hasMlServerScore"))
        goto LABEL_35;
      if (!objc_msgSend(v5, "hasMlServerScore"))
        goto LABEL_35;
      -[BMiCloudSubscription mlServerScore](self, "mlServerScore");
      v7 = v6;
      objc_msgSend(v5, "mlServerScore");
      if (v7 != v8)
        goto LABEL_35;
    }
    if ((!-[BMiCloudSubscription hasTotalQuota](self, "hasTotalQuota")
       && !objc_msgSend(v5, "hasTotalQuota")
       || -[BMiCloudSubscription hasTotalQuota](self, "hasTotalQuota")
       && objc_msgSend(v5, "hasTotalQuota")
       && (v9 = -[BMiCloudSubscription totalQuota](self, "totalQuota"), v9 == objc_msgSend(v5, "totalQuota")))
      && (!-[BMiCloudSubscription hasTotalUsed](self, "hasTotalUsed") && !objc_msgSend(v5, "hasTotalUsed")
       || -[BMiCloudSubscription hasTotalUsed](self, "hasTotalUsed")
       && objc_msgSend(v5, "hasTotalUsed")
       && (v10 = -[BMiCloudSubscription totalUsed](self, "totalUsed"), v10 == objc_msgSend(v5, "totalUsed")))
      && (!-[BMiCloudSubscription hasTotalAvailable](self, "hasTotalAvailable")
       && !objc_msgSend(v5, "hasTotalAvailable")
       || -[BMiCloudSubscription hasTotalAvailable](self, "hasTotalAvailable")
       && objc_msgSend(v5, "hasTotalAvailable")
       && (v11 = -[BMiCloudSubscription totalAvailable](self, "totalAvailable"),
           v11 == objc_msgSend(v5, "totalAvailable")))
      && (!-[BMiCloudSubscription hasBundleQuotaInBytes](self, "hasBundleQuotaInBytes")
       && !objc_msgSend(v5, "hasBundleQuotaInBytes")
       || -[BMiCloudSubscription hasBundleQuotaInBytes](self, "hasBundleQuotaInBytes")
       && objc_msgSend(v5, "hasBundleQuotaInBytes")
       && (v12 = -[BMiCloudSubscription bundleQuotaInBytes](self, "bundleQuotaInBytes"),
           v12 == objc_msgSend(v5, "bundleQuotaInBytes")))
      && (!-[BMiCloudSubscription hasCommerceQuotaInBytes](self, "hasCommerceQuotaInBytes")
       && !objc_msgSend(v5, "hasCommerceQuotaInBytes")
       || -[BMiCloudSubscription hasCommerceQuotaInBytes](self, "hasCommerceQuotaInBytes")
       && objc_msgSend(v5, "hasCommerceQuotaInBytes")
       && (v13 = -[BMiCloudSubscription commerceQuotaInBytes](self, "commerceQuotaInBytes"),
           v13 == objc_msgSend(v5, "commerceQuotaInBytes")))
      && (v14 = -[BMiCloudSubscription iCloudSubscriptionEventType](self, "iCloudSubscriptionEventType"),
          v14 == objc_msgSend(v5, "iCloudSubscriptionEventType")))
    {
      v15 = -[BMiCloudSubscription displayEntry](self, "displayEntry");
      v16 = v15 == objc_msgSend(v5, "displayEntry");
    }
    else
    {
LABEL_35:
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

- (double)mlServerScore
{
  return self->_mlServerScore;
}

- (BOOL)hasMlServerScore
{
  return self->_hasMlServerScore;
}

- (void)setHasMlServerScore:(BOOL)a3
{
  self->_hasMlServerScore = a3;
}

- (int64_t)totalQuota
{
  return self->_totalQuota;
}

- (BOOL)hasTotalQuota
{
  return self->_hasTotalQuota;
}

- (void)setHasTotalQuota:(BOOL)a3
{
  self->_hasTotalQuota = a3;
}

- (int64_t)totalUsed
{
  return self->_totalUsed;
}

- (BOOL)hasTotalUsed
{
  return self->_hasTotalUsed;
}

- (void)setHasTotalUsed:(BOOL)a3
{
  self->_hasTotalUsed = a3;
}

- (int64_t)totalAvailable
{
  return self->_totalAvailable;
}

- (BOOL)hasTotalAvailable
{
  return self->_hasTotalAvailable;
}

- (void)setHasTotalAvailable:(BOOL)a3
{
  self->_hasTotalAvailable = a3;
}

- (int64_t)bundleQuotaInBytes
{
  return self->_bundleQuotaInBytes;
}

- (BOOL)hasBundleQuotaInBytes
{
  return self->_hasBundleQuotaInBytes;
}

- (void)setHasBundleQuotaInBytes:(BOOL)a3
{
  self->_hasBundleQuotaInBytes = a3;
}

- (int64_t)commerceQuotaInBytes
{
  return self->_commerceQuotaInBytes;
}

- (BOOL)hasCommerceQuotaInBytes
{
  return self->_hasCommerceQuotaInBytes;
}

- (void)setHasCommerceQuotaInBytes:(BOOL)a3
{
  self->_hasCommerceQuotaInBytes = a3;
}

- (int)iCloudSubscriptionEventType
{
  return self->_iCloudSubscriptionEventType;
}

- (int)displayEntry
{
  return self->_displayEntry;
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

    v4 = -[BMiCloudSubscription initByReadFrom:]([BMiCloudSubscription alloc], "initByReadFrom:", v7);
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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mlServerScore"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalQuota"), 0, 0, 2, 3, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalUsed"), 0, 0, 3, 3, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalAvailable"), 0, 0, 4, 3, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleQuotaInBytes"), 0, 0, 5, 3, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("commerceQuotaInBytes"), 0, 0, 6, 3, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("iCloudSubscriptionEventType"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("displayEntry"), 0, 0, 8, 4, 0);
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
  return &unk_1E5F1D770;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mlServerScore"), 1, 0, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalQuota"), 2, 3, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalUsed"), 3, 3, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalAvailable"), 4, 3, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleQuotaInBytes"), 5, 3, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("commerceQuotaInBytes"), 6, 3, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("iCloudSubscriptionEventType"), 7, 4, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("displayEntry"), 8, 4, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BMiCloudSubscription)initWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9
{
  return -[BMiCloudSubscription initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:](self, "initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", a3, a4, a5, a6, a7, a8, a9);
}

@end
