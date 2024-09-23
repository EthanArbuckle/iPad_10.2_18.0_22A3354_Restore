@implementation GEOPlaceRequestTicket

void __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2[37];
  v5 = MEMORY[0x1E0C809B0];
  v6 = (double)*(uint64_t *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_3;
  v9[3] = &unk_1E1C021B8;
  v10 = *(id *)(a1 + 48);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_4;
  v7[3] = &unk_1E1C021B8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_processRequest:auditToken:timeout:withHandler:refinedHandler:networkActivity:", v4, v3, v9, v7, *(_QWORD *)(a1 + 56), v6);

}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2[37];
  v5 = (double)*(uint64_t *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3;
  v8[3] = &unk_1E1C021B8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_processRequest:auditToken:timeout:withHandler:refinedHandler:networkActivity:", v4, v3, v8, 0, *(_QWORD *)(a1 + 56), v5);
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v6, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparing"));

  if ((_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingEND"), 0);

  }
}

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void);
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "status") != 30 || (v6 = *(_QWORD *)(a1 + 56)) == 0)
      v6 = *(_QWORD *)(a1 + 48);
    v5 = *(void (**)(void))(v6 + 16);
  }
  v5();

}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestEND"), 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  GEOCollectionResult *v4;
  void *v5;
  GEOCollectionResult *v6;
  id *v7;
  void *v8;
  GEOPublisherResult *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "resultType") == 2)
  {
    objc_msgSend(v11, "collection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [GEOCollectionResult alloc];
      objc_msgSend(v11, "collection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GEOCollectionResult initWithCollectionResult:](v4, "initWithCollectionResult:", v5);

      if (v6)
      {
        v7 = (id *)(a1 + 32);
LABEL_9:
        objc_msgSend(*v7, "addObject:", v6);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v11, "resultType") == 3)
  {
    objc_msgSend(v11, "publisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [GEOPublisherResult alloc];
      objc_msgSend(v11, "publisher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GEOPublisherResult initWithPublisherResult:](v9, "initWithPublisherResult:", v10);

      if (v6)
      {
        v7 = (id *)(a1 + 40);
        goto LABEL_9;
      }
LABEL_10:

    }
  }

}

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id *v27;
  id *v28;
  uint64_t v29;
  void *v30;
  id *v31;
  id *v32;
  void *v33;
  uint64_t v34;
  id *v35;
  id *v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  GEORelatedSearchSuggestion *v51;
  GEORelatedSearchSuggestion *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _BYTE *v57;
  char v58;
  BOOL v59;
  _BYTE *v60;
  char v61;
  BOOL v62;
  GEOSearchSessionData *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t ii;
  GEORelatedSearchSuggestion *v78;
  GEORelatedSearchSuggestion *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  _BYTE *v84;
  char v85;
  BOOL v86;
  _BYTE *v87;
  char v88;
  BOOL v89;
  GEOSearchSessionData *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  GEOResolvedItem *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  GEODirectionIntent *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  unint64_t v110;
  unint64_t j;
  GEORetainedSearchMetadata *v112;
  void *v113;
  GEORetainedSearchMetadata *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t k;
  GEODisplayHeaderSubstitute *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t m;
  GEOSearchResultSection *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t n;
  uint64_t v152;
  GEORelatedEntitySection *v153;
  void *v154;
  GEORelatedEntitySection *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  GEOSearchAutoRedoThreshold *v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  GEOSearchRedoButtonThreshold *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  GEOGuideSummaryLayoutMetadata *v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  GEOResultRefinementGroup *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  GEOSearchSectionList *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  int v190;
  int v191;
  void *v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  void *v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t jj;
  GEOSearchCategory *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  void *v213;
  GEOCategorySearchResultSection *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t kk;
  uint64_t v229;
  GEORelatedEntitySection *v230;
  void *v231;
  GEORelatedEntitySection *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  GEOSearchAutoRedoThreshold *v236;
  void *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  void *v242;
  GEOSearchRedoButtonThreshold *v243;
  void *v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  GEOGuideSummaryLayoutMetadata *v251;
  void *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  GEOResultRefinementGroup *v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  GEOSearchSectionList *v261;
  void *v262;
  void *v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  int v267;
  unsigned int v268;
  int v269;
  BOOL v270;
  void *v271;
  uint64_t v272;
  void *v273;
  unint64_t v274;
  id v275;
  void *v276;
  void *v277;
  void *v278;
  id v279;
  id v280;
  uint64_t v281;
  void *v282;
  uint64_t v283;
  void *v284;
  uint64_t v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  _QWORD *v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  void *v295;
  uint64_t v296;
  void *v297;
  id v298;
  id v299;
  void *v300;
  void *v301;
  _QWORD *v302;
  void *v303;
  void *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  _QWORD v308[4];
  id v309;
  id v310;
  id v311;
  id v312;
  _QWORD v313[4];
  id v314;
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
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  _QWORD v344[4];
  id v345;
  _BYTE v346[128];
  _BYTE v347[128];
  _BYTE v348[128];
  _BYTE v349[128];
  _BYTE v350[128];
  _BYTE v351[128];
  _BYTE v352[128];
  _QWORD v353[3];

  v353[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"));

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequestEND"), v6);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (!v6 || v7)
    {
      v29 = *(_QWORD *)(v11 + 320);
      if (v29)
      {
        v353[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v353, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_244:

      goto LABEL_245;
    }
    objc_storeStrong((id *)(v11 + 312), a2);
    objc_msgSend(v6, "resultsWithResultType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") == 1)
    {
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v12, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRequestData:", v13);

    }
    v15 = objc_msgSend(v6, "dotPlacesCount");
    v16 = MEMORY[0x1E0C809B0];
    v17 = &unk_189CC1000;
    if (v15)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "dotPlacesCount"));
      objc_msgSend(v6, "dotPlaces");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v344[0] = v16;
      v344[1] = 3221225472;
      v344[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2;
      v344[3] = &unk_1E1C065A8;
      v20 = v18;
      v345 = v20;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v344);

      v21 = objc_msgSend(v20, "copy");
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 200);
      *(_QWORD *)(v22 + 200) = v21;

    }
    if (objc_msgSend(v6, "hasGlobalResult"))
    {
      objc_msgSend(v6, "globalResult");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (_QWORD *)v24;
        -[GEOPDPlaceGlobalResult _readCategorySearchResult](v24);
        v26 = v25[17];

        if (v26)
        {
          objc_msgSend(v6, "globalResult");
          v27 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDPlaceGlobalResult categorySearchResult](v27);
          v28 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDCategorySearchResult resultDetourInfos](v28);
          v303 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

          goto LABEL_24;
        }
      }
    }
    if (objc_msgSend(v6, "hasGlobalResult"))
    {
      v30 = v12;
      objc_msgSend(v6, "globalResult");
      v31 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceGlobalResult searchResult](v31);
      v32 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDSearchResult resultDetourInfos](v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        objc_msgSend(v6, "globalResult");
        v27 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult searchResult](v27);
        v28 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSearchResult resultDetourInfos](v28);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v12 = v30;
        goto LABEL_21;
      }
      v303 = 0;
      v7 = 0;
      v12 = v30;
    }
    else
    {
      v303 = 0;
    }
