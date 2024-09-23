@implementation MPStoreLibraryMappingRequestOperation

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void)setModelClass:(Class)a3
{
  self->_modelClass = a3;
}

- (void)setLibraryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setIdentifierSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

+ (BOOL)supportsModelClass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  v7 = v6[38];
  if (v7)
  {
    (*(void (**)(_QWORD, id, id))(v7 + 16))(v6[38], v8, v5);
    v6 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v6, "finishWithError:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_albumArtistNamesToIdentifierSets, 0);
  objc_storeStrong((id *)&self->_identifierSets, 0);
  objc_storeStrong((id *)&self->_libraryView, 0);
}

- (void)execute
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t ii;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t jj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  id v42;
  id v43;
  MPMediaLibraryEntityTranslationContext *v44;
  MPStoreLibraryMappingResponse *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  id v47;
  id v48;
  MPMediaLibraryEntityTranslationContext *v49;
  MPStoreLibraryMappingResponse *v50;
  id v51;
  void (**v52)(_QWORD, _QWORD, _QWORD);
  id v53;
  id v54;
  MPMediaLibraryEntityTranslationContext *v55;
  MPStoreLibraryMappingResponse *v56;
  void (**v57)(_QWORD);
  unint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  mlcore *v61;
  unint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  _BOOL4 v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  MPStoreLibraryMappingResponse *v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  unint64_t *v83;
  mlcore *v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t *v88;
  uint64_t *v89;
  char *v90;
  int64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  _BOOL4 v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t j;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  MPStoreLibraryMappingResponse *v117;
  MPStoreLibraryMappingResponse *v118;
  void (**v119)(_QWORD, _QWORD, _QWORD);
  MPStoreLibraryMappingResponse *v120;
  id v121;
  MPMediaLibraryEntityTranslationContext *v122;
  MPStoreLibraryMappingResponse *v123;
  void (**v124)(_QWORD, _QWORD, _QWORD);
  MPStoreLibraryMappingResponse *v125;
  id v126;
  MPMediaLibraryEntityTranslationContext *v127;
  id v128;
  unint64_t v129;
  _QWORD *v130;
  _QWORD *v131;
  mlcore *v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t *v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  mlcore *v146;
  _QWORD *v147;
  uint64_t v148;
  void *v149;
  unint64_t *p_shared_owners;
  unint64_t v151;
  std::__shared_weak_count *v152;
  unint64_t *v153;
  unint64_t v154;
  std::__shared_weak_count *v155;
  unint64_t *v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t k;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t m;
  uint64_t v170;
  void *v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  void *v183;
  void *v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t n;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  MPStoreLibraryMappingResponse *v193;
  MPStoreLibraryMappingResponse *v194;
  void (**v195)(_QWORD, _QWORD, _QWORD);
  MPStoreLibraryMappingResponse *v196;
  id v197;
  MPMediaLibraryEntityTranslationContext *v198;
  unint64_t v199;
  _QWORD *v200;
  MPStoreLibraryMappingResponse *v201;
  id v202;
  MPMediaLibraryEntityTranslationContext *v203;
  MPStoreLibraryMappingResponse *v204;
  mlcore *v205;
  ModelPropertyBase *v206;
  void **Property;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  _QWORD *v211;
  MPStoreLibraryMappingResponse *v212;
  id v213;
  MPMediaLibraryEntityTranslationContext *v214;
  MPStoreLibraryMappingResponse *v215;
  mlcore *v216;
  ModelPropertyBase *v217;
  void **v218;
  uint64_t v219;
  mlcore *v220;
  mlcore *v221;
  void *v222;
  mlcore *v223;
  void *v224;
  unint64_t *v225;
  unint64_t v226;
  mlcore *v227;
  void *v228;
  void *v229;
  unint64_t *v230;
  unint64_t v231;
  mlcore *v232;
  void *v233;
  mlcore *v234;
  void *v235;
  void *v236;
  unint64_t *v237;
  unint64_t v238;
  mlcore *v239;
  void **v240;
  uint64_t v241;
  void *v242;
  MPStoreLibraryMappingResponse *v243;
  void (**v244)(_QWORD, _QWORD, _QWORD);
  MPStoreLibraryMappingResponse *v245;
  id v246;
  id v247;
  MPMediaLibraryEntityTranslationContext *v248;
  unint64_t v249;
  _QWORD *v250;
  _QWORD *v251;
  mlcore *v252;
  uint64_t v253;
  mlcore *v254;
  mlcore *v255;
  void *v256;
  void *v257;
  unint64_t *v258;
  unint64_t v259;
  id v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  id v264;
  id v265;
  void **v266;
  uint64_t v267;
  void (**v268)(_QWORD, _QWORD, _QWORD);
  void (**v269)(_QWORD, _QWORD, _QWORD);
  void *v270;
  MPMediaLibraryEntityTranslationContext *v271;
  void (**v272)(_QWORD, _QWORD, _QWORD);
  MPStoreLibraryMappingResponse *v273;
  id v274;
  uint64_t v275;
  uint64_t v276;
  mlcore *v277;
  mlcore *v278;
  id obj;
  id objc;
  id obja;
  id objb;
  id v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  id v289;
  void (**v290)(void);
  id v291;
  id v292;
  void (**v293)(void);
  id v294;
  uint64_t v295;
  void *v296[2];
  __int128 v297;
  void (*v298)(uint64_t);
  id v299;
  _QWORD v300[4];
  MPStoreLibraryMappingResponse *v301;
  id v302;
  MPMediaLibraryEntityTranslationContext *v303;
  MPStoreLibraryMappingResponse *v304;
  id v305;
  uint64_t v306;
  void (**v307)(_QWORD, _QWORD, _QWORD);
  void **v308;
  _QWORD v309[2];
  void *v310;
  void *v311;
  uint64_t v312;
  _QWORD v313[5];
  MPStoreLibraryMappingResponse *v314;
  id v315;
  id v316;
  MPMediaLibraryEntityTranslationContext *v317;
  MPStoreLibraryMappingResponse *v318;
  id v319;
  uint64_t v320;
  void *v321;
  void *v322;
  uint64_t v323;
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
  MPStoreLibraryMappingResponse *v345;
  id v346;
  MPMediaLibraryEntityTranslationContext *v347;
  MPStoreLibraryMappingResponse *v348;
  uint64_t v349;
  void (**v350)(_QWORD, _QWORD, _QWORD);
  mlcore *v351;
  void **v352;
  _QWORD v353[2];
  void *v354;
  void *v355;
  uint64_t v356;
  _QWORD v357[5];
  MPStoreLibraryMappingResponse *v358;
  id v359;
  MPMediaLibraryEntityTranslationContext *v360;
  MPStoreLibraryMappingResponse *v361;
  id v362;
  void (**v363)(void);
  void *v364[3];
  void *v365;
  void *v366;
  uint64_t v367;
  _QWORD v368[4];
  MPStoreLibraryMappingResponse *v369;
  id v370;
  MPMediaLibraryEntityTranslationContext *v371;
  MPStoreLibraryMappingResponse *v372;
  uint64_t v373;
  void (**v374)(_QWORD, _QWORD, _QWORD);
  mlcore *v375;
  void **v376;
  _QWORD v377[2];
  void *v378;
  void *v379;
  uint64_t v380;
  _QWORD v381[5];
  MPStoreLibraryMappingResponse *v382;
  id v383;
  MPMediaLibraryEntityTranslationContext *v384;
  MPStoreLibraryMappingResponse *v385;
  id v386;
  void (**v387)(void);
  _QWORD v388[3];
  void *v389;
  void *v390;
  uint64_t v391;
  _QWORD v392[5];
  MPStoreLibraryMappingResponse *v393;
  id v394;
  MPMediaLibraryEntityTranslationContext *v395;
  MPStoreLibraryMappingResponse *v396;
  id v397;
  uint64_t v398;
  void *v399;
  void *v400;
  uint64_t v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  _QWORD v410[4];
  MPStoreLibraryMappingResponse *v411;
  id v412;
  MPMediaLibraryEntityTranslationContext *v413;
  MPStoreLibraryMappingResponse *v414;
  uint64_t v415;
  void (**v416)(_QWORD, _QWORD, _QWORD);
  void (**v417)(void);
  _QWORD v418[2];
  void *v419;
  void *v420;
  uint64_t v421;
  _QWORD v422[5];
  MPStoreLibraryMappingResponse *v423;
  id v424;
  MPMediaLibraryEntityTranslationContext *v425;
  MPStoreLibraryMappingResponse *v426;
  id v427;
  id v428;
  uint64_t v429;
  void *v430;
  void *v431;
  uint64_t v432;
  _QWORD v433[5];
  MPStoreLibraryMappingResponse *v434;
  id v435;
  MPMediaLibraryEntityTranslationContext *v436;
  MPStoreLibraryMappingResponse *v437;
  id v438;
  uint64_t v439;
  void *v440;
  void *v441;
  uint64_t v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  _QWORD v447[4];
  id v448;
  id v449;
  MPMediaLibraryEntityTranslationContext *v450;
  MPStoreLibraryMappingResponse *v451;
  uint64_t v452;
  id v453;
  void (**v454)(_QWORD);
  uint64_t v455;
  std::__shared_weak_count *v456;
  void *v457;
  void *v458;
  uint64_t v459;
  void *v460[2];
  uint64_t *v461;
  __int128 v462;
  uint64_t v463;
  std::__shared_weak_count *v464;
  _QWORD v465[5];
  id v466;
  id v467;
  MPMediaLibraryEntityTranslationContext *v468;
  MPStoreLibraryMappingResponse *v469;
  id v470;
  id v471;
  _BYTE v472[40];
  void *v473;
  void *v474;
  uint64_t v475;
  _QWORD v476[5];
  id v477;
  id v478;
  MPMediaLibraryEntityTranslationContext *v479;
  MPStoreLibraryMappingResponse *v480;
  id v481;
  id v482;
  _BYTE v483[40];
  void *v484;
  void *v485;
  uint64_t v486;
  _QWORD v487[5];
  id v488;
  id v489;
  MPMediaLibraryEntityTranslationContext *v490;
  MPStoreLibraryMappingResponse *v491;
  id v492;
  uint64_t v493;
  void *v494;
  void *v495;
  uint64_t v496;
  void *__p[2];
  uint64_t v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  void *v507[2];
  __int128 v508;
  int v509;
  __int128 v510;
  __int128 v511;
  int v512;
  __int128 v513;
  __int128 v514;
  int v515;
  void *v516;
  _BYTE *v517;
  uint64_t v518;
  _QWORD v519[5];
  __int128 v520;
  _BYTE v521[128];
  _BYTE v522[128];
  _BYTE v523[128];
  _BYTE v524[128];
  _BYTE v525[128];
  _BYTE v526[128];
  _BYTE v527[128];
  _BYTE v528[128];
  void **v529;
  uint64_t v530;
  int v531;
  __int128 v532;
  char *v533;
  _BYTE v534[128];
  _BYTE v535[128];
  uint64_t v536;

  v2 = MEMORY[0x1E0C80A78](self, a2);
  v536 = *MEMORY[0x1E0C80C00];
  v295 = v2;
  if (!*(_QWORD *)(v2 + 272))
  {
    v241 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v242, "handleFailureInMethod:object:file:lineNumber:description:", v241, v295, CFSTR("MPStoreLibraryMappingRequestOperation.mm"), 40, CFSTR("Library view must not be nil."));

    v2 = v295;
  }
  v519[0] = MEMORY[0x1E0C809B0];
  v519[1] = 3221225472;
  v519[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke;
  v519[3] = &unk_1E315CB68;
  v519[4] = v2;
  v272 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v519);
  if (objc_msgSend((id)v295, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v272)[2](v272, 0, v4);
    goto LABEL_201;
  }
  if (objc_msgSend(*(id *)(v295 + 296), "count")
    && (objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v272)[2](v272, 0, v4);
    goto LABEL_201;
  }
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", *(_QWORD *)(v295 + 280));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v270 = v5;
  if (v5)
  {
    objc_msgSend(v5, "MLCorePropertiesForPropertySet:", v6);
  }
  else
  {
    v517 = 0;
    v516 = 0;
    v518 = 0;
  }

  v271 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  objc_msgSend(*(id *)(v295 + 272), "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v271, "setMediaLibrary:", v7);

  +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", *(_QWORD *)(v295 + 280));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setModelKind:](v271, "setModelKind:", v8);

  if (objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore"))
  {
    objc_msgSend((id)v295, "userIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setPersonID:](v271, "setPersonID:", v10);

  }
  if ((objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()) & 1) == 0
    && (objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()) & 1) == 0
    && !objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()))
    {
      v273 = (MPStoreLibraryMappingResponse *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_OWORD *)v296 = 0u;
      v297 = 0u;
      LODWORD(v298) = 1065353216;
      v514 = 0u;
      v513 = 0u;
      v515 = 1065353216;
      v511 = 0u;
      v510 = 0u;
      v512 = 1065353216;
      v443 = 0u;
      v444 = 0u;
      v445 = 0u;
      v446 = 0u;
      v63 = *(id *)(v295 + 288);
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v443, v528, 16);
      if (!v64)
      {
LABEL_79:

        if (objc_msgSend((id)v295, "isCancelled"))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
          v76 = (MPStoreLibraryMappingResponse *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, MPStoreLibraryMappingResponse *))v272)[2](v272, 0, v76);
        }
        else
        {
          v118 = objc_alloc_init(MPStoreLibraryMappingResponse);
          v433[0] = MEMORY[0x1E0C809B0];
          v433[1] = 3321888768;
          v433[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4;
          v433[3] = &unk_1E314ADA8;
          v433[4] = v295;
          v119 = v272;
          v438 = v119;
          v120 = v273;
          v434 = v120;
          v275 = std::unordered_set<std::string>::unordered_set((uint64_t)&v439, (uint64_t)v296);
          v441 = 0;
          v440 = 0;
          v442 = 0;
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v440, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
          v121 = v270;
          v435 = v121;
          v122 = v271;
          v436 = v122;
          v123 = v118;
          v437 = v123;
          v284 = (id)MEMORY[0x19403A810](v433);
          v422[0] = MEMORY[0x1E0C809B0];
          v422[1] = 3321888768;
          v422[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_32;
          v422[3] = &unk_1E314AE50;
          v422[4] = v295;
          v124 = v119;
          v427 = v124;
          v125 = v120;
          v423 = v125;
          obja = (id)std::unordered_set<unsigned long long>::unordered_set((uint64_t)&v429, (uint64_t)&v513);
          v431 = 0;
          v430 = 0;
          v432 = 0;
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v430, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
          v126 = v121;
          v424 = v126;
          v127 = v122;
          v425 = v127;
          v76 = v123;
          v426 = v76;
          v128 = v284;
          v428 = v128;
          v290 = (void (**)(void))MEMORY[0x19403A810](v422);
          if (-[MPStoreLibraryMappingResponse count](v125, "count") && *((_QWORD *)&v511 + 1))
          {
            *(_QWORD *)&v508 = 0;
            v507[0] = 0;
            v507[1] = 0;
            v129 = 0;
            if ((_QWORD)v511)
            {
              v130 = (_QWORD *)v511;
              do
              {
                ++v129;
                v130 = (_QWORD *)*v130;
              }
              while (v130);
            }
            v131 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v507, (uint64_t *)v511, v129);
            v132 = (mlcore *)MEMORY[0x194039FE8](v131);
            v133 = (uint64_t)v132;
            if (*((_QWORD *)&v511 + 1) >= 2uLL)
            {
              mlcore::PlaylistPropertyCloudUniversalLibraryID(v132);
              std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v520);
            }
            else
            {
              mlcore::PlaylistPropertyCloudUniversalLibraryID(v132);
              std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v520);
            }
            *(_OWORD *)__p = v520;
            v520 = 0uLL;
            std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v529, v133, (__int128 *)__p);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v520);
            __p[1] = 0;
            __p[0] = 0;
            v498 = 0;
            v220 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
            v460[0] = (void *)mlcore::PlaylistPropertyPersistentID(v220);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, v460);
            v460[0] = (void *)mlcore::PlaylistPropertyCloudUniversalLibraryID(v221);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, v460);
            v421 = 0;
            v419 = 0;
            v420 = 0;
            v222 = __p[0];
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v419, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
            mlcore::PropertiesQuery::setPropertiesToFetch();
            v223 = (mlcore *)v419;
            if (v419)
            {
              v420 = v419;
              operator delete(v419);
            }
            mlcore::PlaylistPropertyIsHidden(v223);
            mlcore::SortDescriptor::SortDescriptor();
            std::vector<mlcore::SortDescriptor>::vector[abi:ne180100](v460, (uint64_t)&v532, 1uLL);
            mlcore::PropertiesQuery::setSortDescriptors();
            v224 = *(void **)(v295 + 272);
            v418[0] = v529;
            v418[1] = v530;
            if (v530)
            {
              v225 = (unint64_t *)(v530 + 8);
              do
                v226 = __ldxr(v225);
              while (__stxr(v226 + 1, v225));
            }
            v410[0] = MEMORY[0x1E0C809B0];
            v410[1] = 3221225472;
            v410[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_34;
            v410[3] = &unk_1E315CBB8;
            v411 = v125;
            v412 = v126;
            v413 = v127;
            v414 = v76;
            v415 = v295;
            v416 = v124;
            v417 = v290;
            objc_msgSend(v224, "performCoreQuery:withCompletion:", v418, v410);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v418);

            *(_QWORD *)&v532 = v460;
            std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v532);
            if (v222)
              operator delete(v222);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v529);
            __p[0] = v507;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          }
          else
          {
            v290[2]();
          }

          if (v430)
          {
            v431 = v430;
            operator delete(v430);
          }
          std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)obja);

          if (v440)
          {
            v441 = v440;
            operator delete(v440);
          }
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(v275);

        }
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v510);
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v513);
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v296);
        goto LABEL_197;
      }
      v65 = *(_QWORD *)v444;
