@implementation BMNotificationUsage

- (BMNotificationUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageType:(int)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 body:(id)a11 badge:(id)a12 threadID:(id)a13 categoryID:(id)a14 sectionID:(id)a15 contactIDs:(id)a16 isGroupMessage:(id)a17 parentBundleID:(id)a18 bodyLength:(id)a19
{
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  BMNotificationUsage *v30;
  double v31;
  uint64_t v32;
  unsigned int v33;
  id v37;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v49 = a3;
  v23 = a4;
  v37 = a6;
  v48 = a6;
  v47 = a7;
  v38 = a8;
  v46 = a8;
  v45 = a9;
  v44 = a10;
  v43 = a11;
  v24 = a12;
  v42 = a13;
  v41 = a14;
  v40 = a15;
  v25 = a16;
  v26 = v23;
  v27 = a17;
  v28 = a18;
  v29 = a19;
  v50.receiver = self;
  v50.super_class = (Class)BMNotificationUsage;
  v30 = -[BMEventBase init](&v50, sel_init);
  if (v30)
  {
    v30->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v30->_uniqueID, a3);
    if (v26)
    {
      v30->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v30->_hasRaw_absoluteTimestamp = 0;
      v31 = -1.0;
    }
    v30->_raw_absoluteTimestamp = v31;
    v30->_usageType = a5;
    objc_storeStrong((id *)&v30->_bundleID, v37);
    objc_storeStrong((id *)&v30->_notificationID, a7);
    objc_storeStrong((id *)&v30->_deviceID, v38);
    objc_storeStrong((id *)&v30->_title, a9);
    objc_storeStrong((id *)&v30->_subtitle, a10);
    objc_storeStrong((id *)&v30->_body, a11);
    if (v24)
    {
      v30->_hasBadge = 1;
      v32 = objc_msgSend(v24, "unsignedLongLongValue");
    }
    else
    {
      v32 = 0;
      v30->_hasBadge = 0;
    }
    v30->_badge = v32;
    objc_storeStrong((id *)&v30->_threadID, a13);
    objc_storeStrong((id *)&v30->_categoryID, a14);
    objc_storeStrong((id *)&v30->_sectionID, a15);
    objc_storeStrong((id *)&v30->_contactIDs, a16);
    if (v27)
    {
      v30->_hasIsGroupMessage = 1;
      v30->_isGroupMessage = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v30->_hasIsGroupMessage = 0;
      v30->_isGroupMessage = 0;
    }
    objc_storeStrong((id *)&v30->_parentBundleID, a18);
    if (v29)
    {
      v30->_hasBodyLength = 1;
      v33 = objc_msgSend(v29, "unsignedIntValue");
    }
    else
    {
      v33 = 0;
      v30->_hasBodyLength = 0;
    }
    v30->_bodyLength = v33;
  }

  return v30;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMNotificationUsage uniqueID](self, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage absoluteTimestamp](self, "absoluteTimestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  BMNotificationUsageTypeAsString(-[BMNotificationUsage usageType](self, "usageType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage bundleID](self, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage notificationID](self, "notificationID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage deviceID](self, "deviceID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage subtitle](self, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage body](self, "body");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMNotificationUsage badge](self, "badge"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage threadID](self, "threadID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage categoryID](self, "categoryID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage sectionID](self, "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage contactIDs](self, "contactIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMNotificationUsage isGroupMessage](self, "isGroupMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage parentBundleID](self, "parentBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMNotificationUsage bodyLength](self, "bodyLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMNotificationUsage with uniqueID: %@, absoluteTimestamp: %@, usageType: %@, bundleID: %@, notificationID: %@, deviceID: %@, title: %@, subtitle: %@, body: %@, badge: %@, threadID: %@, categoryID: %@, sectionID: %@, contactIDs: %@, isGroupMessage: %@, parentBundleID: %@, bodyLength: %@"), v16, v22, v15, v14, v13, v21, v12, v20, v19, v11, v10, v9, v3, v4, v5, v6,
                  v7);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMNotificationUsage *v5;
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
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  void *v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  void *v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  NSArray *contactIDs;
  int v59;
  BMNotificationUsage *v60;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)BMNotificationUsage;
  v5 = -[BMEventBase init](&v62, sel_init);
  if (!v5)
    goto LABEL_91;
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
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 48;
          goto LABEL_59;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v23 = *v7;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v25 = *(double *)(*(_QWORD *)&v4[*v10] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v25 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v25;
          continue;
        case 3u:
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
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v28) = 0;
LABEL_72:
          if (v28 >= 0x1C)
            LODWORD(v28) = 0;
          v5->_usageType = v28;
          continue;
        case 4u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 56;
          goto LABEL_59;
        case 5u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 64;
          goto LABEL_59;
        case 7u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 72;
          goto LABEL_59;
        case 8u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 80;
          goto LABEL_59;
        case 9u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 88;
          goto LABEL_59;
        case 0xAu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 96;
          goto LABEL_59;
        case 0xBu:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasBadge = 1;
          while (2)
          {
            v36 = *v7;
            v37 = *(_QWORD *)&v4[v36];
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v37);
              *(_QWORD *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                v18 = v34++ >= 9;
                if (v18)
                {
                  v35 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v35 = 0;
LABEL_78:
          v5->_badge = v35;
          continue;
        case 0xCu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 112;
          goto LABEL_59;
        case 0xDu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 120;
          goto LABEL_59;
        case 0xEu:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 128;
          goto LABEL_59;
        case 0xFu:
          PBReaderReadString();
          v40 = objc_claimAutoreleasedReturnValue();
          if (!v40)
            goto LABEL_93;
          v41 = (void *)v40;
          objc_msgSend(v6, "addObject:", v40);

          continue;
        case 0x10u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          v5->_hasIsGroupMessage = 1;
          while (2)
          {
            v45 = *v7;
            v46 = *(_QWORD *)&v4[v45];
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v46);
              *(_QWORD *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                v18 = v43++ >= 9;
                if (v18)
                {
                  v44 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v44 = 0;
LABEL_82:
          v5->_isGroupMessage = v44 != 0;
          continue;
        case 0x11u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 144;
LABEL_59:
          v49 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 0x12u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          v5->_hasBodyLength = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_93:

          goto LABEL_90;
      }
      while (1)
      {
        v53 = *v7;
        v54 = *(_QWORD *)&v4[v53];
        v55 = v54 + 1;
        if (v54 == -1 || v55 > *(_QWORD *)&v4[*v8])
          break;
        v56 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v54);
        *(_QWORD *)&v4[v53] = v55;
        v52 |= (unint64_t)(v56 & 0x7F) << v50;
        if ((v56 & 0x80) == 0)
          goto LABEL_84;
        v50 += 7;
        v18 = v51++ >= 9;
        if (v18)
        {
          LODWORD(v52) = 0;
          goto LABEL_86;
        }
      }
      v4[*v9] = 1;
LABEL_84:
      if (v4[*v9])
        LODWORD(v52) = 0;
LABEL_86:
      v5->_bodyLength = v52;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v57 = objc_msgSend(v6, "copy");
  contactIDs = v5->_contactIDs;
  v5->_contactIDs = (NSArray *)v57;

  v59 = v4[*v9];
  if (v59)
LABEL_90:
    v60 = 0;
  else
LABEL_91:
    v60 = v5;

  return v60;
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
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_notificationID)
    PBDataWriterWriteStringField();
  if (self->_deviceID)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_body)
    PBDataWriterWriteStringField();
  if (self->_hasBadge)
    PBDataWriterWriteUint64Field();
  if (self->_threadID)
    PBDataWriterWriteStringField();
  if (self->_categoryID)
    PBDataWriterWriteStringField();
  if (self->_sectionID)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_contactIDs;
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

  if (self->_hasIsGroupMessage)
    PBDataWriterWriteBOOLField();
  if (self->_parentBundleID)
    PBDataWriterWriteStringField();
  if (self->_hasBodyLength)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMNotificationUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMNotificationUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BMNotificationUsage *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  id *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  id *v93;
  uint64_t v94;
  uint64_t v95;
  id *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  id *v127;
  void *v128;
  id v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  id v145;
  void *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  id v154;
  uint64_t v155;
  void *v156;
  id v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  char isKindOfClass;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  id v168;
  id v170;
  id v171;
  void *v172;
  id v173;
  id v174;
  uint64_t v175;
  void *v176;
  id v177;
  void *v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  id v183;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  id v188;
  uint64_t v189;
  void *v190;
  void *v191;
  id v192;
  id *v193;
  void *v194;
  id v195;
  void *v196;
  id v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  id v204;
  id v205;
  void *v206;
  id v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  id v212;
  id v213;
  id *v214;
  void *v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  BMNotificationUsage *v220;
  void *v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  void *v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  void *v233;
  uint64_t v234;
  void *v235;
  _BYTE v236[128];
  uint64_t v237;
  void *v238;
  uint64_t v239;
  id v240;
  uint64_t v241;
  id v242;
  uint64_t v243;
  id v244;
  uint64_t v245;
  id v246;
  uint64_t v247;
  id v248;
  uint64_t v249;
  id v250;
  uint64_t v251;
  id v252;
  uint64_t v253;
  id v254;
  uint64_t v255;
  void *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  id *v260;
  uint64_t v261;
  id v262;
  uint64_t v263;
  _QWORD v264[3];

  v264[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v220 = self;
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v221 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v218 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (objc_class *)MEMORY[0x1E0C99D68];
        v10 = v7;
        v11 = [v9 alloc];
        objc_msgSend(v10, "doubleValue");
        v13 = v12;

        v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v21, "dateFromString:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v8 = 0;
            v20 = 0;
            v19 = v218;
            goto LABEL_166;
          }
          v138 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v139 = *MEMORY[0x1E0D025B8];
          v261 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v262 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v262, &v261, 1);
          v140 = objc_claimAutoreleasedReturnValue();
          v141 = v138;
          v22 = (void *)v140;
          v142 = (id)objc_msgSend(v141, "initWithDomain:code:userInfo:", v139, 2, v140);
          v8 = 0;
          v20 = 0;
          *a4 = v142;
          v19 = v218;
          goto LABEL_165;
        }
        v14 = v7;
      }
      v8 = v14;
    }
    else
    {
      v8 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usageType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = v7;
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v89 = v22;
          if (a4)
          {
            v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v91 = v8;
            v92 = *MEMORY[0x1E0D025B8];
            v259 = *MEMORY[0x1E0CB2D50];
            v93 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("usageType"));
            v260 = v93;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v260, &v259, 1);
            v94 = objc_claimAutoreleasedReturnValue();
            v95 = v92;
            v8 = v91;
            v20 = 0;
            *a4 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v95, 2, v94);
            a4 = v93;
            v23 = 0;
            v19 = v218;
            v22 = v89;
            v24 = (void *)v94;
            goto LABEL_164;
          }
          v23 = 0;
          v20 = 0;
          v19 = v218;
