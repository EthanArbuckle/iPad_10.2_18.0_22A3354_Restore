@implementation APContentData

- (BOOL)hasValidRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  BOOL v21;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;

  objc_msgSend_error(self, a2, v2, v3, v4, v5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || objc_msgSend_serverUnfilledReason(self, v8, v9, v10, v11, v13, v14))
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend_representations(self, v15, v16, v17, v18, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_count(v23, v24, v25, v26, v27, v28, v29) != 0;

  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_adServerEnvironment, 0);
  objc_storeStrong((id *)&self->_receivedReferenceTime, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_campaignText, 0);
  objc_storeStrong((id *)&self->_brandName, 0);
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_targetingExpressionId, 0);
  objc_storeStrong((id *)&self->_disclosureRendererPayload, 0);
  objc_storeStrong((id *)&self->_disclosureURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_journeyIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_representations, 0);
}

- (void)addRepresentations:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16, 0.0, v6);
  if (v7)
  {
    v13 = v7;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v4);
        objc_msgSend_addRepresentation_(self, v8, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v9, v10, v11, v12);
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v16, (uint64_t)v20, 16, v11, v12);
    }
    while (v13);
  }

}

- (void)addRepresentation:(id)a3
{
  NSMutableSet *representations;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  id v22;

  representations = self->_representations;
  v5 = a3;
  objc_msgSend_addObject_(representations, v6, (uint64_t)v5, v7, v8, v9, v10);
  objc_msgSend_identifier(self, v11, v12, v13, v14, v15, v16);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentDataIdentifier_(v5, v17, (uint64_t)v22, v18, v19, v20, v21);

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
  void *v55;
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
  void *v66;
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
  uint64_t v77;
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
  void *v99;
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
  void *v110;
  const char *v111;
  uint64_t v112;
  double v113;
  double v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  double v124;
  double v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  double v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  double v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  double v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  double v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  double v157;
  double v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  double v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  double v168;
  double v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  double v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  double v179;
  double v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  double v185;
  double v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  double v190;
  double v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  double v196;
  double v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  double v201;
  double v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  double v207;
  double v208;
  uint64_t isPAAvailableForAd;
  const char *v210;
  uint64_t v211;
  double v212;
  double v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  double v218;
  double v219;
  uint64_t isLocationAvailableForAd;
  const char *v221;
  uint64_t v222;
  double v223;
  double v224;
  NSObject *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  double v230;
  double v231;
  void *v232;
  id v233;
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
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  double v265;
  double v266;
  int v267;
  id v268;
  uint64_t v269;

  v269 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("identifier"), v13, v14, v15);

  objc_msgSend_contextIdentifier(self, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("contextIdentifier"), v24, v25, v26);

  objc_msgSend_journeyIdentifier(self, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("journeyIdentifier"), v35, v36, v37);

  objc_msgSend_metadata(self, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("metadata"), v46, v47, v48);

  objc_msgSend_disclosureURL(self, v49, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("disclosureURL"), v57, v58, v59);

  objc_msgSend_disclosureRendererPayload(self, v60, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, (uint64_t)CFSTR("disclosureRendererPayload"), v68, v69, v70);

  v77 = objc_msgSend_minimumTimeBetweenPresentation(self, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeInt_forKey_(v4, v78, v77, (uint64_t)CFSTR("minimumTimeBetweenPresentation"), v79, v80, v81);
  objc_msgSend_brandName(self, v82, v83, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, (uint64_t)CFSTR("brandName"), v90, v91, v92);

  objc_msgSend_campaignText(self, v93, v94, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, (uint64_t)CFSTR("campaignText"), v101, v102, v103);

  objc_msgSend_targetingExpressionId(self, v104, v105, v106, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v111, (uint64_t)v110, (uint64_t)CFSTR("targetingExpressionId"), v112, v113, v114);

  objc_msgSend_expirationDate(self, v115, v116, v117, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v122, (uint64_t)v121, (uint64_t)CFSTR("expirationDate"), v123, v124, v125);

  objc_msgSend_impressionThreshold(self, v126, v127, v128, v129, v130, v131);
  objc_msgSend_encodeDouble_forKey_(v4, v132, (uint64_t)CFSTR("impressionThreshold"), v133, v134, v135, v136);
  objc_msgSend_impressionVisibilityThreshold(self, v137, v138, v139, v140, v141, v142);
  objc_msgSend_encodeDouble_forKey_(v4, v143, (uint64_t)CFSTR("impressionVisiblityThreshold"), v144, v145, v146, v147);
  v154 = objc_msgSend_serverUnfilledReason(self, v148, v149, v150, v151, v152, v153);
  objc_msgSend_encodeInt_forKey_(v4, v155, v154, (uint64_t)CFSTR("serverUnfilledReason"), v156, v157, v158);
  objc_msgSend_error(self, v159, v160, v161, v162, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v166, (uint64_t)v165, (uint64_t)CFSTR("error"), v167, v168, v169);

  objc_msgSend_installAttribution(self, v170, v171, v172, v173, v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v177, (uint64_t)v176, (uint64_t)CFSTR("installAttribution"), v178, v179, v180);

  objc_msgSend_serverResponseReceivedTimestamp(self, v181, v182, v183, v184, v185, v186);
  objc_msgSend_encodeDouble_forKey_(v4, v187, (uint64_t)CFSTR("serverResponseReceivedTimestamp"), v188, v189, v190, v191);
  objc_msgSend_receivedReferenceTime(self, v192, v193, v194, v195, v196, v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v199, (uint64_t)v198, (uint64_t)CFSTR("receivedReferenceTime"), v200, v201, v202);

  isPAAvailableForAd = objc_msgSend_isPAAvailableForAd(self, v203, v204, v205, v206, v207, v208);
  objc_msgSend_encodeBool_forKey_(v4, v210, isPAAvailableForAd, (uint64_t)CFSTR("personalizedAdsEnabledKey"), v211, v212, v213);
  isLocationAvailableForAd = objc_msgSend_isLocationAvailableForAd(self, v214, v215, v216, v217, v218, v219);
  objc_msgSend_encodeBool_forKey_(v4, v221, isLocationAvailableForAd, (uint64_t)CFSTR("locationEnabledKey"), v222, v223, v224);
  APLogForCategory();
  v225 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_representations(self, v226, v227, v228, v229, v230, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = 138412290;
    v268 = (id)objc_opt_class();
    v233 = v268;
    _os_log_impl(&dword_21A211000, v225, OS_LOG_TYPE_INFO, "Encoding apcontentdata with representations: %@", (uint8_t *)&v267, 0xCu);

  }
  objc_msgSend_representations(self, v234, v235, v236, v237, v238, v239);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v241, (uint64_t)v240, (uint64_t)CFSTR("representationsKey"), v242, v243, v244);

  objc_msgSend_adServerEnvironment(self, v245, v246, v247, v248, v249, v250);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v252, (uint64_t)v251, (uint64_t)CFSTR("adServerEnvironment"), v253, v254, v255);

  v262 = objc_msgSend_diagnosticCode(self, v256, v257, v258, v259, v260, v261);
  objc_msgSend_encodeInt_forKey_(v4, v263, v262, (uint64_t)CFSTR("diagnosticCode"), v264, v265, v266);

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)representations
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)journeyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 120, 1);
}

