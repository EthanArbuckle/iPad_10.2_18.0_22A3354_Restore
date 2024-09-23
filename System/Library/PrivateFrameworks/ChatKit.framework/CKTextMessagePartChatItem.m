@implementation CKTextMessagePartChatItem

- (id)loadTranscriptText
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = -[CKTextMessagePartChatItem bigEmojiStyle](self, "bigEmojiStyle");
  if ((unint64_t)(v3 - 1) < 3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptBigEmojiColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;

    goto LABEL_7;
  }
  if (!v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "balloonTextColorInPrintingPathForColorType:", -[CKMessagePartChatItem color](self, "color"));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  if (-[CKMessagePartChatItem isCorrupt](self, "isCorrupt"))
    -[CKTextMessagePartChatItem _fallbackCorruptMessageTextWithTextColor:](self, "_fallbackCorruptMessageTextWithTextColor:", v7);
  else
    -[CKTextMessagePartChatItem _attributedTextWithTextColor:](self, "_attributedTextWithTextColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)showMoneyResults
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v3 = (void *)MEMORY[0x1E0D397A8];
  -[CKMessagePartChatItem sender](self, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isCNContactAKnownContact:", v5);

  if (CKShouldShowSURF())
  {
    -[CKMessagePartChatItem message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6 & ~objc_msgSend(v8, "__ck_isSMS");

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (id)_fallbackCorruptMessageTextWithTextColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3778]);
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CORRUPT_MESSAGE_FALLBACK_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, 0);

  v9 = objc_msgSend(v8, "length");
  v10 = *MEMORY[0x1E0DC1138];
  -[CKTextMessagePartChatItem bodyTextFont](self, "bodyTextFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:value:range:", v10, v11, 0, v9);

  if (v4)
  {
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v4, 0, v9);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "_fallbackCorruptMessageTextWithTextColor: textColor is nil.", v14, 2u);
    }

  }
  return v8;
}

- (id)_attributedTextWithTextColor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  id *v30;
  void *v31;
  id *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v39;
  void *v40;
  id *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  double v76;
  uint64_t v77;
  char v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  _QWORD v116[5];
  id v117;
  _QWORD v118[4];
  id v119;
  _QWORD v120[4];
  id v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  _QWORD v130[4];
  id v131;
  _QWORD v132[5];
  id v133;
  id v134;
  _QWORD aBlock[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[6];
  uint8_t v140[8];
  uint8_t *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  _QWORD v146[4];
  id v147;
  CKTextMessagePartChatItem *v148;
  uint64_t *v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  char v158;
  uint8_t buf[8];
  uint8_t *v160;
  uint64_t v161;
  uint64_t v162;
  _QWORD v163[6];
  _QWORD v164[8];

  v164[6] = *MEMORY[0x1E0C80C00];
  v113 = a3;
  -[CKTextMessagePartChatItem subject](self, "subject");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  LODWORD(v6) = v5 != 0;
  if (!v5)
  {
    v114 = 0;
    goto LABEL_5;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v115, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "initWithString:", v8);

  v114 = v6;
  if (v6)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "balloonSubjectFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v9, 0, objc_msgSend(v6, "length"));

    LODWORD(v6) = 1;
LABEL_5:

    goto LABEL_7;
  }
  v114 = 0;
