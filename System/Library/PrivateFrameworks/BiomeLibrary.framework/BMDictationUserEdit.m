@implementation BMDictationUserEdit

- (BMDictationUserEdit)initWithAsrID:(id)a3 interactionID:(id)a4 metadata:(id)a5 startIndex:(id)a6 endIndex:(id)a7 correctedText:(id)a8 recognizedText:(id)a9 recognizedTokens:(id)a10 alternativeSelections:(id)a11
{
  return -[BMDictationUserEdit initWithAsrID:interactionID:metadata:startIndex:endIndex:correctedText:recognizedText:recognizedTokens:alternativeSelections:preItnNbest:postItnNbest:](self, "initWithAsrID:interactionID:metadata:startIndex:endIndex:correctedText:recognizedText:recognizedTokens:alternativeSelections:preItnNbest:postItnNbest:", a3, a4, a5, a6, a7, a8, a9, a10, a11, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (BMDictationUserEdit)initWithAsrID:(id)a3 interactionID:(id)a4 metadata:(id)a5 startIndex:(id)a6 endIndex:(id)a7 correctedText:(id)a8 recognizedText:(id)a9 recognizedTokens:(id)a10 alternativeSelections:(id)a11 preItnNbest:(id)a12 postItnNbest:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BMDictationUserEdit *v24;
  unsigned int v25;
  unsigned int v26;
  id v29;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v29 = a4;
  v35 = a4;
  v34 = a5;
  v18 = a6;
  v19 = a7;
  v30 = a8;
  v33 = a8;
  v32 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v37.receiver = self;
  v37.super_class = (Class)BMDictationUserEdit;
  v24 = -[BMEventBase init](&v37, sel_init);
  if (v24)
  {
    v24->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v24->_asrID, a3);
    objc_storeStrong((id *)&v24->_interactionID, v29);
    objc_storeStrong((id *)&v24->_metadata, a5);
    if (v18)
    {
      v24->_hasStartIndex = 1;
      v25 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v25 = 0;
      v24->_hasStartIndex = 0;
    }
    v24->_startIndex = v25;
    if (v19)
    {
      v24->_hasEndIndex = 1;
      v26 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v26 = 0;
      v24->_hasEndIndex = 0;
    }
    v24->_endIndex = v26;
    objc_storeStrong((id *)&v24->_correctedText, v30);
    objc_storeStrong((id *)&v24->_recognizedText, a9);
    objc_storeStrong((id *)&v24->_recognizedTokens, a10);
    objc_storeStrong((id *)&v24->_alternativeSelections, a11);
    objc_storeStrong((id *)&v24->_preItnNbest, a12);
    objc_storeStrong((id *)&v24->_postItnNbest, a13);
  }

  return v24;
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
  id v14;
  id v15;
  void *v16;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMDictationUserEdit asrID](self, "asrID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit interactionID](self, "interactionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit metadata](self, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDictationUserEdit startIndex](self, "startIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDictationUserEdit endIndex](self, "endIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit correctedText](self, "correctedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit recognizedText](self, "recognizedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit recognizedTokens](self, "recognizedTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit alternativeSelections](self, "alternativeSelections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit preItnNbest](self, "preItnNbest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit postItnNbest](self, "postItnNbest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMDictationUserEdit with asrID: %@, interactionID: %@, metadata: %@, startIndex: %@, endIndex: %@, correctedText: %@, recognizedText: %@, recognizedTokens: %@, alternativeSelections: %@, preItnNbest: %@, postItnNbest: %@"), v16, v3, v13, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDictationUserEdit *v5;
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
  unint64_t v17;
  char v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  BMDictationUserEditRequestMetadata *v24;
  BMDictationUserEditRequestMetadata *metadata;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSArray *recognizedTokens;
  uint64_t v47;
  NSArray *alternativeSelections;
  uint64_t v49;
  NSArray *preItnNbest;
  uint64_t v51;
  NSArray *postItnNbest;
  int v53;
  BMDictationUserEdit *v54;
  void *v56;
  objc_super v57;
  uint64_t v58;
  uint64_t v59;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMDictationUserEdit;
  v5 = -[BMEventBase init](&v57, sel_init);
  if (!v5)
    goto LABEL_69;
  v56 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v11])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v9;
        v17 = *(_QWORD *)&v4[v16];
        if (v17 == -1 || v17 >= *(_QWORD *)&v4[*v10])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v19 = v14++ >= 9;
        if (v19)
        {
          v15 = 0;
          v20 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      v20 = v4[*v11];
      if (v4[*v11])
        v15 = 0;
LABEL_15:
      if (v20 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 32;
          goto LABEL_43;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 40;
          goto LABEL_43;
        case 3u:
          v58 = 0;
          v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_71;
          v24 = -[BMDictationUserEditRequestMetadata initByReadFrom:]([BMDictationUserEditRequestMetadata alloc], "initByReadFrom:", v4);
          if (!v24)
            goto LABEL_71;
          metadata = v5->_metadata;
          v5->_metadata = v24;

          PBReaderRecallMark();
          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasStartIndex = 1;
          while (2)
          {
            v29 = *v9;
            v30 = *(_QWORD *)&v4[v29];
            if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v30);
              *(_QWORD *)&v4[v29] = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v19 = v27++ >= 9;
                if (v19)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11])
            LODWORD(v28) = 0;
