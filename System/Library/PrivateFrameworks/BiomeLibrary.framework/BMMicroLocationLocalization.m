@implementation BMMicroLocationLocalization

- (BMMicroLocationLocalization)initWithAbsoluteTimeStamp:(id)a3 clientBundleID:(id)a4 maxProbabilityLabel:(id)a5 maxProbability:(id)a6 probabilityVector:(id)a7 numDevicesVector:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BMMicroLocationLocalization *v19;
  double v20;
  double v21;
  id v23;
  objc_super v24;

  v14 = a3;
  v23 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMMicroLocationLocalization;
  v19 = -[BMEventBase init](&v24, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v19->_hasRaw_absoluteTimeStamp = 1;
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v19->_hasRaw_absoluteTimeStamp = 0;
      v20 = -1.0;
    }
    v19->_raw_absoluteTimeStamp = v20;
    objc_storeStrong((id *)&v19->_clientBundleID, a4);
    objc_storeStrong((id *)&v19->_maxProbabilityLabel, a5);
    if (v16)
    {
      v19->_hasMaxProbability = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v19->_hasMaxProbability = 0;
      v21 = -1.0;
    }
    v19->_maxProbability = v21;
    objc_storeStrong((id *)&v19->_probabilityVector, a7);
    objc_storeStrong((id *)&v19->_numDevicesVector, a8);
  }

  return v19;
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
  -[BMMicroLocationLocalization absoluteTimeStamp](self, "absoluteTimeStamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationLocalization clientBundleID](self, "clientBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationLocalization maxProbabilityLabel](self, "maxProbabilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMicroLocationLocalization maxProbability](self, "maxProbability");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationLocalization probabilityVector](self, "probabilityVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationLocalization numDevicesVector](self, "numDevicesVector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMicroLocationLocalization with absoluteTimeStamp: %@, clientBundleID: %@, maxProbabilityLabel: %@, maxProbability: %@, probabilityVector: %@, numDevicesVector: %@"), v4, v5, v6, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMicroLocationLocalization *v5;
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
  int v20;
  uint64_t v22;
  unint64_t v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *probabilityVector;
  uint64_t v37;
  NSArray *numDevicesVector;
  int v39;
  BMMicroLocationLocalization *v40;
  objc_super v42;
  uint64_t v43;
  uint64_t v44;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMMicroLocationLocalization;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
  {
LABEL_46:
    v40 = v5;
    goto LABEL_47;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_44:
    v35 = objc_msgSend(v6, "copy");
    probabilityVector = v5->_probabilityVector;
    v5->_probabilityVector = (NSArray *)v35;

    v37 = objc_msgSend(v7, "copy");
    numDevicesVector = v5->_numDevicesVector;
    v5->_numDevicesVector = (NSArray *)v37;

    v39 = v4[*v10];
    if (v39)
      goto LABEL_45;
    goto LABEL_46;
  }
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v10])
      goto LABEL_44;
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
      if (v13++ >= 9)
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
      goto LABEL_44;
    switch((v14 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimeStamp = 1;
        v22 = *v8;
        v23 = *(_QWORD *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v9])
        {
          v24 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v23);
          *(_QWORD *)&v4[v22] = v23 + 8;
        }
        else
        {
          v4[*v10] = 1;
          v24 = 0;
        }
        v34 = 24;
        goto LABEL_42;
      case 2u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 40;
        goto LABEL_27;
      case 3u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 48;
LABEL_27:
        v27 = *(Class *)((char *)&v5->super.super.isa + v26);
        *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

        goto LABEL_43;
      case 4u:
        v5->_hasMaxProbability = 1;
        v28 = *v8;
        v29 = *(_QWORD *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)&v4[*v9])
        {
          v24 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v29);
          *(_QWORD *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v10] = 1;
          v24 = 0;
        }
        v34 = 56;