LABEL_7:
  v155 = 0;
  v156 = &v155;
  v157 = 0x2020000000;
  v158 = 0;
  v10 = -[CKTextMessagePartChatItem containsHyperlink](self, "containsHyperlink");
  v151 = 0;
  v152 = &v151;
  v153 = 0x2020000000;
  v154 = 0;
  -[CKTextMessagePartChatItem text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = (int)v6;
  if (objc_msgSend(v12, "length"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v11, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

  }
  else
  {
    v15 = 0;
  }

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[CKTextMessagePartChatItem bigEmojiStyle](self, "bigEmojiStyle"))
  {
    case 0:
      -[CKTextMessagePartChatItem bodyTextFont](self, "bodyTextFont");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v111, "singleBigEmojiFont");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v111, "multipleBigEmojiFont");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(v111, "singleBigAssetFont");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v112 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isExpressiveTextEnabled");

  if (v17)
  {
    v18 = objc_msgSend(v15, "length");
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v112, 0, v18);
  }
  if (v15)
  {
    v19 = objc_msgSend(v15, "length");
    if (!v10)
    {
LABEL_49:
      objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2;
      aBlock[3] = &unk_1E2750760;
      v48 = v47;
      v136 = v48;
      v49 = _Block_copy(aBlock);
      v132[0] = MEMORY[0x1E0C809B0];
      v132[1] = 3221225472;
      v132[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3;
      v132[3] = &unk_1E27508A0;
      v132[4] = self;
      v50 = v15;
      v133 = v50;
      v134 = v112;
      objc_msgSend(v11, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:", v49, v132);
      if (-[CKTextMessagePartChatItem allowsMentions](self, "allowsMentions"))
      {
        v51 = *MEMORY[0x1E0D381F0];
        v130[0] = MEMORY[0x1E0C809B0];
        v130[1] = 3221225472;
        v130[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_87;
        v130[3] = &unk_1E274EF20;
        v131 = v50;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v51, 0, v19, 0, v130);

      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isExpressiveTextEnabled");

      if (v53)
      {
        v54 = *MEMORY[0x1E0D393F0];
        v128[0] = MEMORY[0x1E0C809B0];
        v128[1] = 3221225472;
        v128[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2_88;
        v128[3] = &unk_1E274EF20;
        v55 = v50;
        v129 = v55;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v54, 0, v19, 0, v128);
        v56 = *MEMORY[0x1E0D39428];
        v126[0] = MEMORY[0x1E0C809B0];
        v126[1] = 3221225472;
        v126[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_89;
        v126[3] = &unk_1E274EF20;
        v57 = v55;
        v127 = v57;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v56, 0, v19, 0, v126);
        v58 = *MEMORY[0x1E0D39440];
        v124[0] = MEMORY[0x1E0C809B0];
        v124[1] = 3221225472;
        v124[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_4;
        v124[3] = &unk_1E274EF20;
        v59 = v57;
        v125 = v59;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v58, 0, v19, 0, v124);
        v60 = *MEMORY[0x1E0D393E8];
        v122[0] = MEMORY[0x1E0C809B0];
        v122[1] = 3221225472;
        v122[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_5;
        v122[3] = &unk_1E274EF20;
        v61 = v59;
        v123 = v61;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v60, 0, v19, 0, v122);
        v62 = *MEMORY[0x1E0D39420];
        v120[0] = MEMORY[0x1E0C809B0];
        v120[1] = 3221225472;
        v120[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_6;
        v120[3] = &unk_1E274EF20;
        v121 = v61;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v62, 0, v19, 0, v120);

        v63 = v129;
      }
      else
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        switch(-[CKTextMessagePartChatItem bigEmojiStyle](self, "bigEmojiStyle"))
        {
          case 0:
            -[CKTextMessagePartChatItem bodyTextFont](self, "bodyTextFont");
            v64 = objc_claimAutoreleasedReturnValue();
            goto LABEL_59;
          case 1:
            objc_msgSend(v63, "singleBigEmojiFont");
            v64 = objc_claimAutoreleasedReturnValue();
            goto LABEL_59;
          case 2:
            objc_msgSend(v63, "multipleBigEmojiFont");
            v64 = objc_claimAutoreleasedReturnValue();
            goto LABEL_59;
          case 3:
            objc_msgSend(v63, "singleBigAssetFont");
            v64 = objc_claimAutoreleasedReturnValue();
LABEL_59:
            v65 = (void *)v64;
            break;
          default:
            v65 = 0;
            break;
        }
        objc_msgSend(v50, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v65, 0, v19);

      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "stewieEnabled");

      if (v67)
      {
        -[CKMessagePartChatItem message](self, "message");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "subject");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "isStewie");

        if (v70)
        {
          v71 = *MEMORY[0x1E0D37420];
          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = 3221225472;
          v118[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_7;
          v118[3] = &unk_1E274EF20;
          v119 = v50;
          objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v71, 0, v19, 0, v118);

        }
      }

      goto LABEL_65;
    }
    v146[0] = MEMORY[0x1E0C809B0];
    v146[1] = 3221225472;
    v146[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke;
    v146[3] = &unk_1E2750850;
    v149 = &v155;
    v20 = v15;
    v147 = v20;
    v148 = self;
    v150 = &v151;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("DDResultAttributeName"), 0, v19, 0, v146);
    *(_QWORD *)v140 = 0;
    v141 = v140;
    v142 = 0x3032000000;
    v143 = __Block_byref_object_copy__33;
    v144 = __Block_byref_object_dispose__33;
    v145 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v145 = (id)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0D36720];
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_71;
    v139[3] = &unk_1E2750878;
    v139[4] = &v155;
    v139[5] = v140;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v21, 0, v19, 0, v139);
    if (!*((_BYTE *)v156 + 24))
    {
LABEL_48:
      v46 = *MEMORY[0x1E0D365F0];
      v137[0] = MEMORY[0x1E0C809B0];
      v137[1] = 3221225472;
      v137[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_78;
      v137[3] = &unk_1E274EF20;
      v138 = v20;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v46, 0, v19, 0, v137);

      _Block_object_dispose(v140, 8);
      goto LABEL_49;
    }
    -[CKMessagePartChatItem message](self, "message");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "sender");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ID");
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKTextMessagePartChatItem _time](self, "_time");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "guid");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v107 = (void *)v23;
    if (v23 && v24 && *((_QWORD *)v141 + 5))
    {
      v26 = (void *)MEMORY[0x1E0C99E98];
      v106 = (void *)v24;
      objc_msgSend(MEMORY[0x1E0D397C0], "referenceURLForMessageGUID:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URLWithString:", v27);
      v105 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D397C0], "metadataDictionaryForMessageID:senderID:date:", v106, v108, v107);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v160 = buf;
      v161 = 0x2020000000;
      v28 = (id *)getkDataDetectorsReferenceDateKeySymbolLoc_ptr;
      v162 = getkDataDetectorsReferenceDateKeySymbolLoc_ptr;
      if (!getkDataDetectorsReferenceDateKeySymbolLoc_ptr)
      {
        v29 = (void *)DataDetectorsUILibrary();
        v28 = (id *)dlsym(v29, "kDataDetectorsReferenceDateKey");
        *((_QWORD *)v160 + 3) = v28;
        getkDataDetectorsReferenceDateKeySymbolLoc_ptr = (uint64_t)v28;
      }
      _Block_object_dispose(buf, 8);
      if (v28)
      {
        v102 = *v28;
        v163[0] = v102;
        v164[0] = v107;
        *(_QWORD *)buf = 0;
        v160 = buf;
        v161 = 0x2020000000;
        v30 = (id *)getkDataDetectorsSpecialURLKeySymbolLoc_ptr;
        v162 = getkDataDetectorsSpecialURLKeySymbolLoc_ptr;
        if (!getkDataDetectorsSpecialURLKeySymbolLoc_ptr)
        {
          v31 = (void *)DataDetectorsUILibrary();
          v30 = (id *)dlsym(v31, "kDataDetectorsSpecialURLKey");
          *((_QWORD *)v160 + 3) = v30;
          getkDataDetectorsSpecialURLKeySymbolLoc_ptr = (uint64_t)v30;
        }
        _Block_object_dispose(buf, 8);
        if (v30)
        {
          v101 = *v30;
          v163[1] = v101;
          v164[1] = v105;
          *(_QWORD *)buf = 0;
          v160 = buf;
          v161 = 0x2020000000;
          v32 = (id *)getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr;
          v162 = getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr;
          if (!getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr)
          {
            v33 = (void *)DataDetectorsUILibrary();
            v32 = (id *)dlsym(v33, "kDataDetectorsCoreSpotlightUniqueIdentifier");
            *((_QWORD *)v160 + 3) = v32;
            getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr = (uint64_t)v32;
          }
          _Block_object_dispose(buf, 8);
          if (v32)
          {
            v100 = *v32;
            v163[2] = v100;
            v164[2] = v106;
            *(_QWORD *)buf = 0;
            v160 = buf;
            v161 = 0x2020000000;
            v34 = (id *)getkDataDetectorsIncludeMoneySymbolLoc_ptr;
            v162 = getkDataDetectorsIncludeMoneySymbolLoc_ptr;
            if (!getkDataDetectorsIncludeMoneySymbolLoc_ptr)
            {
              v35 = (void *)DataDetectorsUILibrary();
              v34 = (id *)dlsym(v35, "kDataDetectorsIncludeMoney");
              *((_QWORD *)v160 + 3) = v34;
              getkDataDetectorsIncludeMoneySymbolLoc_ptr = (uint64_t)v34;
            }
            _Block_object_dispose(buf, 8);
            if (v34)
            {
              v36 = *v34;
              v163[3] = v36;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v152 + 24));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v164[3] = v103;
              *(_QWORD *)buf = 0;
              v160 = buf;
              v161 = 0x2020000000;
              v37 = (id *)getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr;
              v162 = getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr;
              if (!getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr)
              {
                v38 = (void *)DataDetectorsUILibrary();
                v37 = (id *)dlsym(v38, "kDataDetectorsCustomActionRangesKey");
                *((_QWORD *)v160 + 3) = v37;
                getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr = (uint64_t)v37;
              }
              _Block_object_dispose(buf, 8);
              if (v37)
              {
                v39 = *v37;
                v163[4] = v39;
                v40 = (void *)objc_msgSend(*((id *)v141 + 5), "copy");
                v164[4] = v40;
                *(_QWORD *)buf = 0;
                v160 = buf;
                v161 = 0x2020000000;
                v41 = (id *)getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr;
                v162 = getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr;
                if (!getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr)
                {
                  v42 = (void *)DataDetectorsUILibrary();
                  v41 = (id *)dlsym(v42, "kDataDetectorsCoreRecentsMetadataDictionaryKey");
                  *((_QWORD *)v160 + 3) = v41;
                  getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr = (uint64_t)v41;
                }
                _Block_object_dispose(buf, 8);
                if (v41)
                {
                  v43 = *v41;
                  v163[5] = v43;
                  v164[5] = v104;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 6);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v20, "dd_makeLinksForResultsInAttributesOfType:context:", -1, v44);
                  v25 = v106;
LABEL_47:

                  goto LABEL_48;
                }
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsCoreRecentsMetadataDictionaryKey(void)");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, CFSTR("CKTextMessagePartChatItem.m"), 74, CFSTR("%s"), dlerror());

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsCustomActionRangesKey(void)");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, CFSTR("CKTextMessagePartChatItem.m"), 72, CFSTR("%s"), dlerror());

              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsIncludeMoney(void)");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "handleFailureInFunction:file:lineNumber:description:", v95, CFSTR("CKTextMessagePartChatItem.m"), 70, CFSTR("%s"), dlerror());

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsCoreSpotlightUniqueIdentifier(void)");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "handleFailureInFunction:file:lineNumber:description:", v93, CFSTR("CKTextMessagePartChatItem.m"), 68, CFSTR("%s"), dlerror());

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsSpecialURLKey(void)");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "handleFailureInFunction:file:lineNumber:description:", v91, CFSTR("CKTextMessagePartChatItem.m"), 66, CFSTR("%s"), dlerror());

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDataDetectorsReferenceDateKey(void)");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "handleFailureInFunction:file:lineNumber:description:", v89, CFSTR("CKTextMessagePartChatItem.m"), 64, CFSTR("%s"), dlerror());

      }
      __break(1u);
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v45, OS_LOG_TYPE_INFO, "Transcript cal data detectors failed to get time off IMMessage. Please file a bug on Messages.", buf, 2u);
      }

    }
    goto LABEL_47;
  }
