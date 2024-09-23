@implementation APRepresentationData

- (void)setSize:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3;

  v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (APRepresentationData)init
{
  APRepresentationData *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  APRepresentationData *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)APRepresentationData;
  v2 = -[APRepresentationData init](&v11, sel_init);
  v9 = v2;
  if (v2)
    objc_msgSend__correctNonNullableFields(v2, v3, v4, v5, v6, v7, v8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMetadata, 0);
  objc_storeStrong((id *)&self->_cppIds, 0);
  objc_storeStrong((id *)&self->_positionInformation, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_odmlResponse, 0);
  objc_storeStrong((id *)&self->_storeFrontLocale, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_clientRequestID, 0);
  objc_storeStrong((id *)&self->_impressionID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_journeyRelayCampaignId, 0);
  objc_storeStrong((id *)&self->_journeyRelayAdGroupId, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_targetingExpressionId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_campaignData, 0);
  objc_storeStrong((id *)&self->_advertiserName, 0);
  objc_storeStrong((id *)&self->_articleTitle, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_adTag, 0);
  objc_storeStrong((id *)&self->_tapAction, 0);
  objc_storeStrong((id *)&self->_targetingDimensions, 0);
  objc_storeStrong((id *)&self->_policyData, 0);
  objc_storeStrong((id *)&self->_frequencyCapData, 0);
  objc_storeStrong((id *)&self->_rawAdFormatType, 0);
  objc_storeStrong((id *)&self->_rawAdType, 0);
  objc_storeStrong((id *)&self->_contentDataIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setContentDataIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (APRepresentationData)initWithCoder:(id)a3
{
  id v4;
  APRepresentationData *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  APFrequencyCapData *frequencyCapData;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  APPolicyData *policyData;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  APTargetingDimensions *targetingDimensions;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  APTapAction *tapAction;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  NSString *rawAdType;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  NSString *rawAdFormatType;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  int v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  int v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  double v82;
  double v83;
  uint64_t v84;
  NSString *adTag;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  double v89;
  double v90;
  uint64_t v91;
  NSURL *videoURL;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  double v117;
  double v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  double v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  double v131;
  double v132;
  uint64_t v133;
  NSString *articleID;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  double v138;
  double v139;
  uint64_t v140;
  NSString *articleTitle;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  double v145;
  double v146;
  uint64_t v147;
  NSString *advertiserName;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  double v152;
  double v153;
  uint64_t v154;
  NSString *campaignData;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  double v159;
  double v160;
  uint64_t v161;
  NSString *contentDataIdentifier;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  double v166;
  double v167;
  uint64_t v168;
  NSUUID *identifier;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  double v173;
  double v174;
  uint64_t v175;
  NSString *adamID;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  double v180;
  double v181;
  uint64_t v182;
  NSString *metadata;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  double v187;
  double v188;
  uint64_t v189;
  NSString *journeyRelayAdGroupId;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  double v194;
  double v195;
  uint64_t v196;
  NSString *journeyRelayCampaignId;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  double v201;
  double v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  double v207;
  double v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  double v212;
  double v213;
  uint64_t v214;
  NSDictionary *installAttribution;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  double v219;
  double v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  double v224;
  double v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  double v229;
  double v230;
  uint64_t v231;
  NSUUID *iAdID;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  double v236;
  double v237;
  uint64_t v238;
  NSUUID *impressionID;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  double v243;
  double v244;
  uint64_t v245;
  NSString *storeFront;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  double v250;
  double v251;
  uint64_t v252;
  NSString *storeFrontLocale;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  double v257;
  double v258;
  uint64_t v259;
  NSString *clientRequestID;
  void *v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  double v266;
  double v267;
  void *v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  double v275;
  double v276;
  void *v277;
  const char *v278;
  double v279;
  double v280;
  uint64_t v281;
  NSDictionary *positionInformation;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  double v286;
  double v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  double v291;
  double v292;
  uint64_t v293;
  NSArray *cppIds;
  void *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  double v303;
  double v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  double v308;
  double v309;
  uint64_t v310;
  NSDictionary *appMetadata;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  double v315;
  double v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  double v320;
  double v321;
  uint64_t v322;
  NSString *treatmentId;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  double v327;
  double v328;
  uint64_t v329;
  NSString *deploymentId;
  uint64_t v331;
  const char *v332;
  uint64_t v333;
  double v334;
  double v335;
  uint64_t v336;
  NSString *experimentId;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  double v342;
  double v343;
  objc_super v345;

  v4 = a3;
  v345.receiver = self;
  v345.super_class = (Class)APRepresentationData;
  v5 = -[APRepresentationData init](&v345, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x22073D684]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("frequencyCapData"), v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    frequencyCapData = v5->_frequencyCapData;
    v5->_frequencyCapData = (APFrequencyCapData *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("policyData"), v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    policyData = v5->_policyData;
    v5->_policyData = (APPolicyData *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("targetingDimensionsKey"), v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    targetingDimensions = v5->_targetingDimensions;
    v5->_targetingDimensions = (APTargetingDimensions *)v26;

    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, (uint64_t)CFSTR("tapAction"), v30, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    tapAction = v5->_tapAction;
    v5->_tapAction = (APTapAction *)v33;

    v5->_privacyMarkerPosition = (int)objc_msgSend_decodeIntForKey_(v4, v35, (uint64_t)CFSTR("privacyMarkerPositionKey"), v36, v37, v38, v39);
    v5->_placementType = (int)objc_msgSend_decodeIntForKey_(v4, v40, (uint64_t)CFSTR("placementType"), v41, v42, v43, v44);
    v45 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, (uint64_t)CFSTR("rawAdType"), v47, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    rawAdType = v5->_rawAdType;
    v5->_rawAdType = (NSString *)v50;

    v52 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, (uint64_t)CFSTR("rawAdFormatType"), v54, v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    rawAdFormatType = v5->_rawAdFormatType;
    v5->_rawAdFormatType = (NSString *)v57;

    v5->_desiredPosition = (int)objc_msgSend_decodeIntForKey_(v4, v59, (uint64_t)CFSTR("desiredPosition"), v60, v61, v62, v63);
    v69 = objc_msgSend_decodeIntForKey_(v4, v64, (uint64_t)CFSTR("width"), v65, v66, v67, v68);
    v5->_size.width = (double)v69;
    v74 = objc_msgSend_decodeIntForKey_(v4, v70, (uint64_t)CFSTR("height"), v71, v72, (double)v69, v73);
    v5->_size.height = (double)v74;
    if (objc_msgSend_containsValueForKey_(v4, v75, (uint64_t)CFSTR("adTag"), v76, v77, (double)v74, v78))
    {
      v79 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, (uint64_t)CFSTR("adTag"), v81, v82, v83);
      v84 = objc_claimAutoreleasedReturnValue();
      adTag = v5->_adTag;
      v5->_adTag = (NSString *)v84;

    }
    v86 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v87, v86, (uint64_t)CFSTR("videoURL"), v88, v89, v90);
    v91 = objc_claimAutoreleasedReturnValue();
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v91;

    objc_msgSend_decodeDoubleForKey_(v4, v93, (uint64_t)CFSTR("duration"), v94, v95, v96, v97);
    v5->_duration = v98;
    objc_msgSend_decodeDoubleForKey_(v4, v99, (uint64_t)CFSTR("skipThreshold"), v100, v101, v98, v102);
    v5->_skipThreshold = v103;
    v5->_skipEnabled = objc_msgSend_decodeBoolForKey_(v4, v104, (uint64_t)CFSTR("skipEnabled"), v105, v106, v103, v107);
    v5->_unbranded = objc_msgSend_decodeBoolForKey_(v4, v108, (uint64_t)CFSTR("unbranded"), v109, v110, v111, v112);
    objc_msgSend_decodeDoubleForKey_(v4, v113, (uint64_t)CFSTR("bitrate"), v114, v115, v116, v117);
    v5->_bitrate = v118;
    v5->_signalStrength = objc_msgSend_decodeIntegerForKey_(v4, v119, (uint64_t)CFSTR("signalStrengthKey"), v120, v121, v118, v122);
    v5->_connectionType = objc_msgSend_decodeIntegerForKey_(v4, v123, (uint64_t)CFSTR("connectionTypeKey"), v124, v125, v126, v127);
    v128 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v129, v128, (uint64_t)CFSTR("articleID"), v130, v131, v132);
    v133 = objc_claimAutoreleasedReturnValue();
    articleID = v5->_articleID;
    v5->_articleID = (NSString *)v133;

    v135 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v136, v135, (uint64_t)CFSTR("articleTitle"), v137, v138, v139);
    v140 = objc_claimAutoreleasedReturnValue();
    articleTitle = v5->_articleTitle;
    v5->_articleTitle = (NSString *)v140;

    v142 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v143, v142, (uint64_t)CFSTR("advertiserName"), v144, v145, v146);
    v147 = objc_claimAutoreleasedReturnValue();
    advertiserName = v5->_advertiserName;
    v5->_advertiserName = (NSString *)v147;

    v149 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v150, v149, (uint64_t)CFSTR("campaignData"), v151, v152, v153);
    v154 = objc_claimAutoreleasedReturnValue();
    campaignData = v5->_campaignData;
    v5->_campaignData = (NSString *)v154;

    v156 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v157, v156, (uint64_t)CFSTR("contentDataIdentifier"), v158, v159, v160);
    v161 = objc_claimAutoreleasedReturnValue();
    contentDataIdentifier = v5->_contentDataIdentifier;
    v5->_contentDataIdentifier = (NSString *)v161;

    v163 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v164, v163, (uint64_t)CFSTR("identifier"), v165, v166, v167);
    v168 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v168;

    v170 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v171, v170, (uint64_t)CFSTR("adamID"), v172, v173, v174);
    v175 = objc_claimAutoreleasedReturnValue();
    adamID = v5->_adamID;
    v5->_adamID = (NSString *)v175;

    v177 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v178, v177, (uint64_t)CFSTR("metadata"), v179, v180, v181);
    v182 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSString *)v182;

    v184 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v185, v184, (uint64_t)CFSTR("journeyRelayAdGroupId"), v186, v187, v188);
    v189 = objc_claimAutoreleasedReturnValue();
    journeyRelayAdGroupId = v5->_journeyRelayAdGroupId;
    v5->_journeyRelayAdGroupId = (NSString *)v189;

    v191 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v192, v191, (uint64_t)CFSTR("journeyRelayCampaignId"), v193, v194, v195);
    v196 = objc_claimAutoreleasedReturnValue();
    journeyRelayCampaignId = v5->_journeyRelayCampaignId;
    v5->_journeyRelayCampaignId = (NSString *)v196;

    v5->_parentAppCheckEnabled = objc_msgSend_decodeBoolForKey_(v4, v198, (uint64_t)CFSTR("parentAppCheckEnabled"), v199, v200, v201, v202);
    objc_msgSend_classes(MEMORY[0x24BDFD4A8], v203, v204, v205, v206, v207, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v210, (uint64_t)v209, (uint64_t)CFSTR("installAttribution"), v211, v212, v213);
    v214 = objc_claimAutoreleasedReturnValue();
    installAttribution = v5->_installAttribution;
    v5->_installAttribution = (NSDictionary *)v214;

    v5->_rank = objc_msgSend_decodeIntegerForKey_(v4, v216, (uint64_t)CFSTR("rank"), v217, v218, v219, v220);
    v5->_timeToDisplay = objc_msgSend_decodeIntegerForKey_(v4, v221, (uint64_t)CFSTR("timeToDisplay"), v222, v223, v224, v225);
    v226 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v227, v226, (uint64_t)CFSTR("iAdID"), v228, v229, v230);
    v231 = objc_claimAutoreleasedReturnValue();
    iAdID = v5->_iAdID;
    v5->_iAdID = (NSUUID *)v231;

    v233 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v234, v233, (uint64_t)CFSTR("impressionID"), v235, v236, v237);
    v238 = objc_claimAutoreleasedReturnValue();
    impressionID = v5->_impressionID;
    v5->_impressionID = (NSUUID *)v238;

    v240 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v241, v240, (uint64_t)CFSTR("storefront"), v242, v243, v244);
    v245 = objc_claimAutoreleasedReturnValue();
    storeFront = v5->_storeFront;
    v5->_storeFront = (NSString *)v245;

    v247 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v248, v247, (uint64_t)CFSTR("storefrontLocale"), v249, v250, v251);
    v252 = objc_claimAutoreleasedReturnValue();
    storeFrontLocale = v5->_storeFrontLocale;
    v5->_storeFrontLocale = (NSString *)v252;

    v254 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v255, v254, (uint64_t)CFSTR("clientRequestID"), v256, v257, v258);
    v259 = objc_claimAutoreleasedReturnValue();
    clientRequestID = v5->_clientRequestID;
    v5->_clientRequestID = (NSString *)v259;

    v261 = (void *)MEMORY[0x24BDBCF20];
    v262 = objc_opt_class();
    objc_msgSend_setWithObjects_(v261, v263, v262, v264, v265, v266, v267, 0);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = (void *)MEMORY[0x24BDBCF20];
    v270 = objc_opt_class();
    v271 = objc_opt_class();
    objc_msgSend_setWithObjects_(v269, v272, v270, v273, v274, v275, v276, v271, 0);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(v4, v278, (uint64_t)v268, (uint64_t)v277, (uint64_t)CFSTR("positionInformation"), v279, v280);
    v281 = objc_claimAutoreleasedReturnValue();
    positionInformation = v5->_positionInformation;
    v5->_positionInformation = (NSDictionary *)v281;

    v5->_slotNumber = objc_msgSend_decodeIntegerForKey_(v4, v283, (uint64_t)CFSTR("slotNumber"), v284, v285, v286, v287);
    v288 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v289, v288, (uint64_t)CFSTR("cppIds"), v290, v291, v292);
    v293 = objc_claimAutoreleasedReturnValue();
    cppIds = v5->_cppIds;
    v5->_cppIds = (NSArray *)v293;

    v295 = (void *)MEMORY[0x24BDBCF20];
    v296 = objc_opt_class();
    v297 = objc_opt_class();
    v298 = objc_opt_class();
    v299 = objc_opt_class();
    objc_msgSend_setWithObjects_(v295, v300, v296, v301, v302, v303, v304, v297, v298, v299, 0);
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v306, (uint64_t)v305, (uint64_t)CFSTR("appMetadata"), v307, v308, v309);
    v310 = objc_claimAutoreleasedReturnValue();
    appMetadata = v5->_appMetadata;
    v5->_appMetadata = (NSDictionary *)v310;

    v5->_odmlSuccess = objc_msgSend_decodeBoolForKey_(v4, v312, (uint64_t)CFSTR("odmlSuccess"), v313, v314, v315, v316);
    v317 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v318, v317, (uint64_t)CFSTR("treatmentId"), v319, v320, v321);
    v322 = objc_claimAutoreleasedReturnValue();
    treatmentId = v5->_treatmentId;
    v5->_treatmentId = (NSString *)v322;

    v324 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v325, v324, (uint64_t)CFSTR("deploymentId"), v326, v327, v328);
    v329 = objc_claimAutoreleasedReturnValue();
    deploymentId = v5->_deploymentId;
    v5->_deploymentId = (NSString *)v329;

    v331 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v332, v331, (uint64_t)CFSTR("experimentId"), v333, v334, v335);
    v336 = objc_claimAutoreleasedReturnValue();
    experimentId = v5->_experimentId;
    v5->_experimentId = (NSString *)v336;

    objc_msgSend__correctNonNullableFields(v5, v338, v339, v340, v341, v342, v343);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)_correctNonNullableFields
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  NSUUID *v8;
  NSUUID *identifier;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  NSUUID *v16;
  NSUUID *iAdID;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  NSUUID *v24;
  NSUUID *impressionID;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  NSString *v39;
  NSString *clientRequestID;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!self->_identifier)
  {
    objc_msgSend_UUID(MEMORY[0x24BDD1880], a2, v2, v3, v4, v5, v6);
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v8;

  }
  if (!self->_adamID)
  {
    self->_adamID = (NSString *)&stru_24DC81D10;

  }
  if (!self->_iAdID)
  {
    v41 = 0;
    v42 = 0;
    v10 = objc_alloc(MEMORY[0x24BDD1880]);
    v16 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)&v41, v12, v13, v14, v15);
    iAdID = self->_iAdID;
    self->_iAdID = v16;

  }
  if (!self->_impressionID)
  {
    v41 = 0;
    v42 = 0;
    v18 = objc_alloc(MEMORY[0x24BDD1880]);
    v24 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v18, v19, (uint64_t)&v41, v20, v21, v22, v23);
    impressionID = self->_impressionID;
    self->_impressionID = v24;

  }
  if (!self->_clientRequestID)
  {
    v41 = 0;
    v42 = 0;
    v26 = objc_alloc(MEMORY[0x24BDD1880]);
    v32 = (void *)objc_msgSend_initWithUUIDBytes_(v26, v27, (uint64_t)&v41, v28, v29, v30, v31);
    objc_msgSend_UUIDString(v32, v33, v34, v35, v36, v37, v38);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    clientRequestID = self->_clientRequestID;
    self->_clientRequestID = v39;

  }
  if (!self->_storeFront)
  {
    self->_storeFront = (NSString *)&stru_24DC81D10;

  }
  if (!self->_storeFrontLocale)
  {
    self->_storeFrontLocale = (NSString *)&stru_24DC81D10;

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  double v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  double v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  double v110;
  const char *v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  double v119;
  double v120;
  const char *v121;
  uint64_t v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  double v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  double v133;
  double v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  double v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  double v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  double v150;
  double v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  double v155;
  double v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  double v161;
  double v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  double v166;
  double v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  double v172;
  double v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  double v177;
  double v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  double v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  double v188;
  double v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  double v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  double v199;
  double v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  double v205;
  double v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  double v210;
  double v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  double v216;
  double v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  double v221;
  double v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  double v227;
  double v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  double v232;
  double v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  double v238;
  double v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  double v243;
  double v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  double v249;
  double v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  double v254;
  double v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  double v260;
  double v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  double v265;
  double v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  double v271;
  double v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  double v276;
  double v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  double v282;
  double v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  double v287;
  double v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  double v293;
  double v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  double v298;
  double v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  double v304;
  double v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  double v309;
  double v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  double v315;
  double v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  double v320;
  double v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  double v326;
  double v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  double v331;
  double v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  double v337;
  double v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  double v342;
  double v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  double v348;
  double v349;
  void *v350;
  const char *v351;
  uint64_t v352;
  double v353;
  double v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  double v359;
  double v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  double v364;
  double v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  double v370;
  double v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  double v375;
  double v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  double v381;
  double v382;
  void *v383;
  const char *v384;
  uint64_t v385;
  double v386;
  double v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  double v392;
  double v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  double v397;
  double v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  double v403;
  double v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  double v408;
  double v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  double v414;
  double v415;
  void *v416;
  const char *v417;
  uint64_t v418;
  double v419;
  double v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  double v425;
  double v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  double v430;
  double v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  double v436;
  double v437;
  void *v438;
  const char *v439;
  uint64_t v440;
  double v441;
  double v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  double v447;
  double v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  double v452;
  double v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  double v458;
  double v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  double v463;
  double v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  double v469;
  double v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  double v474;
  double v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  double v480;
  double v481;
  uint64_t v482;
  const char *v483;
  uint64_t v484;
  double v485;
  double v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  double v491;
  double v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  double v496;
  double v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  double v502;
  double v503;
  void *v504;
  const char *v505;
  uint64_t v506;
  double v507;
  double v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  double v513;
  double v514;
  const char *v515;
  uint64_t v516;
  double v517;
  double v518;
  id v519;

  v4 = a3;
  objc_msgSend_frequencyCapData(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("frequencyCapData"), v13, v14, v15);

  objc_msgSend_policyData(self, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("policyData"), v24, v25, v26);

  objc_msgSend_targetingDimensions(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("targetingDimensionsKey"), v35, v36, v37);

  objc_msgSend_tapAction(self, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("tapAction"), v46, v47, v48);

  v55 = objc_msgSend_privacyMarkerPosition(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeInt_forKey_(v4, v56, v55, (uint64_t)CFSTR("privacyMarkerPositionKey"), v57, v58, v59);
  v66 = objc_msgSend_placementType(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeInt_forKey_(v4, v67, v66, (uint64_t)CFSTR("placementType"), v68, v69, v70);
  objc_msgSend_rawAdType(self, v71, v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, (uint64_t)CFSTR("rawAdType"), v79, v80, v81);

  objc_msgSend_rawAdFormatType(self, v82, v83, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, (uint64_t)CFSTR("rawAdFormatType"), v90, v91, v92);

  v99 = objc_msgSend_desiredPosition(self, v93, v94, v95, v96, v97, v98);
  objc_msgSend_encodeInt_forKey_(v4, v100, v99, (uint64_t)CFSTR("desiredPosition"), v101, v102, v103);
  objc_msgSend_size(self, v104, v105, v106, v107, v108, v109);
  objc_msgSend_encodeInt_forKey_(v4, v111, (int)v110, (uint64_t)CFSTR("width"), v112, v110, v113);
  objc_msgSend_size(self, v114, v115, v116, v117, v118, v119);
  objc_msgSend_encodeInt_forKey_(v4, v121, (int)v120, (uint64_t)CFSTR("height"), v122, v123, v120);
  objc_msgSend_adTag(self, v124, v125, v126, v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v131, (uint64_t)v130, (uint64_t)CFSTR("adTag"), v132, v133, v134);

  objc_msgSend_videoURL(self, v135, v136, v137, v138, v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v142, (uint64_t)v141, (uint64_t)CFSTR("videoURL"), v143, v144, v145);

  objc_msgSend_duration(self, v146, v147, v148, v149, v150, v151);
  objc_msgSend_encodeDouble_forKey_(v4, v152, (uint64_t)CFSTR("duration"), v153, v154, v155, v156);
  objc_msgSend_skipThreshold(self, v157, v158, v159, v160, v161, v162);
  objc_msgSend_encodeDouble_forKey_(v4, v163, (uint64_t)CFSTR("skipThreshold"), v164, v165, v166, v167);
  v174 = objc_msgSend_skipEnabled(self, v168, v169, v170, v171, v172, v173);
  objc_msgSend_encodeBool_forKey_(v4, v175, v174, (uint64_t)CFSTR("skipEnabled"), v176, v177, v178);
  v185 = objc_msgSend_unbranded(self, v179, v180, v181, v182, v183, v184);
  objc_msgSend_encodeBool_forKey_(v4, v186, v185, (uint64_t)CFSTR("unbranded"), v187, v188, v189);
  objc_msgSend_bitrate(self, v190, v191, v192, v193, v194, v195);
  objc_msgSend_encodeDouble_forKey_(v4, v196, (uint64_t)CFSTR("bitrate"), v197, v198, v199, v200);
  v207 = objc_msgSend_signalStrength(self, v201, v202, v203, v204, v205, v206);
  objc_msgSend_encodeInteger_forKey_(v4, v208, v207, (uint64_t)CFSTR("signalStrengthKey"), v209, v210, v211);
  v218 = objc_msgSend_connectionType(self, v212, v213, v214, v215, v216, v217);
  objc_msgSend_encodeInteger_forKey_(v4, v219, v218, (uint64_t)CFSTR("connectionTypeKey"), v220, v221, v222);
  objc_msgSend_articleID(self, v223, v224, v225, v226, v227, v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v230, (uint64_t)v229, (uint64_t)CFSTR("articleID"), v231, v232, v233);

  objc_msgSend_articleTitle(self, v234, v235, v236, v237, v238, v239);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v241, (uint64_t)v240, (uint64_t)CFSTR("articleTitle"), v242, v243, v244);

  objc_msgSend_advertiserName(self, v245, v246, v247, v248, v249, v250);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v252, (uint64_t)v251, (uint64_t)CFSTR("advertiserName"), v253, v254, v255);

  objc_msgSend_campaignData(self, v256, v257, v258, v259, v260, v261);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v263, (uint64_t)v262, (uint64_t)CFSTR("campaignData"), v264, v265, v266);

  objc_msgSend_contentDataIdentifier(self, v267, v268, v269, v270, v271, v272);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v274, (uint64_t)v273, (uint64_t)CFSTR("contentDataIdentifier"), v275, v276, v277);

  objc_msgSend_identifier(self, v278, v279, v280, v281, v282, v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v285, (uint64_t)v284, (uint64_t)CFSTR("identifier"), v286, v287, v288);

  objc_msgSend_adamID(self, v289, v290, v291, v292, v293, v294);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v296, (uint64_t)v295, (uint64_t)CFSTR("adamID"), v297, v298, v299);

  objc_msgSend_metadata(self, v300, v301, v302, v303, v304, v305);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v307, (uint64_t)v306, (uint64_t)CFSTR("metadata"), v308, v309, v310);

  objc_msgSend_journeyRelayAdGroupId(self, v311, v312, v313, v314, v315, v316);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v318, (uint64_t)v317, (uint64_t)CFSTR("journeyRelayAdGroupId"), v319, v320, v321);

  objc_msgSend_journeyRelayCampaignId(self, v322, v323, v324, v325, v326, v327);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v329, (uint64_t)v328, (uint64_t)CFSTR("journeyRelayCampaignId"), v330, v331, v332);

  v339 = objc_msgSend_parentAppCheckEnabled(self, v333, v334, v335, v336, v337, v338);
  objc_msgSend_encodeBool_forKey_(v4, v340, v339, (uint64_t)CFSTR("parentAppCheckEnabled"), v341, v342, v343);
  objc_msgSend_installAttribution(self, v344, v345, v346, v347, v348, v349);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v351, (uint64_t)v350, (uint64_t)CFSTR("installAttribution"), v352, v353, v354);

  v361 = objc_msgSend_rank(self, v355, v356, v357, v358, v359, v360);
  objc_msgSend_encodeInteger_forKey_(v4, v362, v361, (uint64_t)CFSTR("rank"), v363, v364, v365);
  v372 = objc_msgSend_timeToDisplay(self, v366, v367, v368, v369, v370, v371);
  objc_msgSend_encodeInteger_forKey_(v4, v373, v372, (uint64_t)CFSTR("timeToDisplay"), v374, v375, v376);
  objc_msgSend_iAdID(self, v377, v378, v379, v380, v381, v382);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v384, (uint64_t)v383, (uint64_t)CFSTR("iAdID"), v385, v386, v387);

  objc_msgSend_impressionID(self, v388, v389, v390, v391, v392, v393);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v395, (uint64_t)v394, (uint64_t)CFSTR("impressionID"), v396, v397, v398);

  objc_msgSend_storeFront(self, v399, v400, v401, v402, v403, v404);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v406, (uint64_t)v405, (uint64_t)CFSTR("storefront"), v407, v408, v409);

  objc_msgSend_storeFrontLocale(self, v410, v411, v412, v413, v414, v415);
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v417, (uint64_t)v416, (uint64_t)CFSTR("storefrontLocale"), v418, v419, v420);

  objc_msgSend_clientRequestID(self, v421, v422, v423, v424, v425, v426);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v428, (uint64_t)v427, (uint64_t)CFSTR("clientRequestID"), v429, v430, v431);

  objc_msgSend_positionInformation(self, v432, v433, v434, v435, v436, v437);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v439, (uint64_t)v438, (uint64_t)CFSTR("positionInformation"), v440, v441, v442);

  v449 = objc_msgSend_slotNumber(self, v443, v444, v445, v446, v447, v448);
  objc_msgSend_encodeInteger_forKey_(v4, v450, v449, (uint64_t)CFSTR("slotNumber"), v451, v452, v453);
  objc_msgSend_cppIds(self, v454, v455, v456, v457, v458, v459);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v461, (uint64_t)v460, (uint64_t)CFSTR("cppIds"), v462, v463, v464);

  objc_msgSend_appMetadata(self, v465, v466, v467, v468, v469, v470);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v472, (uint64_t)v471, (uint64_t)CFSTR("appMetadata"), v473, v474, v475);

  v482 = objc_msgSend_odmlSuccess(self, v476, v477, v478, v479, v480, v481);
  objc_msgSend_encodeBool_forKey_(v4, v483, v482, (uint64_t)CFSTR("odmlSuccess"), v484, v485, v486);
  objc_msgSend_treatmentId(self, v487, v488, v489, v490, v491, v492);
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v494, (uint64_t)v493, (uint64_t)CFSTR("treatmentId"), v495, v496, v497);

  objc_msgSend_deploymentId(self, v498, v499, v500, v501, v502, v503);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v505, (uint64_t)v504, (uint64_t)CFSTR("deploymentId"), v506, v507, v508);

  objc_msgSend_experimentId(self, v509, v510, v511, v512, v513, v514);
  v519 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v515, (uint64_t)v519, (uint64_t)CFSTR("experimentId"), v516, v517, v518);

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (int64_t)placementType
{
  return self->_placementType;
}

