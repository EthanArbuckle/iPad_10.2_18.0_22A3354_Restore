@implementation BMDeviceAdaptiveVolume

- (BMDeviceAdaptiveVolume)initWithControllerVersion:(void *)a3 refMicdBA:(void *)a4 refMicdBC:(void *)a5 drumdBA:(void *)a6 drumdBK:(void *)a7 drumdBAPredicted:(void *)a8 downlinkdBA:(id)a9 currentVolumePrct:(id)a10 lastUserVolChangeType:(id)a11 headphoneMode:(id)a12 streamType:(id)a13 windSpeechAggressorFlag:(id)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(id)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(id)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(id)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(id)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(id)a24 smoothEae:(id)a25 desiredDeltaE:(id)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(id)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(id)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(id)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(id)a34 smallWindowSize:(id)a35 activeAppName:(id)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(id)a38 anchorEnv:(id)a39 personalizationCoeff:(id)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(id)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(id)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(id)a46 pvFeatureEnableFlag:(id)a47 envSpectralData32B:(id)a48 windStrength:(id)a49 windProb:(id)a50 mediaType:(id)a51 sourceActivity:(id)a52 budActivity:(id)a53 location:(id)a54 locationType:(id)a55 focusMode:(id)a56 streamingAppBundleId:(id)a57 noiseType4B:(id)a58 instdBA:(id)a59 instdBC:(id)a60 nonCAListeningMode:(id)a61 fit:(id)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:
{
  id a64;
  id a65;
  id a66;
  id a67;
  id a68;
  id a69;
  id a70;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  BMDeviceAdaptiveVolume *v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  int v96;
  int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  unsigned int v144;
  unsigned int v145;
  BMDeviceAdaptiveVolume *v146;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
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
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v203;
  id v205;
  id v207;
  id v208;
  id v209;
  id v210;
  objc_super v211;

  v208 = a3;
  v209 = a4;
  v210 = a5;
  v207 = a6;
  v205 = a7;
  v203 = a8;
  v201 = a9;
  v200 = a10;
  v199 = a11;
  v198 = a12;
  v197 = a13;
  v196 = a14;
  v195 = a15;
  v194 = a16;
  v193 = a17;
  v192 = a18;
  v191 = a19;
  v190 = a20;
  v189 = a21;
  v188 = a22;
  v187 = a23;
  v186 = a24;
  v185 = a25;
  v184 = a26;
  v183 = a27;
  v182 = a28;
  v181 = a29;
  v180 = a30;
  v179 = a31;
  v178 = a32;
  v177 = a33;
  v176 = a34;
  v175 = a35;
  v152 = a36;
  v151 = a37;
  v174 = a38;
  v173 = a39;
  v172 = a40;
  v171 = a41;
  v170 = a42;
  v169 = a43;
  v168 = a44;
  v167 = a45;
  v166 = a46;
  v165 = a47;
  v150 = a48;
  v164 = a49;
  v163 = a50;
  v162 = a51;
  v161 = a52;
  v160 = a53;
  v159 = a54;
  v158 = a55;
  v72 = a56;
  v157 = a57;
  v149 = a58;
  v156 = a59;
  v155 = a60;
  v154 = a61;
  v153 = a62;
  v73 = a63;
  v74 = a64;
  v75 = a65;
  v76 = a66;
  v77 = a67;
  v78 = a68;
  v79 = a69;
  v80 = a70;
  v211.receiver = a1;
  v211.super_class = (Class)BMDeviceAdaptiveVolume;
  v81 = -[BMEventBase init](&v211, sel_init);

  if (v81)
  {
    v81->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v208)
    {
      v81->_hasControllerVersion = 1;
      v82 = objc_msgSend(v208, "unsignedIntValue");
    }
    else
    {
      v82 = 0;
      v81->_hasControllerVersion = 0;
    }
    v81->_controllerVersion = v82;
    if (v209)
    {
      v81->_hasRefMicdBA = 1;
      v83 = objc_msgSend(v209, "unsignedIntValue");
    }
    else
    {
      v83 = 0;
      v81->_hasRefMicdBA = 0;
    }
    v81->_refMicdBA = v83;
    if (v210)
    {
      v81->_hasRefMicdBC = 1;
      v84 = objc_msgSend(v210, "unsignedIntValue");
    }
    else
    {
      v84 = 0;
      v81->_hasRefMicdBC = 0;
    }
    v81->_refMicdBC = v84;
    if (v207)
    {
      v81->_hasDrumdBA = 1;
      v85 = objc_msgSend(v207, "unsignedIntValue");
    }
    else
    {
      v85 = 0;
      v81->_hasDrumdBA = 0;
    }
    v81->_drumdBA = v85;
    v86 = v205;
    if (v205)
    {
      v81->_hasDrumdBK = 1;
      v86 = objc_msgSend(v205, "unsignedIntValue");
    }
    else
    {
      v81->_hasDrumdBK = 0;
    }
    v81->_drumdBK = v86;
    v87 = v203;
    if (v203)
    {
      v81->_hasDrumdBAPredicted = 1;
      v87 = objc_msgSend(v203, "unsignedIntValue");
    }
    else
    {
      v81->_hasDrumdBAPredicted = 0;
    }
    v81->_drumdBAPredicted = v87;
    v88 = v201;
    if (v201)
    {
      v81->_hasDownlinkdBA = 1;
      v88 = objc_msgSend(v201, "unsignedIntValue");
    }
    else
    {
      v81->_hasDownlinkdBA = 0;
    }
    v81->_downlinkdBA = v88;
    v89 = v200;
    if (v200)
    {
      v81->_hasCurrentVolumePrct = 1;
      v89 = objc_msgSend(v200, "unsignedIntValue");
    }
    else
    {
      v81->_hasCurrentVolumePrct = 0;
    }
    v81->_currentVolumePrct = v89;
    v90 = v199;
    if (v199)
    {
      v81->_hasLastUserVolChangeType = 1;
      v90 = objc_msgSend(v199, "unsignedIntValue");
    }
    else
    {
      v81->_hasLastUserVolChangeType = 0;
    }
    v81->_lastUserVolChangeType = v90;
    v91 = v198;
    if (v198)
    {
      v81->_hasHeadphoneMode = 1;
      v91 = objc_msgSend(v198, "unsignedIntValue");
    }
    else
    {
      v81->_hasHeadphoneMode = 0;
    }
    v81->_headphoneMode = v91;
    v92 = v197;
    if (v197)
    {
      v81->_hasStreamType = 1;
      v92 = objc_msgSend(v197, "unsignedIntValue");
    }
    else
    {
      v81->_hasStreamType = 0;
    }
    v81->_streamType = v92;
    v93 = v196;
    if (v196)
    {
      v81->_hasWindSpeechAggressorFlag = 1;
      v93 = objc_msgSend(v196, "unsignedIntValue");
    }
    else
    {
      v81->_hasWindSpeechAggressorFlag = 0;
    }
    v81->_windSpeechAggressorFlag = v93;
    v94 = v195;
    if (v195)
    {
      v81->_hasVolumeChangeFlag = 1;
      v94 = objc_msgSend(v195, "unsignedIntValue");
    }
    else
    {
      v81->_hasVolumeChangeFlag = 0;
    }
    v81->_volumeChangeFlag = v94;
    v95 = v194;
    if (v194)
    {
      v81->_hasSpeechPresenceProbability = 1;
      v95 = objc_msgSend(v194, "unsignedIntValue");
    }
    else
    {
      v81->_hasSpeechPresenceProbability = 0;
    }
    v81->_speechPresenceProbability = v95;
    if (v193)
    {
      v81->_hasPersonalizationParamSnr = 1;
      v96 = objc_msgSend(v193, "intValue");
    }
    else
    {
      v81->_hasPersonalizationParamSnr = 0;
      v96 = -1;
    }
    v81->_personalizationParamSnr = v96;
    if (v192)
    {
      v81->_hasPersonalizationParamMistakes = 1;
      v97 = objc_msgSend(v192, "intValue");
    }
    else
    {
      v81->_hasPersonalizationParamMistakes = 0;
      v97 = -1;
    }
    v81->_personalizationParamMistakes = v97;
    v98 = v191;
    if (v191)
    {
      v81->_hasLastEMediadBA = 1;
      v98 = objc_msgSend(v191, "unsignedIntValue");
    }
    else
    {
      v81->_hasLastEMediadBA = 0;
    }
    v81->_lastEMediadBA = v98;
    v99 = v190;
    if (v190)
    {
      v81->_hasLastVolMediaPrct = 1;
      v99 = objc_msgSend(v190, "unsignedIntValue");
    }
    else
    {
      v81->_hasLastVolMediaPrct = 0;
    }
    v81->_lastVolMediaPrct = v99;
    v100 = v189;
    if (v189)
    {
      v81->_hasLastETelephonydBA = 1;
      v100 = objc_msgSend(v189, "unsignedIntValue");
    }
    else
    {
      v81->_hasLastETelephonydBA = 0;
    }
    v81->_lastETelephonydBA = v100;
    v101 = v188;
    if (v188)
    {
      v81->_hasLastVolTelephonyPrct = 1;
      v101 = objc_msgSend(v188, "unsignedIntValue");
    }
    else
    {
      v81->_hasLastVolTelephonyPrct = 0;
    }
    v81->_lastVolTelephonyPrct = v101;
    v102 = v187;
    if (v187)
    {
      v81->_hasLastESiridBA = 1;
      v102 = objc_msgSend(v187, "unsignedIntValue");
    }
    else
    {
      v81->_hasLastESiridBA = 0;
    }
    v81->_lastESiridBA = v102;
    v103 = v186;
    if (v186)
    {
      v81->_hasLastVolSiriPrct = 1;
      v103 = objc_msgSend(v186, "unsignedIntValue");
    }
    else
    {
      v81->_hasLastVolSiriPrct = 0;
    }
    v81->_lastVolSiriPrct = v103;
    v104 = v185;
    if (v185)
    {
      v81->_hasSmoothEae = 1;
      v104 = objc_msgSend(v185, "unsignedIntValue");
    }
    else
    {
      v81->_hasSmoothEae = 0;
    }
    v81->_smoothEae = v104;
    if (v184)
    {
      v81->_hasDesiredDeltaE = 1;
      v105 = objc_msgSend(v184, "intValue");
    }
    else
    {
      v81->_hasDesiredDeltaE = 0;
      v105 = -1;
    }
    v81->_desiredDeltaE = v105;
    if (v183)
    {
      v81->_hasPredVolMediaPrct = 1;
      v106 = objc_msgSend(v183, "intValue");
    }
    else
    {
      v81->_hasPredVolMediaPrct = 0;
      v106 = -1;
    }
    v81->_predVolMediaPrct = v106;
    if (v182)
    {
      v81->_hasPredVolTelephonyPrct = 1;
      v107 = objc_msgSend(v182, "intValue");
    }
    else
    {
      v81->_hasPredVolTelephonyPrct = 0;
      v107 = -1;
    }
    v81->_predVolTelephonyPrct = v107;
    if (v181)
    {
      v81->_hasPredVolSiriPrct = 1;
      v108 = objc_msgSend(v181, "intValue");
    }
    else
    {
      v81->_hasPredVolSiriPrct = 0;
      v108 = -1;
    }
    v81->_predVolSiriPrct = v108;
    v109 = v180;
    if (v180)
    {
      v81->_hasOnStartPredictionFlag = 1;
      v109 = objc_msgSend(v180, "unsignedIntValue");
    }
    else
    {
      v81->_hasOnStartPredictionFlag = 0;
    }
    v81->_onStartPredictionFlag = v109;
    v110 = v179;
    if (v179)
    {
      v81->_hasGuardrailsAvoidFlag = 1;
      v110 = objc_msgSend(v179, "unsignedIntValue");
    }
    else
    {
      v81->_hasGuardrailsAvoidFlag = 0;
    }
    v81->_guardrailsAvoidFlag = v110;
    v111 = v178;
    if (v178)
    {
      v81->_hasMinMaxCutFlag = 1;
      v111 = objc_msgSend(v178, "unsignedIntValue");
    }
    else
    {
      v81->_hasMinMaxCutFlag = 0;
    }
    v81->_minMaxCutFlag = v111;
    v112 = v177;
    if (v177)
    {
      v81->_hasManualVolumeChangeFlag = 1;
      v112 = objc_msgSend(v177, "unsignedIntValue");
    }
    else
    {
      v81->_hasManualVolumeChangeFlag = 0;
    }
    v81->_manualVolumeChangeFlag = v112;
    v113 = v176;
    if (v176)
    {
      v81->_hasBigWindowSize = 1;
      v113 = objc_msgSend(v176, "unsignedIntValue");
    }
    else
    {
      v81->_hasBigWindowSize = 0;
    }
    v81->_bigWindowSize = v113;
    v114 = v175;
    if (v175)
    {
      v81->_hasSmallWindowSize = 1;
      v114 = objc_msgSend(v175, "unsignedIntValue");
    }
    else
    {
      v81->_hasSmallWindowSize = 0;
    }
    v81->_smallWindowSize = v114;
    objc_storeStrong((id *)&v81->_activeAppName, a36);
    objc_storeStrong((id *)&v81->_activeAirpodsSerialNumber, a37);
    v115 = v174;
    if (v174)
    {
      v81->_hasAnchorVol = 1;
      v115 = objc_msgSend(v174, "unsignedIntValue");
    }
    else
    {
      v81->_hasAnchorVol = 0;
    }
    v81->_anchorVol = v115;
    v116 = v173;
    if (v173)
    {
      v81->_hasAnchorEnv = 1;
      v116 = objc_msgSend(v173, "unsignedIntValue");
    }
    else
    {
      v81->_hasAnchorEnv = 0;
    }
    v81->_anchorEnv = v116;
    v117 = v172;
    if (v172)
    {
      v81->_hasPersonalizationCoeff = 1;
      v117 = objc_msgSend(v172, "unsignedIntValue");
    }
    else
    {
      v81->_hasPersonalizationCoeff = 0;
    }
    v81->_personalizationCoeff = v117;
    v118 = v171;
    if (v171)
    {
      v81->_hasUnsignedPredVolMediaPrct = 1;
      v118 = objc_msgSend(v171, "unsignedIntValue");
    }
    else
    {
      v81->_hasUnsignedPredVolMediaPrct = 0;
    }
    v81->_unsignedPredVolMediaPrct = v118;
    v119 = v170;
    if (v170)
    {
      v81->_hasUnsignedPredVolTelephonyPrct = 1;
      v119 = objc_msgSend(v170, "unsignedIntValue");
    }
    else
    {
      v81->_hasUnsignedPredVolTelephonyPrct = 0;
    }
    v81->_unsignedPredVolTelephonyPrct = v119;
    v120 = v169;
    if (v169)
    {
      v81->_hasUnsignedPredVolSiriPrct = 1;
      v120 = objc_msgSend(v169, "unsignedIntValue");
    }
    else
    {
      v81->_hasUnsignedPredVolSiriPrct = 0;
    }
    v81->_unsignedPredVolSiriPrct = v120;
    v121 = v168;
    if (v168)
    {
      v81->_hasSingleBudFlag = 1;
      v121 = objc_msgSend(v168, "unsignedIntValue");
    }
    else
    {
      v81->_hasSingleBudFlag = 0;
    }
    v81->_singleBudFlag = v121;
    v122 = v167;
    if (v167)
    {
      v81->_hasCdEngagementFlag = 1;
      v122 = objc_msgSend(v167, "unsignedIntValue");
    }
    else
    {
      v81->_hasCdEngagementFlag = 0;
    }
    v81->_cdEngagementFlag = v122;
    v123 = v166;
    if (v166)
    {
      v81->_hasActiveStreamFlag = 1;
      v123 = objc_msgSend(v166, "unsignedIntValue");
    }
    else
    {
      v81->_hasActiveStreamFlag = 0;
    }
    v81->_activeStreamFlag = v123;
    v124 = v165;
    if (v165)
    {
      v81->_hasPvFeatureEnableFlag = 1;
      v124 = objc_msgSend(v165, "unsignedIntValue");
    }
    else
    {
      v81->_hasPvFeatureEnableFlag = 0;
    }
    v81->_pvFeatureEnableFlag = v124;
    objc_storeStrong((id *)&v81->_envSpectralData32B, a48);
    v125 = v164;
    if (v164)
    {
      v81->_hasWindStrength = 1;
      v125 = objc_msgSend(v164, "unsignedIntValue");
    }
    else
    {
      v81->_hasWindStrength = 0;
    }
    v81->_windStrength = v125;
    v126 = v163;
    if (v163)
    {
      v81->_hasWindProb = 1;
      v126 = objc_msgSend(v163, "unsignedIntValue");
    }
    else
    {
      v81->_hasWindProb = 0;
    }
    v81->_windProb = v126;
    v127 = v162;
    if (v162)
    {
      v81->_hasMediaType = 1;
      v127 = objc_msgSend(v162, "unsignedIntValue");
    }
    else
    {
      v81->_hasMediaType = 0;
    }
    v81->_mediaType = v127;
    v128 = v161;
    if (v161)
    {
      v81->_hasSourceActivity = 1;
      v128 = objc_msgSend(v161, "unsignedIntValue");
    }
    else
    {
      v81->_hasSourceActivity = 0;
    }
    v81->_sourceActivity = v128;
    v129 = v160;
    if (v160)
    {
      v81->_hasBudActivity = 1;
      v129 = objc_msgSend(v160, "unsignedIntValue");
    }
    else
    {
      v81->_hasBudActivity = 0;
    }
    v81->_budActivity = v129;
    v130 = v159;
    if (v159)
    {
      v81->_hasLocation = 1;
      v130 = objc_msgSend(v159, "unsignedIntValue");
    }
    else
    {
      v81->_hasLocation = 0;
    }
    v81->_location = v130;
    v131 = v158;
    if (v158)
    {
      v81->_hasLocationType = 1;
      v131 = objc_msgSend(v158, "unsignedIntValue");
    }
    else
    {
      v81->_hasLocationType = 0;
    }
    v81->_locationType = v131;
    if (v72)
    {
      v81->_hasFocusMode = 1;
      v132 = objc_msgSend(v72, "unsignedIntValue");
    }
    else
    {
      v132 = 0;
      v81->_hasFocusMode = 0;
    }
    v81->_focusMode = v132;
    v133 = v157;
    if (v157)
    {
      v81->_hasStreamingAppBundleId = 1;
      v133 = objc_msgSend(v157, "unsignedIntValue");
    }
    else
    {
      v81->_hasStreamingAppBundleId = 0;
    }
    v81->_streamingAppBundleId = v133;
    objc_storeStrong((id *)&v81->_noiseType4B, a58);
    v134 = v156;
    if (v156)
    {
      v81->_hasInstdBA = 1;
      v134 = objc_msgSend(v156, "unsignedIntValue");
    }
    else
    {
      v81->_hasInstdBA = 0;
    }
    v81->_instdBA = v134;
    v135 = v155;
    if (v155)
    {
      v81->_hasInstdBC = 1;
      v135 = objc_msgSend(v155, "unsignedIntValue");
    }
    else
    {
      v81->_hasInstdBC = 0;
    }
    v81->_instdBC = v135;
    v136 = v154;
    if (v154)
    {
      v81->_hasNonCAListeningMode = 1;
      v136 = objc_msgSend(v154, "unsignedIntValue");
    }
    else
    {
      v81->_hasNonCAListeningMode = 0;
    }
    v81->_nonCAListeningMode = v136;
    v137 = v153;
    if (v153)
    {
      v81->_hasFit = 1;
      v137 = objc_msgSend(v153, "unsignedIntValue");
    }
    else
    {
      v81->_hasFit = 0;
    }
    v81->_fit = v137;
    v138 = v73;
    if (v73)
    {
      v81->_hasFixedAutoAncGain = 1;
      v138 = objc_msgSend(v73, "unsignedIntValue");
    }
    else
    {
      v81->_hasFixedAutoAncGain = 0;
    }
    v81->_fixedAutoAncGain = v138;
    v139 = v74;
    if (v74)
    {
      v81->_hasAdjustedAutoAncGain = 1;
      v139 = objc_msgSend(v74, "unsignedIntValue");
    }
    else
    {
      v81->_hasAdjustedAutoAncGain = 0;
    }
    v81->_adjustedAutoAncGain = v139;
    v140 = v75;
    if (v75)
    {
      v81->_hasTimestamp = 1;
      v140 = objc_msgSend(v75, "unsignedIntValue");
    }
    else
    {
      v81->_hasTimestamp = 0;
    }
    v81->_timestamp = v140;
    if (v76)
    {
      v81->_hasDRCenablementBit = 1;
      v141 = objc_msgSend(v76, "unsignedIntValue");
    }
    else
    {
      v141 = 0;
      v81->_hasDRCenablementBit = 0;
    }
    v81->_DRCenablementBit = v141;
    if (v77)
    {
      v81->_hasDRCwindFlag = 1;
      v142 = objc_msgSend(v77, "unsignedIntValue");
    }
    else
    {
      v142 = 0;
      v81->_hasDRCwindFlag = 0;
    }
    v81->_DRCwindFlag = v142;
    if (v78)
    {
      v81->_hasDRCappSelfVoiceFlag = 1;
      v143 = objc_msgSend(v78, "unsignedIntValue");
    }
    else
    {
      v143 = 0;
      v81->_hasDRCappSelfVoiceFlag = 0;
    }
    v81->_DRCappSelfVoiceFlag = v143;
    if (v79)
    {
      v81->_hasDrumDRC = 1;
      v144 = objc_msgSend(v79, "unsignedIntValue");
    }
    else
    {
      v144 = 0;
      v81->_hasDrumDRC = 0;
    }
    v81->_drumDRC = v144;
    if (v80)
    {
      v81->_hasRoutedDRCGain = 1;
      v145 = objc_msgSend(v80, "unsignedIntValue");
    }
    else
    {
      v145 = 0;
      v81->_hasRoutedDRCGain = 0;
    }
    v81->_routedDRCGain = v145;
  }
  v146 = v81;

  return v146;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  void *v58;
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
  void *v70;
  void *v71;
  void *v72;
  void *v73;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume controllerVersion](self, "controllerVersion"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBA](self, "refMicdBA"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBC](self, "refMicdBC"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBA](self, "drumdBA"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBK](self, "drumdBK"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBAPredicted](self, "drumdBAPredicted"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume downlinkdBA](self, "downlinkdBA"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume currentVolumePrct](self, "currentVolumePrct"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastUserVolChangeType](self, "lastUserVolChangeType"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume headphoneMode](self, "headphoneMode"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamType](self, "streamType"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windSpeechAggressorFlag](self, "windSpeechAggressorFlag"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume volumeChangeFlag](self, "volumeChangeFlag"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume speechPresenceProbability](self, "speechPresenceProbability"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamSnr](self, "personalizationParamSnr"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamMistakes](self, "personalizationParamMistakes"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastEMediadBA](self, "lastEMediadBA"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolMediaPrct](self, "lastVolMediaPrct"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastETelephonydBA](self, "lastETelephonydBA"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolTelephonyPrct](self, "lastVolTelephonyPrct"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastESiridBA](self, "lastESiridBA"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolSiriPrct](self, "lastVolSiriPrct"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smoothEae](self, "smoothEae"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume desiredDeltaE](self, "desiredDeltaE"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume predVolMediaPrct](self, "predVolMediaPrct"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume predVolTelephonyPrct](self, "predVolTelephonyPrct"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume predVolSiriPrct](self, "predVolSiriPrct"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume onStartPredictionFlag](self, "onStartPredictionFlag"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume guardrailsAvoidFlag](self, "guardrailsAvoidFlag"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume minMaxCutFlag](self, "minMaxCutFlag"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume manualVolumeChangeFlag](self, "manualVolumeChangeFlag"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume bigWindowSize](self, "bigWindowSize"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smallWindowSize](self, "smallWindowSize"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceAdaptiveVolume activeAppName](self, "activeAppName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceAdaptiveVolume activeAirpodsSerialNumber](self, "activeAirpodsSerialNumber");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorVol](self, "anchorVol"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorEnv](self, "anchorEnv"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume personalizationCoeff](self, "personalizationCoeff"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolMediaPrct](self, "unsignedPredVolMediaPrct"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolTelephonyPrct](self, "unsignedPredVolTelephonyPrct"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolSiriPrct](self, "unsignedPredVolSiriPrct"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume singleBudFlag](self, "singleBudFlag"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume cdEngagementFlag](self, "cdEngagementFlag"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume activeStreamFlag](self, "activeStreamFlag"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume pvFeatureEnableFlag](self, "pvFeatureEnableFlag"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceAdaptiveVolume envSpectralData32B](self, "envSpectralData32B");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windStrength](self, "windStrength"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windProb](self, "windProb"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume mediaType](self, "mediaType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume sourceActivity](self, "sourceActivity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume budActivity](self, "budActivity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume location](self, "location"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume locationType](self, "locationType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume focusMode](self, "focusMode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamingAppBundleId](self, "streamingAppBundleId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceAdaptiveVolume noiseType4B](self, "noiseType4B");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBA](self, "instdBA"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBC](self, "instdBC"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume nonCAListeningMode](self, "nonCAListeningMode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fit](self, "fit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fixedAutoAncGain](self, "fixedAutoAncGain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume adjustedAutoAncGain](self, "adjustedAutoAncGain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume timestamp](self, "timestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCenablementBit](self, "DRCenablementBit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCwindFlag](self, "DRCwindFlag"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCappSelfVoiceFlag](self, "DRCappSelfVoiceFlag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumDRC](self, "drumDRC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume routedDRCGain](self, "routedDRCGain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "initWithFormat:", CFSTR("BMDeviceAdaptiveVolume with controllerVersion: %@, refMicdBA: %@, refMicdBC: %@, drumdBA: %@, drumdBK: %@, drumdBAPredicted: %@, downlinkdBA: %@, currentVolumePrct: %@, lastUserVolChangeType: %@, headphoneMode: %@, streamType: %@, windSpeechAggressorFlag: %@, volumeChangeFlag: %@, speechPresenceProbability: %@, personalizationParamSnr: %@, personalizationParamMistakes: %@, lastEMediadBA: %@, lastVolMediaPrct: %@, lastETelephonydBA: %@, lastVolTelephonyPrct: %@, lastESiridBA: %@, lastVolSiriPrct: %@, smoothEae: %@, desiredDeltaE: %@, predVolMediaPrct: %@, predVolTelephonyPrct: %@, predVolSiriPrct: %@, onStartPredictionFlag: %@, guardrailsAvoidFlag: %@, minMaxCutFlag: %@, manualVolumeChangeFlag: %@, bigWindowSize: %@, smallWindowSize: %@, activeAppName: %@, activeAirpodsSerialNumber: %@, anchorVol: %@, anchorEnv: %@, personalizationCoeff: %@, unsignedPredVolMediaPrct: %@, unsignedPredVolTelephonyPrct: %@, unsignedPredVolSiriPrct: %@, singleBudFlag: %@, cdEngagementFlag: %@, activeStreamFlag: %@, pvFeatureEnableFlag: %@, envSpectralData32B: %@, windStrength: %@, windProb: %@, mediaType: %@, sourceActivity: %@, budActivity: %@, location: %@, locationType: %@, focusMode: %@, streamingAppBundleId: %@, noiseType4B: %@, instdBA: %@, instdBC: %@, nonCAListeningMode: %@, fit: %@, fixedAutoAncGain: %@, adjustedAutoAncGain: %@, timestamp: %@, DRCenablementBit: %@, DRCwindFlag: %@, DRCappSelfVoiceFlag: %@, drumDRC: %@, routedDRCGain: %@"), v70, v73, v72, v71, v66, v69, v68, v67, v63, v65, v64, v60, v62, v61, v57, v59,
              v58,
              v54,
              v56,
              v55,
              v51,
              v53,
              v52,
              v48,
              v50,
              v49,
              v47,
              v44,
              v46,
              v43,
              v45,
              v40,
              v42,
              v38,
              v41,
              v37,
              v39,
              v34,
              v36,
              v32,
              v35,
              v30,
              v33,
              v28,
              v31,
              v17,
              v29,
              v16,
              v27,
              v15,
              v26,
              v25,
              v24,
              v23,
              v14,
              v22,
              v13,
              v21,
              v20,
              v12);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceAdaptiveVolume *v5;
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
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  unsigned int v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  unsigned int v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  char v122;
  unsigned int v123;
  uint64_t v124;
  unint64_t v125;
  char v126;
  char v127;
  unsigned int v128;
  uint64_t v129;
  unint64_t v130;
  char v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  unint64_t v135;
  char v136;
  char v137;
  unsigned int v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  char v142;
  unsigned int v143;
  uint64_t v144;
  unint64_t v145;
  char v146;
  char v147;
  unsigned int v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  unsigned int v153;
  uint64_t v154;
  unint64_t v155;
  char v156;
  char v157;
  unsigned int v158;
  uint64_t v159;
  unint64_t v160;
  char v161;
  char v162;
  unsigned int v163;
  uint64_t v164;
  unint64_t v165;
  char v166;
  char v167;
  unsigned int v168;
  uint64_t v169;
  unint64_t v170;
  char v171;
  char v172;
  unsigned int v173;
  uint64_t v174;
  unint64_t v175;
  char v176;
  char v177;
  unsigned int v178;
  uint64_t v179;
  unint64_t v180;
  char v181;
  char v182;
  unsigned int v183;
  uint64_t v184;
  unint64_t v185;
  char v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  char v190;
  unsigned int v191;
  uint64_t v192;
  unint64_t v193;
  char v194;
  char v195;
  unsigned int v196;
  uint64_t v197;
  unint64_t v198;
  char v199;
  char v200;
  unsigned int v201;
  uint64_t v202;
  unint64_t v203;
  char v204;
  char v205;
  unsigned int v206;
  uint64_t v207;
  unint64_t v208;
  char v209;
  char v210;
  unsigned int v211;
  uint64_t v212;
  unint64_t v213;
  char v214;
  char v215;
  unsigned int v216;
  uint64_t v217;
  unint64_t v218;
  char v219;
  char v220;
  unsigned int v221;
  uint64_t v222;
  unint64_t v223;
  char v224;
  char v225;
  unsigned int v226;
  uint64_t v227;
  unint64_t v228;
  char v229;
  char v230;
  unsigned int v231;
  uint64_t v232;
  unint64_t v233;
  char v234;
  char v235;
  unsigned int v236;
  uint64_t v237;
  unint64_t v238;
  char v239;
  char v240;
  unsigned int v241;
  uint64_t v242;
  void *v243;
  uint64_t v244;
  unint64_t v245;
  char v246;
  uint64_t v247;
  char v248;
  unsigned int v249;
  uint64_t v250;
  unint64_t v251;
  char v252;
  char v253;
  unsigned int v254;
  uint64_t v255;
  unint64_t v256;
  char v257;
  char v258;
  unsigned int v259;
  uint64_t v260;
  unint64_t v261;
  char v262;
  char v263;
  unsigned int v264;
  uint64_t v265;
  unint64_t v266;
  char v267;
  char v268;
  unsigned int v269;
  uint64_t v270;
  unint64_t v271;
  char v272;
  char v273;
  unsigned int v274;
  uint64_t v275;
  unint64_t v276;
  char v277;
  char v278;
  unsigned int v279;
  uint64_t v280;
  unint64_t v281;
  char v282;
  char v283;
  unsigned int v284;
  uint64_t v285;
  unint64_t v286;
  char v287;
  char v288;
  unsigned int v289;
  uint64_t v290;
  unint64_t v291;
  char v292;
  char v293;
  unsigned int v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  unint64_t v298;
  char v299;
  uint64_t v300;
  char v301;
  unsigned int v302;
  uint64_t v303;
  unint64_t v304;
  char v305;
  char v306;
  unsigned int v307;
  uint64_t v308;
  unint64_t v309;
  char v310;
  char v311;
  unsigned int v312;
  uint64_t v313;
  unint64_t v314;
  char v315;
  char v316;
  unsigned int v317;
  uint64_t v318;
  unint64_t v319;
  char v320;
  char v321;
  unsigned int v322;
  uint64_t v323;
  unint64_t v324;
  char v325;
  char v326;
  unsigned int v327;
  uint64_t v328;
  unint64_t v329;
  char v330;
  char v331;
  unsigned int v332;
  uint64_t v333;
  unint64_t v334;
  char v335;
  char v336;
  unsigned int v337;
  uint64_t v338;
  unint64_t v339;
  char v340;
  char v341;
  unsigned int v342;
  uint64_t v343;
  unint64_t v344;
  char v345;
  char v346;
  unsigned int v347;
  uint64_t v348;
  unint64_t v349;
  char v350;
  char v351;
  unsigned int v352;
  uint64_t v353;
  unint64_t v354;
  char v355;
  char v356;
  unsigned int v357;
  uint64_t v358;
  unint64_t v359;
  char v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  void *v364;
  uint64_t v365;
  uint64_t v366;
  NSArray *envSpectralData32B;
  uint64_t v368;
  NSArray *noiseType4B;
  int v370;
  BMDeviceAdaptiveVolume *v371;
  objc_super v373;

  v4 = a3;
  v373.receiver = self;
  v373.super_class = (Class)BMDeviceAdaptiveVolume;
  v5 = -[BMEventBase init](&v373, sel_init);
  if (!v5)
  {
LABEL_760:
    v371 = v5;
    goto LABEL_761;
  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_758:
    v366 = objc_msgSend(v6, "copy");
    envSpectralData32B = v5->_envSpectralData32B;
    v5->_envSpectralData32B = (NSArray *)v366;

    v368 = objc_msgSend(v7, "copy");
    noiseType4B = v5->_noiseType4B;
    v5->_noiseType4B = (NSArray *)v368;

    v370 = v4[*v10];
    if (v370)
      goto LABEL_759;
    goto LABEL_760;
  }
  v11 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v10])
      goto LABEL_758;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = *v8;
      v16 = *(_QWORD *)&v4[v15];
      if (v16 == -1 || v16 >= *(_QWORD *)&v4[*v9])
        break;
      v17 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
      *(_QWORD *)&v4[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0)
        goto LABEL_13;
      v12 += 7;
      v18 = v13++ >= 9;
      if (v18)
      {
        v14 = 0;
        v19 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    v19 = v4[*v10];
    if (v4[*v10])
      v14 = 0;
LABEL_15:
    if (v19 || (v14 & 7) == 4)
      goto LABEL_758;
    switch((v14 >> 3))
    {
      case 1u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v5->_hasControllerVersion = 1;
        while (1)
        {
          v24 = *v8;
          v25 = *(_QWORD *)&v4[v24];
          if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v9])
            break;
          v26 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v25);
          *(_QWORD *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_488;
          v21 += 7;
          v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_490;
          }
        }
        v4[*v10] = 1;
