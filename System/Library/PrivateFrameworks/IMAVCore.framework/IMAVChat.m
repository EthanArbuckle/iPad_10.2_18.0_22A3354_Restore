@implementation IMAVChat

- (id)_initWith:(id)a3 invitedBy:(id)a4 sessionID:(unsigned int)a5 GUID:(id)a6 video:(BOOL)a7 extraProperties:(id)a8
{
  return (id)objc_msgSend__initWith_invitedBy_sessionID_isRelayed_GUID_video_extraProperties_(self, a2, (uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, 0, a6, a7, a8);
}

- (id)_initWith:(id)a3 invitedBy:(id)a4 sessionID:(unsigned int)a5 isRelayed:(BOOL)a6 GUID:(id)a7 video:(BOOL)a8 extraProperties:(id)a9
{
  _BOOL4 v9;
  double v15;
  id v16;
  id v17;
  NSObject *v18;
  IMAVChat *v19;
  IMTimingCollection *v20;
  IMTimingCollection *timingCollection;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *conferenceQueue;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  NSString *v52;
  NSString *GUID;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  IMTimingCollection *v80;
  void **p_timingCollection;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  unsigned int sessionID;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSDate *dateEnded;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  objc_class *v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  IMAVChat *v176;
  NSObject *v177;
  id v180;
  objc_super v181;
  uint8_t buf[4];
  IMAVChat *v183;
  __int16 v184;
  double v185;
  __int16 v186;
  id v187;
  __int16 v188;
  unsigned int v189;
  __int16 v190;
  id v191;
  __int16 v192;
  _BOOL4 v193;
  __int16 v194;
  id v195;
  uint64_t v196;

  v9 = a8;
  v196 = *MEMORY[0x24BDAC8D0];
  v15 = COERCE_DOUBLE(a3);
  v16 = a4;
  v17 = a7;
  v180 = a9;
  sub_2190076D0();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    v183 = self;
    v184 = 2112;
    v185 = v15;
    v186 = 2112;
    v187 = v16;
    v188 = 1024;
    v189 = a5;
    v190 = 2112;
    v191 = v17;
    v192 = 1024;
    v193 = v9;
    v194 = 2112;
    v195 = v180;
    _os_log_impl(&dword_218FEA000, v18, OS_LOG_TYPE_DEFAULT, "avchat: %@  invited: %@  invitedBy: %@  sessionID: %u guid: %@  video: %d props: %@", buf, 0x40u);
  }

  v181.receiver = self;
  v181.super_class = (Class)IMAVChat;
  v19 = -[IMAVChat init](&v181, sel_init);
  if (!v19)
    goto LABEL_27;
  v20 = (IMTimingCollection *)objc_alloc_init(MEMORY[0x24BE50388]);
  timingCollection = v19->_timingCollection;
  v19->_timingCollection = v20;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = dispatch_queue_create("com.apple.imavchat_conference_queue", v22);
  conferenceQueue = v19->_conferenceQueue;
  v19->_conferenceQueue = (OS_dispatch_queue *)v23;

  objc_msgSend_localPortraitAspectRatio(IMAVLocalPreviewClient, v25, v26, v27, v28);
  v30 = v29;
  v32 = v31;
  sub_2190076D0();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v183 = *(IMAVChat **)&v30;
    v184 = 2048;
    v185 = v32;
    _os_log_impl(&dword_218FEA000, v33, OS_LOG_TYPE_DEFAULT, "   Portrait Aspect: (%f / %f)", buf, 0x16u);
  }

  sub_2190076D0();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v183 = *(IMAVChat **)&v32;
    v184 = 2048;
    v185 = v30;
    _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "  Landscape Aspect: (%f / %f)", buf, 0x16u);
  }

  if (v9)
  {
    objc_msgSend_setLocalAspectRatio_cameraOrientation_cameraType_(v19, v35, 2, 0, v38, v32, v30);
    objc_msgSend_setLocalAspectRatio_cameraOrientation_cameraType_(v19, v39, 0, 0, v40, v30, v32);
  }
  objc_msgSend_defaultConnectionTimeoutTime(IMAVChat, v35, v36, v37, v38);
  v19->_connectionTimeoutTime = v41;
  v46 = objc_msgSend_defaultInvitationTimeoutTime(IMAVChat, v42, v43, v44, v45);
  v19->_invitationTimeoutTime = v51;
  if (v17)
  {
    v52 = (NSString *)v17;
  }
  else
  {
    sub_219001398(v46, v47, v48, v49, v50);
    v52 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  GUID = v19->_GUID;
  v19->_GUID = v52;

  objc_msgSend_sharedInstance(IMAVCallManager, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addIMAVChatToChatList_(v58, v59, (uint64_t)v19, v60, v61);

  objc_msgSend_sharedInstance(IMAVInterface, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v66, v67, (uint64_t)v19, v68, v69);

  objc_msgSend_account(v16, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v19->_initiator, a4);
  objc_msgSend_loginIMHandle(v74, v75, v76, v77, v78);
  v79 = (id)objc_claimAutoreleasedReturnValue();
  v19->_isCaller = v79 == v16;

  p_timingCollection = (void **)&v19->_timingCollection;
  v80 = v19->_timingCollection;
  v19->_sessionID = a5;
  v19->_isVideo = v9;
  v19->_relayed = a6;
  objc_msgSend_startTimingForKey_(v80, v82, (uint64_t)CFSTR("time-to-connected"), v83, v84);
  objc_msgSend_startTimingForKey_(v19->_timingCollection, v85, (uint64_t)CFSTR("time-to-connecting"), v86, v87);
  if (v19->_isCaller)
    objc_msgSend_startTimingForKey_(*p_timingCollection, v88, (uint64_t)CFSTR("time-to-invitation"), v89, v90);
  else
    objc_msgSend_startTimingForKey_(*p_timingCollection, v88, (uint64_t)CFSTR("time-to-response"), v89, v90);
  objc_msgSend_startTimingForKey_(*p_timingCollection, v91, (uint64_t)CFSTR("time-to-connection-data-gathering"), v92, v93);
  objc_msgSend_startTimingForKey_(*p_timingCollection, v94, (uint64_t)CFSTR("time-to-query-for-connection-data-gathering"), v95, v96);
  sub_2190076D0();
  v97 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = v19->_sessionID;
    *(_DWORD *)buf = 67109120;
    LODWORD(v183) = sessionID;
    _os_log_impl(&dword_218FEA000, v97, OS_LOG_TYPE_DEFAULT, "IMAVChat created with sessionID %u", buf, 8u);
  }

  objc_msgSend__setCreationDate(v19, v99, v100, v101, v102);
  dateEnded = v19->_dateEnded;
  v19->_dateEnded = 0;

  if (!v19->_isCaller)
  {
    sub_2190076D0();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v108, OS_LOG_TYPE_DEFAULT, " ** not the caller, let's warmup", buf, 2u);
    }

    objc_msgSend_sharedInstance(IMAVInterface, v109, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyAboutPotentialCallForChat_(v113, v114, (uint64_t)v19, v115, v116);

  }
  objc_msgSend___imFirstObject(*(void **)&v15, v104, v105, v106, v107);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__initParticipantsWithIMHandles_(v19, v118, *(uint64_t *)&v15, v120, v121);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v118, v119, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = (objc_class *)objc_opt_class();
    NSStringFromClass(v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v122, v125, (uint64_t)a2, (uint64_t)v19, (uint64_t)CFSTR("IMAVChat.m"), 174, CFSTR("Invalid class %@"), v124);

  }
  if ((objc_msgSend__participantsCheckOut(v19, v126, v127, v128, v129) & 1) != 0)
  {
    objc_msgSend_initiatorParticipant(v19, v130, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (id)objc_msgSend__processIncomingCallProperties_(v134, v135, (uint64_t)v180, v136, v137);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v139, v140, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v143, v144, (uint64_t)v19, (uint64_t)sel__airplaneModeChanged_, *MEMORY[0x24BE50190], 0);

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v145, v146, v147, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v149, v150, (uint64_t)v19, (uint64_t)sel__entitlementsChanged_, *MEMORY[0x24BE30308], 0);

    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v151, v152, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addListener_(v155, v156, (uint64_t)v19, v157, v158);

    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v159, v160, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v163, v164, 1, v165, v166);

    objc_msgSend_sharedInstance(IMAVController, v167, v168, v169, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__dumpCaps(v171, v172, v173, v174, v175);

LABEL_27:
    v176 = v19;
    goto LABEL_31;
  }
  sub_2190076D0();
  v177 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v183 = (IMAVChat *)CFSTR("Participants failed basic check");
    _os_log_impl(&dword_218FEA000, v177, OS_LOG_TYPE_DEFAULT, "[WARN] %@", buf, 0xCu);
  }

  v176 = 0;
LABEL_31:

  return v176;
}

- (id)initIncomingFrom:(id)a3 isVideo:(BOOL)a4 callerProperties:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *dateEnded;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  IMAVChat *v44;
  void *v45;
  _BOOL8 v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  IMAVChat *v51;
  IMAVChat *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[4];
  IMAVChat *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  _BOOL4 v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v6 = a4;
  v68 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v61 = self;
    v62 = 2112;
    v63 = v8;
    v64 = 1024;
    v65 = v6;
    v66 = 2112;
    v67 = v9;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "avchat: %@  initiator: %@  isVideo: %d properties: %@", buf, 0x26u);
  }

  objc_msgSend__setCreationDate(self, v11, v12, v13, v14);
  dateEnded = self->_dateEnded;
  self->_dateEnded = 0;

  objc_msgSend_objectForKey_(v9, v16, *MEMORY[0x24BE50468], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v20, (uint64_t)v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v23;
  if (!v23)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v24, (uint64_t)CFSTR("Couldn't unarchive conference data %@"), v25, v26, v19);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45 == 0;

    if (!v46)
    {
      sub_2190076D0();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v48, (uint64_t)CFSTR("Couldn't unarchive conference data %@"), v49, v50, v19);
        v51 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v61 = v51;
        _os_log_impl(&dword_218FEA000, v47, OS_LOG_TYPE_DEFAULT, "[WARN] %@", buf, 0xCu);

      }
    }

    goto LABEL_16;
  }
  objc_msgSend_objectForKey_(v23, v24, *MEMORY[0x24BE504F0], v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v28;
  if (v28)
  {
    v37 = objc_msgSend_unsignedIntValue(v28, v29, v30, v31, v32);
    if (!(_DWORD)v37)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, (uint64_t)CFSTR("sessionIDValue %@ is not valid"), v35, v36, v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38 == 0;

      if (!v39)
      {
        sub_2190076D0();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v41, (uint64_t)CFSTR("sessionIDValue %@ is not valid"), v42, v43, v33);
          v44 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v61 = v44;
          _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "[WARN] %@", buf, 0xCu);

        }
      }

LABEL_16:
      v52 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v37 = 0;
  }
  IMSingleObjectArray();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend__initWith_invitedBy_sessionID_GUID_video_extraProperties_(self, v54, (uint64_t)v53, (uint64_t)v8, v37, 0, v6, v27);

  if (v55)
    objc_msgSend__setCallerProperties_(v55, v56, (uint64_t)v9, v57, v58);

  self = v55;
  v52 = self;
LABEL_21:

  return v52;
}

+ (int)systemSupportsNewOutgoingConferenceTo:(id)a3 isVideo:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char CanVideoChat;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int CanAudioChat;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  char v46;
  int v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  __int16 v56;
  _BOOL4 v57;
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v55 = v5;
    v56 = 1024;
    v57 = v4;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "imHandles: %@  isVideo: %d", buf, 0x12u);
  }

  objc_msgSend_sharedInstance(IMAVInterface, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  if (v4)
  {
    CanVideoChat = objc_msgSend_systemCanVideoChat(v11, v12, v13, v14, v15);

    if ((CanVideoChat & 1) == 0)
    {
      v22 = -1;
      goto LABEL_27;
    }
  }
  else
  {
    CanAudioChat = objc_msgSend_systemCanAudioChat(v11, v12, v13, v14, v15);

    if (!CanAudioChat)
    {
      v22 = -2;
      goto LABEL_27;
    }
  }
  if ((unint64_t)objc_msgSend_count(v5, v18, v19, v20, v21) >= 2)
  {
    if (v4)
      v22 = 4;
    else
      v22 = 3;
    goto LABEL_27;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v24 = v5;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v49, (uint64_t)v53, 16);
  if (!v26)
    goto LABEL_24;
  v31 = v26;
  v32 = *(_QWORD *)v50;
  while (2)
  {
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v50 != v32)
        objc_enumerationMutation(v24);
      objc_msgSend_service(*(void **)(*((_QWORD *)&v49 + 1) + 8 * i), v27, v28, v29, v30, (_QWORD)v49);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_facetimeService(MEMORY[0x24BE50370], v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34 == v39)
      {
        objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v27, v28, v29, v30);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v40;
        if (v4)
        {
          v46 = objc_msgSend_faceTimeAvailable(v40, v41, v42, v43, v44);

          if ((v46 & 1) == 0)
          {
            v22 = 6;
LABEL_26:

            goto LABEL_27;
          }
        }
        else
        {
          v47 = objc_msgSend_callingAvailable(v40, v41, v42, v43, v44);

          if (!v47)
          {
            v22 = 5;
            goto LABEL_26;
          }
        }
      }
    }
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v31)
      continue;
    break;
  }
LABEL_24:

  v22 = 0;
LABEL_27:

  return v22;
}

- (id)_initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5 GUID:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  IMAVChat *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  IMAVChat *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  IMAVChat *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  IMAVChat *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  IMAVChat *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  IMAVChat *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  IMAVChat *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  NSObject *v96;
  _BOOL4 v98;
  IMAVChat *v99;
  uint8_t buf[4];
  IMAVChat *v101;
  __int16 v102;
  IMAVChat *v103;
  __int16 v104;
  _BOOL4 v105;
  uint64_t v106;

  v7 = a5;
  v8 = a4;
  v106 = *MEMORY[0x24BDAC8D0];
  v10 = (IMAVChat *)a3;
  v11 = a6;
  if (!objc_msgSend_systemSupportsNewOutgoingConferenceTo_isVideo_(IMAVChat, v12, (uint64_t)v10, v8, v13))
  {
    objc_msgSend_lastObject(v10, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_service(v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    IMOperationalAccountForService();
    v30 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_account(v19, v31, v32, v33, v34);
    v35 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

    if (v35 == v30)
    {
      v61 = v10;
      objc_msgSend_ID(v19, v36, v37, v38, v39);
    }
    else
    {
      sub_2190076D0();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_account(v19, v41, v42, v43, v44);
        v45 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v101 = v45;
        v102 = 2112;
        v103 = v30;
        _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "******** Invalid account selected to intiate a call from, failing call, please file a radar: %@    (Should have been: %@)", buf, 0x16u);

      }
      sub_2190076D0();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_account(v19, v47, v48, v49, v50);
        v51 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v101 = v51;
        v102 = 2112;
        v103 = v30;
        _os_log_impl(&dword_218FEA000, v46, OS_LOG_TYPE_DEFAULT, "[WARN] ******** Invalid account selected to intiate a call from, failing call, please file a radar: %@    (Should have been: %@)", buf, 0x16u);

      }
      if (!v30)
      {
        sub_2190076D0();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v96, OS_LOG_TYPE_DEFAULT, "****** No active accounts at all, failing call", buf, 2u);
        }

        sub_2190076D0();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v77, OS_LOG_TYPE_DEFAULT, "[WARN] ****** No active accounts at all, failing call", buf, 2u);
        }
        v18 = 0;
        goto LABEL_25;
      }
      objc_msgSend_ID(v19, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imHandleWithID_(v30, v57, (uint64_t)v56, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      IMSingleObjectArray();
      v61 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

      sub_2190076D0();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v101 = v30;
        v102 = 2112;
        v103 = v61;
        _os_log_impl(&dword_218FEA000, v62, OS_LOG_TYPE_DEFAULT, "   Fixed, moved over to this account: %@    recipients: %@", buf, 0x16u);
      }

      v19 = v60;
      objc_msgSend_ID(v60, v63, v64, v65, v66);
    }
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__submitCallStartedLoggingWithRecipientID_isCaller_isVideo_(self, v68, (uint64_t)v67, 1, v8);

    sub_2190076D0();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v101 = self;
      v102 = 2112;
      v103 = v61;
      v104 = 1024;
      v105 = v8;
      _os_log_impl(&dword_218FEA000, v69, OS_LOG_TYPE_DEFAULT, "avchat: %@  to: %@  isVideo: %d", buf, 0x1Cu);
    }

    objc_msgSend__avChatWithMatchingIMHandles_video_(IMAVChat, v70, (uint64_t)v61, v8, v71);
    v72 = objc_claimAutoreleasedReturnValue();
    v77 = v72;
    if (v72)
    {
      objc_msgSend_acceptInvitation(v72, v73, v74, v75, v76);
      v77 = v77;
      v10 = v61;
      v18 = (IMAVChat *)v77;
    }
    else
    {
      v98 = v7;
      v99 = v30;
      do
        v78 = MEMORY[0x219A2834C]();
      while (!(_DWORD)v78);
      v83 = v78;
      objc_msgSend___imFirstObject(v61, v79, v80, v81, v82);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(v84, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_loginIMHandle(v89, v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      self = (IMAVChat *)(id)objc_msgSend__initWith_invitedBy_sessionID_isRelayed_GUID_video_extraProperties_(self, v95, (uint64_t)v61, (uint64_t)v94, v83, v98, v11, v8, 0);

      v10 = v61;
      v18 = self;
      v30 = v99;
    }
LABEL_25:

    goto LABEL_26;
  }

  v18 = 0;
LABEL_26:

  return v18;
}

- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_initOutgoingTo_isVideo_isRelayed_, a3, a4, 0);
}

- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5
{
  return (id)MEMORY[0x24BEDD108](self, sel_initOutgoingTo_isVideo_isRelayed_GUID_, a3, a4, a5);
}

- (id)initOutgoingTo:(id)a3 isVideo:(BOOL)a4 isRelayed:(BOOL)a5 GUID:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int shouldRunACConferences;
  NSObject *v34;
  IMAVChatProxy *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  id v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v122;
  void *v123;
  uint8_t buf[4];
  id v125;
  __int16 v126;
  const __CFString *v127;
  uint64_t v128;

  v7 = a5;
  v8 = a4;
  v128 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  sub_2190076D0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (v8)
      v13 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v125 = v10;
    v126 = 2112;
    v127 = v13;
    _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Client requested to create an outgoing chat with imHandles %@ isVideo %@", buf, 0x16u);
  }

  objc_msgSend_sharedInstance(IMAVController, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v18, v19, v20, v21, v22))
    v27 = !v8;
  else
    v27 = 1;
  if (!v27)
  {

LABEL_16:
    self = (IMAVChat *)(id)objc_msgSend__initOutgoingTo_isVideo_isRelayed_GUID_(self, v51, (uint64_t)v10, v8, v7, v11);
    v35 = (IMAVChatProxy *)self;
    goto LABEL_31;
  }
  objc_msgSend_sharedInstance(IMAVController, v23, v24, v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

  if (shouldRunACConferences && !v8)
    goto LABEL_16;
  sub_2190076D0();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "Creating an outgoing proxy", buf, 2u);
  }

  v35 = objc_alloc_init(IMAVChatProxy);
  v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v37, v7, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v36, v41, (uint64_t)v40, (uint64_t)CFSTR("IsRelayed"), v42);

  if (v11)
  {
    v49 = v11;
  }
  else
  {
    sub_219001398(v43, v44, v45, v46, v47);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      v123 = 0;
      goto LABEL_19;
    }
  }
  v123 = v49;
  objc_msgSend_setObject_forKey_(v36, v48, (uint64_t)v49, (uint64_t)CFSTR("GUID"), v50);
LABEL_19:
  objc_msgSend___imFirstObject(v10, v48, (uint64_t)v49, v52, v50);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v53, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginIMHandle(v58, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v64, (uint64_t)v63, v65, v66);
  v67 = objc_claimAutoreleasedReturnValue();

  if (v67)
    objc_msgSend_setObject_forKey_(v36, v68, v67, (uint64_t)CFSTR("Initiator"), v71);
  objc_msgSend_lastObject(v10, v68, v69, v70, v71, v67);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v73, (uint64_t)v72, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
    objc_msgSend_setObject_forKey_(v36, v77, (uint64_t)v76, (uint64_t)CFSTR("Other"), v80);
  objc_msgSend___imFirstObject(v10, v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v81, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v86, v87, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
    objc_msgSend_setObject_forKey_(v36, v92, (uint64_t)v91, (uint64_t)CFSTR("AccountID"), v94);
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v92, v8, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v36, v96, (uint64_t)v95, (uint64_t)CFSTR("IsVideo"), v97);

  objc_msgSend_setObject_forKey_(v36, v98, (uint64_t)&unk_24DA62E88, (uint64_t)CFSTR("State"), v99);
  objc_msgSend_setObject_forKey_(v36, v100, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("IsCaller"), v101);
  objc_msgSend_updateWithInfo_(v35, v102, (uint64_t)v36, v103, v104);
  sub_2190076D0();
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v125 = v36;
    _os_log_impl(&dword_218FEA000, v105, OS_LOG_TYPE_DEFAULT, "Create proxy with info %@", buf, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v106, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(v110, v111, (uint64_t)v91, 0, (uint64_t)v36, v123, v8);

  objc_msgSend_sharedInstance(IMAVCallManager, v112, v113, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v116;
  if (v8)
    objc_msgSend__addAVChatProxy_(v116, v117, (uint64_t)v35, v118, v119);
  else
    objc_msgSend__addACChatProxy_(v116, v117, (uint64_t)v35, v118, v119);

LABEL_31:
  return v35;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  IMTimingCollection *timingCollection;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int isCaller;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int localState;
  unsigned int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  IMAVChat *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSDictionary *callerProperties;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  OS_dispatch_queue *conferenceQueue;
  const char *v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t i;
  IMAVChat *v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  NSDictionary *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  const char *v162;
  __int128 v163;
  objc_super v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  uint8_t v169[128];
  uint8_t buf[4];
  IMAVChat *v171;
  uint64_t v172;

  v172 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v171 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    timingCollection = self->_timingCollection;
    *(_DWORD *)buf = 138412290;
    v171 = (IMAVChat *)timingCollection;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "Timings: %@", buf, 0xCu);
  }

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, 0, 0);

  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeListener_(v16, v17, (uint64_t)self, v18, v19);

  objc_msgSend_sharedInstance(IMAVInterface, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__avChatDealloc_(v24, v25, (uint64_t)self, v26, v27);

  objc_msgSend_sharedInstance(IMAVInterface, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unsetDelegate_(v32, v33, (uint64_t)self, v34, v35);

  if (self->_localState != self->_lastPostedState)
  {
    objc_msgSend_sharedInstance(IMAVInterface, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chatStateUpdated(v40, v41, v42, v43, v44);

  }
  isCaller = objc_msgSend_isCaller(self, v36, v37, v38, v39);
  localState = self->_localState;
  if (!isCaller)
  {
    if (localState - 1 > 2)
      goto LABEL_19;
    objc_msgSend_initiatorParticipant(self, v46, v47, v48, v49);
    v56 = objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v171 = (IMAVChat *)v56;
      _os_log_impl(&dword_218FEA000, v67, OS_LOG_TYPE_DEFAULT, "Dealloc: Declining current chat with: %@", buf, 0xCu);
    }

    objc_msgSend_sharedInstance(IMAVController, v68, v69, v70, v71);
    v66 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imHandle(v56, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    callerProperties = self->_callerProperties;
    objc_msgSend_imHandle(v56, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v82, v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v66, v88, (uint64_t)v76, 1, (uint64_t)callerProperties, v87, self->_conferenceID);

    goto LABEL_17;
  }
  if ((localState | 2) != 3)
    goto LABEL_19;
  v51 = objc_msgSend_endedReason(self, v46, v47, v48, v49);
  if (v51 > 0x18 || ((1 << v51) & 0x1811000) == 0)
  {
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    objc_msgSend_remoteParticipants(self, v52, v53, v54, v55);
    v56 = objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v132, (uint64_t)&v165, (uint64_t)v169, 16);
    if (v133)
    {
      v135 = v133;
      v136 = *(_QWORD *)v166;
      *(_QWORD *)&v134 = 138412290;
      v163 = v134;
      do
      {
        for (i = 0; i != v135; ++i)
        {
          if (*(_QWORD *)v166 != v136)
            objc_enumerationMutation(v56);
          v138 = *(IMAVChat **)(*((_QWORD *)&v165 + 1) + 8 * i);
          sub_2190076D0();
          v139 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v163;
            v171 = v138;
            _os_log_impl(&dword_218FEA000, v139, OS_LOG_TYPE_DEFAULT, "Dealloc: Cancelling outgoing invitation to %@", buf, 0xCu);
          }

          objc_msgSend_sharedInstance(IMAVController, v140, v141, v142, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_imHandle(v138, v145, v146, v147, v148);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = self->_callerProperties;
          objc_msgSend_imHandle(v138, v151, v152, v153, v154);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_account(v155, v156, v157, v158, v159);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cancelVCRequestWithBuddy_vcProps_forAccount_conferenceID_reason_(v144, v161, (uint64_t)v149, (uint64_t)v150, (uint64_t)v160, self->_conferenceID, 0);

        }
        v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v162, (uint64_t)&v165, (uint64_t)v169, 16);
      }
      while (v135);
    }
    goto LABEL_18;
  }
  sub_2190076D0();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v61 = objc_msgSend_endedReason(self, v57, v58, v59, v60);
    _NSStringDescriptionForIMAVChatEndedReason(v61, v62, v63, v64, v65);
    v66 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v171 = v66;
    _os_log_impl(&dword_218FEA000, v56, OS_LOG_TYPE_DEFAULT, "Dealloc: Not Cancelling outgoing invitation since the chat ended with reason %@", buf, 0xCu);
LABEL_17:

  }