LABEL_64:
      v66 = 0;
      while (1)
      {
        if (*(_QWORD *)v444 != v65)
          objc_enumerationMutation(v63);
        v67 = *(void **)(*((_QWORD *)&v443 + 1) + 8 * v66);
        objc_msgSend(v67, "universalStore");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "globalPlaylistID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = objc_msgSend(v69, "length");
        v71 = v70 != 0;
        if (v70)
        {
          std::string::basic_string[abi:ne180100]<0>(v507, (char *)objc_msgSend(objc_retainAutorelease(v69), "UTF8String"));
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)v296, (unsigned __int8 *)v507, (uint64_t)v507);
          if (SBYTE7(v508) < 0)
            operator delete(v507[0]);
        }
        objc_msgSend(v67, "personalizedStore");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "cloudID");

        if (v73)
        {
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v513, v73, v73);
          v71 = 1;
        }
        objc_msgSend(v67, "universalStore");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "universalCloudLibraryID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v75, "length"))
          break;
        if (v71)
          goto LABEL_76;
LABEL_77:

        if (v64 == ++v66)
        {
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v443, v528, 16);
          if (!v64)
            goto LABEL_79;
          goto LABEL_64;
        }
      }
      std::string::basic_string[abi:ne180100]<0>(v507, (char *)objc_msgSend(objc_retainAutorelease(v75), "UTF8String"));
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v510, (unsigned __int8 *)v507, (uint64_t)v507);
      if (SBYTE7(v508) < 0)
        operator delete(v507[0]);
LABEL_76:
      -[MPStoreLibraryMappingResponse addObject:](v273, "addObject:", v67);
      goto LABEL_77;
    }
    if ((objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()) & 1) != 0
      || objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()))
    {
      v273 = (MPStoreLibraryMappingResponse *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_OWORD *)v296 = 0u;
      v297 = 0u;
      LODWORD(v298) = 1065353216;
      v514 = 0u;
      v513 = 0u;
      v515 = 1065353216;
      v511 = 0u;
      v510 = 0u;
      v512 = 1065353216;
      v406 = 0u;
      v407 = 0u;
      v408 = 0u;
      v409 = 0u;
      v289 = *(id *)(v295 + 288);
      v94 = objc_msgSend(v289, "countByEnumeratingWithState:objects:count:", &v406, v527, 16);
      if (!v94)
        goto LABEL_139;
      v95 = *(_QWORD *)v407;
      while (1)
      {
        for (i = 0; i != v94; ++i)
        {
          if (*(_QWORD *)v407 != v95)
            objc_enumerationMutation(v289);
          v97 = *(void **)(*((_QWORD *)&v406 + 1) + 8 * i);
          objc_msgSend(v97, "personalizedStore");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "cloudAlbumID");
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          v100 = objc_msgSend(v99, "length");
          v101 = v100 != 0;
          if (v100)
          {
            std::string::basic_string[abi:ne180100]<0>(v507, (char *)objc_msgSend(objc_retainAutorelease(v99), "UTF8String"));
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v513, (unsigned __int8 *)v507, (uint64_t)v507);
            if (SBYTE7(v508) < 0)
              operator delete(v507[0]);
          }
          objc_msgSend(v97, "universalStore");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v102, "adamID");

          if (v103)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v296, v103, v103);
            v101 = 1;
          }
          objc_msgSend(v97, "universalStore");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "formerAdamIDs");
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          v405 = 0u;
          v404 = 0u;
          v403 = 0u;
          v402 = 0u;
          v106 = v105;
          v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v402, v526, 16);
          if (v107)
          {
            v108 = *(_QWORD *)v403;
            do
            {
              for (j = 0; j != v107; ++j)
              {
                if (*(_QWORD *)v403 != v108)
                  objc_enumerationMutation(v106);
                v110 = objc_msgSend(*(id *)(*((_QWORD *)&v402 + 1) + 8 * j), "longLongValue");
                if (v110)
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v296, v110, v110);
              }
              v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v402, v526, 16);
            }
            while (v107);
          }

          objc_msgSend(v97, "universalStore");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = objc_msgSend(v111, "subscriptionAdamID");

          if (v112)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v296, v112, v112);
            v101 = 1;
          }
          objc_msgSend(v97, "universalStore");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v113, "purchasedAdamID");

          if (v114)
          {
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v296, v114, v114);
            v101 = 1;
          }
          objc_msgSend(v97, "universalStore");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "universalCloudLibraryID");
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v116, "length"))
          {
            std::string::basic_string[abi:ne180100]<0>(v507, (char *)objc_msgSend(objc_retainAutorelease(v116), "UTF8String"));
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v510, (unsigned __int8 *)v507, (uint64_t)v507);
            if (SBYTE7(v508) < 0)
              operator delete(v507[0]);
          }
          else if (!v101)
          {
            goto LABEL_137;
          }
          -[MPStoreLibraryMappingResponse addObject:](v273, "addObject:", v97);
LABEL_137:

        }
        v94 = objc_msgSend(v289, "countByEnumeratingWithState:objects:count:", &v406, v527, 16);
        if (!v94)
        {
LABEL_139:

          if (objc_msgSend((id)v295, "isCancelled"))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
            v117 = (MPStoreLibraryMappingResponse *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, MPStoreLibraryMappingResponse *))v272)[2](v272, 0, v117);
            goto LABEL_319;
          }
          v194 = objc_alloc_init(MPStoreLibraryMappingResponse);
          v392[0] = MEMORY[0x1E0C809B0];
          v392[1] = 3321888768;
          v392[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_35;
          v392[3] = &unk_1E314ADE0;
          v392[4] = v295;
          v195 = v272;
          v397 = v195;
          v196 = v273;
          v393 = v196;
          v286 = (id)std::unordered_set<long long>::unordered_set((uint64_t)&v398, (uint64_t)v296);
          v400 = 0;
          v399 = 0;
          v401 = 0;
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v399, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
          v197 = v270;
          v394 = v197;
          v198 = v271;
          v395 = v198;
          v117 = v194;
          v396 = v117;
          v293 = (void (**)(void))MEMORY[0x19403A810](v392);
          if (-[MPStoreLibraryMappingResponse count](v196, "count") && *((_QWORD *)&v514 + 1))
          {
            *(_QWORD *)&v508 = 0;
            v507[0] = 0;
            v507[1] = 0;
            v199 = 0;
            if ((_QWORD)v514)
            {
              v200 = (_QWORD *)v514;
              do
              {
                ++v199;
                v200 = (_QWORD *)*v200;
              }
              while (v200);
            }
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v507, (uint64_t *)v514, v199);
            v381[0] = MEMORY[0x1E0C809B0];
            v381[1] = 3321888768;
            v381[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_37;
            v381[3] = &unk_1E314AD70;
            memset(v388, 0, sizeof(v388));
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v388, (__int128 *)v507[0], (__int128 *)v507[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v507[1] - (char *)v507[0]) >> 3));
            v266 = (void **)v388;
            v381[4] = v295;
            v389 = 0;
            v391 = 0;
            v390 = 0;
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v389, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
            v201 = v196;
            v382 = v201;
            v202 = v197;
            v383 = v202;
            v203 = v198;
            v384 = v203;
            v204 = v117;
            v385 = v204;
            v268 = v195;
            v386 = v268;
            v387 = v293;
            v277 = (mlcore *)MEMORY[0x19403A810](v381);
            v205 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(v277);
            v206 = (ModelPropertyBase *)mlcore::ItemPropertyStoreCloudAlbumID(v205);
            Property = (void **)MPMediaLibraryGetProperty((ModelPropertyBase *)v205, v206);
            v208 = MEMORY[0x194039F1C]();
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v507[1] - (char *)v507[0]) >> 3) >= 2)
              std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v532);
            else
              std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v532);
            *(_OWORD *)__p = v532;
            v532 = 0uLL;
            std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(v460, v208, (__int128 *)__p);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v532);
            __p[1] = 0;
            __p[0] = 0;
            v498 = 0;
            v227 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
            v529 = (void **)mlcore::AlbumPropertyPersistentID(v227);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v529);
            v529 = Property;
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v529);
            v380 = 0;
            v378 = 0;
            v379 = 0;
            v228 = __p[0];
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v378, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
            mlcore::PropertiesQuery::setPropertiesToFetch();
            if (v378)
            {
              v379 = v378;
              operator delete(v378);
            }
            v229 = *(void **)(v295 + 272);
            v377[0] = v460[0];
            v377[1] = v460[1];
            if (v460[1])
            {
              v230 = (unint64_t *)((char *)v460[1] + 8);
              do
                v231 = __ldxr(v230);
              while (__stxr(v231 + 1, v230));
            }
            v368[0] = MEMORY[0x1E0C809B0];
            v368[1] = 3221225472;
            v368[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_39;
            v368[3] = &unk_1E315CBE0;
            v376 = Property;
            v369 = v201;
            v370 = v202;
            v371 = v203;
            v372 = v204;
            v373 = v295;
            v374 = v268;
            v232 = v277;
            v375 = v232;
            objc_msgSend(v229, "performCoreQuery:withCompletion:", v377, v368);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v377);

            if (v228)
              operator delete(v228);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v460);

            v233 = v389;
            if (v389)
            {
              v390 = v389;
              goto LABEL_314;
            }
            goto LABEL_315;
          }
          if (-[MPStoreLibraryMappingResponse count](v196, "count") && *((_QWORD *)&v511 + 1))
          {
            *(_QWORD *)&v508 = 0;
            v507[0] = 0;
            v507[1] = 0;
            v210 = 0;
            if ((_QWORD)v511)
            {
              v211 = (_QWORD *)v511;
              do
              {
                ++v210;
                v211 = (_QWORD *)*v211;
              }
              while (v211);
            }
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v507, (uint64_t *)v511, v210);
            v357[0] = MEMORY[0x1E0C809B0];
            v357[1] = 3321888768;
            v357[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_40;
            v357[3] = &unk_1E314AD70;
            memset(v364, 0, sizeof(v364));
            std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v364, (__int128 *)v507[0], (__int128 *)v507[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v507[1] - (char *)v507[0]) >> 3));
            v266 = v364;
            v357[4] = v295;
            v365 = 0;
            v367 = 0;
            v366 = 0;
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v365, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
            v212 = v196;
            v358 = v212;
            v213 = v197;
            v359 = v213;
            v214 = v198;
            v360 = v214;
            v215 = v117;
            v361 = v215;
            v269 = v195;
            v362 = v269;
            v363 = v293;
            v278 = (mlcore *)MEMORY[0x19403A810](v357);
            v216 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(v278);
            v217 = (ModelPropertyBase *)mlcore::ItemPropertyStoreCloudAlbumID(v216);
            v218 = (void **)MPMediaLibraryGetProperty((ModelPropertyBase *)v216, v217);
            v219 = MEMORY[0x194039F1C]();
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v507[1] - (char *)v507[0]) >> 3) >= 2)
              std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v532);
            else
              std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v532);
            *(_OWORD *)__p = v532;
            v532 = 0uLL;
            std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(v460, v219, (__int128 *)__p);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v532);
            __p[1] = 0;
            __p[0] = 0;
            v498 = 0;
            v234 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
            v529 = (void **)mlcore::AlbumPropertyPersistentID(v234);
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v529);
            v529 = v218;
            std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v529);
            v356 = 0;
            v354 = 0;
            v355 = 0;
            v235 = __p[0];
            std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v354, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
            mlcore::PropertiesQuery::setPropertiesToFetch();
            if (v354)
            {
              v355 = v354;
              operator delete(v354);
            }
            v236 = *(void **)(v295 + 272);
            v353[0] = v460[0];
            v353[1] = v460[1];
            if (v460[1])
            {
              v237 = (unint64_t *)((char *)v460[1] + 8);
              do
                v238 = __ldxr(v237);
              while (__stxr(v238 + 1, v237));
            }
            v344[0] = MEMORY[0x1E0C809B0];
            v344[1] = 3221225472;
            v344[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4_42;
            v344[3] = &unk_1E315CBE0;
            v352 = v218;
            v345 = v212;
            v346 = v213;
            v347 = v214;
            v348 = v215;
            v349 = v295;
            v350 = v269;
            v239 = v278;
            v351 = v239;
            objc_msgSend(v236, "performCoreQuery:withCompletion:", v353, v344);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v353);

            if (v235)
              operator delete(v235);
            std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v460);

            v233 = v365;
            if (v365)
            {
              v366 = v365;
LABEL_314:
              operator delete(v233);
            }
LABEL_315:
            __p[0] = v266;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
            __p[0] = v507;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
          }
          else
          {
            v293[2]();
          }

          if (v399)
          {
            v400 = v399;
            operator delete(v399);
          }
          std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v286);

LABEL_319:
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v510);
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v513);
          v240 = v296;