LABEL_65:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "hyphenatesTextContent");

  if (v73)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v74, "mutableCopy");

    LODWORD(v76) = 1.0;
    objc_msgSend(v75, "setHyphenationFactor:", v76);
    v77 = objc_msgSend(v15, "length");
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v75, 0, v77);

  }
  v78 = v110 ^ 1;
  if (!v15)
    v78 = 1;
  if ((v78 & 1) != 0)
  {
    v82 = v114;
    if (!v110)
      v82 = v15;
    v79 = v82;
  }
  else
  {
    v79 = v114;
    objc_msgSend(v79, "replaceCharactersInRange:withString:", objc_msgSend(v79, "length"), 0, CFSTR("\n"));
    if (*((_BYTE *)v156 + 24))
    {
      objc_msgSend(v79, "dd_attributedStringByAppendingAttributedString:", v15);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "mutableCopy");

      v79 = (id)v81;
    }
    else
    {
      objc_msgSend(v79, "appendAttributedString:", v15);
    }
  }
  if (v113)
  {
    v83 = objc_msgSend(v79, "length");
    objc_msgSend(v79, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v113, 0, v83);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v140 = 0;
      _os_log_impl(&dword_18DFCD000, v84, OS_LOG_TYPE_INFO, "_attributedTextWithTextColor: textColor is nil.", v140, 2u);
    }

  }
  if (-[CKTextMessagePartChatItem allowsMentions](self, "allowsMentions"))
  {
    v85 = objc_msgSend(v79, "length");
    v86 = *MEMORY[0x1E0D381F0];
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_93;
    v116[3] = &unk_1E27508C8;
    v116[4] = self;
    v117 = v79;
    objc_msgSend(v117, "enumerateAttribute:inRange:options:usingBlock:", v86, 0, v85, 0, v116);

  }
  _Block_object_dispose(&v151, 8);
  _Block_object_dispose(&v155, 8);

  return v79;
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char v8;
  void *v9;
  int v10;
  int v11;
  void *v12;

  v7 = a2;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v12 = v7;
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("DDResultAttributeName"), v7, a3, a4);
    v8 = objc_opt_respondsToSelector();
    v7 = v12;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v12, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Money"));

      v7 = v12;
      if (v10)
      {
        v11 = objc_msgSend(*(id *)(a1 + 40), "showMoneyResults");
        v7 = v12;
        if (v11)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }
    }
  }

}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_71(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

uint64_t __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1160], a2, a3, a4);
  return result;
}

