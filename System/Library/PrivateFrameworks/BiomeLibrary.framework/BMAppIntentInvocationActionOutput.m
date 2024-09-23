@implementation BMAppIntentInvocationActionOutput

- (BMAppIntentInvocationActionOutput)initWithIdentifier:(id)a3 showOutputAction:(id)a4 showOutputActionHint:(int)a5 dialog:(id)a6 value:(id)a7 nextAction:(id)a8 confirmationActionName:(id)a9 showPrompt:(id)a10 suggestedFollowUpActions:(id)a11
{
  id v16;
  id v17;
  id v18;
  BMAppIntentInvocationActionOutput *v19;
  uint64_t v20;
  NSData *raw_identifier;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v28 = a4;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v17 = a10;
  v18 = a11;
  v29.receiver = self;
  v29.super_class = (Class)BMAppIntentInvocationActionOutput;
  v19 = -[BMEventBase init](&v29, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v30[0] = 0;
      v30[1] = 0;
      objc_msgSend(v16, "getUUIDBytes:", v30);
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v30, 16);
      raw_identifier = v19->_raw_identifier;
      v19->_raw_identifier = (NSData *)v20;
    }
    else
    {
      raw_identifier = v19->_raw_identifier;
      v19->_raw_identifier = 0;
    }

    objc_storeStrong((id *)&v19->_showOutputAction, a4);
    v19->_showOutputActionHint = a5;
    objc_storeStrong((id *)&v19->_dialog, a6);
    objc_storeStrong((id *)&v19->_value, a7);
    objc_storeStrong((id *)&v19->_nextAction, a8);
    objc_storeStrong((id *)&v19->_confirmationActionName, a9);
    if (v17)
    {
      v19->_hasShowPrompt = 1;
      v19->_showPrompt = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v19->_hasShowPrompt = 0;
      v19->_showPrompt = 0;
    }
    objc_storeStrong((id *)&v19->_suggestedFollowUpActions, a11);
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
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppIntentInvocationActionOutput identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutput showOutputAction](self, "showOutputAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentInvocationActionOutputHintAsString(-[BMAppIntentInvocationActionOutput showOutputActionHint](self, "showOutputActionHint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutput dialog](self, "dialog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutput value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutput nextAction](self, "nextAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutput confirmationActionName](self, "confirmationActionName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppIntentInvocationActionOutput showPrompt](self, "showPrompt"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationActionOutput with identifier: %@, showOutputAction: %@, showOutputActionHint: %@, dialog: %@, value: %@, nextAction: %@, confirmationActionName: %@, showPrompt: %@, suggestedFollowUpActions: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationActionOutput *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  unint64_t v10;
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
  unint64_t v22;
  NSData *v23;
  NSData *raw_identifier;
  objc_class *v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  void *v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSArray *suggestedFollowUpActions;
  int v46;
  BMAppIntentInvocationActionOutput *v47;
  objc_super v49;
  uint64_t v50;
  uint64_t v51;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMAppIntentInvocationActionOutput;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_70;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = 0x1E5E4A000uLL;
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
          v22 = v10;
          PBReaderReadData();
          v23 = (NSData *)objc_claimAutoreleasedReturnValue();
          if (-[NSData length](v23, "length") == 16)
          {
            raw_identifier = v5->_raw_identifier;
            v5->_raw_identifier = v23;

            goto LABEL_57;
          }

          goto LABEL_72;
        case 2u:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_72;
          v25 = (objc_class *)objc_msgSend(objc_alloc(*(Class *)(v10 + 1848)), "initByReadFrom:", v4);
          if (!v25)
            goto LABEL_72;
          v26 = 40;
          goto LABEL_46;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (2)
          {
            v30 = *v7;
            v31 = *(_QWORD *)&v4[v30];
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v31);
              *(_QWORD *)&v4[v30] = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                v19 = v28++ >= 9;
                if (v19)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v29) = 0;
