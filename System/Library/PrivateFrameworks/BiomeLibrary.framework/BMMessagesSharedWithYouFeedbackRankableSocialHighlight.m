@implementation BMMessagesSharedWithYouFeedbackRankableSocialHighlight

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(int)a4 syndicationSecondsSinceReferenceDate:(id)a5 sourceBundleID:(id)a6 applicationIdentifiers:(id)a7 resourceURL:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationSecondsSinceReferenceDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingSecondsSinceReferenceDate:(id)a23 resolvedUrl:(id)a24 clientVariant:(id)a25
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v34;
  double v35;
  double v36;
  unsigned int v37;
  double v38;
  double v39;
  id v43;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  objc_super v63;

  v60 = a3;
  v29 = a5;
  v43 = a6;
  v59 = a6;
  v44 = a7;
  v58 = a7;
  v57 = a8;
  v56 = a9;
  v55 = a10;
  v54 = a11;
  v53 = a12;
  v52 = a13;
  v62 = a14;
  v51 = a15;
  v50 = a16;
  v30 = a17;
  v49 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v48 = a22;
  v61 = a23;
  v47 = a24;
  v46 = a25;
  v63.receiver = self;
  v63.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlight;
  v34 = -[BMEventBase init](&v63, sel_init);
  if (v34)
  {
    v34->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v34->_highlightIdentifier, a3);
    v34->_highlightType = a4;
    if (v29)
    {
      v34->_hasSyndicationSecondsSinceReferenceDate = 1;
      objc_msgSend(v29, "doubleValue");
    }
    else
    {
      v29 = 0;
      v34->_hasSyndicationSecondsSinceReferenceDate = 0;
      v35 = -1.0;
    }
    v34->_syndicationSecondsSinceReferenceDate = v35;
    objc_storeStrong((id *)&v34->_sourceBundleID, v43);
    objc_storeStrong((id *)&v34->_applicationIdentifiers, v44);
    objc_storeStrong((id *)&v34->_resourceURL, a8);
    objc_storeStrong((id *)&v34->_sender, a9);
    objc_storeStrong((id *)&v34->_domainIdentifier, a10);
    objc_storeStrong((id *)&v34->_batchIdentifier, a11);
    objc_storeStrong((id *)&v34->_calculatedFeatures, a12);
    objc_storeStrong((id *)&v34->_clientIdentifier, a13);
    if (v62)
    {
      v34->_hasContentCreationSecondsSinceReferenceDate = 1;
      objc_msgSend(v62, "doubleValue");
    }
    else
    {
      v34->_hasContentCreationSecondsSinceReferenceDate = 0;
      v36 = -1.0;
    }
    v34->_contentCreationSecondsSinceReferenceDate = v36;
    objc_storeStrong((id *)&v34->_groupPhotoPathDigest, a15);
    objc_storeStrong((id *)&v34->_displayName, a16);
    if (v30)
    {
      v34->_hasIsPrimary = 1;
      v34->_isPrimary = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v34->_hasIsPrimary = 0;
      v34->_isPrimary = 0;
    }
    objc_storeStrong((id *)&v34->_attributionIdentifier, a18);
    if (v31)
    {
      v34->_hasRank = 1;
      v37 = objc_msgSend(v31, "unsignedIntValue");
    }
    else
    {
      v37 = 0;
      v34->_hasRank = 0;
    }
    v34->_rank = v37;
    if (v32)
    {
      v34->_hasScore = 1;
      objc_msgSend(v32, "doubleValue");
    }
    else
    {
      v34->_hasScore = 0;
      v38 = -1.0;
    }
    v34->_score = v38;
    if (v33)
    {
      v34->_hasIsConversationAutoDonating = 1;
      v34->_isConversationAutoDonating = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v34->_hasIsConversationAutoDonating = 0;
      v34->_isConversationAutoDonating = 0;
    }
    objc_storeStrong((id *)&v34->_originatingDeviceId, a22);
    if (v61)
    {
      v34->_hasRankingSecondsSinceReferenceDate = 1;
      objc_msgSend(v61, "doubleValue");
    }
    else
    {
      v34->_hasRankingSecondsSinceReferenceDate = 0;
      v39 = -1.0;
    }
    v34->_rankingSecondsSinceReferenceDate = v39;
    objc_storeStrong((id *)&v34->_resolvedUrl, a24);
    objc_storeStrong((id *)&v34->_clientVariant, a25);
  }

  return v34;
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
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightIdentifier](self, "highlightIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeAsString(-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightType](self, "highlightType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight syndicationSecondsSinceReferenceDate](self, "syndicationSecondsSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sourceBundleID](self, "sourceBundleID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight applicationIdentifiers](self, "applicationIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resourceURL](self, "resourceURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sender](self, "sender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight domainIdentifier](self, "domainIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight batchIdentifier](self, "batchIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight calculatedFeatures](self, "calculatedFeatures");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientIdentifier](self, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight contentCreationSecondsSinceReferenceDate](self, "contentCreationSecondsSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight groupPhotoPathDigest](self, "groupPhotoPathDigest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight displayName](self, "displayName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isPrimary](self, "isPrimary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight attributionIdentifier](self, "attributionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rank](self, "rank"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight score](self, "score");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isConversationAutoDonating](self, "isConversationAutoDonating"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight originatingDeviceId](self, "originatingDeviceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rankingSecondsSinceReferenceDate](self, "rankingSecondsSinceReferenceDate");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resolvedUrl](self, "resolvedUrl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientVariant](self, "clientVariant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("BMMessagesSharedWithYouFeedbackRankableSocialHighlight with highlightIdentifier: %@, highlightType: %@, syndicationSecondsSinceReferenceDate: %@, sourceBundleID: %@, applicationIdentifiers: %@, resourceURL: %@, sender: %@, domainIdentifier: %@, batchIdentifier: %@, calculatedFeatures: %@, clientIdentifier: %@, contentCreationSecondsSinceReferenceDate: %@, groupPhotoPathDigest: %@, displayName: %@, isPrimary: %@, attributionIdentifier: %@, rank: %@, score: %@, isConversationAutoDonating: %@, originatingDeviceId: %@, rankingSecondsSinceReferenceDate: %@, resolvedUrl: %@, clientVariant: %@"), v31, v32, v30, v29, v28, v27, v19, v26, v18, v25, v17, v24, v23, v22, v16, v15,
                  v5,
                  v7,
                  v8,
                  v9,
                  v11,
                  v12,
                  v13);

  return (NSString *)v21;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v5;
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
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  objc_class *v33;
  uint64_t v34;
  void *v35;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v36;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *sender;
  id v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  uint64_t v64;
  unint64_t v65;
  void *v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSArray *applicationIdentifiers;
  uint64_t v72;
  NSArray *calculatedFeatures;
  int v74;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v75;
  objc_super v77;
  uint64_t v78;
  uint64_t v79;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BMMessagesSharedWithYouFeedbackRankableSocialHighlight;
  v5 = -[BMEventBase init](&v77, sel_init);
  if (!v5)
    goto LABEL_115;
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
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 40;
          goto LABEL_83;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          while (2)
          {
            v27 = *v8;
            v28 = *(_QWORD *)&v4[v27];
            v29 = v28 + 1;
            if (v28 == -1 || v29 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v28);
              *(_QWORD *)&v4[v27] = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                v19 = v25++ >= 9;
                if (v19)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v26) = 0;
LABEL_87:
          if (v26 >= 3)
            LODWORD(v26) = 0;
          v5->_highlightType = v26;
          continue;
        case 3u:
          v5->_hasSyndicationSecondsSinceReferenceDate = 1;
          v31 = *v8;
          v32 = *(_QWORD *)&v4[v31];
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v33 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v32);
            *(_QWORD *)&v4[v31] = v32 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v33 = 0;
          }
          v69 = 48;
          goto LABEL_111;
        case 4u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 56;
          goto LABEL_83;
        case 5u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
            goto LABEL_117;
          v35 = (void *)v34;
          objc_msgSend(v6, "addObject:", v34);
          goto LABEL_45;
        case 6u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 72;
          goto LABEL_83;
        case 7u:
          v78 = 0;
          v79 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_117;
          v36 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact initByReadFrom:]([BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact alloc], "initByReadFrom:", v4);
          if (!v36)
            goto LABEL_117;
          sender = v5->_sender;
          v5->_sender = v36;

          PBReaderRecallMark();
          continue;
        case 8u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 88;
          goto LABEL_83;
        case 9u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 96;
          goto LABEL_83;
        case 0xAu:
          v78 = 0;
          v79 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_117;
          v38 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature initByReadFrom:]([BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature alloc], "initByReadFrom:", v4);
          if (!v38)
            goto LABEL_117;
          v35 = v38;
          objc_msgSend(v7, "addObject:", v38);
          PBReaderRecallMark();
