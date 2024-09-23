@implementation IMDSpamMessageCreator

- (id)transferForGuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferForGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)reportMessageDictionariesForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 notifyInternalSecurity:(BOOL)a10 isJunkReportedToCarrier:(BOOL)a11 reportReason:(unint64_t)a12 iMessageReportSpamDictionaries:(id)a13 textMessageReportSpamDictionaries:(id)a14
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  int v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  int v61;
  uint64_t v62;
  _BOOL4 v63;
  _BOOL4 v64;
  size_t v65;
  char *v66;
  size_t v67;
  id v68;
  size_t v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t i;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __CFDictionary *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  int v120;
  void *v121;
  int v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  unint64_t v129;
  unint64_t *v130;
  unint64_t v131;
  id v132;
  unint64_t v133;
  unint64_t v134;
  _BOOL4 v135;
  unint64_t v136;
  id v137;
  id v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  _BOOL4 v142;
  _BOOL4 v143;
  id v144;
  id v145;
  id v146;
  unint64_t v147;
  int v148;
  id v149;
  id v150;
  _BOOL4 v151;
  uint64_t v152;
  _BOOL4 v153;
  id v154;
  uint64_t v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  uint64_t v161;
  id v162;
  id v163;
  uint64_t v164;
  IMDSpamMessageCreator *v165;
  uint64_t v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _BYTE v180[128];
  _BYTE v181[128];
  uint64_t v182;

  v139 = a8;
  v135 = a6;
  v165 = self;
  v130 = a9;
  v182 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v132 = a4;
  v146 = a7;
  v137 = a13;
  v138 = a14;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = (void *)qword_1EFC65DE0;
  qword_1EFC65DE0 = (uint64_t)v18;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isReportJunkTextToAppleServerEnabled");

  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v176, v181, 16);
  if (v23)
  {
    v24 = v23;
    v136 = 0;
    v140 = 0;
    v141 = 0;
    v143 = !a11 || a10;
    v142 = a10;
    LOBYTE(v25) = v21 & a11 | a10;
    v133 = a5 - 1;
    v134 = a5;
    v131 = a12;
    v129 = a12 - 1;
    v26 = *(_QWORD *)v177;
    v145 = v22;
    v152 = v26;
    while (1)
    {
      v27 = 0;
      v155 = v24;
      do
      {
        if (*(_QWORD *)v177 != v26)
        {
          v28 = v27;
          objc_enumerationMutation(v22);
          v27 = v28;
        }
        v161 = v27;
        v29 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v27);
        if (!objc_msgSend(v29, "type", v129) && (objc_msgSend(v29, "isTypingMessage") & 1) == 0)
        {
          v160 = v29;
          if ((objc_msgSend(v29, "isSuggestedActionResponse") & 1) == 0)
          {
            if (v25)
            {
              v30 = v160;
              v25 = -[IMDSpamMessageCreator _textMessageReportToIDSAllowedForMessageItem:chat:notifyInternalSecurity:](v165, "_textMessageReportToIDSAllowedForMessageItem:chat:notifyInternalSecurity:", v160, v146, v142);
            }
            else
            {
              v25 = 0;
              v30 = v160;
            }
            +[IMDServiceController sharedController](IMDServiceController, "sharedController");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "service");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "serviceWithName:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = objc_msgSend(v33, "supportsCapability:", *MEMORY[0x1E0D38D78]);
            v35 = *MEMORY[0x1E0D38EB0];
            v158 = v33;
            v36 = objc_msgSend(v33, "supportsCapability:", v35);
            if ((v36 & v25 & 1) == 0 && (v143 & v34) == 0)
            {
              v24 = v155;
              v26 = v152;
LABEL_116:

              goto LABEL_117;
            }
            v148 = v36;
            v153 = v34;
            v151 = v25;
            v159 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v37 = v160;
            objc_msgSend(v160, "fileTransferGUIDs");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "count");

            objc_msgSend(v37, "plainBody");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "length"))
            {
              v150 = v40;
              objc_msgSend(v40, "dataUsingEncoding:", 4);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v37, "body");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "length");

              if (v43)
              {
                objc_msgSend(v37, "body");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "string");
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v45, "dataUsingEncoding:", 4);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v150 = v45;
              }
              else
              {
                v150 = v40;
                objc_msgSend(MEMORY[0x1E0C99D50], "data");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            v157 = v41;
            v147 = objc_msgSend(v41, "length");
            objc_msgSend(v37, "sender");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "im_stripCategoryLabel");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "_stripFZIDPrefix");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "_bestGuessURI");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = v160;
            if (objc_msgSend(v160, "isFromMe") && !objc_msgSend(v49, "length"))
            {
              objc_msgSend(v132, "_stripFZIDPrefix");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "_bestGuessURI");
              v117 = (void *)objc_claimAutoreleasedReturnValue();

              v50 = v160;
              v156 = v117;
            }
            else
            {
              v156 = v49;
            }
            v22 = v145;
            objc_msgSend(v50, "guid");
            v154 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "account");
            v51 = v50;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "_stripFZIDPrefix");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v51, "time");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "timeIntervalSince1970");
            v56 = v55;

            v57 = v53;
            if (!v53)
            {
              LOBYTE(v25) = v151;
              v26 = v152;
LABEL_115:

              v24 = v155;
              goto LABEL_116;
            }
            v149 = v53;
            if ((v148 | v153) != 1
              || (!v148 ? (v58 = v137) : (v58 = v138),
                  objc_msgSend(v58, "objectForKey:", v149),
                  (v59 = (id)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            }
            v144 = v59;
            objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isReportJunkTextToAppleServerEnabled");

            v63 = v147 > v134;
            v64 = v153;
            if (v147 <= v134)
              v64 = 0;
            if (v61)
              v63 = v64;
            if (v63)
            {
              MEMORY[0x1E0C80A78](v62);
              v66 = (char *)&v129 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
              v67 = v65;
              bzero(v66, v65);
              bzero(v66, v67);
              v68 = v157;
              objc_msgSend(v157, "getBytes:length:", v66, v133);
              v69 = v67;
              v22 = v145;
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v66, v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              v157 = v70;
            }
            if (v135)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
              v71 = (id)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v156, "length"))
              {
                if (objc_msgSend(v154, "length"))
                {
                  if (v71)
                  {
                    v72 = v149;
                    if (objc_msgSend(v149, "length"))
                    {
                      v73 = v146;
                      v74 = objc_msgSend(v146, "isBlackholed");
                      v75 = objc_msgSend(v73, "isOscarChat");
                      -[IMDSpamMessageCreator reportUnknownToIDS:messageID:isBlackholed:isiMessageJunk:messageServerTimestamp:toURI:](v165, "reportUnknownToIDS:messageID:isBlackholed:isiMessageJunk:messageServerTimestamp:toURI:", v156, v154, v74, v75, v71, v72);
                    }
                  }
                }
              }
