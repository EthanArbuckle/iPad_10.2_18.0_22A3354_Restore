@implementation BMTextUnderstandingPoemBuffer

- (BMTextUnderstandingPoemBuffer)initWithMessageTimestamp:(id)a3 conversationId:(id)a4 spotlightId:(id)a5 photoAttachment:(id)a6 extractions:(id)a7 continuousFeatures:(id)a8 rawMessage:(id)a9
{
  return -[BMTextUnderstandingPoemBuffer initWithMessageTimestamp:conversationId:spotlightId:photoAttachment:extractions:continuousFeatures:rawMessage:senderId:](self, "initWithMessageTimestamp:conversationId:spotlightId:photoAttachment:extractions:continuousFeatures:rawMessage:senderId:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (BMTextUnderstandingPoemBuffer)initWithMessageTimestamp:(id)a3 conversationId:(id)a4 spotlightId:(id)a5 photoAttachment:(id)a6 extractions:(id)a7 continuousFeatures:(id)a8 rawMessage:(id)a9 senderId:(id)a10
{
  id v16;
  id v17;
  BMTextUnderstandingPoemBuffer *v18;
  double v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v16 = a3;
  v26 = a4;
  v25 = a5;
  v17 = a6;
  v24 = a7;
  v23 = a8;
  v22 = a9;
  v21 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMTextUnderstandingPoemBuffer;
  v18 = -[BMEventBase init](&v27, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v18->_hasRaw_messageTimestamp = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v18->_hasRaw_messageTimestamp = 0;
      v19 = -1.0;
    }
    v18->_raw_messageTimestamp = v19;
    objc_storeStrong((id *)&v18->_conversationId, a4);
    objc_storeStrong((id *)&v18->_spotlightId, a5);
    if (v17)
    {
      v18->_hasPhotoAttachment = 1;
      v18->_photoAttachment = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v18->_hasPhotoAttachment = 0;
      v18->_photoAttachment = 0;
    }
    objc_storeStrong((id *)&v18->_extractions, a7);
    objc_storeStrong((id *)&v18->_continuousFeatures, a8);
    objc_storeStrong((id *)&v18->_rawMessage, a9);
    objc_storeStrong((id *)&v18->_senderId, a10);
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
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMTextUnderstandingPoemBuffer messageTimestamp](self, "messageTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer conversationId](self, "conversationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer spotlightId](self, "spotlightId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemBuffer photoAttachment](self, "photoAttachment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer extractions](self, "extractions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer continuousFeatures](self, "continuousFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer rawMessage](self, "rawMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer senderId](self, "senderId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMTextUnderstandingPoemBuffer with messageTimestamp: %@, conversationId: %@, spotlightId: %@, photoAttachment: %@, extractions: %@, continuousFeatures: %@, rawMessage: %@, senderId: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMTextUnderstandingPoemBuffer *v5;
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
  uint64_t v20;
  int v21;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSArray *extractions;
  uint64_t v45;
  NSArray *continuousFeatures;
  int v47;
  BMTextUnderstandingPoemBuffer *v48;
  objc_super v50;
  uint64_t v51;
  uint64_t v52;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMTextUnderstandingPoemBuffer;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_56;
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
          v20 = *v10;
          v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = *v10;
      v21 = v4[v20];
      if (v4[v20])
        v14 = 0;
LABEL_15:
      if (v21 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          v5->_hasRaw_messageTimestamp = 1;
          v23 = *v8;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v25 = *(double *)(*(_QWORD *)&v4[*v11] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v25 = 0.0;
          }
          v5->_raw_messageTimestamp = v25;
          continue;
        case 2u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 40;
          goto LABEL_42;
        case 3u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 48;
          goto LABEL_42;
        case 4u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasPhotoAttachment = 1;
          break;
        case 5u:
          v51 = 0;
          v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_58;
          v35 = -[BMTextUnderstandingPoemBufferExtraction initByReadFrom:]([BMTextUnderstandingPoemBufferExtraction alloc], "initByReadFrom:", v4);
          if (!v35)
            goto LABEL_58;
          v36 = v35;
          objc_msgSend(v6, "addObject:", v35);
          PBReaderRecallMark();
          goto LABEL_52;
        case 6u:
          v37 = (void *)MEMORY[0x1E0CB37E8];
          v38 = *v8;
          v39 = *(_QWORD *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v40 = *(double *)(*(_QWORD *)&v4[*v11] + v39);
            *(_QWORD *)&v4[v38] = v39 + 8;
          }
          else
          {
            v4[v20] = 1;
            v40 = 0.0;
          }
          objc_msgSend(v37, "numberWithDouble:", v40);
          v42 = objc_claimAutoreleasedReturnValue();
          if (!v42)
            goto LABEL_58;
          v36 = (void *)v42;
          objc_msgSend(v7, "addObject:", v42);
LABEL_52:

          continue;
        case 7u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 72;
          goto LABEL_42;
        case 8u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 80;
LABEL_42:
          v41 = *(Class *)((char *)&v5->super.super.isa + v27);
          *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_58:

          goto LABEL_55;
      }
      while (1)
      {
        v31 = *v8;
        v32 = *(_QWORD *)&v4[v31];
        v33 = v32 + 1;
        if (v32 == -1 || v33 > *(_QWORD *)&v4[*v9])
          break;
        v34 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v32);
        *(_QWORD *)&v4[v31] = v33;
        v30 |= (unint64_t)(v34 & 0x7F) << v28;
        if ((v34 & 0x80) == 0)
          goto LABEL_44;
        v28 += 7;
        v19 = v29++ >= 9;
        if (v19)
        {
          v30 = 0;
          goto LABEL_46;
        }
      }
      v4[*v10] = 1;
LABEL_44:
      if (v4[*v10])
        v30 = 0;
LABEL_46:
      v5->_photoAttachment = v30 != 0;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v43 = objc_msgSend(v6, "copy");
  extractions = v5->_extractions;
  v5->_extractions = (NSArray *)v43;

  v45 = objc_msgSend(v7, "copy");
  continuousFeatures = v5->_continuousFeatures;
  v5->_continuousFeatures = (NSArray *)v45;

  v47 = v4[*v10];
  if (v47)
LABEL_55:
    v48 = 0;
  else
LABEL_56:
    v48 = v5;

  return v48;
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasRaw_messageTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  if (self->_spotlightId)
    PBDataWriterWriteStringField();
  if (self->_hasPhotoAttachment)
    PBDataWriterWriteBOOLField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_extractions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v20 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_continuousFeatures;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15), "doubleValue", (_QWORD)v16);
        PBDataWriterWriteDoubleField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v13);
  }

  if (self->_rawMessage)
    PBDataWriterWriteStringField();
  if (self->_senderId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMTextUnderstandingPoemBuffer writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMTextUnderstandingPoemBuffer)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  BMTextUnderstandingPoemBufferExtraction *v30;
  BMTextUnderstandingPoemBufferExtraction *v31;
  id v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  BMTextUnderstandingPoemBuffer *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  id *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id *v66;
  uint64_t *v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  uint64_t v78;
  id *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  BMTextUnderstandingPoemBuffer *v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  id v117;
  uint64_t v118;
  void *v119;
  void *v120;
  BMTextUnderstandingPoemBuffer *v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  void *v126;
  void *v127;
  void *v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  _BYTE v148[128];
  uint64_t v149;
  id v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  id v154;
  _BYTE v155[128];
  uint64_t v156;
  void *v157;
  uint64_t v158;
  id v159;
  uint64_t v160;
  id v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  _QWORD v165[3];

  v165[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageTimestamp"));
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

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSince1970:", v12);
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
      if (!a4)
      {
        v7 = 0;
        v47 = 0;
        goto LABEL_110;
      }
      v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v88 = v6;
      v89 = *MEMORY[0x1E0D025B8];
      v164 = *MEMORY[0x1E0CB2D50];
      v90 = self;
      v91 = objc_alloc(MEMORY[0x1E0CB3940]);
      v107 = objc_opt_class();
      v92 = v91;
      self = v90;
      v46 = (void *)objc_msgSend(v92, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), v107, CFSTR("messageTimestamp"));
      v165[0] = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, &v164, 1);
      v93 = objc_claimAutoreleasedReturnValue();
      v94 = v89;
      v6 = v88;
      v127 = (void *)v93;
      v95 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v94, 2);
      v7 = 0;
      v47 = 0;
      *a4 = v95;
      goto LABEL_109;
    }
    v13 = v6;
    goto LABEL_6;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v14, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("conversationId"));
  v15 = objc_claimAutoreleasedReturnValue();
  v127 = (void *)v15;
  if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v124 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v124 = v16;