LABEL_24:
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "requestType") == 21)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "placeRequestParameters");
      v35 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequestParameters externalTransitLookupParameters](v35);
      v36 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDExternalTransitLookupParameters externalTransitStationCodes](v36);
      v304 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v304 = 0;
    }
    v37 = 0x1E0C99000uLL;
    if (!objc_msgSend(v6, "hasGlobalResult"))
      goto LABEL_224;
    objc_msgSend(v6, "globalResult");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (_QWORD *)v38;
    if (!v38)
    {
LABEL_223:

LABEL_224:
      objc_msgSend(v6, "mapsResults");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      v272 = objc_msgSend(v271, "count");

      if (v272)
      {
        v273 = v12;
        v274 = v37;
        v275 = v7;
        objc_msgSend(*(id *)(v274 + 3560), "array");
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v274 + 3560), "array");
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mapsResults");
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        v313[0] = MEMORY[0x1E0C809B0];
        v313[1] = v17[96];
        v313[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_3;
        v313[3] = &unk_1E1C065D0;
        v279 = v276;
        v314 = v279;
        v280 = v277;
        v315 = v280;
        objc_msgSend(v278, "enumerateObjectsUsingBlock:", v313);

        v281 = objc_msgSend(v279, "count");
        if (v281)
          v282 = (void *)objc_msgSend(v279, "copy");
        else
          v282 = 0;
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), v282);
        if (v281)

        v283 = objc_msgSend(v280, "count");
        if (v283)
          v284 = (void *)objc_msgSend(v280, "copy");
        else
          v284 = 0;
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), v284);
        if (v283)

        v7 = v275;
        v12 = v273;
        v17 = &unk_189CC1000;
      }
      if (!objc_msgSend(v12, "count") && ((v290 = *(_QWORD **)(a1 + 32), v290[15]) || v290[16] || v290[20] || v290[7]))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        v288 = v303;
        v289 = v304;
      }
      else
      {
        v285 = objc_msgSend(*(id *)(a1 + 48), "requestType");
        objc_msgSend(v6, "_disambiguationLabels");
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mapsResults");
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        v308[0] = MEMORY[0x1E0C809B0];
        v308[1] = v17[96];
        v308[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4;
        v308[3] = &unk_1E1C065F8;
        v311 = *(id *)(a1 + 56);
        v309 = v6;
        v312 = *(id *)(a1 + 64);
        v310 = 0;
        v288 = v303;
        v289 = v304;
        _attributedGeoMapItemsForPlaceDatasWithHandler(v285, v12, v286, v303, v304, v287, v308);

      }
      goto LABEL_244;
    }
    -[GEOPDPlaceGlobalResult _readSearchResult](v38);
    v305 = a1;
    v302 = v39;
    if (v39[46])
    {
      -[GEOPDPlaceGlobalResult searchResult]((id *)v39);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v40;
      v306 = v40;
      if (v40)
      {
        -[GEOPDSearchResult _readDisplayMapRegion](v40);
        if (*(_QWORD *)(v41 + 72))
        {
          -[GEOPDSearchResult displayMapRegion]((id *)v41);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = *(_QWORD *)(a1 + 32);
          v44 = *(void **)(v43 + 40);
          *(_QWORD *)(v43 + 40) = v42;

        }
        if ((*(_BYTE *)(v41 + 249) & 1) != 0)
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = *(_BYTE *)(v41 + 243);
        -[GEOPDSearchResult _readRelatedSearchSuggestions](v41);
        if (objc_msgSend(*(id *)(v41 + 128), "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v340 = 0u;
          v341 = 0u;
          v342 = 0u;
          v343 = 0u;
          -[GEOPDSearchResult relatedSearchSuggestions]((id *)v41);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v340, v352, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v341;
            do
            {
              for (i = 0; i != v48; ++i)
              {
                if (*(_QWORD *)v341 != v49)
                  objc_enumerationMutation(v46);
                v51 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:]([GEORelatedSearchSuggestion alloc], "initWithPDRelatedSearchSuggestion:", *(_QWORD *)(*((_QWORD *)&v340 + 1) + 8 * i));
                objc_msgSend(v45, "addObject:", v51);

              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v340, v352, 16);
            }
            while (v48);
          }

          a1 = v305;
          objc_storeStrong((id *)(*(_QWORD *)(v305 + 32) + 56), v45);

          v17 = (_QWORD *)&unk_189CC1000;
          v41 = v306;
        }
        -[GEOPDSearchResult _readDefaultRelatedSearchSuggestion](v41);
        if (*(_QWORD *)(v41 + 40))
        {
          v52 = [GEORelatedSearchSuggestion alloc];
          -[GEOPDSearchResult defaultRelatedSearchSuggestion]((id *)v41);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:](v52, "initWithPDRelatedSearchSuggestion:", v53);
          v55 = *(_QWORD *)(a1 + 32);
          v56 = *(void **)(v55 + 72);
          *(_QWORD *)(v55 + 72) = v54;

        }
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
      -[GEOPDSearchResult searchClientBehavior]((id *)v41);
      v57 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        v58 = v57[20];

        if ((v58 & 2) == 0)
          goto LABEL_52;
        -[GEOPDSearchResult searchClientBehavior]((id *)v41);
        v57 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        if (v57)
          v59 = v57[17] != 0;
        else
          v59 = 0;
        *(_BYTE *)(*(_QWORD *)(v305 + 32) + 112) = v59;
      }

