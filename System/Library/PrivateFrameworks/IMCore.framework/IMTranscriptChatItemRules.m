@implementation IMTranscriptChatItemRules

- (id)chatItemForIMChatItem:(id)a3
{
  return a3;
}

- (BOOL)shouldShowRaiseMessageStatus
{
  return 0;
}

- (BOOL)shouldShowExpressiveMessageTextAsText:(id)a3
{
  return 0;
}

- (BOOL)_shouldShowEffectPlayButtonForMessage:(id)a3
{
  id v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "errorCode"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "expressiveSendStyleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length")
      && ((objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D38098]) & 1) != 0
       || objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D37FF0])))
    {
      v6 = objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D380A0]) ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
    objc_msgSend(v3, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "im_containsIMTextEffect"))
      v9 = _AXSReduceMotionAutoplayMessagesEffectsEnabled() == 0;
    else
      v9 = 0;
    v4 = v6 | v9;

  }
  return v4;
}

- (id)inlineReplyController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend(WeakRetained, "inlineReplyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_items
{
  return self->_items;
}

- (void)_setItems:(id)a3
{
  NSArray *v4;
  NSArray **p_items;
  NSArray *items;
  NSArray *v7;
  NSArray *v8;

  v4 = (NSArray *)a3;
  items = self->_items;
  p_items = &self->_items;
  if (items != v4)
  {
    v8 = v4;
    v7 = (NSArray *)-[NSArray copy](v4, "copy");

    objc_storeStrong((id *)p_items, v7);
    v4 = v7;
  }

}

- (id)_chatItems
{
  return self->_chatItems;
}

- (void)_setNextStaleTime:(id)a3
{
  NSDate *v5;
  NSDate **p_nextStaleTime;
  NSDate *nextStaleTime;
  NSDate *v8;

  v5 = (NSDate *)a3;
  nextStaleTime = self->_nextStaleTime;
  p_nextStaleTime = &self->_nextStaleTime;
  if (nextStaleTime != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_nextStaleTime, a3);
    v5 = v8;
  }

}

- (id)_nextStaleTime
{
  return self->_nextStaleTime;
}

- (id)_currentChatSubscriptionLabel
{
  IMChat **p_chat;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_chat = &self->_chat;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend(WeakRetained, "lastAddressedSIMID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)p_chat);
  objc_msgSend(v5, "lastAddressedHandleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ctSubscriptionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__im_subscriptionContextForForSimID:phoneNumber:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_chatItemsForItem:(id)a3 previousItem:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  IMParticipantSubscriptionSwitchChatItem *v40;
  void *v41;
  void *v42;
  IMDateChatItem *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  int v51;
  void *v52;
  void *v53;
  BOOL v54;
  id v55;
  id v56;
  int v57;
  id v58;
  void *v59;
  void *v60;
  IMServiceChatItem *v61;
  void *v62;
  id v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  id v69;
  void *v70;
  int v71;
  id v72;
  void *v73;
  BOOL v74;
  void *v75;
  IMScheduledSectionDateChatItem *v76;
  IMScheduledSectionLabelChatItem *v77;
  void *v78;
  BOOL v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  _BOOL4 v87;
  IMStewieSharingSummaryChatItem *v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  BOOL v94;
  void *v95;
  void *v96;
  _BOOL4 v97;
  IMStewieStoppedSharingChatItem *v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  BOOL v104;
  void *v105;
  __CFArray *v106;
  __CFArray *v107;
  IMTranscriptChatItemRules *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i;
  uint64_t v113;
  void *v114;
  BOOL v115;
  void *v116;
  void *v117;
  BOOL v118;
  uint64_t OriginatorRange;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  id v124;
  IMReplyContextDeletedMessageChatItem *v125;
  void *v126;
  void *v127;
  id v128;
  _BOOL4 v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t j;
  void *v134;
  id v135;
  uint64_t v136;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  id v143;
  void *v144;
  IMReplyContextDeletedMessageChatItem *v145;
  void *v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  IMReplyContextDeletedMessageChatItem *v150;
  void *v151;
  void *v152;
  _BOOL4 v153;
  void *v154;
  _BOOL4 v155;
  NSObject *v156;
  void *v157;
  BOOL v158;
  void *v159;
  id v160;
  int v161;
  id v162;
  IMReplySenderChatItem *v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  BOOL v168;
  void *v169;
  id v170;
  int v171;
  void *v172;
  id v173;
  void *v174;
  uint64_t v175;
  IMSenderChatItem *v176;
  IMSenderChatItem *v177;
  void *v178;
  void *v179;
  BOOL v180;
  id v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t k;
  uint64_t v185;
  void *v186;
  void *v187;
  int isKindOfClass;
  void *v189;
  BOOL v190;
  char v191;
  id v192;
  uint64_t v193;
  double v194;
  uint64_t v195;
  IMMessageStatusChatItem *v196;
  void *v197;
  uint64_t v198;
  id v199;
  id v200;
  void *v201;
  IMParticipantChangeChatItem *v202;
  id v203;
  void *v204;
  id v205;
  id v206;
  int v207;
  IMDateChatItem *v208;
  id v209;
  void *v210;
  void *v211;
  id v212;
  id v213;
  void *v214;
  void *v215;
  uint64_t v216;
  id v217;
  id v218;
  id v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  char v226;
  IMMessageStatusChatItem *v227;
  NSObject *v228;
  int v229;
  IMMessageStatusChatItem *v230;
  void *v231;
  void *v232;
  _BOOL4 v233;
  IMMessageStatusChatItem *v234;
  void *v235;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t m;
  uint64_t v244;
  id v245;
  uint64_t v246;
  BOOL v247;
  BOOL v248;
  void *v249;
  BOOL v250;
  void *v251;
  void *v252;
  BOOL v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  int v259;
  id v260;
  IMTranscriptPluginBreadcrumbChatItem *v261;
  void *v262;
  void *v263;
  BOOL v264;
  void *v265;
  void *v266;
  _BOOL4 v267;
  id v268;
  id v269;
  BOOL v270;
  void *v271;
  BOOL v272;
  void *v273;
  IMMessageEffectControlChatItem *v274;
  void *v275;
  BOOL v276;
  NSObject *v277;
  id v278;
  __CFArray *v279;
  void *v281;
  id v282;
  void *v283;
  void *v284;
  int v285;
  void *v286;
  void *valuea;
  void *value;
  unsigned int v289;
  uint64_t OriginatorMessagePart;
  uint64_t v291;
  void *v292;
  id v293;
  id v294;
  void *v295;
  id v296;
  id v297;
  id *location;
  id v299;
  id v300;
  __CFArray *theArray;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  id v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  _BYTE v328[128];
  uint8_t v329[128];
  uint8_t buf[4];
  _BYTE v331[14];
  _BYTE v332[128];
  _BYTE v333[128];
  _BYTE v334[128];
  void *v335;
  _BYTE v336[128];
  _QWORD v337[3];
  _QWORD v338[5];

  v338[2] = *MEMORY[0x1E0C80C00];
  v300 = a3;
  v299 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  theArray = (__CFArray *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v300, "shouldGenerateTopLevelChatItem"))
    goto LABEL_299;
  location = (id *)&self->_chat;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v289 = objc_msgSend(WeakRetained, "chatStyle");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IMTranscriptChatItemRules _items](self, "_items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(location);
    v8 = objc_msgSend(v7, "isInScrutinyMode");

    objc_msgSend(v300, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v300, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMChat storeGUIDInAttemptingListInScrutinyMode:](IMChat, "storeGUIDInAttemptingListInScrutinyMode:", v10);

    }
    v11 = objc_loadWeakRetained(location);
    objc_msgSend(v11, "loadParticipantContactsIfNecessary");

    v12 = objc_loadWeakRetained(location);
    sub_1A20FA798(v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(v300, "_newChatItemsWithChatContext:", v13);
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v14, "count"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v300, "guid");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v331 = v16;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Generated no chat items for IMMessageItem with GUID: %@", buf, 0xCu);

        }
      }
    }
    if (v8)
      +[IMChat removeGUIDInAttemptingListInScrutinyMode:](IMChat, "removeGUIDInAttemptingListInScrutinyMode:", v9);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[IMTranscriptChatItemRules _items](self, "_items");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_loadWeakRetained(location);
      sub_1A20FA798(v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(v300, "_newChatItemsWithChatContext:", v19);
    }
    else
    {
      v14 = (void *)objc_msgSend(v300, "_newChatItems");
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v14, "changeType"))
  {
    objc_msgSend(v14, "sender");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "otherHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "isEqualToString:", v23))
    {
      v24 = objc_loadWeakRetained(location);
      objc_msgSend(v24, "setIsSubscriptionSwitchParticipantAddTypeFound:", 1);

      v25 = objc_loadWeakRetained(location);
      objc_msgSend(v25, "setSubscriptionSwitchParticipantAddChatItem:", v14);

      v14 = 0;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v14, "changeType") != 1)
  {
    v51 = 1;
    goto LABEL_31;
  }
  v26 = objc_loadWeakRetained(location);
  if (objc_msgSend(v26, "isSubscriptionSwitchParticipantAddTypeFound"))
  {
    v27 = objc_loadWeakRetained(location);
    objc_msgSend(v27, "subscriptionSwitchParticipantAddChatItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      v51 = 1;
      goto LABEL_221;
    }
    v30 = objc_loadWeakRetained(location);
    objc_msgSend(v30, "subscriptionSwitchParticipantAddChatItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sender");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "ID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "sender");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "ID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "sender");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "otherHandle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "isEqualToString:", v34))
    {
      v39 = objc_msgSend(v36, "isEqualToString:", v38);
      if (v39)
      {
        objc_msgSend(v14, "_item");
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = [IMParticipantSubscriptionSwitchChatItem alloc];
        objc_msgSend(v14, "sender");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "otherHandle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v293 = -[IMParticipantSubscriptionSwitchChatItem _initWithItem:sender:otherHandle:](v40, "_initWithItem:sender:otherHandle:", v295, v41, v42);

        v43 = [IMDateChatItem alloc];
        v44 = objc_loadWeakRetained(location);
        objc_msgSend(v44, "subscriptionSwitchParticipantAddChatItem");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "_item");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[IMDateChatItem _initWithItem:](v43, "_initWithItem:", v46);

        v338[0] = v47;
        v338[1] = v293;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v338, 2);
        v48 = objc_claimAutoreleasedReturnValue();

        v49 = objc_loadWeakRetained(location);
        objc_msgSend(v49, "setIsSubscriptionSwitchParticipantAddTypeFound:", 0);

        v50 = objc_loadWeakRetained(location);
        objc_msgSend(v50, "setSubscriptionSwitchParticipantAddChatItem:", 0);
        v14 = (void *)v48;
      }
      else
      {
        objc_msgSend(v14, "otherHandle");
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sender");
        v293 = (id)objc_claimAutoreleasedReturnValue();
        v200 = objc_loadWeakRetained(location);
        objc_msgSend(v200, "subscriptionSwitchParticipantAddChatItem");
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "_item");
        v47 = (id)objc_claimAutoreleasedReturnValue();

        v202 = [IMParticipantChangeChatItem alloc];
        v203 = objc_loadWeakRetained(location);
        sub_1A20FA798(v203, self->_items);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:context:](v202, "_initWithItem:sender:otherHandle:context:", v47, v295, v293, v204);

        v205 = objc_loadWeakRetained(location);
        objc_msgSend(v205, "setSubscriptionSwitchParticipantAddChatItem:", v50);

      }
      v51 = v39 ^ 1;
    }
    else
    {
      v51 = 1;
    }

  }
  else
  {
    v51 = 1;
  }

LABEL_221:
  v206 = objc_loadWeakRetained(location);
  v207 = objc_msgSend(v206, "isSubscriptionSwitchParticipantAddTypeFound");

  if (v207)
  {
    v208 = [IMDateChatItem alloc];
    v209 = objc_loadWeakRetained(location);
    objc_msgSend(v209, "subscriptionSwitchParticipantAddChatItem");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "_item");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = -[IMDateChatItem _initWithItem:](v208, "_initWithItem:", v211);

    v337[0] = v212;
    v213 = objc_loadWeakRetained(location);
    objc_msgSend(v213, "subscriptionSwitchParticipantAddChatItem");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v337[1] = v214;
    v215 = (void *)objc_msgSend(v300, "_newChatItems");
    v337[2] = v215;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v337, 3);
    v216 = objc_claimAutoreleasedReturnValue();

    v217 = objc_loadWeakRetained(location);
    objc_msgSend(v217, "setIsSubscriptionSwitchParticipantAddTypeFound:", 0);

    v218 = objc_loadWeakRetained(location);
    objc_msgSend(v218, "setSubscriptionSwitchParticipantAddChatItem:", 0);

    v51 = 0;
    v14 = (void *)v216;
  }
LABEL_31:
  -[IMTranscriptChatItemRules _chatItemsWithReplyCountsForNewChatItems:parentItem:threadOriginatorItem:](self, "_chatItemsWithReplyCountsForNewChatItems:parentItem:threadOriginatorItem:", v14, v300, v300);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v294 = 0;
  }
  else
  {
    v294 = v52;

    v52 = 0;
  }
  -[IMTranscriptChatItemRules _filteredChatItemsForNewChatItems:](self, "_filteredChatItemsForNewChatItems:", v52);
  v292 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (theArray)
    {
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v294);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53 == 0;

      if (!v54)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v294);
        valuea = (void *)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue(theArray, valuea);

      }
    }
    goto LABEL_298;
  }
  v285 = objc_msgSend(v300, "_hasMessageChatItem");
  v55 = objc_loadWeakRetained(location);
  if ((objc_msgSend(v55, "isMapKitBusinessChat") & 1) != 0)
  {
    v56 = objc_loadWeakRetained(location);
    v57 = objc_msgSend(v56, "isStewieSharingChat");

    if (!v57)
      goto LABEL_52;
  }
  else
  {

  }
  if (-[IMTranscriptChatItemRules _shouldAppendServiceForItem:previousItem:chatStyle:](self, "_shouldAppendServiceForItem:previousItem:chatStyle:", v300, v299, v289))
  {
    v58 = objc_loadWeakRetained(location);
    objc_msgSend(v58, "participants");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "firstObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = [IMServiceChatItem alloc];
    objc_msgSend(v300, "_service");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[IMServiceChatItem _initWithItem:service:handle:](v61, "_initWithItem:service:handle:", v300, v62, v60);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isCarrierPigeonEnabled");

    if (v65)
    {
      objc_msgSend(v300, "_service");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMService satelliteSMSService](IMService, "satelliteSMSService");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v66 == v67;

      if (v68)
      {
        v69 = objc_loadWeakRetained(location);
        objc_msgSend(v63, "setLiteServiceCapable:", objc_msgSend(v69, "isRecipientAbleToDowngradeToSMS"));

      }
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "isTranscriptSharingEnabled");

    if (v71)
    {
      v72 = objc_loadWeakRetained(location);
      objc_msgSend(v63, "setStewieSharingChat:", objc_msgSend(v72, "isStewieSharingChat"));

    }
    if (theArray)
    {
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v63);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73 == 0;

      if (!v74)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v63);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue(theArray, v75);

      }
    }

  }
