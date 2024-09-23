@implementation BMFamilyAskToBuy

- (BMFamilyAskToBuy)initWithRequestID:(id)a3 eventTime:(id)a4 userID:(id)a5 actionUserID:(id)a6 status:(int)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14 isActionUserDevice:(id)a15 storeLink:(id)a16
{
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMFamilyAskToBuy *v26;
  double v27;
  float v28;
  double v29;
  id v32;
  id v33;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v43 = a3;
  v20 = a4;
  v32 = a5;
  v42 = a5;
  v33 = a6;
  v41 = a6;
  v40 = a8;
  v39 = a9;
  v38 = a10;
  v37 = a11;
  v36 = a12;
  v21 = v20;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v44.receiver = self;
  v44.super_class = (Class)BMFamilyAskToBuy;
  v26 = -[BMEventBase init](&v44, sel_init);
  if (v26)
  {
    v26->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v26->_requestID, a3);
    if (v21)
    {
      v26->_hasEventTime = 1;
      objc_msgSend(v21, "doubleValue");
    }
    else
    {
      v26->_hasEventTime = 0;
      v27 = -1.0;
    }
    v26->_eventTime = v27;
    objc_storeStrong((id *)&v26->_userID, v32);
    objc_storeStrong((id *)&v26->_actionUserID, v33);
    v26->_status = a7;
    objc_storeStrong((id *)&v26->_itemTitle, a8);
    objc_storeStrong((id *)&v26->_itemDescription, a9);
    objc_storeStrong((id *)&v26->_itemLocalizedPrice, a10);
    objc_storeStrong((id *)&v26->_thumbnailPath, a11);
    objc_storeStrong((id *)&v26->_ageRating, a12);
    if (v22)
    {
      v26->_hasStarRating = 1;
      objc_msgSend(v22, "floatValue");
      v29 = v28;
    }
    else
    {
      v26->_hasStarRating = 0;
      v29 = -1.0;
    }
    v26->_starRating = v29;
    objc_storeStrong((id *)&v26->_productType, a14);
    if (v24)
    {
      v26->_hasIsActionUserDevice = 1;
      v26->_isActionUserDevice = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v26->_hasIsActionUserDevice = 0;
      v26->_isActionUserDevice = 0;
    }
    objc_storeStrong((id *)&v26->_storeLink, a16);
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
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMFamilyAskToBuy requestID](self, "requestID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMFamilyAskToBuy eventTime](self, "eventTime");
  objc_msgSend(v3, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy userID](self, "userID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy actionUserID](self, "actionUserID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BMFamilyAskToBuyRequestStatusAsString(-[BMFamilyAskToBuy status](self, "status"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy itemTitle](self, "itemTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy itemDescription](self, "itemDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy itemLocalizedPrice](self, "itemLocalizedPrice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy thumbnailPath](self, "thumbnailPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMFamilyAskToBuy starRating](self, "starRating");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy productType](self, "productType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFamilyAskToBuy isActionUserDevice](self, "isActionUserDevice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy storeLink](self, "storeLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMFamilyAskToBuy with requestID: %@, eventTime: %@, userID: %@, actionUserID: %@, status: %@, itemTitle: %@, itemDescription: %@, itemLocalizedPrice: %@, thumbnailPath: %@, ageRating: %@, starRating: %@, productType: %@, isActionUserDevice: %@, storeLink: %@"), v21, v20, v19, v16, v15, v4, v5, v6, v7, v8, v10, v11, v12, v13);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFamilyAskToBuy *v5;
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
  uint64_t v22;
  unint64_t v23;
  double v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  float v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  void *v42;
  uint64_t v43;
  BMFamilyAskToBuy *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMFamilyAskToBuy;
  v5 = -[BMEventBase init](&v46, sel_init);
  if (!v5)
    goto LABEL_72;
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
          v21 = 32;
          goto LABEL_52;
        case 2u:
          v5->_hasEventTime = 1;
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(double *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0.0;
          }
          v43 = 40;
          goto LABEL_69;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_52;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_52;
        case 5u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v17 = v26++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_58:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v5->_status = v27;
          continue;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_52;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_52;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
          goto LABEL_52;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
          goto LABEL_52;
        case 0xAu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 96;
          goto LABEL_52;
        case 0xBu:
          v5->_hasStarRating = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v34 = *(float *)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v34 = 0.0;
          }
          v24 = v34;
          v43 = 104;