LABEL_106:

              objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = objc_msgSend(v121, "isReportJunkTextToAppleServerEnabled");

              if (v122)
              {
                if (v140 >= v139)
                {
                  v123 = v137;
                  v124 = (void *)objc_msgSend(v137, "copy");
                  -[IMDSpamMessageCreator _reportToIDSiMessageSpam:](v165, "_reportToIDSiMessageSpam:", v124);

                  objc_msgSend(v123, "removeAllObjects");
                  v140 = 0;
                }
                if (v141 < v139)
                {
LABEL_114:

                  LOBYTE(v25) = v151;
                  v26 = v152;
                  v57 = v149;
                  goto LABEL_115;
                }
              }
              else
              {
                if (v140 + v141 < v139)
                  goto LABEL_114;
                v125 = v137;
                v126 = (void *)objc_msgSend(v137, "copy");
                -[IMDSpamMessageCreator _reportToIDSiMessageSpam:](v165, "_reportToIDSiMessageSpam:", v126);

                objc_msgSend(v125, "removeAllObjects");
                v140 = 0;
              }
              v127 = v138;
              v128 = (void *)objc_msgSend(v138, "copy");
              -[IMDSpamMessageCreator _reportToIDSTextMessageSpam:](v165, "_reportToIDSTextMessageSpam:", v128);

              objc_msgSend(v127, "removeAllObjects");
              v141 = 0;
              goto LABEL_114;
            }
            v76 = v156;
            if (v76)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("sender-uri"), v76);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            if (v77)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("time-of-message"), v77);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39 != 0);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (v78)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("message-has-image"), v78);

            v79 = v157;
            v80 = v160;
            if (v79)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("message-text"), v79);

            objc_msgSend(v80, "messageSummaryInfo");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "objectForKey:", CFSTR("smv"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            if (v82)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("message-spam-model-version"), v82);

            v83 = v160;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v160, "isSpam"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (v84)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("message-spam-model-detected-spam"), v84);

            v163 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v172 = 0u;
            v173 = 0u;
            v174 = 0u;
            v175 = 0u;
            objc_msgSend(v83, "fileTransferGUIDs");
            v162 = (id)objc_claimAutoreleasedReturnValue();
            v166 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v172, v180, 16);
            if (v166)
            {
              v164 = *(_QWORD *)v173;
              do
              {
                for (i = 0; i != v166; ++i)
                {
                  if (*(_QWORD *)v173 != v164)
                    objc_enumerationMutation(v162);
                  -[IMDSpamMessageCreator transferForGuid:](v165, "transferForGuid:", *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * i));
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  v87 = v86;
                  if (v86)
                  {
                    objc_msgSend(v86, "userInfo");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "_stringForKey:", CFSTR("mmcs-url"));
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "_stringForKey:", CFSTR("mmcs-signature-hex"));
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "_stringForKey:", CFSTR("mmcs-owner"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "_stringForKey:", CFSTR("file-size"));
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    v171 = v88;
                    objc_msgSend(v88, "_stringForKey:", CFSTR("decryption-key"));
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "type");
                    v167 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "filename");
                    v168 = (id)objc_claimAutoreleasedReturnValue();
                    v94 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
                    v95 = v89;
                    if (v95)
                      CFDictionarySetValue(v94, CFSTR("mmcs-url"), v95);

                    v96 = v90;
                    if (v96)
                      CFDictionarySetValue(v94, CFSTR("mmcs-signature-hex"), v96);

                    v97 = v91;
                    if (v97)
                      CFDictionarySetValue(v94, CFSTR("mmcs-owner-id"), v97);

                    v98 = v92;
                    if (v98)
                      CFDictionarySetValue(v94, CFSTR("mmcs-file-size-string"), v98);
                    v169 = v96;

                    v99 = v93;
                    if (v99)
                      CFDictionarySetValue(v94, CFSTR("mmcs-symmetric-key"), v99);
                    v170 = v95;

                    v100 = v167;
                    if (v100)
                      CFDictionarySetValue(v94, CFSTR("mmcs-UTI-type"), v100);

                    v101 = v168;
                    if (v101)
                      CFDictionarySetValue(v94, CFSTR("mmcs-filename"), v101);

                    objc_msgSend(v171, "_stringForKey:", CFSTR("inline-attachment"));
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v102, "length"))
                    {
                      v167 = v98;
                      v168 = v97;
                      v103 = objc_alloc(MEMORY[0x1E0C99D50]);
                      objc_msgSend(v87, "localPath");
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      v105 = (void *)objc_msgSend(v103, "initWithContentsOfFile:", v104);

                      v106 = v105;
                      if (v106)
                        CFDictionarySetValue(v94, CFSTR("inline-message-data"), v106);

                      v98 = v167;
                      v97 = v168;
                    }
                    objc_msgSend(v163, "addObject:", v94);

                  }
                }
                v166 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v172, v180, 16);
              }
              while (v166);
            }

            v71 = v163;
            if (v71)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("message-attachment-info"), v71);

            v107 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v146, "participants");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = v145;
            if (v109)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("conversation-group-size"), v109);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v160, "isFromMe"));
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            if (v110)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("is-self"), v110);

            objc_msgSend(v160, "service");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            if (v111)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("message-service"), v111);

            if (v142)
              CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("notify-security"), &unk_1E9270F90);
            objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend(v112, "isReportJunkTextToAppleServerEnabled");

            if (v113)
            {
              if (v148)
              {
                v114 = v159;
                -[IMDSpamMessageCreator addTextMessageJunkKeysToReportMessageDictionary:forMessage:chat:receiverURI:](v165, "addTextMessageJunkKeysToReportMessageDictionary:forMessage:chat:receiverURI:", v159, v160, v146, v149);
                v115 = v144;
                objc_msgSend(v144, "addObject:", v114);
                goto LABEL_97;
              }
              v119 = v146;
              -[IMDSpamMessageCreator addiMessageJunkKeysToReportMessageDictionary:forMessage:withGUID:contentLength:chat:](v165, "addiMessageJunkKeysToReportMessageDictionary:forMessage:withGUID:contentLength:chat:", v159, v160, v154, v147, v146);
              v120 = objc_msgSend(v119, "isBusinessChat");
              if (v131 && v120 && v131 <= 6)
                CFDictionarySetValue((CFMutableDictionaryRef)v159, CFSTR("report-spam-reason"), off_1E9228AA8[v129]);
              objc_msgSend(v144, "addObject:", v159);
LABEL_103:
              if (v153)
              {
                objc_msgSend(v137, "setObject:forKey:", v144, v149);
                ++v140;
              }
            }
            else
            {
              v118 = v159;
              -[IMDSpamMessageCreator addiMessageJunkKeysToReportMessageDictionary:forMessage:withGUID:contentLength:chat:](v165, "addiMessageJunkKeysToReportMessageDictionary:forMessage:withGUID:contentLength:chat:", v159, v160, v154, v147, v146);
              v115 = v144;
              objc_msgSend(v144, "addObject:", v118);
              if (!v148)
                goto LABEL_103;
LABEL_97:
              objc_msgSend(v138, "setObject:forKey:", v115, v149);
              ++v141;
            }
            ++v136;
            goto LABEL_106;
          }
        }
