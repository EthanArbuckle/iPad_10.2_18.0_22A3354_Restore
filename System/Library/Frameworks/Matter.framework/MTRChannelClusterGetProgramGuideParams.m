@implementation MTRChannelClusterGetProgramGuideParams

- (MTRChannelClusterGetProgramGuideParams)init
{
  MTRChannelClusterGetProgramGuideParams *v2;
  MTRChannelClusterGetProgramGuideParams *v3;
  NSNumber *startTime;
  NSNumber *endTime;
  NSArray *channelList;
  MTRChannelClusterPageTokenStruct *pageToken;
  NSNumber *recordingFlag;
  NSArray *externalIDList;
  NSData *data;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRChannelClusterGetProgramGuideParams;
  v2 = -[MTRChannelClusterGetProgramGuideParams init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    startTime = v2->_startTime;
    v2->_startTime = 0;

    endTime = v3->_endTime;
    v3->_endTime = 0;

    channelList = v3->_channelList;
    v3->_channelList = 0;

    pageToken = v3->_pageToken;
    v3->_pageToken = 0;

    recordingFlag = v3->_recordingFlag;
    v3->_recordingFlag = 0;

    externalIDList = v3->_externalIDList;
    v3->_externalIDList = 0;

    data = v3->_data;
    v3->_data = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterGetProgramGuideParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v4 = objc_alloc_init(MTRChannelClusterGetProgramGuideParams);
  objc_msgSend_startTime(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v8, (uint64_t)v7);

  objc_msgSend_endTime(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndTime_(v4, v12, (uint64_t)v11);

  objc_msgSend_channelList(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannelList_(v4, v16, (uint64_t)v15);

  objc_msgSend_pageToken(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPageToken_(v4, v20, (uint64_t)v19);

  objc_msgSend_recordingFlag(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordingFlag_(v4, v24, (uint64_t)v23);

  objc_msgSend_externalIDList(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExternalIDList_(v4, v28, (uint64_t)v27);

  objc_msgSend_data(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v32, (uint64_t)v31);

  objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *startTime;
  NSNumber *endTime;
  NSArray *channelList;
  MTRChannelClusterPageTokenStruct *pageToken;
  NSNumber *recordingFlag;
  NSArray *externalIDList;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  endTime = self->_endTime;
  channelList = self->_channelList;
  pageToken = self->_pageToken;
  recordingFlag = self->_recordingFlag;
  externalIDList = self->_externalIDList;
  objc_msgSend_base64EncodedStringWithOptions_(self->_data, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v14, (uint64_t)CFSTR("<%@: startTime:%@; endTime:%@; channelList:%@; pageToken:%@; recordingFlag:%@; externalIDList:%@; data:%@; >"),
    v5,
    startTime,
    endTime,
    channelList,
    pageToken,
    recordingFlag,
    externalIDList,
    v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)channelList
{
  return self->_channelList;
}

- (void)setChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MTRChannelClusterPageTokenStruct)pageToken
{
  return self->_pageToken;
}

- (void)setPageToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)recordingFlag
{
  return self->_recordingFlag;
}

- (void)setRecordingFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)externalIDList
{
  return self->_externalIDList;
}

- (void)setExternalIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_externalIDList, 0);
  objc_storeStrong((id *)&self->_recordingFlag, 0);
  objc_storeStrong((id *)&self->_pageToken, 0);
  objc_storeStrong((id *)&self->_channelList, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t i;
  void *v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  char isKindOfClass;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  ChipError *v113;
  int v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  id v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  id v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  _QWORD *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t j;
  void *v189;
  const char *v190;
  uint64_t v191;
  unint64_t v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  void *v197;
  char v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  id v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  id v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  id v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  unint64_t v238[8];
  void *v239;
  uint64_t v240;
  uint64_t v241;
  char v242;
  uint64_t v243;
  uint64_t *v244;
  _QWORD v245[2];
  char v246[4];
  int v247;
  char v248;
  int v249;
  char v250;
  __int128 v251;
  char v252;
  __int128 v253;
  __int128 v254;
  _QWORD v255[3];
  char v256;
  int v257;
  char v258;
  __int128 v259;
  char v260;
  __int128 v261;
  _BYTE v262[40];

  v246[0] = 0;
  v248 = 0;
  v250 = 0;
  v252 = 0;
  v256 = 0;
  v258 = 0;
  v260 = 0;
  v245[0] = 0;
  v245[1] = 0;
  v244 = v245;
  objc_msgSend_startTime(self, a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v246[0] = 1;
    v247 = 0;
    objc_msgSend_startTime(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v247 = objc_msgSend_unsignedIntValue(v8, v9, v10);

  }
  objc_msgSend_endTime(self, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v248 = 1;
    v249 = 0;
    objc_msgSend_endTime(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = objc_msgSend_unsignedIntValue(v14, v15, v16);

  }
  objc_msgSend_channelList(self, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v250 = 1;
    v251 = 0uLL;
    objc_msgSend_channelList(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_count(v20, v21, v22);

    if (v23)
    {
      v24 = (_QWORD *)operator new();
      objc_msgSend_channelList(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_count(v27, v28, v29);
      sub_233CB0F3C(v24, v30);

      if (v24[1])
      {
        v238[0] = (unint64_t)v24;
        sub_233CAF24C(&v244, v238, (uint64_t *)v238);
        v33 = 0;
        for (i = 105; ; i += 112)
        {
          objc_msgSend_channelList(self, v31, v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend_count(v35, v36, v37);

          if (v33 >= v38)
          {
            v115 = v24[1];
            objc_msgSend_channelList(self, v39, v40);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = objc_msgSend_count(v116, v117, v118);
            sub_233CAF22C(v238, v115, v119);
            v251 = *(_OWORD *)v238;

            goto LABEL_25;
          }
          objc_msgSend_channelList(self, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v41, v42, v33);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            break;
          objc_msgSend_channelList(self, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v47, v48, v33);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_majorNumber(v49, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_WORD *)(v24[1] + i - 105) = objc_msgSend_unsignedShortValue(v52, v53, v54);

          objc_msgSend_minorNumber(v49, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_WORD *)(v24[1] + i - 103) = objc_msgSend_unsignedShortValue(v57, v58, v59);

          objc_msgSend_name(v49, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62)
          {
            v65 = v24[1];
            *(_QWORD *)(v65 + i - 89) = 0;
            v66 = v65 + i - 89;
            *(_BYTE *)(v66 - 8) = 1;
            *(_QWORD *)(v66 + 8) = 0;
            objc_msgSend_name(v49, v63, v64);
            v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v70 = objc_msgSend_UTF8String(v67, v68, v69);
            v72 = objc_msgSend_lengthOfBytesUsingEncoding_(v67, v71, 4);
            sub_233CAF22C(v238, v70, v72);

            *(_OWORD *)v66 = *(_OWORD *)v238;
          }
          objc_msgSend_callSign(v49, v63, v64);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
          {
            v76 = v24[1];
            *(_QWORD *)(v76 + i - 65) = 0;
            v77 = v76 + i - 65;
            *(_BYTE *)(v77 - 8) = 1;
            *(_QWORD *)(v77 + 8) = 0;
            objc_msgSend_callSign(v49, v74, v75);
            v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v81 = objc_msgSend_UTF8String(v78, v79, v80);
            v83 = objc_msgSend_lengthOfBytesUsingEncoding_(v78, v82, 4);
            sub_233CAF22C(v238, v81, v83);

            *(_OWORD *)v77 = *(_OWORD *)v238;
          }
          objc_msgSend_affiliateCallSign(v49, v74, v75);
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          if (v84)
          {
            v87 = v24[1];
            *(_QWORD *)(v87 + i - 41) = 0;
            v88 = v87 + i - 41;
            *(_BYTE *)(v88 - 8) = 1;
            *(_QWORD *)(v88 + 8) = 0;
            objc_msgSend_affiliateCallSign(v49, v85, v86);
            v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v92 = objc_msgSend_UTF8String(v89, v90, v91);
            v94 = objc_msgSend_lengthOfBytesUsingEncoding_(v89, v93, 4);
            sub_233CAF22C(v238, v92, v94);

            *(_OWORD *)v88 = *(_OWORD *)v238;
          }
          objc_msgSend_identifier(v49, v85, v86);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          if (v95)
          {
            v98 = v24[1];
            *(_QWORD *)(v98 + i - 17) = 0;
            v99 = v98 + i - 17;
            *(_BYTE *)(v99 - 8) = 1;
            *(_QWORD *)(v99 + 8) = 0;
            objc_msgSend_identifier(v49, v96, v97);
            v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v103 = objc_msgSend_UTF8String(v100, v101, v102);
            v105 = objc_msgSend_lengthOfBytesUsingEncoding_(v100, v104, 4);
            sub_233CAF22C(v238, v103, v105);

            *(_OWORD *)v99 = *(_OWORD *)v238;
          }
          objc_msgSend_type(v49, v96, v97);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          if (v106)
          {
            v109 = v24[1];
            *(_WORD *)(v109 + i - 1) = 1;
            objc_msgSend_type(v49, v107, v108);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_BYTE *)(v109 + i) = objc_msgSend_unsignedCharValue(v110, v111, v112);

          }
          ++v33;
        }
        v113 = retstr;
        retstr->mError = 47;
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/za"
                        "p-generated/MTRCommandPayloadsObjc.mm";
        v114 = 26063;
      }
      else
      {
        v113 = retstr;
        retstr->mError = 47;
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/za"
                        "p-generated/MTRCommandPayloadsObjc.mm";
        v114 = 26057;
      }
      goto LABEL_57;
    }
    v251 = 0uLL;
  }
LABEL_25:
  objc_msgSend_pageToken(self, v18, v19);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  if (v120)
  {
    v252 = 1;
    v253 = 0u;
    v254 = 0u;
    memset(v255, 0, sizeof(v255));
    objc_msgSend_pageToken(self, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_limit(v123, v124, v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (v126)
    {
      LOBYTE(v253) = 1;
      WORD1(v253) = 0;
      objc_msgSend_pageToken(self, v127, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_limit(v129, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      WORD1(v253) = objc_msgSend_unsignedShortValue(v132, v133, v134);

    }
    objc_msgSend_pageToken(self, v127, v128);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_after(v135, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (v138)
    {
      BYTE8(v253) = 1;
      v254 = 0uLL;
      objc_msgSend_pageToken(self, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_after(v141, v142, v143);
      v144 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v147 = objc_msgSend_UTF8String(v144, v145, v146);
      v149 = objc_msgSend_lengthOfBytesUsingEncoding_(v144, v148, 4);
      sub_233CAF22C(v238, v147, v149);

      v254 = *(_OWORD *)v238;
    }
    objc_msgSend_pageToken(self, v139, v140);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_before(v150, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    if (v153)
    {
      LOBYTE(v255[0]) = 1;
      v255[1] = 0;
      v255[2] = 0;
      objc_msgSend_pageToken(self, v121, v122);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_before(v154, v155, v156);
      v157 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v160 = objc_msgSend_UTF8String(v157, v158, v159);
      v162 = objc_msgSend_lengthOfBytesUsingEncoding_(v157, v161, 4);
      sub_233CAF22C(v238, v160, v162);

      *(_OWORD *)&v255[1] = *(_OWORD *)v238;
    }
  }
  objc_msgSend_recordingFlag(self, v121, v122);
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  if (v163)
  {
    v256 = 1;
    v257 = 0;
    objc_msgSend_recordingFlag(self, v164, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v257 = objc_msgSend_unsignedIntValue(v166, v167, v168);

  }
  objc_msgSend_externalIDList(self, v164, v165);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  if (v169)
  {
    v258 = 1;
    v259 = 0uLL;
    objc_msgSend_externalIDList(self, v170, v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = objc_msgSend_count(v172, v173, v174);

    if (v175)
    {
      v176 = (_QWORD *)operator new();
      objc_msgSend_externalIDList(self, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = objc_msgSend_count(v179, v180, v181);
      *v176 = &off_2504EF5C8;
      v183 = (void *)operator new[]();
      v184 = v183;
      if (v182)
        bzero(v183, 32 * v182);
      v176[1] = v184;

      if (v176[1])
      {
        v238[0] = (unint64_t)v176;
        sub_233CAF24C(&v244, v238, (uint64_t *)v238);
        v187 = 0;
        for (j = 0; ; ++j)
        {
          objc_msgSend_externalIDList(self, v185, v186);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          v192 = objc_msgSend_count(v189, v190, v191);

          if (j >= v192)
          {
            v220 = v176[1];
            objc_msgSend_externalIDList(self, v193, v194);
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            v224 = objc_msgSend_count(v221, v222, v223);
            sub_233CAF22C(v238, v220, v224);
            v259 = *(_OWORD *)v238;

            goto LABEL_47;
          }
          objc_msgSend_externalIDList(self, v193, v194);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v195, v196, j);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v198 = objc_opt_isKindOfClass();

          if ((v198 & 1) == 0)
            break;
          objc_msgSend_externalIDList(self, v199, v200);
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v201, v202, j);
          v203 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_name(v203, v204, v205);
          v206 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v209 = objc_msgSend_UTF8String(v206, v207, v208);
          v211 = objc_msgSend_lengthOfBytesUsingEncoding_(v206, v210, 4);
          sub_233CAF22C(v238, v209, v211);

          *(_OWORD *)(v176[1] + v187) = *(_OWORD *)v238;
          objc_msgSend_value(v203, v212, v213);
          v214 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v217 = objc_msgSend_UTF8String(v214, v215, v216);
          v219 = objc_msgSend_lengthOfBytesUsingEncoding_(v214, v218, 4);
          sub_233CAF22C(v238, v217, v219);

          *(_OWORD *)(v176[1] + v187 + 16) = *(_OWORD *)v238;
          v187 += 32;
        }
        v113 = retstr;
        retstr->mError = 47;
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/za"
                        "p-generated/MTRCommandPayloadsObjc.mm";
        v114 = 26134;
      }
      else
      {
        v113 = retstr;
        retstr->mError = 47;
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/za"
                        "p-generated/MTRCommandPayloadsObjc.mm";
        v114 = 26128;
      }
LABEL_57:
      v113->mLine = v114;
      return (ChipError *)sub_233CAF15C((uint64_t)&v244);
    }
    v259 = 0uLL;
  }
LABEL_47:
  objc_msgSend_data(self, v170, v171);
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  if (v225)
  {
    v260 = 1;
    v261 = 0uLL;
    objc_msgSend_data(self, v226, v227);
    v228 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v231 = objc_msgSend_bytes(v228, v229, v230);
    v234 = objc_msgSend_length(v228, v232, v233);
    sub_233BF7114(v238, v231, v234);

    v261 = *(_OWORD *)v238;
  }
  sub_234118674(0x62FuLL, 0, &v243);
  if (v243)
  {
    sub_234106C48((uint64_t)v238);
    v240 = 0;
    v241 = 0;
    v239 = &unk_250504030;
    v242 = 0;
    sub_233CAF098((uint64_t)&v239, &v243, 0);
    sub_234106CA8((uint64_t)v238, (uint64_t)&v239, 0xFFFFFFFF, (uint64_t)v262);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D34F8C(v246, (char *)v238, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v238, &v243, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v243);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v239 = &unk_250504030;
    sub_233CAF128(&v241);
    sub_233CAF128(&v240);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 26156;
  }
  sub_233CAF128(&v243);
  return (ChipError *)sub_233CAF15C((uint64_t)&v244);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v5 = sub_234104468((uint64_t)v14);
  v15 = 0;
  v12 = 0uLL;
  v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  sub_233CE3234((uint64_t)v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((_QWORD *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    v11 = 26185;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