LABEL_69:
          *(double *)((char *)&v5->super.super.isa + v43) = v24;
          continue;
        case 0xCu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 112;
          goto LABEL_52;
        case 0xDu:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasIsActionUserDevice = 1;
          break;
        case 0xEu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 120;
LABEL_52:
          v42 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_71;
          continue;
      }
      while (1)
      {
        v38 = *v6;
        v39 = *(_QWORD *)&v4[v38];
        v40 = v39 + 1;
        if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
          break;
        v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
        *(_QWORD *)&v4[v38] = v40;
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0)
          goto LABEL_62;
        v35 += 7;
        v17 = v36++ >= 9;
        if (v17)
        {
          v37 = 0;
          goto LABEL_64;
        }
      }
      v4[*v8] = 1;
LABEL_62:
      if (v4[*v8])
        v37 = 0;
LABEL_64:
      v5->_isActionUserDevice = v37 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_71:
    v44 = 0;
  else
LABEL_72:
    v44 = v5;

  return v44;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_requestID)
    PBDataWriterWriteStringField();
  if (self->_hasEventTime)
    PBDataWriterWriteDoubleField();
  if (self->_userID)
    PBDataWriterWriteStringField();
  if (self->_actionUserID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_itemTitle)
    PBDataWriterWriteStringField();
  if (self->_itemDescription)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_itemLocalizedPrice)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_thumbnailPath)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_ageRating)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasStarRating)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsActionUserDevice)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_storeLink)
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
  -[BMFamilyAskToBuy writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFamilyAskToBuy)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  uint64_t v26;
  BMFamilyAskToBuy *v27;
  id v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id *v62;
  BMFamilyAskToBuy *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
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
  id v87;
  id *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  id v112;
  id *v113;
  id v114;
  BMFamilyAskToBuy *v115;
  uint64_t v116;
  uint64_t v117;
  BMFamilyAskToBuy *v118;
  BMFamilyAskToBuy *v119;
  id v120;
  id v121;
  id *v122;
  void *v123;
  id v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  _QWORD v152[3];

  v152[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v6;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v27 = 0;
          goto LABEL_80;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v97 = v8;
        v29 = a4;
        v30 = *MEMORY[0x1E0D025B8];
        v149 = *MEMORY[0x1E0CB2D50];
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("eventTime"));
        v150 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        v10 = 0;
        v27 = 0;
        *v29 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v30, 2, v11);
        v8 = v97;
        goto LABEL_79;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v11;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v104 = v9;
      v107 = v7;
      v21 = v10;
      v22 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v27 = 0;
          v10 = v21;
          v9 = v104;
          goto LABEL_79;
        }
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v119 = self;
        v34 = *MEMORY[0x1E0D025B8];
        v147 = *MEMORY[0x1E0CB2D50];
        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userID"));
        v148 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v34;
        v11 = v123;
        v32 = 0;
        v115 = 0;
        *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2, v36);
        v38 = v22;
        v39 = (id *)v35;
        v10 = v21;
        v9 = v104;
        v15 = v107;
        v40 = (void *)v36;
        self = v119;
        a4 = v39;
LABEL_78:

        v8 = v38;
        v7 = v15;
        v27 = v115;
LABEL_79:

        v6 = v124;
        goto LABEL_80;
      }
      v114 = v11;
      v10 = v21;
      v9 = v104;
    }
    else
    {
      v114 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionUserID"));
    v12 = objc_claimAutoreleasedReturnValue();
    v111 = (void *)v12;
    v122 = a4;
    if (v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = v7;
          v38 = v8;
          v40 = v13;
          if (!a4)
          {
            v115 = 0;
            v32 = v114;
            goto LABEL_78;
          }
          v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v41 = *MEMORY[0x1E0D025B8];
          v145 = *MEMORY[0x1E0CB2D50];
          v112 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("actionUserID"));
          v146 = v112;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = v41;
          v44 = (void *)v42;
          v113 = 0;
          v115 = 0;
          *v122 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v43, 2, v42);
          v32 = v114;
          goto LABEL_77;
        }
        v118 = self;
        v14 = v124;
        v15 = v7;
        v16 = v9;
        v17 = v10;
        v18 = v13;
