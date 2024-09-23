@implementation HMDAggregationAnalysisLogEvent

- (void)setCloudSyncPushCount:(unint64_t)a3
{
  self->_cloudSyncPushCount = a3;
}

- (void)setCloudSyncFetchCount:(unint64_t)a3
{
  self->_cloudSyncFetchCount = a3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.eventAggregation.processOverview");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
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
  id v30;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
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
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  _QWORD v219[103];
  _QWORD v220[105];

  v220[103] = *MEMORY[0x24BDAC8D0];
  v219[0] = CFSTR("processLaunchCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processLaunchCount](self, "processLaunchCount"));
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = v217;
  v219[1] = CFSTR("processJetsamCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processJetsamCount](self, "processJetsamCount"));
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v220[1] = v215;
  v219[2] = CFSTR("processCrashCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processCrashCount](self, "processCrashCount"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v220[2] = v213;
  v219[3] = CFSTR("jetsamReasonHighwaterCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent jetsamReasonHighwaterCount](self, "jetsamReasonHighwaterCount"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v220[3] = v211;
  v219[4] = CFSTR("jetsamReasonProcessLimitCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent jetsamReasonProcessLimitCount](self, "jetsamReasonProcessLimitCount"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v220[4] = v209;
  v219[5] = CFSTR("jetsamReasonOtherCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent jetsamReasonOtherCount](self, "jetsamReasonOtherCount"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v220[5] = v207;
  v219[6] = CFSTR("processMemoryPressureStateWarningCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processMemoryPressureStateWarningCount](self, "processMemoryPressureStateWarningCount"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v220[6] = v205;
  v219[7] = CFSTR("processMemoryPressureStateCriticalCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent processMemoryPressureStateCriticalCount](self, "processMemoryPressureStateCriticalCount"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v220[7] = v203;
  v219[8] = CFSTR("averageSampledProcessMemoryUsage");
  +[HMDLogEventHistograms memoryHistogram](HMDLogEventHistograms, "memoryHistogram");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent sampledAverageProcessMemoryUsageMB](self, "sampledAverageProcessMemoryUsageMB"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v220[8] = v201;
  v219[9] = CFSTR("peakSampledProcessMemoryUsage");
  +[HMDLogEventHistograms memoryHistogram](HMDLogEventHistograms, "memoryHistogram");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent sampledPeakProcessMemoryUsageMB](self, "sampledPeakProcessMemoryUsageMB"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v220[9] = v199;
  v219[10] = CFSTR("remoteMessagesSentCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent remoteMessagesSentCount](self, "remoteMessagesSentCount"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v220[10] = v197;
  v219[11] = CFSTR("remoteMessagesReceivedCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent remoteMessagesReceivedCount](self, "remoteMessagesReceivedCount"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v220[11] = v195;
  v219[12] = CFSTR("txIDSMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txIDSMessagesCount](self, "txIDSMessagesCount"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v220[12] = v193;
  v219[13] = CFSTR("rxIDSMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxIDSMessagesCount](self, "rxIDSMessagesCount"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v220[13] = v191;
  v219[14] = CFSTR("txIDSProxyMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txIDSProxyMessagesCount](self, "txIDSProxyMessagesCount"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v220[14] = v189;
  v219[15] = CFSTR("rxIDSProxyMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxIDSProxyMessagesCount](self, "rxIDSProxyMessagesCount"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v220[15] = v187;
  v219[16] = CFSTR("txLoxyMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txLoxyMessagesCount](self, "txLoxyMessagesCount"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v220[16] = v185;
  v219[17] = CFSTR("rxLoxyMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxLoxyMessagesCount](self, "rxLoxyMessagesCount"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v220[17] = v183;
  v219[18] = CFSTR("txRapportMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txRapportMessagesCount](self, "txRapportMessagesCount"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v220[18] = v181;
  v219[19] = CFSTR("rxRapportMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxRapportMessagesCount](self, "rxRapportMessagesCount"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v220[19] = v179;
  v219[20] = CFSTR("txSecureMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent txSecureMessagesCount](self, "txSecureMessagesCount"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v220[20] = v177;
  v219[21] = CFSTR("rxSecureMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent rxSecureMessagesCount](self, "rxSecureMessagesCount"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v220[21] = v175;
  v219[22] = CFSTR("siriReadCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadSiri](self, "numReadSiri"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v220[22] = v173;
  v219[23] = CFSTR("siriWriteCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteSiri](self, "numWriteSiri"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v220[23] = v171;
  v219[24] = CFSTR("firstPartyReadCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadFirstPartyApp](self, "numReadFirstPartyApp"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v220[24] = v169;
  v219[25] = CFSTR("firstPartyWriteCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteFirstPartyApp](self, "numWriteFirstPartyApp"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v220[25] = v167;
  v219[26] = CFSTR("thirdPartyReadCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadThirdPartyApp](self, "numReadThirdPartyApp"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v220[26] = v165;
  v219[27] = CFSTR("thirdPartyWriteCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteThirdPartyApp](self, "numWriteThirdPartyApp"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v220[27] = v163;
  v219[28] = CFSTR("internalRequestedReadCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadInternalRequested](self, "numReadInternalRequested"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v220[28] = v161;
  v219[29] = CFSTR("internalRequestedWriteCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteInternalRequested](self, "numWriteInternalRequested"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v220[29] = v159;
  v219[30] = CFSTR("unknownSourceReadCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadUnknownSource](self, "numReadUnknownSource"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v220[30] = v157;
  v219[31] = CFSTR("unknownSourceWriteCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numWriteUnknownSource](self, "numWriteUnknownSource"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v220[31] = v155;
  v219[32] = CFSTR("accessoryReadWriteIPSuccessCount");
  +[HMDLogEventHistograms successRateHistogram](HMDLogEventHistograms, "successRateHistogram");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteSuccessIP](self, "numReadWriteSuccessIP"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v220[32] = v153;
  v219[33] = CFSTR("accessoryReadWriteIPFailureCount");
  +[HMDLogEventHistograms successRateHistogram](HMDLogEventHistograms, "successRateHistogram");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteFailureIP](self, "numReadWriteFailureIP"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v220[33] = v151;
  v219[34] = CFSTR("accessoryReadWriteBTSuccessCount");
  +[HMDLogEventHistograms successRateHistogram](HMDLogEventHistograms, "successRateHistogram");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteSuccessBT](self, "numReadWriteSuccessBT"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v220[34] = v149;
  v219[35] = CFSTR("accessoryReadWriteBTFailureCount");
  +[HMDLogEventHistograms successRateHistogram](HMDLogEventHistograms, "successRateHistogram");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteFailureBT](self, "numReadWriteFailureBT"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v220[35] = v147;
  v219[36] = CFSTR("accessoryReadWriteIDSSuccessCount");
  +[HMDLogEventHistograms successRateHistogram](HMDLogEventHistograms, "successRateHistogram");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteSuccessIDS](self, "numReadWriteSuccessIDS"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v220[36] = v145;
  v219[37] = CFSTR("accessoryReadWriteIDSFailureCount");
  +[HMDLogEventHistograms successRateHistogram](HMDLogEventHistograms, "successRateHistogram");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numReadWriteFailureIDS](self, "numReadWriteFailureIDS"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v220[37] = v143;
  v219[38] = CFSTR("accessoryReadWriteAverageIPLatency");
  +[HMDLogEventHistograms latencyHistogram](HMDLogEventHistograms, "latencyHistogram");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent averageLatencyIP](self, "averageLatencyIP"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v220[38] = v141;
  v219[39] = CFSTR("accessoryReadWriteAverageBTLatency");
  +[HMDLogEventHistograms latencyHistogram](HMDLogEventHistograms, "latencyHistogram");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent averageLatencyBT](self, "averageLatencyBT"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v220[39] = v139;
  v219[40] = CFSTR("accessoryReadWriteAverageIDSLatency");
  +[HMDLogEventHistograms latencyHistogram](HMDLogEventHistograms, "latencyHistogram");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent averageLatencyIDS](self, "averageLatencyIDS"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v220[40] = v137;
  v219[41] = CFSTR("accessoriesAddedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numAccessoriesAdded](self, "numAccessoriesAdded"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v220[41] = v135;
  v219[42] = CFSTR("scenesAddedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numScenesAdded](self, "numScenesAdded"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v220[42] = v133;
  v219[43] = CFSTR("triggersAddedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numTriggersAdded](self, "numTriggersAdded"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v220[43] = v131;
  v219[44] = CFSTR("shortcutsAddedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numShortcutsAdded](self, "numShortcutsAdded"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v220[44] = v129;
  v219[45] = CFSTR("scenesRunCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numScenesUserRun](self, "numScenesUserRun"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v220[45] = v127;
  v219[46] = CFSTR("triggersRunCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numTriggersFired](self, "numTriggersFired"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v220[46] = v125;
  v219[47] = CFSTR("shortcutsRunCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent numShortcutsRun](self, "numShortcutsRun"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v220[47] = v123;
  v219[48] = CFSTR("hapIPInvalidationCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPInvalidationCount](self, "hapIPInvalidationCount"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v220[48] = v121;
  v219[49] = CFSTR("sentHTTPMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPSentHTTPRequestsCount](self, "hapIPSentHTTPRequestsCount"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v220[49] = v119;
  v219[50] = CFSTR("receivedHTTPMessagesCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPReceivedHTTPResponsesCount](self, "hapIPReceivedHTTPResponsesCount"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v220[50] = v117;
  v219[51] = CFSTR("receivedHTTPEventCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapIPReceivedHTTPEventCount](self, "hapIPReceivedHTTPEventCount"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v220[51] = v115;
  v219[52] = CFSTR("hapBTLEConnectionsCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapBTLEConnectionsCount](self, "hapBTLEConnectionsCount"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v220[52] = v113;
  v219[53] = CFSTR("hapBTLEDiscoveryCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapBTLEDiscoveriesCount](self, "hapBTLEDiscoveriesCount"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v220[53] = v111;
  v219[54] = CFSTR("hapBTLEConnectionPerReasonCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent hapBTLEConnectionPerReasonsCount](self, "hapBTLEConnectionPerReasonsCount"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v220[54] = v109;
  v219[55] = CFSTR("cameraStreamStartSuccessCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraStreamStartSuccessCount](self, "cameraStreamStartSuccessCount"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v220[55] = v107;
  v219[56] = CFSTR("cameraStreamStartFailureCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraStreamStartFailureCount](self, "cameraStreamStartFailureCount"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v220[56] = v105;
  v219[57] = CFSTR("fetchVideoSegmentsAssetCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent fetchCameraClipVideoSegmentAssetCount](self, "fetchCameraClipVideoSegmentAssetCount"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v220[57] = v103;
  v219[58] = CFSTR("acceptedXPCRequestsCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent acceptedXPCRequestsCount](self, "acceptedXPCRequestsCount"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v220[58] = v101;
  v219[59] = CFSTR("erroredXPCRequestsCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent erroredXPCRequestsCount](self, "erroredXPCRequestsCount"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v220[59] = v99;
  v219[60] = CFSTR("sentXPCNotificationsCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent sentXPCNotificationsCount](self, "sentXPCNotificationsCount"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v220[60] = v97;
  v219[61] = CFSTR("filteredXPCNotificationsCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent filteredXPCNotificationsCount](self, "filteredXPCNotificationsCount"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v220[61] = v95;
  v219[62] = CFSTR("cameraRecordingReachabilityChangedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraRecordingReachabilityChangedCount](self, "cameraRecordingReachabilityChangedCount"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v220[62] = v93;
  v219[63] = CFSTR("cameraRecordingOfflineDuration");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cameraRecordingReachabilityOfflineDuration](self, "cameraRecordingReachabilityOfflineDuration"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v220[63] = v91;
  v219[64] = CFSTR("homeHubReachabilityChangedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent homeHubReachabilityChangedCount](self, "homeHubReachabilityChangedCount"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v220[64] = v89;
  v219[65] = CFSTR("ipReachabilityCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent ipAccessoryReachabilityChangedCount](self, "ipAccessoryReachabilityChangedCount"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v220[65] = v87;
  v219[66] = CFSTR("currentDeviceStartedElectionCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent currentDeviceStartedLegacyElectionCount](self, "currentDeviceStartedLegacyElectionCount"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v220[66] = v85;
  v219[67] = CFSTR("v2ElectionCoordinationCurrentDeviceInSecondaryMesh");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAggregationAnalysisLogEvent v2ElectionCurrentDeviceInSecondaryCoordinationMesh](self, "v2ElectionCurrentDeviceInSecondaryCoordinationMesh"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v220[67] = v84;
  v219[68] = CFSTR("v2ElectionCoordinationCurrentDeviceFlapCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationCurrentDeviceFlapCount](self, "v2ElectionCoordinationCurrentDeviceFlapCount"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v220[68] = v82;
  v219[69] = CFSTR("v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh");
  +[HMDLogEventHistograms successRateHistogram](HMDLogEventHistograms, "successRateHistogram");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh](self, "v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v220[69] = v80;
  v219[70] = CFSTR("v2ElectionCoordinationMeshUpdateCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshUpdateCount](self, "v2ElectionCoordinationMeshUpdateCount"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v220[70] = v78;
  v219[71] = CFSTR("v2ElectionCoordinationMeshLeaderElectedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshLeaderElectedCount](self, "v2ElectionCoordinationMeshLeaderElectedCount"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v220[71] = v76;
  v219[72] = CFSTR("v2ElectionCoordinationMeshLeaderChangedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshLeaderChangedCount](self, "v2ElectionCoordinationMeshLeaderChangedCount"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v220[72] = v74;
  v219[73] = CFSTR("v2ElectionPrimaryResidentElectionRunCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionPrimaryResidentElectionRunCount](self, "v2ElectionPrimaryResidentElectionRunCount"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v220[73] = v72;
  v219[74] = CFSTR("v2ElectionPrimaryResidentChangedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent v2ElectionPrimaryResidentChangedCount](self, "v2ElectionPrimaryResidentChangedCount"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v220[74] = v70;
  v219[75] = CFSTR("PrimaryResidentDurationMinutes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDAggregationAnalysisLogEvent primaryResidentDurationMinutes](self, "primaryResidentDurationMinutes"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v220[75] = v69;
  v219[76] = CFSTR("cloudSyncPushCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncPushCount](self, "cloudSyncPushCount"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v220[76] = v67;
  v219[77] = CFSTR("cloudSyncFetchCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncFetchCount](self, "cloudSyncFetchCount"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v220[77] = v65;
  v219[78] = CFSTR("cloudSyncUploadCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncUploadCount](self, "cloudSyncUploadCount"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v220[78] = v63;
  v219[79] = CFSTR("uploadErrorCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudSyncUploadErrorCount](self, "cloudSyncUploadErrorCount"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v220[79] = v61;
  v219[80] = CFSTR("cloudStoreCoreDataTransactionCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent cloudStoreCoreDataTransactionCount](self, "cloudStoreCoreDataTransactionCount"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v220[80] = v59;
  v219[81] = CFSTR("workingStoreCoreDataTransactionCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent workingStoreCoreDataTransactionCount](self, "workingStoreCoreDataTransactionCount"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v220[81] = v57;
  v219[82] = CFSTR("coreDataCloudKitImportCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent coreDataCloudKitImportCount](self, "coreDataCloudKitImportCount"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v220[82] = v55;
  v219[83] = CFSTR("coreDataCloudKitExportCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent coreDataCloudKitExportCount](self, "coreDataCloudKitExportCount"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v220[83] = v53;
  v219[84] = CFSTR("residentSyncFetchHomeDataRequestCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent residentSyncFetchHomeDataRequestCount](self, "residentSyncFetchHomeDataRequestCount"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v220[84] = v51;
  v219[85] = CFSTR("residentSyncHomeDataChangedNotificationCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent residentSyncHomeDataChangedNotificationCount](self, "residentSyncHomeDataChangedNotificationCount"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v220[85] = v49;
  v219[86] = CFSTR("homeManagerGenerationCounterIncrementCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent generationCounterIncrementCount](self, "generationCounterIncrementCount"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v220[86] = v47;
  v219[87] = CFSTR("homeManagerNotifyXPCClientsCount");
  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent notifyXPCClientsHomeDataChangedCount](self, "notifyXPCClientsHomeDataChangedCount"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v220[87] = v45;
  v219[88] = CFSTR("homeDataMBFetched");
  v3 = -[HMDAggregationAnalysisLogEvent homeDataBytesFetched](self, "homeDataBytesFetched");
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = -[HMDAggregationAnalysisLogEvent homeDataBytesFetched](self, "homeDataBytesFetched");
  if (v3 >> 21 <= 2)
    v6 = v5 >> 20;
  else
    v6 = v5 / 0x500000 + 5;
  objc_msgSend(v4, "numberWithUnsignedInteger:", v6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v220[88] = v44;
  v219[89] = CFSTR("homeDataMBPushed");
  v7 = -[HMDAggregationAnalysisLogEvent homeDataBytesPushed](self, "homeDataBytesPushed");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = -[HMDAggregationAnalysisLogEvent homeDataBytesPushed](self, "homeDataBytesPushed");
  if (v7 <= 0x5FFFFF)
    v10 = v9 >> 20;
  else
    v10 = v9 / 0x500000 + 5;
  objc_msgSend(v8, "numberWithUnsignedInteger:", v10);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v220[89] = v43;
  v219[90] = CFSTR("legacyHomeDataMBFetched");
  v11 = -[HMDAggregationAnalysisLogEvent legacyHomeDataBytesFetched](self, "legacyHomeDataBytesFetched");
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = -[HMDAggregationAnalysisLogEvent legacyHomeDataBytesFetched](self, "legacyHomeDataBytesFetched");
  if (v11 <= 0x5FFFFF)
    v14 = v13 >> 20;
  else
    v14 = v13 / 0x500000 + 5;
  objc_msgSend(v12, "numberWithUnsignedInteger:", v14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v220[90] = v42;
  v219[91] = CFSTR("legacyHomeDataMBPushed");
  v15 = -[HMDAggregationAnalysisLogEvent legacyHomeDataBytesPushed](self, "legacyHomeDataBytesPushed");
  v16 = (void *)MEMORY[0x24BDD16E0];
  v17 = -[HMDAggregationAnalysisLogEvent legacyHomeDataBytesPushed](self, "legacyHomeDataBytesPushed");
  if (v15 <= 0x5FFFFF)
    v18 = v17 >> 20;
  else
    v18 = v17 / 0x500000 + 5;
  objc_msgSend(v16, "numberWithUnsignedInteger:", v18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v220[91] = v41;
  v219[92] = CFSTR("peakConcurrentIPAccessoryUpdateStaging");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentIPAccessoryUpdateStaging](self, "peakConcurrentIPAccessoryUpdateStaging"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v220[92] = v39;
  v219[93] = CFSTR("peakConcurrentIPAccessoryUpdateApply");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentIPAccessoryUpdateApply](self, "peakConcurrentIPAccessoryUpdateApply"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v220[93] = v37;
  v219[94] = CFSTR("peakConcurrentBLEAccessoryUpdateStaging");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentBLEAccessoryUpdateStaging](self, "peakConcurrentBLEAccessoryUpdateStaging"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v220[94] = v35;
  v219[95] = CFSTR("peakConcurrentBLEAccessoryUpdateApply");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentBLEAccessoryUpdateApply](self, "peakConcurrentBLEAccessoryUpdateApply"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v220[95] = v33;
  v219[96] = CFSTR("peakConcurrentThreadAccessoryUpdateStaging");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentThreadAccessoryUpdateStaging](self, "peakConcurrentThreadAccessoryUpdateStaging"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v220[96] = v31;
  v219[97] = CFSTR("peakConcurrentThreadAccessoryUpdateApply");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent peakConcurrentThreadAccessoryUpdateApply](self, "peakConcurrentThreadAccessoryUpdateApply"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v220[97] = v20;
  v219[98] = CFSTR("bulletinNotificationsPostedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent bulletinNotificationsPostedCount](self, "bulletinNotificationsPostedCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v220[98] = v22;
  v219[99] = CFSTR("activeDay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAggregationAnalysisLogEvent isActiveDay](self, "isActiveDay"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v220[99] = v23;
  v219[100] = CFSTR("activeDaysPerMonthCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAggregationAnalysisLogEvent activeDaysPerMonthCount](self, "activeDaysPerMonthCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v220[100] = v24;
  v219[101] = CFSTR("widgetMaxRefreshCountForKind");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent widgetMaxRefreshCountForKind](self, "widgetMaxRefreshCountForKind"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v220[101] = v26;
  v219[102] = CFSTR("residentSelectionPrimaryResidentChangedCount");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "intervalIndexForValue:", -[HMDAggregationAnalysisLogEvent residentSelectionPrimaryResidentChangedCount](self, "residentSelectionPrimaryResidentChangedCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v220[102] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v220, v219, 103);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v30;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;

  v66 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAggregationAnalysisLogEvent dataSyncState](self, "dataSyncState");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[HMDAggregationAnalysisLogEvent processLaunchCount](self, "processLaunchCount");
  v62 = -[HMDAggregationAnalysisLogEvent jetsamReasonHighwaterCount](self, "jetsamReasonHighwaterCount");
  v61 = -[HMDAggregationAnalysisLogEvent jetsamReasonProcessLimitCount](self, "jetsamReasonProcessLimitCount");
  v60 = -[HMDAggregationAnalysisLogEvent jetsamReasonOtherCount](self, "jetsamReasonOtherCount");
  v59 = -[HMDAggregationAnalysisLogEvent processCrashCount](self, "processCrashCount");
  v58 = -[HMDAggregationAnalysisLogEvent processMemoryPressureStateWarningCount](self, "processMemoryPressureStateWarningCount");
  v57 = -[HMDAggregationAnalysisLogEvent processMemoryPressureStateCriticalCount](self, "processMemoryPressureStateCriticalCount");
  v56 = -[HMDAggregationAnalysisLogEvent sampledAverageProcessMemoryUsageMB](self, "sampledAverageProcessMemoryUsageMB");
  v55 = -[HMDAggregationAnalysisLogEvent sampledPeakProcessMemoryUsageMB](self, "sampledPeakProcessMemoryUsageMB");
  v54 = -[HMDAggregationAnalysisLogEvent remoteMessagesSentCount](self, "remoteMessagesSentCount");
  v53 = -[HMDAggregationAnalysisLogEvent remoteMessagesReceivedCount](self, "remoteMessagesReceivedCount");
  v52 = -[HMDAggregationAnalysisLogEvent txIDSMessagesCount](self, "txIDSMessagesCount");
  v51 = -[HMDAggregationAnalysisLogEvent rxIDSMessagesCount](self, "rxIDSMessagesCount");
  v50 = -[HMDAggregationAnalysisLogEvent txIDSProxyMessagesCount](self, "txIDSProxyMessagesCount");
  v49 = -[HMDAggregationAnalysisLogEvent rxIDSProxyMessagesCount](self, "rxIDSProxyMessagesCount");
  v48 = -[HMDAggregationAnalysisLogEvent txLoxyMessagesCount](self, "txLoxyMessagesCount");
  v47 = -[HMDAggregationAnalysisLogEvent rxLoxyMessagesCount](self, "rxLoxyMessagesCount");
  v46 = -[HMDAggregationAnalysisLogEvent txRapportMessagesCount](self, "txRapportMessagesCount");
  v45 = -[HMDAggregationAnalysisLogEvent rxRapportMessagesCount](self, "rxRapportMessagesCount");
  v44 = -[HMDAggregationAnalysisLogEvent txSecureMessagesCount](self, "txSecureMessagesCount");
  v43 = -[HMDAggregationAnalysisLogEvent rxSecureMessagesCount](self, "rxSecureMessagesCount");
  v42 = -[HMDAggregationAnalysisLogEvent cloudSyncPushCount](self, "cloudSyncPushCount");
  v41 = -[HMDAggregationAnalysisLogEvent cloudSyncFetchCount](self, "cloudSyncFetchCount");
  v40 = -[HMDAggregationAnalysisLogEvent cloudSyncUploadCount](self, "cloudSyncUploadCount");
  v39 = -[HMDAggregationAnalysisLogEvent cloudSyncUploadErrorCount](self, "cloudSyncUploadErrorCount");
  v38 = -[HMDAggregationAnalysisLogEvent homeDataBytesFetched](self, "homeDataBytesFetched");
  v37 = -[HMDAggregationAnalysisLogEvent homeDataBytesPushed](self, "homeDataBytesPushed");
  v36 = -[HMDAggregationAnalysisLogEvent legacyHomeDataBytesFetched](self, "legacyHomeDataBytesFetched");
  v35 = -[HMDAggregationAnalysisLogEvent legacyHomeDataBytesPushed](self, "legacyHomeDataBytesPushed");
  v34 = -[HMDAggregationAnalysisLogEvent numReadSiri](self, "numReadSiri");
  v33 = -[HMDAggregationAnalysisLogEvent numWriteSiri](self, "numWriteSiri");
  v32 = -[HMDAggregationAnalysisLogEvent numReadFirstPartyApp](self, "numReadFirstPartyApp");
  v31 = -[HMDAggregationAnalysisLogEvent numWriteFirstPartyApp](self, "numWriteFirstPartyApp");
  v30 = -[HMDAggregationAnalysisLogEvent numReadThirdPartyApp](self, "numReadThirdPartyApp");
  v29 = -[HMDAggregationAnalysisLogEvent numWriteThirdPartyApp](self, "numWriteThirdPartyApp");
  v28 = -[HMDAggregationAnalysisLogEvent averageLatencyIP](self, "averageLatencyIP");
  v27 = -[HMDAggregationAnalysisLogEvent averageLatencyBT](self, "averageLatencyBT");
  v26 = -[HMDAggregationAnalysisLogEvent averageLatencyIDS](self, "averageLatencyIDS");
  v25 = -[HMDAggregationAnalysisLogEvent numAccessoriesAdded](self, "numAccessoriesAdded");
  v24 = -[HMDAggregationAnalysisLogEvent numScenesAdded](self, "numScenesAdded");
  v23 = -[HMDAggregationAnalysisLogEvent numTriggersAdded](self, "numTriggersAdded");
  v22 = -[HMDAggregationAnalysisLogEvent numShortcutsAdded](self, "numShortcutsAdded");
  v21 = -[HMDAggregationAnalysisLogEvent numScenesUserRun](self, "numScenesUserRun");
  v20 = -[HMDAggregationAnalysisLogEvent numShortcutsRun](self, "numShortcutsRun");
  v19 = -[HMDAggregationAnalysisLogEvent numTriggersFired](self, "numTriggersFired");
  v18 = -[HMDAggregationAnalysisLogEvent hapIPInvalidationCount](self, "hapIPInvalidationCount");
  v17 = -[HMDAggregationAnalysisLogEvent hapIPSentHTTPRequestsCount](self, "hapIPSentHTTPRequestsCount");
  v16 = -[HMDAggregationAnalysisLogEvent hapIPReceivedHTTPResponsesCount](self, "hapIPReceivedHTTPResponsesCount");
  v15 = -[HMDAggregationAnalysisLogEvent hapIPReceivedHTTPEventCount](self, "hapIPReceivedHTTPEventCount");
  v14 = -[HMDAggregationAnalysisLogEvent hapBTLEConnectionsCount](self, "hapBTLEConnectionsCount");
  v13 = -[HMDAggregationAnalysisLogEvent hapBTLEConnectionPerReasonsCount](self, "hapBTLEConnectionPerReasonsCount");
  v12 = -[HMDAggregationAnalysisLogEvent hapBTLEDiscoveriesCount](self, "hapBTLEDiscoveriesCount");
  v11 = -[HMDAggregationAnalysisLogEvent cameraStreamStartSuccessCount](self, "cameraStreamStartSuccessCount");
  v10 = -[HMDAggregationAnalysisLogEvent cameraStreamStartFailureCount](self, "cameraStreamStartFailureCount");
  v9 = -[HMDAggregationAnalysisLogEvent fetchCameraClipVideoSegmentAssetCount](self, "fetchCameraClipVideoSegmentAssetCount");
  v8 = -[HMDAggregationAnalysisLogEvent acceptedXPCRequestsCount](self, "acceptedXPCRequestsCount");
  v7 = -[HMDAggregationAnalysisLogEvent erroredXPCRequestsCount](self, "erroredXPCRequestsCount");
  v6 = -[HMDAggregationAnalysisLogEvent sentXPCNotificationsCount](self, "sentXPCNotificationsCount");
  -[HMDAggregationAnalysisLogEvent filteredXPCNotificationsCount](self, "filteredXPCNotificationsCount");
  -[HMDAggregationAnalysisLogEvent cameraRecordingReachabilityChangedCount](self, "cameraRecordingReachabilityChangedCount");
  -[HMDAggregationAnalysisLogEvent cameraRecordingReachabilityOfflineDuration](self, "cameraRecordingReachabilityOfflineDuration");
  -[HMDAggregationAnalysisLogEvent homeHubReachabilityChangedCount](self, "homeHubReachabilityChangedCount");
  -[HMDAggregationAnalysisLogEvent currentDeviceStartedLegacyElectionCount](self, "currentDeviceStartedLegacyElectionCount");
  -[HMDAggregationAnalysisLogEvent v2ElectionCurrentDeviceInSecondaryCoordinationMesh](self, "v2ElectionCurrentDeviceInSecondaryCoordinationMesh");
  -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshUpdateCount](self, "v2ElectionCoordinationMeshUpdateCount");
  -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshLeaderElectedCount](self, "v2ElectionCoordinationMeshLeaderElectedCount");
  -[HMDAggregationAnalysisLogEvent v2ElectionCoordinationMeshLeaderChangedCount](self, "v2ElectionCoordinationMeshLeaderChangedCount");
  -[HMDAggregationAnalysisLogEvent v2ElectionPrimaryResidentElectionRunCount](self, "v2ElectionPrimaryResidentElectionRunCount");
  -[HMDAggregationAnalysisLogEvent v2ElectionPrimaryResidentChangedCount](self, "v2ElectionPrimaryResidentChangedCount");
  -[HMDAggregationAnalysisLogEvent workingStoreCoreDataTransactionCount](self, "workingStoreCoreDataTransactionCount");
  -[HMDAggregationAnalysisLogEvent cloudStoreCoreDataTransactionCount](self, "cloudStoreCoreDataTransactionCount");
  -[HMDAggregationAnalysisLogEvent coreDataCloudKitImportCount](self, "coreDataCloudKitImportCount");
  -[HMDAggregationAnalysisLogEvent coreDataCloudKitExportCount](self, "coreDataCloudKitExportCount");
  -[HMDAggregationAnalysisLogEvent residentSyncFetchHomeDataRequestCount](self, "residentSyncFetchHomeDataRequestCount");
  -[HMDAggregationAnalysisLogEvent residentSyncHomeDataChangedNotificationCount](self, "residentSyncHomeDataChangedNotificationCount");
  -[HMDAggregationAnalysisLogEvent generationCounterIncrementCount](self, "generationCounterIncrementCount");
  -[HMDAggregationAnalysisLogEvent notifyXPCClientsHomeDataChangedCount](self, "notifyXPCClientsHomeDataChangedCount");
  -[HMDAggregationAnalysisLogEvent isActiveDay](self, "isActiveDay");
  -[HMDAggregationAnalysisLogEvent countOfDaysSinceLastActive](self, "countOfDaysSinceLastActive");
  -[HMDAggregationAnalysisLogEvent activeDaysPerMonthCount](self, "activeDaysPerMonthCount");
  -[HMDAggregationAnalysisLogEvent widgetMaxRefreshCountForKind](self, "widgetMaxRefreshCountForKind");
  objc_msgSend(v66, "stringWithFormat:", CFSTR("%@: \ndataSyncState: %@ \nprocessLaunchCount: %lu \njetsamReasonHighwaterCount: %lu \njetsamReasonProcessLimitCount: %lu \njetsamReasonOtherCount: %lu \nprocessCrashCount: %lu \nprocessMemoryPressureStateWarningCount: %lu \nprocessMemoryPressureStateCriticalCount: %lu \nsampledAverageProcessMemoryUsageMB: %lu \nsampledPeakProcessMemoryUsageMB: %lu \nremoteMessagesSentCount: %lu \nremoteMessagesReceivedCount: %lu \ntxIDSMessagesCount: %lu \nrxIDSMessagesCount: %lu \ntxIDSProxyMessagesCount: %lu \ntxIDSProxyMessagesCount: %lu \ntxLoxyMessagesCount: %lu \nrxLoxyMessagesCount: %lu \ntxRapportMessagesCount: %lu \nrxRapportMessagesCount: %lu \ntxSecureMessagesCount: %lu \nrxSecureMessagesCount: %lu \ncloudSyncPushCount: %lu \ncloudSyncFetchCount: %lu \ncloudSyncUploadCount: %lu \ncloudSyncUploadErrorCount: %lu \nhomeDataBytesFetched: %lu \nhomeDataBytesPushed: %lu \nlegacyHomeDataBytesFetched: %lu \nlegacyHomeDataBytesPushed: %lu \nnumReadSiri: %lu \nnumWriteSiri: %lu \nnumReadFirstPartyApp: %lu \nnumWriteFirstPartyApp: %lu \nnumReadThirdPartyApp: %lu \nnumWriteThirdPartyApp: %lu \naverageLatencyIP: %lu \naverageLatencyBT: %lu \naverageLatencyIDS: %lu \nnumAccessoriesAdded: %lu \nnumScenesAdded: %lu \nnumTriggersAdded: %lu \nnumShortcutsAdded: %lu \nnumScenesUserRun: %lu \nnumShortcutsRun: %lu \nnumTriggersFired: %lu \nhapIPInvalidationCount: %lu \nhapIPSentHTTPRequestsCount: %lu \nhapIPReceivedHTTPResponsesCount: %lu \nhapIPReceivedHTTPEventCount: %lu \nhapBTLEConnectionsCount: %lu \nhapBTLEConnectionPerReasonsCount: %lu \nhapBTLEDiscoveriesCount: %lu \ncameraStreamStartSuccessCount: %lu \ncameraStreamStartFailureCount: %lu \nfetchCameraClipVideoSegmentAssetCount: %lu \nacceptedXPCRequestsCount: %lu \nerroredXPCRequestsCount: %lu \nsentXPCNotificationsCount: %lu \nfilteredXPCNotificationsCount: %lu \ncameraRecordingReachabilityChangedCount: %lu \ncameraRecordingReachabilityOfflineDuration: %lu \nhomeHubReachabilityChangedCount: %lu \ncurrentDeviceStartedLegacyElectionCount: %lu \nv2ElectionCoordinationDeviceInSecondaryMesh: %d \nv2ElectionCoordinationMeshUpdateCount: %lu \nv2ElectionCoordinationMeshLeaderElectedCount: %lu \nv2ElectionCoordinationMeshLeaderChangedCount: %lu \nv2ElectionPrimaryResidentElectionRunCount: %lu \nv2ElectionPrimaryResidentChangedCount: %lu \nworkingStoreCoreDataTransactionCount: %lu \ncloudStoreCoreDataTransactionCount %lu \ncoreDataCloudKitImportCount %lu \ncoreDataCloudKitExportCount %lu \nresidentSyncFetchHomeDataRequestCount %lu \nresidentSyncHomeDataChangedNotificationCount %lu \ngenerationCounterIncrementCount %lu \nnotifyXPCClientsHomeDataChangedCount %lu \nactiveDay: %d \ncountOfDaysSinceLastActive %ld \nactiveDaysPerMonthCount: %lu \nwidgetMaxRefreshCountForKind: %lu"), v65, v64, v63, v62, v61, v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50,
    v49,
    v48,
    v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v32,
    v31,
    v30,
    v29,
    v28,
    v27,
    v26,
    v25,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18,
    v17,
    v16,
    v15,
    v14,
    v13,
    v12,
    v11,
    v10,
    v9,
    v8,
    v7,
    v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (void)setDataSyncState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)processLaunchCount
{
  return self->_processLaunchCount;
}

- (void)setProcessLaunchCount:(unint64_t)a3
{
  self->_processLaunchCount = a3;
}

- (unint64_t)processJetsamCount
{
  return self->_processJetsamCount;
}

- (void)setProcessJetsamCount:(unint64_t)a3
{
  self->_processJetsamCount = a3;
}

- (unint64_t)processCrashCount
{
  return self->_processCrashCount;
}

- (void)setProcessCrashCount:(unint64_t)a3
{
  self->_processCrashCount = a3;
}

- (unint64_t)jetsamReasonHighwaterCount
{
  return self->_jetsamReasonHighwaterCount;
}

- (void)setJetsamReasonHighwaterCount:(unint64_t)a3
{
  self->_jetsamReasonHighwaterCount = a3;
}

- (unint64_t)jetsamReasonProcessLimitCount
{
  return self->_jetsamReasonProcessLimitCount;
}

- (void)setJetsamReasonProcessLimitCount:(unint64_t)a3
{
  self->_jetsamReasonProcessLimitCount = a3;
}

- (unint64_t)jetsamReasonOtherCount
{
  return self->_jetsamReasonOtherCount;
}

- (void)setJetsamReasonOtherCount:(unint64_t)a3
{
  self->_jetsamReasonOtherCount = a3;
}

- (unint64_t)processMemoryPressureStateWarningCount
{
  return self->_processMemoryPressureStateWarningCount;
}

- (void)setProcessMemoryPressureStateWarningCount:(unint64_t)a3
{
  self->_processMemoryPressureStateWarningCount = a3;
}

- (unint64_t)processMemoryPressureStateCriticalCount
{
  return self->_processMemoryPressureStateCriticalCount;
}

- (void)setProcessMemoryPressureStateCriticalCount:(unint64_t)a3
{
  self->_processMemoryPressureStateCriticalCount = a3;
}

- (unint64_t)sampledAverageProcessMemoryUsageMB
{
  return self->_sampledAverageProcessMemoryUsageMB;
}

- (void)setSampledAverageProcessMemoryUsageMB:(unint64_t)a3
{
  self->_sampledAverageProcessMemoryUsageMB = a3;
}

- (unint64_t)sampledPeakProcessMemoryUsageMB
{
  return self->_sampledPeakProcessMemoryUsageMB;
}

- (void)setSampledPeakProcessMemoryUsageMB:(unint64_t)a3
{
  self->_sampledPeakProcessMemoryUsageMB = a3;
}

- (unint64_t)remoteMessagesSentCount
{
  return self->_remoteMessagesSentCount;
}

- (void)setRemoteMessagesSentCount:(unint64_t)a3
{
  self->_remoteMessagesSentCount = a3;
}

- (unint64_t)remoteMessagesReceivedCount
{
  return self->_remoteMessagesReceivedCount;
}

- (void)setRemoteMessagesReceivedCount:(unint64_t)a3
{
  self->_remoteMessagesReceivedCount = a3;
}

- (unint64_t)txIDSMessagesCount
{
  return self->_txIDSMessagesCount;
}

- (void)setTxIDSMessagesCount:(unint64_t)a3
{
  self->_txIDSMessagesCount = a3;
}

- (unint64_t)rxIDSMessagesCount
{
  return self->_rxIDSMessagesCount;
}

- (void)setRxIDSMessagesCount:(unint64_t)a3
{
  self->_rxIDSMessagesCount = a3;
}

- (unint64_t)txIDSProxyMessagesCount
{
  return self->_txIDSProxyMessagesCount;
}

- (void)setTxIDSProxyMessagesCount:(unint64_t)a3
{
  self->_txIDSProxyMessagesCount = a3;
}

- (unint64_t)rxIDSProxyMessagesCount
{
  return self->_rxIDSProxyMessagesCount;
}

- (void)setRxIDSProxyMessagesCount:(unint64_t)a3
{
  self->_rxIDSProxyMessagesCount = a3;
}

- (unint64_t)txLoxyMessagesCount
{
  return self->_txLoxyMessagesCount;
}

- (void)setTxLoxyMessagesCount:(unint64_t)a3
{
  self->_txLoxyMessagesCount = a3;
}

- (unint64_t)rxLoxyMessagesCount
{
  return self->_rxLoxyMessagesCount;
}

- (void)setRxLoxyMessagesCount:(unint64_t)a3
{
  self->_rxLoxyMessagesCount = a3;
}

- (unint64_t)txRapportMessagesCount
{
  return self->_txRapportMessagesCount;
}

- (void)setTxRapportMessagesCount:(unint64_t)a3
{
  self->_txRapportMessagesCount = a3;
}

- (unint64_t)rxRapportMessagesCount
{
  return self->_rxRapportMessagesCount;
}

- (void)setRxRapportMessagesCount:(unint64_t)a3
{
  self->_rxRapportMessagesCount = a3;
}

- (unint64_t)txSecureMessagesCount
{
  return self->_txSecureMessagesCount;
}

- (void)setTxSecureMessagesCount:(unint64_t)a3
{
  self->_txSecureMessagesCount = a3;
}

- (unint64_t)rxSecureMessagesCount
{
  return self->_rxSecureMessagesCount;
}

- (void)setRxSecureMessagesCount:(unint64_t)a3
{
  self->_rxSecureMessagesCount = a3;
}

- (unint64_t)cloudSyncPushCount
{
  return self->_cloudSyncPushCount;
}

- (unint64_t)legacyCloudSyncPushCount
{
  return self->_legacyCloudSyncPushCount;
}

- (void)setLegacyCloudSyncPushCount:(unint64_t)a3
{
  self->_legacyCloudSyncPushCount = a3;
}

- (unint64_t)cloudSyncFetchCount
{
  return self->_cloudSyncFetchCount;
}

- (unint64_t)cloudSyncUploadCount
{
  return self->_cloudSyncUploadCount;
}

- (void)setCloudSyncUploadCount:(unint64_t)a3
{
  self->_cloudSyncUploadCount = a3;
}

- (unint64_t)cloudSyncUploadErrorCount
{
  return self->_cloudSyncUploadErrorCount;
}

- (void)setCloudSyncUploadErrorCount:(unint64_t)a3
{
  self->_cloudSyncUploadErrorCount = a3;
}

- (unint64_t)homeDataBytesFetched
{
  return self->_homeDataBytesFetched;
}

- (void)setHomeDataBytesFetched:(unint64_t)a3
{
  self->_homeDataBytesFetched = a3;
}

- (unint64_t)homeDataBytesPushed
{
  return self->_homeDataBytesPushed;
}

- (void)setHomeDataBytesPushed:(unint64_t)a3
{
  self->_homeDataBytesPushed = a3;
}

- (unint64_t)legacyHomeDataBytesFetched
{
  return self->_legacyHomeDataBytesFetched;
}

- (void)setLegacyHomeDataBytesFetched:(unint64_t)a3
{
  self->_legacyHomeDataBytesFetched = a3;
}

- (unint64_t)legacyHomeDataBytesPushed
{
  return self->_legacyHomeDataBytesPushed;
}

- (void)setLegacyHomeDataBytesPushed:(unint64_t)a3
{
  self->_legacyHomeDataBytesPushed = a3;
}

- (unint64_t)cloudSyncDecryptionFailedCount
{
  return self->_cloudSyncDecryptionFailedCount;
}

- (void)setCloudSyncDecryptionFailedCount:(unint64_t)a3
{
  self->_cloudSyncDecryptionFailedCount = a3;
}

- (BOOL)cloudSyncLastDecryptionFailed
{
  return self->_cloudSyncLastDecryptionFailed;
}

- (void)setCloudSyncLastDecryptionFailed:(BOOL)a3
{
  self->_cloudSyncLastDecryptionFailed = a3;
}

- (BOOL)cloudSyncMaximumDelayReached
{
  return self->_cloudSyncMaximumDelayReached;
}

- (void)setCloudSyncMaximumDelayReached:(BOOL)a3
{
  self->_cloudSyncMaximumDelayReached = a3;
}

- (unint64_t)cloudStoreCoreDataTransactionCount
{
  return self->_cloudStoreCoreDataTransactionCount;
}

- (void)setCloudStoreCoreDataTransactionCount:(unint64_t)a3
{
  self->_cloudStoreCoreDataTransactionCount = a3;
}

- (unint64_t)workingStoreCoreDataTransactionCount
{
  return self->_workingStoreCoreDataTransactionCount;
}

- (void)setWorkingStoreCoreDataTransactionCount:(unint64_t)a3
{
  self->_workingStoreCoreDataTransactionCount = a3;
}

- (unint64_t)coreDataCloudKitImportCount
{
  return self->_coreDataCloudKitImportCount;
}

- (void)setCoreDataCloudKitImportCount:(unint64_t)a3
{
  self->_coreDataCloudKitImportCount = a3;
}

- (unint64_t)coreDataCloudKitExportCount
{
  return self->_coreDataCloudKitExportCount;
}

- (void)setCoreDataCloudKitExportCount:(unint64_t)a3
{
  self->_coreDataCloudKitExportCount = a3;
}

- (unint64_t)residentSyncFetchHomeDataRequestCount
{
  return self->_residentSyncFetchHomeDataRequestCount;
}

- (void)setResidentSyncFetchHomeDataRequestCount:(unint64_t)a3
{
  self->_residentSyncFetchHomeDataRequestCount = a3;
}

- (unint64_t)residentSyncHomeDataChangedNotificationCount
{
  return self->_residentSyncHomeDataChangedNotificationCount;
}

- (void)setResidentSyncHomeDataChangedNotificationCount:(unint64_t)a3
{
  self->_residentSyncHomeDataChangedNotificationCount = a3;
}

- (unint64_t)generationCounterIncrementCount
{
  return self->_generationCounterIncrementCount;
}

- (void)setGenerationCounterIncrementCount:(unint64_t)a3
{
  self->_generationCounterIncrementCount = a3;
}

- (unint64_t)notifyXPCClientsHomeDataChangedCount
{
  return self->_notifyXPCClientsHomeDataChangedCount;
}

- (void)setNotifyXPCClientsHomeDataChangedCount:(unint64_t)a3
{
  self->_notifyXPCClientsHomeDataChangedCount = a3;
}

- (unint64_t)numReadSiri
{
  return self->_numReadSiri;
}

- (void)setNumReadSiri:(unint64_t)a3
{
  self->_numReadSiri = a3;
}

- (unint64_t)numWriteSiri
{
  return self->_numWriteSiri;
}

- (void)setNumWriteSiri:(unint64_t)a3
{
  self->_numWriteSiri = a3;
}

- (unint64_t)numReadFirstPartyApp
{
  return self->_numReadFirstPartyApp;
}

- (void)setNumReadFirstPartyApp:(unint64_t)a3
{
  self->_numReadFirstPartyApp = a3;
}

- (unint64_t)numWriteFirstPartyApp
{
  return self->_numWriteFirstPartyApp;
}

- (void)setNumWriteFirstPartyApp:(unint64_t)a3
{
  self->_numWriteFirstPartyApp = a3;
}

- (unint64_t)numReadThirdPartyApp
{
  return self->_numReadThirdPartyApp;
}

- (void)setNumReadThirdPartyApp:(unint64_t)a3
{
  self->_numReadThirdPartyApp = a3;
}

- (unint64_t)numWriteThirdPartyApp
{
  return self->_numWriteThirdPartyApp;
}

- (void)setNumWriteThirdPartyApp:(unint64_t)a3
{
  self->_numWriteThirdPartyApp = a3;
}

- (unint64_t)numReadInternalRequested
{
  return self->_numReadInternalRequested;
}

- (void)setNumReadInternalRequested:(unint64_t)a3
{
  self->_numReadInternalRequested = a3;
}

- (unint64_t)numWriteInternalRequested
{
  return self->_numWriteInternalRequested;
}

- (void)setNumWriteInternalRequested:(unint64_t)a3
{
  self->_numWriteInternalRequested = a3;
}

- (unint64_t)numReadUnknownSource
{
  return self->_numReadUnknownSource;
}

- (void)setNumReadUnknownSource:(unint64_t)a3
{
  self->_numReadUnknownSource = a3;
}

- (unint64_t)numWriteUnknownSource
{
  return self->_numWriteUnknownSource;
}

- (void)setNumWriteUnknownSource:(unint64_t)a3
{
  self->_numWriteUnknownSource = a3;
}

- (unint64_t)numReadWriteSuccessIP
{
  return self->_numReadWriteSuccessIP;
}

- (void)setNumReadWriteSuccessIP:(unint64_t)a3
{
  self->_numReadWriteSuccessIP = a3;
}

- (unint64_t)numReadWriteFailureIP
{
  return self->_numReadWriteFailureIP;
}

- (void)setNumReadWriteFailureIP:(unint64_t)a3
{
  self->_numReadWriteFailureIP = a3;
}

- (unint64_t)numReadWriteSuccessBT
{
  return self->_numReadWriteSuccessBT;
}

- (void)setNumReadWriteSuccessBT:(unint64_t)a3
{
  self->_numReadWriteSuccessBT = a3;
}

- (unint64_t)numReadWriteFailureBT
{
  return self->_numReadWriteFailureBT;
}

- (void)setNumReadWriteFailureBT:(unint64_t)a3
{
  self->_numReadWriteFailureBT = a3;
}

- (unint64_t)numReadWriteSuccessIDS
{
  return self->_numReadWriteSuccessIDS;
}

- (void)setNumReadWriteSuccessIDS:(unint64_t)a3
{
  self->_numReadWriteSuccessIDS = a3;
}

- (unint64_t)numReadWriteFailureIDS
{
  return self->_numReadWriteFailureIDS;
}

- (void)setNumReadWriteFailureIDS:(unint64_t)a3
{
  self->_numReadWriteFailureIDS = a3;
}

- (unint64_t)averageLatencyIP
{
  return self->_averageLatencyIP;
}

- (void)setAverageLatencyIP:(unint64_t)a3
{
  self->_averageLatencyIP = a3;
}

- (unint64_t)averageLatencyBT
{
  return self->_averageLatencyBT;
}

- (void)setAverageLatencyBT:(unint64_t)a3
{
  self->_averageLatencyBT = a3;
}

- (unint64_t)averageLatencyIDS
{
  return self->_averageLatencyIDS;
}

- (void)setAverageLatencyIDS:(unint64_t)a3
{
  self->_averageLatencyIDS = a3;
}

- (unint64_t)numAccessoriesAdded
{
  return self->_numAccessoriesAdded;
}

- (void)setNumAccessoriesAdded:(unint64_t)a3
{
  self->_numAccessoriesAdded = a3;
}

- (unint64_t)numScenesAdded
{
  return self->_numScenesAdded;
}

- (void)setNumScenesAdded:(unint64_t)a3
{
  self->_numScenesAdded = a3;
}

- (unint64_t)numTriggersAdded
{
  return self->_numTriggersAdded;
}

- (void)setNumTriggersAdded:(unint64_t)a3
{
  self->_numTriggersAdded = a3;
}

- (unint64_t)numShortcutsAdded
{
  return self->_numShortcutsAdded;
}

- (void)setNumShortcutsAdded:(unint64_t)a3
{
  self->_numShortcutsAdded = a3;
}

- (unint64_t)numScenesUserRun
{
  return self->_numScenesUserRun;
}

- (void)setNumScenesUserRun:(unint64_t)a3
{
  self->_numScenesUserRun = a3;
}

- (unint64_t)numShortcutsRun
{
  return self->_numShortcutsRun;
}

- (void)setNumShortcutsRun:(unint64_t)a3
{
  self->_numShortcutsRun = a3;
}

- (unint64_t)numTriggersFired
{
  return self->_numTriggersFired;
}

- (void)setNumTriggersFired:(unint64_t)a3
{
  self->_numTriggersFired = a3;
}

- (unint64_t)hapIPInvalidationCount
{
  return self->_hapIPInvalidationCount;
}

- (void)setHapIPInvalidationCount:(unint64_t)a3
{
  self->_hapIPInvalidationCount = a3;
}

- (unint64_t)hapIPSentHTTPRequestsCount
{
  return self->_hapIPSentHTTPRequestsCount;
}

- (void)setHapIPSentHTTPRequestsCount:(unint64_t)a3
{
  self->_hapIPSentHTTPRequestsCount = a3;
}

- (unint64_t)hapIPReceivedHTTPResponsesCount
{
  return self->_hapIPReceivedHTTPResponsesCount;
}

- (void)setHapIPReceivedHTTPResponsesCount:(unint64_t)a3
{
  self->_hapIPReceivedHTTPResponsesCount = a3;
}

- (unint64_t)hapIPReceivedHTTPEventCount
{
  return self->_hapIPReceivedHTTPEventCount;
}

- (void)setHapIPReceivedHTTPEventCount:(unint64_t)a3
{
  self->_hapIPReceivedHTTPEventCount = a3;
}

- (unint64_t)hapBTLEConnectionsCount
{
  return self->_hapBTLEConnectionsCount;
}

- (void)setHapBTLEConnectionsCount:(unint64_t)a3
{
  self->_hapBTLEConnectionsCount = a3;
}

- (unint64_t)hapBTLEConnectionPerReasonsCount
{
  return self->_hapBTLEConnectionPerReasonsCount;
}

- (void)setHapBTLEConnectionPerReasonsCount:(unint64_t)a3
{
  self->_hapBTLEConnectionPerReasonsCount = a3;
}

- (unint64_t)hapBTLEDiscoveriesCount
{
  return self->_hapBTLEDiscoveriesCount;
}

- (void)setHapBTLEDiscoveriesCount:(unint64_t)a3
{
  self->_hapBTLEDiscoveriesCount = a3;
}

- (unint64_t)cameraStreamStartSuccessCount
{
  return self->_cameraStreamStartSuccessCount;
}

- (void)setCameraStreamStartSuccessCount:(unint64_t)a3
{
  self->_cameraStreamStartSuccessCount = a3;
}

- (unint64_t)cameraStreamStartFailureCount
{
  return self->_cameraStreamStartFailureCount;
}

- (void)setCameraStreamStartFailureCount:(unint64_t)a3
{
  self->_cameraStreamStartFailureCount = a3;
}

- (unint64_t)fetchCameraClipVideoSegmentAssetCount
{
  return self->_fetchCameraClipVideoSegmentAssetCount;
}

- (void)setFetchCameraClipVideoSegmentAssetCount:(unint64_t)a3
{
  self->_fetchCameraClipVideoSegmentAssetCount = a3;
}

- (unint64_t)acceptedXPCRequestsCount
{
  return self->_acceptedXPCRequestsCount;
}

- (void)setAcceptedXPCRequestsCount:(unint64_t)a3
{
  self->_acceptedXPCRequestsCount = a3;
}

- (unint64_t)erroredXPCRequestsCount
{
  return self->_erroredXPCRequestsCount;
}

- (void)setErroredXPCRequestsCount:(unint64_t)a3
{
  self->_erroredXPCRequestsCount = a3;
}

- (unint64_t)sentXPCNotificationsCount
{
  return self->_sentXPCNotificationsCount;
}

- (void)setSentXPCNotificationsCount:(unint64_t)a3
{
  self->_sentXPCNotificationsCount = a3;
}

- (unint64_t)filteredXPCNotificationsCount
{
  return self->_filteredXPCNotificationsCount;
}

- (void)setFilteredXPCNotificationsCount:(unint64_t)a3
{
  self->_filteredXPCNotificationsCount = a3;
}

- (unint64_t)cameraRecordingReachabilityChangedCount
{
  return self->_cameraRecordingReachabilityChangedCount;
}

- (void)setCameraRecordingReachabilityChangedCount:(unint64_t)a3
{
  self->_cameraRecordingReachabilityChangedCount = a3;
}

- (unint64_t)cameraRecordingReachabilityOfflineDuration
{
  return self->_cameraRecordingReachabilityOfflineDuration;
}

- (void)setCameraRecordingReachabilityOfflineDuration:(unint64_t)a3
{
  self->_cameraRecordingReachabilityOfflineDuration = a3;
}

- (unint64_t)homeHubReachabilityChangedCount
{
  return self->_homeHubReachabilityChangedCount;
}

- (void)setHomeHubReachabilityChangedCount:(unint64_t)a3
{
  self->_homeHubReachabilityChangedCount = a3;
}

- (unint64_t)ipAccessoryReachabilityChangedCount
{
  return self->_ipAccessoryReachabilityChangedCount;
}

- (void)setIpAccessoryReachabilityChangedCount:(unint64_t)a3
{
  self->_ipAccessoryReachabilityChangedCount = a3;
}

- (unint64_t)currentDeviceStartedLegacyElectionCount
{
  return self->_currentDeviceStartedLegacyElectionCount;
}

- (void)setCurrentDeviceStartedLegacyElectionCount:(unint64_t)a3
{
  self->_currentDeviceStartedLegacyElectionCount = a3;
}

- (unint64_t)v2ElectionCoordinationMeshUpdateCount
{
  return self->_v2ElectionCoordinationMeshUpdateCount;
}

- (void)setV2ElectionCoordinationMeshUpdateCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationMeshUpdateCount = a3;
}

- (unint64_t)v2ElectionCoordinationMeshLeaderElectedCount
{
  return self->_v2ElectionCoordinationMeshLeaderElectedCount;
}

- (void)setV2ElectionCoordinationMeshLeaderElectedCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationMeshLeaderElectedCount = a3;
}

- (unint64_t)v2ElectionCoordinationMeshLeaderChangedCount
{
  return self->_v2ElectionCoordinationMeshLeaderChangedCount;
}

- (void)setV2ElectionCoordinationMeshLeaderChangedCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationMeshLeaderChangedCount = a3;
}

- (unint64_t)v2ElectionPrimaryResidentElectionRunCount
{
  return self->_v2ElectionPrimaryResidentElectionRunCount;
}

- (void)setV2ElectionPrimaryResidentElectionRunCount:(unint64_t)a3
{
  self->_v2ElectionPrimaryResidentElectionRunCount = a3;
}

- (unint64_t)v2ElectionPrimaryResidentChangedCount
{
  return self->_v2ElectionPrimaryResidentChangedCount;
}

- (void)setV2ElectionPrimaryResidentChangedCount:(unint64_t)a3
{
  self->_v2ElectionPrimaryResidentChangedCount = a3;
}

- (unint64_t)residentSelectionPrimaryResidentChangedCount
{
  return self->_residentSelectionPrimaryResidentChangedCount;
}

- (void)setResidentSelectionPrimaryResidentChangedCount:(unint64_t)a3
{
  self->_residentSelectionPrimaryResidentChangedCount = a3;
}

- (BOOL)v2ElectionCurrentDeviceInSecondaryCoordinationMesh
{
  return self->_v2ElectionCurrentDeviceInSecondaryCoordinationMesh;
}

- (void)setV2ElectionCurrentDeviceInSecondaryCoordinationMesh:(BOOL)a3
{
  self->_v2ElectionCurrentDeviceInSecondaryCoordinationMesh = a3;
}

- (unint64_t)v2ElectionCoordinationCurrentDeviceFlapCount
{
  return self->_v2ElectionCoordinationCurrentDeviceFlapCount;
}

- (void)setV2ElectionCoordinationCurrentDeviceFlapCount:(unint64_t)a3
{
  self->_v2ElectionCoordinationCurrentDeviceFlapCount = a3;
}

- (int64_t)v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh
{
  return self->_v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh;
}

- (void)setV2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh:(int64_t)a3
{
  self->_v2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh = a3;
}

- (int64_t)primaryResidentDurationMinutes
{
  return self->_primaryResidentDurationMinutes;
}

- (void)setPrimaryResidentDurationMinutes:(int64_t)a3
{
  self->_primaryResidentDurationMinutes = a3;
}

- (unint64_t)bulletinNotificationsPostedCount
{
  return self->_bulletinNotificationsPostedCount;
}

- (void)setBulletinNotificationsPostedCount:(unint64_t)a3
{
  self->_bulletinNotificationsPostedCount = a3;
}

- (BOOL)isActiveDay
{
  return self->_activeDay;
}

- (void)setActiveDay:(BOOL)a3
{
  self->_activeDay = a3;
}

- (unint64_t)activeDaysPerMonthCount
{
  return self->_activeDaysPerMonthCount;
}

- (void)setActiveDaysPerMonthCount:(unint64_t)a3
{
  self->_activeDaysPerMonthCount = a3;
}

- (int64_t)countOfDaysSinceLastActive
{
  return self->_countOfDaysSinceLastActive;
}

- (void)setCountOfDaysSinceLastActive:(int64_t)a3
{
  self->_countOfDaysSinceLastActive = a3;
}

- (unint64_t)peakConcurrentIPAccessoryUpdateStaging
{
  return self->_peakConcurrentIPAccessoryUpdateStaging;
}

- (void)setPeakConcurrentIPAccessoryUpdateStaging:(unint64_t)a3
{
  self->_peakConcurrentIPAccessoryUpdateStaging = a3;
}

- (unint64_t)peakConcurrentIPAccessoryUpdateApply
{
  return self->_peakConcurrentIPAccessoryUpdateApply;
}

- (void)setPeakConcurrentIPAccessoryUpdateApply:(unint64_t)a3
{
  self->_peakConcurrentIPAccessoryUpdateApply = a3;
}

- (unint64_t)peakConcurrentBLEAccessoryUpdateStaging
{
  return self->_peakConcurrentBLEAccessoryUpdateStaging;
}

- (void)setPeakConcurrentBLEAccessoryUpdateStaging:(unint64_t)a3
{
  self->_peakConcurrentBLEAccessoryUpdateStaging = a3;
}

- (unint64_t)peakConcurrentBLEAccessoryUpdateApply
{
  return self->_peakConcurrentBLEAccessoryUpdateApply;
}

- (void)setPeakConcurrentBLEAccessoryUpdateApply:(unint64_t)a3
{
  self->_peakConcurrentBLEAccessoryUpdateApply = a3;
}

- (unint64_t)peakConcurrentThreadAccessoryUpdateStaging
{
  return self->_peakConcurrentThreadAccessoryUpdateStaging;
}

- (void)setPeakConcurrentThreadAccessoryUpdateStaging:(unint64_t)a3
{
  self->_peakConcurrentThreadAccessoryUpdateStaging = a3;
}

- (unint64_t)peakConcurrentThreadAccessoryUpdateApply
{
  return self->_peakConcurrentThreadAccessoryUpdateApply;
}

- (void)setPeakConcurrentThreadAccessoryUpdateApply:(unint64_t)a3
{
  self->_peakConcurrentThreadAccessoryUpdateApply = a3;
}

- (unint64_t)widgetMaxRefreshCountForKind
{
  return self->_widgetMaxRefreshCountForKind;
}

- (void)setWidgetMaxRefreshCountForKind:(unint64_t)a3
{
  self->_widgetMaxRefreshCountForKind = a3;
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
  objc_storeStrong((id *)&self->_dataSyncState, 0);
}

@end