LABEL_45:

          continue;
        case 0xBu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 112;
          goto LABEL_83;
        case 0xCu:
          v5->_hasContentCreationSecondsSinceReferenceDate = 1;
          v39 = *v8;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v33 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v40);
            *(_QWORD *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v33 = 0;
          }
          v69 = 120;
          goto LABEL_111;
        case 0xDu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 128;
          goto LABEL_83;
        case 0xEu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 136;
          goto LABEL_83;
        case 0xFu:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v5->_hasIsPrimary = 1;
          while (2)
          {
            v44 = *v8;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v45);
              *(_QWORD *)&v4[v44] = v46;
              v43 |= (unint64_t)(v47 & 0x7F) << v41;
              if (v47 < 0)
              {
                v41 += 7;
                v19 = v42++ >= 9;
                if (v19)
                {
                  v43 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v43 = 0;
LABEL_93:
          v67 = v43 != 0;
          v68 = 18;
          goto LABEL_102;
        case 0x10u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 144;
          goto LABEL_83;
        case 0x11u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v5->_hasRank = 1;
          while (2)
          {
            v51 = *v8;
            v52 = *(_QWORD *)&v4[v51];
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v52);
              *(_QWORD *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                v19 = v49++ >= 9;
                if (v19)
                {
                  LODWORD(v50) = 0;
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v50) = 0;
LABEL_97:
          v5->_rank = v50;
          continue;
        case 0x12u:
          v5->_hasScore = 1;
          v55 = *v8;
          v56 = *(_QWORD *)&v4[v55];
          if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v33 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v56);
            *(_QWORD *)&v4[v55] = v56 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v33 = 0;
          }
          v69 = 152;
          goto LABEL_111;
        case 0x13u:
          v57 = 0;
          v58 = 0;
          v59 = 0;
          v5->_hasIsConversationAutoDonating = 1;
          break;
        case 0x14u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 160;
          goto LABEL_83;
        case 0x15u:
          v5->_hasRankingSecondsSinceReferenceDate = 1;
          v64 = *v8;
          v65 = *(_QWORD *)&v4[v64];
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v33 = *(objc_class **)(*(_QWORD *)&v4[*v11] + v65);
            *(_QWORD *)&v4[v64] = v65 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v33 = 0;
          }
          v69 = 168;
LABEL_111:
          *(Class *)((char *)&v5->super.super.isa + v69) = v33;
          continue;
        case 0x16u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 176;
          goto LABEL_83;
        case 0x17u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 184;
LABEL_83:
          v66 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_117:

          goto LABEL_114;
      }
      while (1)
      {
        v60 = *v8;
        v61 = *(_QWORD *)&v4[v60];
        v62 = v61 + 1;
        if (v61 == -1 || v62 > *(_QWORD *)&v4[*v9])
          break;
        v63 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v61);
        *(_QWORD *)&v4[v60] = v62;
        v59 |= (unint64_t)(v63 & 0x7F) << v57;
        if ((v63 & 0x80) == 0)
          goto LABEL_99;
        v57 += 7;
        v19 = v58++ >= 9;
        if (v19)
        {
          v59 = 0;
          goto LABEL_101;
        }
      }
      v4[*v10] = 1;
LABEL_99:
      if (v4[*v10])
        v59 = 0;
LABEL_101:
      v67 = v59 != 0;
      v68 = 22;
LABEL_102:
      *((_BYTE *)&v5->super.super.isa + v68) = v67;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v70 = objc_msgSend(v6, "copy");
  applicationIdentifiers = v5->_applicationIdentifiers;
  v5->_applicationIdentifiers = (NSArray *)v70;

  v72 = objc_msgSend(v7, "copy");
  calculatedFeatures = v5->_calculatedFeatures;
  v5->_calculatedFeatures = (NSArray *)v72;

  v74 = v4[*v10];
  if (v74)
LABEL_114:
    v75 = 0;
  else
LABEL_115:
    v75 = v5;

  return v75;
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
  if (self->_highlightIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasSyndicationSecondsSinceReferenceDate)
    PBDataWriterWriteDoubleField();
  if (self->_sourceBundleID)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_applicationIdentifiers;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  if (self->_resourceURL)
    PBDataWriterWriteStringField();
  if (self->_sender)
  {
    v20 = 0;
    PBDataWriterPlaceMark();
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact writeTo:](self->_sender, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_domainIdentifier)
    PBDataWriterWriteStringField();
  if (self->_batchIdentifier)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_calculatedFeatures;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        v20 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4, (_QWORD)v16);
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v12);
  }

  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasContentCreationSecondsSinceReferenceDate)
    PBDataWriterWriteDoubleField();
  if (self->_groupPhotoPathDigest)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_hasIsPrimary)
    PBDataWriterWriteBOOLField();
  if (self->_attributionIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasRank)
    PBDataWriterWriteUint32Field();
  if (self->_hasScore)
    PBDataWriterWriteDoubleField();
  if (self->_hasIsConversationAutoDonating)
    PBDataWriterWriteBOOLField();
  if (self->_originatingDeviceId)
    PBDataWriterWriteStringField();
  if (self->_hasRankingSecondsSinceReferenceDate)
    PBDataWriterWriteDoubleField();
  if (self->_resolvedUrl)
    PBDataWriterWriteStringField();
  if (self->_clientVariant)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlight)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void **v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v72;
  uint64_t v73;
  void *v74;
  id *v75;
  uint64_t v76;
  void *v77;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v78;
  id v79;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  id v87;
  uint64_t v88;
  id v89;
  id v90;
  uint64_t v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *v108;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature *v109;
  id v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  id v124;
  id v125;
  uint64_t v126;
  id v127;
  id *v128;
  id v129;
  uint64_t v130;
  void *v131;
  id *v132;
  uint64_t *v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  id v141;
  uint64_t v142;
  id *v143;
  id v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  id v154;
  void *v155;
  uint64_t v156;
  void *v157;
  id v158;
  id v159;
  uint64_t v160;
  id v161;
  id v162;
  id v163;
  id v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  id v171;
  void *v172;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v173;
  id v174;
  id v175;
  id v176;
  char isKindOfClass;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  id v186;
  id v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  void *v191;
  void *v192;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  uint64_t v201;
  void *v202;
  id v203;
  void *v204;
  void *v205;
  id v206;
  void *v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  id v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  id v217;
  uint64_t v218;
  void *v219;
  id v220;
  void *v221;
  id v222;
  id v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  id v229;
  id v230;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v231;
  id v232;
  id v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  id v239;
  id v240;
  id obj;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  id *v251;
  id v252;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlight *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  id v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  id v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  uint64_t v268;
  void *v269;
  uint64_t v270;
  id v271;
  uint64_t v272;
  id v273;
  uint64_t v274;
  void *v275;
  uint64_t v276;
  id v277;
  uint64_t v278;
  id v279;
  uint64_t v280;
  void *v281;
  uint64_t v282;
  id v283;
  uint64_t v284;
  id v285;
  uint64_t v286;
  id v287;
  uint64_t v288;
  void *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  id v293;
  uint64_t v294;
  id v295;
  uint64_t v296;
  id v297;
  _BYTE v298[128];
  uint64_t v299;
  void *v300;
  uint64_t v301;
  id v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *v306;
  uint64_t v307;
  id v308;
  uint64_t v309;
  void *v310;
  uint64_t v311;
  void *v312;
  _BYTE v313[128];
  uint64_t v314;
  void *v315;
  uint64_t v316;
  id v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  id v321;
  uint64_t v322;
  _QWORD v323[3];

  v323[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highlightIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v253 = self;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highlightType"));
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v254 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v250 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v250 = v254;
LABEL_15:

LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("syndicationSecondsSinceReferenceDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v251 = a4;
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v252 = 0;
LABEL_19:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceBundleID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v248 = v7;
        if (!v19)
        {
          v21 = v6;
          v22 = v18;
          v20 = v8;
          goto LABEL_23;
        }
        v20 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v6;
          v22 = v18;
LABEL_23:
          v23 = 0;
LABEL_24:
          v24 = v21;
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("applicationIdentifiers"));
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqual:", v26);

          v249 = v20;
          v246 = v23;
          v247 = v22;
          if (v27)
          {

            v25 = 0;
LABEL_35:
            v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v25, "count"));
            v264 = 0u;
            v265 = 0u;
            v266 = 0u;
            v267 = 0u;
            v25 = v25;
            v38 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v264, v313, 16);
            if (!v38)
              goto LABEL_44;
            v39 = v38;
            v40 = *(_QWORD *)v265;
            while (1)
            {
              v29 = v19;
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v265 != v40)
                  objc_enumerationMutation(v25);
                v42 = *(void **)(*((_QWORD *)&v264 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v46 = v251;
                  if (v251)
                  {
                    v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v48 = *MEMORY[0x1E0D025B8];
                    v311 = *MEMORY[0x1E0CB2D50];
                    v245 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("applicationIdentifiers"));
                    v312 = v245;
                    v49 = (void *)MEMORY[0x1E0C99D80];
                    v50 = &v312;
                    v51 = &v311;
LABEL_51:
                    objc_msgSend(v49, "dictionaryWithObjects:forKeys:count:", v50, v51, 1);
                    v52 = objc_claimAutoreleasedReturnValue();
                    v53 = v47;
                    v54 = (void *)v52;
                    v8 = v249;
                    v14 = v250;
                    v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v48, 2);
                    v16 = 0;
                    *v46 = v55;
                    v56 = v25;
                    v6 = v24;
                    goto LABEL_264;
                  }
