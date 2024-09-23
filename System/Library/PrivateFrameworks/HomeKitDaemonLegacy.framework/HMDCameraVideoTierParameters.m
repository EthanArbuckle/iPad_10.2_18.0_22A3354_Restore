@implementation HMDCameraVideoTierParameters

- (HMDCameraVideoTierParameters)initWithSessionID:(id)a3 streamingCapabilities:(id)a4
{
  id v7;
  id v8;
  HMDCameraVideoTierParameters *v9;
  HMDCameraVideoTierParameters *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraVideoTierParameters;
  v9 = -[HMDCameraVideoTierParameters init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionID, a3);
    -[HMDCameraVideoTierParameters _generateAllVideoTiers:](v10, "_generateAllVideoTiers:", v8);
  }

  return v10;
}

- (void)_generateAllVideoTiers:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  HMDVideoResolution *v7;
  HMDCameraVideoTier *v8;
  HMDVideoResolution *v9;
  HMDCameraVideoTier *v10;
  HMDVideoResolution *v11;
  HMDCameraVideoTier *v12;
  HMDVideoResolution *v13;
  HMDCameraVideoTier *v14;
  HMDVideoResolution *v15;
  HMDCameraVideoTier *v16;
  HMDVideoResolution *v17;
  HMDCameraVideoTier *v18;
  HMDVideoResolution *v19;
  HMDCameraVideoTier *v20;
  HMDCameraVideoTier *v21;
  HMDVideoResolution *v22;
  HMDCameraVideoTier *v23;
  HMDVideoResolution *v24;
  HMDCameraVideoTier *v25;
  HMDVideoResolution *v26;
  HMDCameraVideoTier *v27;
  HMDVideoResolution *v28;
  HMDCameraVideoTier *v29;
  HMDVideoResolution *v30;
  HMDCameraVideoTier *v31;
  HMDVideoResolution *v32;
  HMDCameraVideoTier *v33;
  HMDVideoResolution *v34;
  HMDCameraVideoTier *v35;
  HMDVideoResolution *v36;
  HMDCameraVideoTier *v37;
  HMDVideoResolution *v38;
  HMDCameraVideoTier *v39;
  HMDVideoResolution *v40;
  HMDCameraVideoTier *v41;
  HMDVideoResolution *v42;
  HMDCameraVideoTier *v43;
  HMDVideoResolution *v44;
  HMDCameraVideoTier *v45;
  HMDVideoResolution *v46;
  HMDCameraVideoTier *v47;
  HMDVideoResolution *v48;
  HMDCameraVideoTier *v49;
  HMDVideoResolution *v50;
  HMDCameraVideoTier *v51;
  HMDCameraVideoTier *v52;
  HMDVideoResolution *v53;
  HMDCameraVideoTier *v54;
  HMDVideoResolution *v55;
  HMDCameraVideoTier *v56;
  HMDVideoResolution *v57;
  HMDCameraVideoTier *v58;
  HMDVideoResolution *v59;
  HMDCameraVideoTier *v60;
  HMDCameraVideoTier *v61;
  HMDVideoResolution *v62;
  HMDCameraVideoTier *v63;
  HMDVideoResolution *v64;
  HMDCameraVideoTier *v65;
  HMDVideoResolution *v66;
  HMDCameraVideoTier *v67;
  HMDVideoResolution *v68;
  HMDCameraVideoTier *v69;
  HMDVideoResolution *v70;
  HMDCameraVideoTier *v71;
  HMDVideoResolution *v72;
  HMDCameraVideoTier *v73;
  HMDVideoResolution *v74;
  HMDCameraVideoTier *v75;
  HMDVideoResolution *v76;
  HMDCameraVideoTier *v77;
  void *v78;
  HMDCameraVideoTierParameters *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  NSDictionary *videoTierCombinations;
  NSArray *tierOrder;
  HMDVideoResolution *v85;
  HMDCameraVideoTier *v86;
  HMDVideoResolution *v87;
  HMDCameraVideoTier *v88;
  HMDVideoResolution *v89;
  HMDCameraVideoTier *v90;
  HMDVideoResolution *v91;
  HMDCameraVideoTier *v92;
  HMDVideoResolution *v93;
  HMDCameraVideoTier *v94;
  HMDVideoResolution *v95;
  HMDCameraVideoTier *v96;
  HMDVideoResolution *v97;
  HMDCameraVideoTier *v98;
  HMDVideoResolution *v99;
  HMDCameraVideoTier *v100;
  HMDVideoResolution *v101;
  HMDCameraVideoTier *v102;
  HMDVideoResolution *v103;
  HMDVideoResolution *v104;
  HMDCameraVideoTier *v105;
  HMDCameraVideoTier *v106;
  HMDVideoResolution *v107;
  HMDVideoResolution *v108;
  HMDCameraVideoTier *v109;
  HMDCameraVideoTier *v110;
  HMDVideoResolution *v111;
  HMDVideoResolution *v112;
  HMDCameraVideoTier *v113;
  HMDCameraVideoTier *v114;
  HMDVideoResolution *v115;
  HMDVideoResolution *v116;
  HMDCameraVideoTier *v117;
  HMDCameraVideoTier *v118;
  HMDVideoResolution *v119;
  HMDVideoResolution *v120;
  HMDCameraVideoTier *v121;
  HMDCameraVideoTier *v122;
  HMDVideoResolution *v123;
  HMDVideoResolution *v124;
  HMDCameraVideoTier *v125;
  HMDCameraVideoTier *v126;
  HMDCameraVideoTier *v127;
  HMDCameraVideoTier *v128;
  HMDVideoResolution *v129;
  HMDVideoResolution *v130;
  HMDVideoResolution *v131;
  HMDVideoResolution *v132;
  HMDCameraVideoTier *v133;
  HMDCameraVideoTier *v134;
  HMDCameraVideoTier *v135;
  HMDCameraVideoTier *v136;
  HMDVideoResolution *v137;
  HMDVideoResolution *v138;
  HMDVideoResolution *v139;
  HMDVideoResolution *v140;
  HMDCameraVideoTier *v141;
  HMDCameraVideoTier *v142;
  HMDCameraVideoTier *v143;
  HMDCameraVideoTier *v144;
  HMDVideoResolution *v145;
  HMDVideoResolution *v146;
  HMDVideoResolution *v147;
  HMDCameraVideoTier *v148;
  HMDCameraVideoTier *v149;
  HMDCameraVideoTier *v150;
  HMDCameraVideoTier *v151;
  HMDVideoResolution *v152;
  HMDVideoResolution *v153;
  HMDVideoResolution *v154;
  HMDVideoResolution *v155;
  HMDCameraVideoTier *v156;
  HMDVideoResolution *v157;
  HMDCameraVideoTierParameters *v158;
  id v159;
  uint8_t buf[4];
  void *v161;
  __int16 v162;
  NSArray *v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v158 = self;
  v159 = v4;
  switch(objc_msgSend(v4, "streamingTierType"))
  {
    case 0:
      v7 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 11);
      v8 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v7, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);
      -[NSArray addObject:](v6, "addObject:", v8);
      v9 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 23);
      v10 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v9, &unk_1E8B34AB8, &unk_1E8B34B00, &unk_1E8B34B18, &unk_1E8B36C28);
      v157 = v9;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v9);
      v156 = v10;
      -[NSArray addObject:](v6, "addObject:", v10);
      v11 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 7);
      v12 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v11, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
      -[NSArray addObject:](v6, "addObject:", v12);
      v13 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 1);
      v14 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v13, &unk_1E8B34AB8, &unk_1E8B34B00, &unk_1E8B34B18, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v13);
      -[NSArray addObject:](v6, "addObject:", v14);
      v15 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 27);
      v16 = v8;
      v17 = v7;
      v18 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v15, &unk_1E8B34AB8, &unk_1E8B34B30, &unk_1E8B34B48, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v15);
      -[NSArray addObject:](v6, "addObject:", v18);
      goto LABEL_13;
    case 1:
      v152 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 13);
      v148 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v152, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34B90, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v148, v152);
      -[NSArray addObject:](v6, "addObject:", v148);
      v19 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 12);
      v20 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v19, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34BC0, &unk_1E8B36C28);
      v157 = v19;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v19);
      v156 = v20;
      -[NSArray addObject:](v6, "addObject:", v20);
      v145 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 11);
      v141 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v145, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v141, v145);
      -[NSArray addObject:](v6, "addObject:", v141);
      v137 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 20);
      v133 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v137, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BD8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v133, v137);
      -[NSArray addObject:](v6, "addObject:", v133);
      v129 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 21);
      v125 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v129, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v125, v129);
      -[NSArray addObject:](v6, "addObject:", v125);
      v123 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 22);
      v121 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v123, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34B18, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v121, v123);
      -[NSArray addObject:](v6, "addObject:", v121);
      v119 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 9);
      v117 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v119, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34B90, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v117, v119);
      -[NSArray addObject:](v6, "addObject:", v117);
      v115 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 8);
      v113 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v115, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34BC0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v113, v115);
      -[NSArray addObject:](v6, "addObject:", v113);
      v111 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 7);
      v109 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v111, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v109, v111);
      -[NSArray addObject:](v6, "addObject:", v109);
      v107 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 4);
      v105 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v107, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BD8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v105, v107);
      -[NSArray addObject:](v6, "addObject:", v105);
      v103 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 3);
      v21 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v103, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, v103);
      -[NSArray addObject:](v6, "addObject:", v21);
      v22 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 2);
      v23 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v22, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34B18, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, v22);
      -[NSArray addObject:](v6, "addObject:", v23);
      v24 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 25);
      v25 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v24, &unk_1E8B34B60, &unk_1E8B34C08, &unk_1E8B34C20, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, v24);
      -[NSArray addObject:](v6, "addObject:", v25);
      v26 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 26);
      v27 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v26, &unk_1E8B34B60, &unk_1E8B34C38, &unk_1E8B34C50, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, v26);
      -[NSArray addObject:](v6, "addObject:", v27);

      v15 = v129;
      v13 = v137;

      v18 = v125;
      v17 = v152;

      v14 = v133;
      v12 = v141;

      v16 = v148;
      goto LABEL_10;
    case 2:
      if (_os_feature_enabled_impl())
      {
        v28 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 29);
        v29 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v28, &unk_1E8B34B60, &unk_1E8B34C68, &unk_1E8B34C80, &unk_1E8B36C28);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, v28);
        -[NSArray addObject:](v6, "addObject:", v29);

      }
      v30 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 14);
      v31 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v30, &unk_1E8B34B60, &unk_1E8B34C98, &unk_1E8B34CB0, &unk_1E8B36C28);
      v153 = v30;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, v30);
      v149 = v31;
      -[NSArray addObject:](v6, "addObject:", v31);
      v32 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 13);
      v33 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v32, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BD8, &unk_1E8B36C28);
      v157 = v32;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, v32);
      v156 = v33;
      -[NSArray addObject:](v6, "addObject:", v33);
      v34 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 12);
      v35 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v34, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34BC0, &unk_1E8B36C28);
      v146 = v34;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, v34);
      v142 = v35;
      -[NSArray addObject:](v6, "addObject:", v35);
      v36 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 11);
      v37 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v36, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      v138 = v36;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, v36);
      v134 = v37;
      -[NSArray addObject:](v6, "addObject:", v37);
      v38 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 17);
      v39 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v38, &unk_1E8B34B60, &unk_1E8B34CB0, &unk_1E8B34CC8, &unk_1E8B36C28);
      v130 = v38;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, v38);
      v126 = v39;
      -[NSArray addObject:](v6, "addObject:", v39);
      v40 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 18);
      v41 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v40, &unk_1E8B34B60, &unk_1E8B34B90, &unk_1E8B34CE0, &unk_1E8B36C28);
      v124 = v40;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, v40);
      v122 = v41;
      -[NSArray addObject:](v6, "addObject:", v41);
      v42 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 19);
      v43 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v42, &unk_1E8B34B60, &unk_1E8B34BF0, &unk_1E8B34CF8, &unk_1E8B36C28);
      v120 = v42;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, v42);
      v118 = v43;
      -[NSArray addObject:](v6, "addObject:", v43);
      v44 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 20);
      v45 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v44, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34C98, &unk_1E8B36C28);
      v116 = v44;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, v44);
      v114 = v45;
      -[NSArray addObject:](v6, "addObject:", v45);
      v46 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 21);
      v47 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v46, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34BF0, &unk_1E8B36C28);
      v112 = v46;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, v46);
      v110 = v47;
      -[NSArray addObject:](v6, "addObject:", v47);
      v48 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 22);
      v49 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v48, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34B18, &unk_1E8B36C28);
      v108 = v48;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, v48);
      v106 = v49;
      -[NSArray addObject:](v6, "addObject:", v49);
      if (_os_feature_enabled_impl())
      {
        v50 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 28);
        v51 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v50, &unk_1E8B34B60, &unk_1E8B34C68, &unk_1E8B34C80, &unk_1E8B36C28);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, v50);
        -[NSArray addObject:](v6, "addObject:", v51);

      }
      v104 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 10);
      v102 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v104, &unk_1E8B34B60, &unk_1E8B34C98, &unk_1E8B34CB0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v102, v104);
      -[NSArray addObject:](v6, "addObject:", v102);
      v101 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 9);
      v100 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v101, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BD8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v100, v101);
      -[NSArray addObject:](v6, "addObject:", v100);
      v99 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 8);
      v98 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v99, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34BC0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v98, v99);
      -[NSArray addObject:](v6, "addObject:", v98);
      v97 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 7);
      v96 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v97, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v96, v97);
      -[NSArray addObject:](v6, "addObject:", v96);
      v95 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 15);
      v94 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v95, &unk_1E8B34B60, &unk_1E8B34CB0, &unk_1E8B34CC8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v94, v95);
      -[NSArray addObject:](v6, "addObject:", v94);
      v93 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 16);
      v92 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v93, &unk_1E8B34B60, &unk_1E8B34B90, &unk_1E8B34CE0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v92, v93);
      -[NSArray addObject:](v6, "addObject:", v92);
      v91 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 5);
      v90 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v91, &unk_1E8B34B60, &unk_1E8B34BF0, &unk_1E8B34CF8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v90, v91);
      -[NSArray addObject:](v6, "addObject:", v90);
      v89 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 4);
      v88 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v89, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34C98, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v88, v89);
      -[NSArray addObject:](v6, "addObject:", v88);
      v87 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 3);
      v86 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v87, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v86, v87);
      -[NSArray addObject:](v6, "addObject:", v86);
      v85 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 2);
      v52 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v85, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34B18, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, v85);
      -[NSArray addObject:](v6, "addObject:", v52);
      v53 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 24);
      v54 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v53, &unk_1E8B34B60, &unk_1E8B34D10, &unk_1E8B34D28, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, v53);
      -[NSArray addObject:](v6, "addObject:", v54);
      v55 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 25);
      v56 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v55, &unk_1E8B34B60, &unk_1E8B34C08, &unk_1E8B34C20, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, v55);
      -[NSArray addObject:](v6, "addObject:", v56);
      v57 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 26);
      v58 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v57, &unk_1E8B34B60, &unk_1E8B34C38, &unk_1E8B34C50, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, v57);
      -[NSArray addObject:](v6, "addObject:", v58);

      v16 = v149;
      v17 = v153;
      v12 = v142;
      v11 = v146;
      v14 = v134;
      v13 = v138;
      v18 = v126;
      v15 = v130;
      goto LABEL_13;
    case 3:
      v154 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 13);
      v150 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v154, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v150, v154);
      -[NSArray addObject:](v6, "addObject:", v150);
      v59 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 12);
      v60 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v59, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34BC0, &unk_1E8B36C28);
      v157 = v59;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, v59);
      v156 = v60;
      -[NSArray addObject:](v6, "addObject:", v60);
      v145 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 11);
      v143 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v145, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v143, v145);
      -[NSArray addObject:](v6, "addObject:", v143);
      v139 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 20);
      v135 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v139, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v135, v139);
      -[NSArray addObject:](v6, "addObject:", v135);
      v131 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 21);
      v127 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v131, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34BC0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v127, v131);
      -[NSArray addObject:](v6, "addObject:", v127);
      v123 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 22);
      v121 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v123, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34D40, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v121, v123);
      -[NSArray addObject:](v6, "addObject:", v121);
      v119 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 9);
      v117 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v119, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v117, v119);
      -[NSArray addObject:](v6, "addObject:", v117);
      v115 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 8);
      v113 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v115, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34BC0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v113, v115);
      -[NSArray addObject:](v6, "addObject:", v113);
      v111 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 7);
      v109 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v111, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v109, v111);
      -[NSArray addObject:](v6, "addObject:", v109);
      v107 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 4);
      v105 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v107, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v105, v107);
      -[NSArray addObject:](v6, "addObject:", v105);
      v103 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 3);
      v61 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v103, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34BC0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, v103);
      -[NSArray addObject:](v6, "addObject:", v61);
      v62 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 2);
      v63 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v62, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34D40, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, v62);
      -[NSArray addObject:](v6, "addObject:", v63);
      v64 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 25);
      v65 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v64, &unk_1E8B34B60, &unk_1E8B34C08, &unk_1E8B34C20, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, v64);
      -[NSArray addObject:](v6, "addObject:", v65);
      v66 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 26);
      v67 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v66, &unk_1E8B34B60, &unk_1E8B34C38, &unk_1E8B34C50, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, v66);
      -[NSArray addObject:](v6, "addObject:", v67);

      v16 = v150;
      v13 = v139;

      v18 = v127;
      v17 = v154;

      v14 = v135;
      v12 = v143;

      v15 = v131;
