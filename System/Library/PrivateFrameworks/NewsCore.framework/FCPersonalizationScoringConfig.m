@implementation FCPersonalizationScoringConfig

- (FCPersonalizationScoringConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4
{
  id v6;
  id v7;
  FCPersonalizationScoringConfig *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  FCPersonalizationCohortConfig *v54;
  uint64_t v55;
  FCPersonalizationScoringConfig *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v98;
  double v99;
  double v100;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v110;
  double v111;
  double v112;
  double v114;
  double v115;
  double v116;
  double v118;
  double v119;
  double v120;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v135;
  double v136;
  double v137;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v146;
  double v147;
  double v148;
  double v150;
  double v151;
  double v152;
  void *v154;
  FCPersonalizationCohortConfig *v155;
  FCPersonalizationCohortConfig *v156;
  double v157;
  double v158;
  double v159;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  FCPersonalizationLowFlowEstimationConfig *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  FCPersonalizationLowFlowEstimationConfig *v170;
  FCPersonalizationLowFlowEstimationConfig *v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  uint64_t v206;
  unsigned int v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  void *v216;
  double v217;
  double v218;
  double v219;
  double v220;
  unsigned int v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  void *v248;
  double v249;
  void *v250;
  double v251;
  double v252;
  void *v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  FCPersonalizationScoringConfig *v268;
  void *v269;
  objc_super v270;

  v6 = a3;
  v7 = a4;
  v270.receiver = self;
  v270.super_class = (Class)FCPersonalizationScoringConfig;
  v8 = -[FCPersonalizationScoringConfig init](&v270, sel_init);
  if (v8)
  {
    v268 = v8;
    objc_msgSend(v7, "anfMultiplier");
    v10 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("anfMultiplier"), v9);
    objc_msgSend(v7, "anfMultiplier");
    if (v10 >= 0.0)
      v11 = v10;
    v267 = v11;
    objc_msgSend(v7, "articleEmbeddingScoreCoefficient");
    v13 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("articleEmbeddingScoreCoefficient"), v12);
    objc_msgSend(v7, "articleEmbeddingScoreCoefficient");
    if (v13 >= 0.0)
      v14 = v13;
    v266 = v14;
    objc_msgSend(v7, "articleEmbeddingScoreDampenerWeight");
    v16 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("articleEmbeddingScoreDampenerWeight"), v15);
    objc_msgSend(v7, "articleEmbeddingScoreDampenerWeight");
    if (v16 >= 0.0)
      v17 = v16;
    v265 = v17;
    objc_msgSend(v7, "articleLengthAggregateWeight");
    v19 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("articleLengthAggregateWeight"), v18);
    objc_msgSend(v7, "articleLengthAggregateWeight");
    if (v19 >= 0.0)
      v20 = v19;
    v264 = v20;
    objc_msgSend(v7, "articleReadPenalty");
    v22 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("articleReadPenalty"), v21);
    objc_msgSend(v7, "articleReadPenalty");
    if (v22 <= 1.0 && v22 >= 0.0)
      v23 = v22;
    v263 = v23;
    objc_msgSend(v7, "articleListenedPenalty");
    v26 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("articleListenedPenalty"), v25);
    objc_msgSend(v7, "articleListenedPenalty");
    if (v26 <= 1.0 && v26 >= 0.0)
      v27 = v26;
    v262 = v27;
    objc_msgSend(v7, "audioMultiplierForFreeUsers");
    v261 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("audioMultiplierForAUsers"), v29);
    objc_msgSend(v7, "audioMultiplierForTrialUsers");
    v260 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("audioMultiplierForBUsers"), v30);
    objc_msgSend(v7, "audioMultiplierForPaidUsers");
    v259 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("audioMultiplierForCUsers"), v31);
    objc_msgSend(v7, "autofavoritedVoteCoefficient");
    v33 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("autofavoritedVoteCoefficient"), v32);
    objc_msgSend(v7, "autofavoritedVoteCoefficient");
    if (v33 <= 1.0 && v33 >= 0.0)
      v34 = v33;
    v258 = v34;
    objc_msgSend(v7, "baselineRatePrior");
    v37 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("baselineRatePrior"), v36);
    objc_msgSend(v7, "baselineRatePrior");
    if (v37 >= 0.0)
      v38 = v37;
    v257 = v38;
    objc_msgSend(v7, "bundleFreeMultiplierForFreeUsers");
    v256 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("bundleFreeMultiplierForAUsers"), v39);
    objc_msgSend(v7, "bundleFreeMultiplierForTrialUsers");
    v255 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("bundleFreeMultiplierForBUsers"), v40);
    objc_msgSend(v7, "bundleFreeMultiplierForPaidUsers");
    v254 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("bundleFreeMultiplierForCUsers"), v41);
    objc_msgSend(v7, "bundlePaidMultiplierForFreeUsers");
    v252 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("bundlePaidMultiplierForAUsers"), v42);
    objc_msgSend(v7, "bundlePaidMultiplierForTrialUsers");
    v251 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("bundlePaidMultiplierForBUsers"), v43);
    objc_msgSend(v7, "bundlePaidMultiplierForPaidUsers");
    v249 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("bundlePaidMultiplierForCUsers"), v44);
    objc_msgSend(v7, "conversionCoefficientForFreeUsers");
    v46 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("conversionCoefficientForFreeUsers"), v45);
    objc_msgSend(v7, "conversionCoefficientForFreeUsers");
    if (v46 >= 0.0)
      v47 = v46;
    v247 = v47;
    objc_msgSend(v7, "conversionCoefficientForTrialUsers");
    v49 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("conversionCoefficientForTrialUsers"), v48);
    objc_msgSend(v7, "conversionCoefficientForTrialUsers");
    if (v49 >= 0.0)
      v50 = v49;
    v246 = v50;
    objc_msgSend(v7, "conversionCoefficientForPaidUsers");
    v52 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("conversionCoefficientForPaidUsers"), v51);
    objc_msgSend(v7, "conversionCoefficientForPaidUsers");
    if (v52 >= 0.0)
      v53 = v52;
    v245 = v53;
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("conversionCohort"), 0);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (v253)
    {
      v54 = [FCPersonalizationCohortConfig alloc];
      FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("conversionCohort"), 0);
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[FCPersonalizationCohortConfig initWithConfigDictionary:](v54, "initWithConfigDictionary:");
    }
    else
    {
      objc_msgSend(v7, "conversionCohort");
      v55 = objc_claimAutoreleasedReturnValue();
      v250 = (void *)v55;
    }
    objc_msgSend(v7, "ctrWithOneAutofavorited");
    v58 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithOneAutofavorited"), v57);
    objc_msgSend(v7, "ctrWithOneAutofavorited");
    if (v58 >= 0.0)
      v59 = v58;
    v244 = v59;
    objc_msgSend(v7, "ctrWithOneSubscribed");
    v61 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithOneSubscribed"), v60);
    objc_msgSend(v7, "ctrWithOneSubscribed");
    if (v61 >= 0.0)
      v62 = v61;
    v243 = v62;
    objc_msgSend(v7, "ctrWithSubscribedChannel");
    v64 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithSubscribedChannel"), v63);
    objc_msgSend(v7, "ctrWithSubscribedChannel");
    if (v64 >= 0.0)
      v65 = v64;
    v242 = v65;
    objc_msgSend(v7, "ctrWithThreeAutofavorited");
    v67 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithThreeAutofavorited"), v66);
    objc_msgSend(v7, "ctrWithThreeAutofavorited");
    if (v67 >= 0.0)
      v68 = v67;
    v241 = v68;
    objc_msgSend(v7, "ctrWithThreeSubscribed");
    v70 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithThreeSubscribed"), v69);
    objc_msgSend(v7, "ctrWithThreeSubscribed");
    if (v70 >= 0.0)
      v71 = v70;
    v240 = v71;
    objc_msgSend(v7, "ctrWithTwoAutofavorited");
    v73 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithTwoAutofavorited"), v72);
    objc_msgSend(v7, "ctrWithTwoAutofavorited");
    if (v73 >= 0.0)
      v74 = v73;
    v239 = v74;
    objc_msgSend(v7, "ctrWithTwoSubscribed");
    v76 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithTwoSubscribed"), v75);
    objc_msgSend(v7, "ctrWithTwoSubscribed");
    if (v76 >= 0.0)
      v77 = v76;
    v238 = v77;
    objc_msgSend(v7, "ctrWithZeroAutofavorited");
    v79 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithZeroAutofavorited"), v78);
    objc_msgSend(v7, "ctrWithZeroAutofavorited");
    if (v79 >= 0.0)
      v80 = v79;
    v237 = v80;
    objc_msgSend(v7, "ctrWithZeroSubscribed");
    v82 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("ctrWithZeroSubscribed"), v81);
    objc_msgSend(v7, "ctrWithZeroSubscribed");
    if (v82 >= 0.0)
      v83 = v82;
    v236 = v83;
    objc_msgSend(v7, "decayFactor");
    v85 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("decayFactor"), v84);
    objc_msgSend(v7, "decayFactor");
    if (v85 < 1.0 && v85 >= 0.0)
      v86 = v85;
    v235 = v86;
    objc_msgSend(v7, "featuredMultiplierForFreeUsers");
    v234 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("featuredMultiplierForAUsers"), v88);
    objc_msgSend(v7, "featuredMultiplierForTrialUsers");
    v233 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("featuredMultiplierForBUsers"), v89);
    objc_msgSend(v7, "featuredMultiplierForPaidUsers");
    v232 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("featuredMultiplierForCUsers"), v90);
    objc_msgSend(v7, "evergreenMultiplierForFreeUsers");
    v231 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("evergreenMultiplierForAUsers"), v91);
    objc_msgSend(v7, "evergreenMultiplierForTrialUsers");
    v230 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("evergreenMultiplierForBUsers"), v92);
    objc_msgSend(v7, "evergreenMultiplierForPaidUsers");
    v229 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("evergreenMultiplierForCUsers"), v93);
    objc_msgSend(v7, "globalScoreCoefficientFree");
    v95 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("globalScoreCoefficientFree"), v94);
    objc_msgSend(v7, "globalScoreCoefficientFree");
    if (v95 <= 1.0 && v95 >= 0.0)
      v96 = v95;
    v228 = v96;
    objc_msgSend(v7, "globalScoreCoefficientPaid");
    v99 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("globalScoreCoefficientPaid"), v98);
    objc_msgSend(v7, "globalScoreCoefficientPaid");
    if (v99 <= 1.0 && v99 >= 0.0)
      v100 = v99;
    v227 = v100;
    objc_msgSend(v7, "globalScoreCoefficientHalfLife");
    v103 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("globalScoreCoefficientHalfLife"), v102);
    objc_msgSend(v7, "globalScoreCoefficientHalfLife");
    if (v103 > 0.0)
      v104 = v103;
    v226 = v104;
    objc_msgSend(v7, "globalScoreCoefficientInitialMultiplier");
    v225 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("globalScoreCoefficientInitialMultiplier"), v105);
    objc_msgSend(v7, "globalScoreDemocratizationFactor");
    v107 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("globalScoreDemocratizationFactor"), v106);
    objc_msgSend(v7, "globalScoreDemocratizationFactor");
    if (v107 <= 1.0 && v107 >= 0.0)
      v108 = v107;
    v224 = v108;
    objc_msgSend(v7, "localScoreDemocratizationFactor");
    v111 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("localScoreDemocratizationFactor"), v110);
    objc_msgSend(v7, "localScoreDemocratizationFactor");
    if (v111 <= 1.0 && v111 >= 0.0)
      v112 = v111;
    v223 = v112;
    objc_msgSend(v7, "conversionScoreDemocratizationFactor");
    v115 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("conversionScoreDemocratizationFactor"), v114);
    objc_msgSend(v7, "conversionScoreDemocratizationFactor");
    if (v115 <= 1.0 && v115 >= 0.0)
      v116 = v115;
    v222 = v116;
    objc_msgSend(v7, "headlineSeenPenalty");
    v119 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("headlineSeenPenalty"), v118);
    objc_msgSend(v7, "headlineSeenPenalty");
    if (v119 <= 1.0 && v119 >= 0.0)
      v120 = v119;
    v220 = v120;
    objc_msgSend(v7, "halfLifeCoefficient");
    v123 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("halfLifeCoefficient"), v122);
    objc_msgSend(v7, "halfLifeCoefficient");
    if (v123 >= 0.0)
      v124 = v123;
    v219 = v124;
    objc_msgSend(v7, "userFeedbackHalfLifeCoefficient");
    v126 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("userFeedbackHalfLifeCoefficient"), v125);
    objc_msgSend(v7, "userFeedbackHalfLifeCoefficient");
    if (v126 > 0.0)
      v127 = v126;
    v218 = v127;
    objc_msgSend(v7, "evergreenHalfLifeCoefficient");
    v129 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("evergreenHalfLifeCoefficient"), v128);
    objc_msgSend(v7, "evergreenHalfLifeCoefficient");
    if (v129 > 0.0)
      v130 = v129;
    v217 = v130;
    v221 = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("respectHalfLifeOverride"), objc_msgSend(v7, "respectHalfLifeOverride"));
    objc_msgSend(v7, "mutedVoteCoefficient");
    v132 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("mutedVoteCoefficient"), v131);
    objc_msgSend(v7, "mutedVoteCoefficient");
    if (v132 <= 1.0 && v132 >= 0.0)
      v133 = v132;
    v215 = v133;
    objc_msgSend(v7, "personalizationCoefficient");
    v136 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("personalizationCoefficient"), v135);
    objc_msgSend(v7, "personalizationCoefficient");
    if (v136 <= 1.0 && v136 >= 0.0)
      v137 = v136;
    v214 = v137;
    objc_msgSend(v7, "publisherAggregateWeight");
    v140 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("publisherAggregateWeight"), v139);
    objc_msgSend(v7, "publisherAggregateWeight");
    if (v140 >= 0.0)
      v141 = v140;
    v213 = v141;
    objc_msgSend(v7, "sparseTagsPenalty");
    v143 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("sparseTagsPenalty"), v142);
    objc_msgSend(v7, "sparseTagsPenalty");
    if (v143 <= 1.0 && v143 >= 0.0)
      v144 = v143;
    v212 = v144;
    objc_msgSend(v7, "subscribedChannelScoreCoefficient");
    v147 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("subscribedChannelScoreCoefficient"), v146);
    objc_msgSend(v7, "subscribedChannelScoreCoefficient");
    if (v147 <= 1.0 && v147 >= 0.0)
      v148 = v147;
    v211 = v148;
    objc_msgSend(v7, "subscribedTopicsScoreCoefficient");
    v151 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("subscribedTopicsScoreCoefficient"), v150);
    objc_msgSend(v7, "subscribedTopicsScoreCoefficient");
    if (v151 <= 1.0 && v151 >= 0.0)
      v152 = v151;
    v210 = v152;
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("userCohort"), 0);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (v154)
    {
      v155 = [FCPersonalizationCohortConfig alloc];
      FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("userCohort"), 0);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = -[FCPersonalizationCohortConfig initWithConfigDictionary:](v155, "initWithConfigDictionary:");
    }
    else
    {
      objc_msgSend(v7, "userCohort");
      v156 = (FCPersonalizationCohortConfig *)objc_claimAutoreleasedReturnValue();
      v216 = v156;
    }
    objc_msgSend(v7, "lowFlowBoostFetchCountWeight");
    v158 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("lowFlowBoostFetchCountWeight"), v157);
    objc_msgSend(v7, "lowFlowBoostFetchCountWeight");
    if (v158 <= 1.0 && v158 >= 0.0)
      v159 = v158;
    v209 = v159;
    objc_msgSend(v7, "lowFlowBoostFactor");
    v162 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("lowFlowBoostFactor"), v161);
    objc_msgSend(v7, "lowFlowBoostFactor");
    if (v162 >= 0.0)
      v163 = v162;
    v208 = v163;
    objc_msgSend(v7, "lowFlowBoostMaxProductFactor");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("lowFlowBoostMaxProductFactor"), v164);
    objc_msgSend(v7, "lowFlowBoostMaxProductFactor");
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("lowFlowBoostFetchEstimationConfig"), 0);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    if (v165)
    {
      v166 = [FCPersonalizationLowFlowEstimationConfig alloc];
      FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("lowFlowBoostFetchEstimationConfig"), 0);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = -[FCPersonalizationLowFlowEstimationConfig initWithConfigDictionary:](v166, "initWithConfigDictionary:", v167);
    }
    else
    {
      objc_msgSend(v7, "lowFlowBoostFetchEstimationConfig");
      v168 = objc_claimAutoreleasedReturnValue();
      v167 = (void *)v168;
    }
    v269 = (void *)v168;
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("lowFlowBoostEventEstimationConfig"), 0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v248 = (void *)v55;
    if (v169)
    {
      v170 = [FCPersonalizationLowFlowEstimationConfig alloc];
      FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("lowFlowBoostEventEstimationConfig"), 0);
      v206 = objc_claimAutoreleasedReturnValue();
      v171 = -[FCPersonalizationLowFlowEstimationConfig initWithConfigDictionary:](v170, "initWithConfigDictionary:");
    }
    else
    {
      objc_msgSend(v7, "lowFlowBoostEventEstimationConfig");
      v171 = (FCPersonalizationLowFlowEstimationConfig *)objc_claimAutoreleasedReturnValue();
    }
    v207 = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("nicheContentBoostOnlyAboveBaselineMembership"), objc_msgSend(v7, "nicheContentBoostOnlyAboveBaselineMembership"));
    objc_msgSend(v7, "nicheContentBaselineMembershipMultiplier");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentBaselineMembershipMultiplier"), v172);
    FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("nicheContentManagedTopicBoostAllTags"), objc_msgSend(v7, "nicheContentManagedTopicBoostAllTags"));
    objc_msgSend(v7, "nicheContentDefaultFlowRate");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentDefaultFlowRate"), v173);
    objc_msgSend(v7, "nicheContentDefaultFlowRate");
    objc_msgSend(v7, "nicheContentDefaultSubscriptionRate");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentDefaultSubscriptionRate"), v174);
    objc_msgSend(v7, "nicheContentDefaultSubscriptionRate");
    FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("nicheContentExcludeNonGroupableTopics"), objc_msgSend(v7, "nicheContentExcludeNonGroupableTopics"));
    FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("nicheContentShouldBoostPublisher"), objc_msgSend(v7, "nicheContentShouldBoostPublisher"));
    objc_msgSend(v7, "nicheContentTopicFlowExponent");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentTopicFlowExponent"), v175);
    objc_msgSend(v7, "nicheContentTopicFlowExponent");
    objc_msgSend(v7, "nicheContentPublisherFlowExponent");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentPublisherFlowExponent"), v176);
    objc_msgSend(v7, "nicheContentPublisherFlowExponent");
    objc_msgSend(v7, "nicheContentManagedTopicBoost");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentManagedTopicBoost"), v177);
    objc_msgSend(v7, "nicheContentManagedTopicBoost");
    objc_msgSend(v7, "nicheContentServerFlowWeight");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentServerFlowWeight"), v178);
    objc_msgSend(v7, "nicheContentServerFlowWeight");
    objc_msgSend(v7, "nicheContentTopicSubscriptionExponent");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentTopicSubscriptionExponent"), v179);
    objc_msgSend(v7, "nicheContentTopicSubscriptionExponent");
    objc_msgSend(v7, "nicheContentPublisherSubscriptionExponent");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentPublisherSubscriptionExponent"), v180);
    objc_msgSend(v7, "nicheContentPublisherSubscriptionExponent");
    objc_msgSend(v7, "nicheContentQualityThreshold");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("nicheContentQualityThreshold"), v181);
    objc_msgSend(v7, "nicheContentQualityThreshold");
    FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("contentTriggerMaxEventCount"), objc_msgSend(v7, "contentTriggerMaxEventCount"));
    objc_msgSend(v7, "contentTriggerMaxEventCount");
    objc_msgSend(v7, "contentTriggerScoreExponent");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("contentTriggerScoreExponent"), v182);
    objc_msgSend(v7, "contentTriggerScoreExponent");
    objc_msgSend(v7, "contentTriggerTagWeightExponent");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("contentTriggerTagWeightExponent"), v183);
    objc_msgSend(v7, "contentTriggerTagWeightExponent");
    objc_msgSend(v7, "contentTriggerMinScoreWeight");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("contentTriggerMinScoreWeight"), v184);
    objc_msgSend(v7, "contentTriggerMinScoreWeight");
    objc_msgSend(v7, "contentTriggerMaxDampener");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("contentTriggerMaxDampener"), v185);
    objc_msgSend(v7, "contentTriggerMaxDampener");
    objc_msgSend(v7, "contentTriggerDampenerCoefficient");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("contentTriggerDampenerCoefficient"), v186);
    objc_msgSend(v7, "contentTriggerDampenerCoefficient");
    objc_msgSend(v7, "personalizedMultiplierBaselineMembership");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("personalizedMultiplierBaselineMembership"), v187);
    objc_msgSend(v7, "personalizedMultiplierBaselineMembership");
    objc_msgSend(v7, "personalizedMultiplierPreBaselineCurvature");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("personalizedMultiplierPreBaselineCurvature"), v188);
    objc_msgSend(v7, "personalizedMultiplierPreBaselineCurvature");
    objc_msgSend(v7, "personalizedMultiplierPostBaselineCurvature");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("personalizedMultiplierPostBaselineCurvature"), v189);
    objc_msgSend(v7, "personalizedMultiplierPostBaselineCurvature");
    objc_msgSend(v7, "personalizedMultiplierMembershipDampener");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("personalizedMultiplierMembershipDampener"), v190);
    objc_msgSend(v7, "personalizedMultiplierMembershipDampener");
    objc_msgSend(v7, "publisherDampenerWeight");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("publisherDampenerWeight"), v191);
    objc_msgSend(v7, "publisherDampenerWeight");
    objc_msgSend(v7, "recentlyFollowedDurationThreshold");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("recentlyFollowedDurationThreshold"), v192);
    objc_msgSend(v7, "recentlyFollowedDurationThreshold");
    objc_msgSend(v7, "recentlyFollowedMultiplier");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("recentlyFollowedMultiplier"), v193);
    objc_msgSend(v7, "recentlyFollowedMultiplier");
    objc_msgSend(v7, "tabiScoreCoefficient");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("tabiScoreCoefficient"), v194);
    objc_msgSend(v7, "tabiScoreCoefficient");
    objc_msgSend(v7, "clientSideEngagementBoostFeaturedArticleMultiplier");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostFeaturedArticleMultiplier"), v195);
    objc_msgSend(v7, "clientSideEngagementBoostFeaturedArticleMultiplier");
    objc_msgSend(v7, "clientSideEngagementBoostFeatureCandidateArticleMultiplier");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostFeatureCandidateArticleMultiplier"), v196);
    objc_msgSend(v7, "clientSideEngagementBoostFeatureCandidateArticleMultiplier");
    objc_msgSend(v7, "clientSideEngagementBoostFreeCohortCTRCap");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostFreeCohortCTRCap"), v197);
    objc_msgSend(v7, "clientSideEngagementBoostFreeCohortCTRCap");
    objc_msgSend(v7, "clientSideEngagementBoostPaidCohortCTRCap");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostPaidCohortCTRCap"), v198);
    objc_msgSend(v7, "clientSideEngagementBoostPaidCohortCTRCap");
    objc_msgSend(v7, "clientSideEngagementBoostTagQualityMultiplier");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostTagQualityMultiplier"), v199);
    objc_msgSend(v7, "clientSideEngagementBoostTagQualityMultiplier");
    objc_msgSend(v7, "clientSideEngagementBoostReduceVisibilityMultiplier");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostReduceVisibilityMultiplier"), v200);
    objc_msgSend(v7, "clientSideEngagementBoostReduceVisibilityMultiplier");
    objc_msgSend(v7, "clientSideEngagementBoostANFMutiplier");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostANFMutiplier"), v201);
    objc_msgSend(v7, "clientSideEngagementBoostANFMutiplier");
    FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("dampenerEnabled"), objc_msgSend(v7, "dampenerEnabled"));
    FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("multiplierEnabled"), objc_msgSend(v7, "multiplierEnabled"));
    objc_msgSend(v7, "peopleAlsoReadBaselineScore");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("peopleAlsoReadBaselineScore"), v202);
    objc_msgSend(v7, "peopleAlsoReadBaselineScore");
    objc_msgSend(v7, "peopleAlsoReadConditionalScoreCoefficient");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("peopleAlsoReadConditionalScoreCoefficient"), v203);
    objc_msgSend(v7, "peopleAlsoReadConditionalScoreCoefficient");
    objc_msgSend(v7, "peopleAlsoReadScoreCoefficient");
    FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("peopleAlsoReadScoreCoefficient"), v204);
    objc_msgSend(v7, "peopleAlsoReadScoreCoefficient");
    v56 = objc_retain(-[FCPersonalizationScoringConfig initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:](v268, "initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTop"
              "icBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroup"
              "ableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponen"
              "t:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheCo"
              "ntentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTrigger"
              "ScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:conte"
              "ntTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCur"
              "vature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampe"
              "nerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEnga"
              "gementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSide"
              "EngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQual"
              "ityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:da"
              "mpenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peop"
              "leAlsoReadScoreCoefficient:",
              v55,
              v221,
              v156,
              v269,
              v171,
              v207,
              v267,
              v266,
              v265,
              v264,
              v263,
              v262,
              v261,
              v260,
              *(_QWORD *)&v259,
              *(_QWORD *)&v258,
              *(_QWORD *)&v257,
              *(_QWORD *)&v256,
              *(_QWORD *)&v255,
              *(_QWORD *)&v254,
              *(_QWORD *)&v252,
              *(_QWORD *)&v251,
              *(_QWORD *)&v249,
              *(_QWORD *)&v247,
              *(_QWORD *)&v246,
              *(_QWORD *)&v245,
              *(_QWORD *)&v244,
              *(_QWORD *)&v243,
              *(_QWORD *)&v242,
              *(_QWORD *)&v241,
              *(_QWORD *)&v240,
              *(_QWORD *)&v239,
              *(_QWORD *)&v238,
              *(_QWORD *)&v237,
              *(_QWORD *)&v236,
              *(_QWORD *)&v235,
              *(_QWORD *)&v234,
              *(_QWORD *)&v233,
              *(_QWORD *)&v232,
              *(_QWORD *)&v231,
              *(_QWORD *)&v230,
              *(_QWORD *)&v229,
              *(_QWORD *)&v228,
              *(_QWORD *)&v227,
              *(_QWORD *)&v226,
              *(_QWORD *)&v225,
              *(_QWORD *)&v224,
              *(_QWORD *)&v223,
              *(_QWORD *)&v222,
              *(_QWORD *)&v220,
              *(_QWORD *)&v219,
              *(_QWORD *)&v218,
              *(_QWORD *)&v217,
              *(_QWORD *)&v215,
              *(_QWORD *)&v214,
              *(_QWORD *)&v213,
              *(_QWORD *)&v212,
              *(_QWORD *)&v211,
              *(_QWORD *)&v210,
              *(_QWORD *)&v209,
              *(_QWORD *)&v208));
    if (v169)
    {

      v171 = (FCPersonalizationLowFlowEstimationConfig *)v206;
    }

    if (v165)
    if (v154)

    if (v253)
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (double)recentlyFollowedDurationThreshold
{
  return self->_recentlyFollowedDurationThreshold;
}