LABEL_19:
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("status"));
        v19 = objc_claimAutoreleasedReturnValue();
        v113 = v18;
        v102 = (void *)v19;
        v110 = v17;
        if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v112 = v20;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v122)
              {
                v112 = 0;
                v115 = 0;
                v32 = v114;
                v44 = v20;
                v10 = v17;
                v9 = v16;
                v38 = v8;
                self = v118;
                goto LABEL_77;
              }
              v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v106 = v16;
              v79 = *MEMORY[0x1E0D025B8];
              v143 = *MEMORY[0x1E0CB2D50];
              v109 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("status"));
              v144 = v109;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
              self = v118;
              v9 = v106;
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = 0;
              v115 = 0;
              *v122 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
              v32 = v114;
              v44 = v20;
LABEL_76:
              v38 = v8;

              v10 = v110;
LABEL_77:

              a4 = v113;
              v40 = v111;
              goto LABEL_78;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFamilyAskToBuyRequestStatusFromString(v20));
            v112 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v112 = 0;
        }
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("itemTitle"));
        v45 = objc_claimAutoreleasedReturnValue();
        v108 = (void *)v45;
        if (v45)
        {
          v46 = (void *)v45;
          objc_opt_class();
          v9 = v16;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            v47 = v15;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v122)
              {
                v109 = 0;
                v115 = 0;
                v32 = v114;
                v44 = v102;
                self = v118;
                goto LABEL_76;
              }
              v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v71 = *MEMORY[0x1E0D025B8];
              v141 = *MEMORY[0x1E0CB2D50];
              v103 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemTitle"));
              v142 = v103;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
              self = v118;
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = 0;
              v109 = 0;
              *v122 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2);
              v32 = v114;
              v44 = v102;
              goto LABEL_75;
            }
            v109 = v46;
LABEL_43:
            v48 = v14;
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("itemDescription"));
            v49 = objc_claimAutoreleasedReturnValue();
            v101 = (void *)v49;
            if (v49 && (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  v103 = 0;
                  v115 = 0;
                  v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_75;
                }
                v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v73 = *MEMORY[0x1E0D025B8];
                v139 = *MEMORY[0x1E0CB2D50];
                v100 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemDescription"));
                v140 = v100;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
                self = v118;
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = 0;
                v103 = 0;
                *v122 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2);
                v32 = v114;
                v44 = v102;
LABEL_74:

LABEL_75:
                v15 = v47;

                goto LABEL_76;
              }
              v103 = v50;
            }
            else
            {
              v103 = 0;
            }
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("itemLocalizedPrice"));
            v51 = objc_claimAutoreleasedReturnValue();
            v99 = (void *)v51;
            if (v51 && (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  v100 = 0;
                  v115 = 0;
                  v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_74;
                }
                v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v75 = *MEMORY[0x1E0D025B8];
                v137 = *MEMORY[0x1E0CB2D50];
                v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemLocalizedPrice"));
                v138 = v96;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
                self = v118;
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = 0;
                v100 = 0;
                *v122 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2);
                v32 = v114;
                v44 = v102;
                goto LABEL_73;
              }
              v100 = v52;
            }
            else
            {
              v100 = 0;
            }
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("thumbnailPath"));
            v53 = objc_claimAutoreleasedReturnValue();
            v95 = (void *)v53;
            if (v53 && (v54 = (void *)v53, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  v96 = 0;
                  v115 = 0;
                  v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_73;
                }
                v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v77 = *MEMORY[0x1E0D025B8];
                v135 = *MEMORY[0x1E0CB2D50];
                v94 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("thumbnailPath"));
                v136 = v94;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
                self = v118;
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = 0;
                v96 = 0;
                *v122 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
                v32 = v114;
                v44 = v102;
