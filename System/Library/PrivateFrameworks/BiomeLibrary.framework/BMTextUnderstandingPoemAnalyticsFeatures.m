@implementation BMTextUnderstandingPoemAnalyticsFeatures

- (BMTextUnderstandingPoemAnalyticsFeatures)initWithNumOfFacesInMessages:(id)a3 numOfFacesOnDevice:(id)a4 numOfNamedFacesOnDevice:(id)a5 numOfConversationThreads:(id)a6 numOfNamedEntityMentions:(id)a7 numOfSenderMentions:(id)a8 numOfReceiverMentions:(id)a9 numOfPronounMentions:(id)a10 numOfImagesShared:(id)a11 numOfLinguisticMentions:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMTextUnderstandingPoemAnalyticsFeatures *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v39;
  objc_super v40;

  v17 = a3;
  v39 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v40.receiver = self;
  v40.super_class = (Class)BMTextUnderstandingPoemAnalyticsFeatures;
  v26 = -[BMEventBase init](&v40, sel_init);
  if (v26)
  {
    v26->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v17)
    {
      v26->_hasNumOfFacesInMessages = 1;
      v27 = objc_msgSend(v17, "longLongValue");
    }
    else
    {
      v26->_hasNumOfFacesInMessages = 0;
      v27 = -1;
    }
    v26->_numOfFacesInMessages = v27;
    if (v39)
    {
      v26->_hasNumOfFacesOnDevice = 1;
      v28 = objc_msgSend(v39, "longLongValue");
    }
    else
    {
      v26->_hasNumOfFacesOnDevice = 0;
      v28 = -1;
    }
    v26->_numOfFacesOnDevice = v28;
    if (v18)
    {
      v26->_hasNumOfNamedFacesOnDevice = 1;
      v29 = objc_msgSend(v18, "longLongValue");
    }
    else
    {
      v26->_hasNumOfNamedFacesOnDevice = 0;
      v29 = -1;
    }
    v26->_numOfNamedFacesOnDevice = v29;
    if (v19)
    {
      v26->_hasNumOfConversationThreads = 1;
      v30 = objc_msgSend(v19, "longLongValue");
    }
    else
    {
      v26->_hasNumOfConversationThreads = 0;
      v30 = -1;
    }
    v26->_numOfConversationThreads = v30;
    if (v20)
    {
      v26->_hasNumOfNamedEntityMentions = 1;
      v31 = objc_msgSend(v20, "longLongValue");
    }
    else
    {
      v26->_hasNumOfNamedEntityMentions = 0;
      v31 = -1;
    }
    v26->_numOfNamedEntityMentions = v31;
    if (v21)
    {
      v26->_hasNumOfSenderMentions = 1;
      v32 = objc_msgSend(v21, "longLongValue");
    }
    else
    {
      v26->_hasNumOfSenderMentions = 0;
      v32 = -1;
    }
    v26->_numOfSenderMentions = v32;
    if (v22)
    {
      v26->_hasNumOfReceiverMentions = 1;
      v33 = objc_msgSend(v22, "longLongValue");
    }
    else
    {
      v26->_hasNumOfReceiverMentions = 0;
      v33 = -1;
    }
    v26->_numOfReceiverMentions = v33;
    if (v23)
    {
      v26->_hasNumOfPronounMentions = 1;
      v34 = objc_msgSend(v23, "longLongValue");
    }
    else
    {
      v26->_hasNumOfPronounMentions = 0;
      v34 = -1;
    }
    v26->_numOfPronounMentions = v34;
    if (v24)
    {
      v26->_hasNumOfImagesShared = 1;
      v35 = objc_msgSend(v24, "longLongValue");
    }
    else
    {
      v26->_hasNumOfImagesShared = 0;
      v35 = -1;
    }
    v26->_numOfImagesShared = v35;
    if (v25)
    {
      v26->_hasNumOfLinguisticMentions = 1;
      v36 = objc_msgSend(v25, "longLongValue");
    }
    else
    {
      v26->_hasNumOfLinguisticMentions = 0;
      v36 = -1;
    }
    v26->_numOfLinguisticMentions = v36;
  }

  return v26;
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

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesInMessages](self, "numOfFacesInMessages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesOnDevice](self, "numOfFacesOnDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedFacesOnDevice](self, "numOfNamedFacesOnDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfConversationThreads](self, "numOfConversationThreads"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedEntityMentions](self, "numOfNamedEntityMentions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfSenderMentions](self, "numOfSenderMentions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfReceiverMentions](self, "numOfReceiverMentions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfPronounMentions](self, "numOfPronounMentions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfImagesShared](self, "numOfImagesShared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfLinguisticMentions](self, "numOfLinguisticMentions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMTextUnderstandingPoemAnalyticsFeatures with numOfFacesInMessages: %@, numOfFacesOnDevice: %@, numOfNamedFacesOnDevice: %@, numOfConversationThreads: %@, numOfNamedEntityMentions: %@, numOfSenderMentions: %@, numOfReceiverMentions: %@, numOfPronounMentions: %@, numOfImagesShared: %@, numOfLinguisticMentions: %@"), v13, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
  BMTextUnderstandingPoemAnalyticsFeatures *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  int *v13;
  int *v14;
  int *v15;
  int *v16;
  int *v17;
  int *v18;
  char v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  int v27;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  objc_class *v36;
  int *v37;
  BOOL v38;
  int *v39;
  int *v40;
  int *v41;
  uint64_t v42;
  int *v43;
  int *v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  BMTextUnderstandingPoemAnalyticsFeatures *v100;
  BMTextUnderstandingPoemAnalyticsFeatures *v102;
  objc_super v103;

  v4 = a3;
  v103.receiver = self;
  v103.super_class = (Class)BMTextUnderstandingPoemAnalyticsFeatures;
  v6 = -[BMEventBase init](&v103, sel_init);
  if (!v6)
    goto LABEL_121;
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfFacesInMessages;
    v11 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    v13 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v14 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfFacesOnDevice;
    v15 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v16 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v17 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v18 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    do
    {
      if (v4[*v9])
        break;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      while (1)
      {
        v22 = *v7;
        v23 = *(_QWORD *)&v4[v22];
        v24 = v23 + 1;
        if (v23 == -1 || v24 > *(_QWORD *)&v4[*v8])
          break;
        v25 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v23);
        *(_QWORD *)&v4[v22] = v24;
        v21 |= (unint64_t)(v25 & 0x7F) << v19;
        if ((v25 & 0x80) == 0)
          goto LABEL_13;
        v19 += 7;
        if (v20++ >= 9)
        {
          v21 = 0;
          v27 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v27 = v4[*v9];
      if (v4[*v9])
        v21 = 0;
LABEL_15:
      if (v27 || (v21 & 7) == 4)
        break;
      switch((v21 >> 3))
      {
        case 1u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v11[355]) = 1;
          while (1)
          {
            v32 = *v7;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v8])
            {
              v37 = v10;
              goto LABEL_102;
            }
            v35 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v33);
            *(_QWORD *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if ((v35 & 0x80) == 0)
              break;
            v36 = 0;
            v29 += 7;
            v37 = v10;
            v38 = v30++ > 8;
            if (v38)
              goto LABEL_106;
          }
          v37 = v10;
          goto LABEL_103;
        case 2u:
          v46 = 0;
          v47 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v13[357]) = 1;
          while (2)
          {
            v48 = *v7;
            v49 = *(_QWORD *)&v4[v48];
            v50 = v49 + 1;
            if (v49 == -1 || v50 > *(_QWORD *)&v4[*v8])
            {
              v37 = v14;
              goto LABEL_102;
            }
            v51 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v49);
            *(_QWORD *)&v4[v48] = v50;
            v31 |= (unint64_t)(v51 & 0x7F) << v46;
            if (v51 < 0)
            {
              v36 = 0;
              v46 += 7;
              v37 = v14;
              v38 = v47++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = v14;
          goto LABEL_103;
        case 3u:
          v52 = 0;
          v53 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v15[359]) = 1;
          while (2)
          {
            v54 = *v7;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedFacesOnDevice;
              goto LABEL_102;
            }
            v57 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v55);
            *(_QWORD *)&v4[v54] = v56;
            v31 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v36 = 0;
              v52 += 7;
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedFacesOnDevice;
              v38 = v53++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedFacesOnDevice;
          goto LABEL_103;
        case 4u:
          v58 = 0;
          v59 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v16[361]) = 1;
          while (2)
          {
            v60 = *v7;
            v61 = *(_QWORD *)&v4[v60];
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfConversationThreads;
              goto LABEL_102;
            }
            v63 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v61);
            *(_QWORD *)&v4[v60] = v62;
            v31 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v36 = 0;
              v58 += 7;
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfConversationThreads;
              v38 = v59++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfConversationThreads;
          goto LABEL_103;
        case 5u:
          v64 = 0;
          v65 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v17[363]) = 1;
          while (2)
          {
            v66 = *v7;
            v67 = *(_QWORD *)&v4[v66];
            v68 = v67 + 1;
            if (v67 == -1 || v68 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedEntityMentions;
              goto LABEL_102;
            }
            v69 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v67);
            *(_QWORD *)&v4[v66] = v68;
            v31 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v36 = 0;
              v64 += 7;
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedEntityMentions;
              v38 = v65++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfNamedEntityMentions;
          goto LABEL_103;
        case 6u:
          v70 = 0;
          v71 = 0;
          v31 = 0;
          *((_BYTE *)&v6->super.super.isa + v18[365]) = 1;
          while (2)
          {
            v72 = *v7;
            v73 = *(_QWORD *)&v4[v72];
            v74 = v73 + 1;
            if (v73 == -1 || v74 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfSenderMentions;
              goto LABEL_102;
            }
            v75 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v73);
            *(_QWORD *)&v4[v72] = v74;
            v31 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v36 = 0;
              v70 += 7;
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfSenderMentions;
              v38 = v71++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfSenderMentions;
          goto LABEL_103;
        case 7u:
          v76 = 0;
          v77 = 0;
          v31 = 0;
          v6->_hasNumOfReceiverMentions = 1;
          while (2)
          {
            v78 = *v7;
            v79 = *(_QWORD *)&v4[v78];
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfReceiverMentions;
              goto LABEL_102;
            }
            v81 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v79);
            *(_QWORD *)&v4[v78] = v80;
            v31 |= (unint64_t)(v81 & 0x7F) << v76;
            if (v81 < 0)
            {
              v36 = 0;
              v76 += 7;
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfReceiverMentions;
              v38 = v77++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfReceiverMentions;
          goto LABEL_103;
        case 8u:
          v82 = 0;
          v83 = 0;
          v31 = 0;
          v6->_hasNumOfPronounMentions = 1;
          while (2)
          {
            v84 = *v7;
            v85 = *(_QWORD *)&v4[v84];
            v86 = v85 + 1;
            if (v85 == -1 || v86 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfPronounMentions;
              goto LABEL_102;
            }
            v87 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v85);
            *(_QWORD *)&v4[v84] = v86;
            v31 |= (unint64_t)(v87 & 0x7F) << v82;
            if (v87 < 0)
            {
              v36 = 0;
              v82 += 7;
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfPronounMentions;
              v38 = v83++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfPronounMentions;
          goto LABEL_103;
        case 9u:
          v88 = 0;
          v89 = 0;
          v31 = 0;
          v6->_hasNumOfImagesShared = 1;
          while (2)
          {
            v90 = *v7;
            v91 = *(_QWORD *)&v4[v90];
            v92 = v91 + 1;
            if (v91 == -1 || v92 > *(_QWORD *)&v4[*v8])
            {
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfImagesShared;
              goto LABEL_102;
            }
            v93 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v91);
            *(_QWORD *)&v4[v90] = v92;
            v31 |= (unint64_t)(v93 & 0x7F) << v88;
            if (v93 < 0)
            {
              v36 = 0;
              v88 += 7;
              v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfImagesShared;
              v38 = v89++ > 8;
              if (v38)
                goto LABEL_106;
              continue;
            }
            break;
          }
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfImagesShared;
          goto LABEL_103;
        case 0xAu:
          v94 = 0;
          v95 = 0;
          v31 = 0;
          v6->_hasNumOfLinguisticMentions = 1;
          break;
        default:
          v39 = v10;
          v40 = v11;
          v41 = v13;
          v42 = v5;
          v43 = v14;
          v102 = v6;
          v44 = v15;
          v45 = PBReaderSkipValueWithTag();
          v18 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v15 = v44;
          v9 = (int *)MEMORY[0x1E0D82BC8];
          v6 = v102;
          v14 = v43;
          v5 = v42;
          v16 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          v13 = v41;
          v11 = v40;
          v10 = v39;
          v17 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
          if ((v45 & 1) == 0)
            goto LABEL_120;
          continue;
      }
      while (1)
      {
        v96 = *v7;
        v97 = *(_QWORD *)&v4[v96];
        v98 = v97 + 1;
        if (v97 == -1 || v98 > *(_QWORD *)&v4[*v8])
          break;
        v99 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v97);
        *(_QWORD *)&v4[v96] = v98;
        v31 |= (unint64_t)(v99 & 0x7F) << v94;
        if ((v99 & 0x80) == 0)
        {
          v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfLinguisticMentions;
          goto LABEL_103;
        }
        v36 = 0;
        v94 += 7;
        v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfLinguisticMentions;
        v38 = v95++ > 8;
        if (v38)
          goto LABEL_106;
      }
      v37 = &OBJC_IVAR___BMTextUnderstandingPoemAnalyticsFeatures__numOfLinguisticMentions;