LABEL_165:

          goto LABEL_166;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMNotificationUsageTypeFromString(v22));
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = v24;
    v216 = v23;
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v214 = 0;
LABEL_22:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationID"));
      v25 = objc_claimAutoreleasedReturnValue();
      v215 = (void *)v25;
      if (v25 && (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v27 = 0;
            v20 = 0;
            v19 = v218;
            goto LABEL_162;
          }
          v55 = a4;
          v56 = v7;
          v57 = v22;
          v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v203 = v8;
          v59 = *MEMORY[0x1E0D025B8];
          v255 = *MEMORY[0x1E0CB2D50];
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("notificationID"));
          v256 = v60;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v256, &v255, 1);
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = v58;
          v22 = v57;
          v7 = v56;
          v28 = (void *)v61;
          v63 = v59;
          v8 = v203;
          v27 = 0;
          v20 = 0;
          *v55 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2, v61);
          goto LABEL_121;
        }
        v211 = v22;
        v27 = v26;
      }
      else
      {
        v211 = v22;
        v27 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = a4;
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v212 = 0;
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v212 = v28;
LABEL_28:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
        v30 = objc_claimAutoreleasedReturnValue();
        v210 = (void *)v30;
        if (!v30 || (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v209 = 0;
          goto LABEL_31;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v209 = v31;
LABEL_31:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtitle"));
          v32 = objc_claimAutoreleasedReturnValue();
          v208 = (void *)v32;
          if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v207 = 0;
            goto LABEL_34;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v207 = v33;
LABEL_34:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
            v34 = objc_claimAutoreleasedReturnValue();
            v206 = (void *)v34;
            if (!v34 || (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v205 = 0;
LABEL_37:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("badge"));
              v36 = objc_claimAutoreleasedReturnValue();
              v200 = (void *)v36;
              if (v36 && (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a4)
                  {
                    v114 = v28;
                    v115 = v27;
                    v116 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v117 = v8;
                    v118 = *MEMORY[0x1E0D025B8];
                    v245 = *MEMORY[0x1E0CB2D50];
                    v199 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("badge"));
                    v246 = v199;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v246, &v245, 1);
                    v119 = objc_claimAutoreleasedReturnValue();
                    v120 = v116;
                    v27 = v115;
                    v28 = v114;
                    v121 = v118;
                    v8 = v117;
                    v24 = v219;
                    v198 = (void *)v119;
                    v204 = 0;
                    v20 = 0;
                    *a4 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                    v60 = v212;
                    v22 = v211;
                    v7 = v217;
                    v19 = v218;
                    goto LABEL_156;
                  }
                  v204 = 0;
                  v20 = 0;
                  v22 = v211;
                  v60 = v212;
                  v7 = v217;
                  v19 = v218;
                  goto LABEL_157;
                }
                v204 = v37;
              }
              else
              {
                v204 = 0;
              }
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("threadID"));
              v38 = objc_claimAutoreleasedReturnValue();
              v198 = (void *)v38;
              if (v38 && (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    v199 = 0;
                    v20 = 0;
                    v22 = v211;
                    v60 = v212;
                    v7 = v217;
                    v19 = v218;
                    goto LABEL_156;
                  }
                  v127 = a4;
                  v128 = v28;
                  v129 = v27;
                  v130 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v131 = v8;
                  v132 = *MEMORY[0x1E0D025B8];
                  v243 = *MEMORY[0x1E0CB2D50];
                  v197 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("threadID"));
                  v244 = v197;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v244, &v243, 1);
                  v133 = objc_claimAutoreleasedReturnValue();
                  v134 = v130;
                  v27 = v129;
                  v28 = v128;
                  v60 = v212;
                  v135 = v132;
                  v8 = v131;
                  v196 = (void *)v133;
                  v199 = 0;
                  v20 = 0;
                  *v127 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
                  v22 = v211;
                  goto LABEL_173;
                }
                v199 = v39;
              }
              else
              {
                v199 = 0;
              }
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("categoryID"));
              v40 = objc_claimAutoreleasedReturnValue();
              v196 = (void *)v40;
              if (!v40 || (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v197 = 0;
                goto LABEL_46;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v197 = v41;
LABEL_46:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sectionID"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v201 = v8;
                if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v192 = v27;
                  v195 = 0;
LABEL_49:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactIDs"));
                  v43 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v43, "isEqual:", v44);

                  v191 = v28;
                  if (v45)
                  {
                    v190 = v42;
                    v46 = a4;

                    v43 = 0;
                  }
                  else
                  {
                    if (v43)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (a4)
                        {
                          v158 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v159 = *MEMORY[0x1E0D025B8];
                          v237 = *MEMORY[0x1E0CB2D50];
                          v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("contactIDs"));
                          v238 = v80;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v238, &v237, 1);
                          v160 = objc_claimAutoreleasedReturnValue();
                          v161 = (id)objc_msgSend(v158, "initWithDomain:code:userInfo:", v159, 2, v160);
                          v20 = 0;
                          *a4 = v161;
                          v150 = (void *)v160;
                          v19 = v218;
                          v27 = v192;
                          goto LABEL_151;
                        }
                        v20 = 0;
                        v19 = v218;
                        v27 = v192;
                        goto LABEL_153;
                      }
                    }
                    v190 = v42;
                    v46 = a4;
                  }
                  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v43, "count"));
                  v222 = 0u;
                  v223 = 0u;
                  v224 = 0u;
                  v225 = 0u;
                  v43 = v43;
                  v81 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v222, v236, 16);
                  if (!v81)
                    goto LABEL_91;
                  v82 = v81;
                  v83 = *(_QWORD *)v223;