LABEL_52:
                  v16 = 0;
                  v56 = v25;
                  v6 = v24;
                  v8 = v249;
                  v14 = v250;
                  v28 = v246;
                  v18 = v247;
                  goto LABEL_267;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v46 = v251;
                  if (v251)
                  {
                    v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v48 = *MEMORY[0x1E0D025B8];
                    v309 = *MEMORY[0x1E0CB2D50];
                    v245 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("applicationIdentifiers"));
                    v310 = v245;
                    v49 = (void *)MEMORY[0x1E0C99D80];
                    v50 = &v310;
                    v51 = &v309;
                    goto LABEL_51;
                  }
                  goto LABEL_52;
                }
                v43 = v42;
                objc_msgSend(v255, "addObject:", v43);

              }
              v39 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v264, v313, 16);
              if (!v39)
              {
LABEL_44:

                v6 = v24;
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("resourceURL"));
                v44 = objc_claimAutoreleasedReturnValue();
                v240 = v25;
                v245 = (void *)v44;
                if (v44)
                {
                  v45 = (void *)v44;
                  objc_opt_class();
                  v18 = v247;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v239 = 0;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v251)
                      {
                        v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v88 = *MEMORY[0x1E0D025B8];
                        v307 = *MEMORY[0x1E0CB2D50];
                        v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("resourceURL"));
                        v308 = v79;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v308, &v307, 1);
                        v72 = (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)objc_claimAutoreleasedReturnValue();
                        v89 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v88, 2, v72);
                        v16 = 0;
                        v56 = 0;
                        *v251 = v89;
                        v8 = v249;
                        v14 = v250;
                        goto LABEL_263;
                      }
                      v56 = 0;
                      v16 = 0;
                      v8 = v249;
                      v14 = v250;
                      v29 = v19;
                      goto LABEL_266;
                    }
                    v239 = v45;
                  }
                }
                else
                {
                  v239 = 0;
                  v18 = v247;
                }
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sender"));
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = v249;
                if (v71)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v79 = v71;
                      v80 = [BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact alloc];
                      v263 = 0;
                      v72 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact initWithJSONDictionary:error:](v80, "initWithJSONDictionary:error:", v79, &v263);
                      v81 = v263;
                      if (!v81)
                      {
                        v235 = v71;

                        goto LABEL_66;
                      }
                      v82 = v81;
                      v14 = v250;
                      if (v251)
                        *v251 = objc_retainAutorelease(v81);

                      v16 = 0;
                      v8 = v249;
                    }
                    else
                    {
                      v54 = v71;
                      if (!v251)
                      {
                        v16 = 0;
                        v14 = v250;
                        v56 = v239;
                        goto LABEL_265;
                      }
                      v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v91 = *MEMORY[0x1E0D025B8];
                      v305 = *MEMORY[0x1E0CB2D50];
                      v72 = (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("sender"));
                      v306 = v72;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v306, &v305, 1);
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      v8 = v249;
                      *v251 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v91, 2, v92);

                      v16 = 0;
                      v79 = v71;
                      v14 = v250;
                    }
                    v56 = v239;
                    goto LABEL_263;
                  }
                }
                v235 = v71;
                v72 = 0;
LABEL_66:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domainIdentifier"));
                v73 = objc_claimAutoreleasedReturnValue();
                v238 = (void *)v73;
                if (v73 && (v74 = (void *)v73, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v251)
                    {
                      v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v94 = *MEMORY[0x1E0D025B8];
                      v303 = *MEMORY[0x1E0CB2D50];
                      v95 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domainIdentifier"));
                      v304 = v95;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v304, &v303, 1);
                      v96 = (void *)v95;
                      v234 = (void *)objc_claimAutoreleasedReturnValue();
                      v97 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v94, 2);
                      v16 = 0;
                      v98 = 0;
                      *v251 = v97;
                      v99 = v249;
                      v14 = v250;
                      v56 = v239;
                      goto LABEL_261;
                    }
                    v16 = 0;
                    v98 = 0;
                    v99 = v249;
                    v14 = v250;
                    v56 = v239;
                    goto LABEL_262;
                  }
                  v233 = v74;
                }
                else
                {
                  v233 = 0;
                }
                v75 = v251;
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("batchIdentifier"));
                v76 = objc_claimAutoreleasedReturnValue();
                v234 = (void *)v76;
                if (v76)
                {
                  v77 = (void *)v76;
                  v78 = v72;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (v251)
                      {
                        v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v126 = *MEMORY[0x1E0D025B8];
                        v301 = *MEMORY[0x1E0CB2D50];
                        obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("batchIdentifier"));
                        v302 = obj;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v302, &v301, 1);
                        v242 = (void *)objc_claimAutoreleasedReturnValue();
                        v127 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v126, 2, v242);
                        v16 = 0;
                        v232 = 0;
                        *v251 = v127;
                        v99 = v249;
                        v14 = v250;
                        v56 = v239;
                        goto LABEL_259;
                      }
                      v96 = 0;
                      v16 = 0;
                      v99 = v249;
                      v14 = v250;
                      v56 = v239;
                      v98 = v233;
                      goto LABEL_261;
                    }
                    v232 = v77;
LABEL_82:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("calculatedFeatures"));
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    v85 = objc_msgSend(v83, "isEqual:", v84);

                    if (v85)
                    {
                      v231 = v78;
                      v244 = v6;

                      goto LABEL_99;
                    }
                    if (v83)
                    {
                      objc_opt_class();
                      obj = v83;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v72 = v78;
                        if (v251)
                        {
                          v135 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v136 = *MEMORY[0x1E0D025B8];
                          v299 = *MEMORY[0x1E0CB2D50];
                          v242 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("calculatedFeatures"));
                          v300 = v242;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v300, &v299, 1);
                          v137 = objc_claimAutoreleasedReturnValue();
                          v138 = v136;
                          v139 = (void *)v137;
                          v16 = 0;
                          *v251 = (id)objc_msgSend(v135, "initWithDomain:code:userInfo:", v138, 2, v137);
                          v99 = v249;
                          v14 = v250;
                          v56 = v239;
                          goto LABEL_258;
                        }
                        v16 = 0;
                        v99 = v249;
                        v14 = v250;
                        v56 = v239;
                        v98 = v233;
                        goto LABEL_260;
                      }
                      v231 = v78;
                      v244 = v6;
                      v86 = v83;
                    }
                    else
                    {
                      v231 = v78;
                      v244 = v6;
LABEL_99:
                      v86 = 0;
                    }
                    v242 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v86, "count"));
                    v259 = 0u;
                    v260 = 0u;
                    v261 = 0u;
                    v262 = 0u;
                    obj = v86;
                    v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v259, v298, 16);
                    v101 = v246;
                    if (!v100)
                      goto LABEL_110;
                    v102 = v100;
                    v103 = *(_QWORD *)v260;
                    v236 = v19;
                    v104 = v249;
LABEL_102:
                    v105 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v260 != v103)
                        objc_enumerationMutation(obj);
                      v106 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * v105);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        break;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v128 = v251;
                        if (v251)
                        {
                          v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v130 = *MEMORY[0x1E0D025B8];
                          v294 = *MEMORY[0x1E0CB2D50];
                          v107 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("calculatedFeatures"));
                          v295 = v107;
                          v131 = (void *)MEMORY[0x1E0C99D80];
                          v132 = &v295;
                          v133 = &v294;
                          goto LABEL_140;
                        }
                        goto LABEL_147;
                      }
                      v107 = v106;
                      v108 = [BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature alloc];
                      v258 = 0;
                      v109 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlightFeature initWithJSONDictionary:error:](v108, "initWithJSONDictionary:error:", v107, &v258);
                      v110 = v258;
                      if (v110)
                      {
                        v134 = v110;
                        if (v251)
                          *v251 = objc_retainAutorelease(v110);
                        v229 = v134;

                        v16 = 0;
                        goto LABEL_144;
                      }
                      objc_msgSend(v242, "addObject:", v109);

                      if (v102 == ++v105)
                      {
                        v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v259, v298, 16);
                        v19 = v236;
                        v101 = v246;
                        v75 = v251;
                        if (v102)
                          goto LABEL_102;
