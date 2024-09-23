@implementation BMLocationMicroLocationVisit

- (BMLocationMicroLocationVisit)initWithDomain:(id)a3 maxProbabilityMicroLocationIdentifier:(id)a4 maxProbability:(id)a5 probabilityVector:(id)a6 isStable:(id)a7 numDevicesVector:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMLocationMicroLocationVisit *v20;
  double v21;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMLocationMicroLocationVisit;
  v20 = -[BMEventBase init](&v24, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_domain, a3);
    objc_storeStrong((id *)&v20->_maxProbabilityMicroLocationIdentifier, a4);
    if (v16)
    {
      v20->_hasMaxProbability = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v20->_hasMaxProbability = 0;
      v21 = -1.0;
    }
    v20->_maxProbability = v21;
    objc_storeStrong((id *)&v20->_probabilityVector, a6);
    if (v18)
    {
      v20->_hasIsStable = 1;
      v20->_isStable = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v20->_hasIsStable = 0;
      v20->_isStable = 0;
    }
    objc_storeStrong((id *)&v20->_numDevicesVector, a8);
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMLocationMicroLocationVisit domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationMicroLocationVisit maxProbabilityMicroLocationIdentifier](self, "maxProbabilityMicroLocationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationMicroLocationVisit maxProbability](self, "maxProbability");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationMicroLocationVisit probabilityVector](self, "probabilityVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLocationMicroLocationVisit isStable](self, "isStable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationMicroLocationVisit numDevicesVector](self, "numDevicesVector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationMicroLocationVisit with domain: %@, maxProbabilityMicroLocationIdentifier: %@, maxProbability: %@, probabilityVector: %@, isStable: %@, numDevicesVector: %@"), v4, v5, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationMicroLocationVisit *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  id v38;
  uint64_t v39;
  NSArray *probabilityVector;
  uint64_t v41;
  NSArray *numDevicesVector;
  int v43;
  BMLocationMicroLocationVisit *v44;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMLocationMicroLocationVisit;
  v5 = -[BMEventBase init](&v46, sel_init);
  if (!v5)
    goto LABEL_51;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v10])
        break;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v8;
        v16 = *(_QWORD *)&v4[v15];
        v17 = v16 + 1;
        if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        v19 = v13++ >= 9;
        if (v19)
        {
          v14 = 0;
          v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = v4[*v10];
      if (v4[*v10])
        v14 = 0;
LABEL_15:
      if (v20 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 24;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 32;
LABEL_24:
          v24 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 3u:
          v5->_hasMaxProbability = 1;
          v25 = *v8;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v27 = *(double *)(*(_QWORD *)&v4[*v11] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v27 = 0.0;
          }
          v5->_maxProbability = v27;
          continue;
        case 4u:
          v47 = 0;
          v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_53;
          v28 = -[BMLocationMicroLocationVisitProbabilityPerLocation initByReadFrom:]([BMLocationMicroLocationVisitProbabilityPerLocation alloc], "initByReadFrom:", v4);
          if (!v28)
            goto LABEL_53;
          v29 = v28;
          v30 = v6;
          goto LABEL_41;
        case 5u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasIsStable = 1;
          break;
        case 6u:
          v47 = 0;
          v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_53;
          v38 = -[BMLocationMicroLocationVisitNumDevicesPerTechnology initByReadFrom:]([BMLocationMicroLocationVisitNumDevicesPerTechnology alloc], "initByReadFrom:", v4);
          if (!v38)
            goto LABEL_53;
          v29 = v38;
          v30 = v7;
LABEL_41:
          objc_msgSend(v30, "addObject:", v29);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_53:

          goto LABEL_50;
      }
      while (1)
      {
        v34 = *v8;
        v35 = *(_QWORD *)&v4[v34];
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)&v4[*v9])
          break;
        v37 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v35);
        *(_QWORD *)&v4[v34] = v36;
        v33 |= (unint64_t)(v37 & 0x7F) << v31;
        if ((v37 & 0x80) == 0)
          goto LABEL_43;
        v31 += 7;
        v19 = v32++ >= 9;
        if (v19)
        {
          v33 = 0;
          goto LABEL_45;
        }
      }
      v4[*v10] = 1;
