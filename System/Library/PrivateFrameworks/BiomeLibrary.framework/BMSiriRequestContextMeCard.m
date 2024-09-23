@implementation BMSiriRequestContextMeCard

- (BMSiriRequestContextMeCard)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 nickName:(id)a6 fullName:(id)a7 addresses:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMSiriRequestContextMeCard *v18;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v20 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMSiriRequestContextMeCard;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_givenName, a3);
    objc_storeStrong((id *)&v18->_middleName, a4);
    objc_storeStrong((id *)&v18->_familyName, a5);
    objc_storeStrong((id *)&v18->_nickName, a6);
    objc_storeStrong((id *)&v18->_fullName, a7);
    objc_storeStrong((id *)&v18->_addresses, a8);
  }

  return v18;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriRequestContextMeCard givenName](self, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard middleName](self, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard familyName](self, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard nickName](self, "nickName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard fullName](self, "fullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard addresses](self, "addresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRequestContextMeCard with givenName: %@, middleName: %@, familyName: %@, nickName: %@, fullName: %@, addresses: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRequestContextMeCard *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSArray *addresses;
  int v28;
  BMSiriRequestContextMeCard *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMSiriRequestContextMeCard;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
  {
LABEL_35:
    v29 = v5;
    goto LABEL_36;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_33:
    v26 = objc_msgSend(v6, "copy");
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v26;

    v28 = v4[*v9];
    if (v28)
      goto LABEL_34;
    goto LABEL_35;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_33;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v7;
      v15 = *(_QWORD *)&v4[v14];
      v16 = v15 + 1;
      if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
        break;
      v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
      *(_QWORD *)&v4[v14] = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0)
        goto LABEL_13;
      v11 += 7;
      if (v12++ >= 9)
      {
        v13 = 0;
        v19 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    v19 = v4[*v9];
    if (v4[*v9])
      v13 = 0;
LABEL_15:
    if (v19 || (v13 & 7) == 4)
      goto LABEL_33;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 24;
        goto LABEL_27;
      case 2u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 32;
        goto LABEL_27;
      case 3u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 40;
        goto LABEL_27;
      case 4u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 48;
        goto LABEL_27;
      case 5u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 56;
LABEL_27:
        v23 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_28;
      case 6u:
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_37;
        v24 = -[BMSiriRequestContextAddress initByReadFrom:]([BMSiriRequestContextAddress alloc], "initByReadFrom:", v4);
        if (!v24)
          goto LABEL_37;
        v25 = v24;
        objc_msgSend(v6, "addObject:", v24);
        PBReaderRecallMark();

        goto LABEL_28;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_28:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_33;
          continue;
        }
LABEL_37:

LABEL_34:
        v29 = 0;
LABEL_36:

        return v29;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_givenName)
    PBDataWriterWriteStringField();
  if (self->_middleName)
    PBDataWriterWriteStringField();
  if (self->_familyName)
    PBDataWriterWriteStringField();
  if (self->_nickName)
    PBDataWriterWriteStringField();
  if (self->_fullName)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_addresses;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRequestContextMeCard writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRequestContextMeCard)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  BMSiriRequestContextAddress *v26;
  BMSiriRequestContextAddress *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  BMSiriRequestContextMeCard *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id *v39;
  id *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  id v77;
  id *v78;
  id *v79;
  id v80;
  uint64_t v81;
  void *v82;
  id *v83;
  uint64_t *v84;
  void *v85;
  void *v86;
  id v88;
  uint64_t v89;
  id *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id *v96;
  BMSiriRequestContextMeCard *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  id v117;
  _BYTE v118[128];
  uint64_t v119;
  void *v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  _QWORD v130[3];

  v130[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("givenName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0D025B8];
        v129 = *MEMORY[0x1E0CB2D50];
        v33 = self;
        v34 = objc_alloc(MEMORY[0x1E0CB3940]);
        v92 = objc_opt_class();
        v35 = v34;
        self = v33;
        v29 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v92, CFSTR("givenName"));
        v130[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, &v129, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v31;
        v9 = (void *)v36;
        v38 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v32, 2, v36);
        v39 = p_isa;
        p_isa = 0;
        v8 = 0;
        *v39 = v38;
        goto LABEL_69;
      }
      v8 = 0;
      goto LABEL_70;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("middleName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v40 = p_isa;
        v41 = v9;
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = v8;
        v44 = *MEMORY[0x1E0D025B8];
        v127 = *MEMORY[0x1E0CB2D50];
        v45 = v7;
        v46 = objc_alloc(MEMORY[0x1E0CB3940]);
        v93 = objc_opt_class();
        v47 = v46;
        v7 = v45;
        v30 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v93, CFSTR("middleName"));
        v128 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v42;
        v9 = v41;
        v50 = v44;
        v8 = v43;
        v108 = (void *)v48;
        p_isa = 0;
        v29 = 0;
        *v40 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2);
        goto LABEL_68;
      }
      v29 = 0;
      goto LABEL_69;
    }
    v106 = v9;
  }
  else
  {
    v106 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familyName"));
  v10 = objc_claimAutoreleasedReturnValue();
  v108 = (void *)v10;
  if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v51 = p_isa;
        v52 = v9;
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v54 = v8;
        v55 = *MEMORY[0x1E0D025B8];
        v125 = *MEMORY[0x1E0CB2D50];
        v56 = v7;
        v57 = objc_alloc(MEMORY[0x1E0CB3940]);
        v94 = objc_opt_class();
        v58 = v57;
        v7 = v56;
        v107 = (id)objc_msgSend(v58, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v94, CFSTR("familyName"));
        v126 = v107;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v53;
        v9 = v52;
        v61 = v55;
        v8 = v54;
        v105 = (void *)v59;
        p_isa = 0;
        v30 = 0;
        *v51 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        v29 = v106;
        goto LABEL_67;
      }
      v30 = 0;
      v29 = v106;
      goto LABEL_68;
    }
    v103 = v11;
  }
  else
  {
    v103 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nickName"));
  v12 = objc_claimAutoreleasedReturnValue();
  v105 = (void *)v12;
  if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        v107 = 0;
        v29 = v106;
        v30 = v103;
        goto LABEL_67;
      }
      v62 = p_isa;
      v63 = v9;
      v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v65 = v8;
      v66 = *MEMORY[0x1E0D025B8];
      v123 = *MEMORY[0x1E0CB2D50];
      v67 = v7;
      v68 = objc_alloc(MEMORY[0x1E0CB3940]);
      v95 = objc_opt_class();
      v69 = v68;
      v7 = v67;
      v104 = (id)objc_msgSend(v69, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v95, CFSTR("nickName"));
      v124 = v104;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = v64;
      v9 = v63;
      v72 = v66;
      v8 = v65;
      v102 = (void *)v70;
      p_isa = 0;
      v107 = 0;
      *v62 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2);
      goto LABEL_78;
    }
    v99 = v9;
    v107 = v13;
  }
  else
  {
    v99 = v9;
    v107 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullName"));
  v14 = objc_claimAutoreleasedReturnValue();
  v100 = v7;
  v101 = v8;
  v102 = (void *)v14;
  if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v104 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (p_isa)
    {
      v73 = v7;
      v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v75 = *MEMORY[0x1E0D025B8];
      v121 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fullName"));
      v122 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v74;
      v7 = v73;
      v77 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v75, 2, v19);
      v78 = p_isa;
      p_isa = 0;
      v104 = 0;
      *v78 = v77;
LABEL_62:
      v29 = v106;
      goto LABEL_63;
    }
    v104 = 0;
    v9 = v99;
