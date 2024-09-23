@implementation BMUniversalRecentsMetadata

- (BMUniversalRecentsMetadata)initWithAbsoluteTimestamp:(id)a3 userActivityData:(id)a4 title:(id)a5 activityType:(id)a6 associatedBundleID:(id)a7 associatedURLString:(id)a8 modeIdentifier:(id)a9 topics:(id)a10 hasAssociatedImageRepresentation:(id)a11 uuid:(id)a12
{
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  BMUniversalRecentsMetadata *v23;
  double v24;
  id obj;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v19 = v17;
  v39 = v18;
  v27 = a5;
  v38 = a5;
  v28 = a6;
  v37 = a6;
  v29 = a7;
  v36 = a7;
  v30 = a8;
  v35 = a8;
  v34 = a9;
  v31 = a10;
  v20 = a10;
  v21 = a11;
  v32 = a12;
  v22 = a12;
  v40.receiver = self;
  v40.super_class = (Class)BMUniversalRecentsMetadata;
  v23 = -[BMEventBase init](&v40, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v19)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v19, "timeIntervalSince1970", obj, a5, a6, v29, a8, a10, a12);
    }
    else
    {
      v19 = 0;
      v23->_hasRaw_absoluteTimestamp = 0;
      v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_userActivityData, obj);
    objc_storeStrong((id *)&v23->_title, v27);
    objc_storeStrong((id *)&v23->_activityType, v28);
    objc_storeStrong((id *)&v23->_associatedBundleID, v29);
    objc_storeStrong((id *)&v23->_associatedURLString, v30);
    objc_storeStrong((id *)&v23->_modeIdentifier, a9);
    objc_storeStrong((id *)&v23->_topics, v31);
    if (v21)
    {
      v23->_hasHasAssociatedImageRepresentation = 1;
      v23->_hasAssociatedImageRepresentation = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v23->_hasHasAssociatedImageRepresentation = 0;
      v23->_hasAssociatedImageRepresentation = 0;
    }
    objc_storeStrong((id *)&v23->_uuid, v32);
  }

  return v23;
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
  void *v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMUniversalRecentsMetadata absoluteTimestamp](self, "absoluteTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata userActivityData](self, "userActivityData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata associatedBundleID](self, "associatedBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata associatedURLString](self, "associatedURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata modeIdentifier](self, "modeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata topics](self, "topics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUniversalRecentsMetadata hasAssociatedImageRepresentation](self, "hasAssociatedImageRepresentation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMUniversalRecentsMetadata with absoluteTimestamp: %@, userActivityData: %@, title: %@, activityType: %@, associatedBundleID: %@, associatedURLString: %@, modeIdentifier: %@, topics: %@, hasAssociatedImageRepresentation: %@, uuid: %@"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMUniversalRecentsMetadata *v5;
  void *v6;
  int *v7;
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
  unint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  id v28;
  void *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  uint64_t v38;
  NSArray *topics;
  int v40;
  BMUniversalRecentsMetadata *v41;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMUniversalRecentsMetadata;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
    goto LABEL_53;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMAdPlatformsTrainingRows__userQueryVector;
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v7;
        v16 = *(_QWORD *)&v4[v15];
        v17 = v16 + 1;
        if (v16 == -1 || v17 > *(_QWORD *)&v4[*v8])
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
          v20 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v20 = v4[*v9];
      if (v4[*v9])
        v14 = 0;
LABEL_15:
      if (v20 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          *((_BYTE *)&v5->super.super.isa + v10[777]) = 1;
          v22 = *v7;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v24 = *(double *)(*(_QWORD *)&v4[*v11] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v24 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v24;
          continue;
        case 2u:
          PBReaderReadData();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 40;
          goto LABEL_42;
        case 3u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 48;
          goto LABEL_42;
        case 4u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 56;
          goto LABEL_42;
        case 5u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 64;
          goto LABEL_42;
        case 6u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 72;
          goto LABEL_42;
        case 7u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 80;
          goto LABEL_42;
        case 8u:
          v44 = 0;
          v45 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_55;
          v27 = v10;
          v28 = -[BMUniversalRecentsMetadataTopic initByReadFrom:]([BMUniversalRecentsMetadataTopic alloc], "initByReadFrom:", v4);
          if (!v28)
            goto LABEL_55;
          v29 = v28;
          objc_msgSend(v6, "addObject:", v28);
          PBReaderRecallMark();

          v10 = v27;
          continue;
        case 9u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasHasAssociatedImageRepresentation = 1;
          break;
        case 0xAu:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 96;
LABEL_42:
          v37 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_55:

          goto LABEL_52;
      }
      while (1)
      {
        v33 = *v7;
        v34 = *(_QWORD *)&v4[v33];
        v35 = v34 + 1;
        if (v34 == -1 || v35 > *(_QWORD *)&v4[*v8])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v34);
        *(_QWORD *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0)
          goto LABEL_46;
        v30 += 7;
        v19 = v31++ >= 9;
        if (v19)
        {
          v32 = 0;
          goto LABEL_48;
        }
      }
      v4[*v9] = 1;
LABEL_46:
      if (v4[*v9])
        v32 = 0;
LABEL_48:
      v5->_hasAssociatedImageRepresentation = v32 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v38 = objc_msgSend(v6, "copy");
  topics = v5->_topics;
  v5->_topics = (NSArray *)v38;

  v40 = v4[*v9];
  if (v40)
LABEL_52:
    v41 = 0;
  else
LABEL_53:
    v41 = v5;

  return v41;
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
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_userActivityData)
    PBDataWriterWriteDataField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_activityType)
    PBDataWriterWriteStringField();
  if (self->_associatedBundleID)
    PBDataWriterWriteStringField();
  if (self->_associatedURLString)
    PBDataWriterWriteStringField();
  if (self->_modeIdentifier)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_topics;
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

  if (self->_hasHasAssociatedImageRepresentation)
    PBDataWriterWriteBOOLField();
  if (self->_uuid)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMUniversalRecentsMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMUniversalRecentsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  BMUniversalRecentsMetadataTopic *v34;
  BMUniversalRecentsMetadataTopic *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id *v44;
  id v45;
  BMUniversalRecentsMetadata *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  id v86;
  void *v87;
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  id *v93;
  id v94;
  uint64_t v95;
  void *v96;
  id *v97;
  uint64_t *v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  id v103;
  id v104;
  uint64_t v105;
  id v106;
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  void *v115;
  void *v116;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id *v138;
  id v139;
  id v140;
  void *v141;
  id v142;
  void *v145;
  void *v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  id v157;
  uint64_t v158;
  id v159;
  _BYTE v160[128];
  uint64_t v161;
  void *v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  _QWORD v176[3];

  v176[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (objc_class *)MEMORY[0x1E0C99D68];
      v8 = v5;
      v9 = [v7 alloc];
      objc_msgSend(v8, "doubleValue");
      v11 = v10;

      v12 = (id)objc_msgSend(v9, "initWithTimeIntervalSince1970:", v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v13, "dateFromString:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v104 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v105 = *MEMORY[0x1E0D025B8];
          v175 = *MEMORY[0x1E0CB2D50];
          v106 = v4;
          v107 = objc_alloc(MEMORY[0x1E0CB3940]);
          v123 = objc_opt_class();
          v108 = v107;
          v4 = v106;
          v109 = objc_msgSend(v108, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), v123, CFSTR("absoluteTimestamp"));
          v176[0] = v109;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v176, &v175, 1);
          v110 = objc_claimAutoreleasedReturnValue();
          v111 = v104;
          v15 = (id)v109;
          v112 = v105;
          v14 = (void *)v110;
          v6 = 0;
          v46 = 0;
          *a4 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v112, 2, v110);
          goto LABEL_121;
        }
        v6 = 0;
        v46 = 0;
        goto LABEL_122;
      }
      v12 = v5;
    }
    v6 = v12;
  }
  else
  {
    v6 = 0;
  }