- (double)articleEmbeddingScoreCoefficient
{
  return self->_articleEmbeddingScoreCoefficient;
}

- (double)userFeedbackHalfLifeCoefficient
{
  return self->_userFeedbackHalfLifeCoefficient;
}

- (double)tabiScoreCoefficient
{
  return self->_tabiScoreCoefficient;
}

- (double)subscribedTopicsScoreCoefficient
{
  return self->_subscribedTopicsScoreCoefficient;
}

- (double)subscribedChannelScoreCoefficient
{
  return self->_subscribedChannelScoreCoefficient;
}

- (double)sparseTagsPenalty
{
  return self->_sparseTagsPenalty;
}

- (double)recentlyFollowedMultiplier
{
  return self->_recentlyFollowedMultiplier;
}

- (double)publisherDampenerWeight
{
  return self->_publisherDampenerWeight;
}

- (double)publisherAggregateWeight
{
  return self->_publisherAggregateWeight;
}

- (double)personalizedMultiplierPreBaselineCurvature
{
  return self->_personalizedMultiplierPreBaselineCurvature;
}

- (double)personalizedMultiplierPostBaselineCurvature
{
  return self->_personalizedMultiplierPostBaselineCurvature;
}

- (double)personalizedMultiplierMembershipDampener
{
  return self->_personalizedMultiplierMembershipDampener;
}