LABEL_10:

      v11 = v145;
      goto LABEL_12;
    case 4:
      v155 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 13);
      v151 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v155, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v151, v155);
      -[NSArray addObject:](v6, "addObject:", v151);
      v68 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 12);
      v69 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v68, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34B18, &unk_1E8B36C28);
      v157 = v68;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, v68);
      v156 = v69;
      -[NSArray addObject:](v6, "addObject:", v69);
      v147 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 11);
      v144 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v147, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v144, v147);
      -[NSArray addObject:](v6, "addObject:", v144);
      v140 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 20);
      v136 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v140, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v136, v140);
      -[NSArray addObject:](v6, "addObject:", v136);
      v132 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 21);
      v128 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v132, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34B18, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v128, v132);
      -[NSArray addObject:](v6, "addObject:", v128);
      v123 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 22);
      v121 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v123, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34D40, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v121, v123);
      -[NSArray addObject:](v6, "addObject:", v121);
      v119 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 9);
      v117 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v119, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v117, v119);
      -[NSArray addObject:](v6, "addObject:", v117);
      v115 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 8);
      v113 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v115, &unk_1E8B34B60, &unk_1E8B34BA8, &unk_1E8B34B18, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v113, v115);
      -[NSArray addObject:](v6, "addObject:", v113);
      v111 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 7);
      v109 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v111, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34AE8, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v109, v111);
      -[NSArray addObject:](v6, "addObject:", v109);
      v70 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 4);
      v71 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v70, &unk_1E8B34B60, &unk_1E8B34B78, &unk_1E8B34BF0, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v71, v70);
      -[NSArray addObject:](v6, "addObject:", v71);
      v72 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 3);
      v73 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v72, &unk_1E8B34B60, &unk_1E8B34AE8, &unk_1E8B34B18, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, v72);
      -[NSArray addObject:](v6, "addObject:", v73);
      v74 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 2);
      v75 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v74, &unk_1E8B34AB8, &unk_1E8B34AD0, &unk_1E8B34D40, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v75, v74);
      -[NSArray addObject:](v6, "addObject:", v75);
      v76 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 26);
      v77 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:]([HMDCameraVideoTier alloc], "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v76, &unk_1E8B34B60, &unk_1E8B34C38, &unk_1E8B34C50, &unk_1E8B36C28);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v77, v76);
      -[NSArray addObject:](v6, "addObject:", v77);

      v16 = v151;
      v13 = v140;

      v15 = v132;
      v17 = v155;

      v14 = v136;
      v12 = v144;

      v18 = v128;
      v11 = v147;
LABEL_12:

LABEL_13:
      self = v158;
      v4 = v159;
      break;
    default:
      break;
  }
  v78 = (void *)MEMORY[0x1D17BA0A0]();
  v79 = self;
  HMFGetOSLogHandle();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v161 = v81;
    v162 = 2112;
    v163 = v6;
    _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_INFO, "%{public}@Adding video tiers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v78);
  v82 = objc_msgSend(v5, "copy");
  videoTierCombinations = v79->_videoTierCombinations;
  v79->_videoTierCombinations = (NSDictionary *)v82;

  tierOrder = v79->_tierOrder;
  v79->_tierOrder = v6;

}