LABEL_72:

LABEL_73:
                goto LABEL_74;
              }
              v96 = v54;
            }
            else
            {
              v96 = 0;
            }
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ageRating"));
            v55 = objc_claimAutoreleasedReturnValue();
            v93 = (void *)v55;
            if (v55 && (v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  v94 = 0;
                  v115 = 0;
                  v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_72;
                }
                v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v81 = *MEMORY[0x1E0D025B8];
                v133 = *MEMORY[0x1E0CB2D50];
                v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("ageRating"));
                v134 = v68;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
                self = v118;
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = 0;
                v94 = 0;
                *v122 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v81, 2);
                v32 = v114;
                v44 = v102;
                goto LABEL_71;
              }
              v94 = v56;
            }
            else
            {
              v94 = 0;
            }
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("starRating"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  v68 = 0;
                  v115 = 0;
                  v32 = v114;
                  v44 = v102;
                  self = v118;
                  goto LABEL_71;
                }
                v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v83 = *MEMORY[0x1E0D025B8];
                v131 = *MEMORY[0x1E0CB2D50];
                v92 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starRating"));
                v132 = v92;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
                self = v118;
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = 0;
                v68 = 0;
                *v122 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 2);
                v32 = v114;
                v44 = v102;
LABEL_70:

LABEL_71:
                goto LABEL_72;
              }
              v105 = v57;
            }
            else
            {
              v105 = 0;
            }
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("productType"));
            v58 = objc_claimAutoreleasedReturnValue();
            v91 = (void *)v58;
            if (v58 && (v59 = (void *)v58, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v122)
                {
                  v92 = 0;
                  v115 = 0;
                  v32 = v114;
                  v44 = v102;
                  self = v118;
                  v68 = v105;
                  goto LABEL_70;
                }
                v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v85 = *MEMORY[0x1E0D025B8];
                v129 = *MEMORY[0x1E0CB2D50];
                v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("productType"));
                v130 = v67;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = 0;
                v92 = 0;
                *v122 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 2, v60);
                goto LABEL_134;
              }
              v92 = v59;
            }
            else
            {
              v92 = 0;
            }
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("isActionUserDevice"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = v8;
            if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v61 = v47;
              v63 = v118;
              v62 = v122;
              v64 = 0;
              goto LABEL_64;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v61 = v47;
              v63 = v118;
              v62 = v122;
              v64 = v60;
LABEL_64:
              objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("storeLink"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              if (v65 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                v67 = v64;
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v47 = v61;
                  if (v62)
                  {
                    v88 = v62;
                    v121 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v117 = *MEMORY[0x1E0D025B8];
                    v125 = *MEMORY[0x1E0CB2D50];
                    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("storeLink"));
                    v126 = v89;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    *v88 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v117, 2, v90);

                  }
                  v66 = 0;
                  v115 = 0;
                  v68 = v105;
                  v8 = v98;
                  goto LABEL_68;
                }
                v66 = v65;
              }
              else
              {
                v66 = 0;
                v67 = v64;
              }
              v47 = v61;
              v68 = v105;
              v8 = v98;
              v63 = -[BMFamilyAskToBuy initWithRequestID:eventTime:userID:actionUserID:status:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:](v63, "initWithRequestID:eventTime:userID:actionUserID:status:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:", v98, v110, v114, v113, objc_msgSend(v112, "intValue"), v109, v103, v100, v96, v94, v105, v92, v67, v66);
              v115 = v63;
LABEL_68:
              v118 = v63;

              v11 = v123;
LABEL_69:

              v32 = v114;
              v44 = v102;
              self = v118;
              goto LABEL_70;
            }
            if (v122)
            {
              v63 = v118;
              v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v116 = *MEMORY[0x1E0D025B8];
              v127 = *MEMORY[0x1E0CB2D50];
              v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isActionUserDevice"));
              v128 = v66;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v116, 2, v65);
              v115 = 0;
              v67 = 0;
              *v122 = v87;
              v68 = v105;
              goto LABEL_68;
            }
            v67 = 0;
            v115 = 0;
