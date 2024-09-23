@implementation BMMessagesCommunicationSafetyResult

- (BMMessagesCommunicationSafetyResult)initWithAbsoluteTimestamp:(id)a3 childID:(id)a4 deviceID:(id)a5 eventDirection:(int)a6 eventType:(int)a7 contentType:(int)a8 contactHandles:(id)a9 contentID:(id)a10 conversationID:(id)a11 imageData:(id)a12 sourceBundleID:(id)a13 senderHandle:(id)a14 contentURL:(id)a15 conversationURL:(id)a16
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BMMessagesCommunicationSafetyResult *v23;
  id v24;
  double v25;
  id obj;
  id v28;
  id v29;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v18 = a3;
  obj = a4;
  v39 = a4;
  v28 = a5;
  v38 = a5;
  v29 = a9;
  v37 = a9;
  v36 = a10;
  v35 = a11;
  v34 = a12;
  v19 = a13;
  v20 = a14;
  v21 = a15;
  v22 = a16;
  v40.receiver = self;
  v40.super_class = (Class)BMMessagesCommunicationSafetyResult;
  v23 = -[BMEventBase init](&v40, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v18)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      v24 = v18;
      objc_msgSend(v18, "timeIntervalSinceReferenceDate", obj, v28, a9);
    }
    else
    {
      v24 = 0;
      v23->_hasRaw_absoluteTimestamp = 0;
      v25 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v25;
    objc_storeStrong((id *)&v23->_childID, obj);
    objc_storeStrong((id *)&v23->_deviceID, v28);
    v23->_eventDirection = a6;
    v23->_eventType = a7;
    v23->_contentType = a8;
    objc_storeStrong((id *)&v23->_contactHandles, v29);
    objc_storeStrong((id *)&v23->_contentID, a10);
    objc_storeStrong((id *)&v23->_conversationID, a11);
    objc_storeStrong((id *)&v23->_imageData, a12);
    objc_storeStrong((id *)&v23->_sourceBundleID, a13);
    objc_storeStrong((id *)&v23->_senderHandle, a14);
    objc_storeStrong((id *)&v23->_contentURL, a15);
    objc_storeStrong((id *)&v23->_conversationURL, a16);
    v18 = v24;
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
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMessagesCommunicationSafetyResult absoluteTimestamp](self, "absoluteTimestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult childID](self, "childID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult deviceID](self, "deviceID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BMMessagesCommunicationSafetyResultEventDirectionAsString(-[BMMessagesCommunicationSafetyResult eventDirection](self, "eventDirection"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BMMessagesCommunicationSafetyResultEventTypeAsString(-[BMMessagesCommunicationSafetyResult eventType](self, "eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMMessagesCommunicationSafetyResultContentTypeAsString(-[BMMessagesCommunicationSafetyResult contentType](self, "contentType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult contactHandles](self, "contactHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult contentID](self, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult conversationID](self, "conversationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult imageData](self, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult sourceBundleID](self, "sourceBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult senderHandle](self, "senderHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult contentURL](self, "contentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult conversationURL](self, "conversationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMMessagesCommunicationSafetyResult with absoluteTimestamp: %@, childID: %@, deviceID: %@, eventDirection: %@, eventType: %@, contentType: %@, contactHandles: %@, contentID: %@, conversationID: %@, imageData: %@, sourceBundleID: %@, senderHandle: %@, contentURL: %@, conversationURL: %@"), v19, v14, v18, v17, v3, v13, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMessagesCommunicationSafetyResult *v5;
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
  BOOL v18;
  int v19;
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSArray *contactHandles;
  int v51;
  BMMessagesCommunicationSafetyResult *v52;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)BMMessagesCommunicationSafetyResult;
  v5 = -[BMEventBase init](&v54, sel_init);
  if (!v5)
    goto LABEL_82;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
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
        v18 = v12++ >= 9;
        if (v18)
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
        break;
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v21 = *v7;
          v22 = *(_QWORD *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v23 = *(double *)(*(_QWORD *)&v4[*v10] + v22);
            *(_QWORD *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v23 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v23;
          continue;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 48;
          goto LABEL_55;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_55;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          while (2)
          {
            v29 = *v7;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v18 = v27++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v28) = 0;
LABEL_61:
          if (v28 >= 4)
            LODWORD(v28) = 0;
          v48 = 36;
          goto LABEL_76;
        case 5u:
          v33 = 0;
          v34 = 0;
          v28 = 0;
          while (2)
          {
            v35 = *v7;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v18 = v34++ >= 9;
                if (v18)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v28) = 0;
LABEL_67:
          if (v28 >= 5)
            LODWORD(v28) = 0;
          v48 = 40;
          goto LABEL_76;
        case 6u:
          v39 = 0;
          v40 = 0;
          v28 = 0;
          break;
        case 7u:
          PBReaderReadString();
          v45 = objc_claimAutoreleasedReturnValue();
          if (!v45)
            goto LABEL_84;
          v46 = (void *)v45;
          objc_msgSend(v6, "addObject:", v45);

          continue;
        case 8u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_55;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_55;
        case 0xAu:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
          goto LABEL_55;
        case 0xBu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
          goto LABEL_55;
        case 0xCu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
          goto LABEL_55;
        case 0xDu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 112;
          goto LABEL_55;
        case 0xEu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 120;
LABEL_55:
          v47 = *(Class *)((char *)&v5->super.super.isa + v25);
          *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_84:

          goto LABEL_81;
      }
      while (1)
      {
        v41 = *v7;
        v42 = *(_QWORD *)&v4[v41];
        v43 = v42 + 1;
        if (v42 == -1 || v43 > *(_QWORD *)&v4[*v8])
          break;
        v44 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v42);
        *(_QWORD *)&v4[v41] = v43;
        v28 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0)
          goto LABEL_71;
        v39 += 7;
        v18 = v40++ >= 9;
        if (v18)
        {
          LODWORD(v28) = 0;
          goto LABEL_73;
        }
      }
      v4[*v9] = 1;