LABEL_110:

                        v6 = v244;
                        objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
                        v107 = (id)objc_claimAutoreleasedReturnValue();
                        if (v107 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          v140 = v19;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v230 = v107;
                            v75 = v251;
                            v101 = v246;
                            goto LABEL_113;
                          }
                          if (!v251)
                          {
                            v230 = 0;
                            v16 = 0;
                            v14 = v250;
                            v99 = v249;
                            v56 = v239;
                            v72 = v231;
                            goto LABEL_257;
                          }
                          v141 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v142 = *MEMORY[0x1E0D025B8];
                          v292 = *MEMORY[0x1E0CB2D50];
                          v229 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientIdentifier"));
                          v293 = v229;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v293, &v292, 1);
                          v228 = (void *)objc_claimAutoreleasedReturnValue();
                          v16 = 0;
                          v230 = 0;
                          *v251 = (id)objc_msgSend(v141, "initWithDomain:code:userInfo:", v142, 2);
                          v14 = v250;
                          v19 = v140;
                          v104 = v249;
                        }
                        else
                        {
                          v230 = 0;
LABEL_113:
                          objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("contentCreationSecondsSinceReferenceDate"));
                          v111 = objc_claimAutoreleasedReturnValue();
                          v228 = (void *)v111;
                          if (!v111 || (v112 = (void *)v111, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v229 = 0;
LABEL_116:
                            objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("groupPhotoPathDigest"));
                            v113 = objc_claimAutoreleasedReturnValue();
                            v237 = v19;
                            v227 = (void *)v113;
                            if (v113)
                            {
                              v114 = (void *)v113;
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v222 = v114;
                                  goto LABEL_119;
                                }
                                if (v75)
                                {
                                  v152 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v153 = *MEMORY[0x1E0D025B8];
                                  v288 = *MEMORY[0x1E0CB2D50];
                                  v104 = v249;
                                  v226 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("groupPhotoPathDigest"));
                                  v289 = v226;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v289, &v288, 1);
                                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                                  v154 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v153, 2);
                                  v16 = 0;
                                  v150 = 0;
                                  *v75 = v154;
                                  v14 = v250;
                                  v19 = v237;
                                  v56 = v239;
                                  v72 = v231;
                                  goto LABEL_253;
                                }
                                v16 = 0;
                                v104 = v249;
                                v14 = v250;
                                v56 = v239;
                                v72 = v231;
                                v150 = 0;
                                goto LABEL_254;
                              }
                            }
                            v222 = 0;
LABEL_119:
                            objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("displayName"));
                            v115 = objc_claimAutoreleasedReturnValue();
                            v225 = (void *)v115;
                            if (v115 && (v116 = (void *)v115, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v117 = v116;
                                goto LABEL_122;
                              }
                              if (!v75)
                              {
                                v226 = 0;
                                v16 = 0;
                                v104 = v249;
                                v14 = v250;
                                v56 = v239;
                                v72 = v231;
                                v150 = v222;
                                goto LABEL_253;
                              }
                              v159 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v160 = *MEMORY[0x1E0D025B8];
                              v286 = *MEMORY[0x1E0CB2D50];
                              v104 = v249;
                              v223 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("displayName"));
                              v287 = v223;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v287, &v286, 1);
                              v221 = (void *)objc_claimAutoreleasedReturnValue();
                              v161 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
                              v16 = 0;
                              v226 = 0;
                              *v75 = v161;
                              v14 = v250;
                              v19 = v237;
                            }
                            else
                            {
                              v117 = 0;
LABEL_122:
                              objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("isPrimary"));
                              v118 = objc_claimAutoreleasedReturnValue();
                              v226 = v117;
                              v221 = (void *)v118;
                              if (!v118 || (v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v223 = 0;
LABEL_125:
                                objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("attributionIdentifier"));
                                v120 = objc_claimAutoreleasedReturnValue();
                                v219 = (void *)v120;
                                if (!v120
                                  || (v121 = (void *)v120, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v220 = 0;
LABEL_128:
                                  objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("rank"));
                                  v122 = objc_claimAutoreleasedReturnValue();
                                  v216 = (void *)v122;
                                  if (!v122
                                    || (v123 = (void *)v122, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v217 = 0;
                                    goto LABEL_131;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v217 = v123;
LABEL_131:
                                    objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("score"));
                                    v124 = (id)objc_claimAutoreleasedReturnValue();
                                    v213 = v124;
                                    if (v124)
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v124 = 0;
                                        goto LABEL_176;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v124 = v124;
                                        goto LABEL_176;
                                      }
                                      if (v251)
                                      {
                                        v215 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v210 = *MEMORY[0x1E0D025B8];
                                        v278 = *MEMORY[0x1E0CB2D50];
                                        v72 = v231;
                                        v104 = v249;
                                        v211 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("score"));
                                        v279 = v211;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v279, &v278, 1);
                                        v155 = (void *)objc_claimAutoreleasedReturnValue();
                                        v176 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v210, 2, v155);
                                        v173 = 0;
                                        v214 = 0;
                                        *v251 = v176;
                                        v56 = v239;
                                        goto LABEL_237;
                                      }
                                      v214 = 0;
                                      v16 = 0;
                                      v104 = v249;
                                      v14 = v250;
                                      v56 = v239;
                                      v72 = v231;
LABEL_235:
                                      v150 = v222;
LABEL_249:

LABEL_250:
LABEL_251:

LABEL_252:
LABEL_253:

LABEL_254:
LABEL_255:

LABEL_256:
                                      v99 = v104;

LABEL_257:
                                      v139 = v230;
LABEL_258:

LABEL_259:
                                      v98 = v233;

LABEL_260:
                                      v96 = v232;
LABEL_261:

LABEL_262:
                                      v79 = v235;
                                      v8 = v99;
LABEL_263:

                                      v54 = v79;
                                      v25 = v240;
LABEL_264:
                                      v18 = v247;
LABEL_265:
                                      v29 = v19;

LABEL_266:
                                      v28 = v246;

LABEL_267:
                                      goto LABEL_268;
                                    }
LABEL_176:
                                    objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("isConversationAutoDonating"));
                                    v155 = (void *)objc_claimAutoreleasedReturnValue();
                                    v214 = v124;
                                    if (v155)
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v205 = v155;
                                          v211 = v155;
                                          goto LABEL_179;
                                        }
                                        if (v251)
                                        {
                                          v212 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v208 = *MEMORY[0x1E0D025B8];
                                          v276 = *MEMORY[0x1E0CB2D50];
                                          v72 = v231;
                                          v104 = v249;
                                          v209 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isConversationAutoDonating"));
                                          v277 = v209;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v277, &v276, 1);
                                          v179 = objc_claimAutoreleasedReturnValue();
                                          v180 = v208;
                                          v207 = (void *)v179;
                                          v181 = (id)objc_msgSend(v212, "initWithDomain:code:userInfo:", v180, 2);
                                          v173 = 0;
                                          v211 = 0;
                                          *v251 = v181;
                                          v56 = v239;
                                          v150 = v222;
                                          goto LABEL_247;
                                        }
                                        v211 = 0;
                                        v173 = 0;
                                        v56 = v239;
                                        v104 = v249;
                                        v72 = v231;
LABEL_237:
                                        v150 = v222;
                                        goto LABEL_248;
                                      }
                                    }
                                    v205 = v155;
                                    v211 = 0;
LABEL_179:
                                    objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("originatingDeviceId"));
                                    v156 = objc_claimAutoreleasedReturnValue();
                                    v207 = (void *)v156;
                                    if (!v156
                                      || (v157 = (void *)v156, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v209 = 0;
                                      goto LABEL_182;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v251)
                                      {
                                        v182 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v183 = *MEMORY[0x1E0D025B8];
                                        v274 = *MEMORY[0x1E0CB2D50];
                                        v104 = v249;
                                        v202 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("originatingDeviceId"));
                                        v275 = v202;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v275, &v274, 1);
                                        v204 = (void *)objc_claimAutoreleasedReturnValue();
                                        v173 = 0;
                                        v209 = 0;
                                        *v251 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v183, 2);
                                        v19 = v237;
                                        v56 = v239;
                                        v150 = v222;
                                        v155 = v205;
                                        goto LABEL_246;
                                      }
                                      v209 = 0;
                                      v173 = 0;
                                      v56 = v239;
                                      v104 = v249;
                                      v72 = v231;
                                      v150 = v222;
                                      v155 = v205;
                                      goto LABEL_247;
                                    }
                                    v209 = v157;