LABEL_52:
      *(_BYTE *)(*(_QWORD *)(v305 + 32) + 113) = 0;
      if (!GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
        goto LABEL_59;
      -[GEOPDSearchResult searchClientBehavior]((id *)v41);
      v60 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        v61 = v60[20];

        if ((v61 & 1) == 0)
          goto LABEL_59;
        -[GEOPDSearchResult searchClientBehavior]((id *)v41);
        v60 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        if (v60)
          v62 = v60[16] != 0;
        else
          v62 = 0;
        *(_BYTE *)(*(_QWORD *)(v305 + 32) + 113) = v62;
      }

LABEL_59:
      if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
      {
        a1 = v305;
        v37 = 0x1E0C99000;
        if (v41)
        {
          -[GEOPDSearchResult _readSearchSessionData](v41);
          if (*(_QWORD *)(v41 + 184))
          {
            v63 = [GEOSearchSessionData alloc];
            -[GEOPDSearchResult searchSessionData]((id *)v41);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = -[GEOSearchSessionData initWithSearchSessionData:](v63, "initWithSearchSessionData:", v64);
            v66 = *(_QWORD *)(v305 + 32);
            v67 = *(void **)(v66 + 280);
            *(_QWORD *)(v66 + 280) = v65;

          }
LABEL_98:
          if ((*(_BYTE *)(v41 + 248) & 8) != 0)
          {
            v95 = -[GEOPDSearchResult searchResultType](v41);
            if (v95 <= 4)
              *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = v95;
          }
          -[GEOPDSearchResult _readResultDisplayHeader](v41);
          if (*(_QWORD *)(v41 + 144))
          {
            -[GEOPDSearchResult resultDisplayHeader]((id *)v41);
            v96 = objc_claimAutoreleasedReturnValue();
            v97 = *(_QWORD *)(a1 + 32);
            v98 = *(void **)(v97 + 96);
            *(_QWORD *)(v97 + 96) = v96;

          }
          -[GEOPDSearchResult _readClientResolvedResult](v41);
          if (*(_QWORD *)(v41 + 32))
          {
            v99 = [GEOResolvedItem alloc];
            -[GEOPDSearchResult clientResolvedResult]((id *)v41);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = -[GEOResolvedItem initWithResolvedItem:](v99, "initWithResolvedItem:", v100);
            v102 = *(_QWORD *)(a1 + 32);
            v103 = *(void **)(v102 + 120);
            *(_QWORD *)(v102 + 120) = v101;

          }
          -[GEOPDSearchResult _readDirectionIntent](v41);
          if (*(_QWORD *)(v41 + 48))
          {
            v104 = [GEODirectionIntent alloc];
            -[GEOPDSearchResult directionIntent]((id *)v41);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = -[GEODirectionIntent initWithDirectionIntent:](v104, "initWithDirectionIntent:", v105);
            v107 = *(_QWORD *)(a1 + 32);
            v108 = *(void **)(v107 + 128);
            *(_QWORD *)(v107 + 128) = v106;

          }
          -[GEOPDSearchResult _readRetainSearchs](v41);
          if (objc_msgSend(*(id *)(v41 + 160), "count"))
          {
            objc_msgSend(*(id *)(v37 + 3560), "array");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = 0;
LABEL_109:
            -[GEOPDSearchResult _readRetainSearchs](v41);
            for (j = objc_msgSend(*(id *)(v41 + 160), "count"); v110 < j; j = 0)
            {
              v112 = [GEORetainedSearchMetadata alloc];
              -[GEOPDSearchResult retainSearchAtIndex:]((id *)v41, v110);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = -[GEORetainedSearchMetadata initWithRetainedSearchMetadata:](v112, "initWithRetainedSearchMetadata:", v113);
              objc_msgSend(v109, "addObject:", v114);

              v41 = v306;
              ++v110;
              if (v306)
                goto LABEL_109;
            }
            v115 = objc_msgSend(v109, "copy");
            v116 = *(_QWORD *)(a1 + 32);
            v117 = *(void **)(v116 + 136);
            *(_QWORD *)(v116 + 136) = v115;

            v17 = (_QWORD *)&unk_189CC1000;
            v37 = 0x1E0C99000uLL;
          }
        }
      }
      else
      {
        a1 = v305;
        v37 = 0x1E0C99000uLL;
        if (v41)
          goto LABEL_98;
      }
      -[GEOPDSearchResult displayHeaderSubstitutes]((id *)v41);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "count");

      if (v119)
      {
        objc_msgSend(*(id *)(v37 + 3560), "array");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v336 = 0u;
        v337 = 0u;
        v338 = 0u;
        v339 = 0u;
        -[GEOPDSearchResult displayHeaderSubstitutes]((id *)v41);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v336, v351, 16);
        if (v122)
        {
          v123 = v122;
          v124 = *(_QWORD *)v337;
          do
          {
            for (k = 0; k != v123; ++k)
            {
              if (*(_QWORD *)v337 != v124)
                objc_enumerationMutation(v121);
              v126 = -[GEODisplayHeaderSubstitute initWithPDDisplayHeaderSubstitute:]([GEODisplayHeaderSubstitute alloc], "initWithPDDisplayHeaderSubstitute:", *(_QWORD *)(*((_QWORD *)&v336 + 1) + 8 * k));
              objc_msgSend(v120, "addObject:", v126);

            }
            v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v336, v351, 16);
          }
          while (v123);
        }

        a1 = v305;
        objc_storeStrong((id *)(*(_QWORD *)(v305 + 32) + 104), v120);

        v17 = (_QWORD *)&unk_189CC1000;
        v37 = 0x1E0C99000uLL;
        v41 = v306;
      }
      if (v41)
      {
        v127 = *(_QWORD *)(v41 + 248);
        if ((v127 & 1) != 0)
        {
          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 152) = -[GEOPDSearchResult dymSuggestionVisibleTime](v41);
          v127 = *(_QWORD *)(v41 + 248);
        }
        if ((v127 & 0x200) != 0)
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 156) = -[GEOPDSearchResult showDymSuggestionCloseButton](v41);
      }
      -[GEOPDSearchResult searchResultSections]((id *)v41);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v128, "count");

      if (v129)
      {
        v130 = *(void **)(v37 + 3560);
        -[GEOPDSearchResult searchResultSections]((id *)v41);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "arrayWithCapacity:", objc_msgSend(v131, "count"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();

        v334 = 0u;
        v335 = 0u;
        v332 = 0u;
        v333 = 0u;
        -[GEOPDSearchResult searchResultSections]((id *)v41);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v332, v350, 16);
        if (v134)
        {
          v135 = v134;
          v136 = *(_QWORD *)v333;
          do
          {
            for (m = 0; m != v135; ++m)
            {
              if (*(_QWORD *)v333 != v136)
                objc_enumerationMutation(v133);
              v138 = -[GEOSearchResultSection initWithSearchResultSection:]([GEOSearchResultSection alloc], "initWithSearchResultSection:", *(_QWORD *)(*((_QWORD *)&v332 + 1) + 8 * m));
              objc_msgSend(v132, "addObject:", v138);

            }
            v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v332, v350, 16);
          }
          while (v135);
        }

        v139 = objc_msgSend(v132, "copy");
        a1 = v305;
        v140 = *(_QWORD *)(v305 + 32);
        v141 = *(void **)(v140 + 144);
        *(_QWORD *)(v140 + 144) = v139;

        v17 = (_QWORD *)&unk_189CC1000;
        v37 = 0x1E0C99000uLL;
        v41 = v306;
      }
      -[GEOPDSearchResult relatedEntitySections]((id *)v41);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend(v142, "count");

      if (v143)
      {
        v298 = v7;
        v301 = v12;
        v144 = *(void **)(v37 + 3560);
        -[GEOPDSearchResult relatedEntitySections]((id *)v41);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "arrayWithCapacity:", objc_msgSend(v145, "count"));
        v146 = (void *)objc_claimAutoreleasedReturnValue();

        v330 = 0u;
        v331 = 0u;
        v328 = 0u;
        v329 = 0u;
        -[GEOPDSearchResult relatedEntitySections]((id *)v41);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v328, v349, 16);
        if (v148)
        {
          v149 = v148;
          v150 = *(_QWORD *)v329;
          do
          {
            for (n = 0; n != v149; ++n)
            {
              if (*(_QWORD *)v329 != v150)
                objc_enumerationMutation(v147);
              v152 = *(_QWORD *)(*((_QWORD *)&v328 + 1) + 8 * n);
              v153 = [GEORelatedEntitySection alloc];
              objc_msgSend(v6, "mapsResults");
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              v155 = -[GEORelatedEntitySection initWithRelatedEntitySection:mapsResults:](v153, "initWithRelatedEntitySection:mapsResults:", v152, v154);
              objc_msgSend(v146, "addObject:", v155);

            }
            v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v328, v349, 16);
          }
          while (v149);
        }

        v156 = objc_msgSend(v146, "copy");
        a1 = v305;
        v157 = *(_QWORD *)(v305 + 32);
        v158 = *(void **)(v157 + 176);
        *(_QWORD *)(v157 + 176) = v156;

        v7 = v298;
        v12 = v301;
        v17 = (_QWORD *)&unk_189CC1000;
        v37 = 0x1E0C99000;
        v41 = v306;
      }
      if (v41)
      {
        -[GEOPDSearchResult _readAutoRedoSearchThreshold](v41);
        v39 = v302;
        if (*(_QWORD *)(v41 + 24))
        {
          v159 = [GEOSearchAutoRedoThreshold alloc];
          -[GEOPDSearchResult autoRedoSearchThreshold]((id *)v41);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = -[GEOSearchAutoRedoThreshold initWithSearchAutoRedoThreshold:](v159, "initWithSearchAutoRedoThreshold:", v160);
          v162 = *(_QWORD *)(a1 + 32);
          v163 = *(void **)(v162 + 208);
          *(_QWORD *)(v162 + 208) = v161;

        }
        v164 = *(_QWORD *)(a1 + 32);
        v165 = *(void **)(v164 + 216);
        *(_QWORD *)(v164 + 216) = 0;

        -[GEOPDSearchResult _readRedoButtonThreshold](v41);
        if (*(_QWORD *)(v41 + 112)
          && GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
        {
          v166 = [GEOSearchRedoButtonThreshold alloc];
          -[GEOPDSearchResult redoButtonThreshold]((id *)v41);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = -[GEOSearchRedoButtonThreshold initWithSearchRedoButtonThreshold:](v166, "initWithSearchRedoButtonThreshold:", v167);
          v169 = *(_QWORD *)(a1 + 32);
          v170 = *(void **)(v169 + 216);
          *(_QWORD *)(v169 + 216) = v168;

        }
        -[GEOPDSearchResult _readPlaceSummaryLayoutMetadata](v41);
        if (*(_QWORD *)(v41 + 104))
        {
          -[GEOPDSearchResult placeSummaryLayoutMetadata]((id *)v41);
          v171 = objc_claimAutoreleasedReturnValue();
          v172 = *(_QWORD *)(a1 + 32);
          v173 = *(void **)(v172 + 224);
          *(_QWORD *)(v172 + 224) = v171;

        }
        -[GEOPDSearchResult _readGuideSummaryLayoutMetadata](v41);
        v37 = 0x1E0C99000;
        if (*(_QWORD *)(v41 + 80))
        {
          v174 = [GEOGuideSummaryLayoutMetadata alloc];
          -[GEOPDSearchResult guideSummaryLayoutMetadata]((id *)v41);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = -[GEOGuideSummaryLayoutMetadata initWithGuideSummaryLayoutMetadata:](v174, "initWithGuideSummaryLayoutMetadata:", v175);
          v177 = *(_QWORD *)(a1 + 32);
          v178 = *(void **)(v177 + 232);
          *(_QWORD *)(v177 + 232) = v176;

        }
        -[GEOPDSearchResult _readResultRefinementGroup](v41);
        if (*(_QWORD *)(v41 + 152))
        {
          v179 = [GEOResultRefinementGroup alloc];
          -[GEOPDSearchResult resultRefinementGroup]((id *)v41);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v181 = -[GEOResultRefinementGroup initWithResultRefinementGroup:](v179, "initWithResultRefinementGroup:", v180);
          v182 = *(_QWORD *)(a1 + 32);
          v183 = *(void **)(v182 + 240);
          *(_QWORD *)(v182 + 240) = v181;

        }
        -[GEOPDSearchResult _readSectionList](v41);
        if (*(_QWORD *)(v41 + 200))
        {
          v184 = [GEOSearchSectionList alloc];
          -[GEOPDSearchResult sectionList]((id *)v41);
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "mapsResults");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          v187 = -[GEOSearchSectionList initWithSearchSectionList:mapsResults:](v184, "initWithSearchSectionList:mapsResults:", v185, v186);
          v188 = *(_QWORD *)(a1 + 32);
          v189 = *(void **)(v188 + 248);
          *(_QWORD *)(v188 + 248) = v187;

          v39 = v302;
        }
        if ((*(_BYTE *)(v41 + 248) & 0x20) != 0)
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = *(_BYTE *)(v41 + 240);
      }
      else
      {
        v294 = *(_QWORD *)(a1 + 32);
        v295 = *(void **)(v294 + 216);
        *(_QWORD *)(v294 + 216) = 0;

        v39 = v302;
      }
      v190 = -[GEOPDSearchResult searchResultViewType](v41);
      v191 = v190 == 1;
      if (v190 == 2)
        v191 = 2;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 260) = v191;
      if (v41)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = *(_BYTE *)(v41 + 242);
        -[GEOPDSearchResult _readOpenPlaceCardForResultWithId](v41);
        if (*(_QWORD *)(v41 + 88))
        {
          v192 = *(void **)(a1 + 32);
          -[GEOPDSearchResult openPlaceCardForResultWithId]((id *)v41);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v192, "geoMapItemIdentifier:", v193);
          v194 = objc_claimAutoreleasedReturnValue();
          v195 = *(_QWORD *)(a1 + 32);
          v196 = *(void **)(v195 + 272);
          *(_QWORD *)(v195 + 272) = v194;

        }
        if ((*(_BYTE *)(v41 + 248) & 2) != 0)
          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288) = -[GEOPDSearchResult mapDisplayType](v41);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = 0;
      }