- (APTapAction)tapAction
{
  return (APTapAction *)objc_getProperty(self, a2, 96, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)adTag
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSURL)videoURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (unint64_t)signalStrength
{
  return self->_signalStrength;
}

- (NSString)rawAdType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)rawAdFormatType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)privacyMarkerPosition
{
  return self->_privacyMarkerPosition;
}

- (APPolicyData)policyData
{
  return (APPolicyData *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)metadata
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (NSUUID)impressionID
{
  return (NSUUID *)objc_getProperty(self, a2, 272, 1);
}

- (APFrequencyCapData)frequencyCapData
{
  return (APFrequencyCapData *)objc_getProperty(self, a2, 64, 1);
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)desiredPosition
{
  return self->_desiredPosition;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (double)bitrate
{
  return self->_bitrate;
}

- (NSString)adamID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (BOOL)unbranded
{
  return self->_unbranded;
}

- (NSString)treatmentId
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (int64_t)timeToDisplay
{
  return self->_timeToDisplay;
}

- (APTargetingDimensions)targetingDimensions
{
  return (APTargetingDimensions *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)storeFront
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (NSString)storeFrontLocale
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (int64_t)slotNumber
{
  return self->_slotNumber;
}

- (double)skipThreshold
{
  return self->_skipThreshold;
}

- (BOOL)skipEnabled
{
  return self->_skipEnabled;
}

- (int64_t)rank
{
  return self->_rank;
}

- (NSDictionary)positionInformation
{
  return self->_positionInformation;
}

- (BOOL)parentAppCheckEnabled
{
  return self->_parentAppCheckEnabled;
}

- (BOOL)odmlSuccess
{
  return self->_odmlSuccess;
}

- (NSString)journeyRelayCampaignId
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)journeyRelayAdGroupId
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (NSDictionary)installAttribution
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (NSUUID)iAdID
{
  return (NSUUID *)objc_getProperty(self, a2, 264, 1);
}

- (NSString)experimentId
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (NSString)deploymentId
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (NSArray)cppIds
{
  return self->_cppIds;
}

- (NSString)contentDataIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)clientRequestID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)campaignData
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)articleTitle
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)articleID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSDictionary)appMetadata
{
  return self->_appMetadata;
}