LABEL_117:
        v27 = v161 + 1;
      }
      while (v161 + 1 != v24);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v176, v181, 16);
      if (!v24)
        goto LABEL_121;
    }
  }
  v136 = 0;
LABEL_121:

  *v130 = v136;
}

- (void)addiMessageJunkKeysToReportMessageDictionary:(id)a3 forMessage:(id)a4 withGUID:(id)a5 contentLength:(unint64_t)a6 chat:(id)a7
{
  __CFDictionary *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  id v43;
  IMDSpamMessageCreator *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = (__CFDictionary *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  CFDictionarySetValue(v12, CFSTR("message-format-version"), &unk_1E9270FA8);
  if (v14)
    CFDictionarySetValue(v12, CFSTR("message-id"), v14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    CFDictionarySetValue(v12, CFSTR("message-length"), v16);

  objc_msgSend(v13, "balloonBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    CFDictionarySetValue(v12, CFSTR("message-app-bundle-id"), v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "isOscarChat"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    CFDictionarySetValue(v12, CFSTR("reported-from-junk"), v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "isBlackholed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v12, CFSTR("reported-from-blackhole"), v19);

  objc_msgSend(v13, "balloonBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsString:", *MEMORY[0x1E0D37620]);

  if (v21)
  {
    -[IMDSpamMessageCreator surfURLForIMMessageItem:](self, "surfURLForIMMessageItem:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[IMDSpamMessageCreator metaDataForSurfURL:](self, "metaDataForSurfURL:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[IMDSpamMessageCreator isSurfPayment:](self, "isSurfPayment:", v22);
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }

  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  objc_msgSend(v13, "payloadData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    CFDictionarySetValue(v12, CFSTR("message-extension-data"), v25);

  objc_msgSend(v13, "payloadData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v13, "balloonBundleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      CFDictionarySetValue(v12, CFSTR("message-extension-bundle-id"), v27);

  }
  objc_msgSend(v13, "historyForMessagePart:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
  {
    v41 = v24;
    v42 = v23;
    v43 = v15;
    v44 = self;
    v45 = v14;
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v30 = v28;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v47;
LABEL_26:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v34);
        objc_msgSend(v30, "lastObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35 == v36)
          break;
        objc_msgSend(v35, "messagePartText");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v37);

        if (v32 == ++v34)
        {
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          if (v32)
            goto LABEL_26;
          break;
        }
      }
    }

    if (v29)
      CFDictionarySetValue(v12, CFSTR("message-edits"), v29);

    self = v44;
    v14 = v45;
    v23 = v42;
    v15 = v43;
    v24 = v41;
  }
  if (v23)
    CFDictionarySetValue(v12, CFSTR("payment-info"), v23);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    CFDictionarySetValue(v12, CFSTR("is-payment"), v38);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDSpamMessageCreator hasDataDetectedInformalPayment:](self, "hasDataDetectedInformalPayment:", v13));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v12, CFSTR("is-informal"), v39);

  if (objc_msgSend(v15, "isBusinessChat"))
    CFDictionarySetValue(v12, CFSTR("spam-message-type"), CFSTR("BusinessInitiatedAlertSpam"));
  objc_msgSend(v13, "sender");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDSpamMessageCreator _addSnapNameKeysToReportMessageDictionary:forSender:](self, "_addSnapNameKeysToReportMessageDictionary:forSender:", v12, v40);

}