- (NSUUID)contextIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)adServerEnvironment
{
  return self->_adServerEnvironment;
}

- (double)serverResponseReceivedTimestamp
{
  return self->_serverResponseReceivedTimestamp;
}

- (int64_t)serverUnfilledReason
{
  return self->_serverUnfilledReason;
}

- (NSDate)receivedReferenceTime
{
  return self->_receivedReferenceTime;
}

- (unint64_t)minimumTimeBetweenPresentation
{
  return self->_minimumTimeBetweenPresentation;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isPAAvailableForAd
{
  return self->_isPAAvailableForAd;
}

- (BOOL)isLocationAvailableForAd
{
  return self->_isLocationAvailableForAd;
}

- (APInstallAttribution)installAttribution
{
  return (APInstallAttribution *)objc_getProperty(self, a2, 96, 1);
}

- (double)impressionThreshold
{
  return self->_impressionThreshold;
}

- (NSURL)disclosureURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)disclosureRendererPayload
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (int64_t)diagnosticCode
{
  return self->_diagnosticCode;
}

- (NSString)campaignText
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)brandName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)targetingExpressionId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (double)impressionVisibilityThreshold
{
  return self->_impressionVisibilityThreshold;
}

- (APContentData)initWithCoder:(id)a3
{
  id v4;
  APContentData *v5;
  APContentData *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  NSUUID *contextIdentifier;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  NSString *journeyIdentifier;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  NSDictionary *metadata;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  NSURL *disclosureURL;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  double v63;
  double v64;
  uint64_t v65;
  NSString *disclosureRendererPayload;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  double v70;
  double v71;
  uint64_t v72;
  NSString *brandName;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  double v77;
  double v78;
  uint64_t v79;
  NSString *campaignText;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  double v84;
  double v85;
  uint64_t v86;
  NSString *targetingExpressionId;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  double v91;
  double v92;
  uint64_t v93;
  NSDate *expirationDate;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  double v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  double v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  double v113;
  double v114;
  uint64_t v115;
  NSError *error;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  double v120;
  double v121;
  uint64_t v122;
  APInstallAttribution *installAttribution;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  double v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  double v137;
  double v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  uint64_t v146;
  NSMutableSet *representations;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  double v152;
  double v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  double v157;
  double v158;
  uint64_t v159;
  NSDate *receivedReferenceTime;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  double v164;
  double v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  double v169;
  double v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
  double v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  double v182;
  double v183;
  uint64_t v184;
  NSArray *adServerEnvironment;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  double v189;
  double v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  double v195;
  double v196;
  void *context;
  objc_super v199;

  v4 = a3;
  v199.receiver = self;
  v199.super_class = (Class)APContentData;
  v5 = -[APContentData init](&v199, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_diagnosticCode = -1;
    context = (void *)MEMORY[0x22073D684]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("identifier"), v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("contextIdentifier"), v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    contextIdentifier = v6->_contextIdentifier;
    v6->_contextIdentifier = (NSUUID *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("journeyIdentifier"), v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    journeyIdentifier = v6->_journeyIdentifier;
    v6->_journeyIdentifier = (NSString *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend_setWithObjects_(v28, v31, v29, v32, v33, v34, v35, v30, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, (uint64_t)CFSTR("metadata"), v38, v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v41;

    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)CFSTR("disclosureURL"), v45, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    disclosureURL = v6->_disclosureURL;
    v6->_disclosureURL = (NSURL *)v48;

    if (objc_msgSend_containsValueForKey_(v4, v50, (uint64_t)CFSTR("disclosureRendererPayload"), v51, v52, v53, v54))
    {
      v60 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, (uint64_t)CFSTR("disclosureRendererPayload"), v62, v63, v64);
      v65 = objc_claimAutoreleasedReturnValue();
      disclosureRendererPayload = v6->_disclosureRendererPayload;
      v6->_disclosureRendererPayload = (NSString *)v65;

    }
    v6->_minimumTimeBetweenPresentation = (int)objc_msgSend_decodeIntForKey_(v4, v55, (uint64_t)CFSTR("minimumTimeBetweenPresentation"), v56, v57, v58, v59);
    v67 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, (uint64_t)CFSTR("brandName"), v69, v70, v71);
    v72 = objc_claimAutoreleasedReturnValue();
    brandName = v6->_brandName;
    v6->_brandName = (NSString *)v72;

    v74 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v75, v74, (uint64_t)CFSTR("campaignText"), v76, v77, v78);
    v79 = objc_claimAutoreleasedReturnValue();
    campaignText = v6->_campaignText;
    v6->_campaignText = (NSString *)v79;

    v81 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, (uint64_t)CFSTR("targetingExpressionId"), v83, v84, v85);
    v86 = objc_claimAutoreleasedReturnValue();
    targetingExpressionId = v6->_targetingExpressionId;
    v6->_targetingExpressionId = (NSString *)v86;

    v88 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v88, (uint64_t)CFSTR("expirationDate"), v90, v91, v92);
    v93 = objc_claimAutoreleasedReturnValue();
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v93;

    objc_msgSend_decodeDoubleForKey_(v4, v95, (uint64_t)CFSTR("impressionThreshold"), v96, v97, v98, v99);
    v6->_impressionThreshold = v100;
    objc_msgSend_decodeDoubleForKey_(v4, v101, (uint64_t)CFSTR("impressionVisiblityThreshold"), v102, v103, v100, v104);
    v6->_impressionVisibilityThreshold = v105;
    v6->_serverUnfilledReason = (int)objc_msgSend_decodeIntForKey_(v4, v106, (uint64_t)CFSTR("serverUnfilledReason"), v107, v108, v105, v109);
    v110 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v111, v110, (uint64_t)CFSTR("error"), v112, v113, v114);
    v115 = objc_claimAutoreleasedReturnValue();
    error = v6->_error;
    v6->_error = (NSError *)v115;

    v117 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v118, v117, (uint64_t)CFSTR("installAttribution"), v119, v120, v121);
    v122 = objc_claimAutoreleasedReturnValue();
    installAttribution = v6->_installAttribution;
    v6->_installAttribution = (APInstallAttribution *)v122;

    v124 = (void *)MEMORY[0x24BDBCF20];
    v125 = objc_opt_class();
    v126 = objc_opt_class();
    v127 = objc_opt_class();
    v128 = objc_opt_class();
    objc_msgSend_setWithObjects_(v124, v129, v125, v130, v131, v132, v133, v126, v127, v128, 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v135, (uint64_t)v134, (uint64_t)CFSTR("representationsKey"), v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend_mutableCopy(v139, v140, v141, v142, v143, v144, v145);
    representations = v6->_representations;
    v6->_representations = (NSMutableSet *)v146;

    objc_msgSend_decodeDoubleForKey_(v4, v148, (uint64_t)CFSTR("serverResponseReceivedTimestamp"), v149, v150, v151, v152);
    v6->_serverResponseReceivedTimestamp = v153;
    v154 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v155, v154, (uint64_t)CFSTR("receivedReferenceTime"), v156, v157, v158);
    v159 = objc_claimAutoreleasedReturnValue();
    receivedReferenceTime = v6->_receivedReferenceTime;
    v6->_receivedReferenceTime = (NSDate *)v159;

    v6->_isPAAvailableForAd = objc_msgSend_decodeBoolForKey_(v4, v161, (uint64_t)CFSTR("personalizedAdsEnabledKey"), v162, v163, v164, v165);
    v6->_isLocationAvailableForAd = objc_msgSend_decodeBoolForKey_(v4, v166, (uint64_t)CFSTR("locationEnabledKey"), v167, v168, v169, v170);
    v171 = (void *)MEMORY[0x24BDBCF20];
    v172 = objc_opt_class();
    v173 = objc_opt_class();
    objc_msgSend_setWithObjects_(v171, v174, v172, v175, v176, v177, v178, v173, 0);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v180, (uint64_t)v179, (uint64_t)CFSTR("adServerEnvironment"), v181, v182, v183);
    v184 = objc_claimAutoreleasedReturnValue();
    adServerEnvironment = v6->_adServerEnvironment;
    v6->_adServerEnvironment = (NSArray *)v184;

    v6->_diagnosticCode = (int)objc_msgSend_decodeIntForKey_(v4, v186, (uint64_t)CFSTR("diagnosticCode"), v187, v188, v189, v190);
    objc_msgSend__correctNonNullableFields(v6, v191, v192, v193, v194, v195, v196);

    objc_autoreleasePoolPop(context);
  }

  return v6;
}