- (NSString)advertiserName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTapAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setPrivacyMarkerPosition:(unint64_t)a3
{
  self->_privacyMarkerPosition = a3;
}

- (void)setPlacementType:(int64_t)a3
{
  self->_placementType = a3;
}

- (void)setDesiredPosition:(int64_t)a3
{
  self->_desiredPosition = a3;
}

- (void)setStoreFrontLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void)setStoreFront:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void)setSlotNumber:(int64_t)a3
{
  self->_slotNumber = a3;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setPositionInformation:(id)a3
{
  objc_storeStrong((id *)&self->_positionInformation, a3);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void)setJourneyRelayCampaignId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void)setJourneyRelayAdGroupId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void)setInstallAttribution:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void)setImpressionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void)setIAdID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void)setCppIds:(id)a3
{
  objc_storeStrong((id *)&self->_cppIds, a3);
}

- (void)setClientRequestID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void)setAppMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_appMetadata, a3);
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

+ (id)mockRepresentationWithType:(int64_t)a3 contentData:(id)a4
{
  id v5;
  APRepresentationData *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  NSObject *v76;
  int v78;
  APRepresentationData *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(APRepresentationData);
  objc_msgSend_setPlacementType_(v6, v7, a3, v8, v9, v10, v11);
  objc_msgSend_identifier(v5, v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setContentDataIdentifier_(v6, v19, (uint64_t)v18, v20, v21, v22, v23);
  objc_msgSend_setArticleID_(v6, v24, (uint64_t)CFSTR("A0_OxJ7ViSeCggU0zJdY4Xw"), v25, v26, v27, v28);
  objc_msgSend_setArticleTitle_(v6, v29, (uint64_t)CFSTR("Bahamas missing plane: Debris from aircraft apparently found"), v30, v31, v32, v33);
  objc_msgSend_setAdvertiserName_(v6, v34, (uint64_t)CFSTR("Fox News"), v35, v36, v37, v38);
  objc_msgSend_setCampaignData_(v6, v39, (uint64_t)CFSTR("C15112882:L15115783:A10061684"), v40, v41, v42, v43);
  objc_msgSend_setAdTag_(v6, v44, (uint64_t)CFSTR("<html><head><meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\"><meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, maximum-scale=1.0\"><style>html {width:100%;height:100%;}body {top: 0;left: 0;margin: 0;padding: 0;width: 100%;height: 100%;overflow: hidden;}.ad {background-image: url(\"http://iad2v2-iadctest.iad.apple.com/adunits/f2/e7/68/00048f30-44e1-4f00-9eda-0022ed2dc67a/1.ad/video//asset_large-image-ipad-portrait.jpg\");height: 100%;width: 100%; }.ad--iphone {background-size: cover; }.ad--ipad {background-size: contain; }.ad--landscape {background-image: url(\"http://iad2v2-iadctest.iad.apple.com/adunits/f2/e7/68/00048f30-44e1-4f00-9eda-0022ed2dc67a/1.ad/video//\"); }.ad {display: flex;align-items: center;justify-content: center;background-position: center center;background-repeat: no-repeat;}.ad--iphone.ad--htmlinterstitial {background-position: top center;}</style><script src=\"mraid.js\"></script></head><body><article onClick=\"mraid.open('https://apple.news/subscription')\" id=\"ad-content\" class=\"ad ad--ipad ad--large\"></article><script>function changeClass() {var obj = document.getElementById('ad-content');if ( Math.abs(window.orientation) === 90) {obj.classList.remove('ad--portrait');obj.classList.add('ad--landscape');} else {obj.classList.remove('ad--landscape');obj.classList.add('ad--portrait');}}if ('large' === 'htmlinterstitial' && 'ipad' === 'iphone') {window.addEventListener('orientationchange', changeClass);window.addEventListener('resize', changeClass);window.addEventListener('load', changeClass);}</script></body></html>"),
    v45,
    v46,
    v47,
    v48);
  if (a3 == 3)
  {
    v49 = objc_alloc(MEMORY[0x24BDBCF48]);
    v55 = (void *)objc_msgSend_initWithString_(v49, v50, (uint64_t)CFSTR("https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8"), v51, v52, v53, v54);
    objc_msgSend_setVideoURL_(v6, v56, (uint64_t)v55, v57, v58, v59, v60);

    objc_msgSend_setBitrate_(v6, v61, v62, v63, v64, 100.0, v65);
    objc_msgSend_setSignalStrength_(v6, v66, 20, v67, v68, v69, v70);
    objc_msgSend_setConnectionType_(v6, v71, 1, v72, v73, v74, v75);
  }
  APLogForCategory();
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    v78 = 138412290;
    v79 = v6;
    _os_log_impl(&dword_21A211000, v76, OS_LOG_TYPE_INFO, "Returning mocked rep data %@", (uint8_t *)&v78, 0xCu);
  }

  return v6;
}

- (void)setRawAdType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setRawAdFormatType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setFrequencyCapData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setPolicyData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setTargetingDimensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setAdTag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setVideoURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setSkipThreshold:(double)a3
{
  self->_skipThreshold = a3;
}

- (void)setSkipEnabled:(BOOL)a3
{
  self->_skipEnabled = a3;
}

- (void)setUnbranded:(BOOL)a3
{
  self->_unbranded = a3;
}

- (void)setBitrate:(double)a3
{
  self->_bitrate = a3;
}

- (void)setSignalStrength:(unint64_t)a3
{
  self->_signalStrength = a3;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void)setArticleTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void)setAdvertiserName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setCampaignData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 192, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)targetingExpressionId
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setParentAppCheckEnabled:(BOOL)a3
{
  self->_parentAppCheckEnabled = a3;
}

- (void)setTimeToDisplay:(int64_t)a3
{
  self->_timeToDisplay = a3;
}

- (APOdmlServerResponse)odmlResponse
{
  return (APOdmlServerResponse *)objc_getProperty(self, a2, 304, 1);
}

- (void)setOdmlResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void)setOdmlSuccess:(BOOL)a3
{
  self->_odmlSuccess = a3;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void)setDeploymentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

@end