LABEL_60:
          v44 = 24;
          goto LABEL_65;
        case 5u:
          v32 = 0;
          v33 = 0;
          v28 = 0;
          v5->_hasEndIndex = 1;
          break;
        case 6u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 56;
          goto LABEL_43;
        case 7u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 64;
LABEL_43:
          v37 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 8u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          if (!v38)
            goto LABEL_71;
          v39 = (void *)v38;
          objc_msgSend(v56, "addObject:", v38);
          goto LABEL_56;
        case 9u:
          v58 = 0;
          v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_71;
          v40 = -[BMDictationUserEditConfusionPair initByReadFrom:]([BMDictationUserEditConfusionPair alloc], "initByReadFrom:", v4);
          if (!v40)
            goto LABEL_71;
          v39 = v40;
          v41 = v6;
          goto LABEL_55;
        case 0xAu:
          v58 = 0;
          v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_71;
          v42 = -[BMDictationUserEditRecognitionResult initByReadFrom:]([BMDictationUserEditRecognitionResult alloc], "initByReadFrom:", v4);
          if (!v42)
            goto LABEL_71;
          v39 = v42;
          v41 = v7;
          goto LABEL_55;
        case 0xBu:
          v58 = 0;
          v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_71;
          v43 = -[BMDictationUserEditRecognitionResult initByReadFrom:]([BMDictationUserEditRecognitionResult alloc], "initByReadFrom:", v4);
          if (!v43)
            goto LABEL_71;
          v39 = v43;
          v41 = v8;
LABEL_55:
          objc_msgSend(v41, "addObject:", v39);
          PBReaderRecallMark();
LABEL_56:

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_71:

          goto LABEL_68;
      }
      while (1)
      {
        v34 = *v9;
        v35 = *(_QWORD *)&v4[v34];
        if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v10])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v35);
        *(_QWORD *)&v4[v34] = v35 + 1;
        v28 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0)
          goto LABEL_62;
        v32 += 7;
        v19 = v33++ >= 9;
        if (v19)
        {
          LODWORD(v28) = 0;
          goto LABEL_64;
        }
      }
      v4[*v11] = 1;
LABEL_62:
      if (v4[*v11])
        LODWORD(v28) = 0;
LABEL_64:
      v44 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v44) = v28;
    }
    while (*(_QWORD *)&v4[*v9] < *(_QWORD *)&v4[*v10]);
  }
  v45 = objc_msgSend(v56, "copy");
  recognizedTokens = v5->_recognizedTokens;
  v5->_recognizedTokens = (NSArray *)v45;

  v47 = objc_msgSend(v6, "copy");
  alternativeSelections = v5->_alternativeSelections;
  v5->_alternativeSelections = (NSArray *)v47;

  v49 = objc_msgSend(v7, "copy");
  preItnNbest = v5->_preItnNbest;
  v5->_preItnNbest = (NSArray *)v49;

  v51 = objc_msgSend(v8, "copy");
  postItnNbest = v5->_postItnNbest;
  v5->_postItnNbest = (NSArray *)v51;

  v53 = v4[*v11];
  if (v53)
LABEL_68:
    v54 = 0;
  else
