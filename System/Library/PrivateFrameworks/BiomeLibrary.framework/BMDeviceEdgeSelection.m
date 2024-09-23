@implementation BMDeviceEdgeSelection

- (BMDeviceEdgeSelection)initWithPublicIPPrefix:(id)a3 addressFamily:(id)a4 prefixLength:(id)a5 interfaceType:(id)a6 radioType:(id)a7 radioBand:(id)a8 country:(id)a9 timeZone:(id)a10 geohash:(id)a11
{
  id v18;
  id v19;
  BMDeviceEdgeSelection *v20;
  unsigned int v21;
  unsigned int v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v18 = a4;
  v19 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMDeviceEdgeSelection;
  v20 = -[BMEventBase init](&v31, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_publicIPPrefix, a3);
    if (v18)
    {
      v20->_hasAddressFamily = 1;
      v21 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v21 = 0;
      v20->_hasAddressFamily = 0;
    }
    v20->_addressFamily = v21;
    if (v19)
    {
      v20->_hasPrefixLength = 1;
      v22 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v22 = 0;
      v20->_hasPrefixLength = 0;
    }
    v20->_prefixLength = v22;
    objc_storeStrong((id *)&v20->_interfaceType, a6);
    objc_storeStrong((id *)&v20->_radioType, a7);
    objc_storeStrong((id *)&v20->_radioBand, a8);
    objc_storeStrong((id *)&v20->_country, a9);
    objc_storeStrong((id *)&v20->_timeZone, a10);
    objc_storeStrong((id *)&v20->_geohash, a11);
  }

  return v20;
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
  -[BMDeviceEdgeSelection publicIPPrefix](self, "publicIPPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceEdgeSelection addressFamily](self, "addressFamily"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceEdgeSelection prefixLength](self, "prefixLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection interfaceType](self, "interfaceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection radioType](self, "radioType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection radioBand](self, "radioBand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection country](self, "country");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection timeZone](self, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection geohash](self, "geohash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceEdgeSelection with publicIPPrefix: %@, addressFamily: %@, prefixLength: %@, interfaceType: %@, radioType: %@, radioBand: %@, country: %@, timeZone: %@, geohash: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceEdgeSelection *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  uint64_t v33;
  BMDeviceEdgeSelection *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMDeviceEdgeSelection;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_56;
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_43;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v5->_hasAddressFamily = 1;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_47:
          v33 = 24;
          goto LABEL_52;
        case 3u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          v5->_hasPrefixLength = 1;
          break;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_43;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_43;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_43;
        case 7u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_43;
        case 8u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
          goto LABEL_43;
        case 9u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 80;
LABEL_43:
          v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_55;
          continue;
      }
      while (1)
      {
        v29 = *v6;
        v30 = *(_QWORD *)&v4[v29];
        if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
          break;
        v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
        *(_QWORD *)&v4[v29] = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0)
          goto LABEL_49;
        v27 += 7;
        v16 = v28++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8])
        LODWORD(v23) = 0;
LABEL_51:
      v33 = 28;
LABEL_52:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_55:
    v34 = 0;
  else
LABEL_56:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_publicIPPrefix)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasAddressFamily)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasPrefixLength)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_interfaceType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_radioType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_radioBand)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_timeZone)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_geohash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceEdgeSelection writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceEdgeSelection)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BMDeviceEdgeSelection *v19;
  id v20;
  void *v21;
  id v22;
  BMDeviceEdgeSelection *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id *v30;
  uint64_t v31;
  id v32;
  id *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  id *v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("publicIPPrefix"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressFamily"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = a4;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v9 = 0;
          v23 = 0;
          goto LABEL_36;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = a4;
        v34 = *MEMORY[0x1E0D025B8];
        v87 = *MEMORY[0x1E0CB2D50];
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("addressFamily"));
        v88 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v34;
        v10 = (void *)v35;
        v23 = 0;
        v9 = 0;
        *v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v36, 2, v35);
        goto LABEL_35;
      }
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prefixLength"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v6;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v66)
        {
          v25 = 0;
          v23 = 0;
          goto LABEL_35;
        }
        v24 = v7;
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v68 = *MEMORY[0x1E0D025B8];
        v85 = *MEMORY[0x1E0CB2D50];
        v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("prefixLength"));
        v86 = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v25 = 0;
        *v66 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v68, 2, v27);
LABEL_34:

        v7 = v24;
        v6 = v65;