LABEL_102:
      v4[*v9] = 1;
LABEL_103:
      v36 = v4[*v9] ? 0 : (objc_class *)v31;
LABEL_106:
      *(Class *)((char *)&v6->super.super.isa + *v37) = v36;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  if (v4[*v9])
LABEL_120:
    v100 = 0;
  else
LABEL_121:
    v100 = v6;

  return v100;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasNumOfFacesInMessages)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfFacesOnDevice)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfNamedFacesOnDevice)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfConversationThreads)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfNamedEntityMentions)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfSenderMentions)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfReceiverMentions)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfPronounMentions)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfImagesShared)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasNumOfLinguisticMentions)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMTextUnderstandingPoemAnalyticsFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMTextUnderstandingPoemAnalyticsFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  id v21;
  uint64_t v22;
  BMTextUnderstandingPoemAnalyticsFeatures *v23;
  void *v24;
  id *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  BMTextUnderstandingPoemAnalyticsFeatures *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  id *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  id *v91;
  id *v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  _QWORD v128[3];

  v128[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfFacesInMessages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v106 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfFacesOnDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v8 = 0;
          v23 = 0;
          v24 = v106;
          goto LABEL_64;
        }
        v25 = a4;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v125 = *MEMORY[0x1E0CB2D50];
        v24 = v106;
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numOfFacesOnDevice"));
        v126 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v9 = (void *)v28;
        v23 = 0;
        v8 = 0;
        *v25 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v29, 2, v28);
        goto LABEL_63;
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfNamedFacesOnDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v23 = 0;
          v24 = v106;
          goto LABEL_63;
        }
        v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = a4;
        v31 = *MEMORY[0x1E0D025B8];
        v123 = *MEMORY[0x1E0CB2D50];
        v32 = v8;
        v33 = objc_alloc(MEMORY[0x1E0CB3940]);
        v81 = objc_opt_class();
        v34 = v33;
        v8 = v32;
        v105 = (id)objc_msgSend(v34, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v81, CFSTR("numOfNamedFacesOnDevice"));
        v124 = v105;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        *v30 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v31, 2, v35);
        v12 = 0;
        v24 = v106;