LABEL_42:
        *(Class *)((char *)&v5->super.super.isa + v34) = v24;
        goto LABEL_43;
      case 5u:
        v43 = 0;
        v44 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_48;
        v30 = -[BMMicroLocationLocalizationProbabilityPerLabel initByReadFrom:]([BMMicroLocationLocalizationProbabilityPerLabel alloc], "initByReadFrom:", v4);
        if (!v30)
          goto LABEL_48;
        v31 = v30;
        v32 = v6;
        goto LABEL_37;
      case 6u:
        v43 = 0;
        v44 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_48;
        v33 = -[BMMicroLocationLocalizationNumDevicesPerTechnology initByReadFrom:]([BMMicroLocationLocalizationNumDevicesPerTechnology alloc], "initByReadFrom:", v4);
        if (!v33)
          goto LABEL_48;
        v31 = v33;
        v32 = v7;
LABEL_37:
        objc_msgSend(v32, "addObject:", v31);
        PBReaderRecallMark();

        goto LABEL_43;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_43:
          if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
            goto LABEL_44;
          continue;
        }
LABEL_48:

LABEL_45:
        v40 = 0;
LABEL_47:

        return v40;
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
  if (self->_hasRaw_absoluteTimeStamp)
    PBDataWriterWriteDoubleField();
  if (self->_clientBundleID)
    PBDataWriterWriteStringField();
  if (self->_maxProbabilityLabel)
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
  -[BMMicroLocationLocalization writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMicroLocationLocalization)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  BMMicroLocationLocalizationProbabilityPerLabel *v29;
  BMMicroLocationLocalizationProbabilityPerLabel *v30;
  id v31;
  id v32;
  void *v33;
  int v34;
  id *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  BMMicroLocationLocalization *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  BMMicroLocationLocalization *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  BMMicroLocationLocalization *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  id *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  id v75;
  BMMicroLocationLocalizationNumDevicesPerTechnology *v76;
  BMMicroLocationLocalizationNumDevicesPerTechnology *v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id *v88;
  id v89;
  uint64_t v90;
  void *v91;
  id *v92;
  uint64_t *v93;
  void *v94;
  uint64_t v95;
  id v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  BMMicroLocationLocalization *v106;
  void *v107;
  id v108;
  id *v109;
  id v110;
  void *v112;
  void *v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  id v127;
  _BYTE v128[128];
  uint64_t v129;
  id v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  id v134;
  _BYTE v135[128];
  uint64_t v136;
  void *v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  _QWORD v145[3];

  v145[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimeStamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v6;
    v10 = [v8 alloc];
    objc_msgSend(v9, "doubleValue");
    v12 = v11;

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v12);
LABEL_6:
    v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v83 = v6;
        v84 = *MEMORY[0x1E0D025B8];
        v144 = *MEMORY[0x1E0CB2D50];
        v35 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimeStamp"));
        v145[0] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, &v144, 1);
        v85 = objc_claimAutoreleasedReturnValue();
        v86 = v84;
        v6 = v83;
        v112 = (void *)v85;
        v87 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v86, 2);
        v7 = 0;
        v45 = 0;
        *a4 = v87;
        goto LABEL_99;
      }
      v7 = 0;
      v45 = 0;
      goto LABEL_100;
    }
    v13 = v6;
    goto LABEL_6;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v14, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientBundleID"));
  v15 = objc_claimAutoreleasedReturnValue();
  v112 = (void *)v15;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = a4;
      if (a4)
      {
        v36 = v7;
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v38 = v6;
        v39 = *MEMORY[0x1E0D025B8];
        v142 = *MEMORY[0x1E0CB2D50];
        v40 = self;
        v41 = objc_alloc(MEMORY[0x1E0CB3940]);
        v100 = objc_opt_class();
        v42 = v41;
        self = v40;
        v110 = (id)objc_msgSend(v42, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v100, CFSTR("clientBundleID"));
        v143 = v110;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v37;
        v7 = v36;
        v44 = v39;
        v6 = v38;
        v45 = 0;
        v35 = 0;
        *a4 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v17);
        goto LABEL_98;
      }
      v45 = 0;
      goto LABEL_99;
    }
    v109 = v16;
  }
  else
  {
    v109 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxProbabilityLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v46 = v7;
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = v6;
        v49 = *MEMORY[0x1E0D025B8];
        v140 = *MEMORY[0x1E0CB2D50];
        v50 = self;
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        v101 = objc_opt_class();
        v52 = v51;
        self = v50;
        v108 = (id)objc_msgSend(v52, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v101, CFSTR("maxProbabilityLabel"));
        v141 = v108;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v47;
        v7 = v46;
        v54 = v49;
        v6 = v48;
        v45 = 0;
        v110 = 0;
        *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v19);
        v35 = v109;
        goto LABEL_97;
      }
      v110 = 0;
      v45 = 0;
      v35 = v109;
      goto LABEL_98;
    }
    v110 = v17;
  }
  else
  {
    v110 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxProbability"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v6;
  v106 = self;
  v107 = v18;
  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v55 = v7;
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = *MEMORY[0x1E0D025B8];
        v138 = *MEMORY[0x1E0CB2D50];
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("maxProbability"));
        v139 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = v56;
        v7 = v55;
        v113 = (void *)v58;
        v60 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v57, 2);
        v45 = 0;
        v108 = 0;
        *a4 = v60;
        v35 = v109;
        goto LABEL_95;
      }
      v108 = 0;
      v45 = 0;
      v35 = v109;
      v19 = v18;
      goto LABEL_97;
    }
    v103 = v7;
    v108 = v18;
  }
  else
  {
    v103 = v7;
    v108 = 0;
  }
  v19 = v18;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("probabilityVector"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  v104 = v5;
  if (v22)
  {
    v102 = v17;

    v20 = 0;
  }
  else
  {
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v80 = *MEMORY[0x1E0D025B8];
          v136 = *MEMORY[0x1E0CB2D50];
          v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("probabilityVector"));
          v137 = v113;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v81 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2, v32);
          v45 = 0;
          *a4 = v81;
          self = v106;
          v7 = v103;
          v35 = v109;
          goto LABEL_94;
        }
        v45 = 0;
        self = v106;
        v7 = v103;
        v35 = v109;
        goto LABEL_96;
      }
    }
    v102 = v17;
  }
  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v20 = v20;
  v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v121 != v25)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v61 = a4;
          if (a4)
          {
            v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v63 = *MEMORY[0x1E0D025B8];
            v133 = *MEMORY[0x1E0CB2D50];
            v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("probabilityVector"));
            v134 = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v62;
            v66 = v63;
            goto LABEL_51;
          }