LABEL_43:
      if (v4[*v10])
        v33 = 0;
LABEL_45:
      v5->_isStable = v33 != 0;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v39 = objc_msgSend(v6, "copy");
  probabilityVector = v5->_probabilityVector;
  v5->_probabilityVector = (NSArray *)v39;

  v41 = objc_msgSend(v7, "copy");
  numDevicesVector = v5->_numDevicesVector;
  v5->_numDevicesVector = (NSArray *)v41;

  v43 = v4[*v10];
  if (v43)
LABEL_50:
    v44 = 0;
  else
LABEL_51:
    v44 = v5;

  return v44;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_maxProbabilityMicroLocationIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasMaxProbability)
    PBDataWriterWriteDoubleField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_probabilityVector;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  if (self->_hasIsStable)
    PBDataWriterWriteBOOLField();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_numDevicesVector;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (_QWORD)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v13);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationMicroLocationVisit writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationMicroLocationVisit)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  BMLocationMicroLocationVisitProbabilityPerLocation *v20;
  BMLocationMicroLocationVisitProbabilityPerLocation *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  BMLocationMicroLocationVisit *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id *v47;
  uint64_t *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  id v61;
  BMLocationMicroLocationVisitNumDevicesPerTechnology *v62;
  BMLocationMicroLocationVisitNumDevicesPerTechnology *v63;
  id v64;
  uint64_t v65;
  id v66;
  id *v67;
  id v68;
  BMLocationMicroLocationVisit *v69;
  uint64_t v70;
  void *v71;
  id *v72;
  uint64_t *v73;
  void *v74;
  uint64_t v75;
  id v77;
  BMLocationMicroLocationVisit *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  id *v87;
  void *v88;
  void *v90;
  void *v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  id v105;
  _BYTE v106[128];
  uint64_t v107;
  void *v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  _BYTE v115[128];
  uint64_t v116;
  void *v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  _QWORD v123[3];

  v123[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v122 = *MEMORY[0x1E0CB2D50];
        v29 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domain"));
        v123[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, &v122, 1);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v28;
        v8 = (void *)v30;
        v32 = 0;
        v7 = 0;
        *a4 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v31, 2, v30);
        goto LABEL_98;
      }
      v32 = 0;
      v7 = 0;
      goto LABEL_99;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxProbabilityMicroLocationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = a4;
      if (a4)
      {
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = v8;
        v35 = *MEMORY[0x1E0D025B8];
        v120 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("maxProbabilityMicroLocationIdentifier"));
        v121 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v35;
        v8 = v34;
        v88 = (void *)v36;
        v32 = 0;
        v29 = 0;
        *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2);
        goto LABEL_97;
      }
      v32 = 0;
      goto LABEL_98;
    }
    v87 = v8;
  }
  else
  {
    v87 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxProbability"));
  v9 = objc_claimAutoreleasedReturnValue();
  v85 = v6;
  v86 = v7;
  v88 = (void *)v9;
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = v8;
        v40 = *MEMORY[0x1E0D025B8];
        v118 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("maxProbability"));
        v119 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v40;
        v8 = v39;
        v91 = (void *)v41;
        v32 = 0;
        v23 = 0;
        *a4 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v42, 2);
        v29 = v87;

        goto LABEL_96;
      }
      v23 = 0;
      v32 = 0;
      v29 = v87;
      goto LABEL_97;
    }
    v84 = v10;
  }
  else
  {
    v84 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("probabilityVector"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  v82 = v8;
  v83 = v5;
  if (v13)
  {
    v78 = self;

    v11 = 0;
  }
  else
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v29 = v87;
          v23 = v84;
          goto LABEL_96;
        }
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v116 = *MEMORY[0x1E0CB2D50];
        v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("probabilityVector"));
        v117 = v90;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        *a4 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v49);
        goto LABEL_71;
      }
    }
    v78 = self;
  }
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v11 = v11;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v99 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (a4)
          {
            v43 = a4;
            v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v45 = *MEMORY[0x1E0D025B8];
            v113 = *MEMORY[0x1E0CB2D50];
            v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("probabilityVector"));
            v114 = v19;
            v46 = (void *)MEMORY[0x1E0C99D80];
            v47 = &v114;
            v48 = &v113;
            goto LABEL_46;
          }