LABEL_222:

      goto LABEL_223;
    }
    -[GEOPDPlaceGlobalResult _readCategorySearchResult]((uint64_t)v39);
    if (!v39[17])
    {
      -[GEOPDPlaceGlobalResult _readPopularNearbySearchResult]((uint64_t)v39);
      if (v39[40])
      {
        -[GEOPDPlaceGlobalResult popularNearbySearchResult]((id *)v39);
        v197 = objc_claimAutoreleasedReturnValue();
        v198 = v197;
        if (v197)
        {
          -[GEOPDPopularNearbySearchResult _readDisplayMapRegion](v197);
          if (*(_QWORD *)(v198 + 24))
          {
            -[GEOPDPopularNearbySearchResult displayMapRegion]((id *)v198);
            v199 = objc_claimAutoreleasedReturnValue();
            v200 = *(_QWORD *)(a1 + 32);
            v201 = *(void **)(v200 + 40);
            *(_QWORD *)(v200 + 40) = v199;

          }
          if ((*(_BYTE *)(v198 + 56) & 1) != 0)
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = *(_BYTE *)(v198 + 52);
        }

      }
      else
      {
        -[GEOPDPlaceGlobalResult _readMerchantLookupResult]((uint64_t)v39);
        if (v39[31])
        {
          -[GEOPDPlaceGlobalResult merchantLookupResult]((id *)v39);
          v291 = objc_claimAutoreleasedReturnValue();
          v292 = *(_QWORD *)(a1 + 32);
          v293 = *(void **)(v292 + 160);
          *(_QWORD *)(v292 + 160) = v291;

        }
      }
      goto LABEL_223;
    }
    -[GEOPDPlaceGlobalResult categorySearchResult]((id *)v39);
    v68 = objc_claimAutoreleasedReturnValue();
    v41 = v68;
    v307 = v68;
    if (v68)
    {
      -[GEOPDCategorySearchResult _readDisplayMapRegion](v68);
      if (*(_QWORD *)(v41 + 56))
      {
        -[GEOPDCategorySearchResult displayMapRegion]((id *)v41);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = *(_QWORD *)(a1 + 32);
        v71 = *(void **)(v70 + 40);
        *(_QWORD *)(v70 + 40) = v69;

      }
      if ((*(_BYTE *)(v41 + 184) & 0x20) != 0)
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = *(_BYTE *)(v41 + 183);
      -[GEOPDCategorySearchResult _readRelatedSearchSuggestions](v41);
      if (objc_msgSend(*(id *)(v41 + 104), "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v324 = 0u;
        v325 = 0u;
        v326 = 0u;
        v327 = 0u;
        -[GEOPDCategorySearchResult relatedSearchSuggestions]((id *)v41);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v324, v348, 16);
        if (v74)
        {
          v75 = v74;
          v76 = *(_QWORD *)v325;
          do
          {
            for (ii = 0; ii != v75; ++ii)
            {
              if (*(_QWORD *)v325 != v76)
                objc_enumerationMutation(v73);
              v78 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:]([GEORelatedSearchSuggestion alloc], "initWithPDRelatedSearchSuggestion:", *(_QWORD *)(*((_QWORD *)&v324 + 1) + 8 * ii));
              objc_msgSend(v72, "addObject:", v78);

            }
            v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v324, v348, 16);
          }
          while (v75);
        }

        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v72);
        v17 = (_QWORD *)&unk_189CC1000;
        v39 = v302;
        v41 = v307;
      }
      -[GEOPDCategorySearchResult _readDefaultRelatedSearchSuggestion](v41);
      if (*(_QWORD *)(v41 + 48))
      {
        v79 = [GEORelatedSearchSuggestion alloc];
        -[GEOPDCategorySearchResult defaultRelatedSearchSuggestion]((id *)v41);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = -[GEORelatedSearchSuggestion initWithPDRelatedSearchSuggestion:](v79, "initWithPDRelatedSearchSuggestion:", v80);
        v82 = *(_QWORD *)(a1 + 32);
        v83 = *(void **)(v82 + 72);
        *(_QWORD *)(v82 + 72) = v81;

      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
    -[GEOPDCategorySearchResult searchClientBehavior]((id *)v41);
    v84 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      v85 = v84[20];

      if ((v85 & 2) == 0)
        goto LABEL_86;
      -[GEOPDCategorySearchResult searchClientBehavior]((id *)v41);
      v84 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v84)
        v86 = v84[17] != 0;
      else
        v86 = 0;
      *(_BYTE *)(*(_QWORD *)(v305 + 32) + 112) = v86;
    }

