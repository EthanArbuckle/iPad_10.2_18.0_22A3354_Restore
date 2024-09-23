@implementation BMIntelligencePlatformMessageTerms

- (BMIntelligencePlatformMessageTerms)initWithProtoVersion:(id)a3 bundleID:(id)a4 domain:(id)a5 spotlightIdentifier:(id)a6 timestamp:(id)a7 sender:(id)a8 recipients:(id)a9 termCount:(id)a10
{
  id v16;
  id v17;
  id v18;
  BMIntelligencePlatformMessageTerms *v19;
  int v20;
  double v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v16 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v17 = a7;
  v24 = a8;
  v23 = a9;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMIntelligencePlatformMessageTerms;
  v19 = -[BMEventBase init](&v28, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v19->_hasProtoVersion = 1;
      v20 = objc_msgSend(v16, "intValue");
    }
    else
    {
      v19->_hasProtoVersion = 0;
      v20 = -1;
    }
    v19->_protoVersion = v20;
    objc_storeStrong((id *)&v19->_bundleID, a4);
    objc_storeStrong((id *)&v19->_domain, a5);
    objc_storeStrong((id *)&v19->_spotlightIdentifier, a6);
    if (v17)
    {
      v19->_hasRaw_timestamp = 1;
      objc_msgSend(v17, "timeIntervalSince1970");
    }
    else
    {
      v19->_hasRaw_timestamp = 0;
      v21 = -1.0;
    }
    v19->_raw_timestamp = v21;
    objc_storeStrong((id *)&v19->_sender, a8);
    objc_storeStrong((id *)&v19->_recipients, a9);
    objc_storeStrong((id *)&v19->_termCount, a10);
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
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformMessageTerms protoVersion](self, "protoVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms spotlightIdentifier](self, "spotlightIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms sender](self, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms recipients](self, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms termCount](self, "termCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformMessageTerms with protoVersion: %@, bundleID: %@, domain: %@, spotlightIdentifier: %@, timestamp: %@, sender: %@, recipients: %@, termCount: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformMessageTerms *v5;
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
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSArray *recipients;
  uint64_t v40;
  NSArray *termCount;
  int v42;
  BMIntelligencePlatformMessageTerms *v43;
  objc_super v45;
  uint64_t v46;
  uint64_t v47;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMIntelligencePlatformMessageTerms;
  v5 = -[BMEventBase init](&v45, sel_init);
  if (!v5)
  {
LABEL_52:
    v43 = v5;
    goto LABEL_53;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_50:
    v38 = objc_msgSend(v6, "copy");
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v38;

    v40 = objc_msgSend(v7, "copy");
    termCount = v5->_termCount;
    v5->_termCount = (NSArray *)v40;

    v42 = v4[*v10];
    if (v42)
      goto LABEL_51;
    goto LABEL_52;
  }
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v10])
      goto LABEL_50;
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
      goto LABEL_50;
    switch((v14 >> 3))
    {
      case 1u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v5->_hasProtoVersion = 1;
        while (1)
        {
          v25 = *v8;
          v26 = *(_QWORD *)&v4[v25];
          v27 = v26 + 1;
          if (v26 == -1 || v27 > *(_QWORD *)&v4[*v9])
            break;
          v28 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v26);
          *(_QWORD *)&v4[v25] = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0)
            goto LABEL_44;
          v22 += 7;
          v19 = v23++ >= 9;
          if (v19)
          {
            LODWORD(v24) = 0;
            goto LABEL_46;
          }
        }
        v4[*v10] = 1;
LABEL_44:
        if (v4[*v10])
          LODWORD(v24) = 0;