- (APContentData)init
{
  APContentData *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  APContentData *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)APContentData;
  v2 = -[APContentData init](&v11, sel_init);
  v9 = v2;
  if (v2)
  {
    objc_msgSend__correctNonNullableFields(v2, v3, v4, v5, v6, v7, v8);
    v9->_diagnosticCode = -1;
  }
  return v9;
}

- (void)_correctNonNullableFields
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  NSString *v15;
  NSString *identifier;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  NSUUID *v23;
  NSUUID *contextIdentifier;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  NSString *v32;
  NSString *journeyIdentifier;
  NSMutableSet *v34;
  NSMutableSet *representations;
  NSDate *v36;
  NSDate *expirationDate;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_identifier)
  {
    objc_msgSend_UUID(MEMORY[0x24BDD1880], a2, v2, v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v8, v9, v10, v11, v12, v13, v14);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v15;

  }
  if (!self->_contextIdentifier)
  {
    v38[0] = 0;
    v38[1] = 0;
    v17 = objc_alloc(MEMORY[0x24BDD1880]);
    v23 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v17, v18, (uint64_t)v38, v19, v20, v21, v22);
    contextIdentifier = self->_contextIdentifier;
    self->_contextIdentifier = v23;

  }
  if (!self->_journeyIdentifier)
  {
    objc_msgSend_UUID(MEMORY[0x24BDD1880], a2, v2, v3, v4, v5, v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v25, v26, v27, v28, v29, v30, v31);
    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    journeyIdentifier = self->_journeyIdentifier;
    self->_journeyIdentifier = v32;

  }
  if (!self->_uniqueIdentifier)
  {
    self->_uniqueIdentifier = (NSString *)CFSTR("UniqueIdentifierPlaceholder");

  }
  if (!self->_representations)
  {
    objc_msgSend_set(MEMORY[0x24BDBCEF0], a2, v2, v3, v4, v5, v6);
    v34 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    representations = self->_representations;
    self->_representations = v34;

  }
  if (!self->_expirationDate)
  {
    objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], a2, v2, v3, v4, v5, v6);
    v36 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v36;

  }
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setServerUnfilledReason:(int64_t)a3
{
  self->_serverUnfilledReason = a3;
}

