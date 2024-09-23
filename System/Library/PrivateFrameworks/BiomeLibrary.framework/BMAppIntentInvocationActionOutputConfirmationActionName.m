@implementation BMAppIntentInvocationActionOutputConfirmationActionName

- (BMAppIntentInvocationActionOutputConfirmationActionName)initWithType:(int)a3 destructive:(id)a4 acceptLabel:(id)a5 acceptAlternatives:(id)a6 denyLabel:(id)a7 denyAlternatives:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMAppIntentInvocationActionOutputConfirmationActionName *v18;
  id v20;
  objc_super v21;

  v14 = a4;
  v20 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMAppIntentInvocationActionOutputConfirmationActionName;
  v18 = -[BMEventBase init](&v21, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v18->_type = a3;
    if (v14)
    {
      v18->_hasDestructive = 1;
      v18->_destructive = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v18->_hasDestructive = 0;
      v18->_destructive = 0;
    }
    objc_storeStrong((id *)&v18->_acceptLabel, a5);
    objc_storeStrong((id *)&v18->_acceptAlternatives, a6);
    objc_storeStrong((id *)&v18->_denyLabel, a7);
    objc_storeStrong((id *)&v18->_denyAlternatives, a8);
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
  BMAppIntentInvocationActionOutputConfirmationActionNameTypeAsString(-[BMAppIntentInvocationActionOutputConfirmationActionName type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppIntentInvocationActionOutputConfirmationActionName destructive](self, "destructive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutputConfirmationActionName acceptLabel](self, "acceptLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutputConfirmationActionName acceptAlternatives](self, "acceptAlternatives");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutputConfirmationActionName denyLabel](self, "denyLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutputConfirmationActionName denyAlternatives](self, "denyAlternatives");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationActionOutputConfirmationActionName with type: %@, destructive: %@, acceptLabel: %@, acceptAlternatives: %@, denyLabel: %@, denyAlternatives: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationActionOutputConfirmationActionName *v5;
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
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  objc_class *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSArray *acceptAlternatives;
  uint64_t v45;
  NSArray *denyAlternatives;
  int v47;
  BMAppIntentInvocationActionOutputConfirmationActionName *v48;
  objc_super v50;
  uint64_t v51;
  uint64_t v52;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMAppIntentInvocationActionOutputConfirmationActionName;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_62;
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
          v22 = 0;
          v23 = 0;
          v24 = 0;
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
              goto LABEL_51;
            v22 += 7;
            v19 = v23++ >= 9;
            if (v19)
            {
              LODWORD(v24) = 0;
              goto LABEL_53;
            }
          }
          v4[*v10] = 1;
LABEL_51:
          if (v4[*v10])
            LODWORD(v24) = 0;
LABEL_53:
          if (v24 >= 0x23)
            LODWORD(v24) = 0;
          v5->_type = v24;
          continue;
        case 2u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasDestructive = 1;
          break;
        case 3u:
          v51 = 0;
          v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v36 = -[BMAppIntentInvocationStaticDeferredLocalizedString initByReadFrom:]([BMAppIntentInvocationStaticDeferredLocalizedString alloc], "initByReadFrom:", v4);
          if (!v36)
            goto LABEL_63;
          v37 = 32;
          goto LABEL_45;
        case 4u:
          v51 = 0;
          v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v38 = -[BMAppIntentInvocationStaticDeferredLocalizedString initByReadFrom:]([BMAppIntentInvocationStaticDeferredLocalizedString alloc], "initByReadFrom:", v4);
          if (!v38)
            goto LABEL_63;
          v39 = v38;
          v40 = v6;
          goto LABEL_49;
        case 5u:
          v51 = 0;
          v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v36 = -[BMAppIntentInvocationStaticDeferredLocalizedString initByReadFrom:]([BMAppIntentInvocationStaticDeferredLocalizedString alloc], "initByReadFrom:", v4);
          if (!v36)
            goto LABEL_63;
          v37 = 48;
LABEL_45:
          v41 = *(Class *)((char *)&v5->super.super.isa + v37);
          *(Class *)((char *)&v5->super.super.isa + v37) = v36;

          PBReaderRecallMark();
          continue;
        case 6u:
          v51 = 0;
          v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v42 = -[BMAppIntentInvocationStaticDeferredLocalizedString initByReadFrom:]([BMAppIntentInvocationStaticDeferredLocalizedString alloc], "initByReadFrom:", v4);
          if (!v42)
            goto LABEL_63;
          v39 = v42;
          v40 = v7;
LABEL_49:
          objc_msgSend(v40, "addObject:", v39);
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_63:

          goto LABEL_64;
      }
      while (1)
      {
        v32 = *v8;
        v33 = *(_QWORD *)&v4[v32];
        v34 = v33 + 1;
        if (v33 == -1 || v34 > *(_QWORD *)&v4[*v9])
          break;
        v35 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v33);
        *(_QWORD *)&v4[v32] = v34;
        v31 |= (unint64_t)(v35 & 0x7F) << v29;
        if ((v35 & 0x80) == 0)
          goto LABEL_57;
        v29 += 7;
        v19 = v30++ >= 9;
        if (v19)
        {
          v31 = 0;
          goto LABEL_59;
        }
      }
      v4[*v10] = 1;