uint64_t __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferForGUID:", a2);
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v7 = a2;
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "adaptiveImageGlyphForTransferGUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1[5], "addAttribute:value:range:", *MEMORY[0x1E0DC10F0], v9, a3, a4);
  }
  else if (objc_msgSend(MEMORY[0x1E0D39848], "genmojiFileTransferShouldDisplayAsPermanentlyFailed:", v7))
  {
    objc_msgSend(a1[5], "attributesAtIndex:effectiveRange:", a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\uFFFD"), v10);
    objc_msgSend(a1[5], "replaceCharactersInRange:withAttributedString:", a3, a4, v11);
    objc_msgSend(a1[6], "ck_lastResortFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(a1[5], "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v12, a3, a4);

  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_cold_1(v13);

  }
}

uint64_t __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_87(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E0D381F0], a2, a3, a4);
  return result;
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2_88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "ck_applyTextEffectType:range:", objc_msgSend(v7, "integerValue"), a3, a4);
  }

}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_89(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 8, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 4, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 1, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 2, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *MEMORY[0x1E0DC1138];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "balloonSubjectFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAttribute:value:range:", v7, v8, a3, a4);

  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_93(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  if (v7)
  {
    v14 = v7;
    if ((objc_msgSend(*(id *)(a1 + 32), "isFromMe") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 32), "mentionsMe:", v14))
    {
      v8 = *MEMORY[0x1E0DC1140];
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "meMentionsTextColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAttribute:value:range:", v8, v10, a3, a4);

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bodyTextFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mentionTranscriptFontFromOrignalFont:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v13, a3, a4);
    v7 = v14;
  }

}