- (void)updateTierOrder:(id)a3
{
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraVideoTierParameters *v19;
  NSObject *v20;
  void *v21;
  HMDCameraVideoTierParameters *v22;
  id obj;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = self;
  -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v6 = v26;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v29 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v11, "videoResolution");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "videoResolution");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "isEqual:", v13);

              if (v14)
              {
                objc_msgSend(v11, "framerate");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "framerate");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v15 < v16)
                {
                  objc_msgSend(v11, "framerate");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setFramerate:", v17);

                }
                objc_msgSend(v24, "addObject:", v5);
                goto LABEL_18;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            if (v8)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v27);
  }

  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = v22;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v21;
    v38 = 2112;
    v39 = v24;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating the tier order from video attributes to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDCameraVideoTierParameters setTierOrder:](v19, "setTierOrder:", v24);

}

- (void)updateTierParameters:(id)a3 firstPickedParameter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraVideoTierParameters *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCameraVideoTierParameters *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tierOrder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating the tier order from selected parameters to %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "tierOrder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoTierParameters setTierOrder:](v9, "setTierOrder:", v13);

  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = v9;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v17;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating the first picked tier to %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDCameraVideoTierParameters setFirstPickedTier:](v15, "setFirstPickedTier:", v7);
  -[HMDCameraVideoTierParameters setCurrentPickedTier:](v15, "setCurrentPickedTier:", v7);

}