LABEL_182:
                                    objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("rankingSecondsSinceReferenceDate"));
                                    v158 = (id)objc_claimAutoreleasedReturnValue();
                                    v155 = v205;
                                    v204 = v158;
                                    if (v158)
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v158 = 0;
                                        goto LABEL_198;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v158 = v158;
                                        goto LABEL_198;
                                      }
                                      if (v251)
                                      {
                                        v203 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v201 = *MEMORY[0x1E0D025B8];
                                        v272 = *MEMORY[0x1E0CB2D50];
                                        v104 = v249;
                                        v206 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rankingSecondsSinceReferenceDate"));
                                        v273 = v206;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v273, &v272, 1);
                                        v184 = objc_claimAutoreleasedReturnValue();
                                        v185 = v201;
                                        v200 = (void *)v184;
                                        v186 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v185, 2);
                                        v173 = 0;
                                        v202 = 0;
                                        *v251 = v186;
                                        v56 = v239;
                                        goto LABEL_241;
                                      }
                                      v202 = 0;
                                      v173 = 0;
                                      v56 = v239;
                                      v104 = v249;
                                      v150 = v222;
LABEL_246:

                                      v72 = v231;
LABEL_247:

LABEL_248:
                                      v16 = v173;
                                      v14 = v250;
                                      goto LABEL_249;
                                    }
LABEL_198:
                                    objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("resolvedUrl"));
                                    v167 = objc_claimAutoreleasedReturnValue();
                                    v200 = (void *)v167;
                                    v202 = v158;
                                    if (v167
                                      && (v168 = (void *)v167, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v206 = v168;
                                        goto LABEL_201;
                                      }
                                      if (!v251)
                                      {
                                        v206 = 0;
                                        v173 = 0;
                                        v56 = v239;
                                        v104 = v249;
LABEL_241:
                                        v150 = v222;
                                        goto LABEL_245;
                                      }
                                      v187 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v188 = *MEMORY[0x1E0D025B8];
                                      v270 = *MEMORY[0x1E0CB2D50];
                                      v104 = v249;
                                      v171 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("resolvedUrl"));
                                      v271 = v171;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v271, &v270, 1);
                                      v199 = (void *)objc_claimAutoreleasedReturnValue();
                                      v189 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v188, 2);
                                      v173 = 0;
                                      v206 = 0;
                                      *v251 = v189;
LABEL_233:
                                      v19 = v237;
                                      v56 = v239;
                                    }
                                    else
                                    {
                                      v206 = 0;
LABEL_201:
                                      objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("clientVariant"));
                                      v169 = objc_claimAutoreleasedReturnValue();
                                      v199 = (void *)v169;
                                      if (!v169
                                        || (v170 = (void *)v169, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v171 = 0;
                                        v172 = v250;
                                        goto LABEL_204;
                                      }
                                      objc_opt_class();
                                      isKindOfClass = objc_opt_isKindOfClass();
                                      v178 = v170;
                                      v172 = v250;
                                      if ((isKindOfClass & 1) != 0)
                                      {
                                        v171 = v178;
LABEL_204:
                                        v250 = v172;
                                        v197 = v158;
                                        v150 = v222;
                                        v104 = v249;
                                        v56 = v239;
                                        v253 = objc_retain(-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationSecondsSinceReferenceDate:sourceBundleID:applicationIdentifiers:resourceURL:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationSecondsSinceReferenceDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingSecondsSinceReferenceDate:resolvedUrl:clientVariant:](v253, "initWithHighlightIdentifier:highlightType:syndicationSecondsSinceReferenceDate:sourceBundleID:applicationIdentifiers:resourceURL:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationSecondsSinceReferenceDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingSecondsSinceReferenceDate:resolvedUrl:clientVariant:", v249, objc_msgSend(v172, "intValue"), v252, v101, v255, v239, v231, v233, v232, v242, v230,
                                                   v229,
                                                   v222,
                                                   v226,
                                                   v223,
                                                   v220,
                                                   v217,
                                                   v214,
                                                   v211,
                                                   v209,
                                                   v197,
                                                   v206,
                                                   v171));
                                        v173 = v253;
LABEL_244:

LABEL_245:
                                        goto LABEL_246;
                                      }
                                      if (v251)
                                      {
                                        v198 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v190 = *MEMORY[0x1E0D025B8];
                                        v268 = *MEMORY[0x1E0CB2D50];
                                        v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientVariant"));
                                        v269 = v191;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v269, &v268, 1);
                                        v192 = (void *)objc_claimAutoreleasedReturnValue();
                                        *v251 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v190, 2, v192);

                                        v104 = v249;
                                        v171 = 0;
                                        v173 = 0;
                                        goto LABEL_233;
                                      }
                                      v171 = 0;
                                      v173 = 0;
                                      v56 = v239;
                                      v104 = v249;
                                    }
                                    v150 = v222;
                                    goto LABEL_244;
                                  }
                                  if (v251)
                                  {
                                    v174 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v218 = *MEMORY[0x1E0D025B8];
                                    v280 = *MEMORY[0x1E0CB2D50];
                                    v72 = v231;
                                    v104 = v249;
                                    v214 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rank"));
                                    v281 = v214;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v281, &v280, 1);
                                    v213 = (void *)objc_claimAutoreleasedReturnValue();
                                    v175 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v218, 2);
                                    v16 = 0;
                                    v217 = 0;
                                    v14 = v250;
                                    *v251 = v175;
                                    v56 = v239;
                                    goto LABEL_235;
                                  }
                                  v217 = 0;
                                  v16 = 0;
                                  v104 = v249;
                                  v14 = v250;
LABEL_230:
                                  v56 = v239;
                                  v72 = v231;
                                  v150 = v222;
                                  goto LABEL_250;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v220 = v121;
                                  goto LABEL_128;
                                }
                                if (v251)
                                {
                                  v164 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v165 = *MEMORY[0x1E0D025B8];
                                  v282 = *MEMORY[0x1E0CB2D50];
                                  v104 = v249;
                                  v217 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("attributionIdentifier"));
                                  v283 = v217;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v283, &v282, 1);
                                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                                  v166 = (id)objc_msgSend(v164, "initWithDomain:code:userInfo:", v165, 2);
                                  v16 = 0;
                                  v220 = 0;
                                  *v251 = v166;
                                  v14 = v250;
                                  v19 = v237;
                                  goto LABEL_230;
                                }
                                v220 = 0;
                                v16 = 0;
                                v104 = v249;
                                v14 = v250;
                                v56 = v239;
                                v72 = v231;
LABEL_226:
                                v150 = v222;
                                goto LABEL_251;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v223 = v119;
                                goto LABEL_125;
                              }
                              if (v251)
                              {
                                v162 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v224 = *MEMORY[0x1E0D025B8];
                                v284 = *MEMORY[0x1E0CB2D50];
                                v72 = v231;
                                v104 = v249;
                                v220 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isPrimary"));
                                v285 = v220;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v285, &v284, 1);
                                v219 = (void *)objc_claimAutoreleasedReturnValue();
                                v163 = (id)objc_msgSend(v162, "initWithDomain:code:userInfo:", v224, 2);
                                v16 = 0;
                                v223 = 0;
                                v14 = v250;
                                *v251 = v163;
                                v56 = v239;
                                goto LABEL_226;
                              }
                              v223 = 0;
                              v16 = 0;
                              v104 = v249;
                              v14 = v250;
                            }
                            v56 = v239;
                            v72 = v231;
                            v150 = v222;
                            goto LABEL_252;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v229 = v112;
                            goto LABEL_116;
                          }
                          if (v75)
                          {
                            v143 = v75;
                            v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v145 = v19;
                            v146 = *MEMORY[0x1E0D025B8];
                            v290 = *MEMORY[0x1E0CB2D50];
                            v147 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contentCreationSecondsSinceReferenceDate"));
                            v291 = v147;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v291, &v290, 1);
                            v148 = objc_claimAutoreleasedReturnValue();
                            v149 = v144;
                            v150 = (void *)v147;
                            v104 = v249;
                            v151 = v146;
                            v19 = v145;
                            v227 = (void *)v148;
                            v16 = 0;
                            v229 = 0;
                            *v143 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v151, 2);
                            v14 = v250;
                            v56 = v239;
                            v72 = v231;
                            goto LABEL_254;
                          }
                          v229 = 0;
                          v16 = 0;
                          v104 = v249;
                          v14 = v250;
                        }
                        v56 = v239;
                        v72 = v231;
                        goto LABEL_255;
                      }
                    }
                    v128 = v251;
                    if (v251)
                    {
                      v129 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v130 = *MEMORY[0x1E0D025B8];
                      v296 = *MEMORY[0x1E0CB2D50];
                      v107 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("calculatedFeatures"));
                      v297 = v107;
                      v131 = (void *)MEMORY[0x1E0C99D80];
                      v132 = &v297;
                      v133 = &v296;