LABEL_62:

LABEL_63:
        goto LABEL_64;
      }
      v10 = v6;
      v11 = v7;
      v12 = v9;
    }
    else
    {
      v10 = v6;
      v11 = v7;
      v12 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfConversationThreads"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v105 = 0;
          v23 = 0;
          v24 = v106;
          v35 = v13;
          v7 = v11;
          v6 = v10;
          goto LABEL_62;
        }
        v97 = v12;
        v92 = a4;
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = v9;
        v45 = *MEMORY[0x1E0D025B8];
        v121 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numOfConversationThreads"));
        v122 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v43;
        v35 = v13;
        v48 = v45;
        v9 = v44;
        v102 = (void *)v46;
        v23 = 0;
        v105 = 0;
        *v92 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2);
        v12 = v97;
        v24 = v106;
        v7 = v11;
        v6 = v10;
        goto LABEL_61;
      }
      v95 = v13;
      v105 = v13;
    }
    else
    {
      v95 = v13;
      v105 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfNamedEntityMentions"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v102 = v14;
    if (v14)
    {
      objc_opt_class();
      v6 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v14 = 0;
            v23 = 0;
            v24 = v106;
            v35 = v95;
            goto LABEL_61;
          }
          v98 = v12;
          v49 = a4;
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = v9;
          v52 = *MEMORY[0x1E0D025B8];
          v119 = *MEMORY[0x1E0CB2D50];
          v101 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numOfNamedEntityMentions"));
          v120 = v101;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = v52;
          v9 = v51;
          v15 = (void *)v53;
          v23 = 0;
          v14 = 0;
          *v49 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v54, 2, v53);
          v12 = v98;
          goto LABEL_91;
        }
        v14 = v14;
      }
    }
    else
    {
      v6 = v10;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfSenderMentions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = a4;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v86 = v6;
      v16 = v12;
      v101 = 0;
LABEL_30:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfReceiverMentions"));
      v17 = objc_claimAutoreleasedReturnValue();
      v89 = (void *)v17;
      if (v17 && (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v94 = 0;
            v23 = 0;
            v35 = v95;
            v12 = v16;
            v6 = v86;
            v41 = v89;
            goto LABEL_59;
          }
          v100 = v16;
          v63 = a4;
          v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = v15;
          v66 = v9;
          v67 = *MEMORY[0x1E0D025B8];
          v115 = *MEMORY[0x1E0CB2D50];
          v68 = v14;
          v69 = objc_alloc(MEMORY[0x1E0CB3940]);
          v83 = objc_opt_class();
          v70 = v69;
          v14 = v68;
          v93 = (id)objc_msgSend(v70, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v83, CFSTR("numOfReceiverMentions"));
          v116 = v93;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v67;
          v9 = v66;
          v15 = v65;
          v23 = 0;
          v94 = 0;
          *v63 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v71, 2, v19);
          v12 = v100;
          v6 = v86;
          goto LABEL_58;
        }
        v94 = v18;
      }
      else
      {
        v94 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfPronounMentions"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      v90 = v14;
      v85 = v15;
      if (v19)
      {
        objc_opt_class();
        v6 = v86;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v93 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v93 = 0;
              v23 = 0;
              goto LABEL_58;
            }
            v72 = v9;
            v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v74 = *MEMORY[0x1E0D025B8];
            v113 = *MEMORY[0x1E0CB2D50];
            v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numOfPronounMentions"));
            v114 = v38;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v73;
            v9 = v72;
            v15 = v85;
            v76 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v74, 2, v36);
            v23 = 0;
            v93 = 0;
            *v91 = v76;