LABEL_9:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userActivityData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = v14;
        v41 = *MEMORY[0x1E0D025B8];
        v173 = *MEMORY[0x1E0CB2D50];
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("userActivityData"));
        v174 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v41;
        v14 = v40;
        v44 = (id *)v42;
        v45 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v43, 2, v16);
        v46 = 0;
        v15 = 0;
        *a4 = v45;
        goto LABEL_120;
      }
      v15 = 0;
      v46 = 0;
      goto LABEL_121;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v16;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v44 = a4;
      if (a4)
      {
        v132 = v15;
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = v14;
        v49 = *MEMORY[0x1E0D025B8];
        v171 = *MEMORY[0x1E0CB2D50];
        v50 = v6;
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        v118 = objc_opt_class();
        v52 = v51;
        v6 = v50;
        v140 = (id)objc_msgSend(v52, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v118, CFSTR("title"));
        v172 = v140;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v47;
        v15 = v132;
        v54 = v49;
        v14 = v48;
        v46 = 0;
        v44 = 0;
        *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v17);
        goto LABEL_119;
      }
      v46 = 0;
      goto LABEL_120;
    }
    v138 = v16;
  }
  else
  {
    v138 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activityType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v17;
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v140 = 0;
        v46 = 0;
        v44 = v138;
        goto LABEL_119;
      }
      v55 = v15;
      v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v57 = v14;
      v58 = *MEMORY[0x1E0D025B8];
      v169 = *MEMORY[0x1E0CB2D50];
      v59 = v6;
      v60 = objc_alloc(MEMORY[0x1E0CB3940]);
      v119 = objc_opt_class();
      v61 = v60;
      v6 = v59;
      v62 = (void *)objc_msgSend(v61, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v119, CFSTR("activityType"));
      v170 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v56;
      v15 = v55;
      v17 = v146;
      v65 = v58;
      v14 = v57;
      v137 = (void *)v63;
      v46 = 0;
      v140 = 0;
      *a4 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