LABEL_140:
                      objc_msgSend(v131, "dictionaryWithObjects:forKeys:count:", v132, v133, 1);
                      v229 = (id)objc_claimAutoreleasedReturnValue();
                      v16 = 0;
                      *v128 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
LABEL_144:
                      v230 = obj;
                      v6 = v244;
                      v14 = v250;
                      v19 = v236;
                      v56 = v239;
                      v72 = v231;
                      goto LABEL_256;
                    }
LABEL_147:
                    v16 = 0;
                    v139 = obj;
                    v6 = v244;
                    v99 = v249;
                    v14 = v250;
                    v19 = v236;
                    v56 = v239;
                    v72 = v231;
                    goto LABEL_258;
                  }
                }
                else
                {
                  v78 = v72;
                }
                v232 = 0;
                goto LABEL_82;
              }
            }
          }
          v243 = v24;
          if (!v25)
            goto LABEL_35;
          v28 = v23;
          v29 = v19;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_35;
          if (v251)
          {
            v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v65 = *MEMORY[0x1E0D025B8];
            v314 = *MEMORY[0x1E0CB2D50];
            v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("applicationIdentifiers"));
            v315 = v255;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v315, &v314, 1);
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = v64;
            v28 = v23;
            v8 = v20;
            v56 = (void *)v66;
            v16 = 0;
            *v251 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v65, 2, v66);
            v14 = v250;
            v18 = v22;
            v6 = v243;
            goto LABEL_267;
          }
          v16 = 0;
          v14 = v250;
          v18 = v22;
          v6 = v243;
          v8 = v20;
LABEL_268:
          v19 = v29;

          v7 = v248;
          goto LABEL_269;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v6;
          v22 = v18;
          v23 = v19;
          goto LABEL_24;
        }
        if (v251)
        {
          v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v256 = *MEMORY[0x1E0D025B8];
          v316 = *MEMORY[0x1E0CB2D50];
          v58 = v18;
          v59 = objc_alloc(MEMORY[0x1E0CB3940]);
          v29 = v19;
          v196 = objc_opt_class();
          v60 = v59;
          v18 = v58;
          v25 = (id)objc_msgSend(v60, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v196, CFSTR("sourceBundleID"));
          v317 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v317, &v316, 1);
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = v256;
          v257 = (void *)v61;
          v63 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v62, 2);
          v28 = 0;
          v16 = 0;
          *v251 = v63;
          v14 = v250;
          v8 = v20;

          goto LABEL_268;
        }
        v16 = 0;
        v14 = v250;
        v28 = 0;
LABEL_269:

        goto LABEL_270;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v252 = v18;
        goto LABEL_19;
      }
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v318 = *MEMORY[0x1E0CB2D50];
        v32 = v18;
        v33 = objc_alloc(MEMORY[0x1E0CB3940]);
        v195 = objc_opt_class();
        v34 = v33;
        v18 = v32;
        v35 = objc_msgSend(v34, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v195, CFSTR("syndicationSecondsSinceReferenceDate"));
        v319 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v319, &v318, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v30;
        v28 = (void *)v35;
        v37 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v31, 2, v19);
        v252 = 0;
        v16 = 0;
        v14 = v250;
        *a4 = v37;
        goto LABEL_269;
      }
      v252 = 0;
      v16 = 0;
      v14 = v250;
LABEL_270:

      goto LABEL_271;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v254;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeFromString(v17));
      v250 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (a4)
    {
      v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v69 = *MEMORY[0x1E0D025B8];
      v320 = *MEMORY[0x1E0CB2D50];
      v252 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("highlightType"));
      v321 = v252;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v321, &v320, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2, v18);
      v14 = 0;
      v16 = 0;
      *a4 = v70;
      goto LABEL_270;
    }
    v14 = 0;
    v16 = 0;
LABEL_271:

    goto LABEL_272;
  }
  if (a4)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0D025B8];
    v322 = *MEMORY[0x1E0CB2D50];
    v11 = v6;
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v194 = objc_opt_class();
    v13 = v12;
    v6 = v11;
    v14 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v194, CFSTR("highlightIdentifier"));
    v323[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v323, &v322, 1);
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 2, v254);
    v8 = 0;
    v16 = 0;
    *a4 = v15;
    goto LABEL_271;
  }
  v8 = 0;
  v16 = 0;
LABEL_272:

  return v16;
}

- (id)_applicationIdentifiersJSONArray
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
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight applicationIdentifiers](self, "applicationIdentifiers", 0);
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

- (id)_calculatedFeaturesJSONArray
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
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight calculatedFeatures](self, "calculatedFeatures", 0);
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
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
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
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[23];
  _QWORD v85[25];

  v85[23] = *MEMORY[0x1E0C80C00];
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightIdentifier](self, "highlightIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightType](self, "highlightType"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasSyndicationSecondsSinceReferenceDate](self, "hasSyndicationSecondsSinceReferenceDate")|| (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight syndicationSecondsSinceReferenceDate](self, "syndicationSecondsSinceReferenceDate"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight syndicationSecondsSinceReferenceDate](self, "syndicationSecondsSinceReferenceDate");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight syndicationSecondsSinceReferenceDate](self, "syndicationSecondsSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sourceBundleID](self, "sourceBundleID");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight _applicationIdentifiersJSONArray](self, "_applicationIdentifiersJSONArray");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resourceURL](self, "resourceURL");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sender](self, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDictionary");
  v12 = objc_claimAutoreleasedReturnValue();

  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight domainIdentifier](self, "domainIdentifier");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight batchIdentifier](self, "batchIdentifier");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight _calculatedFeaturesJSONArray](self, "_calculatedFeaturesJSONArray");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientIdentifier](self, "clientIdentifier");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasContentCreationSecondsSinceReferenceDate](self, "hasContentCreationSecondsSinceReferenceDate")|| (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight contentCreationSecondsSinceReferenceDate](self, "contentCreationSecondsSinceReferenceDate"), fabs(v13) == INFINITY))
  {
    v79 = 0;
  }
  else
  {
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight contentCreationSecondsSinceReferenceDate](self, "contentCreationSecondsSinceReferenceDate");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight contentCreationSecondsSinceReferenceDate](self, "contentCreationSecondsSinceReferenceDate");
    objc_msgSend(v14, "numberWithDouble:");
    v79 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight groupPhotoPathDigest](self, "groupPhotoPathDigest");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight displayName](self, "displayName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasIsPrimary](self, "hasIsPrimary"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isPrimary](self, "isPrimary"));
    v76 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76 = 0;
  }
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight attributionIdentifier](self, "attributionIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasRank](self, "hasRank"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rank](self, "rank"));
    v74 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }
  if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasScore](self, "hasScore")
    || (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight score](self, "score"), fabs(v15) == INFINITY))
  {
    v73 = 0;
  }
  else
  {
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight score](self, "score");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight score](self, "score");
    objc_msgSend(v16, "numberWithDouble:");
    v73 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasIsConversationAutoDonating](self, "hasIsConversationAutoDonating"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isConversationAutoDonating](self, "isConversationAutoDonating"));
    v72 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v72 = 0;
  }
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight originatingDeviceId](self, "originatingDeviceId");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasRankingSecondsSinceReferenceDate](self, "hasRankingSecondsSinceReferenceDate")|| (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rankingSecondsSinceReferenceDate](self, "rankingSecondsSinceReferenceDate"), fabs(v17) == INFINITY))
  {
    v70 = 0;
  }
  else
  {
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rankingSecondsSinceReferenceDate](self, "rankingSecondsSinceReferenceDate");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rankingSecondsSinceReferenceDate](self, "rankingSecondsSinceReferenceDate");
    objc_msgSend(v18, "numberWithDouble:");
    v70 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resolvedUrl](self, "resolvedUrl");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientVariant](self, "clientVariant");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = CFSTR("highlightIdentifier");
  v20 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v20;
  v85[0] = v20;
  v84[1] = CFSTR("highlightType");
  v21 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v21;
  v85[1] = v21;
  v84[2] = CFSTR("syndicationSecondsSinceReferenceDate");
  v22 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v22;
  v85[2] = v22;
  v84[3] = CFSTR("sourceBundleID");
  v23 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v23;
  v85[3] = v23;
  v84[4] = CFSTR("applicationIdentifiers");
  v24 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v24;
  v85[4] = v24;
  v84[5] = CFSTR("resourceURL");
  v25 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v25;
  v85[5] = v25;
  v84[6] = CFSTR("sender");
  v26 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v26;
  v85[6] = v26;
  v84[7] = CFSTR("domainIdentifier");
  v27 = (uint64_t)v83;
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v85[7] = v27;
  v84[8] = CFSTR("batchIdentifier");
  v28 = (uint64_t)v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v85[8] = v28;
  v84[9] = CFSTR("calculatedFeatures");
  v29 = (uint64_t)v81;
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v29;
  v85[9] = v29;
  v84[10] = CFSTR("clientIdentifier");
  v30 = (uint64_t)v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v30;
  v85[10] = v30;
  v84[11] = CFSTR("contentCreationSecondsSinceReferenceDate");
  v31 = (uint64_t)v79;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v31;
  v85[11] = v31;
  v84[12] = CFSTR("groupPhotoPathDigest");
  v32 = (uint64_t)v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v8;
  v85[12] = v32;
  v84[13] = CFSTR("displayName");
  v33 = (uint64_t)v77;
  v34 = (void *)v32;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v12;
  v59 = (void *)v33;
  v85[13] = v33;
  v84[14] = CFSTR("isPrimary");
  v35 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v10;
  v46 = v35;
  v85[14] = v35;
  v84[15] = CFSTR("attributionIdentifier");
  v36 = v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67 = v7;
  v85[15] = v36;
  v84[16] = CFSTR("rank");
  v37 = v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v3;
  v85[16] = v37;
  v84[17] = CFSTR("score");
  v38 = v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v4;
  v85[17] = v38;
  v84[18] = CFSTR("isConversationAutoDonating");
  v39 = v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = v34;
  v50 = (void *)v27;
  v85[18] = v39;
  v84[19] = CFSTR("originatingDeviceId");
  v40 = v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v9;
  v85[19] = v40;
  v84[20] = CFSTR("rankingSecondsSinceReferenceDate");
  v42 = v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v28;
  v85[20] = v42;
  v84[21] = CFSTR("resolvedUrl");
  v43 = v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v85[21] = v43;
  v84[22] = CFSTR("clientVariant");
  v44 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v85[22] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 23, v46);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)

  if (!v69)
  if (!v70)

  if (!v71)
  if (!v72)

  if (!v73)
  if (!v74)

  if (!v75)
  if (!v76)

  if (!v77)
  if (!v78)

  if (!v79)
  if (!v80)

  if (!v81)
  if (!v82)

  if (v83)
  {
    if (v64)
      goto LABEL_104;
  }
  else
  {

    if (v64)
    {
LABEL_104:
      if (v65)
        goto LABEL_105;
      goto LABEL_113;
    }
  }

  if (v65)
  {
LABEL_105:
    if (v41)
      goto LABEL_106;
    goto LABEL_114;
  }