LABEL_84:
                  v84 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v223 != v83)
                      objc_enumerationMutation(v43);
                    v85 = *(_QWORD *)(*((_QWORD *)&v222 + 1) + 8 * v84);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      break;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v46)
                      {
                        v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v137 = *MEMORY[0x1E0D025B8];
                        v232 = *MEMORY[0x1E0CB2D50];
                        v186 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contactIDs"));
                        v233 = v186;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
                        v124 = objc_claimAutoreleasedReturnValue();
                        v125 = v136;
                        v126 = v137;
                        goto LABEL_117;
                      }
                      goto LABEL_124;
                    }
                    objc_msgSend(v80, "addObject:", v85);
                    if (v82 == ++v84)
                    {
                      v82 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v222, v236, 16);
                      if (v82)
                        goto LABEL_84;
LABEL_91:

                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isGroupMessage"));
                      v86 = objc_claimAutoreleasedReturnValue();
                      v186 = (void *)v86;
                      if (!v86)
                      {
                        v188 = 0;
                        v28 = v191;
                        v27 = v192;
                        v88 = v212;
                        goto LABEL_140;
                      }
                      v87 = (void *)v86;
                      objc_opt_class();
                      v27 = v192;
                      v88 = v212;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v188 = 0;
                        v28 = v191;
