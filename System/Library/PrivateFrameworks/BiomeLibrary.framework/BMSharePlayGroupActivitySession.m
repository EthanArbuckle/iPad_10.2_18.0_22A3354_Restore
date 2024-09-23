@implementation BMSharePlayGroupActivitySession

- (BMSharePlayGroupActivitySession)initWithIsActive:(id)a3 sourceBundleID:(id)a4 activitySessionID:(id)a5 activityID:(id)a6 messagesChatGUID:(id)a7 experienceType:(id)a8 participantHandles:(id)a9 memberHandles:(id)a10
{
  id v16;
  id v17;
  BMSharePlayGroupActivitySession *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v16 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v21 = a8;
  v20 = a9;
  v17 = a10;
  v26.receiver = self;
  v26.super_class = (Class)BMSharePlayGroupActivitySession;
  v18 = -[BMEventBase init](&v26, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v20, v21, v22, v23, v24, v25);
    if (v16)
    {
      v18->_hasIsActive = 1;
      v18->_isActive = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v18->_hasIsActive = 0;
      v18->_isActive = 0;
    }
    objc_storeStrong((id *)&v18->_sourceBundleID, a4);
    objc_storeStrong((id *)&v18->_activitySessionID, a5);
    objc_storeStrong((id *)&v18->_activityID, a6);
    objc_storeStrong((id *)&v18->_messagesChatGUID, a7);
    objc_storeStrong((id *)&v18->_experienceType, a8);
    objc_storeStrong((id *)&v18->_participantHandles, a9);
    objc_storeStrong((id *)&v18->_memberHandles, a10);
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSharePlayGroupActivitySession isActive](self, "isActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession sourceBundleID](self, "sourceBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession activitySessionID](self, "activitySessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession activityID](self, "activityID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession messagesChatGUID](self, "messagesChatGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession experienceType](self, "experienceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession participantHandles](self, "participantHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession memberHandles](self, "memberHandles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSharePlayGroupActivitySession with isActive: %@, sourceBundleID: %@, activitySessionID: %@, activityID: %@, messagesChatGUID: %@, experienceType: %@, participantHandles: %@, memberHandles: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSharePlayGroupActivitySession *v5;
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
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSArray *participantHandles;
  uint64_t v36;
  NSArray *memberHandles;
  int v38;
  BMSharePlayGroupActivitySession *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMSharePlayGroupActivitySession;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
  {
LABEL_47:
    v39 = v5;
    goto LABEL_48;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_45:
    v34 = objc_msgSend(v6, "copy");
    participantHandles = v5->_participantHandles;
    v5->_participantHandles = (NSArray *)v34;

    v36 = objc_msgSend(v7, "copy");
    memberHandles = v5->_memberHandles;
    v5->_memberHandles = (NSArray *)v36;

    v38 = v4[*v10];
    if (v38)
      goto LABEL_46;
    goto LABEL_47;
  }
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v10])
      goto LABEL_45;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = *v8;
      v16 = *(_QWORD *)&v4[v15];
      if (v16 == -1 || v16 >= *(_QWORD *)&v4[*v9])
        break;
      v17 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
      *(_QWORD *)&v4[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0)
        goto LABEL_13;
      v12 += 7;
      v18 = v13++ >= 9;
      if (v18)
      {
        v14 = 0;
        v19 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    v19 = v4[*v10];
    if (v4[*v10])
      v14 = 0;
LABEL_15:
    if (v19 || (v14 & 7) == 4)
      goto LABEL_45;
    switch((v14 >> 3))
    {
      case 1u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v5->_hasIsActive = 1;
        while (1)
        {
          v24 = *v8;
          v25 = *(_QWORD *)&v4[v24];
          if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v9])
            break;
          v26 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v25);
          *(_QWORD *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_41;
          v21 += 7;
          v18 = v22++ >= 9;
          if (v18)
          {
            v23 = 0;
            goto LABEL_43;
          }
        }
        v4[*v10] = 1;
LABEL_41:
        if (v4[*v10])
          v23 = 0;
LABEL_43:
        v5->_isActive = v23 != 0;
        goto LABEL_44;
      case 2u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 24;
        goto LABEL_34;
      case 3u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 32;
        goto LABEL_34;
      case 4u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 40;
        goto LABEL_34;
      case 5u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 48;
        goto LABEL_34;
      case 6u:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 56;