LABEL_113:

  if (v41)
  {
LABEL_106:
    if (v66)
      goto LABEL_107;
    goto LABEL_115;
  }
LABEL_114:

  if (v66)
  {
LABEL_107:
    if (v67)
      goto LABEL_108;
    goto LABEL_116;
  }
LABEL_115:

  if (v67)
  {
LABEL_108:
    if (v63)
      goto LABEL_109;
LABEL_117:

    if (v68)
      goto LABEL_110;
LABEL_118:

    goto LABEL_110;
  }
LABEL_116:

  if (!v63)
    goto LABEL_117;
LABEL_109:
  if (!v68)
    goto LABEL_118;
LABEL_110:

  return v58;
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
  int v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  int v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  unsigned int v87;
  double v88;
  double v89;
  double v90;
  int v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  void *v108;
  void *v109;
  void *v110;
  void *v111;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightIdentifier](self, "highlightIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightIdentifier](self, "highlightIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "highlightIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_93;
    }
    v13 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight highlightType](self, "highlightType");
    if (v13 != objc_msgSend(v5, "highlightType"))
      goto LABEL_93;
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasSyndicationSecondsSinceReferenceDate](self, "hasSyndicationSecondsSinceReferenceDate")|| objc_msgSend(v5, "hasSyndicationSecondsSinceReferenceDate"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasSyndicationSecondsSinceReferenceDate](self, "hasSyndicationSecondsSinceReferenceDate"))goto LABEL_93;
      if (!objc_msgSend(v5, "hasSyndicationSecondsSinceReferenceDate"))
        goto LABEL_93;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight syndicationSecondsSinceReferenceDate](self, "syndicationSecondsSinceReferenceDate");
      v15 = v14;
      objc_msgSend(v5, "syndicationSecondsSinceReferenceDate");
      if (v15 != v16)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sourceBundleID](self, "sourceBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleID");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v18)
    {

    }
    else
    {
      v19 = (void *)v18;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sourceBundleID](self, "sourceBundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (!v22)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight applicationIdentifiers](self, "applicationIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIdentifiers");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 == (void *)v24)
    {

    }
    else
    {
      v25 = (void *)v24;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight applicationIdentifiers](self, "applicationIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "applicationIdentifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resourceURL](self, "resourceURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceURL");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v29 == (void *)v30)
    {

    }
    else
    {
      v31 = (void *)v30;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resourceURL](self, "resourceURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resourceURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if (!v34)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sender](self, "sender");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sender");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v35 == (void *)v36)
    {

    }
    else
    {
      v37 = (void *)v36;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight sender](self, "sender");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sender");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqual:", v39);

      if (!v40)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight domainIdentifier](self, "domainIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainIdentifier");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v41 == (void *)v42)
    {

    }
    else
    {
      v43 = (void *)v42;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight domainIdentifier](self, "domainIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domainIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isEqual:", v45);

      if (!v46)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight batchIdentifier](self, "batchIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "batchIdentifier");
    v48 = objc_claimAutoreleasedReturnValue();
    if (v47 == (void *)v48)
    {

    }
    else
    {
      v49 = (void *)v48;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight batchIdentifier](self, "batchIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "batchIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v50, "isEqual:", v51);

      if (!v52)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight calculatedFeatures](self, "calculatedFeatures");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calculatedFeatures");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v53 == (void *)v54)
    {

    }
    else
    {
      v55 = (void *)v54;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight calculatedFeatures](self, "calculatedFeatures");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calculatedFeatures");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v56, "isEqual:", v57);

      if (!v58)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientIdentifier](self, "clientIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v60 = objc_claimAutoreleasedReturnValue();
    if (v59 == (void *)v60)
    {

    }
    else
    {
      v61 = (void *)v60;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientIdentifier](self, "clientIdentifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v62, "isEqual:", v63);

      if (!v64)
        goto LABEL_93;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasContentCreationSecondsSinceReferenceDate](self, "hasContentCreationSecondsSinceReferenceDate")|| objc_msgSend(v5, "hasContentCreationSecondsSinceReferenceDate"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasContentCreationSecondsSinceReferenceDate](self, "hasContentCreationSecondsSinceReferenceDate"))goto LABEL_93;
      if (!objc_msgSend(v5, "hasContentCreationSecondsSinceReferenceDate"))
        goto LABEL_93;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight contentCreationSecondsSinceReferenceDate](self, "contentCreationSecondsSinceReferenceDate");
      v66 = v65;
      objc_msgSend(v5, "contentCreationSecondsSinceReferenceDate");
      if (v66 != v67)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight groupPhotoPathDigest](self, "groupPhotoPathDigest");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupPhotoPathDigest");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v68 == (void *)v69)
    {

    }
    else
    {
      v70 = (void *)v69;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight groupPhotoPathDigest](self, "groupPhotoPathDigest");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupPhotoPathDigest");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v71, "isEqual:", v72);

      if (!v73)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight displayName](self, "displayName");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v75 = objc_claimAutoreleasedReturnValue();
    if (v74 == (void *)v75)
    {

    }
    else
    {
      v76 = (void *)v75;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight displayName](self, "displayName");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v77, "isEqual:", v78);

      if (!v79)
        goto LABEL_93;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasIsPrimary](self, "hasIsPrimary")
      || objc_msgSend(v5, "hasIsPrimary"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasIsPrimary](self, "hasIsPrimary"))
        goto LABEL_93;
      if (!objc_msgSend(v5, "hasIsPrimary"))
        goto LABEL_93;
      v80 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isPrimary](self, "isPrimary");
      if (v80 != objc_msgSend(v5, "isPrimary"))
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight attributionIdentifier](self, "attributionIdentifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributionIdentifier");
    v82 = objc_claimAutoreleasedReturnValue();
    if (v81 == (void *)v82)
    {

    }
    else
    {
      v83 = (void *)v82;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight attributionIdentifier](self, "attributionIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributionIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v84, "isEqual:", v85);

      if (!v86)
        goto LABEL_93;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasRank](self, "hasRank")
      || objc_msgSend(v5, "hasRank"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasRank](self, "hasRank"))
        goto LABEL_93;
      if (!objc_msgSend(v5, "hasRank"))
        goto LABEL_93;
      v87 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rank](self, "rank");
      if (v87 != objc_msgSend(v5, "rank"))
        goto LABEL_93;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasScore](self, "hasScore")
      || objc_msgSend(v5, "hasScore"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasScore](self, "hasScore"))
        goto LABEL_93;
      if (!objc_msgSend(v5, "hasScore"))
        goto LABEL_93;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight score](self, "score");
      v89 = v88;
      objc_msgSend(v5, "score");
      if (v89 != v90)
        goto LABEL_93;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasIsConversationAutoDonating](self, "hasIsConversationAutoDonating")|| objc_msgSend(v5, "hasIsConversationAutoDonating"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasIsConversationAutoDonating](self, "hasIsConversationAutoDonating"))goto LABEL_93;
      if (!objc_msgSend(v5, "hasIsConversationAutoDonating"))
        goto LABEL_93;
      v91 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight isConversationAutoDonating](self, "isConversationAutoDonating");
      if (v91 != objc_msgSend(v5, "isConversationAutoDonating"))
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight originatingDeviceId](self, "originatingDeviceId");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originatingDeviceId");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v92 == (void *)v93)
    {

    }
    else
    {
      v94 = (void *)v93;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight originatingDeviceId](self, "originatingDeviceId");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originatingDeviceId");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v95, "isEqual:", v96);

      if (!v97)
        goto LABEL_93;
    }
    if (-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasRankingSecondsSinceReferenceDate](self, "hasRankingSecondsSinceReferenceDate")|| objc_msgSend(v5, "hasRankingSecondsSinceReferenceDate"))
    {
      if (!-[BMMessagesSharedWithYouFeedbackRankableSocialHighlight hasRankingSecondsSinceReferenceDate](self, "hasRankingSecondsSinceReferenceDate"))goto LABEL_93;
      if (!objc_msgSend(v5, "hasRankingSecondsSinceReferenceDate"))
        goto LABEL_93;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight rankingSecondsSinceReferenceDate](self, "rankingSecondsSinceReferenceDate");
      v99 = v98;
      objc_msgSend(v5, "rankingSecondsSinceReferenceDate");
      if (v99 != v100)
        goto LABEL_93;
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resolvedUrl](self, "resolvedUrl");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedUrl");
    v102 = objc_claimAutoreleasedReturnValue();
    if (v101 == (void *)v102)
    {

    }
    else
    {
      v103 = (void *)v102;
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight resolvedUrl](self, "resolvedUrl");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resolvedUrl");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v104, "isEqual:", v105);

      if (!v106)
      {
LABEL_93:
        v12 = 0;
LABEL_94:

        goto LABEL_95;
      }
    }
    -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientVariant](self, "clientVariant");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientVariant");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (v108 == v109)
    {
      v12 = 1;
    }
    else
    {
      -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight clientVariant](self, "clientVariant");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientVariant");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v110, "isEqual:", v111);

    }
    goto LABEL_94;
  }
  v12 = 0;