- (void)setReceivedReferenceTime:(id)a3
{
  objc_storeStrong((id *)&self->_receivedReferenceTime, a3);
}

- (void)setIsPAAvailableForAd:(BOOL)a3
{
  self->_isPAAvailableForAd = a3;
}

- (void)setIsLocationAvailableForAd:(BOOL)a3
{
  self->_isLocationAvailableForAd = a3;
}

- (void)setContextIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setServerResponseReceivedTimestamp:(double)a3
{
  self->_serverResponseReceivedTimestamp = a3;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setDisclosureURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setDisclosureRendererPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

+ (id)createForServerUnfilledReason:(int64_t)a3 placementType:(int64_t)a4 contextIdentifier:(id)a5
{
  return (id)MEMORY[0x24BEDD108](APContentData, sel_createForServerUnfilledReason_placementType_contextIdentifier_size_, a3, a4, a5, 0.0, 0.0);
}

+ (id)createForServerUnfilledReason:(int64_t)a3 placementType:(int64_t)a4 contextIdentifier:(id)a5 size:(id)a6
{
  double var1;
  double var0;
  id v10;
  APContentData *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  APRepresentationData *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;

  var1 = a6.var1;
  var0 = a6.var0;
  v10 = a5;
  v11 = objc_alloc_init(APContentData);
  objc_msgSend_setServerUnfilledReason_(v11, v12, a3, v13, v14, v15, v16);
  objc_msgSend_setContextIdentifier_(v11, v17, (uint64_t)v10, v18, v19, v20, v21);

  v22 = objc_alloc_init(APRepresentationData);
  objc_msgSend_setPlacementType_(v22, v23, a4, v24, v25, v26, v27);
  objc_msgSend_setSize_(v22, v28, v29, v30, v31, var0, var1);
  objc_msgSend_identifier(v11, v32, v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentDataIdentifier_(v22, v39, (uint64_t)v38, v40, v41, v42, v43);

  objc_msgSend_UUID(MEMORY[0x24BDD1880], v44, v45, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIAdID_(v22, v51, (uint64_t)v50, v52, v53, v54, v55);

  objc_msgSend_UUID(MEMORY[0x24BDD1880], v56, v57, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImpressionID_(v22, v63, (uint64_t)v62, v64, v65, v66, v67);

  objc_msgSend_addRepresentation_(v11, v68, (uint64_t)v22, v69, v70, v71, v72);
  return v11;
}

+ (id)mockDataFromContext:(id)a3 types:(id)a4
{
  id v5;
  id v6;
  APContentData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
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
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  void *v92;
  id v93;
  const char *v94;
  double v95;
  double v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  double v111;
  double v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  NSObject *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  double v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  double v130;
  void *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t buf[4];
  void *v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(APContentData);
  v132 = v5;
  objc_msgSend_identifier(v5, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextIdentifier_(v7, v15, (uint64_t)v14, v16, v17, v18, v19);

  objc_msgSend_UUID(MEMORY[0x24BDD1880], v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v26, v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setJourneyIdentifier_(v7, v34, (uint64_t)v33, v35, v36, v37, v38);

  objc_msgSend_setMetadata_(v7, v39, MEMORY[0x24BDBD1B8], v40, v41, v42, v43);
  objc_msgSend_setDisclosureRendererPayload_(v7, v44, (uint64_t)CFSTR("CAISBWVuX1VTOAFwAg"), v45, v46, v47, v48);
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v49, (uint64_t)CFSTR("https://iad2v1-iadsdk.iad.apple.com/adserver/2.6/segment/privacyrender/1.0/ad"), v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisclosureURL_(v7, v55, (uint64_t)v54, v56, v57, v58, v59);

  objc_msgSend_setMinimumTimeBetweenPresentation_(v7, v60, 2, v61, v62, v63, v64);
  objc_msgSend_setBrandName_(v7, v65, (uint64_t)CFSTR("Brand name"), v66, v67, v68, v69);
  objc_msgSend_setCampaignText_(v7, v70, (uint64_t)CFSTR("Campaign text"), v71, v72, v73, v74);
  objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v75, v76, v77, v78, 3600.0, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpirationDate_(v7, v81, (uint64_t)v80, v82, v83, v84, v85);

  objc_msgSend_array(MEMORY[0x24BDBCEB8], v86, v87, v88, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v93 = v6;
  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v133, (uint64_t)v139, 16, v95, v96);
  if (v97)
  {
    v104 = v97;
    v105 = *(_QWORD *)v134;
    do
    {
      v106 = 0;
      do
      {
        if (*(_QWORD *)v134 != v105)
          objc_enumerationMutation(v93);
        switch(objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v133 + 1) + 8 * v106), v98, v99, v100, v101, v102, v103))
        {
          case 0:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeAnyBanner", buf, 2u);
            }
            v108 = 0;
            break;
          case 1:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeInterstitial", buf, 2u);
            }
            v108 = 1;
            break;
          case 2:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeAudio", buf, 2u);
            }
            v108 = 2;
            break;
          case 3:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeVideo", buf, 2u);
            }
            v108 = 3;
            break;
          case 4:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeNative", buf, 2u);
            }
            v108 = 4;
            break;
          case 5:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeApp", buf, 2u);
            }
            v108 = 5;
            break;
          case 7:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeSponsorship", buf, 2u);
            }
            v108 = 7;
            break;
          default:
            APLogForCategory();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21A211000, v107, OS_LOG_TYPE_INFO, "Creating representation with APPlacementTypeUndefined", buf, 2u);
            }
            v108 = -1;
            break;
        }

        objc_msgSend_mockRepresentationWithType_contentData_(APRepresentationData, v109, v108, (uint64_t)v7, v110, v111, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v92, v114, (uint64_t)v113, v115, v116, v117, v118);

        ++v106;
      }
      while (v104 != v106);
      v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v98, (uint64_t)&v133, (uint64_t)v139, 16, v102, v103);
    }
    while (v104);
  }

  APLogForCategory();
  v119 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v138 = v92;
    _os_log_impl(&dword_21A211000, v119, OS_LOG_TYPE_INFO, "Creating representations set with %{public}@", buf, 0xCu);
  }

  objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v120, (uint64_t)v92, v121, v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRepresentations_(v7, v126, (uint64_t)v125, v127, v128, v129, v130);

  return v7;
}