LABEL_52:
  objc_msgSend(v300, "time");
  value = (void *)objc_claimAutoreleasedReturnValue();
  if (value)
  {
    if (-[IMTranscriptChatItemRules _shouldAppendScheduledSectionDateForItem:previousItem:](self, "_shouldAppendScheduledSectionDateForItem:previousItem:", v300, v299))
    {
      v76 = -[IMScheduledSectionDateChatItem initWithItem:]([IMScheduledSectionDateChatItem alloc], "initWithItem:", v300);
      if (-[IMTranscriptChatItemRules _shouldAppendScheduledSectionLabelForItem:previousItem:](self, "_shouldAppendScheduledSectionLabelForItem:previousItem:", v76, v299))
      {
        v77 = -[IMScheduledSectionLabelChatItem initWithAssociatedDateChatItem:]([IMScheduledSectionLabelChatItem alloc], "initWithAssociatedDateChatItem:", v76);
        if (theArray)
        {
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v78 == 0;

          if (!v79)
          {
            -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v77);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            CFArrayAppendValue(theArray, v80);

          }
        }

      }
      if (!theArray)
        goto LABEL_66;
    }
    else
    {
      if (!v51
        || !-[IMTranscriptChatItemRules _shouldAppendDateForItem:previousItem:](self, "_shouldAppendDateForItem:previousItem:", v300, v299))
      {
        goto LABEL_67;
      }
      v76 = -[IMDateChatItem _initWithItem:]([IMDateChatItem alloc], "_initWithItem:", v300);
      if (!theArray)
        goto LABEL_66;
    }
    -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v76);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v81 == 0;

    if (!v82)
    {
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v76);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(theArray, v83);

    }
LABEL_66:

  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "isTranscriptSharingEnabled");

  if (v85)
  {
    -[IMTranscriptChatItemRules chat](self, "chat");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = -[IMTranscriptChatItemRules _shouldAppendStewieSharingSummaryForChat:item:previousItem:](self, "_shouldAppendStewieSharingSummaryForChat:item:previousItem:", v86, v300, v299);

    if (v87)
    {
      v88 = [IMStewieSharingSummaryChatItem alloc];
      v89 = objc_loadWeakRetained(location);
      objc_msgSend(v89, "emergencyUserHandle");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_loadWeakRetained(location);
      v92 = -[IMStewieSharingSummaryChatItem _initWithItem:emergencyUserHandle:chat:](v88, "_initWithItem:emergencyUserHandle:chat:", v300, v90, v91);

      if (theArray)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v93 == 0;

        if (!v94)
        {
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v92);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          CFArrayAppendValue(theArray, v95);

        }
      }

    }
    -[IMTranscriptChatItemRules chat](self, "chat");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = -[IMTranscriptChatItemRules _shouldAppendStoppedSharingForChat:item:previousItem:](self, "_shouldAppendStoppedSharingForChat:item:previousItem:", v96, v300, v299);

    if (v97)
    {
      v98 = [IMStewieStoppedSharingChatItem alloc];
      v99 = objc_loadWeakRetained(location);
      objc_msgSend(v99, "emergencyUserHandle");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_loadWeakRetained(location);
      v102 = -[IMStewieStoppedSharingChatItem _initWithItem:emergencyUserHandle:chat:](v98, "_initWithItem:emergencyUserHandle:chat:", v300, v100, v101);

      if (theArray)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v103 == 0;

        if (!v104)
        {
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v102);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          CFArrayAppendValue(theArray, v105);

        }
      }
      v106 = theArray;

      v107 = theArray;
      goto LABEL_305;
    }
  }
  v108 = self;
  if ((v285 & 1) == 0)
  {
    if (v292)
    {
      v326 = 0u;
      v327 = 0u;
      v324 = 0u;
      v325 = 0u;
      v109 = v292;
      v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v324, v336, 16);
      if (v110)
      {
        v111 = *(_QWORD *)v325;
        do
        {
          for (i = 0; i != v110; ++i)
          {
            if (*(_QWORD *)v325 != v111)
              objc_enumerationMutation(v109);
            if (theArray)
            {
              v113 = *(_QWORD *)(*((_QWORD *)&v324 + 1) + 8 * i);
              -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v113);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = v114 == 0;

              if (!v115)
              {
                -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v113);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                CFArrayAppendValue(theArray, v116);

              }
            }
          }
          v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v324, v336, 16);
        }
        while (v110);
      }
      goto LABEL_95;
    }
    if (theArray)
    {
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v294);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v117 == 0;

      v108 = self;
      if (!v118)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v294);
        v109 = (id)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue(theArray, v109);
LABEL_95:

        v108 = self;
      }
    }
  }
  if (-[IMTranscriptChatItemRules _shouldAppendReplyContextForItem:previousItem:chatStyle:](v108, "_shouldAppendReplyContextForItem:previousItem:chatStyle:", v300, v299, v289))
  {
    v296 = v300;
    objc_msgSend(v296, "threadIdentifier");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v296, "threadOriginator");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    if (v283)
    {
      OriginatorRange = IMMessageThreadIdentifierGetOriginatorRange();
      v121 = v120;
      OriginatorMessagePart = IMMessageThreadIdentifierGetOriginatorMessagePart();
      -[IMTranscriptChatItemRules _items](self, "_items");
      v282 = (id)objc_claimAutoreleasedReturnValue();
      v122 = (void *)objc_opt_new();
      v123 = objc_loadWeakRetained(location);
      sub_1A20FA798(v123, v282);
      v284 = (void *)objc_claimAutoreleasedReturnValue();

      v281 = (void *)objc_msgSend(v283, "_newChatItemsWithChatContext:", v284);
      if (v281)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v124 = v281;
        }
        else
        {
          v335 = v281;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v335, 1);
          v124 = (id)objc_claimAutoreleasedReturnValue();

        }
        v322 = 0u;
        v323 = 0u;
        v320 = 0u;
        v321 = 0u;
        v130 = v124;
        v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v320, v334, 16);
        if (v131)
        {
          v132 = *(_QWORD *)v321;
          do
          {
            for (j = 0; j != v131; ++j)
            {
              if (*(_QWORD *)v321 != v132)
                objc_enumerationMutation(v130);
              v134 = *(void **)(*((_QWORD *)&v320 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v135 = v134;
                if (objc_msgSend(v135, "messagePartRange") == OriginatorRange && v136 == v121)
                {
                  objc_msgSend(v122, "addObject:", v135);
                }
                else
                {
                  objc_msgSend(v135, "aggregateAttachmentParts");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v122, "addObjectsFromArray:", v138);

                }
              }
              else
              {
                objc_msgSend(v122, "addObject:", v134);
              }
            }
            v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v320, v334, 16);
          }
          while (v131);
        }

      }
      v318 = 0u;
      v319 = 0u;
      v316 = 0u;
      v317 = 0u;
      v128 = v122;
      v139 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v316, v333, 16);
      if (!v139)
        goto LABEL_158;
      v140 = *(_QWORD *)v317;
LABEL_132:
      v141 = 0;
      while (1)
      {
        if (*(_QWORD *)v317 != v140)
          objc_enumerationMutation(v128);
        v142 = *(void **)(*((_QWORD *)&v316 + 1) + 8 * v141);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v148 = v142;
          v149 = objc_msgSend(v148, "isFromMe");
          if (objc_msgSend(v148, "partIndex") == OriginatorMessagePart)
          {
            v150 = [IMReplyContextDeletedMessageChatItem alloc];
            objc_msgSend(v296, "guid");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = -[IMReplyContextDeletedMessageChatItem _initWithReplyItem:threadIdentifier:replyMessageGUID:replyIsFromMe:deletedMessageIsFromMe:](v150, "_initWithReplyItem:threadIdentifier:replyMessageGUID:replyIsFromMe:deletedMessageIsFromMe:", v296, v286, v146, objc_msgSend(v296, "isFromMe"), v149);
LABEL_142:
            v144 = (void *)v147;

LABEL_144:
            if (v144)
            {
              if (theArray)
                CFArrayAppendValue(theArray, v144);
              if (-[IMTranscriptChatItemRules _shouldAppendReplyCountIfNeeded](self, "_shouldAppendReplyCountIfNeeded"))
              {
                objc_msgSend(v296, "guid");
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMTranscriptChatItemRules _replyCountChatItemForChatItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:threadOriginatorMessageItem:](self, "_replyCountChatItemForChatItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:threadOriginatorMessageItem:", v144, v296, v286, v151, objc_msgSend(v296, "isFromMe"), v283);
                v152 = (void *)objc_claimAutoreleasedReturnValue();

                if (v152)
                  v153 = theArray != 0;
                else
                  v153 = 0;
                if (v153)
                  CFArrayAppendValue(theArray, v152);

              }
              goto LABEL_158;
            }
            goto LABEL_145;
          }
LABEL_143:
          v144 = 0;
          goto LABEL_144;
        }
LABEL_145:
        if (v139 == ++v141)
        {
          v139 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v316, v333, 16);
          if (v139)
            goto LABEL_132;
LABEL_158:

LABEL_159:
          goto LABEL_160;
        }
      }
      v143 = v142;
      if (objc_msgSend(v143, "index") == OriginatorMessagePart)
      {
        objc_msgSend(v143, "replyContextPreviewChatItemForReply:chatContext:", v296, v284);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v144)
        {
          v145 = [IMReplyContextDeletedMessageChatItem alloc];
          objc_msgSend(v296, "guid");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = -[IMReplyContextDeletedMessageChatItem _initWithReplyItem:threadIdentifier:replyMessageGUID:replyIsFromMe:deletedMessageIsFromMe:](v145, "_initWithReplyItem:threadIdentifier:replyMessageGUID:replyIsFromMe:deletedMessageIsFromMe:", v296, v286, v146, objc_msgSend(v296, "isFromMe"), 0);
          goto LABEL_142;
        }
        goto LABEL_144;
      }
      goto LABEL_143;
    }
    v125 = [IMReplyContextDeletedMessageChatItem alloc];
    objc_msgSend(v296, "guid");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = -[IMReplyContextDeletedMessageChatItem _initWithReplyItem:threadIdentifier:replyMessageGUID:replyIsFromMe:deletedMessageIsFromMe:](v125, "_initWithReplyItem:threadIdentifier:replyMessageGUID:replyIsFromMe:deletedMessageIsFromMe:", v296, v286, v126, objc_msgSend(v296, "isFromMe"), 0);

    if (theArray && v282)
      CFArrayAppendValue(theArray, v282);
    if (-[IMTranscriptChatItemRules _shouldAppendReplyCountIfNeeded](self, "_shouldAppendReplyCountIfNeeded"))
    {
      objc_msgSend(v296, "guid");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTranscriptChatItemRules _replyCountChatItemForChatItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:threadOriginatorMessageItem:](self, "_replyCountChatItemForChatItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:threadOriginatorMessageItem:", v282, v296, v286, v127, objc_msgSend(v296, "isFromMe"), 0);
      v128 = (id)objc_claimAutoreleasedReturnValue();

      if (v128)
        v129 = theArray != 0;
      else
        v129 = 0;
      if (v129)
        CFArrayAppendValue(theArray, v128);
      goto LABEL_159;
    }
LABEL_160:

  }
  -[NSMutableArray lastObject](self->_chatItems, "lastObject");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v315 = 0;
  v155 = -[IMTranscriptChatItemRules _shouldAppendNumberChangedForItem:previousItem:lastChatItem:outPhoneNumber:](self, "_shouldAppendNumberChangedForItem:previousItem:lastChatItem:outPhoneNumber:", v300, v299, v154, &v315);
  v297 = v315;

  if (v155)
  {
    if (objc_msgSend(v297, "length"))
    {
      v156 = -[IMNumberChangedChatItem _initWithItem:senderHandle:]([IMNumberChangedChatItem alloc], "_initWithItem:senderHandle:", v300, v297);
      if (theArray)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = v157 == 0;

        if (!v158)
        {
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v156);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          CFArrayAppendValue(theArray, v159);

        }
      }
    }
    else
    {
      IMLogHandleForCategory();
      v156 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
        sub_1A2197E5C(v156);
    }

  }
  v160 = objc_loadWeakRetained(location);
  v161 = sub_1A20FA900(v160, v300, v299, v289);

  if (v161)
  {
    if (objc_msgSend(v300, "isReply"))
    {
      v162 = v300;
      v163 = [IMReplySenderChatItem alloc];
      objc_msgSend(v162, "_senderHandle");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "threadIdentifier");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = -[IMReplySenderChatItem _initWithItem:handle:threadIdentifier:](v163, "_initWithItem:handle:threadIdentifier:", v162, v164, v165);

      if (theArray)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = v167 == 0;

        if (!v168)
        {
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v166);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          CFArrayAppendValue(theArray, v169);

        }
      }
    }
    else
    {
      v170 = objc_loadWeakRetained(location);
      v171 = objc_msgSend(v170, "isStewieSharingChat");

      if (v171)
      {
        objc_msgSend(v300, "_senderHandle");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = objc_loadWeakRetained(location);
        objc_msgSend(v172, "displayNameForChat:", v173);
        v174 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v175 = objc_msgSend(v300, "transcriptSharingMessageType");
        else
          v175 = 1;
        v177 = [IMSenderChatItem alloc];
        objc_msgSend(v300, "_senderHandle");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = -[IMSenderChatItem _initWithItem:handle:displayName:transcriptSharingMessageType:](v177, "_initWithItem:handle:displayName:transcriptSharingMessageType:", v300, v178, v174, v175);

      }
      else
      {
        v176 = [IMSenderChatItem alloc];
        objc_msgSend(v300, "_senderHandle");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = -[IMSenderChatItem _initWithItem:handle:](v176, "_initWithItem:handle:", v300, v174);
      }

      if (!theArray)
        goto LABEL_184;
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v162);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v179 == 0;

      if (v180)
        goto LABEL_184;
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v162);
      v166 = (id)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(theArray, v166);
    }

LABEL_184:
  }
  if (!v285)
    goto LABEL_297;
  if (v292)
  {
    v313 = 0u;
    v314 = 0u;
    v311 = 0u;
    v312 = 0u;
    v181 = v292;
    v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v311, v332, 16);
    if (v182)
    {
      v183 = *(_QWORD *)v312;
      do
      {
        for (k = 0; k != v182; ++k)
        {
          if (*(_QWORD *)v312 != v183)
            objc_enumerationMutation(v181);
          v185 = *(_QWORD *)(*((_QWORD *)&v311 + 1) + 8 * k);
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v185);
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFArray lastObject](theArray, "lastObject");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          objc_opt_class();
          if ((isKindOfClass & objc_opt_isKindOfClass() & 1) != 0)
          {
            -[__CFArray insertObject:atIndex:](theArray, "insertObject:atIndex:", v185, -[__CFArray count](theArray, "count") - 1);
          }
          else if (theArray && v186)
          {
            CFArrayAppendValue(theArray, v186);
          }

        }
        v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v311, v332, 16);
      }
      while (v182);
    }
    goto LABEL_203;
  }
  if (theArray)
  {
    -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v294);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = v189 == 0;

    if (!v190)
    {
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v294);
      v181 = (id)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(theArray, v181);