LABEL_12:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spotlightId"));
    v17 = objc_claimAutoreleasedReturnValue();
    v126 = (void *)v17;
    if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v18;
LABEL_15:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photoAttachment"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v7;
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v119 = v20;
        v120 = v6;
        v123 = 0;
LABEL_18:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extractions"));
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        v121 = self;
        if (v23)
        {
          v115 = v5;
          v116 = v19;

          v21 = 0;
LABEL_25:
          v129 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
          v136 = 0u;
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v21 = v21;
          v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
          if (!v24)
            goto LABEL_35;
          v25 = v24;
          v26 = *(_QWORD *)v137;
          while (1)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v137 != v26)
                objc_enumerationMutation(v21);
              v28 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v62 = a4;
                if (a4)
                {
                  v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v64 = *MEMORY[0x1E0D025B8];
                  v153 = *MEMORY[0x1E0CB2D50];
                  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("extractions"));
                  v154 = v29;
                  v65 = (void *)MEMORY[0x1E0C99D80];
                  v66 = &v154;
                  v67 = &v153;
LABEL_51:
                  objc_msgSend(v65, "dictionaryWithObjects:forKeys:count:", v66, v67, 1);
                  v68 = (id)objc_claimAutoreleasedReturnValue();
                  v69 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 2, v68);
                  v47 = 0;
                  *v62 = v69;
                  v33 = v21;
                  v5 = v115;
                  goto LABEL_86;
                }