- (void)removeRepresentation:(id)a3
{
  NSMutableSet *representations;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;

  representations = self->_representations;
  v14 = a3;
  objc_msgSend_removeObject_(representations, v4, (uint64_t)v14, v5, v6, v7, v8);
  objc_msgSend_setContentDataIdentifier_(v14, v9, 0, v10, v11, v12, v13);

}

- (id)getRepresentation
{
  return (id)((uint64_t (*)(NSMutableSet *, char *))MEMORY[0x24BEDD108])(self->_representations, sel_anyObject);
}

- (id)representationWithIdentifier:(id)a3
{
  id v4;
  NSMutableSet *representations;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_21A21AA80;
  v21 = sub_21A21AA90;
  v22 = 0;
  representations = self->_representations;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_21A21AA98;
  v14[3] = &unk_24DC806F8;
  v6 = v4;
  v15 = v6;
  v16 = &v17;
  objc_msgSend_enumerateObjectsUsingBlock_(representations, v7, (uint64_t)v14, v8, v9, v10, v11);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (int64_t)pricingModel
{
  return 103;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setJourneyIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setTargetingExpressionId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setMinimumTimeBetweenPresentation:(unint64_t)a3
{
  self->_minimumTimeBetweenPresentation = a3;
}

- (void)setInstallAttribution:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setRepresentations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setBrandName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setCampaignText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setImpressionThreshold:(double)a3
{
  self->_impressionThreshold = a3;
}

- (void)setImpressionVisibilityThreshold:(double)a3
{
  self->_impressionVisibilityThreshold = a3;
}

- (void)setDiagnosticCode:(int64_t)a3
{
  self->_diagnosticCode = a3;
}

- (void)setAdServerEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_adServerEnvironment, a3);
}

- (NSString)humanReadableName
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setHumanReadableName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

@end