LABEL_71:
      if (v4[*v9])
        LODWORD(v28) = 0;
LABEL_73:
      if (v28 >= 4)
        LODWORD(v28) = 0;
      v48 = 44;
LABEL_76:
      *(_DWORD *)((char *)&v5->super.super.isa + v48) = v28;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v49 = objc_msgSend(v6, "copy");
  contactHandles = v5->_contactHandles;
  v5->_contactHandles = (NSArray *)v49;

  v51 = v4[*v9];
  if (v51)
LABEL_81:
    v52 = 0;
  else
LABEL_82:
    v52 = v5;

  return v52;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_childID)
    PBDataWriterWriteStringField();
  if (self->_deviceID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_contactHandles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_contentID)
    PBDataWriterWriteStringField();
  if (self->_conversationID)
    PBDataWriterWriteStringField();
  if (self->_imageData)
    PBDataWriterWriteDataField();
  if (self->_sourceBundleID)
    PBDataWriterWriteStringField();
  if (self->_senderHandle)
    PBDataWriterWriteStringField();
  if (self->_contentURL)
    PBDataWriterWriteStringField();
  if (self->_conversationURL)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMessagesCommunicationSafetyResult writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMessagesCommunicationSafetyResult)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id *v19;
  id *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BMMessagesCommunicationSafetyResult *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  uint64_t v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  id v127;
  uint64_t v128;
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  id v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  id *v161;
  void *v162;
  id v163;
  id v164;
  void *v165;
  void *v166;
  void *v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  _BYTE v192[128];
  uint64_t v193;
  void *v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  _QWORD v206[3];

  v206[1] = *MEMORY[0x1E0C80C00];
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

      v12 = (id)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:", v11);
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
          v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v108 = *MEMORY[0x1E0D025B8];
          v205 = *MEMORY[0x1E0CB2D50];
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v206[0] = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v206, &v205, 1);
          v109 = objc_claimAutoreleasedReturnValue();
          v110 = v108;
          v14 = (void *)v109;
          v6 = 0;
          v28 = 0;
          *a4 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v110, 2, v109);
          goto LABEL_106;
        }
        v6 = 0;
        v28 = 0;
        goto LABEL_107;
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
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("childID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = v14;
        v23 = *MEMORY[0x1E0D025B8];
        v203 = *MEMORY[0x1E0CB2D50];
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("childID"));
        v204 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v23;
        v14 = v22;
        v165 = (void *)v25;
        v27 = 0;
        v28 = 0;
        *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v26, 2);
        goto LABEL_105;
      }
      v27 = 0;
      v28 = 0;
      goto LABEL_106;
    }
    v164 = v14;
  }
  else
  {
    v164 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceID"));
  v15 = objc_claimAutoreleasedReturnValue();
  v165 = (void *)v15;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = v14;
        v31 = *MEMORY[0x1E0D025B8];
        v201 = *MEMORY[0x1E0CB2D50];
        v32 = v5;
        v33 = objc_alloc(MEMORY[0x1E0CB3940]);
        v139 = objc_opt_class();
        v34 = v33;
        v5 = v32;
        v35 = objc_msgSend(v34, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v139, CFSTR("deviceID"));
        v202 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v29;
        v38 = (void *)v36;
        v39 = v31;
        v14 = v30;
        v40 = (id *)v35;
        v24 = 0;
        v28 = 0;
        *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v39, 2, v36);
        v27 = v164;
        goto LABEL_104;
      }
      v24 = 0;
      v28 = 0;
      v27 = v164;
      goto LABEL_105;
    }
    v163 = v16;
  }
  else
  {
    v163 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventDirection"));
  v17 = objc_claimAutoreleasedReturnValue();
  v166 = (void *)v17;
  v169 = v4;
  if (v17 && (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v18;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v40 = a4;
        if (a4)
        {
          v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v89 = v14;
          v90 = *MEMORY[0x1E0D025B8];
          v199 = *MEMORY[0x1E0CB2D50];
          v91 = v5;
          v92 = objc_alloc(MEMORY[0x1E0CB3940]);
          v141 = objc_opt_class();
          v93 = v92;
          v5 = v91;
          v43 = (id)objc_msgSend(v93, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v141, CFSTR("eventDirection"));
          v200 = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v200, &v199, 1);
          v94 = objc_claimAutoreleasedReturnValue();
          v95 = v90;
          v14 = v89;
          v162 = (void *)v94;
          v28 = 0;
          *a4 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v95, 2);
          v38 = v166;
          v40 = 0;
          v24 = v163;
          v27 = v164;
          goto LABEL_103;
        }
        v28 = 0;
        v24 = v163;
        v27 = v164;
        v38 = v166;
        goto LABEL_104;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMessagesCommunicationSafetyResultEventDirectionFromString(v18));
      v20 = (id *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v20;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
  v41 = objc_claimAutoreleasedReturnValue();
  v161 = v19;
  v162 = (void *)v41;
  if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v42;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v97 = v14;
          v98 = *MEMORY[0x1E0D025B8];
          v197 = *MEMORY[0x1E0CB2D50];
          v99 = v5;
          v100 = objc_alloc(MEMORY[0x1E0CB3940]);
          v142 = objc_opt_class();
          v101 = v100;
          v5 = v99;
          v160 = (id)objc_msgSend(v101, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v142, CFSTR("eventType"));
          v198 = v160;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1);
          v102 = objc_claimAutoreleasedReturnValue();
          v103 = v98;
          v14 = v97;
          v159 = (void *)v102;
          v43 = 0;
          v28 = 0;
          *a4 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v103, 2);
          v24 = v163;
          v27 = v164;
          v38 = v166;
          v40 = v19;
          goto LABEL_102;
        }
        v43 = 0;
        v28 = 0;
        v24 = v163;
        v27 = v164;
        v38 = v166;
        v40 = v19;
        goto LABEL_103;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMessagesCommunicationSafetyResultEventTypeFromString(v42));
      v43 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v43 = 0;
  }
  objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("contentType"));
  v44 = objc_claimAutoreleasedReturnValue();
  v155 = v5;
  v156 = v14;
  v158 = v43;
  v159 = (void *)v44;
  if (v44 && (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v160 = v45;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v104 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v105 = *MEMORY[0x1E0D025B8];
          v195 = *MEMORY[0x1E0CB2D50];
          v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("contentType"));
          v196 = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v105, 2, v49);
          v160 = 0;
          v28 = 0;
          *a4 = v106;
          v24 = v163;
          v27 = v164;
          v38 = v166;
          v40 = v19;
          goto LABEL_100;
        }
        v160 = 0;
        v28 = 0;
        v24 = v163;
        v27 = v164;
        v38 = v166;
        v40 = v19;
        goto LABEL_102;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMessagesCommunicationSafetyResultContentTypeFromString(v45));
      v160 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v160 = 0;
  }
  objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("contactHandles"));
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v46, "isEqual:", v47);

  if (v48)
  {
    v157 = v6;

    v46 = 0;
  }
  else
  {
    if (v46)
    {
      objc_opt_class();
      v38 = v166;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v84 = *MEMORY[0x1E0D025B8];
          v193 = *MEMORY[0x1E0CB2D50];
          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("contactHandles"));
          v194 = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
          v85 = objc_claimAutoreleasedReturnValue();
          v86 = v84;
          v38 = v166;
          v28 = 0;
          *a4 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v86, 2, v85);
          v82 = (void *)v85;
          v24 = v163;
          v27 = v164;
          v40 = v19;
          goto LABEL_99;
        }
        v28 = 0;
        v24 = v163;
        v27 = v164;
        v40 = v19;
        goto LABEL_101;
      }
      v157 = v6;
      goto LABEL_48;
    }
    v157 = v6;
  }
  v38 = v166;