LABEL_488:
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_490:
        v361 = 88;
        goto LABEL_756;
      case 2u:
        v27 = 0;
        v28 = 0;
        v23 = 0;
        v5->_hasRefMicdBA = 1;
        while (2)
        {
          v29 = *v8;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v30);
            *(_QWORD *)&v4[v29] = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              v18 = v28++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_494;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_494:
        v361 = 92;
        goto LABEL_756;
      case 3u:
        v32 = 0;
        v33 = 0;
        v23 = 0;
        v5->_hasRefMicdBC = 1;
        while (2)
        {
          v34 = *v8;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v35);
            *(_QWORD *)&v4[v34] = v35 + 1;
            v23 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              v18 = v33++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_498;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_498:
        v361 = 96;
        goto LABEL_756;
      case 4u:
        v37 = 0;
        v38 = 0;
        v23 = 0;
        v5->_hasDrumdBA = 1;
        while (2)
        {
          v39 = *v8;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 == -1 || v40 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v40);
            *(_QWORD *)&v4[v39] = v40 + 1;
            v23 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              v18 = v38++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_502;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_502:
        v361 = 100;
        goto LABEL_756;
      case 5u:
        v42 = 0;
        v43 = 0;
        v23 = 0;
        v5->_hasDrumdBK = 1;
        while (2)
        {
          v44 = *v8;
          v45 = *(_QWORD *)&v4[v44];
          if (v45 == -1 || v45 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v45);
            *(_QWORD *)&v4[v44] = v45 + 1;
            v23 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              v18 = v43++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_506;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_506:
        v361 = 104;
        goto LABEL_756;
      case 6u:
        v47 = 0;
        v48 = 0;
        v23 = 0;
        v5->_hasDrumdBAPredicted = 1;
        while (2)
        {
          v49 = *v8;
          v50 = *(_QWORD *)&v4[v49];
          if (v50 == -1 || v50 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v51 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v50);
            *(_QWORD *)&v4[v49] = v50 + 1;
            v23 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              v18 = v48++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_510;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_510:
        v361 = 108;
        goto LABEL_756;
      case 7u:
        v52 = 0;
        v53 = 0;
        v23 = 0;
        v5->_hasDownlinkdBA = 1;
        while (2)
        {
          v54 = *v8;
          v55 = *(_QWORD *)&v4[v54];
          if (v55 == -1 || v55 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v56 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v55);
            *(_QWORD *)&v4[v54] = v55 + 1;
            v23 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              v18 = v53++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_514;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_514:
        v361 = 112;
        goto LABEL_756;
      case 8u:
        v57 = 0;
        v58 = 0;
        v23 = 0;
        v5->_hasCurrentVolumePrct = 1;
        while (2)
        {
          v59 = *v8;
          v60 = *(_QWORD *)&v4[v59];
          if (v60 == -1 || v60 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v60);
            *(_QWORD *)&v4[v59] = v60 + 1;
            v23 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              v18 = v58++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_518;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_518:
        v361 = 116;
        goto LABEL_756;
      case 9u:
        v62 = 0;
        v63 = 0;
        v23 = 0;
        v5->_hasLastUserVolChangeType = 1;
        while (2)
        {
          v64 = *v8;
          v65 = *(_QWORD *)&v4[v64];
          if (v65 == -1 || v65 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v66 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v65);
            *(_QWORD *)&v4[v64] = v65 + 1;
            v23 |= (unint64_t)(v66 & 0x7F) << v62;
            if (v66 < 0)
            {
              v62 += 7;
              v18 = v63++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_522;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_522:
        v361 = 120;
        goto LABEL_756;
      case 0xAu:
        v67 = 0;
        v68 = 0;
        v23 = 0;
        v5->_hasHeadphoneMode = 1;
        while (2)
        {
          v69 = *v8;
          v70 = *(_QWORD *)&v4[v69];
          if (v70 == -1 || v70 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v71 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v70);
            *(_QWORD *)&v4[v69] = v70 + 1;
            v23 |= (unint64_t)(v71 & 0x7F) << v67;
            if (v71 < 0)
            {
              v67 += 7;
              v18 = v68++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_526;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_526:
        v361 = 124;
        goto LABEL_756;
      case 0xBu:
        v72 = 0;
        v73 = 0;
        v23 = 0;
        v5->_hasStreamType = 1;
        while (2)
        {
          v74 = *v8;
          v75 = *(_QWORD *)&v4[v74];
          if (v75 == -1 || v75 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v76 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v75);
            *(_QWORD *)&v4[v74] = v75 + 1;
            v23 |= (unint64_t)(v76 & 0x7F) << v72;
            if (v76 < 0)
            {
              v72 += 7;
              v18 = v73++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_530;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_530:
        v361 = 128;
        goto LABEL_756;
      case 0xCu:
        v77 = 0;
        v78 = 0;
        v23 = 0;
        v5->_hasWindSpeechAggressorFlag = 1;
        while (2)
        {
          v79 = *v8;
          v80 = *(_QWORD *)&v4[v79];
          if (v80 == -1 || v80 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v81 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v80);
            *(_QWORD *)&v4[v79] = v80 + 1;
            v23 |= (unint64_t)(v81 & 0x7F) << v77;
            if (v81 < 0)
            {
              v77 += 7;
              v18 = v78++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_534;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_534:
        v361 = 132;
        goto LABEL_756;
      case 0xDu:
        v82 = 0;
        v83 = 0;
        v23 = 0;
        v5->_hasVolumeChangeFlag = 1;
        while (2)
        {
          v84 = *v8;
          v85 = *(_QWORD *)&v4[v84];
          if (v85 == -1 || v85 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v86 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v85);
            *(_QWORD *)&v4[v84] = v85 + 1;
            v23 |= (unint64_t)(v86 & 0x7F) << v82;
            if (v86 < 0)
            {
              v82 += 7;
              v18 = v83++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_538;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_538:
        v361 = 136;
        goto LABEL_756;
      case 0xEu:
        v87 = 0;
        v88 = 0;
        v23 = 0;
        v5->_hasSpeechPresenceProbability = 1;
        while (2)
        {
          v89 = *v8;
          v90 = *(_QWORD *)&v4[v89];
          if (v90 == -1 || v90 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v91 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v90);
            *(_QWORD *)&v4[v89] = v90 + 1;
            v23 |= (unint64_t)(v91 & 0x7F) << v87;
            if (v91 < 0)
            {
              v87 += 7;
              v18 = v88++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_542;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_542:
        v361 = 140;
        goto LABEL_756;
      case 0xFu:
        v92 = 0;
        v93 = 0;
        v23 = 0;
        v5->_hasPersonalizationParamSnr = 1;
        while (2)
        {
          v94 = *v8;
          v95 = *(_QWORD *)&v4[v94];
          if (v95 == -1 || v95 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v96 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v95);
            *(_QWORD *)&v4[v94] = v95 + 1;
            v23 |= (unint64_t)(v96 & 0x7F) << v92;
            if (v96 < 0)
            {
              v92 += 7;
              v18 = v93++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_546;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_546:
        v361 = 144;
        goto LABEL_756;
      case 0x10u:
        v97 = 0;
        v98 = 0;
        v23 = 0;
        v5->_hasPersonalizationParamMistakes = 1;
        while (2)
        {
          v99 = *v8;
          v100 = *(_QWORD *)&v4[v99];
          if (v100 == -1 || v100 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v101 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v100);
            *(_QWORD *)&v4[v99] = v100 + 1;
            v23 |= (unint64_t)(v101 & 0x7F) << v97;
            if (v101 < 0)
            {
              v97 += 7;
              v18 = v98++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_550;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_550:
        v361 = 148;
        goto LABEL_756;
      case 0x11u:
        v102 = 0;
        v103 = 0;
        v23 = 0;
        v5->_hasLastEMediadBA = 1;
        while (2)
        {
          v104 = *v8;
          v105 = *(_QWORD *)&v4[v104];
          if (v105 == -1 || v105 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v106 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v105);
            *(_QWORD *)&v4[v104] = v105 + 1;
            v23 |= (unint64_t)(v106 & 0x7F) << v102;
            if (v106 < 0)
            {
              v102 += 7;
              v18 = v103++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_554;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_554:
        v361 = 152;
        goto LABEL_756;
      case 0x12u:
        v107 = 0;
        v108 = 0;
        v23 = 0;
        v5->_hasLastVolMediaPrct = 1;
        while (2)
        {
          v109 = *v8;
          v110 = *(_QWORD *)&v4[v109];
          if (v110 == -1 || v110 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v111 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v110);
            *(_QWORD *)&v4[v109] = v110 + 1;
            v23 |= (unint64_t)(v111 & 0x7F) << v107;
            if (v111 < 0)
            {
              v107 += 7;
              v18 = v108++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_558;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_558:
        v361 = 156;
        goto LABEL_756;
      case 0x13u:
        v112 = 0;
        v113 = 0;
        v23 = 0;
        v5->_hasLastETelephonydBA = 1;
        while (2)
        {
          v114 = *v8;
          v115 = *(_QWORD *)&v4[v114];
          if (v115 == -1 || v115 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v116 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v115);
            *(_QWORD *)&v4[v114] = v115 + 1;
            v23 |= (unint64_t)(v116 & 0x7F) << v112;
            if (v116 < 0)
            {
              v112 += 7;
              v18 = v113++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_562;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_562:
        v361 = 160;
        goto LABEL_756;
      case 0x14u:
        v117 = 0;
        v118 = 0;
        v23 = 0;
        v5->_hasLastVolTelephonyPrct = 1;
        while (2)
        {
          v119 = *v8;
          v120 = *(_QWORD *)&v4[v119];
          if (v120 == -1 || v120 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v121 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v120);
            *(_QWORD *)&v4[v119] = v120 + 1;
            v23 |= (unint64_t)(v121 & 0x7F) << v117;
            if (v121 < 0)
            {
              v117 += 7;
              v18 = v118++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_566;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_566:
        v361 = 164;
        goto LABEL_756;
      case 0x15u:
        v122 = 0;
        v123 = 0;
        v23 = 0;
        v5->_hasLastESiridBA = 1;
        while (2)
        {
          v124 = *v8;
          v125 = *(_QWORD *)&v4[v124];
          if (v125 == -1 || v125 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v126 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v125);
            *(_QWORD *)&v4[v124] = v125 + 1;
            v23 |= (unint64_t)(v126 & 0x7F) << v122;
            if (v126 < 0)
            {
              v122 += 7;
              v18 = v123++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_570;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_570:
        v361 = 168;
        goto LABEL_756;
      case 0x16u:
        v127 = 0;
        v128 = 0;
        v23 = 0;
        v5->_hasLastVolSiriPrct = 1;
        while (2)
        {
          v129 = *v8;
          v130 = *(_QWORD *)&v4[v129];
          if (v130 == -1 || v130 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v131 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v130);
            *(_QWORD *)&v4[v129] = v130 + 1;
            v23 |= (unint64_t)(v131 & 0x7F) << v127;
            if (v131 < 0)
            {
              v127 += 7;
              v18 = v128++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_574;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_574:
        v361 = 172;
        goto LABEL_756;
      case 0x17u:
        v132 = 0;
        v133 = 0;
        v23 = 0;
        v5->_hasSmoothEae = 1;
        while (2)
        {
          v134 = *v8;
          v135 = *(_QWORD *)&v4[v134];
          if (v135 == -1 || v135 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v136 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v135);
            *(_QWORD *)&v4[v134] = v135 + 1;
            v23 |= (unint64_t)(v136 & 0x7F) << v132;
            if (v136 < 0)
            {
              v132 += 7;
              v18 = v133++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_578;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_578:
        v361 = 176;
        goto LABEL_756;
      case 0x18u:
        v137 = 0;
        v138 = 0;
        v23 = 0;
        v5->_hasDesiredDeltaE = 1;
        while (2)
        {
          v139 = *v8;
          v140 = *(_QWORD *)&v4[v139];
          if (v140 == -1 || v140 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v141 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v140);
            *(_QWORD *)&v4[v139] = v140 + 1;
            v23 |= (unint64_t)(v141 & 0x7F) << v137;
            if (v141 < 0)
            {
              v137 += 7;
              v18 = v138++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_582;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_582:
        v361 = 180;
        goto LABEL_756;
      case 0x19u:
        v142 = 0;
        v143 = 0;
        v23 = 0;
        v5->_hasPredVolMediaPrct = 1;
        while (2)
        {
          v144 = *v8;
          v145 = *(_QWORD *)&v4[v144];
          if (v145 == -1 || v145 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v146 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v145);
            *(_QWORD *)&v4[v144] = v145 + 1;
            v23 |= (unint64_t)(v146 & 0x7F) << v142;
            if (v146 < 0)
            {
              v142 += 7;
              v18 = v143++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_586;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_586:
        v361 = 184;
        goto LABEL_756;
      case 0x1Au:
        v147 = 0;
        v148 = 0;
        v23 = 0;
        v5->_hasPredVolTelephonyPrct = 1;
        while (2)
        {
          v149 = *v8;
          v150 = *(_QWORD *)&v4[v149];
          if (v150 == -1 || v150 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v151 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v150);
            *(_QWORD *)&v4[v149] = v150 + 1;
            v23 |= (unint64_t)(v151 & 0x7F) << v147;
            if (v151 < 0)
            {
              v147 += 7;
              v18 = v148++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_590;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_590:
        v361 = 188;
        goto LABEL_756;
      case 0x1Bu:
        v152 = 0;
        v153 = 0;
        v23 = 0;
        v5->_hasPredVolSiriPrct = 1;
        while (2)
        {
          v154 = *v8;
          v155 = *(_QWORD *)&v4[v154];
          if (v155 == -1 || v155 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v156 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v155);
            *(_QWORD *)&v4[v154] = v155 + 1;
            v23 |= (unint64_t)(v156 & 0x7F) << v152;
            if (v156 < 0)
            {
              v152 += 7;
              v18 = v153++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_594;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_594:
        v361 = 192;
        goto LABEL_756;
      case 0x1Cu:
        v157 = 0;
        v158 = 0;
        v23 = 0;
        v5->_hasOnStartPredictionFlag = 1;
        while (2)
        {
          v159 = *v8;
          v160 = *(_QWORD *)&v4[v159];
          if (v160 == -1 || v160 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v161 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v160);
            *(_QWORD *)&v4[v159] = v160 + 1;
            v23 |= (unint64_t)(v161 & 0x7F) << v157;
            if (v161 < 0)
            {
              v157 += 7;
              v18 = v158++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_598;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_598:
        v361 = 196;
        goto LABEL_756;
      case 0x1Du:
        v162 = 0;
        v163 = 0;
        v23 = 0;
        v5->_hasGuardrailsAvoidFlag = 1;
        while (2)
        {
          v164 = *v8;
          v165 = *(_QWORD *)&v4[v164];
          if (v165 == -1 || v165 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v166 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v165);
            *(_QWORD *)&v4[v164] = v165 + 1;
            v23 |= (unint64_t)(v166 & 0x7F) << v162;
            if (v166 < 0)
            {
              v162 += 7;
              v18 = v163++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_602;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_602:
        v361 = 200;
        goto LABEL_756;
      case 0x1Eu:
        v167 = 0;
        v168 = 0;
        v23 = 0;
        v5->_hasMinMaxCutFlag = 1;
        while (2)
        {
          v169 = *v8;
          v170 = *(_QWORD *)&v4[v169];
          if (v170 == -1 || v170 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v171 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v170);
            *(_QWORD *)&v4[v169] = v170 + 1;
            v23 |= (unint64_t)(v171 & 0x7F) << v167;
            if (v171 < 0)
            {
              v167 += 7;
              v18 = v168++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_606;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_606:
        v361 = 204;
        goto LABEL_756;
      case 0x1Fu:
        v172 = 0;
        v173 = 0;
        v23 = 0;
        v5->_hasManualVolumeChangeFlag = 1;
        while (2)
        {
          v174 = *v8;
          v175 = *(_QWORD *)&v4[v174];
          if (v175 == -1 || v175 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v176 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v175);
            *(_QWORD *)&v4[v174] = v175 + 1;
            v23 |= (unint64_t)(v176 & 0x7F) << v172;
            if (v176 < 0)
            {
              v172 += 7;
              v18 = v173++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_610;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_610:
        v361 = 208;
        goto LABEL_756;
      case 0x20u:
        v177 = 0;
        v178 = 0;
        v23 = 0;
        v5->_hasBigWindowSize = 1;
        while (2)
        {
          v179 = *v8;
          v180 = *(_QWORD *)&v4[v179];
          if (v180 == -1 || v180 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v181 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v180);
            *(_QWORD *)&v4[v179] = v180 + 1;
            v23 |= (unint64_t)(v181 & 0x7F) << v177;
            if (v181 < 0)
            {
              v177 += 7;
              v18 = v178++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_614;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_614:
        v361 = 212;
        goto LABEL_756;
      case 0x21u:
        v182 = 0;
        v183 = 0;
        v23 = 0;
        v5->_hasSmallWindowSize = 1;
        while (2)
        {
          v184 = *v8;
          v185 = *(_QWORD *)&v4[v184];
          if (v185 == -1 || v185 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v186 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v185);
            *(_QWORD *)&v4[v184] = v185 + 1;
            v23 |= (unint64_t)(v186 & 0x7F) << v182;
            if (v186 < 0)
            {
              v182 += 7;
              v18 = v183++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_618;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_618:
        v361 = 216;
        goto LABEL_756;
      case 0x22u:
        PBReaderReadString();
        v187 = objc_claimAutoreleasedReturnValue();
        v188 = 344;
        goto LABEL_255;
      case 0x23u:
        PBReaderReadString();
        v187 = objc_claimAutoreleasedReturnValue();
        v188 = 352;
LABEL_255:
        v189 = *(Class *)((char *)&v5->super.super.isa + v188);
        *(Class *)((char *)&v5->super.super.isa + v188) = (Class)v187;

        goto LABEL_757;
      case 0x24u:
        v190 = 0;
        v191 = 0;
        v23 = 0;
        v5->_hasAnchorVol = 1;
        while (2)
        {
          v192 = *v8;
          v193 = *(_QWORD *)&v4[v192];
          if (v193 == -1 || v193 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v194 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v193);
            *(_QWORD *)&v4[v192] = v193 + 1;
            v23 |= (unint64_t)(v194 & 0x7F) << v190;
            if (v194 < 0)
            {
              v190 += 7;
              v18 = v191++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_622;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_622:
        v361 = 220;
        goto LABEL_756;
      case 0x25u:
        v195 = 0;
        v196 = 0;
        v23 = 0;
        v5->_hasAnchorEnv = 1;
        while (2)
        {
          v197 = *v8;
          v198 = *(_QWORD *)&v4[v197];
          if (v198 == -1 || v198 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v199 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v198);
            *(_QWORD *)&v4[v197] = v198 + 1;
            v23 |= (unint64_t)(v199 & 0x7F) << v195;
            if (v199 < 0)
            {
              v195 += 7;
              v18 = v196++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_626;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_626:
        v361 = 224;
        goto LABEL_756;
      case 0x26u:
        v200 = 0;
        v201 = 0;
        v23 = 0;
        v5->_hasPersonalizationCoeff = 1;
        while (2)
        {
          v202 = *v8;
          v203 = *(_QWORD *)&v4[v202];
          if (v203 == -1 || v203 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v204 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v203);
            *(_QWORD *)&v4[v202] = v203 + 1;
            v23 |= (unint64_t)(v204 & 0x7F) << v200;
            if (v204 < 0)
            {
              v200 += 7;
              v18 = v201++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_630;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_630:
        v361 = 228;
        goto LABEL_756;
      case 0x27u:
        v205 = 0;
        v206 = 0;
        v23 = 0;
        v5->_hasUnsignedPredVolMediaPrct = 1;
        while (2)
        {
          v207 = *v8;
          v208 = *(_QWORD *)&v4[v207];
          if (v208 == -1 || v208 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v209 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v208);
            *(_QWORD *)&v4[v207] = v208 + 1;
            v23 |= (unint64_t)(v209 & 0x7F) << v205;
            if (v209 < 0)
            {
              v205 += 7;
              v18 = v206++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_634;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_634:
        v361 = 232;
        goto LABEL_756;
      case 0x28u:
        v210 = 0;
        v211 = 0;
        v23 = 0;
        v5->_hasUnsignedPredVolTelephonyPrct = 1;
        while (2)
        {
          v212 = *v8;
          v213 = *(_QWORD *)&v4[v212];
          if (v213 == -1 || v213 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v214 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v213);
            *(_QWORD *)&v4[v212] = v213 + 1;
            v23 |= (unint64_t)(v214 & 0x7F) << v210;
            if (v214 < 0)
            {
              v210 += 7;
              v18 = v211++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_638;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_638:
        v361 = 236;
        goto LABEL_756;
      case 0x29u:
        v215 = 0;
        v216 = 0;
        v23 = 0;
        v5->_hasUnsignedPredVolSiriPrct = 1;
        while (2)
        {
          v217 = *v8;
          v218 = *(_QWORD *)&v4[v217];
          if (v218 == -1 || v218 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v219 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v218);
            *(_QWORD *)&v4[v217] = v218 + 1;
            v23 |= (unint64_t)(v219 & 0x7F) << v215;
            if (v219 < 0)
            {
              v215 += 7;
              v18 = v216++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_642;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_642:
        v361 = 240;
        goto LABEL_756;
      case 0x2Au:
        v220 = 0;
        v221 = 0;
        v23 = 0;
        v5->_hasSingleBudFlag = 1;
        while (2)
        {
          v222 = *v8;
          v223 = *(_QWORD *)&v4[v222];
          if (v223 == -1 || v223 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v224 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v223);
            *(_QWORD *)&v4[v222] = v223 + 1;
            v23 |= (unint64_t)(v224 & 0x7F) << v220;
            if (v224 < 0)
            {
              v220 += 7;
              v18 = v221++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_646;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_646:
        v361 = 244;
        goto LABEL_756;
      case 0x2Bu:
        v225 = 0;
        v226 = 0;
        v23 = 0;
        v5->_hasCdEngagementFlag = 1;
        while (2)
        {
          v227 = *v8;
          v228 = *(_QWORD *)&v4[v227];
          if (v228 == -1 || v228 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v229 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v228);
            *(_QWORD *)&v4[v227] = v228 + 1;
            v23 |= (unint64_t)(v229 & 0x7F) << v225;
            if (v229 < 0)
            {
              v225 += 7;
              v18 = v226++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_650;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_650:
        v361 = 248;
        goto LABEL_756;
      case 0x2Cu:
        v230 = 0;
        v231 = 0;
        v23 = 0;
        v5->_hasActiveStreamFlag = 1;
        while (2)
        {
          v232 = *v8;
          v233 = *(_QWORD *)&v4[v232];
          if (v233 == -1 || v233 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v234 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v233);
            *(_QWORD *)&v4[v232] = v233 + 1;
            v23 |= (unint64_t)(v234 & 0x7F) << v230;
            if (v234 < 0)
            {
              v230 += 7;
              v18 = v231++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_654;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_654:
        v361 = 252;
        goto LABEL_756;
      case 0x2Du:
        v235 = 0;
        v236 = 0;
        v23 = 0;
        v5->_hasPvFeatureEnableFlag = 1;
        while (2)
        {
          v237 = *v8;
          v238 = *(_QWORD *)&v4[v237];
          if (v238 == -1 || v238 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v239 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v238);
            *(_QWORD *)&v4[v237] = v238 + 1;
            v23 |= (unint64_t)(v239 & 0x7F) << v235;
            if (v239 < 0)
            {
              v235 += 7;
              v18 = v236++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_658;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_658:
        v361 = 256;
        goto LABEL_756;
      case 0x2Eu:
        v240 = 0;
        v241 = 0;
        v242 = 0;
        v243 = (void *)MEMORY[0x1E0CB37E8];
        while (2)
        {
          v244 = *v8;
          v245 = *(_QWORD *)&v4[v244];
          if (v245 == -1 || v245 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v246 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v245);
            *(_QWORD *)&v4[v244] = v245 + 1;
            v242 |= (unint64_t)(v246 & 0x7F) << v240;
            if (v246 < 0)
            {
              v240 += 7;
              v18 = v241++ >= 9;
              if (v18)
              {
                v247 = 0;
                goto LABEL_663;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          v247 = 0;
        else
          v247 = v242;
LABEL_663:
        objc_msgSend(v243, "numberWithUnsignedInt:", v247);
        v362 = objc_claimAutoreleasedReturnValue();
        if (!v362)
          goto LABEL_762;
        v363 = (void *)v362;
        v364 = v6;
        goto LABEL_707;
      case 0x2Fu:
        v248 = 0;
        v249 = 0;
        v23 = 0;
        v5->_hasWindStrength = 1;
        while (2)
        {
          v250 = *v8;
          v251 = *(_QWORD *)&v4[v250];
          if (v251 == -1 || v251 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v252 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v251);
            *(_QWORD *)&v4[v250] = v251 + 1;
            v23 |= (unint64_t)(v252 & 0x7F) << v248;
            if (v252 < 0)
            {
              v248 += 7;
              v18 = v249++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_668;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_668:
        v361 = 260;
        goto LABEL_756;
      case 0x30u:
        v253 = 0;
        v254 = 0;
        v23 = 0;
        v5->_hasWindProb = 1;
        while (2)
        {
          v255 = *v8;
          v256 = *(_QWORD *)&v4[v255];
          if (v256 == -1 || v256 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v257 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v256);
            *(_QWORD *)&v4[v255] = v256 + 1;
            v23 |= (unint64_t)(v257 & 0x7F) << v253;
            if (v257 < 0)
            {
              v253 += 7;
              v18 = v254++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_672;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_672:
        v361 = 264;
        goto LABEL_756;
      case 0x31u:
        v258 = 0;
        v259 = 0;
        v23 = 0;
        v5->_hasMediaType = 1;
        while (2)
        {
          v260 = *v8;
          v261 = *(_QWORD *)&v4[v260];
          if (v261 == -1 || v261 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v262 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v261);
            *(_QWORD *)&v4[v260] = v261 + 1;
            v23 |= (unint64_t)(v262 & 0x7F) << v258;
            if (v262 < 0)
            {
              v258 += 7;
              v18 = v259++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_676;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_676:
        v361 = 268;
        goto LABEL_756;
      case 0x32u:
        v263 = 0;
        v264 = 0;
        v23 = 0;
        v5->_hasSourceActivity = 1;
        while (2)
        {
          v265 = *v8;
          v266 = *(_QWORD *)&v4[v265];
          if (v266 == -1 || v266 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v267 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v266);
            *(_QWORD *)&v4[v265] = v266 + 1;
            v23 |= (unint64_t)(v267 & 0x7F) << v263;
            if (v267 < 0)
            {
              v263 += 7;
              v18 = v264++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_680;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_680:
        v361 = 272;
        goto LABEL_756;
      case 0x33u:
        v268 = 0;
        v269 = 0;
        v23 = 0;
        v5->_hasBudActivity = 1;
        while (2)
        {
          v270 = *v8;
          v271 = *(_QWORD *)&v4[v270];
          if (v271 == -1 || v271 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v272 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v271);
            *(_QWORD *)&v4[v270] = v271 + 1;
            v23 |= (unint64_t)(v272 & 0x7F) << v268;
            if (v272 < 0)
            {
              v268 += 7;
              v18 = v269++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_684;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_684:
        v361 = 276;
        goto LABEL_756;
      case 0x34u:
        v273 = 0;
        v274 = 0;
        v23 = 0;
        v5->_hasLocation = 1;
        while (2)
        {
          v275 = *v8;
          v276 = *(_QWORD *)&v4[v275];
          if (v276 == -1 || v276 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v277 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v276);
            *(_QWORD *)&v4[v275] = v276 + 1;
            v23 |= (unint64_t)(v277 & 0x7F) << v273;
            if (v277 < 0)
            {
              v273 += 7;
              v18 = v274++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_688;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_688:
        v361 = 280;
        goto LABEL_756;
      case 0x35u:
        v278 = 0;
        v279 = 0;
        v23 = 0;
        v5->_hasLocationType = 1;
        while (2)
        {
          v280 = *v8;
          v281 = *(_QWORD *)&v4[v280];
          if (v281 == -1 || v281 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v282 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v281);
            *(_QWORD *)&v4[v280] = v281 + 1;
            v23 |= (unint64_t)(v282 & 0x7F) << v278;
            if (v282 < 0)
            {
              v278 += 7;
              v18 = v279++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_692;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_692:
        v361 = 284;
        goto LABEL_756;
      case 0x36u:
        v283 = 0;
        v284 = 0;
        v23 = 0;
        v5->_hasFocusMode = 1;
        while (2)
        {
          v285 = *v8;
          v286 = *(_QWORD *)&v4[v285];
          if (v286 == -1 || v286 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v287 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v286);
            *(_QWORD *)&v4[v285] = v286 + 1;
            v23 |= (unint64_t)(v287 & 0x7F) << v283;
            if (v287 < 0)
            {
              v283 += 7;
              v18 = v284++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_696;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_696:
        v361 = 288;
        goto LABEL_756;
      case 0x37u:
        v288 = 0;
        v289 = 0;
        v23 = 0;
        v5->_hasStreamingAppBundleId = 1;
        while (2)
        {
          v290 = *v8;
          v291 = *(_QWORD *)&v4[v290];
          if (v291 == -1 || v291 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v292 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v291);
            *(_QWORD *)&v4[v290] = v291 + 1;
            v23 |= (unint64_t)(v292 & 0x7F) << v288;
            if (v292 < 0)
            {
              v288 += 7;
              v18 = v289++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_700;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_700:
        v361 = 292;
        goto LABEL_756;
      case 0x38u:
        v293 = 0;
        v294 = 0;
        v295 = 0;
        v296 = (void *)MEMORY[0x1E0CB37E8];
        while (2)
        {
          v297 = *v8;
          v298 = *(_QWORD *)&v4[v297];
          if (v298 == -1 || v298 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v299 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v298);
            *(_QWORD *)&v4[v297] = v298 + 1;
            v295 |= (unint64_t)(v299 & 0x7F) << v293;
            if (v299 < 0)
            {
              v293 += 7;
              v18 = v294++ >= 9;
              if (v18)
              {
                v300 = 0;
                goto LABEL_705;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          v300 = 0;
        else
          v300 = v295;
LABEL_705:
        objc_msgSend(v296, "numberWithUnsignedInt:", v300);
        v365 = objc_claimAutoreleasedReturnValue();
        if (v365)
        {
          v363 = (void *)v365;
          v364 = v7;
LABEL_707:
          objc_msgSend(v364, "addObject:", v363);

LABEL_757:
          if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
            goto LABEL_758;
          continue;
        }
LABEL_762:

LABEL_759:
        v371 = 0;
LABEL_761:

        return v371;
      case 0x39u:
        v301 = 0;
        v302 = 0;
        v23 = 0;
        v5->_hasInstdBA = 1;
        while (2)
        {
          v303 = *v8;
          v304 = *(_QWORD *)&v4[v303];
          if (v304 == -1 || v304 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v305 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v304);
            *(_QWORD *)&v4[v303] = v304 + 1;
            v23 |= (unint64_t)(v305 & 0x7F) << v301;
            if (v305 < 0)
            {
              v301 += 7;
              v18 = v302++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_711;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_711:
        v361 = 296;
        goto LABEL_756;
      case 0x3Au:
        v306 = 0;
        v307 = 0;
        v23 = 0;
        v5->_hasInstdBC = 1;
        while (2)
        {
          v308 = *v8;
          v309 = *(_QWORD *)&v4[v308];
          if (v309 == -1 || v309 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v310 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v309);
            *(_QWORD *)&v4[v308] = v309 + 1;
            v23 |= (unint64_t)(v310 & 0x7F) << v306;
            if (v310 < 0)
            {
              v306 += 7;
              v18 = v307++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_715;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_715:
        v361 = 300;
        goto LABEL_756;
      case 0x3Bu:
        v311 = 0;
        v312 = 0;
        v23 = 0;
        v5->_hasNonCAListeningMode = 1;
        while (2)
        {
          v313 = *v8;
          v314 = *(_QWORD *)&v4[v313];
          if (v314 == -1 || v314 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v315 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v314);
            *(_QWORD *)&v4[v313] = v314 + 1;
            v23 |= (unint64_t)(v315 & 0x7F) << v311;
            if (v315 < 0)
            {
              v311 += 7;
              v18 = v312++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_719;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_719:
        v361 = 304;
        goto LABEL_756;
      case 0x3Cu:
        v316 = 0;
        v317 = 0;
        v23 = 0;
        v5->_hasFit = 1;
        while (2)
        {
          v318 = *v8;
          v319 = *(_QWORD *)&v4[v318];
          if (v319 == -1 || v319 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v320 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v319);
            *(_QWORD *)&v4[v318] = v319 + 1;
            v23 |= (unint64_t)(v320 & 0x7F) << v316;
            if (v320 < 0)
            {
              v316 += 7;
              v18 = v317++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_723;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_723:
        v361 = 308;
        goto LABEL_756;
      case 0x3Du:
        v321 = 0;
        v322 = 0;
        v23 = 0;
        v5->_hasFixedAutoAncGain = 1;
        while (2)
        {
          v323 = *v8;
          v324 = *(_QWORD *)&v4[v323];
          if (v324 == -1 || v324 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v325 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v324);
            *(_QWORD *)&v4[v323] = v324 + 1;
            v23 |= (unint64_t)(v325 & 0x7F) << v321;
            if (v325 < 0)
            {
              v321 += 7;
              v18 = v322++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_727;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_727:
        v361 = 312;
        goto LABEL_756;
      case 0x3Eu:
        v326 = 0;
        v327 = 0;
        v23 = 0;
        v5->_hasAdjustedAutoAncGain = 1;
        while (2)
        {
          v328 = *v8;
          v329 = *(_QWORD *)&v4[v328];
          if (v329 == -1 || v329 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v330 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v329);
            *(_QWORD *)&v4[v328] = v329 + 1;
            v23 |= (unint64_t)(v330 & 0x7F) << v326;
            if (v330 < 0)
            {
              v326 += 7;
              v18 = v327++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_731;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_731:
        v361 = 316;
        goto LABEL_756;
      case 0x3Fu:
        v331 = 0;
        v332 = 0;
        v23 = 0;
        v5->_hasTimestamp = 1;
        while (2)
        {
          v333 = *v8;
          v334 = *(_QWORD *)&v4[v333];
          if (v334 == -1 || v334 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v335 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v334);
            *(_QWORD *)&v4[v333] = v334 + 1;
            v23 |= (unint64_t)(v335 & 0x7F) << v331;
            if (v335 < 0)
            {
              v331 += 7;
              v18 = v332++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_735;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_735:
        v361 = 320;
        goto LABEL_756;
      case 0x40u:
        v336 = 0;
        v337 = 0;
        v23 = 0;
        v5->_hasDRCenablementBit = 1;
        while (2)
        {
          v338 = *v8;
          v339 = *(_QWORD *)&v4[v338];
          if (v339 == -1 || v339 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v340 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v339);
            *(_QWORD *)&v4[v338] = v339 + 1;
            v23 |= (unint64_t)(v340 & 0x7F) << v336;
            if (v340 < 0)
            {
              v336 += 7;
              v18 = v337++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_739;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_739:
        v361 = 324;
        goto LABEL_756;
      case 0x41u:
        v341 = 0;
        v342 = 0;
        v23 = 0;
        v5->_hasDRCwindFlag = 1;
        while (2)
        {
          v343 = *v8;
          v344 = *(_QWORD *)&v4[v343];
          if (v344 == -1 || v344 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v345 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v344);
            *(_QWORD *)&v4[v343] = v344 + 1;
            v23 |= (unint64_t)(v345 & 0x7F) << v341;
            if (v345 < 0)
            {
              v341 += 7;
              v18 = v342++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_743;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_743:
        v361 = 328;
        goto LABEL_756;
      case 0x42u:
        v346 = 0;
        v347 = 0;
        v23 = 0;
        v5->_hasDRCappSelfVoiceFlag = 1;
        while (2)
        {
          v348 = *v8;
          v349 = *(_QWORD *)&v4[v348];
          if (v349 == -1 || v349 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v350 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v349);
            *(_QWORD *)&v4[v348] = v349 + 1;
            v23 |= (unint64_t)(v350 & 0x7F) << v346;
            if (v350 < 0)
            {
              v346 += 7;
              v18 = v347++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_747;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_747:
        v361 = 332;
        goto LABEL_756;
      case 0x43u:
        v351 = 0;
        v352 = 0;
        v23 = 0;
        v5->_hasDrumDRC = 1;
        while (2)
        {
          v353 = *v8;
          v354 = *(_QWORD *)&v4[v353];
          if (v354 == -1 || v354 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v355 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v354);
            *(_QWORD *)&v4[v353] = v354 + 1;
            v23 |= (unint64_t)(v355 & 0x7F) << v351;
            if (v355 < 0)
            {
              v351 += 7;
              v18 = v352++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_751;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_751:
        v361 = 336;
        goto LABEL_756;
      case 0x44u:
        v356 = 0;
        v357 = 0;
        v23 = 0;
        v5->_hasRoutedDRCGain = 1;
        while (2)
        {
          v358 = *v8;
          v359 = *(_QWORD *)&v4[v358];
          if (v359 == -1 || v359 >= *(_QWORD *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            v360 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v359);
            *(_QWORD *)&v4[v358] = v359 + 1;
            v23 |= (unint64_t)(v360 & 0x7F) << v356;
            if (v360 < 0)
            {
              v356 += 7;
              v18 = v357++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_755;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10])
          LODWORD(v23) = 0;
LABEL_755:
        v361 = 340;
LABEL_756:
        *(_DWORD *)((char *)&v5->super.super.isa + v361) = v23;
        goto LABEL_757;
      default:
        if (!PBReaderSkipValueWithTag())
          goto LABEL_762;
        goto LABEL_757;
    }
  }
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasControllerVersion)
    PBDataWriterWriteUint32Field();
  if (self->_hasRefMicdBA)
    PBDataWriterWriteUint32Field();
  if (self->_hasRefMicdBC)
    PBDataWriterWriteUint32Field();
  if (self->_hasDrumdBA)
    PBDataWriterWriteUint32Field();
  if (self->_hasDrumdBK)
    PBDataWriterWriteUint32Field();
  if (self->_hasDrumdBAPredicted)
    PBDataWriterWriteUint32Field();
  if (self->_hasDownlinkdBA)
    PBDataWriterWriteUint32Field();
  if (self->_hasCurrentVolumePrct)
    PBDataWriterWriteUint32Field();
  if (self->_hasLastUserVolChangeType)
    PBDataWriterWriteUint32Field();
  if (self->_hasHeadphoneMode)
    PBDataWriterWriteUint32Field();
  if (self->_hasStreamType)
    PBDataWriterWriteUint32Field();
  if (self->_hasWindSpeechAggressorFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasVolumeChangeFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasSpeechPresenceProbability)
    PBDataWriterWriteUint32Field();
  if (self->_hasPersonalizationParamSnr)
    PBDataWriterWriteInt32Field();
  if (self->_hasPersonalizationParamMistakes)
    PBDataWriterWriteInt32Field();
  if (self->_hasLastEMediadBA)
    PBDataWriterWriteUint32Field();
  if (self->_hasLastVolMediaPrct)
    PBDataWriterWriteUint32Field();
  if (self->_hasLastETelephonydBA)
    PBDataWriterWriteUint32Field();
  if (self->_hasLastVolTelephonyPrct)
    PBDataWriterWriteUint32Field();
  if (self->_hasLastESiridBA)
    PBDataWriterWriteUint32Field();
  if (self->_hasLastVolSiriPrct)
    PBDataWriterWriteUint32Field();
  if (self->_hasSmoothEae)
    PBDataWriterWriteUint32Field();
  if (self->_hasDesiredDeltaE)
    PBDataWriterWriteInt32Field();
  if (self->_hasPredVolMediaPrct)
    PBDataWriterWriteInt32Field();
  if (self->_hasPredVolTelephonyPrct)
    PBDataWriterWriteInt32Field();
  if (self->_hasPredVolSiriPrct)
    PBDataWriterWriteInt32Field();
  if (self->_hasOnStartPredictionFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasGuardrailsAvoidFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasMinMaxCutFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasManualVolumeChangeFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasBigWindowSize)
    PBDataWriterWriteUint32Field();
  if (self->_hasSmallWindowSize)
    PBDataWriterWriteUint32Field();
  if (self->_activeAppName)
    PBDataWriterWriteStringField();
  if (self->_activeAirpodsSerialNumber)
    PBDataWriterWriteStringField();
  if (self->_hasAnchorVol)
    PBDataWriterWriteUint32Field();
  if (self->_hasAnchorEnv)
    PBDataWriterWriteUint32Field();
  if (self->_hasPersonalizationCoeff)
    PBDataWriterWriteUint32Field();
  if (self->_hasUnsignedPredVolMediaPrct)
    PBDataWriterWriteUint32Field();
  if (self->_hasUnsignedPredVolTelephonyPrct)
    PBDataWriterWriteUint32Field();
  if (self->_hasUnsignedPredVolSiriPrct)
    PBDataWriterWriteUint32Field();
  if (self->_hasSingleBudFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasCdEngagementFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasActiveStreamFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasPvFeatureEnableFlag)
    PBDataWriterWriteUint32Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_envSpectralData32B;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_hasWindStrength)
    PBDataWriterWriteUint32Field();
  if (self->_hasWindProb)
    PBDataWriterWriteUint32Field();
  if (self->_hasMediaType)
    PBDataWriterWriteUint32Field();
  if (self->_hasSourceActivity)
    PBDataWriterWriteUint32Field();
  if (self->_hasBudActivity)
    PBDataWriterWriteUint32Field();
  if (self->_hasLocation)
    PBDataWriterWriteUint32Field();
  if (self->_hasLocationType)
    PBDataWriterWriteUint32Field();
  if (self->_hasFocusMode)
    PBDataWriterWriteUint32Field();
  if (self->_hasStreamingAppBundleId)
    PBDataWriterWriteUint32Field();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_noiseType4B;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "unsignedIntValue", (_QWORD)v15);
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_hasInstdBA)
    PBDataWriterWriteUint32Field();
  if (self->_hasInstdBC)
    PBDataWriterWriteUint32Field();
  if (self->_hasNonCAListeningMode)
    PBDataWriterWriteUint32Field();
  if (self->_hasFit)
    PBDataWriterWriteUint32Field();
  if (self->_hasFixedAutoAncGain)
    PBDataWriterWriteUint32Field();
  if (self->_hasAdjustedAutoAncGain)
    PBDataWriterWriteUint32Field();
  if (self->_hasTimestamp)
    PBDataWriterWriteUint32Field();
  if (self->_hasDRCenablementBit)
    PBDataWriterWriteUint32Field();
  if (self->_hasDRCwindFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasDRCappSelfVoiceFlag)
    PBDataWriterWriteUint32Field();
  if (self->_hasDrumDRC)
    PBDataWriterWriteUint32Field();
  if (self->_hasRoutedDRCGain)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceAdaptiveVolume writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceAdaptiveVolume)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  BMDeviceAdaptiveVolume *v49;
  BMDeviceAdaptiveVolume *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  id *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  BMDeviceAdaptiveVolume *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id *v73;
  id v74;
  BMDeviceAdaptiveVolume *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id *v85;
  uint64_t v86;
  void *v87;
  id v88;
  id *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  id v95;
  uint64_t v96;
  void *v97;
  id v98;
  id *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  void *v107;
  id v108;
  void *v109;
  id *v110;
  id *v111;
  id v112;
  uint64_t v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  uint64_t v120;
  void *v121;
  id v122;
  id v123;
  uint64_t v124;
  void *v125;
  id v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  int v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  id v184;
  uint64_t v185;
  void *v186;
  id v187;
  uint64_t v188;
  void *v189;
  void *v190;
  id v191;
  uint64_t v192;
  void *v193;
  void *v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  id v199;
  uint64_t v200;
  id *v201;
  uint64_t v202;
  void *v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  id v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  id v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  id v236;
  id v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  id v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  id v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  id v253;
  uint64_t v254;
  id v255;
  uint64_t v256;
  void *v257;
  id v258;
  uint64_t v259;
  void *v260;
  uint64_t v261;
  void *v262;
  id v263;
  uint64_t v264;
  void *v265;
  uint64_t v266;
  void *v267;
  id v268;
  uint64_t v269;
  id *v270;
  uint64_t v271;
  void *v272;
  id v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  id v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t i;
  void *v282;
  id v283;
  void *v284;
  id v285;
  id v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  id v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  id v294;
  id v295;
  uint64_t v296;
  id v297;
  uint64_t v298;
  void *v299;
  void *v300;
  uint64_t v301;
  id v302;
  uint64_t v303;
  id v304;
  uint64_t v305;
  id v306;
  uint64_t v307;
  void *v308;
  id v309;
  uint64_t v310;
  id v311;
  id *v312;
  id v313;
  uint64_t v314;
  uint64_t v315;
  id v316;
  id *v317;
  id v318;
  uint64_t v319;
  void *v320;
  void *v321;
  id v322;
  id v323;
  uint64_t v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  id v329;
  id v330;
  uint64_t v331;
  void *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  id v338;
  void *v339;
  id v340;
  void *v341;
  id v342;
  id v343;
  uint64_t v344;
  id v345;
  uint64_t v346;
  id v347;
  uint64_t v348;
  id v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  uint64_t v353;
  id v354;
  uint64_t v355;
  id v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  id v362;
  uint64_t v363;
  id v364;
  id v366;
  uint64_t v367;
  id v368;
  uint64_t v369;
  id v370;
  uint64_t v371;
  id v372;
  uint64_t v373;
  id v374;
  uint64_t v375;
  id v376;
  uint64_t v377;
  id v378;
  uint64_t v379;
  id v380;
  uint64_t v381;
  id v382;
  uint64_t v383;
  id v384;
  uint64_t v385;
  id v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  id v390;
  void *v391;
  void *v392;
  uint64_t v393;
  uint64_t v394;
  id v395;
  void *v396;
  id v397;
  void *v398;
  id v399;
  id v400;
  void *v401;
  id v402;
  void *v403;
  id v404;
  void *v405;
  id v406;
  id v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  id v412;
  void *v413;
  id v414;
  id v415;
  id v416;
  id v417;
  void *v418;
  id v419;
  void *v420;
  id v421;
  void *v422;
  id v423;
  id v424;
  void *v425;
  void *v426;
  void *v427;
  uint64_t v428;
  id v429;
  id v430;
  id v431;
  id v432;
  void *v433;
  void *v434;
  id v435;
  id v436;
  void *v437;
  void *v438;
  id v439;
  id v440;
  void *v441;
  void *v442;
  id v443;
  id obj;
  id v445;
  id v446;
  void *v447;
  id v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  id v454;
  void *v455;
  id v456;
  void *v457;
  id v458;
  id v459;
  void *v460;
  id v461;
  void *v462;
  id v463;
  void *v464;
  id v465;
  void *v466;
  id v467;
  void *v468;
  id v469;
  void *v470;
  id v471;
  void *v472;
  id v473;
  void *v474;
  id v475;
  void *v476;
  id v477;
  void *v478;
  id v479;
  void *v480;
  _QWORD *v481;
  void *v482;
  id v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  id v488;
  id v489;
  id v490;
  void *v491;
  void *v492;
  id v493;
  id v494;
  void *v495;
  id v496;
  uint64_t v497;
  void *v498;
  id v499;
  uint64_t v500;
  void *v501;
  BMDeviceAdaptiveVolume *v502;
  id v503;
  uint64_t v504;
  void *v505;
  id *v506;
  id v507;
  uint64_t v508;
  id *v509;
  id *v510;
  id *v511;
  id *v512;
  id v513;
  id *v514;
  id *v515;
  id *v516;
  id *v517;
  id *v518;
  id *v519;
  id *v520;
  void *v521;
  void *v522;
  id v523;
  uint64_t v524;
  id *v525;
  void *v526;
  void *v527;
  id v528;
  id v529;
  void *v530;
  void *v531;
  id *v532;
  void *v533;
  id v534;
  id v535;
  id v536;
  id v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  void *v574;
  id v575;
  id v576;
  void *v577;
  void *v578;
  id v579;
  id v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  uint64_t v589;
  void *v590;
  uint64_t v591;
  id v592;
  uint64_t v593;
  id v594;
  uint64_t v595;
  id v596;
  uint64_t v597;
  id v598;
  uint64_t v599;
  id v600;
  uint64_t v601;
  id v602;
  uint64_t v603;
  id v604;
  uint64_t v605;
  id v606;
  uint64_t v607;
  id v608;
  uint64_t v609;
  id v610;
  uint64_t v611;
  id v612;
  uint64_t v613;
  void *v614;
  uint64_t v615;
  void *v616;
  _BYTE v617[128];
  uint64_t v618;
  void *v619;
  uint64_t v620;
  id v621;
  uint64_t v622;
  id v623;
  uint64_t v624;
  id v625;
  uint64_t v626;
  id v627;
  uint64_t v628;
  id v629;
  uint64_t v630;
  id v631;
  uint64_t v632;
  id v633;
  uint64_t v634;
  void *v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  id v639;
  uint64_t v640;
  id v641;
  _BYTE v642[128];
  uint64_t v643;
  void *v644;
  uint64_t v645;
  id v646;
  uint64_t v647;
  id v648;
  uint64_t v649;
  id v650;
  uint64_t v651;
  id v652;
  uint64_t v653;
  id v654;
  uint64_t v655;
  id v656;
  uint64_t v657;
  id v658;
  uint64_t v659;
  id v660;
  uint64_t v661;
  void *v662;
  uint64_t v663;
  void *v664;
  uint64_t v665;
  id v666;
  uint64_t v667;
  id v668;
  uint64_t v669;
  id v670;
  uint64_t v671;
  id v672;
  uint64_t v673;
  id v674;
  uint64_t v675;
  id v676;
  uint64_t v677;
  id v678;
  uint64_t v679;
  id v680;
  uint64_t v681;
  id v682;
  uint64_t v683;
  id v684;
  uint64_t v685;
  id v686;
  uint64_t v687;
  id v688;
  uint64_t v689;
  id v690;
  uint64_t v691;
  id v692;
  uint64_t v693;
  id v694;
  uint64_t v695;
  id *v696;
  uint64_t v697;
  void *v698;
  uint64_t v699;
  void *v700;
  uint64_t v701;
  id v702;
  uint64_t v703;
  void *v704;
  uint64_t v705;
  id v706;
  uint64_t v707;
  id v708;
  uint64_t v709;
  id v710;
  uint64_t v711;
  id v712;
  uint64_t v713;
  id v714;
  uint64_t v715;
  id *v716;
  uint64_t v717;
  id v718;
  uint64_t v719;
  id *v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  id v724;
  uint64_t v725;
  id *v726;
  uint64_t v727;
  id v728;
  uint64_t v729;
  void *v730;
  uint64_t v731;
  uint64_t v732;
  uint64_t v733;
  _QWORD v734[3];

  v734[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("controllerVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("refMicdBA"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v580 = v8;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("refMicdBC"));
      v11 = objc_claimAutoreleasedReturnValue();
      v578 = (void *)v11;
      if (!v11 || (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v13 = a4;
        v579 = 0;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("drumdBA"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v577 = v9;
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v63 = v14;
            if (!v13)
            {
              v60 = 0;
              v49 = 0;
LABEL_599:
              v12 = v578;
              goto LABEL_600;
            }
            v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v535 = v6;
            v66 = v10;
            v67 = self;
            v68 = *MEMORY[0x1E0D025B8];
            v727 = *MEMORY[0x1E0CB2D50];
            v575 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("drumdBA"));
            v728 = v575;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v728, &v727, 1);
            v69 = objc_claimAutoreleasedReturnValue();
            v70 = v65;
            v16 = (void *)v69;
            v71 = v68;
            self = v67;
            v10 = v66;
            v6 = v535;
            v60 = 0;
            v49 = 0;
            *v13 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2, v69);
            goto LABEL_598;
          }
          v574 = v14;
          v15 = v14;
        }
        else
        {
          v574 = v14;
          v15 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("drumdBK"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v534 = v15;
          v575 = 0;
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v534 = v15;
          v575 = v16;
LABEL_16:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("drumdBAPredicted"));
          v17 = objc_claimAutoreleasedReturnValue();
          v573 = (void *)v17;
          if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v532 = 0;
            goto LABEL_19;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v532 = v18;
LABEL_19:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("downlinkdBA"));
            v19 = objc_claimAutoreleasedReturnValue();
            v530 = v16;
            v533 = (void *)v19;
            if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v21 = 0;
LABEL_22:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currentVolumePrct"));
              v22 = objc_claimAutoreleasedReturnValue();
              v531 = (void *)v22;
              if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v13)
                  {
                    v24 = v6;
                    v25 = 0;
                    v49 = 0;
                    v63 = v574;
                    v60 = v534;
LABEL_594:
                    v13 = v532;
                    goto LABEL_595;
                  }
                  v537 = v6;
                  v528 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v84 = *MEMORY[0x1E0D025B8];
                  v719 = *MEMORY[0x1E0CB2D50];
                  v85 = v13;
                  v60 = v534;
                  v13 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("currentVolumePrct"));
                  v720 = v13;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v720, &v719, 1);
                  v86 = objc_claimAutoreleasedReturnValue();
                  v87 = v528;
                  v24 = v537;
                  v527 = (void *)v86;
                  v88 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v84, 2);
                  v25 = 0;
                  v49 = 0;
                  *v85 = v88;
                  v63 = v574;
                  goto LABEL_593;
                }
                v24 = v6;
                v25 = v23;
              }
              else
              {
                v24 = v6;
                v25 = 0;
              }
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lastUserVolChangeType"));
              v26 = objc_claimAutoreleasedReturnValue();
              v527 = (void *)v26;
              if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v525 = 0;
LABEL_28:
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("headphoneMode"));
                v28 = objc_claimAutoreleasedReturnValue();
                v526 = (void *)v28;
                if (v28 && (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!v13)
                    {
                      v523 = 0;
                      v49 = 0;
                      v63 = v574;
                      v60 = v534;
LABEL_591:
                      v13 = v525;
                      goto LABEL_592;
                    }
                    v539 = v24;
                    v95 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v524 = *MEMORY[0x1E0D025B8];
                    v715 = *MEMORY[0x1E0CB2D50];
                    v510 = v13;
                    v60 = v534;
                    v13 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("headphoneMode"));
                    v716 = v13;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v716, &v715, 1);
                    v96 = objc_claimAutoreleasedReturnValue();
                    v97 = v95;
                    v24 = v539;
                    v522 = (void *)v96;
                    v98 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v524, 2);
                    v523 = 0;
                    v49 = 0;
                    *v510 = v98;
                    v63 = v574;
                    goto LABEL_590;
                  }
                  v523 = v29;
                }
                else
                {
                  v523 = 0;
                }
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("streamType"));
                v30 = objc_claimAutoreleasedReturnValue();
                v522 = (void *)v30;
                if (!v30 || (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v506 = 0;
                  goto LABEL_34;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v506 = v31;
LABEL_34:
                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("windSpeechAggressorFlag"));
                  v32 = objc_claimAutoreleasedReturnValue();
                  v502 = self;
                  v521 = (void *)v32;
                  if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v507 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v507 = v33;
LABEL_37:
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("volumeChangeFlag"));
                    v34 = objc_claimAutoreleasedReturnValue();
                    v505 = (void *)v34;
                    if (!v34 || (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v503 = 0;
                      goto LABEL_40;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v503 = v35;
LABEL_40:
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("speechPresenceProbability"));
                      v36 = objc_claimAutoreleasedReturnValue();
                      v501 = (void *)v36;
                      if (!v36 || (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v499 = 0;
                        goto LABEL_43;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v499 = v37;
LABEL_43:
                        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("personalizationParamSnr"));
                        v38 = objc_claimAutoreleasedReturnValue();
                        v493 = v21;
                        v498 = (void *)v38;
                        if (!v38 || (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v496 = 0;
                          goto LABEL_46;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v496 = v39;
LABEL_46:
                          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("personalizationParamMistakes"));
                          v40 = objc_claimAutoreleasedReturnValue();
                          v495 = (void *)v40;
                          if (!v40 || (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v494 = 0;
LABEL_49:
                            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lastEMediadBA"));
                            v42 = (id)objc_claimAutoreleasedReturnValue();
                            v490 = v25;
                            v492 = v42;
                            if (!v42)
                              goto LABEL_117;
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v42 = 0;
                              goto LABEL_117;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v42 = v42;
LABEL_117:
                              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lastVolMediaPrct"));
                              v109 = (void *)objc_claimAutoreleasedReturnValue();
                              v110 = v13;
                              v491 = v42;
                              if (v109)
                              {
                                objc_opt_class();
                                v111 = v525;
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v489 = 0;
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v110)
                                    {
                                      v489 = 0;
                                      v49 = 0;
                                      v63 = v574;
                                      v60 = v534;
                                      v21 = v493;
LABEL_582:
                                      v13 = v506;
                                      goto LABEL_583;
                                    }
                                    v547 = v24;
                                    v187 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v188 = *MEMORY[0x1E0D025B8];
                                    v699 = *MEMORY[0x1E0CB2D50];
                                    v518 = v110;
                                    v21 = v493;
                                    v189 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lastVolMediaPrct"));
                                    v700 = v189;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v700, &v699, 1);
                                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                                    v190 = v187;
                                    v24 = v547;
                                    v489 = 0;
                                    v49 = 0;
                                    *v518 = (id)objc_msgSend(v190, "initWithDomain:code:userInfo:", v188, 2, v116);
                                    v63 = v574;
                                    goto LABEL_581;
                                  }
                                  v489 = v109;
                                }
                              }
                              else
                              {
                                v489 = 0;
                                v111 = v525;
                              }
                              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lastETelephonydBA"));
                              v116 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!v116 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v117 = v7;
                                v488 = 0;
LABEL_129:
                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lastVolTelephonyPrct"));
                                v118 = (id)objc_claimAutoreleasedReturnValue();
                                v485 = v116;
                                if (!v118)
                                {
                                  v513 = 0;
                                  goto LABEL_143;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v513 = v118;
                                  v118 = 0;
                                  goto LABEL_143;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v513 = v118;
                                  v118 = v118;
LABEL_143:
                                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lastESiridBA"));
                                  v127 = objc_claimAutoreleasedReturnValue();
                                  v487 = v118;
                                  v486 = (void *)v127;
                                  if (!v127
                                    || (v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v481 = 0;
                                    goto LABEL_146;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v481 = v128;
LABEL_146:
                                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lastVolSiriPrct"));
                                    v129 = objc_claimAutoreleasedReturnValue();
                                    v484 = (void *)v129;
                                    if (!v129
                                      || (v130 = (void *)v129, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v483 = 0;
                                      goto LABEL_149;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v483 = v130;
LABEL_149:
                                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("smoothEae"));
                                      v131 = objc_claimAutoreleasedReturnValue();
                                      v480 = (void *)v131;
                                      if (!v131
                                        || (v132 = (void *)v131, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v479 = 0;
                                        goto LABEL_152;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v479 = v132;
LABEL_152:
                                        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("desiredDeltaE"));
                                        v133 = objc_claimAutoreleasedReturnValue();
                                        v478 = (void *)v133;
                                        if (!v133
                                          || (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v477 = 0;
                                          goto LABEL_155;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v477 = v134;
LABEL_155:
                                          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("predVolMediaPrct"));
                                          v135 = objc_claimAutoreleasedReturnValue();
                                          v476 = (void *)v135;
                                          if (!v135
                                            || (v136 = (void *)v135,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v475 = 0;
                                            goto LABEL_158;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v475 = v136;
LABEL_158:
                                            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("predVolTelephonyPrct"));
                                            v137 = objc_claimAutoreleasedReturnValue();
                                            v474 = (void *)v137;
                                            if (!v137
                                              || (v138 = (void *)v137,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v473 = 0;
                                              goto LABEL_161;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v473 = v138;
LABEL_161:
                                              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("predVolSiriPrct"));
                                              v139 = objc_claimAutoreleasedReturnValue();
                                              v472 = (void *)v139;
                                              if (!v139
                                                || (v140 = (void *)v139,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v471 = 0;
                                                goto LABEL_164;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v471 = v140;
LABEL_164:
                                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("onStartPredictionFlag"));
                                                v141 = objc_claimAutoreleasedReturnValue();
                                                v470 = (void *)v141;
                                                if (!v141
                                                  || (v142 = (void *)v141,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v469 = 0;
                                                  goto LABEL_167;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v469 = v142;
LABEL_167:
                                                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("guardrailsAvoidFlag"));
                                                  v143 = objc_claimAutoreleasedReturnValue();
                                                  v468 = (void *)v143;
                                                  if (!v143
                                                    || (v144 = (void *)v143,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v467 = 0;
                                                    goto LABEL_170;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v467 = v144;
LABEL_170:
                                                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("minMaxCutFlag"));
                                                    v145 = objc_claimAutoreleasedReturnValue();
                                                    v466 = (void *)v145;
                                                    if (!v145
                                                      || (v146 = (void *)v145,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v465 = 0;
                                                      goto LABEL_173;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v465 = v146;
LABEL_173:
                                                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("manualVolumeChangeFlag"));
                                                      v147 = objc_claimAutoreleasedReturnValue();
                                                      v464 = (void *)v147;
                                                      if (!v147
                                                        || (v148 = (void *)v147,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v463 = 0;
                                                        goto LABEL_176;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v463 = v148;
LABEL_176:
                                                        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bigWindowSize"));
                                                        v149 = objc_claimAutoreleasedReturnValue();
                                                        v462 = (void *)v149;
                                                        if (!v149
                                                          || (v150 = (void *)v149,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v461 = 0;
                                                          goto LABEL_179;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v461 = v150;
LABEL_179:
                                                          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("smallWindowSize"));
                                                          v151 = objc_claimAutoreleasedReturnValue();
                                                          v460 = (void *)v151;
                                                          if (!v151
                                                            || (v152 = (void *)v151,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v459 = 0;
LABEL_182:
                                                            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("activeAppName"));
                                                            v153 = objc_claimAutoreleasedReturnValue();
                                                            v457 = (void *)v153;
                                                            if (v153
                                                              && (v154 = (void *)v153,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              v236 = v10;
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!v110)
                                                                {
                                                                  v458 = 0;
                                                                  v49 = 0;
                                                                  v63 = v574;
                                                                  v116 = v485;
                                                                  v193 = v513;
                                                                  v110 = (id *)v481;
                                                                  goto LABEL_565;
                                                                }
                                                                v253 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v254 = *MEMORY[0x1E0D025B8];
                                                                v667 = *MEMORY[0x1E0CB2D50];
                                                                v456 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activeAppName"));
                                                                v668 = v456;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v668, &v667, 1);
                                                                v455 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v458 = 0;
                                                                v49 = 0;
                                                                *v110 = (id)objc_msgSend(v253, "initWithDomain:code:userInfo:", v254, 2);
                                                                goto LABEL_356;
                                                              }
                                                              v458 = v154;
                                                              v116 = v485;
                                                            }
                                                            else
                                                            {
                                                              v458 = 0;
                                                            }
                                                            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("activeAirpodsSerialNumber"));
                                                            v155 = objc_claimAutoreleasedReturnValue();
                                                            v455 = (void *)v155;
                                                            if (!v155
                                                              || (v156 = (void *)v155,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v456 = 0;
LABEL_188:
                                                              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("anchorVol"));
                                                              v157 = objc_claimAutoreleasedReturnValue();
                                                              v572 = v117;
                                                              v453 = (void *)v157;
                                                              if (v157
                                                                && (v158 = (void *)v157,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                {
                                                                  if (!v110)
                                                                  {
                                                                    v454 = 0;
                                                                    v49 = 0;
                                                                    v63 = v574;
                                                                    v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    goto LABEL_562;
                                                                  }
                                                                  v563 = v24;
                                                                  v258 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v259 = *MEMORY[0x1E0D025B8];
                                                                  v663 = *MEMORY[0x1E0CB2D50];
                                                                  v116 = v485;
                                                                  v260 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("anchorVol"));
                                                                  v664 = v260;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v664, &v663, 1);
                                                                  v261 = objc_claimAutoreleasedReturnValue();
                                                                  v262 = v258;
                                                                  v24 = v563;
                                                                  v452 = (void *)v261;
                                                                  v454 = 0;
                                                                  v49 = 0;
                                                                  *v110 = (id)objc_msgSend(v262, "initWithDomain:code:userInfo:", v259, 2);
                                                                  goto LABEL_365;
                                                                }
                                                                v454 = v158;
                                                              }
                                                              else
                                                              {
                                                                v454 = 0;
                                                              }
                                                              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("anchorEnv"));
                                                              v159 = objc_claimAutoreleasedReturnValue();
                                                              v452 = (void *)v159;
                                                              if (!v159
                                                                || (v160 = (void *)v159,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v448 = 0;
LABEL_194:
                                                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("personalizationCoeff"));
                                                                v161 = objc_claimAutoreleasedReturnValue();
                                                                v449 = (void *)v161;
                                                                if (v161
                                                                  && (v162 = (void *)v161,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v565 = v24;
                                                                      v268 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v269 = *MEMORY[0x1E0D025B8];
                                                                      v659 = *MEMORY[0x1E0CB2D50];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      v445 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("personalizationCoeff"));
                                                                      v660 = v445;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v660, &v659, 1);
                                                                      v271 = objc_claimAutoreleasedReturnValue();
                                                                      v272 = v268;
                                                                      v24 = v565;
                                                                      v447 = (void *)v271;
                                                                      v446 = 0;
                                                                      v49 = 0;
                                                                      *v110 = (id)objc_msgSend(v272, "initWithDomain:code:userInfo:", v269, 2);
                                                                      v63 = v574;
                                                                      v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_558;
                                                                    }
                                                                    v265 = 0;
                                                                    v49 = 0;
                                                                    v63 = v574;
                                                                    v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    goto LABEL_559;
                                                                  }
                                                                  v446 = v162;
                                                                }
                                                                else
                                                                {
                                                                  v446 = 0;
                                                                }
                                                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("unsignedPredVolMediaPrct"));
                                                                v163 = objc_claimAutoreleasedReturnValue();
                                                                v447 = (void *)v163;
                                                                if (v163
                                                                  && (v164 = (void *)v163,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v566 = v24;
                                                                      v273 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v274 = *MEMORY[0x1E0D025B8];
                                                                      v657 = *MEMORY[0x1E0CB2D50];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      v443 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("unsignedPredVolMediaPrct"));
                                                                      v658 = v443;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v658, &v657, 1);
                                                                      v275 = objc_claimAutoreleasedReturnValue();
                                                                      v276 = v273;
                                                                      v24 = v566;
                                                                      v442 = (void *)v275;
                                                                      v445 = 0;
                                                                      v49 = 0;
                                                                      *v110 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v274, 2);
                                                                      v63 = v574;
                                                                      v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_557;
                                                                    }
                                                                    v445 = 0;
                                                                    v49 = 0;
                                                                    v63 = v574;
                                                                    v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_558;
                                                                  }
                                                                  v445 = v164;
                                                                }
                                                                else
                                                                {
                                                                  v445 = 0;
                                                                }
                                                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("unsignedPredVolTelephonyPrct"));
                                                                v165 = objc_claimAutoreleasedReturnValue();
                                                                v442 = (void *)v165;
                                                                if (v165
                                                                  && (v166 = (void *)v165,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v567 = v24;
                                                                      v286 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v287 = *MEMORY[0x1E0D025B8];
                                                                      v655 = *MEMORY[0x1E0CB2D50];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      v440 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("unsignedPredVolTelephonyPrct"));
                                                                      v656 = v440;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v656, &v655, 1);
                                                                      v288 = objc_claimAutoreleasedReturnValue();
                                                                      v289 = v286;
                                                                      v24 = v567;
                                                                      v441 = (void *)v288;
                                                                      v443 = 0;
                                                                      v49 = 0;
                                                                      *v110 = (id)objc_msgSend(v289, "initWithDomain:code:userInfo:", v287, 2);
                                                                      v63 = v574;
                                                                      v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_556;
                                                                    }
                                                                    v443 = 0;
                                                                    v49 = 0;
                                                                    v63 = v574;
                                                                    v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_557;
                                                                  }
                                                                  v443 = v166;
                                                                }
                                                                else
                                                                {
                                                                  v443 = 0;
                                                                }
                                                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("unsignedPredVolSiriPrct"));
                                                                v167 = objc_claimAutoreleasedReturnValue();
                                                                v441 = (void *)v167;
                                                                if (v167
                                                                  && (v168 = (void *)v167,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v568 = v24;
                                                                      v290 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v291 = *MEMORY[0x1E0D025B8];
                                                                      v653 = *MEMORY[0x1E0CB2D50];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      v439 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("unsignedPredVolSiriPrct"));
                                                                      v654 = v439;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v654, &v653, 1);
                                                                      v292 = objc_claimAutoreleasedReturnValue();
                                                                      v293 = v290;
                                                                      v24 = v568;
                                                                      v438 = (void *)v292;
                                                                      v440 = 0;
                                                                      v49 = 0;
                                                                      *v110 = (id)objc_msgSend(v293, "initWithDomain:code:userInfo:", v291, 2);
                                                                      v63 = v574;
                                                                      v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_555;
                                                                    }
                                                                    v440 = 0;
                                                                    v49 = 0;
                                                                    v63 = v574;
                                                                    v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_556;
                                                                  }
                                                                  v440 = v168;
                                                                }
                                                                else
                                                                {
                                                                  v440 = 0;
                                                                }
                                                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("singleBudFlag"));
                                                                v169 = objc_claimAutoreleasedReturnValue();
                                                                v438 = (void *)v169;
                                                                if (v169
                                                                  && (v170 = (void *)v169,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    v294 = v10;
                                                                    if (!v110)
                                                                    {
                                                                      v439 = 0;
                                                                      v49 = 0;
                                                                      v63 = v574;
                                                                      v116 = v485;
                                                                      v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      v270 = v506;
                                                                      goto LABEL_555;
                                                                    }
                                                                    v295 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v296 = *MEMORY[0x1E0D025B8];
                                                                    v651 = *MEMORY[0x1E0CB2D50];
                                                                    v436 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("singleBudFlag"));
                                                                    v652 = v436;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v652, &v651, 1);
                                                                    v437 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v439 = 0;
                                                                    v49 = 0;
                                                                    *v110 = (id)objc_msgSend(v295, "initWithDomain:code:userInfo:", v296, 2);
                                                                    goto LABEL_391;
                                                                  }
                                                                  v439 = v170;
                                                                }
                                                                else
                                                                {
                                                                  v439 = 0;
                                                                }
                                                                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("cdEngagementFlag"));
                                                                v171 = objc_claimAutoreleasedReturnValue();
                                                                v437 = (void *)v171;
                                                                if (!v171
                                                                  || (v172 = (void *)v171,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v436 = 0;
                                                                  goto LABEL_212;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v436 = v172;
LABEL_212:
                                                                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("activeStreamFlag"));
                                                                  v173 = objc_claimAutoreleasedReturnValue();
                                                                  v434 = (void *)v173;
                                                                  if (!v173
                                                                    || (v174 = (void *)v173,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v435 = 0;
                                                                    goto LABEL_215;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v435 = v174;
LABEL_215:
                                                                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("pvFeatureEnableFlag"));
                                                                    v175 = objc_claimAutoreleasedReturnValue();
                                                                    v529 = v10;
                                                                    v433 = (void *)v175;
                                                                    if (!v175
                                                                      || (v176 = (void *)v175,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v432 = 0;
                                                                      goto LABEL_218;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v432 = v176;
LABEL_218:
                                                                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("envSpectralData32B"));
                                                                      v177 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                      v178 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v179 = objc_msgSend(v177, "isEqual:", v178);

                                                                      if (v179)
                                                                      {

                                                                        v177 = 0;
                                                                      }
                                                                      else if (v177)
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          obj = v177;
                                                                          if (!v110)
                                                                          {
                                                                            v49 = 0;
                                                                            v10 = v529;
                                                                            v63 = v574;
                                                                            v116 = v485;
                                                                            v193 = v513;
                                                                            v110 = (id *)v481;
                                                                            v270 = v506;
                                                                            goto LABEL_551;
                                                                          }
                                                                          v312 = v110;
                                                                          v313 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v314 = *MEMORY[0x1E0D025B8];
                                                                          v643 = *MEMORY[0x1E0CB2D50];
                                                                          v450 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("envSpectralData32B"));
                                                                          v644 = v450;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v644, &v643, 1);
                                                                          v315 = objc_claimAutoreleasedReturnValue();
                                                                          v316 = (id)objc_msgSend(v313, "initWithDomain:code:userInfo:", v314, 2, v315);
                                                                          v49 = 0;
                                                                          *v312 = v316;
                                                                          v308 = (void *)v315;
                                                                          goto LABEL_383;
                                                                        }
                                                                      }
                                                                      v450 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v177, "count"));
                                                                      v585 = 0u;
                                                                      v586 = 0u;
                                                                      v587 = 0u;
                                                                      v588 = 0u;
                                                                      v277 = v177;
                                                                      v278 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v585, v642, 16);
                                                                      obj = v277;
                                                                      if (!v278)
                                                                        goto LABEL_348;
                                                                      v279 = v278;
                                                                      v280 = *(_QWORD *)v586;
                                                                      while (1)
                                                                      {
                                                                        for (i = 0; i != v279; ++i)
                                                                        {
                                                                          if (*(_QWORD *)v586 != v280)
                                                                            objc_enumerationMutation(obj);
                                                                          v282 = *(void **)(*((_QWORD *)&v585 + 1)
                                                                                          + 8 * i);
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            if (v110)
                                                                            {
                                                                              v297 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v298 = *MEMORY[0x1E0D025B8];
                                                                              v640 = *MEMORY[0x1E0CB2D50];
                                                                              v431 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("envSpectralData32B"));
                                                                              v641 = v431;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v641, &v640, 1);
                                                                              v299 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v300 = v297;
                                                                              v301 = v298;
LABEL_372:
                                                                              v49 = 0;
                                                                              *v110 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v301, 2, v299);
                                                                              v430 = obj;
                                                                              v10 = v529;
                                                                              v63 = v574;
                                                                              v116 = v485;
                                                                              v193 = v513;
                                                                              v110 = (id *)v481;
                                                                              v270 = v506;
                                                                              goto LABEL_547;
                                                                            }
LABEL_376:
                                                                            v49 = 0;
                                                                            v308 = obj;
LABEL_383:
                                                                            v10 = v529;
                                                                            v63 = v574;
                                                                            v116 = v485;
                                                                            v193 = v513;
                                                                            v110 = (id *)v481;
                                                                            v270 = v506;
                                                                            goto LABEL_549;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                          {
                                                                            if (v110)
                                                                            {
                                                                              v304 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                              v305 = *MEMORY[0x1E0D025B8];
                                                                              v638 = *MEMORY[0x1E0CB2D50];
                                                                              v431 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("envSpectralData32B"));
                                                                              v639 = v431;
                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v639, &v638, 1);
                                                                              v299 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v300 = v304;
                                                                              v301 = v305;
                                                                              goto LABEL_372;
                                                                            }
                                                                            goto LABEL_376;
                                                                          }
                                                                          v283 = v282;
                                                                          objc_msgSend(v450, "addObject:", v283);

                                                                        }
                                                                        v277 = obj;
                                                                        v279 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v585, v642, 16);
                                                                        if (!v279)
                                                                        {
LABEL_348:

                                                                          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("windStrength"));
                                                                          v284 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v482 = v109;
                                                                          if (v284)
                                                                          {
                                                                            v285 = v284;

                                                                            goto LABEL_386;
                                                                          }
                                                                          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("wind_strength"));
                                                                          v285 = (id)objc_claimAutoreleasedReturnValue();

                                                                          if (v285)
                                                                          {
LABEL_386:
                                                                            v317 = v110;
                                                                            objc_opt_class();
                                                                            v431 = v285;
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                              {
                                                                                if (v110)
                                                                                {
                                                                                  v318 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                  v319 = *MEMORY[0x1E0D025B8];
                                                                                  v636 = *MEMORY[0x1E0CB2D50];
                                                                                  v428 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("windStrength"));
                                                                                  v637 = v428;
                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v637, &v636, 1);
                                                                                  v320 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v430 = 0;
                                                                                  v49 = 0;
                                                                                  *v110 = (id)objc_msgSend(v318, "initWithDomain:code:userInfo:", v319, 2, v320);
                                                                                  goto LABEL_546;
                                                                                }
                                                                                v430 = 0;
                                                                                v49 = 0;
                                                                                v10 = v529;
                                                                                v63 = v574;
                                                                                v270 = v506;
                                                                                v116 = v485;
                                                                                v193 = v513;
                                                                                v110 = (id *)v481;
                                                                                goto LABEL_548;
                                                                              }
                                                                              v431 = v285;
                                                                              v430 = v431;
LABEL_401:
                                                                              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("windProb"));
                                                                              v321 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v569 = v24;
                                                                              if (v321)
                                                                              {
                                                                                v322 = v321;

                                                                                goto LABEL_404;
                                                                              }
                                                                              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("wind_prob"));
                                                                              v322 = (id)objc_claimAutoreleasedReturnValue();

                                                                              if (v322)
                                                                              {
LABEL_404:
                                                                                objc_opt_class();
                                                                                v429 = v322;
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  objc_opt_class();
                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                  {
                                                                                    if (v317)
                                                                                    {
                                                                                      v323 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                      v324 = *MEMORY[0x1E0D025B8];
                                                                                      v634 = *MEMORY[0x1E0CB2D50];
                                                                                      v325 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("windProb"));
                                                                                      v635 = v325;
                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v635, &v634, 1);
                                                                                      v326 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v428 = 0;
                                                                                      v49 = 0;
                                                                                      *v317 = (id)objc_msgSend(v323, "initWithDomain:code:userInfo:", v324, 2, v326);
                                                                                      goto LABEL_544;
                                                                                    }
                                                                                    v428 = 0;
                                                                                    v49 = 0;
                                                                                    goto LABEL_545;
                                                                                  }
                                                                                  v429 = v322;
                                                                                  v428 = (uint64_t)v429;
                                                                                  goto LABEL_411;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v429 = 0;
                                                                              }
                                                                              v428 = 0;
LABEL_411:
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("mediaType"));
                                                                              v326 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (v326
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v330 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v331 = *MEMORY[0x1E0D025B8];
                                                                                    v632 = *MEMORY[0x1E0CB2D50];
                                                                                    v423 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mediaType"));
                                                                                    v633 = v423;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v633, &v632, 1);
                                                                                    v426 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v424 = 0;
                                                                                    v49 = 0;
                                                                                    *v317 = (id)objc_msgSend(v330, "initWithDomain:code:userInfo:", v331, 2);
                                                                                    goto LABEL_543;
                                                                                  }
                                                                                  v325 = 0;
                                                                                  v49 = 0;
                                                                                  goto LABEL_544;
                                                                                }
                                                                                v424 = v326;
                                                                              }
                                                                              else
                                                                              {
                                                                                v424 = 0;
                                                                              }
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("sourceActivity"));
                                                                              v426 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (v426
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v343 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v344 = *MEMORY[0x1E0D025B8];
                                                                                    v630 = *MEMORY[0x1E0CB2D50];
                                                                                    v421 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sourceActivity"));
                                                                                    v631 = v421;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v631, &v630, 1);
                                                                                    v427 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v423 = 0;
                                                                                    v49 = 0;
                                                                                    *v317 = (id)objc_msgSend(v343, "initWithDomain:code:userInfo:", v344, 2);
                                                                                    goto LABEL_542;
                                                                                  }
                                                                                  v423 = 0;
                                                                                  v49 = 0;
                                                                                  goto LABEL_543;
                                                                                }
                                                                                v423 = v426;
                                                                              }
                                                                              else
                                                                              {
                                                                                v423 = 0;
                                                                              }
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("budActivity"));
                                                                              v427 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (v427
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v345 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v346 = *MEMORY[0x1E0D025B8];
                                                                                    v628 = *MEMORY[0x1E0CB2D50];
                                                                                    v419 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("budActivity"));
                                                                                    v629 = v419;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v629, &v628, 1);
                                                                                    v425 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v421 = 0;
                                                                                    v49 = 0;
                                                                                    *v317 = (id)objc_msgSend(v345, "initWithDomain:code:userInfo:", v346, 2);
                                                                                    goto LABEL_541;
                                                                                  }
                                                                                  v421 = 0;
                                                                                  v49 = 0;
                                                                                  goto LABEL_542;
                                                                                }
                                                                                v421 = v427;
                                                                              }
                                                                              else
                                                                              {
                                                                                v421 = 0;
                                                                              }
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("location"));
                                                                              v425 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (v425
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v347 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v348 = *MEMORY[0x1E0D025B8];
                                                                                    v626 = *MEMORY[0x1E0CB2D50];
                                                                                    v417 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("location"));
                                                                                    v627 = v417;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v627, &v626, 1);
                                                                                    v422 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v419 = 0;
                                                                                    v49 = 0;
                                                                                    *v317 = (id)objc_msgSend(v347, "initWithDomain:code:userInfo:", v348, 2);
                                                                                    goto LABEL_540;
                                                                                  }
                                                                                  v419 = 0;
                                                                                  v49 = 0;
                                                                                  goto LABEL_541;
                                                                                }
                                                                                v419 = v425;
                                                                              }
                                                                              else
                                                                              {
                                                                                v419 = 0;
                                                                              }
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("locationType"));
                                                                              v422 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (v422
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v354 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v355 = *MEMORY[0x1E0D025B8];
                                                                                    v624 = *MEMORY[0x1E0CB2D50];
                                                                                    v416 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("locationType"));
                                                                                    v625 = v416;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v625, &v624, 1);
                                                                                    v420 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v417 = 0;
                                                                                    v49 = 0;
                                                                                    *v317 = (id)objc_msgSend(v354, "initWithDomain:code:userInfo:", v355, 2);
                                                                                    goto LABEL_539;
                                                                                  }
                                                                                  v417 = 0;
                                                                                  v49 = 0;
                                                                                  goto LABEL_540;
                                                                                }
                                                                                v417 = v422;
                                                                              }
                                                                              else
                                                                              {
                                                                                v417 = 0;
                                                                              }
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("focusMode"));
                                                                              v420 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (v420
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v358 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v359 = *MEMORY[0x1E0D025B8];
                                                                                    v622 = *MEMORY[0x1E0CB2D50];
                                                                                    v415 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("focusMode"));
                                                                                    v623 = v415;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v623, &v622, 1);
                                                                                    v418 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v416 = 0;
                                                                                    v49 = 0;
                                                                                    *v317 = (id)objc_msgSend(v358, "initWithDomain:code:userInfo:", v359, 2);
                                                                                    goto LABEL_538;
                                                                                  }
                                                                                  v416 = 0;
                                                                                  v49 = 0;
                                                                                  goto LABEL_539;
                                                                                }
                                                                                v416 = v420;
                                                                              }
                                                                              else
                                                                              {
                                                                                v416 = 0;
                                                                              }
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("streamingAppBundleId"));
                                                                              v418 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if (v418
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v360 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v361 = *MEMORY[0x1E0D025B8];
                                                                                    v620 = *MEMORY[0x1E0CB2D50];
                                                                                    v329 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("streamingAppBundleId"));
                                                                                    v621 = v329;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v621, &v620, 1);
                                                                                    v332 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v415 = 0;
                                                                                    v49 = 0;
                                                                                    *v317 = (id)objc_msgSend(v360, "initWithDomain:code:userInfo:", v361, 2);
                                                                                    goto LABEL_536;
                                                                                  }
                                                                                  v415 = 0;
                                                                                  v49 = 0;
                                                                                  goto LABEL_538;
                                                                                }
                                                                                v415 = v418;
                                                                              }
                                                                              else
                                                                              {
                                                                                v415 = 0;
                                                                              }
                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("noiseType4B"));
                                                                              v327 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                              v328 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v329 = v327;
                                                                              LODWORD(v327) = objc_msgSend(v327, "isEqual:", v328);

                                                                              if ((_DWORD)v327)
                                                                              {

                                                                                v329 = 0;
                                                                              }
                                                                              else if (v329)
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v362 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v363 = *MEMORY[0x1E0D025B8];
                                                                                    v618 = *MEMORY[0x1E0CB2D50];
                                                                                    v332 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("noiseType4B"));
                                                                                    v619 = v332;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v619, &v618, 1);
                                                                                    v414 = (id)objc_claimAutoreleasedReturnValue();
                                                                                    v364 = (id)objc_msgSend(v362, "initWithDomain:code:userInfo:", v363, 2);
                                                                                    v49 = 0;
                                                                                    *v317 = v364;
                                                                                    goto LABEL_535;
                                                                                  }
                                                                                  v49 = 0;
                                                                                  goto LABEL_537;
                                                                                }
                                                                              }
                                                                              v332 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v329, "count"));
                                                                              v581 = 0u;
                                                                              v582 = 0u;
                                                                              v583 = 0u;
                                                                              v584 = 0u;
                                                                              v329 = v329;
                                                                              v333 = objc_msgSend(v329, "countByEnumeratingWithState:objects:count:", &v581, v617, 16);
                                                                              if (!v333)
                                                                                goto LABEL_457;
                                                                              v334 = v333;
                                                                              v335 = *(_QWORD *)v582;
LABEL_450:
                                                                              v336 = 0;
                                                                              while (1)
                                                                              {
                                                                                if (*(_QWORD *)v582 != v335)
                                                                                  objc_enumerationMutation(v329);
                                                                                v337 = *(void **)(*((_QWORD *)&v581 + 1)
                                                                                                + 8 * v336);
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                  break;
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    v356 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v357 = *MEMORY[0x1E0D025B8];
                                                                                    v613 = *MEMORY[0x1E0CB2D50];
                                                                                    v413 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("noiseType4B"));
                                                                                    v614 = v413;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v614, &v613, 1);
                                                                                    v351 = objc_claimAutoreleasedReturnValue();
                                                                                    v352 = v356;
                                                                                    v353 = v357;
                                                                                    goto LABEL_523;
                                                                                  }
                                                                                  goto LABEL_528;
                                                                                }
                                                                                v338 = v337;
                                                                                objc_msgSend(v332, "addObject:", v338);

                                                                                if (v334 == ++v336)
                                                                                {
                                                                                  v334 = objc_msgSend(v329, "countByEnumeratingWithState:objects:count:", &v581, v617, 16);
                                                                                  if (v334)
                                                                                    goto LABEL_450;
LABEL_457:

                                                                                  objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("instdBA"));
                                                                                  v413 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  if (v413
                                                                                    && (objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v414 = v413;
                                                                                      goto LABEL_460;
                                                                                    }
                                                                                    if (v317)
                                                                                    {
                                                                                      v366 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                      v367 = *MEMORY[0x1E0D025B8];
                                                                                      v611 = *MEMORY[0x1E0CB2D50];
                                                                                      v412 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("instdBA"));
                                                                                      v612 = v412;
                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v612, &v611, 1);
                                                                                      v411 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v49 = 0;
                                                                                      v414 = 0;
                                                                                      *v317 = (id)objc_msgSend(v366, "initWithDomain:code:userInfo:", v367, 2);
                                                                                      goto LABEL_504;
                                                                                    }
                                                                                    v414 = 0;
                                                                                    v49 = 0;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v414 = 0;
LABEL_460:
                                                                                    objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("instdBC"));
                                                                                    v411 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    if (v411
                                                                                      && (objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) == 0))
                                                                                    {
                                                                                      objc_opt_class();
                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                      {
                                                                                        v412 = v411;
                                                                                        goto LABEL_463;
                                                                                      }
                                                                                      if (v317)
                                                                                      {
                                                                                        v368 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                        v369 = *MEMORY[0x1E0D025B8];
                                                                                        v609 = *MEMORY[0x1E0CB2D50];
                                                                                        v407 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("instdBC"));
                                                                                        v610 = v407;
                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v610, &v609, 1);
                                                                                        v410 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        v49 = 0;
                                                                                        v412 = 0;
                                                                                        *v317 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v369, 2);
                                                                                        goto LABEL_503;
                                                                                      }
                                                                                      v412 = 0;
                                                                                      v49 = 0;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v412 = 0;
LABEL_463:
                                                                                      objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("nonCAListeningMode"));
                                                                                      v410 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      if (v410
                                                                                        && (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v407 = v410;
                                                                                          goto LABEL_466;
                                                                                        }
                                                                                        if (v317)
                                                                                        {
                                                                                          v370 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                          v371 = *MEMORY[0x1E0D025B8];
                                                                                          v607 = *MEMORY[0x1E0CB2D50];
                                                                                          v406 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("nonCAListeningMode"));
                                                                                          v608 = v406;
                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v608, &v607, 1);
                                                                                          v409 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v49 = 0;
                                                                                          v407 = 0;
                                                                                          *v317 = (id)objc_msgSend(v370, "initWithDomain:code:userInfo:", v371, 2);
                                                                                          goto LABEL_502;
                                                                                        }
                                                                                        v407 = 0;
                                                                                        v49 = 0;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v407 = 0;
LABEL_466:
                                                                                        objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("fit"));
                                                                                        v409 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        if (v409
                                                                                          && (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                          {
                                                                                            v406 = v409;
                                                                                            goto LABEL_469;
                                                                                          }
                                                                                          if (v317)
                                                                                          {
                                                                                            v372 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                            v373 = *MEMORY[0x1E0D025B8];
                                                                                            v605 = *MEMORY[0x1E0CB2D50];
                                                                                            v404 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("fit"));
                                                                                            v606 = v404;
                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v606, &v605, 1);
                                                                                            v408 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v49 = 0;
                                                                                            v406 = 0;
                                                                                            *v317 = (id)objc_msgSend(v372, "initWithDomain:code:userInfo:", v373, 2);
                                                                                            goto LABEL_501;
                                                                                          }
                                                                                          v406 = 0;
                                                                                          v49 = 0;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v406 = 0;
LABEL_469:
                                                                                          objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("fixedAutoAncGain"));
                                                                                          v408 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          if (v408
                                                                                            && (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                                                          {
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                            {
                                                                                              v404 = v408;
                                                                                              goto LABEL_472;
                                                                                            }
                                                                                            if (v317)
                                                                                            {
                                                                                              v374 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                              v375 = *MEMORY[0x1E0D025B8];
                                                                                              v603 = *MEMORY[0x1E0CB2D50];
                                                                                              v402 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("fixedAutoAncGain"));
                                                                                              v604 = v402;
                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v604, &v603, 1);
                                                                                              v405 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              v49 = 0;
                                                                                              v404 = 0;
                                                                                              *v317 = (id)objc_msgSend(v374, "initWithDomain:code:userInfo:", v375, 2);
                                                                                              goto LABEL_500;
                                                                                            }
                                                                                            v404 = 0;
                                                                                            v49 = 0;
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v404 = 0;
LABEL_472:
                                                                                            objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("adjustedAutoAncGain"));
                                                                                            v405 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            if (v405
                                                                                              && (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                                                            {
                                                                                              objc_opt_class();
                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                              {
                                                                                                v402 = v405;
                                                                                                goto LABEL_475;
                                                                                              }
                                                                                              if (v317)
                                                                                              {
                                                                                                v376 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                v377 = *MEMORY[0x1E0D025B8];
                                                                                                v601 = *MEMORY[0x1E0CB2D50];
                                                                                                v400 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("adjustedAutoAncGain"));
                                                                                                v602 = v400;
                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v602, &v601, 1);
                                                                                                v403 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                v49 = 0;
                                                                                                v402 = 0;
                                                                                                *v317 = (id)objc_msgSend(v376, "initWithDomain:code:userInfo:", v377, 2);
                                                                                                goto LABEL_499;
                                                                                              }
                                                                                              v402 = 0;
                                                                                              v49 = 0;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v402 = 0;
LABEL_475:
                                                                                              objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("timestamp"));
                                                                                              v403 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              if (v403
                                                                                                && (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                                              {
                                                                                                objc_opt_class();
                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                {
                                                                                                  v400 = v403;
                                                                                                  goto LABEL_478;
                                                                                                }
                                                                                                if (v317)
                                                                                                {
                                                                                                  v378 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                  v379 = *MEMORY[0x1E0D025B8];
                                                                                                  v599 = *MEMORY[0x1E0CB2D50];
                                                                                                  v399 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timestamp"));
                                                                                                  v600 = v399;
                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v600, &v599, 1);
                                                                                                  v401 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  v49 = 0;
                                                                                                  v400 = 0;
                                                                                                  *v317 = (id)objc_msgSend(v378, "initWithDomain:code:userInfo:", v379, 2);
                                                                                                  goto LABEL_498;
                                                                                                }
                                                                                                v400 = 0;
                                                                                                v49 = 0;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v400 = 0;
LABEL_478:
                                                                                                objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("DRCenablementBit"));
                                                                                                v401 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                if (v401 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                  {
                                                                                                    v399 = v401;
                                                                                                    goto LABEL_481;
                                                                                                  }
                                                                                                  if (v317)
                                                                                                  {
                                                                                                    v380 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                    v381 = *MEMORY[0x1E0D025B8];
                                                                                                    v597 = *MEMORY[0x1E0CB2D50];
                                                                                                    v397 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("DRCenablementBit"));
                                                                                                    v598 = v397;
                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v598, &v597, 1);
                                                                                                    v339 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v49 = 0;
                                                                                                    v399 = 0;
                                                                                                    *v317 = (id)objc_msgSend(v380, "initWithDomain:code:userInfo:", v381, 2, v339);
                                                                                                    goto LABEL_497;
                                                                                                  }
                                                                                                  v399 = 0;
                                                                                                  v49 = 0;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v399 = 0;
LABEL_481:
                                                                                                  objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("DRCwindFlag"));
                                                                                                  v339 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  if (v339 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                  {
                                                                                                    objc_opt_class();
                                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                    {
                                                                                                      v397 = v339;
                                                                                                      goto LABEL_484;
                                                                                                    }
                                                                                                    if (v317)
                                                                                                    {
                                                                                                      v382 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                      v383 = *MEMORY[0x1E0D025B8];
                                                                                                      v595 = *MEMORY[0x1E0CB2D50];
                                                                                                      v395 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("DRCwindFlag"));
                                                                                                      v596 = v395;
                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v596, &v595, 1);
                                                                                                      v398 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      v49 = 0;
                                                                                                      v397 = 0;
                                                                                                      *v317 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v383, 2);
                                                                                                      goto LABEL_496;
                                                                                                    }
                                                                                                    v397 = 0;
                                                                                                    v49 = 0;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v397 = 0;
LABEL_484:
                                                                                                    objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("DRCappSelfVoiceFlag"));
                                                                                                    v398 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v398 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v395 = v398;
                                                                                                        goto LABEL_487;
                                                                                                      }
                                                                                                      if (v317)
                                                                                                      {
                                                                                                        v384 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                        v385 = *MEMORY[0x1E0D025B8];
                                                                                                        v593 = *MEMORY[0x1E0CB2D50];
                                                                                                        v340 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("DRCappSelfVoiceFlag"));
                                                                                                        v594 = v340;
                                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v594, &v593, 1);
                                                                                                        v396 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v49 = 0;
                                                                                                        v395 = 0;
                                                                                                        *v317 = (id)objc_msgSend(v384, "initWithDomain:code:userInfo:", v385, 2);
                                                                                                        goto LABEL_495;
                                                                                                      }
                                                                                                      v395 = 0;
                                                                                                      v49 = 0;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v395 = 0;
LABEL_487:
                                                                                                      objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("drumDRC"));
                                                                                                      v396 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      if (v396 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v340 = v396;
                                                                                                          goto LABEL_490;
                                                                                                        }
                                                                                                        if (v317)
                                                                                                        {
                                                                                                          v386 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v387 = *MEMORY[0x1E0D025B8];
                                                                                                          v591 = *MEMORY[0x1E0CB2D50];
                                                                                                          v342 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("drumDRC"));
                                                                                                          v592 = v342;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v592, &v591, 1);
                                                                                                          v388 = objc_claimAutoreleasedReturnValue();
                                                                                                          v389 = v387;
                                                                                                          v341 = (void *)v388;
                                                                                                          v49 = 0;
                                                                                                          v340 = 0;
                                                                                                          *v317 = (id)objc_msgSend(v386, "initWithDomain:code:userInfo:", v389, 2);
                                                                                                          goto LABEL_494;
                                                                                                        }
                                                                                                        v340 = 0;
                                                                                                        v49 = 0;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v340 = 0;
LABEL_490:
                                                                                                        objc_msgSend(v569, "objectForKeyedSubscript:", CFSTR("routedDRCGain"));
                                                                                                        v341 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        if (!v341 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          v342 = 0;
                                                                                                          goto LABEL_493;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v342 = v341;
LABEL_493:
                                                                                                          v49 = -[BMDeviceAdaptiveVolume initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData32B:windStrength:windProb:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:](v502, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData32B:windStrength:windProb:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:", v580, v529, v579, v534, v575, v532, v493, v490, v525, v523, v506, v507, v503, v499, v496, v494, v491, v489, v488, v487, v481, v483, v479, v477, v475, v473, v471, v469, v467, v465, v463, v461, v459, v458, v456, v454, v448, v446, v445, v443, v440, v439, v436, v435, v432, v450, v430, v428, v424, v423, v421, v419, v417, v416, v415, v332, v414, v412, v407, v406, v404);
                                                                                                          v502 = v49;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          if (v317)
                                                                                                          {
                                                                                                            v390 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v394 = *MEMORY[0x1E0D025B8];
                                                                                                            v589 = *MEMORY[0x1E0CB2D50];
                                                                                                            v391 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("routedDRCGain"));
                                                                                                            v590 = v391;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v590, &v589, 1);
                                                                                                            v392 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            *v317 = (id)objc_msgSend(v390, "initWithDomain:code:userInfo:", v394, 2, v392);

                                                                                                          }
                                                                                                          v342 = 0;
                                                                                                          v49 = 0;
                                                                                                        }
LABEL_494:

                                                                                                      }
LABEL_495:

                                                                                                    }
LABEL_496:

                                                                                                  }
LABEL_497:

                                                                                                }
LABEL_498:

                                                                                              }
LABEL_499:

                                                                                            }
LABEL_500:

                                                                                          }
LABEL_501:

                                                                                        }
LABEL_502:

                                                                                      }
LABEL_503:

                                                                                    }
LABEL_504:

LABEL_524:
                                                                                  }

LABEL_535:
LABEL_536:

LABEL_537:
LABEL_538:

LABEL_539:
LABEL_540:

LABEL_541:
LABEL_542:

LABEL_543:
                                                                                  v325 = v424;
LABEL_544:

LABEL_545:
                                                                                  v24 = v569;
                                                                                  v320 = v429;
LABEL_546:

                                                                                  v10 = v529;
                                                                                  v63 = v574;
                                                                                  v270 = v506;
                                                                                  v109 = v482;
                                                                                  v116 = v485;
                                                                                  v193 = v513;
                                                                                  v110 = (id *)v481;
                                                                                  v299 = (void *)v428;
LABEL_547:

LABEL_548:
                                                                                  v308 = v430;
LABEL_549:

LABEL_551:
LABEL_552:

LABEL_553:
LABEL_554:

LABEL_555:
LABEL_556:

LABEL_557:
LABEL_558:
                                                                                  v506 = v270;

                                                                                  v265 = v446;
LABEL_559:
                                                                                  v117 = v572;
LABEL_560:

                                                                                  v260 = v448;
LABEL_561:

LABEL_562:
                                                                                  v257 = v453;
LABEL_563:

LABEL_564:
LABEL_565:
                                                                                  v7 = v117;
LABEL_566:

                                                                                  goto LABEL_567;
                                                                                }
                                                                              }
                                                                              if (v317)
                                                                              {
                                                                                v349 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v350 = *MEMORY[0x1E0D025B8];
                                                                                v615 = *MEMORY[0x1E0CB2D50];
                                                                                v413 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("noiseType4B"));
                                                                                v616 = v413;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v616, &v615, 1);
                                                                                v351 = objc_claimAutoreleasedReturnValue();
                                                                                v352 = v349;
                                                                                v353 = v350;
LABEL_523:
                                                                                v412 = (id)v351;
                                                                                v49 = 0;
                                                                                *v317 = (id)objc_msgSend(v352, "initWithDomain:code:userInfo:", v353, 2);
                                                                                v414 = v329;
                                                                                goto LABEL_524;
                                                                              }
LABEL_528:
                                                                              v49 = 0;

                                                                              goto LABEL_536;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v317 = v110;
                                                                            v431 = 0;
                                                                          }
                                                                          v430 = 0;
                                                                          goto LABEL_401;
                                                                        }
                                                                      }
                                                                    }
                                                                    if (v110)
                                                                    {
                                                                      v309 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v310 = *MEMORY[0x1E0D025B8];
                                                                      v645 = *MEMORY[0x1E0CB2D50];
                                                                      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("pvFeatureEnableFlag"));
                                                                      v646 = obj;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v646, &v645, 1);
                                                                      v451 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v311 = (id)objc_msgSend(v309, "initWithDomain:code:userInfo:", v310, 2);
                                                                      v432 = 0;
                                                                      v49 = 0;
                                                                      *v110 = v311;
                                                                      v63 = v574;
                                                                      v116 = v485;
                                                                      v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      v270 = v506;

                                                                      goto LABEL_551;
                                                                    }
                                                                    v432 = 0;
                                                                    v49 = 0;