LABEL_61:
          if (v29 >= 4)
            LODWORD(v29) = 0;
          v5->_showOutputActionHint = v29;
          continue;
        case 4u:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_72;
          v25 = -[BMAppIntentInvocationActionOutputDialog initByReadFrom:]([BMAppIntentInvocationActionOutputDialog alloc], "initByReadFrom:", v4);
          if (!v25)
            goto LABEL_72;
          v26 = 48;
          goto LABEL_46;
        case 6u:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_72;
          v25 = -[BMAppIntentInvocationValue initByReadFrom:]([BMAppIntentInvocationValue alloc], "initByReadFrom:", v4);
          if (!v25)
            goto LABEL_72;
          v26 = 56;
          goto LABEL_46;
        case 8u:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_72;
          v25 = (objc_class *)objc_msgSend(objc_alloc(*(Class *)(v10 + 1848)), "initByReadFrom:", v4);
          if (!v25)
            goto LABEL_72;
          v26 = 64;
          goto LABEL_46;
        case 9u:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_72;
          v25 = -[BMAppIntentInvocationActionOutputConfirmationActionName initByReadFrom:]([BMAppIntentInvocationActionOutputConfirmationActionName alloc], "initByReadFrom:", v4);
          if (!v25)
            goto LABEL_72;
          v26 = 72;
LABEL_46:
          v34 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = v25;

          PBReaderRecallMark();
          continue;
        case 0xAu:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasShowPrompt = 1;
          break;
        case 0xBu:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_72;
          v22 = v10;
          v42 = objc_msgSend(objc_alloc(*(Class *)(v10 + 1848)), "initByReadFrom:", v4);
          if (!v42)
            goto LABEL_72;
          v43 = (void *)v42;
          objc_msgSend(v6, "addObject:", v42);
          PBReaderRecallMark();

LABEL_57:
          v10 = v22;
          continue;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
LABEL_72:

          goto LABEL_73;
      }
      while (1)
      {
        v38 = *v7;
        v39 = *(_QWORD *)&v4[v38];
        v40 = v39 + 1;
        if (v39 == -1 || v40 > *(_QWORD *)&v4[*v8])
          break;
        v41 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v39);
        *(_QWORD *)&v4[v38] = v40;
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0)
          goto LABEL_65;
        v35 += 7;
        v19 = v36++ >= 9;
        if (v19)
        {
          v37 = 0;
          goto LABEL_67;
        }
      }
      v4[*v9] = 1;
LABEL_65:
      if (v4[*v9])
        v37 = 0;
LABEL_67:
      v5->_showPrompt = v37 != 0;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v44 = objc_msgSend(v6, "copy");
  suggestedFollowUpActions = v5->_suggestedFollowUpActions;
  v5->_suggestedFollowUpActions = (NSArray *)v44;

  v46 = v4[*v9];
  if (v46)
LABEL_73:
    v47 = 0;
  else