LABEL_70:
          v32 = 0;
          v49 = v11;
          v5 = v83;
          self = v78;
LABEL_71:
          v29 = v87;
          v23 = v84;
          goto LABEL_94;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v43 = a4;
          if (!a4)
            goto LABEL_70;
          v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v45 = *MEMORY[0x1E0D025B8];
          v111 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("probabilityVector"));
          v112 = v19;
          v46 = (void *)MEMORY[0x1E0C99D80];
          v47 = &v112;
          v48 = &v111;
LABEL_46:
          objc_msgSend(v46, "dictionaryWithObjects:forKeys:count:", v47, v48, 1);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          *v43 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2, v24);
LABEL_50:
          v49 = v11;
          v5 = v83;
          v23 = v84;
          self = v78;
LABEL_51:
          v29 = v87;
          goto LABEL_92;
        }
        v19 = v18;
        v20 = [BMLocationMicroLocationVisitProbabilityPerLocation alloc];
        v97 = 0;
        v21 = -[BMLocationMicroLocationVisitProbabilityPerLocation initWithJSONDictionary:error:](v20, "initWithJSONDictionary:error:", v19, &v97);
        v22 = v97;
        if (v22)
        {
          v24 = v22;
          if (a4)
            *a4 = objc_retainAutorelease(v22);

          v32 = 0;
          goto LABEL_50;
        }
        objc_msgSend(v90, "addObject:", v21);

      }
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
    }
    while (v15);
  }

  v5 = v83;
  objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("isStable"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v84;
  if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v49 = 0;
        v32 = 0;
        self = v78;
        v29 = v87;
        goto LABEL_93;
      }
      v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v65 = *MEMORY[0x1E0D025B8];
      v109 = *MEMORY[0x1E0CB2D50];
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isStable"));
      v110 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v65, 2, v53);
      v32 = 0;
      v49 = 0;
      *a4 = v66;
      self = v78;
      goto LABEL_80;
    }
    v77 = v19;
  }
  else
  {
    v77 = 0;
  }
  objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("numDevicesVector"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  if (v26)
  {

    v24 = 0;
LABEL_58:
    v49 = v77;
    goto LABEL_59;
  }
  if (!v24)
    goto LABEL_58;
  objc_opt_class();
  v49 = v77;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    self = v78;
    if (!a4)
    {
      v32 = 0;
      goto LABEL_51;
    }
    v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v52 = *MEMORY[0x1E0D025B8];
    v107 = *MEMORY[0x1E0CB2D50];
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("numDevicesVector"));
    v108 = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v52;
    v49 = v77;
    *a4 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v55, 2, v54);

    v32 = 0;
LABEL_80:
    v29 = v87;
    goto LABEL_91;
  }
