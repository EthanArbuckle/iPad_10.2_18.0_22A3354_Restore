@implementation BMProactiveHarvestingPhotosKnowledgeGraphEnrichment

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichment)initWithAbsoluteTimestamp:(id)a3 topics:(id)a4 entities:(id)a5 locations:(id)a6 uniqueID:(id)a7 contentProtection:(id)a8 personaId:(id)a9
{
  id v15;
  id v16;
  id v17;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *v18;
  double v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v15 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichment;
  v18 = -[BMEventBase init](&v25, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22, v23, v24);
    if (v15)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_topics, a4);
    objc_storeStrong((id *)&v18->_entities, a5);
    objc_storeStrong((id *)&v18->_locations, a6);
    objc_storeStrong((id *)&v18->_uniqueID, a7);
    objc_storeStrong((id *)&v18->_contentProtection, a8);
    objc_storeStrong((id *)&v18->_personaId, a9);
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
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment topics](self, "topics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment entities](self, "entities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment locations](self, "locations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment contentProtection](self, "contentProtection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment personaId](self, "personaId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingPhotosKnowledgeGraphEnrichment with absoluteTimestamp: %@, topics: %@, entities: %@, locations: %@, uniqueID: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *v5;
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v21;
  uint64_t v23;
  unint64_t v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *topics;
  uint64_t v36;
  NSArray *entities;
  uint64_t v38;
  NSArray *locations;
  int v40;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *v41;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichment;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
  {
LABEL_44:
    v41 = v5;
    goto LABEL_45;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_42:
    v34 = objc_msgSend(v6, "copy");
    topics = v5->_topics;
    v5->_topics = (NSArray *)v34;

    v36 = objc_msgSend(v7, "copy");
    entities = v5->_entities;
    v5->_entities = (NSArray *)v36;

    v38 = objc_msgSend(v8, "copy");
    locations = v5->_locations;
    v5->_locations = (NSArray *)v38;

    v40 = v4[*v11];
    if (v40)
      goto LABEL_43;
    goto LABEL_44;
  }
  v12 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v11])
      goto LABEL_42;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v9;
      v17 = *(_QWORD *)&v4[v16];
      v18 = v17 + 1;
      if (v17 == -1 || v18 > *(_QWORD *)&v4[*v10])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
      *(_QWORD *)&v4[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0)
        goto LABEL_13;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        v21 = v4[*v11];
        goto LABEL_15;
      }
    }
    v4[*v11] = 1;
LABEL_13:
    v21 = v4[*v11];
    if (v4[*v11])
      v15 = 0;
LABEL_15:
    if (v21 || (v15 & 7) == 4)
      goto LABEL_42;
    switch((v15 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
        v23 = *v9;
        v24 = *(_QWORD *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v10])
        {
          v25 = *(double *)(*(_QWORD *)&v4[*v12] + v24);
          *(_QWORD *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v11] = 1;
          v25 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v25;
        goto LABEL_41;
      case 2u:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_46;
        v26 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic initByReadFrom:]([BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic alloc], "initByReadFrom:", v4);
        if (!v26)
          goto LABEL_46;
        v27 = v26;
        v28 = v6;
        goto LABEL_34;
      case 3u:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_46;
        v29 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity initByReadFrom:]([BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity alloc], "initByReadFrom:", v4);
        if (!v29)
          goto LABEL_46;
        v27 = v29;
        v28 = v7;
        goto LABEL_34;
      case 4u:
        v44 = 0;
        v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_46;
        v30 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation initByReadFrom:]([BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation alloc], "initByReadFrom:", v4);
        if (!v30)
          goto LABEL_46;
        v27 = v30;
        v28 = v8;
LABEL_34:
        objc_msgSend(v28, "addObject:", v27);
        PBReaderRecallMark();

        goto LABEL_41;
      case 5u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 64;
        goto LABEL_38;
      case 6u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 72;
        goto LABEL_38;
      case 7u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 80;