LABEL_70:
    v47 = v5;

  return v47;
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_raw_identifier)
    PBDataWriterWriteDataField();
  if (self->_showOutputAction)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationAction writeTo:](self->_showOutputAction, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_dialog)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationActionOutputDialog writeTo:](self->_dialog, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_value)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationValue writeTo:](self->_value, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_nextAction)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationAction writeTo:](self->_nextAction, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_confirmationActionName)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationActionOutputConfirmationActionName writeTo:](self->_confirmationActionName, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasShowPrompt)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_suggestedFollowUpActions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (_QWORD)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppIntentInvocationActionOutput writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationActionOutput)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BMAppIntentInvocationAction *v9;
  void *v10;
  id v11;
  id *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  BMAppIntentInvocationAction *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BMAppIntentInvocationAction *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  BMAppIntentInvocationValue *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t i;
  void *v71;
  id v72;
  BMAppIntentInvocationAction *v73;
  BMAppIntentInvocationAction *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id *v80;
  uint64_t v81;
  id v82;
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  id *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  id v100;
  id v101;
  id *v102;
  uint64_t v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  id v108;
  id *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  id *v114;
  id v115;
  uint64_t v116;
  void *v117;
  id *v118;
  uint64_t *v119;
  void *v120;
  id v121;
  uint64_t v122;
  void *v123;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id *v128;
  id *v129;
  id *v130;
  void *v131;
  id v132;
  id obj;
  id v134;
  BMAppIntentInvocationActionOutputConfirmationActionName *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  BMAppIntentInvocationAction *v141;
  BMAppIntentInvocationAction *v142;
  BMAppIntentInvocationAction *v143;
  BMAppIntentInvocationAction *v144;
  void *v145;
  void *v146;
  BMAppIntentInvocationAction *v147;
  BMAppIntentInvocationValue *v148;
  void *v149;
  void *v150;
  void *v151;
  BMAppIntentInvocationActionOutputDialog *v152;
  void *v153;
  void *v154;
  id v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  uint64_t v166;
  id v167;
  uint64_t v168;
  id v169;
  _BYTE v170[128];
  uint64_t v171;
  void *v172;
  uint64_t v173;
  id v174;
  uint64_t v175;
  BMAppIntentInvocationActionOutputConfirmationActionName *v176;
  uint64_t v177;
  BMAppIntentInvocationAction *v178;
  uint64_t v179;
  BMAppIntentInvocationValue *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  _QWORD v190[3];

  v190[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = a4;
        v20 = *MEMORY[0x1E0D025B8];
        v187 = *MEMORY[0x1E0CB2D50];
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v188 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18;
        v7 = (void *)v21;
        v23 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v20, 2, v8);
        a4 = 0;
        *v19 = v23;
        goto LABEL_126;
      }
      goto LABEL_128;
    }
    v12 = a4;
    v13 = v6;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
    if (!v14)
    {
      v86 = v13;
      if (v12)
      {
        v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v88 = *MEMORY[0x1E0D025B8];
        v189 = *MEMORY[0x1E0CB2D50];
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("identifier"));
        v190[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v190, &v189, 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *v12 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v88, 2, v89);

        a4 = 0;
        v7 = v86;
        goto LABEL_126;
      }
      a4 = 0;
      v7 = v86;
      goto LABEL_127;
    }
    v7 = (void *)v14;

    a4 = v12;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("showOutputAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v24 = v7;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = a4;
        v27 = *MEMORY[0x1E0D025B8];
        v185 = *MEMORY[0x1E0CB2D50];
        v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("showOutputAction"));
        v186 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v29 = v25;
        v7 = v24;
        v9 = (BMAppIntentInvocationAction *)v28;
        v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v27, 2, v11);
        a4 = 0;
        *v26 = v30;
        goto LABEL_125;
      }
      goto LABEL_126;
    }
    v11 = v8;
    v165 = 0;
    v9 = -[BMAppIntentInvocationAction initWithJSONDictionary:error:]([BMAppIntentInvocationAction alloc], "initWithJSONDictionary:error:", v11, &v165);
    v15 = v165;
    if (v15)
    {
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

      a4 = 0;
      goto LABEL_125;
    }

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("showOutputActionHint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v96 = v7;
          v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v130 = a4;
          v98 = *MEMORY[0x1E0D025B8];
          v183 = *MEMORY[0x1E0CB2D50];
          v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("showOutputActionHint"));
          v184 = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v97;
          v7 = v96;
          v100 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v98, 2, v60);
          v11 = 0;
          a4 = 0;
          *v130 = v100;
          goto LABEL_122;
        }
        v11 = 0;
        goto LABEL_124;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationActionOutputHintFromString(v10));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v17;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dialog"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v11;
  if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v137 = v10;
        v142 = v9;
        v56 = v7;
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v129 = a4;
        v58 = *MEMORY[0x1E0D025B8];
        v181 = *MEMORY[0x1E0CB2D50];
        v59 = v31;
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("dialog"));
        v182 = v60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v57;
        v7 = v56;
        v10 = v137;
        *v129 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v58, 2, v61);

        a4 = 0;
        v46 = v59;
        v9 = v142;
        goto LABEL_122;
      }
      goto LABEL_123;
    }
    v45 = v7;
    v46 = v31;
    v164 = 0;
    v152 = -[BMAppIntentInvocationActionOutputDialog initWithJSONDictionary:error:]([BMAppIntentInvocationActionOutputDialog alloc], "initWithJSONDictionary:error:", v46, &v164);
    v47 = v164;
    if (v47)
    {
      v48 = v47;
      if (a4)
        *a4 = objc_retainAutorelease(v47);

      a4 = 0;
      v7 = v45;
      v11 = v153;
      goto LABEL_121;
    }
    v32 = v6;
    v33 = v9;

    v150 = v45;
    v11 = v153;
  }
  else
  {
    v150 = v7;
    v32 = v6;
    v33 = v9;
    v152 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v34 = objc_claimAutoreleasedReturnValue();
  v154 = v31;
  v149 = (void *)v34;
  if (v34 && (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v143 = v33;
        v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v138 = v10;
        v80 = a4;
        v81 = *MEMORY[0x1E0D025B8];
        v179 = *MEMORY[0x1E0CB2D50];
        v82 = objc_alloc(MEMORY[0x1E0CB3940]);
        v125 = objc_opt_class();
        v83 = v82;
        v31 = v154;
        v52 = (BMAppIntentInvocationValue *)objc_msgSend(v83, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v125, CFSTR("value"));
        v180 = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v81, 2, v84);
        a4 = 0;
        *v80 = v85;
        v11 = v153;
        v6 = v32;
        v36 = (void *)v84;
        v10 = v138;
        v9 = v143;
        goto LABEL_119;
      }
      v11 = v153;
      v9 = v33;
      v6 = v32;
      goto LABEL_120;
    }
    v49 = v35;
    v163 = 0;
    v148 = -[BMAppIntentInvocationValue initWithJSONDictionary:error:]([BMAppIntentInvocationValue alloc], "initWithJSONDictionary:error:", v49, &v163);
    v50 = v163;
    if (v50)
    {
      v51 = v50;
      v132 = v49;
      v11 = v153;
      v9 = v33;
      if (a4)
        *a4 = objc_retainAutorelease(v50);

      a4 = 0;
      v6 = v32;
      v52 = v148;
      v36 = v132;
      goto LABEL_119;
    }

    v11 = v153;
  }
  else
  {
    v148 = 0;
  }
  v9 = v33;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nextAction"));
  v6 = v32;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = v36;
        v162 = 0;
        v147 = -[BMAppIntentInvocationAction initWithJSONDictionary:error:]([BMAppIntentInvocationAction alloc], "initWithJSONDictionary:error:", v53, &v162);
        v54 = v162;
        if (!v54)
        {
          v145 = v6;
          v37 = v9;

          v11 = v153;
          goto LABEL_36;
        }
        v55 = v54;
        v146 = v53;
        v11 = v153;
        if (a4)
          *a4 = objc_retainAutorelease(v54);

        a4 = 0;
      }
      else
      {
        if (!a4)
        {
          v11 = v153;
          v52 = v148;
          goto LABEL_119;
        }
        v144 = v9;
        v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v139 = v10;
        v91 = a4;
        v92 = *MEMORY[0x1E0D025B8];
        v177 = *MEMORY[0x1E0CB2D50];
        v147 = (BMAppIntentInvocationAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("nextAction"));
        v178 = v147;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
        v93 = objc_claimAutoreleasedReturnValue();
        v94 = v90;
        v9 = v144;
        v146 = (void *)v93;
        v95 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v92, 2);
        a4 = 0;
        *v91 = v95;
        v10 = v139;
        v11 = v153;
      }
      v52 = v148;
      goto LABEL_118;
    }
  }
  v145 = v6;
  v37 = v9;
  v147 = 0;