- (NSOrderedSet)transferGUIDsInMessagePartText
{
  void *v2;
  void *v3;
  void *v4;

  -[CKTextMessagePartChatItem text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "__im_transferGUIDsInAttributedString");
  else
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

- (id)mediaObjectForTransferGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaObjectWithTransferGUID:imMessage:chatContext:", v4, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "time");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "setTime:", v10);
    v11 = v9;
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKTextMessagePartChatItem mediaObjectForTransferGUID:].cold.1((uint64_t)v4, v10, v12, v13, v14, v15, v16, v17);
  }

  return v9;
}

- (id)mediaObjectsInMessagePartText
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CKTextMessagePartChatItem transferGUIDsInMessagePartText](self, "transferGUIDsInMessagePartText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 138412290;
    v16 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[CKTextMessagePartChatItem mediaObjectForTransferGUID:](self, "mediaObjectForTransferGUID:", v11, v16, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          IMLogHandleForCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_error_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_ERROR, "No media object for transfer guid %@ found in message part text", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (NSArray)emojiImageMediaObjectsInMessagePartText
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CKTextMessagePartChatItem mediaObjectsInMessagePartText](self, "mediaObjectsInMessagePartText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (id)adaptiveImageGlyphForTransferGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[CKTextMessagePartChatItem mediaObjectForTransferGUID:](self, "mediaObjectForTransferGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "adaptiveImageGlyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKTextMessagePartChatItem adaptiveImageGlyphForTransferGUID:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v7 = 0;
  }

  return v7;
}