LABEL_320:
          std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v240);
          goto LABEL_197;
        }
      }
    }
    if (!objc_msgSend(*(id *)(v295 + 280), "isSubclassOfClass:", objc_opt_class()))
    {
      v209 = *(_QWORD *)(v295 + 304);
      if (v209)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v209 + 16))(v209, 0, 0);
      objc_msgSend((id)v295, "finish");
      goto LABEL_198;
    }
    v273 = (MPStoreLibraryMappingResponse *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v514 = 0u;
    v513 = 0u;
    v515 = 1065353216;
    v511 = 0u;
    v510 = 0u;
    v512 = 1065353216;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objb = (id)objc_claimAutoreleasedReturnValue();
    v342 = 0u;
    v343 = 0u;
    v340 = 0u;
    v341 = 0u;
    v291 = *(id *)(v295 + 288);
    v158 = objc_msgSend(v291, "countByEnumeratingWithState:objects:count:", &v340, v525, 16);
    if (v158)
    {
      v159 = *(_QWORD *)v341;
      do
      {
        for (k = 0; k != v158; ++k)
        {
          if (*(_QWORD *)v341 != v159)
            objc_enumerationMutation(v291);
          v161 = *(void **)(*((_QWORD *)&v340 + 1) + 8 * k);
          objc_msgSend(v161, "universalStore");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = objc_msgSend(v162, "adamID");

          if (v163)
            std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v513, v163, v163);
          objc_msgSend(v161, "universalStore");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "formerAdamIDs");
          v165 = (void *)objc_claimAutoreleasedReturnValue();

          v338 = 0u;
          v339 = 0u;
          v336 = 0u;
          v337 = 0u;
          v166 = v165;
          v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v336, v524, 16);
          if (v167)
          {
            v168 = *(_QWORD *)v337;
            do
            {
              for (m = 0; m != v167; ++m)
              {
                if (*(_QWORD *)v337 != v168)
                  objc_enumerationMutation(v166);
                v170 = objc_msgSend(*(id *)(*((_QWORD *)&v336 + 1) + 8 * m), "longLongValue");
                if (v170)
                  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v513, v170, v170);
              }
              v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v336, v524, 16);
            }
            while (v167);
          }

          objc_msgSend(v161, "personalizedStore");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "cloudArtistID");
          v172 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v172, "length"))
          {
            std::string::basic_string[abi:ne180100]<0>(v296, (char *)objc_msgSend(objc_retainAutorelease(v172), "UTF8String"));
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v510, (unsigned __int8 *)v296, (uint64_t)v296);
            if (SBYTE7(v297) < 0)
              operator delete(v296[0]);
          }
          else if (!v163)
          {
            goto LABEL_225;
          }
          -[MPStoreLibraryMappingResponse addObject:](v273, "addObject:", v161);
LABEL_225:

        }
        v158 = objc_msgSend(v291, "countByEnumeratingWithState:objects:count:", &v340, v525, 16);
      }
      while (v158);
    }

    v334 = 0u;
    v335 = 0u;
    v332 = 0u;
    v333 = 0u;
    v265 = *(id *)(v295 + 296);
    v173 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v332, v523, 16);
    if (!v173)
    {
LABEL_259:

      if (objc_msgSend((id)v295, "isCancelled"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
        v193 = (MPStoreLibraryMappingResponse *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, MPStoreLibraryMappingResponse *))v272)[2](v272, 0, v193);
      }
      else
      {
        v243 = objc_alloc_init(MPStoreLibraryMappingResponse);
        v296[0] = 0;
        v296[1] = v296;
        *(_QWORD *)&v297 = 0x3032000000;
        *((_QWORD *)&v297 + 1) = __Block_byref_object_copy__33486;
        v298 = __Block_byref_object_dispose__33487;
        v313[0] = MEMORY[0x1E0C809B0];
        v313[1] = 3321888768;
        v313[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_43;
        v313[3] = &unk_1E314AE88;
        v313[4] = v295;
        v244 = v272;
        v319 = v244;
        v245 = v273;
        v314 = v245;
        v246 = objb;
        v315 = v246;
        v294 = (id)std::unordered_set<long long>::unordered_set((uint64_t)&v320, (uint64_t)&v513);
        v321 = 0;
        v322 = 0;
        v323 = 0;
        std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v321, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
        v247 = v270;
        v316 = v247;
        v248 = v271;
        v317 = v248;
        v193 = v243;
        v318 = v193;
        v299 = (id)MEMORY[0x19403A810](v313);
        if ((-[MPStoreLibraryMappingResponse count](v245, "count") || objc_msgSend(v246, "count"))
          && *((_QWORD *)&v511 + 1))
        {
          *(_QWORD *)&v508 = 0;
          v507[0] = 0;
          v507[1] = 0;
          v249 = 0;
          if ((_QWORD)v511)
          {
            v250 = (_QWORD *)v511;
            do
            {
              ++v249;
              v250 = (_QWORD *)*v250;
            }
            while (v250);
          }
          v251 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(v507, (uint64_t *)v511, v249);
          v252 = (mlcore *)MEMORY[0x194039F64](v251);
          v253 = (uint64_t)v252;
          if (*((_QWORD *)&v511 + 1) < 2uLL)
          {
            mlcore::ArtistPropertyCloudUniversalLibraryID(v252);
            std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v532);
          }
          else
          {
            mlcore::ArtistPropertyCloudUniversalLibraryID(v252);
            std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v532);
          }
          *(_OWORD *)__p = v532;
          v532 = 0uLL;
          std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(v460, v253, (__int128 *)__p);
          std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)__p);
          std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v532);
          __p[1] = 0;
          __p[0] = 0;
          v498 = 0;
          v254 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(__p, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
          v529 = (void **)mlcore::ArtistPropertyPersistentID(v254);
          std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v529);
          v529 = (void **)mlcore::ArtistPropertyCloudUniversalLibraryID(v255);
          std::vector<mlcore::ModelPropertyBase *>::push_back[abi:ne180100](__p, &v529);
          v311 = 0;
          v312 = 0;
          v310 = 0;
          v256 = __p[0];
          std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v310, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
          mlcore::PropertiesQuery::setPropertiesToFetch();
          if (v310)
          {
            v311 = v310;
            operator delete(v310);
          }
          v257 = *(void **)(v295 + 272);
          v309[0] = v460[0];
          v309[1] = v460[1];
          if (v460[1])
          {
            v258 = (unint64_t *)((char *)v460[1] + 8);
            do
              v259 = __ldxr(v258);
            while (__stxr(v259 + 1, v258));
          }
          v300[0] = MEMORY[0x1E0C809B0];
          v300[1] = 3221225472;
          v300[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_45;
          v300[3] = &unk_1E315CC30;
          v301 = v245;
          v302 = v247;
          v303 = v248;
          v304 = v193;
          v305 = v246;
          v306 = v295;
          v307 = v244;
          v308 = v296;
          objc_msgSend(v257, "performCoreQuery:withCompletion:", v309, v300);
          std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v309);

          if (v256)
            operator delete(v256);
          std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)v460);
          __p[0] = v507;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        }
        else
        {
          (*(void (**)(void))(*((_QWORD *)v296[1] + 5) + 16))();
        }
        _Block_object_dispose(v296, 8);

        if (v321)
        {
          v322 = v321;
          operator delete(v321);
        }
        std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v294);

      }
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v510);
      v240 = (void **)&v513;
      goto LABEL_320;
    }
    v267 = *(_QWORD *)v333;
LABEL_229:
    v174 = 0;
    v263 = v173;
    while (1)
    {
      if (*(_QWORD *)v333 != v267)
        objc_enumerationMutation(v265);
      v175 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * v174);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v292 = (id)objc_claimAutoreleasedReturnValue();
      v330 = 0u;
      v331 = 0u;
      v328 = 0u;
      v329 = 0u;
      objc_msgSend(v175, "allKeys");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v276 = v174;
      v285 = v176;
      v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v328, v522, 16);
      if (v177)
        break;
LABEL_255:

      if (objc_msgSend(v292, "count"))
        objc_msgSend(objb, "addObject:", v292);

      v174 = v276 + 1;
      if (v276 + 1 == v263)
      {
        v173 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v332, v523, 16);
        if (!v173)
          goto LABEL_259;
        goto LABEL_229;
      }
    }
    v178 = *(_QWORD *)v329;
LABEL_234:
    v179 = 0;
    while (1)
    {
      if (*(_QWORD *)v329 != v178)
        objc_enumerationMutation(v285);
      v180 = *(void **)(*((_QWORD *)&v328 + 1) + 8 * v179);
      objc_msgSend(v180, "universalStore");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = objc_msgSend(v181, "adamID");

      if (v182)
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v513, v182, v182);
      objc_msgSend(v180, "universalStore");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "formerAdamIDs");
      v184 = (void *)objc_claimAutoreleasedReturnValue();

      v326 = 0u;
      v327 = 0u;
      v324 = 0u;
      v325 = 0u;
      v185 = v184;
      v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v324, v521, 16);
      if (v186)
      {
        v187 = *(_QWORD *)v325;
        do
        {
          for (n = 0; n != v186; ++n)
          {
            if (*(_QWORD *)v325 != v187)
              objc_enumerationMutation(v185);
            v189 = objc_msgSend(*(id *)(*((_QWORD *)&v324 + 1) + 8 * n), "longLongValue");
            if (v189)
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v513, v189, v189);
          }
          v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v324, v521, 16);
        }
        while (v186);
      }

      objc_msgSend(v180, "personalizedStore");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "cloudArtistID");
      v191 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v191, "length"))
        break;
      if (v182)
        goto LABEL_252;
LABEL_253:

      if (++v179 == v177)
      {
        v176 = v285;
        v177 = objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", &v328, v522, 16);
        if (!v177)
          goto LABEL_255;
        goto LABEL_234;
      }
    }
    std::string::basic_string[abi:ne180100]<0>(v296, (char *)objc_msgSend(objc_retainAutorelease(v191), "UTF8String"));
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)&v510, (unsigned __int8 *)v296, (uint64_t)v296);
    if (SBYTE7(v297) < 0)
      operator delete(v296[0]);
LABEL_252:
    objc_msgSend(v175, "objectForKey:", v180);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v292, "setObject:forKey:", v192, v180);

    goto LABEL_253;
  }
  v273 = objc_alloc_init(MPStoreLibraryMappingResponse);
  v274 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v283 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_OWORD *)v296 = 0u;
  v297 = 0u;
  LODWORD(v298) = 1065353216;
  v514 = 0u;
  v513 = 0u;
  v515 = 1065353216;
  v511 = 0u;
  v510 = 0u;
  v512 = 1065353216;
  v508 = 0u;
  *(_OWORD *)v507 = 0u;
  v509 = 1065353216;
  v506 = 0u;
  v505 = 0u;
  v504 = 0u;
  v503 = 0u;
  obj = *(id *)(v295 + 288);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v503, v535, 16);
  if (!v11)
    goto LABEL_51;
  v287 = *(id *)v504;
  do
  {
    for (ii = 0; ii != v11; ++ii)
    {
      if (*(id *)v504 != v287)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v503 + 1) + 8 * ii);
      objc_msgSend(v13, "library");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "databaseID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v295 + 272), "library");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", v17))
      {
        v18 = objc_msgSend(v14, "persistentID") == 0;

        if (!v18)
          goto LABEL_49;
      }
      else
      {

      }
      objc_msgSend(v13, "universalStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "subscriptionAdamID");

      v21 = v20 != 0;
      if (v20)
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v296, v20, v20);
      objc_msgSend(v13, "universalStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "purchasedAdamID");

      if (v23)
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v513, v23, v23);
        v21 = 1;
      }
      objc_msgSend(v13, "universalStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "adamID");

      if (v25)
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v296, v25, v25);
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v513, v25, v25);
        v21 = 1;
      }
      objc_msgSend(v13, "universalStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "formerAdamIDs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v502 = 0u;
      v501 = 0u;
      v500 = 0u;
      v499 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v499, v534, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v500;
        do
        {
          for (jj = 0; jj != v29; ++jj)
          {
            if (*(_QWORD *)v500 != v30)
              objc_enumerationMutation(v28);
            v32 = objc_msgSend(*(id *)(*((_QWORD *)&v499 + 1) + 8 * jj), "longLongValue");
            if (v32)
            {
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v513, v32, v32);
              std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v296, v32, v32);
            }
          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v499, v534, 16);
        }
        while (v29);
      }

      objc_msgSend(v13, "personalizedStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "cloudID");

      if (v34)
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)&v510, v34, v34);
        v21 = 1;
      }
      objc_msgSend(v13, "universalStore");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "universalCloudLibraryID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v36, "length"))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v36), "UTF8String"));
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)v507, (unsigned __int8 *)__p, (uint64_t)__p);
        if (SHIBYTE(v498) < 0)
          operator delete(__p[0]);
LABEL_46:
        objc_msgSend(v283, "objectForKey:", v13);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37 == 0;

        if (v38)
        {
          objc_msgSend(v274, "addObject:", v13);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v283, "setObject:forKey:", v39, v13);

        }
        goto LABEL_48;
      }
      if (v21)
        goto LABEL_46;
LABEL_48:

LABEL_49:
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v503, v535, 16);
  }
  while (v11);