LABEL_48:
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v46, "count"));
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v46 = v46;
  v50 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v170, v192, 16);
  v51 = v169;
  if (!v50)
    goto LABEL_57;
  v52 = v50;
  v53 = *(_QWORD *)v171;
  while (2)
  {
    for (i = 0; i != v52; ++i)
    {
      if (*(_QWORD *)v171 != v53)
        objc_enumerationMutation(v46);
      v55 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v72 = a4;
        if (a4)
        {
          v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v74 = *MEMORY[0x1E0D025B8];
          v190 = *MEMORY[0x1E0CB2D50];
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("contactHandles"));
          v191 = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = v73;
          v77 = v74;
LABEL_89:
          v153 = (id)v75;
          v24 = v163;
          v27 = v164;
          v28 = 0;
          *v72 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
          v154 = v46;
          v6 = v157;
          v43 = v158;
          v38 = v166;
          v40 = v161;
          goto LABEL_90;
        }
LABEL_92:
        v28 = 0;
        v82 = v46;
        v6 = v157;
        v43 = v158;
        v24 = v163;
        v27 = v164;
        v38 = v166;
        v40 = v19;
        goto LABEL_99;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v79 = *MEMORY[0x1E0D025B8];
          v188 = *MEMORY[0x1E0CB2D50];
          v80 = objc_alloc(MEMORY[0x1E0CB3940]);
          v140 = objc_opt_class();
          v81 = v80;
          v72 = a4;
          v56 = (void *)objc_msgSend(v81, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v140, CFSTR("contactHandles"));
          v189 = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = v78;
          v77 = v79;
          goto LABEL_89;
        }
        goto LABEL_92;
      }
      objc_msgSend(v49, "addObject:", v55);
    }
    v52 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v170, v192, 16);
    v38 = v166;
    if (v52)
      continue;
    break;
  }