LABEL_36:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confirmationActionName"));
  v38 = objc_claimAutoreleasedReturnValue();
  v146 = (void *)v38;
  if (v38)
  {
    v39 = (void *)v38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v76 = v39;
        v161 = 0;
        v135 = -[BMAppIntentInvocationActionOutputConfirmationActionName initWithJSONDictionary:error:]([BMAppIntentInvocationActionOutputConfirmationActionName alloc], "initWithJSONDictionary:error:", v76, &v161);
        v77 = v161;
        if (!v77)
        {

          v11 = v153;
          goto LABEL_39;
        }
        v78 = v77;
        v134 = v76;
        v11 = v153;
        v9 = v37;
        if (a4)
          *a4 = objc_retainAutorelease(v77);

        a4 = 0;
      }
      else
      {
        if (!a4)
        {
          v11 = v153;
          v52 = v148;
          v9 = v37;
          v6 = v145;
          goto LABEL_118;
        }
        v101 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v140 = v10;
        v102 = a4;
        v103 = *MEMORY[0x1E0D025B8];
        v175 = *MEMORY[0x1E0CB2D50];
        v104 = objc_alloc(MEMORY[0x1E0CB3940]);
        v126 = objc_opt_class();
        v105 = v104;
        v31 = v154;
        v135 = (BMAppIntentInvocationActionOutputConfirmationActionName *)objc_msgSend(v105, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v126, CFSTR("confirmationActionName"));
        v176 = v135;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
        v106 = objc_claimAutoreleasedReturnValue();
        v107 = v101;
        v9 = v37;
        v134 = (id)v106;
        v108 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v103, 2);
        a4 = 0;
        *v102 = v108;
        v10 = v140;
        v11 = v153;
      }
      v52 = v148;
      v6 = v145;
      goto LABEL_117;
    }
  }
  v135 = 0;