LABEL_51:

  if (objc_msgSend((id)v295, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v272)[2](v272, 0, v40);

    goto LABEL_196;
  }
  v487[0] = MEMORY[0x1E0C809B0];
  v487[1] = 3321888768;
  v487[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2;
  v487[3] = &unk_1E314ADE0;
  v487[4] = v295;
  v41 = v272;
  v492 = v41;
  v42 = v274;
  v488 = v42;
  v262 = std::unordered_set<long long>::unordered_set((uint64_t)&v493, (uint64_t)v296);
  v495 = 0;
  v494 = 0;
  v496 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v494, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
  v43 = v270;
  v489 = v43;
  v44 = v271;
  v490 = v44;
  v45 = v273;
  v491 = v45;
  v288 = (id)MEMORY[0x19403A810](v487);
  v476[0] = MEMORY[0x1E0C809B0];
  v476[1] = 3321888768;
  v476[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_27;
  v476[3] = &unk_1E314AE18;
  v476[4] = v295;
  v46 = v41;
  v481 = v46;
  v47 = v42;
  v477 = v47;
  std::unordered_set<long long>::unordered_set((uint64_t)v483, (uint64_t)&v513);
  v485 = 0;
  v484 = 0;
  v486 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v484, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
  v48 = v43;
  v478 = v48;
  v49 = v44;
  v479 = v49;
  v50 = v45;
  v480 = v50;
  v51 = v288;
  v482 = v51;
  objc = (id)MEMORY[0x19403A810](v476);
  v465[0] = MEMORY[0x1E0C809B0];
  v465[1] = 3321888768;
  v465[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_29;
  v465[3] = &unk_1E314AE18;
  v465[4] = v295;
  v52 = v46;
  v470 = v52;
  v53 = v47;
  v466 = v53;
  std::unordered_set<long long>::unordered_set((uint64_t)v472, (uint64_t)&v510);
  v261 = v52;
  v474 = 0;
  v473 = 0;
  v475 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v473, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
  v54 = v48;
  v467 = v54;
  v55 = v49;
  v468 = v55;
  v56 = v50;
  v469 = v56;
  v264 = objc;
  v471 = v264;
  v57 = (void (**)(_QWORD))MEMORY[0x19403A810](v465);
  if (objc_msgSend(v53, "count") && *((_QWORD *)&v508 + 1))
  {
    v498 = 0;
    __p[0] = 0;
    __p[1] = 0;
    v58 = 0;
    if ((_QWORD)v508)
    {
      v59 = (_QWORD *)v508;
      do
      {
        ++v58;
        v59 = (_QWORD *)*v59;
      }
      while (v59);
    }
    v60 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(__p, (uint64_t *)v508, v58);
    v61 = (mlcore *)MEMORY[0x194039EC8](v60);
    v260 = v51;
    v62 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3);
    mlcore::ItemPropertyStoreCloudUniversalLibraryID(v61);
    if (v62 >= 2)
      std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v462);
    else
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v462);
    *(_OWORD *)v460 = v462;
    v462 = 0uLL;
    std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v463, (uint64_t)v61, (__int128 *)v460);
    v77 = (std::__shared_weak_count *)v460[1];
    if (v460[1])
    {
      v78 = (unint64_t *)((char *)v460[1] + 8);
      do
        v79 = __ldaxr(v78);
      while (__stlxr(v79 - 1, v78));
      if (!v79)
      {
        ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
        std::__shared_weak_count::__release_weak(v77);
      }
    }
    if (v62 > 1)
    {
      v80 = (std::__shared_weak_count *)*((_QWORD *)&v462 + 1);
      if (*((_QWORD *)&v462 + 1))
      {
        v83 = (unint64_t *)(*((_QWORD *)&v462 + 1) + 8);
        do
          v82 = __ldaxr(v83);
        while (__stlxr(v82 - 1, v83));
        goto LABEL_95;
      }
    }
    else
    {
      v80 = (std::__shared_weak_count *)*((_QWORD *)&v462 + 1);
      if (*((_QWORD *)&v462 + 1))
      {
        v81 = (unint64_t *)(*((_QWORD *)&v462 + 1) + 8);
        do
          v82 = __ldaxr(v81);
        while (__stlxr(v82 - 1, v81));
LABEL_95:
        if (!v82)
        {
          ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
          std::__shared_weak_count::__release_weak(v80);
        }
      }
    }
    v460[1] = 0;
    v460[0] = 0;
    v461 = 0;
    v84 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(v460, v516, (uint64_t)v517, (v517 - (_BYTE *)v516) >> 3);
    v85 = mlcore::ItemPropertyPersistentID(v84);
    v86 = v85;
    v87 = (char *)v460[1];
    v88 = v461;
    if (v460[1] >= v461)
    {
      v90 = (char *)v460[0];
      v91 = ((char *)v460[1] - (char *)v460[0]) >> 3;
      v92 = v91 + 1;
      if ((unint64_t)(v91 + 1) >> 61)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      if (((char *)v461 - (char *)v460[0]) >> 2 > v92)
        v92 = ((char *)v461 - (char *)v460[0]) >> 2;
      if ((unint64_t)((char *)v461 - (char *)v460[0]) >= 0x7FFFFFFFFFFFFFF8)
        v85 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v85 = v92;
      if (v85)
        v85 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v85);
      else
        v93 = 0;
      v134 = (uint64_t *)(v85 + 8 * v91);
      v88 = (uint64_t *)(v85 + 8 * v93);
      *v134 = v86;
      v89 = v134 + 1;
      if (v87 != v90)
      {
        do
        {
          v135 = *((_QWORD *)v87 - 1);
          v87 -= 8;
          *--v134 = v135;
        }
        while (v87 != v90);
        v87 = (char *)v460[0];
      }
      v460[0] = v134;
      v461 = (uint64_t *)(v85 + 8 * v93);
      if (v87)
        operator delete(v87);
    }
    else
    {
      *(_QWORD *)v460[1] = v85;
      v89 = (uint64_t *)(v87 + 8);
    }
    v460[1] = v89;
    v136 = mlcore::ItemPropertyStoreCloudUniversalLibraryID((mlcore *)v85);
    v137 = v136;
    if (v89 < v88)
    {
      *v89 = v136;
      v138 = v89 + 1;
      v51 = v260;
      goto LABEL_171;
    }
    v139 = (uint64_t *)v460[0];
    v140 = ((char *)v89 - (char *)v460[0]) >> 3;
    v141 = v140 + 1;
    if ((unint64_t)(v140 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if (((char *)v88 - (char *)v460[0]) >> 2 > v141)
      v141 = ((char *)v88 - (char *)v460[0]) >> 2;
    if ((unint64_t)((char *)v88 - (char *)v460[0]) >= 0x7FFFFFFFFFFFFFF8)
      v142 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v142 = v141;
    if (v142)
      v142 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v142);
    else
      v143 = 0;
    v144 = (uint64_t *)(v142 + 8 * v140);
    *v144 = v137;
    v138 = v144 + 1;
    v51 = v260;
    if (v89 == v139)
    {
      v460[0] = v144;
      v460[1] = v144 + 1;
      v461 = (uint64_t *)(v142 + 8 * v143);
    }
    else
    {
      do
      {
        v145 = *--v89;
        *--v144 = v145;
      }
      while (v89 != v139);
      v89 = (uint64_t *)v460[0];
      v460[0] = v144;
      v460[1] = v138;
      v461 = (uint64_t *)(v142 + 8 * v143);
      if (!v89)
      {
LABEL_171:
        v460[1] = v138;
        v459 = 0;
        v457 = 0;
        v458 = 0;
        std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v457, v460[0], (uint64_t)v138, (int64_t)((uint64_t)v138 - (unint64_t)v460[0]) >> 3);
        mlcore::PropertiesQuery::setPropertiesToFetch();
        v146 = (mlcore *)v457;
        if (v457)
        {
          v458 = v457;
          operator delete(v457);
        }
        mlcore::ItemPropertyInMyLibrary(v146);
        mlcore::SortDescriptor::SortDescriptor();
        v532 = 0uLL;
        v533 = 0;
        *(_QWORD *)&v520 = &v532;
        BYTE8(v520) = 0;
        v147 = operator new(0x18uLL);
        v533 = (char *)(v147 + 3);
        v148 = v530;
        *v147 = MEMORY[0x1E0D4AF48] + 16;
        v147[1] = v148;
        *((_DWORD *)v147 + 4) = v531;
        *(_QWORD *)&v532 = v147;
        *((_QWORD *)&v532 + 1) = v147 + 3;
        mlcore::PropertiesQuery::setSortDescriptors();
        v149 = *(void **)(v295 + 272);
        v455 = v463;
        v456 = v464;
        if (v464)
        {
          p_shared_owners = (unint64_t *)&v464->__shared_owners_;
          do
            v151 = __ldxr(p_shared_owners);
          while (__stxr(v151 + 1, p_shared_owners));
        }
        v447[0] = MEMORY[0x1E0C809B0];
        v447[1] = 3221225472;
        v447[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_31;
        v447[3] = &unk_1E315CBB8;
        v448 = v53;
        v449 = v54;
        v450 = v55;
        v451 = v56;
        v452 = v295;
        v453 = v261;
        v454 = v57;
        objc_msgSend(v149, "performCoreQuery:withCompletion:", &v455, v447);
        v152 = v456;
        if (v456)
        {
          v153 = (unint64_t *)&v456->__shared_owners_;
          do
            v154 = __ldaxr(v153);
          while (__stlxr(v154 - 1, v153));
          if (!v154)
          {
            ((void (*)(std::__shared_weak_count *))v152->__on_zero_shared)(v152);
            std::__shared_weak_count::__release_weak(v152);
          }
        }

        v529 = (void **)&v532;
        std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v529);
        if (v460[0])
          operator delete(v460[0]);
        v155 = v464;
        if (v464)
        {
          v156 = (unint64_t *)&v464->__shared_owners_;
          do
            v157 = __ldaxr(v156);
          while (__stlxr(v157 - 1, v156));
          if (!v157)
          {
            ((void (*)(std::__shared_weak_count *))v155->__on_zero_shared)(v155);
            std::__shared_weak_count::__release_weak(v155);
          }
        }
        v460[0] = __p;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v460);
        goto LABEL_189;
      }
    }
    operator delete(v89);
    goto LABEL_171;
  }
  v57[2](v57);
LABEL_189:

  if (v473)
  {
    v474 = v473;
    operator delete(v473);
  }
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v472);

  if (v484)
  {
    v485 = v484;
    operator delete(v484);
  }
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v483);

  if (v494)
  {
    v495 = v494;
    operator delete(v494);
  }
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table(v262);

LABEL_196:
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v507);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v510);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)&v513);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::__unordered_map_hasher<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::hash<mlcore::ModelProperty<int> *>,std::equal_to<mlcore::ModelProperty<int> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<int> *,std::__hash_value_type<mlcore::ModelProperty<int> *,int>,std::equal_to<mlcore::ModelProperty<int> *>,std::hash<mlcore::ModelProperty<int> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<int> *,int>>>::~__hash_table((uint64_t)v296);

LABEL_197:
LABEL_198:

  if (v516)
  {
    v517 = v516;
    operator delete(v516);
  }
  v4 = v270;
LABEL_201:

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_5(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  unint64_t *v15;
  unint64_t v16;
  _BYTE v17[24];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x30uLL);
    *v9 = &off_1E314A448;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v18 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v18;
    if (v18 == v17)
    {
      v11 = 4;
      v10 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  v12 = objc_msgSend(*(id *)(a1 + 64), "isCancelled");
  v13 = *(_QWORD *)(a1 + 72);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v13 + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), 0);
  }
  if (v6)
  {
    v15 = (unint64_t *)&v6->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t *v5;
  _QWORD *v6;
  mlcore *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  mlcore *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  mlcore *v38;
  _QWORD *v39;
  void **v40;
  uint64_t v41;
  void *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  id v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  _QWORD *v66;
  char *v67;
  char *v68;
  void *__p;
  void *v70;
  uint64_t v71;
  __int128 v72;
  unint64_t v73;
  __int128 v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  _QWORD *v77;
  char v78;
  void **v79[2];
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count") || !*(_QWORD *)(a1 + 104))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    return;
  }
  v3 = *(uint64_t **)(a1 + 96);
  v55 = 0;
  v56 = 0;
  v54 = 0;
  v4 = 0;
  if (v3)
  {
    v5 = v3;
    do
    {
      ++v4;
      v5 = (uint64_t *)*v5;
    }
    while (v5);
  }
  v6 = std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(&v54, v3, v4);
  v7 = (mlcore *)MEMORY[0x194039FE8](v6);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((v55 - v54) >> 3);
  mlcore::PlaylistPropertyCloudGlobalID(v7);
  if (v8 >= 2)
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v74);
  else
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v74);
  v72 = v74;
  v74 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v75, (uint64_t)v7, &v72);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v72 + 1);
  if (*((_QWORD *)&v72 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v8 > 1)
  {
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v74 + 1);
    if (!*((_QWORD *)&v74 + 1))
      goto LABEL_27;
    v15 = (unint64_t *)(*((_QWORD *)&v74 + 1) + 8);
    do
      v14 = __ldaxr(v15);
    while (__stlxr(v14 - 1, v15));
  }
  else
  {
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v74 + 1);
    if (!*((_QWORD *)&v74 + 1))
      goto LABEL_27;
    v13 = (unint64_t *)(*((_QWORD *)&v74 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
  }
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_27:
  v72 = 0uLL;
  v73 = 0;
  v16 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v72, *(const void **)(a1 + 120), *(_QWORD *)(a1 + 128), (uint64_t)(*(_QWORD *)(a1 + 128) - *(_QWORD *)(a1 + 120)) >> 3);
  v17 = mlcore::PlaylistPropertyPersistentID(v16);
  v18 = v17;
  v19 = (char *)*((_QWORD *)&v72 + 1);
  v20 = v73;
  if (*((_QWORD *)&v72 + 1) >= v73)
  {
    v22 = (char *)v72;
    v23 = (uint64_t)(*((_QWORD *)&v72 + 1) - v72) >> 3;
    v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v73 - v72) >> 2 > v24)
      v24 = (uint64_t)(v73 - v72) >> 2;
    if (v73 - (unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v24;
    if (v17)
      v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v17);
    else
      v25 = 0;
    v26 = (unint64_t *)(v17 + 8 * v23);
    v20 = v17 + 8 * v25;
    *v26 = v18;
    v21 = (uint64_t *)(v26 + 1);
    if (v19 != v22)
    {
      do
      {
        v27 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *--v26 = v27;
      }
      while (v19 != v22);
      v19 = (char *)v72;
    }
    *(_QWORD *)&v72 = v26;
    v73 = v17 + 8 * v25;
    if (v19)
      operator delete(v19);
  }
  else
  {
    **((_QWORD **)&v72 + 1) = v17;
    v21 = (uint64_t *)(v19 + 8);
  }
  *((_QWORD *)&v72 + 1) = v21;
  v28 = mlcore::PlaylistPropertyCloudGlobalID((mlcore *)v17);
  v29 = v28;
  if ((unint64_t)v21 >= v20)
  {
    v31 = (uint64_t *)v72;
    v32 = (uint64_t)((uint64_t)v21 - v72) >> 3;
    v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v20 - v72) >> 2 > v33)
      v33 = (uint64_t)(v20 - v72) >> 2;
    if (v20 - (unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8)
      v34 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v34 = v33;
    if (v34)
      v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v34);
    else
      v35 = 0;
    v36 = (uint64_t *)(v34 + 8 * v32);
    *v36 = v29;
    v30 = (uint64_t)(v36 + 1);
    if (v21 == v31)
    {
      *(_QWORD *)&v72 = v36;
      *((_QWORD *)&v72 + 1) = v36 + 1;
      v73 = v34 + 8 * v35;
    }
    else
    {
      do
      {
        v37 = *--v21;
        *--v36 = v37;
      }
      while (v21 != v31);
      v21 = (uint64_t *)v72;
      *(_QWORD *)&v72 = v36;
      *((_QWORD *)&v72 + 1) = v30;
      v73 = v34 + 8 * v35;
      if (!v21)
        goto LABEL_60;
    }
    operator delete(v21);
  }
  else
  {
    *v21 = v28;
    v30 = (uint64_t)(v21 + 1);
  }