LABEL_57:

  objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("contentID"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v149 = v56;
    v154 = 0;
LABEL_60:
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("conversationID"));
    v57 = objc_claimAutoreleasedReturnValue();
    v150 = (void *)v57;
    if (v57 && (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v153 = v58;
        goto LABEL_63;
      }
      if (!a4)
      {
        v153 = 0;
        v28 = 0;
        v24 = v163;
        v27 = v164;
        v6 = v157;
        v43 = v158;
        v40 = v161;
        v56 = v149;
        goto LABEL_84;
      }
      v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v116 = *MEMORY[0x1E0D025B8];
      v184 = *MEMORY[0x1E0CB2D50];
      v151 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationID"));
      v185 = v151;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
      v117 = objc_claimAutoreleasedReturnValue();
      v118 = v115;
      v38 = v166;
      v148 = (void *)v117;
      v28 = 0;
      v153 = 0;
      *a4 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v116, 2);
    }
    else
    {
      v153 = 0;
LABEL_63:
      objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("imageData"));
      v59 = objc_claimAutoreleasedReturnValue();
      v148 = (void *)v59;
      if (!v59 || (v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v151 = 0;
LABEL_66:
        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("sourceBundleID"));
        v61 = objc_claimAutoreleasedReturnValue();
        v146 = (void *)v61;
        if (!v61 || (v62 = (void *)v61, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v147 = 0;
LABEL_69:
          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("senderHandle"));
          v63 = objc_claimAutoreleasedReturnValue();
          v145 = (void *)v63;
          if (!v63 || (v64 = (void *)v63, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v152 = 0;
LABEL_72:
            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("contentURL"));
            v65 = objc_claimAutoreleasedReturnValue();
            v144 = (void *)v65;
            if (v65 && (v66 = (void *)v65, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v143 = v66;
                goto LABEL_75;
              }
              if (a4)
              {
                v130 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v131 = *MEMORY[0x1E0D025B8];
                v176 = *MEMORY[0x1E0CB2D50];
                v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentURL"));
                v177 = v68;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
                v132 = objc_claimAutoreleasedReturnValue();
                v133 = v130;
                v38 = v166;
                v67 = (void *)v132;
                v28 = 0;
                v69 = 0;
                *a4 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v131, 2);
                v70 = v152;
                goto LABEL_79;
              }
              v28 = 0;
              v24 = v163;
              v27 = v164;
              v6 = v157;
              v40 = v161;
              v71 = v66;
              v69 = 0;
            }
            else
            {
              v143 = 0;
LABEL_75:
              objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("conversationURL"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v67 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v68 = 0;
                goto LABEL_78;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v68 = v67;
LABEL_78:
                v69 = v143;
                v70 = v152;
                v28 = -[BMMessagesCommunicationSafetyResult initWithAbsoluteTimestamp:childID:deviceID:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:sourceBundleID:senderHandle:contentURL:conversationURL:](self, "initWithAbsoluteTimestamp:childID:deviceID:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:sourceBundleID:senderHandle:contentURL:conversationURL:", v157, v164, v163, objc_msgSend(v161, "intValue"), objc_msgSend(v158, "intValue"), objc_msgSend(v160, "intValue"), v49, v154, v153, v151, v147, v152, v143, v68);
                self = v28;
                v38 = v166;
              }
              else
              {
                if (a4)
                {
                  v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v135 = *MEMORY[0x1E0D025B8];
                  v174 = *MEMORY[0x1E0CB2D50];
                  v136 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationURL"));
                  v175 = v136;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  v138 = v134;
                  v38 = v166;
                  *a4 = (id)objc_msgSend(v138, "initWithDomain:code:userInfo:", v135, 2, v137);

                }
                v68 = 0;
                v28 = 0;
                v70 = v152;
                v69 = v143;
              }
LABEL_79:
              v152 = v70;

              v24 = v163;
              v27 = v164;
              v6 = v157;
              v40 = v161;
              v71 = v144;
            }
LABEL_80:

LABEL_81:
            v43 = v158;
            v56 = v149;

LABEL_82:
LABEL_83:

LABEL_84:
LABEL_90:

            goto LABEL_91;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v152 = v64;
            goto LABEL_72;
          }
          if (a4)
          {
            v127 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v128 = *MEMORY[0x1E0D025B8];
            v178 = *MEMORY[0x1E0CB2D50];
            v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("senderHandle"));
            v179 = v69;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = v127;
            v38 = v166;
            v28 = 0;
            v152 = 0;
            *a4 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v128, 2, v71);
            v24 = v163;
            v27 = v164;
            v6 = v157;
            v40 = v161;
            goto LABEL_80;
          }
          v152 = 0;
          v28 = 0;