- (double)personalizedMultiplierBaselineMembership
{
  return self->_personalizedMultiplierBaselineMembership;
}

- (double)personalizationCoefficient
{
  return self->_personalizationCoefficient;
}

- (double)peopleAlsoReadScoreCoefficient
{
  return self->_peopleAlsoReadScoreCoefficient;
}

- (double)peopleAlsoReadConditionalScoreCoefficient
{
  return self->_peopleAlsoReadConditionalScoreCoefficient;
}

- (double)peopleAlsoReadBaselineScore
{
  return self->_peopleAlsoReadBaselineScore;
}

- (double)nicheContentTopicSubscriptionExponent
{
  return self->_nicheContentTopicSubscriptionExponent;
}

- (double)nicheContentTopicFlowExponent
{
  return self->_nicheContentTopicFlowExponent;
}

- (double)nicheContentServerFlowWeight
{
  return self->_nicheContentServerFlowWeight;
}

- (double)nicheContentQualityThreshold
{
  return self->_nicheContentQualityThreshold;
}

- (double)nicheContentPublisherSubscriptionExponent
{
  return self->_nicheContentPublisherSubscriptionExponent;
}

- (double)nicheContentPublisherFlowExponent
{
  return self->_nicheContentPublisherFlowExponent;
}

- (double)nicheContentManagedTopicBoost
{
  return self->_nicheContentManagedTopicBoost;
}

- (double)nicheContentDefaultSubscriptionRate
{
  return self->_nicheContentDefaultSubscriptionRate;
}

- (double)nicheContentDefaultFlowRate
{
  return self->_nicheContentDefaultFlowRate;
}

- (double)mutedVoteCoefficient
{
  return self->_mutedVoteCoefficient;
}

- (double)lowFlowBoostMaxProductFactor
{
  return self->_lowFlowBoostMaxProductFactor;
}

- (double)lowFlowBoostFetchCountWeight
{
  return self->_lowFlowBoostFetchCountWeight;
}

- (double)lowFlowBoostFactor
{
  return self->_lowFlowBoostFactor;
}

- (double)localScoreDemocratizationFactor
{
  return self->_localScoreDemocratizationFactor;
}

- (double)headlineSeenPenalty
{
  return self->_headlineSeenPenalty;
}

- (double)halfLifeCoefficient
{
  return self->_halfLifeCoefficient;
}

- (double)globalScoreDemocratizationFactor
{
  return self->_globalScoreDemocratizationFactor;
}

- (double)globalScoreCoefficientPaid
{
  return self->_globalScoreCoefficientPaid;
}

- (double)globalScoreCoefficientHalfLife
{
  return self->_globalScoreCoefficientHalfLife;
}

- (double)globalScoreCoefficientFree
{
  return self->_globalScoreCoefficientFree;
}

- (double)evergreenHalfLifeCoefficient
{
  return self->_evergreenHalfLifeCoefficient;
}

- (double)decayFactor
{
  return self->_decayFactor;
}

- (double)ctrWithZeroSubscribed
{
  return self->_ctrWithZeroSubscribed;
}

- (double)ctrWithZeroAutofavorited
{
  return self->_ctrWithZeroAutofavorited;
}

- (double)ctrWithTwoSubscribed
{
  return self->_ctrWithTwoSubscribed;
}

- (double)ctrWithTwoAutofavorited
{
  return self->_ctrWithTwoAutofavorited;
}

- (double)ctrWithThreeSubscribed
{
  return self->_ctrWithThreeSubscribed;
}

- (double)ctrWithThreeAutofavorited
{
  return self->_ctrWithThreeAutofavorited;
}

- (double)ctrWithSubscribedChannel
{
  return self->_ctrWithSubscribedChannel;
}

- (double)ctrWithOneSubscribed
{
  return self->_ctrWithOneSubscribed;
}

- (double)ctrWithOneAutofavorited
{
  return self->_ctrWithOneAutofavorited;
}

- (double)conversionScoreDemocratizationFactor
{
  return self->_conversionScoreDemocratizationFactor;
}

- (double)conversionCoefficientForTrialUsers
{
  return self->_conversionCoefficientForTrialUsers;
}

- (double)conversionCoefficientForPaidUsers
{
  return self->_conversionCoefficientForPaidUsers;
}

- (double)conversionCoefficientForFreeUsers
{
  return self->_conversionCoefficientForFreeUsers;
}

- (double)contentTriggerTagWeightExponent
{
  return self->_contentTriggerTagWeightExponent;
}

- (double)contentTriggerScoreExponent
{
  return self->_contentTriggerScoreExponent;
}

- (double)contentTriggerMinScoreWeight
{
  return self->_contentTriggerMinScoreWeight;
}

- (int64_t)contentTriggerMaxEventCount
{
  return self->_contentTriggerMaxEventCount;
}

- (double)contentTriggerMaxDampener
{
  return self->_contentTriggerMaxDampener;
}

- (double)contentTriggerDampenerCoefficient
{
  return self->_contentTriggerDampenerCoefficient;
}

- (double)clientSideEngagementBoostTagQualityMultiplier
{
  return self->_clientSideEngagementBoostTagQualityMultiplier;
}

- (double)clientSideEngagementBoostReduceVisibilityMultiplier
{
  return self->_clientSideEngagementBoostReduceVisibilityMultiplier;
}

- (double)clientSideEngagementBoostPaidCohortCTRCap
{
  return self->_clientSideEngagementBoostPaidCohortCTRCap;
}

- (double)clientSideEngagementBoostFreeCohortCTRCap
{
  return self->_clientSideEngagementBoostFreeCohortCTRCap;
}

- (double)clientSideEngagementBoostFeaturedArticleMultiplier
{
  return self->_clientSideEngagementBoostFeaturedArticleMultiplier;
}

- (double)clientSideEngagementBoostFeatureCandidateArticleMultiplier
{
  return self->_clientSideEngagementBoostFeatureCandidateArticleMultiplier;
}

- (double)clientSideEngagementBoostANFMutiplier
{
  return self->_clientSideEngagementBoostANFMutiplier;
}

- (double)baselineRatePrior
{
  return self->_baselineRatePrior;
}

- (double)autofavoritedVoteCoefficient
{
  return self->_autofavoritedVoteCoefficient;
}

- (double)articleReadPenalty
{
  return self->_articleReadPenalty;
}

- (double)articleListenedPenalty
{
  return self->_articleListenedPenalty;
}

- (double)articleLengthAggregateWeight
{
  return self->_articleLengthAggregateWeight;
}

- (double)articleEmbeddingScoreDampenerWeight
{
  return self->_articleEmbeddingScoreDampenerWeight;
}

- (double)anfMultiplier
{
  return self->_anfMultiplier;
}