LABEL_57:
      if (v4[*v10])
        v31 = 0;
LABEL_59:
      v5->_destructive = v31 != 0;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v43 = objc_msgSend(v6, "copy");
  acceptAlternatives = v5->_acceptAlternatives;
  v5->_acceptAlternatives = (NSArray *)v43;

  v45 = objc_msgSend(v7, "copy");
  denyAlternatives = v5->_denyAlternatives;
  v5->_denyAlternatives = (NSArray *)v45;

  v47 = v4[*v10];
  if (v47)
LABEL_64:
    v48 = 0;
  else
LABEL_62:
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
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasDestructive)
    PBDataWriterWriteBOOLField();
  if (self->_acceptLabel)
  {
    v25 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationStaticDeferredLocalizedString writeTo:](self->_acceptLabel, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_acceptAlternatives;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
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
        v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  if (self->_denyLabel)
  {
    v25 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationStaticDeferredLocalizedString writeTo:](self->_denyLabel, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_denyAlternatives;
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
        v25 = 0;
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
  -[BMAppIntentInvocationActionOutputConfirmationActionName writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationActionOutputConfirmationActionName)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BMAppIntentInvocationStaticDeferredLocalizedString *v19;
  BMAppIntentInvocationStaticDeferredLocalizedString *v20;
  BMAppIntentInvocationStaticDeferredLocalizedString *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  id v28;
  void *v29;
  BMAppIntentInvocationActionOutputConfirmationActionName *v30;
  id *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  BMAppIntentInvocationStaticDeferredLocalizedString *v72;
  BMAppIntentInvocationStaticDeferredLocalizedString *v73;
  id v74;
  BMAppIntentInvocationStaticDeferredLocalizedString *v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  id *v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  id *v85;
  uint64_t *v86;
  void *v87;
  void *v88;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  BMAppIntentInvocationActionOutputConfirmationActionName *v98;
  void *v99;
  id *v100;
  BMAppIntentInvocationStaticDeferredLocalizedString *v101;
  void *v102;
  void *v103;
  void *v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  id v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  id v121;
  _BYTE v122[128];
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  BMAppIntentInvocationStaticDeferredLocalizedString *v126;
  uint64_t v127;
  BMAppIntentInvocationStaticDeferredLocalizedString *v128;
  uint64_t v129;
  BMAppIntentInvocationStaticDeferredLocalizedString *v130;
  _BYTE v131[128];
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  _QWORD v139[3];

  v139[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v57 = *MEMORY[0x1E0D025B8];
          v138 = *MEMORY[0x1E0CB2D50];
          v31 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v139[0] = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, &v138, 1);
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = v56;
          v9 = (void *)v58;
          v7 = 0;
          v30 = 0;
          *a4 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v57, 2, v58);
          goto LABEL_106;
        }
        v7 = 0;
        v30 = 0;
        goto LABEL_107;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationActionOutputConfirmationActionNameTypeFromString(v6));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v8;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destructive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v31 = a4;
      if (a4)
      {
        v32 = v9;
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v136 = *MEMORY[0x1E0CB2D50];
        v35 = v7;
        v36 = objc_alloc(MEMORY[0x1E0CB3940]);
        v90 = objc_opt_class();
        v37 = v36;
        v7 = v35;
        v27 = (id)objc_msgSend(v37, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v90, CFSTR("destructive"));
        v137 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v33;
        v9 = v32;
        v102 = (void *)v38;
        v30 = 0;
        v31 = 0;
        *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v34, 2);

        goto LABEL_105;
      }
      v30 = 0;
      goto LABEL_106;
    }
    v100 = v9;
  }
  else
  {
    v100 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("acceptLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v9;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v134 = *MEMORY[0x1E0CB2D50];
        v42 = v7;
        v43 = objc_alloc(MEMORY[0x1E0CB3940]);
        v91 = objc_opt_class();
        v44 = v43;
        v7 = v42;
        v103 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v91, CFSTR("acceptLabel"));
        v135 = v103;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v40;
        v9 = v99;
        *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v41, 2, v45);

        v30 = 0;
        v27 = v10;
        v31 = v100;

      }
      else
      {
        v30 = 0;
        v31 = v100;
        v27 = v10;
      }
      goto LABEL_105;
    }
    v27 = v10;
    v117 = 0;
    v101 = -[BMAppIntentInvocationStaticDeferredLocalizedString initWithJSONDictionary:error:]([BMAppIntentInvocationStaticDeferredLocalizedString alloc], "initWithJSONDictionary:error:", v27, &v117);
    v28 = v117;
    if (v28)
    {
      v29 = v28;
      if (a4)
        *a4 = objc_retainAutorelease(v28);

      v30 = 0;
      v9 = v99;
      v31 = v100;
      goto LABEL_104;
    }
    v95 = v6;
    v98 = self;

  }
  else
  {
    v95 = v6;
    v98 = self;
    v101 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("acceptAlternatives"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  v96 = v7;
  v97 = v5;
  v94 = v10;
  if (v13)
  {

    v11 = 0;
  }
  else if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = *MEMORY[0x1E0D025B8];
        v132 = *MEMORY[0x1E0CB2D50];
        v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("acceptAlternatives"));
        v133 = v105;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        *a4 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2, v23);
        goto LABEL_60;
      }
      v30 = 0;
      v9 = v99;
      v31 = v100;
      goto LABEL_103;
    }
  }
  v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v11 = v11;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v113, v131, 16);
  if (!v14)
  {
LABEL_29:

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("denyLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
LABEL_32:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("denyAlternatives"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      v92 = v23;
      if (v26)
      {

        v24 = 0;
LABEL_65:
        v7 = v96;
        goto LABEL_66;
      }
      if (!v24)
        goto LABEL_65;
      objc_opt_class();
      v7 = v96;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_66:
        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v24 = v24;
        v66 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
        if (!v66)
          goto LABEL_76;
        v67 = v66;
        v68 = *(_QWORD *)v108;
        v93 = v65;
LABEL_68:
        v69 = 0;
        while (1)
        {
          if (*(_QWORD *)v108 != v68)
            objc_enumerationMutation(v24);
          v70 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v69);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = v97;
            v9 = v99;
            v31 = v100;
            v80 = a4;
            if (!a4)
              goto LABEL_98;
            v81 = v99;
            v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v83 = *MEMORY[0x1E0D025B8];
            v118 = *MEMORY[0x1E0CB2D50];
            v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("denyAlternatives"));
            v119 = v71;
            v84 = (void *)MEMORY[0x1E0C99D80];
            v85 = &v119;
            v86 = &v118;
            goto LABEL_93;
          }
          v71 = v70;
          v72 = [BMAppIntentInvocationStaticDeferredLocalizedString alloc];
          v106 = 0;
          v73 = -[BMAppIntentInvocationStaticDeferredLocalizedString initWithJSONDictionary:error:](v72, "initWithJSONDictionary:error:", v71, &v106);
          v74 = v106;
          if (v74)
          {
            v87 = v74;
            if (a4)
              *a4 = objc_retainAutorelease(v74);

            v5 = v97;
            v9 = v99;
            v31 = v100;
LABEL_97:

LABEL_98:
            v30 = 0;
            v7 = v96;
            v65 = v93;
            goto LABEL_99;
          }
          objc_msgSend(v93, "addObject:", v73);

          if (v67 == ++v69)
          {
            v67 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
            v7 = v96;
            v65 = v93;
            if (v67)
              goto LABEL_68;
LABEL_76:

            v31 = v100;
            v30 = -[BMAppIntentInvocationActionOutputConfirmationActionName initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:](v98, "initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:", objc_msgSend(v7, "intValue"), v100, v101, v105, v19, v65);
            v98 = v30;
            v5 = v97;
            v9 = v99;
LABEL_99:

            goto LABEL_100;
          }
        }
        v5 = v97;
        v9 = v99;
        v31 = v100;
        v80 = a4;
        if (!a4)
          goto LABEL_98;
        v81 = v99;
        v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v83 = *MEMORY[0x1E0D025B8];
        v120 = *MEMORY[0x1E0CB2D50];
        v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("denyAlternatives"));
        v121 = v71;
        v84 = (void *)MEMORY[0x1E0C99D80];
        v85 = &v121;
        v86 = &v120;