LABEL_161:
          v24 = v163;
          v27 = v164;
          v6 = v157;
          v40 = v161;
          goto LABEL_81;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v147 = v62;
          goto LABEL_69;
        }
        if (a4)
        {
          v123 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v124 = *MEMORY[0x1E0D025B8];
          v180 = *MEMORY[0x1E0CB2D50];
          v152 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceBundleID"));
          v181 = v152;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
          v125 = objc_claimAutoreleasedReturnValue();
          v126 = v123;
          v38 = v166;
          v145 = (void *)v125;
          v28 = 0;
          v147 = 0;
          *a4 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v124, 2);
          goto LABEL_161;
        }
        v147 = 0;
        v28 = 0;
LABEL_159:
        v24 = v163;
        v27 = v164;
        v6 = v157;
        v43 = v158;
        v40 = v161;
        v56 = v149;
        goto LABEL_82;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v151 = v60;
        goto LABEL_66;
      }
      if (a4)
      {
        v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v120 = *MEMORY[0x1E0D025B8];
        v182 = *MEMORY[0x1E0CB2D50];
        v147 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("imageData"));
        v183 = v147;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
        v121 = objc_claimAutoreleasedReturnValue();
        v122 = v119;
        v38 = v166;
        v146 = (void *)v121;
        v28 = 0;
        v151 = 0;
        *a4 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v120, 2);
        goto LABEL_159;
      }
      v151 = 0;
      v28 = 0;
    }
    v24 = v163;
    v27 = v164;
    v6 = v157;
    v43 = v158;
    v40 = v161;
    v56 = v149;
    goto LABEL_83;
  }
  objc_opt_class();
  v43 = v158;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v149 = v56;
    v154 = v56;
    v51 = v169;
    goto LABEL_60;
  }
  if (a4)
  {
    v111 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v112 = *MEMORY[0x1E0D025B8];
    v186 = *MEMORY[0x1E0CB2D50];
    v153 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentID"));
    v187 = v153;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
    v113 = objc_claimAutoreleasedReturnValue();
    v114 = v111;
    v38 = v166;
    v150 = (void *)v113;
    v28 = 0;
    v154 = 0;
    *a4 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v112, 2);
    v24 = v163;
    v27 = v164;
    v6 = v157;
    v40 = v161;
    goto LABEL_84;
  }
  v154 = 0;
  v28 = 0;
  v24 = v163;
  v27 = v164;
  v6 = v157;
  v40 = v161;