LABEL_69:
    v54 = v5;

  return v54;
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
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_asrID)
    PBDataWriterWriteStringField();
  if (self->_interactionID)
    PBDataWriterWriteStringField();
  if (self->_metadata)
  {
    v44 = 0;
    PBDataWriterPlaceMark();
    -[BMDictationUserEditRequestMetadata writeTo:](self->_metadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasStartIndex)
    PBDataWriterWriteUint32Field();
  if (self->_hasEndIndex)
    PBDataWriterWriteUint32Field();
  if (self->_correctedText)
    PBDataWriterWriteStringField();
  if (self->_recognizedText)
    PBDataWriterWriteStringField();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = self->_recognizedTokens;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v7);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = self->_alternativeSelections;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
        v44 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v12);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = self->_preItnNbest;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
        v44 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v21, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    }
    while (v18);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = self->_postItnNbest;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v26);
        v44 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v27, "writeTo:", v4, (_QWORD)v28);
        PBDataWriterRecallMark();
        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
    }
    while (v24);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDictationUserEdit writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDictationUserEdit)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BMDictationUserEdit *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  BMDictationUserEdit *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BMDictationUserEdit *v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  id *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  id *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
  void *v95;
  id v96;
  BMDictationUserEditConfusionPair *v97;
  BMDictationUserEditConfusionPair *v98;
  id v99;
  void *v100;
  void *v101;
  int v102;
  id v103;
  uint64_t v104;
  id *v105;
  id v106;
  void *v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t k;
  void *v117;
  id v118;
  BMDictationUserEditRecognitionResult *v119;
  BMDictationUserEditRecognitionResult *v120;
  id v121;
  void *v122;
  int v123;
  id *v124;
  id v125;
  uint64_t v126;
  void *v127;
  id *v128;
  uint64_t *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  id v134;
  uint64_t v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  id v141;
  BMDictationUserEditRecognitionResult *v142;
  BMDictationUserEditRecognitionResult *v143;
  id v144;
  id v145;
  uint64_t v146;
  id *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  id *v151;
  uint64_t *v152;
  void *v153;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  id v160;
  id v161;
  void *v162;
  void *v163;
  id *v164;
  void *v165;
  void *v166;
  id obj;
  id v168;
  id v169;
  id v170;
  id v171;
  void *v172;
  BMDictationUserEditRequestMetadata *v173;
  void *v174;
  void *v175;
  id v176;
  BMDictationUserEdit *v177;
  id *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  id v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  id v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  id v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  id v205;
  _BYTE v206[128];
  uint64_t v207;
  id v208;
  uint64_t v209;
  id v210;
  uint64_t v211;
  id v212;
  _BYTE v213[128];
  uint64_t v214;
  id v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  id v219;
  _BYTE v220[128];
  uint64_t v221;
  void *v222;
  uint64_t v223;
  void *v224;
  uint64_t v225;
  void *v226;
  _BYTE v227[128];
  uint64_t v228;
  void *v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  id *v237;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  id v241;
  uint64_t v242;
  _QWORD v243[4];

  v243[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("asrID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v242 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("asrID"));
        v243[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, &v242, 1);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
        v8 = 0;
        v25 = 0;
        *a4 = v30;
        goto LABEL_185;
      }
      v8 = 0;
      v25 = 0;
      goto LABEL_186;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interactionID"));
  v9 = objc_claimAutoreleasedReturnValue();
  v179 = (void *)v9;
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = v8;
        v43 = *MEMORY[0x1E0D025B8];
        v240 = *MEMORY[0x1E0CB2D50];
        v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("interactionID"));
        v241 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v241, &v240, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        v8 = v42;
        v26 = 0;
        v25 = 0;
        *a4 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v44, 2, v27);
        goto LABEL_183;
      }
      v26 = 0;
      v25 = 0;
      goto LABEL_185;
    }
    v176 = v10;
  }
  else
  {
    v176 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = a4;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v170 = v8;
        v46 = *MEMORY[0x1E0D025B8];
        v238 = *MEMORY[0x1E0CB2D50];
        v47 = v11;
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("metadata"));
        v239 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v239, &v238, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v46;
        v8 = v170;
        *a4 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v49, 2, v48);

        v25 = 0;
        v22 = v47;
        v26 = v176;
        goto LABEL_183;
      }
      v25 = 0;
      v26 = v176;
      goto LABEL_184;
    }
    v22 = v11;
    v201 = 0;
    v173 = -[BMDictationUserEditRequestMetadata initWithJSONDictionary:error:]([BMDictationUserEditRequestMetadata alloc], "initWithJSONDictionary:error:", v22, &v201);
    v23 = v201;
    if (v23)
    {
      v24 = v23;
      if (a4)
        *a4 = objc_retainAutorelease(v23);

      v25 = 0;
      v26 = v176;
      v27 = v173;
      goto LABEL_183;
    }

  }
  else
  {
    v173 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = v12;
  v175 = v11;
  v177 = self;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = v8;
        v52 = *MEMORY[0x1E0D025B8];
        v236 = *MEMORY[0x1E0CB2D50];
        v53 = objc_alloc(MEMORY[0x1E0CB3940]);
        v155 = objc_opt_class();
        v54 = v53;
        v11 = v175;
        v55 = (id *)objc_msgSend(v54, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v155, CFSTR("startIndex"));
        v237 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v237, &v236, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v50;
        v12 = v174;
        v57 = v52;
        v8 = v51;
        v58 = 0;
        v25 = 0;
        *a4 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 2, v13);
        a4 = v55;
        v26 = v176;
        goto LABEL_181;
      }
      v58 = 0;
      v25 = 0;
      v26 = v176;
      goto LABEL_182;
    }
    v171 = v12;
  }
  else
  {
    v171 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v66 = v8;
        v67 = *MEMORY[0x1E0D025B8];
        v234 = *MEMORY[0x1E0CB2D50];
        v68 = objc_alloc(MEMORY[0x1E0CB3940]);
        v156 = objc_opt_class();
        v69 = v68;
        v11 = v175;
        v168 = (id)objc_msgSend(v69, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v156, CFSTR("endIndex"));
        v235 = v168;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
        v70 = objc_claimAutoreleasedReturnValue();
        v71 = v65;
        v12 = v174;
        v72 = v67;
        v8 = v66;
        v166 = (void *)v70;
        v25 = 0;
        *a4 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2);
        a4 = 0;
        v26 = v176;
        v58 = v171;
        goto LABEL_180;
      }
      v25 = 0;
      v26 = v176;
      v58 = v171;
      goto LABEL_181;
    }
    v163 = v13;
    v164 = v13;
  }
  else
  {
    v163 = v13;
    v164 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("correctedText"));
  v14 = objc_claimAutoreleasedReturnValue();
  v166 = (void *)v14;
  v169 = v8;
  if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v168 = 0;
        v25 = 0;
        v26 = v176;
        v58 = v171;
        v13 = v163;
        a4 = v164;
        goto LABEL_180;
      }
      v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v76 = *MEMORY[0x1E0D025B8];
      v232 = *MEMORY[0x1E0CB2D50];
      v77 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("correctedText"));
      v233 = v77;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = v75;
      v12 = v174;
      v80 = v76;
      v81 = (void *)v77;
      v162 = (void *)v78;
      v168 = 0;
      v25 = 0;
      *a4 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2);