- (FCPersonalizationScoringConfig)initWithAnfMultiplier:(double)a3 articleEmbeddingScoreCoefficient:(double)a4 articleEmbeddingScoreDampenerWeight:(double)a5 articleLengthAggregateWeight:(double)a6 articleReadPenalty:(double)a7 articleListenedPenalty:(double)a8 audioMultiplierForFreeUsers:(double)a9 audioMultiplierForTrialUsers:(uint64_t)a10 audioMultiplierForPaidUsers:(void *)a11 autofavoritedVoteCoefficient:(BOOL)a12 baselineRatePrior:(void *)a13 bundleFreeMultiplierForFreeUsers:(void *)a14 bundleFreeMultiplierForTrialUsers:(void *)a15 bundleFreeMultiplierForPaidUsers:(BOOL)a16 bundlePaidMultiplierForFreeUsers:(double)a17 bundlePaidMultiplierForTrialUsers:(double)a18 bundlePaidMultiplierForPaidUsers:(double)a19 conversionCoefficientForFreeUsers:(double)a20 conversionCoefficientForTrialUsers:(double)a21 conversionCoefficientForPaidUsers:(double)a22 conversionCohort:(double)a23 ctrWithOneAutofavorited:(double)a24 ctrWithOneSubscribed:(double)a25 ctrWithSubscribedChannel:(double)a26 ctrWithThreeAutofavorited:(double)a27 ctrWithThreeSubscribed:(double)a28 ctrWithTwoAutofavorited:(double)a29 ctrWithTwoSubscribed:(double)a30 ctrWithZeroAutofavorited:(double)a31 ctrWithZeroSubscribed:(double)a32 decayFactor:(double)a33 featuredMultiplierForFreeUsers:(double)a34 featuredMultiplierForTrialUsers:(double)a35 featuredMultiplierForPaidUsers:(double)a36 evergreenMultiplierForFreeUsers:(double)a37 evergreenMultiplierForTrialUsers:(double)a38 evergreenMultiplierForPaidUsers:(double)a39 globalScoreCoefficientFree:(double)a40 globalScoreCoefficientPaid:(double)a41 globalScoreCoefficientHalfLife:(double)a42 globalScoreCoefficientInitialMultiplier:(double)a43 globalScoreDemocratizationFactor:(double)a44 localScoreDemocratizationFactor:(double)a45 conversionScoreDemocratizationFactor:(double)a46 headlineSeenPenalty:(double)a47 halfLifeCoefficient:(double)a48 userFeedbackHalfLifeCoefficient:(double)a49 evergreenHalfLifeCoefficient:(double)a50 respectHalfLifeOverride:(double)a51 mutedVoteCoefficient:(double)a52 personalizationCoefficient:(double)a53 publisherAggregateWeight:(double)a54 sparseTagsPenalty:(double)a55 subscribedChannelScoreCoefficient:(double)a56 subscribedTopicsScoreCoefficient:(double)a57 userCohort:(double)a58 lowFlowBoostFetchCountWeight:(double)a59 lowFlowBoostFactor:(double)a60 lowFlowBoostMaxProductFactor:(double)a61 lowFlowBoostFetchEstimationConfig:(double)a62 lowFlowBoostEventEstimationConfig:(double)a63 nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:
{
  double a64;
  double a65;
  BOOL a66;
  double a67;
  double a68;
  BOOL a69;
  BOOL a70;
  double a71;
  double a72;
  double a73;
  double a74;
  double a75;
  double a76;
  double a77;
  int64_t a78;
  double a79;
  double a80;
  double a81;
  id v95;
  id v96;
  id v97;
  id v98;
  FCPersonalizationScoringConfig *v99;
  FCPersonalizationScoringConfig *v100;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  char v119;
  char v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  objc_super v125;

  v95 = a11;
  v96 = a13;
  v97 = a14;
  v98 = a15;
  v125.receiver = a1;
  v125.super_class = (Class)FCPersonalizationScoringConfig;
  v99 = -[FCPersonalizationScoringConfig init](&v125, sel_init);
  v100 = v99;
  if (v99)
  {
    v122 = STACK[0x568];
    v123 = STACK[0x570];
    v121 = STACK[0x560];
    v119 = STACK[0x558];
    v120 = STACK[0x559];
    v117 = STACK[0x548];
    v118 = STACK[0x550];
    v115 = STACK[0x538];
    v116 = STACK[0x540];
    v114 = STACK[0x530];
    v113 = STACK[0x528];
    v112 = STACK[0x520];
    v111 = STACK[0x518];
    v110 = STACK[0x510];
    v109 = STACK[0x508];
    v108 = STACK[0x500];
    v107 = STACK[0x4F8];
    v106 = STACK[0x4F0];
    v105 = STACK[0x4E8];
    v104 = STACK[0x4E0];
    v103 = STACK[0x4D8];
    v102 = STACK[0x4D0];
    v99->_anfMultiplier = a2;
    v99->_articleEmbeddingScoreCoefficient = a3;
    v99->_articleEmbeddingScoreDampenerWeight = a4;
    v99->_articleLengthAggregateWeight = a5;
    v99->_articleReadPenalty = a6;
    v99->_articleListenedPenalty = a7;
    v99->_audioMultiplierForFreeUsers = a8;
    v99->_audioMultiplierForTrialUsers = a9;
    v99->_audioMultiplierForPaidUsers = a17;
    v99->_autofavoritedVoteCoefficient = a18;
    v99->_baselineRatePrior = a19;
    v99->_bundleFreeMultiplierForFreeUsers = a20;
    v99->_bundleFreeMultiplierForTrialUsers = a21;
    v99->_bundleFreeMultiplierForPaidUsers = a22;
    v99->_bundlePaidMultiplierForFreeUsers = a23;
    v99->_bundlePaidMultiplierForTrialUsers = a24;
    v99->_bundlePaidMultiplierForPaidUsers = a25;
    v99->_conversionCoefficientForFreeUsers = a26;
    v99->_conversionCoefficientForTrialUsers = a27;
    v99->_conversionCoefficientForPaidUsers = a28;
    objc_storeStrong((id *)&v99->_conversionCohort, a11);
    v100->_ctrWithOneAutofavorited = a29;
    v100->_ctrWithOneSubscribed = a30;
    v100->_ctrWithSubscribedChannel = a31;
    v100->_ctrWithThreeAutofavorited = a32;
    v100->_ctrWithThreeSubscribed = a33;
    v100->_ctrWithTwoAutofavorited = a34;
    v100->_ctrWithTwoSubscribed = a35;
    v100->_ctrWithZeroAutofavorited = a36;
    v100->_ctrWithZeroSubscribed = a37;
    v100->_decayFactor = a38;
    v100->_featuredMultiplierForFreeUsers = a39;
    v100->_featuredMultiplierForTrialUsers = a40;
    v100->_featuredMultiplierForPaidUsers = a41;
    v100->_evergreenMultiplierForFreeUsers = a42;
    v100->_evergreenMultiplierForTrialUsers = a43;
    v100->_evergreenMultiplierForPaidUsers = a44;
    v100->_globalScoreCoefficientFree = a45;
    v100->_globalScoreCoefficientPaid = a46;
    v100->_globalScoreCoefficientHalfLife = a47;
    v100->_globalScoreCoefficientInitialMultiplier = a48;
    v100->_globalScoreDemocratizationFactor = a49;
    v100->_localScoreDemocratizationFactor = a50;
    v100->_conversionScoreDemocratizationFactor = a51;
    v100->_headlineSeenPenalty = a52;
    v100->_halfLifeCoefficient = a53;
    v100->_respectHalfLifeOverride = a12;
    v100->_evergreenHalfLifeCoefficient = a55;
    v100->_mutedVoteCoefficient = a56;
    v100->_personalizationCoefficient = a57;
    v100->_publisherAggregateWeight = a58;
    v100->_sparseTagsPenalty = a59;
    v100->_subscribedChannelScoreCoefficient = a60;
    v100->_subscribedTopicsScoreCoefficient = a61;
    objc_storeStrong((id *)&v100->_userCohort, a13);
    v100->_userFeedbackHalfLifeCoefficient = a54;
    v100->_lowFlowBoostFetchCountWeight = a62;
    v100->_lowFlowBoostFactor = a63;
    v100->_lowFlowBoostMaxProductFactor = a64;
    objc_storeStrong((id *)&v100->_lowFlowBoostFetchEstimationConfig, a14);
    objc_storeStrong((id *)&v100->_lowFlowBoostEventEstimationConfig, a15);
    v100->_nicheContentBaselineMembershipMultiplier = a65;
    v100->_nicheContentDefaultFlowRate = a67;
    v100->_nicheContentBoostOnlyAboveBaselineMembership = a16;
    v100->_nicheContentManagedTopicBoostAllTags = a66;
    v100->_nicheContentDefaultSubscriptionRate = a68;
    v100->_nicheContentExcludeNonGroupableTopics = a69;
    v100->_nicheContentShouldBoostPublisher = a70;
    v100->_nicheContentTopicFlowExponent = a71;
    v100->_nicheContentPublisherFlowExponent = a72;
    v100->_nicheContentManagedTopicBoost = a73;
    v100->_nicheContentServerFlowWeight = a74;
    v100->_nicheContentTopicSubscriptionExponent = a75;
    v100->_nicheContentPublisherSubscriptionExponent = a76;
    v100->_nicheContentQualityThreshold = a77;
    v100->_contentTriggerMaxEventCount = a78;
    v100->_contentTriggerScoreExponent = a79;
    v100->_contentTriggerTagWeightExponent = a80;
    v100->_contentTriggerMinScoreWeight = a81;
    *(_QWORD *)&v100->_contentTriggerMaxDampener = v102;
    *(_QWORD *)&v100->_contentTriggerDampenerCoefficient = v103;
    *(_QWORD *)&v100->_personalizedMultiplierBaselineMembership = v104;
    *(_QWORD *)&v100->_personalizedMultiplierPreBaselineCurvature = v105;
    *(_QWORD *)&v100->_personalizedMultiplierPostBaselineCurvature = v106;
    *(_QWORD *)&v100->_personalizedMultiplierMembershipDampener = v107;
    *(_QWORD *)&v100->_publisherDampenerWeight = v108;
    *(_QWORD *)&v100->_recentlyFollowedDurationThreshold = v109;
    *(_QWORD *)&v100->_recentlyFollowedMultiplier = v110;
    *(_QWORD *)&v100->_tabiScoreCoefficient = v111;
    *(_QWORD *)&v100->_clientSideEngagementBoostFeaturedArticleMultiplier = v112;
    *(_QWORD *)&v100->_clientSideEngagementBoostFeatureCandidateArticleMultiplier = v113;
    *(_QWORD *)&v100->_clientSideEngagementBoostFreeCohortCTRCap = v114;
    *(_QWORD *)&v100->_clientSideEngagementBoostPaidCohortCTRCap = v115;
    *(_QWORD *)&v100->_clientSideEngagementBoostTagQualityMultiplier = v116;
    *(_QWORD *)&v100->_clientSideEngagementBoostReduceVisibilityMultiplier = v117;
    *(_QWORD *)&v100->_clientSideEngagementBoostANFMutiplier = v118;
    v100->_dampenerEnabled = v119;
    v100->_multiplierEnabled = v120;
    *(_QWORD *)&v100->_peopleAlsoReadBaselineScore = v121;
    *(_QWORD *)&v100->_peopleAlsoReadConditionalScoreCoefficient = v122;
    *(_QWORD *)&v100->_peopleAlsoReadScoreCoefficient = v123;
  }

  return v100;
}

- (BOOL)respectHalfLifeOverride
{
  return self->_respectHalfLifeOverride;
}

- (BOOL)nicheContentShouldBoostPublisher
{
  return self->_nicheContentShouldBoostPublisher;
}

- (BOOL)nicheContentManagedTopicBoostAllTags
{
  return self->_nicheContentManagedTopicBoostAllTags;
}

- (BOOL)nicheContentExcludeNonGroupableTopics
{
  return self->_nicheContentExcludeNonGroupableTopics;
}

- (BOOL)nicheContentBoostOnlyAboveBaselineMembership
{
  return self->_nicheContentBoostOnlyAboveBaselineMembership;
}

- (double)nicheContentBaselineMembershipMultiplier
{
  return self->_nicheContentBaselineMembershipMultiplier;
}

- (BOOL)multiplierEnabled
{
  return self->_multiplierEnabled;
}

- (double)globalScoreCoefficientInitialMultiplier
{
  return self->_globalScoreCoefficientInitialMultiplier;
}

- (double)featuredMultiplierForTrialUsers
{
  return self->_featuredMultiplierForTrialUsers;
}

- (double)featuredMultiplierForPaidUsers
{
  return self->_featuredMultiplierForPaidUsers;
}

- (double)featuredMultiplierForFreeUsers
{
  return self->_featuredMultiplierForFreeUsers;
}

- (double)evergreenMultiplierForTrialUsers
{
  return self->_evergreenMultiplierForTrialUsers;
}

- (double)evergreenMultiplierForPaidUsers
{
  return self->_evergreenMultiplierForPaidUsers;
}

- (double)evergreenMultiplierForFreeUsers
{
  return self->_evergreenMultiplierForFreeUsers;
}

- (BOOL)dampenerEnabled
{
  return self->_dampenerEnabled;
}

- (double)bundlePaidMultiplierForTrialUsers
{
  return self->_bundlePaidMultiplierForTrialUsers;
}

- (double)bundlePaidMultiplierForPaidUsers
{
  return self->_bundlePaidMultiplierForPaidUsers;
}

- (double)bundlePaidMultiplierForFreeUsers
{
  return self->_bundlePaidMultiplierForFreeUsers;
}

- (double)bundleFreeMultiplierForTrialUsers
{
  return self->_bundleFreeMultiplierForTrialUsers;
}

- (double)bundleFreeMultiplierForPaidUsers
{
  return self->_bundleFreeMultiplierForPaidUsers;
}

- (double)bundleFreeMultiplierForFreeUsers
{
  return self->_bundleFreeMultiplierForFreeUsers;
}

- (double)audioMultiplierForTrialUsers
{
  return self->_audioMultiplierForTrialUsers;
}

- (double)audioMultiplierForPaidUsers
{
  return self->_audioMultiplierForPaidUsers;
}

- (double)audioMultiplierForFreeUsers
{
  return self->_audioMultiplierForFreeUsers;
}

- (FCPersonalizationCohortConfig)userCohort
{
  return self->_userCohort;
}

- (FCPersonalizationCohortConfig)conversionCohort
{
  return self->_conversionCohort;
}

- (FCPersonalizationLowFlowEstimationConfig)lowFlowBoostFetchEstimationConfig
{
  return self->_lowFlowBoostFetchEstimationConfig;
}

- (FCPersonalizationLowFlowEstimationConfig)lowFlowBoostEventEstimationConfig
{
  return self->_lowFlowBoostEventEstimationConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowFlowBoostEventEstimationConfig, 0);
  objc_storeStrong((id *)&self->_lowFlowBoostFetchEstimationConfig, 0);
  objc_storeStrong((id *)&self->_userCohort, 0);
  objc_storeStrong((id *)&self->_conversionCohort, 0);
}