- (void)addTextMessageJunkKeysToReportMessageDictionary:(id)a3 forMessage:(id)a4 chat:(id)a5 receiverURI:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  __CFDictionary *v22;
  void *v23;
  __CFDictionary *theDict;

  theDict = (__CFDictionary *)a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0D39730];
  objc_msgSend(v10, "destinationCallerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "carrierNameForPhoneNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "destinationCallerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  IMCountryCodeForNumber();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "subject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    v19 = 1;
  }
  else
  {
    objc_msgSend(v10, "fileTransferGUIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
      v19 = 1;
    else
      v19 = objc_msgSend(v11, "style") != 45;

  }
  CFDictionarySetValue(theDict, CFSTR("message-format-version"), &unk_1E9270F90);
  if (v15)
    CFDictionarySetValue(theDict, CFSTR("carrier-name"), v15);
  if (v17)
    CFDictionarySetValue(theDict, CFSTR("country-code"), v17);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    CFDictionarySetValue(theDict, CFSTR("is-message-mms"), v21);

  v22 = theDict;
  if (v12)
  {
    CFDictionarySetValue(theDict, CFSTR("recipient-uri"), v12);
    v22 = theDict;
  }
  CFDictionarySetValue(v22, CFSTR("spam-message-type"), CFSTR("TextMessageSpam"));
  objc_msgSend(v10, "sender");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDSpamMessageCreator _addSnapNameKeysToReportMessageDictionary:forSender:](self, "_addSnapNameKeysToReportMessageDictionary:forSender:", theDict, v23);

}