LABEL_140:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parentBundleID"));
                        v164 = objc_claimAutoreleasedReturnValue();
                        v184 = (void *)v164;
                        if (v164 && (v165 = (void *)v164, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v187 = v165;
                            v28 = v191;
                            goto LABEL_143;
                          }
                          if (v46)
                          {
                            v174 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v175 = *MEMORY[0x1E0D025B8];
                            v228 = *MEMORY[0x1E0CB2D50];
                            v182 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("parentBundleID"));
                            v229 = v182;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
                            v194 = (void *)objc_claimAutoreleasedReturnValue();
                            v20 = 0;
                            v187 = 0;
                            *v46 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v175, 2);
                            v19 = v218;
                            v24 = v219;
                            v28 = v191;
                            goto LABEL_147;
                          }
                          v187 = 0;
                          v20 = 0;
                          v19 = v218;
                          v24 = v219;
                          v42 = v190;
                          v28 = v191;
                        }
                        else
                        {
                          v187 = 0;
LABEL_143:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bodyLength"));
                          v166 = objc_claimAutoreleasedReturnValue();
                          v194 = (void *)v166;
                          if (!v166 || (v167 = (void *)v166, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v168 = 0;
                            v19 = v218;
                            goto LABEL_146;
                          }
                          objc_opt_class();
                          v19 = v218;
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v168 = v167;
LABEL_146:
                            v24 = v219;
                            v182 = v168;
                            v20 = objc_retain(-[BMNotificationUsage initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:](v220, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:", v19, v201, objc_msgSend(v216, "intValue"), v214, v27, v88, v209, v207, v205, v204, v199, v197, v195, v80,
                                      v188,
                                      v187,
                                      v168));
                            v220 = v20;
                          }
                          else
                          {
                            v24 = v219;
                            if (v46)
                            {
                              v183 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v181 = *MEMORY[0x1E0D025B8];
                              v226 = *MEMORY[0x1E0CB2D50];
                              v213 = v88;
                              v176 = v28;
                              v177 = v27;
                              v178 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bodyLength"));
                              v227 = v178;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1);
                              v179 = (void *)objc_claimAutoreleasedReturnValue();
                              *v46 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v181, 2, v179);

                              v27 = v177;
                              v28 = v176;
                              v88 = v213;
                            }
                            v182 = 0;
                            v20 = 0;
                          }
LABEL_147:
                          v42 = v190;

                        }
LABEL_149:
                        v212 = v88;

                        v150 = v188;
                      }
                      else
                      {
                        objc_opt_class();
                        isKindOfClass = objc_opt_isKindOfClass();
                        v163 = v87;
                        v28 = v191;
                        if ((isKindOfClass & 1) != 0)
                        {
                          v188 = v163;
                          goto LABEL_140;
                        }
                        if (v46)
                        {
                          v170 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v189 = *MEMORY[0x1E0D025B8];
                          v230 = *MEMORY[0x1E0CB2D50];
                          v171 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v180 = objc_opt_class();
                          v172 = v171;
                          v27 = v192;
                          v28 = v191;
                          v88 = v212;
                          v187 = (id)objc_msgSend(v172, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v180, CFSTR("isGroupMessage"));
                          v231 = v187;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v231, &v230, 1);
                          v185 = (void *)objc_claimAutoreleasedReturnValue();
                          v173 = (id)objc_msgSend(v170, "initWithDomain:code:userInfo:", v189, 2);
                          v20 = 0;
                          v188 = 0;
                          *v46 = v173;
                          v19 = v218;
                          v24 = v219;
                          v42 = v190;

                          goto LABEL_149;
                        }
                        v150 = 0;
                        v20 = 0;
                        v19 = v218;
                        v24 = v219;
                        v42 = v190;
                      }