LABEL_92:
      v11 = v175;
      v26 = v176;
      v58 = v171;
      v13 = v163;
      a4 = v164;
      goto LABEL_179;
    }
    v168 = v15;
  }
  else
  {
    v168 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recognizedText"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v177;
  v162 = (void *)v16;
  if (!v16 || (v18 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v161 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v83 = *MEMORY[0x1E0D025B8];
      v230 = *MEMORY[0x1E0CB2D50];
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("recognizedText"));
      v231 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v231, &v230, 1);
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = v82;
      v12 = v174;
      v181 = (void *)v84;
      v161 = 0;
      v25 = 0;
      *a4 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v83, 2);
      v11 = v175;
      v26 = v176;
      v58 = v171;
      v13 = v163;
      a4 = v164;

      goto LABEL_178;
    }
    v81 = 0;
    v25 = 0;
    goto LABEL_92;
  }
  v161 = v18;
LABEL_22:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recognizedTokens"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  v172 = v7;
  if (v21)
  {

    v19 = 0;
  }
  else if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v25 = 0;
        v11 = v175;
        v26 = v176;
        v12 = v174;
        v58 = v171;
        v13 = v163;
        a4 = v164;
        goto LABEL_178;
      }
      v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v90 = *MEMORY[0x1E0D025B8];
      v228 = *MEMORY[0x1E0CB2D50];
      v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("recognizedTokens"));
      v229 = v180;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      *a4 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v90, 2);
      goto LABEL_84;
    }
  }
  v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v19 = v19;
  v31 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v197, v227, 16);
  if (!v31)
    goto LABEL_50;
  v32 = v31;
  v33 = *(_QWORD *)v198;
  do
  {
    v34 = v17;
    for (i = 0; i != v32; ++i)
    {
      if (*(_QWORD *)v198 != v33)
        objc_enumerationMutation(v19);
      v36 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = v178;
        if (v178)
        {
          v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v225 = *MEMORY[0x1E0CB2D50];
          v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("recognizedTokens"));
          v226 = v165;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v226, &v225, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v60;
          v64 = v61;
LABEL_68:
          v26 = v176;
          v25 = 0;
          *v59 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 2, v62);
          obj = v19;
          goto LABEL_69;
        }
LABEL_74:
        v25 = 0;
        obj = v19;
LABEL_84:
        v11 = v175;
        v26 = v176;
        goto LABEL_85;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v178)
        {
          v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v74 = *MEMORY[0x1E0D025B8];
          v223 = *MEMORY[0x1E0CB2D50];
          v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("recognizedTokens"));
          v224 = v165;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v224, &v223, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v73;
          v64 = v74;
          v59 = v178;
          goto LABEL_68;
        }
        goto LABEL_74;
      }
      objc_msgSend(v180, "addObject:", v36);
    }
    v32 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v197, v227, 16);
    v17 = v34;
  }
  while (v32);
LABEL_50:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alternativeSelections"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "isEqual:", v38);

  if (v39)
  {

    v37 = 0;
    v11 = v175;
    v40 = v178;
    goto LABEL_94;
  }
  v40 = v178;
  if (!v37)
  {
    v11 = v175;
    goto LABEL_94;
  }
  objc_opt_class();
  v11 = v175;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    obj = v37;
    if (v178)
    {
      v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v87 = *MEMORY[0x1E0D025B8];
      v221 = *MEMORY[0x1E0CB2D50];
      v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("alternativeSelections"));
      v222 = v165;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v222, &v221, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v87;
      v11 = v175;
      v25 = 0;
      *v178 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v88, 2, v62);
      v26 = v176;
      goto LABEL_70;
    }
    v25 = 0;
    v26 = v176;