LABEL_38:
        v33 = *(Class *)((char *)&v5->super.super.isa + v32);
        *(Class *)((char *)&v5->super.super.isa + v32) = (Class)v31;

        goto LABEL_41;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_41:
          if (*(_QWORD *)&v4[*v9] >= *(_QWORD *)&v4[*v10])
            goto LABEL_42;
          continue;
        }
LABEL_46:

LABEL_43:
        v41 = 0;
LABEL_45:

        return v41;
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
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_topics;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
        v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_entities;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_locations;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v21);
        v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v22, "writeTo:", v4, (_QWORD)v23);
        PBDataWriterRecallMark();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    }
    while (v19);
  }

  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichment)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic *v24;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  id v32;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *v43;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *v44;
  id v45;
  void *v46;
  int v47;
  id v48;
  uint64_t v49;
  id *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id *v54;
  uint64_t *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *v63;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *v64;
  id v65;
  id *v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  id *v72;
  id v73;
  uint64_t v74;
  void *v75;
  id *v76;
  uint64_t *v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  id v83;
  void *v84;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  id v93;
  uint64_t v94;
  void *v95;
  id v96;
  void *v97;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  id v104;
  id obj;
  void *v106;
  void *v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  id v132;
  _BYTE v133[128];
  uint64_t v134;
  id v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  id v139;
  _BYTE v140[128];
  uint64_t v141;
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  id v146;
  _BYTE v147[128];
  uint64_t v148;
  void *v149;
  uint64_t v150;
  _QWORD v151[4];

  v151[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)v6;
  if (!v6 || (v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v101 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v7;
    v10 = [v8 alloc];
    objc_msgSend(v9, "doubleValue");
    v12 = v11;

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v12);
LABEL_6:
    v101 = (uint64_t)v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v14, "dateFromString:", v7);
    v101 = objc_claimAutoreleasedReturnValue();

LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v17)
    {
      v98 = self;

      v15 = 0;
    }
    else
    {
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v33 = 0;
            v36 = (void *)v101;
            goto LABEL_124;
          }
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v49 = *MEMORY[0x1E0D025B8];
          v148 = *MEMORY[0x1E0CB2D50];
          v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("topics"));
          v149 = v106;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          *a4 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v27);
          goto LABEL_52;
        }
      }
      v98 = self;
    }
    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    obj = v15;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v147, 16);
    if (!v18)
      goto LABEL_24;
    v19 = v18;
    v20 = *(_QWORD *)v120;
    v99 = v5;
LABEL_16:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v120 != v20)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v21);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = *MEMORY[0x1E0D025B8];
          v143 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("topics"));
          v144 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          *a4 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2, v32);
          goto LABEL_30;
        }
        goto LABEL_51;
      }
      v23 = v22;
      v24 = [BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic alloc];
      v118 = 0;
      v25 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic initWithJSONDictionary:error:](v24, "initWithJSONDictionary:error:", v23, &v118);
      v26 = v118;
      if (v26)
      {
        v32 = v26;
        self = v98;
        v5 = v99;
        if (a4)
          *a4 = objc_retainAutorelease(v26);

        v33 = 0;
        v15 = obj;
        v104 = obj;
        goto LABEL_34;
      }
      objc_msgSend(v106, "addObject:", v25);

      if (v19 == ++v21)
      {
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v147, 16);
        v5 = v99;
        if (!v19)
        {
LABEL_24:

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entities"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqual:", v28);

          if (v29)
          {

            v27 = 0;
          }
          else if (v27)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              self = v98;
              if (!a4)
              {
                v33 = 0;
                v36 = (void *)v101;
                v15 = obj;
                goto LABEL_122;
              }
              v104 = v27;
              v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v68 = *MEMORY[0x1E0D025B8];
              v141 = *MEMORY[0x1E0CB2D50];
              v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("entities"));
              v142 = v23;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
              v32 = (id)objc_claimAutoreleasedReturnValue();
              v33 = 0;
              *a4 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2, v32);
              goto LABEL_85;
            }
          }
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v104 = v27;
          v37 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v114, v140, 16);
          if (!v37)
            goto LABEL_47;
          v38 = v37;
          v39 = *(_QWORD *)v115;
          v100 = v5;