- (void)updateFirstPickedTier:(id)a3
{
  id v4;
  void *v5;
  HMDCameraVideoTierParameters *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HMDCameraVideoTierParameters *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating the first picked tier to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraVideoTierParameters setFirstPickedTier:](v6, "setFirstPickedTier:", v4);
  -[HMDCameraVideoTierParameters setCurrentPickedTier:](v6, "setCurrentPickedTier:", v4);
  -[HMDCameraVideoTierParameters tierOrder](v6, "tierOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__HMDCameraVideoTierParameters_updateFirstPickedTier___block_invoke;
  v16[3] = &unk_1E89BAEB0;
  v10 = v4;
  v17 = v10;
  objc_msgSend(v9, "na_filter:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = v6;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating the tier order (after updating the first tier) to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDCameraVideoTierParameters setTierOrder:](v13, "setTierOrder:", v11);

}

- (BOOL)pickLowerTier
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  HMDCameraVideoTierParameters *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDCameraVideoTierParameters *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDCameraVideoTierParameters currentPickedTier](self, "currentPickedTier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Already in the lowest tier", (uint8_t *)&v20, 0xCu);

    }
  }
  else
  {
    -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraVideoTierParameters currentPickedTier](self, "currentPickedTier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:", v12);

    -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v13 + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraVideoTierParameters setCurrentPickedTier:](self, "setCurrentPickedTier:", v15);

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoTierParameters currentPickedTier](v16, "currentPickedTier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v18;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting a lower current picked tier to %{public}@", (uint8_t *)&v20, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v7);
  return v6 ^ 1;
}