LABEL_203:

    }
  }
  objc_opt_class();
  v191 = objc_opt_isKindOfClass();
  if (sub_1A20FAC64(v300) || (v191 & 1) == 0)
    goto LABEL_297;
  v192 = v300;
  v193 = objc_msgSend(v192, "expireState");
  if (v193 == 1)
  {
    if ((objc_msgSend(v192, "isFromMe") & 1) != 0 || (IMMessageItemTimeIntervalSinceStartedExpiring(), v194 >= 3.0))
      v195 = 3;
    else
      v195 = 2;
    v291 = v195;
  }
  else
  {
    v291 = 0;
  }

  if (objc_msgSend(v192, "isFromMe"))
  {
    if (objc_msgSend(v192, "errorCode"))
    {
      if (objc_msgSend(v192, "errorCode") == 43)
      {
        v196 = [IMMessageStatusChatItem alloc];
        objc_msgSend(v192, "time");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](v196, "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v192, 15, v197, 0, v291, 0);
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v228 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v228, OS_LOG_TYPE_INFO))
          {
            v229 = objc_msgSend(v192, "errorCode");
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v331 = v229;
            *(_WORD *)&v331[4] = 2112;
            *(_QWORD *)&v331[6] = v192;
            _os_log_impl(&dword_1A1FF4000, v228, OS_LOG_TYPE_INFO, "Generating not delivered status item with error code %d for message %@", buf, 0x12u);
          }

        }
        v230 = [IMMessageStatusChatItem alloc];
        objc_msgSend(v192, "time");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](v230, "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v192, 9, v197, 0, v291, 0);
      }
    }
    else
    {
      if (!objc_msgSend(v192, "wasDowngraded")
        || !objc_msgSend(v192, "_canShowDowngradeBreadcrumb"))
      {
        v231 = 0;
LABEL_242:
        -[IMTranscriptChatItemRules chat](self, "chat");
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = -[IMTranscriptChatItemRules _shouldAppendSendViaSatelliteForChat:item:previousItem:](self, "_shouldAppendSendViaSatelliteForChat:item:previousItem:", v232, v192, v299);

        if (v233)
        {
          v234 = [IMMessageStatusChatItem alloc];
          objc_msgSend(v192, "time");
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](v234, "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v192, 32, v235, 0, v291, 0);

          v236 = objc_loadWeakRetained(location);
          objc_msgSend(v236, "participants");
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "firstObject");
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v238, "_displayNameWithAbbreviation");
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v199, "setRecipientDisplayName:", v239);

        }
        else
        {
          v199 = v231;
        }
        goto LABEL_245;
      }
      v309 = 0u;
      v310 = 0u;
      v307 = 0u;
      v308 = 0u;
      v219 = objc_loadWeakRetained(location);
      objc_msgSend(v219, "participants");
      v220 = (void *)objc_claimAutoreleasedReturnValue();

      v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v307, v329, 16);
      if (v221)
      {
        v222 = *(_QWORD *)v308;
        v223 = 8;
LABEL_227:
        v224 = 0;
        while (1)
        {
          if (*(_QWORD *)v308 != v222)
            objc_enumerationMutation(v220);
          objc_msgSend(*(id *)(*((_QWORD *)&v307 + 1) + 8 * v224), "ID");
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = objc_msgSend(v225, "_appearsToBeEmail");

          if ((v226 & 1) != 0)
            break;
          if (v221 == ++v224)
          {
            v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v307, v329, 16);
            if (v221)
              goto LABEL_227;
            goto LABEL_233;
          }
        }
      }
      else
      {
LABEL_233:
        v223 = 7;
      }

      v227 = [IMMessageStatusChatItem alloc];
      objc_msgSend(v192, "time");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](v227, "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v192, v223, v197, 0, v291, 0);
    }
    v231 = (void *)v198;

    goto LABEL_242;
  }
  v199 = 0;
LABEL_245:
  v305 = 0u;
  v306 = 0u;
  v303 = 0u;
  v304 = 0u;
  objc_msgSend(v192, "syndicationRanges");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v241 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v303, v328, 16);
  if (!v241)
    goto LABEL_261;
  v242 = *(_QWORD *)v304;
  do
  {
    for (m = 0; m != v241; ++m)
    {
      if (*(_QWORD *)v304 != v242)
        objc_enumerationMutation(v240);
      v244 = objc_msgSend(*(id *)(*((_QWORD *)&v303 + 1) + 8 * m), "syndicationStatus");
      if (v244 == 1)
      {
        v246 = 0;
      }
      else
      {
        v245 = 0;
        if (v244 != 2)
          goto LABEL_259;
        v246 = 1;
      }
      v245 = -[IMSyndicationStatusChatItem _initWithItem:withSyndicationStatus:statusItemSequenceNumber:]([IMSyndicationStatusChatItem alloc], "_initWithItem:withSyndicationStatus:statusItemSequenceNumber:", v192, v246, 0);
      if (v245)
        v247 = theArray == 0;
      else
        v247 = 1;
      if (!v247)
        CFArrayAppendValue(theArray, v245);
LABEL_259:

    }
    v241 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v303, v328, 16);
  }
  while (v241);
LABEL_261:

  v248 = v193 != 1;
  if (v199)
    v248 = 1;
  if (!v248)
    v199 = -[IMMessageStatusChatItem _initWithItem:expireStatusType:count:statusItemSequenceNumber:]([IMMessageStatusChatItem alloc], "_initWithItem:expireStatusType:count:statusItemSequenceNumber:", v192, v291, 0, 0);
  if (v199)
  {
    if (theArray)
    {
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v199);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      v250 = v249 == 0;

      if (!v250)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v199);
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue(theArray, v251);

      }
    }
  }
  objc_msgSend(v192, "balloonBundleID");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v252, "length"))
    goto LABEL_279;
  v253 = objc_msgSend(v192, "associatedMessageType") == 3;

  if (!v253)
  {
    +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "pluginSessionGUID");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "balloonBundleID");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v254, "existingDataSourceForMessageGUID:bundleID:", v255, v256);
    v252 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v252, "wantsStatusItem"))
    {
      objc_msgSend(v252, "pluginPayload");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "pluginBundleID");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = objc_msgSend(v258, "isEqualToString:", *MEMORY[0x1E0D375F8]);

      if (v259)
      {
        v260 = -[IMTranscriptPluginStatusChatItem _initWithItem:dataSource:statusItemSequenceNumber:]([IMTranscriptPluginStatusChatItem alloc], "_initWithItem:dataSource:statusItemSequenceNumber:", v192, v252, 0);
        if (theArray)
          goto LABEL_276;
      }
      else
      {
        v261 = [IMTranscriptPluginBreadcrumbChatItem alloc];
        objc_msgSend(v252, "statusString");
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        v260 = -[IMTranscriptPluginBreadcrumbChatItem _initWithItem:datasource:statusText:optionFlags:](v261, "_initWithItem:datasource:statusText:optionFlags:", v192, v252, v262, 0);

        if (theArray)
        {
LABEL_276:
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v260);
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          v264 = v263 == 0;

          if (!v264)
          {
            -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v260);
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            CFArrayAppendValue(theArray, v265);

          }
        }
      }

    }
LABEL_279:

  }
  objc_msgSend(v192, "expressiveSendStyleID");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v267 = -[IMTranscriptChatItemRules shouldShowExpressiveMessageTextAsText:](self, "shouldShowExpressiveMessageTextAsText:", v266);

  if (v267)
  {
    objc_msgSend(v192, "_localizedBackwardsCompatibleExpressiveSendText");
    v268 = (id)objc_claimAutoreleasedReturnValue();
    if (v268)
    {
      v269 = -[IMExpressiveSendAsTextChatItem _initWithItem:text:]([IMExpressiveSendAsTextChatItem alloc], "_initWithItem:text:", v192, v268);
      if (v269)
        v270 = theArray == 0;
      else
        v270 = 1;
      if (!v270)
      {
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v269);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        v272 = v271 == 0;

        if (!v272)
        {
          -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v269);
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          CFArrayAppendValue(theArray, v273);

        }
      }

    }
    goto LABEL_295;
  }
  if (-[IMTranscriptChatItemRules _shouldShowEffectPlayButtonForMessage:](self, "_shouldShowEffectPlayButtonForMessage:", v192))
  {
    v274 = [IMMessageEffectControlChatItem alloc];
    objc_msgSend(v192, "expressiveSendStyleID");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = -[IMMessageEffectControlChatItem _initWithItem:effectStyleID:statusItemSequenceNumber:](v274, "_initWithItem:effectStyleID:statusItemSequenceNumber:", v192, v275, 0);

    if (v268)
      v276 = theArray == 0;
    else
      v276 = 1;
    if (!v276)
      CFArrayAppendValue(theArray, v268);
LABEL_295:

  }
LABEL_297:

LABEL_298:
LABEL_299:
  if (!-[__CFArray count](theArray, "count") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v277 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v300, "guid");
      v278 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v331 = v278;
      _os_log_impl(&dword_1A1FF4000, v277, OS_LOG_TYPE_INFO, "Generated no final chat items for item with GUID: %@", buf, 0xCu);

    }
  }
  v107 = theArray;
  v279 = theArray;
LABEL_305:

  return theArray;
}

- (id)_chatItemsWithReplyCountsForNewChatItems:(id)a3 parentItem:(id)a4 threadOriginatorItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[IMTranscriptChatItemRules _shouldAppendReplyCountIfNeeded](self, "_shouldAppendReplyCountIfNeeded"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;
    v13 = v12;
    if (v12
      && (objc_msgSend(v12, "replyCountsByPart"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "count"),
          v14,
          v15))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = sub_1A20FAF48;
        v24[3] = &unk_1E47221B0;
        v24[4] = self;
        v25 = v9;
        v26 = v13;
        v27 = v16;
        v17 = v16;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v24);
        if (objc_msgSend(v17, "count"))
          v18 = v17;
        else
          v18 = 0;
        v19 = v18;

        goto LABEL_17;
      }
      v17 = v8;
      -[IMTranscriptChatItemRules _replyCountChatItemForChatItem:parentItem:threadOriginatorMessageItem:](self, "_replyCountChatItemForChatItem:parentItem:threadOriginatorMessageItem:", v17, v9, v13);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v28[0] = v17;
        v28[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
        v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
        goto LABEL_18;
      }

      v20 = v17;
    }
    else
    {
      v20 = v8;
    }
    v19 = v20;
LABEL_18:

    goto LABEL_19;
  }
  v19 = v8;
LABEL_19:

  return v19;
}

- (id)_replyCountChatItemForChatItem:(id)a3 parentItem:(id)a4 threadOriginatorMessageItem:(id)a5
{
  return -[IMTranscriptChatItemRules _replyCountChatItemForChatItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:threadOriginatorMessageItem:](self, "_replyCountChatItemForChatItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:threadOriginatorMessageItem:", a3, a4, 0, 0, 0, a5);
}

- (id)_replyCountChatItemForChatItem:(id)a3 parentItem:(id)a4 threadIdentifier:(id)a5 replyMessageGUID:(id)a6 replyIsFromMe:(BOOL)a7 threadOriginatorMessageItem:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  char isKindOfClass;
  id v22;

  v9 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v13;
  else
    v18 = 0;
  v19 = v18;
  v20 = objc_msgSend(v19, "replyCount");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v22 = 0;
  if (v20 && (isKindOfClass & 1) == 0)
  {
    if (!v15)
    {
      IMCreateThreadIdentifierForMessagePartChatItem(v19);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = -[IMMessageReplyCountChatItem _initWithItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:count:statusItemSequenceNumber:]([IMMessageReplyCountChatItem alloc], "_initWithItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:count:statusItemSequenceNumber:", v17, v14, v15, v16, v9, v20, 0);
  }

  return v22;
}

- (BOOL)_shouldRegenerateChatItemsForItem:(id)a3 previousItem:(id)a4 oldPreviousItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  IMChat **p_chat;
  id WeakRetained;
  uint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  id v19;
  int v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 == v10)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    LOBYTE(v12) = 1;
    if (v9 && v10)
    {
      p_chat = &self->_chat;
      WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
      v15 = objc_msgSend(WeakRetained, "chatStyle");

      LODWORD(WeakRetained) = -[IMTranscriptChatItemRules _shouldAppendServiceForItem:previousItem:chatStyle:](self, "_shouldAppendServiceForItem:previousItem:chatStyle:", v8, v9, v15);
      if ((_DWORD)WeakRetained == -[IMTranscriptChatItemRules _shouldAppendServiceForItem:previousItem:chatStyle:](self, "_shouldAppendServiceForItem:previousItem:chatStyle:", v8, v11, v15)&& (v16 = -[IMTranscriptChatItemRules _shouldAppendDateForItem:previousItem:](self, "_shouldAppendDateForItem:previousItem:", v8, v9), v16 == -[IMTranscriptChatItemRules _shouldAppendDateForItem:previousItem:](self, "_shouldAppendDateForItem:previousItem:", v8, v11))&& (v17 = -[IMTranscriptChatItemRules _shouldAppendReplyContextForItem:previousItem:chatStyle:](self, "_shouldAppendReplyContextForItem:previousItem:chatStyle:", v8,
                    v9,
                    v15),
            v17 == -[IMTranscriptChatItemRules _shouldAppendReplyContextForItem:previousItem:chatStyle:](self, "_shouldAppendReplyContextForItem:previousItem:chatStyle:", v8, v11, v15)))
      {
        v19 = objc_loadWeakRetained((id *)&self->_chat);
        v20 = sub_1A20FA900(v19, v8, v9, v15);
        v21 = objc_loadWeakRetained((id *)p_chat);
        v12 = v20 ^ sub_1A20FA900(v21, v8, v11, v15);

      }
      else
      {
        LOBYTE(v12) = 1;
      }
    }
  }

  return v12;
}

- (BOOL)_supportsContiguousChatItems
{
  return 1;
}

- (BOOL)_hasEarlierMessagesToLoad
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v3 = objc_msgSend(WeakRetained, "hasMoreMessagesToLoad");

  return v3;
}

- (BOOL)_hasRecentMessagesToLoad
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v3 = objc_msgSend(WeakRetained, "hasMoreRecentMessagesToLoad");

  return v3;
}

- (BOOL)_shouldAppendReplyContextForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t OriginatorMessagePart;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v21;
  char v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  if (objc_msgSend(v8, "isReply") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (!_IMScheduledMessageShouldBePinnedToBottom(v8) || _IMScheduledMessageShouldBePinnedToBottom(v9)))
    {
      objc_msgSend(v8, "threadIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      IMMessageThreadIdentifierGetOriginatorGUID();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "message");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v11);

      if (v14)
      {
        if (!sub_1A20FAC64(v9))
        {
          OriginatorMessagePart = IMMessageThreadIdentifierGetOriginatorMessagePart();
          v25 = 0;
          v26 = &v25;
          v27 = 0x2020000000;
          v28 = 0;
          objc_msgSend(v12, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "length");
          v18 = *MEMORY[0x1E0D366B8];
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = sub_1A20FB578;
          v24[3] = &unk_1E47221D8;
          v24[4] = &v25;
          objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v17, 2, v24);
          v19 = v26[3] != OriginatorMessagePart;

          _Block_object_dispose(&v25, 8);
LABEL_18:

          goto LABEL_10;
        }
      }
      else
      {
        if (objc_msgSend(v9, "isReply"))
        {
          objc_msgSend(v9, "threadIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v10);

          if ((v22 & 1) != 0)
          {
            v19 = 0;
            goto LABEL_18;
          }
        }
        if (sub_1A20FAC64(v8))
        {
          objc_msgSend(v8, "threadOriginator");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v23, "replyCountForPartIndex:", IMMessageThreadIdentifierGetOriginatorMessagePart()) != 0;

          goto LABEL_18;
        }
      }
      v19 = 1;
      goto LABEL_18;
    }
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
LABEL_10:

  return v19;
}