LABEL_85:
    v12 = v174;
    goto LABEL_176;
  }
LABEL_94:
  v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v37, "count"));
  v193 = 0u;
  v194 = 0u;
  v195 = 0u;
  v196 = 0u;
  obj = v37;
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v220, 16);
  if (!v91)
    goto LABEL_104;
  v92 = v91;
  v93 = *(_QWORD *)v194;
  do
  {
    for (j = 0; j != v92; ++j)
    {
      if (*(_QWORD *)v194 != v93)
        objc_enumerationMutation(obj);
      v95 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v40)
        {
          v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v104 = *MEMORY[0x1E0D025B8];
          v218 = *MEMORY[0x1E0CB2D50];
          v105 = v40;
          v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("alternativeSelections"));
          v219 = v96;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
          v106 = (id)objc_claimAutoreleasedReturnValue();
          v107 = v103;
          v108 = v104;
LABEL_111:
          v25 = 0;
          *v105 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2, v106);
          v160 = obj;
          v26 = v176;
          v17 = v177;
          v12 = v174;
          v11 = v175;
          goto LABEL_173;
        }
LABEL_131:
        v25 = 0;
        v62 = obj;
        v26 = v176;
LABEL_69:
        v11 = v175;
LABEL_70:
        v12 = v174;
        goto LABEL_175;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v40)
        {
          v109 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v110 = *MEMORY[0x1E0D025B8];
          v216 = *MEMORY[0x1E0CB2D50];
          v105 = v40;
          v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("alternativeSelections"));
          v217 = v96;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v217, &v216, 1);
          v106 = (id)objc_claimAutoreleasedReturnValue();
          v107 = v109;
          v108 = v110;
          goto LABEL_111;
        }
        goto LABEL_131;
      }
      v96 = v95;
      v97 = [BMDictationUserEditConfusionPair alloc];
      v192 = 0;
      v98 = -[BMDictationUserEditConfusionPair initWithJSONDictionary:error:](v97, "initWithJSONDictionary:error:", v96, &v192);
      v99 = v192;
      if (v99)
      {
        v106 = v99;
        v12 = v174;
        if (v178)
          *v178 = objc_retainAutorelease(v99);

        v25 = 0;
        v160 = obj;
        v26 = v176;
        v17 = v177;
        v11 = v175;
        goto LABEL_173;
      }
      objc_msgSend(v165, "addObject:", v98);

      v7 = v172;
      v40 = v178;
    }
    v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v220, 16);
    v17 = v177;
    v11 = v175;
  }
  while (v92);
LABEL_104:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preItnNbest"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v100, "isEqual:", v101);

  if (v102)
  {

    goto LABEL_118;
  }
  if (v100)
  {
    objc_opt_class();
    v160 = v100;
    v12 = v174;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v40)
      {
        v25 = 0;
        v26 = v176;
        goto LABEL_174;
      }
      v145 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v146 = *MEMORY[0x1E0D025B8];
      v214 = *MEMORY[0x1E0CB2D50];
      v147 = v40;
      v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("preItnNbest"));
      v215 = v96;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
      v106 = (id)objc_claimAutoreleasedReturnValue();
      v148 = v146;
      v12 = v174;
      v25 = 0;
      *v147 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v148, 2, v106);
LABEL_159:
      v26 = v176;
      goto LABEL_173;
    }
    v111 = v100;
  }
  else
  {
LABEL_118:
    v111 = 0;
    v12 = v174;
  }
  v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v111, "count"));
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  v112 = v111;
  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v188, v213, 16);
  v160 = v112;
  if (!v113)
    goto LABEL_129;
  v114 = v113;
  v115 = *(_QWORD *)v189;
  do
  {
    for (k = 0; k != v114; ++k)
    {
      if (*(_QWORD *)v189 != v115)
        objc_enumerationMutation(v160);
      v117 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v124 = v178;
        if (v178)
        {
          v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v126 = *MEMORY[0x1E0D025B8];
          v211 = *MEMORY[0x1E0CB2D50];
          v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("preItnNbest"));
          v212 = v118;
          v127 = (void *)MEMORY[0x1E0C99D80];
          v128 = &v212;
          v129 = &v211;
LABEL_137:
          objc_msgSend(v127, "dictionaryWithObjects:forKeys:count:", v128, v129, 1);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = v125;
          v132 = v126;
          v12 = v174;
          v11 = v175;
          *v124 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v132, 2, v130);

          v25 = 0;
          v106 = v160;
          v26 = v176;
          v17 = v177;
          goto LABEL_172;
        }