LABEL_57:

            v14 = v90;
LABEL_58:

            v35 = v95;
            v41 = v89;
LABEL_59:

            v24 = v106;
LABEL_60:

LABEL_61:
            v8 = v104;
            goto LABEL_62;
          }
          v93 = v19;
        }
      }
      else
      {
        v93 = 0;
        v6 = v86;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfImagesShared"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v9;
      v96 = v12;
      if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v38 = 0;
            v23 = 0;
            goto LABEL_57;
          }
          v37 = self;
          v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v77 = *MEMORY[0x1E0D025B8];
          v111 = *MEMORY[0x1E0CB2D50];
          v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numOfImagesShared"));
          v112 = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v77, 2, v39);
          v23 = 0;
          v38 = 0;
          *v91 = v78;
          goto LABEL_56;
        }
        v37 = self;
        v38 = v36;
      }
      else
      {
        v37 = self;
        v38 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numOfLinguisticMentions"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v91)
          {
            v108 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v88 = *MEMORY[0x1E0D025B8];
            v109 = *MEMORY[0x1E0CB2D50];
            v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numOfLinguisticMentions"));
            v110 = v79;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *v91 = (id)objc_msgSend(v108, "initWithDomain:code:userInfo:", v88, 2, v80);

          }
          v40 = 0;
          v23 = 0;
          goto LABEL_56;
        }
        v40 = v39;
      }
      else
      {
        v40 = 0;
      }
      v23 = -[BMTextUnderstandingPoemAnalyticsFeatures initWithNumOfFacesInMessages:numOfFacesOnDevice:numOfNamedFacesOnDevice:numOfConversationThreads:numOfNamedEntityMentions:numOfSenderMentions:numOfReceiverMentions:numOfPronounMentions:numOfImagesShared:numOfLinguisticMentions:](v37, "initWithNumOfFacesInMessages:numOfFacesOnDevice:numOfNamedFacesOnDevice:numOfConversationThreads:numOfNamedEntityMentions:numOfSenderMentions:numOfReceiverMentions:numOfPronounMentions:numOfImagesShared:numOfLinguisticMentions:", v106, v104, v96, v105, v90, v101, v94, v93, v38, v40);
      v37 = v23;