LABEL_95:
      v16 = v141;
      v44 = v138;
      goto LABEL_118;
    }
    v140 = v17;
  }
  else
  {
    v140 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("associatedBundleID"));
  v18 = objc_claimAutoreleasedReturnValue();
  v137 = (void *)v18;
  if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v139 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v66 = v15;
      v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v68 = v14;
      v69 = *MEMORY[0x1E0D025B8];
      v167 = *MEMORY[0x1E0CB2D50];
      v70 = v6;
      v71 = objc_alloc(MEMORY[0x1E0CB3940]);
      v120 = objc_opt_class();
      v72 = v71;
      v6 = v70;
      v136 = (id)objc_msgSend(v72, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v120, CFSTR("associatedBundleID"));
      v168 = v136;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v67;
      v15 = v66;
      v17 = v146;
      v75 = v69;
      v14 = v68;
      v135 = (void *)v73;
      v46 = 0;
      v62 = 0;
      *a4 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2);
      v16 = v141;
      v44 = v138;
      goto LABEL_117;
    }
    v62 = 0;
    v46 = 0;
    goto LABEL_95;
  }
  v139 = v19;
LABEL_21:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("associatedURLString"));
  v20 = objc_claimAutoreleasedReturnValue();
  v135 = (void *)v20;
  if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v76 = v15;
        v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v78 = v14;
        v79 = *MEMORY[0x1E0D025B8];
        v165 = *MEMORY[0x1E0CB2D50];
        v80 = v6;
        v81 = objc_alloc(MEMORY[0x1E0CB3940]);
        v121 = objc_opt_class();
        v82 = v81;
        v6 = v80;
        v24 = (id)objc_msgSend(v82, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v121, CFSTR("associatedURLString"));
        v166 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1);
        v83 = objc_claimAutoreleasedReturnValue();
        v84 = v77;
        v15 = v76;
        v17 = v146;
        v85 = v79;
        v14 = v78;
        v130 = (void *)v83;
        v46 = 0;
        v136 = 0;
        *a4 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 2);
        v16 = v141;
        v44 = v138;
        goto LABEL_115;
      }
      v136 = 0;
      v46 = 0;
      v44 = v138;
      goto LABEL_116;
    }
    v133 = v6;
    v136 = v21;
  }
  else
  {
    v133 = v6;
    v136 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeIdentifier"));
  v22 = objc_claimAutoreleasedReturnValue();
  v129 = v5;
  v130 = (void *)v22;
  v131 = v15;
  if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v87 = v14;
        v88 = *MEMORY[0x1E0D025B8];
        v163 = *MEMORY[0x1E0CB2D50];
        v89 = objc_alloc(MEMORY[0x1E0CB3940]);
        v122 = objc_opt_class();
        v90 = v89;
        v6 = v133;
        v25 = (id)objc_msgSend(v90, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v122, CFSTR("modeIdentifier"));
        v164 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
        v91 = objc_claimAutoreleasedReturnValue();
        v92 = v88;
        v14 = v87;
        v145 = (void *)v91;
        v46 = 0;
        v24 = 0;
        *a4 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v92, 2);
        v44 = v138;
        goto LABEL_113;
      }
      v24 = 0;
      v46 = 0;
      v44 = v138;
      v6 = v133;
      goto LABEL_115;
    }
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topics"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  v6 = v133;
  v128 = v14;
  if (v27)
  {
    v126 = v4;
    v127 = v24;

    v25 = 0;
  }
  else
  {
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v101 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v102 = *MEMORY[0x1E0D025B8];
          v161 = *MEMORY[0x1E0CB2D50];
          v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("topics"));
          v162 = v145;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v103 = (id)objc_msgSend(v101, "initWithDomain:code:userInfo:", v102, 2, v38);
          v46 = 0;
          *a4 = v103;
          v44 = v138;
          goto LABEL_112;
        }
        v46 = 0;
        v15 = v131;
        v44 = v138;
        goto LABEL_114;
      }
    }
    v126 = v4;
    v127 = v24;
  }
  v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count"));
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v25 = v25;
  v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v148, v160, 16);
  if (!v28)
    goto LABEL_50;
  v29 = v28;
  v30 = *(_QWORD *)v149;
  while (2)
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v149 != v30)
        objc_enumerationMutation(v25);
      v32 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v93 = a4;
        if (a4)
        {
          v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v95 = *MEMORY[0x1E0D025B8];
          v158 = *MEMORY[0x1E0CB2D50];
          v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("topics"));
          v159 = v33;
          v96 = (void *)MEMORY[0x1E0C99D80];
          v97 = &v159;
          v98 = &v158;