LABEL_60:
  *((_QWORD *)&v72 + 1) = v30;
  v70 = 0;
  v71 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, (const void *)v72, v30, (v30 - (uint64_t)v72) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v38 = (mlcore *)__p;
  if (__p)
  {
    v70 = __p;
    operator delete(__p);
  }
  mlcore::PlaylistPropertyIsHidden(v38);
  mlcore::SortDescriptor::SortDescriptor();
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v77 = &v66;
  v78 = 0;
  v39 = operator new(0x18uLL);
  v68 = (char *)(v39 + 3);
  v40 = v79[1];
  *v39 = MEMORY[0x1E0D4AF48] + 16;
  v39[1] = v40;
  *((_DWORD *)v39 + 4) = v80;
  v66 = v39;
  v67 = (char *)(v39 + 3);
  v41 = v75;
  mlcore::PropertiesQuery::setSortDescriptors();
  v42 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  v64 = v41;
  v65 = v76;
  if (v76)
  {
    p_shared_owners = (unint64_t *)&v76->__shared_owners_;
    do
      v44 = __ldxr(p_shared_owners);
    while (__stxr(v44 + 1, p_shared_owners));
  }
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_5;
  v57[3] = &unk_1E315CB90;
  v58 = *(id *)(a1 + 40);
  v59 = *(id *)(a1 + 48);
  v60 = *(id *)(a1 + 56);
  v45 = *(id *)(a1 + 64);
  v46 = *(_QWORD *)(a1 + 32);
  v61 = v45;
  v62 = v46;
  v63 = *(id *)(a1 + 72);
  objc_msgSend(v42, "performCoreQuery:withCompletion:", &v64, v57);
  v47 = v65;
  if (v65)
  {
    v48 = (unint64_t *)&v65->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }

  v79[0] = (void **)&v66;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v79);
  if ((_QWORD)v72)
    operator delete((void *)v72);
  v50 = v76;
  if (v76)
  {
    v51 = (unint64_t *)&v76->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  *(_QWORD *)&v72 = &v54;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v72);
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  unint64_t *v15;
  unint64_t v16;
  _BYTE v17[24];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x30uLL);
    *v9 = &off_1E314A4F8;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v18 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v18;
    if (v18 == v17)
    {
      v11 = 4;
      v10 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  v12 = objc_msgSend(*(id *)(a1 + 64), "isCancelled");
  v13 = *(_QWORD *)(a1 + 72);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v13 + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), 0);
  }
  if (v6)
  {
    v15 = (unint64_t *)&v6->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  mlcore *v7;
  uint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  mlcore *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  mlcore *v39;
  _QWORD *v40;
  void **v41;
  uint64_t v42;
  void *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  id v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  id v54;
  void *v55;
  _BYTE *v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  std::__shared_weak_count *v66;
  _QWORD *v67;
  char *v68;
  char *v69;
  void *__p;
  void *v71;
  uint64_t v72;
  __int128 v73;
  unint64_t v74;
  __int128 v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  _QWORD *v78;
  char v79;
  void **v80[2];
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count") || !*(_QWORD *)(a1 + 104))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    return;
  }
  v3 = *(_QWORD **)(a1 + 96);
  v56 = 0;
  v57 = 0;
  v55 = 0;
  v4 = 0;
  if (v3)
  {
    v5 = v3;
    do
    {
      ++v4;
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }
  v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v55, v3, v4);
  v7 = (mlcore *)MEMORY[0x194039EC8](v6);
  v8 = (uint64_t)v7;
  v9 = v56 - (_BYTE *)v55;
  if ((unint64_t)(v56 - (_BYTE *)v55) >= 0x10)
  {
    mlcore::ItemPropertySubscriptionStoreItemID(v7);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v75);
  }
  else
  {
    mlcore::ItemPropertySubscriptionStoreItemID(v7);
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v75);
  }
  v73 = v75;
  v75 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v76, v8, &v73);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v73 + 1);
  if (*((_QWORD *)&v73 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v73 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v9 > 0xF)
  {
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
    if (!*((_QWORD *)&v75 + 1))
      goto LABEL_27;
    v16 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
    do
      v15 = __ldaxr(v16);
    while (__stlxr(v15 - 1, v16));
  }
  else
  {
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
    if (!*((_QWORD *)&v75 + 1))
      goto LABEL_27;
    v14 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
  }
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
LABEL_27:
  v73 = 0uLL;
  v74 = 0;
  v17 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v73, *(const void **)(a1 + 120), *(_QWORD *)(a1 + 128), (uint64_t)(*(_QWORD *)(a1 + 128) - *(_QWORD *)(a1 + 120)) >> 3);
  v18 = mlcore::ItemPropertyPersistentID(v17);
  v19 = v18;
  v20 = (char *)*((_QWORD *)&v73 + 1);
  v21 = v74;
  if (*((_QWORD *)&v73 + 1) >= v74)
  {
    v23 = (char *)v73;
    v24 = (uint64_t)(*((_QWORD *)&v73 + 1) - v73) >> 3;
    v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v74 - v73) >> 2 > v25)
      v25 = (uint64_t)(v74 - v73) >> 2;
    if (v74 - (unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8)
      v18 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v18 = v25;
    if (v18)
      v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v18);
    else
      v26 = 0;
    v27 = (unint64_t *)(v18 + 8 * v24);
    v21 = v18 + 8 * v26;
    *v27 = v19;
    v22 = (uint64_t *)(v27 + 1);
    if (v20 != v23)
    {
      do
      {
        v28 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *--v27 = v28;
      }
      while (v20 != v23);
      v20 = (char *)v73;
    }
    *(_QWORD *)&v73 = v27;
    v74 = v18 + 8 * v26;
    if (v20)
      operator delete(v20);
  }
  else
  {
    **((_QWORD **)&v73 + 1) = v18;
    v22 = (uint64_t *)(v20 + 8);
  }
  *((_QWORD *)&v73 + 1) = v22;
  v29 = mlcore::ItemPropertySubscriptionStoreItemID((mlcore *)v18);
  v30 = v29;
  if ((unint64_t)v22 >= v21)
  {
    v32 = (uint64_t *)v73;
    v33 = (uint64_t)((uint64_t)v22 - v73) >> 3;
    v34 = v33 + 1;
    if ((unint64_t)(v33 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v21 - v73) >> 2 > v34)
      v34 = (uint64_t)(v21 - v73) >> 2;
    if (v21 - (unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8)
      v35 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v35 = v34;
    if (v35)
      v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v35);
    else
      v36 = 0;
    v37 = (uint64_t *)(v35 + 8 * v33);
    *v37 = v30;
    v31 = (uint64_t)(v37 + 1);
    if (v22 == v32)
    {
      *(_QWORD *)&v73 = v37;
      *((_QWORD *)&v73 + 1) = v37 + 1;
      v74 = v35 + 8 * v36;
    }
    else
    {
      do
      {
        v38 = *--v22;
        *--v37 = v38;
      }
      while (v22 != v32);
      v22 = (uint64_t *)v73;
      *(_QWORD *)&v73 = v37;
      *((_QWORD *)&v73 + 1) = v31;
      v74 = v35 + 8 * v36;
      if (!v22)
        goto LABEL_60;
    }
    operator delete(v22);
  }
  else
  {
    *v22 = v29;
    v31 = (uint64_t)(v22 + 1);
  }
LABEL_60:
  *((_QWORD *)&v73 + 1) = v31;
  v71 = 0;
  v72 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, (const void *)v73, v31, (v31 - (uint64_t)v73) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v39 = (mlcore *)__p;
  if (__p)
  {
    v71 = __p;
    operator delete(__p);
  }
  mlcore::ItemPropertyInMyLibrary(v39);
  mlcore::SortDescriptor::SortDescriptor();
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v78 = &v67;
  v79 = 0;
  v40 = operator new(0x18uLL);
  v69 = (char *)(v40 + 3);
  v41 = v80[1];
  *v40 = MEMORY[0x1E0D4AF48] + 16;
  v40[1] = v41;
  *((_DWORD *)v40 + 4) = v81;
  v67 = v40;
  v68 = (char *)(v40 + 3);
  v42 = v76;
  mlcore::PropertiesQuery::setSortDescriptors();
  v43 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  v65 = v42;
  v66 = v77;
  if (v77)
  {
    p_shared_owners = (unint64_t *)&v77->__shared_owners_;
    do
      v45 = __ldxr(p_shared_owners);
    while (__stxr(v45 + 1, p_shared_owners));
  }
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3;
  v58[3] = &unk_1E315CB90;
  v59 = *(id *)(a1 + 40);
  v60 = *(id *)(a1 + 48);
  v61 = *(id *)(a1 + 56);
  v46 = *(id *)(a1 + 64);
  v47 = *(_QWORD *)(a1 + 32);
  v62 = v46;
  v63 = v47;
  v64 = *(id *)(a1 + 72);
  objc_msgSend(v43, "performCoreQuery:withCompletion:", &v65, v58);
  v48 = v66;
  if (v66)
  {
    v49 = (unint64_t *)&v66->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }

  v80[0] = (void **)&v67;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v80);
  if ((_QWORD)v73)
    operator delete((void *)v73);
  v51 = v77;
  if (v77)
  {
    v52 = (unint64_t *)&v77->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
}

- (void)setAlbumArtistNamesToIdentifierSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (NSArray)identifierSets
{
  return self->_identifierSets;
}

- (NSArray)albumArtistNamesToIdentifierSets
{
  return self->_albumArtistNamesToIdentifierSets;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_27(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  mlcore *v7;
  uint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  mlcore *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  mlcore *v39;
  _QWORD *v40;
  void **v41;
  uint64_t v42;
  void *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  id v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  id v54;
  void *v55;
  _BYTE *v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  uint64_t v66;
  std::__shared_weak_count *v67;
  _QWORD *v68;
  char *v69;
  char *v70;
  void *__p;
  void *v72;
  uint64_t v73;
  __int128 v74;
  unint64_t v75;
  __int128 v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  _QWORD *v79;
  char v80;
  void **v81[2];
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count") || !*(_QWORD *)(a1 + 112))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    return;
  }
  v3 = *(_QWORD **)(a1 + 104);
  v56 = 0;
  v57 = 0;
  v55 = 0;
  v4 = 0;
  if (v3)
  {
    v5 = v3;
    do
    {
      ++v4;
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }
  v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v55, v3, v4);
  v7 = (mlcore *)MEMORY[0x194039EC8](v6);
  v8 = (uint64_t)v7;
  v9 = v56 - (_BYTE *)v55;
  if ((unint64_t)(v56 - (_BYTE *)v55) >= 0x10)
  {
    mlcore::ItemPropertyStoreID(v7);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v76);
  }
  else
  {
    mlcore::ItemPropertyStoreID(v7);
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v76);
  }
  v74 = v76;
  v76 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v77, v8, &v74);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v74 + 1);
  if (*((_QWORD *)&v74 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v74 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v9 > 0xF)
  {
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v76 + 1);
    if (!*((_QWORD *)&v76 + 1))
      goto LABEL_27;
    v16 = (unint64_t *)(*((_QWORD *)&v76 + 1) + 8);
    do
      v15 = __ldaxr(v16);
    while (__stlxr(v15 - 1, v16));
  }
  else
  {
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v76 + 1);
    if (!*((_QWORD *)&v76 + 1))
      goto LABEL_27;
    v14 = (unint64_t *)(*((_QWORD *)&v76 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
  }
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
LABEL_27:
  v74 = 0uLL;
  v75 = 0;
  v17 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v74, *(const void **)(a1 + 128), *(_QWORD *)(a1 + 136), (uint64_t)(*(_QWORD *)(a1 + 136) - *(_QWORD *)(a1 + 128)) >> 3);
  v18 = mlcore::ItemPropertyPersistentID(v17);
  v19 = v18;
  v20 = (char *)*((_QWORD *)&v74 + 1);
  v21 = v75;
  if (*((_QWORD *)&v74 + 1) >= v75)
  {
    v23 = (char *)v74;
    v24 = (uint64_t)(*((_QWORD *)&v74 + 1) - v74) >> 3;
    v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v75 - v74) >> 2 > v25)
      v25 = (uint64_t)(v75 - v74) >> 2;
    if (v75 - (unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8)
      v18 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v18 = v25;
    if (v18)
      v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v18);
    else
      v26 = 0;
    v27 = (unint64_t *)(v18 + 8 * v24);
    v21 = v18 + 8 * v26;
    *v27 = v19;
    v22 = (uint64_t *)(v27 + 1);
    if (v20 != v23)
    {
      do
      {
        v28 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *--v27 = v28;
      }
      while (v20 != v23);
      v20 = (char *)v74;
    }
    *(_QWORD *)&v74 = v27;
    v75 = v18 + 8 * v26;
    if (v20)
      operator delete(v20);
  }
  else
  {
    **((_QWORD **)&v74 + 1) = v18;
    v22 = (uint64_t *)(v20 + 8);
  }
  *((_QWORD *)&v74 + 1) = v22;
  v29 = mlcore::ItemPropertyStoreID((mlcore *)v18);
  v30 = v29;
  if ((unint64_t)v22 >= v21)
  {
    v32 = (uint64_t *)v74;
    v33 = (uint64_t)((uint64_t)v22 - v74) >> 3;
    v34 = v33 + 1;
    if ((unint64_t)(v33 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v21 - v74) >> 2 > v34)
      v34 = (uint64_t)(v21 - v74) >> 2;
    if (v21 - (unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8)
      v35 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v35 = v34;
    if (v35)
      v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v35);
    else
      v36 = 0;
    v37 = (uint64_t *)(v35 + 8 * v33);
    *v37 = v30;
    v31 = (uint64_t)(v37 + 1);
    if (v22 == v32)
    {
      *(_QWORD *)&v74 = v37;
      *((_QWORD *)&v74 + 1) = v37 + 1;
      v75 = v35 + 8 * v36;
    }
    else
    {
      do
      {
        v38 = *--v22;
        *--v37 = v38;
      }
      while (v22 != v32);
      v22 = (uint64_t *)v74;
      *(_QWORD *)&v74 = v37;
      *((_QWORD *)&v74 + 1) = v31;
      v75 = v35 + 8 * v36;
      if (!v22)
        goto LABEL_60;
    }
    operator delete(v22);
  }
  else
  {
    *v22 = v29;
    v31 = (uint64_t)(v22 + 1);
  }
LABEL_60:
  *((_QWORD *)&v74 + 1) = v31;
  v72 = 0;
  v73 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, (const void *)v74, v31, (v31 - (uint64_t)v74) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v39 = (mlcore *)__p;
  if (__p)
  {
    v72 = __p;
    operator delete(__p);
  }
  mlcore::ItemPropertyInMyLibrary(v39);
  mlcore::SortDescriptor::SortDescriptor();
  v68 = 0;
  v69 = 0;
  v70 = 0;
  v79 = &v68;
  v80 = 0;
  v40 = operator new(0x18uLL);
  v70 = (char *)(v40 + 3);
  v41 = v81[1];
  *v40 = MEMORY[0x1E0D4AF48] + 16;
  v40[1] = v41;
  *((_DWORD *)v40 + 4) = v82;
  v68 = v40;
  v69 = (char *)(v40 + 3);
  v42 = v77;
  mlcore::PropertiesQuery::setSortDescriptors();
  v43 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  v66 = v42;
  v67 = v78;
  if (v78)
  {
    p_shared_owners = (unint64_t *)&v78->__shared_owners_;
    do
      v45 = __ldxr(p_shared_owners);
    while (__stxr(v45 + 1, p_shared_owners));
  }
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_28;
  v58[3] = &unk_1E315CBB8;
  v59 = *(id *)(a1 + 40);
  v60 = *(id *)(a1 + 48);
  v61 = *(id *)(a1 + 56);
  v46 = *(id *)(a1 + 64);
  v47 = *(_QWORD *)(a1 + 32);
  v62 = v46;
  v63 = v47;
  v64 = *(id *)(a1 + 72);
  v65 = *(id *)(a1 + 80);
  objc_msgSend(v43, "performCoreQuery:withCompletion:", &v66, v58);
  v48 = v67;
  if (v67)
  {
    v49 = (unint64_t *)&v67->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }

  v81[0] = (void **)&v68;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v81);
  if ((_QWORD)v74)
    operator delete((void *)v74);
  v51 = v78;
  if (v78)
  {
    v52 = (unint64_t *)&v78->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_29(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  mlcore *v7;
  uint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  mlcore *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  mlcore *v39;
  _QWORD *v40;
  void **v41;
  uint64_t v42;
  void *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  id v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  id v54;
  void *v55;
  _BYTE *v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  uint64_t v66;
  std::__shared_weak_count *v67;
  _QWORD *v68;
  char *v69;
  char *v70;
  void *__p;
  void *v72;
  uint64_t v73;
  __int128 v74;
  unint64_t v75;
  __int128 v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  _QWORD *v79;
  char v80;
  void **v81[2];
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count") || !*(_QWORD *)(a1 + 112))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    return;
  }
  v3 = *(_QWORD **)(a1 + 104);
  v56 = 0;
  v57 = 0;
  v55 = 0;
  v4 = 0;
  if (v3)
  {
    v5 = v3;
    do
    {
      ++v4;
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }
  v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v55, v3, v4);
  v7 = (mlcore *)MEMORY[0x194039EC8](v6);
  v8 = (uint64_t)v7;
  v9 = v56 - (_BYTE *)v55;
  if ((unint64_t)(v56 - (_BYTE *)v55) >= 0x10)
  {
    mlcore::ItemPropertyStoreCloudID(v7);
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v76);
  }
  else
  {
    mlcore::ItemPropertyStoreCloudID(v7);
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v76);
  }
  v74 = v76;
  v76 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v77, v8, &v74);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v74 + 1);
  if (*((_QWORD *)&v74 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v74 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v9 > 0xF)
  {
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v76 + 1);
    if (!*((_QWORD *)&v76 + 1))
      goto LABEL_27;
    v16 = (unint64_t *)(*((_QWORD *)&v76 + 1) + 8);
    do
      v15 = __ldaxr(v16);
    while (__stlxr(v15 - 1, v16));
  }
  else
  {
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v76 + 1);
    if (!*((_QWORD *)&v76 + 1))
      goto LABEL_27;
    v14 = (unint64_t *)(*((_QWORD *)&v76 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
  }
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
LABEL_27:
  v74 = 0uLL;
  v75 = 0;
  v17 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v74, *(const void **)(a1 + 128), *(_QWORD *)(a1 + 136), (uint64_t)(*(_QWORD *)(a1 + 136) - *(_QWORD *)(a1 + 128)) >> 3);
  v18 = mlcore::ItemPropertyPersistentID(v17);
  v19 = v18;
  v20 = (char *)*((_QWORD *)&v74 + 1);
  v21 = v75;
  if (*((_QWORD *)&v74 + 1) >= v75)
  {
    v23 = (char *)v74;
    v24 = (uint64_t)(*((_QWORD *)&v74 + 1) - v74) >> 3;
    v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v75 - v74) >> 2 > v25)
      v25 = (uint64_t)(v75 - v74) >> 2;
    if (v75 - (unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8)
      v18 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v18 = v25;
    if (v18)
      v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v18);
    else
      v26 = 0;
    v27 = (unint64_t *)(v18 + 8 * v24);
    v21 = v18 + 8 * v26;
    *v27 = v19;
    v22 = (uint64_t *)(v27 + 1);
    if (v20 != v23)
    {
      do
      {
        v28 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *--v27 = v28;
      }
      while (v20 != v23);
      v20 = (char *)v74;
    }
    *(_QWORD *)&v74 = v27;
    v75 = v18 + 8 * v26;
    if (v20)
      operator delete(v20);
  }
  else
  {
    **((_QWORD **)&v74 + 1) = v18;
    v22 = (uint64_t *)(v20 + 8);
  }
  *((_QWORD *)&v74 + 1) = v22;
  v29 = mlcore::ItemPropertyStoreCloudID((mlcore *)v18);
  v30 = v29;
  if ((unint64_t)v22 >= v21)
  {
    v32 = (uint64_t *)v74;
    v33 = (uint64_t)((uint64_t)v22 - v74) >> 3;
    v34 = v33 + 1;
    if ((unint64_t)(v33 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v21 - v74) >> 2 > v34)
      v34 = (uint64_t)(v21 - v74) >> 2;
    if (v21 - (unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8)
      v35 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v35 = v34;
    if (v35)
      v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v35);
    else
      v36 = 0;
    v37 = (uint64_t *)(v35 + 8 * v33);
    *v37 = v30;
    v31 = (uint64_t)(v37 + 1);
    if (v22 == v32)
    {
      *(_QWORD *)&v74 = v37;
      *((_QWORD *)&v74 + 1) = v37 + 1;
      v75 = v35 + 8 * v36;
    }
    else
    {
      do
      {
        v38 = *--v22;
        *--v37 = v38;
      }
      while (v22 != v32);
      v22 = (uint64_t *)v74;
      *(_QWORD *)&v74 = v37;
      *((_QWORD *)&v74 + 1) = v31;
      v75 = v35 + 8 * v36;
      if (!v22)
        goto LABEL_60;
    }
    operator delete(v22);
  }
  else
  {
    *v22 = v29;
    v31 = (uint64_t)(v22 + 1);
  }