- (BOOL)_shouldAppendReplyCountIfNeeded
{
  return 1;
}

- (BOOL)_shouldAppendBlockContacts
{
  return 1;
}

- (id)_filteredChatItemsForNewChatItems:(id)a3
{
  return a3;
}

- (BOOL)_shouldAppendScheduledSectionLabelForItem:(id)a3 previousItem:(id)a4
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  unint64_t v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScheduledMessagesEnabled");

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      if (objc_msgSend(v7, "scheduleType") == 2)
      {
        v8 = objc_msgSend(v7, "scheduleState");
        if (v8 <= 5)
          v6 = (9u >> v8) & 1;
        else
          LOBYTE(v6) = 1;
      }
      else
      {
        LOBYTE(v6) = 1;
      }

    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }

  return v6;
}

- (BOOL)_shouldAppendScheduledSectionDateForItem:(id)a3 previousItem:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isScheduledMessagesEnabled");

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    if (objc_msgSend(v7, "changeType"))
      goto LABEL_6;
    objc_msgSend(v7, "_senderHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_otherHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "ID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v13) = objc_msgSend(v12, "isEqualToString:", v14);
    if ((v13 & 1) == 0)
    {
LABEL_6:
      v16 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v16, "scheduleType") != 2)
      {
        v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v17 = objc_msgSend(v16, "scheduleState");
      v15 = 0;
      if (!v17 || v17 == 3)
        goto LABEL_17;
      objc_msgSend(v16, "time");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "time");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", v19);
      v21 = fabs(v20) >= 300.0;

      v22 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v22, "scheduleType") == 2)
      {
        v23 = objc_msgSend(v22, "scheduleState");
        if ((unint64_t)(v23 - 4) >= 2)
        {
          v15 = 1;
          if (!v23 || v23 == 3)
            goto LABEL_22;
          goto LABEL_20;
        }
        v25 = objc_msgSend(v16, "scheduleState");
        if (v25 == objc_msgSend(v22, "scheduleState"))
        {
LABEL_20:
          v15 = v21;
LABEL_22:

          goto LABEL_17;
        }
      }
      v15 = 1;
      goto LABEL_22;
    }
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)_shouldAppendDateForItem:(id)a3 previousItem:(id)a4
{
  return sub_1A20FB910(a3, a4);
}

- (BOOL)_shouldAppendServiceForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5
{
  return sub_1A20FBA50(a3, a4);
}

- (BOOL)_shouldAppendStewieSharingSummaryForChat:(id)a3 item:(id)a4 previousItem:(id)a5
{
  BOOL result;

  result = objc_msgSend(a3, "isStewieSharingChat");
  if (a5)
    return 0;
  return result;
}

- (BOOL)_shouldAppendStoppedSharingForChat:(id)a3 item:(id)a4 previousItem:(id)a5
{
  id v6;
  char isKindOfClass;

  v6 = a4;
  if (objc_msgSend(a3, "isStewieSharingChat"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldShowReportSpamForChat:(id)a3 withItems:(id)a4
{
  return sub_1A20FBD2C(a3, a4);
}

- (BOOL)_shouldAppendSendViaSatelliteForChat:(id)a3 item:(id)a4 previousItem:(id)a5
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCarrierPigeonEnabled");

  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v7, "isPendingSatelliteSend"))
  {
    objc_msgSend(v7, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastSentMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10 == v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldAppendSentViaSatelliteForChat:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  char v15;
  int v16;
  NSObject *v17;
  BOOL v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (!v8)
    goto LABEL_27;
  objc_msgSend(v6, "_service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F70]);

  if (!v11)
    goto LABEL_27;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Checking if we should append sent via satellite for message: %@", (uint8_t *)&v20, 0xCu);

    }
  }
  if ((objc_msgSend(v6, "sentOrReceivedOffGrid") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Message was not sent off grid", (uint8_t *)&v20, 2u);
      }
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (objc_msgSend(v6, "isPendingSatelliteSend"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Message is pending", (uint8_t *)&v20, 2u);
      }
LABEL_26:

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  v15 = objc_msgSend(v6, "isSent");
  v16 = IMOSLoggingEnabled();
  if ((v15 & 1) == 0)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Message is not sent yet", (uint8_t *)&v20, 2u);
      }
      goto LABEL_26;
    }
LABEL_27:
    v18 = 0;
    goto LABEL_28;
  }
  if (v16)
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Appending sent via satellite for message", (uint8_t *)&v20, 2u);
    }

  }
  v18 = 1;
LABEL_28:

  return v18;
}

- (BOOL)_shouldShowStewieResumeButtonsForChat:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;

  v3 = a3;
  if (objc_msgSend(v3, "isStewieEmergencyChat"))
  {
    +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isStewieEmergencyActive");
  }
  else
  {
    if (!objc_msgSend(v3, "isStewieRoadsideChat"))
    {
      v6 = 0;
      goto LABEL_7;
    }
    +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isStewieRoadsideActive");
  }
  v6 = v5 ^ 1;

LABEL_7:
  return v6;
}

- (BOOL)_shouldShowBlockContactForChat:(id)a3 withItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enablementGroup");

  if (v10 == 1 && (objc_msgSend(v7, "allParticipantsBlocked") & 1) == 0)
  {
    objc_msgSend(v8, "__imArrayByFilteringWithBlock:", &unk_1E4722748);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count")
      && (objc_msgSend(v7, "chatStyle") != 43 || objc_msgSend(v7, "joinState")))
    {
      if (objc_msgSend(v7, "hasCommSafetySensitiveMessage")
        && (objc_msgSend(v7, "isCommSafetySensitiveMessageRecent") & 1) != 0)
      {
        v11 = 1;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v7, "shouldBeAllowListed");
    }
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)_shouldAppendNumberChangedForItem:(id)a3 previousItem:(id)a4 lastChatItem:(id)a5 outPhoneNumber:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  char v13;
  int isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  BOOL v37;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v13 = objc_msgSend(WeakRetained, "isStewieChat");

  if ((v13 & 1) != 0
    || !-[IMTranscriptChatItemRules _hasMultipleActiveSubscriptions](self, "_hasMultipleActiveSubscriptions"))
  {
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_msgSend(v10, "destinationCallerID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D34CC8];
    objc_msgSend(v9, "destinationCallerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "destinationCallerID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isPhoneNumber:equivalentToExistingPhoneNumber:", v17, v18))
    {
      objc_msgSend(v9, "accountID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accountID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v9;
      v21 = v11;
      v22 = isKindOfClass;
      isKindOfClass = objc_msgSend(v45, "isEqualToString:", v19) ^ 1;

    }
    else
    {
      v20 = v9;
      v21 = v11;
      v22 = isKindOfClass;
      isKindOfClass = 1;
    }

    v23 = v22 & isKindOfClass;
    LOBYTE(isKindOfClass) = v22;
    v11 = v21;
    v9 = v20;
    if (v23 == 1)
    {
      objc_msgSend(v10, "destinationCallerID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDestinationCallerID:", v24);

      objc_msgSend(v10, "accountID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAccountID:", v25);

    }
  }
  v26 = objc_opt_class();
  if (v26 == objc_opt_class())
    goto LABEL_22;
  v27 = objc_opt_class();
  if (!((v27 != objc_opt_class()) | isKindOfClass & 1))
  {
    -[IMTranscriptChatItemRules _currentChatSubscriptionLabel](self, "_currentChatSubscriptionLabel");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    if (!IMOSLoggingEnabled())
    {
LABEL_33:
      v37 = 1;
      goto LABEL_23;
    }
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v39 = *a6;
      *(_DWORD *)buf = 138412290;
      v48 = v39;
      _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Found a SIM switch item with label %@, replacing it with Number Changed item", buf, 0xCu);
    }
LABEL_32:

    goto LABEL_33;
  }
  objc_msgSend(v9, "destinationCallerID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_22;
  objc_msgSend(v9, "destinationCallerID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "destinationIdIsPhoneNumber");

  if (!v30)
    goto LABEL_22;
  objc_msgSend(v9, "destinationCallerID");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D34CC8];
  objc_msgSend(v10, "destinationCallerID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isPhoneNumber:equivalentToExistingPhoneNumber:", v31, v33);

  objc_msgSend(v10, "destinationCallerID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    v36 = v34;
  else
    v36 = 1;

  if ((v36 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "ctSubscriptionInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "__im_labelForPhoneNumber:simID:", v31, v31);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "destinationCallerID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *a6;
        *(_DWORD *)buf = 138412802;
        v48 = v43;
        v49 = 2112;
        v50 = v31;
        v51 = 2112;
        v52 = v44;
        _os_log_impl(&dword_1A1FF4000, v42, OS_LOG_TYPE_INFO, "Destination caller ID changed from: %@ to: %@, label: %@", buf, 0x20u);

      }
    }
    goto LABEL_32;
  }

LABEL_22:
  v37 = 0;
LABEL_23:

  return v37;
}

- (BOOL)_hasMultipleActiveSubscriptions
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "__im_onlyHasActiveSlots");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_updateAggregateAttachmentMessagePartAssociatedItems:(id)a3 map:(id)a4
{
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = v6;
      objc_msgSend(v6, "aggregateAttachmentParts");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v9)
      {
        v8 = 0;
        goto LABEL_23;
      }
      v10 = v9;
      v8 = 0;
      v11 = *(_QWORD *)v27;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          sub_1A20FD024(v13, v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = v14;
            sub_1A20FD2AC(v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v16 = 0;
          }
          objc_msgSend(v13, "visibleAssociatedMessageChatItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[IMTranscriptChatItemRules _shouldReloadChatItemWithAssociatedChatItems:oldAssociatedChatItems:](self, "_shouldReloadChatItemWithAssociatedChatItems:oldAssociatedChatItems:", v16, v17);

          if (v18)
          {
            if (v16)
            {
              v19 = v13;
              v20 = v16;
              goto LABEL_17;
            }
            objc_msgSend(v13, "visibleAssociatedMessageChatItems");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v22)
            {
              v19 = v13;
              v20 = 0;
LABEL_17:
              objc_msgSend(v19, "_setVisibleAssociatedMessageChatItems:", v20);
            }
            v8 = 1;
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (!v10)
        {
LABEL_23:

          v6 = v24;
          goto LABEL_24;
        }
      }
    }
  }
  v8 = 0;
LABEL_24:

  return v8 & 1;
}

- (id)_newDeliveredChatItemWithStatusType:(int64_t)a3 atIndex:(int64_t)a4 chatItems:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  int v22;
  int64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(v8, "objectAtIndex:", a4 - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeDelivered");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "time");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "laterDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v10;
  v15 = objc_msgSend(v14, "expireState");
  if (v15 == 1)
  {
    if ((objc_msgSend(v14, "isFromMe") & 1) != 0 || (IMMessageItemTimeIntervalSinceStartedExpiring(), v16 >= 3.0))
      v17 = 3;
    else
      v17 = 2;
  }
  else
  {
    v17 = 0;
  }

  v18 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:]([IMMessageStatusChatItem alloc], "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v14, a3, v13, 0, v17, 0);
  -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == 1)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v8, "count") <= (unint64_t)a4 || !v19)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = 134218498;
          v23 = a4;
          v24 = 2048;
          v25 = objc_msgSend(v8, "count");
          v26 = 2112;
          v27 = v19;
          _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "_processChatItems couldn't replace Delivered object at index %lu, chatItems count: %lu, item %@", (uint8_t *)&v22, 0x20u);
        }

      }
    }
    else
    {
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a4, v19);

      v19 = 0;
    }
  }

  return v19;
}

- (id)_newiMessageLiteSentItemWithStatusType:(int64_t)a3 atIndex:(int64_t)a4 chatItems:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  int v22;
  int64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(v8, "objectAtIndex:", a4 - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeDelivered");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "time");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "laterDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v10;
  v15 = objc_msgSend(v14, "expireState");
  if (v15 == 1)
  {
    if ((objc_msgSend(v14, "isFromMe") & 1) != 0 || (IMMessageItemTimeIntervalSinceStartedExpiring(), v16 >= 3.0))
      v17 = 3;
    else
      v17 = 2;
  }
  else
  {
    v17 = 0;
  }

  v18 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:]([IMMessageStatusChatItem alloc], "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v14, a3, v13, 0, v17, 0);
  -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == 1)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v8, "count") <= (unint64_t)a4 || !v19)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = 134218498;
          v23 = a4;
          v24 = 2048;
          v25 = objc_msgSend(v8, "count");
          v26 = 2112;
          v27 = v19;
          _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "_processChatItems couldn't replace Delivered object at index %lu, chatItems count: %lu, item %@", (uint8_t *)&v22, 0x20u);
        }

      }
    }
    else
    {
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a4, v19);

      v19 = 0;
    }
  }

  return v19;
}

- (id)_updateOrRemoveDeliveredStatusItemMovingFromOldIndex:(int64_t)a3 chatItems:(id)a4
{
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_item");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "expireState") == 1)
  {
    if ((objc_msgSend(v6, "isFromMe") & 1) != 0 || (IMMessageItemTimeIntervalSinceStartedExpiring(), v7 >= 3.0))
      v8 = 3;
    else
      v8 = 2;

    v10 = -[IMMessageStatusChatItem _initWithItem:expireStatusType:count:statusItemSequenceNumber:]([IMMessageStatusChatItem alloc], "_initWithItem:expireStatusType:count:statusItemSequenceNumber:", v6, v8, 0, 0);
    -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v9 = 0;
    v10 = v6;
  }

  return v9;
}

- (id)_updateOrRemoveiMessageLiteSentItemMovingFromOldIndex:(int64_t)a3 chatItems:(id)a4
{
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_item");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "expireState") == 1)
  {
    if ((objc_msgSend(v6, "isFromMe") & 1) != 0 || (IMMessageItemTimeIntervalSinceStartedExpiring(), v7 >= 3.0))
      v8 = 3;
    else
      v8 = 2;

    v10 = -[IMMessageStatusChatItem _initWithItem:expireStatusType:count:statusItemSequenceNumber:]([IMMessageStatusChatItem alloc], "_initWithItem:expireStatusType:count:statusItemSequenceNumber:", v6, v8, 0, 0);
    -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v9 = 0;
    v10 = v6;
  }

  return v9;
}

- (BOOL)_shouldAdjustNewDeliveredItemIndex:(int64_t)a3 chatItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;

  v5 = a4;
  v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v5, "count") <= (unint64_t)a3)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a3 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectAtIndex:", a3);
      v8 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v7 = (void *)v8;
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  return isKindOfClass & 1;
}