LABEL_34:
        v29 = *(Class *)((char *)&v5->super.super.isa + v28);
        *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

        goto LABEL_44;
      case 7u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_49;
        v31 = (void *)v30;
        v32 = v6;
        goto LABEL_39;
      case 8u:
        PBReaderReadString();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!v33)
          goto LABEL_49;
        v31 = (void *)v33;
        v32 = v7;
LABEL_39:
        objc_msgSend(v32, "addObject:", v31);

        goto LABEL_44;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_44:
          if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
            goto LABEL_45;
          continue;
        }
LABEL_49:

LABEL_46:
        v39 = 0;
LABEL_48:

        return v39;
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasIsActive)
    PBDataWriterWriteBOOLField();
  if (self->_sourceBundleID)
    PBDataWriterWriteStringField();
  if (self->_activitySessionID)
    PBDataWriterWriteStringField();
  if (self->_activityID)
    PBDataWriterWriteStringField();
  if (self->_messagesChatGUID)
    PBDataWriterWriteStringField();
  if (self->_experienceType)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_participantHandles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_memberHandles;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSharePlayGroupActivitySession writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSharePlayGroupActivitySession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  id *v28;
  uint64_t v29;
  BMSharePlayGroupActivitySession *v30;
  id v31;
  void *v32;
  void *v33;
  BMSharePlayGroupActivitySession *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void **v51;
  uint64_t *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  id *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  id *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  uint64_t v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void **v90;
  uint64_t *v91;
  void *v92;
  id v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  id *v108;
  void *v109;
  void *v110;
  id v111;
  BMSharePlayGroupActivitySession *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id *v117;
  id *v118;
  id *v119;
  id *v120;
  id *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  _BYTE v134[128];
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  _BYTE v141[128];
  uint64_t v142;
  void *v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  id *v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  _QWORD v155[3];

  v155[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isActive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = a4;
        v29 = *MEMORY[0x1E0D025B8];
        v154 = *MEMORY[0x1E0CB2D50];
        v30 = self;
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v97 = objc_opt_class();
        v32 = v31;
        self = v30;
        v33 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v97, CFSTR("isActive"));
        v155[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, &v154, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        v34 = 0;
        *v28 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v29, 2, v9);
        goto LABEL_99;
      }
      v8 = 0;
      v34 = 0;
      goto LABEL_100;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceBundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v118 = a4;
        v36 = *MEMORY[0x1E0D025B8];
        v152 = *MEMORY[0x1E0CB2D50];
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceBundleID"));
        v153 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v35;
        v10 = (void *)v38;
        v33 = 0;
        v34 = 0;
        *v118 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v36, 2, v38);
        goto LABEL_98;
      }
      v33 = 0;
      v34 = 0;
      goto LABEL_99;
    }
    v116 = v9;
  }
  else
  {
    v116 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activitySessionID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v8;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v40 = v10;
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v119 = a4;
        v42 = *MEMORY[0x1E0D025B8];
        v150 = *MEMORY[0x1E0CB2D50];
        v43 = v9;
        v44 = objc_alloc(MEMORY[0x1E0CB3940]);
        v98 = objc_opt_class();
        v45 = v44;
        v9 = v43;
        v11 = (id)objc_msgSend(v45, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v98, CFSTR("activitySessionID"));
        v151 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v41;
        v10 = v40;
        v113 = (void *)v46;
        v37 = 0;
        v34 = 0;
        v33 = v116;
        *v119 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v42, 2);
        goto LABEL_97;
      }
      v37 = 0;
      v34 = 0;
      v33 = v116;
      goto LABEL_98;
    }
    v111 = v10;
  }
  else
  {
    v111 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityID"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v112 = self;
  v113 = v11;
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
          v34 = 0;
          v33 = v116;
          v37 = v111;
          goto LABEL_97;
        }
        v53 = v10;
        v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v120 = a4;
        v55 = *MEMORY[0x1E0D025B8];
        v148 = *MEMORY[0x1E0CB2D50];
        v56 = v9;
        v57 = objc_alloc(MEMORY[0x1E0CB3940]);
        v99 = objc_opt_class();
        v58 = v57;
        v9 = v56;
        v12 = (id)objc_msgSend(v58, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v99, CFSTR("activityID"));
        v149 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v54;
        v10 = v53;
        v110 = (void *)v59;
        v11 = 0;
        v34 = 0;
        *v120 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v55, 2);
        goto LABEL_102;
      }
      v11 = v11;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messagesChatGUID"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v110 = v12;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 0;
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v12;
      goto LABEL_26;
    }
    if (a4)
    {
      v62 = v10;
      v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v121 = a4;
      v64 = *MEMORY[0x1E0D025B8];
      v146 = *MEMORY[0x1E0CB2D50];
      v65 = v9;
      v66 = objc_alloc(MEMORY[0x1E0CB3940]);
      v100 = objc_opt_class();
      v67 = v66;
      v9 = v65;
      v68 = (id *)objc_msgSend(v67, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v100, CFSTR("messagesChatGUID"));
      v147 = v68;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v63;
      v10 = v62;
      v71 = v64;
      a4 = v68;
      v109 = (void *)v69;
      v12 = 0;
      v34 = 0;
      *v121 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2);
      goto LABEL_104;
    }
    v12 = 0;
    v34 = 0;