LABEL_60:
  *((_QWORD *)&v74 + 1) = v31;
  v72 = 0;
  v73 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, (const void *)v74, v31, (v31 - (uint64_t)v74) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v39 = (mlcore *)__p;
  if (__p)
  {
    v72 = __p;
    operator delete(__p);
  }
  mlcore::ItemPropertyInMyLibrary(v39);
  mlcore::SortDescriptor::SortDescriptor();
  v68 = 0;
  v69 = 0;
  v70 = 0;
  v79 = &v68;
  v80 = 0;
  v40 = operator new(0x18uLL);
  v70 = (char *)(v40 + 3);
  v41 = v81[1];
  *v40 = MEMORY[0x1E0D4AF48] + 16;
  v40[1] = v41;
  *((_DWORD *)v40 + 4) = v82;
  v68 = v40;
  v69 = (char *)(v40 + 3);
  v42 = v77;
  mlcore::PropertiesQuery::setSortDescriptors();
  v43 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  v66 = v42;
  v67 = v78;
  if (v78)
  {
    p_shared_owners = (unint64_t *)&v78->__shared_owners_;
    do
      v45 = __ldxr(p_shared_owners);
    while (__stxr(v45 + 1, p_shared_owners));
  }
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_30;
  v58[3] = &unk_1E315CBB8;
  v59 = *(id *)(a1 + 40);
  v60 = *(id *)(a1 + 48);
  v61 = *(id *)(a1 + 56);
  v46 = *(id *)(a1 + 64);
  v47 = *(_QWORD *)(a1 + 32);
  v62 = v46;
  v63 = v47;
  v64 = *(id *)(a1 + 72);
  v65 = *(id *)(a1 + 80);
  objc_msgSend(v43, "performCoreQuery:withCompletion:", &v66, v58);
  v48 = v67;
  if (v67)
  {
    v49 = (unint64_t *)&v67->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }

  v81[0] = (void **)&v68;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v81);
  if ((_QWORD)v74)
    operator delete((void *)v74);
  v51 = v78;
  if (v78)
  {
    v52 = (unint64_t *)&v78->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_31(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x30uLL);
    *v9 = &off_1E314A080;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_32(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  mlcore *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  mlcore *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  mlcore *v38;
  _QWORD *v39;
  void **v40;
  uint64_t v41;
  void *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  id v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  id v53;
  _BYTE *v54;
  char *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  _QWORD *v66;
  char *v67;
  char *v68;
  void *__p;
  void *v70;
  uint64_t v71;
  __int128 v72;
  unint64_t v73;
  __int128 v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  _QWORD *v77;
  char v78;
  void **v79[2];
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count") || !*(_QWORD *)(a1 + 112))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    return;
  }
  v3 = *(_QWORD **)(a1 + 104);
  v55 = 0;
  v54 = 0;
  if (v3)
  {
    v4 = -1;
    v5 = *(_QWORD **)(a1 + 104);
    do
    {
      v6 = v4;
      v5 = (_QWORD *)*v5;
      ++v4;
    }
    while (v5);
    if (v4 >= 0x1FFFFFFFFFFFFFFFLL)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v7 = std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v6 + 2);
    v54 = v7;
    do
    {
      *v7++ = v3[2];
      v3 = (_QWORD *)*v3;
    }
    while (v3);
    v55 = (char *)v7;
  }
  v8 = (mlcore *)MEMORY[0x194039FE8]();
  mlcore::PlaylistPropertyStoreCloudID(v8);
  if ((unint64_t)(v55 - v54) >= 0x10)
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v74);
  else
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v74);
  v72 = v74;
  v74 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v75, (uint64_t)v8, &v72);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v72 + 1);
  if (*((_QWORD *)&v72 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v72 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if ((unint64_t)(v55 - v54) > 0xF)
  {
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v74 + 1);
    if (!*((_QWORD *)&v74 + 1))
      goto LABEL_31;
    v15 = (unint64_t *)(*((_QWORD *)&v74 + 1) + 8);
    do
      v14 = __ldaxr(v15);
    while (__stlxr(v14 - 1, v15));
  }
  else
  {
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v74 + 1);
    if (!*((_QWORD *)&v74 + 1))
      goto LABEL_31;
    v13 = (unint64_t *)(*((_QWORD *)&v74 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
  }
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_31:
  v72 = 0uLL;
  v73 = 0;
  v16 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v72, *(const void **)(a1 + 128), *(_QWORD *)(a1 + 136), (uint64_t)(*(_QWORD *)(a1 + 136) - *(_QWORD *)(a1 + 128)) >> 3);
  v17 = mlcore::PlaylistPropertyPersistentID(v16);
  v18 = v17;
  v19 = (char *)*((_QWORD *)&v72 + 1);
  v20 = v73;
  if (*((_QWORD *)&v72 + 1) >= v73)
  {
    v22 = (char *)v72;
    v23 = (uint64_t)(*((_QWORD *)&v72 + 1) - v72) >> 3;
    v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v73 - v72) >> 2 > v24)
      v24 = (uint64_t)(v73 - v72) >> 2;
    if (v73 - (unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v24;
    if (v17)
      v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v17);
    else
      v25 = 0;
    v26 = (unint64_t *)(v17 + 8 * v23);
    v20 = v17 + 8 * v25;
    *v26 = v18;
    v21 = (uint64_t *)(v26 + 1);
    if (v19 != v22)
    {
      do
      {
        v27 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *--v26 = v27;
      }
      while (v19 != v22);
      v19 = (char *)v72;
    }
    *(_QWORD *)&v72 = v26;
    v73 = v17 + 8 * v25;
    if (v19)
      operator delete(v19);
  }
  else
  {
    **((_QWORD **)&v72 + 1) = v17;
    v21 = (uint64_t *)(v19 + 8);
  }
  *((_QWORD *)&v72 + 1) = v21;
  v28 = mlcore::PlaylistPropertyStoreCloudID((mlcore *)v17);
  v29 = v28;
  if ((unint64_t)v21 >= v20)
  {
    v31 = (uint64_t *)v72;
    v32 = (uint64_t)((uint64_t)v21 - v72) >> 3;
    v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v20 - v72) >> 2 > v33)
      v33 = (uint64_t)(v20 - v72) >> 2;
    if (v20 - (unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8)
      v34 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v34 = v33;
    if (v34)
      v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v34);
    else
      v35 = 0;
    v36 = (uint64_t *)(v34 + 8 * v32);
    *v36 = v29;
    v30 = (uint64_t)(v36 + 1);
    if (v21 == v31)
    {
      *(_QWORD *)&v72 = v36;
      *((_QWORD *)&v72 + 1) = v36 + 1;
      v73 = v34 + 8 * v35;
    }
    else
    {
      do
      {
        v37 = *--v21;
        *--v36 = v37;
      }
      while (v21 != v31);
      v21 = (uint64_t *)v72;
      *(_QWORD *)&v72 = v36;
      *((_QWORD *)&v72 + 1) = v30;
      v73 = v34 + 8 * v35;
      if (!v21)
        goto LABEL_64;
    }
    operator delete(v21);
  }
  else
  {
    *v21 = v28;
    v30 = (uint64_t)(v21 + 1);
  }