LABEL_75:
          objc_msgSend(v96, "dictionaryWithObjects:forKeys:count:", v97, v98, 1);
          v99 = (id)objc_claimAutoreleasedReturnValue();
          v100 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v95, 2, v99);
          v46 = 0;
          *v93 = v100;
LABEL_79:
          v38 = v25;
          v4 = v126;
          v6 = v133;
          v16 = v141;
          v44 = v138;
          v37 = v139;
          goto LABEL_109;
        }
LABEL_84:
        v46 = 0;
        v38 = v25;
        v4 = v126;
        v6 = v133;
        v16 = v141;
        v44 = v138;
        goto LABEL_111;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v93 = a4;
        if (a4)
        {
          v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v95 = *MEMORY[0x1E0D025B8];
          v156 = *MEMORY[0x1E0CB2D50];
          v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("topics"));
          v157 = v33;
          v96 = (void *)MEMORY[0x1E0C99D80];
          v97 = &v157;
          v98 = &v156;
          goto LABEL_75;
        }
        goto LABEL_84;
      }
      v33 = v32;
      v34 = [BMUniversalRecentsMetadataTopic alloc];
      v147 = 0;
      v35 = -[BMUniversalRecentsMetadataTopic initWithJSONDictionary:error:](v34, "initWithJSONDictionary:error:", v33, &v147);
      v36 = v147;
      if (v36)
      {
        v99 = v36;
        if (a4)
          *a4 = objc_retainAutorelease(v36);

        v46 = 0;
        goto LABEL_79;
      }
      objc_msgSend(v145, "addObject:", v35);

      v17 = v146;
    }
    v29 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v148, v160, 16);
    v16 = v141;
    if (v29)
      continue;
    break;
  }
LABEL_50:

  v4 = v126;
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("hasAssociatedImageRepresentation"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    v38 = 0;
    v6 = v133;
    v37 = v139;
    goto LABEL_91;
  }
  objc_opt_class();
  v6 = v133;
  v37 = v139;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = 0;
    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v33;
LABEL_91:
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("uuid"));
    v99 = (id)objc_claimAutoreleasedReturnValue();
    v125 = v99;
    if (v99)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v99 = 0;
        goto LABEL_98;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v99 = v99;
        v16 = v141;
        goto LABEL_98;
      }
      if (a4)
      {
        v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v124 = *MEMORY[0x1E0D025B8];
        v152 = *MEMORY[0x1E0CB2D50];
        v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uuid"));
        v153 = v115;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v124, 2, v116);

      }
      v99 = 0;
      v46 = 0;
      v16 = v141;