LABEL_160:
        v25 = 0;
        v106 = v160;
        v26 = v176;
        v17 = v177;
        goto LABEL_173;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v124 = v178;
        if (v178)
        {
          v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v126 = *MEMORY[0x1E0D025B8];
          v209 = *MEMORY[0x1E0CB2D50];
          v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("preItnNbest"));
          v210 = v118;
          v127 = (void *)MEMORY[0x1E0C99D80];
          v128 = &v210;
          v129 = &v209;
          goto LABEL_137;
        }
        goto LABEL_160;
      }
      v118 = v117;
      v119 = [BMDictationUserEditRecognitionResult alloc];
      v187 = 0;
      v120 = -[BMDictationUserEditRecognitionResult initWithJSONDictionary:error:](v119, "initWithJSONDictionary:error:", v118, &v187);
      v121 = v187;
      if (v121)
      {
        v133 = v121;
        if (v178)
          *v178 = objc_retainAutorelease(v121);

        v25 = 0;
        v106 = v160;
        v26 = v176;
        v17 = v177;
        v12 = v174;
        v11 = v175;
        goto LABEL_172;
      }
      objc_msgSend(v96, "addObject:", v120);

      v12 = v174;
      v11 = v175;
    }
    v112 = v160;
    v114 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v188, v213, 16);
  }
  while (v114);
LABEL_129:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postItnNbest"));
  v106 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v106, "isEqual:", v122);

  if (v123)
  {

    v106 = 0;
    v17 = v177;
    goto LABEL_145;
  }
  v17 = v177;
  if (v106)
  {
    objc_opt_class();
    v12 = v174;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v178)
      {
        v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v135 = *MEMORY[0x1E0D025B8];
        v207 = *MEMORY[0x1E0CB2D50];
        v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("postItnNbest"));
        v208 = v118;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v208, &v207, 1);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = v134;
        v138 = v135;
        v12 = v174;
        v11 = v175;
        *v178 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v138, 2, v136);

        v25 = 0;
        v26 = v176;
        goto LABEL_172;
      }
      v25 = 0;
      goto LABEL_159;
    }
  }
  else
  {
LABEL_145:
    v12 = v174;
  }
  v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v106, "count"));
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v106 = v106;
  v157 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v183, v206, 16);
  if (!v157)
    goto LABEL_156;
  v158 = *(_QWORD *)v184;
  while (2)
  {
    v139 = 0;
    while (2)
    {
      if (*(_QWORD *)v184 != v158)
        objc_enumerationMutation(v106);
      v140 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v139);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v176;
        v17 = v177;
        if (v178)
        {
          v159 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v149 = *MEMORY[0x1E0D025B8];
          v204 = *MEMORY[0x1E0CB2D50];
          v141 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("postItnNbest"));
          v205 = v141;
          v150 = (void *)MEMORY[0x1E0C99D80];
          v151 = &v205;
          v152 = &v204;
LABEL_166:
          objc_msgSend(v150, "dictionaryWithObjects:forKeys:count:", v151, v152, 1);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          *v178 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v149, 2, v153);
LABEL_170:

          v12 = v174;
        }
LABEL_171:

        v25 = 0;
        v11 = v175;
        goto LABEL_172;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = v176;
        v17 = v177;
        if (v178)
        {
          v159 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v149 = *MEMORY[0x1E0D025B8];
          v202 = *MEMORY[0x1E0CB2D50];
          v141 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("postItnNbest"));
          v203 = v141;
          v150 = (void *)MEMORY[0x1E0C99D80];
          v151 = &v203;
          v152 = &v202;
          goto LABEL_166;
        }
        goto LABEL_171;
      }
      v141 = v140;
      v142 = [BMDictationUserEditRecognitionResult alloc];
      v182 = 0;
      v143 = -[BMDictationUserEditRecognitionResult initWithJSONDictionary:error:](v142, "initWithJSONDictionary:error:", v141, &v182);
      v144 = v182;
      if (v144)
      {
        v153 = v144;
        if (v178)
          *v178 = objc_retainAutorelease(v144);

        v26 = v176;
        v17 = v177;
        goto LABEL_170;
      }
      objc_msgSend(v118, "addObject:", v143);

      ++v139;
      v12 = v174;
      if (v157 != v139)
        continue;
      break;
    }
    v17 = v177;
    v11 = v175;
    v157 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v183, v206, 16);
    if (v157)
      continue;
    break;
  }
LABEL_156:

  v26 = v176;
  v17 = -[BMDictationUserEdit initWithAsrID:interactionID:metadata:startIndex:endIndex:correctedText:recognizedText:recognizedTokens:alternativeSelections:preItnNbest:postItnNbest:](v17, "initWithAsrID:interactionID:metadata:startIndex:endIndex:correctedText:recognizedText:recognizedTokens:alternativeSelections:preItnNbest:postItnNbest:", v169, v176, v173, v171, v164, v168, v161, v180, v165, v96, v118);
  v25 = v17;
LABEL_172:

LABEL_173:
  v177 = v17;

  v7 = v172;
LABEL_174:
  v62 = v160;
LABEL_175:

LABEL_176:
  v58 = v171;
  v13 = v163;
  a4 = v164;

LABEL_178:
  v81 = v161;
LABEL_179:

  v8 = v169;
LABEL_180:

LABEL_181:
LABEL_182:

  v22 = v11;
  v27 = v173;
  self = v177;
LABEL_183:

  v11 = v22;
LABEL_184:

LABEL_185:
LABEL_186:

  return v25;
}

- (id)_recognizedTokensJSONArray
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
  -[BMDictationUserEdit recognizedTokens](self, "recognizedTokens", 0);
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

- (id)_alternativeSelectionsJSONArray
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
  -[BMDictationUserEdit alternativeSelections](self, "alternativeSelections", 0);
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

- (id)_preItnNbestJSONArray
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
  -[BMDictationUserEdit preItnNbest](self, "preItnNbest", 0);
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

- (id)_postItnNbestJSONArray
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
  -[BMDictationUserEdit postItnNbest](self, "postItnNbest", 0);
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
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[11];
  _QWORD v38[13];

  v38[11] = *MEMORY[0x1E0C80C00];
  -[BMDictationUserEdit asrID](self, "asrID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit interactionID](self, "interactionID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  if (-[BMDictationUserEdit hasStartIndex](self, "hasStartIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDictationUserEdit startIndex](self, "startIndex"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMDictationUserEdit hasEndIndex](self, "hasEndIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDictationUserEdit endIndex](self, "endIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[BMDictationUserEdit correctedText](self, "correctedText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit recognizedText](self, "recognizedText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit _recognizedTokensJSONArray](self, "_recognizedTokensJSONArray");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit _alternativeSelectionsJSONArray](self, "_alternativeSelectionsJSONArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit _preItnNbestJSONArray](self, "_preItnNbestJSONArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDictationUserEdit _postItnNbestJSONArray](self, "_postItnNbestJSONArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = CFSTR("asrID");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v12;
  v38[0] = v12;
  v37[1] = CFSTR("interactionID");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v38[1] = v13;
  v37[2] = CFSTR("metadata");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v38[2] = v14;
  v37[3] = CFSTR("startIndex");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v3;
  v25 = (void *)v15;
  v38[3] = v15;
  v37[4] = CFSTR("endIndex");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v4;
  v24 = (void *)v16;
  v38[4] = v16;
  v37[5] = CFSTR("correctedText");
  v17 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v6;
  v38[5] = v17;
  v37[6] = CFSTR("recognizedText");
  v18 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v7;
  v38[6] = v18;
  v37[7] = CFSTR("recognizedTokens");
  v19 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[7] = v19;
  v37[8] = CFSTR("alternativeSelections");
  v20 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[8] = v20;
  v37[9] = CFSTR("preItnNbest");
  v21 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[9] = v21;
  v37[10] = CFSTR("postItnNbest");
  v22 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[10] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 11);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_31;
LABEL_46:

    if (v9)
      goto LABEL_32;
    goto LABEL_47;
  }

  if (!v10)
    goto LABEL_46;
LABEL_31:
  if (v9)
    goto LABEL_32;
LABEL_47:

LABEL_32:
  if (!v34)

  if (!v35)
  if (!v36)

  if (!v8)
  if (v30)
  {
    if (v31)
      goto LABEL_42;
  }
  else
  {

    if (v31)
    {
LABEL_42:
      if (v32)
        goto LABEL_43;
LABEL_50:

      if (v33)
        goto LABEL_44;
LABEL_51:

      goto LABEL_44;
    }
  }

  if (!v32)
    goto LABEL_50;
LABEL_43:
  if (!v33)
    goto LABEL_51;
LABEL_44:

  return v29;
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
  unsigned int v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDictationUserEdit asrID](self, "asrID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asrID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDictationUserEdit asrID](self, "asrID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asrID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_43;
    }
    -[BMDictationUserEdit interactionID](self, "interactionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMDictationUserEdit interactionID](self, "interactionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interactionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_43;
    }
    -[BMDictationUserEdit metadata](self, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMDictationUserEdit metadata](self, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "metadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_43;
    }
    if (-[BMDictationUserEdit hasStartIndex](self, "hasStartIndex") || objc_msgSend(v5, "hasStartIndex"))
    {
      if (!-[BMDictationUserEdit hasStartIndex](self, "hasStartIndex"))
        goto LABEL_43;
      if (!objc_msgSend(v5, "hasStartIndex"))
        goto LABEL_43;
      v25 = -[BMDictationUserEdit startIndex](self, "startIndex");
      if (v25 != objc_msgSend(v5, "startIndex"))
        goto LABEL_43;
    }
    if (-[BMDictationUserEdit hasEndIndex](self, "hasEndIndex") || objc_msgSend(v5, "hasEndIndex"))
    {
      if (!-[BMDictationUserEdit hasEndIndex](self, "hasEndIndex"))
        goto LABEL_43;
      if (!objc_msgSend(v5, "hasEndIndex"))
        goto LABEL_43;
      v26 = -[BMDictationUserEdit endIndex](self, "endIndex");
      if (v26 != objc_msgSend(v5, "endIndex"))
        goto LABEL_43;
    }
    -[BMDictationUserEdit correctedText](self, "correctedText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "correctedText");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[BMDictationUserEdit correctedText](self, "correctedText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "correctedText");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_43;
    }
    -[BMDictationUserEdit recognizedText](self, "recognizedText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recognizedText");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[BMDictationUserEdit recognizedText](self, "recognizedText");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recognizedText");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_43;
    }
    -[BMDictationUserEdit recognizedTokens](self, "recognizedTokens");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recognizedTokens");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[BMDictationUserEdit recognizedTokens](self, "recognizedTokens");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recognizedTokens");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_43;
    }
    -[BMDictationUserEdit alternativeSelections](self, "alternativeSelections");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alternativeSelections");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v45 == (void *)v46)
    {

    }
    else
    {
      v47 = (void *)v46;
      -[BMDictationUserEdit alternativeSelections](self, "alternativeSelections");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alternativeSelections");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_43;
    }
    -[BMDictationUserEdit preItnNbest](self, "preItnNbest");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preItnNbest");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v51 == (void *)v52)
    {

    }
    else
    {
      v53 = (void *)v52;
      -[BMDictationUserEdit preItnNbest](self, "preItnNbest");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preItnNbest");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
      {
LABEL_43:
        v12 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    -[BMDictationUserEdit postItnNbest](self, "postItnNbest");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postItnNbest");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58 == v59)
    {
      v12 = 1;
    }
    else
    {
      -[BMDictationUserEdit postItnNbest](self, "postItnNbest");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postItnNbest");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v60, "isEqual:", v61);

    }
    goto LABEL_44;
  }
  v12 = 0;
LABEL_45:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)asrID
{
  return self->_asrID;
}