LABEL_18:

LABEL_19:
  objc_msgSend_makeObjectsPerformSelector_(self->_participants, v46, (uint64_t)sel_disconnectFromAVChat, v48, v49, v163);
  objc_msgSend_disconnectFromAVChat(self->_localParticipant, v89, v90, v91, v92);
  self->_localState = 0;
  objc_msgSend_sharedInstance(IMAVCallManager, v93, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__removeIMAVChatFromChatList_(v97, v98, (uint64_t)self, v99, v100);

  objc_msgSend_sharedInstance(IMAVCallManager, v101, v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendProxyUpdate(v105, v106, v107, v108, v109);

  objc_msgSend__clearConnectionTimeoutTimer(self, v110, v111, v112, v113);
  objc_msgSend__clearFirstFrameTimeoutTimer(self, v114, v115, v116, v117);
  objc_msgSend__clearInvitationTimeoutTimer(self, v118, v119, v120, v121);
  objc_msgSend_sharedInstance(IMAVController, v122, v123, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateActiveConference(v126, v127, v128, v129, v130);

  conferenceQueue = self->_conferenceQueue;
  if (conferenceQueue)
  {
    self->_conferenceQueue = 0;

  }
  v164.receiver = self;
  v164.super_class = (Class)IMAVChat;
  -[IMAVChat dealloc](&v164, sel_dealloc);
}

- (id)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  NSString *conferenceID;
  NSString *GUID;
  uint64_t sessionID;
  objc_class *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v7 = (void *)objc_msgSend_initWithString_(v3, v4, (uint64_t)&stru_24DA584C8, v5, v6);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = self->_participants;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v10)
  {
    v15 = v10;
    v16 = *(_QWORD *)v44;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v8);
        objc_msgSend_imHandle(*(void **)(*((_QWORD *)&v43 + 1) + 8 * v17), v11, v12, v13, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(v18, v19, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v7, v24, (uint64_t)v23, v25, v26);

        objc_msgSend_appendString_(v7, v27, (uint64_t)CFSTR(", "), v28, v29);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v15);
  }

  v30 = (void *)MEMORY[0x24BDD17C8];
  if (self->_isVideo)
    v31 = CFSTR("Video");
  else
    v31 = CFSTR("Audio");
  _NSStringDescriptionForIMAVChatState(self->_localState);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  GUID = self->_GUID;
  conferenceID = self->_conferenceID;
  sessionID = self->_sessionID;
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v30, v38, (uint64_t)CFSTR("<%p> %@ chat with %@ (state %@) (ConfID: %@) (SID: %u) (GUID: %@) (Kind: %@)"), v39, v40, self, v31, v7, v32, conferenceID, sessionID, GUID, v37, (_QWORD)v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (void)beginChat
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  IMAVChatParticipant *localParticipant;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  IMAVChat *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend__setCreationDate(self, v4, v5, v6, v7);
  localParticipant = self->_localParticipant;
  if (self->_isCaller)
  {
    objc_msgSend_setState_(localParticipant, v8, 2, v10, v11);
  }
  else
  {
    objc_msgSend_invitedBy(localParticipant, v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantMatchingIMHandle_(self, v14, (uint64_t)v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      sub_2190076D0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] ********* -[IMAVChat beginChat] Could not find participant which invited me!", (uint8_t *)&v22, 2u);
      }

    }
    objc_msgSend_setState_(v17, v18, 2, v19, v20);

  }
}

- (void)endChat
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IMAVChat *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  IMAVChat *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_otherIMHandle(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ID(v8, v9, v10, v11, v12);
    v13 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v13;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Marking conference with %@ as ended", (uint8_t *)&v17, 0xCu);

  }
  sub_2190076D0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = self;
    _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend_endChatWithReason_error_(self, v15, 8, 0, v16);
}

- (void)endChatWithReason:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  IMAVChat *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatEndedReason(v3, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ reason: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend_endChatWithReason_error_(self, v11, v3, 0, v12);
}

- (void)endChatWithError:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  IMAVChat *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatError(v3, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ error: %@", (uint8_t *)&v14, 0x16u);

  }
  if ((_DWORD)v3)
    v13 = 7;
  else
    v13 = 0;
  if (self->_localState == 4)
    objc_msgSend_endChatWithReason_error_(self, v11, v13, v3, v12);
  else
    objc_msgSend_endChatWithReason_error_(self, v11, 6, v3, v12);
}

- (void)endChatWithReason:(unsigned int)a3 error:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int localState;
  uint64_t v62;
  unsigned int v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  IMAVChat *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v75 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatEndedReason(v5, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringDescriptionForIMAVChatError(v4, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v70 = self;
    v71 = 2112;
    v72 = v12;
    v73 = 2112;
    v74 = v17;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@ reason: %@ error: %@", buf, 0x20u);

  }
  if (objc_msgSend_isCaller(self, v18, v19, v20, v21))
  {
    v63 = v4;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend_remoteParticipants(self, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v64, (uint64_t)v68, 16);
    if (v28)
    {
      v33 = v28;
      v34 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v65 != v34)
            objc_enumerationMutation(v26);
          v36 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (objc_msgSend_state(v36, v29, v30, v31, v32) - 1 <= 2)
          {
            if ((_DWORD)v5 == 29)
            {
              objc_msgSend_sharedInstance(IMAVInterface, v29, v30, v31, v32);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_avChat(v36, v50, v51, v52, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_cancelConferenceForAVChat_(v49, v55, (uint64_t)v54, v56, v57);

              objc_msgSend_cancelInvitationWithResponse_(v36, v58, 10, v59, v60);
            }
            else if ((_DWORD)v5 == 27)
            {
              objc_msgSend_sharedInstance(IMAVInterface, v29, v30, v31, v32);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_avChat(v36, v38, v39, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_cancelConferenceForAVChat_(v37, v43, (uint64_t)v42, v44, v45);

              objc_msgSend_cancelInvitationWithResponse_(v36, v46, 8, v47, v48);
            }
            else
            {
              objc_msgSend_cancelInvitationWithReason_(v36, v29, v5, v31, v32);
            }
          }
        }
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v64, (uint64_t)v68, 16);
      }
      while (v33);
    }

    v4 = v63;
  }
  localState = self->_localState;
  if (localState == 3)
  {
    if (objc_msgSend_isCaller(self, v22, v23, v24, v25))
    {
      objc_msgSend_cancelInvitation(self, v22, v62, v24, v25);
      return;
    }
  }
  else if (localState != 1)
  {
    objc_msgSend__endChatWithReason_andError_(self, v22, v5, v4, v25);
    return;
  }
  objc_msgSend_declineInvitationWithResponse_(self, v22, 1, v24, v25);
}

- (void)_endChatWithReason:(unsigned int)a3 andError:(int)a4
{
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *__ptr32 *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  IMAVChat *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int valid;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  NSObject *v84;
  const __CFString *v85;
  NSObject *v86;
  const __CFString *v87;
  NSObject *v88;
  const __CFString *v89;
  NSObject *v90;
  const __CFString *v91;
  NSObject *v92;
  NSObject *v93;
  IMTimingCollection *timingCollection;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  NSMutableArray *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  void *v117;
  const char *v118;
  uint64_t v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  IMAVChat *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  IMAVChat *v147;
  int v148;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  uint8_t v154[128];
  uint8_t buf[4];
  IMAVChat *v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  _BYTE v160[14];
  __int16 v161;
  int v162;
  uint64_t v163;

  v4 = *(_QWORD *)&a3;
  v163 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatEndedReason(v4, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringDescriptionForIMAVChatError(a4, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v156 = self;
    v157 = 2112;
    v158 = v11;
    v159 = 2112;
    *(_QWORD *)v160 = v16;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "avchat: %@ reason: %@ error: %@", buf, 0x20u);

  }
  v21 = &off_219027000;
  if (objc_msgSend_isActive(self, v17, v18, v19, v20))
  {
    sub_2190076D0();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_otherIMHandle(self, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ID(v27, v28, v29, v30, v31);
      v32 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      _NSStringDescriptionForIMAVChatEndedReason(v4, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringDescriptionForIMAVChatError(a4, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v156 = v32;
      v157 = 2112;
      v158 = v37;
      v159 = 1024;
      *(_DWORD *)v160 = v4;
      *(_WORD *)&v160[4] = 2112;
      *(_QWORD *)&v160[6] = v42;
      v161 = 1024;
      v162 = a4;
      _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "Marking conference with %@ as ended with reason: %@ (%d) error: %@ (%d)", buf, 0x2Cu);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    valid = objc_msgSend_validNetworkEnabled(v47, v48, v49, v50, v51);

    objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_validNetworkActive(v57, v58, v59, v60, v61);

    objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend_validNetworkReachable(v67, v68, v69, v70, v71);

    objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_willSearchForNetwork(v77, v78, v79, v80, v81);

    sub_2190076D0();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v83, OS_LOG_TYPE_DEFAULT, "********** Network Status ************", buf, 2u);
    }

    sub_2190076D0();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      if (valid)
        v85 = CFSTR("YES");
      else
        v85 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v85;
      _os_log_impl(&dword_218FEA000, v84, OS_LOG_TYPE_DEFAULT, "Is Network Enabled: %@", buf, 0xCu);
    }

    sub_2190076D0();
    v86 = objc_claimAutoreleasedReturnValue();
    v21 = &off_219027000;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      if (v62)
        v87 = CFSTR("YES");
      else
        v87 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v87;
      _os_log_impl(&dword_218FEA000, v86, OS_LOG_TYPE_DEFAULT, "Is Network Active: %@", buf, 0xCu);
    }

    sub_2190076D0();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      if (v72)
        v89 = CFSTR("YES");
      else
        v89 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v89;
      _os_log_impl(&dword_218FEA000, v88, OS_LOG_TYPE_DEFAULT, "Is Network Reachable: %@", buf, 0xCu);
    }

    sub_2190076D0();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      if (v82)
        v91 = CFSTR("YES");
      else
        v91 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v156 = (IMAVChat *)v91;
      _os_log_impl(&dword_218FEA000, v90, OS_LOG_TYPE_DEFAULT, "Will Search for Network: %@", buf, 0xCu);
    }

    sub_2190076D0();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v92, OS_LOG_TYPE_DEFAULT, "**************************************", buf, 2u);
    }

  }
  sub_2190076D0();
  v93 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    timingCollection = self->_timingCollection;
    *(_DWORD *)buf = *((_QWORD *)v21 + 225);
    v156 = (IMAVChat *)timingCollection;
    _os_log_impl(&dword_218FEA000, v93, OS_LOG_TYPE_DEFAULT, "Chat timings: %@", buf, 0xCu);
  }

  if (objc_msgSend_isActive(self, v95, v96, v97, v98))
  {
    objc_msgSend_sharedInstance(IMAVInterface, v99, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endConferenceForAVChat_(v103, v104, (uint64_t)self, v105, v106);

  }
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v147 = self;
  v107 = self->_participants;
  v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v108, (uint64_t)&v150, (uint64_t)v154, 16);
  if (v109)
  {
    v114 = v109;
    v115 = *(_QWORD *)v151;
    v148 = *((_QWORD *)v21 + 225);
    do
    {
      for (i = 0; i != v114; ++i)
      {
        if (*(_QWORD *)v151 != v115)
          objc_enumerationMutation(v107);
        v117 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * i);
        if (objc_msgSend_state(v117, v110, v111, v112, v113) != 5)
          objc_msgSend_setStateToEndedWithReason_andError_(v117, v118, v4, a4, v119);
        sub_2190076D0();
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__participantsCallInfo(v117, v121, v122, v123, v124);
          v125 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v148;
          v156 = v125;
          _os_log_impl(&dword_218FEA000, v120, OS_LOG_TYPE_DEFAULT, "_endChatWithReason participant info states %@", buf, 0xCu);

        }
      }
      v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v110, (uint64_t)&v150, (uint64_t)v154, 16);
    }
    while (v114);
  }

  objc_msgSend_sharedInstance(IMAVController, v126, v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateActiveConference(v130, v131, v132, v133, v134);

  if (!v147->_hasGatheredInfo)
  {
    v147->_hasGatheredInfo = 1;
    objc_msgSend__submitCallEndedLoggingWithReason_andError_(v147, v135, v4, a4, v138);
  }
  objc_msgSend__postStateToDelegateIfNecessary(v147, v135, v136, v137, v138);
  objc_msgSend_sharedInstance(IMAVInterface, v139, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unsetDelegate_(v143, v144, (uint64_t)v147, v145, v146);

}

- (id)inviteesInfo
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t sessionID;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_remoteParticipants(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_additionalPeers(v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_additionalPeers(v14, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v3, v30, (uint64_t)v29, v31, v32);
  }
  else
  {
    objc_msgSend_otherIMHandle(self, v25, v26, v27, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_originalID(v33, v34, v35, v36, v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend_length(v29, v38, v39, v40, v41))
    {
      objc_msgSend_otherIMHandle(self, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ID(v46, v47, v48, v49, v50);
      v51 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v51;
    }
    objc_msgSend_addObject_(v3, v42, (uint64_t)v29, v44, v45);
  }

  objc_msgSend_excludingPushTokens(v14, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_count(v56, v57, v58, v59, v60);

  if (v61)
  {
    objc_msgSend_excludingPushTokens(v14, v62, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v4, v67, (uint64_t)v66, v68, v69);

  }
  v70 = (void *)MEMORY[0x24BDBCE70];
  sessionID = self->_sessionID;
  if ((_DWORD)sessionID)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v62, sessionID, v64, v65);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v70, v73, (uint64_t)v72, v74, v75, *MEMORY[0x24BE504F0], v3, *MEMORY[0x24BE50488], v4, CFSTR("excludingPushTokens"), 0);
  }
  else
  {
    v72 = 0;
    objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v62, 0, v64, v65, *MEMORY[0x24BE504F0], v3, *MEMORY[0x24BE50488], v4, CFSTR("excludingPushTokens"), 0);
  }
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)sessionID)

  return v76;
}

- (BOOL)_isCallUpgradeTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  objc_msgSend_otherIMHandle(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = MEMORY[0x219A28364](v14, v19);
  return (char)v4;
}

- (BOOL)_isVideoUpgradeTo:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  IMAVChat *v26;
  BOOL v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_otherIMHandle(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_sharedInstance(IMAVCallManager, v7, v8, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_calls(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v18)
  {
    v23 = v18;
    v24 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v16);
        v26 = *(IMAVChat **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (v26 != self
          && objc_msgSend_isActive(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v19, v20, v21, v22)
          && objc_msgSend_isVideo(self, v19, v20, v21, v22)
          && (objc_msgSend_isVideo(v26, v19, v20, v21, v22) & 1) == 0
          && (objc_msgSend__isCallUpgradeTo_(v26, v19, (uint64_t)v6, v21, v22) & 1) != 0)
        {
          v27 = 1;
          goto LABEL_15;
        }
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v29, (uint64_t)v33, 16);
      if (v23)
        continue;
      break;
    }
  }
  v27 = 0;
LABEL_15:

  return v27;
}

- (void)inviteAll
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int isAVInterfaceReady;
  NSObject *v30;
  _BOOL4 v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t v54[16];
  uint8_t v55[16];
  uint8_t buf[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Starting invite process", buf, 2u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v4, (uint64_t)CFSTR("time-to-invitation"), v5, v6);
  objc_msgSend_stopTimingForKey_(self->_timingCollection, v7, (uint64_t)CFSTR("time-to-av-invitation-op-creation"), v8, v9);
  objc_msgSend__setActiveConference(self, v10, v11, v12, v13);
  objc_msgSend_setMute_(self, v14, 0, v15, v16);
  objc_msgSend_setPaused_(self, v17, 0, v18, v19);
  objc_msgSend_sharedInstance(IMAVInterface, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  isAVInterfaceReady = objc_msgSend_isAVInterfaceReady(v24, v25, v26, v27, v28);

  sub_2190076D0();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (isAVInterfaceReady)
  {
    if (v31)
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_218FEA000, v30, OS_LOG_TYPE_DEFAULT, "Delivering Invites", v55, 2u);
    }

    objc_msgSend_remoteParticipants(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_makeObjectsPerformSelector_(v36, v37, (uint64_t)sel_sendInvitation, v38, v39);
  }
  else
  {
    if (v31)
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_218FEA000, v30, OS_LOG_TYPE_DEFAULT, "Initing Interface", v54, 2u);
    }

    self->_hasPendingInit = 1;
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v44, v45, (uint64_t)self, (uint64_t)sel__vccInitDidFinish_, (uint64_t)CFSTR("__kIMAVInterfaceReadyNotification"), 0);

    objc_msgSend_sharedInstance(IMAVInterface, v46, v47, v48, v49);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_initAVInterface(v36, v50, v51, v52, v53);
  }

}

- (void)_cancelInvitationWithReason:(unsigned int)a3 error:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  objc_msgSend_initiatorParticipant(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStateToEndedWithReason_andError_(v9, v7, v6, v5, v8);

}

- (void)cancelInvitation
{
  uint64_t v2;

  objc_msgSend__cancelInvitationWithReason_error_(self, a2, 1, 0, v2);
}

- (void)invite:(id)a3 additionalPeers:(id)a4 excludingPushTokens:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *inited;
  IMAVChatParticipant *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint8_t buf[4];
  NSObject *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_2190076D0();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      objc_msgSend_ID(v8, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v105 = v17;
      _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "Asked to invite a buddy: %@", buf, 0xCu);

    }
    objc_msgSend_remoteParticipants(self, v18, v19, v20, v21);
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v11, v22, v23, v24, v25))
    {
      if (objc_msgSend_count(v9, v26, v27, v28, v29))
      {
        objc_msgSend_remoteParticipants(self, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v34, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        sub_2190076D0();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v9;
          _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "Additional peers %@", buf, 0xCu);
        }

        objc_msgSend_setAdditionalPeers_(v39, v41, (uint64_t)v9, v42, v43);
      }
      if (objc_msgSend_count(v10, v30, v31, v32, v33))
      {
        objc_msgSend_remoteParticipants(self, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v48, v49, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        sub_2190076D0();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v10;
          _os_log_impl(&dword_218FEA000, v54, OS_LOG_TYPE_DEFAULT, "Excluding push tokens %@", buf, 0xCu);
        }

        objc_msgSend_setExcludingPushTokens_(v53, v55, (uint64_t)v10, v56, v57);
      }
      objc_msgSend_makeObjectsPerformSelector_(v11, v44, (uint64_t)sel_sendInvitation, v46, v47);
      sub_2190076D0();
      inited = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v105 = v11;
        _os_log_impl(&dword_218FEA000, inited, OS_LOG_TYPE_DEFAULT, "We already have a remote participant in this chat %@, can't add more", buf, 0xCu);
      }
    }
    else
    {
      v59 = [IMAVChatParticipant alloc];
      objc_msgSend_account(v8, v60, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_loginIMHandle(v64, v65, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(v8, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      inited = objc_msgSend_initAs_invitedBy_toChat_account_(v59, v75, (uint64_t)v8, (uint64_t)v69, (uint64_t)self, v74);

      if (objc_msgSend_count(v9, v76, v77, v78, v79))
      {
        sub_2190076D0();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v9;
          _os_log_impl(&dword_218FEA000, v84, OS_LOG_TYPE_DEFAULT, "Additional peers %@", buf, 0xCu);
        }

        objc_msgSend_setAdditionalPeers_(inited, v85, (uint64_t)v9, v86, v87);
      }
      if (objc_msgSend_count(v10, v80, v81, v82, v83))
      {
        sub_2190076D0();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v10;
          _os_log_impl(&dword_218FEA000, v90, OS_LOG_TYPE_DEFAULT, "Excluding push tokens %@", buf, 0xCu);
        }

        objc_msgSend_setExcludingPushTokens_(inited, v91, (uint64_t)v10, v92, v93);
      }
      objc_msgSend__insertRemoteParticipant_atIndex_(self, v88, (uint64_t)inited, 0, v89);
      objc_msgSend_sendInvitation(inited, v94, v95, v96, v97);
      objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v98, (uint64_t)inited, v99, v100, CFSTR("__kIMAVChatParticipantKey"), 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__postNotificationName_userInfo_(self, v102, (uint64_t)CFSTR("__kIMAVChatParticipantAddedNotification"), (uint64_t)v101, v103);

    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "[WARN] AVChat asked to invite buddy == nil !", buf, 2u);
  }

}

- (void)invite:(id)a3 additionalPeers:(id)a4
{
  objc_msgSend_invite_additionalPeers_excludingPushTokens_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (void)invite:(id)a3
{
  ((void (*)(IMAVChat *, char *, id, _QWORD))MEMORY[0x24BEDD108])(self, sel_invite_additionalPeers_, a3, 0);
}

- (void)acceptInvitation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int isAVInterfaceReady;
  NSObject *v58;
  _BOOL4 v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  IMAVChat *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  IMAVChat *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isCaller(self, a2, v2, v3, v4))
  {
    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v79 = 138412290;
      v80 = self;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Received bogus when I'm actually the caller for chat: %@", (uint8_t *)&v79, 0xCu);
    }
    goto LABEL_17;
  }
  v11 = objc_msgSend_state(self, v6, v7, v8, v9);
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v11 != 1)
  {
    if (!v12)
      goto LABEL_17;
    v63 = objc_msgSend_state(self, v13, v14, v15, v16);
    _NSStringDescriptionForIMAVChatState(v63);
    v64 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    v79 = 138412290;
    v80 = v64;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Received bogus accept request in state: %@", (uint8_t *)&v79, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  if (v12)
  {
    LOWORD(v79) = 0;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Starting accept process", (uint8_t *)&v79, 2u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v17, (uint64_t)CFSTR("time-to-response"), v18, v19);
  objc_msgSend_startTimingForKey_(self->_timingCollection, v20, (uint64_t)CFSTR("time-to-start-connecting"), v21, v22);
  objc_msgSend_initiatorParticipant(self, v23, v24, v25, v26);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(IMAVInterface, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v31, v32, (uint64_t)self, v33, v34);

  objc_msgSend_setMute_(self, v35, 0, v36, v37);
  objc_msgSend_setPaused_(self, v38, 0, v39, v40);
  objc_msgSend_setState_(v10, v41, 3, v42, v43);
  objc_msgSend__setActiveConference(self, v44, v45, v46, v47);
  objc_msgSend_sharedInstance(IMAVInterface, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  isAVInterfaceReady = objc_msgSend_isAVInterfaceReady(v52, v53, v54, v55, v56);

  sub_2190076D0();
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
  if (!isAVInterfaceReady)
  {
    if (v59)
    {
      LOWORD(v79) = 0;
      _os_log_impl(&dword_218FEA000, v58, OS_LOG_TYPE_DEFAULT, "Building AV Interface", (uint8_t *)&v79, 2u);
    }

    self->_hasPendingAccept = 1;
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v69, v70, (uint64_t)self, (uint64_t)sel__vccInitDidFinish_, (uint64_t)CFSTR("__kIMAVInterfaceReadyNotification"), 0);

    objc_msgSend_sharedInstance(IMAVInterface, v71, v72, v73, v74);
    v64 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_initAVInterface(v64, v75, v76, v77, v78);
    goto LABEL_16;
  }
  if (v59)
  {
    LOWORD(v79) = 0;
    _os_log_impl(&dword_218FEA000, v58, OS_LOG_TYPE_DEFAULT, "Sending response", (uint8_t *)&v79, 2u);
  }

  objc_msgSend_sendResponse_(v10, v60, 0, v61, v62);
LABEL_17:

}

- (void)declineInvitationWithResponse:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  IMAVChat *v19;
  uint64_t v20;
  uint8_t v21[16];

  v3 = *(_QWORD *)&a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Starting decline process", v21, 2u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v6, (uint64_t)CFSTR("time-to-response"), v7, v8);
  objc_msgSend_initiatorParticipant(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendResponse_(v13, v14, v3, v15, v16);

  switch((int)v3)
  {
    case 2:
      v19 = self;
      v20 = 8;
      goto LABEL_11;
    case 4:
      v19 = self;
      v20 = 12;
      goto LABEL_11;
    case 5:
      objc_msgSend__endChatWithReason_andError_(self, v17, 12, 6000, v18);
      return;
    case 6:
      v19 = self;
      v20 = 14;
      goto LABEL_11;
    case 7:
      v19 = self;
      v20 = 21;
      goto LABEL_11;
    case 11:
      v19 = self;
      v20 = 31;
      goto LABEL_11;
    default:
      v19 = self;
      v20 = 5;
LABEL_11:
      objc_msgSend__endChatWithReason_andError_(v19, v17, v20, 0, v18);
      return;
  }
}

- (void)declineInvitation
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Starting decline process", v7, 2u);
  }

  objc_msgSend_declineInvitationWithResponse_(self, v4, 1, v5, v6);
}