LABEL_397:
                                                                    v63 = v574;
                                                                    v116 = v485;
                                                                    v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_552;
                                                                  }
                                                                  v294 = v10;
                                                                  if (v110)
                                                                  {
                                                                    v306 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v307 = *MEMORY[0x1E0D025B8];
                                                                    v647 = *MEMORY[0x1E0CB2D50];
                                                                    v432 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("activeStreamFlag"));
                                                                    v648 = v432;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v648, &v647, 1);
                                                                    v433 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v435 = 0;
                                                                    v49 = 0;
                                                                    *v110 = (id)objc_msgSend(v306, "initWithDomain:code:userInfo:", v307, 2);
                                                                    goto LABEL_397;
                                                                  }
                                                                  v435 = 0;
                                                                  v49 = 0;
LABEL_393:
                                                                  v10 = v294;
                                                                  v63 = v574;
                                                                  v116 = v485;
                                                                  v193 = v513;
                                                                  v110 = (id *)v481;
                                                                  v270 = v506;
                                                                  goto LABEL_553;
                                                                }
                                                                v294 = v10;
                                                                if (v110)
                                                                {
                                                                  v302 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v303 = *MEMORY[0x1E0D025B8];
                                                                  v649 = *MEMORY[0x1E0CB2D50];
                                                                  v435 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cdEngagementFlag"));
                                                                  v650 = v435;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v650, &v649, 1);
                                                                  v434 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v436 = 0;
                                                                  v49 = 0;
                                                                  *v110 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v303, 2);
                                                                  goto LABEL_393;
                                                                }
                                                                v436 = 0;
                                                                v49 = 0;