LABEL_107:
      v44 = v138;
    }
    else
    {
LABEL_98:
      v44 = v138;
      v46 = -[BMUniversalRecentsMetadata initWithAbsoluteTimestamp:userActivityData:title:activityType:associatedBundleID:associatedURLString:modeIdentifier:topics:hasAssociatedImageRepresentation:uuid:](self, "initWithAbsoluteTimestamp:userActivityData:title:activityType:associatedBundleID:associatedURLString:modeIdentifier:topics:hasAssociatedImageRepresentation:uuid:", v6, v131, v138, v140, v37, v136, v127, v145, v38, v99);
      self = v46;
    }

LABEL_109:
    v17 = v146;
  }
  else
  {
    if (a4)
    {
      v142 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v113 = *MEMORY[0x1E0D025B8];
      v154 = *MEMORY[0x1E0CB2D50];
      v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasAssociatedImageRepresentation"));
      v155 = v99;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = (id)objc_msgSend(v142, "initWithDomain:code:userInfo:", v113, 2);
      v46 = 0;
      v38 = 0;
      *a4 = v114;
      goto LABEL_107;
    }
    v38 = 0;
    v46 = 0;
    v44 = v138;
  }
  v139 = v37;

LABEL_111:
  v24 = v127;
LABEL_112:

  v14 = v128;
LABEL_113:

  v15 = v131;
LABEL_114:

  v5 = v129;
LABEL_115:

LABEL_116:
  v62 = v139;
LABEL_117:

LABEL_118:
LABEL_119:

LABEL_120:
LABEL_121:

LABEL_122:
  return v46;
}

- (id)_topicsJSONArray
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
  -[BMUniversalRecentsMetadata topics](self, "topics", 0);
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[10];
  _QWORD v41[12];

  v41[10] = *MEMORY[0x1E0C80C00];
  -[BMUniversalRecentsMetadata absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMUniversalRecentsMetadata absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMUniversalRecentsMetadata userActivityData](self, "userActivityData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = objc_claimAutoreleasedReturnValue();

  -[BMUniversalRecentsMetadata title](self, "title");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata activityType](self, "activityType");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata associatedBundleID](self, "associatedBundleID");
  v11 = objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata associatedURLString](self, "associatedURLString");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata modeIdentifier](self, "modeIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUniversalRecentsMetadata _topicsJSONArray](self, "_topicsJSONArray");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (-[BMUniversalRecentsMetadata hasHasAssociatedImageRepresentation](self, "hasHasAssociatedImageRepresentation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUniversalRecentsMetadata hasAssociatedImageRepresentation](self, "hasAssociatedImageRepresentation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMUniversalRecentsMetadata uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("absoluteTimestamp");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v15;
  v41[0] = v15;
  v40[1] = CFSTR("userActivityData");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v16;
  v41[1] = v16;
  v40[2] = CFSTR("title");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v17;
  v41[2] = v17;
  v40[3] = CFSTR("activityType");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v6;
  v30 = (void *)v18;
  v41[3] = v18;
  v40[4] = CFSTR("associatedBundleID");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v8;
  v29 = (void *)v19;
  v41[4] = v19;
  v40[5] = CFSTR("associatedURLString");
  v20 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v9;
  v41[5] = v20;
  v40[6] = CFSTR("modeIdentifier");
  v21 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v23 = (void *)v10;
  v41[6] = v21;
  v40[7] = CFSTR("topics");
  v24 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v11;
  v41[7] = v24;
  v40[8] = CFSTR("hasAssociatedImageRepresentation");
  v26 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[8] = v26;
  v40[9] = CFSTR("uuid");
  v27 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[9] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 10);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_28;
  }
  else
  {

    if (v13)
      goto LABEL_28;
  }