- (void)_setStateDisconnected
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int localState;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int v13;
  IMAVChat *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v13, 0xCu);
  }

  localState = self->_localState;
  if (localState == 3)
  {
    v9 = 6;
  }
  else
  {
    if (localState != 4)
      return;
    v9 = 7;
  }
  v10 = objc_msgSend_endedError(self, v4, v5, v6, v7);
  objc_msgSend__endChatWithReason_andError_(self, v11, v9, v10, v12);
}

- (BOOL)_processVCResponseDict:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  unsigned int sessionID;
  NSObject *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  char v50;
  NSObject *v51;
  int v52;
  unsigned int v53;
  int v55;
  NSObject *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  unsigned int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = v4;
  if (v4)
  {
    objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x24BE504D0], v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantMatchingIMHandle_(self, v10, (uint64_t)v9, v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend_remoteParticipants(self, v13, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastObject(v18, v19, v20, v21, v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend__switchToUseNewIMHandle_(v17, v13, (uint64_t)v9, v15, v16);
    objc_msgSend_objectForKey_(v8, v23, *MEMORY[0x24BE504E0], v24, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v50 = 1;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend_dictionaryWithPlistData_(MEMORY[0x24BDBCE70], v26, (uint64_t)v29, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v30, v31, *MEMORY[0x24BE504F0], v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v39 = v34;
    if (v34)
    {
      v40 = objc_msgSend_unsignedIntValue(v34, v35, v36, v37, v38);
      sessionID = self->_sessionID;
      sub_2190076D0();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      if (v40 == sessionID)
      {
        if (v43)
        {
          v55 = 138412290;
          v56 = v39;
          _os_log_impl(&dword_218FEA000, v42, OS_LOG_TYPE_DEFAULT, "response or counter-proposal received for expected session ID %@", (uint8_t *)&v55, 0xCu);
        }

        v50 = objc_msgSend__processResponseDictionary_allowSecondConnection_(v17, v48, (uint64_t)v8, 0, v49);
        goto LABEL_21;
      }
      if (v43)
      {
        v52 = objc_msgSend_unsignedIntValue(v39, v44, v45, v46, v47);
        v53 = self->_sessionID;
        v55 = 138412802;
        v56 = v9;
        v57 = 1024;
        v58 = v52;
        v59 = 1024;
        v60 = v53;
        _os_log_impl(&dword_218FEA000, v42, OS_LOG_TYPE_DEFAULT, "Response or counter-proposal received from %@ with session ID %d that doesn't match %u", (uint8_t *)&v55, 0x18u);
      }

    }
    else
    {
      sub_2190076D0();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v55) = 0;
        _os_log_impl(&dword_218FEA000, v51, OS_LOG_TYPE_DEFAULT, "[WARN] No session ID", (uint8_t *)&v55, 2u);
      }

    }
    v50 = 0;
LABEL_21:

    goto LABEL_22;
  }
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v55) = 0;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVChat _processVCResponseDict:] nil dict", (uint8_t *)&v55, 2u);
  }
  v50 = 0;
LABEL_23:

  return v50;
}

- (void)__responseToVCInvite:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x24BE504D0], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412546;
    v26 = v8;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Response from: %@  dictionary: %@", (uint8_t *)&v25, 0x16u);
  }

  objc_msgSend_stopTimingForKey_(self->_timingCollection, v10, (uint64_t)CFSTR("time-to-response"), v11, v12);
  objc_msgSend_startTimingForKey_(self->_timingCollection, v13, (uint64_t)CFSTR("time-to-start-connecting"), v14, v15);
  v19 = objc_msgSend__processVCResponseDict_(self, v16, (uint64_t)v4, v17, v18);
  sub_2190076D0();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      LOWORD(v25) = 0;
      v22 = "Successfully processed VC response";
      v23 = v20;
      v24 = 2;
LABEL_8:
      _os_log_impl(&dword_218FEA000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, v24);
    }
  }
  else if (v21)
  {
    v25 = 138412290;
    v26 = v4;
    v22 = "[WARN] Failed processing of VC response dictionary: %@";
    v23 = v20;
    v24 = 12;
    goto LABEL_8;
  }

}

- (void)_responseToVCInvite:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v19;
  uint8_t buf[2];

  v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7, v8) != 2
    && objc_msgSend_state(self, v9, v10, v11, v12) != 3
    && objc_msgSend_state(self, v9, v10, v11, v12) != 4)
  {
    sub_2190076D0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "[WARN] Received response while we're not waiting for a response";
      v18 = buf;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if ((objc_msgSend_isCaller(self, v9, v10, v11, v12) & 1) == 0)
  {
    sub_2190076D0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v17 = "[WARN] Received response while we're not the caller, ignoring";
      v18 = (uint8_t *)&v19;
LABEL_10:
      _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  objc_msgSend___responseToVCInvite_(self, v13, (uint64_t)v4, v14, v15);
LABEL_12:

}

- (void)_handleGenericAVMessageFromParticipant:(id)a3 type:(unsigned int)a4 userInfo:(id)a5 handled:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  _DWORD v39[7];

  *(_QWORD *)&v39[5] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if ((int)a4 <= 1000)
  {
    if (a4 != 350)
    {
      if (a4 == 1000)
      {
        sub_2190076D0();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v38 = 138412290;
          *(_QWORD *)v39 = v10;
          _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Received ping from participant: %@  => sending pong", (uint8_t *)&v38, 0xCu);
        }

        objc_msgSend_sendAVMessage_userInfo_(v10, v13, 1001, 0, v14);
        goto LABEL_22;
      }
      goto LABEL_18;
    }
    sub_2190076D0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      *(_QWORD *)v39 = v10;
      _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "Received prepare from participant: %@", (uint8_t *)&v38, 0xCu);
    }
    goto LABEL_14;
  }
  if (a4 != 1001)
  {
    if (a4 != 1500)
    {
LABEL_18:
      if (!a6)
      {
        sub_2190076D0();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_imHandle(v10, v28, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ID(v32, v33, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 67109378;
          v39[0] = a4;
          LOWORD(v39[1]) = 2112;
          *(_QWORD *)((char *)&v39[1] + 2) = v37;
          _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Unhandled messagetype id: %d from: %@", (uint8_t *)&v38, 0x12u);

        }
      }
      goto LABEL_22;
    }
    sub_2190076D0();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      *(_QWORD *)v39 = v10;
      _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "Received local IP change from participant: %@ => notifying AVConference", (uint8_t *)&v38, 0xCu);
    }

    objc_msgSend_sharedInstance(IMAVInterface, v16, v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_processRemoteIPChanged_fromParticipant_(v20, v21, (uint64_t)v11, (uint64_t)v10, v22);
LABEL_14:

    goto LABEL_22;
  }
  sub_2190076D0();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412290;
    *(_QWORD *)v39 = v10;
    _os_log_impl(&dword_218FEA000, v23, OS_LOG_TYPE_DEFAULT, "Received pong from participant: %@  => clearing break before make timer", (uint8_t *)&v38, 0xCu);
  }

  objc_msgSend_setMayRequireBreakBeforeMake_(self, v24, 0, v25, v26);
LABEL_22:

}

- (void)handleGenericAVMessageFromParticipant:(id)a3 type:(unsigned int)a4 userInfo:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v6 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 1024;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "handleGenericAVMessageFromParticipant: %@   Type: %d   UserInfo: %@", (uint8_t *)&v12, 0x1Cu);
  }

  objc_msgSend__handleGenericAVMessageFromParticipant_type_userInfo_handled_(self, v11, (uint64_t)v8, v6, (uint64_t)v9, 0);
}

- (id)participantWithAVConferenceCallID:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_remoteParticipants(self, a2, a3, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend_matchesAVConferenceCallID_(v15, v9, a3, v10, v11) & 1) != 0)
        {
          v16 = v15;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)participantWithID:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v11;
  IMAVChat *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ vcPartyID: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend__participantMatchingVCPartyID_(self, v6, (uint64_t)v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)vcPartyIDForIMHandle:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  IMAVChat *v14;
  NSObject *v15;
  int v17;
  IMAVChat *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@ imhandle: %@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v6, ++dword_25503AFE8, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValue(v9, v10, v11, v12, v13);
  v14 = (IMAVChat *)objc_claimAutoreleasedReturnValue();

  if (dword_25503AFE8 == 9999)
    dword_25503AFE8 = 1000;
  sub_2190076D0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v14;
    _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "  Using VC Party Coerced ID: %@", (uint8_t *)&v17, 0xCu);
  }

  return v14;
}

- (id)participantMatchingIMHandle:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_participants;
  v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend_imHandle(v14, v7, v8, v9, v10, (_QWORD)v17);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          v11 = v14;
          goto LABEL_11;
        }
      }
      v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (void)_setCallerProperties:(id)a3
{
  NSDictionary *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  IMAVChat *v16;
  __int16 v17;
  NSDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (NSDictionary *)a3;
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "avchat: %@ properties: %@", (uint8_t *)&v15, 0x16u);
  }

  if (self->_callerProperties != v5)
  {
    objc_storeStrong((id *)&self->_callerProperties, a3);
    objc_msgSend_initiatorParticipant(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProperties_(v11, v12, (uint64_t)v5, v13, v14);

  }
}

- (IMHandle)otherIMHandle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if ((unint64_t)objc_msgSend_count(self->_participants, a2, v2, v3, v4) < 2)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndex_(self->_participants, v6, 1, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imHandle(v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (IMHandle *)v14;
}

- (BOOL)_isProxy
{
  return 0;
}

- (IMAccount)account
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (IMAccount *)objc_msgSend_account(self->_initiator, a2, v2, v3, v4);
}

- (void)_setConferenceID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString *v6;
  NSString *conferenceID;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t v22[16];

  if (self->_conferenceID != a3)
  {
    v6 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
    conferenceID = self->_conferenceID;
    self->_conferenceID = v6;

    objc_msgSend__postNotificationName_userInfo_(self, v8, (uint64_t)CFSTR("__kIMAVChatConferenceIDChangedNotification"), 0, v9);
    objc_msgSend_makeObjectsPerformSelector_withObject_(self->_participants, v10, (uint64_t)sel__setConferenceID_, (uint64_t)self->_conferenceID, v11);
    sub_2190076D0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Conference ID changed sending proxy update", v22, 2u);
    }

    objc_msgSend_sharedInstance(IMAVCallManager, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sendProxyUpdate(v17, v18, v19, v20, v21);

  }
}

- (int)endedError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_error(self->_localParticipant, a2, v2, v3, v4);
}

- (unsigned)endedReason
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_reasonChatEnded(self->_localParticipant, a2, v2, v3, v4);
}

- (void)_setCreationDate
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSDate *v8;
  NSDate *dateCreated;
  NSString *v10;
  NSString *conferenceID;
  int v12;
  IMAVChat *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v12, 0xCu);
  }

  if (!self->_dateCreated)
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v4, v5, v6, v7);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateCreated = self->_dateCreated;
    self->_dateCreated = v8;

  }
  if (!self->_conferenceID)
  {
    sub_2190013B4();
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    conferenceID = self->_conferenceID;
    self->_conferenceID = v10;

  }
}

- (void)_setDateConnected
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSDate *v8;
  NSDate *dateConnected;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  IMAVChat *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v20, 0xCu);
  }

  if (!self->_dateConnected)
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v4, v5, v6, v7);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateConnected = self->_dateConnected;
    self->_dateConnected = v8;

    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Date connected changed, sending proxy update", (uint8_t *)&v20, 2u);
    }

    objc_msgSend_sharedInstance(IMAVCallManager, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sendProxyUpdate(v15, v16, v17, v18, v19);

  }
}

- (int64_t)_bustedCallID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;

  objc_msgSend_remoteParticipants(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imFirstObject(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_bestCallID(v10, v11, v12, v13, v14);

  return v15;
}

- (BOOL)isConferenceSilent
{
  return 0;
}

- (NSNumber)_remoteNatType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_remoteParticipants(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__natType(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v15;
}

- (NSNumber)_currentNatType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_natTypeForAVChat_(v6, v7, (uint64_t)self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v10;
}

- (NSNumber)_connectDuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;

  objc_msgSend_dateConnected(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v6;
  if (self->_dateStartedConnecting)
  {
    if (!v6)
    {
      objc_msgSend_date(MEMORY[0x24BDBCE60], v7, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_timeIntervalSinceDate_(v11, v7, (uint64_t)self->_dateStartedConnecting, v9, v10);
  }
  else
  {
    v12 = 0.0;
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v7, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v13;
}

- (NSNumber)_callDuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  objc_msgSend_dateConnected(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateEnded(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  if (v6)
  {
    if (v11)
    {
      v17 = v11;
    }
    else
    {
      objc_msgSend_date(MEMORY[0x24BDBCE60], v12, v13, v14, v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v17;
    objc_msgSend_timeIntervalSinceDate_(v17, v18, (uint64_t)v6, v19, v20);
    v23 = v22;

    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v24, v25, v26, v27, v23);
  }
  else
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v12, v13, v14, v15, 0.0);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v28;
}

- (NSNumber)_relayConnectDuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  NSDate *dateReceivedRelayUpdate;
  NSDate *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSDate *v12;
  double v13;
  double v14;

  v5 = 0.0;
  if (self->_dateReceivedRelayInitiate)
  {
    dateReceivedRelayUpdate = self->_dateReceivedRelayUpdate;
    if (dateReceivedRelayUpdate)
    {
      v8 = dateReceivedRelayUpdate;
    }
    else
    {
      objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2, v3, v4);
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v8;
    objc_msgSend_timeIntervalSinceDate_(v8, v9, (uint64_t)self->_dateReceivedRelayInitiate, v10, v11);
    v5 = v13;

  }
  if (v5 >= 0.0)
    v14 = v5;
  else
    v14 = 0.0;
  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, v2, v3, v4, v14);
}

- (BOOL)_usesRelay
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (int)objc_msgSend__connectionType(self, a2, v2, v3, v4) > 1;
}

- (NSNumber)_natType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSNumber *natType;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  natType = self->_natType;
  if (natType)
    v6 = objc_msgSend_unsignedIntValue(natType, a2, v2, v3, v4);
  else
    v6 = 0xFFFFFFFFLL;
  if (CFPreferencesGetAppBooleanValue(CFSTR("UseCustomNatType"), CFSTR("com.apple.conference"), 0))
  {
    v6 = IMGetDomainIntForKey();
    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v6;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "overriding natType: %u", (uint8_t *)v13, 8u);
    }

  }
  if ((v6 & 0x80000000) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v7, v6, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v11;
}

- (BOOL)isUsingWifi
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend__localNetworkConnectionType(self, a2, v2, v3, v4) != 1;
}

- (void)setRelayed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_relayed != a3)
  {
    v3 = a3;
    sub_2190076D0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("YES");
      if (self->_relayed)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      if (!v3)
        v6 = CFSTR("NO");
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set relayed from %@ to %@.", (uint8_t *)&v16, 0x16u);
    }

    self->_relayed = v3;
    objc_msgSend_sharedInstance(IMAVInterface, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chatRelayedStatusChanged_(v12, v13, (uint64_t)self, v14, v15);

  }
}

- (void)setMayRequireBreakBeforeMake:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_mayRequireBreakBeforeMake != a3)
  {
    v3 = a3;
    sub_2190076D0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("YES");
      if (self->_mayRequireBreakBeforeMake)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      if (!v3)
        v6 = CFSTR("NO");
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set mayRequireBreakBeforeMake from %@ to %@.", (uint8_t *)&v10, 0x16u);
    }

    self->_mayRequireBreakBeforeMake = v3;
    objc_msgSend__postNotificationName_userInfo_(self, v8, (uint64_t)CFSTR("__kIMAVChatMayRequireBreakBeforeMakeChangedNotification"), 0, v9);
  }
}

- (unint64_t)_localNetworkConnectionType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t result;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  result = self->_localNetworkConnectionType;
  if (!result)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE30360], a2, v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_allowAnyNetwork(v7, v8, v9, v10, v11);
    if ((v16 & 1) != 0
      || (objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v12, v13, v14, v15),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_nonWifiFaceTimeAvailable(v5, v17, v18, v19, v20)))
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v12, v13, v14, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_dataActiveAndReachable(v21, v22, v23, v24, v25);

      if ((v16 & 1) != 0)
      {
LABEL_8:

        if (v26)
          return 1;
        else
          return 2;
      }
    }
    else
    {
      v26 = 0;
    }

    goto LABEL_8;
  }
  return result;
}

- (NSArray)_imHandles
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend_remoteParticipants(self, v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v10)
  {
    v15 = v10;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v8);
        objc_msgSend_imHandle(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v17), v11, v12, v13, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v19, (uint64_t)v18, v20, v21);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v15);
  }

  return (NSArray *)v3;
}

- (void)_handleAVError:(id)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  IMAVChat *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint8_t buf[4];
  IMAVChat *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = self;
    v50 = 2112;
    v51 = v5;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "AVChat: %@ received error: %@", buf, 0x16u);
  }

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    sub_2190076D0();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = self;
      v50 = 2112;
      v51 = v5;
      v52 = 2112;
      v53[0] = v43;
      _os_log_impl(&dword_218FEA000, v41, OS_LOG_TYPE_DEFAULT, "[WARN] Invalid error type posted to chat: %@   error: %@    class: %@", buf, 0x20u);

    }
  }
  else if (objc_msgSend_isActive(self, v7, v8, v9, v10))
  {
    v47 = 0;
    v46 = 1;
    v15 = objc_msgSend_state(self, v11, v12, v13, v14);
    sub_218FFCE50(v5, (_DWORD *)&v47 + 1, (int *)&v47, &v46);
    sub_2190076D0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_domain(v5, v17, v18, v19, v20);
      v21 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v5, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_code(v5, v27, v28, v29, v30);
      _NSStringDescriptionForIMAVChatEndedReason(HIDWORD(v47), v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v49 = v21;
      v50 = 2112;
      v51 = v26;
      v52 = 1024;
      LODWORD(v53[0]) = v31;
      WORD2(v53[0]) = 2112;
      *(_QWORD *)((char *)v53 + 6) = v36;
      _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, "Conference received error: [%@:%@:%d:%@]", buf, 0x26u);

    }
    v37 = v46;
    sub_2190076D0();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    if (v15 != 4 || v37)
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v38, OS_LOG_TYPE_DEFAULT, "This is a fatal error", buf, 2u);
      }

      objc_storeStrong((id *)&self->_error, a3);
      objc_msgSend__endChatWithReason_andError_(self, v44, HIDWORD(v47), v47, v45);
    }
    else
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v38, OS_LOG_TYPE_DEFAULT, "This is not a fatal error, and we're connected already - so ignoring", buf, 2u);
      }

    }
  }
  else
  {
    sub_2190076D0();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "Ignoring error, we're already dead anyway!", buf, 2u);
    }

  }
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  int v15;
  id v16;
  __int16 v17;
  IMAVChat *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_GUID)
  {
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412802;
      v16 = v6;
      v17 = 2112;
      v18 = self;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification name: %@  object: %@  userInfo: %@", (uint8_t *)&v15, 0x20u);
    }

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v13, v14, (uint64_t)v6, (uint64_t)self, (uint64_t)v7);

  }
}

- (void)_postNotificationName:(id)a3 participant:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_GUID)
  {
    sub_2190076D0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412802;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "Posting participant notification name: %@  object: %@  userInfo: %@", (uint8_t *)&v18, 0x20u);
    }

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v16, v17, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10);

  }
}

- (void)_noteFirstFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend_dateConnected(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend__setDateConnected(self, v7, v8, v9, v10);
    objc_msgSend__submitCallConnectedLogging(self, v11, v12, v13, v14);
  }
  self->_hasReceivedFirstFrame = 1;
  objc_msgSend_sharedInstance(IMAVCallManager, v7, v8, v9, v10);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendProxyUpdate(v19, v15, v16, v17, v18);

}

- (id)_timings
{
  return self->_timingCollection;
}

- (void)_clearCache
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_removeAllObjects(self->_conferenceStateCache, a2, v2, v3, v4);
}

- (void)_cacheBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *conferenceStateCache;
  void *v11;
  id key;

  v4 = a3;
  key = a4;
  if (!self->_conferenceStateCache)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    conferenceStateCache = self->_conferenceStateCache;
    self->_conferenceStateCache = Mutable;

  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v4, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_conferenceStateCache, key, v11);

}

- (BOOL)_hasCachedBoolForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    objc_msgSend_objectForKey_(self->_conferenceStateCache, v9, (uint64_t)v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_cachedBoolForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    objc_msgSend_objectForKey_(self->_conferenceStateCache, v9, (uint64_t)v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_BOOLValue(v12, v13, v14, v15, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (OS_dispatch_queue)_conferenceQueue
{
  return self->_conferenceQueue;
}

- (void)set_conferenceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_conferenceQueue, a3);
}

- (int)_connectionType
{
  return self->_connectionType;
}

- (void)_setConnectionType:(int)a3
{
  self->_connectionType = a3;
}

- (NSString)_callStatisticsGUID
{
  return self->_callStatisticsGUID;
}

- (void)_setCallStatisticsGUID:(id)a3
{
  objc_storeStrong((id *)&self->_callStatisticsGUID, a3);
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (NSDictionary)callerProperties
{
  return self->_callerProperties;
}

- (IMHandle)initiatorIMHandle
{
  return self->_initiator;
}

- (void)_setNatType:(id)a3
{
  objc_storeStrong((id *)&self->_natType, a3);
}

- (void)_setLocalNetworkConnectionType:(unint64_t)a3
{
  self->_localNetworkConnectionType = a3;
}

- (unint64_t)_remoteNetworkConnectionType
{
  return self->_remoteNetworkConnectionType;
}

- (void)_setRemoteNetworkConnectionType:(unint64_t)a3
{
  self->_remoteNetworkConnectionType = a3;
}

- (BOOL)_needsAudioRestart
{
  return self->_needsAudioRestart;
}

- (void)_setNeedsAudioRestart:(BOOL)a3
{
  self->_needsAudioRestart = a3;
}

- (BOOL)_needsVideoRestart
{
  return self->_needsVideoRestart;
}

- (void)_setNeedsVideoRestart:(BOOL)a3
{
  self->_needsVideoRestart = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (NSDate)_interruptionBegan
{
  return self->_interruptionBegan;
}

- (void)_setInterruptionBegan:(id)a3
{
  objc_storeStrong((id *)&self->_interruptionBegan, a3);
}

- (NSNumber)_frontCameraCaptureTime
{
  return self->_frontCameraCaptureTime;
}

- (void)_setFrontCameraCaptureTime:(id)a3
{
  objc_storeStrong((id *)&self->_frontCameraCaptureTime, a3);
}

- (NSNumber)_backCameraCaptureTime
{
  return self->_backCameraCaptureTime;
}

- (void)_setBackCameraCaptureTime:(id)a3
{
  objc_storeStrong((id *)&self->_backCameraCaptureTime, a3);
}

- (NSNumber)dataRate
{
  return self->_dataRate;
}

- (void)setDataRate:(id)a3
{
  objc_storeStrong((id *)&self->_dataRate, a3);
}

- (NSNumber)dataUploaded
{
  return self->_dataUploaded;
}

- (void)setDataUploaded:(id)a3
{
  objc_storeStrong((id *)&self->_dataUploaded, a3);
}

- (NSNumber)dataDownloaded
{
  return self->_dataDownloaded;
}

- (void)setDataDownloaded:(id)a3
{
  objc_storeStrong((id *)&self->_dataDownloaded, a3);
}

- (BOOL)_isVideoInterrupted
{
  return self->_isVideoInterrupted;
}

- (void)_setIsVideoInterrupted:(BOOL)a3
{
  self->_isVideoInterrupted = a3;
}

- (BOOL)_isAudioInterrupted
{
  return self->_isAudioInterrupted;
}

- (void)_setIsAudioInterrupted:(BOOL)a3
{
  self->_isAudioInterrupted = a3;
}

- (BOOL)_connectionStarted
{
  return self->_connectionStarted;
}

- (void)_setConnectionStarted:(BOOL)a3
{
  self->_connectionStarted = a3;
}

- (NSData)_relayRemotePrimaryIdentifier
{
  return self->_relayRemotePrimaryIdentifier;
}

- (void)_setRelayRemotePrimaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_relayRemotePrimaryIdentifier, a3);
}

- (BOOL)isRelayed
{
  return self->_relayed;
}

- (BOOL)isCaller
{
  return self->_isCaller;
}

- (NSString)conferenceID
{
  return self->_conferenceID;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)_setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (id)_conferenceController
{
  return self->_conferenceController;
}

- (void)_setConferenceController:(id)a3
{
  self->_conferenceController = a3;
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (unsigned)state
{
  return self->_localState;
}

- (IMAVChatParticipant)localParticipant
{
  return self->_localParticipant;
}

- (NSArray)participants
{
  return &self->_participants->super;
}

- (NSDictionary)_extraServerContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)_pingTestResults
{
  return self->_pingTestResults;
}

- (void)_setPingTestResults:(id)a3
{
  objc_storeStrong((id *)&self->_pingTestResults, a3);
}

- (int64_t)_pingTestResult
{
  return self->_pingTestResult;
}

- (void)_setPingTestResult:(int64_t)a3
{
  self->_pingTestResult = a3;
}

- (int64_t)_networkCheckResult
{
  return self->_networkCheckResult;
}

- (void)_setNetworkCheckResult:(int64_t)a3
{
  self->_networkCheckResult = a3;
}

- (BOOL)mayRequireBreakBeforeMake
{
  return self->_mayRequireBreakBeforeMake;
}

- (NSTimer)inviteTimeoutTimer
{
  return self->_inviteTimeoutTimer;
}

- (void)_setInviteTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_inviteTimeoutTimer, a3);
}