LABEL_46:
        v5->_protoVersion = v24;
        goto LABEL_49;
      case 2u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 48;
        goto LABEL_36;
      case 3u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 56;
        goto LABEL_36;
      case 4u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 64;
        goto LABEL_36;
      case 5u:
        v5->_hasRaw_timestamp = 1;
        v31 = *v8;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)&v4[*v9])
        {
          v33 = *(double *)(*(_QWORD *)&v4[*v11] + v32);
          *(_QWORD *)&v4[v31] = v32 + 8;
        }
        else
        {
          v4[*v10] = 1;
          v33 = 0.0;
        }
        v5->_raw_timestamp = v33;
        goto LABEL_49;
      case 6u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 72;
LABEL_36:
        v34 = *(Class *)((char *)&v5->super.super.isa + v30);
        *(Class *)((char *)&v5->super.super.isa + v30) = (Class)v29;

        goto LABEL_49;
      case 7u:
        PBReaderReadString();
        v35 = objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_54;
        v36 = (void *)v35;
        objc_msgSend(v6, "addObject:", v35);
        goto LABEL_42;
      case 8u:
        v46 = 0;
        v47 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_54;
        v37 = -[BMIntelligencePlatformMessageTermsTermCount initByReadFrom:]([BMIntelligencePlatformMessageTermsTermCount alloc], "initByReadFrom:", v4);
        if (!v37)
          goto LABEL_54;
        v36 = v37;
        objc_msgSend(v7, "addObject:", v37);
        PBReaderRecallMark();
LABEL_42:

        goto LABEL_49;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_49:
          if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
            goto LABEL_50;
          continue;
        }
LABEL_54:

LABEL_51:
        v43 = 0;
LABEL_53:

        return v43;
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasProtoVersion)
    PBDataWriterWriteInt32Field();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_spotlightIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_timestamp)
    PBDataWriterWriteDoubleField();
  if (self->_sender)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_recipients;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_termCount;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformMessageTerms writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformMessageTerms)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  id *v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id *v64;
  id v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  uint64_t v76;
  id v77;
  void *v78;
  int v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  id *v93;
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  BMIntelligencePlatformMessageTermsTermCount *v105;
  BMIntelligencePlatformMessageTermsTermCount *v106;
  id v107;
  id v108;
  uint64_t v109;
  id v110;
  id *v111;
  id v112;
  uint64_t v113;
  id *v114;
  void *v115;
  id *v116;
  uint64_t *v117;
  void *v118;
  void *v119;
  void *v121;
  id v122;
  uint64_t v123;
  id v124;
  id v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  id v130;
  id *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  uint64_t v142;
  id v143;
  void *v144;
  id *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  BMIntelligencePlatformMessageTerms *v152;
  void *v153;
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  id v166;
  _BYTE v167[128];
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  _BYTE v174[128];
  uint64_t v175;
  void *v176;
  uint64_t v177;
  id v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  id v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  _QWORD v188[3];

  v188[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("protoVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v187 = *MEMORY[0x1E0CB2D50];
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("protoVersion"));
        v188[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v188, &v187, 1);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v22;
        v9 = (void *)v25;
        v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v23, 2, v25);
        v8 = 0;
        v28 = a4;
        a4 = 0;
        *v28 = v27;
        goto LABEL_113;
      }
      v8 = 0;
      goto LABEL_114;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v29 = v9;
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v185 = *MEMORY[0x1E0CB2D50];
        v32 = v8;
        v33 = objc_alloc(MEMORY[0x1E0CB3940]);
        v132 = objc_opt_class();
        v34 = v33;
        v8 = v32;
        v35 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v132, CFSTR("bundleID"));
        v186 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v30;
        v9 = v29;
        v38 = v31;
        v10 = (void *)v36;
        v39 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v36);
        v24 = 0;
        v40 = a4;
        a4 = 0;
        *v40 = v39;
        goto LABEL_112;
      }
      v24 = 0;
      goto LABEL_113;
    }
    v151 = v9;
  }
  else
  {
    v151 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = self;
  v153 = v10;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v41 = v9;
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v183 = *MEMORY[0x1E0CB2D50];
        v44 = v8;
        v45 = objc_alloc(MEMORY[0x1E0CB3940]);
        v133 = objc_opt_class();
        v46 = v45;
        v8 = v44;
        v11 = (id)objc_msgSend(v46, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v133, CFSTR("domain"));
        v184 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v42;
        v9 = v41;
        v49 = v43;
        v10 = v153;
        v150 = (void *)v47;
        v50 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2);
        v35 = 0;
        v51 = a4;
        a4 = 0;
        *v51 = v50;
        v24 = v151;
        goto LABEL_111;
      }
      v35 = 0;
      v24 = v151;
      goto LABEL_112;
    }
    v147 = v10;
  }
  else
  {
    v147 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spotlightIdentifier"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v150 = v11;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v24 = v151;
          v35 = v147;
          goto LABEL_111;
        }
        v52 = v9;
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v54 = *MEMORY[0x1E0D025B8];
        v181 = *MEMORY[0x1E0CB2D50];
        v55 = v8;
        v56 = objc_alloc(MEMORY[0x1E0CB3940]);
        v134 = objc_opt_class();
        v57 = v56;
        v8 = v55;
        v58 = objc_msgSend(v57, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v134, CFSTR("spotlightIdentifier"));
        v182 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v53;
        v9 = v52;
        v61 = (void *)v58;
        v62 = v54;
        v10 = v153;
        v146 = (void *)v59;
        v63 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v62, 2);
        v11 = 0;
        v64 = a4;
        a4 = 0;
        *v64 = v63;
        goto LABEL_35;
      }
      v11 = v11;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v12 = objc_claimAutoreleasedReturnValue();
  v146 = (void *)v12;
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (objc_class *)MEMORY[0x1E0C99D68];
        v15 = v13;
        v16 = v9;
        v17 = v15;
        v18 = [v14 alloc];
        objc_msgSend(v17, "doubleValue");
        v20 = v19;

        v9 = v16;
        v21 = (id)objc_msgSend(v18, "initWithTimeIntervalSince1970:", v20);
