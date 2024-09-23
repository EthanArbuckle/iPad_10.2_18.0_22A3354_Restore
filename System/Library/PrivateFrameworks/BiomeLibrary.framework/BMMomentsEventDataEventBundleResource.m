@implementation BMMomentsEventDataEventBundleResource

- (BMMomentsEventDataEventBundleResource)initWithType:(int)a3 photoAssetMediaType:(int)a4 photoFaceCount:(id)a5 photoCurationScore:(id)a6 photoOverallAestheticScore:(id)a7
{
  id v12;
  id v13;
  id v14;
  BMMomentsEventDataEventBundleResource *v15;
  int v16;
  double v17;
  double v18;
  objc_super v20;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMMomentsEventDataEventBundleResource;
  v15 = -[BMEventBase init](&v20, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v15->_type = a3;
    v15->_photoAssetMediaType = a4;
    if (v12)
    {
      v15->_hasPhotoFaceCount = 1;
      v16 = objc_msgSend(v12, "intValue");
    }
    else
    {
      v15->_hasPhotoFaceCount = 0;
      v16 = -1;
    }
    v15->_photoFaceCount = v16;
    if (v13)
    {
      v15->_hasPhotoCurationScore = 1;
      objc_msgSend(v13, "doubleValue");
    }
    else
    {
      v15->_hasPhotoCurationScore = 0;
      v17 = -1.0;
    }
    v15->_photoCurationScore = v17;
    if (v14)
    {
      v15->_hasPhotoOverallAestheticScore = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v15->_hasPhotoOverallAestheticScore = 0;
      v18 = -1.0;
    }
    v15->_photoOverallAestheticScore = v18;
  }

  return v15;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMomentsEventDataEventBundleResourceTypeAsString(-[BMMomentsEventDataEventBundleResource type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeAsString(-[BMMomentsEventDataEventBundleResource photoAssetMediaType](self, "photoAssetMediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleResource photoFaceCount](self, "photoFaceCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleResource photoCurationScore](self, "photoCurationScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleResource photoOverallAestheticScore](self, "photoOverallAestheticScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMomentsEventDataEventBundleResource with type: %@, photoAssetMediaType: %@, photoFaceCount: %@, photoCurationScore: %@, photoOverallAestheticScore: %@"), v4, v5, v6, v8, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEventDataEventBundleResource *v5;
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
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  objc_class *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BMMomentsEventDataEventBundleResource *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMMomentsEventDataEventBundleResource;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_74;
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
              goto LABEL_50;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_52:
          if (v22 >= 0x11)
            LODWORD(v22) = 0;
          v45 = 24;
          goto LABEL_61;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_58:
          if (v22 >= 4)
            LODWORD(v22) = 0;
          v45 = 28;
LABEL_61:
          *(_DWORD *)((char *)&v5->super.super.isa + v45) = v22;
          continue;
        case 3u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasPhotoFaceCount = 1;
          break;
        case 4u:
          v5->_hasPhotoCurationScore = 1;
          v40 = *v6;
          v41 = *(_QWORD *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v42 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v41);
            *(_QWORD *)&v4[v40] = v41 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v42 = 0;
          }
          v46 = 40;
          goto LABEL_70;
        case 5u:
          v5->_hasPhotoOverallAestheticScore = 1;
          v43 = *v6;
          v44 = *(_QWORD *)&v4[v43];
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v42 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v44);
            *(_QWORD *)&v4[v43] = v44 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v42 = 0;
          }
          v46 = 48;
LABEL_70:
          *(Class *)((char *)&v5->super.super.isa + v46) = v42;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_73;
          continue;
      }
      while (1)
      {
        v36 = *v6;
        v37 = *(_QWORD *)&v4[v36];
        v38 = v37 + 1;
        if (v37 == -1 || v38 > *(_QWORD *)&v4[*v7])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
        *(_QWORD *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0)
          goto LABEL_63;
        v33 += 7;
        v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v35) = 0;
          goto LABEL_65;
        }
      }
      v4[*v8] = 1;
LABEL_63:
      if (v4[*v8])
        LODWORD(v35) = 0;
LABEL_65:
      v5->_photoFaceCount = v35;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_73:
    v47 = 0;
  else