LABEL_74:
          v45 = 0;
          v32 = v20;
          v5 = v104;
          self = v106;
LABEL_75:
          v7 = v103;
          v35 = v109;
          goto LABEL_93;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v61 = a4;
          if (!a4)
            goto LABEL_74;
          v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v68 = *MEMORY[0x1E0D025B8];
          v131 = *MEMORY[0x1E0CB2D50];
          v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("probabilityVector"));
          v132 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v67;
          v66 = v68;
LABEL_51:
          *v61 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v64);

LABEL_55:
          v45 = 0;
          v32 = v20;
          v5 = v104;
          self = v106;
LABEL_56:
          v7 = v103;
          v35 = v109;
          goto LABEL_92;
        }
        v28 = v27;
        v29 = [BMMicroLocationLocalizationProbabilityPerLabel alloc];
        v119 = 0;
        v30 = -[BMMicroLocationLocalizationProbabilityPerLabel initWithJSONDictionary:error:](v29, "initWithJSONDictionary:error:", v28, &v119);
        v31 = v119;
        if (v31)
        {
          v69 = v31;
          if (a4)
            *a4 = objc_retainAutorelease(v31);

          goto LABEL_55;
        }
        objc_msgSend(v113, "addObject:", v30);

      }
      v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
    }
    while (v24);
  }

  v5 = v104;
  objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("numDevicesVector"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isEqual:", v33);

  if (v34)
  {

    v32 = 0;
    self = v106;
  }
  else
  {
    self = v106;
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v45 = 0;
          goto LABEL_75;
        }
        v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v98 = *MEMORY[0x1E0D025B8];
        v129 = *MEMORY[0x1E0CB2D50];
        v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("numDevicesVector"));
        v130 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 2, v99);

        v45 = 0;
        goto LABEL_56;
      }
    }
  }
  v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v32 = v32;
  v70 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
  if (!v70)
    goto LABEL_69;
  v71 = v70;
  v72 = *(_QWORD *)v116;
  while (2)
  {
    for (j = 0; j != v71; ++j)
    {
      if (*(_QWORD *)v116 != v72)
        objc_enumerationMutation(v32);
      v74 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v104;
        self = v106;
        v35 = v109;
        v88 = a4;
        if (a4)
        {
          v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v90 = *MEMORY[0x1E0D025B8];
          v126 = *MEMORY[0x1E0CB2D50];
          v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("numDevicesVector"));
          v127 = v75;
          v91 = (void *)MEMORY[0x1E0C99D80];
          v92 = &v127;
          v93 = &v126;
LABEL_86:
          objc_msgSend(v91, "dictionaryWithObjects:forKeys:count:", v92, v93, 1);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v90;
          v5 = v104;
          *v88 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v95, 2, v94);
LABEL_90:

        }