LABEL_39:
  v9 = v37;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("showPrompt"));
  v40 = objc_claimAutoreleasedReturnValue();
  v6 = v145;
  v131 = v36;
  v127 = (void *)v40;
  if (v40 && (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v134 = 0;
        v52 = v148;
        goto LABEL_116;
      }
      v109 = a4;
      v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v111 = *MEMORY[0x1E0D025B8];
      v173 = *MEMORY[0x1E0CB2D50];
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("showPrompt"));
      v174 = obj;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = v111;
      v31 = v154;
      v113 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v112, 2, v65);
      a4 = 0;
      v134 = 0;
      *v109 = v113;
      goto LABEL_113;
    }
    v128 = a4;
    v134 = v41;
  }
  else
  {
    v128 = a4;
    v134 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestedFollowUpActions"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "isEqual:", v43);

  if (!v44)
  {
    if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v136 = v10;
      v141 = v9;
      goto LABEL_64;
    }
    if (!v128)
    {
      a4 = 0;
      v11 = v153;
      v52 = v148;
      goto LABEL_115;
    }
    obj = v42;
    v121 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v122 = *MEMORY[0x1E0D025B8];
    v171 = *MEMORY[0x1E0CB2D50];
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("suggestedFollowUpActions"));
    v172 = v65;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    *v128 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, 2, v123);

    v31 = v154;
    a4 = 0;
LABEL_113:
    v11 = v153;
    v52 = v148;
    goto LABEL_114;
  }
  v136 = v10;
  v141 = v9;

  v42 = 0;
LABEL_64:
  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v42, "count"));
  v64 = v42;
  v65 = (void *)v63;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  obj = v64;
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
  if (!v66)
    goto LABEL_74;
  v67 = v66;
  v68 = *(_QWORD *)v158;
  v69 = v8;
  v151 = v65;
  while (2)
  {
    for (i = 0; i != v67; ++i)
    {
      if (*(_QWORD *)v158 != v68)
        objc_enumerationMutation(obj);
      v71 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v145;
        v114 = v128;
        v10 = v136;
        if (v128)
        {
          v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v116 = *MEMORY[0x1E0D025B8];
          v168 = *MEMORY[0x1E0CB2D50];
          v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("suggestedFollowUpActions"));
          v169 = v72;
          v117 = (void *)MEMORY[0x1E0C99D80];
          v118 = &v169;
          v119 = &v168;
LABEL_103:
          objc_msgSend(v117, "dictionaryWithObjects:forKeys:count:", v118, v119, 1);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          *v114 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v116, 2, v120);
LABEL_107:

          v8 = v69;
          v31 = v154;
        }
LABEL_108:

        a4 = 0;
        v9 = v141;
        v11 = v153;
        v52 = v148;
        v65 = v151;
        goto LABEL_114;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = v145;
        v114 = v128;
        v10 = v136;
        if (v128)
        {
          v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v116 = *MEMORY[0x1E0D025B8];
          v166 = *MEMORY[0x1E0CB2D50];
          v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("suggestedFollowUpActions"));
          v167 = v72;
          v117 = (void *)MEMORY[0x1E0C99D80];
          v118 = &v167;
          v119 = &v166;
          goto LABEL_103;
        }
        goto LABEL_108;
      }
      v72 = v71;
      v73 = [BMAppIntentInvocationAction alloc];
      v156 = 0;
      v74 = -[BMAppIntentInvocationAction initWithJSONDictionary:error:](v73, "initWithJSONDictionary:error:", v72, &v156);
      v75 = v156;
      if (v75)
      {
        v120 = v75;
        if (v128)
          *v128 = objc_retainAutorelease(v75);

        v6 = v145;
        v10 = v136;
        goto LABEL_107;
      }
      objc_msgSend(v151, "addObject:", v74);

      v8 = v69;
      v31 = v154;
    }
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
    v65 = v151;
    if (v67)
      continue;
    break;
  }