LABEL_73:
                v47 = 0;
                v33 = v21;
                v5 = v115;
                self = v121;
                v46 = v124;
                goto LABEL_74;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v62 = a4;
                if (a4)
                {
                  v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v64 = *MEMORY[0x1E0D025B8];
                  v151 = *MEMORY[0x1E0CB2D50];
                  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("extractions"));
                  v152 = v29;
                  v65 = (void *)MEMORY[0x1E0C99D80];
                  v66 = &v152;
                  v67 = &v151;
                  goto LABEL_51;
                }
                goto LABEL_73;
              }
              v29 = v28;
              v30 = [BMTextUnderstandingPoemBufferExtraction alloc];
              v135 = 0;
              v31 = -[BMTextUnderstandingPoemBufferExtraction initWithJSONDictionary:error:](v30, "initWithJSONDictionary:error:", v29, &v135);
              v32 = v135;
              if (v32)
              {
                v68 = v32;
                v55 = v119;
                if (a4)
                  *a4 = objc_retainAutorelease(v32);

                v47 = 0;
                v33 = v21;
                v5 = v115;
                v19 = v116;
                self = v121;
                v46 = v124;
                goto LABEL_103;
              }
              objc_msgSend(v129, "addObject:", v31);

            }
            v25 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
            if (!v25)
            {
LABEL_35:

              v5 = v115;
              objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("continuousFeatures"));
              v33 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v33, "isEqual:", v34);

              if (v35)
              {

                v33 = 0;
                self = v121;
LABEL_57:
                v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v33, "count"));
                v131 = 0u;
                v132 = 0u;
                v133 = 0u;
                v134 = 0u;
                v33 = v33;
                v70 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
                if (!v70)
                  goto LABEL_66;
                v71 = v70;
                v72 = *(_QWORD *)v132;
LABEL_59:
                v73 = 0;
                while (1)
                {
                  if (*(_QWORD *)v132 != v72)
                    objc_enumerationMutation(v33);
                  v74 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * v73);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    break;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v79 = a4;
                    if (a4)
                    {
                      v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v86 = *MEMORY[0x1E0D025B8];
                      v144 = *MEMORY[0x1E0CB2D50];
                      v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("continuousFeatures"));
                      v145 = v113;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
                      v82 = objc_claimAutoreleasedReturnValue();
                      v83 = v85;
                      v84 = v86;
                      goto LABEL_81;
                    }
                    goto LABEL_85;
                  }
                  objc_msgSend(v29, "addObject:", v74);
                  if (v71 == ++v73)
                  {
                    v71 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
                    self = v121;
                    if (v71)
                      goto LABEL_59;
LABEL_66:

                    objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("rawMessage"));
                    v75 = objc_claimAutoreleasedReturnValue();
                    v113 = (void *)v75;
                    if (!v75)
                    {
                      v68 = 0;
                      v46 = v124;
                      goto LABEL_94;
                    }
                    v76 = (void *)v75;
                    objc_opt_class();
                    v46 = v124;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v68 = 0;
                      goto LABEL_94;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v68 = v76;