LABEL_26:
        v142 = (uint64_t)v21;
        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v65, "dateFromString:", v13);
        v142 = objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v13;
        goto LABEL_26;
      }
      if (a4)
      {
        v121 = v9;
        v122 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v123 = *MEMORY[0x1E0D025B8];
        v179 = *MEMORY[0x1E0CB2D50];
        v124 = v8;
        v125 = objc_alloc(MEMORY[0x1E0CB3940]);
        v135 = objc_opt_class();
        v126 = v125;
        v8 = v124;
        v143 = (id)objc_msgSend(v126, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), v135, CFSTR("timestamp"));
        v180 = v143;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
        v127 = objc_claimAutoreleasedReturnValue();
        v128 = v122;
        v9 = v121;
        v129 = v123;
        v10 = v153;
        v144 = (void *)v127;
        v130 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v129, 2);
        v61 = 0;
        v131 = a4;
        a4 = 0;
        *v131 = v130;
        v24 = v151;
        v35 = v147;
        goto LABEL_109;
      }
      v61 = 0;
LABEL_35:
      v24 = v151;
      v35 = v147;
      goto LABEL_110;
    }
  }
  v142 = 0;
LABEL_38:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sender"));
  v66 = objc_claimAutoreleasedReturnValue();
  v140 = v9;
  v141 = v8;
  v144 = (void *)v66;
  if (v66 && (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v88 = v7;
        v89 = *MEMORY[0x1E0D025B8];
        v177 = *MEMORY[0x1E0CB2D50];
        v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sender"));
        v178 = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v87;
        v10 = v153;
        v91 = v89;
        v7 = v88;
        v92 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v91, 2, v71);
        v143 = 0;
        v93 = a4;
        a4 = 0;
        *v93 = v92;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;
        goto LABEL_107;
      }
      v143 = 0;
      v24 = v151;
      v35 = v147;
      v61 = (void *)v142;
      goto LABEL_109;
    }
    v143 = v67;
  }
  else
  {
    v143 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recipients"));
  v68 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v68, "isEqual:", v69);

  v139 = v11;
  if (v70)
  {
    v138 = v6;

    v68 = 0;
  }
  else
  {
    if (v68)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v24 = v151;
          v10 = v153;
          v35 = v147;
          v61 = (void *)v142;
          goto LABEL_108;
        }
        v108 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v109 = *MEMORY[0x1E0D025B8];
        v175 = *MEMORY[0x1E0CB2D50];
        v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("recipients"));
        v176 = v71;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
        v77 = (id)objc_claimAutoreleasedReturnValue();
        v110 = (id)objc_msgSend(v108, "initWithDomain:code:userInfo:", v109, 2, v77);
        v111 = a4;
        a4 = 0;
        *v111 = v110;
        goto LABEL_85;
      }
    }
    v138 = v6;
  }
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v68, "count"));
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v68 = v68;
  v72 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v159, v174, 16);
  v145 = a4;
  if (!v72)
    goto LABEL_55;
  v73 = v72;
  v74 = *(_QWORD *)v160;
  v136 = v7;
  do
  {
    for (i = 0; i != v73; ++i)
    {
      if (*(_QWORD *)v160 != v74)
        objc_enumerationMutation(v68);
      v76 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
        {
          v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v81 = *MEMORY[0x1E0D025B8];
          v172 = *MEMORY[0x1E0CB2D50];
          v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("recipients"));
          v173 = v148;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v80;
          v84 = v81;
LABEL_63:
          v6 = v138;
          v24 = v151;
          v61 = (void *)v142;
          *a4 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2, v82);

          a4 = 0;
          v77 = v68;
          v7 = v136;
          v10 = v153;
          v35 = v147;
          goto LABEL_105;
        }