- (void)_processSuggestedActionResponses:(id)a3
{
  id v3;
  void *v4;
  int v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLazuliEnabled");

  if (v5)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = sub_1A200AE94;
    v11 = sub_1A200ACBC;
    v12 = 0;
    v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1A2111F80;
    v6[3] = &unk_1E4722400;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v6);
    objc_msgSend(v3, "removeObjectsAtIndexes:", v8[5]);
    _Block_object_dispose(&v7, 8);

  }
}

- (void)_processChatItemsForBreadcrumbs:(id)a3
{
  id v4;
  _QWORD v5[9];
  _QWORD v6[4];
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1A200AE94;
  v15 = sub_1A200ACBC;
  v16 = 0;
  v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1A200AE94;
  v9[4] = sub_1A200ACBC;
  v10 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1A200AE94;
  v7[4] = sub_1A200ACBC;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A21121E0;
  v5[3] = &unk_1E4722428;
  v5[6] = &v11;
  v5[7] = v9;
  v5[8] = v6;
  v5[4] = self;
  v5[5] = v7;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v5);
  objc_msgSend(v4, "removeObjectsAtIndexes:", v12[5]);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);

}

- (void)_manageMomentShareAndAggregateItemsForChatItems:(id)a3
{
  id v4;
  IMChat **p_chat;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  void *v15;
  char v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  _BOOL4 IsPermanent;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  unint64_t v61;
  int v62;
  void *v63;
  id v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  id *location;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint8_t v87[4];
  _QWORD v88[3];

  *(_QWORD *)((char *)&v88[1] + 4) = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_chat = &self->_chat;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend(WeakRetained, "momentShareCache");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)p_chat);
  objc_msgSend(v7, "momentSharePresentationCache");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMPhotoLibraryPersistenceManager sharedInstance](IMPhotoLibraryPersistenceManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)p_chat;
  v9 = objc_loadWeakRetained((id *)p_chat);
  objc_msgSend(v8, "unregisterPhotoLibraryPersistenceManagerListener:", v9);

  v10 = objc_msgSend(v4, "count");
  if (v10 >= 1)
  {
    v11 = v10;
    v71 = v4;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v11 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v14 = v11 - 1;
      if (v11 == 1 || (isKindOfClass & 1) == 0)
        goto LABEL_7;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v11 - 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v4, "removeObjectAtIndex:", v11 - 1);
LABEL_61:

LABEL_62:
      --v11;
      if ((unint64_t)(v14 + 1) <= 1)
        goto LABEL_63;
    }

LABEL_7:
    v16 = objc_msgSend(v12, "isReplyContextPreview");
    v17 = objc_msgSend(v12, "isEditedMessageHistory");
    if ((v16 & 1) != 0 || (v17 & 1) != 0)
      goto LABEL_62;
    v18 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      IMCoreMomentShareURLForMessage(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = v20 != 0;
      if (v20)
      {
        objc_msgSend(v20, "absoluteString");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
      v22 = 0;
    }

    v24 = v23;
    v15 = v24;
    if (!v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "aggregateAttachmentParts");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");
        v33 = +[IMMessagePartChatItem _attachmentStackAggregationThreshold](IMMessagePartChatItem, "_attachmentStackAggregationThreshold");

        if (v32 > v33)
        {
          +[IMPhotoLibraryPersistenceManager sharedInstance](IMPhotoLibraryPersistenceManager, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_loadWeakRetained(location);
          objc_msgSend(v34, "registerPhotoLibraryPersistenceManagerListener:", v35);

          v85 = 0;
          v86 = 0;
          v84 = 0;
          sub_1A2112D54(v18, &v86, &v85, &v84);
          sub_1A2112C20(v4, v18, v11 - 1, v86, v85, v84);
        }
      }
      goto LABEL_61;
    }
    if (objc_msgSend(v24, "length"))
    {
      v83 = 0;
      objc_msgSend(v70, "momentShareForURLString:error:", v15, &v83);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v83;
      v27 = v26;
      if (v25)
      {
        v79 = v26;
        objc_msgSend(v68, "statusPresentationForMomentShareURLString:", v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        IsPermanent = 0;
        goto LABEL_28;
      }
      IMLogHandleForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_1A2197E9C(v87, v27, v88, v36);

    }
    else
    {
      v27 = 0;
    }
    v79 = v27;
    IsPermanent = IMMomentShareCacheErrorIsPermanent(v27);
    v28 = 0;
    v25 = 0;
    v29 = 1;
LABEL_28:
    v37 = v18;
    v38 = v25;
    v39 = v28;
    v40 = v39;
    v85 = 0;
    v86 = 0;
    v84 = 0;
    if ((v29 & 1) != 0)
    {
      if (IsPermanent)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          sub_1A2112D54(v37, &v86, &v85, &v84);
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v74 = v85;
          v75 = v86;
          v73 = v84;
          goto LABEL_36;
        }
      }
      v73 = 0;
      v74 = 0;
      v75 = 0;
      v41 = 0;
      v42 = 0;
    }
    else
    {
      objc_msgSend(v39, "activityTitle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "expiryDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v38, "photosCount");
      v74 = objc_msgSend(v38, "videosCount");
      v73 = objc_msgSend(v40, "numberOfAssetsCopied");
      if (objc_msgSend(v40, "type") == 1)
      {
        v43 = objc_msgSend(v40, "state") == 2;
        goto LABEL_36;
      }
    }
    v43 = 0;
LABEL_36:
    v44 = objc_retainAutorelease(v41);
    v45 = objc_retainAutorelease(v42);

    v77 = v40;
    v78 = v38;

    v46 = v44;
    v47 = v45;
    v4 = v71;
    v48 = v71;
    v49 = v37;
    v81 = v46;
    v50 = v47;
    v51 = v48;
    v82 = v50;
    objc_msgSend(v49, "_item");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v48;
    v76 = v43;
    if (v11 >= objc_msgSend(v48, "count"))
    {
      v52 = 0;
    }
    else
    {
      objc_msgSend(v48, "objectAtIndexedSubscript:", v11);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        objc_opt_class();
        v53 = v81;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v52, "wouldBeEqualIfInitializedWithItem:activityTitle:expirationDate:", v80, v81, v82) & 1) == 0)
          {
            v54 = -[IMMomentShareStatusChatItem _initWithItem:activityTitle:expirationDate:]([IMMomentShareStatusChatItem alloc], "_initWithItem:activityTitle:expirationDate:", v80, v81, v82);
            objc_msgSend(v48, "replaceObjectAtIndex:withObject:", v11, v54);
LABEL_53:

            v4 = v71;
          }
LABEL_54:

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v60 = v49;
            objc_msgSend(v60, "setNumberOfMomentShareSavedAssets:", v73);
            objc_msgSend(v60, "setNumberOfMomentSharePhotos:", v75);
            objc_msgSend(v60, "setNumberOfMomentShareVideos:", v74);

          }
          v61 = +[IMMessagePartChatItem _attachmentStackAggregationThreshold](IMMessagePartChatItem, "_attachmentStackAggregationThreshold");
          v62 = v76;
          if (v75 + v74 > v61)
            v62 = 1;
          if (v62 == 1)
          {
            +[IMPhotoLibraryPersistenceManager sharedInstance](IMPhotoLibraryPersistenceManager, "sharedInstance");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_loadWeakRetained(location);
            objc_msgSend(v63, "registerPhotoLibraryPersistenceManagerListener:", v64);

            sub_1A2112C20(v72, v49, v14, v75, v74, v73);
          }

          goto LABEL_61;
        }
LABEL_43:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_54;
        v55 = v49;
        v56 = v48;
        v54 = v55;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v11 < objc_msgSend(v56, "count"))
        {
          objc_msgSend(v56, "objectAtIndexedSubscript:", v11);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v67 = v57;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v57, "layoutGroupIdentifier");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "layoutGroupIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "isEqualToString:");

            if ((v66 & 1) != 0)
              goto LABEL_52;
            goto LABEL_51;
          }

        }
LABEL_51:
        v59 = -[IMMomentShareStatusChatItem _initWithItem:activityTitle:expirationDate:]([IMMomentShareStatusChatItem alloc], "_initWithItem:activityTitle:expirationDate:", v80, v53, v82);
        objc_msgSend(v56, "insertObject:atIndex:", v59, v11);

        v53 = v81;
LABEL_52:
        v51 = v72;
        goto LABEL_53;
      }
    }
    v53 = v81;
    goto LABEL_43;
  }
LABEL_63:

}

- (BOOL)_shouldDisplayAttributionInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D37F20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = *MEMORY[0x1E0D37F30];
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D37F30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      +[IMBalloonPluginAttributionController sharedInstance](IMBalloonPluginAttributionController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "shouldShowAttributionForBundleID:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_editedStatusItemForEditedMessagePartChatItem:(id)a3 combiningStatusType:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  id WeakRetained;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  uint64_t v27;
  id v28;

  v6 = a3;
  objc_msgSend(v6, "_item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isFailedEditMessagePart");
  v9 = objc_msgSend(v6, "isFailedRetractMessagePart");
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend(v6, "guid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(WeakRetained, "isShowingEditHistoryForChatItemGUID:", v11);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "isScheduledMessagesEnabled");

  if ((_DWORD)v11 && objc_msgSend(v6, "scheduleType") == 2)
  {
    if ((v8 | v9) != 1)
    {
      v14 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    v9 = 0;
  }
  if ((unint64_t)a4 > 0x1F)
  {
LABEL_27:
    v20 = 20;
    if (v9)
      v20 = 34;
    v21 = 23;
    if (!v12)
      v21 = v20;
    v12 = 0;
    if ((v8 & 1) != 0)
      v18 = 26;
    else
      v18 = v21;
    goto LABEL_34;
  }
  if (((1 << a4) & 0xF2400002) != 0)
  {
    v15 = 22;
    if (v12)
      v15 = 25;
    v16 = v8 == 0;
    v17 = 28;
LABEL_11:
    if (v16)
      v18 = v15;
    else
      v18 = v17;
    goto LABEL_14;
  }
  if (((1 << a4) & 0x9200010) == 0)
  {
    if (a4 == 2)
    {
      v15 = 29;
      if (v12)
        v15 = 30;
      v16 = v8 == 0;
      v17 = 31;
      goto LABEL_11;
    }
    goto LABEL_27;
  }
  if ((v8 & 1) != 0)
  {
    v18 = 27;
LABEL_35:
    objc_msgSend(v7, "timeRead");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (v12)
    v18 = 24;
  else
    v18 = 21;
  if (((v12 ^ 1) & 1) != 0)
    goto LABEL_35;
LABEL_34:
  if (v12)
    goto LABEL_35;
LABEL_14:
  objc_msgSend(v7, "timeDelivered");
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_36:
  v22 = (void *)v19;
  objc_msgSend(v7, "time");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "laterDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v7;
  if (objc_msgSend(v25, "expireState") == 1)
  {
    if ((objc_msgSend(v25, "isFromMe") & 1) != 0 || (IMMessageItemTimeIntervalSinceStartedExpiring(), v26 >= 3.0))
      v27 = 3;
    else
      v27 = 2;
  }
  else
  {
    v27 = 0;
  }

  v28 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:]([IMMessageStatusChatItem alloc], "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v25, v18, v24, 0, v27, 0);
  -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
  return v14;
}

- (id)_attributionChatItemForChatItem:(id)a3
{
  id v3;
  id v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  IMMessageAttributionChatItem *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v60;
  uint64_t v61;
  char v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "isReplyContextPreview") & 1) == 0
    && (objc_msgSend(v3, "isEditedMessageHistory") & 1) == 0)
  {
    v6 = v3;
    objc_msgSend(v6, "visibleAssociatedMessageChatItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v55 = v6;
      objc_msgSend(v6, "_visibleAssociatedChatItemsByFlatteningAggregateChatItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (v10)
      {
        v11 = v10;
        v53 = v3;
        v57 = 0;
        v12 = 0;
        v13 = 0;
        v62 = 0;
        v14 = *(_QWORD *)v68;
        v60 = *(_QWORD *)v68;
        do
        {
          v15 = 0;
          v61 = v11;
          do
          {
            if (*(_QWORD *)v68 != v14)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v15);
            v17 = objc_msgSend(v16, "associatedMessageType");
            if ((objc_msgSend(v16, "isFromMe") & 1) == 0 && (v17 == 2007 || v17 == 1000))
            {
              v18 = v9;
              objc_msgSend(v16, "commSafetyTransferGUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "transferForGUID:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v21, "attributionInfo");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "commSafetySensitive");
              v24 = 8;
              if ((v62 & 1) != 0)
                v24 = 9;
              v25 = v23 == 1;
              if (v23 == 1)
                v12 = v24;
              if (v13)
              {
                objc_msgSend(v16, "time");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v13;
                v28 = v26 >= v13;

              }
              else
              {
                v27 = 0;
                v28 = 1;
              }
              v62 |= v25;
              if ((v62 & 1) != 0)
              {
                v13 = v27;
                v9 = v18;
              }
              else
              {
                v9 = v18;
                if (-[IMTranscriptChatItemRules _shouldDisplayAttributionInfo:](self, "_shouldDisplayAttributionInfo:", v22)&& v28)
                {
                  v29 = v22;

                  objc_msgSend(v16, "time");
                  v30 = objc_claimAutoreleasedReturnValue();

                  v57 = v29;
                  v12 = 4;
                  v13 = (void *)v30;
                }
                else
                {
                  v13 = v27;
                }
              }
              v14 = v60;

              v11 = v61;
            }
            ++v15;
          }
          while (v11 != v15);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        }
        while (v11);

        v3 = v53;
        v6 = v55;
        v31 = v57;
        if (v12)
          goto LABEL_63;
      }
      else
      {

        v13 = 0;
        v31 = 0;
      }
    }
    else
    {
      v13 = 0;
      v31 = 0;
    }
    objc_opt_class();
    v32 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v6;
      objc_msgSend(v33, "type");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "containsString:", *MEMORY[0x1E0D375E8]);

      if ((v35 & 1) != 0 || (objc_msgSend(v33, "isFromMe") & 1) != 0)
      {
        v12 = 0;
        v13 = v32;
        goto LABEL_58;
      }
      v56 = v6;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v33, "_item");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "fileTransferGUIDs");
      v38 = (id)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v42)
      {
        v43 = v42;
        v58 = v31;
        v54 = v3;
        v44 = *(_QWORD *)v64;
        while (2)
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v64 != v44)
              objc_enumerationMutation(v38);
            v46 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
            +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "transferForGUID:", v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "attributionInfo");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[IMTranscriptChatItemRules _shouldDisplayAttributionInfo:](self, "_shouldDisplayAttributionInfo:", v31))
            {

              v12 = 1;
              v3 = v54;
              goto LABEL_56;
            }

          }
          v13 = v32;
          v43 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
          if (v43)
            continue;
          break;
        }
        v12 = 0;
        v3 = v54;
        v31 = v58;
        goto LABEL_57;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v6, "isFromMe") & 1) != 0)
      {
LABEL_59:
        if ((objc_msgSend(v6, "requiresSiriAttribution") & 1) != 0)
        {
          v12 = 6;
        }
        else
        {
          if (!objc_msgSend(v6, "requiresFaceTimeAttribution"))
          {
            v4 = 0;
            goto LABEL_64;
          }
          v12 = 7;
        }
LABEL_63:
        v49 = [IMMessageAttributionChatItem alloc];
        objc_msgSend(v6, "_item");
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = v12;
        v52 = (void *)v50;
        v4 = -[IMMessageAttributionChatItem _initWithItem:attributionInfo:attributionType:showsLearnMoreLink:statusItemSequenceNumber:](v49, "_initWithItem:attributionInfo:attributionType:showsLearnMoreLink:statusItemSequenceNumber:", v50, v31, v51, 0, 0);

LABEL_64:
        goto LABEL_5;
      }
      +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v6;
      objc_msgSend(v6, "transferGUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "transferForGUID:", v37);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "attributionInfo");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      if (-[IMTranscriptChatItemRules _shouldDisplayAttributionInfo:](self, "_shouldDisplayAttributionInfo:", v38))
      {
        v38 = v38;

        objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0D37F30]);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "containsString:", *MEMORY[0x1E0D37600]);

        if (v40)
          v12 = 2;
        else
          v12 = 3;
        v31 = v38;
        goto LABEL_56;
      }
    }
    v12 = 0;