LABEL_94:
                      v19 = v116;
                      objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("senderId"));
                      v98 = (id)objc_claimAutoreleasedReturnValue();
                      v109 = v98;
                      if (v98)
                      {
                        v99 = v98;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v98 = 0;
                          goto LABEL_99;
                        }
                        v100 = v116;
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v98 = v99;
                          goto LABEL_99;
                        }
                        if (a4)
                        {
                          v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v118 = *MEMORY[0x1E0D025B8];
                          v140 = *MEMORY[0x1E0CB2D50];
                          v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("senderId"));
                          v141 = v104;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
                          v105 = (void *)objc_claimAutoreleasedReturnValue();
                          *a4 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v118, 2, v105);

                        }
                        v112 = 0;
                        v47 = 0;
                        v19 = v100;
                      }
                      else
                      {
LABEL_99:
                        v112 = v98;
                        self = -[BMTextUnderstandingPoemBuffer initWithMessageTimestamp:conversationId:spotlightId:photoAttachment:extractions:continuousFeatures:rawMessage:senderId:](self, "initWithMessageTimestamp:conversationId:spotlightId:photoAttachment:extractions:continuousFeatures:rawMessage:senderId:", v122, v46, v116, v123, v129, v29, v68, v98);
                        v47 = self;
                      }
LABEL_100:
                      v55 = v119;

                    }
                    else
                    {
                      if (a4)
                      {
                        v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v108 = *MEMORY[0x1E0D025B8];
                        v142 = *MEMORY[0x1E0CB2D50];
                        v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("rawMessage"));
                        v143 = v112;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
                        v102 = objc_claimAutoreleasedReturnValue();
                        v103 = v110;
                        v109 = (void *)v102;
                        v47 = 0;
                        v68 = 0;
                        *a4 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v108, 2);
                        v19 = v116;
                        goto LABEL_100;
                      }
                      v68 = 0;
                      v47 = 0;
                      v19 = v116;
                      v55 = v119;
                    }
LABEL_102:

LABEL_103:
LABEL_104:

                    v6 = v120;
                    goto LABEL_106;
                  }
                }
                v79 = a4;
                if (a4)
                {
                  v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v81 = *MEMORY[0x1E0D025B8];
                  v146 = *MEMORY[0x1E0CB2D50];
                  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("continuousFeatures"));
                  v147 = v113;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
                  v82 = objc_claimAutoreleasedReturnValue();
                  v83 = v80;
                  v84 = v81;
LABEL_81:
                  v111 = (void *)v82;
                  self = v121;
                  v46 = v124;
                  v55 = v119;
                  v47 = 0;
                  *v79 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2);
                  v68 = v33;
                  v19 = v116;

                  goto LABEL_102;
                }
LABEL_85:
                v47 = 0;
                v68 = v33;
LABEL_86:
                self = v121;
                v46 = v124;
LABEL_87:
                v19 = v116;
                v55 = v119;
                goto LABEL_103;
              }
              self = v121;
              if (!v33)
                goto LABEL_57;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_57;
              v46 = v124;
              if (a4)
              {
                v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v96 = *MEMORY[0x1E0D025B8];
                v149 = *MEMORY[0x1E0CB2D50];
                v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("continuousFeatures"));
                v150 = v29;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
                v68 = (id)objc_claimAutoreleasedReturnValue();
                v97 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v96, 2, v68);
                v47 = 0;
                *a4 = v97;
                goto LABEL_87;
              }
              v47 = 0;
LABEL_74:
              v19 = v116;
              v55 = v119;
              goto LABEL_104;
            }
          }
        }
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v115 = v5;
          v116 = v19;
          goto LABEL_25;
        }
        if (a4)
        {
          v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v78 = *MEMORY[0x1E0D025B8];
          v156 = *MEMORY[0x1E0CB2D50];
          v129 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("extractions"));
          v157 = v129;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          v47 = 0;
          *a4 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v78, 2, v33);
          v46 = v124;
          v55 = v119;
          goto LABEL_104;
        }
        v47 = 0;
        v46 = v124;
        v55 = v119;
        v6 = v120;