- (BOOL)pickHigherTier
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  HMDCameraVideoTierParameters *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDCameraVideoTierParameters *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDCameraVideoTierParameters currentPickedTier](self, "currentPickedTier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Already in the highest tier", (uint8_t *)&v20, 0xCu);

    }
  }
  else
  {
    -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraVideoTierParameters currentPickedTier](self, "currentPickedTier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:", v12);

    -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v13 - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraVideoTierParameters setCurrentPickedTier:](self, "setCurrentPickedTier:", v15);

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoTierParameters currentPickedTier](v16, "currentPickedTier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v18;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting a higher current picked tier to %{public}@", (uint8_t *)&v20, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v7);
  return v6 ^ 1;
}

- (HMDCameraVideoTierParameters)initWithCoder:(id)a3
{
  id v4;
  HMDCameraVideoTierParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *tierOrder;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraVideoTierParameters;
  v5 = -[HMDCameraVideoTierParameters init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kVideoTierOrder"));
    v9 = objc_claimAutoreleasedReturnValue();
    tierOrder = v5->_tierOrder;
    v5->_tierOrder = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCameraVideoTierParameters tierOrder](self, "tierOrder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoTierOrder"));

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraVideoTierParameters sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)videoTierCombinations
{
  return self->_videoTierCombinations;
}