LABEL_151:
LABEL_152:

LABEL_153:
                      v60 = v212;

                      v8 = v201;
                      v22 = v211;
LABEL_154:

                      v7 = v217;
LABEL_155:

LABEL_156:
LABEL_157:

LABEL_158:
LABEL_159:

LABEL_160:
LABEL_161:

LABEL_162:
                      v54 = v215;
                      v23 = v216;
                      a4 = v214;
LABEL_163:

                      goto LABEL_164;
                    }
                  }
                  if (v46)
                  {
                    v122 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v123 = *MEMORY[0x1E0D025B8];
                    v234 = *MEMORY[0x1E0CB2D50];
                    v186 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("contactIDs"));
                    v235 = v186;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
                    v124 = objc_claimAutoreleasedReturnValue();
                    v125 = v122;
                    v126 = v123;
LABEL_117:
                    v187 = (id)v124;
                    v24 = v219;
                    v28 = v191;
                    v20 = 0;
                    *v46 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v126, 2);
                    v188 = v43;
                    v19 = v218;
                    v27 = v192;
                    v88 = v212;
                    v42 = v190;
                    goto LABEL_149;
                  }
LABEL_124:
                  v20 = 0;
                  v150 = v43;
                  v19 = v218;
                  v24 = v219;
                  v28 = v191;
                  v27 = v192;
                  v42 = v190;
                  goto LABEL_151;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v192 = v27;
                  v195 = v42;
                  goto LABEL_49;
                }
                if (a4)
                {
                  v151 = v42;
                  v152 = v28;
                  v153 = v27;
                  v154 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v155 = *MEMORY[0x1E0D025B8];
                  v239 = *MEMORY[0x1E0CB2D50];
                  v43 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sectionID"));
                  v240 = v43;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v240, &v239, 1);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v156 = v154;
                  v27 = v153;
                  v28 = v152;
                  v42 = v151;
                  v157 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v155, 2, v80);
                  v195 = 0;
                  v20 = 0;
                  *a4 = v157;
                  v19 = v218;
                  goto LABEL_152;
                }
                v195 = 0;
                v20 = 0;
                v22 = v211;
                v60 = v212;
LABEL_177:
                v19 = v218;
                goto LABEL_154;
              }
              if (a4)
              {
                v193 = a4;
                v143 = v28;
                v144 = v27;
                v145 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v146 = v8;
                v147 = *MEMORY[0x1E0D025B8];
                v241 = *MEMORY[0x1E0CB2D50];
                v195 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("categoryID"));
                v242 = v195;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v242, &v241, 1);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v148 = v145;
                v27 = v144;
                v28 = v143;
                v60 = v212;
                v149 = v147;
                v8 = v146;
                v197 = 0;
                v20 = 0;
                *v193 = (id)objc_msgSend(v148, "initWithDomain:code:userInfo:", v149, 2, v42);
                v22 = v211;
                goto LABEL_177;
              }
              v197 = 0;
              v20 = 0;
              v22 = v211;
              v60 = v212;
LABEL_173:
              v7 = v217;
              v19 = v218;
              goto LABEL_155;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v205 = v35;
              goto LABEL_37;
            }
            if (a4)
            {
              v105 = a4;
              v106 = v28;
              v107 = v27;
              v108 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v109 = v8;
              v110 = *MEMORY[0x1E0D025B8];
              v247 = *MEMORY[0x1E0CB2D50];
              v204 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("body"));
              v248 = v204;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v248, &v247, 1);
              v111 = objc_claimAutoreleasedReturnValue();
              v112 = v108;
              v27 = v107;
              v28 = v106;
              v60 = v212;
              v113 = v110;
              v8 = v109;
              v200 = (void *)v111;
              v205 = 0;
              v20 = 0;
              *v105 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
              v22 = v211;
              v7 = v217;
              v19 = v218;
              goto LABEL_157;
            }
            v205 = 0;
            v20 = 0;
            v22 = v211;
            v60 = v212;
LABEL_135:
            v7 = v217;
            v19 = v218;
            goto LABEL_158;
          }
          if (a4)
          {
            v96 = a4;
            v97 = v28;
            v98 = v27;
            v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v100 = v8;
            v101 = *MEMORY[0x1E0D025B8];
            v249 = *MEMORY[0x1E0CB2D50];
            v205 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subtitle"));
            v250 = v205;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v250, &v249, 1);
            v102 = objc_claimAutoreleasedReturnValue();
            v103 = v99;
            v27 = v98;
            v28 = v97;
            v60 = v212;
            v104 = v101;
            v8 = v100;
            v206 = (void *)v102;
            v207 = 0;
            v20 = 0;
            *v96 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 2);
            v22 = v211;
            goto LABEL_135;
          }
          v207 = 0;
          v20 = 0;
          v22 = v211;
          v60 = v212;