LABEL_74:

  v11 = v153;
  v9 = v141;
  v52 = v148;
  a4 = -[BMAppIntentInvocationActionOutput initWithIdentifier:showOutputAction:showOutputActionHint:dialog:value:nextAction:confirmationActionName:showPrompt:suggestedFollowUpActions:](self, "initWithIdentifier:showOutputAction:showOutputActionHint:dialog:value:nextAction:confirmationActionName:showPrompt:suggestedFollowUpActions:", v150, v141, objc_msgSend(v153, "intValue"), v152, v148, v147, v135, v134, v65);
  self = (BMAppIntentInvocationActionOutput *)a4;
  v6 = v145;
  v10 = v136;
LABEL_114:

  v42 = obj;
LABEL_115:

  v36 = v131;
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
LABEL_120:

  v46 = v31;
  v7 = v150;
LABEL_121:
  v60 = v152;
LABEL_122:

  v31 = v46;
LABEL_123:

LABEL_124:
LABEL_125:

LABEL_126:
LABEL_127:

LABEL_128:
  return (BMAppIntentInvocationActionOutput *)a4;
}

- (id)_suggestedFollowUpActionsJSONArray
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
  -[BMAppIntentInvocationActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions", 0);
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
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[9];
  _QWORD v39[11];

  v39[9] = *MEMORY[0x1E0C80C00];
  -[BMAppIntentInvocationActionOutput identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationActionOutput showOutputAction](self, "showOutputAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocationActionOutput showOutputActionHint](self, "showOutputActionHint"));
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionOutput dialog](self, "dialog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationActionOutput value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v11 = objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationActionOutput nextAction](self, "nextAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationActionOutput confirmationActionName](self, "confirmationActionName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "jsonDictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMAppIntentInvocationActionOutput hasShowPrompt](self, "hasShowPrompt"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppIntentInvocationActionOutput showPrompt](self, "showPrompt"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[BMAppIntentInvocationActionOutput _suggestedFollowUpActionsJSONArray](self, "_suggestedFollowUpActionsJSONArray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = CFSTR("identifier");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v16;
  v39[0] = v16;
  v38[1] = CFSTR("showOutputAction");
  v17 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v17;
  v39[1] = v17;
  v38[2] = CFSTR("showOutputActionHint");
  v18 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v4;
  v30 = (void *)v18;
  v39[2] = v18;
  v38[3] = CFSTR("dialog");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v6;
  v29 = (void *)v19;
  v39[3] = v19;
  v38[4] = CFSTR("value");
  v20 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v7;
  v39[4] = v20;
  v38[5] = CFSTR("nextAction");
  v21 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  v39[5] = v21;
  v38[6] = CFSTR("confirmationActionName");
  v23 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v11;
  v39[6] = v23;
  v38[7] = CFSTR("showPrompt");
  v25 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[7] = v25;
  v38[8] = CFSTR("suggestedFollowUpActions");
  v26 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[8] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v14)
      goto LABEL_24;
  }
  else
  {

    if (v14)
      goto LABEL_24;
  }

LABEL_24:
  if (!v36)

  if (!v37)
  if (!v24)

  if (!v22)
  if (v33)
  {
    if (v34)
      goto LABEL_34;
LABEL_39:

    if (v35)
      goto LABEL_35;
LABEL_40:

    goto LABEL_35;
  }

  if (!v34)
    goto LABEL_39;
LABEL_34:
  if (!v35)
    goto LABEL_40;
LABEL_35:

  return v27;
}

- (NSUUID)identifier
{
  NSData *raw_identifier;
  void *v3;

  raw_identifier = self->_raw_identifier;
  if (raw_identifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_identifier, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
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
  int v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppIntentInvocationActionOutput identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppIntentInvocationActionOutput identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[BMAppIntentInvocationActionOutput showOutputAction](self, "showOutputAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showOutputAction");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppIntentInvocationActionOutput showOutputAction](self, "showOutputAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "showOutputAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_33;
    }
    v19 = -[BMAppIntentInvocationActionOutput showOutputActionHint](self, "showOutputActionHint");
    if (v19 == objc_msgSend(v5, "showOutputActionHint"))
    {
      -[BMAppIntentInvocationActionOutput dialog](self, "dialog");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dialog");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMAppIntentInvocationActionOutput dialog](self, "dialog");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "dialog");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_33;
      }
      -[BMAppIntentInvocationActionOutput value](self, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMAppIntentInvocationActionOutput value](self, "value");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_33;
      }
      -[BMAppIntentInvocationActionOutput nextAction](self, "nextAction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nextAction");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMAppIntentInvocationActionOutput nextAction](self, "nextAction");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "nextAction");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_33;
      }
      -[BMAppIntentInvocationActionOutput confirmationActionName](self, "confirmationActionName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "confirmationActionName");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[BMAppIntentInvocationActionOutput confirmationActionName](self, "confirmationActionName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "confirmationActionName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_33;
      }
      if (!-[BMAppIntentInvocationActionOutput hasShowPrompt](self, "hasShowPrompt")
        && !objc_msgSend(v5, "hasShowPrompt")
        || -[BMAppIntentInvocationActionOutput hasShowPrompt](self, "hasShowPrompt")
        && objc_msgSend(v5, "hasShowPrompt")
        && (v44 = -[BMAppIntentInvocationActionOutput showPrompt](self, "showPrompt"),
            v44 == objc_msgSend(v5, "showPrompt")))
      {
        -[BMAppIntentInvocationActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "suggestedFollowUpActions");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46 == v47)
        {
          v12 = 1;
        }
        else
        {
          -[BMAppIntentInvocationActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "suggestedFollowUpActions");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v48, "isEqual:", v49);

        }
        goto LABEL_34;
      }
    }