LABEL_64:
  *((_QWORD *)&v72 + 1) = v30;
  v70 = 0;
  v71 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, (const void *)v72, v30, (v30 - (uint64_t)v72) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v38 = (mlcore *)__p;
  if (__p)
  {
    v70 = __p;
    operator delete(__p);
  }
  mlcore::PlaylistPropertyIsHidden(v38);
  mlcore::SortDescriptor::SortDescriptor();
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v77 = &v66;
  v78 = 0;
  v39 = operator new(0x18uLL);
  v68 = (char *)(v39 + 3);
  v40 = v79[1];
  *v39 = MEMORY[0x1E0D4AF48] + 16;
  v39[1] = v40;
  *((_DWORD *)v39 + 4) = v80;
  v66 = v39;
  v67 = (char *)(v39 + 3);
  v41 = v75;
  mlcore::PropertiesQuery::setSortDescriptors();
  v42 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  v64 = v41;
  v65 = v76;
  if (v76)
  {
    p_shared_owners = (unint64_t *)&v76->__shared_owners_;
    do
      v44 = __ldxr(p_shared_owners);
    while (__stxr(v44 + 1, p_shared_owners));
  }
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_33;
  v56[3] = &unk_1E315CBB8;
  v57 = *(id *)(a1 + 40);
  v58 = *(id *)(a1 + 48);
  v59 = *(id *)(a1 + 56);
  v45 = *(id *)(a1 + 64);
  v46 = *(_QWORD *)(a1 + 32);
  v60 = v45;
  v61 = v46;
  v62 = *(id *)(a1 + 72);
  v63 = *(id *)(a1 + 80);
  objc_msgSend(v42, "performCoreQuery:withCompletion:", &v64, v56);
  v47 = v65;
  if (v65)
  {
    v48 = (unint64_t *)&v65->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }

  v79[0] = (void **)&v66;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v79);
  if ((_QWORD)v72)
    operator delete((void *)v72);
  v50 = v76;
  if (v76)
  {
    v51 = (unint64_t *)&v76->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  if (v54)
    operator delete(v54);
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_34(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x30uLL);
    *v9 = &off_1E3149F20;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_35(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  mlcore *v7;
  mlcore *v8;
  mlcore *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  _OWORD *v29;
  char v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t j;
  mlcore *v40;
  mlcore *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  unint64_t *p_shared_owners;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  void *v69;
  uint64_t v70;
  _QWORD v71[5];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  void *__p;
  void *v83;
  uint64_t v84;
  _OWORD *v85;
  _OWORD *v86;
  _OWORD *v87;
  __int128 v88;
  uint64_t v89;
  std::__shared_weak_count *v90;
  _OWORD *v91;
  _OWORD *v92;
  _OWORD *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE *v98;
  _BYTE *v99;
  uint64_t v100;
  __int128 v101;
  void **v102;
  char v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count") && *(_QWORD *)(a1 + 104))
  {
    v101 = 0uLL;
    v3 = *(_QWORD **)(a1 + 96);
    v99 = 0;
    v100 = 0;
    v98 = 0;
    v4 = 0;
    if (v3)
    {
      v5 = v3;
      do
      {
        ++v4;
        v5 = (_QWORD *)*v5;
      }
      while (v5);
    }
    v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&v98, v3, v4);
    if (v99 - v98 == 8)
    {
      mlcore::ItemPropertyStorePlaylistID((mlcore *)v6);
      v7 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator &,long long const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v104);
    }
    else
    {
      mlcore::ItemPropertyStorePlaylistID((mlcore *)v6);
      v7 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v104);
    }
    v70 = v104;
    v101 = v104;
    mlcore::ItemPropertyInMyLibrary(v7);
    v8 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v104);
    v97 = v104;
    mlcore::ItemPropertyAlbumLikeState(v8);
    LODWORD(v102) = 2;
    v9 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v104);
    v96 = v104;
    mlcore::ItemPropertyAlbumLikeState(v9);
    LODWORD(v102) = 3;
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<int>,std::allocator<mlcore::ComparisonPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::ComparisonOperator &,int const&,mlcore::ComparisonOptions &,void>((uint64_t *)&v104);
    v10 = v104;
    v95 = v104;
    v104 = v97;
    if (*((_QWORD *)&v97 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v97 + 1) + 8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    v105 = v96;
    if (*((_QWORD *)&v96 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v96 + 1) + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    v106 = v10;
    v107 = *((_QWORD *)&v95 + 1);
    if (*((_QWORD *)&v95 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v95 + 1) + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v91 = 0;
    v92 = 0;
    v93 = 0;
    v102 = (void **)&v91;
    v103 = 0;
    v17 = operator new(0x30uLL);
    v18 = 0;
    v91 = v17;
    v92 = v17;
    v93 = v17 + 3;
    do
    {
      v19 = *(&v104 + v18);
      *v17 = v19;
      if (*((_QWORD *)&v19 + 1))
      {
        v20 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
        do
          v21 = __ldxr(v20);
        while (__stxr(v21 + 1, v20));
      }
      ++v18;
      ++v17;
    }
    while (v18 != 3);
    v92 = v17;
    mlcore::CreateOrPredicate();
    v102 = (void **)&v91;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v102);
    for (i = 32; i != -16; i -= 16)
      v23 = std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v104 + i);
    v24 = MEMORY[0x194039EC8](v23);
    v104 = v94;
    if (*((_QWORD *)&v94 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v94 + 1) + 8);
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
    }
    *(_QWORD *)&v105 = v70;
    *((_QWORD *)&v105 + 1) = *((_QWORD *)&v101 + 1);
    if (*((_QWORD *)&v101 + 1))
    {
      v27 = (unint64_t *)(*((_QWORD *)&v101 + 1) + 8);
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v102 = (void **)&v85;
    v103 = 0;
    v29 = operator new(0x20uLL);
    v30 = 0;
    v31 = 0;
    v85 = v29;
    v86 = v29;
    v87 = v29 + 2;
    do
    {
      v32 = v30;
      v33 = *(&v104 + v31);
      *v29 = v33;
      if (*((_QWORD *)&v33 + 1))
      {
        v34 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
        do
          v35 = __ldxr(v34);
        while (__stxr(v35 + 1, v34));
      }
      ++v29;
      v30 = 1;
      v31 = 1;
    }
    while ((v32 & 1) == 0);
    v86 = v29;
    mlcore::CreateAndPredicate();
    std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v89, v24, &v88);
    v36 = (std::__shared_weak_count *)*((_QWORD *)&v88 + 1);
    if (*((_QWORD *)&v88 + 1))
    {
      v37 = (unint64_t *)(*((_QWORD *)&v88 + 1) + 8);
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
    v102 = (void **)&v85;
    std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v102);
    for (j = 16; j != -16; j -= 16)
      v40 = (mlcore *)std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v104 + j);
    v41 = (mlcore *)mlcore::ItemPropertyStorePlaylistID(v40);
    v42 = mlcore::ItemPropertyAlbumPersistentID(v41);
    v43 = operator new(0x10uLL);
    *v43 = v41;
    v43[1] = v42;
    v83 = 0;
    v84 = 0;
    __p = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, v43, (uint64_t)(v43 + 2), 2uLL);
    mlcore::PropertiesQuery::setPropertiesToFetch();
    if (__p)
    {
      v83 = __p;
      operator delete(__p);
    }
    v44 = *(_QWORD *)(a1 + 32);
    v45 = *(void **)(v44 + 272);
    v80 = v89;
    v81 = v90;
    if (v90)
    {
      p_shared_owners = (unint64_t *)&v90->__shared_owners_;
      do
        v47 = __ldxr(p_shared_owners);
      while (__stxr(v47 + 1, p_shared_owners));
      v44 = *(_QWORD *)(a1 + 32);
    }
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3321888768;
    v71[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_36;
    v71[3] = &unk_1E314AD00;
    v71[4] = v44;
    v77 = 0;
    v78 = 0;
    v79 = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v77, *(const void **)(a1 + 120), *(_QWORD *)(a1 + 128), (uint64_t)(*(_QWORD *)(a1 + 128) - *(_QWORD *)(a1 + 120)) >> 3);
    v72 = *(id *)(a1 + 40);
    v73 = *(id *)(a1 + 48);
    v74 = *(id *)(a1 + 56);
    v75 = *(id *)(a1 + 64);
    v76 = *(id *)(a1 + 72);
    objc_msgSend(v45, "performCoreQuery:withCompletion:", &v80, v71);
    v48 = v81;
    if (v81)
    {
      v49 = (unint64_t *)&v81->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }

    if (v77)
    {
      v78 = v77;
      operator delete(v77);
    }
    operator delete(v43);
    v51 = v90;
    if (v90)
    {
      v52 = (unint64_t *)&v90->__shared_owners_;
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
    v54 = (std::__shared_weak_count *)*((_QWORD *)&v94 + 1);
    if (*((_QWORD *)&v94 + 1))
    {
      v55 = (unint64_t *)(*((_QWORD *)&v94 + 1) + 8);
      do
        v56 = __ldaxr(v55);
      while (__stlxr(v56 - 1, v55));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
    v57 = (std::__shared_weak_count *)*((_QWORD *)&v95 + 1);
    if (*((_QWORD *)&v95 + 1))
    {
      v58 = (unint64_t *)(*((_QWORD *)&v95 + 1) + 8);
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
    v60 = (std::__shared_weak_count *)*((_QWORD *)&v96 + 1);
    if (*((_QWORD *)&v96 + 1))
    {
      v61 = (unint64_t *)(*((_QWORD *)&v96 + 1) + 8);
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }
    v63 = (std::__shared_weak_count *)*((_QWORD *)&v97 + 1);
    if (*((_QWORD *)&v97 + 1))
    {
      v64 = (unint64_t *)(*((_QWORD *)&v97 + 1) + 8);
      do
        v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
    if (v98)
    {
      v99 = v98;
      operator delete(v98);
    }
    v66 = (std::__shared_weak_count *)*((_QWORD *)&v101 + 1);
    if (*((_QWORD *)&v101 + 1))
    {
      v67 = (unint64_t *)(*((_QWORD *)&v101 + 1) + 8);
      do
        v68 = __ldaxr(v67);
      while (__stlxr(v68 - 1, v67));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_37(uint64_t a1)
{
  mlcore *v2;
  unint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  mlcore *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  mlcore *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  mlcore *v30;
  mlcore *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  void **v45;
  char *v46;
  char *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *__p;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  mlcore *v60;
  mlcore *v61;
  uint64_t v62;
  void ***v63;
  std::__shared_weak_count *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  __int128 v70;
  int v71;
  void ***v72;
  std::__shared_weak_count *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v2 = (mlcore *)MEMORY[0x194039EC8]();
  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88)) >> 3);
  mlcore::ItemPropertyStoreCloudAlbumID(v2);
  if (v3 >= 2)
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v63);
  else
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v63);
  v4 = (uint64_t)v63;
  v5 = v64;
  v72 = v63;
  v73 = v64;
  v63 = 0;
  v64 = 0;
  v66 = 0;
  v67 = 0;
  v65 = 0;
  v45 = (void **)&v65;
  LOBYTE(v46) = 0;
  v6 = operator new(0x10uLL);
  v65 = v6;
  v66 = v6;
  v67 = v6 + 2;
  *v6 = v4;
  v6[1] = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v66 = v6 + 2;
  mlcore::CreateAndPredicate();
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v68, (uint64_t)v2, &v70);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v70 + 1);
  if (*((_QWORD *)&v70 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v70 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v45 = (void **)&v65;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v45);
  v13 = v73;
  if (v73)
  {
    v14 = (unint64_t *)&v73->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v3 > 1)
  {
    v16 = v64;
    if (!v64)
      goto LABEL_27;
    v19 = (unint64_t *)&v64->__shared_owners_;
    do
      v18 = __ldaxr(v19);
    while (__stlxr(v18 - 1, v19));
  }
  else
  {
    v16 = v64;
    if (!v64)
      goto LABEL_27;
    v17 = (unint64_t *)&v64->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
  }
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
LABEL_27:
  v20 = mlcore::ItemPropertyAlbumPersistentID(v12);
  v21 = (mlcore *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(1uLL);
  v23 = v22;
  *(_QWORD *)v21 = v20;
  v24 = mlcore::ItemPropertyStoreCloudAlbumID(v21);
  v25 = v24;
  if (v23 < 2)
  {
    v27 = 2;
    if ((unint64_t)((8 * v23) >> 2) > 2)
      v27 = (8 * v23) >> 2;
    if ((unint64_t)(8 * v23) >= 0x7FFFFFFFFFFFFFF8)
      v28 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v28 = v27;
    if (v28)
      v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v28);
    v29 = 0;
    *(_QWORD *)(v28 + 8) = v25;
    v26 = v28 + 16;
    do
    {
      *(_QWORD *)(v28 + v29) = *(_QWORD *)((char *)v21 + v29);
      v29 -= 8;
    }
    while (v29 != -8);
    v30 = (mlcore *)v28;
    operator delete(v21);
    v21 = v30;
  }
  else
  {
    *((_QWORD *)v21 + 1) = v24;
    v26 = (uint64_t)v21 + 16;
  }
  v61 = 0;
  v62 = 0;
  v60 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v60, v21, v26, (v26 - (uint64_t)v21) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v31 = v60;
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  mlcore::ItemPropertyInMyLibrary(v31);
  mlcore::SortDescriptor::SortDescriptor();
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v72 = &v45;
  LOBYTE(v73) = 0;
  v32 = operator new(0x18uLL);
  v47 = (char *)(v32 + 3);
  v33 = *((_QWORD *)&v70 + 1);
  *v32 = MEMORY[0x1E0D4AF48] + 16;
  v32[1] = v33;
  *((_DWORD *)v32 + 4) = v71;
  v45 = (void **)v32;
  v46 = (char *)(v32 + 3);
  v34 = v68;
  mlcore::PropertiesQuery::setSortDescriptors();
  v35 = *(_QWORD *)(a1 + 32);
  v36 = *(void **)(v35 + 272);
  v58 = v34;
  v59 = v69;
  if (v69)
  {
    v37 = (unint64_t *)&v69->__shared_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
    v35 = *(_QWORD *)(a1 + 32);
  }
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3321888768;
  v48[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_38;
  v48[3] = &unk_1E314AD38;
  v48[4] = v35;
  __p = 0;
  v56 = 0;
  v57 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 112), *(_QWORD *)(a1 + 120), (uint64_t)(*(_QWORD *)(a1 + 120) - *(_QWORD *)(a1 + 112)) >> 3);
  v49 = *(id *)(a1 + 40);
  v50 = *(id *)(a1 + 48);
  v51 = *(id *)(a1 + 56);
  v52 = *(id *)(a1 + 64);
  v53 = *(id *)(a1 + 72);
  v54 = *(id *)(a1 + 80);
  objc_msgSend(v36, "performCoreQuery:withCompletion:", &v58, v48);
  v39 = v59;
  if (v59)
  {
    v40 = (unint64_t *)&v59->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }

  if (__p)
  {
    v56 = __p;
    operator delete(__p);
  }
  *(_QWORD *)&v70 = &v45;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
  operator delete(v21);
  v42 = v69;
  if (v69)
  {
    v43 = (unint64_t *)&v69->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_39(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x38uLL);
    *v9 = &off_1E3149F78;
    v9[1] = a1 + 88;
    v9[2] = a1 + 32;
    v9[3] = a1 + 40;
    v9[4] = a1 + 48;
    v9[5] = a1 + 56;
    v9[6] = a1 + 64;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_40(uint64_t a1)
{
  mlcore *v2;
  unint64_t v3;
  mlcore *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  mlcore *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  mlcore *v22;
  mlcore *v23;
  _QWORD *v24;
  void **v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  __int128 v37;
  char *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *__p;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  mlcore *v51;
  mlcore *v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  __int128 *v57;
  char v58;
  void **v59[2];
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (mlcore *)MEMORY[0x194039EC8]();
  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88)) >> 3);
  mlcore::ItemPropertyStoreCloudAlbumID(v2);
  if (v3 >= 2)
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<std::string>,std::allocator<mlcore::InPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,std::vector<std::string> const&,void>((uint64_t *)&v54);
  else
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator,std::string const&,void>((uint64_t *)&v54);
  v37 = v54;
  v54 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v55, (uint64_t)v2, &v37);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
  if (*((_QWORD *)&v37 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (v3 > 1)
  {
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v54 + 1);
    if (!*((_QWORD *)&v54 + 1))
      goto LABEL_19;
    v11 = (unint64_t *)(*((_QWORD *)&v54 + 1) + 8);
    do
      v10 = __ldaxr(v11);
    while (__stlxr(v10 - 1, v11));
  }
  else
  {
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v54 + 1);
    if (!*((_QWORD *)&v54 + 1))
      goto LABEL_19;
    v9 = (unint64_t *)(*((_QWORD *)&v54 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
  }
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_19:
  v12 = mlcore::ItemPropertyAlbumPersistentID(v4);
  v13 = (mlcore *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(1uLL);
  v15 = v14;
  *(_QWORD *)v13 = v12;
  v16 = mlcore::ItemPropertyStoreCloudAlbumID(v13);
  v17 = v16;
  if (v15 < 2)
  {
    v19 = 2;
    if ((unint64_t)((8 * v15) >> 2) > 2)
      v19 = (8 * v15) >> 2;
    if ((unint64_t)(8 * v15) >= 0x7FFFFFFFFFFFFFF8)
      v20 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v20 = v19;
    if (v20)
      v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v20);
    v21 = 0;
    *(_QWORD *)(v20 + 8) = v17;
    v18 = v20 + 16;
    do
    {
      *(_QWORD *)(v20 + v21) = *(_QWORD *)((char *)v13 + v21);
      v21 -= 8;
    }
    while (v21 != -8);
    v22 = (mlcore *)v20;
    operator delete(v13);
    v13 = v22;
  }
  else
  {
    *((_QWORD *)v13 + 1) = v16;
    v18 = (uint64_t)v13 + 16;
  }
  v52 = 0;
  v53 = 0;
  v51 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v51, v13, v18, (v18 - (uint64_t)v13) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v23 = v51;
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  mlcore::ItemPropertyInMyLibrary(v23);
  mlcore::SortDescriptor::SortDescriptor();
  v37 = 0uLL;
  v38 = 0;
  v57 = &v37;
  v58 = 0;
  v24 = operator new(0x18uLL);
  v38 = (char *)(v24 + 3);
  v25 = v59[1];
  *v24 = MEMORY[0x1E0D4AF48] + 16;
  v24[1] = v25;
  *((_DWORD *)v24 + 4) = v60;
  *(_QWORD *)&v37 = v24;
  *((_QWORD *)&v37 + 1) = v24 + 3;
  v26 = v55;
  mlcore::PropertiesQuery::setSortDescriptors();
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 272);
  v49 = v26;
  v50 = v56;
  if (v56)
  {
    p_shared_owners = (unint64_t *)&v56->__shared_owners_;
    do
      v30 = __ldxr(p_shared_owners);
    while (__stxr(v30 + 1, p_shared_owners));
    v27 = *(_QWORD *)(a1 + 32);
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3321888768;
  v39[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_41;
  v39[3] = &unk_1E314AD38;
  v39[4] = v27;
  __p = 0;
  v47 = 0;
  v48 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 112), *(_QWORD *)(a1 + 120), (uint64_t)(*(_QWORD *)(a1 + 120) - *(_QWORD *)(a1 + 112)) >> 3);
  v40 = *(id *)(a1 + 40);
  v41 = *(id *)(a1 + 48);
  v42 = *(id *)(a1 + 56);
  v43 = *(id *)(a1 + 64);
  v44 = *(id *)(a1 + 72);
  v45 = *(id *)(a1 + 80);
  objc_msgSend(v28, "performCoreQuery:withCompletion:", &v49, v39);
  v31 = v50;
  if (v50)
  {
    v32 = (unint64_t *)&v50->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

  if (__p)
  {
    v47 = __p;
    operator delete(__p);
  }
  v59[0] = (void **)&v37;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](v59);
  operator delete(v13);
  v34 = v56;
  if (v56)
  {
    v35 = (unint64_t *)&v56->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_4_42(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x38uLL);
    *v9 = &off_1E3149FD0;
    v9[1] = a1 + 88;
    v9[2] = a1 + 32;
    v9[3] = a1 + 40;
    v9[4] = a1 + 48;
    v9[5] = a1 + 56;
    v9[6] = a1 + 64;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_43(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  mlcore *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  mlcore *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void *v48;
  unint64_t *p_shared_owners;
  unint64_t v50;
  id v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  id v59;
  void *__p;
  void *v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  __int128 v76;
  unint64_t v77;
  __int128 v78;
  uint64_t v79;
  std::__shared_weak_count *v80;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v59 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count") && !objc_msgSend(*(id *)(a1 + 48), "count") || !*(_QWORD *)(a1 + 112))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    return;
  }
  v3 = *(_QWORD **)(a1 + 104);
  v61 = 0;
  v62 = 0;
  __p = 0;
  v4 = 0;
  if (v3)
  {
    v5 = v3;
    do
    {
      ++v4;
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }
  v6 = std::vector<long long>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<long long,void *> *>,std::__hash_const_iterator<std::__hash_node<long long,void *> *>>((char *)&__p, v3, v4);
  v7 = (mlcore *)MEMORY[0x194039F64](v6);
  v8 = *(_QWORD *)(a1 + 112);
  mlcore::ArtistPropertyStoreID(v7);
  if (v8 < 2)
    std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v78);
  else
    std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v78);
  v76 = v78;
  v78 = 0uLL;
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>,void>(&v79, (uint64_t)v7, &v76);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v76 + 1);
  if (*((_QWORD *)&v76 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v76 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v8 <= 1)
  {
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v78 + 1);
    if (!*((_QWORD *)&v78 + 1))
      goto LABEL_28;
    v15 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
    do
      v14 = __ldaxr(v15);
    while (__stlxr(v14 - 1, v15));
  }
  else
  {
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v78 + 1);
    if (!*((_QWORD *)&v78 + 1))
      goto LABEL_28;
    v13 = (unint64_t *)(*((_QWORD *)&v78 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
  }
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_28:
  v76 = 0uLL;
  v77 = 0;
  v16 = (mlcore *)std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v76, *(const void **)(a1 + 128), *(_QWORD *)(a1 + 136), (uint64_t)(*(_QWORD *)(a1 + 136) - *(_QWORD *)(a1 + 128)) >> 3);
  v17 = mlcore::ArtistPropertyPersistentID(v16);
  v18 = v17;
  v19 = (char *)*((_QWORD *)&v76 + 1);
  v20 = v77;
  if (*((_QWORD *)&v76 + 1) >= v77)
  {
    v22 = (char *)v76;
    v23 = (uint64_t)(*((_QWORD *)&v76 + 1) - v76) >> 3;
    v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    if ((uint64_t)(v77 - v76) >> 2 > v24)
      v24 = (uint64_t)(v77 - v76) >> 2;
    if (v77 - (unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v24;
    if (v17)
      v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v17);
    else
      v25 = 0;
    v26 = (unint64_t *)(v17 + 8 * v23);
    v20 = v17 + 8 * v25;
    *v26 = v18;
    v21 = v26 + 1;
    if (v19 != v22)
    {
      do
      {
        v27 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *--v26 = v27;
      }
      while (v19 != v22);
      v19 = (char *)v76;
    }
    *(_QWORD *)&v76 = v26;
    v77 = v17 + 8 * v25;
    if (v19)
      operator delete(v19);
  }
  else
  {
    **((_QWORD **)&v76 + 1) = v17;
    v21 = (unint64_t *)(v19 + 8);
  }
  *((_QWORD *)&v76 + 1) = v21;
  v28 = mlcore::ArtistPropertyStoreID((mlcore *)v17);
  v29 = v28;
  if ((unint64_t)v21 < v20)
  {
    *v21 = v28;
    v30 = (uint64_t *)(v21 + 1);
    goto LABEL_61;
  }
  v31 = (unint64_t *)v76;
  v32 = (uint64_t)((uint64_t)v21 - v76) >> 3;
  v33 = v32 + 1;
  if ((unint64_t)(v32 + 1) >> 61)
    std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
  if ((uint64_t)(v20 - v76) >> 2 > v33)
    v33 = (uint64_t)(v20 - v76) >> 2;
  if (v20 - (unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8)
    v28 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v28 = v33;
  if (v28)
    v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v28);
  else
    v34 = 0;
  v35 = (unint64_t *)(v28 + 8 * v32);
  *v35 = v29;
  v30 = (uint64_t *)(v35 + 1);
  if (v21 == v31)
  {
    *(_QWORD *)&v76 = v35;
    *((_QWORD *)&v76 + 1) = v35 + 1;
    v77 = v28 + 8 * v34;
LABEL_60:
    operator delete(v21);
    goto LABEL_61;
  }
  do
  {
    v36 = *--v21;
    *--v35 = v36;
  }
  while (v21 != v31);
  v21 = (unint64_t *)v76;
  *(_QWORD *)&v76 = v35;
  *((_QWORD *)&v76 + 1) = v30;
  v77 = v28 + 8 * v34;
  if (v21)
    goto LABEL_60;
LABEL_61:
  *((_QWORD *)&v76 + 1) = v30;
  v37 = mlcore::ArtistPropertyGroupingKey((mlcore *)v28);
  v38 = v37;
  if ((unint64_t)v30 >= v77)
  {
    v40 = (uint64_t *)v76;
    v41 = (uint64_t)((uint64_t)v30 - v76) >> 3;
    v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v43 = v77 - v76;
    if ((uint64_t)(v77 - v76) >> 2 > v42)
      v42 = v43 >> 2;
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8)
      v44 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v44 = v42;
    if (v44)
      v44 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v44);
    else
      v45 = 0;
    v46 = (uint64_t *)(v44 + 8 * v41);
    *v46 = v38;
    v39 = (uint64_t)(v46 + 1);
    if (v30 == v40)
    {
      *(_QWORD *)&v76 = v46;
      *((_QWORD *)&v76 + 1) = v46 + 1;
      v77 = v44 + 8 * v45;
    }
    else
    {
      do
      {
        v47 = *--v30;
        *--v46 = v47;
      }
      while (v30 != v40);
      v30 = (uint64_t *)v76;
      *(_QWORD *)&v76 = v46;
      *((_QWORD *)&v76 + 1) = v39;
      v77 = v44 + 8 * v45;
      if (!v30)
        goto LABEL_78;
    }
    operator delete(v30);
  }
  else
  {
    *v30 = v37;
    v39 = (uint64_t)(v30 + 1);
  }