LABEL_102:
    v33 = v116;
    v37 = v111;
    goto LABEL_96;
  }
LABEL_26:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experienceType"));
  v13 = objc_claimAutoreleasedReturnValue();
  v106 = v10;
  v107 = v9;
  v109 = (void *)v13;
  if (v13)
  {
    v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v117 = a4;
        v108 = v14;
        goto LABEL_29;
      }
      if (a4)
      {
        v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v73 = v12;
        v74 = v7;
        v75 = *MEMORY[0x1E0D025B8];
        v144 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("experienceType"));
        v145 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
        v76 = a4;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v75;
        v7 = v74;
        v12 = v73;
        v108 = 0;
        v34 = 0;
        *v76 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v77, 2, v18);
        v33 = v116;
        v37 = v111;
        goto LABEL_93;
      }
      v34 = 0;
LABEL_104:
      v33 = v116;
      v37 = v111;
      goto LABEL_95;
    }
  }
  v117 = a4;
  v108 = 0;
LABEL_29:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("participantHandles"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  v105 = v7;
  if (v17)
  {
    v103 = v11;
    v104 = v12;

    v15 = 0;
  }
  else
  {
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v117)
        {
          v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v84 = v11;
          v85 = *MEMORY[0x1E0D025B8];
          v142 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("participantHandles"));
          v143 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v86 = v83;
          v7 = v105;
          v87 = v85;
          v11 = v84;
          v34 = 0;
          *v117 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2, v24);
          v33 = v116;
          v37 = v111;
          goto LABEL_92;
        }
        v34 = 0;
        v9 = v107;
        v33 = v116;
        v37 = v111;
        goto LABEL_94;
      }
    }
    v103 = v11;
    v104 = v12;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v15 = v15;
  v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v126, v141, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v127;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v127 != v21)
          objc_enumerationMutation(v15);
        v23 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v117)
          {
            v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v49 = *MEMORY[0x1E0D025B8];
            v139 = *MEMORY[0x1E0CB2D50];
            v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("participantHandles"));
            v140 = v114;
            v50 = (void *)MEMORY[0x1E0C99D80];
            v51 = &v140;
            v52 = &v139;
            goto LABEL_59;
          }
LABEL_63:
          v34 = 0;
          v24 = v15;
          v12 = v104;
          v7 = v105;
LABEL_64:
          v33 = v116;
          v37 = v111;
          v11 = v103;
          goto LABEL_92;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v117)
            goto LABEL_63;
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v49 = *MEMORY[0x1E0D025B8];
          v137 = *MEMORY[0x1E0CB2D50];
          v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("participantHandles"));
          v138 = v114;
          v50 = (void *)MEMORY[0x1E0C99D80];
          v51 = &v138;
          v52 = &v137;
LABEL_59:
          objc_msgSend(v50, "dictionaryWithObjects:forKeys:count:", v51, v52, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v104;
          v7 = v105;
          v33 = v116;
          v37 = v111;
          *v117 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v61);

          v34 = 0;
          v24 = v15;
          goto LABEL_60;
        }
        objc_msgSend(v18, "addObject:", v23);
      }
      v20 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v126, v141, 16);
    }
    while (v20);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("memberHandles"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "isEqual:", v25);

  if (v26)
  {

    v24 = 0;
  }
  else if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = v104;
      v7 = v105;
      if (!v117)
      {
        v34 = 0;
        goto LABEL_64;
      }
      v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v95 = *MEMORY[0x1E0D025B8];
      v135 = *MEMORY[0x1E0CB2D50];
      v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("memberHandles"));
      v136 = v114;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *v117 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v95, 2, v96);

      v34 = 0;
      v33 = v116;
      v37 = v111;