LABEL_91:

  v82 = v154;
LABEL_99:

LABEL_100:
  v5 = v155;
LABEL_101:

  v14 = v156;
LABEL_102:

LABEL_103:
  v4 = v169;
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
  return v28;
}

- (id)_contactHandlesJSONArray
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
  -[BMMessagesCommunicationSafetyResult contactHandles](self, "contactHandles", 0);
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

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[14];
  _QWORD v55[16];

  v55[14] = *MEMORY[0x1E0C80C00];
  -[BMMessagesCommunicationSafetyResult absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMessagesCommunicationSafetyResult absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMMessagesCommunicationSafetyResult childID](self, "childID");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult deviceID](self, "deviceID");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMessagesCommunicationSafetyResult eventDirection](self, "eventDirection"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMessagesCommunicationSafetyResult eventType](self, "eventType"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMessagesCommunicationSafetyResult contentType](self, "contentType"));
  v11 = objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult _contactHandlesJSONArray](self, "_contactHandlesJSONArray");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult contentID](self, "contentID");
  v13 = objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult conversationID](self, "conversationID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult imageData](self, "imageData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMessagesCommunicationSafetyResult sourceBundleID](self, "sourceBundleID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult senderHandle](self, "senderHandle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult contentURL](self, "contentURL");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesCommunicationSafetyResult conversationURL](self, "conversationURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("absoluteTimestamp");
  v16 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v16;
  v55[0] = v16;
  v54[1] = CFSTR("childID");
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v17;
  v55[1] = v17;
  v54[2] = CFSTR("deviceID");
  v18 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v18;
  v55[2] = v18;
  v54[3] = CFSTR("eventDirection");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v19;
  v55[3] = v19;
  v54[4] = CFSTR("eventType");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v20;
  v55[4] = v20;
  v54[5] = CFSTR("contentType");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v10;
  v48 = (void *)v9;
  v37 = (void *)v21;
  v55[5] = v21;
  v54[6] = CFSTR("contactHandles");
  v22 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v12;
  v46 = (void *)v11;
  v36 = (void *)v22;
  v55[6] = v22;
  v54[7] = CFSTR("contentID");
  v23 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v13;
  v34 = v23;
  v55[7] = v23;
  v54[8] = CFSTR("conversationID");
  v24 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v23, v36, v37, v38, v39, v40, v41, v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[8] = v24;
  v54[9] = CFSTR("imageData");
  v25 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v8;
  v27 = (void *)v6;
  v55[9] = v25;
  v54[10] = CFSTR("sourceBundleID");
  v28 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v7;
  v55[10] = v28;
  v54[11] = CFSTR("senderHandle");
  v30 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[11] = v30;
  v54[12] = CFSTR("contentURL");
  v31 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[12] = v31;
  v54[13] = CFSTR("conversationURL");
  v32 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[13] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 14, v34);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (!v49)
  if (!v50)

  if (!v51)
  if (!v52)

  if (!v53)
  if (!v44)

  if (!v45)
  if (v46)
  {
    if (v47)
      goto LABEL_50;
  }
  else
  {

    if (v47)
    {
LABEL_50:
      if (v48)
        goto LABEL_51;
      goto LABEL_57;
    }
  }

  if (v48)
  {
LABEL_51:
    if (v26)
      goto LABEL_52;
    goto LABEL_58;
  }