LABEL_35:

        goto LABEL_36;
      }
      v67 = v10;
    }
    else
    {
      v67 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("interfaceType"));
    v11 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)v11;
    if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v24 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v66)
        {
          v69 = 0;
          v23 = 0;
          v25 = v67;
          v27 = v12;
          goto LABEL_34;
        }
        v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v56 = v10;
        v38 = *MEMORY[0x1E0D025B8];
        v83 = *MEMORY[0x1E0CB2D50];
        v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("interfaceType"));
        v84 = v63;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v10 = v56;
        v40 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v39, 2, v26);
        v23 = 0;
        v69 = 0;
        *v66 = v40;
        v27 = v61;
        v25 = v67;
        goto LABEL_33;
      }
      v13 = v8;
      v69 = v12;
    }
    else
    {
      v13 = v8;
      v69 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radioType"));
    v14 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v14;
    if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = v7;
        if (!v66)
        {
          v63 = 0;
          v23 = 0;
          v25 = v67;
          v26 = v60;
          v27 = v61;
          v8 = v13;
          goto LABEL_33;
        }
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v64 = *MEMORY[0x1E0D025B8];
        v81 = *MEMORY[0x1E0CB2D50];
        v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("radioType"));
        v82 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v64, 2, v42);
        v23 = 0;
        v63 = 0;
        *v66 = v43;
        v25 = v67;
        v8 = v13;
        v16 = (void *)v42;
LABEL_32:

        v26 = v60;
        v27 = v61;
LABEL_33:

        goto LABEL_34;
      }
      v63 = v15;
    }
    else
    {
      v63 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radioBand"));
    v8 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v9;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v66)
        {
          v24 = v7;
          v62 = 0;
          v23 = 0;
          v25 = v67;
          goto LABEL_32;
        }
        v24 = v7;
        v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = *MEMORY[0x1E0D025B8];
        v79 = *MEMORY[0x1E0CB2D50];
        v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("radioBand"));
        v80 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v62 = 0;
        *v66 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2, v17);
        goto LABEL_82;
      }
      v62 = v16;
    }
    else
    {
      v62 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("country"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v10;
    v57 = v7;
    v54 = v16;
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v58 = 0;
LABEL_22:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeZone"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = self;
          if (!v66)
          {
            v20 = 0;
            v23 = 0;
            goto LABEL_30;
          }
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("timeZone"));
          v76 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v48, 2, v21);
          v23 = 0;
          v20 = 0;
          *v66 = v49;
          goto LABEL_29;
        }
        v19 = self;
        v20 = v18;
      }
      else
      {
        v19 = self;
        v20 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geohash"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v66)
          {
            v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v53 = *MEMORY[0x1E0D025B8];
            v73 = *MEMORY[0x1E0CB2D50];
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("geohash"));
            v74 = v50;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *v66 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v53, 2, v51);

          }
          v22 = 0;
          v23 = 0;
          goto LABEL_29;
        }
        v22 = v21;
      }
      else
      {
        v22 = 0;
      }
      v23 = -[BMDeviceEdgeSelection initWithPublicIPPrefix:addressFamily:prefixLength:interfaceType:radioType:radioBand:country:timeZone:geohash:](v19, "initWithPublicIPPrefix:addressFamily:prefixLength:interfaceType:radioType:radioBand:country:timeZone:geohash:", v57, v59, v67, v69, v63, v62, v58, v20, v22);
      v19 = v23;
LABEL_29:

LABEL_30:
      self = v19;

      v10 = v55;
      v24 = v57;
      v25 = v67;
      v16 = v54;
LABEL_31:

      v9 = v59;
      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = v17;
      goto LABEL_22;
    }
    if (v66)
    {
      v19 = self;
      v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v47 = *MEMORY[0x1E0D025B8];
      v77 = *MEMORY[0x1E0CB2D50];
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("country"));
      v78 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v58 = 0;
      *v66 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2, v18);
      goto LABEL_30;
    }
    v24 = v7;
    v58 = 0;
    v23 = 0;
LABEL_82:
    v25 = v67;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v23 = 0;
    v7 = 0;
    goto LABEL_37;
  }
  v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v30 = a4;
  v31 = *MEMORY[0x1E0D025B8];
  v89 = *MEMORY[0x1E0CB2D50];
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("publicIPPrefix"));
  v90[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v7 = 0;
  *v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v31, 2, v8);
LABEL_36:

LABEL_37:
  return v23;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[9];
  _QWORD v31[11];

  v31[9] = *MEMORY[0x1E0C80C00];
  -[BMDeviceEdgeSelection publicIPPrefix](self, "publicIPPrefix");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceEdgeSelection hasAddressFamily](self, "hasAddressFamily"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceEdgeSelection addressFamily](self, "addressFamily"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMDeviceEdgeSelection hasPrefixLength](self, "hasPrefixLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceEdgeSelection prefixLength](self, "prefixLength"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMDeviceEdgeSelection interfaceType](self, "interfaceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection radioType](self, "radioType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection radioBand](self, "radioBand");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection country](self, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceEdgeSelection geohash](self, "geohash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("publicIPPrefix");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v11;
  v31[0] = v11;
  v30[1] = CFSTR("addressFamily");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v12;
  v31[1] = v12;
  v30[2] = CFSTR("prefixLength");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v3;
  v22 = (void *)v13;
  v31[2] = v13;
  v30[3] = CFSTR("interfaceType");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v4;
  v21 = (void *)v14;
  v31[3] = v14;
  v30[4] = CFSTR("radioType");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v5;
  v31[4] = v15;
  v30[5] = CFSTR("radioBand");
  v16 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = v16;
  v30[6] = CFSTR("country");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[6] = v17;
  v30[7] = CFSTR("timeZone");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[7] = v18;
  v30[8] = CFSTR("geohash");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[8] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 9);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_27;