LABEL_60:
      v11 = v103;
      goto LABEL_91;
    }
  }
  v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v24 = v24;
  v78 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v122, v134, 16);
  if (!v78)
    goto LABEL_79;
  v79 = v78;
  v80 = *(_QWORD *)v123;
  while (2)
  {
    for (j = 0; j != v79; ++j)
    {
      if (*(_QWORD *)v123 != v80)
        objc_enumerationMutation(v24);
      v82 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v105;
        v33 = v116;
        v37 = v111;
        if (v117)
        {
          v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v101 = *MEMORY[0x1E0D025B8];
          v132 = *MEMORY[0x1E0CB2D50];
          v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("memberHandles"));
          v133 = v88;
          v89 = (void *)MEMORY[0x1E0C99D80];
          v90 = &v133;
          v91 = &v132;
LABEL_89:
          objc_msgSend(v89, "dictionaryWithObjects:forKeys:count:", v90, v91, 1);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          *v117 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v101, 2, v92);

        }
LABEL_90:

        v34 = 0;
        v11 = v103;
        v12 = v104;
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = v105;
        v33 = v116;
        v37 = v111;
        if (v117)
        {
          v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v101 = *MEMORY[0x1E0D025B8];
          v130 = *MEMORY[0x1E0CB2D50];
          v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("memberHandles"));
          v131 = v88;
          v89 = (void *)MEMORY[0x1E0C99D80];
          v90 = &v131;
          v91 = &v130;
          goto LABEL_89;
        }
        goto LABEL_90;
      }
      objc_msgSend(v114, "addObject:", v82);
    }
    v79 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v122, v134, 16);
    if (v79)
      continue;
    break;
  }
LABEL_79:

  v37 = v111;
  v33 = v116;
  v11 = v103;
  v12 = v104;
  v34 = -[BMSharePlayGroupActivitySession initWithIsActive:sourceBundleID:activitySessionID:activityID:messagesChatGUID:experienceType:participantHandles:memberHandles:](v112, "initWithIsActive:sourceBundleID:activitySessionID:activityID:messagesChatGUID:experienceType:participantHandles:memberHandles:", v115, v116, v111, v103, v104, v108, v18, v114);
  v112 = v34;
  v7 = v105;
LABEL_91:

LABEL_92:
LABEL_93:

  v9 = v107;
LABEL_94:

  v10 = v106;
  a4 = v108;
LABEL_95:

LABEL_96:
  self = v112;
LABEL_97:

  v8 = v115;
LABEL_98:

LABEL_99:
LABEL_100:

  return v34;
}

- (id)_participantHandlesJSONArray
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
  -[BMSharePlayGroupActivitySession participantHandles](self, "participantHandles", 0);
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