- (BOOL)mentionsMe:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0D35738];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "metionedHandleMatchesMeCard:", v4);

  return v6;
}

- (BOOL)allowsMentions
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPriusEnabled");

  if (!v4)
  {
    -[CKMessagePartChatItem message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__ck_service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "__ck_isSMS") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isBusiness") & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "platformSupportsMentioning");

      }
    }
    goto LABEL_11;
  }
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isBusiness") & 1) == 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "platformSupportsMentioning");
LABEL_11:

    goto LABEL_12;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (id)bodyTextFont
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonTextFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meMentionsTextColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meMentionTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isShowingEditHistory
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingEditHistory");

  return v3;
}

- (id)time
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[CKTextMessagePartChatItem isShowingEditHistory](self, "isShowingEditHistory"))
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastEditDateForMessagePart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTextMessagePartChatItem;
    -[CKMessagePartChatItem time](&v6, sel_time);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (UIEdgeInsets)stickerReactionInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonMaskAlignmentRectInsetsWithTailShape:", 0);
  v4 = v3;
  v6 = v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stickerReactionTextBalloonAdditionalVerticalPadding");
  v9 = v8;

  v10 = -(v4 + v9);
  v11 = -(v6 + v9);
  v12 = 0.0;
  v13 = 0.0;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (BOOL)shouldUseBigEmojiStyleBalloonViewClass
{
  return (unint64_t)(-[CKTextMessagePartChatItem bigEmojiStyle](self, "bigEmojiStyle") - 1) < 3;
}

- (Class)balloonViewClass
{
  if (!-[CKMessagePartChatItem isCorrupt](self, "isCorrupt")
    && !-[CKTextMessagePartChatItem shouldUseBigEmojiStyleBalloonViewClass](self, "shouldUseBigEmojiStyleBalloonViewClass"))
  {
    -[CKTextMessagePartChatItem containsHyperlink](self, "containsHyperlink");
  }
  return (Class)(id)objc_opt_class();
}

- (Class)impactBalloonViewClass
{
  void *v3;
  objc_super v5;

  if (-[CKTextMessagePartChatItem shouldUseBigEmojiStyleBalloonViewClass](self, "shouldUseBigEmojiStyleBalloonViewClass")|| -[CKTextMessagePartChatItem containsHyperlink](self, "containsHyperlink"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTextMessagePartChatItem;
    -[CKBalloonChatItem impactBalloonViewClass](&v5, sel_impactBalloonViewClass);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (id)dragItemProvider
{
  NSItemProvider *dragItemProvider;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  __objc2_class **v8;
  NSObject *v9;
  void *v10;
  NSItemProvider *v11;
  NSItemProvider *v12;
  uint8_t v14[8];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  dragItemProvider = self->_dragItemProvider;
  if (!dragItemProvider)
  {
    -[CKChatItem transcriptText](self, "transcriptText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
      v6 = objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v7 = -[NSObject length](v6, "length");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__CKTextMessagePartChatItem_dragItemProvider__block_invoke;
      v15[3] = &unk_1E27508F0;
      v15[4] = &v16;
      -[NSObject enumerateAttributesInRange:options:usingBlock:](v6, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v15);
      if (*((_BYTE *)v17 + 24))
      {
        v8 = off_1E2732C40;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Based on the content of the message, we do not need to serialize the copied item as an attributed string. Using plain string serialization only.", v14, 2u);
          }

        }
        v8 = off_1E27337F8;
      }
      v10 = (void *)objc_msgSend(objc_alloc(*v8), "initWithAttributedString:", v6);
      v11 = (NSItemProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v10);
      v12 = self->_dragItemProvider;
      self->_dragItemProvider = v11;

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CKTextMessagePartChatItem dragItemProvider].cold.1(v6);
    }

    dragItemProvider = self->_dragItemProvider;
  }
  return dragItemProvider;
}