LABEL_391:
                                                                v10 = v294;
                                                                v63 = v574;
                                                                v116 = v485;
                                                                v193 = v513;
                                                                v110 = (id *)v481;
                                                                v270 = v506;
                                                                goto LABEL_554;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v448 = v160;
                                                                goto LABEL_194;
                                                              }
                                                              if (v110)
                                                              {
                                                                v564 = v24;
                                                                v263 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v264 = *MEMORY[0x1E0D025B8];
                                                                v661 = *MEMORY[0x1E0CB2D50];
                                                                v116 = v485;
                                                                v265 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("anchorEnv"));
                                                                v662 = v265;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v662, &v661, 1);
                                                                v266 = objc_claimAutoreleasedReturnValue();
                                                                v267 = v263;
                                                                v117 = v572;
                                                                v24 = v564;
                                                                v449 = (void *)v266;
                                                                v448 = 0;
                                                                v49 = 0;
                                                                *v110 = (id)objc_msgSend(v267, "initWithDomain:code:userInfo:", v264, 2);
                                                                v63 = v574;
                                                                v193 = v513;
                                                                v110 = (id *)v481;
                                                                goto LABEL_560;
                                                              }
                                                              v117 = v572;
                                                              v260 = 0;
                                                              v49 = 0;
LABEL_365:
                                                              v63 = v574;
                                                              v193 = v513;
                                                              v110 = (id *)v481;
                                                              goto LABEL_561;
                                                            }
                                                            v236 = v10;
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v456 = v156;
                                                              v116 = v485;
                                                              goto LABEL_188;
                                                            }
                                                            if (v110)
                                                            {
                                                              v255 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v256 = *MEMORY[0x1E0D025B8];
                                                              v665 = *MEMORY[0x1E0CB2D50];
                                                              v454 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activeAirpodsSerialNumber"));
                                                              v666 = v454;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v666, &v665, 1);
                                                              v257 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v456 = 0;
                                                              v49 = 0;
                                                              *v110 = (id)objc_msgSend(v255, "initWithDomain:code:userInfo:", v256, 2, v257);
                                                              v63 = v574;
                                                              v116 = v485;
                                                              v193 = v513;
                                                              v110 = (id *)v481;
                                                              goto LABEL_563;
                                                            }
                                                            v456 = 0;
                                                            v49 = 0;