- (NSDate)inviteTimeoutTimerStart
{
  return self->_inviteTimeoutTimerStart;
}

- (void)_setInviteTimeoutTimerStart:(id)a3
{
  objc_storeStrong((id *)&self->_inviteTimeoutTimerStart, a3);
}

- (NSTimer)firstFrameTimeoutTimer
{
  return self->_firstFrameTimeoutTimer;
}

- (void)_setFirstFrameTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_firstFrameTimeoutTimer, a3);
}

- (NSTimer)connectionTimeoutTimer
{
  return self->_connectionTimeoutTimer;
}

- (void)_setConnectionTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimeoutTimer, a3);
}

- (CGSize)portraitAspectRatios
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitAspectRatios.width;
  height = self->_portraitAspectRatios.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setPortraitAspectRatios:(CGSize)a3
{
  self->_portraitAspectRatios = a3;
}

- (CGSize)landscapeAspectRatios
{
  double width;
  double height;
  CGSize result;

  width = self->_landscapeAspectRatios.width;
  height = self->_landscapeAspectRatios.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setLandscapeAspectRatios:(CGSize)a3
{
  self->_landscapeAspectRatios = a3;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (void)_setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (BOOL)didRemoteMute
{
  return self->_didRemoteMute;
}

- (void)_setDidRemoteMute:(BOOL)a3
{
  self->_didRemoteMute = a3;
}

- (BOOL)didRemotePause
{
  return self->_didRemotePause;
}

- (void)_setDidRemotePause:(BOOL)a3
{
  self->_didRemotePause = a3;
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)_setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (BOOL)metadataFinalized
{
  return self->_metadataFinalized;
}

- (void)_setMetadataFinalized:(BOOL)a3
{
  self->_metadataFinalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_firstFrameTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_inviteTimeoutTimerStart, 0);
  objc_storeStrong((id *)&self->_inviteTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_callStatisticsGUID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_relayRemotePrimaryIdentifier, 0);
  objc_storeStrong((id *)&self->_conferenceQueue, 0);
  objc_storeStrong((id *)&self->_callerProperties, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_dataDownloaded, 0);
  objc_storeStrong((id *)&self->_dataUploaded, 0);
  objc_storeStrong((id *)&self->_dataRate, 0);
  objc_storeStrong((id *)&self->_backCameraCaptureTime, 0);
  objc_storeStrong((id *)&self->_frontCameraCaptureTime, 0);
  objc_storeStrong((id *)&self->_pingTestResults, 0);
  objc_storeStrong((id *)&self->_interruptionBegan, 0);
  objc_storeStrong((id *)&self->_dateReceivedRelayUpdate, 0);
  objc_storeStrong((id *)&self->_dateReceivedRelayInitiate, 0);
  objc_storeStrong((id *)&self->_dateEnded, 0);
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_dateStartedConnecting, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_extraServerContext, 0);
  objc_storeStrong((id *)&self->_natType, 0);
  objc_storeStrong((id *)&self->_conferenceStateCache, 0);
  objc_storeStrong((id *)&self->_localParticipant, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_conferenceID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (void)localVideoLayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_localVideoLayer(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setLocalVideoLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedInstance(IMAVInterface, a2, (uint64_t)a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoLayer_(v9, v6, (uint64_t)a3, v7, v8);

}

- (void)localVideoBackLayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_localVideoBackLayer(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setLocalVideoBackLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedInstance(IMAVInterface, a2, (uint64_t)a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoBackLayer_(v9, v6, (uint64_t)a3, v7, v8);

}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double height;
  double width;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  height = a3.height;
  width = a3.width;
  objc_msgSend_sharedInstance(IMAVInterface, a2, v3, v4, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteVideoPresentationSize_forChat_(v12, v9, (uint64_t)self, v10, v11, width, height);

}

- (void)setRemoteVideoPresentationState:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  id v9;

  v5 = *(_QWORD *)&a3;
  objc_msgSend_sharedInstance(IMAVInterface, a2, *(uint64_t *)&a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteVideoPresentationState_forChat_(v9, v7, v5, (uint64_t)self, v8);

}

- (BOOL)startPreviewWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  objc_msgSend_sharedInstance(IMAVInterface, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend_startPreviewWithError_(v6, v7, (uint64_t)v5, v8, v9);

  return (char)v5;
}

- (BOOL)stopPreview
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  objc_msgSend_sharedInstance(IMAVInterface, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_stopPreview(v5, v6, v7, v8, v9);

  return v10;
}

- (void)_postParticipantMediaChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 cameraWillSwitch:(BOOL)a7 camera:(unsigned int)a8 orientation:(unsigned int)a9 aspect:(CGSize)a10
{
  double height;
  double width;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;

  height = a10.height;
  width = a10.width;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v27 = (char *)a3;
  v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = !v14 && !v13 && !v15 && !v16;
  if ((v23 & 1) != 0 || v16)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v18, a8, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      CFDictionarySetValue(v22, CFSTR("__kIMAVChatCameraTypeKey"), v24);

  }
  if ((v23 | v15) == 1)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v18, a9, v20, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      CFDictionarySetValue(v22, CFSTR("__kIMAVChatCameraOrientationKey"), v25);

  }
  if ((v23 | v14) == 1)
  {
    objc_msgSend_valueWithSize_(MEMORY[0x24BDD1968], v18, v19, v20, v21, width, height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      CFDictionarySetValue(v22, CFSTR("__kIMAVChatCameraAspectRatioKey"), v26);

  }
  if ((v23 | v13) == 1)
    CFDictionarySetValue(v22, CFSTR("__kIMAVChatCameraWillChangeKey"), &unk_24DA62EA0);
  if (v27)
    objc_msgSend__postNotificationName_participant_userInfo_(self, v27, (uint64_t)CFSTR("__kIMAVChatMediaPropertiesChangedNotification"), (uint64_t)v27, (uint64_t)v22);
  else
    objc_msgSend__postNotificationName_userInfo_(self, 0, (uint64_t)CFSTR("__kIMAVChatMediaPropertiesChangedNotification"), (uint64_t)v22, v21);

}

- (unsigned)cameraType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_cameraType(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setCameraType:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;

  v5 = *(_QWORD *)&a3;
  if (a3 != 1
    || (objc_msgSend_sharedInstance(IMAVInterface, a2, *(uint64_t *)&a3, v3, v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend_systemSupportsBackFacingCamera(v7, v8, v9, v10, v11),
        v7,
        v12))
  {
    objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, *(uint64_t *)&a3, v3, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCameraType_(v13, v14, v5, v15, v16);

    LODWORD(v13) = objc_msgSend_cameraOrientation(self, v17, v18, v19, v20);
    v25 = objc_msgSend_cameraOrientation(self, v21, v22, v23, v24);
    objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(self, v26, v25, v5, v27);
    objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orientation_aspect_(self, v28, 0, 1, 0, 0, 0, v5, (_DWORD)v13);
  }
}

- (unsigned)cameraOrientation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_cameraOrientation(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setCameraOrientation:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  int v24;

  v5 = *(_QWORD *)&a3;
  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, *(uint64_t *)&a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCameraOrientation_(v7, v8, v5, v9, v10);

  v15 = objc_msgSend_cameraType(self, v11, v12, v13, v14);
  v20 = objc_msgSend_cameraType(self, v16, v17, v18, v19);
  objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(self, v21, v5, v20, v22);
  v24 = v5;
  objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orientation_aspect_(self, v23, 0, 0, 1, 0, 0, v15, v24);
}

- (CGSize)localAspectRatioForCameraOrientation:(unsigned int)a3 cameraType:(unsigned int)a4
{
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  if (a3 > 1)
    objc_msgSend_landscapeAspectRatios(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  else
    objc_msgSend_portraitAspectRatios(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setLocalAspectRatio:(CGSize)a3 cameraOrientation:(unsigned int)a4 cameraType:(unsigned int)a5
{
  double height;
  double width;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  int v31;
  uint8_t buf[4];
  IMAVChat *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  NSSize v37;
  NSSize v38;

  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4 > 1)
  {
    if (v10)
    {
      v38.width = width;
      v38.height = height;
      NSStringFromSize(v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v20;
      _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Chat: %@ set local landscape aspect ratio to %@", buf, 0x16u);

    }
    objc_msgSend__setLandscapeAspectRatios_(self, v21, v22, v23, v24, width, height);
  }
  else
  {
    if (v10)
    {
      v37.width = width;
      v37.height = height;
      NSStringFromSize(v37);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Chat: %@ set local portrait aspect ratio to %@", buf, 0x16u);

    }
    objc_msgSend__setPortraitAspectRatios_(self, v12, v13, v14, v15, width, height);
  }
  v25 = objc_msgSend_cameraType(self, v16, v17, v18, v19);
  v31 = objc_msgSend_cameraOrientation(self, v26, v27, v28, v29);
  objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orientation_aspect_(self, v30, 0, 0, 0, 1, 0, v25, width, height, v31);
}

+ (double)defaultInvitationTimeoutTime
{
  return *(double *)&qword_25503B058;
}

+ (void)setDefaultInvitationTimeoutTime:(double)a3
{
  qword_25503B058 = *(_QWORD *)&a3;
}

+ (double)defaultConnectionTimeoutTime
{
  return *(double *)&qword_25503B060;
}

+ (void)setDefaultConnectionTimeoutTime:(double)a3
{
  qword_25503B060 = *(_QWORD *)&a3;
}

- (double)invitationTimeoutTime
{
  return self->_invitationTimeoutTime;
}

- (void)setInvitationTimeoutTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (self->_invitationTimeoutTime != a3)
  {
    self->_invitationTimeoutTime = a3;
    if (objc_msgSend_state(self, a2, v3, v4, v5) == 1
      || objc_msgSend_state(self, v7, v8, v9, v10) == 2)
    {
      objc_msgSend__setInvitationTimeoutTimer(self, v7, v8, v9, v10);
    }
  }
}

- (double)connectionTimeoutTime
{
  return self->_connectionTimeoutTime;
}

- (void)setConnectionTimeoutTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (self->_connectionTimeoutTime != a3)
  {
    self->_connectionTimeoutTime = a3;
    if (objc_msgSend_state(self, a2, v3, v4, v5) == 3)
      objc_msgSend__setConnectionTimeoutTimer(self, v7, v8, v9, v10);
  }
}

- (void)_clearConnectionTimeoutTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];

  objc_msgSend_connectionTimeoutTimer(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    sub_2190076D0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Clearing connection timeout timer", v20, 2u);
    }

    objc_msgSend_connectionTimeoutTimer(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidate(v12, v13, v14, v15, v16);

    objc_msgSend__setConnectionTimeoutTimer_(self, v17, 0, v18, v19);
  }
}

- (void)_setConnectionTimeoutTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  double connectionTimeoutTime;
  uint8_t buf[4];
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__clearConnectionTimeoutTimer(self, a2, v2, v3, v4);
  if (self->_connectionTimeoutTime > 0.0)
  {
    sub_2190076D0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      connectionTimeoutTime = self->_connectionTimeoutTime;
      *(_DWORD *)buf = 134217984;
      v9 = connectionTimeoutTime;
      _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "Setting new connection timeout timer for %f seconds", buf, 0xCu);
    }

    im_main_thread();
  }
}

- (void)_connectionTimeout:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  IMAVChat *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_state(self, a2, (uint64_t)a3, v3, v4);
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 4)
  {
    if (v8)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring timeout timer, we're connected", (uint8_t *)&v16, 2u);
    }

  }
  else
  {
    if (v8)
    {
      v16 = 138412290;
      v17 = self;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Connection timeout for: %@", (uint8_t *)&v16, 0xCu);
    }

    sub_2190076D0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Hitting connection timeout", (uint8_t *)&v16, 2u);
    }

    objc_msgSend__clearConnectionTimeoutTimer(self, v10, v11, v12, v13);
    objc_msgSend__endChatWithReason_andError_(self, v14, 6, 1008, v15);
  }
}

- (void)_clearInvitationTimeoutTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];

  objc_msgSend_inviteTimeoutTimer(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    sub_2190076D0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Clearing invitation timeout timer", v20, 2u);
    }

    objc_msgSend_inviteTimeoutTimer(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidate(v12, v13, v14, v15, v16);

    objc_msgSend__setInviteTimeoutTimer_(self, v17, 0, v18, v19);
  }
}

- (void)_setInvitationTimeoutTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double invitationTimeoutTime;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__clearInvitationTimeoutTimer(self, a2, v2, v3, v4);
  objc_msgSend__setInviteTimeoutTimerStart_(self, v6, 0, v7, v8);
  if (self->_invitationTimeoutTime > 0.0)
  {
    sub_2190076D0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      invitationTimeoutTime = self->_invitationTimeoutTime;
      *(_DWORD *)buf = 134217984;
      v12 = invitationTimeoutTime;
      _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Setting new invitation timeout timer for %f seconds", buf, 0xCu);
    }

    im_main_thread();
  }
}

- (void)_invitationTimeout:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  IMAVChat *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = self;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "Invitation timeout for: %@", (uint8_t *)&v17, 0xCu);
  }

  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Hitting Invitation timeout", (uint8_t *)&v17, 2u);
  }

  objc_msgSend__clearInvitationTimeoutTimer(self, v6, v7, v8, v9);
  if (objc_msgSend_isCaller(self, v10, v11, v12, v13))
    objc_msgSend__endChatWithReason_andError_(self, v14, 22, 0, v16);
  else
    objc_msgSend_declineInvitationWithResponse_(self, v14, 7, v15, v16);
}

- (void)_reduceInvitationTimeoutTime
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  int v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend_inviteTimeoutTimerStart(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v3, v9, (uint64_t)v8, v10, v11);
  v13 = v12;

  v18 = self->_invitationTimeoutTime * 0.5;
  if (v13 < v18)
  {
    objc_msgSend_setInvitationTimeoutTime_(self, v14, v15, v16, v17, self->_invitationTimeoutTime * 0.5);
    sub_2190076D0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134217984;
      v21 = v18;
      _os_log_impl(&dword_218FEA000, v19, OS_LOG_TYPE_DEFAULT, "Reducing invitation timeout time to %f", (uint8_t *)&v20, 0xCu);
    }

  }
}

- (void)_clearFirstFrameTimeoutTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];

  objc_msgSend_firstFrameTimeoutTimer(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    sub_2190076D0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Clearing first frame timeout timer", v20, 2u);
    }

    objc_msgSend_firstFrameTimeoutTimer(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidate(v12, v13, v14, v15, v16);

    objc_msgSend__setFirstFrameTimeoutTimer_(self, v17, 0, v18, v19);
  }
}

- (void)_setFirstFrameTimeoutTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend__clearFirstFrameTimeoutTimer(self, a2, v2, v3, v4);
  if (objc_msgSend_isVideo(self, v6, v7, v8, v9) && !self->_hasReceivedFirstFrame)
  {
    objc_msgSend_firstFrameTimeoutTimer(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      im_main_thread();
  }
}

- (void)_firstFrameTimeout:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  IMAVChat *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138412290;
    v32 = self;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "First frame timeout for: %@", (uint8_t *)&v31, 0xCu);
  }

  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Hitting first frame timeout timeout, generating fake first frame", (uint8_t *)&v31, 2u);
  }

  objc_msgSend_remoteParticipants(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15)
  {
    objc_msgSend_remoteParticipants(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }
  objc_msgSend__noteFirstFrame(self, v16, v17, v18, v19);
  objc_msgSend__postNotificationName_participant_userInfo_(self, v26, (uint64_t)CFSTR("__kIMAVChatParticipantReceivedFirstFrameNotification"), (uint64_t)v25, 0);
  objc_msgSend__clearFirstFrameTimeoutTimer(self, v27, v28, v29, v30);

}

- (void)_vccInitDidFinish:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  uint8_t v38[16];

  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, v38, 2u);
  }

  if (self->_localState != 5)
  {
    if (self->_hasPendingInit)
    {
      if (!self->_isCaller)
        goto LABEL_10;
      objc_msgSend_remoteParticipants(self, v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeObjectsPerformSelector_(v9, v10, (uint64_t)sel_sendInvitation, v11, v12);
    }
    else
    {
      if (!self->_hasPendingAccept)
        goto LABEL_10;
      objc_msgSend_initiatorParticipant(self, v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sendResponse_(v9, v13, 0, v14, v15);
    }

LABEL_10:
    self->_hasPendingInit = 0;
    self->_hasPendingAccept = 0;
    if (objc_msgSend_isActive(self, v5, v6, v7, v8))
    {
      objc_msgSend_sharedInstance(IMAVInterface, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_landscapeAspectRatios(self, v21, v22, v23, v24);
      v26 = v25;
      v28 = v27;
      objc_msgSend_portraitAspectRatios(self, v29, v30, v31, v32);
      objc_msgSend_avChat_setLocalLandscapeAspectRatio_localPortraitAspectRatio_(v20, v33, (uint64_t)self, v34, v35, v26, v28, v36, v37);

    }
  }
}

- (void)conferenceDidStopWithCallID:(int64_t)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend_participantWithAVConferenceCallID_(self, v7, a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__callInfoForCallID_(v10, v11, a3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setState_(v14, v15, 4, v16, v17);
  if (v6)
  {
    objc_msgSend__handleAVError_(self, v18, (uint64_t)v6, v20, v21);
  }
  else if ((objc_msgSend_hasUnfinishedSessions(v10, v18, v19, v20, v21) & 1) != 0)
  {
    sub_2190076D0();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_218FEA000, v25, OS_LOG_TYPE_DEFAULT, "The other party still has other sessions, so we will not be hanging up.", (uint8_t *)&v32, 2u);
    }

  }
  else
  {
    objc_msgSend_endChatWithReason_(self, v22, 9, v23, v24);
  }
  sub_2190076D0();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__participantsCallInfo(v10, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138412290;
    v33 = v31;
    _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "conferenceDidStopWithCallID participant info states %@", (uint8_t *)&v32, 0xCu);

  }
}

- (void)conferenceDidPauseAudioWithCallID:(int64_t)a3 didPauseAudio:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  IMAVChat *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v4 = a4;
  v5 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412802;
    v24 = self;
    v25 = 1024;
    v26 = v5;
    v27 = 1024;
    v28 = v4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@ callID: %d didPauseAudio: %d", (uint8_t *)&v23, 0x18u);
  }

  objc_msgSend__clearCache(self, v8, v9, v10, v11);
  objc_msgSend__postNotificationName_userInfo_(self, v12, (uint64_t)CFSTR("__kIMAVChatSendingAudioChangedNotification"), 0, v13);
  objc_msgSend_sharedInstance(IMAVCallManager, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendProxyUpdate(v18, v19, v20, v21, v22);

}

- (void)conferenceAVConferenceCallID:(int64_t)a3 didConnect:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  int v6;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v5 = a4;
  v6 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_participantWithAVConferenceCallID_(self, a2, a3, a4, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend__conferenceOtherParticipant_didConnect_(self, v8, (uint64_t)v10, v5, v9);
  }
  else
  {
    sub_2190076D0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v6;
      _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVChat conferencePersonWithID:didConnect:] received for unknown callee with callID %d", (uint8_t *)v12, 8u);
    }

  }
}

- (void)_conferenceOtherParticipant:(id)a3 didConnect:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend_state(v6, v7, v8, v9, v10) != 5)
  {
    if (v6)
    {
      if (v4)
      {
        objc_msgSend_imHandle(v6, v11, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_invitedBy(self->_localParticipant, v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v20)
          objc_msgSend_setWaitingToConnect_(v6, v21, 0, v22, v23);
        objc_msgSend_setState_(v6, v21, 4, v22, v23);
      }
      else if ((objc_msgSend_hasUnfinishedSessions(v6, v11, v12, v13, v14) & 1) != 0)
      {
        sub_2190076D0();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "The other party still has other sessions, so we will not be hanging up.", (uint8_t *)&v33, 2u);
        }

      }
      else
      {
        objc_msgSend_setStateToEndedWithReason_andError_(v6, v25, 6, 1008, v26);
      }
      sub_2190076D0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend__participantsCallInfo(v6, v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412290;
        v34 = v32;
        _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "_conferenceOtherParticipant:didConnect: participant info states %@", (uint8_t *)&v33, 0xCu);

      }
    }
    else
    {
      sub_2190076D0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "[WARN] [IMAVChat conferencePersonWithID:didConnect:] received for unknown callee", (uint8_t *)&v33, 2u);
      }
    }

  }
}

- (void)conferencePersonWithID:(id)a3 didMute:(BOOL)a4
{
  _BOOL8 v4;
  IMAVChat *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  int v38;
  IMAVChat *v39;
  __int16 v40;
  IMAVChat *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = (IMAVChat *)a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412802;
    v39 = self;
    v40 = 2112;
    v41 = v6;
    v42 = 1024;
    v43 = v4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  didMute: %d", (uint8_t *)&v38, 0x1Cu);
  }

  objc_msgSend__setDidRemoteMute_(self, v8, v4, v9, v10);
  objc_msgSend__participantMatchingVCPartyID_(self, v11, (uint64_t)v6, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = objc_msgSend_didRemoteMute(self, v14, v15, v16, v17);
    objc_msgSend_setAudioMuted_(v18, v20, v19, v21, v22);
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = (void *)MEMORY[0x24BDD16E0];
    v29 = objc_msgSend_didRemoteMute(self, v25, v26, v27, v28);
    objc_msgSend_numberWithBool_(v24, v30, v29, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(v23, v34, (uint64_t)v33, (uint64_t)CFSTR("__kIMAVChatMuteStateKey"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__postNotificationName_participant_userInfo_(self, v37, (uint64_t)CFSTR("__kIMAVChatParticipantMuteChangedNotification"), (uint64_t)v18, (uint64_t)v36);

  }
  else
  {
    sub_2190076D0();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      v39 = v6;
      _os_log_impl(&dword_218FEA000, v33, OS_LOG_TYPE_DEFAULT, "[WARN] [conferencePersonWithID:didMute:] received for vcPartyID %@ not in conference!", (uint8_t *)&v38, 0xCu);
    }
  }

}

- (void)conferencePersonWithID:(id)a3 didPause:(BOOL)a4
{
  _BOOL8 v4;
  IMAVChat *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  int v38;
  IMAVChat *v39;
  __int16 v40;
  IMAVChat *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = (IMAVChat *)a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412802;
    v39 = self;
    v40 = 2112;
    v41 = v6;
    v42 = 1024;
    v43 = v4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  didPause: %d", (uint8_t *)&v38, 0x1Cu);
  }

  objc_msgSend__participantMatchingVCPartyID_(self, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDidRemotePause_(self, v12, v4, v13, v14);
  if (v11)
  {
    v19 = objc_msgSend_didRemotePause(self, v15, v16, v17, v18);
    objc_msgSend_setVideoPaused_(v11, v20, v19, v21, v22);
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = (void *)MEMORY[0x24BDD16E0];
    v29 = objc_msgSend_didRemotePause(self, v25, v26, v27, v28);
    objc_msgSend_numberWithBool_(v24, v30, v29, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(v23, v34, (uint64_t)v33, (uint64_t)CFSTR("__kIMAVChatPauseStateKey"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__postNotificationName_participant_userInfo_(self, v37, (uint64_t)CFSTR("__kIMAVChatParticipantPauseChangedNotification"), (uint64_t)v11, (uint64_t)v36);

  }
  else
  {
    sub_2190076D0();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      v39 = v6;
      _os_log_impl(&dword_218FEA000, v33, OS_LOG_TYPE_DEFAULT, "[WARN] -[conferencePersonWithID:didPause:] received for vcPartyID %@ not in conference!", (uint8_t *)&v38, 0xCu);
    }
  }

}

- (void)conferencePersonWithID:(id)a3 didDegrade:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint8_t buf[4];
  IMAVChat *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2112;
    v29 = v6;
    v30 = 1024;
    v31 = v4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  personID: %@  didDegrade: %d", buf, 0x1Cu);
  }

  objc_msgSend__participantMatchingVCPartyID_(self, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  if (v11)
  {
    objc_msgSend_setVideoDegraded_(v11, v12, v4, v13, v14);
    v16 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v17, v4, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v21, (uint64_t)v20, v22, v23, CFSTR("__kIMAVChatVideoDegradedKey"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__postNotificationName_participant_userInfo_(self, v25, (uint64_t)CFSTR("__kIMAVChatParticipantVideoQualityChangedNotification"), (uint64_t)v15, (uint64_t)v24);

  }
  else
  {
    sub_2190076D0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] [conferencePersonWithID:didDegrade] received for vcPartyID (nil)", buf, 2u);
    }
  }

}

- (void)conferencePersonWithID:(id)a3 mediaDidStall:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint8_t buf[4];
  IMAVChat *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2112;
    v29 = v6;
    v30 = 1024;
    v31 = v4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  mediaDidStall: %d", buf, 0x1Cu);
  }

  objc_msgSend__participantMatchingVCPartyID_(self, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  if (v11)
  {
    objc_msgSend_setMediaStalled_(v11, v12, v4, v13, v14);
    v16 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v17, v4, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v21, (uint64_t)v20, v22, v23, CFSTR("__kIMAVChatMediaStalledKey"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__postNotificationName_participant_userInfo_(self, v25, (uint64_t)CFSTR("__kIMAVChatParticipantMediaStalledChangedNotification"), (uint64_t)v15, (uint64_t)v24);

  }
  else
  {
    sub_2190076D0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] [conferencePersonWithID:mediaDidStall] received for vcPartyID (nil)", buf, 2u);
    }
  }

}