LABEL_78:
  *((_QWORD *)&v76 + 1) = v39;
  v74 = 0;
  v75 = 0;
  v73 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v73, (const void *)v76, v39, (v39 - (uint64_t)v76) >> 3);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }
  v48 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  v71 = v79;
  v72 = v80;
  if (v80)
  {
    p_shared_owners = (unint64_t *)&v80->__shared_owners_;
    do
      v50 = __ldxr(p_shared_owners);
    while (__stxr(v50 + 1, p_shared_owners));
  }
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_44;
  v63[3] = &unk_1E315CC08;
  v64 = *(id *)(a1 + 40);
  v65 = *(id *)(a1 + 56);
  v66 = *(id *)(a1 + 64);
  v67 = *(id *)(a1 + 72);
  v51 = *(id *)(a1 + 48);
  v52 = *(_QWORD *)(a1 + 32);
  v68 = v51;
  v69 = v52;
  v70 = *(id *)(a1 + 80);
  objc_msgSend(v48, "performCoreQuery:withCompletion:", &v71, v63);
  v53 = v72;
  if (v72)
  {
    v54 = (unint64_t *)&v72->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }

  if ((_QWORD)v76)
    operator delete((void *)v76);
  v56 = v80;
  if (v80)
  {
    v57 = (unint64_t *)&v80->__shared_owners_;
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  if (__p)
  {
    v61 = __p;
    operator delete(__p);
  }
}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_45(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x38uLL);
    *v9 = &off_1E314A028;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v9[6] = a1 + 72;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 72), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_44(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  unint64_t *v15;
  unint64_t v16;
  _BYTE v17[24];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x38uLL);
    *v9 = &off_1E314A340;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v9[6] = a1 + 72;
    v18 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v18;
    if (v18 == v17)
    {
      v11 = 4;
      v10 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  v12 = objc_msgSend(*(id *)(a1 + 72), "isCancelled");
  v13 = *(_QWORD *)(a1 + 80);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v13 + 16))(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), 0);
  }
  if (v6)
  {
    v15 = (unint64_t *)&v6->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_41(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  __int128 v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v16;
  __int128 *v17;
  __int128 *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *__p;
  void *v26;
  uint64_t v27;
  __int128 v28;
  _BYTE v29[216];
  uint64_t v30;
  std::__shared_weak_count *v31;
  __int128 v32;
  __int128 *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = 0;
  v31 = 0;
  v6 = *a2;
  if (!*a2)
    goto LABEL_26;
  v7 = (std::__shared_weak_count *)a2[1];
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v30 = v6;
  v31 = v7;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  if (v10)
  {
    objc_msgSend(v10, "mlCoreView");
    v11 = v32;
  }
  else
  {
    v11 = 0uLL;
  }
  v28 = v11;
  v32 = 0uLL;
  mlcore::EntityCache::EntityCache();
  if (*((_QWORD *)&v28 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v28 + 1) + 16))(*((_QWORD *)&v28 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v28 + 1));
    }
  }
  if (*((_QWORD *)&v32 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v32 + 1) + 16))(*((_QWORD *)&v32 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v32 + 1));
    }
  }
  mlcore::EntityCache::setCacheDisabled((mlcore::EntityCache *)v29);
  __p = 0;
  v26 = 0;
  v27 = 0;
  v16 = std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 88), *(_QWORD *)(a1 + 96), (uint64_t)(*(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88)) >> 3);
  MEMORY[0x194039F1C](v16);
  mlcore::EntityCache::setPropertiesToFetchForEntityClass();
  if (__p)
  {
    v26 = __p;
    operator delete(__p);
  }
  v17 = (__int128 *)operator new(0x38uLL);
  *(_QWORD *)v17 = &off_1E314A2E8;
  *((_QWORD *)v17 + 1) = a1 + 40;
  *((_QWORD *)v17 + 2) = v29;
  *((_QWORD *)v17 + 3) = a1 + 48;
  *((_QWORD *)v17 + 4) = a1 + 56;
  *((_QWORD *)v17 + 5) = a1 + 64;
  *((_QWORD *)v17 + 6) = a1 + 32;
  v33 = v17;
  mlcore::PropertiesQueryResult::enumerateResults();
  v18 = v33;
  if (v33 == &v32)
  {
    v19 = 4;
    v18 = &v32;
    goto LABEL_24;
  }
  if (v33)
  {
    v19 = 5;
LABEL_24:
    (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
  }
  MEMORY[0x194038D7C](v29);
LABEL_26:
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v20 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  v22 = v31;
  if (v31)
  {
    v23 = (unint64_t *)&v31->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_38(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  __int128 v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v16;
  __int128 *v17;
  __int128 *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *__p;
  void *v26;
  uint64_t v27;
  __int128 v28;
  _BYTE v29[216];
  uint64_t v30;
  std::__shared_weak_count *v31;
  __int128 v32;
  __int128 *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = 0;
  v31 = 0;
  v6 = *a2;
  if (!*a2)
    goto LABEL_26;
  v7 = (std::__shared_weak_count *)a2[1];
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v30 = v6;
  v31 = v7;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  if (v10)
  {
    objc_msgSend(v10, "mlCoreView");
    v11 = v32;
  }
  else
  {
    v11 = 0uLL;
  }
  v28 = v11;
  v32 = 0uLL;
  mlcore::EntityCache::EntityCache();
  if (*((_QWORD *)&v28 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v28 + 1) + 16))(*((_QWORD *)&v28 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v28 + 1));
    }
  }
  if (*((_QWORD *)&v32 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v32 + 1) + 16))(*((_QWORD *)&v32 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v32 + 1));
    }
  }
  mlcore::EntityCache::setCacheDisabled((mlcore::EntityCache *)v29);
  __p = 0;
  v26 = 0;
  v27 = 0;
  v16 = std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 88), *(_QWORD *)(a1 + 96), (uint64_t)(*(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88)) >> 3);
  MEMORY[0x194039F1C](v16);
  mlcore::EntityCache::setPropertiesToFetchForEntityClass();
  if (__p)
  {
    v26 = __p;
    operator delete(__p);
  }
  v17 = (__int128 *)operator new(0x38uLL);
  *(_QWORD *)v17 = &off_1E314A290;
  *((_QWORD *)v17 + 1) = a1 + 40;
  *((_QWORD *)v17 + 2) = v29;
  *((_QWORD *)v17 + 3) = a1 + 48;
  *((_QWORD *)v17 + 4) = a1 + 56;
  *((_QWORD *)v17 + 5) = a1 + 64;
  *((_QWORD *)v17 + 6) = a1 + 32;
  v33 = v17;
  mlcore::PropertiesQueryResult::enumerateResults();
  v18 = v33;
  if (v33 == &v32)
  {
    v19 = 4;
    v18 = &v32;
    goto LABEL_24;
  }
  if (v33)
  {
    v19 = 5;
LABEL_24:
    (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
  }
  MEMORY[0x194038D7C](v29);
LABEL_26:
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v20 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  v22 = v31;
  if (v31)
  {
    v23 = (unint64_t *)&v31->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_3_36(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  __int128 v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v16;
  __int128 *v17;
  __int128 *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *__p;
  void *v27;
  uint64_t v28;
  __int128 v29;
  _BYTE v30[216];
  uint64_t v31;
  std::__shared_weak_count *v32;
  __int128 v33;
  __int128 *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = 0;
  v32 = 0;
  v6 = *a2;
  if (!*a2)
    goto LABEL_26;
  v7 = (std::__shared_weak_count *)a2[1];
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v31 = v6;
  v32 = v7;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  if (v10)
  {
    objc_msgSend(v10, "mlCoreView");
    v11 = v33;
  }
  else
  {
    v11 = 0uLL;
  }
  v29 = v11;
  v33 = 0uLL;
  mlcore::EntityCache::EntityCache();
  if (*((_QWORD *)&v29 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v29 + 1) + 16))(*((_QWORD *)&v29 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v29 + 1));
    }
  }
  if (*((_QWORD *)&v33 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v33 + 1) + 16))(*((_QWORD *)&v33 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v33 + 1));
    }
  }
  mlcore::EntityCache::setCacheDisabled((mlcore::EntityCache *)v30);
  __p = 0;
  v27 = 0;
  v28 = 0;
  v16 = std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, *(const void **)(a1 + 80), *(_QWORD *)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 88) - *(_QWORD *)(a1 + 80)) >> 3);
  MEMORY[0x194039F1C](v16);
  mlcore::EntityCache::setPropertiesToFetchForEntityClass();
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }
  v17 = (__int128 *)operator new(0x38uLL);
  *(_QWORD *)v17 = &off_1E314A238;
  *((_QWORD *)v17 + 1) = a1 + 40;
  *((_QWORD *)v17 + 2) = v30;
  *((_QWORD *)v17 + 3) = a1 + 48;
  *((_QWORD *)v17 + 4) = a1 + 56;
  *((_QWORD *)v17 + 5) = a1 + 64;
  *((_QWORD *)v17 + 6) = a1 + 32;
  v34 = v17;
  mlcore::PropertiesQueryResult::enumerateResults();
  v18 = v34;
  if (v34 == &v33)
  {
    v19 = 4;
    v18 = &v33;
    goto LABEL_24;
  }
  if (v34)
  {
    v19 = 5;
LABEL_24:
    (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
  }
  MEMORY[0x194038D7C](v30);
LABEL_26:
  v20 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v21 = *(_QWORD *)(a1 + 72);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v21 + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), 0);
  }
  v23 = v32;
  if (v32)
  {
    v24 = (unint64_t *)&v32->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_33(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x30uLL);
    *v9 = &off_1E314A4A0;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_30(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x30uLL);
    *v9 = &off_1E314A3F0;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

void __48__MPStoreLibraryMappingRequestOperation_execute__block_invoke_2_28(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = operator new(0x30uLL);
    *v9 = &off_1E314A398;
    v9[1] = a1 + 32;
    v9[2] = a1 + 40;
    v9[3] = a1 + 48;
    v9[4] = a1 + 56;
    v9[5] = a1 + 64;
    v17 = v9;
    mlcore::PropertiesQueryResult::enumerateResults();
    v10 = v17;
    if (v17 == v16)
    {
      v11 = 4;
      v10 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  if (v6)
  {
    v14 = (unint64_t *)&v6->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

@end