LABEL_28:
  if (!v38)

  if (!v39)
  if (!v22)

  if (!v25)
  if (v23)
  {
    if (v35)
      goto LABEL_38;
  }
  else
  {

    if (v35)
    {
LABEL_38:
      if (v36)
        goto LABEL_39;
LABEL_45:

      if (v37)
        goto LABEL_40;
LABEL_46:

      goto LABEL_40;
    }
  }

  if (!v36)
    goto LABEL_45;
LABEL_39:
  if (!v37)
    goto LABEL_46;
LABEL_40:

  return v34;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
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
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMUniversalRecentsMetadata absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMUniversalRecentsMetadata absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_40;
    }
    -[BMUniversalRecentsMetadata userActivityData](self, "userActivityData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userActivityData");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMUniversalRecentsMetadata userActivityData](self, "userActivityData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userActivityData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_40;
    }
    -[BMUniversalRecentsMetadata title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMUniversalRecentsMetadata title](self, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_40;
    }
    -[BMUniversalRecentsMetadata activityType](self, "activityType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityType");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMUniversalRecentsMetadata activityType](self, "activityType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_40;
    }
    -[BMUniversalRecentsMetadata associatedBundleID](self, "associatedBundleID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "associatedBundleID");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMUniversalRecentsMetadata associatedBundleID](self, "associatedBundleID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "associatedBundleID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_40;
    }
    -[BMUniversalRecentsMetadata associatedURLString](self, "associatedURLString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "associatedURLString");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMUniversalRecentsMetadata associatedURLString](self, "associatedURLString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "associatedURLString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_40;
    }
    -[BMUniversalRecentsMetadata modeIdentifier](self, "modeIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modeIdentifier");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMUniversalRecentsMetadata modeIdentifier](self, "modeIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modeIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_40;
    }
    -[BMUniversalRecentsMetadata topics](self, "topics");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topics");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMUniversalRecentsMetadata topics](self, "topics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topics");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_40;
    }
    if (!-[BMUniversalRecentsMetadata hasHasAssociatedImageRepresentation](self, "hasHasAssociatedImageRepresentation")
      && !objc_msgSend(v5, "hasHasAssociatedImageRepresentation")
      || -[BMUniversalRecentsMetadata hasHasAssociatedImageRepresentation](self, "hasHasAssociatedImageRepresentation")
      && objc_msgSend(v5, "hasHasAssociatedImageRepresentation")
      && (v55 = -[BMUniversalRecentsMetadata hasAssociatedImageRepresentation](self, "hasAssociatedImageRepresentation"),
          v55 == objc_msgSend(v5, "hasAssociatedImageRepresentation")))
    {
      -[BMUniversalRecentsMetadata uuid](self, "uuid");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57 == v58)
      {
        v12 = 1;
      }
      else
      {
        -[BMUniversalRecentsMetadata uuid](self, "uuid");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v59, "isEqual:", v60);

      }
      goto LABEL_41;
    }
LABEL_40:
    v12 = 0;
LABEL_41:

    goto LABEL_42;
  }
  v12 = 0;
LABEL_42:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (NSString)associatedURLString
{
  return self->_associatedURLString;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSArray)topics
{
  return self->_topics;
}

- (BOOL)hasAssociatedImageRepresentation
{
  return self->_hasAssociatedImageRepresentation;
}

- (BOOL)hasHasAssociatedImageRepresentation
{
  return self->_hasHasAssociatedImageRepresentation;
}

- (void)setHasHasAssociatedImageRepresentation:(BOOL)a3
{
  self->_hasHasAssociatedImageRepresentation = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedURLString, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4B728;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4B738;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[9] = a4;

LABEL_7:
  return v8;
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
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userActivityData"), 4, 0, 2, 14, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityType"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("associatedBundleID"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("associatedURLString"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modeIdentifier"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("topics_json"), 5, 1, &__block_literal_global_32958);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasAssociatedImageRepresentation"), 0, 0, 9, 12, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uuid"), 2, 0, 10, 13, 0);
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C630;
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
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userActivityData"), 2, 14, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 3, 13, 0);
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityType"), 4, 13, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("associatedBundleID"), 5, 13, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("associatedURLString"), 6, 13, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modeIdentifier"), 7, 13, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topics"), 8, 14, objc_opt_class());
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasAssociatedImageRepresentation"), 9, 12, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uuid"), 10, 13, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __37__BMUniversalRecentsMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_topicsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