LABEL_356:
                                                            v10 = v236;
                                                            v63 = v574;
                                                            v116 = v485;
                                                            v193 = v513;
                                                            v110 = (id *)v481;
                                                            goto LABEL_564;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v459 = v152;
                                                            goto LABEL_182;
                                                          }
                                                          if (v110)
                                                          {
                                                            v562 = v24;
                                                            v249 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v250 = *MEMORY[0x1E0D025B8];
                                                            v669 = *MEMORY[0x1E0CB2D50];
                                                            v458 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("smallWindowSize"));
                                                            v670 = v458;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v670, &v669, 1);
                                                            v251 = objc_claimAutoreleasedReturnValue();
                                                            v252 = v249;
                                                            v7 = v117;
                                                            v24 = v562;
                                                            v457 = (void *)v251;
                                                            v459 = 0;
                                                            v49 = 0;
                                                            *v110 = (id)objc_msgSend(v252, "initWithDomain:code:userInfo:", v250, 2);
                                                            v63 = v574;
                                                            v193 = v513;
                                                            v110 = (id *)v481;
                                                            goto LABEL_566;
                                                          }
                                                          v459 = 0;
                                                          v49 = 0;
                                                          v63 = v574;
                                                          v193 = v513;
                                                          v110 = (id *)v481;
                                                          v7 = v117;
LABEL_567:

                                                          goto LABEL_568;
                                                        }
                                                        if (v110)
                                                        {
                                                          v561 = v24;
                                                          v245 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v246 = *MEMORY[0x1E0D025B8];
                                                          v671 = *MEMORY[0x1E0CB2D50];
                                                          v459 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bigWindowSize"));
                                                          v672 = v459;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v672, &v671, 1);
                                                          v247 = objc_claimAutoreleasedReturnValue();
                                                          v248 = v245;
                                                          v7 = v117;
                                                          v24 = v561;
                                                          v460 = (void *)v247;
                                                          v461 = 0;
                                                          v49 = 0;
                                                          *v110 = (id)objc_msgSend(v248, "initWithDomain:code:userInfo:", v246, 2);
                                                          v63 = v574;
                                                          v193 = v513;
                                                          v110 = (id *)v481;
                                                          goto LABEL_567;
                                                        }
                                                        v461 = 0;
                                                        v49 = 0;
                                                        v63 = v574;
                                                        v193 = v513;
                                                        v110 = (id *)v481;
                                                        v7 = v117;
LABEL_568:

                                                        goto LABEL_569;
                                                      }
                                                      if (v110)
                                                      {
                                                        v560 = v24;
                                                        v241 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v242 = *MEMORY[0x1E0D025B8];
                                                        v673 = *MEMORY[0x1E0CB2D50];
                                                        v461 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("manualVolumeChangeFlag"));
                                                        v674 = v461;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v674, &v673, 1);
                                                        v243 = objc_claimAutoreleasedReturnValue();
                                                        v244 = v241;
                                                        v7 = v117;
                                                        v24 = v560;
                                                        v462 = (void *)v243;
                                                        v463 = 0;
                                                        v49 = 0;
                                                        *v110 = (id)objc_msgSend(v244, "initWithDomain:code:userInfo:", v242, 2);
                                                        v63 = v574;
                                                        v193 = v513;
                                                        v110 = (id *)v481;
                                                        goto LABEL_568;
                                                      }
                                                      v463 = 0;
                                                      v49 = 0;
                                                      v63 = v574;
                                                      v193 = v513;
                                                      v110 = (id *)v481;
                                                      v7 = v117;
LABEL_569:

                                                      goto LABEL_570;
                                                    }
                                                    if (v110)
                                                    {
                                                      v559 = v24;
                                                      v237 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v238 = *MEMORY[0x1E0D025B8];
                                                      v675 = *MEMORY[0x1E0CB2D50];
                                                      v463 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("minMaxCutFlag"));
                                                      v676 = v463;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v676, &v675, 1);
                                                      v239 = objc_claimAutoreleasedReturnValue();
                                                      v240 = v237;
                                                      v7 = v117;
                                                      v24 = v559;
                                                      v464 = (void *)v239;
                                                      v465 = 0;
                                                      v49 = 0;
                                                      *v110 = (id)objc_msgSend(v240, "initWithDomain:code:userInfo:", v238, 2);
                                                      v63 = v574;
                                                      v193 = v513;
                                                      v110 = (id *)v481;
                                                      goto LABEL_569;
                                                    }
                                                    v465 = 0;
                                                    v49 = 0;
                                                    v63 = v574;
                                                    v193 = v513;
                                                    v110 = (id *)v481;
                                                    v7 = v117;
LABEL_570:

                                                    goto LABEL_571;
                                                  }
                                                  if (v110)
                                                  {
                                                    v558 = v24;
                                                    v232 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v233 = *MEMORY[0x1E0D025B8];
                                                    v677 = *MEMORY[0x1E0CB2D50];
                                                    v465 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("guardrailsAvoidFlag"));
                                                    v678 = v465;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v678, &v677, 1);
                                                    v234 = objc_claimAutoreleasedReturnValue();
                                                    v235 = v232;
                                                    v7 = v117;
                                                    v24 = v558;
                                                    v466 = (void *)v234;
                                                    v467 = 0;
                                                    v49 = 0;
                                                    *v110 = (id)objc_msgSend(v235, "initWithDomain:code:userInfo:", v233, 2);
                                                    v63 = v574;
                                                    v193 = v513;
                                                    v110 = (id *)v481;
                                                    goto LABEL_570;
                                                  }
                                                  v467 = 0;
                                                  v49 = 0;
                                                  v63 = v574;
                                                  v193 = v513;
                                                  v110 = (id *)v481;
                                                  v7 = v117;
LABEL_571:

                                                  goto LABEL_572;
                                                }
                                                if (v110)
                                                {
                                                  v557 = v24;
                                                  v228 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v229 = *MEMORY[0x1E0D025B8];
                                                  v679 = *MEMORY[0x1E0CB2D50];
                                                  v467 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("onStartPredictionFlag"));
                                                  v680 = v467;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v680, &v679, 1);
                                                  v230 = objc_claimAutoreleasedReturnValue();
                                                  v231 = v228;
                                                  v7 = v117;
                                                  v24 = v557;
                                                  v468 = (void *)v230;
                                                  v469 = 0;
                                                  v49 = 0;
                                                  *v110 = (id)objc_msgSend(v231, "initWithDomain:code:userInfo:", v229, 2);
                                                  v63 = v574;
                                                  v193 = v513;
                                                  v110 = (id *)v481;
                                                  goto LABEL_571;
                                                }
                                                v469 = 0;
                                                v49 = 0;
                                                v63 = v574;
                                                v193 = v513;
                                                v110 = (id *)v481;
                                                v7 = v117;
LABEL_572:

                                                goto LABEL_573;
                                              }
                                              if (v110)
                                              {
                                                v556 = v24;
                                                v224 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v225 = *MEMORY[0x1E0D025B8];
                                                v681 = *MEMORY[0x1E0CB2D50];
                                                v469 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("predVolSiriPrct"));
                                                v682 = v469;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v682, &v681, 1);
                                                v226 = objc_claimAutoreleasedReturnValue();
                                                v227 = v224;
                                                v7 = v117;
                                                v24 = v556;
                                                v470 = (void *)v226;
                                                v471 = 0;
                                                v49 = 0;
                                                *v110 = (id)objc_msgSend(v227, "initWithDomain:code:userInfo:", v225, 2);
                                                v63 = v574;
                                                v193 = v513;
                                                v110 = (id *)v481;
                                                goto LABEL_572;
                                              }
                                              v471 = 0;
                                              v49 = 0;
                                              v63 = v574;
                                              v193 = v513;
                                              v110 = (id *)v481;
                                              v7 = v117;
LABEL_573:

                                              goto LABEL_574;
                                            }
                                            if (v110)
                                            {
                                              v555 = v24;
                                              v220 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v221 = *MEMORY[0x1E0D025B8];
                                              v683 = *MEMORY[0x1E0CB2D50];
                                              v471 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("predVolTelephonyPrct"));
                                              v684 = v471;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v684, &v683, 1);
                                              v222 = objc_claimAutoreleasedReturnValue();
                                              v223 = v220;
                                              v7 = v117;
                                              v24 = v555;
                                              v472 = (void *)v222;
                                              v473 = 0;
                                              v49 = 0;
                                              *v110 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v221, 2);
                                              v63 = v574;
                                              v193 = v513;
                                              v110 = (id *)v481;
                                              goto LABEL_573;
                                            }
                                            v473 = 0;
                                            v49 = 0;
                                            v63 = v574;
                                            v193 = v513;
                                            v110 = (id *)v481;
                                            v7 = v117;
LABEL_574:

                                            goto LABEL_575;
                                          }
                                          if (v110)
                                          {
                                            v554 = v24;
                                            v216 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v217 = *MEMORY[0x1E0D025B8];
                                            v685 = *MEMORY[0x1E0CB2D50];
                                            v473 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("predVolMediaPrct"));
                                            v686 = v473;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v686, &v685, 1);
                                            v218 = objc_claimAutoreleasedReturnValue();
                                            v219 = v216;
                                            v7 = v117;
                                            v24 = v554;
                                            v474 = (void *)v218;
                                            v475 = 0;
                                            v49 = 0;
                                            *v110 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v217, 2);
                                            v63 = v574;
                                            v193 = v513;
                                            v110 = (id *)v481;
                                            goto LABEL_574;
                                          }
                                          v475 = 0;
                                          v49 = 0;
                                          v63 = v574;
                                          v193 = v513;
                                          v110 = (id *)v481;
                                          v7 = v117;
LABEL_575:

                                          goto LABEL_576;
                                        }
                                        if (v110)
                                        {
                                          v553 = v24;
                                          v212 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v213 = *MEMORY[0x1E0D025B8];
                                          v687 = *MEMORY[0x1E0CB2D50];
                                          v475 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("desiredDeltaE"));
                                          v688 = v475;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v688, &v687, 1);
                                          v214 = objc_claimAutoreleasedReturnValue();
                                          v215 = v212;
                                          v7 = v117;
                                          v24 = v553;
                                          v476 = (void *)v214;
                                          v477 = 0;
                                          v49 = 0;
                                          *v110 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v213, 2);
                                          v63 = v574;
                                          v193 = v513;
                                          v110 = (id *)v481;
                                          goto LABEL_575;
                                        }
                                        v477 = 0;
                                        v49 = 0;
                                        v63 = v574;
                                        v193 = v513;
                                        v110 = (id *)v481;
                                        v7 = v117;
LABEL_576:

                                        goto LABEL_577;
                                      }
                                      if (v110)
                                      {
                                        v552 = v24;
                                        v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v209 = *MEMORY[0x1E0D025B8];
                                        v689 = *MEMORY[0x1E0CB2D50];
                                        v477 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("smoothEae"));
                                        v690 = v477;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v690, &v689, 1);
                                        v210 = objc_claimAutoreleasedReturnValue();
                                        v211 = v208;
                                        v7 = v117;
                                        v24 = v552;
                                        v478 = (void *)v210;
                                        v479 = 0;
                                        v49 = 0;
                                        *v110 = (id)objc_msgSend(v211, "initWithDomain:code:userInfo:", v209, 2);
                                        v63 = v574;
                                        v193 = v513;
                                        v110 = (id *)v481;
                                        goto LABEL_576;
                                      }
                                      v479 = 0;
                                      v49 = 0;
                                      v63 = v574;
                                      v193 = v513;
                                      v110 = (id *)v481;
                                      v7 = v117;
LABEL_577:

                                      goto LABEL_578;
                                    }
                                    if (v110)
                                    {
                                      v551 = v24;
                                      v204 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v205 = *MEMORY[0x1E0D025B8];
                                      v691 = *MEMORY[0x1E0CB2D50];
                                      v479 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lastVolSiriPrct"));
                                      v692 = v479;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v692, &v691, 1);
                                      v206 = objc_claimAutoreleasedReturnValue();
                                      v207 = v204;
                                      v7 = v117;
                                      v24 = v551;
                                      v480 = (void *)v206;
                                      v483 = 0;
                                      v49 = 0;
                                      *v110 = (id)objc_msgSend(v207, "initWithDomain:code:userInfo:", v205, 2);
                                      v63 = v574;
                                      v193 = v513;
                                      v110 = (id *)v481;
                                      goto LABEL_577;
                                    }
                                    v483 = 0;
                                    v49 = 0;
                                    v63 = v574;
                                    v193 = v513;
                                    v110 = (id *)v481;
                                    v7 = v117;
LABEL_578:

                                    goto LABEL_579;
                                  }
                                  v7 = v117;
                                  if (v110)
                                  {
                                    v550 = v24;
                                    v199 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v200 = *MEMORY[0x1E0D025B8];
                                    v693 = *MEMORY[0x1E0CB2D50];
                                    v201 = v110;
                                    v483 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lastESiridBA"));
                                    v694 = v483;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v694, &v693, 1);
                                    v202 = objc_claimAutoreleasedReturnValue();
                                    v203 = v199;
                                    v7 = v117;
                                    v24 = v550;
                                    v484 = (void *)v202;
                                    v110 = 0;
                                    v49 = 0;
                                    *v201 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v200, 2);
                                    v63 = v574;
                                    v193 = v513;
                                    goto LABEL_578;
                                  }
                                  v49 = 0;
                                  v63 = v574;
                                  v193 = v513;
LABEL_579:

                                  v21 = v493;
                                  goto LABEL_580;
                                }
                                if (v110)
                                {
                                  v549 = v24;
                                  v195 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v196 = *MEMORY[0x1E0D025B8];
                                  v695 = *MEMORY[0x1E0CB2D50];
                                  v520 = v110;
                                  v193 = v118;
                                  v110 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lastVolTelephonyPrct"));
                                  v696 = v110;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v696, &v695, 1);
                                  v197 = objc_claimAutoreleasedReturnValue();
                                  v198 = v195;
                                  v7 = v117;
                                  v24 = v549;
                                  v486 = (void *)v197;
                                  v487 = 0;
                                  v49 = 0;
                                  *v520 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v196, 2);
                                  v63 = v574;
                                  goto LABEL_579;
                                }
                                v487 = 0;
                                v49 = 0;
                                v63 = v574;
                                v193 = v118;
                                v21 = v493;
                                v7 = v117;
LABEL_580:

                                v189 = v488;
                                goto LABEL_581;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v117 = v7;
                                v488 = v116;
                                goto LABEL_129;
                              }
                              if (v110)
                              {
                                v548 = v24;
                                v191 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v192 = *MEMORY[0x1E0D025B8];
                                v697 = *MEMORY[0x1E0CB2D50];
                                v525 = v111;
                                v519 = v110;
                                v21 = v493;
                                v487 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lastETelephonydBA"));
                                v698 = v487;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v698, &v697, 1);
                                v193 = (void *)objc_claimAutoreleasedReturnValue();
                                v194 = v191;
                                v24 = v548;
                                v488 = 0;
                                v49 = 0;
                                *v519 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v192, 2, v193);
                                v63 = v574;
                                goto LABEL_580;
                              }
                              v189 = 0;
                              v49 = 0;
                              v63 = v574;
                              v21 = v493;
LABEL_581:

                              v60 = v534;
                              self = v502;
                              goto LABEL_582;
                            }
                            if (v13)
                            {
                              v546 = v24;
                              v184 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v185 = *MEMORY[0x1E0D025B8];
                              v701 = *MEMORY[0x1E0CB2D50];
                              v517 = v13;
                              v60 = v534;
                              v13 = v506;
                              v489 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lastEMediadBA"));
                              v702 = v489;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v702, &v701, 1);
                              v109 = (void *)objc_claimAutoreleasedReturnValue();
                              v186 = v184;
                              v24 = v546;
                              v491 = 0;
                              v49 = 0;
                              *v517 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v185, 2, v109);
                              v63 = v574;
LABEL_583:

                              v25 = v490;
                              goto LABEL_584;
                            }
                            v491 = 0;
                            v49 = 0;
                            v63 = v574;
                            v60 = v534;
                            v13 = v506;
LABEL_584:

                            goto LABEL_585;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v494 = v41;
                            goto LABEL_49;
                          }
                          if (v13)
                          {
                            v545 = v24;
                            v180 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v181 = *MEMORY[0x1E0D025B8];
                            v703 = *MEMORY[0x1E0CB2D50];
                            v516 = v13;
                            v60 = v534;
                            v13 = v506;
                            v491 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("personalizationParamMistakes"));
                            v704 = v491;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v704, &v703, 1);
                            v182 = objc_claimAutoreleasedReturnValue();
                            v183 = v180;
                            v24 = v545;
                            v492 = (void *)v182;
                            v494 = 0;
                            v49 = 0;
                            *v516 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v181, 2);
                            v63 = v574;
                            goto LABEL_584;
                          }
                          v494 = 0;
                          v49 = 0;
                          v63 = v574;
                          v60 = v534;
                          v13 = v506;
LABEL_585:

                          goto LABEL_586;
                        }
                        if (v13)
                        {
                          v544 = v24;
                          v123 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v497 = *MEMORY[0x1E0D025B8];
                          v705 = *MEMORY[0x1E0CB2D50];
                          v515 = v13;
                          v60 = v534;
                          v13 = v506;
                          v494 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("personalizationParamSnr"));
                          v706 = v494;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v706, &v705, 1);
                          v124 = objc_claimAutoreleasedReturnValue();
                          v125 = v123;
                          v24 = v544;
                          v495 = (void *)v124;
                          v126 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v497, 2);
                          v496 = 0;
                          v49 = 0;
                          *v515 = v126;
                          v63 = v574;
                          goto LABEL_585;
                        }
                        v496 = 0;
                        v49 = 0;
                        v63 = v574;
                        v60 = v534;
                        v13 = v506;
LABEL_586:

                        goto LABEL_587;
                      }
                      if (v13)
                      {
                        v543 = v24;
                        v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v500 = *MEMORY[0x1E0D025B8];
                        v707 = *MEMORY[0x1E0CB2D50];
                        v514 = v13;
                        v60 = v534;
                        v13 = v506;
                        v496 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("speechPresenceProbability"));
                        v708 = v496;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v708, &v707, 1);
                        v120 = objc_claimAutoreleasedReturnValue();
                        v121 = v119;
                        v24 = v543;
                        v498 = (void *)v120;
                        v122 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v500, 2);
                        v499 = 0;
                        v49 = 0;
                        *v514 = v122;
                        v63 = v574;
                        goto LABEL_586;
                      }
                      v499 = 0;
                      v49 = 0;
                      v63 = v574;
                      v60 = v534;
                      v13 = v506;
LABEL_587:

                      goto LABEL_588;
                    }
                    if (v13)
                    {
                      v542 = v24;
                      v112 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v504 = *MEMORY[0x1E0D025B8];
                      v709 = *MEMORY[0x1E0CB2D50];
                      v512 = v13;
                      v60 = v534;
                      v13 = v506;
                      v499 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("volumeChangeFlag"));
                      v710 = v499;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v710, &v709, 1);
                      v113 = objc_claimAutoreleasedReturnValue();
                      v114 = v112;
                      v24 = v542;
                      v501 = (void *)v113;
                      v115 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v504, 2);
                      v503 = 0;
                      v49 = 0;
                      *v512 = v115;
                      v63 = v574;
                      goto LABEL_587;
                    }
                    v503 = 0;
                    v49 = 0;
                    v63 = v574;
                    v60 = v534;
                    v13 = v506;
LABEL_588:

                    goto LABEL_589;
                  }
                  if (v13)
                  {
                    v541 = v24;
                    v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v508 = *MEMORY[0x1E0D025B8];
                    v711 = *MEMORY[0x1E0CB2D50];
                    v511 = v13;
                    v60 = v534;
                    v13 = v506;
                    v503 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("windSpeechAggressorFlag"));
                    v712 = v503;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v712, &v711, 1);
                    v106 = objc_claimAutoreleasedReturnValue();
                    v107 = v105;
                    v24 = v541;
                    v505 = (void *)v106;
                    v108 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v508, 2);
                    v507 = 0;
                    v49 = 0;
                    *v511 = v108;
                    v63 = v574;
                    goto LABEL_588;
                  }
                  v507 = 0;
                  v49 = 0;
                  v63 = v574;
                  v60 = v534;
                  v13 = v506;
LABEL_589:

                  goto LABEL_590;
                }
                if (v13)
                {
                  v99 = v13;
                  v540 = v24;
                  v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v101 = *MEMORY[0x1E0D025B8];
                  v713 = *MEMORY[0x1E0CB2D50];
                  v60 = v534;
                  v507 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("streamType"));
                  v714 = v507;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v714, &v713, 1);
                  v102 = objc_claimAutoreleasedReturnValue();
                  v103 = v100;
                  v24 = v540;
                  v521 = (void *)v102;
                  v104 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v101, 2);
                  v13 = 0;
                  v49 = 0;
                  *v99 = v104;
                  v63 = v574;
                  goto LABEL_589;
                }
                v49 = 0;
                v63 = v574;
                v60 = v534;
LABEL_590:

                goto LABEL_591;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v525 = v27;
                goto LABEL_28;
              }
              if (v13)
              {
                v89 = v13;
                v538 = v24;
                v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v91 = *MEMORY[0x1E0D025B8];
                v717 = *MEMORY[0x1E0CB2D50];
                v60 = v534;
                v523 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("lastUserVolChangeType"));
                v718 = v523;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v718, &v717, 1);
                v92 = objc_claimAutoreleasedReturnValue();
                v93 = v90;
                v24 = v538;
                v526 = (void *)v92;
                v94 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2);
                v13 = 0;
                v49 = 0;
                *v89 = v94;
                v63 = v574;
LABEL_592:

                goto LABEL_593;
              }
              v49 = 0;
              v63 = v574;
              v60 = v534;