LABEL_134:
            v68 = v105;
            goto LABEL_69;
          }
          v109 = 0;
        }
        else
        {
          v109 = 0;
          v9 = v16;
        }
        v47 = v15;
        goto LABEL_43;
      }
      v118 = self;
      v14 = v124;
    }
    else
    {
      v118 = self;
      v14 = v6;
    }
    v15 = v7;
    v16 = v9;
    v17 = v10;
    v18 = 0;
    goto LABEL_19;
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
    v27 = 0;
    goto LABEL_81;
  }
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = v6;
  v25 = a4;
  v26 = *MEMORY[0x1E0D025B8];
  v151 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("requestID"));
  v152[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v27 = 0;
  *v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v26, 2, v9);
  v6 = v24;
LABEL_80:

LABEL_81:
  return v27;
}

- (id)jsonDictionary
{
  uint64_t v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[14];
  _QWORD v53[16];

  v53[14] = *MEMORY[0x1E0C80C00];
  -[BMFamilyAskToBuy requestID](self, "requestID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!-[BMFamilyAskToBuy hasEventTime](self, "hasEventTime")
    || (-[BMFamilyAskToBuy eventTime](self, "eventTime"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMFamilyAskToBuy eventTime](self, "eventTime");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMFamilyAskToBuy eventTime](self, "eventTime");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  -[BMFamilyAskToBuy userID](self, "userID");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy actionUserID](self, "actionUserID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFamilyAskToBuy status](self, "status"));
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy itemTitle](self, "itemTitle");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy itemDescription](self, "itemDescription");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy itemLocalizedPrice](self, "itemLocalizedPrice");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy thumbnailPath](self, "thumbnailPath");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFamilyAskToBuy ageRating](self, "ageRating");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMFamilyAskToBuy hasStarRating](self, "hasStarRating")
    || (-[BMFamilyAskToBuy starRating](self, "starRating"), fabs(v11) == INFINITY))
  {
    v47 = 0;
  }
  else
  {
    -[BMFamilyAskToBuy starRating](self, "starRating");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[BMFamilyAskToBuy starRating](self, "starRating");
    objc_msgSend(v12, "numberWithDouble:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMFamilyAskToBuy productType](self, "productType");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMFamilyAskToBuy hasIsActionUserDevice](self, "hasIsActionUserDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFamilyAskToBuy isActionUserDevice](self, "isActionUserDevice"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[BMFamilyAskToBuy storeLink](self, "storeLink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = CFSTR("requestID");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v15;
  v53[0] = v15;
  v52[1] = CFSTR("eventTime");
  v16 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v16;
  v53[1] = v16;
  v52[2] = CFSTR("userID");
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v17;
  v53[2] = v17;
  v52[3] = CFSTR("actionUserID");
  v18 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v18;
  v53[3] = v18;
  v52[4] = CFSTR("status");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v19;
  v53[4] = v19;
  v52[5] = CFSTR("itemTitle");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v7;
  v35 = (void *)v20;
  v53[5] = v20;
  v52[6] = CFSTR("itemDescription");
  v21 = (uint64_t)v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v9;
  v53[6] = v21;
  v52[7] = CFSTR("itemLocalizedPrice");
  v22 = (uint64_t)v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v10;
  v53[7] = v22;
  v52[8] = CFSTR("thumbnailPath");
  v23 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53[8] = v23;
  v52[9] = CFSTR("ageRating");
  v24 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v22;
  v34 = (void *)v21;
  v42 = (void *)v6;
  v53[9] = v24;
  v52[10] = CFSTR("starRating");
  v25 = v47;
  if (!v47)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v22, v34, v35, v36, v37, v38, v39, v40);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v3;
  v53[10] = v25;
  v52[11] = CFSTR("productType");
  v27 = v46;
  if (!v46)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53[11] = v27;
  v52[12] = CFSTR("isActionUserDevice");
  v28 = v13;
  v29 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53[12] = v28;
  v52[13] = CFSTR("storeLink");
  v30 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53[13] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 14, v32);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (!v29)
  if (!v46)

  if (!v47)
  if (!v48)

  if (!v49)
  if (!v50)

  if (!v51)
  if (v43)
  {
    if (v44)
      goto LABEL_58;
  }
  else
  {

    if (v44)
    {
LABEL_58:
      if (v8)
        goto LABEL_59;
      goto LABEL_65;
    }
  }

  if (v8)
  {
LABEL_59:
    if (v45)
      goto LABEL_60;
    goto LABEL_66;
  }
LABEL_65:

  if (v45)
  {
LABEL_60:
    if (v42)
      goto LABEL_61;
LABEL_67:

    if (v26)
      goto LABEL_62;
LABEL_68:

    goto LABEL_62;
  }
LABEL_66:

  if (!v42)
    goto LABEL_67;
LABEL_61:
  if (!v26)
    goto LABEL_68;
LABEL_62:

  return v41;
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
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFamilyAskToBuy requestID](self, "requestID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFamilyAskToBuy requestID](self, "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_55;
    }
    if (-[BMFamilyAskToBuy hasEventTime](self, "hasEventTime") || objc_msgSend(v5, "hasEventTime"))
    {
      if (!-[BMFamilyAskToBuy hasEventTime](self, "hasEventTime"))
        goto LABEL_55;
      if (!objc_msgSend(v5, "hasEventTime"))
        goto LABEL_55;
      -[BMFamilyAskToBuy eventTime](self, "eventTime");
      v14 = v13;
      objc_msgSend(v5, "eventTime");
      if (v14 != v15)
        goto LABEL_55;
    }
    -[BMFamilyAskToBuy userID](self, "userID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMFamilyAskToBuy userID](self, "userID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_55;
    }
    -[BMFamilyAskToBuy actionUserID](self, "actionUserID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionUserID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[BMFamilyAskToBuy actionUserID](self, "actionUserID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionUserID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_55;
    }
    v28 = -[BMFamilyAskToBuy status](self, "status");
    if (v28 == objc_msgSend(v5, "status"))
    {
      -[BMFamilyAskToBuy itemTitle](self, "itemTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemTitle");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v29 == (void *)v30)
      {

      }
      else
      {
        v31 = (void *)v30;
        -[BMFamilyAskToBuy itemTitle](self, "itemTitle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "itemTitle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        if (!v34)
          goto LABEL_55;
      }
      -[BMFamilyAskToBuy itemDescription](self, "itemDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemDescription");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v35 == (void *)v36)
      {

      }
      else
      {
        v37 = (void *)v36;
        -[BMFamilyAskToBuy itemDescription](self, "itemDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "itemDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqual:", v39);

        if (!v40)
          goto LABEL_55;
      }
      -[BMFamilyAskToBuy itemLocalizedPrice](self, "itemLocalizedPrice");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemLocalizedPrice");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v41 == (void *)v42)
      {

      }
      else
      {
        v43 = (void *)v42;
        -[BMFamilyAskToBuy itemLocalizedPrice](self, "itemLocalizedPrice");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "itemLocalizedPrice");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v44, "isEqual:", v45);

        if (!v46)
          goto LABEL_55;
      }
      -[BMFamilyAskToBuy thumbnailPath](self, "thumbnailPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "thumbnailPath");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v47 == (void *)v48)
      {

      }
      else
      {
        v49 = (void *)v48;
        -[BMFamilyAskToBuy thumbnailPath](self, "thumbnailPath");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "thumbnailPath");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v50, "isEqual:", v51);

        if (!v52)
          goto LABEL_55;
      }
      -[BMFamilyAskToBuy ageRating](self, "ageRating");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ageRating");
      v54 = objc_claimAutoreleasedReturnValue();
      if (v53 == (void *)v54)
      {

      }
      else
      {
        v55 = (void *)v54;
        -[BMFamilyAskToBuy ageRating](self, "ageRating");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ageRating");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "isEqual:", v57);

        if (!v58)
          goto LABEL_55;
      }
      if (-[BMFamilyAskToBuy hasStarRating](self, "hasStarRating") || objc_msgSend(v5, "hasStarRating"))
      {
        if (!-[BMFamilyAskToBuy hasStarRating](self, "hasStarRating"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasStarRating"))
          goto LABEL_55;
        -[BMFamilyAskToBuy starRating](self, "starRating");
        v60 = v59;
        objc_msgSend(v5, "starRating");
        if (v60 != v61)
          goto LABEL_55;
      }
      -[BMFamilyAskToBuy productType](self, "productType");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "productType");
      v63 = objc_claimAutoreleasedReturnValue();
      if (v62 == (void *)v63)
      {

      }
      else
      {
        v64 = (void *)v63;
        -[BMFamilyAskToBuy productType](self, "productType");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "productType");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "isEqual:", v66);

        if (!v67)
          goto LABEL_55;
      }
      if (!-[BMFamilyAskToBuy hasIsActionUserDevice](self, "hasIsActionUserDevice")
        && !objc_msgSend(v5, "hasIsActionUserDevice")
        || -[BMFamilyAskToBuy hasIsActionUserDevice](self, "hasIsActionUserDevice")
        && objc_msgSend(v5, "hasIsActionUserDevice")
        && (v68 = -[BMFamilyAskToBuy isActionUserDevice](self, "isActionUserDevice"),
            v68 == objc_msgSend(v5, "isActionUserDevice")))
      {
        -[BMFamilyAskToBuy storeLink](self, "storeLink");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "storeLink");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70 == v71)
        {
          v12 = 1;
        }
        else
        {
          -[BMFamilyAskToBuy storeLink](self, "storeLink");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "storeLink");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v72, "isEqual:", v73);

        }
        goto LABEL_56;
      }
    }