LABEL_56:
    v13 = v32;
LABEL_57:

    v6 = v56;
LABEL_58:

    if (v12)
      goto LABEL_63;
    goto LABEL_59;
  }
  v4 = 0;
LABEL_5:

  return v4;
}

- (id)_effectControlForChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expressiveSendStyleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[IMTranscriptChatItemRules _shouldShowEffectPlayButtonForMessage:](self, "_shouldShowEffectPlayButtonForMessage:", v5))
    {
      v7 = -[IMMessageEffectControlChatItem _initWithItem:effectStyleID:statusItemSequenceNumber:]([IMMessageEffectControlChatItem alloc], "_initWithItem:effectStyleID:statusItemSequenceNumber:", v5, v6, 0);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_processChatItemsForIsShowingEditHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1A200AE94;
  v18 = sub_1A200ACBC;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1A200AE94;
  v12 = sub_1A200ACBC;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A2113BEC;
  v7[3] = &unk_1E4722450;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  if (objc_msgSend((id)v15[5], "count"))
  {
    v5 = (void *)objc_msgSend((id)v15[5], "copy");
    v6 = (void *)objc_msgSend((id)v9[5], "copy");
    objc_msgSend(v4, "replaceObjectsAtIndexes:withObjects:", v5, v6);

  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

- (void)_processChatItemsForEditedStatus:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  IMTranscriptChatItemRules *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v4 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1A200AE94;
  v42 = sub_1A200ACBC;
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1A200AE94;
  v36 = sub_1A200ACBC;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1A200AE94;
  v30 = sub_1A200ACBC;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1A200AE94;
  v24 = sub_1A200ACBC;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = sub_1A2114004;
  v13 = &unk_1E4722478;
  v5 = v4;
  v14 = v5;
  v15 = self;
  v16 = &v26;
  v17 = &v20;
  v18 = &v38;
  v19 = &v32;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);
  if (objc_msgSend((id)v27[5], "count", v10, v11, v12, v13))
  {
    v6 = objc_msgSend((id)v27[5], "count");
    if (v6 == objc_msgSend((id)v21[5], "count"))
    {
      objc_msgSend(v5, "replaceObjectsAtIndexes:withObjects:", v27[5], v21[5]);
    }
    else
    {
      IMLogHandleForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_1A2197F74();

    }
  }
  if (objc_msgSend((id)v39[5], "count"))
  {
    v8 = objc_msgSend((id)v39[5], "count");
    if (v8 == objc_msgSend((id)v33[5], "count"))
    {
      objc_msgSend(v5, "insertObjects:atIndexes:", v33[5], v39[5]);
    }
    else
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        sub_1A2197F10();

    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

}

- (BOOL)isReadStatusItem:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IMTranscriptChatItemRules isReadStatusType:](self, "isReadStatusType:", objc_msgSend(v4, "statusType"));

  return v5;
}

- (BOOL)isReadStatusType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1C) & (0x9200010u >> a3);
}

- (BOOL)isDeliveredStatusItem:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IMTranscriptChatItemRules isDeliveredStatusType:](self, "isDeliveredStatusType:", objc_msgSend(v4, "statusType"));

  return v5;
}

- (BOOL)isDeliveredStatusType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x20) & (0xF2400006 >> a3);
}

- (void)_processChatItemsForReplayButton:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  IMTranscriptChatItemRules *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1A200AE94;
  v23 = sub_1A200ACBC;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1A200AE94;
  v17 = sub_1A200ACBC;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A21145D0;
  v7[3] = &unk_1E47224A0;
  v5 = v4;
  v8 = v5;
  v9 = self;
  v10 = &v25;
  v11 = &v13;
  v12 = &v19;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
  if (v26[3])
    objc_msgSend(v5, "removeObjectAtIndex:");
  v6 = objc_msgSend((id)v20[5], "count");
  if (v6 == objc_msgSend((id)v14[5], "count") && objc_msgSend((id)v14[5], "count"))
    objc_msgSend(v5, "insertObjects:atIndexes:", v14[5], v20[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

- (void)_processChatItemsForMessageStatusSequenceNumber:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A211484C;
  v7[3] = &unk_1E47224C8;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (int64_t)_lastItemIndexExcludingScheduledSection:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScheduledMessagesCoreEnabled");

  if (v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1A2114A2C;
    v9[3] = &unk_1E4722400;
    v9[4] = &v10;
    objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v9);
    v6 = v11[3];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = objc_msgSend(v3, "count");
    if (v7)
      v6 = v7 - 1;
    else
      v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (int64_t)_lastItemIndexExcludingWatchReplyOptions:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "count");
  if (v3)
    return v3 - 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)addChatItem:(id)a3 toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isScheduledMessagesCoreEnabled");

  if (v8)
  {
    v9 = -[IMTranscriptChatItemRules _lastItemIndexExcludingScheduledSection:](self, "_lastItemIndexExcludingScheduledSection:", v6);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "insertObject:atIndex:", v12, v9 + 1);
      goto LABEL_7;
    }
    v10 = v6;
    v11 = v12;
  }
  else
  {
    v10 = v6;
    v11 = v12;
  }
  objc_msgSend(v10, "addObject:", v11);
LABEL_7:

}

- (void)_processChatItemsForKeyTransparencyStatus:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id WeakRetained;
  unint64_t v9;
  id v10;
  IMKeyTransparencyStatusChangedChatItem *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A2114D98;
  v16[3] = &unk_1E47224F0;
  v18 = v5;
  v7 = v6;
  v17 = v7;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v16);
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v15 = 0;
  v9 = objc_msgSend(WeakRetained, "keyTransparencyStatusForAffectedHandles:", &v15);
  v10 = v15;

  if (v9 <= 0xB && ((1 << v9) & 0xA60) != 0)
  {
    v11 = [IMKeyTransparencyStatusChangedChatItem alloc];
    v12 = objc_loadWeakRetained((id *)&self->_chat);
    v13 = -[IMKeyTransparencyStatusChangedChatItem _initWithHandles:status:isGroupChat:](v11, "_initWithHandles:status:isGroupChat:", v10, v9, objc_msgSend(v12, "isGroupChat"));

    -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v4, "removeObjectsAtIndexes:", v7);
    if (v14)
      -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v14, v4);

  }
  else if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v4, "removeObjectsAtIndexes:", v7);
  }

}

- (void)_processChatItemsForExpandedEditedMessageHistory:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23[2];
  id location;
  _QWORD v25[4];
  id v26;
  uint64_t v27;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1A2115018;
  v25[3] = &unk_1E47224F0;
  v27 = v6;
  v9 = v7;
  v26 = v9;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 0, v25);
  objc_msgSend(v4, "removeObjectsAtIndexes:", v9);
  if (objc_msgSend(WeakRetained, "isShowingEditHistoryForAnyChatItem"))
  {
    v10 = (void *)objc_opt_class();
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    location = 0;
    objc_initWeak(&location, self);
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = sub_1A2115060;
    v19[3] = &unk_1E4722540;
    v23[1] = v10;
    v20 = WeakRetained;
    objc_copyWeak(v23, &location);
    v13 = v11;
    v21 = v13;
    v14 = v12;
    v22 = v14;
    objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 0, v19);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_1A211526C;
    v16[3] = &unk_1E4722590;
    v15 = v14;
    v17 = v15;
    v18 = v4;
    objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v16);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);

  }
}

- (id)_historyToDisplayForMessageItem:(id)a3 partIndex:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "historyForMessagePart:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v5, "removeLastObject");
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void)_processChatItemsForSatelliteAvailabilityIndicator:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];

  v4 = a3;
  if (((IMGetDomainBoolForKey() & 1) != 0
     || (v5 = objc_loadWeakRetained((id *)&self->_chat),
         v6 = objc_msgSend(v5, "shouldDisplayOffGridModeStatus"),
         v5,
         v6))
    && (v7 = objc_loadWeakRetained((id *)&self->_chat), v8 = objc_msgSend(v7, "chatStyle"), v7, v8 == 45))
  {
    objc_msgSend(v4, "__imLastMessageItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isPendingSatelliteSend") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v9, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (_QWORD *)MEMORY[0x1E0D38F70];
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D38F70]) & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
        objc_msgSend(WeakRetained, "account");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "service");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "internalName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v16, "isEqualToString:", *v12) ^ 1;

      }
    }

  }
  else
  {
    v10 = 0;
  }
  v17 = objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1A2115528;
  v18[3] = &unk_1E47222C0;
  v18[4] = self;
  -[IMTranscriptChatItemRules _insertOrMoveChatItemToEndOfChatItems:chatItemClass:shouldInsert:chatItemCreationBlock:](self, "_insertOrMoveChatItemToEndOfChatItems:chatItemClass:shouldInsert:chatItemCreationBlock:", v4, v17, v10, v18);

}

- (void)_processChatItemsForSatelliteNoDeliveryStatusIndicator:(id)a3
{
  IMChat **p_chat;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];

  p_chat = &self->_chat;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_chat);
  objc_msgSend(WeakRetained, "lastSentMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)p_chat);
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "internalName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (_QWORD *)MEMORY[0x1E0D38F70];
  v13 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D38F70]);

  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v14, "isSatelliteConnectionActive");

  v15 = objc_msgSend(v7, "sentOrReceivedOffGrid");
  v16 = 0;
  if ((v10 & 1) == 0 && v13)
  {
    if (((objc_msgSend(v7, "isDelivered") | v15) & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v7, "_imMessageItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v18, "isEqualToString:", *v12);

    }
  }
  v19 = objc_opt_class();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1A211573C;
  v20[3] = &unk_1E47222C0;
  v20[4] = self;
  -[IMTranscriptChatItemRules _insertOrMoveChatItemToEndOfChatItems:chatItemClass:shouldInsert:chatItemCreationBlock:](self, "_insertOrMoveChatItemToEndOfChatItems:chatItemClass:shouldInsert:chatItemCreationBlock:", v5, v19, v16, v20);

}

- (void)_insertOrMoveChatItemToEndOfChatItems:(id)a3 chatItemClass:(Class)a4 shouldInsert:(BOOL)a5 chatItemCreationBlock:(id)a6
{
  _BOOL4 v7;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  Class v21;

  v7 = a5;
  v18 = a3;
  v10 = (void (**)(_QWORD))a6;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1A211591C;
  v19[3] = &unk_1E47224F0;
  v21 = a4;
  v12 = v11;
  v20 = v12;
  objc_msgSend(v18, "enumerateObjectsWithOptions:usingBlock:", 2, v19);
  v13 = objc_msgSend(v12, "count");
  if (v7)
  {
    if (v13)
    {
      v14 = objc_msgSend(v18, "count") - 1;
      v15 = objc_msgSend(v12, "lastIndex");
      if (v14 == v15)
        goto LABEL_10;
      objc_msgSend(v18, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectsAtIndexes:", v12);
      if (!v16)
        goto LABEL_10;
    }
    else
    {
      v10[2](v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_10;
    }
    -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v16, v18);

    goto LABEL_10;
  }
  if (v13)
    objc_msgSend(v18, "removeObjectsAtIndexes:", v12);
LABEL_10:

}

- (void)_processChatItemsForUnknownInternationalSender:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!IMIsInternationalFilteringAccount())
    goto LABEL_42;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v6 = objc_msgSend(WeakRetained, "hasKnownParticipants");

  if (!v6)
  {
    v30 = v4;
    v29 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptChatItemRules _items](self, "_items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__imArrayByFilteringWithBlock:", &unk_1E47225D0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "originalUnformattedID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = objc_msgSend(MEMORY[0x1E0D39B70], "shouldShowInternationalSenderWarningForHandleID:", v15);

              if ((v16 & 1) != 0)
              {
                LODWORD(v11) = 1;
                goto LABEL_19;
              }
            }
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_19:

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1A2115E34;
    v31[3] = &unk_1E47224F0;
    v33 = v29;
    v17 = v28;
    v32 = v17;
    objc_msgSend(v30, "enumerateObjectsWithOptions:usingBlock:", 2, v31);
    v18 = objc_loadWeakRetained((id *)&self->_chat);
    v19 = objc_msgSend(v18, "isFiltered");

    v20 = IMOSLoggingEnabled();
    if ((v11 & (v19 != 0)) == 0)
    {
      if (v20)
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = CFSTR("NO");
          if (v19)
            v27 = CFSTR("YES");
          else
            v27 = CFSTR("NO");
          if ((_DWORD)v11)
            v26 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          v39 = v27;
          v40 = 2112;
          v41 = v26;
          _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "Not showing unknown international status item. chat.isFiltered=%@ and hasUnknownInternationalParticipant=%@", buf, 0x16u);
        }

      }
      if (objc_msgSend(v17, "count"))
        objc_msgSend(v30, "removeObjectsAtIndexes:", v17);
      goto LABEL_41;
    }
    if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Chat has unknown international participant, inserting status item for unknown international number.", buf, 2u);
      }

    }
    if (objc_msgSend(v17, "count"))
    {
      v22 = objc_msgSend(v30, "count");
      v23 = objc_msgSend(v17, "lastIndex");
      if (v22 - 1 == v23)
        goto LABEL_41;
      objc_msgSend(v30, "objectAtIndex:", v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeObjectsAtIndexes:", v17);
      if (!v24)
        goto LABEL_41;
    }
    else
    {
      v24 = -[IMChatItem _initWithItem:]([IMUnknownInternationalSenderChatItem alloc], "_initWithItem:", 0);
      if (!v24)
      {
LABEL_41:

        v4 = v30;
        goto LABEL_42;
      }
    }
    -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v24, v30);

    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Not showing unknown international status item because chat has known participants.", buf, 2u);
    }

  }
LABEL_42:

}

