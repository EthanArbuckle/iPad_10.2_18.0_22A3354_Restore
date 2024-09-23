@implementation FCTagRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C6F0;
}

- (id)recordType
{
  return CFSTR("Tag");
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v18;
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
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
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
  unint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
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
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t i;
  char *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  char *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
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
  id v174;
  void *v175;
  void *v176;
  unint64_t v177;
  id v178;
  uint64_t v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  unint64_t v186;
  unint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  void *v197;
  void *v198;
  id v199;
  id v200;
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
  void *v218;
  void *v219;
  NSObject *v220;
  char *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  FCTagRecordSource *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  void *v248;
  void *v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  uint8_t buf[4];
  const char *v255;
  __int16 v256;
  char *v257;
  __int16 v258;
  int v259;
  __int16 v260;
  void *v261;
  _BYTE v262[128];
  uint64_t v263;

  v263 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v246 = objc_alloc_init(MEMORY[0x1E0D62848]);
  v248 = v7;
  objc_msgSend(v246, "setBase:", v7);
  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v9);
  v233 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nameCompact"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v12);
  v243 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v13);
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v14);
  v241 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v15);
  v240 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v16);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v17);
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource resolveLocalizableExperimentalizableFieldforKey:inRecord:activeExperimentIDKey:](self, "resolveLocalizableExperimentalizableFieldforKey:inRecord:activeExperimentIDKey:");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v19);
  v237 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v20);
  v236 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v21);
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  v244 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v22);
  v235 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource experimentalizedKeysByOriginalKey](self, "experimentalizedKeysByOriginalKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("activeExperimentID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v229 = v23;
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("publisherSpecifiedArticleIDs"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("publisherSpecifiedArticleIDs"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = (void *)v18;
  v227 = v27;
  v228 = v25;
  v226 = v28;
  v234 = self;
  if (objc_msgSend(v27, "count"))
  {
    -[FCRecordSource activeTreatmentID](self, "activeTreatmentID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", v29))
      v30 = v27;
    else
      v30 = v28;
    v31 = v30;

  }
  else
  {
    v31 = v28;
  }
  v225 = v31;
  v32 = (void *)objc_msgSend(v31, "mutableCopy");
  objc_msgSend(v246, "setPublisherSpecifiedArticleIDs:", v32);

  objc_msgSend(v6, "objectForKey:", CFSTR("publisherSpecifiedArticles"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setPublisherSpecifiedArticlesJson:", v33);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("publisherSpecifiedArticleIDsModifiedDate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v11;
  if (v34)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v34;
    else
      v36 = 0;
  }
  else
  {
    v36 = 0;
  }
  v37 = v36;
  objc_msgSend(v37, "pbDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setPublisherSpecifiedArticleIDsModifiedDate:", v38);

  -[FCRecordSource localizedLanguageSpecificKeysByOriginalKey](self, "localizedLanguageSpecificKeysByOriginalKey");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "objectForKeyedSubscript:", CFSTR("name"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("hideAccessoryText"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setHideAccessoryText:", objc_msgSend(v41, "BOOLValue"));

  v223 = v40;
  if (objc_msgSend(v40, "length") || (v40 = v233, objc_msgSend(v233, "length")))
  {
    objc_msgSend(v246, "setName:", v40);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("name"));
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "setName:", v218);

  }
  if (objc_msgSend(v11, "length"))
  {
    v42 = v246;
    objc_msgSend(v246, "setNameCompact:", v11);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("nameCompact"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v246;
    objc_msgSend(v246, "setNameCompact:", v43);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("type"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setType:", PBTagTypeFromString(v44));

  objc_msgSend(v6, "objectForKey:", CFSTR("primaryAudience"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setPrimaryAudience:", v45);

  objc_msgSend(v6, "objectForKey:", CFSTR("primaryAudience"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setIsExplicitContent:", objc_msgSend(v46, "isEqualToString:", CFSTR("MATURE")));

  objc_msgSend(v6, "objectForKey:", CFSTR("contentProvider"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setContentProvider:", objc_msgSend(v47, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("isPublic"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setIsPublic:", objc_msgSend(v48, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("isDeprecated"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setIsDeprecated:", objc_msgSend(v49, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("replacementID"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setReplacementID:", v50);

  objc_msgSend(v6, "objectForKey:", CFSTR("parent"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "recordID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "recordName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setParentID:", v53);

  objc_msgSend(v6, "objectForKey:", CFSTR("defaultSectionTagID"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setChannelDefaultSectionID:", v54);

  objc_msgSend(v6, "objectForKey:", CFSTR("sectionTagIDs"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "mutableCopy");
  objc_msgSend(v42, "setChannelSectionIDs:", v56);

  v57 = 0x1E0CB3000uLL;
  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("logoImage"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v59 = v58;
    else
      v59 = 0;
  }
  else
  {
    v59 = 0;
  }
  v60 = v59;
  v61 = v246;
  objc_msgSend(v246, "setLogoURL:", v60);

  objc_msgSend(v6, "objectForKey:", CFSTR("iAdCategories"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v62, "mutableCopy");
  objc_msgSend(v246, "setIAdCategories:", v63);

  objc_msgSend(v6, "objectForKey:", CFSTR("iAdKeywords"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v64, "mutableCopy");
  objc_msgSend(v246, "setIAdKeywords:", v65);

  objc_msgSend(v6, "objectForKey:", CFSTR("blockedStorefrontIDs"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v66, "mutableCopy");
  objc_msgSend(v246, "setBlockedStorefrontIDs:", v67);

  objc_msgSend(v6, "objectForKey:", CFSTR("allowedStorefrontIDs"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v68, "mutableCopy");
  objc_msgSend(v246, "setAllowedStorefrontIDs:", v69);

  v70 = objc_msgSend(v243, "length");
  v71 = (void *)MEMORY[0x1E0D626C8];
  if (v70)
  {
    objc_msgSend(MEMORY[0x1E0D626C8], "feedConfigurationFromJSON:", v243);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "setFeedConfiguration:", v72);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("feedConfiguration"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "feedConfigurationFromJSON:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "setFeedConfiguration:", v73);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("nameImage"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v75 = v74;
    else
      v75 = 0;
  }
  else
  {
    v75 = 0;
  }
  v76 = v75;
  objc_msgSend(v246, "setNameImageURL:", v76);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageCompact"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v78 = v77;
    else
      v78 = 0;
  }
  else
  {
    v78 = 0;
  }
  v79 = v78;
  objc_msgSend(v246, "setNameImageCompactURL:", v79);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageForDarkBackground"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v81 = v80;
    else
      v81 = 0;
  }
  else
  {
    v81 = 0;
  }
  v82 = v81;
  objc_msgSend(v246, "setNameImageForDarkBackgroundURL:", v82);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageMask"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v84 = v83;
    else
      v84 = 0;
  }
  else
  {
    v84 = 0;
  }
  v85 = v84;
  objc_msgSend(v246, "setNameImageMaskURL:", v85);

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageMetadata"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNameImageMetadata:", v86);

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageCompactMetadata"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNameImageCompactMetadata:", v87);

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageMaskWidgetSmall"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNameImageMaskWidgetLQURL:", v88);

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageMaskWidgetLarge"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNameImageMaskWidgetHQURL:", v89);

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageLarge"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNameImageLargeURL:", v90);

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageLargeMask"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNameImageLargeMaskURL:", v91);

  objc_msgSend(v6, "objectForKey:", CFSTR("navigationChromeBackgroundImage"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNavigationChromeBackgroundImageURL:", v92);

  objc_msgSend(v6, "objectForKey:", CFSTR("navigationChromeBackgroundDarkModeImage"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setDarkStyleNavigationChromeBackgroundImageURL:", v93);

  objc_msgSend(v6, "objectForKey:", CFSTR("navigationChromeBackgroundImageCompact"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNavigationChromeBackgroundImageCompactURL:", v94);

  objc_msgSend(v6, "objectForKey:", CFSTR("navigationChromeBackgroundDarkModeImageCompact"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setDarkStyleNavigationChromeBackgroundImageCompactURL:", v95);

  objc_msgSend(v6, "objectForKey:", CFSTR("navigationChromeBackgroundImageLarge"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setNavigationChromeBackgroundImageLargeURL:", v96);

  objc_msgSend(v6, "objectForKey:", CFSTR("navigationChromeBackgroundDarkModeImageLarge"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setDarkStyleNavigationChromeBackgroundImageLargeURL:", v97);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("coverImage"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v99 = v98;
    else
      v99 = 0;
  }
  else
  {
    v99 = 0;
  }
  v100 = v99;
  objc_msgSend(v246, "setCoverImageURL:", v100);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("feedNavImage"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v102 = v101;
    else
      v102 = 0;
  }
  else
  {
    v102 = 0;
  }
  v103 = v102;
  objc_msgSend(v246, "setFeedNavImageURL:", v103);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("feedNavImageHQ"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v105 = v104;
    else
      v105 = 0;
  }
  else
  {
    v105 = 0;
  }
  v106 = v105;
  objc_msgSend(v246, "setFeedNavImageHQURL:", v106);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("language"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v108 = v107;
    else
      v108 = 0;
  }
  else
  {
    v108 = 0;
  }
  v109 = v108;
  objc_msgSend(v246, "setLanguage:", v109);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("magazineGenre"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v111 = v110;
    else
      v111 = 0;
  }
  else
  {
    v111 = 0;
  }
  v112 = v111;
  objc_msgSend(v246, "setMagazineGenre:", v112);

  objc_msgSend(v6, "objectForKey:", CFSTR("template"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setTemplateJson:", v113);

  objc_msgSend(v6, "objectForKey:", CFSTR("score"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setScore:", objc_msgSend(v114, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("minNewsVersion"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v115));

  objc_msgSend(v6, "objectForKey:", CFSTR("isNotificationEnabled"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setIsNotificationEnabled:", objc_msgSend(v116, "BOOLValue"));

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("subtitle"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v118 = v117;
    else
      v118 = 0;
  }
  else
  {
    v118 = 0;
  }
  v119 = v118;
  objc_msgSend(v246, "setSubtitle:", v119);

  objc_msgSend(v6, "objectForKey:", CFSTR("latestIssueIDs"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setLatestIssueIDs:", v120);

  objc_msgSend(v6, "objectForKey:", CFSTR("recentIssueIDs"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setRecentIssueIDs:", v121);

  objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("highlightsArticleListID"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setHighlightsArticleListID:", v123);

  objc_msgSend(v6, "objectForKey:", CFSTR("archiveIssueListID"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "setArchiveIssueListID:", v124);

  if (v235)
  {
    objc_msgSend(v235, "doubleValue");
    objc_msgSend(v246, "setSubscriptionRate:");
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("subscriptionRate"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "doubleValue");
    objc_msgSend(v246, "setSubscriptionRate:");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("adTargetingKeywords"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)objc_msgSend(v126, "mutableCopy");
  objc_msgSend(v246, "setAdTargetingKeywords:", v127);

  if (objc_msgSend(v240, "length"))
  {
    v128 = v240;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("sectionFeedConfiguration"));
    v128 = (id)objc_claimAutoreleasedReturnValue();
  }
  v222 = v128;
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "objectForKey:", CFSTR("sectionFeedConfigurations"));
  v130 = objc_claimAutoreleasedReturnValue();

  v245 = v6;
  v232 = v35;
  v249 = (void *)v130;
  if (v130)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = 0u;
    v251 = 0u;
    v252 = 0u;
    v253 = 0u;
    objc_msgSend(v246, "channelSectionIDs");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v250, v262, 16);
    if (v133)
    {
      v134 = v133;
      v135 = *(_QWORD *)v251;
      do
      {
        for (i = 0; i != v134; ++i)
        {
          if (*(_QWORD *)v251 != v135)
            objc_enumerationMutation(v132);
          v137 = *(char **)(*((_QWORD *)&v250 + 1) + 8 * i);
          v138 = (void *)MEMORY[0x1E0D626C8];
          objc_msgSend(v249, "objectForKeyedSubscript:", v137);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "feedConfigurationFromDict:", v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();

          if (v140)
          {
            objc_msgSend(v131, "addObject:", v140);
          }
          else
          {
            v141 = (void *)FCRecordSourceLog;
            if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_ERROR))
            {
              v142 = v141;
              objc_msgSend(v248, "identifier");
              v143 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v255 = v143;
              v256 = 2112;
              v257 = v137;
              _os_log_error_impl(&dword_1A1B90000, v142, OS_LOG_TYPE_ERROR, "channel %@ is missing a feed configuration for section %@", buf, 0x16u);

            }
          }

        }
        v134 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v250, v262, 16);
      }
      while (v134);
    }

    v61 = v246;
    objc_msgSend(v246, "setChannelSectionFeedConfigurations:", v131);

    v57 = 0x1E0CB3000;
  }
  else
  {
    objc_msgSend(v246, "channelSectionIDs");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = objc_msgSend(v144, "count");

    if (v145)
    {
      v146 = (void *)FCRecordSourceLog;
      if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_ERROR))
      {
        v220 = v146;
        objc_msgSend(v248, "identifier");
        v221 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v255 = v221;
        _os_log_error_impl(&dword_1A1B90000, v220, OS_LOG_TYPE_ERROR, "channel %@ is missing section feed configurations", buf, 0xCu);

      }
    }
  }
  if (objc_msgSend(v239, "length"))
  {
    objc_msgSend(v61, "setStocksFeedConfigurationJson:", v239);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stocksFeedConfiguration"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setStocksFeedConfigurationJson:", v147);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidAuthorizationURL"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (v148)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v149 = v148;
    else
      v149 = 0;
  }
  else
  {
    v149 = 0;
  }
  v150 = v149;
  objc_msgSend(v61, "setPublisherPaidAuthorizationURL:", v150);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidVerificationURL"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v152 = v151;
    else
      v152 = 0;
  }
  else
  {
    v152 = 0;
  }
  v153 = v152;
  objc_msgSend(v61, "setPublisherPaidVerificationURL:", v153);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidWebAccessURL"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (v154)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v155 = v154;
    else
      v155 = 0;
  }
  else
  {
    v155 = 0;
  }
  v156 = v155;
  objc_msgSend(v61, "setPublisherPaidWebaccessURL:", v156);

  v157 = objc_msgSend(v242, "length");
  v158 = (void *)MEMORY[0x1E0D627C8];
  if (v157)
  {
    objc_msgSend(MEMORY[0x1E0D627C8], "purchaseOfferableConfigurationsFromJSON:", v242);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setPurchaseOfferableConfigurations:", v159);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidOfferableConfig"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "purchaseOfferableConfigurationsFromJSON:", v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setPurchaseOfferableConfigurations:", v160);

  }
  v161 = objc_msgSend(v241, "length");
  v162 = (void *)MEMORY[0x1E0D627B0];
  if (v161)
  {
    objc_msgSend(MEMORY[0x1E0D627B0], "publisherPaidDescriptionStringsFromJSON:", v241);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setPublisherPaidDescriptionStrings:", v163);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidDescriptionStrings"));
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "publisherPaidDescriptionStringsFromJSON:", v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setPublisherPaidDescriptionStrings:", v164);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidFeldsparablePurchaseIDs"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = (void *)objc_msgSend(v165, "mutableCopy");
  objc_msgSend(v61, "setPublisherPaidFeldsparablePurchaseIDs:", v166);

  objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidBundlePurchaseIDs"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = (void *)objc_msgSend(v167, "mutableCopy");
  objc_msgSend(v61, "setPublisherPaidBundlePurchaseIDs:", v168);

  objc_msgSend(v6, "objectForKey:", CFSTR("publisherPaidLeakyPaywallOptOut"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setPublisherPaidLeakyPaywallOptOut:", objc_msgSend(v169, "BOOLValue"));

  objc_msgSend(v61, "publisherPaidWebaccessURL");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setPublisherPaidWebOptIn:", objc_msgSend(v170, "length") != 0);

  objc_opt_class();
  objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("paidBundleSubscriptionButtonConfig"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v173 = v172;
    else
      v173 = 0;
  }
  else
  {
    v173 = 0;
  }
  v174 = v173;

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("paidBundleSubscriptionButtonConfig"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  if (v175)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v176 = v175;
    else
      v176 = 0;
  }
  else
  {
    v176 = 0;
  }
  v177 = v57;
  v178 = v176;

  v179 = objc_msgSend(v174, "length");
  v180 = v174;
  if (!v179)
  {
    if (objc_msgSend(v178, "length", v174))
      v180 = v178;
    else
      v180 = 0;
  }
  v247 = v178;
  objc_msgSend(v61, "setPaidBundlePaywallConfigurationJson:", v180);
  objc_msgSend(v61, "allowedStorefrontIDs");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "removeObject:", &stru_1E464BC40);

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageScaleFactor"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "doubleValue");
  objc_msgSend(v61, "setNameImageScaleFactor:");

  objc_msgSend(v6, "objectForKey:", CFSTR("nameImageBaselineShift"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setNameImageBaselineShift:", objc_msgSend(v183, "integerValue"));

  -[FCRecordSource resolveLocalizableExperimentalizableFieldforKey:inRecord:activeExperimentIDKey:](v234, "resolveLocalizableExperimentalizableFieldforKey:inRecord:activeExperimentIDKey:", CFSTR("groupingAvailability"), v6, CFSTR("activeExperimentID"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v184;
  if (v184)
  {
    v186 = objc_msgSend(v184, "integerValue");
    if (v186 < 4)
    {
      v187 = v186;
      goto LABEL_142;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v219 = (void *)objc_msgSend(objc_alloc(*(Class *)(v177 + 2368)), "initWithFormat:", CFSTR("Encountered an unknown grouping availability value %@"), v185);
      *(_DWORD *)buf = 136315906;
      v255 = "-[FCTagRecordSource recordFromCKRecord:base:]";
      v256 = 2080;
      v257 = "FCTagRecordSource.m";
      v258 = 1024;
      v259 = 485;
      v260 = 2114;
      v261 = v219;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  v187 = 0;
LABEL_142:
  objc_msgSend(v61, "setGroupingAvailability:", v187);
  if (v238)
  {
    objc_msgSend(v61, "setIsHidden:", objc_msgSend(v238, "BOOLValue"));
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("isHidden"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setIsHidden:", objc_msgSend(v188, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("behaviorFlags"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setBehaviorFlags:", objc_msgSend(v189, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("propertyFlags"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setPropertyFlags:", objc_msgSend(v190, "unsignedLongLongValue"));

  objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("propertyFlagsLocalized"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v191);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setPropertyFlagsLocalized:", objc_msgSend(v192, "unsignedLongLongValue"));

  objc_opt_class();
  objc_msgSend(v244, "objectForKeyedSubscript:", CFSTR("articleRecirculationConfiguration"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  if (v194)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v195 = v194;
    else
      v195 = 0;
  }
  else
  {
    v195 = 0;
  }
  v196 = v195;

  objc_opt_class();
  objc_msgSend(v245, "objectForKey:", CFSTR("articleRecirculationConfiguration"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  if (v197)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v198 = v197;
    else
      v198 = 0;
  }
  else
  {
    v198 = 0;
  }
  v199 = v198;

  if (v196)
    v200 = v196;
  else
    v200 = v199;
  objc_msgSend(v61, "setArticleRecirculationConfiguration:", v200);
  objc_msgSend(v245, "objectForKey:", CFSTR("superGroupKnobs"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = (void *)objc_msgSend(v201, "mutableCopy");
  objc_msgSend(v61, "setSupergroupKnobsJson:", v202);

  objc_msgSend(v245, "objectForKey:", CFSTR("superGroupConfig"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = (void *)objc_msgSend(v203, "mutableCopy");
  objc_msgSend(v61, "setSupergroupConfigJson:", v204);

  if (v231)
  {
    objc_msgSend(v61, "setSuperfeedConfigResourceID:", v231);
  }
  else
  {
    objc_msgSend(v245, "objectForKey:", CFSTR("superfeedConfigResourceID"));
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setSuperfeedConfigResourceID:", v205);

  }
  if (v237)
  {
    objc_msgSend(v61, "setSportsRecommendationMappingsJson:");
  }
  else
  {
    objc_msgSend(v245, "objectForKey:", CFSTR("sportsRecommendationMappings"));
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setSportsRecommendationMappingsJson:", v206);

  }
  v207 = v236;
  if (!v236)
  {
    objc_msgSend(v245, "objectForKey:", CFSTR("isSportsRecommendable"));
    v207 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v61, "setIsSportsRecommendable:", objc_msgSend(v207, "BOOLValue"));
  if (!v236)

  if (v230)
  {
    objc_msgSend(v61, "setSportsData:", v230);
    v208 = v245;
  }
  else
  {
    v208 = v245;
    objc_msgSend(v245, "objectForKey:", CFSTR("sportsData"));
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setSportsData:", v209);

  }
  objc_msgSend(v208, "objectForKey:", CFSTR("sportsTheme"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSportsTheme:", v210);

  objc_msgSend(v208, "objectForKey:", CFSTR("sportsLogoImage"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSportsLogoImageURL:", v211);

  objc_msgSend(v208, "objectForKey:", CFSTR("sportsLogoImageCompact"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSportsLogoImageCompactURL:", v212);

  objc_msgSend(v208, "objectForKey:", CFSTR("sportsLogoImageLarge"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSportsLogoImageLargeURL:", v213);

  objc_msgSend(v208, "objectForKey:", CFSTR("sportsLogoAltImage"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSportsLogoAltImageURL:", v214);

  objc_msgSend(v208, "objectForKey:", CFSTR("sportsLogoAltImageCompact"));
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSportsLogoAltImageCompactURL:", v215);

  objc_msgSend(v208, "objectForKey:", CFSTR("sportsLogoAltImageLarge"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSportsLogoAltImageLargeURL:", v216);

  return v61;
}

- (int)pbRecordType
{
  return 2;
}

+ (id)defaultCachePolicy
{
  if (qword_1ED0F7C18 != -1)
    dispatch_once(&qword_1ED0F7C18, &__block_literal_global_37_1);
  return (id)qword_1ED0F7C10;
}

- (id)alwaysLocalizedKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  if (qword_1ED0F7BF8 != -1)
    dispatch_once(&qword_1ED0F7BF8, block);
  return (id)qword_1ED0F7BF0;
}

- (id)localizableLanguageSpecificKeys
{
  if (qword_1ED0F7C08 != -1)
    dispatch_once(&qword_1ED0F7C08, &__block_literal_global_20_1);
  return (id)qword_1ED0F7C00;
}

- (id)localizableKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FCTagRecordSource_localizableKeys__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  if (qword_1ED0F7BE8 != -1)
    dispatch_once(&qword_1ED0F7BE8, block);
  return (id)qword_1ED0F7BE0;
}

- (id)nonLocalizableKeys
{
  return self->_nonLocalizableKeys;
}

- (id)localizableExperimentalizableKeys
{
  if (qword_1ED0F7BD8 != -1)
    dispatch_once(&qword_1ED0F7BD8, &__block_literal_global_17_1);
  return (id)qword_1ED0F7BD0;
}

- (id)experimentalizableKeys
{
  if (qword_1ED0F7BC8 != -1)
    dispatch_once(&qword_1ED0F7BC8, &__block_literal_global_15_0);
  return (id)_MergedGlobals_10;
}

- (unint64_t)storeVersion
{
  return 49;
}

- (id)storeFilename
{
  return CFSTR("tag-record-source");
}

void __36__FCTagRecordSource_localizableKeys__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[13];

  v5[12] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "desiredFieldOptions") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("name"));
  v5[0] = CFSTR("publisherPaidOfferableConfig");
  v5[1] = CFSTR("publisherPaidDescriptionStrings");
  v5[2] = CFSTR("isHidden");
  v5[3] = CFSTR("paidBundleSubscriptionButtonConfig");
  v5[4] = CFSTR("articleRecirculationConfiguration");
  v5[5] = CFSTR("superfeedConfigResourceID");
  v5[6] = CFSTR("sportsRecommendationMappings");
  v5[7] = CFSTR("isSportsRecommendable");
  v5[8] = CFSTR("highlightsArticleListID");
  v5[9] = CFSTR("sportsData");
  v5[10] = CFSTR("subscriptionRate");
  v5[11] = CFSTR("groupingAvailability");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "desiredFieldOptions") & 0x200) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("stocksFeedConfiguration"));
  v5[0] = CFSTR("feedConfiguration");
  v5[1] = CFSTR("propertyFlagsLocalized");
  v5[2] = CFSTR("sectionFeedConfiguration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (unint64_t)desiredFieldOptions
{
  return self->_desiredFieldOptions;
}

- (FCTagRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 desiredTagRecordFieldOptions:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FCTagRecordSource *v16;
  FCTagRecordSource *v17;
  uint64_t v18;
  NSArray *nonLocalizableKeys;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentDatabase");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredTagR"
          "ecordFieldOptions:]";
    v26 = 2080;
    v27 = "FCTagRecordSource.m";
    v28 = 1024;
    v29 = 191;
    v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentDirectory");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredTagR"
          "ecordFieldOptions:]";
    v26 = 2080;
    v27 = "FCTagRecordSource.m";
    v28 = 1024;
    v29 = 192;
    v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v23.receiver = self;
  v23.super_class = (Class)FCTagRecordSource;
  v16 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:](&v23, sel_initWithContentDatabase_contentDirectory_appActivityMonitor_backgroundTaskable_experimentalizableFieldsPostfix_activeTreatmentID_, v12, v13, v14, v15, 0, 0);
  v17 = v16;
  if (v16)
  {
    v16->_desiredFieldOptions = a7;
    FCTagRecordSourceDesiredKeysFromDesiredFieldOptions(a7);
    v18 = objc_claimAutoreleasedReturnValue();
    nonLocalizableKeys = v17->_nonLocalizableKeys;
    v17->_nonLocalizableKeys = (NSArray *)v18;

  }
  return v17;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 10000000;
}

void __54__FCTagRecordSource_localizableExperimentalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("groupingAvailability"), CFSTR("superfeedConfigResourceID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7BD0;
  qword_1ED0F7BD0 = v0;

}

void __52__FCTagRecordSource_localizableLanguageSpecificKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("name"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7C00;
  qword_1ED0F7C00 = v0;

}

void __43__FCTagRecordSource_experimentalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("activeExperimentID"), CFSTR("publisherSpecifiedArticleIDs"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = v0;

}

void __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke_2;
  v3[3] = &unk_1E463AA30;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0F7BF0;
  qword_1ED0F7BF0 = v1;

}

void __36__FCTagRecordSource_localizableKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__FCTagRecordSource_localizableKeys__block_invoke_2;
  v3[3] = &unk_1E463AA30;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0F7BE0;
  qword_1ED0F7BE0 = v1;

}

uint64_t __39__FCTagRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  double v4;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0F7C10;
  qword_1ED0F7C10 = v0;

  objc_msgSend((id)qword_1ED0F7C10, "setCachePolicy:", 4);
  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("reduce_tags_cache_refresh"));

  v4 = 604800.0;
  if (v3)
    v4 = 180.0;
  return objc_msgSend((id)qword_1ED0F7C10, "setMaximumCachedAge:", v4);
}

- (FCTagRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimenta"
          "lizableFieldsPostfix:activeTreatmentID:]";
    v26 = 2080;
    v27 = "FCTagRecordSource.m";
    v28 = 1024;
    v29 = 182;
    v30 = 2114;
    v31 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v20 = (void *)MEMORY[0x1E0C99DA0];
  v21 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:]");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v23);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 5000000;
}

- (id)saveTagRecords:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCTagRecordSource;
  -[FCRecordSource saveRecords:](&v4, sel_saveRecords_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDesiredFieldOptions:(unint64_t)a3
{
  self->_desiredFieldOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonLocalizableKeys, 0);
}

@end