- (NSArray)tierOrder
{
  return self->_tierOrder;
}

- (void)setTierOrder:(id)a3
{
  objc_storeStrong((id *)&self->_tierOrder, a3);
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDCameraVideoTier)firstPickedTier
{
  return self->_firstPickedTier;
}

- (void)setFirstPickedTier:(id)a3
{
  objc_storeStrong((id *)&self->_firstPickedTier, a3);
}

- (HMDCameraVideoTier)currentPickedTier
{
  return self->_currentPickedTier;
}

- (void)setCurrentPickedTier:(id)a3
{
  objc_storeStrong((id *)&self->_currentPickedTier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPickedTier, 0);
  objc_storeStrong((id *)&self->_firstPickedTier, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_tierOrder, 0);
  objc_storeStrong((id *)&self->_videoTierCombinations, 0);
}

BOOL __54__HMDCameraVideoTierParameters_updateFirstPickedTier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "videoResolution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[HMDStreamingCapabilities aspectRatioOfResolution:](HMDStreamingCapabilities, "aspectRatioOfResolution:", v3);
  objc_msgSend(*(id *)(a1 + 32), "videoResolution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 == +[HMDStreamingCapabilities aspectRatioOfResolution:](HMDStreamingCapabilities, "aspectRatioOfResolution:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_152176 != -1)
    dispatch_once(&logCategory__hmf_once_t10_152176, &__block_literal_global_152177);
  return (id)logCategory__hmf_once_v11_152178;
}

void __43__HMDCameraVideoTierParameters_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_152178;
  logCategory__hmf_once_v11_152178 = v0;

}

@end