LABEL_64:
        v77 = v68;
        v7 = v136;
        v6 = v138;
LABEL_85:
        v24 = v151;
        v10 = v153;
LABEL_86:
        v35 = v147;
        v61 = (void *)v142;
        goto LABEL_106;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v86 = *MEMORY[0x1E0D025B8];
          v170 = *MEMORY[0x1E0CB2D50];
          v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("recipients"));
          v171 = v148;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v85;
          v84 = v86;
          a4 = v145;
          goto LABEL_63;
        }
        goto LABEL_64;
      }
      objc_msgSend(v71, "addObject:", v76);
    }
    v73 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v159, v174, 16);
    v7 = v136;
  }
  while (v73);
LABEL_55:

  objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("termCount"));
  v77 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v77, "isEqual:", v78);

  if (v79)
  {

    v77 = 0;
    goto LABEL_71;
  }
  if (v77)
  {
    objc_opt_class();
    v10 = v153;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v95 = *MEMORY[0x1E0D025B8];
        v168 = *MEMORY[0x1E0CB2D50];
        v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("termCount"));
        v169 = v149;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
        v96 = v7;
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v95;
        v10 = v153;
        *a4 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v98, 2, v97);

        v7 = v96;
        a4 = 0;
        v6 = v138;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;

        goto LABEL_106;
      }
      v6 = v138;
      v24 = v151;
      goto LABEL_86;
    }
  }
  else
  {
LABEL_71:
    v10 = v153;
  }
  v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v77, "count"));
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v77 = v77;
  v99 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
  if (!v99)
    goto LABEL_82;
  v100 = v99;
  v101 = *(_QWORD *)v156;
  v137 = v7;
  while (2)
  {
    v102 = 0;
    while (2)
    {
      if (*(_QWORD *)v156 != v101)
        objc_enumerationMutation(v77);
      v103 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v102);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v138;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;
        if (a4)
        {
          v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v113 = *MEMORY[0x1E0D025B8];
          v165 = *MEMORY[0x1E0CB2D50];
          v114 = a4;
          v104 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("termCount"));
          v166 = v104;
          v115 = (void *)MEMORY[0x1E0C99D80];
          v116 = &v166;
          v117 = &v165;
LABEL_99:
          objc_msgSend(v115, "dictionaryWithObjects:forKeys:count:", v116, v117, 1);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v112;
          v35 = v147;
          *v114 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v113, 2, v118);