LABEL_39:

    if (v8)
      goto LABEL_28;
    goto LABEL_40;
  }

  if (!v9)
    goto LABEL_39;
LABEL_27:
  if (v8)
    goto LABEL_28;
LABEL_40:

LABEL_28:
  if (!v29)

  if (!v7)
  if (!v6)

  if (v26)
  {
    if (v27)
      goto LABEL_36;
LABEL_42:

    if (v28)
      goto LABEL_37;
LABEL_43:

    goto LABEL_37;
  }

  if (!v27)
    goto LABEL_42;
LABEL_36:
  if (!v28)
    goto LABEL_43;
LABEL_37:

  return v25;
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
  char v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDeviceEdgeSelection publicIPPrefix](self, "publicIPPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publicIPPrefix");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDeviceEdgeSelection publicIPPrefix](self, "publicIPPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "publicIPPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_35;
    }
    if (-[BMDeviceEdgeSelection hasAddressFamily](self, "hasAddressFamily")
      || objc_msgSend(v5, "hasAddressFamily"))
    {
      if (!-[BMDeviceEdgeSelection hasAddressFamily](self, "hasAddressFamily"))
        goto LABEL_35;
      if (!objc_msgSend(v5, "hasAddressFamily"))
        goto LABEL_35;
      v13 = -[BMDeviceEdgeSelection addressFamily](self, "addressFamily");
      if (v13 != objc_msgSend(v5, "addressFamily"))
        goto LABEL_35;
    }
    if (-[BMDeviceEdgeSelection hasPrefixLength](self, "hasPrefixLength")
      || objc_msgSend(v5, "hasPrefixLength"))
    {
      if (!-[BMDeviceEdgeSelection hasPrefixLength](self, "hasPrefixLength"))
        goto LABEL_35;
      if (!objc_msgSend(v5, "hasPrefixLength"))
        goto LABEL_35;
      v14 = -[BMDeviceEdgeSelection prefixLength](self, "prefixLength");
      if (v14 != objc_msgSend(v5, "prefixLength"))
        goto LABEL_35;
    }
    -[BMDeviceEdgeSelection interfaceType](self, "interfaceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interfaceType");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[BMDeviceEdgeSelection interfaceType](self, "interfaceType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interfaceType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_35;
    }
    -[BMDeviceEdgeSelection radioType](self, "radioType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "radioType");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[BMDeviceEdgeSelection radioType](self, "radioType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "radioType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_35;
    }
    -[BMDeviceEdgeSelection radioBand](self, "radioBand");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "radioBand");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[BMDeviceEdgeSelection radioBand](self, "radioBand");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "radioBand");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_35;
    }
    -[BMDeviceEdgeSelection country](self, "country");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "country");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[BMDeviceEdgeSelection country](self, "country");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "country");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_35;
    }
    -[BMDeviceEdgeSelection timeZone](self, "timeZone");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[BMDeviceEdgeSelection timeZone](self, "timeZone");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeZone");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
      {
LABEL_35:
        v12 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    -[BMDeviceEdgeSelection geohash](self, "geohash");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "geohash");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46 == v47)
    {
      v12 = 1;
    }
    else
    {
      -[BMDeviceEdgeSelection geohash](self, "geohash");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "geohash");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v48, "isEqual:", v49);

    }
    goto LABEL_36;
  }
  v12 = 0;
LABEL_37:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)publicIPPrefix
{
  return self->_publicIPPrefix;
}

- (unsigned)addressFamily
{
  return self->_addressFamily;
}

- (BOOL)hasAddressFamily
{
  return self->_hasAddressFamily;
}

- (void)setHasAddressFamily:(BOOL)a3
{
  self->_hasAddressFamily = a3;
}

- (unsigned)prefixLength
{
  return self->_prefixLength;
}

- (BOOL)hasPrefixLength
{
  return self->_hasPrefixLength;
}

- (void)setHasPrefixLength:(BOOL)a3
{
  self->_hasPrefixLength = a3;
}

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (NSString)radioType
{
  return self->_radioType;
}

- (NSString)radioBand
{
  return self->_radioBand;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (NSString)geohash
{
  return self->_geohash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geohash, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_radioBand, 0);
  objc_storeStrong((id *)&self->_radioType, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
  objc_storeStrong((id *)&self->_publicIPPrefix, 0);
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

    v4 = -[BMDeviceEdgeSelection initByReadFrom:]([BMDeviceEdgeSelection alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("publicIPPrefix"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("addressFamily"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("prefixLength"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interfaceType"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("radioType"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("radioBand"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("country"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeZone"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("geohash"), 2, 0, 9, 13, 0);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B700;
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
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("publicIPPrefix"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("addressFamily"), 2, 4, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("prefixLength"), 3, 4, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interfaceType"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("radioType"), 5, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("radioBand"), 6, 13, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("country"), 7, 13, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeZone"), 8, 13, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("geohash"), 9, 13, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