LABEL_33:
    v12 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v12 = 0;
LABEL_35:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMAppIntentInvocationAction)showOutputAction
{
  return self->_showOutputAction;
}

- (int)showOutputActionHint
{
  return self->_showOutputActionHint;
}

- (BMAppIntentInvocationActionOutputDialog)dialog
{
  return self->_dialog;
}

- (BMAppIntentInvocationValue)value
{
  return self->_value;
}

- (BMAppIntentInvocationAction)nextAction
{
  return self->_nextAction;
}

- (BMAppIntentInvocationActionOutputConfirmationActionName)confirmationActionName
{
  return self->_confirmationActionName;
}

- (BOOL)showPrompt
{
  return self->_showPrompt;
}

- (BOOL)hasShowPrompt
{
  return self->_hasShowPrompt;
}

- (void)setHasShowPrompt:(BOOL)a3
{
  self->_hasShowPrompt = a3;
}

- (NSArray)suggestedFollowUpActions
{
  return self->_suggestedFollowUpActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedFollowUpActions, 0);
  objc_storeStrong((id *)&self->_confirmationActionName, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_showOutputAction, 0);
  objc_storeStrong((id *)&self->_raw_identifier, 0);
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

    v4 = -[BMAppIntentInvocationActionOutput initByReadFrom:]([BMAppIntentInvocationActionOutput alloc], "initByReadFrom:", v7);
    v4[7] = 0;

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
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("showOutputAction_json"), 5, 1, &__block_literal_global_716);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("showOutputActionHint"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("dialog_json"), 5, 1, &__block_literal_global_717);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_json"), 5, 1, &__block_literal_global_718);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("nextAction_json"), 5, 1, &__block_literal_global_719);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("confirmationActionName_json"), 5, 1, &__block_literal_global_720);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("showPrompt"), 0, 0, 10, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("suggestedFollowUpActions_json"), 5, 1, &__block_literal_global_721);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CC48;
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
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 14, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("showOutputAction"), 2, 14, objc_opt_class(), v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("showOutputActionHint"), 3, 4, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dialog"), 4, 14, objc_opt_class());
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 6, 14, objc_opt_class());
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nextAction"), 8, 14, objc_opt_class());
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confirmationActionName"), 9, 14, objc_opt_class());
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("showPrompt"), 10, 12, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestedFollowUpActions"), 11, 14, objc_opt_class());
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_suggestedFollowUpActionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confirmationActionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dialog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMAppIntentInvocationActionOutput_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showOutputAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMAppIntentInvocationActionOutput)initWithIdentifier:(id)a3 showOutputAction:(id)a4 showOutputActionHint:(int)a5 dialog:(id)a6 value:(id)a7 nextAction:(id)a8 confirmationActionName:(id)a9 showPrompt:(id)a10
{
  return -[BMAppIntentInvocationActionOutput initWithIdentifier:showOutputAction:showOutputActionHint:dialog:value:nextAction:confirmationActionName:showPrompt:suggestedFollowUpActions:](self, "initWithIdentifier:showOutputAction:showOutputActionHint:dialog:value:nextAction:confirmationActionName:showPrompt:suggestedFollowUpActions:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, a9, a10, MEMORY[0x1E0C9AA60]);
}

@end