LABEL_74:
    v47 = v5;

  return v47;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasPhotoFaceCount)
    PBDataWriterWriteInt32Field();
  if (self->_hasPhotoCurationScore)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_hasPhotoOverallAestheticScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventDataEventBundleResource writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundleResource)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  BMMomentsEventDataEventBundleResource *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  BMMomentsEventDataEventBundleResource *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v26;
  id *v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  id v31;
  id *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id *v36;
  id v37;
  void *v38;
  id *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photoAssetMediaType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v17 = 0;
            goto LABEL_44;
          }
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v32 = a4;
          v33 = *MEMORY[0x1E0D025B8];
          v48 = *MEMORY[0x1E0CB2D50];
          v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("photoAssetMediaType"));
          v49 = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v33, 2, v11);
          a4 = 0;
          v17 = 0;
          *v32 = v34;
          goto LABEL_43;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeFromString(v9));
        v10 = (id *)objc_claimAutoreleasedReturnValue();
      }
      v39 = v10;
    }
    else
    {
      v39 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photoFaceCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v40 = 0;
          v17 = 0;
          a4 = v39;
          goto LABEL_43;
        }
        v12 = self;
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("photoFaceCount"));
        v47 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v40 = 0;
        *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v13);
        goto LABEL_52;
      }
      v12 = self;
      v40 = v11;
    }
    else
    {
      v12 = self;
      v40 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photoCurationScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
LABEL_23:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photoOverallAestheticScore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v16 = 0;
LABEL_26:
        a4 = v39;
        v17 = -[BMMomentsEventDataEventBundleResource initWithType:photoAssetMediaType:photoFaceCount:photoCurationScore:photoOverallAestheticScore:](v12, "initWithType:photoAssetMediaType:photoFaceCount:photoCurationScore:photoOverallAestheticScore:", objc_msgSend(v41, "intValue"), objc_msgSend(v39, "intValue"), v40, v14, v16);
        v12 = v17;
LABEL_41:

LABEL_42:
        self = v12;
        v7 = v38;
LABEL_43:

        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        goto LABEL_26;
      }
      if (a4)
      {
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("photoOverallAestheticScore"));
        v43 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v35, 2, v24);

      }
      v16 = 0;
      v17 = 0;
LABEL_40:
      a4 = v39;
      goto LABEL_41;
    }
    if (a4)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v36 = a4;
      v21 = *MEMORY[0x1E0D025B8];
      v44 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("photoCurationScore"));
      v45 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v15);
      v17 = 0;
      v14 = 0;
      *v36 = v22;
      goto LABEL_40;
    }
    v14 = 0;
    v17 = 0;
LABEL_52:
    a4 = v39;
    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_8:
    v41 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventBundleResourceTypeFromString(v7));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v41 = 0;
    v17 = 0;
    goto LABEL_45;
  }
  v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v27 = a4;
  v28 = *MEMORY[0x1E0D025B8];
  v50 = *MEMORY[0x1E0CB2D50];
  v29 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
  v51[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28;
  a4 = v29;
  v41 = 0;
  v17 = 0;
  *v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v30, 2, v9);
LABEL_44:

LABEL_45:
  return v17;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleResource type](self, "type"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleResource photoAssetMediaType](self, "photoAssetMediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundleResource hasPhotoFaceCount](self, "hasPhotoFaceCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleResource photoFaceCount](self, "photoFaceCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (!-[BMMomentsEventDataEventBundleResource hasPhotoCurationScore](self, "hasPhotoCurationScore")
    || (-[BMMomentsEventDataEventBundleResource photoCurationScore](self, "photoCurationScore"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleResource photoCurationScore](self, "photoCurationScore");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleResource photoCurationScore](self, "photoCurationScore");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMMomentsEventDataEventBundleResource hasPhotoOverallAestheticScore](self, "hasPhotoOverallAestheticScore")
    || (-[BMMomentsEventDataEventBundleResource photoOverallAestheticScore](self, "photoOverallAestheticScore"),
        fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleResource photoOverallAestheticScore](self, "photoOverallAestheticScore");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleResource photoOverallAestheticScore](self, "photoOverallAestheticScore");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v3;
  v21[0] = CFSTR("type");
  v12 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = v12;
  v21[1] = CFSTR("photoAssetMediaType");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v13;
  v21[2] = CFSTR("photoFaceCount");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v14;
  v21[3] = CFSTR("photoCurationScore");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v15;
  v21[4] = CFSTR("photoOverallAestheticScore");
  v16 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v8)
      goto LABEL_24;
  }
  else
  {

    if (v8)
    {
LABEL_24:
      if (v5)
        goto LABEL_25;
LABEL_31:

      if (v4)
        goto LABEL_26;
      goto LABEL_32;
    }
  }

  if (!v5)
    goto LABEL_31;