LABEL_39:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v115 != v39)
              objc_enumerationMutation(v104);
            v41 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v40);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v50 = a4;
              if (a4)
              {
                v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v52 = *MEMORY[0x1E0D025B8];
                v136 = *MEMORY[0x1E0CB2D50];
                v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("entities"));
                v137 = v42;
                v53 = (void *)MEMORY[0x1E0C99D80];
                v54 = &v137;
                v55 = &v136;
                goto LABEL_60;
              }
              goto LABEL_83;
            }
            v42 = v41;
            v43 = [BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity alloc];
            v113 = 0;
            v44 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity initWithJSONDictionary:error:](v43, "initWithJSONDictionary:error:", v42, &v113);
            v45 = v113;
            if (v45)
            {
              v56 = v45;
              v15 = obj;
              if (a4)
                *a4 = objc_retainAutorelease(v45);

              v33 = 0;
              v32 = v104;
              v5 = v100;
              goto LABEL_119;
            }
            objc_msgSend(v23, "addObject:", v44);

            if (v38 == ++v40)
            {
              v38 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v114, v140, 16);
              v5 = v100;
              if (!v38)
              {
LABEL_47:

                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locations"));
                v32 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v32, "isEqual:", v46);

                if (v47)
                {

                  v32 = 0;
LABEL_68:
                  v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
                  v109 = 0u;
                  v110 = 0u;
                  v111 = 0u;
                  v112 = 0u;
                  v32 = v32;
                  v57 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
                  if (!v57)
                    goto LABEL_78;
                  v58 = v57;
                  v59 = *(_QWORD *)v110;
                  v100 = v5;
LABEL_70:
                  v60 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v110 != v59)
                      objc_enumerationMutation(v32);
                    v61 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v60);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      break;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v72 = a4;
                      if (a4)
                      {
                        v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v74 = *MEMORY[0x1E0D025B8];
                        v129 = *MEMORY[0x1E0CB2D50];
                        v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("locations"));
                        v130 = v62;
                        v75 = (void *)MEMORY[0x1E0C99D80];
                        v76 = &v130;
                        v77 = &v129;
                        goto LABEL_93;
                      }
                      goto LABEL_101;
                    }
                    v62 = v61;
                    v63 = [BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation alloc];
                    v108 = 0;
                    v64 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation initWithJSONDictionary:error:](v63, "initWithJSONDictionary:error:", v62, &v108);
                    v65 = v108;
                    if (v65)
                    {
                      v78 = v65;
                      if (a4)
                        *a4 = objc_retainAutorelease(v65);

                      v33 = 0;
                      goto LABEL_97;
                    }
                    objc_msgSend(v42, "addObject:", v64);

                    if (v58 == ++v60)
                    {
                      v58 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
                      v5 = v100;
                      if (v58)
                        goto LABEL_70;
LABEL_78:

                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
                      v62 = (id)objc_claimAutoreleasedReturnValue();
                      if (!v62)
                      {
                        v56 = 0;
                        v66 = a4;
                        goto LABEL_105;
                      }
                      objc_opt_class();
                      v66 = a4;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v56 = 0;
                        goto LABEL_105;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (a4)
                        {
                          v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v87 = *MEMORY[0x1E0D025B8];
                          v127 = *MEMORY[0x1E0CB2D50];
                          v78 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
                          v128 = v78;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
                          v97 = (void *)objc_claimAutoreleasedReturnValue();
                          v88 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2);
                          v33 = 0;
                          v56 = 0;
                          *a4 = v88;
                          goto LABEL_138;
                        }
                        v56 = 0;
                        v33 = 0;
                        v15 = obj;
                        goto LABEL_118;
                      }
                      v56 = v62;
LABEL_105:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentProtection"));
                      v78 = (id)objc_claimAutoreleasedReturnValue();
                      v97 = v78;
                      if (v78)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v78 = 0;
                          goto LABEL_110;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v78 = v78;
                          goto LABEL_110;
                        }
                        if (v66)
                        {
                          v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v91 = *MEMORY[0x1E0D025B8];
                          v125 = *MEMORY[0x1E0CB2D50];
                          v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
                          v126 = v95;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
                          v89 = objc_claimAutoreleasedReturnValue();
                          v33 = 0;
                          v78 = 0;
                          *v66 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2, v89);
                          v84 = (void *)v89;
                          v15 = obj;
                          goto LABEL_115;
                        }
                        v78 = 0;
                        v33 = 0;