LABEL_593:

              goto LABEL_594;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = v20;
              goto LABEL_22;
            }
            if (v13)
            {
              v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v81 = *MEMORY[0x1E0D025B8];
              v721 = *MEMORY[0x1E0CB2D50];
              v509 = v13;
              v60 = v534;
              v82 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("downlinkdBA"));
              v722 = v82;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v722, &v721, 1);
              v24 = v6;
              v531 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v81, 2);
              v21 = 0;
              v49 = 0;
              *v509 = v83;
              v25 = (id)v82;
              v13 = v532;
              v63 = v574;
LABEL_595:

              v6 = v24;
              v16 = v530;
              goto LABEL_596;
            }
            v21 = 0;
            v49 = 0;
            v63 = v574;
            v60 = v534;
            v13 = v532;
LABEL_596:

            goto LABEL_597;
          }
          if (v13)
          {
            v571 = v7;
            v75 = self;
            v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v77 = *MEMORY[0x1E0D025B8];
            v723 = *MEMORY[0x1E0CB2D50];
            v60 = v534;
            v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("drumdBAPredicted"));
            v724 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v724, &v723, 1);
            v78 = objc_claimAutoreleasedReturnValue();
            v79 = v76;
            self = v75;
            v533 = (void *)v78;
            v49 = 0;
            *v13 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v77, 2);
            v7 = v571;
            v13 = 0;
            v63 = v574;
            goto LABEL_596;
          }
          v49 = 0;
          v63 = v574;
          v60 = v534;
LABEL_597:

          goto LABEL_598;
        }
        if (v13)
        {
          v536 = v6;
          v576 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v72 = *MEMORY[0x1E0D025B8];
          v725 = *MEMORY[0x1E0CB2D50];
          v73 = v13;
          v60 = v15;
          v13 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("drumdBK"));
          v726 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v726, &v725, 1);
          v573 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (id)objc_msgSend(v576, "initWithDomain:code:userInfo:", v72, 2);
          v575 = 0;
          v49 = 0;
          *v73 = v74;
          v6 = v536;
          v63 = v574;
          goto LABEL_597;
        }
        v575 = 0;
        v49 = 0;
        v63 = v574;
        v60 = v15;
LABEL_598:

        v9 = v577;
        goto LABEL_599;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v12;
        v13 = a4;
        v579 = v43;
        goto LABEL_10;
      }
      if (a4)
      {
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v570 = v7;
        v57 = v10;
        v58 = *MEMORY[0x1E0D025B8];
        v729 = *MEMORY[0x1E0CB2D50];
        v59 = a4;
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("refMicdBC"));
        v730 = v60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v730, &v729, 1);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = v56;
        v63 = (void *)v61;
        v64 = v58;
        v10 = v57;
        v7 = v570;
        v579 = 0;
        v49 = 0;
        *v59 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v64, 2, v61);
LABEL_600:

        v55 = v579;
        goto LABEL_601;
      }
      v55 = 0;
      v49 = 0;
LABEL_601:

      v8 = v580;
      goto LABEL_602;
    }
    if (a4)
    {
      v50 = self;
      v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v52 = *MEMORY[0x1E0D025B8];
      v731 = *MEMORY[0x1E0CB2D50];
      v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("refMicdBA"));
      v732 = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v732, &v731, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v51;
      self = v50;
      v55 = (void *)v53;
      v10 = 0;
      v49 = 0;
      *a4 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v52, 2, v12);
      goto LABEL_601;
    }
    v10 = 0;
    v49 = 0;
LABEL_602:

    goto LABEL_603;
  }
  if (a4)
  {
    v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v45 = *MEMORY[0x1E0D025B8];
    v733 = *MEMORY[0x1E0CB2D50];
    v46 = v7;
    v47 = objc_alloc(MEMORY[0x1E0CB3940]);
    v393 = objc_opt_class();
    v48 = v47;
    v7 = v46;
    v10 = (id)objc_msgSend(v48, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v393, CFSTR("controllerVersion"));
    v734[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v734, &v733, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v49 = 0;
    *a4 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2, v9);
    goto LABEL_602;
  }
  v8 = 0;
  v49 = 0;
LABEL_603:

  return v49;
}

- (id)_envSpectralData32BJSONArray
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
  -[BMDeviceAdaptiveVolume envSpectralData32B](self, "envSpectralData32B", 0);
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

- (id)_noiseType4BJSONArray
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
  -[BMDeviceAdaptiveVolume noiseType4B](self, "noiseType4B", 0);
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

- (id)jsonDictionary
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
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
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  id v154;
  void *v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  void *v167;
  id v168;
  id v169;
  id v170;
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
  void *v185;
  void *v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  void *v213;
  _QWORD v214[46];
  const __CFString *v215;
  const __CFString *v216;
  const __CFString *v217;
  const __CFString *v218;
  const __CFString *v219;
  const __CFString *v220;
  const __CFString *v221;
  const __CFString *v222;
  const __CFString *v223;
  const __CFString *v224;
  const __CFString *v225;
  const __CFString *v226;
  const __CFString *v227;
  const __CFString *v228;
  const __CFString *v229;
  const __CFString *v230;
  const __CFString *v231;
  const __CFString *v232;
  const __CFString *v233;
  const __CFString *v234;
  const __CFString *v235;
  const __CFString *v236;
  const __CFString *v237;
  const __CFString *v238;
  const __CFString *v239;
  const __CFString *v240;
  _QWORD v241[45];
  void *v242;
  uint64_t v243;
  id v244;
  uint64_t v245;
  id v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  uint64_t v269;

  v269 = *MEMORY[0x1E0C80C00];
  if (-[BMDeviceAdaptiveVolume hasControllerVersion](self, "hasControllerVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume controllerVersion](self, "controllerVersion"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasRefMicdBA](self, "hasRefMicdBA"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBA](self, "refMicdBA"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasRefMicdBC](self, "hasRefMicdBC"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBC](self, "refMicdBC"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDrumdBA](self, "hasDrumdBA"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBA](self, "drumdBA"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDrumdBK](self, "hasDrumdBK"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBK](self, "drumdBK"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDrumdBAPredicted](self, "hasDrumdBAPredicted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBAPredicted](self, "drumdBAPredicted"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDownlinkdBA](self, "hasDownlinkdBA"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume downlinkdBA](self, "downlinkdBA"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasCurrentVolumePrct](self, "hasCurrentVolumePrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume currentVolumePrct](self, "currentVolumePrct"));
    v212 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v212 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLastUserVolChangeType](self, "hasLastUserVolChangeType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastUserVolChangeType](self, "lastUserVolChangeType"));
    v211 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v211 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasHeadphoneMode](self, "hasHeadphoneMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume headphoneMode](self, "headphoneMode"));
    v210 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v210 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasStreamType](self, "hasStreamType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamType](self, "streamType"));
    v209 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v209 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasWindSpeechAggressorFlag](self, "hasWindSpeechAggressorFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windSpeechAggressorFlag](self, "windSpeechAggressorFlag"));
    v208 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v208 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasVolumeChangeFlag](self, "hasVolumeChangeFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume volumeChangeFlag](self, "volumeChangeFlag"));
    v207 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v207 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasSpeechPresenceProbability](self, "hasSpeechPresenceProbability"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume speechPresenceProbability](self, "speechPresenceProbability"));
    v206 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v206 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasPersonalizationParamSnr](self, "hasPersonalizationParamSnr"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamSnr](self, "personalizationParamSnr"));
    v205 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v205 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasPersonalizationParamMistakes](self, "hasPersonalizationParamMistakes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamMistakes](self, "personalizationParamMistakes"));
    v204 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v204 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLastEMediadBA](self, "hasLastEMediadBA"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastEMediadBA](self, "lastEMediadBA"));
    v203 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v203 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLastVolMediaPrct](self, "hasLastVolMediaPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolMediaPrct](self, "lastVolMediaPrct"));
    v202 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v202 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLastETelephonydBA](self, "hasLastETelephonydBA"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastETelephonydBA](self, "lastETelephonydBA"));
    v201 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v201 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLastVolTelephonyPrct](self, "hasLastVolTelephonyPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolTelephonyPrct](self, "lastVolTelephonyPrct"));
    v200 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v200 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLastESiridBA](self, "hasLastESiridBA"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastESiridBA](self, "lastESiridBA"));
    v199 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v199 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLastVolSiriPrct](self, "hasLastVolSiriPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolSiriPrct](self, "lastVolSiriPrct"));
    v198 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v198 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasSmoothEae](self, "hasSmoothEae"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smoothEae](self, "smoothEae"));
    v197 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v197 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDesiredDeltaE](self, "hasDesiredDeltaE"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume desiredDeltaE](self, "desiredDeltaE"));
    v196 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v196 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasPredVolMediaPrct](self, "hasPredVolMediaPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume predVolMediaPrct](self, "predVolMediaPrct"));
    v195 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v195 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasPredVolTelephonyPrct](self, "hasPredVolTelephonyPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume predVolTelephonyPrct](self, "predVolTelephonyPrct"));
    v194 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v194 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasPredVolSiriPrct](self, "hasPredVolSiriPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAdaptiveVolume predVolSiriPrct](self, "predVolSiriPrct"));
    v193 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v193 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasOnStartPredictionFlag](self, "hasOnStartPredictionFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume onStartPredictionFlag](self, "onStartPredictionFlag"));
    v192 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v192 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasGuardrailsAvoidFlag](self, "hasGuardrailsAvoidFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume guardrailsAvoidFlag](self, "guardrailsAvoidFlag"));
    v191 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v191 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasMinMaxCutFlag](self, "hasMinMaxCutFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume minMaxCutFlag](self, "minMaxCutFlag"));
    v190 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v190 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasManualVolumeChangeFlag](self, "hasManualVolumeChangeFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume manualVolumeChangeFlag](self, "manualVolumeChangeFlag"));
    v189 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v189 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasBigWindowSize](self, "hasBigWindowSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume bigWindowSize](self, "bigWindowSize"));
    v188 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v188 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasSmallWindowSize](self, "hasSmallWindowSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smallWindowSize](self, "smallWindowSize"));
    v187 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v187 = 0;
  }
  -[BMDeviceAdaptiveVolume activeAppName](self, "activeAppName");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceAdaptiveVolume activeAirpodsSerialNumber](self, "activeAirpodsSerialNumber");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceAdaptiveVolume hasAnchorVol](self, "hasAnchorVol"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorVol](self, "anchorVol"));
    v184 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v184 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasAnchorEnv](self, "hasAnchorEnv"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorEnv](self, "anchorEnv"));
    v183 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v183 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasPersonalizationCoeff](self, "hasPersonalizationCoeff"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume personalizationCoeff](self, "personalizationCoeff"));
    v182 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v182 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasUnsignedPredVolMediaPrct](self, "hasUnsignedPredVolMediaPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolMediaPrct](self, "unsignedPredVolMediaPrct"));
    v181 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v181 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasUnsignedPredVolTelephonyPrct](self, "hasUnsignedPredVolTelephonyPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolTelephonyPrct](self, "unsignedPredVolTelephonyPrct"));
    v180 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v180 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasUnsignedPredVolSiriPrct](self, "hasUnsignedPredVolSiriPrct"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolSiriPrct](self, "unsignedPredVolSiriPrct"));
    v179 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v179 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasSingleBudFlag](self, "hasSingleBudFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume singleBudFlag](self, "singleBudFlag"));
    v178 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v178 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasCdEngagementFlag](self, "hasCdEngagementFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume cdEngagementFlag](self, "cdEngagementFlag"));
    v177 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v177 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasActiveStreamFlag](self, "hasActiveStreamFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume activeStreamFlag](self, "activeStreamFlag"));
    v176 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v176 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasPvFeatureEnableFlag](self, "hasPvFeatureEnableFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume pvFeatureEnableFlag](self, "pvFeatureEnableFlag"));
    v175 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v175 = 0;
  }
  -[BMDeviceAdaptiveVolume _envSpectralData32BJSONArray](self, "_envSpectralData32BJSONArray");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceAdaptiveVolume hasWindStrength](self, "hasWindStrength"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windStrength](self, "windStrength"));
    v154 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v154 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasWindProb](self, "hasWindProb"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windProb](self, "windProb"));
    v153 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v153 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasMediaType](self, "hasMediaType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume mediaType](self, "mediaType"));
    v174 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v174 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasSourceActivity](self, "hasSourceActivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume sourceActivity](self, "sourceActivity"));
    v173 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v173 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasBudActivity](self, "hasBudActivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume budActivity](self, "budActivity"));
    v172 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v172 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLocation](self, "hasLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume location](self, "location"));
    v171 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v171 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasLocationType](self, "hasLocationType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume locationType](self, "locationType"));
    v170 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v170 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasFocusMode](self, "hasFocusMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume focusMode](self, "focusMode"));
    v169 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v169 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasStreamingAppBundleId](self, "hasStreamingAppBundleId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamingAppBundleId](self, "streamingAppBundleId"));
    v168 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v168 = 0;
  }
  -[BMDeviceAdaptiveVolume _noiseType4BJSONArray](self, "_noiseType4BJSONArray");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceAdaptiveVolume hasInstdBA](self, "hasInstdBA"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBA](self, "instdBA"));
    v166 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v166 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasInstdBC](self, "hasInstdBC"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBC](self, "instdBC"));
    v165 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v165 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasNonCAListeningMode](self, "hasNonCAListeningMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume nonCAListeningMode](self, "nonCAListeningMode"));
    v164 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v164 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasFit](self, "hasFit"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fit](self, "fit"));
    v163 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v163 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasFixedAutoAncGain](self, "hasFixedAutoAncGain"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fixedAutoAncGain](self, "fixedAutoAncGain"));
    v162 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v162 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasAdjustedAutoAncGain](self, "hasAdjustedAutoAncGain"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume adjustedAutoAncGain](self, "adjustedAutoAncGain"));
    v161 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v161 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasTimestamp](self, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume timestamp](self, "timestamp"));
    v160 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v160 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDRCenablementBit](self, "hasDRCenablementBit"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCenablementBit](self, "DRCenablementBit"));
    v159 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v159 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDRCwindFlag](self, "hasDRCwindFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCwindFlag](self, "DRCwindFlag"));
    v158 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v158 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDRCappSelfVoiceFlag](self, "hasDRCappSelfVoiceFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCappSelfVoiceFlag](self, "DRCappSelfVoiceFlag"));
    v157 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v157 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasDrumDRC](self, "hasDrumDRC"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumDRC](self, "drumDRC"));
    v156 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v156 = 0;
  }
  if (-[BMDeviceAdaptiveVolume hasRoutedDRCGain](self, "hasRoutedDRCGain"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume routedDRCGain](self, "routedDRCGain"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v214[0] = CFSTR("controllerVersion");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v146 = (void *)v11;
  v241[0] = v11;
  v214[1] = CFSTR("refMicdBA");
  v12 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v145 = (void *)v12;
  v241[1] = v12;
  v214[2] = CFSTR("refMicdBC");
  v13 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v144 = (void *)v13;
  v241[2] = v13;
  v214[3] = CFSTR("drumdBA");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v143 = (void *)v14;
  v241[3] = v14;
  v214[4] = CFSTR("drumdBK");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v142 = (void *)v15;
  v241[4] = v15;
  v214[5] = CFSTR("drumdBAPredicted");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v141 = (void *)v16;
  v241[5] = v16;
  v214[6] = CFSTR("downlinkdBA");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v140 = (void *)v17;
  v241[6] = v17;
  v214[7] = CFSTR("currentVolumePrct");
  v18 = (uint64_t)v212;
  if (!v212)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v139 = (void *)v18;
  v241[7] = v18;
  v214[8] = CFSTR("lastUserVolChangeType");
  v19 = (uint64_t)v211;
  if (!v211)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v138 = (void *)v19;
  v241[8] = v19;
  v214[9] = CFSTR("headphoneMode");
  v20 = (uint64_t)v210;
  if (!v210)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v137 = (void *)v20;
  v241[9] = v20;
  v214[10] = CFSTR("streamType");
  v21 = (uint64_t)v209;
  if (!v209)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v136 = (void *)v21;
  v241[10] = v21;
  v214[11] = CFSTR("windSpeechAggressorFlag");
  v22 = (uint64_t)v208;
  if (!v208)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v135 = (void *)v22;
  v241[11] = v22;
  v214[12] = CFSTR("volumeChangeFlag");
  v23 = (uint64_t)v207;
  if (!v207)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v134 = (void *)v23;
  v241[12] = v23;
  v214[13] = CFSTR("speechPresenceProbability");
  v24 = (uint64_t)v206;
  if (!v206)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v133 = (void *)v24;
  v241[13] = v24;
  v214[14] = CFSTR("personalizationParamSnr");
  v25 = (uint64_t)v205;
  if (!v205)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v132 = (void *)v25;
  v241[14] = v25;
  v214[15] = CFSTR("personalizationParamMistakes");
  v26 = (uint64_t)v204;
  if (!v204)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v131 = (void *)v26;
  v241[15] = v26;
  v214[16] = CFSTR("lastEMediadBA");
  v27 = (uint64_t)v203;
  if (!v203)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v130 = (void *)v27;
  v241[16] = v27;
  v214[17] = CFSTR("lastVolMediaPrct");
  v28 = (uint64_t)v202;
  if (!v202)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v129 = (void *)v28;
  v241[17] = v28;
  v214[18] = CFSTR("lastETelephonydBA");
  v29 = (uint64_t)v201;
  if (!v201)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v128 = (void *)v29;
  v241[18] = v29;
  v214[19] = CFSTR("lastVolTelephonyPrct");
  v30 = (uint64_t)v200;
  if (!v200)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v127 = (void *)v30;
  v241[19] = v30;
  v214[20] = CFSTR("lastESiridBA");
  v31 = (uint64_t)v199;
  if (!v199)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v126 = (void *)v31;
  v241[20] = v31;
  v214[21] = CFSTR("lastVolSiriPrct");
  v32 = (uint64_t)v198;
  if (!v198)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v125 = (void *)v32;
  v241[21] = v32;
  v214[22] = CFSTR("smoothEae");
  v33 = (uint64_t)v197;
  if (!v197)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v124 = (void *)v33;
  v241[22] = v33;
  v214[23] = CFSTR("desiredDeltaE");
  v34 = (uint64_t)v196;
  if (!v196)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v123 = (void *)v34;
  v241[23] = v34;
  v214[24] = CFSTR("predVolMediaPrct");
  v35 = (uint64_t)v195;
  if (!v195)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v122 = (void *)v35;
  v241[24] = v35;
  v214[25] = CFSTR("predVolTelephonyPrct");
  v36 = (uint64_t)v194;
  if (!v194)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v121 = (void *)v36;
  v241[25] = v36;
  v214[26] = CFSTR("predVolSiriPrct");
  v37 = (uint64_t)v193;
  if (!v193)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v120 = (void *)v37;
  v241[26] = v37;
  v214[27] = CFSTR("onStartPredictionFlag");
  v38 = (uint64_t)v192;
  if (!v192)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v119 = (void *)v38;
  v241[27] = v38;
  v214[28] = CFSTR("guardrailsAvoidFlag");
  v39 = (uint64_t)v191;
  if (!v191)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v118 = (void *)v39;
  v241[28] = v39;
  v214[29] = CFSTR("minMaxCutFlag");
  v40 = (uint64_t)v190;
  if (!v190)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v117 = (void *)v40;
  v241[29] = v40;
  v214[30] = CFSTR("manualVolumeChangeFlag");
  v41 = (uint64_t)v189;
  if (!v189)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v116 = (void *)v41;
  v241[30] = v41;
  v214[31] = CFSTR("bigWindowSize");
  v42 = (uint64_t)v188;
  if (!v188)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v115 = (void *)v42;
  v241[31] = v42;
  v214[32] = CFSTR("smallWindowSize");
  v43 = (uint64_t)v187;
  if (!v187)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v114 = (void *)v43;
  v241[32] = v43;
  v214[33] = CFSTR("activeAppName");
  v44 = (uint64_t)v186;
  if (!v186)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v113 = (void *)v44;
  v241[33] = v44;
  v214[34] = CFSTR("activeAirpodsSerialNumber");
  v45 = (uint64_t)v185;
  if (!v185)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v112 = (void *)v45;
  v241[34] = v45;
  v214[35] = CFSTR("anchorVol");
  v46 = (uint64_t)v184;
  if (!v184)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v111 = (void *)v46;
  v241[35] = v46;
  v214[36] = CFSTR("anchorEnv");
  v47 = (uint64_t)v183;
  if (!v183)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v110 = (void *)v47;
  v241[36] = v47;
  v214[37] = CFSTR("personalizationCoeff");
  v48 = (uint64_t)v182;
  if (!v182)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v109 = (void *)v48;
  v241[37] = v48;
  v214[38] = CFSTR("unsignedPredVolMediaPrct");
  v49 = (uint64_t)v181;
  if (!v181)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v108 = (void *)v49;
  v241[38] = v49;
  v214[39] = CFSTR("unsignedPredVolTelephonyPrct");
  v50 = (uint64_t)v180;
  if (!v180)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v107 = (void *)v50;
  v241[39] = v50;
  v214[40] = CFSTR("unsignedPredVolSiriPrct");
  v51 = (uint64_t)v179;
  if (!v179)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v106 = (void *)v51;
  v241[40] = v51;
  v214[41] = CFSTR("singleBudFlag");
  v52 = (uint64_t)v178;
  if (!v178)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v105 = (void *)v52;
  v241[41] = v52;
  v214[42] = CFSTR("cdEngagementFlag");
  v53 = (uint64_t)v177;
  if (!v177)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v104 = (void *)v53;
  v241[42] = v53;
  v214[43] = CFSTR("activeStreamFlag");
  v54 = (uint64_t)v176;
  if (!v176)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  v103 = (void *)v54;
  v152 = v10;
  v241[43] = v54;
  v214[44] = CFSTR("pvFeatureEnableFlag");
  v55 = (uint64_t)v175;
  if (!v175)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v102 = (void *)v55;
  v241[44] = v55;
  v214[45] = CFSTR("envSpectralData32B");
  if (v155)
  {
    v242 = v155;
    v215 = CFSTR("envSpectralData_32B");
    v56 = (uint64_t)v155;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = v86;
    v215 = CFSTR("envSpectralData_32B");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  v101 = (void *)v56;
  v243 = v56;
  v216 = CFSTR("windStrength");
  if (v154)
  {
    v244 = v154;
    v217 = CFSTR("wind_strength");
    v57 = (uint64_t)v154;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v85;
    v217 = CFSTR("wind_strength");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)v57;
  v245 = v57;
  v218 = CFSTR("windProb");
  if (v153)
  {
    v246 = v153;
    v219 = CFSTR("wind_prob");
    v58 = (uint64_t)v153;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v246 = v84;
    v219 = CFSTR("wind_prob");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)v58;
  v247 = v58;
  v220 = CFSTR("mediaType");
  v59 = (uint64_t)v174;
  if (!v174)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  v248 = v59;
  v221 = CFSTR("sourceActivity");
  v60 = (uint64_t)v173;
  if (!v173)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = objc_claimAutoreleasedReturnValue();
  }
  v249 = v60;
  v222 = CFSTR("budActivity");
  v61 = (uint64_t)v172;
  if (!v172)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = objc_claimAutoreleasedReturnValue();
  }
  v250 = v61;
  v223 = CFSTR("location");
  v62 = (uint64_t)v171;
  if (!v171)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v62;
  v251 = v62;
  v224 = CFSTR("locationType");
  v63 = (uint64_t)v170;
  if (!v170)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v63;
  v252 = v63;
  v225 = CFSTR("focusMode");
  v64 = (uint64_t)v169;
  if (!v169)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v64 = objc_claimAutoreleasedReturnValue();
  }
  v93 = (void *)v64;
  v98 = (void *)v59;
  v253 = v64;
  v226 = CFSTR("streamingAppBundleId");
  v65 = (uint64_t)v168;
  if (!v168)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v65;
  v254 = v65;
  v227 = CFSTR("noiseType4B");
  v96 = (void *)v61;
  if (v167)
  {
    v255 = v167;
    v228 = CFSTR("noiseType_4B");
    v66 = (uint64_t)v167;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v255 = v83;
    v228 = CFSTR("noiseType_4B");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v66 = objc_claimAutoreleasedReturnValue();
  }
  v91 = (void *)v66;
  v256 = v66;
  v229 = CFSTR("instdBA");
  v67 = (uint64_t)v166;
  if (!v166)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = objc_claimAutoreleasedReturnValue();
  }
  v257 = v67;
  v230 = CFSTR("instdBC");
  v68 = v165;
  if (!v165)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v258 = v68;
  v231 = CFSTR("nonCAListeningMode");
  v69 = (uint64_t)v164;
  if (!v164)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = objc_claimAutoreleasedReturnValue();
  }
  v213 = (void *)v69;
  v259 = v69;
  v232 = CFSTR("fit");
  v70 = (uint64_t)v163;
  if (!v163)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v148 = v9;
  v89 = (void *)v70;
  v260 = v70;
  v233 = CFSTR("fixedAutoAncGain");
  v71 = (uint64_t)v162;
  if (!v162)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)v60;
  v88 = (void *)v71;
  v261 = v71;
  v234 = CFSTR("adjustedAutoAncGain");
  v72 = (uint64_t)v161;
  if (!v161)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v72 = objc_claimAutoreleasedReturnValue();
  }
  v150 = v7;
  v151 = v6;
  v87 = (void *)v72;
  v262 = v72;
  v235 = CFSTR("timestamp");
  v73 = v160;
  if (!v160)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v149 = v4;
  v263 = v73;
  v236 = CFSTR("DRCenablementBit");
  v74 = v159;
  if (!v159)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)v67;
  v75 = v8;
  v264 = v74;
  v237 = CFSTR("DRCwindFlag");
  v76 = v158;
  if (!v158)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v77 = v3;
  v265 = v76;
  v238 = CFSTR("DRCappSelfVoiceFlag");
  v78 = v157;
  if (!v157)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v266 = v78;
  v239 = CFSTR("drumDRC");
  v79 = v156;
  if (!v156)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v267 = v79;
  v240 = CFSTR("routedDRCGain");
  v80 = v152;
  if (!v152)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v268 = v80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v241, v214, 72);
  v147 = (id)objc_claimAutoreleasedReturnValue();
  if (!v152)

  v81 = v213;
  if (!v156)
  {

    v81 = v213;
  }
  if (!v157)
  {

    v81 = v213;
  }
  if (!v158)
  {

    v81 = v213;
  }
  if (!v159)
  {

    v81 = v213;
  }
  if (!v160)
  {

    v81 = v213;
  }
  if (!v161)
  {

    v81 = v213;
  }
  if (!v162)
  {

    v81 = v213;
  }
  if (!v163)
  {

    v81 = v213;
  }
  if (!v164)

  if (!v165)
  if (!v166)

  if (!v167)
  {

  }
  if (!v168)

  if (!v169)
  if (!v170)

  if (!v171)
  if (!v172)

  if (!v173)
  if (v174)
  {
    if (v153)
      goto LABEL_373;
  }
  else
  {

    if (v153)
    {
LABEL_373:
      if (v154)
        goto LABEL_374;
LABEL_460:

      if (v155)
        goto LABEL_375;
      goto LABEL_461;
    }
  }

  if (!v154)
    goto LABEL_460;
LABEL_374:
  if (v155)
    goto LABEL_375;
LABEL_461:

LABEL_375:
  if (!v175)

  if (!v176)
  if (!v177)

  if (!v178)
  if (!v179)

  if (!v180)
  if (!v181)

  if (!v182)
  if (!v183)

  if (!v184)
  if (!v185)

  if (!v186)
  if (!v187)

  if (!v188)
  if (!v189)

  if (!v190)
  if (!v191)

  if (!v192)
  if (!v193)

  if (!v194)
  if (!v195)

  if (!v196)
  if (!v197)

  if (!v198)
  if (!v199)

  if (!v200)
  if (!v201)

  if (!v202)
  if (!v203)

  if (!v204)
  if (!v205)

  if (!v206)
  if (!v207)

  if (!v208)
  if (!v209)

  if (!v210)
  if (!v211)

  if (v212)
  {
    if (v148)
      goto LABEL_451;
  }
  else
  {

    if (v148)
    {
LABEL_451:
      if (v75)
        goto LABEL_452;
      goto LABEL_464;
    }
  }

  if (v75)
  {
LABEL_452:
    if (v150)
      goto LABEL_453;
    goto LABEL_465;
  }
LABEL_464:

  if (v150)
  {
LABEL_453:
    if (v151)
      goto LABEL_454;
    goto LABEL_466;
  }
LABEL_465:

  if (v151)
  {
LABEL_454:
    if (v5)
      goto LABEL_455;
    goto LABEL_467;
  }
LABEL_466:

  if (v5)
  {
LABEL_455:
    if (v149)
      goto LABEL_456;
LABEL_468:

    if (v77)
      goto LABEL_457;
LABEL_469:

    goto LABEL_457;
  }
LABEL_467:

  if (!v149)
    goto LABEL_468;
LABEL_456:
  if (!v77)
    goto LABEL_469;