LABEL_56:
      self = v37;

      v9 = v84;
      v15 = v85;
      v12 = v96;
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v86 = v6;
      v16 = v12;
      v101 = v15;
      goto LABEL_30;
    }
    if (a4)
    {
      v99 = v12;
      v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v56 = v15;
      v57 = v9;
      v58 = *MEMORY[0x1E0D025B8];
      v117 = *MEMORY[0x1E0CB2D50];
      v59 = v14;
      v60 = objc_alloc(MEMORY[0x1E0CB3940]);
      v82 = objc_opt_class();
      v61 = v60;
      v14 = v59;
      v94 = (id)objc_msgSend(v61, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v82, CFSTR("numOfSenderMentions"));
      v118 = v94;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v58;
      v9 = v57;
      v15 = v56;
      v23 = 0;
      v101 = 0;
      *v91 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v62, 2, v41);
      v35 = v95;
      v12 = v99;
      goto LABEL_59;
    }
    v101 = 0;
    v23 = 0;
LABEL_91:
    v24 = v106;
    v35 = v95;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v106 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_65;
  }
  v20 = a4;
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = *MEMORY[0x1E0D025B8];
  v127 = *MEMORY[0x1E0CB2D50];
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numOfFacesInMessages"));
  v128[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, &v127, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = 0;
  *v20 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v7);