uint64_t __45__CKTextMessagePartChatItem_dragItemProvider__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[2];

  length = a4.length;
  location = a4.location;
  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[CKChatItem transcriptText](self, "transcriptText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    objc_msgSend(v8, "attributedSubstringFromRange:", location, length);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (v7)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v11, "initWithString:", v14);

  }
  else
  {
    v15 = v9;
  }
  v18[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_time
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[CKChatItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKChatItem notification](self, "notification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMessagePartChatItem message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "time");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return v6;
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "time");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (NSAttributedString)text
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKChatItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
  }
  else
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSAttributedString *)v7;
}

- (NSAttributedString)fallbackCorruptText
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackCorruptText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (NSAttributedString)subject
{
  void *v3;
  void *v4;
  void *v5;

  -[CKChatItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSAttributedString *)v4;
}

- (BOOL)containsHyperlink
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[CKChatItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldDisplayRichLink"))
  {
    -[CKMessagePartChatItem message](self, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasDataDetectorResults") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[CKMessagePartChatItem message](self, "message");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasMention"))
        v4 = -[CKTextMessagePartChatItem allowsMentions](self, "allowsMentions");
      else
        v4 = 0;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)containsExcessiveLineHeightCharacters
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CKTextMessagePartChatItem text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", objc_msgSend(v4, "systemUIFontExcessiveLineHeightCharacterSet")) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)bigEmojiStyle
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (!self->_hasCachedBigEmojiStyle)
  {
    -[CKTextMessagePartChatItem subject](self, "subject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      self->_bigEmojiStyle = 0;
    }
    else
    {
      -[CKTextMessagePartChatItem text](self, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_bigEmojiStyle = objc_msgSend(v5, "__ck_bigEmojiStyle");

    }
    self->_hasCachedBigEmojiStyle = 1;
  }
  return self->_bigEmojiStyle;
}

- (BOOL)_textContainsIMTextEffect
{
  void *v2;
  char v3;

  -[CKTextMessagePartChatItem text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ck_containsIMTextEffect");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemProvider, 0);
}

- (double)ageForTextEffectCoordination
{
  void *v2;
  double v3;
  double v4;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ageForTextEffectCoordination");
  v4 = v3;

  return v4;
}

- (BOOL)isRecentForTextEffectCoordinationWithinTimeInterval:(double)a3
{
  void *v4;
  char v5;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRecentForTextEffectCoordinationWithinTimeInterval:", a3);

  return v5;
}

- (id)compositionWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CKComposition *v12;

  -[CKTextMessagePartChatItem text](self, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTextMessagePartChatItem subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CKTextMessagePartChatItem subject](self, "subject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithString:", v10);

  }
  else
  {
    v11 = 0;
  }

  v12 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v5, v11);
  return v12;
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18DFCD000, log, OS_LOG_TYPE_DEBUG, "Do not have NSAdaptiveImageGlyph for transfer (possibly pending download or oop generation). Will display as blank space.", v1, 2u);
}

- (void)mediaObjectForTransferGUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Could not find media object for transfer guid: %@", a5, a6, a7, a8, 2u);
}

- (void)adaptiveImageGlyphForTransferGUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Could not create adaptive image glyph because could not find media object for transfer guid: %@", a5, a6, a7, a8, 2u);
}

- (void)dragItemProvider
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Attempting to construct item provider for message with nil transcriptText", v1, 2u);
}

@end