LABEL_91:

        v45 = 0;
        v7 = v103;
        goto LABEL_92;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = v104;
        self = v106;
        v35 = v109;
        v88 = a4;
        if (a4)
        {
          v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v90 = *MEMORY[0x1E0D025B8];
          v124 = *MEMORY[0x1E0CB2D50];
          v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("numDevicesVector"));
          v125 = v75;
          v91 = (void *)MEMORY[0x1E0C99D80];
          v92 = &v125;
          v93 = &v124;
          goto LABEL_86;
        }
        goto LABEL_91;
      }
      v75 = v74;
      v76 = [BMMicroLocationLocalizationNumDevicesPerTechnology alloc];
      v114 = 0;
      v77 = -[BMMicroLocationLocalizationNumDevicesPerTechnology initWithJSONDictionary:error:](v76, "initWithJSONDictionary:error:", v75, &v114);
      v78 = v114;
      if (v78)
      {
        v94 = v78;
        if (a4)
          *a4 = objc_retainAutorelease(v78);

        v5 = v104;
        self = v106;
        v35 = v109;
        goto LABEL_90;
      }
      objc_msgSend(v28, "addObject:", v77);

    }
    v71 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
    self = v106;
    if (v71)
      continue;
    break;
  }
LABEL_69:

  v7 = v103;
  v35 = v109;
  self = -[BMMicroLocationLocalization initWithAbsoluteTimeStamp:clientBundleID:maxProbabilityLabel:maxProbability:probabilityVector:numDevicesVector:](self, "initWithAbsoluteTimeStamp:clientBundleID:maxProbabilityLabel:maxProbability:probabilityVector:numDevicesVector:", v103, v109, v110, v108, v113, v28);
  v45 = self;
  v5 = v104;
LABEL_92:

LABEL_93:
  v17 = v102;
LABEL_94:

LABEL_95:
  v19 = v107;
LABEL_96:

  v6 = v105;
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
  return v45;
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
  -[BMMicroLocationLocalization probabilityVector](self, "probabilityVector", 0);
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
  -[BMMicroLocationLocalization numDevicesVector](self, "numDevicesVector", 0);
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
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  -[BMMicroLocationLocalization absoluteTimeStamp](self, "absoluteTimeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMicroLocationLocalization absoluteTimeStamp](self, "absoluteTimeStamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMMicroLocationLocalization clientBundleID](self, "clientBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationLocalization maxProbabilityLabel](self, "maxProbabilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMicroLocationLocalization hasMaxProbability](self, "hasMaxProbability")
    || (-[BMMicroLocationLocalization maxProbability](self, "maxProbability"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMMicroLocationLocalization maxProbability](self, "maxProbability");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMicroLocationLocalization maxProbability](self, "maxProbability");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMMicroLocationLocalization _probabilityVectorJSONArray](self, "_probabilityVectorJSONArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationLocalization _numDevicesVectorJSONArray](self, "_numDevicesVectorJSONArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("absoluteTimeStamp");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v14;
  v27[0] = v14;
  v26[1] = CFSTR("clientBundleID");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v22 = v15;
  v27[1] = v15;
  v26[2] = CFSTR("maxProbabilityLabel");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v15, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v6;
  v27[2] = v16;
  v26[3] = CFSTR("maxProbability");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v17;
  v26[4] = CFSTR("probabilityVector");
  v18 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[4] = v18;
  v26[5] = CFSTR("numDevicesVector");
  v19 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v12)
      goto LABEL_22;