- (void)_addSnapNameKeysToReportMessageDictionary:(id)a3 forSender:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __CFDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFDictionary *theDict;

  theDict = (__CFDictionary *)a3;
  v5 = a4;
  +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingNicknameUpdates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handledNicknames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v10)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v10);
    v14 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "firstName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      CFDictionarySetValue(v14, CFSTR("first-name"), v15);

    objc_msgSend(v13, "lastName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      CFDictionarySetValue(v14, CFSTR("last-name"), v16);

    objc_msgSend(v13, "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      CFDictionarySetValue(v14, CFSTR("recordID"), v17);

  }
  else
  {
    v14 = 0;
  }
  +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unknownSenderRecordInfoFor:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (!v14)
      v14 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CFDictionarySetValue(v14, CFSTR("sender-records-and-keys"), v19);
  }
  if (v14)
    CFDictionarySetValue(theDict, CFSTR("sender-shared-name-and-photo"), v14);

}

- (void)reportUnknownToIDS:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isiMessageJunk:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8
{
  IDSReportiMessageUnknownSenderWithBlackholeAndJunkStatus();
}

- (BOOL)isSurfPayment:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (qword_1EFC63C88 != -1)
    dispatch_once(&qword_1EFC63C88, &unk_1E9228A28);
  if (off_1EFC63C80)
    v4 = off_1EFC63C80(v3) == 1;
  else
    v4 = 0;

  return v4;
}