LABEL_131:
          v7 = v217;
          v19 = v218;
          goto LABEL_159;
        }
        if (a4)
        {
          v71 = a4;
          v72 = v28;
          v73 = v27;
          v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v75 = v8;
          v76 = *MEMORY[0x1E0D025B8];
          v251 = *MEMORY[0x1E0CB2D50];
          v207 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
          v252 = v207;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v252, &v251, 1);
          v77 = objc_claimAutoreleasedReturnValue();
          v78 = v74;
          v27 = v73;
          v28 = v72;
          v60 = v212;
          v79 = v76;
          v8 = v75;
          v208 = (void *)v77;
          v209 = 0;
          v20 = 0;
          *v71 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
          v22 = v211;
          goto LABEL_131;
        }
        v209 = 0;
        v20 = 0;
        v22 = v211;
        v60 = v212;
LABEL_126:
        v7 = v217;
        v19 = v218;
        goto LABEL_160;
      }
      if (a4)
      {
        v64 = v27;
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v66 = v8;
        v67 = *MEMORY[0x1E0D025B8];
        v253 = *MEMORY[0x1E0CB2D50];
        v209 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceID"));
        v254 = v209;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v254, &v253, 1);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v65;
        v27 = v64;
        v70 = v67;
        v8 = v66;
        v210 = (void *)v68;
        v60 = 0;
        v20 = 0;
        *v29 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
        v22 = v211;
        goto LABEL_126;
      }
      v60 = 0;
      v20 = 0;
      v22 = v211;
      v7 = v217;
LABEL_121:
      v19 = v218;
      goto LABEL_161;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v214 = v24;
      goto LABEL_22;
    }
    if (a4)
    {
      v47 = v22;
      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v202 = v8;
      v49 = *MEMORY[0x1E0D025B8];
      v257 = *MEMORY[0x1E0CB2D50];
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
      v258 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v48;
      v22 = v47;
      v7 = v217;
      v53 = v49;
      v8 = v202;
      v20 = 0;
      *a4 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2, v51);
      a4 = 0;
      v54 = (void *)v51;
      v27 = (id)v50;
      v19 = v218;
      goto LABEL_163;
    }
    v20 = 0;
    v19 = v218;
LABEL_164:

    goto LABEL_165;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v218 = v221;
    goto LABEL_4;
  }
  if (a4)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0D025B8];
    v263 = *MEMORY[0x1E0CB2D50];
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
    v264[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v264, &v263, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v8 = (void *)v17;
    v19 = 0;
    v20 = 0;
    *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v18, 2, v7);
LABEL_166:

    goto LABEL_167;
  }
  v19 = 0;
  v20 = 0;
LABEL_167:

  return v20;
}

- (id)_contactIDsJSONArray
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
  -[BMNotificationUsage contactIDs](self, "contactIDs", 0);
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
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD v62[17];
  _QWORD v63[19];

  v63[17] = *MEMORY[0x1E0C80C00];
  -[BMNotificationUsage uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMNotificationUsage absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMNotificationUsage usageType](self, "usageType"));
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage bundleID](self, "bundleID");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage notificationID](self, "notificationID");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage deviceID](self, "deviceID");
  v11 = objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage title](self, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage subtitle](self, "subtitle");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage body](self, "body");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMNotificationUsage hasBadge](self, "hasBadge"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMNotificationUsage badge](self, "badge"));
    v59 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v59 = 0;
  }
  -[BMNotificationUsage threadID](self, "threadID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage categoryID](self, "categoryID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage sectionID](self, "sectionID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMNotificationUsage _contactIDsJSONArray](self, "_contactIDsJSONArray");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMNotificationUsage hasIsGroupMessage](self, "hasIsGroupMessage"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMNotificationUsage isGroupMessage](self, "isGroupMessage"));
    v54 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v54 = 0;
  }
  -[BMNotificationUsage parentBundleID](self, "parentBundleID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMNotificationUsage hasBodyLength](self, "hasBodyLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMNotificationUsage bodyLength](self, "bodyLength"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  v62[0] = CFSTR("uniqueID");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v14;
  v63[0] = v14;
  v62[1] = CFSTR("absoluteTimestamp");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v15;
  v63[1] = v15;
  v62[2] = CFSTR("usageType");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v16;
  v63[2] = v16;
  v62[3] = CFSTR("bundleID");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v17;
  v63[3] = v17;
  v62[4] = CFSTR("notificationID");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v18;
  v63[4] = v18;
  v62[5] = CFSTR("deviceID");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v19;
  v63[5] = v19;
  v62[6] = CFSTR("title");
  v20 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v20;
  v63[6] = v20;
  v62[7] = CFSTR("subtitle");
  v21 = (uint64_t)v61;
  if (!v61)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v63[7] = v21;
  v62[8] = CFSTR("body");
  v22 = (uint64_t)v60;
  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v63[8] = v22;
  v62[9] = CFSTR("badge");
  v23 = (uint64_t)v59;
  if (!v59)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v23;
  v47 = (void *)v22;
  v63[9] = v23;
  v62[10] = CFSTR("threadID");
  v24 = (uint64_t)v58;
  if (!v58)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v51 = v7;
  v35 = v24;
  v63[10] = v24;
  v62[11] = CFSTR("categoryID");
  v25 = v57;
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52 = v13;
  v63[11] = v25;
  v62[12] = CFSTR("sectionID");
  v26 = v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v21;
  v49 = (void *)v12;
  v50 = (void *)v11;
  v48 = (void *)v3;
  v63[12] = v26;
  v62[13] = CFSTR("contactIDs");
  v27 = v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v10;
  v29 = (void *)v9;
  v63[13] = v27;
  v62[14] = CFSTR("isGroupMessage");
  v30 = v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v8;
  v63[14] = v30;
  v62[15] = CFSTR("parentBundleID");
  v32 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63[15] = v32;
  v62[16] = CFSTR("bodyLength");
  v33 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v63[16] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 17, v35);
  v45 = (id)objc_claimAutoreleasedReturnValue();
  if (!v33)

  if (!v53)
  if (!v54)

  if (!v55)
  if (!v56)

  if (!v57)
  if (!v58)

  if (!v59)
  if (!v60)

  if (v61)
  {
    if (v49)
      goto LABEL_67;
  }
  else
  {

    if (v49)
    {
LABEL_67:
      if (v50)
        goto LABEL_68;
      goto LABEL_76;
    }
  }

  if (v50)
  {
LABEL_68:
    if (v28)
      goto LABEL_69;
    goto LABEL_77;
  }