LABEL_64:

LABEL_65:
  return v23;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[10];
  _QWORD v36[12];

  v36[10] = *MEMORY[0x1E0C80C00];
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfFacesInMessages](self, "hasNumOfFacesInMessages"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesInMessages](self, "numOfFacesInMessages"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfFacesOnDevice](self, "hasNumOfFacesOnDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesOnDevice](self, "numOfFacesOnDevice"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfNamedFacesOnDevice](self, "hasNumOfNamedFacesOnDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedFacesOnDevice](self, "numOfNamedFacesOnDevice"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfConversationThreads](self, "hasNumOfConversationThreads"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfConversationThreads](self, "numOfConversationThreads"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfNamedEntityMentions](self, "hasNumOfNamedEntityMentions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedEntityMentions](self, "numOfNamedEntityMentions"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfSenderMentions](self, "hasNumOfSenderMentions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfSenderMentions](self, "numOfSenderMentions"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfReceiverMentions](self, "hasNumOfReceiverMentions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfReceiverMentions](self, "numOfReceiverMentions"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfPronounMentions](self, "hasNumOfPronounMentions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfPronounMentions](self, "numOfPronounMentions"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfImagesShared](self, "hasNumOfImagesShared"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfImagesShared](self, "numOfImagesShared"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfLinguisticMentions](self, "hasNumOfLinguisticMentions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMTextUnderstandingPoemAnalyticsFeatures numOfLinguisticMentions](self, "numOfLinguisticMentions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v35[0] = CFSTR("numOfFacesInMessages");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v11;
  v36[0] = v11;
  v35[1] = CFSTR("numOfFacesOnDevice");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v12;
  v36[1] = v12;
  v35[2] = CFSTR("numOfNamedFacesOnDevice");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v3;
  v25 = (void *)v13;
  v36[2] = v13;
  v35[3] = CFSTR("numOfConversationThreads");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v4;
  v24 = (void *)v14;
  v36[3] = v14;
  v35[4] = CFSTR("numOfNamedEntityMentions");
  v15 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v5;
  v36[4] = v15;
  v35[5] = CFSTR("numOfSenderMentions");
  v16 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v6;
  v36[5] = v16;
  v35[6] = CFSTR("numOfReceiverMentions");
  v17 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v7;
  v36[6] = v17;
  v35[7] = CFSTR("numOfPronounMentions");
  v19 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v8;
  v36[7] = v19;
  v35[8] = CFSTR("numOfImagesShared");
  v21 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[8] = v21;
  v35[9] = CFSTR("numOfLinguisticMentions");
  v22 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[9] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 10);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_53;
  }
  else
  {

    if (v9)
      goto LABEL_53;
  }

LABEL_53:
  if (!v33)

  if (!v34)
  if (!v20)

  if (!v18)
  if (!v29)

  if (v30)
  {
    if (v31)
      goto LABEL_65;
LABEL_70:

    if (v32)
      goto LABEL_66;
LABEL_71:

    goto LABEL_66;
  }

  if (!v31)
    goto LABEL_70;
LABEL_65:
  if (!v32)
    goto LABEL_71;