- (id)metaDataForSurfURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (qword_1EFC63C98 != -1)
    dispatch_once(&qword_1EFC63C98, &unk_1E9228A48);
  if (off_1EFC63C90)
  {
    off_1EFC63C90(v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDataDetectedInformalPayment:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0D39918];
  objc_msgSend(a3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "messageContainsSurfDD:", v4);

  return (char)v3;
}

- (id)surfURLForIMMessageItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v3 = a3;
  IMExtensionPayloadUnarchivingClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v3, "payloadData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = (void *)objc_msgSend(v5, "initForReadingFromData:error:", v6, &v14);
  v8 = v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_enableStrictSecureDecodingMode");
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v4, *MEMORY[0x1E0CB2CD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D37E68]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_reportToIDSiMessageSpam:(id)a3
{
  if (a3)
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &unk_1E9228A88);
}

- (void)_reportToIDSTextMessageSpam:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0D34358];
    v4 = a3;
    v5 = [v3 alloc];
    v6 = (void *)objc_msgSend(v5, "initWithService:", *MEMORY[0x1E0D34240]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1D1448024;
    v8[3] = &unk_1E9228890;
    v9 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

- (BOOL)_textMessageReportToIDSAllowedForMessageItem:(id)a3 chat:(id)a4 notifyInternalSecurity:(BOOL)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  BOOL v17;
  _BOOL4 v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v8, "destinationCallerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((IMStringIsEmail() & 1) != 0)
    {
      v10 = 0;
      v12 = 0;
      v13 = 0;
    }
    else
    {
      v14 = MEMORY[0x1D17EA35C](v11);
      v15 = v11;
      v16 = v15;
      v17 = v14 == 0;
      if (v14)
        v12 = 0;
      else
        v12 = v15;
      if (v17)
        v13 = 0;
      else
        v13 = v15;
      v18 = -[IMDSpamMessageCreator _isMessageMMS:forChat:](self, "_isMessageMMS:forChat:", v8, v9);
      if (v18)
        v19 = CFSTR("%@-MMS");
      else
        v19 = CFSTR("%@-SMS");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1EFC65DE0, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend((id)qword_1EFC65DE0, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v22, "BOOLValue");
      }
      else
      {
        if (v18)
          v23 = &unk_1E9271880;
        else
          v23 = &unk_1E9271898;
        objc_msgSend(MEMORY[0x1E0D39730], "carrierBundleValueForKeyHierarchy:phoneNumber:simID:", v23, v13, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend((id)qword_1EFC65DE0, "setObject:forKeyedSubscript:", v22, v20);
          v10 = objc_msgSend(v22, "BOOLValue");
          if (_IMWillLog())
            _IMAlwaysLog();
        }
        else
        {
          if (_IMWillLog())
            _IMAlwaysLog();
          v10 = 0;
        }
      }

    }
  }

  return v10;
}

- (BOOL)_isMessageMMS:(id)a3 forChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "fileTransferGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "subject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "style") != 45;

  }
  return v8;
}

@end