- (void)_processChatItemsForSMSFallbackStatusIndicator:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_1A200AE94;
    v31 = sub_1A200ACBC;
    v32 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
    objc_msgSend(WeakRetained, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "internalName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (_QWORD *)MEMORY[0x1E0D38F60];
    v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F60]);
    if ((_DWORD)v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_chat);
      v14 = objc_msgSend(v13, "isGroupChat");

      if ((v14 & 1) != 0)
        goto LABEL_6;
      v15 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1A211613C;
      v26[3] = &unk_1E47225F8;
      v26[4] = &v27;
      v26[5] = v15;
      objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v26);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_6;
      objc_msgSend((id)v28[5], "_item");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_service");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", *v11);

      if ((v19 & 1) != 0)
      {
LABEL_6:
        v12 = 0;
        v20 = 0;
LABEL_9:
        v21 = objc_opt_class();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = sub_1A21161A4;
        v23[3] = &unk_1E4722298;
        v23[4] = self;
        v25 = &v27;
        v22 = v20;
        v24 = v22;
        -[IMTranscriptChatItemRules _insertOrMoveChatItemToEndOfChatItems:chatItemClass:shouldInsert:chatItemCreationBlock:](self, "_insertOrMoveChatItemToEndOfChatItems:chatItemClass:shouldInsert:chatItemCreationBlock:", v4, v21, v12, v23);

        _Block_object_dispose(&v27, 8);
        goto LABEL_10;
      }
      objc_msgSend((id)v28[5], "_item");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "internalName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      v20 = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_processChatItemsForUnavailabilityIndicator:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id WeakRetained;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  void *v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[3];
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v44 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1A21166D4;
  v33[3] = &unk_1E4722620;
  v38 = v5;
  v10 = v8;
  v34 = v10;
  v35 = &v41;
  v36 = &v47;
  v37 = v45;
  v39 = v6;
  v40 = v7;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v33);
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v12 = objc_msgSend(WeakRetained, "shouldDisplayUnavailabilityIndicator");

  if (*((_BYTE *)v48 + 24))
  {
    v13 = objc_loadWeakRetained((id *)&self->_chat);
    v14 = objc_msgSend(v13, "supportsCapabilities:", 0x200000);

    if (v12)
      goto LABEL_3;
  }
  else
  {
    v14 = 0;
    if (v12)
    {
LABEL_3:
      if (objc_msgSend(v10, "count"))
      {
        v15 = objc_msgSend(v4, "count");
        v16 = objc_msgSend(v10, "lastIndex");
        objc_msgSend(v4, "objectAtIndex:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDisplayNotifyAnywayButton:", v14);
        if (v15 - 1 != v16 || (unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          objc_msgSend(v4, "removeObjectsAtIndexes:", v10);
          -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v17, v4);
        }
      }
      else
      {
        v18 = objc_loadWeakRetained((id *)&self->_chat);
        objc_msgSend(v18, "participantsWithState:", 16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[IMUnavailabilityIndicatorChatItem _initWithHandle:displayNotifyAnywayButton:]([IMUnavailabilityIndicatorChatItem alloc], "_initWithHandle:displayNotifyAnywayButton:", v17, v14);
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v21, v4);

      }
      if ((v14 & 1) == 0)
        goto LABEL_16;
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v27 = v9;
      v28 = 3221225472;
      v29 = sub_1A21167DC;
      v30 = &unk_1E47224F0;
      v32 = v6;
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v31 = v22;
      objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, &v27);
      if (!(_DWORD)v14)
      {
        if (objc_msgSend(v22, "count", v27, v28, v29, v30))
          objc_msgSend(v4, "removeObjectsAtIndexes:", v22);
        goto LABEL_28;
      }
      if (objc_msgSend(v22, "count", v27, v28, v29, v30))
      {
        v23 = objc_msgSend(v4, "count");
        v24 = objc_msgSend(v22, "lastIndex");
        if (v23 - 1 == v24 && (unint64_t)objc_msgSend(v22, "count") < 2)
          goto LABEL_28;
        objc_msgSend(v4, "objectAtIndex:", v24);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeObjectsAtIndexes:", v22);
        -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v25, v4);
      }
      else
      {
        v25 = -[IMNotifyAnywayChatItem _init]([IMNotifyAnywayChatItem alloc], "_init");
        -[IMTranscriptChatItemRules chatItemForIMChatItem:](self, "chatItemForIMChatItem:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v26, v4);

      }
LABEL_28:

      goto LABEL_29;
    }
  }
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v4, "removeObjectsAtIndexes:", v10);
  if ((v14 & 1) != 0)
    goto LABEL_17;
LABEL_16:
  if (*((_BYTE *)v42 + 24))
    goto LABEL_17;
LABEL_29:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);

}

- (void)_processChatItemsForJunkRecoveryItem:(id)a3 inChat:(id)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  objc_class *v17;

  v14 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A21169BC;
  v15[3] = &unk_1E47224F0;
  v17 = v7;
  v9 = v8;
  v16 = v9;
  objc_msgSend(v14, "enumerateObjectsWithOptions:usingBlock:", 2, v15);
  if (objc_msgSend(v6, "isFiltered") == 2 && (IMIsOscarEnabled() & 1) != 0)
  {
    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_msgSend(v14, "count") - 1;
      v11 = objc_msgSend(v9, "lastIndex");
      if (v10 == v11)
        goto LABEL_9;
      objc_msgSend(v14, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectsAtIndexes:", v9);
      if (!v12)
        goto LABEL_9;
    }
    else
    {
      v12 = (void *)objc_msgSend([v7 alloc], "_initWithItem:", 0);
      if (!v12)
        goto LABEL_9;
    }
    objc_msgSend(v6, "earliestCachedMessageDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEarliestMessageDate:", v13);

    -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v12, v14);
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v14, "removeObjectsAtIndexes:", v9);
LABEL_9:

}

- (void)_processChatItemsForStewieResumeButtons:(id)a3 inChat:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  IMStewieResumeItem *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v17 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1A2116B90;
  v18[3] = &unk_1E47224F0;
  v20 = v7;
  v9 = v8;
  v19 = v9;
  objc_msgSend(v17, "enumerateObjectsWithOptions:usingBlock:", 2, v18);
  v10 = -[IMTranscriptChatItemRules _shouldShowStewieResumeButtonsForChat:](self, "_shouldShowStewieResumeButtonsForChat:", v6);
  v11 = objc_msgSend(v9, "count");
  if (v10)
  {
    if (v11)
    {
      v12 = objc_msgSend(v17, "count") - 1;
      v13 = objc_msgSend(v9, "lastIndex");
      if (v12 == v13)
        goto LABEL_10;
      objc_msgSend(v17, "objectAtIndex:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectsAtIndexes:", v9);
      if (!v14)
        goto LABEL_10;
    }
    else
    {
      v15 = [IMStewieResumeItem alloc];
      objc_msgSend(v6, "chatIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[IMStewieResumeItem _initWithItem:chatIdentifier:](v15, "_initWithItem:chatIdentifier:", 0, v16);

      if (!v14)
        goto LABEL_10;
    }
    -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v14, v17);

    goto LABEL_10;
  }
  if (v11)
    objc_msgSend(v17, "removeObjectsAtIndexes:", v9);
LABEL_10:

}

- (void)_processChatItemsForDownloadingPendingMessages:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v21 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend(WeakRetained, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "supportsShowingSatelliteMessageDownloadCount"))
  {
    v7 = objc_opt_class();
    v8 = objc_loadWeakRetained((id *)&self->_chat);
    v9 = objc_msgSend(v8, "pendingIncomingSatelliteMessageCount");

    +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isSatelliteConnectionActive"))
    {
      v11 = objc_loadWeakRetained((id *)&self->_chat);
      v12 = 0;
      if ((objc_msgSend(v11, "isGroupChat") & 1) == 0 && v9)
      {
        v13 = objc_loadWeakRetained((id *)&self->_chat);
        v12 = objc_msgSend(v13, "isDownloadingPendingSatelliteMessages");

      }
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1A2116E18;
    v22[3] = &unk_1E47224F0;
    v24 = v7;
    v15 = v14;
    v23 = v15;
    objc_msgSend(v21, "enumerateObjectsWithOptions:usingBlock:", 2, v22);
    v16 = objc_msgSend(v15, "count");
    if (!v12)
    {
      if (v16)
        objc_msgSend(v21, "removeObjectsAtIndexes:", v15);
      goto LABEL_17;
    }
    if (v16)
    {
      v17 = objc_msgSend(v21, "count") - 1;
      v18 = objc_msgSend(v15, "lastIndex");
      if (v17 == v18)
        goto LABEL_17;
      objc_msgSend(v21, "objectAtIndex:", v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectsAtIndexes:", v15);
      if (!v19)
        goto LABEL_17;
    }
    else
    {
      v19 = -[IMDownloadingPendingMessagesChatItem _initWithItem:]([IMDownloadingPendingMessagesChatItem alloc], "_initWithItem:", 0);
      if (!v19)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    objc_msgSend(v19, "_setPendingIncomingSatelliteMessageCount:", v9);
    v20 = objc_loadWeakRetained((id *)&self->_chat);
    objc_msgSend(v19, "_setTotalSatelliteMessageCount:", objc_msgSend(v20, "totalSatelliteMessageCount"));

    -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v19, v21);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)_processChatItemsForSuggestedReplies:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  IMNewComposeSuggestedRepliesMessagePartChatItem *v21;
  void *v22;
  IMNewComposeSuggestedRepliesMessagePartChatItem *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "suggestedRepliesData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D39A70], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRBMEnabled");

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0D39720];
      objc_msgSend(v7, "suggestedRepliesData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "IMChipListFromSuggestions:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "suggestedReplies");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = sub_1A2117114;
        v24[3] = &unk_1E4721618;
        v16 = v15;
        v25 = v16;
        objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v24);
        if (objc_msgSend(v16, "count"))
          objc_msgSend(v6, "removeObjectsAtIndexes:", v16);
        objc_msgSend(v13, "suggestedReplies");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "suggestedReplies");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = v20;
            v28 = 2112;
            v29 = v7;
            _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "stage suggested replies: %@, chat: %@", buf, 0x16u);

          }
        }
        v21 = [IMNewComposeSuggestedRepliesMessagePartChatItem alloc];
        objc_msgSend(v13, "messageItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[IMSuggestedRepliesMessagePartChatItem initWithItem:suggestedRepliesList:selectedIndex:](v21, "initWithItem:suggestedRepliesList:selectedIndex:", v22, v18, 0);

        -[IMTranscriptChatItemRules addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:](self, "addChatItem:toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:", v23, v6);
      }

    }
  }

}

- (void)_processChatItemsForAttribution:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];
  id v35;
  IMTranscriptChatItemRules *v36;
  _BYTE *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[4];
  id v46;
  IMTranscriptChatItemRules *v47;
  uint64_t *v48;
  uint64_t *v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_1A200AE94;
  v69 = sub_1A200ACBC;
  v70 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_1A200AE94;
  v63 = sub_1A200ACBC;
  v64 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1A200AE94;
  v57 = sub_1A200ACBC;
  v58 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_1A21176E8;
  v50[3] = &unk_1E4722648;
  v6 = v4;
  v51 = v6;
  v52 = &v53;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v50);
  objc_msgSend(v6, "removeObjectsAtIndexes:", v54[5]);
  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = sub_1A21177AC;
  v45[3] = &unk_1E4722670;
  v7 = v6;
  v46 = v7;
  v47 = self;
  v48 = &v59;
  v49 = &v65;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v45);
  v8 = objc_msgSend((id)v60[5], "count");
  if (v8 == objc_msgSend((id)v66[5], "count"))
  {
    objc_msgSend(v7, "insertObjects:atIndexes:", v60[5], v66[5]);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v60[5];
      v11 = v66[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Attribution chat items to insert: %@ did not match indices: %@", buf, 0x16u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v72 = sub_1A200AE94;
  v73 = sub_1A200ACBC;
  v74 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v74 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1A200AE94;
  v43 = sub_1A200ACBC;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = sub_1A21178BC;
  v34[3] = &unk_1E4722698;
  v12 = v7;
  v37 = buf;
  v38 = &v39;
  v35 = v12;
  v36 = self;
  objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, v34);
  objc_msgSend(v12, "removeObjectsAtIndexes:", v40[5]);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1A200AE94;
  v32 = sub_1A200ACBC;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = sub_1A2117C0C;
  v25[3] = &unk_1E4722648;
  v13 = v12;
  v26 = v13;
  v27 = &v28;
  objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v25);
  objc_msgSend(v13, "removeObjectsAtIndexes:", v29[5]);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 1;
  v17 = v5;
  v18 = 3221225472;
  v19 = sub_1A2117D0C;
  v20 = &unk_1E47226C0;
  v22 = v23;
  v14 = v13;
  v21 = v14;
  objc_msgSend(v14, "enumerateObjectsWithOptions:usingBlock:", 2, &v17);
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count", v17, v18, v19, v20))
  {
    +[IMBalloonPluginAttributionController sharedInstance](IMBalloonPluginAttributionController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didShowAttributionForBundleIDs:", v16);

  }
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

}

- (BOOL)_shouldReloadChatItemWithAssociatedChatItems:(id)a3 oldAssociatedChatItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "fileTransferReloadStatus", (_QWORD)v13))
        {

          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (v5 == v6)
    goto LABEL_16;
  if (v5 && !objc_msgSend(v5, "isEqual:", v6))
  {
LABEL_15:
    LOBYTE(v11) = 1;
    goto LABEL_17;
  }
  if (!v6)
  {
LABEL_16:
    LOBYTE(v11) = 0;
    goto LABEL_17;
  }
  v11 = objc_msgSend(v6, "isEqual:", v5) ^ 1;
LABEL_17:

  return v11;
}