LABEL_76:

  if (v28)
  {
LABEL_69:
    if (v29)
      goto LABEL_70;
    goto LABEL_78;
  }
LABEL_77:

  if (v29)
  {
LABEL_70:
    if (v31)
      goto LABEL_71;
    goto LABEL_79;
  }
LABEL_78:

  if (v31)
  {
LABEL_71:
    if (v51)
      goto LABEL_72;
LABEL_80:

    if (v48)
      goto LABEL_73;
LABEL_81:

    goto LABEL_73;
  }
LABEL_79:

  if (!v51)
    goto LABEL_80;
LABEL_72:
  if (!v48)
    goto LABEL_81;
LABEL_73:

  return v45;
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
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
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
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  unsigned int v88;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMNotificationUsage uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMNotificationUsage uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_71;
    }
    -[BMNotificationUsage absoluteTimestamp](self, "absoluteTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMNotificationUsage absoluteTimestamp](self, "absoluteTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_71;
    }
    v19 = -[BMNotificationUsage usageType](self, "usageType");
    if (v19 == objc_msgSend(v5, "usageType"))
    {
      -[BMNotificationUsage bundleID](self, "bundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMNotificationUsage bundleID](self, "bundleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_71;
      }
      -[BMNotificationUsage notificationID](self, "notificationID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationID");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMNotificationUsage notificationID](self, "notificationID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "notificationID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_71;
      }
      -[BMNotificationUsage deviceID](self, "deviceID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceID");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMNotificationUsage deviceID](self, "deviceID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deviceID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_71;
      }
      -[BMNotificationUsage title](self, "title");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[BMNotificationUsage title](self, "title");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_71;
      }
      -[BMNotificationUsage subtitle](self, "subtitle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subtitle");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v44 == (void *)v45)
      {

      }
      else
      {
        v46 = (void *)v45;
        -[BMNotificationUsage subtitle](self, "subtitle");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subtitle");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "isEqual:", v48);

        if (!v49)
          goto LABEL_71;
      }
      -[BMNotificationUsage body](self, "body");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "body");
      v51 = objc_claimAutoreleasedReturnValue();
      if (v50 == (void *)v51)
      {

      }
      else
      {
        v52 = (void *)v51;
        -[BMNotificationUsage body](self, "body");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "body");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqual:", v54);

        if (!v55)
          goto LABEL_71;
      }
      if (-[BMNotificationUsage hasBadge](self, "hasBadge") || objc_msgSend(v5, "hasBadge"))
      {
        if (!-[BMNotificationUsage hasBadge](self, "hasBadge"))
          goto LABEL_71;
        if (!objc_msgSend(v5, "hasBadge"))
          goto LABEL_71;
        v56 = -[BMNotificationUsage badge](self, "badge");
        if (v56 != objc_msgSend(v5, "badge"))
          goto LABEL_71;
      }
      -[BMNotificationUsage threadID](self, "threadID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "threadID");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v57 == (void *)v58)
      {

      }
      else
      {
        v59 = (void *)v58;
        -[BMNotificationUsage threadID](self, "threadID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "threadID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v60, "isEqual:", v61);

        if (!v62)
          goto LABEL_71;
      }
      -[BMNotificationUsage categoryID](self, "categoryID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoryID");
      v64 = objc_claimAutoreleasedReturnValue();
      if (v63 == (void *)v64)
      {

      }
      else
      {
        v65 = (void *)v64;
        -[BMNotificationUsage categoryID](self, "categoryID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "categoryID");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v66, "isEqual:", v67);

        if (!v68)
          goto LABEL_71;
      }
      -[BMNotificationUsage sectionID](self, "sectionID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sectionID");
      v70 = objc_claimAutoreleasedReturnValue();
      if (v69 == (void *)v70)
      {

      }
      else
      {
        v71 = (void *)v70;
        -[BMNotificationUsage sectionID](self, "sectionID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sectionID");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v72, "isEqual:", v73);

        if (!v74)
          goto LABEL_71;
      }
      -[BMNotificationUsage contactIDs](self, "contactIDs");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIDs");
      v76 = objc_claimAutoreleasedReturnValue();
      if (v75 == (void *)v76)
      {

      }
      else
      {
        v77 = (void *)v76;
        -[BMNotificationUsage contactIDs](self, "contactIDs");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contactIDs");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v78, "isEqual:", v79);

        if (!v80)
          goto LABEL_71;
      }
      if (-[BMNotificationUsage hasIsGroupMessage](self, "hasIsGroupMessage")
        || objc_msgSend(v5, "hasIsGroupMessage"))
      {
        if (!-[BMNotificationUsage hasIsGroupMessage](self, "hasIsGroupMessage"))
          goto LABEL_71;
        if (!objc_msgSend(v5, "hasIsGroupMessage"))
          goto LABEL_71;
        v81 = -[BMNotificationUsage isGroupMessage](self, "isGroupMessage");
        if (v81 != objc_msgSend(v5, "isGroupMessage"))
          goto LABEL_71;
      }
      -[BMNotificationUsage parentBundleID](self, "parentBundleID");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentBundleID");
      v83 = objc_claimAutoreleasedReturnValue();
      if (v82 == (void *)v83)
      {

      }
      else
      {
        v84 = (void *)v83;
        -[BMNotificationUsage parentBundleID](self, "parentBundleID");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "parentBundleID");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v85, "isEqual:", v86);

        if (!v87)
          goto LABEL_71;
      }
      if (!-[BMNotificationUsage hasBodyLength](self, "hasBodyLength")
        && !objc_msgSend(v5, "hasBodyLength"))
      {
        v12 = 1;
        goto LABEL_72;
      }
      if (-[BMNotificationUsage hasBodyLength](self, "hasBodyLength")
        && objc_msgSend(v5, "hasBodyLength"))
      {
        v88 = -[BMNotificationUsage bodyLength](self, "bodyLength");
        v12 = v88 == objc_msgSend(v5, "bodyLength");
LABEL_72:

        goto LABEL_73;
      }
    }