LABEL_457:

  return v147;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  BOOL v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMDeviceAdaptiveVolume hasControllerVersion](self, "hasControllerVersion")
      || objc_msgSend(v5, "hasControllerVersion"))
    {
      if (!-[BMDeviceAdaptiveVolume hasControllerVersion](self, "hasControllerVersion"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasControllerVersion"))
        goto LABEL_339;
      v6 = -[BMDeviceAdaptiveVolume controllerVersion](self, "controllerVersion");
      if (v6 != objc_msgSend(v5, "controllerVersion"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasRefMicdBA](self, "hasRefMicdBA") || objc_msgSend(v5, "hasRefMicdBA"))
    {
      if (!-[BMDeviceAdaptiveVolume hasRefMicdBA](self, "hasRefMicdBA"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasRefMicdBA"))
        goto LABEL_339;
      v7 = -[BMDeviceAdaptiveVolume refMicdBA](self, "refMicdBA");
      if (v7 != objc_msgSend(v5, "refMicdBA"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasRefMicdBC](self, "hasRefMicdBC") || objc_msgSend(v5, "hasRefMicdBC"))
    {
      if (!-[BMDeviceAdaptiveVolume hasRefMicdBC](self, "hasRefMicdBC"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasRefMicdBC"))
        goto LABEL_339;
      v8 = -[BMDeviceAdaptiveVolume refMicdBC](self, "refMicdBC");
      if (v8 != objc_msgSend(v5, "refMicdBC"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasDrumdBA](self, "hasDrumdBA") || objc_msgSend(v5, "hasDrumdBA"))
    {
      if (!-[BMDeviceAdaptiveVolume hasDrumdBA](self, "hasDrumdBA"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasDrumdBA"))
        goto LABEL_339;
      v9 = -[BMDeviceAdaptiveVolume drumdBA](self, "drumdBA");
      if (v9 != objc_msgSend(v5, "drumdBA"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasDrumdBK](self, "hasDrumdBK") || objc_msgSend(v5, "hasDrumdBK"))
    {
      if (!-[BMDeviceAdaptiveVolume hasDrumdBK](self, "hasDrumdBK"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasDrumdBK"))
        goto LABEL_339;
      v10 = -[BMDeviceAdaptiveVolume drumdBK](self, "drumdBK");
      if (v10 != objc_msgSend(v5, "drumdBK"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasDrumdBAPredicted](self, "hasDrumdBAPredicted")
      || objc_msgSend(v5, "hasDrumdBAPredicted"))
    {
      if (!-[BMDeviceAdaptiveVolume hasDrumdBAPredicted](self, "hasDrumdBAPredicted"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasDrumdBAPredicted"))
        goto LABEL_339;
      v11 = -[BMDeviceAdaptiveVolume drumdBAPredicted](self, "drumdBAPredicted");
      if (v11 != objc_msgSend(v5, "drumdBAPredicted"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasDownlinkdBA](self, "hasDownlinkdBA")
      || objc_msgSend(v5, "hasDownlinkdBA"))
    {
      if (!-[BMDeviceAdaptiveVolume hasDownlinkdBA](self, "hasDownlinkdBA"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasDownlinkdBA"))
        goto LABEL_339;
      v12 = -[BMDeviceAdaptiveVolume downlinkdBA](self, "downlinkdBA");
      if (v12 != objc_msgSend(v5, "downlinkdBA"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasCurrentVolumePrct](self, "hasCurrentVolumePrct")
      || objc_msgSend(v5, "hasCurrentVolumePrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasCurrentVolumePrct](self, "hasCurrentVolumePrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasCurrentVolumePrct"))
        goto LABEL_339;
      v13 = -[BMDeviceAdaptiveVolume currentVolumePrct](self, "currentVolumePrct");
      if (v13 != objc_msgSend(v5, "currentVolumePrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLastUserVolChangeType](self, "hasLastUserVolChangeType")
      || objc_msgSend(v5, "hasLastUserVolChangeType"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLastUserVolChangeType](self, "hasLastUserVolChangeType"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLastUserVolChangeType"))
        goto LABEL_339;
      v14 = -[BMDeviceAdaptiveVolume lastUserVolChangeType](self, "lastUserVolChangeType");
      if (v14 != objc_msgSend(v5, "lastUserVolChangeType"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasHeadphoneMode](self, "hasHeadphoneMode")
      || objc_msgSend(v5, "hasHeadphoneMode"))
    {
      if (!-[BMDeviceAdaptiveVolume hasHeadphoneMode](self, "hasHeadphoneMode"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasHeadphoneMode"))
        goto LABEL_339;
      v15 = -[BMDeviceAdaptiveVolume headphoneMode](self, "headphoneMode");
      if (v15 != objc_msgSend(v5, "headphoneMode"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasStreamType](self, "hasStreamType")
      || objc_msgSend(v5, "hasStreamType"))
    {
      if (!-[BMDeviceAdaptiveVolume hasStreamType](self, "hasStreamType"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasStreamType"))
        goto LABEL_339;
      v16 = -[BMDeviceAdaptiveVolume streamType](self, "streamType");
      if (v16 != objc_msgSend(v5, "streamType"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasWindSpeechAggressorFlag](self, "hasWindSpeechAggressorFlag")
      || objc_msgSend(v5, "hasWindSpeechAggressorFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasWindSpeechAggressorFlag](self, "hasWindSpeechAggressorFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasWindSpeechAggressorFlag"))
        goto LABEL_339;
      v17 = -[BMDeviceAdaptiveVolume windSpeechAggressorFlag](self, "windSpeechAggressorFlag");
      if (v17 != objc_msgSend(v5, "windSpeechAggressorFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasVolumeChangeFlag](self, "hasVolumeChangeFlag")
      || objc_msgSend(v5, "hasVolumeChangeFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasVolumeChangeFlag](self, "hasVolumeChangeFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasVolumeChangeFlag"))
        goto LABEL_339;
      v18 = -[BMDeviceAdaptiveVolume volumeChangeFlag](self, "volumeChangeFlag");
      if (v18 != objc_msgSend(v5, "volumeChangeFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasSpeechPresenceProbability](self, "hasSpeechPresenceProbability")
      || objc_msgSend(v5, "hasSpeechPresenceProbability"))
    {
      if (!-[BMDeviceAdaptiveVolume hasSpeechPresenceProbability](self, "hasSpeechPresenceProbability"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasSpeechPresenceProbability"))
        goto LABEL_339;
      v19 = -[BMDeviceAdaptiveVolume speechPresenceProbability](self, "speechPresenceProbability");
      if (v19 != objc_msgSend(v5, "speechPresenceProbability"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasPersonalizationParamSnr](self, "hasPersonalizationParamSnr")
      || objc_msgSend(v5, "hasPersonalizationParamSnr"))
    {
      if (!-[BMDeviceAdaptiveVolume hasPersonalizationParamSnr](self, "hasPersonalizationParamSnr"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasPersonalizationParamSnr"))
        goto LABEL_339;
      v20 = -[BMDeviceAdaptiveVolume personalizationParamSnr](self, "personalizationParamSnr");
      if (v20 != objc_msgSend(v5, "personalizationParamSnr"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasPersonalizationParamMistakes](self, "hasPersonalizationParamMistakes")
      || objc_msgSend(v5, "hasPersonalizationParamMistakes"))
    {
      if (!-[BMDeviceAdaptiveVolume hasPersonalizationParamMistakes](self, "hasPersonalizationParamMistakes"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasPersonalizationParamMistakes"))
        goto LABEL_339;
      v21 = -[BMDeviceAdaptiveVolume personalizationParamMistakes](self, "personalizationParamMistakes");
      if (v21 != objc_msgSend(v5, "personalizationParamMistakes"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLastEMediadBA](self, "hasLastEMediadBA")
      || objc_msgSend(v5, "hasLastEMediadBA"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLastEMediadBA](self, "hasLastEMediadBA"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLastEMediadBA"))
        goto LABEL_339;
      v22 = -[BMDeviceAdaptiveVolume lastEMediadBA](self, "lastEMediadBA");
      if (v22 != objc_msgSend(v5, "lastEMediadBA"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLastVolMediaPrct](self, "hasLastVolMediaPrct")
      || objc_msgSend(v5, "hasLastVolMediaPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLastVolMediaPrct](self, "hasLastVolMediaPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLastVolMediaPrct"))
        goto LABEL_339;
      v23 = -[BMDeviceAdaptiveVolume lastVolMediaPrct](self, "lastVolMediaPrct");
      if (v23 != objc_msgSend(v5, "lastVolMediaPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLastETelephonydBA](self, "hasLastETelephonydBA")
      || objc_msgSend(v5, "hasLastETelephonydBA"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLastETelephonydBA](self, "hasLastETelephonydBA"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLastETelephonydBA"))
        goto LABEL_339;
      v24 = -[BMDeviceAdaptiveVolume lastETelephonydBA](self, "lastETelephonydBA");
      if (v24 != objc_msgSend(v5, "lastETelephonydBA"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLastVolTelephonyPrct](self, "hasLastVolTelephonyPrct")
      || objc_msgSend(v5, "hasLastVolTelephonyPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLastVolTelephonyPrct](self, "hasLastVolTelephonyPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLastVolTelephonyPrct"))
        goto LABEL_339;
      v25 = -[BMDeviceAdaptiveVolume lastVolTelephonyPrct](self, "lastVolTelephonyPrct");
      if (v25 != objc_msgSend(v5, "lastVolTelephonyPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLastESiridBA](self, "hasLastESiridBA")
      || objc_msgSend(v5, "hasLastESiridBA"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLastESiridBA](self, "hasLastESiridBA"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLastESiridBA"))
        goto LABEL_339;
      v26 = -[BMDeviceAdaptiveVolume lastESiridBA](self, "lastESiridBA");
      if (v26 != objc_msgSend(v5, "lastESiridBA"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLastVolSiriPrct](self, "hasLastVolSiriPrct")
      || objc_msgSend(v5, "hasLastVolSiriPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLastVolSiriPrct](self, "hasLastVolSiriPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLastVolSiriPrct"))
        goto LABEL_339;
      v27 = -[BMDeviceAdaptiveVolume lastVolSiriPrct](self, "lastVolSiriPrct");
      if (v27 != objc_msgSend(v5, "lastVolSiriPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasSmoothEae](self, "hasSmoothEae") || objc_msgSend(v5, "hasSmoothEae"))
    {
      if (!-[BMDeviceAdaptiveVolume hasSmoothEae](self, "hasSmoothEae"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasSmoothEae"))
        goto LABEL_339;
      v28 = -[BMDeviceAdaptiveVolume smoothEae](self, "smoothEae");
      if (v28 != objc_msgSend(v5, "smoothEae"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasDesiredDeltaE](self, "hasDesiredDeltaE")
      || objc_msgSend(v5, "hasDesiredDeltaE"))
    {
      if (!-[BMDeviceAdaptiveVolume hasDesiredDeltaE](self, "hasDesiredDeltaE"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasDesiredDeltaE"))
        goto LABEL_339;
      v29 = -[BMDeviceAdaptiveVolume desiredDeltaE](self, "desiredDeltaE");
      if (v29 != objc_msgSend(v5, "desiredDeltaE"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasPredVolMediaPrct](self, "hasPredVolMediaPrct")
      || objc_msgSend(v5, "hasPredVolMediaPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasPredVolMediaPrct](self, "hasPredVolMediaPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasPredVolMediaPrct"))
        goto LABEL_339;
      v30 = -[BMDeviceAdaptiveVolume predVolMediaPrct](self, "predVolMediaPrct");
      if (v30 != objc_msgSend(v5, "predVolMediaPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasPredVolTelephonyPrct](self, "hasPredVolTelephonyPrct")
      || objc_msgSend(v5, "hasPredVolTelephonyPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasPredVolTelephonyPrct](self, "hasPredVolTelephonyPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasPredVolTelephonyPrct"))
        goto LABEL_339;
      v31 = -[BMDeviceAdaptiveVolume predVolTelephonyPrct](self, "predVolTelephonyPrct");
      if (v31 != objc_msgSend(v5, "predVolTelephonyPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasPredVolSiriPrct](self, "hasPredVolSiriPrct")
      || objc_msgSend(v5, "hasPredVolSiriPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasPredVolSiriPrct](self, "hasPredVolSiriPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasPredVolSiriPrct"))
        goto LABEL_339;
      v32 = -[BMDeviceAdaptiveVolume predVolSiriPrct](self, "predVolSiriPrct");
      if (v32 != objc_msgSend(v5, "predVolSiriPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasOnStartPredictionFlag](self, "hasOnStartPredictionFlag")
      || objc_msgSend(v5, "hasOnStartPredictionFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasOnStartPredictionFlag](self, "hasOnStartPredictionFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasOnStartPredictionFlag"))
        goto LABEL_339;
      v33 = -[BMDeviceAdaptiveVolume onStartPredictionFlag](self, "onStartPredictionFlag");
      if (v33 != objc_msgSend(v5, "onStartPredictionFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasGuardrailsAvoidFlag](self, "hasGuardrailsAvoidFlag")
      || objc_msgSend(v5, "hasGuardrailsAvoidFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasGuardrailsAvoidFlag](self, "hasGuardrailsAvoidFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasGuardrailsAvoidFlag"))
        goto LABEL_339;
      v34 = -[BMDeviceAdaptiveVolume guardrailsAvoidFlag](self, "guardrailsAvoidFlag");
      if (v34 != objc_msgSend(v5, "guardrailsAvoidFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasMinMaxCutFlag](self, "hasMinMaxCutFlag")
      || objc_msgSend(v5, "hasMinMaxCutFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasMinMaxCutFlag](self, "hasMinMaxCutFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasMinMaxCutFlag"))
        goto LABEL_339;
      v35 = -[BMDeviceAdaptiveVolume minMaxCutFlag](self, "minMaxCutFlag");
      if (v35 != objc_msgSend(v5, "minMaxCutFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasManualVolumeChangeFlag](self, "hasManualVolumeChangeFlag")
      || objc_msgSend(v5, "hasManualVolumeChangeFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasManualVolumeChangeFlag](self, "hasManualVolumeChangeFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasManualVolumeChangeFlag"))
        goto LABEL_339;
      v36 = -[BMDeviceAdaptiveVolume manualVolumeChangeFlag](self, "manualVolumeChangeFlag");
      if (v36 != objc_msgSend(v5, "manualVolumeChangeFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasBigWindowSize](self, "hasBigWindowSize")
      || objc_msgSend(v5, "hasBigWindowSize"))
    {
      if (!-[BMDeviceAdaptiveVolume hasBigWindowSize](self, "hasBigWindowSize"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasBigWindowSize"))
        goto LABEL_339;
      v37 = -[BMDeviceAdaptiveVolume bigWindowSize](self, "bigWindowSize");
      if (v37 != objc_msgSend(v5, "bigWindowSize"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasSmallWindowSize](self, "hasSmallWindowSize")
      || objc_msgSend(v5, "hasSmallWindowSize"))
    {
      if (!-[BMDeviceAdaptiveVolume hasSmallWindowSize](self, "hasSmallWindowSize"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasSmallWindowSize"))
        goto LABEL_339;
      v38 = -[BMDeviceAdaptiveVolume smallWindowSize](self, "smallWindowSize");
      if (v38 != objc_msgSend(v5, "smallWindowSize"))
        goto LABEL_339;
    }
    -[BMDeviceAdaptiveVolume activeAppName](self, "activeAppName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeAppName");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[BMDeviceAdaptiveVolume activeAppName](self, "activeAppName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeAppName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_339;
    }
    -[BMDeviceAdaptiveVolume activeAirpodsSerialNumber](self, "activeAirpodsSerialNumber");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeAirpodsSerialNumber");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v46 == (void *)v47)
    {

    }
    else
    {
      v48 = (void *)v47;
      -[BMDeviceAdaptiveVolume activeAirpodsSerialNumber](self, "activeAirpodsSerialNumber");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeAirpodsSerialNumber");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if (!v51)
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasAnchorVol](self, "hasAnchorVol") || objc_msgSend(v5, "hasAnchorVol"))
    {
      if (!-[BMDeviceAdaptiveVolume hasAnchorVol](self, "hasAnchorVol"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasAnchorVol"))
        goto LABEL_339;
      v52 = -[BMDeviceAdaptiveVolume anchorVol](self, "anchorVol");
      if (v52 != objc_msgSend(v5, "anchorVol"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasAnchorEnv](self, "hasAnchorEnv") || objc_msgSend(v5, "hasAnchorEnv"))
    {
      if (!-[BMDeviceAdaptiveVolume hasAnchorEnv](self, "hasAnchorEnv"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasAnchorEnv"))
        goto LABEL_339;
      v53 = -[BMDeviceAdaptiveVolume anchorEnv](self, "anchorEnv");
      if (v53 != objc_msgSend(v5, "anchorEnv"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasPersonalizationCoeff](self, "hasPersonalizationCoeff")
      || objc_msgSend(v5, "hasPersonalizationCoeff"))
    {
      if (!-[BMDeviceAdaptiveVolume hasPersonalizationCoeff](self, "hasPersonalizationCoeff"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasPersonalizationCoeff"))
        goto LABEL_339;
      v54 = -[BMDeviceAdaptiveVolume personalizationCoeff](self, "personalizationCoeff");
      if (v54 != objc_msgSend(v5, "personalizationCoeff"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasUnsignedPredVolMediaPrct](self, "hasUnsignedPredVolMediaPrct")
      || objc_msgSend(v5, "hasUnsignedPredVolMediaPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasUnsignedPredVolMediaPrct](self, "hasUnsignedPredVolMediaPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasUnsignedPredVolMediaPrct"))
        goto LABEL_339;
      v55 = -[BMDeviceAdaptiveVolume unsignedPredVolMediaPrct](self, "unsignedPredVolMediaPrct");
      if (v55 != objc_msgSend(v5, "unsignedPredVolMediaPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasUnsignedPredVolTelephonyPrct](self, "hasUnsignedPredVolTelephonyPrct")
      || objc_msgSend(v5, "hasUnsignedPredVolTelephonyPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasUnsignedPredVolTelephonyPrct](self, "hasUnsignedPredVolTelephonyPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasUnsignedPredVolTelephonyPrct"))
        goto LABEL_339;
      v56 = -[BMDeviceAdaptiveVolume unsignedPredVolTelephonyPrct](self, "unsignedPredVolTelephonyPrct");
      if (v56 != objc_msgSend(v5, "unsignedPredVolTelephonyPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasUnsignedPredVolSiriPrct](self, "hasUnsignedPredVolSiriPrct")
      || objc_msgSend(v5, "hasUnsignedPredVolSiriPrct"))
    {
      if (!-[BMDeviceAdaptiveVolume hasUnsignedPredVolSiriPrct](self, "hasUnsignedPredVolSiriPrct"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasUnsignedPredVolSiriPrct"))
        goto LABEL_339;
      v57 = -[BMDeviceAdaptiveVolume unsignedPredVolSiriPrct](self, "unsignedPredVolSiriPrct");
      if (v57 != objc_msgSend(v5, "unsignedPredVolSiriPrct"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasSingleBudFlag](self, "hasSingleBudFlag")
      || objc_msgSend(v5, "hasSingleBudFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasSingleBudFlag](self, "hasSingleBudFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasSingleBudFlag"))
        goto LABEL_339;
      v58 = -[BMDeviceAdaptiveVolume singleBudFlag](self, "singleBudFlag");
      if (v58 != objc_msgSend(v5, "singleBudFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasCdEngagementFlag](self, "hasCdEngagementFlag")
      || objc_msgSend(v5, "hasCdEngagementFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasCdEngagementFlag](self, "hasCdEngagementFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasCdEngagementFlag"))
        goto LABEL_339;
      v59 = -[BMDeviceAdaptiveVolume cdEngagementFlag](self, "cdEngagementFlag");
      if (v59 != objc_msgSend(v5, "cdEngagementFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasActiveStreamFlag](self, "hasActiveStreamFlag")
      || objc_msgSend(v5, "hasActiveStreamFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasActiveStreamFlag](self, "hasActiveStreamFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasActiveStreamFlag"))
        goto LABEL_339;
      v60 = -[BMDeviceAdaptiveVolume activeStreamFlag](self, "activeStreamFlag");
      if (v60 != objc_msgSend(v5, "activeStreamFlag"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasPvFeatureEnableFlag](self, "hasPvFeatureEnableFlag")
      || objc_msgSend(v5, "hasPvFeatureEnableFlag"))
    {
      if (!-[BMDeviceAdaptiveVolume hasPvFeatureEnableFlag](self, "hasPvFeatureEnableFlag"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasPvFeatureEnableFlag"))
        goto LABEL_339;
      v61 = -[BMDeviceAdaptiveVolume pvFeatureEnableFlag](self, "pvFeatureEnableFlag");
      if (v61 != objc_msgSend(v5, "pvFeatureEnableFlag"))
        goto LABEL_339;
    }
    -[BMDeviceAdaptiveVolume envSpectralData32B](self, "envSpectralData32B");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "envSpectralData32B");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v62 == (void *)v63)
    {

    }
    else
    {
      v64 = (void *)v63;
      -[BMDeviceAdaptiveVolume envSpectralData32B](self, "envSpectralData32B");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "envSpectralData32B");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v65, "isEqual:", v66);

      if (!v67)
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasWindStrength](self, "hasWindStrength")
      || objc_msgSend(v5, "hasWindStrength"))
    {
      if (!-[BMDeviceAdaptiveVolume hasWindStrength](self, "hasWindStrength"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasWindStrength"))
        goto LABEL_339;
      v68 = -[BMDeviceAdaptiveVolume windStrength](self, "windStrength");
      if (v68 != objc_msgSend(v5, "windStrength"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasWindProb](self, "hasWindProb") || objc_msgSend(v5, "hasWindProb"))
    {
      if (!-[BMDeviceAdaptiveVolume hasWindProb](self, "hasWindProb"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasWindProb"))
        goto LABEL_339;
      v69 = -[BMDeviceAdaptiveVolume windProb](self, "windProb");
      if (v69 != objc_msgSend(v5, "windProb"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasMediaType](self, "hasMediaType") || objc_msgSend(v5, "hasMediaType"))
    {
      if (!-[BMDeviceAdaptiveVolume hasMediaType](self, "hasMediaType"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasMediaType"))
        goto LABEL_339;
      v70 = -[BMDeviceAdaptiveVolume mediaType](self, "mediaType");
      if (v70 != objc_msgSend(v5, "mediaType"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasSourceActivity](self, "hasSourceActivity")
      || objc_msgSend(v5, "hasSourceActivity"))
    {
      if (!-[BMDeviceAdaptiveVolume hasSourceActivity](self, "hasSourceActivity"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasSourceActivity"))
        goto LABEL_339;
      v71 = -[BMDeviceAdaptiveVolume sourceActivity](self, "sourceActivity");
      if (v71 != objc_msgSend(v5, "sourceActivity"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasBudActivity](self, "hasBudActivity")
      || objc_msgSend(v5, "hasBudActivity"))
    {
      if (!-[BMDeviceAdaptiveVolume hasBudActivity](self, "hasBudActivity"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasBudActivity"))
        goto LABEL_339;
      v72 = -[BMDeviceAdaptiveVolume budActivity](self, "budActivity");
      if (v72 != objc_msgSend(v5, "budActivity"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLocation](self, "hasLocation") || objc_msgSend(v5, "hasLocation"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLocation](self, "hasLocation"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLocation"))
        goto LABEL_339;
      v73 = -[BMDeviceAdaptiveVolume location](self, "location");
      if (v73 != objc_msgSend(v5, "location"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasLocationType](self, "hasLocationType")
      || objc_msgSend(v5, "hasLocationType"))
    {
      if (!-[BMDeviceAdaptiveVolume hasLocationType](self, "hasLocationType"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasLocationType"))
        goto LABEL_339;
      v74 = -[BMDeviceAdaptiveVolume locationType](self, "locationType");
      if (v74 != objc_msgSend(v5, "locationType"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasFocusMode](self, "hasFocusMode") || objc_msgSend(v5, "hasFocusMode"))
    {
      if (!-[BMDeviceAdaptiveVolume hasFocusMode](self, "hasFocusMode"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasFocusMode"))
        goto LABEL_339;
      v75 = -[BMDeviceAdaptiveVolume focusMode](self, "focusMode");
      if (v75 != objc_msgSend(v5, "focusMode"))
        goto LABEL_339;
    }
    if (-[BMDeviceAdaptiveVolume hasStreamingAppBundleId](self, "hasStreamingAppBundleId")
      || objc_msgSend(v5, "hasStreamingAppBundleId"))
    {
      if (!-[BMDeviceAdaptiveVolume hasStreamingAppBundleId](self, "hasStreamingAppBundleId"))
        goto LABEL_339;
      if (!objc_msgSend(v5, "hasStreamingAppBundleId"))
        goto LABEL_339;
      v76 = -[BMDeviceAdaptiveVolume streamingAppBundleId](self, "streamingAppBundleId");
      if (v76 != objc_msgSend(v5, "streamingAppBundleId"))
        goto LABEL_339;
    }
    -[BMDeviceAdaptiveVolume noiseType4B](self, "noiseType4B");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noiseType4B");
    v78 = objc_claimAutoreleasedReturnValue();
    if (v77 == (void *)v78)
    {

    }
    else
    {
      v79 = (void *)v78;
      -[BMDeviceAdaptiveVolume noiseType4B](self, "noiseType4B");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "noiseType4B");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v80, "isEqual:", v81);

      if (!v82)
        goto LABEL_339;
    }
    if (!-[BMDeviceAdaptiveVolume hasInstdBA](self, "hasInstdBA") && !objc_msgSend(v5, "hasInstdBA")
      || -[BMDeviceAdaptiveVolume hasInstdBA](self, "hasInstdBA")
      && objc_msgSend(v5, "hasInstdBA")
      && (v83 = -[BMDeviceAdaptiveVolume instdBA](self, "instdBA"), v83 == objc_msgSend(v5, "instdBA")))
    {
      if (!-[BMDeviceAdaptiveVolume hasInstdBC](self, "hasInstdBC") && !objc_msgSend(v5, "hasInstdBC")
        || -[BMDeviceAdaptiveVolume hasInstdBC](self, "hasInstdBC")
        && objc_msgSend(v5, "hasInstdBC")
        && (v84 = -[BMDeviceAdaptiveVolume instdBC](self, "instdBC"), v84 == objc_msgSend(v5, "instdBC")))
      {
        if (!-[BMDeviceAdaptiveVolume hasNonCAListeningMode](self, "hasNonCAListeningMode")
          && !objc_msgSend(v5, "hasNonCAListeningMode")
          || -[BMDeviceAdaptiveVolume hasNonCAListeningMode](self, "hasNonCAListeningMode")
          && objc_msgSend(v5, "hasNonCAListeningMode")
          && (v85 = -[BMDeviceAdaptiveVolume nonCAListeningMode](self, "nonCAListeningMode"),
              v85 == objc_msgSend(v5, "nonCAListeningMode")))
        {
          if (!-[BMDeviceAdaptiveVolume hasFit](self, "hasFit") && !objc_msgSend(v5, "hasFit")
            || -[BMDeviceAdaptiveVolume hasFit](self, "hasFit")
            && objc_msgSend(v5, "hasFit")
            && (v86 = -[BMDeviceAdaptiveVolume fit](self, "fit"), v86 == objc_msgSend(v5, "fit")))
          {
            if (!-[BMDeviceAdaptiveVolume hasFixedAutoAncGain](self, "hasFixedAutoAncGain")
              && !objc_msgSend(v5, "hasFixedAutoAncGain")
              || -[BMDeviceAdaptiveVolume hasFixedAutoAncGain](self, "hasFixedAutoAncGain")
              && objc_msgSend(v5, "hasFixedAutoAncGain")
              && (v87 = -[BMDeviceAdaptiveVolume fixedAutoAncGain](self, "fixedAutoAncGain"),
                  v87 == objc_msgSend(v5, "fixedAutoAncGain")))
            {
              if (!-[BMDeviceAdaptiveVolume hasAdjustedAutoAncGain](self, "hasAdjustedAutoAncGain")
                && !objc_msgSend(v5, "hasAdjustedAutoAncGain")
                || -[BMDeviceAdaptiveVolume hasAdjustedAutoAncGain](self, "hasAdjustedAutoAncGain")
                && objc_msgSend(v5, "hasAdjustedAutoAncGain")
                && (v88 = -[BMDeviceAdaptiveVolume adjustedAutoAncGain](self, "adjustedAutoAncGain"),
                    v88 == objc_msgSend(v5, "adjustedAutoAncGain")))
              {
                if (!-[BMDeviceAdaptiveVolume hasTimestamp](self, "hasTimestamp")
                  && !objc_msgSend(v5, "hasTimestamp")
                  || -[BMDeviceAdaptiveVolume hasTimestamp](self, "hasTimestamp")
                  && objc_msgSend(v5, "hasTimestamp")
                  && (v89 = -[BMDeviceAdaptiveVolume timestamp](self, "timestamp"),
                      v89 == objc_msgSend(v5, "timestamp")))
                {
                  if (!-[BMDeviceAdaptiveVolume hasDRCenablementBit](self, "hasDRCenablementBit")
                    && !objc_msgSend(v5, "hasDRCenablementBit")
                    || -[BMDeviceAdaptiveVolume hasDRCenablementBit](self, "hasDRCenablementBit")
                    && objc_msgSend(v5, "hasDRCenablementBit")
                    && (v90 = -[BMDeviceAdaptiveVolume DRCenablementBit](self, "DRCenablementBit"),
                        v90 == objc_msgSend(v5, "DRCenablementBit")))
                  {
                    if (!-[BMDeviceAdaptiveVolume hasDRCwindFlag](self, "hasDRCwindFlag")
                      && !objc_msgSend(v5, "hasDRCwindFlag")
                      || -[BMDeviceAdaptiveVolume hasDRCwindFlag](self, "hasDRCwindFlag")
                      && objc_msgSend(v5, "hasDRCwindFlag")
                      && (v91 = -[BMDeviceAdaptiveVolume DRCwindFlag](self, "DRCwindFlag"),
                          v91 == objc_msgSend(v5, "DRCwindFlag")))
                    {
                      if (!-[BMDeviceAdaptiveVolume hasDRCappSelfVoiceFlag](self, "hasDRCappSelfVoiceFlag")
                        && !objc_msgSend(v5, "hasDRCappSelfVoiceFlag")
                        || -[BMDeviceAdaptiveVolume hasDRCappSelfVoiceFlag](self, "hasDRCappSelfVoiceFlag")
                        && objc_msgSend(v5, "hasDRCappSelfVoiceFlag")
                        && (v92 = -[BMDeviceAdaptiveVolume DRCappSelfVoiceFlag](self, "DRCappSelfVoiceFlag"),
                            v92 == objc_msgSend(v5, "DRCappSelfVoiceFlag")))
                      {
                        if (!-[BMDeviceAdaptiveVolume hasDrumDRC](self, "hasDrumDRC")
                          && !objc_msgSend(v5, "hasDrumDRC")
                          || -[BMDeviceAdaptiveVolume hasDrumDRC](self, "hasDrumDRC")
                          && objc_msgSend(v5, "hasDrumDRC")
                          && (v93 = -[BMDeviceAdaptiveVolume drumDRC](self, "drumDRC"),
                              v93 == objc_msgSend(v5, "drumDRC")))
                        {
                          if (!-[BMDeviceAdaptiveVolume hasRoutedDRCGain](self, "hasRoutedDRCGain")
                            && !objc_msgSend(v5, "hasRoutedDRCGain"))
                          {
                            v45 = 1;
                            goto LABEL_340;
                          }
                          if (-[BMDeviceAdaptiveVolume hasRoutedDRCGain](self, "hasRoutedDRCGain")
                            && objc_msgSend(v5, "hasRoutedDRCGain"))
                          {
                            v94 = -[BMDeviceAdaptiveVolume routedDRCGain](self, "routedDRCGain");
                            v45 = v94 == objc_msgSend(v5, "routedDRCGain");
LABEL_340:

                            goto LABEL_341;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_339:
    v45 = 0;
    goto LABEL_340;
  }
  v45 = 0;
LABEL_341:

  return v45;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)controllerVersion
{
  return self->_controllerVersion;
}

- (BOOL)hasControllerVersion
{
  return self->_hasControllerVersion;
}

- (void)setHasControllerVersion:(BOOL)a3
{
  self->_hasControllerVersion = a3;
}

- (unsigned)refMicdBA
{
  return self->_refMicdBA;
}

- (BOOL)hasRefMicdBA
{
  return self->_hasRefMicdBA;
}

- (void)setHasRefMicdBA:(BOOL)a3
{
  self->_hasRefMicdBA = a3;
}

- (unsigned)refMicdBC
{
  return self->_refMicdBC;
}

- (BOOL)hasRefMicdBC
{
  return self->_hasRefMicdBC;
}

- (void)setHasRefMicdBC:(BOOL)a3
{
  self->_hasRefMicdBC = a3;
}

- (unsigned)drumdBA
{
  return self->_drumdBA;
}

- (BOOL)hasDrumdBA
{
  return self->_hasDrumdBA;
}

- (void)setHasDrumdBA:(BOOL)a3
{
  self->_hasDrumdBA = a3;
}

- (unsigned)drumdBK
{
  return self->_drumdBK;
}

- (BOOL)hasDrumdBK
{
  return self->_hasDrumdBK;
}

- (void)setHasDrumdBK:(BOOL)a3
{
  self->_hasDrumdBK = a3;
}

- (unsigned)drumdBAPredicted
{
  return self->_drumdBAPredicted;
}

- (BOOL)hasDrumdBAPredicted
{
  return self->_hasDrumdBAPredicted;
}

- (void)setHasDrumdBAPredicted:(BOOL)a3
{
  self->_hasDrumdBAPredicted = a3;
}

- (unsigned)downlinkdBA
{
  return self->_downlinkdBA;
}

- (BOOL)hasDownlinkdBA
{
  return self->_hasDownlinkdBA;
}

- (void)setHasDownlinkdBA:(BOOL)a3
{
  self->_hasDownlinkdBA = a3;
}

- (unsigned)currentVolumePrct
{
  return self->_currentVolumePrct;
}

- (BOOL)hasCurrentVolumePrct
{
  return self->_hasCurrentVolumePrct;
}

- (void)setHasCurrentVolumePrct:(BOOL)a3
{
  self->_hasCurrentVolumePrct = a3;
}

- (unsigned)lastUserVolChangeType
{
  return self->_lastUserVolChangeType;
}

- (BOOL)hasLastUserVolChangeType
{
  return self->_hasLastUserVolChangeType;
}

- (void)setHasLastUserVolChangeType:(BOOL)a3
{
  self->_hasLastUserVolChangeType = a3;
}

- (unsigned)headphoneMode
{
  return self->_headphoneMode;
}

- (BOOL)hasHeadphoneMode
{
  return self->_hasHeadphoneMode;
}

- (void)setHasHeadphoneMode:(BOOL)a3
{
  self->_hasHeadphoneMode = a3;
}

- (unsigned)streamType
{
  return self->_streamType;
}

- (BOOL)hasStreamType
{
  return self->_hasStreamType;
}

- (void)setHasStreamType:(BOOL)a3
{
  self->_hasStreamType = a3;
}

- (unsigned)windSpeechAggressorFlag
{
  return self->_windSpeechAggressorFlag;
}

- (BOOL)hasWindSpeechAggressorFlag
{
  return self->_hasWindSpeechAggressorFlag;
}

- (void)setHasWindSpeechAggressorFlag:(BOOL)a3
{
  self->_hasWindSpeechAggressorFlag = a3;
}

- (unsigned)volumeChangeFlag
{
  return self->_volumeChangeFlag;
}

- (BOOL)hasVolumeChangeFlag
{
  return self->_hasVolumeChangeFlag;
}

- (void)setHasVolumeChangeFlag:(BOOL)a3
{
  self->_hasVolumeChangeFlag = a3;
}

- (unsigned)speechPresenceProbability
{
  return self->_speechPresenceProbability;
}

- (BOOL)hasSpeechPresenceProbability
{
  return self->_hasSpeechPresenceProbability;
}

- (void)setHasSpeechPresenceProbability:(BOOL)a3
{
  self->_hasSpeechPresenceProbability = a3;
}

- (int)personalizationParamSnr
{
  return self->_personalizationParamSnr;
}

- (BOOL)hasPersonalizationParamSnr
{
  return self->_hasPersonalizationParamSnr;
}

- (void)setHasPersonalizationParamSnr:(BOOL)a3
{
  self->_hasPersonalizationParamSnr = a3;
}

- (int)personalizationParamMistakes
{
  return self->_personalizationParamMistakes;
}

- (BOOL)hasPersonalizationParamMistakes
{
  return self->_hasPersonalizationParamMistakes;
}

- (void)setHasPersonalizationParamMistakes:(BOOL)a3
{
  self->_hasPersonalizationParamMistakes = a3;
}

- (unsigned)lastEMediadBA
{
  return self->_lastEMediadBA;
}

- (BOOL)hasLastEMediadBA
{
  return self->_hasLastEMediadBA;
}

- (void)setHasLastEMediadBA:(BOOL)a3
{
  self->_hasLastEMediadBA = a3;
}

- (unsigned)lastVolMediaPrct
{
  return self->_lastVolMediaPrct;
}

- (BOOL)hasLastVolMediaPrct
{
  return self->_hasLastVolMediaPrct;
}

- (void)setHasLastVolMediaPrct:(BOOL)a3
{
  self->_hasLastVolMediaPrct = a3;
}

- (unsigned)lastETelephonydBA
{
  return self->_lastETelephonydBA;
}

- (BOOL)hasLastETelephonydBA
{
  return self->_hasLastETelephonydBA;
}

- (void)setHasLastETelephonydBA:(BOOL)a3
{
  self->_hasLastETelephonydBA = a3;
}

- (unsigned)lastVolTelephonyPrct
{
  return self->_lastVolTelephonyPrct;
}

- (BOOL)hasLastVolTelephonyPrct
{
  return self->_hasLastVolTelephonyPrct;
}

- (void)setHasLastVolTelephonyPrct:(BOOL)a3
{
  self->_hasLastVolTelephonyPrct = a3;
}

- (unsigned)lastESiridBA
{
  return self->_lastESiridBA;
}

- (BOOL)hasLastESiridBA
{
  return self->_hasLastESiridBA;
}

- (void)setHasLastESiridBA:(BOOL)a3
{
  self->_hasLastESiridBA = a3;
}

- (unsigned)lastVolSiriPrct
{
  return self->_lastVolSiriPrct;
}

- (BOOL)hasLastVolSiriPrct
{
  return self->_hasLastVolSiriPrct;
}

- (void)setHasLastVolSiriPrct:(BOOL)a3
{
  self->_hasLastVolSiriPrct = a3;
}

- (unsigned)smoothEae
{
  return self->_smoothEae;
}

- (BOOL)hasSmoothEae
{
  return self->_hasSmoothEae;
}

- (void)setHasSmoothEae:(BOOL)a3
{
  self->_hasSmoothEae = a3;
}

- (int)desiredDeltaE
{
  return self->_desiredDeltaE;
}

- (BOOL)hasDesiredDeltaE
{
  return self->_hasDesiredDeltaE;
}

- (void)setHasDesiredDeltaE:(BOOL)a3
{
  self->_hasDesiredDeltaE = a3;
}

- (int)predVolMediaPrct
{
  return self->_predVolMediaPrct;
}

- (BOOL)hasPredVolMediaPrct
{
  return self->_hasPredVolMediaPrct;
}

- (void)setHasPredVolMediaPrct:(BOOL)a3
{
  self->_hasPredVolMediaPrct = a3;
}

- (int)predVolTelephonyPrct
{
  return self->_predVolTelephonyPrct;
}

- (BOOL)hasPredVolTelephonyPrct
{
  return self->_hasPredVolTelephonyPrct;
}

- (void)setHasPredVolTelephonyPrct:(BOOL)a3
{
  self->_hasPredVolTelephonyPrct = a3;
}

- (int)predVolSiriPrct
{
  return self->_predVolSiriPrct;
}

- (BOOL)hasPredVolSiriPrct
{
  return self->_hasPredVolSiriPrct;
}

- (void)setHasPredVolSiriPrct:(BOOL)a3
{
  self->_hasPredVolSiriPrct = a3;
}

- (unsigned)onStartPredictionFlag
{
  return self->_onStartPredictionFlag;
}

- (BOOL)hasOnStartPredictionFlag
{
  return self->_hasOnStartPredictionFlag;
}

- (void)setHasOnStartPredictionFlag:(BOOL)a3
{
  self->_hasOnStartPredictionFlag = a3;
}

- (unsigned)guardrailsAvoidFlag
{
  return self->_guardrailsAvoidFlag;
}

- (BOOL)hasGuardrailsAvoidFlag
{
  return self->_hasGuardrailsAvoidFlag;
}

- (void)setHasGuardrailsAvoidFlag:(BOOL)a3
{
  self->_hasGuardrailsAvoidFlag = a3;
}

- (unsigned)minMaxCutFlag
{
  return self->_minMaxCutFlag;
}

- (BOOL)hasMinMaxCutFlag
{
  return self->_hasMinMaxCutFlag;
}

- (void)setHasMinMaxCutFlag:(BOOL)a3
{
  self->_hasMinMaxCutFlag = a3;
}

- (unsigned)manualVolumeChangeFlag
{
  return self->_manualVolumeChangeFlag;
}

- (BOOL)hasManualVolumeChangeFlag
{
  return self->_hasManualVolumeChangeFlag;
}

- (void)setHasManualVolumeChangeFlag:(BOOL)a3
{
  self->_hasManualVolumeChangeFlag = a3;
}

- (unsigned)bigWindowSize
{
  return self->_bigWindowSize;
}

- (BOOL)hasBigWindowSize
{
  return self->_hasBigWindowSize;
}

- (void)setHasBigWindowSize:(BOOL)a3
{
  self->_hasBigWindowSize = a3;
}

- (unsigned)smallWindowSize
{
  return self->_smallWindowSize;
}

- (BOOL)hasSmallWindowSize
{
  return self->_hasSmallWindowSize;
}

- (void)setHasSmallWindowSize:(BOOL)a3
{
  self->_hasSmallWindowSize = a3;
}

- (NSString)activeAppName
{
  return self->_activeAppName;
}

- (NSString)activeAirpodsSerialNumber
{
  return self->_activeAirpodsSerialNumber;
}

- (unsigned)anchorVol
{
  return self->_anchorVol;
}

- (BOOL)hasAnchorVol
{
  return self->_hasAnchorVol;
}

- (void)setHasAnchorVol:(BOOL)a3
{
  self->_hasAnchorVol = a3;
}

- (unsigned)anchorEnv
{
  return self->_anchorEnv;
}

- (BOOL)hasAnchorEnv
{
  return self->_hasAnchorEnv;
}

- (void)setHasAnchorEnv:(BOOL)a3
{
  self->_hasAnchorEnv = a3;
}

- (unsigned)personalizationCoeff
{
  return self->_personalizationCoeff;
}

- (BOOL)hasPersonalizationCoeff
{
  return self->_hasPersonalizationCoeff;
}

- (void)setHasPersonalizationCoeff:(BOOL)a3
{
  self->_hasPersonalizationCoeff = a3;
}

- (unsigned)unsignedPredVolMediaPrct
{
  return self->_unsignedPredVolMediaPrct;
}

- (BOOL)hasUnsignedPredVolMediaPrct
{
  return self->_hasUnsignedPredVolMediaPrct;
}

- (void)setHasUnsignedPredVolMediaPrct:(BOOL)a3
{
  self->_hasUnsignedPredVolMediaPrct = a3;
}

- (unsigned)unsignedPredVolTelephonyPrct
{
  return self->_unsignedPredVolTelephonyPrct;
}

- (BOOL)hasUnsignedPredVolTelephonyPrct
{
  return self->_hasUnsignedPredVolTelephonyPrct;
}

- (void)setHasUnsignedPredVolTelephonyPrct:(BOOL)a3
{
  self->_hasUnsignedPredVolTelephonyPrct = a3;
}

- (unsigned)unsignedPredVolSiriPrct
{
  return self->_unsignedPredVolSiriPrct;
}

- (BOOL)hasUnsignedPredVolSiriPrct
{
  return self->_hasUnsignedPredVolSiriPrct;
}

- (void)setHasUnsignedPredVolSiriPrct:(BOOL)a3
{
  self->_hasUnsignedPredVolSiriPrct = a3;
}

- (unsigned)singleBudFlag
{
  return self->_singleBudFlag;
}

- (BOOL)hasSingleBudFlag
{
  return self->_hasSingleBudFlag;
}

- (void)setHasSingleBudFlag:(BOOL)a3
{
  self->_hasSingleBudFlag = a3;
}

- (unsigned)cdEngagementFlag
{
  return self->_cdEngagementFlag;
}

- (BOOL)hasCdEngagementFlag
{
  return self->_hasCdEngagementFlag;
}

- (void)setHasCdEngagementFlag:(BOOL)a3
{
  self->_hasCdEngagementFlag = a3;
}

- (unsigned)activeStreamFlag
{
  return self->_activeStreamFlag;
}

- (BOOL)hasActiveStreamFlag
{
  return self->_hasActiveStreamFlag;
}

- (void)setHasActiveStreamFlag:(BOOL)a3
{
  self->_hasActiveStreamFlag = a3;
}

- (unsigned)pvFeatureEnableFlag
{
  return self->_pvFeatureEnableFlag;
}

- (BOOL)hasPvFeatureEnableFlag
{
  return self->_hasPvFeatureEnableFlag;
}

- (void)setHasPvFeatureEnableFlag:(BOOL)a3
{
  self->_hasPvFeatureEnableFlag = a3;
}

- (NSArray)envSpectralData32B
{
  return self->_envSpectralData32B;
}

- (unsigned)windStrength
{
  return self->_windStrength;
}

- (BOOL)hasWindStrength
{
  return self->_hasWindStrength;
}

- (void)setHasWindStrength:(BOOL)a3
{
  self->_hasWindStrength = a3;
}

- (unsigned)windProb
{
  return self->_windProb;
}

- (BOOL)hasWindProb
{
  return self->_hasWindProb;
}

- (void)setHasWindProb:(BOOL)a3
{
  self->_hasWindProb = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (BOOL)hasMediaType
{
  return self->_hasMediaType;
}

- (void)setHasMediaType:(BOOL)a3
{
  self->_hasMediaType = a3;
}

- (unsigned)sourceActivity
{
  return self->_sourceActivity;
}

- (BOOL)hasSourceActivity
{
  return self->_hasSourceActivity;
}

- (void)setHasSourceActivity:(BOOL)a3
{
  self->_hasSourceActivity = a3;
}

- (unsigned)budActivity
{
  return self->_budActivity;
}

- (BOOL)hasBudActivity
{
  return self->_hasBudActivity;
}

- (void)setHasBudActivity:(BOOL)a3
{
  self->_hasBudActivity = a3;
}

- (unsigned)location
{
  return self->_location;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (BOOL)hasLocationType
{
  return self->_hasLocationType;
}

- (void)setHasLocationType:(BOOL)a3
{
  self->_hasLocationType = a3;
}

- (unsigned)focusMode
{
  return self->_focusMode;
}

- (BOOL)hasFocusMode
{
  return self->_hasFocusMode;
}

- (void)setHasFocusMode:(BOOL)a3
{
  self->_hasFocusMode = a3;
}

- (unsigned)streamingAppBundleId
{
  return self->_streamingAppBundleId;
}

- (BOOL)hasStreamingAppBundleId
{
  return self->_hasStreamingAppBundleId;
}

- (void)setHasStreamingAppBundleId:(BOOL)a3
{
  self->_hasStreamingAppBundleId = a3;
}

- (NSArray)noiseType4B
{
  return self->_noiseType4B;
}

- (unsigned)instdBA
{
  return self->_instdBA;
}

- (BOOL)hasInstdBA
{
  return self->_hasInstdBA;
}

- (void)setHasInstdBA:(BOOL)a3
{
  self->_hasInstdBA = a3;
}

- (unsigned)instdBC
{
  return self->_instdBC;
}

- (BOOL)hasInstdBC
{
  return self->_hasInstdBC;
}

- (void)setHasInstdBC:(BOOL)a3
{
  self->_hasInstdBC = a3;
}

- (unsigned)nonCAListeningMode
{
  return self->_nonCAListeningMode;
}

- (BOOL)hasNonCAListeningMode
{
  return self->_hasNonCAListeningMode;
}

- (void)setHasNonCAListeningMode:(BOOL)a3
{
  self->_hasNonCAListeningMode = a3;
}

- (unsigned)fit
{
  return self->_fit;
}

- (BOOL)hasFit
{
  return self->_hasFit;
}

- (void)setHasFit:(BOOL)a3
{
  self->_hasFit = a3;
}

- (unsigned)fixedAutoAncGain
{
  return self->_fixedAutoAncGain;
}

- (BOOL)hasFixedAutoAncGain
{
  return self->_hasFixedAutoAncGain;
}

- (void)setHasFixedAutoAncGain:(BOOL)a3
{
  self->_hasFixedAutoAncGain = a3;
}

- (unsigned)adjustedAutoAncGain
{
  return self->_adjustedAutoAncGain;
}

- (BOOL)hasAdjustedAutoAncGain
{
  return self->_hasAdjustedAutoAncGain;
}

- (void)setHasAdjustedAutoAncGain:(BOOL)a3
{
  self->_hasAdjustedAutoAncGain = a3;
}

- (unsigned)timestamp
{
  return self->_timestamp;
}

- (BOOL)hasTimestamp
{
  return self->_hasTimestamp;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_hasTimestamp = a3;
}

- (unsigned)DRCenablementBit
{
  return self->_DRCenablementBit;
}

- (BOOL)hasDRCenablementBit
{
  return self->_hasDRCenablementBit;
}

- (void)setHasDRCenablementBit:(BOOL)a3
{
  self->_hasDRCenablementBit = a3;
}

- (unsigned)DRCwindFlag
{
  return self->_DRCwindFlag;
}

- (BOOL)hasDRCwindFlag
{
  return self->_hasDRCwindFlag;
}

- (void)setHasDRCwindFlag:(BOOL)a3
{
  self->_hasDRCwindFlag = a3;
}

- (unsigned)DRCappSelfVoiceFlag
{
  return self->_DRCappSelfVoiceFlag;
}

- (BOOL)hasDRCappSelfVoiceFlag
{
  return self->_hasDRCappSelfVoiceFlag;
}

- (void)setHasDRCappSelfVoiceFlag:(BOOL)a3
{
  self->_hasDRCappSelfVoiceFlag = a3;
}

- (unsigned)drumDRC
{
  return self->_drumDRC;
}

- (BOOL)hasDrumDRC
{
  return self->_hasDrumDRC;
}

- (void)setHasDrumDRC:(BOOL)a3
{
  self->_hasDrumDRC = a3;
}

- (unsigned)routedDRCGain
{
  return self->_routedDRCGain;
}

- (BOOL)hasRoutedDRCGain
{
  return self->_hasRoutedDRCGain;
}

- (void)setHasRoutedDRCGain:(BOOL)a3
{
  self->_hasRoutedDRCGain = a3;
}

- (void)setHasWind_strength:(BOOL)a3
{
  self->_hasWind_strength = a3;
}

- (void)setHasWind_prob:(BOOL)a3
{
  self->_hasWind_prob = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseType4B, 0);
  objc_storeStrong((id *)&self->_envSpectralData32B, 0);
  objc_storeStrong((id *)&self->_activeAirpodsSerialNumber, 0);
  objc_storeStrong((id *)&self->_activeAppName, 0);
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

    v4 = -[BMDeviceAdaptiveVolume initByReadFrom:]([BMDeviceAdaptiveVolume alloc], "initByReadFrom:", v7);
    v4[21] = 0;

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
  id v11;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  void *v58;
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
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[74];

  v76[72] = *MEMORY[0x1E0C80C00];
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("controllerVersion"), 0, 0, 1, 4, 0);
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("refMicdBA"), 0, 0, 2, 4, 0);
  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("refMicdBC"), 0, 0, 3, 4, 0);
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("drumdBA"), 0, 0, 4, 4, 0);
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("drumdBK"), 0, 0, 5, 4, 0);
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("drumdBAPredicted"), 0, 0, 6, 4, 0);
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("downlinkdBA"), 0, 0, 7, 4, 0);
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("currentVolumePrct"), 0, 0, 8, 4, 0);
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastUserVolChangeType"), 0, 0, 9, 4, 0);
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("headphoneMode"), 0, 0, 10, 4, 0);
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("streamType"), 0, 0, 11, 4, 0);
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("windSpeechAggressorFlag"), 0, 0, 12, 4, 0);
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("volumeChangeFlag"), 0, 0, 13, 4, 0);
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("speechPresenceProbability"), 0, 0, 14, 4, 0);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personalizationParamSnr"), 0, 0, 15, 2, 0);
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personalizationParamMistakes"), 0, 0, 16, 2, 0);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastEMediadBA"), 0, 0, 17, 4, 0);
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastVolMediaPrct"), 0, 0, 18, 4, 0);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastETelephonydBA"), 0, 0, 19, 4, 0);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastVolTelephonyPrct"), 0, 0, 20, 4, 0);
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastESiridBA"), 0, 0, 21, 4, 0);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lastVolSiriPrct"), 0, 0, 22, 4, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("smoothEae"), 0, 0, 23, 4, 0);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("desiredDeltaE"), 0, 0, 24, 2, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predVolMediaPrct"), 0, 0, 25, 2, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predVolTelephonyPrct"), 0, 0, 26, 2, 0);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predVolSiriPrct"), 0, 0, 27, 2, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("onStartPredictionFlag"), 0, 0, 28, 4, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("guardrailsAvoidFlag"), 0, 0, 29, 4, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("minMaxCutFlag"), 0, 0, 30, 4, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("manualVolumeChangeFlag"), 0, 0, 31, 4, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bigWindowSize"), 0, 0, 32, 4, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("smallWindowSize"), 0, 0, 33, 4, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activeAppName"), 2, 0, 34, 13, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activeAirpodsSerialNumber"), 2, 0, 35, 13, 0);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("anchorVol"), 0, 0, 36, 4, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("anchorEnv"), 0, 0, 37, 4, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personalizationCoeff"), 0, 0, 38, 4, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("unsignedPredVolMediaPrct"), 0, 0, 39, 4, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("unsignedPredVolTelephonyPrct"), 0, 0, 40, 4, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("unsignedPredVolSiriPrct"), 0, 0, 41, 4, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("singleBudFlag"), 0, 0, 42, 4, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cdEngagementFlag"), 0, 0, 43, 4, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activeStreamFlag"), 0, 0, 44, 4, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pvFeatureEnableFlag"), 0, 0, 45, 4, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("envSpectralData32B_json"), 5, 1, &__block_literal_global_4888);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("envSpectralData_32B_json"), 5, 1, &__block_literal_global_171);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("windStrength"), 0, 0, 47, 4, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wind_strength"), 0, 0, 47, 4, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("windProb"), 0, 0, 48, 4, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wind_prob"), 0, 0, 48, 4, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaType"), 0, 0, 49, 4, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceActivity"), 0, 0, 50, 4, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("budActivity"), 0, 0, 51, 4, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("location"), 0, 0, 52, 4, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locationType"), 0, 0, 53, 4, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("focusMode"), 0, 0, 54, 4, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("streamingAppBundleId"), 0, 0, 55, 4, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("noiseType4B_json"), 5, 1, &__block_literal_global_172);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("noiseType_4B_json"), 5, 1, &__block_literal_global_175);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("instdBA"), 0, 0, 57, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("instdBC"), 0, 0, 58, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nonCAListeningMode"), 0, 0, 59, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fit"), 0, 0, 60, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fixedAutoAncGain"), 0, 0, 61, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("adjustedAutoAncGain"), 0, 0, 62, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 0, 0, 63, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("DRCenablementBit"), 0, 0, 64, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("DRCwindFlag"), 0, 0, 65, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("DRCappSelfVoiceFlag"), 0, 0, 66, 4, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("drumDRC"), 0, 0, 67, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("routedDRCGain"), 0, 0, 68, 4, 0);
  v76[0] = v75;
  v76[1] = v74;
  v76[2] = v73;
  v76[3] = v72;
  v76[4] = v71;
  v76[5] = v70;
  v76[6] = v69;
  v76[7] = v68;
  v76[8] = v67;
  v76[9] = v66;
  v76[10] = v65;
  v76[11] = v64;
  v76[12] = v63;
  v76[13] = v62;
  v76[14] = v61;
  v76[15] = v60;
  v76[16] = v58;
  v76[17] = v59;
  v76[18] = v56;
  v76[19] = v57;
  v76[20] = v55;
  v76[21] = v54;
  v76[22] = v53;
  v76[23] = v52;
  v76[24] = v51;
  v76[25] = v50;
  v76[26] = v49;
  v76[27] = v48;
  v76[28] = v47;
  v76[29] = v46;
  v76[30] = v45;
  v76[31] = v44;
  v76[32] = v43;
  v76[33] = v42;
  v76[34] = v41;
  v76[35] = v40;
  v76[36] = v39;
  v76[37] = v38;
  v76[38] = v37;
  v76[39] = v36;
  v76[40] = v35;
  v76[41] = v34;
  v76[42] = v33;
  v76[43] = v32;
  v76[44] = v31;
  v76[45] = v30;
  v76[46] = v29;
  v76[47] = v28;
  v76[48] = v27;
  v76[49] = v26;
  v76[50] = v25;
  v76[51] = v24;
  v76[52] = v23;
  v76[53] = v22;
  v76[54] = v21;
  v76[55] = v20;
  v76[56] = v19;
  v76[57] = v18;
  v76[58] = v17;
  v76[59] = v16;
  v76[60] = v15;
  v76[61] = v14;
  v76[62] = v2;
  v76[63] = v3;
  v76[64] = v4;
  v76[65] = v13;
  v76[66] = v5;
  v76[67] = v6;
  v76[68] = v7;
  v76[69] = v8;
  v76[70] = v12;
  v76[71] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 72);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AB00;
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
  id v13;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  void *v58;
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
  void *v70;
  void *v71;
  _QWORD v72[70];

  v72[68] = *MEMORY[0x1E0C80C00];
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("controllerVersion"), 1, 4, 0);
  v72[0] = v71;
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("refMicdBA"), 2, 4, 0);
  v72[1] = v70;
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("refMicdBC"), 3, 4, 0);
  v72[2] = v69;
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("drumdBA"), 4, 4, 0);
  v72[3] = v68;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("drumdBK"), 5, 4, 0);
  v72[4] = v67;
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("drumdBAPredicted"), 6, 4, 0);
  v72[5] = v66;
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("downlinkdBA"), 7, 4, 0);
  v72[6] = v65;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("currentVolumePrct"), 8, 4, 0);
  v72[7] = v64;
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastUserVolChangeType"), 9, 4, 0);
  v72[8] = v63;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("headphoneMode"), 10, 4, 0);
  v72[9] = v62;
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("streamType"), 11, 4, 0);
  v72[10] = v61;
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("windSpeechAggressorFlag"), 12, 4, 0);
  v72[11] = v60;
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("volumeChangeFlag"), 13, 4, 0);
  v72[12] = v59;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("speechPresenceProbability"), 14, 4, 0);
  v72[13] = v58;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personalizationParamSnr"), 15, 2, 0);
  v72[14] = v57;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personalizationParamMistakes"), 16, 2, 0);
  v72[15] = v56;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastEMediadBA"), 17, 4, 0);
  v72[16] = v55;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastVolMediaPrct"), 18, 4, 0);
  v72[17] = v54;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastETelephonydBA"), 19, 4, 0);
  v72[18] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastVolTelephonyPrct"), 20, 4, 0);
  v72[19] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastESiridBA"), 21, 4, 0);
  v72[20] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lastVolSiriPrct"), 22, 4, 0);
  v72[21] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("smoothEae"), 23, 4, 0);
  v72[22] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("desiredDeltaE"), 24, 2, 0);
  v72[23] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predVolMediaPrct"), 25, 2, 0);
  v72[24] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predVolTelephonyPrct"), 26, 2, 0);
  v72[25] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predVolSiriPrct"), 27, 2, 0);
  v72[26] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("onStartPredictionFlag"), 28, 4, 0);
  v72[27] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("guardrailsAvoidFlag"), 29, 4, 0);
  v72[28] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("minMaxCutFlag"), 30, 4, 0);
  v72[29] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("manualVolumeChangeFlag"), 31, 4, 0);
  v72[30] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bigWindowSize"), 32, 4, 0);
  v72[31] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("smallWindowSize"), 33, 4, 0);
  v72[32] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activeAppName"), 34, 13, 0);
  v72[33] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activeAirpodsSerialNumber"), 35, 13, 0);
  v72[34] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("anchorVol"), 36, 4, 0);
  v72[35] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("anchorEnv"), 37, 4, 0);
  v72[36] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personalizationCoeff"), 38, 4, 0);
  v72[37] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("unsignedPredVolMediaPrct"), 39, 4, 0);
  v72[38] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("unsignedPredVolTelephonyPrct"), 40, 4, 0);
  v72[39] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("unsignedPredVolSiriPrct"), 41, 4, 0);
  v72[40] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("singleBudFlag"), 42, 4, 0);
  v72[41] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cdEngagementFlag"), 43, 4, 0);
  v72[42] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activeStreamFlag"), 44, 4, 0);
  v72[43] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pvFeatureEnableFlag"), 45, 4, 0);
  v72[44] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("envSpectralData32B"), 46, 4, 0);
  v72[45] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("windStrength"), 47, 4, 0);
  v72[46] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("windProb"), 48, 4, 0);
  v72[47] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaType"), 49, 4, 0);
  v72[48] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceActivity"), 50, 4, 0);
  v72[49] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("budActivity"), 51, 4, 0);
  v72[50] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("location"), 52, 4, 0);
  v72[51] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationType"), 53, 4, 0);
  v72[52] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("focusMode"), 54, 4, 0);
  v72[53] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("streamingAppBundleId"), 55, 4, 0);
  v72[54] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("noiseType4B"), 56, 4, 0);
  v72[55] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("instdBA"), 57, 4, 0);
  v72[56] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("instdBC"), 58, 4, 0);
  v72[57] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nonCAListeningMode"), 59, 4, 0);
  v72[58] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fit"), 60, 4, 0);
  v72[59] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fixedAutoAncGain"), 61, 4, 0);
  v72[60] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("adjustedAutoAncGain"), 62, 4, 0);
  v72[61] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 63, 4, 0);
  v72[62] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("DRCenablementBit"), 64, 4, 0);
  v72[63] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("DRCwindFlag"), 65, 4, 0);
  v72[64] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("DRCappSelfVoiceFlag"), 66, 4, 0);
  v72[65] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("drumDRC"), 67, 4, 0);
  v72[66] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("routedDRCGain"), 68, 4, 0);
  v72[67] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 68);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_noiseType_4BJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_noiseType4BJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_envSpectralData_32BJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_envSpectralData32BJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceAdaptiveVolume)initWithControllerVersion:(id)a3 refMicdBA:(id)a4 refMicdBC:(id)a5 drumdBA:(id)a6 drumdBK:(id)a7 drumdBAPredicted:(id)a8 downlinkdBA:(id)a9 currentVolumePrct:(id)a10 lastUserVolChangeType:(id)a11 headphoneMode:(id)a12 streamType:(id)a13 windSpeechAggressorFlag:(id)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(id)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(id)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(id)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(id)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(id)a24 smoothEae:(id)a25 desiredDeltaE:(id)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(id)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(id)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(id)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(id)a34 smallWindowSize:(id)a35 activeAppName:(id)a36 activeAirpodsSerialNumber:(id)a37
{
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  return -[BMDeviceAdaptiveVolume initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:](self, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:", a3, a4, a5, a6, a7, a8, a9, a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E0C9AA60],
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E0C9AA60],
           0,
           0,
           0,
           0,
           0);
}

- (uint64_t)initWithControllerVersion:(uint64_t)a3 refMicdBA:(uint64_t)a4 refMicdBC:(uint64_t)a5 drumdBA:(uint64_t)a6 drumdBK:(uint64_t)a7 drumdBAPredicted:(uint64_t)a8 downlinkdBA:(id)a9 currentVolumePrct:(uint64_t)a10 lastUserVolChangeType:(id)a11 headphoneMode:(uint64_t)a12 streamType:(id)a13 windSpeechAggressorFlag:(uint64_t)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(uint64_t)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(uint64_t)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(uint64_t)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(uint64_t)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(uint64_t)a24 smoothEae:(id)a25 desiredDeltaE:(uint64_t)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(uint64_t)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(uint64_t)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(uint64_t)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(uint64_t)a34 smallWindowSize:(id)a35 activeAppName:(uint64_t)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(uint64_t)a38 anchorEnv:(id)a39 personalizationCoeff:(uint64_t)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(uint64_t)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(uint64_t)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(uint64_t)a46 pvFeatureEnableFlag:(id)a47 envSpectralData_32B:(uint64_t)a48 wind_strength:(id)a49 wind_prob:(uint64_t)a50 mediaType:(id)a51 sourceActivity:(uint64_t)a52 budActivity:(id)a53 location:(uint64_t)a54 locationType:(id)a55 focusMode:(uint64_t)a56 streamingAppBundleId:(id)a57 noiseType_4B:(uint64_t)a58 instdBA:(id)a59 instdBC:(uint64_t)a60 nonCAListeningMode:(id)a61 fit:(uint64_t)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:
{
  uint64_t a64;
  id a65;
  uint64_t a66;
  id a67;
  id a68;

  return objc_msgSend(a1, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:", a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64,
           a65,
           a66,
           a67,
           a68,
           0);
}

- (uint64_t)initWithControllerVersion:(uint64_t)a3 refMicdBA:(uint64_t)a4 refMicdBC:(uint64_t)a5 drumdBA:(uint64_t)a6 drumdBK:(uint64_t)a7 drumdBAPredicted:(uint64_t)a8 downlinkdBA:(id)a9 currentVolumePrct:(uint64_t)a10 lastUserVolChangeType:(id)a11 headphoneMode:(uint64_t)a12 streamType:(id)a13 windSpeechAggressorFlag:(uint64_t)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(uint64_t)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(uint64_t)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(uint64_t)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(uint64_t)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(uint64_t)a24 smoothEae:(id)a25 desiredDeltaE:(uint64_t)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(uint64_t)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(uint64_t)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(uint64_t)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(uint64_t)a34 smallWindowSize:(id)a35 activeAppName:(uint64_t)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(uint64_t)a38 anchorEnv:(id)a39 personalizationCoeff:(uint64_t)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(uint64_t)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(uint64_t)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(uint64_t)a46 pvFeatureEnableFlag:(id)a47 envSpectralData_32B:(uint64_t)a48 wind_strength:(id)a49 wind_prob:(uint64_t)a50 mediaType:(id)a51 sourceActivity:(uint64_t)a52 budActivity:(id)a53 location:(uint64_t)a54 locationType:(id)a55 focusMode:(uint64_t)a56 streamingAppBundleId:(id)a57 noiseType_4B:(uint64_t)a58 instdBA:(id)a59 instdBC:(uint64_t)a60 nonCAListeningMode:(id)a61 fit:(uint64_t)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:
{
  uint64_t a64;
  id a65;
  uint64_t a66;
  id a67;
  uint64_t a68;
  id a69;

  return objc_msgSend(a1, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:", a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64,
           a65,
           a66,
           a67,
           a68,
           a69);
}

- (uint64_t)initWithControllerVersion:(uint64_t)a3 refMicdBA:(uint64_t)a4 refMicdBC:(uint64_t)a5 drumdBA:(uint64_t)a6 drumdBK:(uint64_t)a7 drumdBAPredicted:(uint64_t)a8 downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:
{
  return objc_msgSend(a1, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData32B:windStrength:windProb:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:", a3, a4, a5, a6, a7, a8);
}

@end