LABEL_93:
        objc_msgSend(v84, "dictionaryWithObjects:forKeys:count:", v85, v86, 1);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v82;
        v9 = v81;
        v31 = v100;
        *v80 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v83, 2, v87);
        goto LABEL_97;
      }
      if (a4)
      {
        v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v61 = *MEMORY[0x1E0D025B8];
        v123 = *MEMORY[0x1E0CB2D50];
        v62 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("denyAlternatives"));
        v124 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v61;
        v7 = v96;
        *a4 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v64, 2, v63);
        v65 = (void *)v62;

        v30 = 0;
        v9 = v99;
        v31 = v100;
        goto LABEL_99;
      }
      v30 = 0;
      v9 = v99;
      v31 = v100;
LABEL_100:
      v23 = v92;
LABEL_101:

      goto LABEL_102;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v23;
      v75 = [BMAppIntentInvocationStaticDeferredLocalizedString alloc];
      v111 = 0;
      v19 = -[BMAppIntentInvocationStaticDeferredLocalizedString initWithJSONDictionary:error:](v75, "initWithJSONDictionary:error:", v24, &v111);
      v76 = v111;
      if (!v76)
      {

        goto LABEL_32;
      }
      v77 = v76;
      if (a4)
        *a4 = objc_retainAutorelease(v76);

      v30 = 0;
      v23 = v24;
    }
    else
    {
      if (!a4)
      {
        v30 = 0;
        v9 = v99;
        v31 = v100;
        goto LABEL_102;
      }
      v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v79 = *MEMORY[0x1E0D025B8];
      v125 = *MEMORY[0x1E0CB2D50];
      v19 = (BMAppIntentInvocationStaticDeferredLocalizedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("denyLabel"));
      v126 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      *a4 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2, v24);
    }