LABEL_25:
  if (v4)
    goto LABEL_26;
LABEL_32:

LABEL_26:
  if (!v20)

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMomentsEventDataEventBundleResource type](self, "type");
    if (v6 != objc_msgSend(v5, "type"))
      goto LABEL_20;
    v7 = -[BMMomentsEventDataEventBundleResource photoAssetMediaType](self, "photoAssetMediaType");
    if (v7 != objc_msgSend(v5, "photoAssetMediaType"))
      goto LABEL_20;
    if (-[BMMomentsEventDataEventBundleResource hasPhotoFaceCount](self, "hasPhotoFaceCount")
      || objc_msgSend(v5, "hasPhotoFaceCount"))
    {
      if (!-[BMMomentsEventDataEventBundleResource hasPhotoFaceCount](self, "hasPhotoFaceCount"))
        goto LABEL_20;
      if (!objc_msgSend(v5, "hasPhotoFaceCount"))
        goto LABEL_20;
      v8 = -[BMMomentsEventDataEventBundleResource photoFaceCount](self, "photoFaceCount");
      if (v8 != objc_msgSend(v5, "photoFaceCount"))
        goto LABEL_20;
    }
    if (-[BMMomentsEventDataEventBundleResource hasPhotoCurationScore](self, "hasPhotoCurationScore")
      || objc_msgSend(v5, "hasPhotoCurationScore"))
    {
      if (!-[BMMomentsEventDataEventBundleResource hasPhotoCurationScore](self, "hasPhotoCurationScore"))
        goto LABEL_20;
      if (!objc_msgSend(v5, "hasPhotoCurationScore"))
        goto LABEL_20;
      -[BMMomentsEventDataEventBundleResource photoCurationScore](self, "photoCurationScore");
      v10 = v9;
      objc_msgSend(v5, "photoCurationScore");
      if (v10 != v11)
        goto LABEL_20;
    }
    if (!-[BMMomentsEventDataEventBundleResource hasPhotoOverallAestheticScore](self, "hasPhotoOverallAestheticScore")
      && !objc_msgSend(v5, "hasPhotoOverallAestheticScore"))
    {
      v15 = 1;
      goto LABEL_21;
    }
    if (-[BMMomentsEventDataEventBundleResource hasPhotoOverallAestheticScore](self, "hasPhotoOverallAestheticScore")
      && objc_msgSend(v5, "hasPhotoOverallAestheticScore"))
    {
      -[BMMomentsEventDataEventBundleResource photoOverallAestheticScore](self, "photoOverallAestheticScore");
      v13 = v12;
      objc_msgSend(v5, "photoOverallAestheticScore");
      v15 = v13 == v14;
    }
    else
    {
LABEL_20:
      v15 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)type
{
  return self->_type;
}

- (int)photoAssetMediaType
{
  return self->_photoAssetMediaType;
}

- (int)photoFaceCount
{
  return self->_photoFaceCount;
}

- (BOOL)hasPhotoFaceCount
{
  return self->_hasPhotoFaceCount;
}

- (void)setHasPhotoFaceCount:(BOOL)a3
{
  self->_hasPhotoFaceCount = a3;
}

- (double)photoCurationScore
{
  return self->_photoCurationScore;
}

- (BOOL)hasPhotoCurationScore
{
  return self->_hasPhotoCurationScore;
}

- (void)setHasPhotoCurationScore:(BOOL)a3
{
  self->_hasPhotoCurationScore = a3;
}

- (double)photoOverallAestheticScore
{
  return self->_photoOverallAestheticScore;
}

- (BOOL)hasPhotoOverallAestheticScore
{
  return self->_hasPhotoOverallAestheticScore;
}

- (void)setHasPhotoOverallAestheticScore:(BOOL)a3
{
  self->_hasPhotoOverallAestheticScore = a3;
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

    v4 = -[BMMomentsEventDataEventBundleResource initByReadFrom:]([BMMomentsEventDataEventBundleResource alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoAssetMediaType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoFaceCount"), 0, 0, 3, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoCurationScore"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoOverallAestheticScore"), 1, 0, 5, 0, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A6E0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoAssetMediaType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoFaceCount"), 3, 2, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoCurationScore"), 4, 0, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoOverallAestheticScore"), 5, 0, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