LABEL_138:
                        v15 = obj;
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
                        v36 = (void *)v101;
LABEL_120:

                        self = v98;
LABEL_121:

                        v27 = v104;
LABEL_122:

LABEL_124:
                        v7 = v102;
                        goto LABEL_125;
                      }
LABEL_110:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personaId"));
                      v83 = (id)objc_claimAutoreleasedReturnValue();
                      v84 = v83;
                      if (v83)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v83 = 0;
                          goto LABEL_113;
                        }
                        objc_opt_class();
                        v15 = obj;
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (a4)
                          {
                            v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v94 = *MEMORY[0x1E0D025B8];
                            v123 = *MEMORY[0x1E0CB2D50];
                            v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
                            v124 = v92;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
                            v90 = (void *)objc_claimAutoreleasedReturnValue();
                            *a4 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v94, 2, v90);

                          }
                          v95 = 0;
                          v33 = 0;
LABEL_115:

                          goto LABEL_116;
                        }
                        v83 = v84;
                      }
                      else
                      {
LABEL_113:
                        v15 = obj;
                      }
                      v95 = v83;
                      v33 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment initWithAbsoluteTimestamp:topics:entities:locations:uniqueID:contentProtection:personaId:](v98, "initWithAbsoluteTimestamp:topics:entities:locations:uniqueID:contentProtection:personaId:", v101, v106, v23, v42, v56, v78, v83);
                      v98 = v33;
                      goto LABEL_115;
                    }
                  }
                  v72 = a4;
                  if (a4)
                  {
                    v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v74 = *MEMORY[0x1E0D025B8];
                    v131 = *MEMORY[0x1E0CB2D50];
                    v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("locations"));
                    v132 = v62;
                    v75 = (void *)MEMORY[0x1E0C99D80];
                    v76 = &v132;
                    v77 = &v131;
LABEL_93:
                    objc_msgSend(v75, "dictionaryWithObjects:forKeys:count:", v76, v77, 1);
                    v78 = (id)objc_claimAutoreleasedReturnValue();
                    v79 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 2, v78);
                    v33 = 0;
                    *v72 = v79;
LABEL_97:
                    v56 = v32;
                    v5 = v100;
                    v15 = obj;
                    goto LABEL_117;
                  }
LABEL_101:
                  v33 = 0;
                  v56 = v32;
LABEL_61:
                  v5 = v100;
LABEL_62:
                  v36 = (void *)v101;
                  v15 = obj;
                  goto LABEL_120;
                }
                if (!v32)
                  goto LABEL_68;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  goto LABEL_68;
                if (a4)
                {
                  v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v81 = *MEMORY[0x1E0D025B8];
                  v134 = *MEMORY[0x1E0CB2D50];
                  v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("locations"));
                  v135 = v42;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
                  v56 = (id)objc_claimAutoreleasedReturnValue();
                  v82 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v81, 2, v56);
                  v33 = 0;
                  *a4 = v82;
                  goto LABEL_62;
                }
                v33 = 0;
LABEL_84:
                self = v98;
LABEL_85:
                v36 = (void *)v101;
                v15 = obj;
                goto LABEL_121;
              }
              goto LABEL_39;
            }
          }
          v50 = a4;
          if (a4)
          {
            v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v52 = *MEMORY[0x1E0D025B8];
            v138 = *MEMORY[0x1E0CB2D50];
            v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("entities"));
            v139 = v42;
            v53 = (void *)MEMORY[0x1E0C99D80];
            v54 = &v139;
            v55 = &v138;
LABEL_60:
            objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, 1);
            v56 = (id)objc_claimAutoreleasedReturnValue();
            v33 = 0;
            *v50 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2, v56);
            v32 = v104;
            goto LABEL_61;
          }