LABEL_71:
    v12 = 0;
    goto LABEL_72;
  }
  v12 = 0;
LABEL_73:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (int)usageType
{
  return self->_usageType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (unint64_t)badge
{
  return self->_badge;
}

- (BOOL)hasBadge
{
  return self->_hasBadge;
}

- (void)setHasBadge:(BOOL)a3
{
  self->_hasBadge = a3;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (BOOL)hasIsGroupMessage
{
  return self->_hasIsGroupMessage;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  self->_hasIsGroupMessage = a3;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (unsigned)bodyLength
{
  return self->_bodyLength;
}

- (BOOL)hasBodyLength
{
  return self->_hasBodyLength;
}

- (void)setHasBodyLength:(BOOL)a3
{
  self->_hasBodyLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
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

    v7 = -[BMNotificationUsage initByReadFrom:]([BMNotificationUsage alloc], "initByReadFrom:", v6);
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
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[19];

  v21[17] = *MEMORY[0x1E0C80C00];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usageType"), 0, 0, 3, 4, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 4, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("notificationID"), 2, 0, 5, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceID"), 2, 0, 7, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 8, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subtitle"), 2, 0, 9, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("body"), 2, 0, 10, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("badge"), 0, 0, 11, 5, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("threadID"), 2, 0, 12, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("categoryID"), 2, 0, 13, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sectionID"), 2, 0, 14, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("contactIDs_json"), 5, 1, &__block_literal_global_123);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGroupMessage"), 0, 0, 16, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("parentBundleID"), 2, 0, 17, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bodyLength"), 0, 0, 18, 4, 0);
  v21[0] = v20;
  v21[1] = v19;
  v21[2] = v18;
  v21[3] = v17;
  v21[4] = v16;
  v21[5] = v15;
  v21[6] = v14;
  v21[7] = v2;
  v21[8] = v3;
  v21[9] = v4;
  v21[10] = v5;
  v21[11] = v13;
  v21[12] = v6;
  v21[13] = v7;
  v21[14] = v12;
  v21[15] = v8;
  v21[16] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 17);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BC70;
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
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[19];

  v21[17] = *MEMORY[0x1E0C80C00];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v21[0] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0);
  v21[1] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usageType"), 3, 4, 0);
  v21[2] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 4, 13, 0);
  v21[3] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("notificationID"), 5, 13, 0);
  v21[4] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceID"), 7, 13, 0);
  v21[5] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 8, 13, 0);
  v21[6] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subtitle"), 9, 13, 0);
  v21[7] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("body"), 10, 13, 0);
  v21[8] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("badge"), 11, 5, 0);
  v21[9] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("threadID"), 12, 13, 0);
  v21[10] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("categoryID"), 13, 13, 0);
  v21[11] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sectionID"), 14, 13, 0);
  v21[12] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactIDs"), 15, 13, 0);
  v21[13] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGroupMessage"), 16, 12, 0);
  v21[14] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parentBundleID"), 17, 13, 0);
  v21[15] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bodyLength"), 18, 4, 0);
  v21[16] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __30__BMNotificationUsage_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contactIDsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMNotificationUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageType:(int)a5 bundleID:(id)a6 notificationID:(id)a7 deviceID:(id)a8 title:(id)a9 subtitle:(id)a10 body:(id)a11 badge:(id)a12 threadID:(id)a13 categoryID:(id)a14 sectionID:(id)a15 contactIDs:(id)a16 isGroupMessage:(id)a17
{
  return -[BMNotificationUsage initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:](self, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, 0,
           0);
}

@end