LABEL_54:
    v7 = v96;
    v9 = v99;
    v31 = v100;
    goto LABEL_101;
  }
  v15 = v14;
  v16 = *(_QWORD *)v114;
LABEL_21:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v114 != v16)
      objc_enumerationMutation(v11);
    v18 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v17);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v48 = a4;
      if (!a4)
        goto LABEL_59;
      v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0D025B8];
      v127 = *MEMORY[0x1E0CB2D50];
      v19 = (BMAppIntentInvocationStaticDeferredLocalizedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("acceptAlternatives"));
      v128 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v50 = v52;
      v51 = v53;
LABEL_49:
      v30 = 0;
      *v48 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v24);
LABEL_53:
      v23 = v11;
      goto LABEL_54;
    }
    v19 = v18;
    v20 = [BMAppIntentInvocationStaticDeferredLocalizedString alloc];
    v112 = 0;
    v21 = -[BMAppIntentInvocationStaticDeferredLocalizedString initWithJSONDictionary:error:](v20, "initWithJSONDictionary:error:", v19, &v112);
    v22 = v112;
    if (v22)
    {
      v24 = v22;
      if (a4)
        *a4 = objc_retainAutorelease(v22);

      v30 = 0;
      goto LABEL_53;
    }
    objc_msgSend(v105, "addObject:", v21);

    if (v15 == ++v17)
    {
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v113, v131, 16);
      if (!v15)
        goto LABEL_29;
      goto LABEL_21;
    }
  }
  if (a4)
  {
    v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v48 = a4;
    v49 = *MEMORY[0x1E0D025B8];
    v129 = *MEMORY[0x1E0CB2D50];
    v19 = (BMAppIntentInvocationStaticDeferredLocalizedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("acceptAlternatives"));
    v130 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v50 = v47;
    v51 = v49;
    goto LABEL_49;
  }