LABEL_55:
    v12 = 0;
LABEL_56:

    goto LABEL_57;
  }
  v12 = 0;
LABEL_57:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (double)eventTime
{
  return self->_eventTime;
}

- (BOOL)hasEventTime
{
  return self->_hasEventTime;
}

- (void)setHasEventTime:(BOOL)a3
{
  self->_hasEventTime = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)actionUserID
{
  return self->_actionUserID;
}

- (int)status
{
  return self->_status;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)itemLocalizedPrice
{
  return self->_itemLocalizedPrice;
}

- (NSString)thumbnailPath
{
  return self->_thumbnailPath;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (double)starRating
{
  return self->_starRating;
}

- (BOOL)hasStarRating
{
  return self->_hasStarRating;
}

- (void)setHasStarRating:(BOOL)a3
{
  self->_hasStarRating = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (BOOL)hasIsActionUserDevice
{
  return self->_hasIsActionUserDevice;
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  self->_hasIsActionUserDevice = a3;
}

- (NSString)storeLink
{
  return self->_storeLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeLink, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_thumbnailPath, 0);
  objc_storeStrong((id *)&self->_itemLocalizedPrice, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_actionUserID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 2)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMFamilyAskToBuy initByReadFrom:]([BMFamilyAskToBuy alloc], "initByReadFrom:", v6);
    v7[5] = 2;

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestID"), 2, 0, 1, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventTime"), 1, 0, 2, 0, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userID"), 2, 0, 3, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionUserID"), 2, 0, 4, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("status"), 0, 0, 5, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemTitle"), 2, 0, 6, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemDescription"), 2, 0, 7, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemLocalizedPrice"), 2, 0, 8, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("thumbnailPath"), 2, 0, 9, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ageRating"), 2, 0, 10, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starRating"), 1, 0, 11, 1, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("productType"), 2, 0, 12, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActionUserDevice"), 0, 0, 13, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("storeLink"), 2, 0, 14, 13, 0);
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
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
  return &unk_1E5F1BE50;
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
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestID"), 1, 13, 0);
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventTime"), 2, 0, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userID"), 3, 13, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionUserID"), 4, 13, 0);
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("status"), 5, 4, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemTitle"), 6, 13, 0);
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemDescription"), 7, 13, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemLocalizedPrice"), 8, 13, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("thumbnailPath"), 9, 13, 0);
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ageRating"), 10, 13, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starRating"), 11, 1, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("productType"), 12, 13, 0);
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActionUserDevice"), 13, 12, 0);
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("storeLink"), 14, 13, 0);
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