LABEL_66:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfFacesInMessages](self, "hasNumOfFacesInMessages")
      || objc_msgSend(v5, "hasNumOfFacesInMessages"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfFacesInMessages](self, "hasNumOfFacesInMessages"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfFacesInMessages"))
        goto LABEL_53;
      v6 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesInMessages](self, "numOfFacesInMessages");
      if (v6 != objc_msgSend(v5, "numOfFacesInMessages"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfFacesOnDevice](self, "hasNumOfFacesOnDevice")
      || objc_msgSend(v5, "hasNumOfFacesOnDevice"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfFacesOnDevice](self, "hasNumOfFacesOnDevice"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfFacesOnDevice"))
        goto LABEL_53;
      v7 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfFacesOnDevice](self, "numOfFacesOnDevice");
      if (v7 != objc_msgSend(v5, "numOfFacesOnDevice"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfNamedFacesOnDevice](self, "hasNumOfNamedFacesOnDevice")
      || objc_msgSend(v5, "hasNumOfNamedFacesOnDevice"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfNamedFacesOnDevice](self, "hasNumOfNamedFacesOnDevice"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfNamedFacesOnDevice"))
        goto LABEL_53;
      v8 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedFacesOnDevice](self, "numOfNamedFacesOnDevice");
      if (v8 != objc_msgSend(v5, "numOfNamedFacesOnDevice"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfConversationThreads](self, "hasNumOfConversationThreads")
      || objc_msgSend(v5, "hasNumOfConversationThreads"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfConversationThreads](self, "hasNumOfConversationThreads"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfConversationThreads"))
        goto LABEL_53;
      v9 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfConversationThreads](self, "numOfConversationThreads");
      if (v9 != objc_msgSend(v5, "numOfConversationThreads"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfNamedEntityMentions](self, "hasNumOfNamedEntityMentions")
      || objc_msgSend(v5, "hasNumOfNamedEntityMentions"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfNamedEntityMentions](self, "hasNumOfNamedEntityMentions"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfNamedEntityMentions"))
        goto LABEL_53;
      v10 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfNamedEntityMentions](self, "numOfNamedEntityMentions");
      if (v10 != objc_msgSend(v5, "numOfNamedEntityMentions"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfSenderMentions](self, "hasNumOfSenderMentions")
      || objc_msgSend(v5, "hasNumOfSenderMentions"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfSenderMentions](self, "hasNumOfSenderMentions"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfSenderMentions"))
        goto LABEL_53;
      v11 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfSenderMentions](self, "numOfSenderMentions");
      if (v11 != objc_msgSend(v5, "numOfSenderMentions"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfReceiverMentions](self, "hasNumOfReceiverMentions")
      || objc_msgSend(v5, "hasNumOfReceiverMentions"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfReceiverMentions](self, "hasNumOfReceiverMentions"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfReceiverMentions"))
        goto LABEL_53;
      v12 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfReceiverMentions](self, "numOfReceiverMentions");
      if (v12 != objc_msgSend(v5, "numOfReceiverMentions"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfPronounMentions](self, "hasNumOfPronounMentions")
      || objc_msgSend(v5, "hasNumOfPronounMentions"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfPronounMentions](self, "hasNumOfPronounMentions"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfPronounMentions"))
        goto LABEL_53;
      v13 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfPronounMentions](self, "numOfPronounMentions");
      if (v13 != objc_msgSend(v5, "numOfPronounMentions"))
        goto LABEL_53;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfImagesShared](self, "hasNumOfImagesShared")
      || objc_msgSend(v5, "hasNumOfImagesShared"))
    {
      if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfImagesShared](self, "hasNumOfImagesShared"))
        goto LABEL_53;
      if (!objc_msgSend(v5, "hasNumOfImagesShared"))
        goto LABEL_53;
      v14 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfImagesShared](self, "numOfImagesShared");
      if (v14 != objc_msgSend(v5, "numOfImagesShared"))
        goto LABEL_53;
    }
    if (!-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfLinguisticMentions](self, "hasNumOfLinguisticMentions")
      && !objc_msgSend(v5, "hasNumOfLinguisticMentions"))
    {
      v16 = 1;
      goto LABEL_54;
    }
    if (-[BMTextUnderstandingPoemAnalyticsFeatures hasNumOfLinguisticMentions](self, "hasNumOfLinguisticMentions")
      && objc_msgSend(v5, "hasNumOfLinguisticMentions"))
    {
      v15 = -[BMTextUnderstandingPoemAnalyticsFeatures numOfLinguisticMentions](self, "numOfLinguisticMentions");
      v16 = v15 == objc_msgSend(v5, "numOfLinguisticMentions");
    }
    else
    {
LABEL_53:
      v16 = 0;
    }
LABEL_54:

    goto LABEL_55;
  }
  v16 = 0;
LABEL_55:

  return v16;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int64_t)numOfFacesInMessages
{
  return self->_numOfFacesInMessages;
}

- (BOOL)hasNumOfFacesInMessages
{
  return self->_hasNumOfFacesInMessages;
}

- (void)setHasNumOfFacesInMessages:(BOOL)a3
{
  self->_hasNumOfFacesInMessages = a3;
}