LABEL_59:
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v24 = v24;
  v56 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
  if (!v56)
    goto LABEL_69;
  v57 = v56;
  v58 = *(_QWORD *)v94;
  v80 = v53;
  while (2)
  {
    for (j = 0; j != v57; ++j)
    {
      if (*(_QWORD *)v94 != v58)
        objc_enumerationMutation(v24);
      v60 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v83;
        self = v78;
        v29 = v87;
        v67 = a4;
        if (a4)
        {
          v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = v78;
          v70 = *MEMORY[0x1E0D025B8];
          v104 = *MEMORY[0x1E0CB2D50];
          v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("numDevicesVector"));
          v105 = v61;
          v71 = (void *)MEMORY[0x1E0C99D80];
          v72 = &v105;
          v73 = &v104;
LABEL_85:
          objc_msgSend(v71, "dictionaryWithObjects:forKeys:count:", v72, v73, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v70;
          self = v69;
          v29 = v87;
          *v67 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v75, 2, v74);
LABEL_89:

        }
LABEL_90:

        v32 = 0;
        v23 = v84;
        v49 = v77;
        v53 = v80;
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = v83;
        self = v78;
        v29 = v87;
        v67 = a4;
        if (a4)
        {
          v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = v78;
          v70 = *MEMORY[0x1E0D025B8];
          v102 = *MEMORY[0x1E0CB2D50];
          v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("numDevicesVector"));
          v103 = v61;
          v71 = (void *)MEMORY[0x1E0C99D80];
          v72 = &v103;
          v73 = &v102;
          goto LABEL_85;
        }
        goto LABEL_90;
      }
      v61 = v60;
      v62 = [BMLocationMicroLocationVisitNumDevicesPerTechnology alloc];
      v92 = 0;
      v63 = -[BMLocationMicroLocationVisitNumDevicesPerTechnology initWithJSONDictionary:error:](v62, "initWithJSONDictionary:error:", v61, &v92);
      v64 = v92;
      if (v64)
      {
        v74 = v64;
        if (a4)
          *a4 = objc_retainAutorelease(v64);

        v5 = v83;
        self = v78;
        v29 = v87;
        goto LABEL_89;
      }
      objc_msgSend(v80, "addObject:", v63);

    }
    v57 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
    v23 = v84;
    v49 = v77;
    v53 = v80;
    if (v57)
      continue;
    break;
  }
LABEL_69:

  v29 = v87;
  self = -[BMLocationMicroLocationVisit initWithDomain:maxProbabilityMicroLocationIdentifier:maxProbability:probabilityVector:isStable:numDevicesVector:](v78, "initWithDomain:maxProbabilityMicroLocationIdentifier:maxProbability:probabilityVector:isStable:numDevicesVector:", v86, v87, v23, v90, v49, v53);
  v32 = self;
  v5 = v83;
LABEL_91:

LABEL_92:
LABEL_93:

LABEL_94:
  v8 = v82;

LABEL_96:
  v6 = v85;
  v7 = v86;
LABEL_97:

LABEL_98:
LABEL_99:

  return v32;
}

- (id)_probabilityVectorJSONArray
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
  -[BMLocationMicroLocationVisit probabilityVector](self, "probabilityVector", 0);
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

- (id)_numDevicesVectorJSONArray
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
  -[BMLocationMicroLocationVisit numDevicesVector](self, "numDevicesVector", 0);
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
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  -[BMLocationMicroLocationVisit domain](self, "domain");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMLocationMicroLocationVisit maxProbabilityMicroLocationIdentifier](self, "maxProbabilityMicroLocationIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[BMLocationMicroLocationVisit hasMaxProbability](self, "hasMaxProbability")
    || (-[BMLocationMicroLocationVisit maxProbability](self, "maxProbability"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMLocationMicroLocationVisit maxProbability](self, "maxProbability");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationMicroLocationVisit maxProbability](self, "maxProbability");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMLocationMicroLocationVisit _probabilityVectorJSONArray](self, "_probabilityVectorJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMLocationMicroLocationVisit hasIsStable](self, "hasIsStable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLocationMicroLocationVisit isStable](self, "isStable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[BMLocationMicroLocationVisit _numDevicesVectorJSONArray](self, "_numDevicesVectorJSONArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("domain");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v11;
  v21 = (void *)v4;
  v24[0] = v11;
  v23[1] = CFSTR("maxProbabilityMicroLocationIdentifier");
  v12 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v12;
  v23[2] = CFSTR("maxProbability");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v3;
  v24[2] = v13;
  v23[3] = CFSTR("probabilityVector");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v14;
  v23[4] = CFSTR("isStable");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v15;
  v23[5] = CFSTR("numDevicesVector");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_22;
LABEL_29:

    if (v8)
      goto LABEL_23;
    goto LABEL_30;
  }

  if (!v9)
    goto LABEL_29;
LABEL_22:
  if (v8)
    goto LABEL_23;
LABEL_30:

LABEL_23:
  if (!v7)

  if (!v21)
  {

    if (v22)
      goto LABEL_27;
LABEL_32:

    goto LABEL_27;
  }
  if (!v22)
    goto LABEL_32;
LABEL_27:

  return v17;
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
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLocationMicroLocationVisit domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLocationMicroLocationVisit domain](self, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
    }
    -[BMLocationMicroLocationVisit maxProbabilityMicroLocationIdentifier](self, "maxProbabilityMicroLocationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxProbabilityMicroLocationIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLocationMicroLocationVisit maxProbabilityMicroLocationIdentifier](self, "maxProbabilityMicroLocationIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "maxProbabilityMicroLocationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_25;
    }
    if (-[BMLocationMicroLocationVisit hasMaxProbability](self, "hasMaxProbability")
      || objc_msgSend(v5, "hasMaxProbability"))
    {
      if (!-[BMLocationMicroLocationVisit hasMaxProbability](self, "hasMaxProbability"))
        goto LABEL_25;
      if (!objc_msgSend(v5, "hasMaxProbability"))
        goto LABEL_25;
      -[BMLocationMicroLocationVisit maxProbability](self, "maxProbability");
      v20 = v19;
      objc_msgSend(v5, "maxProbability");
      if (v20 != v21)
        goto LABEL_25;
    }
    -[BMLocationMicroLocationVisit probabilityVector](self, "probabilityVector");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "probabilityVector");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[BMLocationMicroLocationVisit probabilityVector](self, "probabilityVector");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "probabilityVector");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_25;
    }
    if (!-[BMLocationMicroLocationVisit hasIsStable](self, "hasIsStable")
      && !objc_msgSend(v5, "hasIsStable")
      || -[BMLocationMicroLocationVisit hasIsStable](self, "hasIsStable")
      && objc_msgSend(v5, "hasIsStable")
      && (v28 = -[BMLocationMicroLocationVisit isStable](self, "isStable"),
          v28 == objc_msgSend(v5, "isStable")))
    {
      -[BMLocationMicroLocationVisit numDevicesVector](self, "numDevicesVector");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numDevicesVector");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 == v31)
      {
        v12 = 1;
      }
      else
      {
        -[BMLocationMicroLocationVisit numDevicesVector](self, "numDevicesVector");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "numDevicesVector");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v32, "isEqual:", v33);

      }
      goto LABEL_26;
    }
LABEL_25:
    v12 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v12 = 0;
LABEL_27:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)maxProbabilityMicroLocationIdentifier
{
  return self->_maxProbabilityMicroLocationIdentifier;
}

- (double)maxProbability
{
  return self->_maxProbability;
}

- (BOOL)hasMaxProbability
{
  return self->_hasMaxProbability;
}

- (void)setHasMaxProbability:(BOOL)a3
{
  self->_hasMaxProbability = a3;
}

- (NSArray)probabilityVector
{
  return self->_probabilityVector;
}

- (BOOL)isStable
{
  return self->_isStable;
}

- (BOOL)hasIsStable
{
  return self->_hasIsStable;
}

- (void)setHasIsStable:(BOOL)a3
{
  self->_hasIsStable = a3;
}

- (NSArray)numDevicesVector
{
  return self->_numDevicesVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDevicesVector, 0);
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_maxProbabilityMicroLocationIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);
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

    v4 = -[BMLocationMicroLocationVisit initByReadFrom:]([BMLocationMicroLocationVisit alloc], "initByReadFrom:", v7);
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("maxProbabilityMicroLocationIdentifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("maxProbability"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("probabilityVector_json"), 5, 1, &__block_literal_global_37261);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isStable"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("numDevicesVector_json"), 5, 1, &__block_literal_global_169);
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
  return &unk_1E5F1CCC0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("maxProbabilityMicroLocationIdentifier"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("maxProbability"), 3, 0, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("probabilityVector"), 4, 14, objc_opt_class());
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isStable"), 5, 12, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numDevicesVector"), 6, 14, objc_opt_class());
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__BMLocationMicroLocationVisit_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_numDevicesVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __39__BMLocationMicroLocationVisit_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_probabilityVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