LABEL_106:

        v7 = v122;
        goto LABEL_107;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v119 = v20;
        v120 = v6;
        v123 = v20;
        goto LABEL_18;
      }
      if (a4)
      {
        v117 = v19;
        v56 = v6;
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v58 = *MEMORY[0x1E0D025B8];
        v158 = *MEMORY[0x1E0CB2D50];
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("photoAttachment"));
        v159 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v57;
        v6 = v56;
        v19 = v117;
        v130 = (void *)v59;
        v61 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v58, 2);
        v123 = 0;
        v47 = 0;
        *a4 = v61;
        v55 = v20;
        v46 = v124;

        goto LABEL_106;
      }
      v123 = 0;
      v47 = 0;
      v46 = v124;
      v55 = v20;
LABEL_107:

      goto LABEL_108;
    }
    if (a4)
    {
      v48 = v7;
      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v50 = v6;
      v51 = *MEMORY[0x1E0D025B8];
      v160 = *MEMORY[0x1E0CB2D50];
      v123 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("spotlightId"));
      v161 = v123;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v49;
      v7 = v48;
      v54 = v51;
      v6 = v50;
      v55 = (void *)v52;
      v19 = 0;
      v47 = 0;
      *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v52);
      v46 = v124;
      goto LABEL_107;
    }
    v19 = 0;
    v47 = 0;
    v46 = v124;
LABEL_108:

    goto LABEL_109;
  }
  if (a4)
  {
    v36 = v7;
    v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v38 = v6;
    v39 = *MEMORY[0x1E0D025B8];
    v162 = *MEMORY[0x1E0CB2D50];
    v40 = v5;
    v41 = objc_alloc(MEMORY[0x1E0CB3940]);
    v106 = objc_opt_class();
    v42 = v41;
    v5 = v40;
    v19 = (id)objc_msgSend(v42, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v106, CFSTR("conversationId"));
    v163 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v37;
    v7 = v36;
    v45 = v39;
    v6 = v38;
    v126 = (void *)v43;
    v46 = 0;
    v47 = 0;
    *a4 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
    goto LABEL_108;
  }
  v46 = 0;
  v47 = 0;
LABEL_109:

LABEL_110:
  return v47;
}

- (id)_extractionsJSONArray
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
  -[BMTextUnderstandingPoemBuffer extractions](self, "extractions", 0);
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

- (id)_continuousFeaturesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMTextUnderstandingPoemBuffer continuousFeatures](self, "continuousFeatures", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[10];

  v30[8] = *MEMORY[0x1E0C80C00];
  -[BMTextUnderstandingPoemBuffer messageTimestamp](self, "messageTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMTextUnderstandingPoemBuffer messageTimestamp](self, "messageTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMTextUnderstandingPoemBuffer conversationId](self, "conversationId");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer spotlightId](self, "spotlightId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMTextUnderstandingPoemBuffer hasPhotoAttachment](self, "hasPhotoAttachment"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemBuffer photoAttachment](self, "photoAttachment"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  -[BMTextUnderstandingPoemBuffer _extractionsJSONArray](self, "_extractionsJSONArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer _continuousFeaturesJSONArray](self, "_continuousFeaturesJSONArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer rawMessage](self, "rawMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemBuffer senderId](self, "senderId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("messageTimestamp");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v13;
  v30[0] = v13;
  v29[1] = CFSTR("conversationId");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v14;
  v30[1] = v14;
  v29[2] = CFSTR("spotlightId");
  v15 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v15;
  v30[2] = v15;
  v29[3] = CFSTR("photoAttachment");
  v16 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v6;
  v30[3] = v16;
  v29[4] = CFSTR("extractions");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v7;
  v30[4] = v17;
  v29[5] = CFSTR("continuousFeatures");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[5] = v18;
  v29[6] = CFSTR("rawMessage");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[6] = v19;
  v29[7] = CFSTR("senderId");
  v20 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[7] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_25;
LABEL_34:

    if (v10)
      goto LABEL_26;
    goto LABEL_35;
  }

  if (!v11)
    goto LABEL_34;
LABEL_25:
  if (v10)
    goto LABEL_26;
LABEL_35:

LABEL_26:
  if (!v9)

  if (v28)
  {
    if (v8)
      goto LABEL_30;
  }
  else
  {

    if (v8)
    {
LABEL_30:
      if (v26)
        goto LABEL_31;
LABEL_38:

      if (v27)
        goto LABEL_32;
LABEL_39:

      goto LABEL_32;
    }
  }

  if (!v26)
    goto LABEL_38;