- (void)conferencePersonWithID:(id)a3 sendRelayRequest:(id)a4
{
  IMAVChat *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  int v45;
  IMAVChat *v46;
  __int16 v47;
  IMAVChat *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = (IMAVChat *)a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v45 = 138412802;
    v46 = self;
    v47 = 2112;
    v48 = v6;
    v49 = 2112;
    v50 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  parameters: %@", (uint8_t *)&v45, 0x20u);
  }

  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v45 = 138412290;
    v46 = v6;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Sending relay initiate to: %@", (uint8_t *)&v45, 0xCu);
  }

  objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imHandle(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferenceID(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v18, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v23, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relay_sendInitateRequest_toPerson_account_(v28, v44, (uint64_t)v33, (uint64_t)v7, (uint64_t)v38, v43);

}

- (void)conferencePersonWithID:(id)a3 sendRelayUpdate:(id)a4
{
  IMAVChat *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  int v56;
  IMAVChat *v57;
  __int16 v58;
  IMAVChat *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = (IMAVChat *)a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v56 = 138412802;
    v57 = self;
    v58 = 2112;
    v59 = v6;
    v60 = 2112;
    v61 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  parameters: %@", (uint8_t *)&v56, 0x20u);
  }

  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v56 = 138412290;
    v57 = v6;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Sending relay update to: %@", (uint8_t *)&v56, 0xCu);
  }

  objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imHandle(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__timings(self, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v28, v29, (uint64_t)CFSTR("time-from-relay-initiate-to-outgoing-relay-update"), v30, v31);

  objc_msgSend_startTimingForKey_(self->_timingCollection, v32, (uint64_t)CFSTR("time-from-outgoing-relay-update-to-connected"), v33, v34);
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferenceID(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v18, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v23, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relay_sendUpdate_toPerson_account_(v39, v55, (uint64_t)v44, (uint64_t)v7, (uint64_t)v49, v54);

}

- (void)conferencePersonWithID:(id)a3 sendRelayCancel:(id)a4
{
  IMAVChat *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  int v45;
  IMAVChat *v46;
  __int16 v47;
  IMAVChat *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = (IMAVChat *)a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v45 = 138412802;
    v46 = self;
    v47 = 2112;
    v48 = v6;
    v49 = 2112;
    v50 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  parameters: %@", (uint8_t *)&v45, 0x20u);
  }

  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v45 = 138412290;
    v46 = v6;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Sending relay cancel to: %@", (uint8_t *)&v45, 0xCu);
  }

  objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imHandle(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferenceID(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v18, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v23, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relay_sendCancel_toPerson_account_(v28, v44, (uint64_t)v33, (uint64_t)v7, (uint64_t)v38, v43);

}

- (void)conferencePersonWithID:(id)a3 localIPDidChange:(id)a4
{
  IMAVChat *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint8_t buf[4];
  IMAVChat *v27;
  __int16 v28;
  IMAVChat *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = (IMAVChat *)a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  person: %@  newBlob: %@", buf, 0x20u);
  }

  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Sending local IP change to: %@", buf, 0xCu);
  }

  objc_msgSend_participantWithID_(self, v10, (uint64_t)v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__FTStringFromBaseData(v7, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x24BDBCE70]);
  v23 = (void *)objc_msgSend_initWithObjectsAndKeys_(v19, v20, (uint64_t)v18, v21, v22, CFSTR("LocalIPChangeNewBlob"), 0);
  objc_msgSend_sendAVMessage_userInfo_(v13, v24, 1500, (uint64_t)v23, v25);

}

- (void)setMute:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int isMute;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const __CFString *v31;
  int v32;
  const __CFString *v33;
  __int16 v34;
  IMAVChat *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v32 = 138412546;
    v33 = v6;
    v34 = 2112;
    v35 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Set mute: %@ on chat (%@)", (uint8_t *)&v32, 0x16u);
  }

  if (objc_msgSend_isActive(self, v7, v8, v9, v10))
  {
    isMute = objc_msgSend_isMute(self, v11, v12, v13, v14);
    objc_msgSend__clearCache(self, v16, v17, v18, v19);
    objc_msgSend_sharedInstance(IMAVInterface, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_avChat_setMute_(v24, v25, (uint64_t)self, v3, v26);

    if (isMute != v3)
      objc_msgSend__postNotificationName_userInfo_(self, v27, (uint64_t)CFSTR("__kIMAVChatIsMutedChangedNotification"), 0, v29);
  }
  else
  {
    sub_2190076D0();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = CFSTR("NO");
      if (v3)
        v31 = CFSTR("YES");
      v32 = 138412546;
      v33 = v31;
      v34 = 2112;
      v35 = self;
      _os_log_impl(&dword_218FEA000, v30, OS_LOG_TYPE_DEFAULT, "Tried to set paused: %@ on an inactive chat (%@)", (uint8_t *)&v32, 0x16u);
    }

  }
  objc_msgSend_setAudioMuted_(self->_localParticipant, v27, v3, v28, v29);
}

- (BOOL)isMute
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isMuteForAVChat;
  const char *v14;
  uint64_t v15;

  if (objc_msgSend__hasCachedBoolForKey_(self, a2, (uint64_t)CFSTR("isMute"), v2, v3))
    return MEMORY[0x24BEDD108](self, sel__cachedBoolForKey_, CFSTR("isMute"), v7, v8);
  objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isMuteForAVChat = objc_msgSend_isMuteForAVChat_(v9, v10, (uint64_t)self, v11, v12);

  objc_msgSend__cacheBool_forKey_(self, v14, isMuteForAVChat, (uint64_t)CFSTR("isMute"), v15);
  return isMuteForAVChat;
}

- (void)toggleMute
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend_isMute(self, a2, v2, v3, v4) ^ 1;
  objc_msgSend_setMute_(self, v7, v6, v8, v9);
}

- (void)setRemoteMute:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v5 = a3;
  if (objc_msgSend_isActive(self, a2, a3, v3, v4))
  {
    objc_msgSend__clearCache(self, v7, v8, v9, v10);
    objc_msgSend_sharedInstance(IMAVInterface, v11, v12, v13, v14);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_avChat_setRemoteMute_(v17, v15, (uint64_t)self, v5, v16);

  }
}

- (BOOL)isRemoteMute
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isRemoteMuteForAVChat;
  const char *v14;
  uint64_t v15;

  if (objc_msgSend__hasCachedBoolForKey_(self, a2, (uint64_t)CFSTR("isRemoteMute"), v2, v3))
    return MEMORY[0x24BEDD108](self, sel__cachedBoolForKey_, CFSTR("isRemoteMute"), v7, v8);
  objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isRemoteMuteForAVChat = objc_msgSend_isRemoteMuteForAVChat_(v9, v10, (uint64_t)self, v11, v12);

  objc_msgSend__cacheBool_forKey_(self, v14, isRemoteMuteForAVChat, (uint64_t)CFSTR("isRemoteMute"), v15);
  return isRemoteMuteForAVChat;
}

- (BOOL)isSendingAudio
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isSendingAudioForAVChat;
  const char *v14;
  uint64_t v15;

  if (objc_msgSend__hasCachedBoolForKey_(self, a2, (uint64_t)CFSTR("isSendingAudio"), v2, v3))
    return MEMORY[0x24BEDD108](self, sel__cachedBoolForKey_, CFSTR("isSendingAudio"), v7, v8);
  objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isSendingAudioForAVChat = objc_msgSend_isSendingAudioForAVChat_(v9, v10, (uint64_t)self, v11, v12);

  objc_msgSend__cacheBool_forKey_(self, v14, isSendingAudioForAVChat, (uint64_t)CFSTR("isSendingAudio"), v15);
  return isSendingAudioForAVChat;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  objc_msgSend__clearCache(self, a2, a3, v3, v4);
  objc_msgSend_sharedInstance(IMAVInterface, v7, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avChat_setSendingAudio_(v13, v11, (uint64_t)self, v5, v12);

}

- (BOOL)hasReceivedFirstFrame
{
  return self->_hasReceivedFirstFrame;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const __CFString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  IMAVChat *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v26 = 138412546;
    v27 = v6;
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Set paused: %@ on chat (%@)", (uint8_t *)&v26, 0x16u);
  }

  if (objc_msgSend_isActive(self, v7, v8, v9, v10))
  {
    objc_msgSend__clearCache(self, v11, v12, v13, v14);
    objc_msgSend_sharedInstance(IMAVInterface, v15, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_avChat_setPaused_(v19, v20, (uint64_t)self, v3, v21);
  }
  else
  {
    sub_2190076D0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = CFSTR("NO");
      if (v3)
        v22 = CFSTR("YES");
      v26 = 138412546;
      v27 = v22;
      v28 = 2112;
      v29 = self;
      _os_log_impl(&dword_218FEA000, v19, OS_LOG_TYPE_DEFAULT, "Tried to set paused: %@ on an inactive chat (%@)", (uint8_t *)&v26, 0x16u);
    }
  }

  objc_msgSend_setVideoPaused_(self->_localParticipant, v23, v3, v24, v25);
}

- (BOOL)isPaused
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isPausedForAVChat;
  const char *v14;
  uint64_t v15;

  if (objc_msgSend__hasCachedBoolForKey_(self, a2, (uint64_t)CFSTR("isPaused"), v2, v3))
    return MEMORY[0x24BEDD108](self, sel__cachedBoolForKey_, CFSTR("isPaused"), v7, v8);
  objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isPausedForAVChat = objc_msgSend_isPausedForAVChat_(v9, v10, (uint64_t)self, v11, v12);

  objc_msgSend__cacheBool_forKey_(self, v14, isPausedForAVChat, (uint64_t)CFSTR("isPaused"), v15);
  return isPausedForAVChat;
}

- (void)togglePaused
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend_isPaused(self, a2, v2, v3, v4) ^ 1;
  objc_msgSend_setPaused_(self, v7, v6, v8, v9);
}

- (BOOL)isSendingVideo
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isSendingVideoForAVChat;
  const char *v14;
  uint64_t v15;

  if (objc_msgSend__hasCachedBoolForKey_(self, a2, (uint64_t)CFSTR("isSendingVideo"), v2, v3))
    return MEMORY[0x24BEDD108](self, sel__cachedBoolForKey_, CFSTR("isSendingVideo"), v7, v8);
  objc_msgSend_sharedInstance(IMAVInterface, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isSendingVideoForAVChat = objc_msgSend_isSendingVideoForAVChat_(v9, v10, (uint64_t)self, v11, v12);

  objc_msgSend__cacheBool_forKey_(self, v14, isSendingVideoForAVChat, (uint64_t)CFSTR("isSendingVideo"), v15);
  return isSendingVideoForAVChat;
}

- (void)setIsSendingVideo:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  objc_msgSend__clearCache(self, a2, a3, v3, v4);
  objc_msgSend_sharedInstance(IMAVInterface, v7, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avChat_setSendingVideo_(v13, v11, (uint64_t)self, v5, v12);

}

- (void)_handleRelayInitate:(id)a3 fromParticipant:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSDate *v35;
  NSDate *dateReceivedRelayInitiate;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  IMAVChat *v47;
  uint8_t buf[4];
  IMAVChat *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v49 = self;
    v50 = 2112;
    v51 = v7;
    v52 = 2112;
    v53 = v6;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  participant: %@   properties: %@", buf, 0x20u);
  }

  objc_msgSend_avChat(v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__timings(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTimingForKey_(v18, v19, (uint64_t)CFSTR("time-from-relay-initiate-to-outgoing-relay-update"), v20, v21);

  objc_msgSend_avChat(v7, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__timings(v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTimingForKey_(v31, v32, (uint64_t)CFSTR("time-from-relay-initiate-to-incoming-relay-update"), v33, v34);

  v35 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
  dateReceivedRelayInitiate = self->_dateReceivedRelayInitiate;
  self->_dateReceivedRelayInitiate = v35;

  objc_msgSend__conferenceQueue(self, v37, v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21900A7E4;
  block[3] = &unk_24DA57850;
  v45 = v7;
  v46 = v6;
  v47 = self;
  v42 = v6;
  v43 = v7;
  dispatch_async(v41, block);

}

- (void)_handleRelayUpdate:(id)a3 fromParticipant:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSDate *v35;
  NSDate *dateReceivedRelayUpdate;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  IMAVChat *v46;
  id v47;
  uint8_t buf[4];
  IMAVChat *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v49 = self;
    v50 = 2112;
    v51 = v7;
    v52 = 2112;
    v53 = v6;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  participant: %@   properties: %@", buf, 0x20u);
  }

  objc_msgSend_avChat(v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__timings(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v18, v19, (uint64_t)CFSTR("time-from-relay-initiate-to-incoming-relay-update"), v20, v21);

  objc_msgSend_avChat(v7, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__timings(v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTimingForKey_(v31, v32, (uint64_t)CFSTR("time-from-relay-incoming-relay-update-to-connected"), v33, v34);

  v35 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
  dateReceivedRelayUpdate = self->_dateReceivedRelayUpdate;
  self->_dateReceivedRelayUpdate = v35;

  objc_msgSend__conferenceQueue(self, v37, v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21900AB38;
  block[3] = &unk_24DA57850;
  v45 = v7;
  v46 = self;
  v47 = v6;
  v42 = v6;
  v43 = v7;
  dispatch_async(v41, block);

}

- (void)_handleRelayCancel:(id)a3 fromParticipant:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSDate *dateReceivedRelayInitiate;
  NSDate *dateReceivedRelayUpdate;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  IMAVChat *v20;
  id v21;
  uint8_t buf[4];
  IMAVChat *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avchat: %@  participant: %@   properties: %@", buf, 0x20u);
  }

  dateReceivedRelayInitiate = self->_dateReceivedRelayInitiate;
  self->_dateReceivedRelayInitiate = 0;

  dateReceivedRelayUpdate = self->_dateReceivedRelayUpdate;
  self->_dateReceivedRelayUpdate = 0;

  objc_msgSend__conferenceQueue(self, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21900AE98;
  block[3] = &unk_24DA57850;
  v19 = v7;
  v20 = self;
  v21 = v6;
  v16 = v6;
  v17 = v7;
  dispatch_async(v15, block);

}

- (BOOL)isStateFinal
{
  return self->_localState == 5;
}

- (BOOL)isActive
{
  return self->_localState - 1 < 4;
}

- (void)_setActiveConference
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  int v31;
  IMAVChat *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "_setActiveConference", (uint8_t *)&v31, 2u);
  }

  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138412290;
    v32 = self;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "avchat: %@", (uint8_t *)&v31, 0xCu);
  }

  if (objc_msgSend_isActive(self, v5, v6, v7, v8))
  {
    objc_msgSend_sharedInstance(IMAVInterface, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_landscapeAspectRatios(self, v14, v15, v16, v17);
    v19 = v18;
    v21 = v20;
    objc_msgSend_portraitAspectRatios(self, v22, v23, v24, v25);
    objc_msgSend_avChat_setLocalLandscapeAspectRatio_localPortraitAspectRatio_(v13, v26, (uint64_t)self, v27, v28, v19, v21, v29, v30);

  }
  objc_msgSend__postStateToDelegateIfNecessary(self, v9, v10, v11, v12);
}

- (void)participant:(id)a3 changedFromState:(unsigned int)a4 toState:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  IMAVChatParticipant *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  IMAVChatParticipant *v17;
  void *v18;
  unsigned int localState;
  _BOOL4 v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  IMAVChatParticipant *localParticipant;
  int isInitiator;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSMutableArray *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  IMAVChatParticipant *v75;
  uint64_t v76;
  int v77;
  NSMutableArray *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t m;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSDate *dateEnded;
  const char *v102;
  uint64_t v103;
  NSMutableArray *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  IMAVChat *v109;
  IMAVChatParticipant *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t n;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t i;
  IMAVChatParticipant *v142;
  NSMutableArray *v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unsigned int v151;
  uint64_t v152;
  uint64_t j;
  IMAVChatParticipant *v154;
  unsigned int v155;
  BOOL v156;
  int v157;
  BOOL v158;
  IMAVChatParticipant *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  id obj;
  IMAVChatParticipant *v169;
  IMAVChat *v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  uint8_t v195[128];
  uint8_t buf[4];
  IMAVChatParticipant *v197;
  __int16 v198;
  void *v199;
  __int16 v200;
  void *v201;
  uint64_t v202;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v202 = *MEMORY[0x24BDAC8D0];
  v8 = (IMAVChatParticipant *)a3;
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  v169 = v8;
  v170 = self;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatParticipantState(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringDescriptionForIMAVChatParticipantState(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v197 = v8;
    v198 = 2112;
    v199 = v10;
    v200 = 2112;
    v201 = v11;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "P: %@  changedFromState: %@   toState: %@", buf, 0x20u);

  }
  if (self->_localParticipant != v8)
    goto LABEL_7;
  sub_2190076D0();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    _NSStringDescriptionForIMAVChatState(self->_localState);
    v17 = (IMAVChatParticipant *)objc_claimAutoreleasedReturnValue();
    _NSStringDescriptionForIMAVChatParticipantState(v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v197 = v17;
    v198 = 2112;
    v199 = v18;
    _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, "Conference state changed from: %@   to: %@", buf, 0x16u);

  }
  localState = self->_localState;
  if (localState != (_DWORD)v5)
  {
    v156 = localState > 5;
    v77 = (1 << localState) & 0x23;
    v20 = (v156 || v77 == 0) && (v5 < 2 || (_DWORD)v5 == 5);
    self->_localState = v5;
  }
  else
  {
LABEL_7:
    v20 = 0;
  }
  if (self->_localParticipant != v8)
  {
    v21 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v12, v5, v14, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v23, v6, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v27, (uint64_t)v22, v28, v29, CFSTR("__kIMAVChatParticipantStateKey"), v26, CFSTR("__kIMAVChatParticipantPreviousStateKey"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__postNotificationName_participant_userInfo_(self, v31, (uint64_t)CFSTR("__kIMAVChatParticipantStateChangedNotification"), (uint64_t)v8, (uint64_t)v30);

    localParticipant = self->_localParticipant;
    if (localParticipant != v8)
    {
      isInitiator = objc_msgSend_isInitiator(localParticipant, v12, v13, v14, v15);
      objc_msgSend_invitedBy(self->_localParticipant, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imHandle(v8, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if ((isInitiator & 1) == 0 && v38 != v43)
        goto LABEL_57;
      switch((int)v5)
      {
        case 1:
          if (isInitiator && !self->_localState)
            goto LABEL_15;
          goto LABEL_57;
        case 2:
          if (!self->_localState)
          {
            objc_msgSend_setState_(self->_localParticipant, v44, 1, v46, v47);
            v189 = 0u;
            v190 = 0u;
            v187 = 0u;
            v188 = 0u;
            v104 = self->_participants;
            v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v134, (uint64_t)&v187, (uint64_t)v195, 16);
            if (v135)
            {
              v139 = v135;
              v140 = *(_QWORD *)v188;
              do
              {
                for (i = 0; i != v139; ++i)
                {
                  if (*(_QWORD *)v188 != v140)
                    objc_enumerationMutation(v104);
                  v142 = *(IMAVChatParticipant **)(*((_QWORD *)&v187 + 1) + 8 * i);
                  if (v142 != v169 && v142 != v170->_localParticipant)
                    objc_msgSend_setState_(v142, v136, 1, v137, v138);
                }
                v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v136, (uint64_t)&v187, (uint64_t)v195, 16);
              }
              while (v139);
            }
            goto LABEL_56;
          }
          goto LABEL_57;
        case 3:
          if (self->_localState - 1 <= 1)
            goto LABEL_91;
          goto LABEL_57;
        case 4:
          if (self->_localState == 3)
            objc_msgSend_setState_(self->_localParticipant, v44, 4, v46, v47);
          goto LABEL_57;
        case 5:
          if (self->_localState == 5)
            goto LABEL_57;
          if (v38 == v43)
          {
            v159 = self->_localParticipant;
          }
          else
          {
            v185 = 0u;
            v186 = 0u;
            v183 = 0u;
            v184 = 0u;
            v143 = self->_participants;
            v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v144, (uint64_t)&v183, (uint64_t)v194, 16);
            if (v145)
            {
              v150 = v145;
              v151 = 0;
              v152 = *(_QWORD *)v184;
              do
              {
                for (j = 0; j != v150; ++j)
                {
                  if (*(_QWORD *)v184 != v152)
                    objc_enumerationMutation(v143);
                  v154 = *(IMAVChatParticipant **)(*((_QWORD *)&v183 + 1) + 8 * j);
                  if (v154 != v170->_localParticipant)
                  {
                    v155 = objc_msgSend_state(v154, v146, v147, v148, v149);
                    if (!v151
                      || (v151 != 5 ? (v156 = v155 > v151) : (v156 = 1),
                          !v156 ? (v157 = 0) : (v157 = 1),
                          v155 != 5 ? (v158 = v157 == 0) : (v158 = 1),
                          !v158))
                    {
                      v151 = v155;
                    }
                  }
                }
                v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v146, (uint64_t)&v183, (uint64_t)v194, 16);
              }
              while (v150);

              self = v170;
              if (v151 != 5 && v151)
              {
                if (isInitiator)
                {
                  if (v151 == 1)
                  {
LABEL_15:
                    objc_msgSend_setState_(v170->_localParticipant, v44, 2, v46, v47);
                  }
                  else if (v151 == 3)
                  {
LABEL_91:
                    objc_msgSend_setState_(v170->_localParticipant, v44, 3, v46, v47);
                  }
                }
                goto LABEL_57;
              }
            }
            else
            {

            }
            v159 = self->_localParticipant;
          }
          v160 = objc_msgSend_reasonChatEnded(v169, v44, v45, v46, v47);
          v165 = objc_msgSend_error(v169, v161, v162, v163, v164);
          objc_msgSend_setStateToEndedWithReason_andError_(v159, v166, v160, v165, v167);
          goto LABEL_57;
        default:
          goto LABEL_57;
      }
    }
  }
  if ((_DWORD)v6 || (_DWORD)v5 != 2)
  {
    if ((_DWORD)v5 == 5)
    {
      v52 = objc_msgSend_reasonChatEnded(v8, v12, v13, v14, v15);
      if ((v6 - 3) <= 1)
      {
        if (objc_msgSend_isActive(self, v48, v49, v50, v51))
        {
          objc_msgSend_sharedInstance(IMAVInterface, v53, v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endConferenceForAVChat_(v57, v58, (uint64_t)self, v59, v60);

        }
        if (objc_msgSend_isTerminating(self, v53, v54, v55, v56))
          objc_msgSend__blockUntilSendQueueIsEmpty(MEMORY[0x24BE502D0], v48, v49, v50, v51);
      }
      if (objc_msgSend_isInitiator(v8, v48, v49, v50, v51))
      {
        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        v65 = self->_participants;
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v179, (uint64_t)v193, 16);
        if (v67)
        {
          v72 = v67;
          v73 = *(_QWORD *)v180;
          do
          {
            for (k = 0; k != v72; ++k)
            {
              if (*(_QWORD *)v180 != v73)
                objc_enumerationMutation(v65);
              v75 = *(IMAVChatParticipant **)(*((_QWORD *)&v179 + 1) + 8 * k);
              if (v75 != v170->_localParticipant
                && objc_msgSend_state(*(void **)(*((_QWORD *)&v179 + 1) + 8 * k), v68, v69, v70, v71) == 1)
              {
                objc_msgSend_cancelInvitation(v75, v68, v69, v70, v71);
              }
            }
            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v179, (uint64_t)v193, 16);
          }
          while (v72);
        }

        v8 = v169;
        self = v170;
      }
      if ((v52 & 0xFFFFFFF7) == 1)
      {
        v76 = 0;
        v52 = 10;
      }
      else
      {
        v76 = objc_msgSend_error(v8, v61, v62, v63, v64);
      }
      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      v79 = self->_participants;
      v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v175, (uint64_t)v192, 16);
      if (v81)
      {
        v86 = v81;
        v87 = *(_QWORD *)v176;
        do
        {
          for (m = 0; m != v86; ++m)
          {
            if (*(_QWORD *)v176 != v87)
              objc_enumerationMutation(v79);
            v89 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * m);
            if (objc_msgSend_state(v89, v82, v83, v84, v85) != 5)
              objc_msgSend_setStateToEndedWithReason_andError_(v89, v82, v52, v76, v85);
          }
          v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v82, (uint64_t)&v175, (uint64_t)v192, 16);
        }
        while (v86);
      }

      objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObserver_name_object_(v94, v95, (uint64_t)v170, 0, 0);

      objc_msgSend_date(MEMORY[0x24BDBCE60], v96, v97, v98, v99);
      v100 = objc_claimAutoreleasedReturnValue();
      dateEnded = v170->_dateEnded;
      v170->_dateEnded = (NSDate *)v100;

      objc_msgSend__endChatWithReason_andError_(v170, v102, v52, v76, v103);
    }
  }
  else
  {
    objc_msgSend_inviteAll(self, v12, v13, v14, v15);
  }
  objc_msgSend_sharedInstance(IMAVController, v12, v13, v14, v15);
  v104 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateActiveConference(v104, v105, v106, v107, v108);
LABEL_56:

LABEL_57:
  v110 = v169;
  v109 = v170;
  if (v170->_localParticipant == v169)
  {
    if (v20)
    {
      v173 = 0u;
      v174 = 0u;
      v171 = 0u;
      v172 = 0u;
      objc_msgSend_remoteParticipants(v170, v44, v45, v46, v47);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v111, (uint64_t)&v171, (uint64_t)v191, 16);
      if (v112)
      {
        v117 = v112;
        v118 = *(_QWORD *)v172;
        do
        {
          for (n = 0; n != v117; ++n)
          {
            if (*(_QWORD *)v172 != v118)
              objc_enumerationMutation(obj);
            v120 = objc_msgSend_state(*(void **)(*((_QWORD *)&v171 + 1) + 8 * n), v113, v114, v115, v116);
            if ((_DWORD)v120 != 5)
            {
              v121 = v120;
              v122 = (void *)MEMORY[0x24BDBCE70];
              objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v113, 5, v115, v116);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v124, v121, v125, v126);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dictionaryWithObjectsAndKeys_(v122, v128, (uint64_t)v123, v129, v130, CFSTR("__kIMAVChatParticipantStateKey"), v127, CFSTR("__kIMAVChatParticipantPreviousStateKey"), 0);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend__postNotificationName_participant_userInfo_(v170, v132, (uint64_t)CFSTR("__kIMAVChatParticipantStateChangedNotification"), (uint64_t)v169, (uint64_t)v131);

            }
          }
          v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v113, (uint64_t)&v171, (uint64_t)v191, 16);
        }
        while (v117);
      }

      v110 = v169;
      v109 = v170;
    }
    objc_msgSend__postStateToDelegateIfNecessary(v109, v44, v45, v46, v47);
  }

}

- (void)_postStateToDelegateIfNecessary
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int localState;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSDate *v35;
  NSDate *dateStartedConnecting;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unsigned int v113;
  NSDate *v115;
  NSDate *dateEnded;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  IMAVChat *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  NSObject *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  IMAVChat *v153;
  NSObject *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  IMAVChat *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint8_t buf[4];
  IMAVChat *v177;
  __int16 v178;
  void *v179;
  __int16 v180;
  void *v181;
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v177 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "avchat: %@", buf, 0xCu);
  }

  localState = self->_localState;
  if (localState != self->_lastPostedState)
  {
    switch(localState)
    {
      case 0u:
        goto LABEL_10;
      case 1u:
      case 2u:
        objc_msgSend__clearConnectionTimeoutTimer(self, v4, v5, v6, v7);
        objc_msgSend__setInvitationTimeoutTimer(self, v9, v10, v11, v12);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v13, v14, v15, v16);
        break;
      case 3u:
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v4, (uint64_t)CFSTR("time-to-start-connecting"), v6, v7);
        objc_msgSend_startTimingForKey_(self->_timingCollection, v17, (uint64_t)CFSTR("time-connecting-to-connected"), v18, v19);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v20, (uint64_t)CFSTR("time-to-connecting"), v21, v22);
        objc_msgSend__clearInvitationTimeoutTimer(self, v23, v24, v25, v26);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v27, v28, v29, v30);
        objc_msgSend__setConnectionTimeoutTimer(self, v31, v32, v33, v34);
        if (!self->_dateStartedConnecting)
        {
          v35 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
          dateStartedConnecting = self->_dateStartedConnecting;
          self->_dateStartedConnecting = v35;

        }
        break;
      case 4u:
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v4, (uint64_t)CFSTR("time-from-outgoing-relay-update-to-connected"), v6, v7);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v37, (uint64_t)CFSTR("time-from-relay-incoming-relay-update-to-connected"), v38, v39);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v40, (uint64_t)CFSTR("time-connecting-to-connected"), v41, v42);
        objc_msgSend_stopTimingForKey_(self->_timingCollection, v43, (uint64_t)CFSTR("time-to-connected"), v44, v45);
        objc_msgSend__clearConnectionTimeoutTimer(self, v46, v47, v48, v49);
        objc_msgSend__clearInvitationTimeoutTimer(self, v50, v51, v52, v53);
        objc_msgSend__setFirstFrameTimeoutTimer(self, v54, v55, v56, v57);
        objc_msgSend__entitlementsChanged_(self, v58, 0, v59, v60);
        break;
      case 5u:
        objc_msgSend__clearConnectionTimeoutTimer(self, v4, v5, v6, v7);
        objc_msgSend__clearInvitationTimeoutTimer(self, v61, v62, v63, v64);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v65, v66, v67, v68);
        objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v69, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObserver_name_object_(v73, v74, (uint64_t)self, 0, 0);

LABEL_10:
        objc_msgSend__clearConnectionTimeoutTimer(self, v4, v5, v6, v7);
        objc_msgSend__clearFirstFrameTimeoutTimer(self, v75, v76, v77, v78);
        objc_msgSend__clearInvitationTimeoutTimer(self, v79, v80, v81, v82);
        break;
      default:
        break;
    }
    if (self->_localState == 5)
    {
      v83 = (void *)MEMORY[0x24BDD17C8];
      v84 = objc_msgSend_reasonChatEnded(self->_localParticipant, v4, v5, v6, v7);
      _NSStringDescriptionForIMAVChatEndedReason(v84, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend_error(self->_localParticipant, v90, v91, v92, v93);
      _NSStringDescriptionForIMAVChatError(v94, v95, v96, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v83, v100, (uint64_t)CFSTR("%@ - %@"), v101, v102, v89, v99);
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      _IMLoggingSetFailureReason();
    }
    objc_msgSend_sharedInstance(IMAVInterface, v4, v5, v6, v7);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chatStateUpdated(v104, v105, v106, v107, v108);

    v113 = self->_localState;
    if (self->_lastPostedState <= 5 && v113 == 5)
    {
      if (!self->_dateEnded)
      {
        objc_msgSend_date(MEMORY[0x24BDBCE60], v109, v110, v111, v112);
        v115 = (NSDate *)objc_claimAutoreleasedReturnValue();
        dateEnded = self->_dateEnded;
        self->_dateEnded = v115;

      }
      objc_msgSend_sharedInstance(IMAVInterface, v109, v110, v111, v112);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__conferenceEnded_(v117, v118, (uint64_t)self, v119, v120);

      v113 = self->_localState;
    }
    self->_lastPostedState = v113;
    sub_2190076D0();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(self->_lastPostedState);
      v122 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend_endedReason(self, v123, v124, v125, v126);
      _NSStringDescriptionForIMAVChatEndedReason(v127, v128, v129, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend_endedError(self, v133, v134, v135, v136);
      _NSStringDescriptionForIMAVChatError(v137, v138, v139, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v177 = v122;
      v178 = 2112;
      v179 = v132;
      v180 = 2112;
      v181 = v142;
      _os_log_impl(&dword_218FEA000, v121, OS_LOG_TYPE_DEFAULT, "Posting state change to %@   reason: %@   error: %@", buf, 0x20u);

    }
    sub_2190076D0();
    v143 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      v148 = objc_msgSend_reasonChatEnded(self->_localParticipant, v144, v145, v146, v147);
      _NSStringDescriptionForIMAVChatEndedReason(v148, v149, v150, v151, v152);
      v153 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v177 = v153;
      _os_log_impl(&dword_218FEA000, v143, OS_LOG_TYPE_DEFAULT, "    Reason: %@", buf, 0xCu);

    }
    sub_2190076D0();
    v154 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
    {
      v159 = objc_msgSend_error(self->_localParticipant, v155, v156, v157, v158);
      _NSStringDescriptionForIMAVChatError(v159, v160, v161, v162, v163);
      v164 = (IMAVChat *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v177 = v164;
      _os_log_impl(&dword_218FEA000, v154, OS_LOG_TYPE_DEFAULT, "     Error: %@", buf, 0xCu);

    }
    v165 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v166, self->_lastPostedState, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v165, v170, (uint64_t)v169, v171, v172, CFSTR("__kIMAVChatStateKey"), 0);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__postNotificationName_userInfo_(self, v174, (uint64_t)CFSTR("__kIMAVChatStateChangedNotification"), (uint64_t)v173, v175);

  }
}

- (void)systemDidFastUserSwitchOut
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((objc_msgSend_isStateFinal(self, a2, v2, v3, v4) & 1) == 0)
    objc_msgSend_endChat(self, v6, v7, v8, v9);
}

- (void)_saveAudioRestartState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  IMAVChat *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend_isSendingAudio(self, v6, v7, v8, v9)
    && (objc_msgSend__needsAudioRestart(self, v10, v11, v12, v13) & 1) == 0)
  {
    sub_2190076D0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "** Setting needs audio restarted: %@", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend__setNeedsAudioRestart_(self, v15, 1, v16, v17);
    objc_msgSend_setMute_(self, v18, 1, v19, v20);
    objc_msgSend_setIsSendingAudio_(self, v21, 0, v22, v23);
  }
}

- (void)_saveVideoRestartState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  IMAVChat *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend_isSendingVideo(self, v6, v7, v8, v9)
    && (objc_msgSend__needsVideoRestart(self, v10, v11, v12, v13) & 1) == 0)
  {
    sub_2190076D0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "** Setting needs video restarted: %@", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend__setNeedsVideoRestart_(self, v15, 1, v16, v17);
    objc_msgSend_setPaused_(self, v18, 1, v19, v20);
    objc_msgSend_setIsSendingVideo_(self, v21, 0, v22, v23);
  }
}

- (void)_resumeAudioState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];

  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend__needsAudioRestart(self, v6, v7, v8, v9))
  {
    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "** Restarting audio!", v20, 2u);
    }

    objc_msgSend__setNeedsAudioRestart_(self, v11, 0, v12, v13);
    objc_msgSend_setMute_(self, v14, 0, v15, v16);
    objc_msgSend_setIsSendingAudio_(self, v17, 1, v18, v19);
  }
}

- (void)_resumeVideoState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];

  if (objc_msgSend_isActive(self, a2, v2, v3, v4)
    && objc_msgSend__needsVideoRestart(self, v6, v7, v8, v9))
  {
    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "** Restarting video!", v20, 2u);
    }

    objc_msgSend__setNeedsVideoRestart_(self, v11, 0, v12, v13);
    objc_msgSend_setPaused_(self, v14, 0, v15, v16);
    objc_msgSend_setIsSendingVideo_(self, v17, 1, v18, v19);
  }
}

- (void)systemApplicationDidBecomeActive
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  IMAVChat *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Become active: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)systemApplicationDidEnterBackground
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  IMAVChat *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Application is entering background: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend__saveVideoRestartState(self, v4, v5, v6, v7);
}

- (void)systemApplicationWillEnterForeground
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  IMAVChat *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Application is entering foreground: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)systemApplicationDidSuspend
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  IMAVChat *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Application did suspend: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend__saveVideoRestartState(self, v4, v5, v6, v7);
}

- (void)systemApplicationDidResume
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  IMAVChat *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Application did resume: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)systemApplicationDidResumeForEventsOnly
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  IMAVChat *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Application did resume for events only: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend__resumeAudioState(self, v4, v5, v6, v7);
  objc_msgSend__resumeVideoState(self, v8, v9, v10, v11);
}

- (void)notificationCenterWillAppear
{
  NSObject *v3;
  int v4;
  IMAVChat *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Notification center is appearing: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)notificationCenterDidDisappear
{
  NSObject *v3;
  int v4;
  IMAVChat *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Notification center did disappear: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)systemWillShutdown
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  IMAVChat *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "System will shut down, ending chat: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_endChat(self, v4, v5, v6, v7);
}

- (void)_airplaneModeChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t isAirplaneModeEnabled;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  IMAVChat *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_airplaneModeEnabled(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_sharedInstance(MEMORY[0x24BE50328], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v11, v12, v13, v14, v15);
  objc_msgSend__setAirplaneModeEnabled_(self, v17, isAirplaneModeEnabled, v18, v19);

  if (v6 != objc_msgSend_airplaneModeEnabled(self, v20, v21, v22, v23)
    && objc_msgSend_airplaneModeEnabled(self, v24, v25, v26, v27))
  {
    sub_2190076D0();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412290;
      v34 = self;
      _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "Airplane mode was enabled, ending chat: %@", (uint8_t *)&v33, 0xCu);
    }

    objc_msgSend_endChat(self, v29, v30, v31, v32);
  }
}

- (void)_entitlementsChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  IMAVChat *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend__localNetworkConnectionType(self, a2, (uint64_t)a3, v3, v4) == 1)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_nonWifiFaceTimeAvailable(v10, v11, v12, v13, v14);

    if ((v15 & 1) == 0)
    {
      sub_2190076D0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = self;
        _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, "FaceTime over cellular was disabled, ending chat: %@", (uint8_t *)&v21, 0xCu);
      }

      objc_msgSend_endChat(self, v17, v18, v19, v20);
    }
  }
}

- (void)_peerID:(id)a3 changedTo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v52 = 138412546;
    v53 = v6;
    v54 = 2112;
    v55 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "peerID: %@ changedTo: %@", (uint8_t *)&v52, 0x16u);
  }

  if ((objc_msgSend_isEqualToString_(v6, v9, (uint64_t)v7, v10, v11) & 1) == 0
    && objc_msgSend_length(v6, v12, v13, v14, v15)
    && objc_msgSend_length(v7, v16, v17, v18, v19))
  {
    objc_msgSend_account(self, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imHandleWithID_(v24, v25, (uint64_t)v6, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_account(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imHandleWithID_(v33, v34, (uint64_t)v7, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    sub_2190076D0();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v52 = 138412546;
      v53 = v28;
      v54 = 2112;
      v55 = v37;
      _os_log_impl(&dword_218FEA000, v38, OS_LOG_TYPE_DEFAULT, "old handle: %@   new handle: %@", (uint8_t *)&v52, 0x16u);
    }

    if (v28 && v37)
    {
      objc_msgSend_participantMatchingIMHandle_(self, v39, (uint64_t)v37, v40, v41);
      v42 = objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v46 = (void *)v42;
        sub_2190076D0();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v52) = 0;
          _os_log_impl(&dword_218FEA000, v47, OS_LOG_TYPE_DEFAULT, "Already have new handle", (uint8_t *)&v52, 2u);
        }

      }
      else
      {
        objc_msgSend_participantMatchingIMHandle_(self, v43, (uint64_t)v28, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2190076D0();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v52 = 138412290;
          v53 = v46;
          _os_log_impl(&dword_218FEA000, v48, OS_LOG_TYPE_DEFAULT, "found participant: %@", (uint8_t *)&v52, 0xCu);
        }

        objc_msgSend__switchToUseNewIMHandle_(v46, v49, (uint64_t)v37, v50, v51);
      }

    }
  }

}

- (void)_updateIMHandleInBuddyList:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BE50150];
  objc_msgSend_postNotificationName_(v3, v5, *MEMORY[0x24BE50150], v6, v7);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_accountSiblingsArray(v3, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v14)
  {
    v18 = v14;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v12);
        objc_msgSend_postNotificationName_(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v20++), v15, v4, v16, v17);
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v18);
  }

}

- (void)_insertRemoteParticipant:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[16];

  v6 = a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, v25, 2u);
  }

  objc_msgSend_requestIconIfNecessary(v6, v8, v9, v10, v11);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || (v16 = a4 + 1, v16 >= objc_msgSend_count(self->_participants, v12, v13, v14, v15)))
    objc_msgSend_addObject_(self->_participants, v12, (uint64_t)v6, v14, v15);
  else
    objc_msgSend_insertObject_atIndex_(self->_participants, v12, (uint64_t)v6, v16, v15);
  objc_msgSend_imHandle(v6, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateIMHandleInBuddyList_(self, v22, (uint64_t)v21, v23, v24);

}

- (BOOL)_moveVCPartyID:(id)a3 toIndex:(unsigned int)a4 inCount:(unsigned int)a5
{
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char isEqualToString;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;

  LODWORD(v5) = a5;
  v11 = a3;
  if ((_DWORD)v5)
  {
    objc_msgSend_objectAtIndex_(self->_participants, v8, 0, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vcPartyID(v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v11, v18, (uint64_t)v17, v19, v20);

    if ((isEqualToString & 1) != 0)
    {
      v25 = 0;
      LOBYTE(v5) = 1;
LABEL_8:
      if ((_DWORD)v25 != a4)
      {
        objc_msgSend_removeObjectAtIndex_(self->_participants, v22, v25, v23, v24);
        objc_msgSend_insertObject_atIndex_(self->_participants, v39, (uint64_t)v12, a4, v40);
      }

    }
    else
    {
      v26 = v5;
      v5 = 1;
      while (1)
      {

        if (v26 == v5)
          break;
        objc_msgSend_objectAtIndex_(self->_participants, v27, v5, v28, v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vcPartyID(v12, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_isEqualToString_(v11, v35, (uint64_t)v34, v36, v37);

        ++v5;
        if (v38)
        {
          v25 = v5 - 1;
          LOBYTE(v5) = v5 - 1 < v26;
          goto LABEL_8;
        }
      }
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (void)_initParticipantsWithIMHandles:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  NSMutableArray *participants;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  IMAVChatParticipant *v38;
  IMHandle *initiator;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  IMAVChatParticipant *inited;
  IMAVChatParticipant *localParticipant;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  IMAVChatParticipant *v59;
  IMHandle *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  id obj;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  IMAVChat *v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v78 = self;
    v79 = 2112;
    v80 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "avchat: %@  imhandles: %@", buf, 0x16u);
  }

  v10 = objc_msgSend_count(v4, v6, v7, v8, v9);
  v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v15 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v11, v12, v10 + 1, v13, v14);
  participants = self->_participants;
  self->_participants = v15;

  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v17, (uint64_t)v4, v18, v19);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v70, v20, (uint64_t)self->_initiator, v21, v22);
  objc_msgSend___imFirstObject(v4, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginIMHandle(v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = [IMAVChatParticipant alloc];
  initiator = self->_initiator;
  objc_msgSend_account(v37, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (IMAVChatParticipant *)objc_msgSend_initAs_invitedBy_toChat_account_(v38, v45, (uint64_t)v37, (uint64_t)initiator, (uint64_t)self, v44);
  localParticipant = self->_localParticipant;
  self->_localParticipant = inited;

  objc_msgSend_addObject_(self->_participants, v48, (uint64_t)self->_localParticipant, v49, v50);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v4;
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v72, (uint64_t)v76, 16);
  if (v52)
  {
    v54 = v52;
    v55 = 0;
    v56 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v73 != v56)
          objc_enumerationMutation(obj);
        v58 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        if (v58 == v37)
        {
          if (self->_isVideo)
            v55 = 0;
        }
        else
        {
          v59 = [IMAVChatParticipant alloc];
          v60 = self->_initiator;
          objc_msgSend_account(v58, v61, v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (void *)objc_msgSend_initAs_invitedBy_toChat_account_(v59, v66, (uint64_t)v58, (uint64_t)v60, (uint64_t)self, v65);

          objc_msgSend__insertRemoteParticipant_atIndex_(self, v68, (uint64_t)v67, v55, v69);
          ++v55;
        }
      }
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v72, (uint64_t)v76, 16);
    }
    while (v54);
  }

}

- (BOOL)_participantsCheckOut
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  IMAVChatParticipant *localParticipant;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  int isCaller;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSMutableArray *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  IMAVChatParticipant *v57;
  _BOOL4 v58;
  const __CFString *v59;
  NSObject *v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  _BYTE v68[18];
  __int16 v69;
  const __CFString *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, buf, 2u);
  }

  v8 = objc_msgSend_count(self->_participants, v4, v5, v6, v7);
  if ((unint64_t)(v8 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v8;
    sub_2190076D0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isVideo)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v68 = v13;
      *(_WORD *)&v68[4] = 2112;
      *(_QWORD *)&v68[6] = v15;
      v16 = "Failing due to count check:   count: %d  isVideo: %@";
      v17 = v14;
      v18 = 18;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  localParticipant = self->_localParticipant;
  if (!localParticipant)
  {
    sub_2190076D0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Failing due to empty local participant";
      v17 = v14;
      v18 = 2;
LABEL_23:
      _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
LABEL_24:
    v56 = 0;
    goto LABEL_39;
  }
  objc_msgSend_invitedBy(localParticipant, v9, v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_imHandle(self->_localParticipant, v20, v21, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v14 == v24;
  isCaller = self->_isCaller;

  if (isCaller == v25)
  {
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v27, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v32 = self->_participants;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v62, (uint64_t)v66, 16);
    if (v34)
    {
      v39 = v34;
      v40 = 0;
      v41 = *(_QWORD *)v63;
      while (2)
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v63 != v41)
            objc_enumerationMutation(v32);
          v43 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend_imHandle(v43, v35, v36, v37, v38, (_QWORD)v62);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_invitedBy(v43, v45, v46, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_containsObject_(v31, v50, (uint64_t)v44, v51, v52))
          {
            sub_2190076D0();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v68 = v44;
              _os_log_impl(&dword_218FEA000, v60, OS_LOG_TYPE_DEFAULT, "Failing due to duplicate handle: %@", buf, 0xCu);
            }

            goto LABEL_36;
          }
          v40 |= v44 == v49;
          objc_msgSend_addObject_(v31, v53, (uint64_t)v44, v54, v55);

        }
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v62, (uint64_t)v66, 16);
        if (v39)
          continue;
        break;
      }

      if ((v40 & 1) != 0)
      {
        v56 = 1;
        goto LABEL_38;
      }
    }
    else
    {

    }
    sub_2190076D0();
    v32 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v32->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, &v32->super.super, OS_LOG_TYPE_DEFAULT, "Failing due to inviter not being in the participant list", buf, 2u);
    }
LABEL_36:

  }
  else
  {
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v57 = self->_localParticipant;
      v58 = self->_isCaller;
      *(_DWORD *)buf = 138412802;
      if (v58)
        v59 = CFSTR("YES");
      else
        v59 = CFSTR("NO");
      *(_QWORD *)v68 = v57;
      *(_WORD *)&v68[8] = 2112;
      *(_QWORD *)&v68[10] = v14;
      v69 = 2112;
      v70 = v59;
      _os_log_impl(&dword_218FEA000, v31, OS_LOG_TYPE_DEFAULT, "Failing inviter check:   localParticipant: %@   invitedBy: %@   isCaller: %@", buf, 0x20u);
    }
  }
  v56 = 0;
LABEL_38:

LABEL_39:
  return v56;
}

- (IMAVChatParticipant)initiatorParticipant
{
  NSMutableArray *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = self->_participants;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v4)
  {
    v9 = v4;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v2);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend_isInitiator(v12, v5, v6, v7, v8) & 1) != 0)
        {
          v13 = v12;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v9)
        continue;
      break;
    }
  }

  sub_2190076D0();
  v2 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v2->super.super, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_218FEA000, &v2->super.super, OS_LOG_TYPE_DEFAULT, "[WARN] *********** -[IMAVChat initiatorParticipant] couldn't find initiator participant!", v15, 2u);
  }
  v13 = 0;
LABEL_13:

  return (IMAVChatParticipant *)v13;
}

- (NSArray)remoteParticipants
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_count(self->_participants, a2, v2, v3, v4);
  if (v6 > 1)
    objc_msgSend_subarrayWithRange_(self->_participants, v7, 1, (v6 - 1), v10);
  else
    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8, v9, v10);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_allParticipantsUsingICE
{
  return 1;
}

- (id)_participantMatchingVCPartyID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char isEqualToString;
  IMAVChatParticipant *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = v4;
  if (v4)
  {
    if (!objc_msgSend_length(v4, v5, v6, v7, v8))
    {
      v26 = self->_localParticipant;
      goto LABEL_15;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = self->_participants;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, (uint64_t)v32, 16);
    if (v12)
    {
      v17 = v12;
      v18 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v10);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend_vcPartyID(v20, v13, v14, v15, v16, (_QWORD)v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v9, v22, (uint64_t)v21, v23, v24);

          if ((isEqualToString & 1) != 0)
          {
            v26 = v20;

            goto LABEL_15;
          }
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v17)
          continue;
        break;
      }
    }

  }
  v26 = 0;
LABEL_15:

  return v26;
}

+ (id)chatList
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_calls(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)connectedChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  objc_msgSend_activeChat(a1, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  if (v15 && objc_msgSend_state(v15, v16, v17, v18, v19) == 2)
  {
    objc_msgSend__chatListLock(IMAVChat, v16, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v21, v22, v23, v24, v25);

    v26 = 0;
  }
  else
  {
    objc_msgSend__chatListLock(IMAVChat, v16, v17, v18, v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v27, v28, v29, v30, v31);

    v26 = v20;
  }

  return v26;
}

+ (id)activeChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int hasActiveConference;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  unsigned int v34;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hasActiveConference = objc_msgSend_hasActiveConference(v5, v6, v7, v8, v9);

  if (!hasActiveConference)
    return 0;
  objc_msgSend__chatListLock(IMAVChat, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v15, v16, v17, v18, v19);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend_chatList(IMAVChat, v20, v21, v22, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v24);
        v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v34 = objc_msgSend_state(v33, v26, v27, v28, v29);
        if (v34 > 5 || ((1 << v34) & 0x23) == 0)
        {
          v30 = v33;
          goto LABEL_16;
        }
      }
      v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v46, (uint64_t)v50, 16);
      if (v30)
        continue;
      break;
    }
  }
LABEL_16:

  objc_msgSend__chatListLock(IMAVChat, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v41, v42, v43, v44, v45);

  return v30;
}