- (BOOL)_shouldReloadChatItem:(id)a3 oldChatItem:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v26;
  int v27;
  int v28;
  id v29;
  int v30;
  int v31;
  id v32;
  int v33;
  int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  BOOL v42;
  uint64_t v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  uint64_t v65;
  char v66;
  id v67;
  int v68;
  int v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  int v80;
  id v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  if (v6 == v7)
    goto LABEL_78;
  v8 = objc_msgSend(v6, "contiguousType");
  if (v8 != objc_msgSend(v7, "contiguousType"))
    goto LABEL_16;
  v9 = objc_msgSend(v6, "attachmentContiguousType");
  if (v9 != objc_msgSend(v7, "attachmentContiguousType"))
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v6, "statusType");
    if (v10 != objc_msgSend(v7, "statusType"))
      goto LABEL_16;
    v11 = objc_msgSend(v6, "count");
    if (v11 != objc_msgSend(v7, "count"))
      goto LABEL_16;
    v12 = objc_msgSend(v6, "expireStatusType");
    if (v12 != objc_msgSend(v7, "expireStatusType"))
      goto LABEL_16;
    objc_msgSend(v6, "_item");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "message");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "message");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    objc_msgSend(v16, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "code");

    if (v18 != v20)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "wasReportedAsSpam") & 1) != 0)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v7;
    objc_msgSend(v6, "extensionName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extensionName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v21) = objc_msgSend(v22, "isEqualToString:", v23);
    if (!(_DWORD)v21)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || objc_msgSend(v6, "supportsCommunicationSafety")
    && objc_msgSend(v7, "fileTransferReloadStatus") == 1)
  {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v7;
    v27 = objc_msgSend(v6, "failed");
    v28 = objc_msgSend(v26, "failed");

    if (v27 != v28)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v7;
    v30 = objc_msgSend(v6, "failed");
    v31 = objc_msgSend(v29, "failed");

    if (v30 != v31)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v7;
    v33 = objc_msgSend(v6, "failed");
    v34 = objc_msgSend(v32, "failed");

    if (v33 != v34)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v7;
    v36 = objc_msgSend(v6, "selectedIndex");
    v37 = objc_msgSend(v35, "selectedIndex");

    if (v36 != v37)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v6;
    v39 = v7;
    objc_msgSend(v38, "visibleAssociatedMessageChatItems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "visibleAssociatedMessageChatItems");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[IMTranscriptChatItemRules _shouldReloadChatItemWithAssociatedChatItems:oldAssociatedChatItems:](self, "_shouldReloadChatItemWithAssociatedChatItems:oldAssociatedChatItems:", v40, v41);

    if (v42)
      goto LABEL_47;
    v43 = objc_msgSend(v39, "syndicationType");
    if (v43 != objc_msgSend(v38, "syndicationType"))
      goto LABEL_47;
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isScheduledMessagesCoreEnabled");

    if (v45)
    {
      if (objc_msgSend(v39, "scheduleType") == 2 || objc_msgSend(v38, "scheduleType") == 2)
      {
        v86 = objc_msgSend(v39, "scheduleType");
        v85 = objc_msgSend(v38, "scheduleType");
        v84 = objc_msgSend(v39, "scheduleState");
        v46 = objc_msgSend(v38, "scheduleState");
        objc_msgSend(v39, "time");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "time");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "isEqualToDate:", v48);

        objc_msgSend(v39, "text");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "text");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v50, "isEqualToAttributedString:", v51);

        if (v86 != v85 || v84 != v46 || !v52 || !v49)
        {
LABEL_47:

          goto LABEL_16;
        }
      }
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "_item");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "message");
    v54 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_item");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "message");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "sender");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "service");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "sender");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "service");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58 != v60)
    {
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(v54, "error");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "error");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v61 != 0) == (v62 == 0)
      || (v63 = objc_msgSend(v54, "isPlayed"), v63 != objc_msgSend(v56, "isPlayed")))
    {

      v60 = v58;
      goto LABEL_44;
    }
    v87 = objc_msgSend(v54, "hasDataDetectorResults");
    v64 = objc_msgSend(v56, "hasDataDetectorResults");

    if (v87 != v64)
      goto LABEL_46;
    objc_msgSend(v56, "syndicationRanges");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "syndicationRanges");
    v65 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v65;
    if (v57 != (void *)v65 && (!v57 || !v65 || !objc_msgSend(v57, "isEqualToArray:", v65)))
    {
LABEL_45:

LABEL_46:
      goto LABEL_16;
    }
    v66 = objc_msgSend(v54, "hasEditedParts");

    if ((v66 & 1) != 0)
      goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v67 = v7,
        v68 = objc_msgSend(v6, "isShowingEditHistory"),
        v69 = objc_msgSend(v67, "isShowingEditHistory"),
        v67,
        v68 == v69))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v70 = v7;
      objc_msgSend(v6, "richCards");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "richCards");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v71, "isEqual:", v72) ^ 1;
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(v6, "transferGUID"),
          v73 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "transferGUID"),
          v74 = (void *)objc_claimAutoreleasedReturnValue(),
          v75 = objc_msgSend(v73, "isEqualToString:", v74),
          v74,
          v73,
          v75))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = v6;
        objc_msgSend(v54, "dataSource");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "hasInvalidatedSize");

        if (v77)
        {
          objc_msgSend(v54, "dataSource");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setHasInvalidatedSize:", 0);
          goto LABEL_46;
        }

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v78 = objc_msgSend(v6, "offerState");
        if (v78 != objc_msgSend(v7, "offerState"))
          goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "isEqual:", v7))
        goto LABEL_16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!objc_msgSend(v6, "isEqual:", v7))
          goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "isCarrierPigeonEnabled");

      if (v80)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v81 = v7;
            v82 = objc_msgSend(v6, "isPendingSatelliteSend");
            v83 = objc_msgSend(v81, "isPendingSatelliteSend");

            if (v82 != v83)
              goto LABEL_16;
          }
        }
      }
LABEL_78:
      LOBYTE(v24) = 0;
      goto LABEL_17;
    }
  }
LABEL_16:
  LOBYTE(v24) = 1;
LABEL_17:

  return v24;
}

- (BOOL)_shouldReloadSatelliteChatItems:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  void *v7;
  int v8;
  id v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  id v19;
  id v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  v6 = objc_msgSend(WeakRetained, "lastUsedSatelliteStatus");
  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSatelliteConnectionActive");

  if (v6 != v8)
    goto LABEL_4;
  v9 = objc_loadWeakRetained((id *)&self->_chat);
  v10 = objc_msgSend(v9, "lastUsedShowTextRoadsideProviderStatus");
  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldShowTextRoadsideProviderButton");

  if (v10 != v12)
    goto LABEL_4;
  v13 = objc_loadWeakRetained((id *)&self->_chat);
  v14 = objc_msgSend(v13, "lastUsedShowTextEmergencyServicesStatus");
  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldShowTextEmergencyServicesButton");

  if (v14 == v16)
  {
    v19 = objc_loadWeakRetained((id *)&self->_chat);
    if (objc_msgSend(v19, "isStewieChat"))
    {
      v20 = objc_loadWeakRetained((id *)&self->_chat);
      v21 = -[IMTranscriptChatItemRules _shouldShowStewieResumeButtonsForChat:](self, "_shouldShowStewieResumeButtonsForChat:", v20);
      v22 = objc_opt_class();
      v17 = v21 ^ sub_1A2118CB8(v22, v4, v22);

    }
    else
    {
      LOBYTE(v17) = 0;
    }

  }
  else
  {
LABEL_4:
    LOBYTE(v17) = 1;
  }

  return v17;
}

- (id)_itemWithChatItemsDeleted:(id)a3 fromItem:(id)a4 indexesOfItemsDeleted:(id *)a5 indexToRangeMapOfItemsDeleted:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  id *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v9 = a4;
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = a5;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v20;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "addObject:", v16);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v26 = v16;
              v27 = 2112;
              v28 = v9;
              _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Can only delete message parts. Tried to delete %@ from message:%@", buf, 0x16u);
            }

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v13);
    }

    +[IMMessagePartChatItem _messageItemWithPartsDeleted:fromMessageItem:indexesOfItemsDeleted:indexToRangeMapping:](IMMessagePartChatItem, "_messageItemWithPartsDeleted:fromMessageItem:indexesOfItemsDeleted:indexToRangeMapping:", v11, v9, v19, a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_initWithChat:(id)a3
{
  id v4;
  IMTranscriptChatItemRules *v5;
  IMTranscriptChatItemRules *v6;
  uint64_t v7;
  NSMutableArray *chatItems;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMTranscriptChatItemRules;
  v5 = -[IMTranscriptChatItemRules init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_chat, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    chatItems = v6->_chatItems;
    v6->_chatItems = (NSMutableArray *)v7;

  }
  return v6;
}

- (void)_invalidateSpamIndicatorCachedValues
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend(WeakRetained, "invalidateSpamIndicatorCachedValues");

}

- (IMChat)chat
{
  return (IMChat *)objc_loadWeakRetained((id *)&self->_chat);
}

- (void)setChat:(id)a3
{
  objc_storeWeak((id *)&self->_chat, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableArray)chatItems
{
  return self->_chatItems;
}

- (void)setChatItems:(id)a3
{
  objc_storeStrong((id *)&self->_chatItems, a3);
}

- (NSDate)nextStaleTime
{
  return self->_nextStaleTime;
}

- (void)setNextStaleTime:(id)a3
{
  objc_storeStrong((id *)&self->_nextStaleTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextStaleTime, 0);
  objc_storeStrong((id *)&self->_chatItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_chat);
}

- (id)testChatItems
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  IMGroupActionChatItem *v6;
  IMGroupActionChatItem *v7;
  IMGroupTitleChangeChatItem *v8;
  IMGroupTitleChangeChatItem *v9;
  IMParticipantChangeChatItem *v10;
  IMParticipantChangeChatItem *v11;
  IMParticipantChangeChatItem *v12;
  IMParticipantChangeChatItem *v13;
  IMParticipantChangeChatItem *v14;
  IMParticipantChangeChatItem *v15;
  IMLocationShareActionChatItem *v16;
  IMLocationShareActionChatItem *v17;
  id v18;
  IMLocationShareActionChatItem *v19;
  id v20;
  IMLocationShareActionChatItem *v21;
  id v22;
  id v23;
  IMTranscriptSharingChatItem *v24;
  id v25;
  id v26;
  IMLocationUpdateSentChatItem *v27;
  id v28;
  void *v29;
  id v30;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
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
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  _QWORD v59[18];

  v59[16] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend(WeakRetained, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "objectAtIndex:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v5;
  v58 = v3;
  v6 = [IMGroupActionChatItem alloc];
  v57 = objc_alloc_init(MEMORY[0x1E0D39860]);
  objc_msgSend(v57, "setActionType:", 0);
  v56 = -[IMGroupActionChatItem _initWithItem:sender:](v6, "_initWithItem:sender:", v57, 0);
  v59[0] = v56;
  v7 = [IMGroupActionChatItem alloc];
  v55 = objc_alloc_init(MEMORY[0x1E0D39860]);
  objc_msgSend(v55, "setActionType:", 0);
  v54 = -[IMGroupActionChatItem _initWithItem:sender:](v7, "_initWithItem:sender:", v55, v4);
  v59[1] = v54;
  v8 = [IMGroupTitleChangeChatItem alloc];
  v53 = objc_alloc_init(MEMORY[0x1E0D39870]);
  objc_msgSend(v53, "setTitle:", CFSTR("Vegas Trip"));
  v52 = -[IMGroupTitleChangeChatItem _initWithItem:sender:](v8, "_initWithItem:sender:", v53, 0);
  v59[2] = v52;
  v9 = [IMGroupTitleChangeChatItem alloc];
  v51 = objc_alloc_init(MEMORY[0x1E0D39870]);
  objc_msgSend(v51, "setTitle:", CFSTR("Vegas Trip"));
  v50 = -[IMGroupTitleChangeChatItem _initWithItem:sender:](v9, "_initWithItem:sender:", v51, v4);
  v59[3] = v50;
  v10 = [IMParticipantChangeChatItem alloc];
  v49 = objc_alloc_init(MEMORY[0x1E0D399A8]);
  objc_msgSend(v49, "setChangeType:", 0);
  v48 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:](v10, "_initWithItem:sender:otherHandle:", v49, 0, v4);
  v59[4] = v48;
  v11 = [IMParticipantChangeChatItem alloc];
  v47 = objc_alloc_init(MEMORY[0x1E0D399A8]);
  objc_msgSend(v47, "setChangeType:", 0);
  v46 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:](v11, "_initWithItem:sender:otherHandle:", v47, v4, 0);
  v59[5] = v46;
  v12 = [IMParticipantChangeChatItem alloc];
  v45 = objc_alloc_init(MEMORY[0x1E0D399A8]);
  objc_msgSend(v45, "setChangeType:", 0);
  v44 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:](v12, "_initWithItem:sender:otherHandle:", v45, v4, v5);
  v59[6] = v44;
  v13 = [IMParticipantChangeChatItem alloc];
  v43 = objc_alloc_init(MEMORY[0x1E0D399A8]);
  objc_msgSend(v43, "setChangeType:", 1);
  v42 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:](v13, "_initWithItem:sender:otherHandle:", v43, 0, v4);
  v59[7] = v42;
  v14 = [IMParticipantChangeChatItem alloc];
  v41 = objc_alloc_init(MEMORY[0x1E0D399A8]);
  objc_msgSend(v41, "setChangeType:", 1);
  v40 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:](v14, "_initWithItem:sender:otherHandle:", v41, v4, 0);
  v59[8] = v40;
  v15 = [IMParticipantChangeChatItem alloc];
  v39 = objc_alloc_init(MEMORY[0x1E0D399A8]);
  objc_msgSend(v39, "setChangeType:", 1);
  v38 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:](v15, "_initWithItem:sender:otherHandle:", v39, v4, v5);
  v59[9] = v38;
  v16 = [IMLocationShareActionChatItem alloc];
  v37 = objc_alloc_init(MEMORY[0x1E0D398C8]);
  objc_msgSend(v37, "setStatus:", 0);
  objc_msgSend(v37, "setDirection:", 0);
  v36 = -[IMLocationShareActionChatItem _initWithItem:sender:otherHandle:](v16, "_initWithItem:sender:otherHandle:", v37, 0, v4);
  v59[10] = v36;
  v17 = [IMLocationShareActionChatItem alloc];
  v18 = objc_alloc_init(MEMORY[0x1E0D398C8]);
  objc_msgSend(v18, "setStatus:", 1);
  objc_msgSend(v18, "setDirection:", 0);
  v35 = -[IMLocationShareActionChatItem _initWithItem:sender:otherHandle:](v17, "_initWithItem:sender:otherHandle:", v18, 0, v4);
  v59[11] = v35;
  v19 = [IMLocationShareActionChatItem alloc];
  v20 = objc_alloc_init(MEMORY[0x1E0D398C8]);
  objc_msgSend(v20, "setStatus:", 0);
  objc_msgSend(v20, "setDirection:", 1);
  v33 = -[IMLocationShareActionChatItem _initWithItem:sender:otherHandle:](v19, "_initWithItem:sender:otherHandle:", v20, v4, 0);
  v59[12] = v33;
  v21 = [IMLocationShareActionChatItem alloc];
  v22 = objc_alloc_init(MEMORY[0x1E0D398C8]);
  objc_msgSend(v22, "setStatus:", 1);
  objc_msgSend(v22, "setDirection:", 1);
  v23 = -[IMLocationShareActionChatItem _initWithItem:sender:otherHandle:](v21, "_initWithItem:sender:otherHandle:", v22, v4, 0);
  v59[13] = v23;
  v24 = [IMTranscriptSharingChatItem alloc];
  v25 = objc_alloc_init(MEMORY[0x1E0D39B60]);
  v26 = -[IMTranscriptSharingChatItem _initWithItem:](v24, "_initWithItem:", v25);
  v59[14] = v26;
  v27 = [IMLocationUpdateSentChatItem alloc];
  v28 = objc_alloc_init(MEMORY[0x1E0D398D0]);
  objc_msgSend(v4, "ID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[IMLocationUpdateSentChatItem _initWithItem:chatIdentifier:](v27, "_initWithItem:chatIdentifier:", v28, v29);
  v59[15] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 16);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (BOOL)testShouldShowReportSpamForChat:(id)a3 items:(id)a4
{
  return sub_1A20FBD2C(a3, a4);
}

+ (BOOL)testShouldShowSMSSpamForChat:(id)a3 items:(id)a4
{
  return sub_1A2110BD4(a3, a4);
}

@end