LABEL_31:
  if (!v27)
    goto LABEL_39;
LABEL_32:

  return v25;
}

- (NSDate)messageTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_messageTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_messageTimestamp);
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
    -[BMTextUnderstandingPoemBuffer messageTimestamp](self, "messageTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMTextUnderstandingPoemBuffer messageTimestamp](self, "messageTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_30;
    }
    -[BMTextUnderstandingPoemBuffer conversationId](self, "conversationId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMTextUnderstandingPoemBuffer conversationId](self, "conversationId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_30;
    }
    -[BMTextUnderstandingPoemBuffer spotlightId](self, "spotlightId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightId");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMTextUnderstandingPoemBuffer spotlightId](self, "spotlightId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "spotlightId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_30;
    }
    if (-[BMTextUnderstandingPoemBuffer hasPhotoAttachment](self, "hasPhotoAttachment")
      || objc_msgSend(v5, "hasPhotoAttachment"))
    {
      if (!-[BMTextUnderstandingPoemBuffer hasPhotoAttachment](self, "hasPhotoAttachment"))
        goto LABEL_30;
      if (!objc_msgSend(v5, "hasPhotoAttachment"))
        goto LABEL_30;
      v25 = -[BMTextUnderstandingPoemBuffer photoAttachment](self, "photoAttachment");
      if (v25 != objc_msgSend(v5, "photoAttachment"))
        goto LABEL_30;
    }
    -[BMTextUnderstandingPoemBuffer extractions](self, "extractions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractions");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMTextUnderstandingPoemBuffer extractions](self, "extractions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extractions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_30;
    }
    -[BMTextUnderstandingPoemBuffer continuousFeatures](self, "continuousFeatures");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "continuousFeatures");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMTextUnderstandingPoemBuffer continuousFeatures](self, "continuousFeatures");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "continuousFeatures");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_30;
    }
    -[BMTextUnderstandingPoemBuffer rawMessage](self, "rawMessage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rawMessage");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[BMTextUnderstandingPoemBuffer rawMessage](self, "rawMessage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rawMessage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if (!v43)
      {
LABEL_30:
        v12 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    -[BMTextUnderstandingPoemBuffer senderId](self, "senderId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "senderId");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 == v46)
    {
      v12 = 1;
    }
    else
    {
      -[BMTextUnderstandingPoemBuffer senderId](self, "senderId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "senderId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v47, "isEqual:", v48);

    }
    goto LABEL_31;
  }
  v12 = 0;
LABEL_32:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSString)spotlightId
{
  return self->_spotlightId;
}

- (BOOL)photoAttachment
{
  return self->_photoAttachment;
}

- (BOOL)hasPhotoAttachment
{
  return self->_hasPhotoAttachment;
}

- (void)setHasPhotoAttachment:(BOOL)a3
{
  self->_hasPhotoAttachment = a3;
}

- (NSArray)extractions
{
  return self->_extractions;
}

- (NSArray)continuousFeatures
{
  return self->_continuousFeatures;
}

- (NSString)rawMessage
{
  return self->_rawMessage;
}

- (NSString)senderId
{
  return self->_senderId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderId, 0);
  objc_storeStrong((id *)&self->_rawMessage, 0);
  objc_storeStrong((id *)&self->_continuousFeatures, 0);
  objc_storeStrong((id *)&self->_extractions, 0);
  objc_storeStrong((id *)&self->_spotlightId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
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

    v4 = -[BMTextUnderstandingPoemBuffer initByReadFrom:]([BMTextUnderstandingPoemBuffer alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageTimestamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("spotlightId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoAttachment"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("extractions_json"), 5, 1, &__block_literal_global_209);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("continuousFeatures_json"), 5, 1, &__block_literal_global_210);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawMessage"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("senderId"), 2, 0, 8, 13, 0);
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
  return &unk_1E5F1BF88;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageTimestamp"), 1, 0, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationId"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("spotlightId"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoAttachment"), 4, 12, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("extractions"), 5, 14, objc_opt_class());
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("continuousFeatures"), 6, 0, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawMessage"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("senderId"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __40__BMTextUnderstandingPoemBuffer_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_continuousFeaturesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMTextUnderstandingPoemBuffer_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extractionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