LABEL_59:
  v30 = 0;
  v23 = v11;
LABEL_60:
  v9 = v99;
  v31 = v100;
LABEL_102:

LABEL_103:
  v27 = v94;
  v6 = v95;
  self = v98;
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
  return v30;
}

- (id)_acceptAlternativesJSONArray
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
  -[BMAppIntentInvocationActionOutputConfirmationActionName acceptAlternatives](self, "acceptAlternatives", 0);
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

- (id)_denyAlternativesJSONArray
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
  -[BMAppIntentInvocationActionOutputConfirmationActionName denyAlternatives](self, "denyAlternatives", 0);
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
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocationActionOutputConfirmationActionName type](self, "type"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMAppIntentInvocationActionOutputConfirmationActionName hasDestructive](self, "hasDestructive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppIntentInvocationActionOutputConfirmationActionName destructive](self, "destructive"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMAppIntentInvocationActionOutputConfirmationActionName acceptLabel](self, "acceptLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationActionOutputConfirmationActionName _acceptAlternativesJSONArray](self, "_acceptAlternativesJSONArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutputConfirmationActionName denyLabel](self, "denyLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationActionOutputConfirmationActionName _denyAlternativesJSONArray](self, "_denyAlternativesJSONArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("type");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v11;
  v24[0] = v11;
  v23[1] = CFSTR("destructive");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  v24[1] = v12;
  v23[2] = CFSTR("acceptLabel");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v3;
  v24[2] = v13;
  v23[3] = CFSTR("acceptAlternatives");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v14;
  v23[4] = CFSTR("denyLabel");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v15;
  v23[5] = CFSTR("denyAlternatives");
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
      goto LABEL_18;
LABEL_24:

    if (v7)
      goto LABEL_19;
    goto LABEL_25;
  }

  if (!v9)
    goto LABEL_24;
LABEL_18:
  if (v7)
    goto LABEL_19;
LABEL_25:

LABEL_19:
  if (v6)
  {
    if (v4)
      goto LABEL_21;
LABEL_27:

    if (v22)
      goto LABEL_22;
LABEL_28:

    goto LABEL_22;
  }

  if (!v4)
    goto LABEL_27;
LABEL_21:
  if (!v22)
    goto LABEL_28;