- (FCPersonalizationScoringConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPersonalizationScoringConfig *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  FCPersonalizationCohortConfig *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v34;
  double v36;
  double v37;
  double v39;
  double v41;
  double v43;
  double v45;
  double v46;
  double v47;
  double v48;
  double v50;
  double v52;
  double v53;
  double v55;
  double v57;
  FCPersonalizationCohortConfig *v59;
  double v60;
  double v62;
  FCPersonalizationLowFlowEstimationConfig *v63;
  void *v64;
  FCPersonalizationLowFlowEstimationConfig *v65;
  FCPersonalizationLowFlowEstimationConfig *v66;
  void *v67;
  FCPersonalizationLowFlowEstimationConfig *v68;
  FCPersonalizationScoringConfig *v69;
  double v71;
  double v72;
  unsigned int v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  FCPersonalizationCohortConfig *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  unsigned int v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  FCPersonalizationCohortConfig *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  FCPersonalizationScoringConfig *v132;
  objc_super v133;

  v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)FCPersonalizationScoringConfig;
  v5 = -[FCPersonalizationScoringConfig init](&v133, sel_init);
  if (v5)
  {
    v132 = v5;
    v6 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("anfMultiplier"), 1.0);
    if (v6 < 0.0)
      v6 = 1.0;
    v131 = v6;
    v7 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("articleEmbeddingScoreCoefficient"), 0.0);
    if (v7 < 0.0)
      v7 = 0.0;
    v130 = v7;
    v8 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("articleEmbeddingScoreDampenerWeight"), 0.0);
    if (v8 < 0.0)
      v8 = 0.0;
    v129 = v8;
    v9 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("articleLengthAggregateWeight"), 1.0);
    if (v9 < 0.0)
      v9 = 1.0;
    v128 = v9;
    v10 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("articleReadPenalty"), 0.0);
    if (v10 > 1.0 || v10 < 0.0)
      v10 = 0.0;
    v127 = v10;
    v12 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("articleListenedPenalty"), 0.0);
    if (v12 > 1.0 || v12 < 0.0)
      v12 = 0.0;
    v126 = v12;
    v125 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("audioMultiplierForAUsers"), 1.1);
    v124 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("audioMultiplierForBUsers"), 1.1);
    v123 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("audioMultiplierForCUsers"), 1.1);
    v14 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("autofavoritedVoteCoefficient"), 0.06);
    if (v14 > 1.0 || v14 < 0.0)
      v14 = 0.06;
    v122 = v14;
    v16 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("baselineRatePrior"), 0.0166666667);
    if (v16 < 0.0)
      v16 = 0.0166666667;
    v121 = v16;
    v120 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("bundleFreeMultiplierForAUsers"), 1.1);
    v119 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("bundleFreeMultiplierForBUsers"), 1.1);
    v118 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("bundleFreeMultiplierForCUsers"), 1.1);
    v117 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("bundlePaidMultiplierForAUsers"), 1.1);
    v115 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("bundlePaidMultiplierForBUsers"), 1.1);
    v114 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("bundlePaidMultiplierForCUsers"), 1.1);
    v17 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("conversionCoefficientForFreeUsers"), 0.0);
    if (v17 < 0.0)
      v17 = 0.0;
    v113 = v17;
    v18 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("conversionCoefficientForTrialUsers"), 0.0);
    if (v18 < 0.0)
      v18 = 0.0;
    v112 = v18;
    v19 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("conversionCoefficientForPaidUsers"), 0.0);
    if (v19 < 0.0)
      v19 = 0.0;
    v111 = v19;
    v20 = [FCPersonalizationCohortConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("conversionCohort"), 0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = -[FCPersonalizationCohortConfig initWithConfigDictionary:](v20, "initWithConfigDictionary:", v116);
    v21 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithOneAutofavorited"), 0.004);
    if (v21 < 0.0)
      v21 = 0.004;
    v109 = v21;
    v22 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithOneSubscribed"), 0.015);
    if (v22 < 0.0)
      v22 = 0.015;
    v108 = v22;
    v23 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithSubscribedChannel"), 0.02);
    if (v23 < 0.0)
      v23 = 0.02;
    v107 = v23;
    v24 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithThreeAutofavorited"), 0.012);
    if (v24 < 0.0)
      v24 = 0.012;
    v106 = v24;
    v25 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithThreeSubscribed"), 0.025);
    if (v25 < 0.0)
      v25 = 0.025;
    v105 = v25;
    v26 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithTwoAutofavorited"), 0.008);
    if (v26 < 0.0)
      v26 = 0.008;
    v104 = v26;
    v27 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithTwoSubscribed"), 0.02);
    if (v27 < 0.0)
      v27 = 0.02;
    v103 = v27;
    v28 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithZeroAutofavorited"), 0.0005);
    if (v28 < 0.0)
      v28 = 0.0005;
    v102 = v28;
    v29 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("ctrWithZeroSubscribed"), 0.001);
    if (v29 < 0.0)
      v29 = 0.001;
    v101 = v29;
    v30 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("decayFactor"), 0.99);
    if (v30 >= 1.0 || v30 < 0.0)
      v30 = 0.99;
    v100 = v30;
    v99 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("featuredMultiplierForAUsers"), 1.1);
    v98 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("featuredMultiplierForBUsers"), 1.1);
    v97 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("featuredMultiplierForCUsers"), 1.1);
    v96 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("evergreenMultiplierForAUsers"), 1.0);
    v95 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("evergreenMultiplierForBUsers"), 1.0);
    v94 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("evergreenMultiplierForCUsers"), 1.0);
    v32 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalScoreCoefficientFree"), 0.64);
    if (v32 > 1.0 || v32 < 0.0)
      v32 = 0.64;
    v93 = v32;
    v34 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalScoreCoefficientPaid"), 0.64);
    if (v34 > 1.0 || v34 < 0.0)
      v34 = 0.64;
    v92 = v34;
    v36 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalScoreCoefficientHalfLife"), 50.0);
    if (v36 <= 0.0)
      v36 = 50.0;
    v91 = v36;
    v90 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalScoreCoefficientInitialMultiplier"), 2.0);
    v37 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalScoreDemocratizationFactor"), 1.0);
    if (v37 > 1.0 || v37 < 0.0)
      v37 = 1.0;
    v88 = v37;
    v39 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("localScoreDemocratizationFactor"), 1.0);
    if (v39 > 1.0 || v39 < 0.0)
      v39 = 1.0;
    v87 = v39;
    v41 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("conversionScoreDemocratizationFactor"), 1.0);
    if (v41 > 1.0 || v41 < 0.0)
      v41 = 1.0;
    v86 = v41;
    v43 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("headlineSeenPenalty"), 0.0);
    if (v43 > 1.0 || v43 < 0.0)
      v43 = 0.0;
    v85 = v43;
    v45 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("halfLifeCoefficient"), 1.0);
    if (v45 < 0.0)
      v45 = 1.0;
    v84 = v45;
    v46 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("userFeedbackHalfLifeCoefficient"), 0.0);
    if (v46 < 0.0)
      v46 = 0.0;
    v82 = v46;
    v47 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("evergreenHalfLifeCoefficient"), 0.0);
    if (v47 < 0.0)
      v47 = 0.0;
    v81 = v47;
    v89 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("respectHalfLifeOverride"), 0);
    v48 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("mutedVoteCoefficient"), 0.2);
    if (v48 > 1.0 || v48 < 0.0)
      v48 = 0.2;
    v79 = v48;
    v50 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("personalizationCoefficient"), 0.14);
    if (v50 > 1.0 || v50 < 0.0)
      v50 = 0.14;
    v78 = v50;
    v52 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("publisherAggregateWeight"), 1.0);
    if (v52 < 0.0)
      v52 = 1.0;
    v77 = v52;
    v53 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("sparseTagsPenalty"), 0.0);
    if (v53 > 1.0 || v53 < 0.0)
      v53 = 0.0;
    v76 = v53;
    v55 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("subscribedChannelScoreCoefficient"), 0.0);
    if (v55 > 1.0 || v55 < 0.0)
      v55 = 0.0;
    v75 = v55;
    v57 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("subscribedTopicsScoreCoefficient"), 0.0);
    if (v57 > 1.0 || v57 < 0.0)
      v57 = 0.0;
    v74 = v57;
    v59 = [FCPersonalizationCohortConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("userCohort"), 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = -[FCPersonalizationCohortConfig initWithConfigDictionary:](v59, "initWithConfigDictionary:", v83);
    v60 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("lowFlowBoostFetchCountWeight"), 0.5);
    if (v60 > 1.0 || v60 < 0.0)
      v60 = 0.5;
    v72 = v60;
    v62 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("lowFlowBoostFactor"), 0.0);
    if (v62 < 0.0)
      v62 = 0.0;
    v71 = v62;
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("lowFlowBoostMaxProductFactor"), 0.1);
    v63 = [FCPersonalizationLowFlowEstimationConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("lowFlowBoostFetchEstimationConfig"), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[FCPersonalizationLowFlowEstimationConfig initWithConfigDictionary:](v63, "initWithConfigDictionary:", v64);
    v66 = [FCPersonalizationLowFlowEstimationConfig alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("lowFlowBoostEventEstimationConfig"), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[FCPersonalizationLowFlowEstimationConfig initWithConfigDictionary:](v66, "initWithConfigDictionary:", v67);
    v73 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("nicheContentBoostOnlyAboveBaselineMembership"), 1);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentBaselineMembershipMultiplier"), 1.0);
    FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("nicheContentManagedTopicBoostAllTags"), 0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentDefaultFlowRate"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentDefaultSubscriptionRate"), 0.0);
    FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("nicheContentExcludeNonGroupableTopics"), 1);
    FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("nicheContentShouldBoostPublisher"), 1);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentTopicFlowExponent"), 2.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentPublisherFlowExponent"), 2.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentManagedTopicBoost"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentServerFlowWeight"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentTopicSubscriptionExponent"), 1.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentPublisherSubscriptionExponent"), 1.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("nicheContentQualityThreshold"), 0.06);
    FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("contentTriggerMaxEventCount"), 50);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("contentTriggerScoreExponent"), 1.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("contentTriggerTagWeightExponent"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("contentTriggerMinScoreWeight"), 1.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("contentTriggerMaxDampener"), 1.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("contentTriggerDampenerCoefficient"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("personalizedMultiplierBaselineMembership"), 0.2);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("personalizedMultiplierPreBaselineCurvature"), 2.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("personalizedMultiplierPostBaselineCurvature"), 2.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("personalizedMultiplierMembershipDampener"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("publisherDampenerWeight"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("recentlyFollowedDurationThreshold"), 43200.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("recentlyFollowedMultiplier"), 1.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("tabiScoreCoefficient"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("clientSideEngagementBoostFeaturedArticleMultiplier"), 1.1);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("clientSideEngagementBoostFeatureCandidateArticleMultiplier"), 1.1);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("clientSideEngagementBoostFreeCohortCTRCap"), 0.75);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("clientSideEngagementBoostPaidCohortCTRCap"), 0.5);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("clientSideEngagementBoostTagQualityMultiplier"), 1.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("clientSideEngagementBoostReduceVisibilityMultiplier"), 0.1);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("clientSideEngagementBoostANFMutiplier"), 1.5);
    FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("dampenerEnabled"), 1);
    FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("multiplierEnabled"), 1);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("peopleAlsoReadBaselineScore"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("peopleAlsoReadConditionalScoreCoefficient"), 0.0);
    FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("peopleAlsoReadScoreCoefficient"), 0.0);
    v69 = objc_retain(-[FCPersonalizationScoringConfig initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:](v132, "initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTop"
              "icBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroup"
              "ableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponen"
              "t:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheCo"
              "ntentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTrigger"
              "ScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:conte"
              "ntTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCur"
              "vature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampe"
              "nerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEnga"
              "gementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSide"
              "EngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQual"
              "ityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:da"
              "mpenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peop"
              "leAlsoReadScoreCoefficient:",
              v110,
              v89,
              v80,
              v65,
              v68,
              v73,
              v131,
              v130,
              v129,
              v128,
              v127,
              v126,
              v125,
              v124,
              *(_QWORD *)&v123,
              *(_QWORD *)&v122,
              *(_QWORD *)&v121,
              *(_QWORD *)&v120,
              *(_QWORD *)&v119,
              *(_QWORD *)&v118,
              *(_QWORD *)&v117,
              *(_QWORD *)&v115,
              *(_QWORD *)&v114,
              *(_QWORD *)&v113,
              *(_QWORD *)&v112,
              *(_QWORD *)&v111,
              *(_QWORD *)&v109,
              *(_QWORD *)&v108,
              *(_QWORD *)&v107,
              *(_QWORD *)&v106,
              *(_QWORD *)&v105,
              *(_QWORD *)&v104,
              *(_QWORD *)&v103,
              *(_QWORD *)&v102,
              *(_QWORD *)&v101,
              *(_QWORD *)&v100,
              *(_QWORD *)&v99,
              *(_QWORD *)&v98,
              *(_QWORD *)&v97,
              *(_QWORD *)&v96,
              *(_QWORD *)&v95,
              *(_QWORD *)&v94,
              *(_QWORD *)&v93,
              *(_QWORD *)&v92,
              *(_QWORD *)&v91,
              *(_QWORD *)&v90,
              *(_QWORD *)&v88,
              *(_QWORD *)&v87,
              *(_QWORD *)&v86,
              *(_QWORD *)&v85,
              *(_QWORD *)&v84,
              *(_QWORD *)&v82,
              *(_QWORD *)&v81,
              *(_QWORD *)&v79,
              *(_QWORD *)&v78,
              *(_QWORD *)&v77,
              *(_QWORD *)&v76,
              *(_QWORD *)&v75,
              *(_QWORD *)&v74,
              *(_QWORD *)&v72,
              *(_QWORD *)&v71));

  }
  else
  {
    v69 = 0;
  }

  return v69;
}