LABEL_78:
    v29 = v106;
    v30 = v103;
    goto LABEL_66;
  }
  v104 = v15;
LABEL_16:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("addresses"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if (!v18)
  {
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v96 = p_isa;
      v97 = self;
      v98 = v6;
      goto LABEL_27;
    }
    v29 = v106;
    if (!p_isa)
    {
      v7 = v100;
      v30 = v103;
      goto LABEL_65;
    }
    v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v89 = *MEMORY[0x1E0D025B8];
    v119 = *MEMORY[0x1E0CB2D50];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("addresses"));
    v120 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
    v90 = p_isa;
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    *v90 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2, v91);

    p_isa = 0;
    v7 = v100;
LABEL_63:
    v30 = v103;
    goto LABEL_64;
  }
  v96 = p_isa;
  v97 = self;
  v98 = v6;

  v16 = 0;
LABEL_27:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v16 = v16;
  v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
  if (!v20)
    goto LABEL_37;
  v21 = v20;
  v22 = *(_QWORD *)v111;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v111 != v22)
        objc_enumerationMutation(v16);
      v24 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self = v97;
        v6 = v98;
        v7 = v100;
        v79 = v96;
        if (v96)
        {
          v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v81 = *MEMORY[0x1E0D025B8];
          v116 = *MEMORY[0x1E0CB2D50];
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("addresses"));
          v117 = v25;
          v82 = (void *)MEMORY[0x1E0C99D80];
          v83 = &v117;
          v84 = &v116;