LABEL_28:

    if (v11)
      goto LABEL_23;
    goto LABEL_29;
  }

  if (!v12)
    goto LABEL_28;
LABEL_22:
  if (v11)
    goto LABEL_23;
LABEL_29:

LABEL_23:
  if (v8)
  {
    if (v7)
      goto LABEL_25;
LABEL_31:

    if (v25)
      goto LABEL_26;
LABEL_32:

    goto LABEL_26;
  }

  if (!v7)
    goto LABEL_31;
LABEL_25:
  if (!v25)
    goto LABEL_32;
LABEL_26:

  return v20;
}

- (NSDate)absoluteTimeStamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimeStamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimeStamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
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
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMicroLocationLocalization absoluteTimeStamp](self, "absoluteTimeStamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimeStamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMicroLocationLocalization absoluteTimeStamp](self, "absoluteTimeStamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimeStamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_22;
    }
    -[BMMicroLocationLocalization clientBundleID](self, "clientBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientBundleID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMicroLocationLocalization clientBundleID](self, "clientBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_22;
    }
    -[BMMicroLocationLocalization maxProbabilityLabel](self, "maxProbabilityLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxProbabilityLabel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMicroLocationLocalization maxProbabilityLabel](self, "maxProbabilityLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "maxProbabilityLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_22;
    }
    if (-[BMMicroLocationLocalization hasMaxProbability](self, "hasMaxProbability")
      || objc_msgSend(v5, "hasMaxProbability"))
    {
      if (!-[BMMicroLocationLocalization hasMaxProbability](self, "hasMaxProbability"))
        goto LABEL_22;
      if (!objc_msgSend(v5, "hasMaxProbability"))
        goto LABEL_22;
      -[BMMicroLocationLocalization maxProbability](self, "maxProbability");
      v26 = v25;
      objc_msgSend(v5, "maxProbability");
      if (v26 != v27)
        goto LABEL_22;
    }
    -[BMMicroLocationLocalization probabilityVector](self, "probabilityVector");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "probabilityVector");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v28 == (void *)v29)
    {

    }
    else
    {
      v30 = (void *)v29;
      -[BMMicroLocationLocalization probabilityVector](self, "probabilityVector");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "probabilityVector");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
      {
LABEL_22:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMMicroLocationLocalization numDevicesVector](self, "numDevicesVector");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numDevicesVector");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 == v36)
    {
      v12 = 1;
    }
    else
    {
      -[BMMicroLocationLocalization numDevicesVector](self, "numDevicesVector");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numDevicesVector");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v37, "isEqual:", v38);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)maxProbabilityLabel
{
  return self->_maxProbabilityLabel;
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

- (NSArray)numDevicesVector
{
  return self->_numDevicesVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDevicesVector, 0);
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_maxProbabilityLabel, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMMicroLocationLocalization initByReadFrom:]([BMMicroLocationLocalization alloc], "initByReadFrom:", v6);
    v7[9] = 1;

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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimeStamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientBundleID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("maxProbabilityLabel"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("maxProbability"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("probabilityVector_json"), 5, 1, &__block_literal_global_35687);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("numDevicesVector_json"), 5, 1, &__block_literal_global_174_35688);
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
  return &unk_1E5F1C9C0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimeStamp"), 1, 0, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientBundleID"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("maxProbabilityLabel"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("maxProbability"), 4, 0, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("probabilityVector"), 5, 14, objc_opt_class());
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numDevicesVector"), 6, 14, objc_opt_class());
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __38__BMMicroLocationLocalization_columns__block_invoke_2(uint64_t a1, void *a2)
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

id __38__BMMicroLocationLocalization_columns__block_invoke(uint64_t a1, void *a2)
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