- (FCPersonalizationScoringConfig)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPersonalizationScoringConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationScoringConfig.m";
    v11 = 1024;
    v12 = 16;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationScoringConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationScoringConfig)initWithCoder:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  FCPersonalizationScoringConfig *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;

  v3 = a3;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("anfMultiplier"));
  v121 = v4;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("articleEmbeddingScoreCoefficient"));
  v120 = v5;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("articleEmbeddingScoreDampenerWeight"));
  v119 = v6;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("articleLengthAggregateWeight"));
  v118 = v7;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("articleReadPenalty"));
  v117 = v8;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("articleListenedPenalty"));
  v116 = v9;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("audioMultiplierForFreeUsers"));
  v115 = v10;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("audioMultiplierForTrialUsers"));
  v114 = v11;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("audioMultiplierForPaidUsers"));
  v113 = v12;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("autofavoritedVoteCoefficient"));
  v112 = v13;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("baselineRatePrior"));
  v111 = v14;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("bundleFreeMultiplierForFreeUsers"));
  v110 = v15;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("bundleFreeMultiplierForTrialUsers"));
  v109 = v16;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("bundleFreeMultiplierForPaidUsers"));
  v108 = v17;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("bundlePaidMultiplierForFreeUsers"));
  v107 = v18;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("bundlePaidMultiplierForTrialUsers"));
  v106 = v19;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("bundlePaidMultiplierForPaidUsers"));
  v105 = v20;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("conversionCoefficientForFreeUsers"));
  v104 = v21;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("conversionCoefficientForTrialUsers"));
  v102 = v22;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("conversionCoefficientForPaidUsers"));
  v101 = v23;
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("conversionCohort"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithOneAutofavorited"));
  v100 = v24;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithOneSubscribed"));
  v99 = v25;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithSubscribedChannel"));
  v98 = v26;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithThreeAutofavorited"));
  v97 = v27;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithThreeSubscribed"));
  v96 = v28;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithTwoAutofavorited"));
  v95 = v29;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithTwoSubscribed"));
  v94 = v30;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithZeroAutofavorited"));
  v93 = v31;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("ctrWithZeroSubscribed"));
  v92 = v32;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("decayFactor"));
  v91 = v33;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("featuredMultiplierForFreeUsers"));
  v90 = v34;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("featuredMultiplierForTrialUsers"));
  v89 = v35;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("featuredMultiplierForPaidUsers"));
  v88 = v36;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("evergreenMultiplierForFreeUsers"));
  v87 = v37;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("evergreenMultiplierForTrialUsers"));
  v86 = v38;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("evergreenMultiplierForPaidUsers"));
  v85 = v39;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("globalScoreCoefficientFree"));
  v84 = v40;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("globalScoreCoefficientPaid"));
  v82 = v41;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("globalScoreCoefficientHalfLife"));
  v81 = v42;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("globalScoreCoefficientInitialMultiplier"));
  v80 = v43;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("globalScoreDemocratizationFactor"));
  v79 = v44;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("localScoreDemocratizationFactor"));
  v78 = v45;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("conversionScoreDemocratizationFactor"));
  v77 = v46;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("headlineSeenPenalty"));
  v76 = v47;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("halfLifeCoefficient"));
  v75 = v48;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("userFeedbackHalfLifeCoefficient"));
  v74 = v49;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("evergreenHalfLifeCoefficient"));
  v73 = v50;
  v83 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("respectHalfLifeOverride"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("mutedVoteCoefficient"));
  v71 = v51;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("personalizationCoefficient"));
  v70 = v52;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("publisherAggregateWeight"));
  v69 = v53;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("sparseTagsPenalty"));
  v68 = v54;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("subscribedChannelScoreCoefficient"));
  v67 = v55;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("subscribedTopicsScoreCoefficient"));
  v66 = v56;
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("userCohort"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("lowFlowBoostFetchCountWeight"));
  v65 = v58;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("lowFlowBoostFactor"));
  v64 = v59;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("lowFlowBoostMaxProductFactor"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("lowFlowBoostFetchEstimationConfig"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("lowFlowBoostEventEstimationConfig"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("nicheContentBoostOnlyAboveBaselineMembership"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentBaselineMembershipMultiplier"));
  objc_msgSend(v3, "decodeBoolForKey:", CFSTR("nicheContentManagedTopicBoostAllTags"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentDefaultFlowRate"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentDefaultSubscriptionRate"));
  objc_msgSend(v3, "decodeBoolForKey:", CFSTR("nicheContentExcludeNonGroupableTopics"));
  objc_msgSend(v3, "decodeBoolForKey:", CFSTR("nicheContentShouldBoostPublisher"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentTopicFlowExponent"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentPublisherFlowExponent"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentManagedTopicBoost"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentServerFlowWeight"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentTopicSubscriptionExponent"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentPublisherSubscriptionExponent"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("nicheContentQualityThreshold"));
  objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("contentTriggerMaxEventCount"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("contentTriggerScoreExponent"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("contentTriggerTagWeightExponent"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("contentTriggerMinScoreWeight"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("contentTriggerMaxDampener"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("contentTriggerDampenerCoefficient"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("personalizedMultiplierBaselineMembership"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("personalizedMultiplierPreBaselineCurvature"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("personalizedMultiplierPostBaselineCurvature"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("personalizedMultiplierMembershipDampener"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("publisherDampenerWeight"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("recentlyFollowedDurationThreshold"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("recentlyFollowedMultiplier"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("tabiScoreCoefficient"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("clientSideEngagementBoostFeaturedArticleMultiplier"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("clientSideEngagementBoostFeatureCandidateArticleMultiplier"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("clientSideEngagementBoostFreeCohortCTRCap"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("clientSideEngagementBoostPaidCohortCTRCap"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("clientSideEngagementBoostTagQualityMultiplier"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("clientSideEngagementBoostReduceVisibilityMultiplier"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("clientSideEngagementBoostANFMutiplier"));
  objc_msgSend(v3, "decodeBoolForKey:", CFSTR("dampenerEnabled"));
  objc_msgSend(v3, "decodeBoolForKey:", CFSTR("multiplierEnabled"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("peopleAlsoReadBaselineScore"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("peopleAlsoReadConditionalScoreCoefficient"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("peopleAlsoReadScoreCoefficient"));

  v62 = -[FCPersonalizationScoringConfig initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponent:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTopicSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMaxEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTriggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultiplierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clientSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clientSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQualityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:dampenerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlsoReadScoreCoefficient:](self, "initWithAnfMultiplier:articleEmbeddingScoreCoefficient:articleEmbeddingScoreDampenerWeight:articleLengthAggregateWeight:articleReadPenalty:articleListenedPenalty:audioMultiplierForFreeUsers:audioMultiplierForTrialUsers:audioMultiplierForPaidUsers:autofavoritedVoteCoefficient:baselineRatePrior:bundleFreeMultiplierForFreeUsers:bundleFreeMultiplierForTrialUsers:bundleFreeMultiplierForPaidUsers:bundlePaidMultiplierForFreeUsers:bundlePaidMultiplierForTrialUsers:bundlePaidMultiplierForPaidUsers:conversionCoefficientForFreeUsers:conversionCoefficientForTrialUsers:conversionCoefficientForPaidUsers:conversionCohort:ctrWithOneAutofavorited:ctrWithOneSubscribed:ctrWithSubscribedChannel:ctrWithThreeAutofavorited:ctrWithThreeSubscribed:ctrWithTwoAutofavorited:ctrWithTwoSubscribed:ctrWithZeroAutofavorited:ctrWithZeroSubscribed:decayFactor:featuredMultiplierForFreeUsers:featuredMultiplierForTrialUsers:featuredMultiplierForPaidUsers:evergreenMultiplierForFreeUsers:evergreenMultiplierForTrialUsers:evergreenMultiplierForPaidUsers:globalScoreCoefficientFree:globalScoreCoefficientPaid:globalScoreCoefficientHalfLife:globalScoreCoefficientInitialMultiplier:globalScoreDemocratizationFactor:localScoreDemocratizationFactor:conversionScoreDemocratizationFactor:headlineSeenPenalty:halfLifeCoefficient:userFeedbackHalfLifeCoefficient:evergreenHalfLifeCoefficient:respectHalfLifeOverride:mutedVoteCoefficient:personalizationCoefficient:publisherAggregateWeight:sparseTagsPenalty:subscribedChannelScoreCoefficient:subscribedTopicsScoreCoefficient:userCohort:lowFlowBoostFetchCountWeight:lowFlowBoostFactor:lowFlowBoostMaxProductFactor:lowFlowBoostFetchEstimationConfig:lowFlowBoostEventEstimationConfig:nicheContentBoostOnlyAboveBaselineMembership:nicheContentBaselineMembershipMultiplier:nicheContentManagedTopicBoostAllTags:nicheContentDefaultFlowRate:nicheContentDefaultSubscriptionRate:nicheContentExcludeNonGroupableTopics:nicheContentShouldBoostPublisher:nicheContentTopicFlowExponen"
          "t:nicheContentPublisherFlowExponent:nicheContentManagedTopicBoost:nicheContentServerFlowWeight:nicheContentTop"
          "icSubscriptionExponent:nicheContentPublisherSubscriptionExponent:nicheContentQualityThreshold:contentTriggerMa"
          "xEventCount:contentTriggerScoreExponent:contentTriggerTagWeightExponent:contentTriggerMinScoreWeight:contentTr"
          "iggerMaxDampener:contentTriggerDampenerCoefficient:personalizedMultiplierBaselineMembership:personalizedMultip"
          "lierPreBaselineCurvature:personalizedMultiplierPostBaselineCurvature:personalizedMultiplierMembershipDampener:"
          "publisherDampenerWeight:recentlyFollowedDurationThreshold:recentlyFollowedMultiplier:tabiScoreCoefficient:clie"
          "ntSideEngagementBoostFeaturedArticleMultiplier:clientSideEngagementBoostFeatureCandidateArticleMultiplier:clie"
          "ntSideEngagementBoostFreeCohortCTRCap:clientSideEngagementBoostPaidCohortCTRCap:clientSideEngagementBoostTagQu"
          "alityMultiplier:clientSideEngagementBoostReduceVisibilityMultiplier:clientSideEngagementBoostANFMutiplier:damp"
          "enerEnabled:multiplierEnabled:peopleAlsoReadBaselineScore:peopleAlsoReadConditionalScoreCoefficient:peopleAlso"
          "ReadScoreCoefficient:",
          v103,
          v83,
          v57,
          v60,
          v61,
          v72,
          v121,
          v120,
          v119,
          v118,
          v117,
          v116,
          v115,
          v114,
          v113,
          v112,
          v111,
          v110,
          v109,
          v108,
          v107,
          v106,
          v105,
          v104,
          v102,
          v101,
          v100,
          v99,
          v98,
          v97,
          v96,
          v95,
          v94,
          v93,
          v92,
          v91,
          v90,
          v89,
          v88,
          v87,
          v86,
          v85,
          v84,
          v82,
          v81,
          v80,
          v79,
          v78,
          v77,
          v76,
          v75,
          v74,
          v73,
          v71,
          v70,
          v69,
          v68,
          v67,
          v66,
          v65,
          v64);

  return v62;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FCPersonalizationScoringConfig anfMultiplier](self, "anfMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("anfMultiplier"));
  -[FCPersonalizationScoringConfig articleEmbeddingScoreCoefficient](self, "articleEmbeddingScoreCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("articleEmbeddingScoreCoefficient"));
  -[FCPersonalizationScoringConfig articleEmbeddingScoreDampenerWeight](self, "articleEmbeddingScoreDampenerWeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("articleEmbeddingScoreDampenerWeight"));
  -[FCPersonalizationScoringConfig articleLengthAggregateWeight](self, "articleLengthAggregateWeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("articleLengthAggregateWeight"));
  -[FCPersonalizationScoringConfig articleReadPenalty](self, "articleReadPenalty");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("articleReadPenalty"));
  -[FCPersonalizationScoringConfig articleListenedPenalty](self, "articleListenedPenalty");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("articleListenedPenalty"));
  -[FCPersonalizationScoringConfig audioMultiplierForFreeUsers](self, "audioMultiplierForFreeUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("audioMultiplierForAUsers"));
  -[FCPersonalizationScoringConfig audioMultiplierForTrialUsers](self, "audioMultiplierForTrialUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("audioMultiplierForBUsers"));
  -[FCPersonalizationScoringConfig audioMultiplierForPaidUsers](self, "audioMultiplierForPaidUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("audioMultiplierForCUsers"));
  -[FCPersonalizationScoringConfig autofavoritedVoteCoefficient](self, "autofavoritedVoteCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("autofavoritedVoteCoefficient"));
  -[FCPersonalizationScoringConfig baselineRatePrior](self, "baselineRatePrior");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("baselineRatePrior"));
  -[FCPersonalizationScoringConfig bundleFreeMultiplierForFreeUsers](self, "bundleFreeMultiplierForFreeUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bundleFreeMultiplierForFreeUsers"));
  -[FCPersonalizationScoringConfig bundleFreeMultiplierForTrialUsers](self, "bundleFreeMultiplierForTrialUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bundleFreeMultiplierForTrialUsers"));
  -[FCPersonalizationScoringConfig bundleFreeMultiplierForPaidUsers](self, "bundleFreeMultiplierForPaidUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bundleFreeMultiplierForPaidUsers"));
  -[FCPersonalizationScoringConfig bundlePaidMultiplierForFreeUsers](self, "bundlePaidMultiplierForFreeUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bundlePaidMultiplierForFreeUsers"));
  -[FCPersonalizationScoringConfig bundlePaidMultiplierForTrialUsers](self, "bundlePaidMultiplierForTrialUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bundlePaidMultiplierForTrialUsers"));
  -[FCPersonalizationScoringConfig bundlePaidMultiplierForPaidUsers](self, "bundlePaidMultiplierForPaidUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("bundlePaidMultiplierForPaidUsers"));
  -[FCPersonalizationScoringConfig conversionCoefficientForFreeUsers](self, "conversionCoefficientForFreeUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("conversionCoefficientForFreeUsers"));
  -[FCPersonalizationScoringConfig conversionCoefficientForTrialUsers](self, "conversionCoefficientForTrialUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("conversionCoefficientForTrialUsers"));
  -[FCPersonalizationScoringConfig conversionCoefficientForPaidUsers](self, "conversionCoefficientForPaidUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("conversionCoefficientForPaidUsers"));
  -[FCPersonalizationScoringConfig conversionCohort](self, "conversionCohort");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("conversionCohort"));

  -[FCPersonalizationScoringConfig ctrWithOneAutofavorited](self, "ctrWithOneAutofavorited");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithOneAutofavorited"));
  -[FCPersonalizationScoringConfig ctrWithOneSubscribed](self, "ctrWithOneSubscribed");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithOneSubscribed"));
  -[FCPersonalizationScoringConfig ctrWithSubscribedChannel](self, "ctrWithSubscribedChannel");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithSubscribedChannel"));
  -[FCPersonalizationScoringConfig ctrWithThreeAutofavorited](self, "ctrWithThreeAutofavorited");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithThreeAutofavorited"));
  -[FCPersonalizationScoringConfig ctrWithThreeSubscribed](self, "ctrWithThreeSubscribed");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithThreeSubscribed"));
  -[FCPersonalizationScoringConfig ctrWithTwoAutofavorited](self, "ctrWithTwoAutofavorited");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithTwoAutofavorited"));
  -[FCPersonalizationScoringConfig ctrWithTwoSubscribed](self, "ctrWithTwoSubscribed");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithTwoSubscribed"));
  -[FCPersonalizationScoringConfig ctrWithZeroAutofavorited](self, "ctrWithZeroAutofavorited");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithZeroAutofavorited"));
  -[FCPersonalizationScoringConfig ctrWithZeroSubscribed](self, "ctrWithZeroSubscribed");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ctrWithZeroSubscribed"));
  -[FCPersonalizationScoringConfig decayFactor](self, "decayFactor");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("decayFactor"));
  -[FCPersonalizationScoringConfig featuredMultiplierForFreeUsers](self, "featuredMultiplierForFreeUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("featuredMultiplierForFreeUsers"));
  -[FCPersonalizationScoringConfig featuredMultiplierForTrialUsers](self, "featuredMultiplierForTrialUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("featuredMultiplierForTrialUsers"));
  -[FCPersonalizationScoringConfig featuredMultiplierForPaidUsers](self, "featuredMultiplierForPaidUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("featuredMultiplierForPaidUsers"));
  -[FCPersonalizationScoringConfig evergreenMultiplierForFreeUsers](self, "evergreenMultiplierForFreeUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("evergreenMultiplierForFreeUsers"));
  -[FCPersonalizationScoringConfig evergreenMultiplierForTrialUsers](self, "evergreenMultiplierForTrialUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("evergreenMultiplierForTrialUsers"));
  -[FCPersonalizationScoringConfig evergreenMultiplierForPaidUsers](self, "evergreenMultiplierForPaidUsers");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("evergreenMultiplierForPaidUsers"));
  -[FCPersonalizationScoringConfig globalScoreCoefficientFree](self, "globalScoreCoefficientFree");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("globalScoreCoefficientFree"));
  -[FCPersonalizationScoringConfig globalScoreCoefficientPaid](self, "globalScoreCoefficientPaid");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("globalScoreCoefficientPaid"));
  -[FCPersonalizationScoringConfig globalScoreCoefficientHalfLife](self, "globalScoreCoefficientHalfLife");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("globalScoreCoefficientHalfLife"));
  -[FCPersonalizationScoringConfig globalScoreCoefficientInitialMultiplier](self, "globalScoreCoefficientInitialMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("globalScoreCoefficientInitialMultiplier"));
  -[FCPersonalizationScoringConfig globalScoreDemocratizationFactor](self, "globalScoreDemocratizationFactor");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("globalScoreDemocratizationFactor"));
  -[FCPersonalizationScoringConfig localScoreDemocratizationFactor](self, "localScoreDemocratizationFactor");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("localScoreDemocratizationFactor"));
  -[FCPersonalizationScoringConfig conversionScoreDemocratizationFactor](self, "conversionScoreDemocratizationFactor");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("conversionScoreDemocratizationFactor"));
  -[FCPersonalizationScoringConfig headlineSeenPenalty](self, "headlineSeenPenalty");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("headlineSeenPenalty"));
  -[FCPersonalizationScoringConfig halfLifeCoefficient](self, "halfLifeCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("halfLifeCoefficient"));
  -[FCPersonalizationScoringConfig userFeedbackHalfLifeCoefficient](self, "userFeedbackHalfLifeCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("userFeedbackHalfLifeCoefficient"));
  -[FCPersonalizationScoringConfig evergreenHalfLifeCoefficient](self, "evergreenHalfLifeCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("evergreenHalfLifeCoefficient"));
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig respectHalfLifeOverride](self, "respectHalfLifeOverride"), CFSTR("respectHalfLifeOverride"));
  -[FCPersonalizationScoringConfig mutedVoteCoefficient](self, "mutedVoteCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("mutedVoteCoefficient"));
  -[FCPersonalizationScoringConfig personalizationCoefficient](self, "personalizationCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("personalizationCoefficient"));
  -[FCPersonalizationScoringConfig publisherAggregateWeight](self, "publisherAggregateWeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("publisherAggregateWeight"));
  -[FCPersonalizationScoringConfig sparseTagsPenalty](self, "sparseTagsPenalty");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("sparseTagsPenalty"));
  -[FCPersonalizationScoringConfig subscribedChannelScoreCoefficient](self, "subscribedChannelScoreCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("subscribedChannelScoreCoefficient"));
  -[FCPersonalizationScoringConfig subscribedTopicsScoreCoefficient](self, "subscribedTopicsScoreCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("subscribedTopicsScoreCoefficient"));
  -[FCPersonalizationScoringConfig userCohort](self, "userCohort");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("userCohort"));

  -[FCPersonalizationScoringConfig lowFlowBoostFetchCountWeight](self, "lowFlowBoostFetchCountWeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("lowFlowBoostFetchCountWeight"));
  -[FCPersonalizationScoringConfig lowFlowBoostFactor](self, "lowFlowBoostFactor");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("lowFlowBoostFactor"));
  -[FCPersonalizationScoringConfig lowFlowBoostMaxProductFactor](self, "lowFlowBoostMaxProductFactor");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("lowFlowBoostMaxProductFactor"));
  -[FCPersonalizationScoringConfig lowFlowBoostFetchEstimationConfig](self, "lowFlowBoostFetchEstimationConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("lowFlowBoostFetchEstimationConfig"));

  -[FCPersonalizationScoringConfig lowFlowBoostEventEstimationConfig](self, "lowFlowBoostEventEstimationConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("lowFlowBoostEventEstimationConfig"));

  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentBoostOnlyAboveBaselineMembership](self, "nicheContentBoostOnlyAboveBaselineMembership"), CFSTR("nicheContentBoostOnlyAboveBaselineMembership"));
  -[FCPersonalizationScoringConfig nicheContentBaselineMembershipMultiplier](self, "nicheContentBaselineMembershipMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentBaselineMembershipMultiplier"));
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentManagedTopicBoostAllTags](self, "nicheContentManagedTopicBoostAllTags"), CFSTR("nicheContentManagedTopicBoostAllTags"));
  -[FCPersonalizationScoringConfig nicheContentDefaultFlowRate](self, "nicheContentDefaultFlowRate");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentDefaultFlowRate"));
  -[FCPersonalizationScoringConfig nicheContentDefaultSubscriptionRate](self, "nicheContentDefaultSubscriptionRate");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentDefaultSubscriptionRate"));
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentExcludeNonGroupableTopics](self, "nicheContentExcludeNonGroupableTopics"), CFSTR("nicheContentExcludeNonGroupableTopics"));
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig nicheContentShouldBoostPublisher](self, "nicheContentShouldBoostPublisher"), CFSTR("nicheContentShouldBoostPublisher"));
  -[FCPersonalizationScoringConfig nicheContentTopicFlowExponent](self, "nicheContentTopicFlowExponent");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentTopicFlowExponent"));
  -[FCPersonalizationScoringConfig nicheContentPublisherFlowExponent](self, "nicheContentPublisherFlowExponent");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentPublisherFlowExponent"));
  -[FCPersonalizationScoringConfig nicheContentManagedTopicBoost](self, "nicheContentManagedTopicBoost");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentManagedTopicBoost"));
  -[FCPersonalizationScoringConfig nicheContentServerFlowWeight](self, "nicheContentServerFlowWeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentServerFlowWeight"));
  -[FCPersonalizationScoringConfig nicheContentTopicSubscriptionExponent](self, "nicheContentTopicSubscriptionExponent");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentTopicSubscriptionExponent"));
  -[FCPersonalizationScoringConfig nicheContentPublisherSubscriptionExponent](self, "nicheContentPublisherSubscriptionExponent");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentPublisherSubscriptionExponent"));
  -[FCPersonalizationScoringConfig nicheContentQualityThreshold](self, "nicheContentQualityThreshold");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nicheContentQualityThreshold"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[FCPersonalizationScoringConfig contentTriggerMaxEventCount](self, "contentTriggerMaxEventCount"), CFSTR("contentTriggerMaxEventCount"));
  -[FCPersonalizationScoringConfig contentTriggerScoreExponent](self, "contentTriggerScoreExponent");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("contentTriggerScoreExponent"));
  -[FCPersonalizationScoringConfig contentTriggerTagWeightExponent](self, "contentTriggerTagWeightExponent");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("contentTriggerTagWeightExponent"));
  -[FCPersonalizationScoringConfig contentTriggerMinScoreWeight](self, "contentTriggerMinScoreWeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("contentTriggerMinScoreWeight"));
  -[FCPersonalizationScoringConfig contentTriggerMaxDampener](self, "contentTriggerMaxDampener");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("contentTriggerMaxDampener"));
  -[FCPersonalizationScoringConfig contentTriggerDampenerCoefficient](self, "contentTriggerDampenerCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("contentTriggerDampenerCoefficient"));
  -[FCPersonalizationScoringConfig personalizedMultiplierBaselineMembership](self, "personalizedMultiplierBaselineMembership");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("personalizedMultiplierBaselineMembership"));
  -[FCPersonalizationScoringConfig personalizedMultiplierPreBaselineCurvature](self, "personalizedMultiplierPreBaselineCurvature");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("personalizedMultiplierPreBaselineCurvature"));
  -[FCPersonalizationScoringConfig personalizedMultiplierPostBaselineCurvature](self, "personalizedMultiplierPostBaselineCurvature");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("personalizedMultiplierPostBaselineCurvature"));
  -[FCPersonalizationScoringConfig personalizedMultiplierMembershipDampener](self, "personalizedMultiplierMembershipDampener");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("personalizedMultiplierMembershipDampener"));
  -[FCPersonalizationScoringConfig publisherDampenerWeight](self, "publisherDampenerWeight");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("publisherDampenerWeight"));
  -[FCPersonalizationScoringConfig recentlyFollowedDurationThreshold](self, "recentlyFollowedDurationThreshold");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("recentlyFollowedDurationThreshold"));
  -[FCPersonalizationScoringConfig recentlyFollowedMultiplier](self, "recentlyFollowedMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("recentlyFollowedMultiplier"));
  -[FCPersonalizationScoringConfig tabiScoreCoefficient](self, "tabiScoreCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("tabiScoreCoefficient"));
  -[FCPersonalizationScoringConfig clientSideEngagementBoostFeaturedArticleMultiplier](self, "clientSideEngagementBoostFeaturedArticleMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clientSideEngagementBoostFeaturedArticleMultiplier"));
  -[FCPersonalizationScoringConfig clientSideEngagementBoostFeatureCandidateArticleMultiplier](self, "clientSideEngagementBoostFeatureCandidateArticleMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clientSideEngagementBoostFeatureCandidateArticleMultiplier"));
  -[FCPersonalizationScoringConfig clientSideEngagementBoostFreeCohortCTRCap](self, "clientSideEngagementBoostFreeCohortCTRCap");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clientSideEngagementBoostFreeCohortCTRCap"));
  -[FCPersonalizationScoringConfig clientSideEngagementBoostPaidCohortCTRCap](self, "clientSideEngagementBoostPaidCohortCTRCap");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clientSideEngagementBoostPaidCohortCTRCap"));
  -[FCPersonalizationScoringConfig clientSideEngagementBoostTagQualityMultiplier](self, "clientSideEngagementBoostTagQualityMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clientSideEngagementBoostTagQualityMultiplier"));
  -[FCPersonalizationScoringConfig clientSideEngagementBoostReduceVisibilityMultiplier](self, "clientSideEngagementBoostReduceVisibilityMultiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clientSideEngagementBoostReduceVisibilityMultiplier"));
  -[FCPersonalizationScoringConfig clientSideEngagementBoostANFMutiplier](self, "clientSideEngagementBoostANFMutiplier");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("clientSideEngagementBoostANFMutiplier"));
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig dampenerEnabled](self, "dampenerEnabled"), CFSTR("dampenerEnabled"));
  objc_msgSend(v8, "encodeBool:forKey:", -[FCPersonalizationScoringConfig multiplierEnabled](self, "multiplierEnabled"), CFSTR("multiplierEnabled"));
  -[FCPersonalizationScoringConfig peopleAlsoReadBaselineScore](self, "peopleAlsoReadBaselineScore");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("peopleAlsoReadBaselineScore"));
  -[FCPersonalizationScoringConfig peopleAlsoReadConditionalScoreCoefficient](self, "peopleAlsoReadConditionalScoreCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("peopleAlsoReadConditionalScoreCoefficient"));
  -[FCPersonalizationScoringConfig peopleAlsoReadScoreCoefficient](self, "peopleAlsoReadScoreCoefficient");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("peopleAlsoReadScoreCoefficient"));

}

- (void)setAnfMultiplier:(double)a3
{
  self->_anfMultiplier = a3;
}

- (void)setArticleEmbeddingScoreCoefficient:(double)a3
{
  self->_articleEmbeddingScoreCoefficient = a3;
}

- (void)setArticleEmbeddingScoreDampenerWeight:(double)a3
{
  self->_articleEmbeddingScoreDampenerWeight = a3;
}

- (void)setArticleLengthAggregateWeight:(double)a3
{
  self->_articleLengthAggregateWeight = a3;
}

- (void)setArticleReadPenalty:(double)a3
{
  self->_articleReadPenalty = a3;
}

- (void)setArticleListenedPenalty:(double)a3
{
  self->_articleListenedPenalty = a3;
}

- (void)setAudioMultiplierForFreeUsers:(double)a3
{
  self->_audioMultiplierForFreeUsers = a3;
}

- (void)setAudioMultiplierForTrialUsers:(double)a3
{
  self->_audioMultiplierForTrialUsers = a3;
}

- (void)setAudioMultiplierForPaidUsers:(double)a3
{
  self->_audioMultiplierForPaidUsers = a3;
}

- (void)setAutofavoritedVoteCoefficient:(double)a3
{
  self->_autofavoritedVoteCoefficient = a3;
}

- (void)setBaselineRatePrior:(double)a3
{
  self->_baselineRatePrior = a3;
}

- (void)setBundleFreeMultiplierForFreeUsers:(double)a3
{
  self->_bundleFreeMultiplierForFreeUsers = a3;
}

- (void)setBundleFreeMultiplierForTrialUsers:(double)a3
{
  self->_bundleFreeMultiplierForTrialUsers = a3;
}

- (void)setBundleFreeMultiplierForPaidUsers:(double)a3
{
  self->_bundleFreeMultiplierForPaidUsers = a3;
}

- (void)setBundlePaidMultiplierForFreeUsers:(double)a3
{
  self->_bundlePaidMultiplierForFreeUsers = a3;
}

- (void)setBundlePaidMultiplierForTrialUsers:(double)a3
{
  self->_bundlePaidMultiplierForTrialUsers = a3;
}

- (void)setBundlePaidMultiplierForPaidUsers:(double)a3
{
  self->_bundlePaidMultiplierForPaidUsers = a3;
}

- (void)setConversionCoefficientForFreeUsers:(double)a3
{
  self->_conversionCoefficientForFreeUsers = a3;
}

- (void)setConversionCoefficientForTrialUsers:(double)a3
{
  self->_conversionCoefficientForTrialUsers = a3;
}

- (void)setConversionCoefficientForPaidUsers:(double)a3
{
  self->_conversionCoefficientForPaidUsers = a3;
}

- (void)setConversionCohort:(id)a3
{
  objc_storeStrong((id *)&self->_conversionCohort, a3);
}

- (void)setCtrWithOneAutofavorited:(double)a3
{
  self->_ctrWithOneAutofavorited = a3;
}

- (void)setCtrWithOneSubscribed:(double)a3
{
  self->_ctrWithOneSubscribed = a3;
}

- (void)setCtrWithSubscribedChannel:(double)a3
{
  self->_ctrWithSubscribedChannel = a3;
}

- (void)setCtrWithThreeAutofavorited:(double)a3
{
  self->_ctrWithThreeAutofavorited = a3;
}

- (void)setCtrWithThreeSubscribed:(double)a3
{
  self->_ctrWithThreeSubscribed = a3;
}

- (void)setCtrWithTwoAutofavorited:(double)a3
{
  self->_ctrWithTwoAutofavorited = a3;
}

- (void)setCtrWithTwoSubscribed:(double)a3
{
  self->_ctrWithTwoSubscribed = a3;
}

- (void)setCtrWithZeroAutofavorited:(double)a3
{
  self->_ctrWithZeroAutofavorited = a3;
}

- (void)setCtrWithZeroSubscribed:(double)a3
{
  self->_ctrWithZeroSubscribed = a3;
}

- (void)setDecayFactor:(double)a3
{
  self->_decayFactor = a3;
}

- (void)setFeaturedMultiplierForFreeUsers:(double)a3
{
  self->_featuredMultiplierForFreeUsers = a3;
}

- (void)setFeaturedMultiplierForTrialUsers:(double)a3
{
  self->_featuredMultiplierForTrialUsers = a3;
}

- (void)setFeaturedMultiplierForPaidUsers:(double)a3
{
  self->_featuredMultiplierForPaidUsers = a3;
}

- (void)setEvergreenMultiplierForFreeUsers:(double)a3
{
  self->_evergreenMultiplierForFreeUsers = a3;
}

- (void)setEvergreenMultiplierForTrialUsers:(double)a3
{
  self->_evergreenMultiplierForTrialUsers = a3;
}

- (void)setEvergreenMultiplierForPaidUsers:(double)a3
{
  self->_evergreenMultiplierForPaidUsers = a3;
}

- (void)setGlobalScoreCoefficientFree:(double)a3
{
  self->_globalScoreCoefficientFree = a3;
}

- (void)setGlobalScoreCoefficientPaid:(double)a3
{
  self->_globalScoreCoefficientPaid = a3;
}

- (void)setGlobalScoreCoefficientHalfLife:(double)a3
{
  self->_globalScoreCoefficientHalfLife = a3;
}

- (void)setGlobalScoreCoefficientInitialMultiplier:(double)a3
{
  self->_globalScoreCoefficientInitialMultiplier = a3;
}

- (void)setGlobalScoreDemocratizationFactor:(double)a3
{
  self->_globalScoreDemocratizationFactor = a3;
}

- (void)setLocalScoreDemocratizationFactor:(double)a3
{
  self->_localScoreDemocratizationFactor = a3;
}

- (void)setConversionScoreDemocratizationFactor:(double)a3
{
  self->_conversionScoreDemocratizationFactor = a3;
}

- (void)setHeadlineSeenPenalty:(double)a3
{
  self->_headlineSeenPenalty = a3;
}

- (void)setHalfLifeCoefficient:(double)a3
{
  self->_halfLifeCoefficient = a3;
}

- (void)setUserFeedbackHalfLifeCoefficient:(double)a3
{
  self->_userFeedbackHalfLifeCoefficient = a3;
}

- (void)setEvergreenHalfLifeCoefficient:(double)a3
{
  self->_evergreenHalfLifeCoefficient = a3;
}

- (void)setRespectHalfLifeOverride:(BOOL)a3
{
  self->_respectHalfLifeOverride = a3;
}

- (void)setMutedVoteCoefficient:(double)a3
{
  self->_mutedVoteCoefficient = a3;
}

- (void)setPersonalizationCoefficient:(double)a3
{
  self->_personalizationCoefficient = a3;
}

- (void)setPublisherAggregateWeight:(double)a3
{
  self->_publisherAggregateWeight = a3;
}

- (void)setSparseTagsPenalty:(double)a3
{
  self->_sparseTagsPenalty = a3;
}

- (void)setSubscribedChannelScoreCoefficient:(double)a3
{
  self->_subscribedChannelScoreCoefficient = a3;
}

- (void)setSubscribedTopicsScoreCoefficient:(double)a3
{
  self->_subscribedTopicsScoreCoefficient = a3;
}

- (void)setTabiScoreCoefficient:(double)a3
{
  self->_tabiScoreCoefficient = a3;
}

- (void)setUserCohort:(id)a3
{
  objc_storeStrong((id *)&self->_userCohort, a3);
}

- (void)setLowFlowBoostFetchCountWeight:(double)a3
{
  self->_lowFlowBoostFetchCountWeight = a3;
}

- (void)setLowFlowBoostFactor:(double)a3
{
  self->_lowFlowBoostFactor = a3;
}

- (void)setLowFlowBoostMaxProductFactor:(double)a3
{
  self->_lowFlowBoostMaxProductFactor = a3;
}

- (void)setLowFlowBoostFetchEstimationConfig:(id)a3
{
  objc_storeStrong((id *)&self->_lowFlowBoostFetchEstimationConfig, a3);
}

- (void)setLowFlowBoostEventEstimationConfig:(id)a3
{
  objc_storeStrong((id *)&self->_lowFlowBoostEventEstimationConfig, a3);
}

- (void)setNicheContentBoostOnlyAboveBaselineMembership:(BOOL)a3
{
  self->_nicheContentBoostOnlyAboveBaselineMembership = a3;
}

- (void)setNicheContentBaselineMembershipMultiplier:(double)a3
{
  self->_nicheContentBaselineMembershipMultiplier = a3;
}

- (void)setNicheContentManagedTopicBoostAllTags:(BOOL)a3
{
  self->_nicheContentManagedTopicBoostAllTags = a3;
}

- (void)setNicheContentDefaultFlowRate:(double)a3
{
  self->_nicheContentDefaultFlowRate = a3;
}

- (void)setNicheContentDefaultSubscriptionRate:(double)a3
{
  self->_nicheContentDefaultSubscriptionRate = a3;
}

- (void)setNicheContentExcludeNonGroupableTopics:(BOOL)a3
{
  self->_nicheContentExcludeNonGroupableTopics = a3;
}

- (void)setNicheContentShouldBoostPublisher:(BOOL)a3
{
  self->_nicheContentShouldBoostPublisher = a3;
}

- (void)setNicheContentTopicFlowExponent:(double)a3
{
  self->_nicheContentTopicFlowExponent = a3;
}

- (void)setNicheContentPublisherFlowExponent:(double)a3
{
  self->_nicheContentPublisherFlowExponent = a3;
}

- (void)setNicheContentManagedTopicBoost:(double)a3
{
  self->_nicheContentManagedTopicBoost = a3;
}

- (void)setNicheContentServerFlowWeight:(double)a3
{
  self->_nicheContentServerFlowWeight = a3;
}

- (void)setNicheContentTopicSubscriptionExponent:(double)a3
{
  self->_nicheContentTopicSubscriptionExponent = a3;
}

- (void)setNicheContentPublisherSubscriptionExponent:(double)a3
{
  self->_nicheContentPublisherSubscriptionExponent = a3;
}

- (void)setNicheContentQualityThreshold:(double)a3
{
  self->_nicheContentQualityThreshold = a3;
}

- (void)setContentTriggerMaxEventCount:(int64_t)a3
{
  self->_contentTriggerMaxEventCount = a3;
}

- (void)setContentTriggerScoreExponent:(double)a3
{
  self->_contentTriggerScoreExponent = a3;
}

- (void)setContentTriggerTagWeightExponent:(double)a3
{
  self->_contentTriggerTagWeightExponent = a3;
}

- (void)setContentTriggerMinScoreWeight:(double)a3
{
  self->_contentTriggerMinScoreWeight = a3;
}

- (void)setContentTriggerMaxDampener:(double)a3
{
  self->_contentTriggerMaxDampener = a3;
}

- (void)setContentTriggerDampenerCoefficient:(double)a3
{
  self->_contentTriggerDampenerCoefficient = a3;
}

- (void)setPersonalizedMultiplierBaselineMembership:(double)a3
{
  self->_personalizedMultiplierBaselineMembership = a3;
}

- (void)setPersonalizedMultiplierPreBaselineCurvature:(double)a3
{
  self->_personalizedMultiplierPreBaselineCurvature = a3;
}

- (void)setPersonalizedMultiplierPostBaselineCurvature:(double)a3
{
  self->_personalizedMultiplierPostBaselineCurvature = a3;
}

- (void)setPersonalizedMultiplierMembershipDampener:(double)a3
{
  self->_personalizedMultiplierMembershipDampener = a3;
}

- (void)setPublisherDampenerWeight:(double)a3
{
  self->_publisherDampenerWeight = a3;
}

- (void)setRecentlyFollowedDurationThreshold:(double)a3
{
  self->_recentlyFollowedDurationThreshold = a3;
}

- (void)setRecentlyFollowedMultiplier:(double)a3
{
  self->_recentlyFollowedMultiplier = a3;
}

- (void)setClientSideEngagementBoostFeaturedArticleMultiplier:(double)a3
{
  self->_clientSideEngagementBoostFeaturedArticleMultiplier = a3;
}

- (void)setClientSideEngagementBoostFeatureCandidateArticleMultiplier:(double)a3
{
  self->_clientSideEngagementBoostFeatureCandidateArticleMultiplier = a3;
}

- (void)setClientSideEngagementBoostFreeCohortCTRCap:(double)a3
{
  self->_clientSideEngagementBoostFreeCohortCTRCap = a3;
}

- (void)setClientSideEngagementBoostPaidCohortCTRCap:(double)a3
{
  self->_clientSideEngagementBoostPaidCohortCTRCap = a3;
}

- (void)setClientSideEngagementBoostTagQualityMultiplier:(double)a3
{
  self->_clientSideEngagementBoostTagQualityMultiplier = a3;
}

- (void)setClientSideEngagementBoostReduceVisibilityMultiplier:(double)a3
{
  self->_clientSideEngagementBoostReduceVisibilityMultiplier = a3;
}

- (void)setClientSideEngagementBoostANFMutiplier:(double)a3
{
  self->_clientSideEngagementBoostANFMutiplier = a3;
}

- (void)setDampenerEnabled:(BOOL)a3
{
  self->_dampenerEnabled = a3;
}

- (void)setMultiplierEnabled:(BOOL)a3
{
  self->_multiplierEnabled = a3;
}

- (void)setPeopleAlsoReadBaselineScore:(double)a3
{
  self->_peopleAlsoReadBaselineScore = a3;
}

- (void)setPeopleAlsoReadConditionalScoreCoefficient:(double)a3
{
  self->_peopleAlsoReadConditionalScoreCoefficient = a3;
}

- (void)setPeopleAlsoReadScoreCoefficient:(double)a3
{
  self->_peopleAlsoReadScoreCoefficient = a3;
}

@end