LABEL_56:
          objc_msgSend(v82, "dictionaryWithObjects:forKeys:count:", v83, v84, 1);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v80;
          v7 = v100;
          *v79 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v81, 2, v85);
LABEL_60:

        }
LABEL_61:

        p_isa = 0;
        goto LABEL_62;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v97;
        v6 = v98;
        v7 = v100;
        v79 = v96;
        if (v96)
        {
          v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v81 = *MEMORY[0x1E0D025B8];
          v114 = *MEMORY[0x1E0CB2D50];
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("addresses"));
          v115 = v25;
          v82 = (void *)MEMORY[0x1E0C99D80];
          v83 = &v115;
          v84 = &v114;
          goto LABEL_56;
        }
        goto LABEL_61;
      }
      v25 = v24;
      v26 = [BMSiriRequestContextAddress alloc];
      v109 = 0;
      v27 = -[BMSiriRequestContextAddress initWithJSONDictionary:error:](v26, "initWithJSONDictionary:error:", v25, &v109);
      v28 = v109;
      if (v28)
      {
        v85 = v28;
        if (v96)
          *v96 = objc_retainAutorelease(v28);

        self = v97;
        v6 = v98;
        v7 = v100;
        goto LABEL_60;
      }
      objc_msgSend(v19, "addObject:", v27);

    }
    v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
    if (v21)
      continue;
    break;
  }
LABEL_37:

  v29 = v106;
  v30 = v103;
  self = -[BMSiriRequestContextMeCard initWithGivenName:middleName:familyName:nickName:fullName:addresses:](v97, "initWithGivenName:middleName:familyName:nickName:fullName:addresses:", v101, v106, v103, v107, v104, v19);
  p_isa = (id *)&self->super.super.isa;
  v6 = v98;
  v7 = v100;
LABEL_64:

LABEL_65:
  v8 = v101;
  v9 = v99;
LABEL_66:

LABEL_67:
LABEL_68:

LABEL_69:
LABEL_70:

  return (BMSiriRequestContextMeCard *)p_isa;
}

- (id)_addressesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMSiriRequestContextMeCard addresses](self, "addresses", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  -[BMSiriRequestContextMeCard givenName](self, "givenName");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard middleName](self, "middleName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard familyName](self, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard nickName](self, "nickName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard fullName](self, "fullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextMeCard _addressesJSONArray](self, "_addressesJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("givenName");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = CFSTR("middleName");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("familyName");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("nickName");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("fullName");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("addresses");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_15;
LABEL_21:

    if (v6)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v7)
    goto LABEL_21;
LABEL_15:
  if (v6)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v5)
  {
    if (v4)
      goto LABEL_18;
LABEL_24:

    if (v20)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v4)
    goto LABEL_24;
LABEL_18:
  if (!v20)
    goto LABEL_25;
LABEL_19:

  return v15;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriRequestContextMeCard givenName](self, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "givenName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriRequestContextMeCard givenName](self, "givenName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "givenName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMSiriRequestContextMeCard middleName](self, "middleName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "middleName");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriRequestContextMeCard middleName](self, "middleName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "middleName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMSiriRequestContextMeCard familyName](self, "familyName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "familyName");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriRequestContextMeCard familyName](self, "familyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "familyName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    -[BMSiriRequestContextMeCard nickName](self, "nickName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nickName");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriRequestContextMeCard nickName](self, "nickName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nickName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_21;
    }
    -[BMSiriRequestContextMeCard fullName](self, "fullName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullName");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSiriRequestContextMeCard fullName](self, "fullName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
      {
LABEL_21:
        v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    -[BMSiriRequestContextMeCard addresses](self, "addresses");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addresses");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriRequestContextMeCard addresses](self, "addresses");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addresses");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v40, "isEqual:", v41);

    }
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
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

    v4 = -[BMSiriRequestContextMeCard initByReadFrom:]([BMSiriRequestContextMeCard alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("givenName"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("middleName"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("familyName"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nickName"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fullName"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("addresses_json"), 5, 1, &__block_literal_global_210_37939);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CD38;
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("givenName"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("middleName"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("familyName"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nickName"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fullName"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("addresses"), 6, 14, objc_opt_class());
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __37__BMSiriRequestContextMeCard_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_addressesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