- (int64_t)numOfFacesOnDevice
{
  return self->_numOfFacesOnDevice;
}

- (BOOL)hasNumOfFacesOnDevice
{
  return self->_hasNumOfFacesOnDevice;
}

- (void)setHasNumOfFacesOnDevice:(BOOL)a3
{
  self->_hasNumOfFacesOnDevice = a3;
}

- (int64_t)numOfNamedFacesOnDevice
{
  return self->_numOfNamedFacesOnDevice;
}

- (BOOL)hasNumOfNamedFacesOnDevice
{
  return self->_hasNumOfNamedFacesOnDevice;
}

- (void)setHasNumOfNamedFacesOnDevice:(BOOL)a3
{
  self->_hasNumOfNamedFacesOnDevice = a3;
}

- (int64_t)numOfConversationThreads
{
  return self->_numOfConversationThreads;
}

- (BOOL)hasNumOfConversationThreads
{
  return self->_hasNumOfConversationThreads;
}

- (void)setHasNumOfConversationThreads:(BOOL)a3
{
  self->_hasNumOfConversationThreads = a3;
}

- (int64_t)numOfNamedEntityMentions
{
  return self->_numOfNamedEntityMentions;
}

- (BOOL)hasNumOfNamedEntityMentions
{
  return self->_hasNumOfNamedEntityMentions;
}

- (void)setHasNumOfNamedEntityMentions:(BOOL)a3
{
  self->_hasNumOfNamedEntityMentions = a3;
}

- (int64_t)numOfSenderMentions
{
  return self->_numOfSenderMentions;
}

- (BOOL)hasNumOfSenderMentions
{
  return self->_hasNumOfSenderMentions;
}

- (void)setHasNumOfSenderMentions:(BOOL)a3
{
  self->_hasNumOfSenderMentions = a3;
}

- (int64_t)numOfReceiverMentions
{
  return self->_numOfReceiverMentions;
}

- (BOOL)hasNumOfReceiverMentions
{
  return self->_hasNumOfReceiverMentions;
}

- (void)setHasNumOfReceiverMentions:(BOOL)a3
{
  self->_hasNumOfReceiverMentions = a3;
}

- (int64_t)numOfPronounMentions
{
  return self->_numOfPronounMentions;
}

- (BOOL)hasNumOfPronounMentions
{
  return self->_hasNumOfPronounMentions;
}

- (void)setHasNumOfPronounMentions:(BOOL)a3
{
  self->_hasNumOfPronounMentions = a3;
}

- (int64_t)numOfImagesShared
{
  return self->_numOfImagesShared;
}

- (BOOL)hasNumOfImagesShared
{
  return self->_hasNumOfImagesShared;
}

- (void)setHasNumOfImagesShared:(BOOL)a3
{
  self->_hasNumOfImagesShared = a3;
}

- (int64_t)numOfLinguisticMentions
{
  return self->_numOfLinguisticMentions;
}

- (BOOL)hasNumOfLinguisticMentions
{
  return self->_hasNumOfLinguisticMentions;
}

- (void)setHasNumOfLinguisticMentions:(BOOL)a3
{
  self->_hasNumOfLinguisticMentions = a3;
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

    v4 = -[BMTextUnderstandingPoemAnalyticsFeatures initByReadFrom:]([BMTextUnderstandingPoemAnalyticsFeatures alloc], "initByReadFrom:", v7);
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
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfFacesInMessages"), 0, 0, 1, 3, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfFacesOnDevice"), 0, 0, 2, 3, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfNamedFacesOnDevice"), 0, 0, 3, 3, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfConversationThreads"), 0, 0, 4, 3, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfNamedEntityMentions"), 0, 0, 5, 3, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfSenderMentions"), 0, 0, 6, 3, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfReceiverMentions"), 0, 0, 7, 3, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfPronounMentions"), 0, 0, 8, 3, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfImagesShared"), 0, 0, 9, 3, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numOfLinguisticMentions"), 0, 0, 10, 3, 0);
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
  return &unk_1E5F1B3E8;
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
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfFacesInMessages"), 1, 3, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfFacesOnDevice"), 2, 3, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfNamedFacesOnDevice"), 3, 3, 0);
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfConversationThreads"), 4, 3, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfNamedEntityMentions"), 5, 3, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfSenderMentions"), 6, 3, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfReceiverMentions"), 7, 3, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfPronounMentions"), 8, 3, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfImagesShared"), 9, 3, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numOfLinguisticMentions"), 10, 3, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