LABEL_103:
          v61 = (void *)v142;

          v10 = v153;
        }
LABEL_104:

        a4 = 0;
        v7 = v137;
        goto LABEL_105;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = v138;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;
        if (a4)
        {
          v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v113 = *MEMORY[0x1E0D025B8];
          v163 = *MEMORY[0x1E0CB2D50];
          v114 = a4;
          v104 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("termCount"));
          v164 = v104;
          v115 = (void *)MEMORY[0x1E0C99D80];
          v116 = &v164;
          v117 = &v163;
          goto LABEL_99;
        }
        goto LABEL_104;
      }
      v104 = v103;
      v105 = [BMIntelligencePlatformMessageTermsTermCount alloc];
      v154 = 0;
      v106 = -[BMIntelligencePlatformMessageTermsTermCount initWithJSONDictionary:error:](v105, "initWithJSONDictionary:error:", v104, &v154);
      v107 = v154;
      if (v107)
      {
        v118 = v107;
        if (v145)
          *v145 = objc_retainAutorelease(v107);

        v6 = v138;
        v24 = v151;
        v35 = v147;
        goto LABEL_103;
      }
      objc_msgSend(v148, "addObject:", v106);

      ++v102;
      v10 = v153;
      a4 = v145;
      if (v100 != v102)
        continue;
      break;
    }
    v100 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
    v7 = v137;
    if (v100)
      continue;
    break;
  }
LABEL_82:

  v35 = v147;
  v24 = v151;
  v61 = (void *)v142;
  a4 = -[BMIntelligencePlatformMessageTerms initWithProtoVersion:bundleID:domain:spotlightIdentifier:timestamp:sender:recipients:termCount:](v152, "initWithProtoVersion:bundleID:domain:spotlightIdentifier:timestamp:sender:recipients:termCount:", v141, v151, v147, v139, v142, v143, v71, v148);
  v152 = (BMIntelligencePlatformMessageTerms *)a4;
  v6 = v138;
LABEL_105:

LABEL_106:
  v11 = v139;
LABEL_107:

  v8 = v141;
LABEL_108:

  v9 = v140;
LABEL_109:

LABEL_110:
LABEL_111:

  self = v152;
LABEL_112:

LABEL_113:
LABEL_114:

  return (BMIntelligencePlatformMessageTerms *)a4;
}

- (id)_recipientsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMIntelligencePlatformMessageTerms recipients](self, "recipients", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_termCountJSONArray
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
  -[BMIntelligencePlatformMessageTerms termCount](self, "termCount", 0);
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
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[8];
  _QWORD v32[10];

  v32[8] = *MEMORY[0x1E0C80C00];
  if (-[BMIntelligencePlatformMessageTerms hasProtoVersion](self, "hasProtoVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformMessageTerms protoVersion](self, "protoVersion"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMIntelligencePlatformMessageTerms bundleID](self, "bundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms domain](self, "domain");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms spotlightIdentifier](self, "spotlightIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMIntelligencePlatformMessageTerms timestamp](self, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[BMIntelligencePlatformMessageTerms sender](self, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms _recipientsJSONArray](self, "_recipientsJSONArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformMessageTerms _termCountJSONArray](self, "_termCountJSONArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = CFSTR("protoVersion");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v32[0] = v14;
  v31[1] = CFSTR("bundleID");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v15;
  v32[1] = v15;
  v31[2] = CFSTR("domain");
  v16 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v3;
  v24 = (void *)v16;
  v32[2] = v16;
  v31[3] = CFSTR("spotlightIdentifier");
  v17 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v4;
  v32[3] = v17;
  v31[4] = CFSTR("timestamp");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v5;
  v32[4] = v18;
  v31[5] = CFSTR("sender");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v6;
  v32[5] = v19;
  v31[6] = CFSTR("recipients");
  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[6] = v21;
  v31[7] = CFSTR("termCount");
  v22 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[7] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 8);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v12)
      goto LABEL_25;