LABEL_95:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (int)highlightType
{
  return self->_highlightType;
}

- (double)syndicationSecondsSinceReferenceDate
{
  return self->_syndicationSecondsSinceReferenceDate;
}

- (BOOL)hasSyndicationSecondsSinceReferenceDate
{
  return self->_hasSyndicationSecondsSinceReferenceDate;
}

- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasSyndicationSecondsSinceReferenceDate = a3;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (NSString)resourceURL
{
  return self->_resourceURL;
}

- (BMMessagesSharedWithYouFeedbackRankableSocialHighlightContact)sender
{
  return self->_sender;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (NSArray)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (double)contentCreationSecondsSinceReferenceDate
{
  return self->_contentCreationSecondsSinceReferenceDate;
}

- (BOOL)hasContentCreationSecondsSinceReferenceDate
{
  return self->_hasContentCreationSecondsSinceReferenceDate;
}

- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasContentCreationSecondsSinceReferenceDate = a3;
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)hasIsPrimary
{
  return self->_hasIsPrimary;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  self->_hasIsPrimary = a3;
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (unsigned)rank
{
  return self->_rank;
}

- (BOOL)hasRank
{
  return self->_hasRank;
}

- (void)setHasRank:(BOOL)a3
{
  self->_hasRank = a3;
}

- (double)score
{
  return self->_score;
}

- (BOOL)hasScore
{
  return self->_hasScore;
}

- (void)setHasScore:(BOOL)a3
{
  self->_hasScore = a3;
}

- (BOOL)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (BOOL)hasIsConversationAutoDonating
{
  return self->_hasIsConversationAutoDonating;
}

- (void)setHasIsConversationAutoDonating:(BOOL)a3
{
  self->_hasIsConversationAutoDonating = a3;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (double)rankingSecondsSinceReferenceDate
{
  return self->_rankingSecondsSinceReferenceDate;
}

- (BOOL)hasRankingSecondsSinceReferenceDate
{
  return self->_hasRankingSecondsSinceReferenceDate;
}

- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasRankingSecondsSinceReferenceDate = a3;
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
}

+ (unsigned)latestDataVersion
{
  return 4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 4)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMMessagesSharedWithYouFeedbackRankableSocialHighlight initByReadFrom:]([BMMessagesSharedWithYouFeedbackRankableSocialHighlight alloc], "initByReadFrom:", v6);
    v7[7] = 4;

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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[25];

  v27[23] = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("highlightIdentifier"), 2, 0, 1, 13, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("highlightType"), 0, 0, 2, 4, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("syndicationSecondsSinceReferenceDate"), 1, 0, 3, 0, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceBundleID"), 2, 0, 4, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("applicationIdentifiers_json"), 5, 1, &__block_literal_global_249_72560);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resourceURL"), 2, 0, 6, 13, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("sender_json"), 5, 1, &__block_literal_global_250_72561);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domainIdentifier"), 2, 0, 8, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batchIdentifier"), 2, 0, 9, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("calculatedFeatures_json"), 5, 1, &__block_literal_global_251_72562);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientIdentifier"), 2, 0, 11, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentCreationSecondsSinceReferenceDate"), 1, 0, 12, 0, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("groupPhotoPathDigest"), 2, 0, 13, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("displayName"), 2, 0, 14, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPrimary"), 0, 0, 15, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("attributionIdentifier"), 2, 0, 16, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rank"), 0, 0, 17, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("score"), 1, 0, 18, 0, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isConversationAutoDonating"), 0, 0, 19, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("originatingDeviceId"), 2, 0, 20, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rankingSecondsSinceReferenceDate"), 1, 0, 21, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resolvedUrl"), 2, 0, 22, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientVariant"), 2, 0, 23, 13, 0);
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v24;
  v27[3] = v23;
  v27[4] = v22;
  v27[5] = v21;
  v27[6] = v20;
  v27[7] = v19;
  v27[8] = v18;
  v27[9] = v17;
  v27[10] = v16;
  v27[11] = v15;
  v27[12] = v14;
  v27[13] = v2;
  v27[14] = v3;
  v27[15] = v4;
  v27[16] = v13;
  v27[17] = v5;
  v27[18] = v12;
  v27[19] = v6;
  v27[20] = v11;
  v27[21] = v7;
  v27[22] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 23);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FA80;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[25];

  v27[23] = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("highlightIdentifier"), 1, 13, 0);
  v27[0] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("highlightType"), 2, 4, 0);
  v27[1] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("syndicationSecondsSinceReferenceDate"), 3, 0, 0);
  v27[2] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceBundleID"), 4, 13, 0);
  v27[3] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("applicationIdentifiers"), 5, 13, 0);
  v27[4] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resourceURL"), 6, 13, 0);
  v27[5] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sender"), 7, 14, objc_opt_class());
  v27[6] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domainIdentifier"), 8, 13, 0);
  v27[7] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batchIdentifier"), 9, 13, 0);
  v27[8] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("calculatedFeatures"), 10, 14, objc_opt_class());
  v27[9] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientIdentifier"), 11, 13, 0);
  v27[10] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentCreationSecondsSinceReferenceDate"), 12, 0, 0);
  v27[11] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("groupPhotoPathDigest"), 13, 13, 0);
  v27[12] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("displayName"), 14, 13, 0);
  v27[13] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPrimary"), 15, 12, 0);
  v27[14] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attributionIdentifier"), 16, 13, 0);
  v27[15] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rank"), 17, 4, 0);
  v27[16] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("score"), 18, 0, 0);
  v27[17] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isConversationAutoDonating"), 19, 12, 0);
  v27[18] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("originatingDeviceId"), 20, 13, 0);
  v27[19] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rankingSecondsSinceReferenceDate"), 21, 0, 0);
  v27[20] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resolvedUrl"), 22, 13, 0);
  v27[21] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientVariant"), 23, 13, 0);
  v27[22] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __65__BMMessagesSharedWithYouFeedbackRankableSocialHighlight_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_calculatedFeaturesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __65__BMMessagesSharedWithYouFeedbackRankableSocialHighlight_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__BMMessagesSharedWithYouFeedbackRankableSocialHighlight_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_applicationIdentifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