LABEL_83:
          v33 = 0;
          v32 = v104;
          v5 = v100;
          goto LABEL_84;
        }
        goto LABEL_16;
      }
    }
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v31 = *MEMORY[0x1E0D025B8];
      v145 = *MEMORY[0x1E0CB2D50];
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("topics"));
      v146 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v32);
LABEL_30:
      v15 = obj;
      v104 = obj;
      self = v98;
      v5 = v99;
LABEL_34:
      v36 = (void *)v101;
      goto LABEL_121;
    }
LABEL_51:
    v33 = 0;
    v15 = obj;
    v27 = obj;
    self = v98;
    v5 = v99;
LABEL_52:
    v36 = (void *)v101;
    goto LABEL_122;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v7;
    goto LABEL_6;
  }
  if (a4)
  {
    v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v70 = *MEMORY[0x1E0D025B8];
    v150 = *MEMORY[0x1E0CB2D50];
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
    v151[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, &v150, 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
    v36 = 0;
    v33 = 0;
    *a4 = v71;

    goto LABEL_124;
  }
  v36 = 0;
  v33 = 0;
LABEL_125:

  return v33;
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
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment topics](self, "topics", 0);
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

- (id)_entitiesJSONArray
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
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment entities](self, "entities", 0);
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

- (id)_locationsJSONArray
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
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment locations](self, "locations", 0);
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment _topicsJSONArray](self, "_topicsJSONArray");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment _entitiesJSONArray](self, "_entitiesJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment _locationsJSONArray](self, "_locationsJSONArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment uniqueID](self, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment contentProtection](self, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment personaId](self, "personaId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("absoluteTimestamp");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v13;
  v28[0] = v13;
  v27[1] = CFSTR("topics");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v14;
  v28[1] = v14;
  v27[2] = CFSTR("entities");
  v15 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v6;
  v22 = (void *)v15;
  v28[2] = v15;
  v27[3] = CFSTR("locations");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v7;
  v28[3] = v16;
  v27[4] = CFSTR("uniqueID");
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v17;
  v27[5] = CFSTR("contentProtection");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v18;
  v27[6] = CFSTR("personaId");
  v19 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_20;
LABEL_28:

    if (v10)
      goto LABEL_21;
    goto LABEL_29;
  }

  if (!v11)
    goto LABEL_28;
LABEL_20:
  if (v10)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v9)

  if (v8)
  {
    if (v25)
      goto LABEL_25;
LABEL_31:

    if (v26)
      goto LABEL_26;
LABEL_32:

    goto LABEL_26;
  }

  if (!v25)
    goto LABEL_31;
LABEL_25:
  if (!v26)
    goto LABEL_32;
LABEL_26:

  return v20;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment topics](self, "topics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topics");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment topics](self, "topics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment entities](self, "entities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entities");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment entities](self, "entities");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment locations](self, "locations");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locations");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment locations](self, "locations");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locations");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment uniqueID](self, "uniqueID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment uniqueID](self, "uniqueID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_25;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment contentProtection](self, "contentProtection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment contentProtection](self, "contentProtection");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
      {
LABEL_25:
        v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment personaId](self, "personaId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44 == v45)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment personaId](self, "personaId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v46, "isEqual:", v47);

    }
    goto LABEL_26;
  }
  v12 = 0;
LABEL_27:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
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

    v7 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment initByReadFrom:]([BMProactiveHarvestingPhotosKnowledgeGraphEnrichment alloc], "initByReadFrom:", v6);
    v7[8] = 2;

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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("topics_json"), 5, 1, &__block_literal_global_57220);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("entities_json"), 5, 1, &__block_literal_global_227_57221);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("locations_json"), 5, 1, &__block_literal_global_228_57222);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 7, 13, 0);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E610;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topics"), 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entities"), 3, 14, objc_opt_class());
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locations"), 4, 14, objc_opt_class());
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 5, 13, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 6, 13, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 7, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __62__BMProactiveHarvestingPhotosKnowledgeGraphEnrichment_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_locationsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__BMProactiveHarvestingPhotosKnowledgeGraphEnrichment_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_entitiesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__BMProactiveHarvestingPhotosKnowledgeGraphEnrichment_columns__block_invoke(uint64_t a1, void *a2)
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