LABEL_22:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMAppIntentInvocationActionOutputConfirmationActionName type](self, "type");
    if (v6 != objc_msgSend(v5, "type"))
      goto LABEL_19;
    if (-[BMAppIntentInvocationActionOutputConfirmationActionName hasDestructive](self, "hasDestructive")
      || objc_msgSend(v5, "hasDestructive"))
    {
      if (!-[BMAppIntentInvocationActionOutputConfirmationActionName hasDestructive](self, "hasDestructive"))
        goto LABEL_19;
      if (!objc_msgSend(v5, "hasDestructive"))
        goto LABEL_19;
      v7 = -[BMAppIntentInvocationActionOutputConfirmationActionName destructive](self, "destructive");
      if (v7 != objc_msgSend(v5, "destructive"))
        goto LABEL_19;
    }
    -[BMAppIntentInvocationActionOutputConfirmationActionName acceptLabel](self, "acceptLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptLabel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[BMAppIntentInvocationActionOutputConfirmationActionName acceptLabel](self, "acceptLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "acceptLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_19;
    }
    -[BMAppIntentInvocationActionOutputConfirmationActionName acceptAlternatives](self, "acceptAlternatives");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptAlternatives");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[BMAppIntentInvocationActionOutputConfirmationActionName acceptAlternatives](self, "acceptAlternatives");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "acceptAlternatives");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_19;
    }
    -[BMAppIntentInvocationActionOutputConfirmationActionName denyLabel](self, "denyLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "denyLabel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[BMAppIntentInvocationActionOutputConfirmationActionName denyLabel](self, "denyLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "denyLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
      {
LABEL_19:
        v14 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    -[BMAppIntentInvocationActionOutputConfirmationActionName denyAlternatives](self, "denyAlternatives");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "denyAlternatives");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 == v29)
    {
      v14 = 1;
    }
    else
    {
      -[BMAppIntentInvocationActionOutputConfirmationActionName denyAlternatives](self, "denyAlternatives");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "denyAlternatives");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v30, "isEqual:", v31);

    }
    goto LABEL_20;
  }
  v14 = 0;
LABEL_21:

  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)type
{
  return self->_type;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (BOOL)hasDestructive
{
  return self->_hasDestructive;
}

- (void)setHasDestructive:(BOOL)a3
{
  self->_hasDestructive = a3;
}

- (BMAppIntentInvocationStaticDeferredLocalizedString)acceptLabel
{
  return self->_acceptLabel;
}

- (NSArray)acceptAlternatives
{
  return self->_acceptAlternatives;
}

- (BMAppIntentInvocationStaticDeferredLocalizedString)denyLabel
{
  return self->_denyLabel;
}

- (NSArray)denyAlternatives
{
  return self->_denyAlternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyAlternatives, 0);
  objc_storeStrong((id *)&self->_denyLabel, 0);
  objc_storeStrong((id *)&self->_acceptAlternatives, 0);
  objc_storeStrong((id *)&self->_acceptLabel, 0);
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

    v4 = -[BMAppIntentInvocationActionOutputConfirmationActionName initByReadFrom:]([BMAppIntentInvocationActionOutputConfirmationActionName alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("destructive"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("acceptLabel_json"), 5, 1, &__block_literal_global_614);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("acceptAlternatives_json"), 5, 1, &__block_literal_global_615);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("denyLabel_json"), 5, 1, &__block_literal_global_616);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("denyAlternatives_json"), 5, 1, &__block_literal_global_617);
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
  return &unk_1E5F1CC18;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("destructive"), 2, 12, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("acceptLabel"), 3, 14, objc_opt_class());
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("acceptAlternatives"), 4, 14, objc_opt_class());
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("denyLabel"), 5, 14, objc_opt_class());
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("denyAlternatives"), 6, 14, objc_opt_class());
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_denyAlternativesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "denyLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_acceptAlternativesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