LABEL_35:

    if (v11)
      goto LABEL_26;
    goto LABEL_36;
  }

  if (!v12)
    goto LABEL_35;
LABEL_25:
  if (v11)
    goto LABEL_26;
LABEL_36:

LABEL_26:
  if (!v10)

  if (!v20)
  if (v28)
  {
    if (v29)
      goto LABEL_32;
LABEL_38:

    if (v30)
      goto LABEL_33;
LABEL_39:

    goto LABEL_33;
  }

  if (!v29)
    goto LABEL_38;
LABEL_32:
  if (!v30)
    goto LABEL_39;
LABEL_33:

  return v27;
}

- (NSDate)timestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_timestamp);
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
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMIntelligencePlatformMessageTerms hasProtoVersion](self, "hasProtoVersion")
      || objc_msgSend(v5, "hasProtoVersion"))
    {
      if (!-[BMIntelligencePlatformMessageTerms hasProtoVersion](self, "hasProtoVersion"))
        goto LABEL_30;
      if (!objc_msgSend(v5, "hasProtoVersion"))
        goto LABEL_30;
      v6 = -[BMIntelligencePlatformMessageTerms protoVersion](self, "protoVersion");
      if (v6 != objc_msgSend(v5, "protoVersion"))
        goto LABEL_30;
    }
    -[BMIntelligencePlatformMessageTerms bundleID](self, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMIntelligencePlatformMessageTerms bundleID](self, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_30;
    }
    -[BMIntelligencePlatformMessageTerms domain](self, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMIntelligencePlatformMessageTerms domain](self, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_30;
    }
    -[BMIntelligencePlatformMessageTerms spotlightIdentifier](self, "spotlightIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMIntelligencePlatformMessageTerms spotlightIdentifier](self, "spotlightIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "spotlightIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_30;
    }
    -[BMIntelligencePlatformMessageTerms timestamp](self, "timestamp");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMIntelligencePlatformMessageTerms timestamp](self, "timestamp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_30;
    }
    -[BMIntelligencePlatformMessageTerms sender](self, "sender");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sender");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMIntelligencePlatformMessageTerms sender](self, "sender");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sender");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_30;
    }
    -[BMIntelligencePlatformMessageTerms recipients](self, "recipients");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipients");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[BMIntelligencePlatformMessageTerms recipients](self, "recipients");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipients");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if (!v43)
      {
LABEL_30:
        v13 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    -[BMIntelligencePlatformMessageTerms termCount](self, "termCount");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "termCount");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 == v46)
    {
      v13 = 1;
    }
    else
    {
      -[BMIntelligencePlatformMessageTerms termCount](self, "termCount");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "termCount");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v47, "isEqual:", v48);

    }
    goto LABEL_31;
  }
  v13 = 0;
LABEL_32:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)protoVersion
{
  return self->_protoVersion;
}

- (BOOL)hasProtoVersion
{
  return self->_hasProtoVersion;
}

- (void)setHasProtoVersion:(BOOL)a3
{
  self->_hasProtoVersion = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (NSString)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSArray)termCount
{
  return self->_termCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termCount, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
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

    v4 = -[BMIntelligencePlatformMessageTerms initByReadFrom:]([BMIntelligencePlatformMessageTerms alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("protoVersion"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("spotlightIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 5, 0, 2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sender"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("recipients_json"), 5, 1, &__block_literal_global_206);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("termCount_json"), 5, 1, &__block_literal_global_207);
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
  return &unk_1E5F1C180;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("protoVersion"), 1, 2, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("spotlightIdentifier"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 5, 0, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sender"), 6, 13, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recipients"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("termCount"), 8, 14, objc_opt_class());
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __45__BMIntelligencePlatformMessageTerms_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_termCountJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__BMIntelligencePlatformMessageTerms_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recipientsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