- (NSString)interactionID
{
  return self->_interactionID;
}

- (BMDictationUserEditRequestMetadata)metadata
{
  return self->_metadata;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (BOOL)hasStartIndex
{
  return self->_hasStartIndex;
}

- (void)setHasStartIndex:(BOOL)a3
{
  self->_hasStartIndex = a3;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (BOOL)hasEndIndex
{
  return self->_hasEndIndex;
}

- (void)setHasEndIndex:(BOOL)a3
{
  self->_hasEndIndex = a3;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (NSArray)alternativeSelections
{
  return self->_alternativeSelections;
}

- (NSArray)preItnNbest
{
  return self->_preItnNbest;
}

- (NSArray)postItnNbest
{
  return self->_postItnNbest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postItnNbest, 0);
  objc_storeStrong((id *)&self->_preItnNbest, 0);
  objc_storeStrong((id *)&self->_alternativeSelections, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_interactionID, 0);
  objc_storeStrong((id *)&self->_asrID, 0);
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

    v4 = -[BMDictationUserEdit initByReadFrom:]([BMDictationUserEdit alloc], "initByReadFrom:", v7);
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
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("asrID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("metadata_json"), 5, 1, &__block_literal_global_216);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startIndex"), 0, 0, 4, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endIndex"), 0, 0, 5, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("correctedText"), 2, 0, 6, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("recognizedText"), 2, 0, 7, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("recognizedTokens_json"), 5, 1, &__block_literal_global_217);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("alternativeSelections_json"), 5, 1, &__block_literal_global_218);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("preItnNbest_json"), 5, 1, &__block_literal_global_219_72178);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("postItnNbest_json"), 5, 1, &__block_literal_global_220);
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v13;
  v15[5] = v6;
  v15[6] = v7;
  v15[7] = v14;
  v15[8] = v8;
  v15[9] = v9;
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FA38;
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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("asrID"), 1, 13, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionID"), 2, 13, 0);
  v15[1] = v13;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("metadata"), 3, 14, objc_opt_class());
  v15[2] = v12;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startIndex"), 4, 4, 0);
  v15[3] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endIndex"), 5, 4, 0);
  v15[4] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("correctedText"), 6, 13, 0);
  v15[5] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recognizedText"), 7, 13, 0);
  v15[6] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recognizedTokens"), 8, 13, 0);
  v15[7] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("alternativeSelections"), 9, 14, objc_opt_class());
  v15[8] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("preItnNbest"), 10, 14, objc_opt_class());
  v15[9] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("postItnNbest"), 11, 14, objc_opt_class());
  v15[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __30__BMDictationUserEdit_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_postItnNbestJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_preItnNbestJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_alternativeSelectionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recognizedTokensJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