+ (id)nonFinalChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  int v24;
  BOOL v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend_chatList(IMAVChat, v10, v11, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v14);
        v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v24 = objc_msgSend_state(v23, v16, v17, v18, v19);
        if (v24)
          v25 = v24 == 5;
        else
          v25 = 1;
        if (!v25)
        {
          v20 = v23;
          goto LABEL_13;
        }
      }
      v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v20);
  }
LABEL_13:

  objc_msgSend__chatListLock(IMAVChat, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v30, v31, v32, v33, v34);

  return v20;
}

+ (id)incomingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel_chatsWithIMAVChatState_, 1);
}

+ (id)outgoingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel_chatsWithIMAVChatState_, 2);
}

+ (id)connectingChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel_chatsWithIMAVChatState_, 3);
}

+ (id)connectedChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel_chatsWithIMAVChatState_, 4);
}

+ (id)acceptedChats
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend_connectingChats(IMAVChat, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithArray_(v10, v16, (uint64_t)v15, v17, v18);

  objc_msgSend_connectedChats(IMAVChat, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v19, v25, (uint64_t)v24, v26, v27);

  objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v19;
}

+ (id)chatsWithIMAVChatState:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__chatListLock(IMAVChat, a2, *(uint64_t *)&a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend_chatList(IMAVChat, v11, v12, v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v17)
  {
    v22 = v17;
    v23 = 0;
    v24 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v15);
        v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend_state(v26, v18, v19, v20, v21) == a3)
        {
          if (!v23)
            v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend_addObject_(v23, v18, (uint64_t)v26, v20, v21);
        }
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
  }

  objc_msgSend__chatListLock(IMAVChat, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v31, v32, v33, v34, v35);

  return v23;
}

+ (id)avChatWithGUID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int isEqualToString;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    objc_msgSend__chatListLock(IMAVChat, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend_chatList(IMAVChat, v17, v18, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v21);
          v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          objc_msgSend_GUID(v30, v23, v24, v25, v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v3, v33, v34);

          if (isEqualToString)
          {
            v27 = v30;
            goto LABEL_12;
          }
        }
        v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v40, v41, v42, v43, v44);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)_avChatArray
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend__copyMutableFTCalls(v5, v6, v7, v8, v9);

  return v10;
}

+ (id)_chatWithSessionID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__chatListLock(IMAVChat, a2, *(uint64_t *)&a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9, v10, v11);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend__chatList(a1, v12, v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v18)
  {
    v23 = v18;
    v24 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v16);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend_sessionID(v26, v19, v20, v21, v22) == a3)
        {
          v27 = v26;
          goto LABEL_11;
        }
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v23)
        continue;
      break;
    }
  }
  v27 = 0;
LABEL_11:

  objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v27;
}

+ (id)_chatList
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  objc_msgSend_sharedInstance(IMAVCallManager, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__FTCalls(v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_copy(v19, v20, v21, v22, v23);

  objc_msgSend__chatListLock(IMAVChat, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v29, v30, v31, v32, v33);

  return v24;
}

+ (id)_connectedChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend__activeChat(a1, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5 && objc_msgSend_state(v5, v6, v7, v8, v9) == 2)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

+ (id)_activeChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int hasActiveConference;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  unsigned int v34;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hasActiveConference = objc_msgSend_hasActiveConference(v5, v6, v7, v8, v9);

  if (!hasActiveConference)
    return 0;
  objc_msgSend__chatListLock(IMAVChat, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v15, v16, v17, v18, v19);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend__chatList(IMAVChat, v20, v21, v22, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v24);
        v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v34 = objc_msgSend_state(v33, v26, v27, v28, v29);
        if (v34 > 5 || ((1 << v34) & 0x23) == 0)
        {
          v30 = v33;
          goto LABEL_16;
        }
      }
      v30 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v46, (uint64_t)v50, 16);
      if (v30)
        continue;
      break;
    }
  }
LABEL_16:

  objc_msgSend__chatListLock(IMAVChat, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v41, v42, v43, v44, v45);

  return v30;
}

+ (id)_nonFinalChat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  int v29;
  BOOL v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend_sharedInstance(IMAVCallManager, v10, v11, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__FTCalls(v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v19);
        v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v29 = objc_msgSend_state(v28, v21, v22, v23, v24);
        if (v29)
          v30 = v29 == 5;
        else
          v30 = 1;
        if (!v30)
        {
          v25 = v28;
          goto LABEL_13;
        }
      }
      v25 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v25);
  }
LABEL_13:

  objc_msgSend__chatListLock(IMAVChat, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v35, v36, v37, v38, v39);

  return v25;
}

+ (id)_chatListLock
{
  if (qword_253DE9460 != -1)
    dispatch_once(&qword_253DE9460, &unk_24DA57890);
  return (id)qword_253DE9468;
}

+ (id)_avChatWithConferenceID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int isEqualToString;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    objc_msgSend__chatListLock(IMAVChat, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend__chatList(IMAVChat, v17, v18, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v21);
          v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          objc_msgSend_conferenceID(v30, v23, v24, v25, v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v3, v33, v34);

          if (isEqualToString)
          {
            v27 = v30;
            goto LABEL_12;
          }
        }
        v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v40, v41, v42, v43, v44);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)_avChatWithGUID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int isEqualToString;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    objc_msgSend__chatListLock(IMAVChat, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend__chatList(IMAVChat, v17, v18, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v21);
          v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          objc_msgSend_GUID(v30, v23, v24, v25, v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v3, v33, v34);

          if (isEqualToString)
          {
            v27 = v30;
            goto LABEL_12;
          }
        }
        v27 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v40, v41, v42, v43, v44);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)_incomingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel__chatsWithIMAVChatState_, 1);
}

+ (id)_outgoingInvitations
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel__chatsWithIMAVChatState_, 2);
}

+ (id)_connectingChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel__chatsWithIMAVChatState_, 3);
}

+ (id)_connectedChats
{
  return (id)((uint64_t (*)(id, char *, uint64_t))MEMORY[0x24BEDD108])(a1, sel__chatsWithIMAVChatState_, 4);
}

+ (id)_acceptedChats
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  objc_msgSend__chatListLock(IMAVChat, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8, v9);

  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend__connectingChats(IMAVChat, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithArray_(v10, v16, (uint64_t)v15, v17, v18);

  objc_msgSend__connectedChats(IMAVChat, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v19, v25, (uint64_t)v24, v26, v27);

  objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v19;
}

+ (id)_chatsWithIMAVChatState:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__chatListLock(IMAVChat, a2, *(uint64_t *)&a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend_sharedInstance(IMAVCallManager, v11, v12, v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__nonRetainingChatList(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v22)
  {
    v27 = v22;
    v28 = 0;
    v29 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v20);
        v31 = (void *)objc_msgSend_copyObject(*(void **)(*((_QWORD *)&v50 + 1) + 8 * i), v23, v24, v25, v26);
        v36 = v31;
        if (v31 && objc_msgSend_state(v31, v32, v33, v34, v35) == a3)
        {
          if (!v28)
            v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend_addObject_(v28, v37, (uint64_t)v36, v38, v39);
        }

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v27);
  }
  else
  {
    v28 = 0;
  }

  objc_msgSend__chatListLock(IMAVChat, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v44, v45, v46, v47, v48);

  return v28;
}

+ (id)_bestGuessAVChatWithIMHandle:(id)a3 conferenceID:(id)a4 sessionID:(unsigned int)a5 properties:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  _BOOL4 v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  int isEqual;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id obj;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  id v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  uint8_t v147[128];
  uint8_t buf[4];
  _BYTE v149[18];
  uint64_t v150;

  v7 = *(_QWORD *)&a5;
  v150 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  sub_2190076D0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(IMAVCallManager, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__FTCalls(v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v149 = v22;
    _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "All Chats: %@", buf, 0xCu);

  }
  objc_msgSend__chatWithSessionID_(IMAVChat, v23, v7, v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v30 = (id)v26;
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v149 = v7;
      *(_WORD *)&v149[4] = 2112;
      *(_QWORD *)&v149[6] = v30;
      v32 = "      SessionID [%u] => AVChat [%@]";
      v33 = v31;
      v34 = 18;
LABEL_11:
      _os_log_impl(&dword_218FEA000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v10)
  {
    objc_msgSend__avChatWithConferenceID_(IMAVChat, v27, (uint64_t)v10, v28, v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (!v35)
        goto LABEL_19;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v149 = v10;
      *(_WORD *)&v149[8] = 2112;
      *(_QWORD *)&v149[10] = v30;
      v32 = "      conferenceID [%@] => AVChat [%@]";
LABEL_10:
      v33 = v31;
      v34 = 22;
      goto LABEL_11;
    }
    if (v35)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v149 = v10;
      v36 = "      Found no AVChat for conference ID [%@], returning none";
      v37 = v31;
      v38 = 12;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ((_DWORD)v7)
  {
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v149 = v7;
      v36 = "      Found no AVChat for sessionID [%u], returning none";
      v37 = v31;
      v38 = 8;
LABEL_17:
      _os_log_impl(&dword_218FEA000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
    }
LABEL_18:
    v30 = 0;
    goto LABEL_19;
  }
  objc_msgSend__avChatInvitedByIMHandle_orConferenceID_(IMAVChat, v27, (uint64_t)v9, 0, v29);
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v30 = (id)v40;
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v149 = v9;
    *(_WORD *)&v149[8] = 2112;
    *(_QWORD *)&v149[10] = v30;
    v32 = "      _avChatInvitedByIMHandle [%@] => AVChat [%@]";
    goto LABEL_10;
  }
  objc_msgSend__avChatWaitingForReplyFromIMHandle_orConferenceID_(IMAVChat, v41, (uint64_t)v9, 0, v42);
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v30 = (id)v43;
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v149 = v9;
    *(_WORD *)&v149[8] = 2112;
    *(_QWORD *)&v149[10] = v30;
    v32 = "      _avChatWaitingForReplyFromIMHandle [%@] => AVChat [%@]";
    goto LABEL_10;
  }
  objc_msgSend__connectedChat(IMAVChat, v44, v45, v46, v47);
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v30 = (id)v48;
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v149 = v30;
    v32 = "      connectedChat => AVChat [%@]";
    goto LABEL_33;
  }
  objc_msgSend__activeChat(IMAVChat, v49, v50, v51, v52);
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v30 = (id)v53;
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v149 = v30;
    v32 = "      activeChat [%@]";
    goto LABEL_33;
  }
  if (!objc_msgSend_count(v11, v54, v55, v56, v57))
    goto LABEL_63;
  objc_msgSend__chatListLock(IMAVChat, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v62, v63, v64, v65, v66);

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend_sharedInstance(IMAVCallManager, v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__nonRetainingChatList(v71, v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v76;
  v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v142, (uint64_t)v147, 16);
  if (v133)
  {
    v132 = *(_QWORD *)v143;
    while (2)
    {
      for (i = 0; i != v133; ++i)
      {
        if (*(_QWORD *)v143 != v132)
          objc_enumerationMutation(obj);
        objc_msgSend_object(*(void **)(*((_QWORD *)&v142 + 1) + 8 * i), v78, v79, v80, v81);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (v83)
        {
          v134 = i;
          v135 = v83;
          objc_msgSend_callerProperties(v83, v78, v79, v80, v81);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          v141 = 0u;
          objc_msgSend_allKeys(v11, v84, v85, v86, v87);
          v136 = (id)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v88, (uint64_t)&v138, (uint64_t)v146, 16);
          if (v89)
          {
            v93 = v89;
            v94 = *(_QWORD *)v139;
            while (2)
            {
              for (j = 0; j != v93; ++j)
              {
                if (*(_QWORD *)v139 != v94)
                  objc_enumerationMutation(v136);
                v96 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
                objc_msgSend_objectForKey_(v11, v90, v96, v91, v92);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(v137, v98, v96, v99, v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                isEqual = objc_msgSend_isEqual_(v97, v102, (uint64_t)v101, v103, v104);

                if (!isEqual)
                {

                  i = v134;
                  goto LABEL_51;
                }
              }
              v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v90, (uint64_t)&v138, (uint64_t)v146, 16);
              if (v93)
                continue;
              break;
            }
          }

          v30 = v135;
          sub_2190076D0();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_allKeys(v11, v107, v108, v109, v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v149 = v111;
            *(_WORD *)&v149[8] = 2112;
            *(_QWORD *)&v149[10] = v30;
            _os_log_impl(&dword_218FEA000, v106, OS_LOG_TYPE_DEFAULT, "      properties [%@] => AVChat [%@]", buf, 0x16u);

          }
          goto LABEL_57;
        }
LABEL_51:
        ;
      }
      v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v142, (uint64_t)v147, 16);
      if (v133)
        continue;
      break;
    }
  }
  v30 = 0;
LABEL_57:

  objc_msgSend__chatListLock(IMAVChat, v112, v113, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v116, v117, v118, v119, v120);

  if (!v30)
  {
LABEL_63:
    objc_msgSend_sharedInstance(IMAVCallManager, v58, v59, v60, v61);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__FTCalls(v121, v122, v123, v124, v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v126, v127, v128, v129, v130);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      sub_2190076D0();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v149 = v30;
      v32 = "      Last Chat => AVChat [%@]";
LABEL_33:
      v33 = v31;
      v34 = 12;
      goto LABEL_11;
    }
  }
LABEL_20:

  return v30;
}

+ (id)_avChatInvitedByIMHandle:(id)a3 orConferenceID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *i;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend__avChatWithConferenceID_(a1, v7, (uint64_t)a4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (v10)
  {
    v16 = v10;
  }
  else
  {
    objc_msgSend__chatListLock(IMAVChat, v11, v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v17, v18, v19, v20, v21);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend__chatList(IMAVChat, v22, v23, v24, v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v46, (uint64_t)v50, 16);
    if (v16)
    {
      v32 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(v26);
          v34 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          objc_msgSend_initiatorIMHandle(v34, v28, v29, v30, v31);
          v35 = (id)objc_claimAutoreleasedReturnValue();

          if (v35 == v6)
          {
            v16 = v34;
            goto LABEL_13;
          }
        }
        v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v46, (uint64_t)v50, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_13:

    objc_msgSend__chatListLock(IMAVChat, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v40, v41, v42, v43, v44);

  }
  return v16;
}

+ (id)_avChatWaitingForReplyFromIMHandle:(id)a3 orConferenceID:(id)a4
{
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *i;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__avChatWithConferenceID_(a1, a2, (uint64_t)a4, (uint64_t)a4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5 && objc_msgSend_isCaller(v5, v6, v7, v8, v9))
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend__chatListLock(IMAVChat, v6, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v12, v13, v14, v15, v16);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend__chatList(IMAVChat, v17, v18, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v11)
    {
      v27 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v21);
          v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend_state(v29, v23, v24, v25, v26) == 2
            && objc_msgSend_isCaller(v29, v23, v24, v25, v26))
          {
            v11 = v29;
            goto LABEL_15;
          }
        }
        v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v40, (uint64_t)v44, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_15:

    objc_msgSend__chatListLock(IMAVChat, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v34, v35, v36, v37, v38);

  }
  return v11;
}

+ (id)_avChatConnectingFromIMHandle:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend__chatListLock(IMAVChat, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11, v12);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend__chatList(IMAVChat, v13, v14, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v17);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend_state(v26, v19, v20, v21, v22) == 3
          && (objc_msgSend_isCaller(v26, v19, v20, v21, v22) & 1) == 0)
        {
          if (!v3
            || (objc_msgSend_participantMatchingIMHandle_(v26, v19, (uint64_t)v3, v21, v22),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v27,
                v27))
          {
            v23 = v26;
            goto LABEL_14;
          }
        }
      }
      v23 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v23)
        continue;
      break;
    }
  }
LABEL_14:

  objc_msgSend__chatListLock(IMAVChat, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v32, v33, v34, v35, v36);

  return v23;
}

+ (id)_avChatWithMatchingIMHandles:(id)a3 video:(BOOL)a4
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __CFString *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __CFString *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  int hasSuffix;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int v93;
  __CFString *v94;
  int isVideo;
  _BOOL4 v96;
  const char *v97;
  __CFString *v98;
  unint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v110;
  uint64_t v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t v117[128];
  uint8_t buf[4];
  __CFString *v119;
  __int16 v120;
  const __CFString *v121;
  uint64_t v122;

  v110 = a4;
  v122 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v110)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v119 = v4;
    v120 = 2112;
    v121 = v6;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "imHandles: %@  video: %@", buf, 0x16u);
  }

  objc_msgSend_lastObject(v4, v7, v8, v9, v10);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__avChatArray(IMAVChat, v13, v14, v15, v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v119 = v17;
    _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "All existing AVChats: %@", buf, 0xCu);

  }
  objc_msgSend__chatListLock(IMAVChat, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v22, v23, v24, v25, v26);

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend__chatList(IMAVChat, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v113, (uint64_t)v117, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v114;
    v111 = *(_QWORD *)v114;
    v112 = v31;
LABEL_9:
    v36 = 0;
    while (1)
    {
      if (*(_QWORD *)v114 != v35)
        objc_enumerationMutation(v31);
      v37 = *(__CFString **)(*((_QWORD *)&v113 + 1) + 8 * v36);
      sub_2190076D0();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v119 = v37;
        _os_log_impl(&dword_218FEA000, v38, OS_LOG_TYPE_DEFAULT, "Checking AVChat: %@", buf, 0xCu);
      }

      if (objc_msgSend_isCaller(v37, v39, v40, v41, v42))
      {
        sub_2190076D0();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v47, OS_LOG_TYPE_DEFAULT, "  ==> Not using this, this is an outgoing", buf, 2u);
        }
        goto LABEL_36;
      }
      objc_msgSend_remoteParticipants(v37, v43, v44, v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend_count(v47, v48, v49, v50, v51) >= 2)
      {
        sub_2190076D0();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v56, OS_LOG_TYPE_DEFAULT, "  ==> Outgoing multiparty, skipping", buf, 2u);
        }

        goto LABEL_36;
      }
      objc_msgSend_lastObject(v47, v52, v53, v54, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imHandle(v57, v58, v59, v60, v61);
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v62 == v11)
        goto LABEL_28;
      sub_2190076D0();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v119 = v62;
        v120 = 2112;
        v121 = v11;
        _os_log_impl(&dword_218FEA000, v67, OS_LOG_TYPE_DEFAULT, "  ==> %@ and %@ do not match", buf, 0x16u);
      }

      objc_msgSend_ID(v62, v68, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ID(v11, v73, v74, v75, v76);
      v77 = v11;
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      hasSuffix = objc_msgSend_hasSuffix_(v72, v79, (uint64_t)v78, v80, v81);

      v11 = v77;
      if (hasSuffix)
        break;
LABEL_35:

      v35 = v111;
      v31 = v112;
LABEL_36:

      if (v34 == ++v36)
      {
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v97, (uint64_t)&v113, (uint64_t)v117, 16);
        if (v34)
          goto LABEL_9;
        v98 = 0;
        goto LABEL_43;
      }
    }
    sub_2190076D0();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v83, OS_LOG_TYPE_DEFAULT, "  ==> Letting this slide...", buf, 2u);
    }

LABEL_28:
    if (objc_msgSend_state(v37, v63, v64, v65, v66) < 3)
    {
      isVideo = objc_msgSend_isVideo(v37, v84, v85, v86, v87);
      sub_2190076D0();
      v88 = objc_claimAutoreleasedReturnValue();
      v96 = os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);
      if (isVideo == v110)
      {
        if (v96)
        {
          *(_DWORD *)buf = 138412290;
          v119 = v37;
          _os_log_impl(&dword_218FEA000, v88, OS_LOG_TYPE_DEFAULT, "We found a matching chat: %@", buf, 0xCu);
        }

        v98 = v37;
        v99 = 0x24DA56000;
        v31 = v112;
        goto LABEL_44;
      }
      if (v96)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v88, OS_LOG_TYPE_DEFAULT, "  ==> Video flags do not match", buf, 2u);
      }
    }
    else
    {
      sub_2190076D0();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        v93 = objc_msgSend_state(v37, v89, v90, v91, v92);
        _NSStringDescriptionForIMAVChatState(v93);
        v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v119 = v94;
        _os_log_impl(&dword_218FEA000, v88, OS_LOG_TYPE_DEFAULT, "  ==> State of this chat is not adequate: %@", buf, 0xCu);

      }
    }

    goto LABEL_35;
  }
  v98 = 0;
LABEL_43:
  v99 = 0x24DA56000uLL;
LABEL_44:

  objc_msgSend__chatListLock(*(void **)(v99 + 2800), v100, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v104, v105, v106, v107, v108);

  return v98;
}