LABEL_86:
    *(_BYTE *)(*(_QWORD *)(v305 + 32) + 113) = 0;
    if (!GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
      goto LABEL_93;
    -[GEOPDCategorySearchResult searchClientBehavior]((id *)v41);
    v87 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      v88 = v87[20];

      if ((v88 & 1) == 0)
        goto LABEL_93;
      -[GEOPDCategorySearchResult searchClientBehavior]((id *)v41);
      v87 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v87)
        v89 = v87[16] != 0;
      else
        v89 = 0;
      *(_BYTE *)(*(_QWORD *)(v305 + 32) + 113) = v89;
    }

LABEL_93:
    v300 = v12;
    if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
    {
      a1 = v305;
      v37 = 0x1E0C99000;
      if (v41)
      {
        -[GEOPDCategorySearchResult _readSearchSessionData](v41);
        if (*(_QWORD *)(v41 + 136))
        {
          v90 = [GEOSearchSessionData alloc];
          -[GEOPDCategorySearchResult searchSessionData]((id *)v41);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = -[GEOSearchSessionData initWithSearchSessionData:](v90, "initWithSearchSessionData:", v91);
          v93 = *(_QWORD *)(v305 + 32);
          v94 = *(void **)(v93 + 280);
          *(_QWORD *)(v93 + 280) = v92;

        }
        goto LABEL_177;
      }
    }
    else
    {
      a1 = v305;
      v37 = 0x1E0C99000uLL;
      if (v41)
      {
LABEL_177:
        -[GEOPDCategorySearchResult _readBrowseCategorys](v41);
        v202 = objc_msgSend(*(id *)(v41 + 32), "count");
        if (v202)
        {
          objc_msgSend(*(id *)(v37 + 3560), "arrayWithCapacity:", v202);
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          v320 = 0u;
          v321 = 0u;
          v322 = 0u;
          v323 = 0u;
          -[GEOPDCategorySearchResult browseCategorys]((id *)v41);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          v205 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v320, v347, 16);
          if (v205)
          {
            v206 = v205;
            v207 = *(_QWORD *)v321;
            do
            {
              for (jj = 0; jj != v206; ++jj)
              {
                if (*(_QWORD *)v321 != v207)
                  objc_enumerationMutation(v204);
                v209 = -[GEOSearchCategory initWithBrowseCategory:]([GEOSearchCategory alloc], "initWithBrowseCategory:", *(_QWORD *)(*((_QWORD *)&v320 + 1) + 8 * jj));
                if (v209)
                  objc_msgSend(v203, "addObject:", v209);

              }
              v206 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v320, v347, 16);
            }
            while (v206);
          }

          v210 = objc_msgSend(v203, "copy");
          a1 = v305;
          v211 = *(_QWORD *)(v305 + 32);
          v212 = *(void **)(v211 + 64);
          *(_QWORD *)(v211 + 64) = v210;

          v12 = v300;
          v39 = v302;
          v17 = (_QWORD *)&unk_189CC1000;
          v37 = 0x1E0C99000uLL;
          v41 = v307;
        }
      }
    }
    -[GEOPDCategorySearchResult categorySearchResultSection]((id *)v41);
    v213 = (void *)objc_claimAutoreleasedReturnValue();

    if (v213)
    {
      v214 = [GEOCategorySearchResultSection alloc];
      -[GEOPDCategorySearchResult categorySearchResultSection]((id *)v41);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = -[GEOCategorySearchResultSection initWithCategorySearchResultSection:](v214, "initWithCategorySearchResultSection:", v215);
      v217 = *(_QWORD *)(a1 + 32);
      v218 = *(void **)(v217 + 168);
      *(_QWORD *)(v217 + 168) = v216;

    }
    -[GEOPDCategorySearchResult relatedEntitySections]((id *)v41);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = objc_msgSend(v219, "count");

    if (v220)
    {
      v299 = v7;
      v221 = *(void **)(v37 + 3560);
      -[GEOPDCategorySearchResult relatedEntitySections]((id *)v41);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "arrayWithCapacity:", objc_msgSend(v222, "count"));
      v223 = (void *)objc_claimAutoreleasedReturnValue();

      v318 = 0u;
      v319 = 0u;
      v316 = 0u;
      v317 = 0u;
      -[GEOPDCategorySearchResult relatedEntitySections]((id *)v41);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v316, v346, 16);
      if (v225)
      {
        v226 = v225;
        v227 = *(_QWORD *)v317;
        do
        {
          for (kk = 0; kk != v226; ++kk)
          {
            if (*(_QWORD *)v317 != v227)
              objc_enumerationMutation(v224);
            v229 = *(_QWORD *)(*((_QWORD *)&v316 + 1) + 8 * kk);
            v230 = [GEORelatedEntitySection alloc];
            objc_msgSend(v6, "mapsResults");
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            v232 = -[GEORelatedEntitySection initWithRelatedEntitySection:mapsResults:](v230, "initWithRelatedEntitySection:mapsResults:", v229, v231);
            objc_msgSend(v223, "addObject:", v232);

          }
          v226 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v316, v346, 16);
        }
        while (v226);
      }

      v233 = objc_msgSend(v223, "copy");
      a1 = v305;
      v234 = *(_QWORD *)(v305 + 32);
      v235 = *(void **)(v234 + 176);
      *(_QWORD *)(v234 + 176) = v233;

      v7 = v299;
      v12 = v300;
      v17 = &unk_189CC1000;
      v37 = 0x1E0C99000;
      v39 = v302;
      v41 = v307;
    }
    if (v41)
    {
      -[GEOPDCategorySearchResult _readAutoRedoSearchThreshold](v41);
      if (*(_QWORD *)(v41 + 24))
      {
        v236 = [GEOSearchAutoRedoThreshold alloc];
        -[GEOPDCategorySearchResult autoRedoSearchThreshold]((id *)v41);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v238 = -[GEOSearchAutoRedoThreshold initWithSearchAutoRedoThreshold:](v236, "initWithSearchAutoRedoThreshold:", v237);
        v239 = *(_QWORD *)(a1 + 32);
        v240 = *(void **)(v239 + 208);
        *(_QWORD *)(v239 + 208) = v238;

      }
      v241 = *(_QWORD *)(a1 + 32);
      v242 = *(void **)(v241 + 216);
      *(_QWORD *)(v241 + 216) = 0;

      -[GEOPDCategorySearchResult _readRedoButtonThreshold](v41);
      if (*(_QWORD *)(v41 + 88)
        && GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
      {
        v243 = [GEOSearchRedoButtonThreshold alloc];
        -[GEOPDCategorySearchResult redoButtonThreshold]((id *)v41);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        v245 = -[GEOSearchRedoButtonThreshold initWithSearchRedoButtonThreshold:](v243, "initWithSearchRedoButtonThreshold:", v244);
        v246 = *(_QWORD *)(a1 + 32);
        v247 = *(void **)(v246 + 216);
        *(_QWORD *)(v246 + 216) = v245;

      }
      -[GEOPDCategorySearchResult _readPlaceSummaryLayoutMetadata](v41);
      if (*(_QWORD *)(v41 + 80))
      {
        -[GEOPDCategorySearchResult placeSummaryLayoutMetadata]((id *)v41);
        v248 = objc_claimAutoreleasedReturnValue();
        v249 = *(_QWORD *)(a1 + 32);
        v250 = *(void **)(v249 + 224);
        *(_QWORD *)(v249 + 224) = v248;

      }
      -[GEOPDCategorySearchResult _readGuideSummaryLayoutMetadata](v41);
      v37 = 0x1E0C99000uLL;
      if (*(_QWORD *)(v41 + 64))
      {
        v251 = [GEOGuideSummaryLayoutMetadata alloc];
        -[GEOPDCategorySearchResult guideSummaryLayoutMetadata]((id *)v41);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        v253 = -[GEOGuideSummaryLayoutMetadata initWithGuideSummaryLayoutMetadata:](v251, "initWithGuideSummaryLayoutMetadata:", v252);
        v254 = *(_QWORD *)(a1 + 32);
        v255 = *(void **)(v254 + 232);
        *(_QWORD *)(v254 + 232) = v253;

      }
      -[GEOPDCategorySearchResult _readResultRefinementGroup](v41);
      if (*(_QWORD *)(v41 + 120))
      {
        v256 = [GEOResultRefinementGroup alloc];
        -[GEOPDCategorySearchResult resultRefinementGroup]((id *)v41);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        v258 = -[GEOResultRefinementGroup initWithResultRefinementGroup:](v256, "initWithResultRefinementGroup:", v257);
        v259 = *(_QWORD *)(a1 + 32);
        v260 = *(void **)(v259 + 240);
        *(_QWORD *)(v259 + 240) = v258;

      }
      -[GEOPDCategorySearchResult _readSectionList](v41);
      if (*(_QWORD *)(v41 + 152))
      {
        v261 = [GEOSearchSectionList alloc];
        -[GEOPDCategorySearchResult sectionList]((id *)v41);
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mapsResults");
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        v264 = -[GEOSearchSectionList initWithSearchSectionList:mapsResults:](v261, "initWithSearchSectionList:mapsResults:", v262, v263);
        v265 = *(_QWORD *)(a1 + 32);
        v266 = *(void **)(v265 + 248);
        *(_QWORD *)(v265 + 248) = v264;

        v39 = v302;
      }
      v267 = *(_DWORD *)(v41 + 184);
      if ((v267 & 4) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = *(_BYTE *)(v41 + 180);
        v267 = *(_DWORD *)(v41 + 184);
      }
      if ((v267 & 1) != 0)
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288) = -[GEOPDCategorySearchResult mapDisplayType]((os_unfair_lock_s *)v41);
    }
    else
    {
      v296 = *(_QWORD *)(a1 + 32);
      v297 = *(void **)(v296 + 216);
      *(_QWORD *)(v296 + 216) = 0;

    }
    v268 = -[GEOPDCategorySearchResult searchResultViewType]((os_unfair_lock_s *)v41);
    v269 = v268 == 1;
    if (v268 == 2)
      v269 = 2;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 260) = v269;
    if (v41)
      v270 = *(_BYTE *)(v41 + 182) != 0;
    else
      v270 = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = v270;
    goto LABEL_222;
  }
LABEL_245:

}

void __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  GEODotPlace *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[GEODotPlace initWithDotPlace:]([GEODotPlace alloc], "initWithDotPlace:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5 && (*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) + 16))())
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 336);
    *(_QWORD *)(v6 + 336) = 0;

    objc_msgSend(*(id *)(a1 + 32), "submitWithHandler:auditToken:timeout:networkActivity:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5;
  v3[3] = &unk_1E1C01F48;
  v4 = v1;
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

uint64_t __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v8 && (*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) + 16))())
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 336);
    *(_QWORD *)(v9 + 336) = 0;

    objc_msgSend(*(id *)(a1 + 32), "submitWithRefinedHandler:auditToken:timeout:networkActivity:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_6;
  v3[3] = &unk_1E1C01F48;
  v4 = v1;
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

uint64_t __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