LABEL_57:

  if (v26)
  {
LABEL_52:
    if (v29)
      goto LABEL_53;
LABEL_59:

    if (v27)
      goto LABEL_54;
LABEL_60:

    goto LABEL_54;
  }
LABEL_58:

  if (!v29)
    goto LABEL_59;
LABEL_53:
  if (!v27)
    goto LABEL_60;
LABEL_54:

  return v43;
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
  int v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMessagesCommunicationSafetyResult absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMessagesCommunicationSafetyResult absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult childID](self, "childID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMessagesCommunicationSafetyResult childID](self, "childID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "childID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult deviceID](self, "deviceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMessagesCommunicationSafetyResult deviceID](self, "deviceID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_44;
    }
    v25 = -[BMMessagesCommunicationSafetyResult eventDirection](self, "eventDirection");
    if (v25 != objc_msgSend(v5, "eventDirection"))
      goto LABEL_44;
    v26 = -[BMMessagesCommunicationSafetyResult eventType](self, "eventType");
    if (v26 != objc_msgSend(v5, "eventType"))
      goto LABEL_44;
    v27 = -[BMMessagesCommunicationSafetyResult contentType](self, "contentType");
    if (v27 != objc_msgSend(v5, "contentType"))
      goto LABEL_44;
    -[BMMessagesCommunicationSafetyResult contactHandles](self, "contactHandles");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactHandles");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v28 == (void *)v29)
    {

    }
    else
    {
      v30 = (void *)v29;
      -[BMMessagesCommunicationSafetyResult contactHandles](self, "contactHandles");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactHandles");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult contentID](self, "contentID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentID");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[BMMessagesCommunicationSafetyResult contentID](self, "contentID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult conversationID](self, "conversationID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationID");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      -[BMMessagesCommunicationSafetyResult conversationID](self, "conversationID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult imageData](self, "imageData");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageData");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v46 == (void *)v47)
    {

    }
    else
    {
      v48 = (void *)v47;
      -[BMMessagesCommunicationSafetyResult imageData](self, "imageData");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageData");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if (!v51)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult sourceBundleID](self, "sourceBundleID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleID");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v52 == (void *)v53)
    {

    }
    else
    {
      v54 = (void *)v53;
      -[BMMessagesCommunicationSafetyResult sourceBundleID](self, "sourceBundleID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v55, "isEqual:", v56);

      if (!v57)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult senderHandle](self, "senderHandle");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "senderHandle");
    v59 = objc_claimAutoreleasedReturnValue();
    if (v58 == (void *)v59)
    {

    }
    else
    {
      v60 = (void *)v59;
      -[BMMessagesCommunicationSafetyResult senderHandle](self, "senderHandle");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "senderHandle");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqual:", v62);

      if (!v63)
        goto LABEL_44;
    }
    -[BMMessagesCommunicationSafetyResult contentURL](self, "contentURL");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentURL");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v64 == (void *)v65)
    {

    }
    else
    {
      v66 = (void *)v65;
      -[BMMessagesCommunicationSafetyResult contentURL](self, "contentURL");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentURL");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "isEqual:", v68);

      if (!v69)
      {
LABEL_44:
        v12 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    -[BMMessagesCommunicationSafetyResult conversationURL](self, "conversationURL");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationURL");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71 == v72)
    {
      v12 = 1;
    }
    else
    {
      -[BMMessagesCommunicationSafetyResult conversationURL](self, "conversationURL");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationURL");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v73, "isEqual:", v74);

    }
    goto LABEL_45;
  }
  v12 = 0;
LABEL_46:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)childID
{
  return self->_childID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (int)eventDirection
{
  return self->_eventDirection;
}

- (int)eventType
{
  return self->_eventType;
}

- (int)contentType
{
  return self->_contentType;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (NSString)conversationURL
{
  return self->_conversationURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_childID, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 2)
  {
    v6 = off_1E5E4AEA0;
  }
  else
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AEA8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[8] = a4;

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("childID"), 2, 0, 2, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceID"), 2, 0, 3, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventDirection"), 0, 0, 4, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventType"), 0, 0, 5, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentType"), 0, 0, 6, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("contactHandles_json"), 5, 1, &__block_literal_global_87_32195);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentID"), 2, 0, 8, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationID"), 2, 0, 9, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("imageData"), 4, 0, 10, 14, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleID"), 2, 0, 11, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("senderHandle"), 2, 0, 12, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentURL"), 2, 0, 13, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationURL"), 2, 0, 14, 13, 0);
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
  return &unk_1E5F1C528;
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
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("childID"), 2, 13, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceID"), 3, 13, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventDirection"), 4, 4, 0);
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventType"), 5, 4, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentType"), 6, 4, 0);
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactHandles"), 7, 13, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentID"), 8, 13, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationID"), 9, 13, 0);
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("imageData"), 10, 14, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleID"), 11, 13, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("senderHandle"), 12, 13, 0);
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentURL"), 13, 13, 0);
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationURL"), 14, 13, 0);
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __46__BMMessagesCommunicationSafetyResult_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contactHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