+ (id)_imHandleFromProxyRepresentation:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("Service"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v8, (uint64_t)CFSTR("AccountGUID"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v12, (uint64_t)CFSTR("AccountLogin"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v16, (uint64_t)CFSTR("HandleID"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_serviceWithName_(MEMORY[0x24BE50368], v20, (uint64_t)v7, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE50288], v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bestAccountForService_login_guid_(v28, v29, (uint64_t)v23, (uint64_t)v15, (uint64_t)v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imHandleWithID_(v30, v31, (uint64_t)v19, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)_proxyRepresentationForIMHandle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend_service(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v4, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_login(v20, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v4, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v15, (uint64_t)CFSTR("Service"), v37);
  if (v25)
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v25, (uint64_t)CFSTR("AccountGUID"), v37);
  if (v30)
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v30, (uint64_t)CFSTR("AccountLogin"), v37);
  if (v35)
    objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v35, (uint64_t)CFSTR("HandleID"), v37);

  return v5;
}

- (id)_proxyRepresentationForIMAVChatParticipant:(id)a3
{
  id v3;
  __CFDictionary *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t isLocalParticipant;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v3 = a3;
  v4 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_name(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v4, CFSTR("Name"), v9);

  v10 = (void *)MEMORY[0x24BDD16E0];
  v15 = objc_msgSend__inviteDelivered(v3, v11, v12, v13, v14);
  objc_msgSend_numberWithBool_(v10, v16, v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v4, CFSTR("IsInvitationDelivered"), v19);

  v20 = (void *)MEMORY[0x24BDD16E0];
  isLocalParticipant = objc_msgSend_isLocalParticipant(v3, v21, v22, v23, v24);
  objc_msgSend_numberWithBool_(v20, v26, isLocalParticipant, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    CFDictionarySetValue(v4, CFSTR("IsLocalParticipant"), v29);

  return v4;
}

- (id)_proxyRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t isStateFinal;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t isCaller;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t isVideo;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t isMute;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t isSendingAudio;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t isSendingVideo;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  id v193;
  id v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  _BYTE v214[128];
  uint64_t v215;

  v215 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_GUID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v3, CFSTR("GUID"), v8);

  objc_msgSend_account(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueID(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    CFDictionarySetValue(v3, CFSTR("AccountID"), v18);

  objc_msgSend_conferenceID(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("ConferenceID"), v23);

  v24 = (void *)MEMORY[0x24BDD16E0];
  v29 = objc_msgSend_state(self, v25, v26, v27, v28);
  objc_msgSend_numberWithUnsignedInt_(v24, v30, v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    CFDictionarySetValue(v3, CFSTR("State"), v33);

  v34 = (void *)MEMORY[0x24BDD16E0];
  isStateFinal = objc_msgSend_isStateFinal(self, v35, v36, v37, v38);
  objc_msgSend_numberWithBool_(v34, v40, isStateFinal, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    CFDictionarySetValue(v3, CFSTR("IsStateFinal"), v43);

  objc_msgSend_initiatorIMHandle(self, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v49, (uint64_t)v48, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
    CFDictionarySetValue(v3, CFSTR("Initiator"), v52);

  objc_msgSend_otherIMHandle(self, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__proxyRepresentationForIMHandle_(IMAVChat, v58, (uint64_t)v57, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
    CFDictionarySetValue(v3, CFSTR("Other"), v61);

  v62 = (void *)MEMORY[0x24BDD16E0];
  isCaller = objc_msgSend_isCaller(self, v63, v64, v65, v66);
  objc_msgSend_numberWithBool_(v62, v68, isCaller, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    CFDictionarySetValue(v3, CFSTR("IsCaller"), v71);

  v72 = (void *)MEMORY[0x24BDD16E0];
  isVideo = objc_msgSend_isVideo(self, v73, v74, v75, v76);
  objc_msgSend_numberWithBool_(v72, v78, isVideo, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
    CFDictionarySetValue(v3, CFSTR("IsVideo"), v81);

  v82 = (void *)MEMORY[0x24BDD16E0];
  v87 = objc_msgSend_endedReason(self, v83, v84, v85, v86);
  objc_msgSend_numberWithUnsignedInt_(v82, v88, v87, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
    CFDictionarySetValue(v3, CFSTR("EndedReason"), v91);

  v92 = (void *)MEMORY[0x24BDD16E0];
  v97 = objc_msgSend_endedError(self, v93, v94, v95, v96);
  objc_msgSend_numberWithInt_(v92, v98, v97, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
    CFDictionarySetValue(v3, CFSTR("EndedError"), v101);

  v102 = (void *)MEMORY[0x24BDD16E0];
  isMute = objc_msgSend_isMute(self, v103, v104, v105, v106);
  objc_msgSend_numberWithBool_(v102, v108, isMute, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
    CFDictionarySetValue(v3, CFSTR("IsMute"), v111);

  v112 = (void *)MEMORY[0x24BDD16E0];
  isSendingAudio = objc_msgSend_isSendingAudio(self, v113, v114, v115, v116);
  objc_msgSend_numberWithBool_(v112, v118, isSendingAudio, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (v121)
    CFDictionarySetValue(v3, CFSTR("IsSendingAudio"), v121);

  v122 = (void *)MEMORY[0x24BDD16E0];
  isSendingVideo = objc_msgSend_isSendingVideo(self, v123, v124, v125, v126);
  objc_msgSend_numberWithBool_(v122, v128, isSendingVideo, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
    CFDictionarySetValue(v3, CFSTR("IsSendingVideo"), v131);

  objc_msgSend_dataUploaded(self, v132, v133, v134, v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  if (v136)
    CFDictionarySetValue(v3, CFSTR("DataUploaded"), v136);

  objc_msgSend_dataDownloaded(self, v137, v138, v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (v141)
    CFDictionarySetValue(v3, CFSTR("DataDownloaded"), v141);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v142, self->_relayed, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  if (v145)
    CFDictionarySetValue(v3, CFSTR("IsRelayed"), v145);

  v146 = (void *)MEMORY[0x24BDD16E0];
  v151 = objc_msgSend_metadataFinalized(self, v147, v148, v149, v150);
  objc_msgSend_numberWithBool_(v146, v152, v151, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (v155)
    CFDictionarySetValue(v3, CFSTR("MetadataFinalized"), v155);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v156, self->_hasReceivedFirstFrame, v157, v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (v159)
    CFDictionarySetValue(v3, CFSTR("HasReceivedFirstFrame"), v159);

  objc_msgSend_dateConnected(self, v160, v161, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v164, v165, v166, v167, v168);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v169, v170, v171, v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  if (v173)
    CFDictionarySetValue(v3, CFSTR("DateConnected"), v173);

  objc_msgSend_dateEnded(self, v174, v175, v176, v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v178, v179, v180, v181, v182);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v183, v184, v185, v186);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (v187)
    CFDictionarySetValue(v3, CFSTR("DateEnded"), v187);

  objc_msgSend_remoteParticipants(self, v188, v189, v190, v191);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  v194 = v192;
  v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v210, (uint64_t)v214, 16);
  if (v196)
  {
    v200 = v196;
    v209 = v164;
    v201 = 0;
    v202 = *(_QWORD *)v211;
    do
    {
      v203 = 0;
      v204 = v201;
      do
      {
        if (*(_QWORD *)v211 != v202)
          objc_enumerationMutation(v194);
        objc_msgSend__proxyRepresentationForIMAVChatParticipant_(self, v197, *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * v203), v198, v199);
        v201 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v193, v205, (uint64_t)v201, v206, v207);
        ++v203;
        v204 = v201;
      }
      while (v200 != v203);
      v200 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v197, (uint64_t)&v210, (uint64_t)v214, 16);
    }
    while (v200);

    v164 = v209;
  }

  if (v193)
    CFDictionarySetValue(v3, CFSTR("RemoteParticipants"), v193);

  return v3;
}

- (void)setMetadataFinalized
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  objc_msgSend__setMetadataFinalized_(self, a2, 1, v2, v3);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v5, v6, v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v11, v9, (uint64_t)CFSTR("__kIMAVChatConferenceMetadataUpdatedNotification"), (uint64_t)self, v10);

}

- (void)_submitCallStartedLoggingWithRecipientID:(id)a3 isCaller:(BOOL)a4 isVideo:(BOOL)a5
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a4;
  IMStringIsEmail();
  if (v5)
    FTAWDSetSubmissionDate();
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v6, v7, v8, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_isScreenLocked(v14, v10, v11, v12, v13);
  FTAWDLogCallStarted();

}

- (void)_submitCallConnectedLogging
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;

  objc_msgSend_isCaller(self, a2, v2, v3, v4);
  objc_msgSend_isVideo(self, v6, v7, v8, v9);
  objc_msgSend__connectDuration(self, v10, v11, v12, v13);
  v75 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__remoteNetworkConnectionType(self, v14, v15, v16, v17);
  objc_msgSend__localNetworkConnectionType(self, v18, v19, v20, v21);
  v26 = objc_msgSend__connectionType(self, v22, v23, v24, v25);
  sub_21902271C(v26);
  objc_msgSend__usesRelay(self, v27, v28, v29, v30);
  objc_msgSend__natType(self, v31, v32, v33, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    objc_msgSend__currentNatType(self, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend__remoteNatType(self, v35, v36, v37, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_unsignedIntValue(v39, v41, v42, v43, v44);
  v46 = sub_2190227C8(v45);
  v51 = objc_msgSend_unsignedIntValue(v40, v47, v48, v49, v50);
  v52 = sub_2190227C8(v51);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v53, v46, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v57, v52, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__relayConnectDuration(self, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_isScreenLocked(v70, v71, v72, v73, v74);
  FTAWDLogCallConnected();

}

- (void)_submitCallInterruptionBeganLogging
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;

  objc_msgSend_isCaller(self, a2, v2, v3, v4);
  objc_msgSend_isVideo(self, v6, v7, v8, v9);
  objc_msgSend__isVideoInterrupted(self, v10, v11, v12, v13);
  objc_msgSend__isAudioInterrupted(self, v14, v15, v16, v17);
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_sharedInstance(MEMORY[0x24BE50398], v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__localNetworkConnectionType(self, v24, v25, v26, v27) == 1)
    v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 3, v29, v30);
  else
    v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 2, v29, v30);
  objc_msgSend_numberWithInt_(v18, v32, v31, v33, v34);
  v53 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__interruptionBegan(self, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setInterruptionBegan_(self, v45, (uint64_t)v44, v46, v47);

  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v40, v41, v42, v43);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_isScreenLocked(v48, v49, v50, v51, v52);
  FTAWDLogCallInterruptionBegan();

}

- (void)_submitCallInterruptionEndedLogging
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  double v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_isCaller(self, a2, v2, v3, v4);
  objc_msgSend_isVideo(self, v6, v7, v8, v9);
  objc_msgSend__isVideoInterrupted(self, v10, v11, v12, v13);
  objc_msgSend__isAudioInterrupted(self, v14, v15, v16, v17);
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_sharedInstance(MEMORY[0x24BE50398], v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__localNetworkConnectionType(self, v24, v25, v26, v27) == 1)
    v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 3, v29, v30);
  else
    v31 = objc_msgSend_linkQualityValueForInterfaceType_(v23, v28, 2, v29, v30);
  objc_msgSend_numberWithInt_(v18, v32, v31, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_date(MEMORY[0x24BDBCE60], v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__interruptionBegan(self, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v40, v46, (uint64_t)v45, v47, v48);
  v50 = v49;

  sub_2190076D0();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__interruptionBegan(self, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(MEMORY[0x24BDBCE60], v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 138412802;
    v79 = v56;
    v80 = 2112;
    v81 = v61;
    v82 = 2048;
    v83 = v50;
    _os_log_impl(&dword_218FEA000, v51, OS_LOG_TYPE_DEFAULT, "Interruption start date %@ end date %@ interval %f", (uint8_t *)&v78, 0x20u);

  }
  objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v62, (unint64_t)(v50 * 1000.0), v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_isScreenLocked(v70, v71, v72, v73, v74);
  FTAWDLogCallInterruptionEnded();

  objc_msgSend__setInterruptionBegan_(self, v75, 0, v76, v77);
}

- (void)__sendEndCallMetricToViceroyWithReason:(unsigned int)a3 andError:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t isCaller;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t isVideo;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t valid;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _BOOL8 v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  __CFDictionary *v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  id v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  id v238;
  id v239;
  id v240;
  id v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  int v268;
  void *v269;
  id v270;
  id v271;
  void *value;
  void *valuea;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;

  v5 = *(_QWORD *)&a4;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v8, v5, v9, v10);
  v268 = v5;
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_25503B970
    || ((v15 = (void **)MEMORY[0x219A282F8]("GKSErrorDetailedError", CFSTR("AVConference"))) == 0
      ? (v16 = 0)
      : (v16 = *v15),
        objc_storeStrong((id *)&qword_25503B970, v16),
        qword_25503B970))
  {
    objc_msgSend_userInfo(self->_error, v11, v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v17, v18, qword_25503B970, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_intValue(v21, v22, v23, v24, v25);

  }
  else
  {
    v26 = 0xFFFFFFFFLL;
  }
  if (qword_25503B978
    || ((v27 = (void **)MEMORY[0x219A282F8]("GKSErrorReturnCode", CFSTR("AVConference"))) == 0
      ? (v28 = 0)
      : (v28 = *v27),
        objc_storeStrong((id *)&qword_25503B978, v28),
        qword_25503B978))
  {
    objc_msgSend_userInfo(self->_error, v11, v12, v13, v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v29, v30, qword_25503B978, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_intValue(v33, v34, v35, v36, v37);

  }
  else
  {
    v38 = 0xFFFFFFFFLL;
  }
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v11, v26, v13, v14);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v40, v38, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__natType(self, v44, v45, v46, v47);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    objc_msgSend__currentNatType(self, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend__remoteNatType(self, v48, v49, v50, v51);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_otherIMHandle(self, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ID(v58, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend__FZBestGuessFZIDType(v63, v64, v65, v66, v67);
  objc_msgSend_numberWithInteger_(v53, v69, v68, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = (void *)MEMORY[0x24BDD16E0];
  isCaller = objc_msgSend_isCaller(self, v74, v75, v76, v77);
  objc_msgSend_numberWithInt_(v73, v79, isCaller, v80, v81);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)MEMORY[0x24BDD16E0];
  isVideo = objc_msgSend_isVideo(self, v83, v84, v85, v86);
  objc_msgSend_numberWithBool_(v82, v88, isVideo, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v92, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)MEMORY[0x24BDD16E0];
  valid = objc_msgSend_validNetworkEnabled(v96, v98, v99, v100, v101);
  objc_msgSend_numberWithInt_(v97, v103, valid, v104, v105);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)MEMORY[0x24BDD16E0];
  v111 = objc_msgSend_validNetworkActive(v96, v107, v108, v109, v110);
  objc_msgSend_numberWithInt_(v106, v112, v111, v113, v114);
  value = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)MEMORY[0x24BDD16E0];
  v267 = v96;
  v120 = objc_msgSend_validNetworkReachable(v96, v116, v117, v118, v119);
  objc_msgSend_numberWithInt_(v115, v121, v120, v122, v123);
  v270 = (id)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend__remoteNetworkConnectionType(self, v124, v125, v126, v127);
  v133 = objc_msgSend__localNetworkConnectionType(self, v129, v130, v131, v132) == 1;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v134, v133, v135, v136);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v137, v128 == 1, v138, v139);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = (void *)MEMORY[0x24BDD16E0];
  v145 = objc_msgSend__usesRelay(self, v141, v142, v143, v144);
  objc_msgSend_numberWithInt_(v140, v146, v145, v147, v148);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = (void *)MEMORY[0x24BDD16E0];
  v154 = objc_msgSend__connectionType(self, v150, v151, v152, v153);
  objc_msgSend_numberWithInt_(v149, v155, v154, v156, v157);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__relayConnectDuration(self, v158, v159, v160, v161);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__connectDuration(self, v162, v163, v164, v165);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRate(self, v166, v167, v168, v169);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v171 = v7;
  v278 = v171;
  if (v171)
  {
    CFDictionarySetValue(v170, CFSTR("end-reason"), v171);
    v171 = v278;
  }

  v172 = v276;
  if (v172)
    CFDictionarySetValue(v170, CFSTR("end-error"), v172);

  v173 = v39;
  if (v173)
    CFDictionarySetValue(v170, CFSTR("gks-error"), v173);

  v174 = v43;
  if (v174)
    CFDictionarySetValue(v170, CFSTR("gks-return-code"), v174);

  v175 = v91;
  if (v175)
    CFDictionarySetValue(v170, CFSTR("video"), v175);

  v176 = v52;
  if (v176)
    CFDictionarySetValue(v170, CFSTR("nat-type"), v176);

  v177 = v257;
  v277 = v177;
  if (v177)
  {
    CFDictionarySetValue(v170, CFSTR("remote-nat-type"), v177);
    v177 = v277;
  }

  v178 = v72;
  if (v178)
    CFDictionarySetValue(v170, CFSTR("remote-type"), v178);

  v179 = v274;
  v275 = v179;
  if (v179)
  {
    CFDictionarySetValue(v170, CFSTR("outgoing"), v179);
    v179 = v275;
  }

  v180 = v251;
  if (v180)
    CFDictionarySetValue(v170, CFSTR("network"), v180);

  v181 = value;
  valuea = v181;
  if (v181)
  {
    CFDictionarySetValue(v170, CFSTR("active"), v181);
    v181 = valuea;
  }

  v182 = v270;
  v271 = v182;
  if (v182)
  {
    CFDictionarySetValue(v170, CFSTR("reachable"), v182);
    v182 = v271;
  }
  v258 = v176;

  v183 = v253;
  if (v183)
    CFDictionarySetValue(v170, CFSTR("local-cell"), v183);
  v252 = v183;
  v254 = v180;

  v184 = v255;
  if (v184)
    CFDictionarySetValue(v170, CFSTR("remote-cell"), v184);
  v256 = v178;

  v185 = v261;
  if (v185)
    CFDictionarySetValue(v170, CFSTR("relay"), v185);
  v262 = v174;

  v186 = v265;
  if (v186)
    CFDictionarySetValue(v170, CFSTR("connection-type"), v186);
  v266 = v172;

  v187 = v259;
  if (v187)
    CFDictionarySetValue(v170, CFSTR("relay-connect-time"), v187);
  v260 = v175;

  v188 = v263;
  if (v188)
    CFDictionarySetValue(v170, CFSTR("connect-time"), v188);

  objc_msgSend__callDuration(self, v189, v190, v191, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  if (v193)
    CFDictionarySetValue(v170, CFSTR("duration"), v193);

  objc_msgSend__frontCameraCaptureTime(self, v194, v195, v196, v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  if (v198)
    CFDictionarySetValue(v170, CFSTR("frontCapture-time"), v198);

  objc_msgSend__backCameraCaptureTime(self, v199, v200, v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  if (v203)
    CFDictionarySetValue(v170, CFSTR("backCapture-time"), v203);
  v264 = v173;

  v204 = v249;
  if (v204)
    CFDictionarySetValue(v170, CFSTR("sessionBitRate"), v204);

  v205 = (void *)MEMORY[0x24BDD16E0];
  v210 = objc_msgSend__networkCheckResult(self, v206, v207, v208, v209);
  objc_msgSend_numberWithInteger_(v205, v211, v210, v212, v213);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  if (v214)
    CFDictionarySetValue(v170, CFSTR("network-check"), v214);

  if (v268 == 32001)
  {
    v219 = objc_msgSend__pingTestResult(self, v215, v216, v217, v218);
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v220, v219, v221, v222);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    if (v223)
      CFDictionarySetValue(v170, CFSTR("ping-test"), v223);

    if (!v219)
    {
      objc_msgSend__pingTestResults(self, v215, v216, v217, v218);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v224, v225, (uint64_t)CFSTR("AVPingTestMin"), v226, v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v224, v229, (uint64_t)CFSTR("AVPingTestAvg"), v230, v231);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v224, v232, (uint64_t)CFSTR("AVPingTestMax"), v233, v234);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = v224;
      objc_msgSend_objectForKey_(v224, v235, (uint64_t)CFSTR("AVPingTestPacketLoss"), v236, v237);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = v228;
      if (v238)
        CFDictionarySetValue(v170, CFSTR("ping-min"), v238);
      v250 = v238;

      v239 = v246;
      if (v239)
        CFDictionarySetValue(v170, CFSTR("ping-max"), v239);
      v247 = v239;

      v240 = v245;
      if (v240)
        CFDictionarySetValue(v170, CFSTR("ping-avg"), v240);

      v241 = v248;
      if (v241)
        CFDictionarySetValue(v170, CFSTR("ping-packetLoss"), v241);

    }
  }
  objc_msgSend_sharedInstance(IMAVInterface, v215, v216, v217, v218);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__submitLoggingInformation_forChat_(v242, v243, (uint64_t)v170, (uint64_t)self, v244);

}

- (void)__sendEndCallMetricToAWDWithReason:(unsigned int)a3 andError:(int)a4
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  unsigned __int8 isAudioInterrupted;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  int isInternalInstall;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  unint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  void *v267;
  void *v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  void *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  char isVideoInterrupted;
  char v279;
  int v280;
  char v281;
  char v282;
  char valid;
  int v284;
  unsigned int v285;
  unsigned int v286;
  unsigned int v287;
  unsigned int v288;
  unsigned int v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  uint8_t buf[16];

  sub_219022884(*(uint64_t *)&a3);
  sub_219022948(a4);
  sub_21902295C(a4);
  sub_219022978(a4);
  v6 = sub_21902298C(a4);
  v7 = sub_219022A74(a4);
  v8 = sub_219022A90(a4);
  v9 = sub_219022AAC(a4);
  sub_219022930(a4);
  v289 = v6;
  v288 = v8;
  v287 = v9;
  if (qword_25503B980
    || ((v14 = (void **)MEMORY[0x219A282F8]("GKSErrorDetailedError", CFSTR("AVConference"))) == 0
      ? (v15 = 0)
      : (v15 = *v14),
        objc_storeStrong((id *)&qword_25503B980, v15),
        qword_25503B980))
  {
    objc_msgSend_userInfo(self->_error, v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v16, v17, qword_25503B980, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_intValue(v20, v21, v22, v23, v24);

    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v26, v25, v27, v28);
  }
  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v10, 0xFFFFFFFFLL, v12, v13);
  }
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_25503B988
    || ((v33 = (void **)MEMORY[0x219A282F8]("GKSErrorReturnCode", CFSTR("AVConference"))) == 0
      ? (v34 = 0)
      : (v34 = *v33),
        objc_storeStrong((id *)&qword_25503B988, v34),
        qword_25503B988))
  {
    objc_msgSend_userInfo(self->_error, v29, v30, v31, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v35, v36, qword_25503B988, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_intValue(v39, v40, v41, v42, v43);

    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v45, v44, v46, v47);
  }
  else
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v29, 0xFFFFFFFFLL, v31, v32);
  }
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v286 = objc_msgSend__remoteNetworkConnectionType(self, v48, v49, v50, v51);
  v285 = objc_msgSend__localNetworkConnectionType(self, v52, v53, v54, v55);
  objc_msgSend__natType(self, v56, v57, v58, v59);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v64)
  {
    objc_msgSend__currentNatType(self, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend__remoteNatType(self, v60, v61, v62, v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__callDuration(self, v66, v67, v68, v69);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__frontCameraCaptureTime(self, v70, v71, v72, v73);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__backCameraCaptureTime(self, v74, v75, v76, v77);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRate(self, v78, v79, v80, v81);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend_unsignedIntValue(v64, v82, v83, v84, v85);
  v87 = sub_2190227C8(v86);
  v92 = objc_msgSend_unsignedIntValue(v65, v88, v89, v90, v91);
  v93 = sub_2190227C8(v92);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v94, v87, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v98, v93, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = objc_msgSend__pingTestResult(self, v102, v103, v104, v105);
  if (v106)
  {
    if (v106 >= 1)
    {
      sub_2190076D0();
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v111, OS_LOG_TYPE_DEFAULT, "[WARN] Ping test failed", buf, 2u);
      }

    }
    v276 = 0;
    v112 = 0;
    v292 = 0;
    v293 = 0;
  }
  else
  {
    objc_msgSend__pingTestResults(self, v107, v108, v109, v110);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v113, v114, (uint64_t)CFSTR("AVPingTestMin"), v115, v116);
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v113, v117, (uint64_t)CFSTR("AVPingTestAvg"), v118, v119);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v113, v120, (uint64_t)CFSTR("AVPingTestMax"), v121, v122);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v113, v123, (uint64_t)CFSTR("AVPingTestPacketLoss"), v124, v125);
    v292 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v126 = objc_msgSend__networkCheckResult(self, v107, v108, v109, v110);
  v284 = sub_219022AD4(v126);
  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v127, v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  valid = objc_msgSend_validNetworkEnabled(v131, v132, v133, v134, v135);

  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v136, v137, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v282 = objc_msgSend_validNetworkActive(v140, v141, v142, v143, v144);

  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v145, v146, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = objc_msgSend_validNetworkReachable(v149, v150, v151, v152, v153);

  objc_msgSend__connectDuration(self, v154, v155, v156, v157);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend__connectionType(self, v158, v159, v160, v161);
  v280 = sub_21902271C(v162);
  v279 = objc_msgSend__usesRelay(self, v163, v164, v165, v166);
  objc_msgSend__relayConnectDuration(self, v167, v168, v169, v170);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_isCaller(self, v171, v172, v173, v174);
  objc_msgSend_isVideo(self, v175, v176, v177, v178);
  isVideoInterrupted = objc_msgSend__isVideoInterrupted(self, v179, v180, v181, v182);
  isAudioInterrupted = objc_msgSend__isAudioInterrupted(self, v183, v184, v185, v186);
  v192 = objc_msgSend__localNetworkConnectionType(self, v188, v189, v190, v191);
  if (v192)
  {
    if (v192 == 2)
      v197 = 2;
    else
      v197 = 3;
    objc_msgSend_sharedInstance(MEMORY[0x24BE50398], v193, v194, v195, v196);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend_linkQualityValueForInterfaceType_(v198, v199, v197, v200, v201);

  }
  else
  {
    v202 = 0;
  }
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v193, v202, v195, v196);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = objc_msgSend__bustedCallID(self, v204, v205, v206, v207);
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v208, v209, v210, v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v273) = objc_msgSend_isScreenLocked(v212, v213, v214, v215, v216);
  v271 = v203;
  v272 = v298;
  BYTE2(v269) = 0;
  BYTE1(v269) = isAudioInterrupted;
  LOBYTE(v269) = isVideoInterrupted;
  v267 = v101;
  v268 = v290;
  v266 = v97;
  BYTE4(v264) = v279;
  LODWORD(v264) = v280;
  v263 = __PAIR64__(v285, v286);
  v262 = v291;
  v261 = v299;
  v260 = v294;
  v259 = v295;
  v258 = v296;
  HIDWORD(v256) = v284;
  BYTE2(v256) = v281;
  BYTE1(v256) = v282;
  LOBYTE(v256) = valid;
  v255 = v292;
  v253 = v112;
  v254 = v293;
  v252 = v276;
  v251 = v297;
  v250 = __PAIR64__(v287, v288);
  v249 = __PAIR64__(v7, v289);
  FTAWDLogCallEnded();

  if (IsIMAVChatEndedReasonACallFailure(a3))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v217, v218, v219, v220, __PAIR64__(v7, v289), __PAIR64__(v287, v288), v297, v276, v112, v293, v292, v256, v296, v295, v294, v299, v291, __PAIR64__(v285, v286),
      v264,
      v97,
      v101,
      v290,
      v269,
      v203,
      v298,
      v273);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v273) = objc_msgSend_isScreenLocked(v221, v222, v223, v224, v225);
    v271 = v203;
    v272 = v298;
    BYTE2(v269) = 0;
    BYTE1(v269) = isAudioInterrupted;
    LOBYTE(v269) = isVideoInterrupted;
    v267 = v101;
    v268 = v290;
    v266 = v97;
    BYTE4(v264) = v279;
    LODWORD(v264) = v280;
    v263 = __PAIR64__(v285, v286);
    v262 = v291;
    v261 = v299;
    v260 = v294;
    v259 = v295;
    v258 = v296;
    HIDWORD(v256) = v284;
    BYTE2(v256) = v281;
    BYTE1(v256) = v282;
    LOBYTE(v256) = valid;
    v255 = v292;
    v253 = v112;
    v254 = v293;
    v252 = v276;
    v251 = v297;
    v250 = __PAIR64__(v287, v288);
    v249 = __PAIR64__(v7, v289);
    FTAWDLogCallFailed();

  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE50318], v217, v218, v219, v220, v249, v250, v251, v252, v253, v254, v255, v256, v258, v259, v260, v261, v262, v263,
    v264,
    v266,
    v267,
    v268,
    v269,
    v271,
    v272,
    v273);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v226, v227, v228, v229, v230);

  if (isInternalInstall)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v232, v233, v234, v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v274) = objc_msgSend_isScreenLocked(v236, v237, v238, v239, v240);
    *(_WORD *)((char *)&v270 + 1) = isAudioInterrupted;
    LOBYTE(v270) = isVideoInterrupted;
    BYTE4(v265) = v279;
    LODWORD(v265) = v280;
    HIDWORD(v257) = v284;
    BYTE2(v257) = v281;
    BYTE1(v257) = v282;
    LOBYTE(v257) = valid;
    FTAWDLogCallEndedViceroy();
    v241 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedInstance(IMAVInterface, v242, v243, v244, v245, __PAIR64__(v7, v289), __PAIR64__(v287, v288), v297, v276, v112, v293, v292, v257, v296, v295, v294, v299, v291, __PAIR64__(v285, v286),
      v265,
      v97,
      v101,
      v290,
      v270,
      v203,
      v298,
      v274);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__submitEndCallMetric_forCallID_(v246, v247, (uint64_t)v241, v275, v248);

  }
}

- (void)_submitCallEndedLoggingWithReason:(unsigned int)a3 andError:(int)a4
{
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[5];
  int v10;
  unsigned int v11;

  v7 = dispatch_time(0, 3000000000);
  dispatch_get_global_queue(-32768, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_219024490;
  v9[3] = &unk_24DA57CA8;
  v9[4] = self;
  v10 = a4;
  v11 = a3;
  dispatch_after(v7, v8, v9);

}

@end