- (id)_memberHandlesJSONArray
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
  -[BMSharePlayGroupActivitySession memberHandles](self, "memberHandles", 0);
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
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  if (-[BMSharePlayGroupActivitySession hasIsActive](self, "hasIsActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSharePlayGroupActivitySession isActive](self, "isActive"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMSharePlayGroupActivitySession sourceBundleID](self, "sourceBundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession activitySessionID](self, "activitySessionID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession activityID](self, "activityID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession messagesChatGUID](self, "messagesChatGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession experienceType](self, "experienceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession _participantHandlesJSONArray](self, "_participantHandlesJSONArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSharePlayGroupActivitySession _memberHandlesJSONArray](self, "_memberHandlesJSONArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("isActive");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v11;
  v28[0] = v11;
  v27[1] = CFSTR("sourceBundleID");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v12;
  v28[1] = v12;
  v27[2] = CFSTR("activitySessionID");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v3;
  v20 = (void *)v13;
  v28[2] = v13;
  v27[3] = CFSTR("activityID");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v4;
  v28[3] = v14;
  v27[4] = CFSTR("messagesChatGUID");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v5;
  v28[4] = v15;
  v27[5] = CFSTR("experienceType");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v16;
  v27[6] = CFSTR("participantHandles");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v17;
  v27[7] = CFSTR("memberHandles");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_22;
LABEL_32:

    if (v8)
      goto LABEL_23;
    goto LABEL_33;
  }

  if (!v9)
    goto LABEL_32;
LABEL_22:
  if (v8)
    goto LABEL_23;
LABEL_33:

LABEL_23:
  if (!v7)

  if (!v6)
  if (v24)
  {
    if (v25)
      goto LABEL_29;
LABEL_35:

    if (v26)
      goto LABEL_30;
LABEL_36:

    goto LABEL_30;
  }

  if (!v25)
    goto LABEL_35;
LABEL_29:
  if (!v26)
    goto LABEL_36;
LABEL_30:

  return v23;
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
    if (-[BMSharePlayGroupActivitySession hasIsActive](self, "hasIsActive")
      || objc_msgSend(v5, "hasIsActive"))
    {
      if (!-[BMSharePlayGroupActivitySession hasIsActive](self, "hasIsActive"))
        goto LABEL_30;
      if (!objc_msgSend(v5, "hasIsActive"))
        goto LABEL_30;
      v6 = -[BMSharePlayGroupActivitySession isActive](self, "isActive");
      if (v6 != objc_msgSend(v5, "isActive"))
        goto LABEL_30;
    }
    -[BMSharePlayGroupActivitySession sourceBundleID](self, "sourceBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMSharePlayGroupActivitySession sourceBundleID](self, "sourceBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_30;
    }
    -[BMSharePlayGroupActivitySession activitySessionID](self, "activitySessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activitySessionID");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMSharePlayGroupActivitySession activitySessionID](self, "activitySessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activitySessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_30;
    }
    -[BMSharePlayGroupActivitySession activityID](self, "activityID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityID");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMSharePlayGroupActivitySession activityID](self, "activityID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_30;
    }
    -[BMSharePlayGroupActivitySession messagesChatGUID](self, "messagesChatGUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messagesChatGUID");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMSharePlayGroupActivitySession messagesChatGUID](self, "messagesChatGUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messagesChatGUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_30;
    }
    -[BMSharePlayGroupActivitySession experienceType](self, "experienceType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experienceType");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMSharePlayGroupActivitySession experienceType](self, "experienceType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "experienceType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_30;
    }
    -[BMSharePlayGroupActivitySession participantHandles](self, "participantHandles");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "participantHandles");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v38 == (void *)v39)
    {

    }
    else
    {
      v40 = (void *)v39;
      -[BMSharePlayGroupActivitySession participantHandles](self, "participantHandles");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "participantHandles");
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
    -[BMSharePlayGroupActivitySession memberHandles](self, "memberHandles");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "memberHandles");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 == v46)
    {
      v13 = 1;
    }
    else
    {
      -[BMSharePlayGroupActivitySession memberHandles](self, "memberHandles");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "memberHandles");
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

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)hasIsActive
{
  return self->_hasIsActive;
}

- (void)setHasIsActive:(BOOL)a3
{
  self->_hasIsActive = a3;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)activitySessionID
{
  return self->_activitySessionID;
}

- (NSString)activityID
{
  return self->_activityID;
}

- (NSString)messagesChatGUID
{
  return self->_messagesChatGUID;
}

- (NSString)experienceType
{
  return self->_experienceType;
}

- (NSArray)participantHandles
{
  return self->_participantHandles;
}

- (NSArray)memberHandles
{
  return self->_memberHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberHandles, 0);
  objc_storeStrong((id *)&self->_participantHandles, 0);
  objc_storeStrong((id *)&self->_experienceType, 0);
  objc_storeStrong((id *)&self->_messagesChatGUID, 0);
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_activitySessionID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
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

    v7 = -[BMSharePlayGroupActivitySession initByReadFrom:]([BMSharePlayGroupActivitySession alloc], "initByReadFrom:", v6);
    v7[5] = 1;

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
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActive"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activitySessionID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messagesChatGUID"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("experienceType"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("participantHandles_json"), 5, 1, &__block_literal_global_15950);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("memberHandles_json"), 5, 1, &__block_literal_global_41);
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
  return &unk_1E5F1B730;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActive"), 1, 12, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleID"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activitySessionID"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityID"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messagesChatGUID"), 5, 13, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("experienceType"), 6, 13, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("participantHandles"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("memberHandles"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __42__BMSharePlayGroupActivitySession_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_memberHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__BMSharePlayGroupActivitySession_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_participantHandlesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
