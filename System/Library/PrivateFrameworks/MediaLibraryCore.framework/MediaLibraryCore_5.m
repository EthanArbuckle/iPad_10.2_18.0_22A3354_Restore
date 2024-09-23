void mlcore::PlaylistItemEntityQuery::_allPropertiesToFetch(uint64_t a1@<X0>, mlcore::LibraryView **a2@<X1>, uint64_t a3@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  mlcore::LibraryView *v19;
  unint64_t *v20;
  unint64_t v21;
  mlcore::LibraryView *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  __int128 v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  mlcore::LibraryView *v48;
  std::__shared_weak_count *v49;
  void *__p[2];
  _BYTE v51[48];
  mlcore::LibraryView *v52[2];
  uint64_t v53;

  if (*(_BYTE *)(a1 + 152))
  {
    *(_QWORD *)(a3 + 48) = 0;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_DWORD *)(a3 + 56) = 1065353216;
    v6 = (std::__shared_weak_count *)a2[1];
    v48 = *a2;
    v49 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    mlcore::PlaylistItemEntityQuery::_resultPropertiesToFetch(a1, (uint64_t)__p);
    v9 = (uint64_t *)__p[0];
    v10 = (uint64_t *)__p[1];
    while (v9 != v10)
    {
      v46 = *v9;
      mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a3, &v46);
      ++v9;
    }
    std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)v51);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v6)
    {
      v11 = (unint64_t *)&v6->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    mlcore::Playlist::filterPredicate(*(mlcore::Playlist **)(a1 + 136), &v46);
    if (v46)
    {
      (*(void (**)(void **__return_ptr))(*(_QWORD *)v46 + 56))(__p);
      v13 = __p[0];
      v14 = __p[1];
      while (v13 != v14)
      {
        *(_QWORD *)&v45 = *v13;
        mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a3, (uint64_t *)&v45);
        ++v13;
      }
      std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)v51);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    v15 = *(_QWORD *)(a1 + 16);
    v16 = *(std::__shared_weak_count **)(a1 + 24);
    *(_QWORD *)&v45 = v15;
    *((_QWORD *)&v45 + 1) = v16;
    if (v16)
    {
      v17 = (unint64_t *)&v16->__shared_owners_;
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
      v19 = *a2;
      if (*a2)
      {
        *(_QWORD *)&v44 = v15;
        *((_QWORD *)&v44 + 1) = v16;
        v20 = (unint64_t *)&v16->__shared_owners_;
        do
          v21 = __ldxr(v20);
        while (__stxr(v21 + 1, v20));
        goto LABEL_38;
      }
    }
    else
    {
      v19 = *a2;
      if (*a2)
      {
        v44 = v15;
LABEL_38:
        mlcore::LibraryView::_predicateByApplyingFilters(v19, &v44, *(mlcore::EntityClass **)(a1 + 8), __p);
        v27 = *(_OWORD *)__p;
        __p[0] = 0;
        __p[1] = 0;
        v45 = v27;
        if (v16)
        {
          v28 = (unint64_t *)&v16->__shared_owners_;
          do
            v29 = __ldaxr(v28);
          while (__stlxr(v29 - 1, v28));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }
        v30 = (std::__shared_weak_count *)__p[1];
        if (__p[1])
        {
          v31 = (unint64_t *)((char *)__p[1] + 8);
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        v33 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
        if (*((_QWORD *)&v44 + 1))
        {
          v34 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
        v15 = v45;
      }
    }
    if (v15)
    {
      (*(void (**)(void **__return_ptr))(*(_QWORD *)v15 + 56))(__p);
      v36 = (uint64_t *)__p[0];
      v37 = (uint64_t *)__p[1];
      while (v36 != v37)
      {
        v53 = *v36;
        mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a3, &v53);
        ++v36;
      }
      std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)v51);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    v38 = (std::__shared_weak_count *)*((_QWORD *)&v45 + 1);
    if (*((_QWORD *)&v45 + 1))
    {
      v39 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 8);
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    v41 = v47;
    if (v47)
    {
      v42 = (unint64_t *)&v47->__shared_owners_;
      do
        v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
    return;
  }
  v22 = a2[1];
  v52[0] = *a2;
  v52[1] = v22;
  if (v22)
  {
    v23 = (unint64_t *)((char *)v22 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  mlcore::EntityQuery::_allPropertiesToFetch((_QWORD *)a1, v52, (float *)a3);
  if (v22)
  {
    v25 = (unint64_t *)((char *)v22 + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      (*(void (**)(mlcore::LibraryView *))(*(_QWORD *)v22 + 16))(v22);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v22);
    }
  }
}

void sub_20A8F1A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::~OrderedSet(v3);
  _Unwind_Resume(a1);
}

void mlcore::PlaylistItemEntityQuery::_perform(_QWORD *a1, std::string::size_type *a2, uint64_t a3)
{
  std::string::size_type v3;
  std::string::size_type v4;
  unint64_t *v5;
  unint64_t v6;
  mediaplatform::DatabaseConnection **v7;
  std::__shared_weak_count *v8;
  mediaplatform::DatabaseConnection *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::chrono::system_clock::time_point v12;
  mlcore *v13;
  mlcore *v14;
  mlcore *IsDynamic;
  mlcore *v16;
  mlcore *IsEnabledOnly;
  mlcore *v18;
  mlcore *IsReversed;
  mlcore *IsSourceRemote;
  uint64_t v21;
  _QWORD *v22;
  const void *v23;
  unint64_t *v24;
  unint64_t v25;
  std::string::size_type v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  std::vector<std::string> *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *size;
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
  _QWORD *v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  mlcore::Playlist **v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  mlcore **v87;
  mlcore *v88;
  mlcore::Playlist *v89;
  unint64_t v90;
  mlcore *v91;
  mlcore *v92;
  uint64_t v93;
  unint64_t v94;
  int v95;
  mlcore::DeviceLibraryView *v96;
  __int128 v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  std::__shared_weak_count *v101;
  unint64_t *v102;
  uint64_t v103;
  unint64_t v104;
  mlcore *v105;
  uint64_t v106;
  unint64_t v107;
  mlcore::DeviceLibraryView *v108;
  __int128 v109;
  unint64_t *v110;
  uint64_t v111;
  mlcore::DeviceLibraryView *v112;
  int v113;
  _QWORD *v114;
  std::__shared_weak_count *v115;
  uint64_t v116;
  unint64_t *v117;
  unint64_t v118;
  _QWORD *v119;
  unint64_t *v120;
  unint64_t v121;
  std::string::size_type v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t *v127;
  unint64_t v128;
  unint64_t *v129;
  unint64_t v130;
  mlcore *v131;
  mlcore *v132;
  unint64_t *v133;
  unint64_t v134;
  std::__shared_weak_count *v135;
  unint64_t *v136;
  unint64_t v137;
  std::__shared_weak_count *v138;
  unint64_t *v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  mlcore *v143;
  uint64_t v144;
  __int128 *v145;
  char v146;
  uint64_t v147;
  char v148;
  __int128 v149;
  unint64_t *v150;
  unint64_t v151;
  _QWORD *v152;
  std::__shared_weak_count *v153;
  unint64_t *v154;
  unint64_t v155;
  uint64_t i;
  std::__shared_weak_count *v157;
  unint64_t *v158;
  unint64_t v159;
  std::__shared_weak_count *v160;
  unint64_t *v161;
  unint64_t v162;
  std::__shared_weak_count *v163;
  unint64_t *v164;
  unint64_t v165;
  mlcore *v166;
  mlcore *v167;
  unint64_t *v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  BOOL v172;
  char v173;
  unint64_t *v174;
  unint64_t v175;
  std::__shared_weak_count *v176;
  unint64_t *v177;
  unint64_t v178;
  unint64_t *v179;
  unint64_t v180;
  unint64_t *v181;
  unint64_t v182;
  std::__shared_weak_count *v183;
  unint64_t *v184;
  unint64_t v185;
  std::__shared_weak_count *v186;
  unint64_t *v187;
  unint64_t v188;
  mediaplatform::DatabaseConnection *v189;
  _QWORD *v190;
  _QWORD *v191;
  uint64_t v192;
  std::chrono::system_clock::time_point v193;
  mlcore::Playlist *v194;
  unint64_t v195;
  int v196;
  unint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  void *v203;
  std::__shared_weak_count *v204;
  unint64_t *v205;
  unint64_t v206;
  std::__shared_weak_count *v207;
  unint64_t *v208;
  unint64_t v209;
  std::string::size_type v210;
  std::string::size_type v211;
  unint64_t *v212;
  unint64_t v213;
  _OWORD *v214;
  uint64_t v215;
  std::string::size_type v216;
  unint64_t *v217;
  unint64_t v218;
  _QWORD *v219;
  std::string::size_type v220;
  std::string::size_type v221;
  __int128 v222;
  int64x2_t v223;
  std::vector<std::string> *v224;
  std::__shared_weak_count *v225;
  mlcore *v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  mlcore *v230;
  unint64_t v231;
  mlcore *v232;
  unint64_t v233;
  mlcore *v234;
  unint64_t v235;
  mlcore *v236;
  unint64_t v237;
  mlcore *v238;
  unint64_t v239;
  mlcore *v240;
  int v241;
  unint64_t v242;
  uint64_t v243;
  char *v244;
  uint64_t *v245;
  _QWORD *v246;
  uint64_t *v247;
  uint64_t **v248;
  uint64_t **v249;
  char *v250;
  char *v251;
  uint64_t v252;
  char *v253;
  char *v254;
  _BOOL4 v255;
  char **v256;
  _QWORD *v257;
  _BOOL4 v258;
  _QWORD *v259;
  char *v260;
  char *v261;
  size_t v262;
  std::string *v263;
  std::string *p_sz;
  std::string *v265;
  std::string::size_type v266;
  std::string *v267;
  std::vector<std::string> *v268;
  std::vector<std::string>::pointer end;
  mlcore **v270;
  unint64_t v271;
  mlcore **v272;
  mlcore *v273;
  uint64_t v274;
  unint64_t v275;
  uint64_t v276;
  unint64_t v277;
  char *v278;
  mlcore **v279;
  mlcore *v280;
  std::string::size_type v281;
  _QWORD *v282;
  _QWORD *v283;
  _QWORD *v284;
  std::__shared_weak_count *v285;
  unint64_t *v286;
  unint64_t v287;
  unint64_t *v288;
  unint64_t v289;
  __int128 v290;
  std::__shared_weak_count *v291;
  unint64_t *v292;
  unint64_t v293;
  _QWORD *v294;
  _QWORD *v295;
  _QWORD *v296;
  std::__shared_weak_count *v297;
  unint64_t *v298;
  unint64_t v299;
  unint64_t *v300;
  unint64_t v301;
  __int128 v302;
  unint64_t *v303;
  uint64_t v304;
  unint64_t *v305;
  unint64_t v306;
  unint64_t *v307;
  unint64_t v308;
  _QWORD *v309;
  mlcore *v310;
  uint64_t v311;
  unint64_t v312;
  std::vector<std::string>::pointer begin;
  uint64_t v314;
  std::string *v315;
  uint64_t v316;
  mlcore *v317;
  int v318;
  std::string::size_type v319;
  uint64_t *v320;
  _QWORD *v321;
  uint64_t v322;
  std::__shared_weak_count *v323;
  uint64_t v324;
  std::__shared_weak_count *v325;
  _QWORD *v326;
  unint64_t *v327;
  unint64_t v328;
  std::__shared_weak_count *v329;
  unint64_t *v330;
  unint64_t v331;
  unint64_t *v332;
  unint64_t v333;
  std::__shared_weak_count *v334;
  unint64_t *v335;
  unint64_t v336;
  std::__shared_weak_count *v337;
  unint64_t *v338;
  unint64_t v339;
  std::__shared_weak_count *v340;
  unint64_t *v341;
  unint64_t v342;
  std::__shared_weak_count *v343;
  unint64_t *v344;
  unint64_t v345;
  std::__shared_weak_count *v346;
  unint64_t *v347;
  unint64_t v348;
  std::__shared_weak_count *v349;
  unint64_t *v350;
  unint64_t v351;
  unint64_t *v352;
  unint64_t v353;
  uint64_t v354;
  std::__shared_weak_count *v355;
  unint64_t *v356;
  unint64_t v357;
  std::__shared_weak_count *v358;
  unint64_t *v359;
  unint64_t v360;
  std::__shared_weak_count *v361;
  unint64_t *v362;
  unint64_t v363;
  std::__shared_weak_count *v364;
  unint64_t *v365;
  unint64_t v366;
  std::__shared_weak_count *v367;
  unint64_t *v368;
  unint64_t v369;
  std::__shared_weak_count *v370;
  unint64_t *v371;
  unint64_t v372;
  std::string::size_type v373;
  std::string::size_type v374;
  uint64_t v375;
  uint64_t v376;
  __int128 v377;
  std::string::size_type v378;
  _QWORD *v379;
  uint64_t v380;
  unint64_t v381;
  unint64_t v382;
  char *v383;
  uint64_t v384;
  char *v385;
  _QWORD *v386;
  std::string::size_type v387;
  std::string::size_type v388;
  __int128 v389;
  int64x2_t v390;
  std::string::size_type v391;
  uint64_t v392;
  mlcore *v393;
  uint64_t v394;
  mlcore *v395;
  uint64_t v396;
  __int128 *v397;
  uint64_t v398;
  __int128 v399;
  unint64_t *v400;
  unint64_t v401;
  std::string::size_type v402;
  uint64_t v403;
  unint64_t v404;
  int64_t v405;
  unint64_t v406;
  char *v407;
  uint64_t v408;
  char *v409;
  _QWORD *v410;
  std::string::size_type v411;
  std::string::size_type v412;
  __int128 v413;
  int64x2_t v414;
  std::string::size_type v415;
  void *v416;
  std::__shared_weak_count *v417;
  unint64_t *v418;
  unint64_t v419;
  uint64_t j;
  std::__shared_weak_count *v421;
  unint64_t *v422;
  unint64_t v423;
  std::__shared_weak_count *v424;
  unint64_t *v425;
  unint64_t v426;
  std::__shared_weak_count *v427;
  unint64_t *v428;
  unint64_t v429;
  std::__shared_weak_count *v430;
  unint64_t *v431;
  unint64_t v432;
  std::__shared_weak_count *v433;
  unint64_t *v434;
  unint64_t v435;
  _QWORD *v436;
  uint64_t v437;
  unint64_t *v438;
  unint64_t v439;
  unint64_t *v440;
  std::__shared_weak_count *v441;
  unint64_t *v442;
  unint64_t v443;
  std::__shared_weak_count *v444;
  unint64_t *v445;
  unint64_t v446;
  std::__shared_weak_count *v447;
  unint64_t *v448;
  unint64_t v449;
  mlcore *v451;
  mlcore *v452;
  mlcore *IsLimited;
  uint64_t v454;
  mlcore *v455;
  uint64_t v456;
  mlcore *IsSmart;
  void *v458;
  mlcore *v460;
  __int128 v461;
  std::vector<std::string> *v463;
  mlcore::DeviceLibraryView *v464;
  mlcore **v465;
  __int128 v466;
  std::__shared_weak_count *v467;
  _QWORD *v468;
  std::__shared_weak_count *v469;
  _BYTE v470[24];
  void *v471;
  std::string::value_type *v472;
  __int128 v473;
  uint64_t v474;
  std::exception v475[8];
  __int128 v476;
  uint64_t v477;
  _QWORD *v478;
  std::__shared_weak_count *v479;
  std::vector<std::string> *v480;
  std::__shared_weak_count *v481;
  mlcore **v482;
  std::__shared_weak_count *v483;
  uint64_t *v484;
  std::__shared_weak_count *v485;
  _QWORD *v486;
  std::__shared_weak_count *v487;
  std::string v488;
  std::string v489;
  __int128 v490;
  uint64_t v491;
  std::vector<std::string> *v492;
  std::__shared_weak_count *v493;
  void (**v494)(mediaplatform::DatabaseParameterList *__hidden);
  dispatch_semaphore_t v495[3];
  dispatch_semaphore_t dsema;
  std::__shared_weak_count *v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  uint64_t v501;
  __int128 v502;
  void *v503[2];
  uint64_t v504;
  uint64_t v505;
  char v506;
  _QWORD v507[2];
  __int128 *v508;
  __int128 *v509;
  __int128 *v510;
  uint64_t v511;
  std::__shared_weak_count *v512;
  std::string::size_type v513;
  std::__shared_weak_count *v514;
  uint64_t v515;
  std::__shared_weak_count *v516;
  uint64_t v517[2];
  __int128 *v518[3];
  uint64_t v519;
  std::__shared_weak_count *v520;
  __int128 *v521;
  __int128 *v522;
  __int128 *v523;
  std::string::size_type v524;
  std::__shared_weak_count *v525;
  mlcore::DeviceLibraryView *v526;
  std::__shared_weak_count *v527;
  __int128 v528;
  mediaplatform::DatabaseConnection *v529;
  std::__shared_weak_count *v530;
  mlcore::DeviceLibraryView *v531;
  std::__shared_weak_count *v532;
  std::string __str;
  std::string __sz;
  mlcore **v535;
  std::__shared_weak_count *v536;
  _QWORD v537[3];
  _QWORD *v538;
  _BYTE v539[24];
  _BYTE *v540;
  _BYTE __p[64];
  __int128 v542;
  int v543;
  __int128 v544;
  __int128 v545;
  int v546;
  __int128 v547;
  __int128 v548;
  int v549;
  _BYTE v550[32];
  int v551;
  void *v552;
  uint64_t v553;

  v553 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = *(_QWORD *)(*a2 + 24);
  v464 = *(mlcore::DeviceLibraryView **)(*a2 + 16);
  v531 = v464;
  v532 = (std::__shared_weak_count *)v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
    v3 = *a2;
  }
  v7 = *(mediaplatform::DatabaseConnection ***)(v3 + 48);
  v9 = *v7;
  v8 = (std::__shared_weak_count *)v7[1];
  v529 = v9;
  v530 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v12.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  v460 = (mlcore *)mlcore::PlaylistPropertyName((mlcore *)v12.__d_.__rep_);
  IsSmart = (mlcore *)mlcore::PlaylistPropertyIsSmart(v460);
  v455 = (mlcore *)mlcore::PlaylistPropertySmartCriteria(IsSmart);
  IsLimited = (mlcore *)mlcore::PlaylistPropertySmartIsLimited(v455);
  v452 = (mlcore *)mlcore::PlaylistPropertySmartLimitKind(IsLimited);
  v451 = (mlcore *)mlcore::PlaylistPropertySmartLimitValue(v452);
  v13 = (mlcore *)mlcore::PlaylistPropertySmartLimitOrder(v451);
  v14 = (mlcore *)mlcore::PlaylistPropertySmartEvaluationOrder(v13);
  IsDynamic = (mlcore *)mlcore::PlaylistPropertySmartIsDynamic(v14);
  v16 = (mlcore *)mlcore::PlaylistPropertySmartReverseLimitOrder(IsDynamic);
  IsEnabledOnly = (mlcore *)mlcore::PlaylistPropertySmartIsEnabledOnly(v16);
  v18 = (mlcore *)mlcore::PlaylistPropertyPlayOrder(IsEnabledOnly);
  IsReversed = (mlcore *)mlcore::PlaylistPropertyIsReversed(v18);
  IsSourceRemote = (mlcore *)mlcore::PlaylistPropertyIsSourceRemote(IsReversed);
  v21 = mlcore::PlaylistPropertyDistinguishedKind(IsSourceRemote);
  v22 = operator new(0x78uLL);
  *v22 = v460;
  v22[1] = IsSmart;
  v22[2] = v455;
  v22[3] = IsLimited;
  v22[4] = v452;
  v22[5] = v451;
  v22[6] = v13;
  v22[7] = v14;
  v22[8] = IsDynamic;
  v22[9] = v16;
  v22[10] = IsEnabledOnly;
  v22[11] = v18;
  v22[12] = IsReversed;
  v22[13] = IsSourceRemote;
  v22[14] = v21;
  v526 = v464;
  v527 = (std::__shared_weak_count *)v4;
  v23 = v22;
  if (v4)
  {
    v24 = (unint64_t *)(v4 + 8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  v26 = *a2;
  v27 = (std::__shared_weak_count *)a2[1];
  v524 = *a2;
  v525 = v27;
  if (v27)
  {
    v28 = (unint64_t *)&v27->__shared_owners_;
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }
  v30 = a1 + 16;
  v492 = (std::vector<std::string> *)a1[16];
  v528 = 0uLL;
  v31 = mlcore::TypedEntityClass<mlcore::Playlist>::sharedPointer();
  v32 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 112))(v31);
  v33 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v33 + 8) = 0u;
  *(_QWORD *)v33 = &off_24C33CE88;
  *((_QWORD *)v33 + 4) = v32;
  *((_QWORD *)v33 + 3) = &unk_24C339CA8;
  v34 = v492;
  *((_QWORD *)v33 + 5) = 0;
  *((_QWORD *)v33 + 6) = v34;
  *(_OWORD *)(v33 + 56) = 0u;
  *(_QWORD *)&v35 = v33 + 24;
  *((_QWORD *)&v35 + 1) = v33;
  v461 = v35;
  *(_OWORD *)v503 = v35;
  v36 = mlcore::TypedEntityClass<mlcore::Playlist>::sharedPointer();
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate> &,void>(&v500, v36, v461, *((std::__shared_weak_count **)&v461 + 1));
  v37 = v500;
  memset(v470, 0, sizeof(v470));
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(v470, v23, (uint64_t)v23 + 120, 0xFuLL);
  v38 = *(void **)v470;
  std::vector<mlcore::ModelPropertyBase *>::__assign_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>((char *)(v37 + 80), *(char **)v470, *(uint64_t *)&v470[8], (uint64_t)(*(_QWORD *)&v470[8] - *(_QWORD *)v470) >> 3);
  if (v38)
  {
    *(_QWORD *)&v470[8] = v38;
    operator delete(v38);
  }
  v489.__r_.__value_.__r.__words[0] = (std::string::size_type)v464;
  v489.__r_.__value_.__l.__size_ = v4;
  if (v4)
  {
    v39 = (unint64_t *)(v4 + 8);
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
  }
  v488.__r_.__value_.__r.__words[0] = v26;
  v488.__r_.__value_.__l.__size_ = (std::string::size_type)v27;
  if (v27)
  {
    v41 = (unint64_t *)&v27->__shared_owners_;
    do
      v42 = __ldxr(v41);
    while (__stxr(v42 + 1, v41));
  }
  v43 = (std::__shared_weak_count *)*((_QWORD *)&v500 + 1);
  v535 = (mlcore **)v37;
  v536 = (std::__shared_weak_count *)*((_QWORD *)&v500 + 1);
  if (*((_QWORD *)&v500 + 1))
  {
    v44 = (unint64_t *)(*((_QWORD *)&v500 + 1) + 8);
    do
      v45 = __ldxr(v44);
    while (__stxr(v45 + 1, v44));
  }
  v490 = 0uLL;
  dsema = dispatch_semaphore_create(0);
  __sz.__r_.__value_.__r.__words[0] = v37;
  __sz.__r_.__value_.__l.__size_ = (std::string::size_type)v43;
  if (v43)
  {
    v46 = (unint64_t *)&v43->__shared_owners_;
    do
      v47 = __ldxr(v46);
    while (__stxr(v47 + 1, v46));
  }
  __str.__r_.__value_.__r.__words[0] = v26;
  __str.__r_.__value_.__l.__size_ = (std::string::size_type)v27;
  if (v27)
  {
    v48 = (unint64_t *)&v27->__shared_owners_;
    do
      v49 = __ldxr(v48);
    while (__stxr(v49 + 1, v48));
  }
  *(_QWORD *)__p = &off_24C33B1F0;
  *(_QWORD *)&__p[8] = &v490;
  *(_QWORD *)&__p[16] = &dsema;
  *(_QWORD *)&__p[24] = __p;
  mlcore::LibraryView::performQuery<mlcore::PropertiesQuery>((void (***)(_QWORD, uint64_t *, uint64_t *, _BYTE *))v464, v37, v43, (uint64_t *)&__str, (uint64_t)__p);
  v50 = *(_QWORD **)&__p[24];
  if (*(_BYTE **)&__p[24] == __p)
  {
    v51 = 4;
    v50 = __p;
    goto LABEL_35;
  }
  if (*(_QWORD *)&__p[24])
  {
    v51 = 5;
LABEL_35:
    (*(void (**)(void))(*v50 + 8 * v51))();
  }
  if (v27)
  {
    v52 = (unint64_t *)&v27->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  size = (std::__shared_weak_count *)__sz.__r_.__value_.__l.__size_;
  if (__sz.__r_.__value_.__l.__size_)
  {
    v55 = (unint64_t *)(__sz.__r_.__value_.__l.__size_ + 8);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(dsema);
  v57 = v536;
  if (v536)
  {
    v58 = (unint64_t *)&v536->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v60 = (std::__shared_weak_count *)v488.__r_.__value_.__l.__size_;
  if (v488.__r_.__value_.__l.__size_)
  {
    v61 = (unint64_t *)(v488.__r_.__value_.__l.__size_ + 8);
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  v63 = (std::__shared_weak_count *)v489.__r_.__value_.__l.__size_;
  if (v489.__r_.__value_.__l.__size_)
  {
    v64 = (unint64_t *)(v489.__r_.__value_.__l.__size_ + 8);
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  *(_QWORD *)__p = &off_24C33B820;
  *(_QWORD *)&__p[8] = &v528;
  *(_QWORD *)&__p[16] = &v492;
  *(_QWORD *)&__p[24] = __p;
  mlcore::PropertiesQueryResult::enumerateResults(v490, (uint64_t)__p);
  v66 = *(_QWORD **)&__p[24];
  if (*(_BYTE **)&__p[24] == __p)
  {
    v67 = 4;
    v66 = __p;
    goto LABEL_65;
  }
  if (*(_QWORD *)&__p[24])
  {
    v67 = 5;
LABEL_65:
    (*(void (**)(void))(*v66 + 8 * v67))();
  }
  v68 = (std::__shared_weak_count *)*((_QWORD *)&v490 + 1);
  if (*((_QWORD *)&v490 + 1))
  {
    v69 = (unint64_t *)(*((_QWORD *)&v490 + 1) + 8);
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  v71 = (std::__shared_weak_count *)*((_QWORD *)&v500 + 1);
  if (*((_QWORD *)&v500 + 1))
  {
    v72 = (unint64_t *)(*((_QWORD *)&v500 + 1) + 8);
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }
  v74 = (std::__shared_weak_count *)v503[1];
  if (v503[1])
  {
    v75 = (unint64_t *)((char *)v503[1] + 8);
    do
      v76 = __ldaxr(v75);
    while (__stlxr(v76 - 1, v75));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
  v458 = (void *)v23;
  v77 = (mlcore::Playlist **)(a1 + 17);
  std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100]((uint64_t)(a1 + 17), &v528);
  v78 = (std::__shared_weak_count *)*((_QWORD *)&v528 + 1);
  if (*((_QWORD *)&v528 + 1))
  {
    v79 = (unint64_t *)(*((_QWORD *)&v528 + 1) + 8);
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  v81 = v525;
  if (v525)
  {
    v82 = (unint64_t *)&v525->__shared_owners_;
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }
  v84 = v527;
  if (v527)
  {
    v85 = (unint64_t *)&v527->__shared_owners_;
    do
      v86 = __ldaxr(v85);
    while (__stlxr(v86 - 1, v85));
    if (!v86)
    {
      ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
      std::__shared_weak_count::__release_weak(v84);
    }
  }
  v87 = (mlcore **)operator new();
  *v87 = 0;
  v87[1] = 0;
  v87[2] = 0;
  v535 = v87;
  v88 = (mlcore *)operator new();
  *(_QWORD *)v88 = &off_24C33D9E8;
  *((_QWORD *)v88 + 1) = 0;
  *((_QWORD *)v88 + 2) = 0;
  *((_QWORD *)v88 + 3) = v87;
  v536 = (std::__shared_weak_count *)v88;
  v89 = *v77;
  if (!*v77)
  {
    mediaplatform::FormatString<long long>(&__sz, (std::string *)"Could not find playlist with pid {0}", v30);
    mlcore::MediaError::MediaError((uint64_t)v470, 201, (uint64_t)&__sz);
    v101 = (std::__shared_weak_count *)operator new(0x128uLL);
    v101->__shared_owners_ = 0;
    v102 = (unint64_t *)&v101->__shared_owners_;
    v101->__shared_weak_owners_ = 0;
    v101->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CD38;
    *(_OWORD *)&__p[8] = *(_OWORD *)&v470[8];
    *(_QWORD *)__p = off_24C335E70;
    *(_QWORD *)&__p[24] = &unk_24C335EA0;
    *(_DWORD *)&__p[32] = (_DWORD)v472;
    if (SHIBYTE(v474) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&__p[40], (const std::string::value_type *)v473, *((std::string::size_type *)&v473 + 1));
    }
    else
    {
      *(_OWORD *)&__p[40] = v473;
      *(_QWORD *)&__p[56] = v474;
    }
    mediaplatform::PlatformErrorCondition::PlatformErrorCondition((mediaplatform::PlatformErrorCondition *)&v542, (const mediaplatform::PlatformErrorCondition *)v475);
    if (SHIBYTE(v477) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v547, (const std::string::value_type *)v476, *((std::string::size_type *)&v476 + 1));
    }
    else
    {
      v547 = v476;
      *(_QWORD *)&v548 = v477;
    }
    mlcore::EntityQueryResult::EntityQueryResult((uint64_t)&v101[1], (uint64_t)__p);
    *(_QWORD *)__p = off_24C335E70;
    *(_QWORD *)&__p[24] = &unk_24C335EA0;
    if (SBYTE7(v548) < 0)
      operator delete((void *)v547);
    mediaplatform::PlatformErrorCondition::~PlatformErrorCondition((std::exception *)&v542);
    if ((__p[63] & 0x80000000) != 0)
      operator delete(*(void **)&__p[40]);
    std::exception::~exception((std::exception *)__p);
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v101[1];
    __str.__r_.__value_.__l.__size_ = (std::string::size_type)v101;
    v468 = &v101[1].__vftable;
    v469 = v101;
    do
      v201 = __ldxr(v102);
    while (__stxr(v201 + 1, v102));
    v202 = *(_QWORD *)(a3 + 24);
    if (!v202)
      std::__throw_bad_function_call[abi:ne180100]();
    v203 = v458;
    (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v202 + 48))(v202, &v468);
    v204 = v469;
    if (v469)
    {
      v205 = (unint64_t *)&v469->__shared_owners_;
      do
        v206 = __ldaxr(v205);
      while (__stlxr(v206 - 1, v205));
      if (!v206)
      {
        ((void (*)(std::__shared_weak_count *))v204->__on_zero_shared)(v204);
        std::__shared_weak_count::__release_weak(v204);
      }
    }
    v207 = (std::__shared_weak_count *)__str.__r_.__value_.__l.__size_;
    if (__str.__r_.__value_.__l.__size_)
    {
      v208 = (unint64_t *)(__str.__r_.__value_.__l.__size_ + 8);
      do
        v209 = __ldaxr(v208);
      while (__stlxr(v209 - 1, v208));
      if (!v209)
      {
        ((void (*)(std::__shared_weak_count *))v207->__on_zero_shared)(v207);
        std::__shared_weak_count::__release_weak(v207);
      }
    }
    *(_QWORD *)v470 = off_24C335E70;
    v471 = &unk_24C335EA0;
    if (SHIBYTE(v477) < 0)
      operator delete((void *)v476);
    mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(v475);
    if (SHIBYTE(v474) < 0)
      operator delete((void *)v473);
    std::exception::~exception((std::exception *)v470);
    if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__sz.__r_.__value_.__l.__data_);
    goto LABEL_590;
  }
  v90 = mlcore::PlaylistPropertySmartIsDynamic(v88);
  v91 = (mlcore *)mlcore::Entity::valueForProperty<int>((uint64_t)v89, v90);
  if ((_DWORD)v91)
  {
    *((_BYTE *)a1 + 152) = 1;
    goto LABEL_99;
  }
  v103 = (uint64_t)*v77;
  v104 = mlcore::PlaylistPropertyIsSmart(v91);
  v105 = (mlcore *)mlcore::Entity::valueForProperty<int>(v103, v104);
  if ((_DWORD)v105)
  {
    v106 = (uint64_t)*v77;
    v107 = mlcore::PlaylistPropertyIsSourceRemote(v105);
    v105 = (mlcore *)mlcore::Entity::valueForProperty<int>(v106, v107);
    *((_BYTE *)a1 + 152) = (_DWORD)v105 == 2;
    if ((_DWORD)v105 == 2)
    {
LABEL_99:
      v92 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
      v93 = (uint64_t)*v77;
      v94 = mlcore::PlaylistPropertyDistinguishedKind(v92);
      v95 = mlcore::Entity::valueForProperty<int>(v93, v94);
      v528 = 0uLL;
      if (v95 == 71)
      {
        v96 = v531;
        mlcore::DeviceLibraryView::library(v531, v470);
        LODWORD(__sz.__r_.__value_.__l.__data_) = *((_DWORD *)v96 + 20) | 0x5000;
        std::allocate_shared[abi:ne180100]<mlcore::DeviceLibraryView,std::allocator<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::DeviceLibrary>,unsigned int,void>((uint64_t *)__p, (__int128 *)v470, (int *)&__sz);
        v97 = *(_OWORD *)__p;
        *(_QWORD *)&__p[8] = 0;
        *(_QWORD *)__p = 0;
        v528 = v97;
        v98 = *(std::__shared_weak_count **)&v470[8];
        if (!*(_QWORD *)&v470[8])
          goto LABEL_114;
        v99 = (unint64_t *)(*(_QWORD *)&v470[8] + 8);
        do
          v100 = __ldaxr(v99);
        while (__stlxr(v100 - 1, v99));
      }
      else
      {
        v108 = v531;
        mlcore::DeviceLibraryView::library(v531, v470);
        LODWORD(__sz.__r_.__value_.__l.__data_) = *((_DWORD *)v108 + 20) | 1;
        std::allocate_shared[abi:ne180100]<mlcore::DeviceLibraryView,std::allocator<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::DeviceLibrary>,unsigned int,void>((uint64_t *)__p, (__int128 *)v470, (int *)&__sz);
        v109 = *(_OWORD *)__p;
        *(_QWORD *)&__p[8] = 0;
        *(_QWORD *)__p = 0;
        v528 = v109;
        v98 = *(std::__shared_weak_count **)&v470[8];
        if (!*(_QWORD *)&v470[8])
          goto LABEL_114;
        v110 = (unint64_t *)(*(_QWORD *)&v470[8] + 8);
        do
          v100 = __ldaxr(v110);
        while (__stlxr(v100 - 1, v110));
      }
      if (!v100)
      {
        ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
        std::__shared_weak_count::__release_weak(v98);
      }
LABEL_114:
      v111 = v528;
      v112 = v531;
      v113 = *((_DWORD *)v531 + 14);
      *(_QWORD *)(v528 + 48) = *((_QWORD *)v531 + 6);
      *(_DWORD *)(v111 + 56) = v113;
      v114 = std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<double> *,double>,std::__unordered_map_hasher<mlcore::ModelProperty<double> *,std::__hash_value_type<mlcore::ModelProperty<double> *,double>,std::hash<mlcore::ModelProperty<double> *>,std::equal_to<mlcore::ModelProperty<double> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<double> *,std::__hash_value_type<mlcore::ModelProperty<double> *,double>,std::equal_to<mlcore::ModelProperty<double> *>,std::hash<mlcore::ModelProperty<double> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<double> *,double>>>::find<mlcore::ModelProperty<double> *>((_QWORD *)v112 + 1, (unint64_t)v92);
      if (v114)
      {
        v116 = v114[3];
        v115 = (std::__shared_weak_count *)v114[4];
        v515 = v116;
        v516 = v115;
        if (v115)
        {
          v117 = (unint64_t *)&v115->__shared_owners_;
          do
            v118 = __ldxr(v117);
          while (__stxr(v118 + 1, v117));
        }
      }
      else
      {
        v115 = 0;
        v116 = 0;
        v516 = 0;
        v515 = 0;
      }
      *(_QWORD *)__p = v92;
      v119 = std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>>>::__emplace_unique_key_args<mlcore::EntityClass *,std::piecewise_construct_t const&,std::tuple<mlcore::EntityClass * const&>,std::tuple<>>(v111 + 8, (unint64_t)v92, (uint64_t *)__p);
      std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100](v119 + 3, v116, (uint64_t)v115);
      if (v115)
      {
        v120 = (unint64_t *)&v115->__shared_owners_;
        do
          v121 = __ldaxr(v120);
        while (__stlxr(v121 - 1, v120));
        if (!v121)
        {
          ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
          std::__shared_weak_count::__release_weak(v115);
        }
      }
      v122 = *a2;
      v123 = (std::__shared_weak_count *)a2[1];
      v513 = *a2;
      v514 = v123;
      if (v123)
      {
        v124 = (unint64_t *)&v123->__shared_owners_;
        do
          v125 = __ldxr(v124);
        while (__stxr(v125 + 1, v124));
      }
      v126 = *(_QWORD *)(v122 + 24);
      *(_QWORD *)__p = *(_QWORD *)(v122 + 16);
      *(_QWORD *)&__p[8] = v126;
      if (v126)
      {
        v127 = (unint64_t *)(v126 + 8);
        do
          v128 = __ldxr(v127);
        while (__stxr(v128 + 1, v127));
      }
      *(_QWORD *)&__p[16] = v122;
      *(_QWORD *)&__p[24] = v123;
      if (v123)
      {
        v129 = (unint64_t *)&v123->__shared_owners_;
        do
          v130 = __ldxr(v129);
        while (__stxr(v130 + 1, v129));
      }
      v131 = (mlcore *)mlcore::EntityRevisionController::latestRevisionNumber((mlcore::EntityRevisionController *)__p);
      v132 = v131;
      if (v123)
      {
        v133 = (unint64_t *)&v123->__shared_owners_;
        do
          v134 = __ldaxr(v133);
        while (__stlxr(v134 - 1, v133));
        if (!v134)
        {
          ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
          std::__shared_weak_count::__release_weak(v123);
        }
      }
      v135 = *(std::__shared_weak_count **)&__p[8];
      if (*(_QWORD *)&__p[8])
      {
        v136 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
        do
          v137 = __ldaxr(v136);
        while (__stlxr(v137 - 1, v136));
        if (!v137)
        {
          ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
          std::__shared_weak_count::__release_weak(v135);
        }
      }
      v138 = v514;
      if (v514)
      {
        v139 = (unint64_t *)&v514->__shared_owners_;
        do
          v140 = __ldaxr(v139);
        while (__stlxr(v140 - 1, v139));
        if (!v140)
        {
          ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
          std::__shared_weak_count::__release_weak(v138);
        }
      }
      if (*((char *)a1 + 183) < 0)
      {
        if (!a1[21])
          goto LABEL_175;
      }
      else if (!*((_BYTE *)a1 + 183))
      {
        goto LABEL_175;
      }
      v141 = v528;
      v142 = mlcore::ItemPropertyTitle(v131);
      std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&__sz, v142, (uint64_t)(a1 + 20));
      *(_OWORD *)__p = *(_OWORD *)&__sz.__r_.__value_.__l.__data_;
      *(_OWORD *)&__sz.__r_.__value_.__l.__data_ = 0uLL;
      v144 = mlcore::ItemPropertyArtistName(v143);
      std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&__str, v144, (uint64_t)(a1 + 20));
      *(_OWORD *)&__p[16] = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = 0uLL;
      v510 = 0;
      v508 = 0;
      v509 = 0;
      *(_QWORD *)v470 = &v508;
      v470[8] = 0;
      v145 = (__int128 *)operator new(0x20uLL);
      v146 = 0;
      v147 = 0;
      v508 = v145;
      v509 = v145;
      v510 = v145 + 2;
      do
      {
        v148 = v146;
        v149 = *(_OWORD *)&__p[16 * v147];
        *v145 = v149;
        if (*((_QWORD *)&v149 + 1))
        {
          v150 = (unint64_t *)(*((_QWORD *)&v149 + 1) + 8);
          do
            v151 = __ldxr(v150);
          while (__stxr(v151 + 1, v150));
        }
        ++v145;
        v146 = 1;
        v147 = 1;
      }
      while ((v148 & 1) == 0);
      v509 = v145;
      mlcore::CreateOrPredicate(&v508, &v511);
      *(_QWORD *)v470 = v92;
      v152 = std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate>>>>::__emplace_unique_key_args<mlcore::EntityClass *,std::piecewise_construct_t const&,std::tuple<mlcore::EntityClass * const&>,std::tuple<>>(v141 + 8, (unint64_t)v92, (uint64_t *)v470);
      std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100](v152 + 3, v511, (uint64_t)v512);
      v153 = v512;
      if (v512)
      {
        v154 = (unint64_t *)&v512->__shared_owners_;
        do
          v155 = __ldaxr(v154);
        while (__stlxr(v155 - 1, v154));
        if (!v155)
        {
          ((void (*)(std::__shared_weak_count *))v153->__on_zero_shared)(v153);
          std::__shared_weak_count::__release_weak(v153);
        }
      }
      *(_QWORD *)v470 = &v508;
      std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)v470);
      for (i = 16; i != -16; i -= 16)
        std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&__p[i]);
      v157 = (std::__shared_weak_count *)__str.__r_.__value_.__l.__size_;
      if (__str.__r_.__value_.__l.__size_)
      {
        v158 = (unint64_t *)(__str.__r_.__value_.__l.__size_ + 8);
        do
          v159 = __ldaxr(v158);
        while (__stlxr(v159 - 1, v158));
        if (!v159)
        {
          ((void (*)(std::__shared_weak_count *))v157->__on_zero_shared)(v157);
          std::__shared_weak_count::__release_weak(v157);
        }
      }
      v160 = (std::__shared_weak_count *)__sz.__r_.__value_.__l.__size_;
      if (__sz.__r_.__value_.__l.__size_)
      {
        v161 = (unint64_t *)(__sz.__r_.__value_.__l.__size_ + 8);
        do
          v162 = __ldaxr(v161);
        while (__stlxr(v162 - 1, v161));
        if (!v162)
        {
          ((void (*)(std::__shared_weak_count *))v160->__on_zero_shared)(v160);
          std::__shared_weak_count::__release_weak(v160);
        }
      }
LABEL_175:
      a1[1] = v92;
      v163 = (std::__shared_weak_count *)a1[18];
      v507[0] = a1[17];
      v507[1] = v163;
      if (v163)
      {
        v164 = (unint64_t *)&v163->__shared_owners_;
        do
          v165 = __ldxr(v164);
        while (__stxr(v165 + 1, v164));
      }
      v166 = (mlcore *)mlcore::PropertyForPlaylistSmartLimitKind((mlcore *)v507);
      v167 = v166;
      if (v163)
      {
        v168 = (unint64_t *)&v163->__shared_owners_;
        do
          v169 = __ldaxr(v168);
        while (__stlxr(v169 - 1, v168));
        if (!v169)
        {
          ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
          std::__shared_weak_count::__release_weak(v163);
        }
      }
      v506 = 0;
      v170 = (uint64_t)*v77;
      v171 = mlcore::PlaylistPropertySmartIsLimited(v166);
      if (mlcore::Entity::valueForProperty<int>(v170, v171))
        v172 = v167 == 0;
      else
        v172 = 1;
      v173 = !v172;
      v506 = v173;
      v505 = 0;
      v505 = mlcore::Playlist::adjustedSmartLimitValue(*v77);
      v502 = v528;
      if (*((_QWORD *)&v528 + 1))
      {
        v174 = (unint64_t *)(*((_QWORD *)&v528 + 1) + 8);
        do
          v175 = __ldxr(v174);
        while (__stxr(v175 + 1, v174));
      }
      (*(void (**)(_BYTE *__return_ptr, _QWORD *, __int128 *))(*a1 + 88))(__p, a1, &v502);
      v503[1] = 0;
      v503[0] = 0;
      v504 = 0;
      std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(v503, *(const void **)__p, *(uint64_t *)&__p[8], (uint64_t)(*(_QWORD *)&__p[8] - *(_QWORD *)__p) >> 3);
      std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)&__p[24]);
      if (*(_QWORD *)__p)
      {
        *(_QWORD *)&__p[8] = *(_QWORD *)__p;
        operator delete(*(void **)__p);
      }
      v176 = (std::__shared_weak_count *)*((_QWORD *)&v502 + 1);
      if (*((_QWORD *)&v502 + 1))
      {
        v177 = (unint64_t *)(*((_QWORD *)&v502 + 1) + 8);
        do
          v178 = __ldaxr(v177);
        while (__stlxr(v178 - 1, v177));
        if (!v178)
        {
          ((void (*)(std::__shared_weak_count *))v176->__on_zero_shared)(v176);
          std::__shared_weak_count::__release_weak(v176);
        }
      }
      v500 = 0uLL;
      v501 = 0;
      v498 = v528;
      if (*((_QWORD *)&v528 + 1))
      {
        v179 = (unint64_t *)(*((_QWORD *)&v528 + 1) + 8);
        do
          v180 = __ldxr(v179);
        while (__stxr(v180 + 1, v179));
      }
      (*(void (**)(_BYTE *__return_ptr, _QWORD *, __int128 *))(*a1 + 72))(__p, a1, &v498);
      v467 = *(std::__shared_weak_count **)&__p[8];
      v499 = *(_OWORD *)__p;
      *(_QWORD *)&__p[8] = 0;
      *(_QWORD *)__p = 0;
      mlcore::SQLRenderer::SQLRenderer((uint64_t)v470, &v499);
      if (v467)
      {
        v181 = (unint64_t *)&v467->__shared_owners_;
        do
          v182 = __ldaxr(v181);
        while (__stlxr(v182 - 1, v181));
        if (!v182)
        {
          ((void (*)(std::__shared_weak_count *))v467->__on_zero_shared)(v467);
          std::__shared_weak_count::__release_weak(v467);
        }
      }
      v183 = *(std::__shared_weak_count **)&__p[8];
      if (*(_QWORD *)&__p[8])
      {
        v184 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
        do
          v185 = __ldaxr(v184);
        while (__stlxr(v185 - 1, v184));
        if (!v185)
        {
          ((void (*)(std::__shared_weak_count *))v183->__on_zero_shared)(v183);
          std::__shared_weak_count::__release_weak(v183);
        }
      }
      v186 = (std::__shared_weak_count *)*((_QWORD *)&v498 + 1);
      if (*((_QWORD *)&v498 + 1))
      {
        v187 = (unint64_t *)(*((_QWORD *)&v498 + 1) + 8);
        do
          v188 = __ldaxr(v187);
        while (__stlxr(v188 - 1, v187));
        if (!v188)
        {
          ((void (*)(std::__shared_weak_count *))v186->__on_zero_shared)(v186);
          std::__shared_weak_count::__release_weak(v186);
        }
      }
      v189 = v529;
      v494 = &off_24C331228;
      memset(v495, 0, sizeof(v495));
      std::vector<std::shared_ptr<mediaplatform::DatabaseParameterBase>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::DatabaseParameterBase>*,std::shared_ptr<mediaplatform::DatabaseParameterBase>*>(v495, (_QWORD *)v473, *((_QWORD **)&v473 + 1), (uint64_t)(*((_QWORD *)&v473 + 1) - v473) >> 4);
      mediaplatform::DatabaseConnection::executeQuery<mediaplatform::DatabaseResultList,mediaplatform::DatabaseParameterList>((uint64_t *)&dsema, v189, &v470[8], (uint64_t)&v494);
      v494 = &off_24C331228;
      *(_QWORD *)__p = v495;
      std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      v190 = operator new(0x30uLL);
      *v190 = &off_24C33B668;
      v190[1] = v503;
      v190[2] = &v506;
      v190[3] = &v505;
      v190[4] = a1;
      v190[5] = &v500;
      *(_QWORD *)&__p[24] = v190;
      mediaplatform::DatabaseResult<mediaplatform::DatabaseResultList>::enumerateRows((uint64_t *)&dsema, (uint64_t)__p);
      v191 = *(_QWORD **)&__p[24];
      if (*(_BYTE **)&__p[24] == __p)
      {
        v192 = 4;
        v191 = __p;
      }
      else
      {
        if (!*(_QWORD *)&__p[24])
        {
LABEL_222:
          v193.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
          v194 = *v77;
          v195 = mlcore::PlaylistPropertySmartLimitKind((mlcore *)v193.__d_.__rep_);
          v196 = mlcore::Entity::valueForProperty<int>((uint64_t)v194, v195);
          if (!v506 && v196 != 2)
          {
LABEL_273:
            v224 = (std::vector<std::string> *)operator new();
            v456 = (uint64_t)v132;
            v224->__begin_ = 0;
            v224->__end_ = 0;
            v224->__end_cap_.__value_ = 0;
            v492 = v224;
            *(_QWORD *)__p = v224;
            v225 = (std::__shared_weak_count *)operator new();
            v225->__vftable = (std::__shared_weak_count_vtbl *)&off_24C331AA0;
            v225->__shared_owners_ = 0;
            v225->__shared_weak_owners_ = 0;
            v225[1].__vftable = (std::__shared_weak_count_vtbl *)v224;
            v493 = v225;
            *(_QWORD *)__p = 0;
            v226 = (mlcore *)std::unique_ptr<std::vector<std::string>>::reset[abi:ne180100]((void ***)__p);
            *((_QWORD *)&v490 + 1) = 0;
            v491 = 0;
            *(_QWORD *)&v490 = (char *)&v490 + 8;
            v228 = *((_QWORD *)&v500 + 1);
            v227 = v500;
            if ((_QWORD)v500 != *((_QWORD *)&v500 + 1))
            {
              while (1)
              {
                v229 = mlcore::ItemPropertyPersistentID(v226);
                v230 = (mlcore *)mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(v227, v229);
                v231 = mlcore::ItemPropertySubscriptionStoreItemID(v230);
                v232 = (mlcore *)mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(v227, v231);
                v233 = mlcore::ItemPropertyStoreCloudUniversalLibraryID(v232);
                mlcore::PropertyCacheBase<std::string,mediaplatform::Data>::valueForProperty((std::string *)__p, v227, v233);
                v235 = mlcore::ItemPropertyStoreID(v234);
                v236 = (mlcore *)mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(v227, v235);
                v237 = mlcore::ItemPropertyStoreCloudStatus(v236);
                v238 = (mlcore *)mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(v227, v237);
                v239 = mlcore::ItemPropertyInMyLibrary(v238);
                v240 = (mlcore *)mlcore::PropertyCacheBase<int,double,std::string,mediaplatform::Data>::valueForProperty(v227, v239);
                v241 = (int)v240;
                v242 = mlcore::ItemPropertyStorePlaybackEndpointType(v240);
                v243 = mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(v227, v242);
                memset(&__sz, 0, sizeof(__sz));
                if (v232)
                {
                  if (v238 == (mlcore *)8 && v241)
                    break;
                }
                if (v232 && v243 == 3 && !v241)
                  break;
                v252 = __p[23];
                if (__p[23] < 0)
                  v252 = *(_QWORD *)&__p[8];
                if (!v252)
                {
                  if (v236)
                    std::to_string(&__str, (uint64_t)v236);
                  else
                    std::to_string(&__str, (uint64_t)v230);
                  goto LABEL_281;
                }
                std::string::operator=(&__sz, (const std::string *)__p);
LABEL_284:
                v244 = (char *)operator new(0x38uLL);
                v245 = (uint64_t *)v244;
                v246 = v244 + 32;
                if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)(v244 + 32), __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
                }
                else
                {
                  *(_OWORD *)v246 = *(_OWORD *)&__sz.__r_.__value_.__l.__data_;
                  *((_QWORD *)v244 + 6) = *((_QWORD *)&__sz.__r_.__value_.__l + 2);
                }
                v247 = (uint64_t *)*((_QWORD *)&v490 + 1);
                v248 = (uint64_t **)&v490 + 1;
                v249 = (uint64_t **)&v490 + 1;
                if (*((_QWORD *)&v490 + 1))
                {
                  do
                  {
                    while (1)
                    {
                      v248 = (uint64_t **)v247;
                      if (!std::less<std::string>::operator()[abi:ne180100](v246, v247 + 4))
                        break;
                      v247 = *v248;
                      v249 = v248;
                      if (!*v248)
                        goto LABEL_293;
                    }
                    v247 = v248[1];
                  }
                  while (v247);
                  v249 = v248 + 1;
                }
LABEL_293:
                *v245 = 0;
                v245[1] = 0;
                v245[2] = (uint64_t)v248;
                *v249 = v245;
                if (*(_QWORD *)v490)
                {
                  *(_QWORD *)&v490 = *(_QWORD *)v490;
                  v245 = *v249;
                }
                std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)&v490 + 1), v245);
                v250 = (char *)*((_QWORD *)&v490 + 1);
                ++v491;
                if (*((_QWORD *)&v490 + 1))
                {
                  v251 = (char *)&v490 + 8;
                  do
                  {
                    if (std::less<std::string>::operator()[abi:ne180100](&__sz, (_QWORD *)v250 + 4))
                    {
                      v251 = v250;
                    }
                    else
                    {
                      if (!std::less<std::string>::operator()[abi:ne180100]((_QWORD *)v250 + 4, &__sz))
                      {
                        v253 = *(char **)v250;
                        v254 = v250;
                        if (*(_QWORD *)v250)
                        {
                          v254 = v250;
                          do
                          {
                            v255 = std::less<std::string>::operator()[abi:ne180100]((_QWORD *)v253 + 4, &__sz);
                            v256 = (char **)(v253 + 8);
                            if (!v255)
                            {
                              v256 = (char **)v253;
                              v254 = v253;
                            }
                            v253 = *v256;
                          }
                          while (*v256);
                        }
                        v257 = (_QWORD *)*((_QWORD *)v250 + 1);
                        if (v257)
                        {
                          do
                          {
                            v258 = std::less<std::string>::operator()[abi:ne180100](&__sz, v257 + 4);
                            v259 = v257 + 1;
                            if (v258)
                            {
                              v259 = v257;
                              v251 = (char *)v257;
                            }
                            v257 = (_QWORD *)*v259;
                          }
                          while (*v259);
                        }
                        if (v254 == v251)
                        {
                          LODWORD(v250) = 0;
                        }
                        else
                        {
                          LODWORD(v250) = 0;
                          do
                          {
                            v260 = (char *)*((_QWORD *)v254 + 1);
                            if (v260)
                            {
                              do
                              {
                                v261 = v260;
                                v260 = *(char **)v260;
                              }
                              while (v260);
                            }
                            else
                            {
                              do
                              {
                                v261 = (char *)*((_QWORD *)v254 + 2);
                                v172 = *(_QWORD *)v261 == (_QWORD)v254;
                                v254 = v261;
                              }
                              while (!v172);
                            }
                            LODWORD(v250) = (_DWORD)v250 + 1;
                            v254 = v261;
                          }
                          while (v261 != v251);
                        }
                        break;
                      }
                      v250 += 8;
                    }
                    v250 = *(char **)v250;
                  }
                  while (v250);
                }
                if ((__sz.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v262 = HIBYTE(__sz.__r_.__value_.__r.__words[2]);
                else
                  v262 = __sz.__r_.__value_.__l.__size_;
                std::string::basic_string[abi:ne180100]((uint64_t)&v489, v262 + 1);
                if ((v489.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v263 = &v489;
                else
                  v263 = (std::string *)v489.__r_.__value_.__r.__words[0];
                if (v262)
                {
                  if ((__sz.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    p_sz = &__sz;
                  else
                    p_sz = (std::string *)__sz.__r_.__value_.__r.__words[0];
                  memmove(v263, p_sz, v262);
                }
                *(_WORD *)((char *)&v263->__r_.__value_.__l.__data_ + v262) = 95;
                std::to_string(&v488, (_DWORD)v250 - 1);
                if ((v488.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v265 = &v488;
                else
                  v265 = (std::string *)v488.__r_.__value_.__r.__words[0];
                if ((v488.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v266 = HIBYTE(v488.__r_.__value_.__r.__words[2]);
                else
                  v266 = v488.__r_.__value_.__l.__size_;
                v267 = std::string::append(&v489, (const std::string::value_type *)v265, v266);
                __str = *v267;
                v267->__r_.__value_.__l.__size_ = 0;
                v267->__r_.__value_.__r.__words[2] = 0;
                v267->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v488.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v488.__r_.__value_.__l.__data_);
                if (SHIBYTE(v489.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v489.__r_.__value_.__l.__data_);
                v268 = v492;
                end = v492->__end_;
                if (end >= v492->__end_cap_.__value_)
                {
                  v226 = (mlcore *)std::vector<std::string>::__push_back_slow_path<std::string const&>(v492, (__int128 *)&__str);
                }
                else
                {
                  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                    std::string::__init_copy_ctor_external(v492->__end_, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
                  else
                    *end = __str;
                  v226 = (mlcore *)&end[1];
                  v268->__end_ = end + 1;
                }
                v268->__end_ = (std::vector<std::string>::pointer)v226;
                v270 = v535;
                v272 = (mlcore **)v535[1];
                v271 = (unint64_t)v535[2];
                if ((unint64_t)v272 >= v271)
                {
                  v226 = *v535;
                  v274 = ((char *)v272 - (char *)*v535) >> 3;
                  v275 = v274 + 1;
                  if ((unint64_t)(v274 + 1) >> 61)
                    std::vector<std::string>::__throw_length_error[abi:ne180100]();
                  v276 = v271 - (_QWORD)v226;
                  if (v276 >> 2 > v275)
                    v275 = v276 >> 2;
                  if ((unint64_t)v276 >= 0x7FFFFFFFFFFFFFF8)
                    v277 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v277 = v275;
                  if (v277)
                  {
                    if (v277 >> 61)
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    v278 = (char *)operator new(8 * v277);
                    v226 = *v270;
                    v272 = (mlcore **)v270[1];
                  }
                  else
                  {
                    v278 = 0;
                  }
                  v279 = (mlcore **)&v278[8 * v274];
                  *v279 = v230;
                  v273 = (mlcore *)(v279 + 1);
                  while (v272 != (mlcore **)v226)
                  {
                    v280 = *--v272;
                    *--v279 = v280;
                  }
                  *v270 = (mlcore *)v279;
                  v270[1] = v273;
                  v270[2] = (mlcore *)&v278[8 * v277];
                  if (v226)
                    operator delete(v226);
                }
                else
                {
                  *v272 = v230;
                  v273 = (mlcore *)(v272 + 1);
                }
                v270[1] = v273;
                if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__str.__r_.__value_.__l.__data_);
                if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__sz.__r_.__value_.__l.__data_);
                if ((__p[23] & 0x80000000) != 0)
                  operator delete(*(void **)__p);
                v227 += 216;
                if (v227 == v228)
                  goto LABEL_381;
              }
              std::to_string(&__str, (uint64_t)v232);
LABEL_281:
              if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__sz.__r_.__value_.__l.__data_);
              __sz = __str;
              goto LABEL_284;
            }
LABEL_381:
            a1[1] = mlcore::TypedEntityClass<mlcore::PlaylistItem>::sharedPointer();
            *(_OWORD *)&v488.__r_.__value_.__l.__data_ = 0uLL;
            v281 = *a2;
            if (*(_BYTE *)(*a2 + 65))
            {
              v282 = operator new(0x138uLL);
              v283 = v282;
              v282[1] = 0;
              v282[2] = 0;
              *v282 = &off_24C33D160;
              v284 = v282 + 3;
              v285 = v532;
              *(_QWORD *)__p = v531;
              *(_QWORD *)&__p[8] = v532;
              if (v532)
              {
                v286 = (unint64_t *)&v532->__shared_owners_;
                do
                  v287 = __ldxr(v286);
                while (__stxr(v287 + 1, v286));
              }
              mlcore::SmartPlaylistEntityCache::SmartPlaylistEntityCache((uint64_t)(v282 + 3), __p);
              if (v285)
              {
                v288 = (unint64_t *)&v285->__shared_owners_;
                do
                  v289 = __ldaxr(v288);
                while (__stlxr(v289 - 1, v288));
                if (!v289)
                {
                  ((void (*)(std::__shared_weak_count *))v285->__on_zero_shared)(v285);
                  std::__shared_weak_count::__release_weak(v285);
                }
              }
              *(_QWORD *)&v290 = v284;
              *((_QWORD *)&v290 + 1) = v283;
              v291 = (std::__shared_weak_count *)v488.__r_.__value_.__l.__size_;
              *(_OWORD *)&v488.__r_.__value_.__l.__data_ = v290;
              if (v291)
              {
                v292 = (unint64_t *)&v291->__shared_owners_;
                do
                  v293 = __ldaxr(v292);
                while (__stlxr(v293 - 1, v292));
                goto LABEL_405;
              }
            }
            else
            {
              v294 = operator new(0x138uLL);
              v295 = v294;
              v294[1] = 0;
              v294[2] = 0;
              *v294 = &off_24C33D160;
              v296 = v294 + 3;
              v297 = (std::__shared_weak_count *)a2[1];
              *(_QWORD *)__p = v281;
              *(_QWORD *)&__p[8] = v297;
              if (v297)
              {
                v298 = (unint64_t *)&v297->__shared_owners_;
                do
                  v299 = __ldxr(v298);
                while (__stxr(v299 + 1, v298));
              }
              mlcore::SmartPlaylistEntityCache::SmartPlaylistEntityCache((uint64_t)(v294 + 3), __p);
              if (v297)
              {
                v300 = (unint64_t *)&v297->__shared_owners_;
                do
                  v301 = __ldaxr(v300);
                while (__stlxr(v301 - 1, v300));
                if (!v301)
                {
                  ((void (*)(std::__shared_weak_count *))v297->__on_zero_shared)(v297);
                  std::__shared_weak_count::__release_weak(v297);
                }
              }
              *(_QWORD *)&v302 = v296;
              *((_QWORD *)&v302 + 1) = v295;
              v291 = (std::__shared_weak_count *)v488.__r_.__value_.__l.__size_;
              *(_OWORD *)&v488.__r_.__value_.__l.__data_ = v302;
              if (v291)
              {
                v303 = (unint64_t *)&v291->__shared_owners_;
                do
                  v293 = __ldaxr(v303);
                while (__stlxr(v293 - 1, v303));
LABEL_405:
                if (!v293)
                {
                  ((void (*)(std::__shared_weak_count *))v291->__on_zero_shared)(v291);
                  std::__shared_weak_count::__release_weak(v291);
                }
              }
            }
            v304 = mlcore::TypedEntityClass<mlcore::PlaylistItem>::sharedPointer();
            v465 = v535;
            v482 = v535;
            v483 = v536;
            if (v536)
            {
              v305 = (unint64_t *)&v536->__shared_owners_;
              do
                v306 = __ldxr(v305);
              while (__stxr(v306 + 1, v305));
            }
            v463 = v492;
            v480 = v492;
            v481 = v493;
            if (v493)
            {
              v307 = (unint64_t *)&v493->__shared_owners_;
              do
                v308 = __ldxr(v307);
              while (__stxr(v308 + 1, v307));
            }
            v454 = v304;
            v309 = (_QWORD *)operator new();
            *v309 = 0;
            v309[1] = 0;
            v309[2] = 0;
            std::shared_ptr<std::vector<mlcore::PropertyCache>>::shared_ptr[abi:ne180100]<std::vector<mlcore::PropertyCache>,void>(&v484, (uint64_t)v309);
            v310 = *v465;
            if (v465[1] != *v465)
            {
              v311 = 0;
              v312 = 0;
              do
              {
                begin = v463->__begin_;
                if (0xAAAAAAAAAAAAAAABLL * (((char *)v463->__end_ - (char *)v463->__begin_) >> 3) <= v312)
                  std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
                v314 = *((_QWORD *)v310 + v312);
                v315 = &begin[v311];
                if (SHIBYTE(begin[v311].__r_.__value_.__r.__words[2]) < 0)
                  std::string::__init_copy_ctor_external(&__sz, v315->__r_.__value_.__l.__data_, v315->__r_.__value_.__l.__size_);
                else
                  __sz = *v315;
                memset(&__p[8], 0, 32);
                *(_OWORD *)&__p[48] = 0u;
                v542 = 0u;
                *(_DWORD *)&__p[40] = 1065353216;
                v543 = 1065353216;
                v544 = 0u;
                v545 = 0u;
                v547 = 0u;
                v548 = 0u;
                v546 = 1065353216;
                v549 = 1065353216;
                memset(v550, 0, sizeof(v550));
                v551 = 1065353216;
                *(_QWORD *)__p = &off_24C3371C0;
                v552 = &unk_24C3371E8;
                v316 = mlcore::TypedEntityClass<mlcore::PlaylistItem>::sharedPointer();
                v489.__r_.__value_.__r.__words[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v316 + 112))(v316);
                v317 = (mlcore *)std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::__unordered_map_hasher<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::hash<mlcore::ModelProperty<long long> *>,std::equal_to<mlcore::ModelProperty<long long> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::equal_to<mlcore::ModelProperty<long long> *>,std::hash<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>>>::__emplace_unique_key_args<mlcore::ModelProperty<long long> *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelProperty<long long> * const&>,std::tuple<>>((uint64_t)v550, v489.__r_.__value_.__r.__words[0], &v489);
                *((_QWORD *)v317 + 3) = v314 | 0x8000000000000000;
                v318 = SHIBYTE(__sz.__r_.__value_.__r.__words[2]);
                if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
                  std::string::__init_copy_ctor_external(&__str, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
                else
                  __str = __sz;
                v319 = mlcore::PlaylistItemPropertyOccurrenceID(v317);
                mlcore::PropertyCacheBase<std::string,mediaplatform::Data>::setValueForProperty((uint64_t)__p, &__str, v319);
                if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__str.__r_.__value_.__l.__data_);
                v320 = v484;
                v321 = (_QWORD *)v484[1];
                if ((unint64_t)v321 >= v484[2])
                {
                  v322 = std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(v484, (uint64_t)__p);
                }
                else
                {
                  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase(v484[1], (uint64_t)__p);
                  *v321 = &off_24C3371C0;
                  v321[26] = &unk_24C3371E8;
                  v322 = (uint64_t)(v321 + 27);
                  v320[1] = (uint64_t)(v321 + 27);
                }
                v320[1] = v322;
                mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(__p);
                if (v318 < 0)
                  operator delete(__sz.__r_.__value_.__l.__data_);
                ++v312;
                v310 = *v465;
                ++v311;
              }
              while (v312 < (v465[1] - *v465) >> 3);
            }
            v323 = (std::__shared_weak_count *)operator new(0x128uLL);
            v325 = v323;
            v323->__shared_owners_ = 0;
            v323->__shared_weak_owners_ = 0;
            v323->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CD38;
            v326 = &v323[1].__vftable;
            *(_QWORD *)__p = v531;
            *(_QWORD *)&__p[8] = v532;
            if (v532)
            {
              v327 = (unint64_t *)&v532->__shared_owners_;
              do
                v328 = __ldxr(v327);
              while (__stxr(v328 + 1, v327));
            }
            *(_OWORD *)&__sz.__r_.__value_.__l.__data_ = 0uLL;
            *(_OWORD *)&__str.__r_.__value_.__l.__data_ = 0uLL;
            v329 = (std::__shared_weak_count *)v488.__r_.__value_.__l.__size_;
            *(_OWORD *)&v489.__r_.__value_.__l.__data_ = *(_OWORD *)&v488.__r_.__value_.__l.__data_;
            if (v488.__r_.__value_.__l.__size_)
            {
              v330 = (unint64_t *)(v488.__r_.__value_.__l.__size_ + 8);
              do
                v331 = __ldxr(v330);
              while (__stxr(v331 + 1, v330));
            }
            mlcore::EntityQueryResult::EntityQueryResult(&v323[1].__vftable, __p, v454, (uint64_t)(a1 + 10), &v484, &__sz, &__str, v324, 0, 0, v456, (uint64_t *)&v489);
            if (v329)
            {
              v332 = (unint64_t *)&v329->__shared_owners_;
              do
                v333 = __ldaxr(v332);
              while (__stlxr(v333 - 1, v332));
              if (!v333)
              {
                ((void (*)(std::__shared_weak_count *))v329->__on_zero_shared)(v329);
                std::__shared_weak_count::__release_weak(v329);
              }
            }
            v334 = (std::__shared_weak_count *)__str.__r_.__value_.__l.__size_;
            if (__str.__r_.__value_.__l.__size_)
            {
              v335 = (unint64_t *)(__str.__r_.__value_.__l.__size_ + 8);
              do
                v336 = __ldaxr(v335);
              while (__stlxr(v336 - 1, v335));
              if (!v336)
              {
                ((void (*)(std::__shared_weak_count *))v334->__on_zero_shared)(v334);
                std::__shared_weak_count::__release_weak(v334);
              }
            }
            v337 = (std::__shared_weak_count *)__sz.__r_.__value_.__l.__size_;
            if (__sz.__r_.__value_.__l.__size_)
            {
              v338 = (unint64_t *)(__sz.__r_.__value_.__l.__size_ + 8);
              do
                v339 = __ldaxr(v338);
              while (__stlxr(v339 - 1, v338));
              if (!v339)
              {
                ((void (*)(std::__shared_weak_count *))v337->__on_zero_shared)(v337);
                std::__shared_weak_count::__release_weak(v337);
              }
            }
            v340 = *(std::__shared_weak_count **)&__p[8];
            if (*(_QWORD *)&__p[8])
            {
              v341 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
              do
                v342 = __ldaxr(v341);
              while (__stlxr(v342 - 1, v341));
              if (!v342)
              {
                ((void (*)(std::__shared_weak_count *))v340->__on_zero_shared)(v340);
                std::__shared_weak_count::__release_weak(v340);
              }
            }
            v486 = v326;
            v487 = v325;
            v343 = v485;
            v203 = v458;
            if (v485)
            {
              v344 = (unint64_t *)&v485->__shared_owners_;
              do
                v345 = __ldaxr(v344);
              while (__stlxr(v345 - 1, v344));
              if (!v345)
              {
                ((void (*)(std::__shared_weak_count *))v343->__on_zero_shared)(v343);
                std::__shared_weak_count::__release_weak(v343);
              }
            }
            v346 = v481;
            if (v481)
            {
              v347 = (unint64_t *)&v481->__shared_owners_;
              do
                v348 = __ldaxr(v347);
              while (__stlxr(v348 - 1, v347));
              if (!v348)
              {
                ((void (*)(std::__shared_weak_count *))v346->__on_zero_shared)(v346);
                std::__shared_weak_count::__release_weak(v346);
              }
            }
            v349 = v483;
            if (v483)
            {
              v350 = (unint64_t *)&v483->__shared_owners_;
              do
                v351 = __ldaxr(v350);
              while (__stlxr(v351 - 1, v350));
              if (!v351)
              {
                ((void (*)(std::__shared_weak_count *))v349->__on_zero_shared)(v349);
                std::__shared_weak_count::__release_weak(v349);
              }
            }
            v478 = v486;
            v479 = v487;
            if (v487)
            {
              v352 = (unint64_t *)&v487->__shared_owners_;
              do
                v353 = __ldxr(v352);
              while (__stxr(v353 + 1, v352));
            }
            v354 = *(_QWORD *)(a3 + 24);
            if (!v354)
              std::__throw_bad_function_call[abi:ne180100]();
            (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v354 + 48))(v354, &v478);
            v355 = v479;
            if (v479)
            {
              v356 = (unint64_t *)&v479->__shared_owners_;
              do
                v357 = __ldaxr(v356);
              while (__stlxr(v357 - 1, v356));
              if (!v357)
              {
                ((void (*)(std::__shared_weak_count *))v355->__on_zero_shared)(v355);
                std::__shared_weak_count::__release_weak(v355);
              }
            }
            v358 = v487;
            if (v487)
            {
              v359 = (unint64_t *)&v487->__shared_owners_;
              do
                v360 = __ldaxr(v359);
              while (__stlxr(v360 - 1, v359));
              if (!v360)
              {
                ((void (*)(std::__shared_weak_count *))v358->__on_zero_shared)(v358);
                std::__shared_weak_count::__release_weak(v358);
              }
            }
            v361 = (std::__shared_weak_count *)v488.__r_.__value_.__l.__size_;
            if (v488.__r_.__value_.__l.__size_)
            {
              v362 = (unint64_t *)(v488.__r_.__value_.__l.__size_ + 8);
              do
                v363 = __ldaxr(v362);
              while (__stlxr(v363 - 1, v362));
              if (!v363)
              {
                ((void (*)(std::__shared_weak_count *))v361->__on_zero_shared)(v361);
                std::__shared_weak_count::__release_weak(v361);
              }
            }
            std::__tree<std::string>::destroy(*((char **)&v490 + 1));
            v364 = v493;
            if (v493)
            {
              v365 = (unint64_t *)&v493->__shared_owners_;
              do
                v366 = __ldaxr(v365);
              while (__stlxr(v366 - 1, v365));
              if (!v366)
              {
                ((void (*)(std::__shared_weak_count *))v364->__on_zero_shared)(v364);
                std::__shared_weak_count::__release_weak(v364);
              }
            }
            v367 = v497;
            if (v497)
            {
              v368 = (unint64_t *)&v497->__shared_owners_;
              do
                v369 = __ldaxr(v368);
              while (__stlxr(v369 - 1, v368));
              if (!v369)
              {
                ((void (*)(std::__shared_weak_count *))v367->__on_zero_shared)(v367);
                std::__shared_weak_count::__release_weak(v367);
              }
            }
            mlcore::SQLRenderer::~SQLRenderer((mlcore::SQLRenderer *)v470);
            *(_QWORD *)__p = &v500;
            std::vector<mlcore::PropertyCache>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
            if (v503[0])
            {
              v503[1] = v503[0];
              operator delete(v503[0]);
            }
            v370 = (std::__shared_weak_count *)*((_QWORD *)&v528 + 1);
            if (*((_QWORD *)&v528 + 1))
            {
              v371 = (unint64_t *)(*((_QWORD *)&v528 + 1) + 8);
              do
                v372 = __ldaxr(v371);
              while (__stlxr(v372 - 1, v371));
              goto LABEL_588;
            }
            goto LABEL_590;
          }
          mlcore::PlaylistItemEntityQuery::_sortDescriptorsForDisplay((mlcore::PlaylistItemEntityQuery *)a1, (__int128 *)__p);
          if (*(_QWORD *)&__p[8] != *(_QWORD *)__p)
          {
            v197 = 126 - 2 * __clz(0x84BDA12F684BDA13 * ((uint64_t)(*((_QWORD *)&v500 + 1) - v500) >> 3));
            v537[0] = &off_24C33B770;
            v537[1] = __p;
            v538 = v537;
            if (*((_QWORD *)&v500 + 1) == (_QWORD)v500)
              v198 = 0;
            else
              v198 = v197;
            std::__introsort<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*,false>((_QWORD *)v500, *((unint64_t *)&v500 + 1), (uint64_t)v537, v198, 1);
            v199 = v538;
            if (v538 == v537)
            {
              v200 = 4;
              v199 = v537;
              goto LABEL_271;
            }
            if (v538)
            {
              v200 = 5;
LABEL_271:
              (*(void (**)(void))(*v199 + 8 * v200))();
            }
          }
          __sz.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
          std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&__sz);
          goto LABEL_273;
        }
        v192 = 5;
      }
      (*(void (**)(void))(*v191 + 8 * v192))();
      goto LABEL_222;
    }
  }
  else
  {
    *((_BYTE *)a1 + 152) = 0;
  }
  v210 = a1[2];
  v211 = a1[3];
  __str.__r_.__value_.__r.__words[0] = v210;
  __str.__r_.__value_.__l.__size_ = v211;
  if (v211)
  {
    v212 = (unint64_t *)(v211 + 8);
    do
      v213 = __ldxr(v212);
    while (__stxr(v213 + 1, v212));
  }
  memset(&__sz, 0, sizeof(__sz));
  if (v210)
  {
    *(_QWORD *)&__p[32] = (char *)&__sz.__r_.__value_.__l + 16;
    v214 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mediaplatform::DatabaseParameterBase>>>(1uLL);
    v216 = __str.__r_.__value_.__l.__size_;
    *v214 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
    if (v216)
    {
      v217 = (unint64_t *)(v216 + 8);
      do
        v218 = __ldxr(v217);
      while (__stxr(v218 + 1, v217));
    }
    v219 = (_QWORD *)__sz.__r_.__value_.__l.__size_;
    v220 = __sz.__r_.__value_.__r.__words[0];
    if (__sz.__r_.__value_.__l.__size_ == __sz.__r_.__value_.__r.__words[0])
    {
      v223 = vdupq_n_s64(__sz.__r_.__value_.__l.__size_);
      v221 = (std::string::size_type)v214;
    }
    else
    {
      v221 = (std::string::size_type)v214;
      do
      {
        v222 = *((_OWORD *)v219 - 1);
        v219 -= 2;
        *(_OWORD *)(v221 - 16) = v222;
        v221 -= 16;
        *v219 = 0;
        v219[1] = 0;
      }
      while (v219 != (_QWORD *)v220);
      v223 = *(int64x2_t *)&__sz.__r_.__value_.__l.__data_;
    }
    v373 = (std::string::size_type)(v214 + 1);
    __sz.__r_.__value_.__r.__words[0] = v221;
    __sz.__r_.__value_.__l.__size_ = (std::string::size_type)(v214 + 1);
    *(int64x2_t *)&__p[8] = v223;
    v374 = __sz.__r_.__value_.__r.__words[2];
    __sz.__r_.__value_.__r.__words[2] = (std::string::size_type)&v214[v215];
    *(_QWORD *)&__p[24] = v374;
    *(_QWORD *)__p = v223.i64[0];
    v105 = (mlcore *)std::__split_buffer<std::shared_ptr<mediaplatform::SQLExpression const>>::~__split_buffer((uint64_t)__p);
    __sz.__r_.__value_.__l.__size_ = v373;
  }
  v375 = mlcore::PlaylistItemPropertyContainerPersistentID(v105);
  v376 = (uint64_t)operator new(0x48uLL);
  *(_OWORD *)(v376 + 8) = 0u;
  *(_QWORD *)v376 = &off_24C33CE88;
  *(_QWORD *)(v376 + 32) = v375;
  *(_QWORD *)(v376 + 40) = 0;
  *(_QWORD *)(v376 + 24) = &unk_24C339CA8;
  *(_QWORD *)(v376 + 48) = *v30;
  *(_OWORD *)(v376 + 56) = 0u;
  v503[0] = (void *)(v376 + 24);
  v503[1] = (void *)v376;
  v377 = *(_OWORD *)v503;
  *(_OWORD *)v470 = *(_OWORD *)v503;
  *(_OWORD *)v503 = 0u;
  v378 = __sz.__r_.__value_.__l.__size_;
  if (__sz.__r_.__value_.__l.__size_ >= __sz.__r_.__value_.__r.__words[2])
  {
    v466 = v377;
    v380 = (uint64_t)(__sz.__r_.__value_.__l.__size_ - __sz.__r_.__value_.__r.__words[0]) >> 4;
    if ((unint64_t)(v380 + 1) >> 60)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v381 = (uint64_t)(__sz.__r_.__value_.__r.__words[2] - __sz.__r_.__value_.__r.__words[0]) >> 3;
    if (v381 <= v380 + 1)
      v381 = v380 + 1;
    if (__sz.__r_.__value_.__r.__words[2] - __sz.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF0)
      v382 = 0xFFFFFFFFFFFFFFFLL;
    else
      v382 = v381;
    *(_QWORD *)&__p[32] = (char *)&__sz.__r_.__value_.__l + 16;
    v383 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mediaplatform::DatabaseParameterBase>>>(v382);
    v385 = &v383[16 * v380];
    *(_OWORD *)v385 = v466;
    *(_QWORD *)v470 = 0;
    *(_QWORD *)&v470[8] = 0;
    v386 = (_QWORD *)__sz.__r_.__value_.__l.__size_;
    v387 = __sz.__r_.__value_.__r.__words[0];
    if (__sz.__r_.__value_.__l.__size_ == __sz.__r_.__value_.__r.__words[0])
    {
      v390 = vdupq_n_s64(__sz.__r_.__value_.__l.__size_);
      v388 = (std::string::size_type)&v383[16 * v380];
    }
    else
    {
      v388 = (std::string::size_type)&v383[16 * v380];
      do
      {
        v389 = *((_OWORD *)v386 - 1);
        v386 -= 2;
        *(_OWORD *)(v388 - 16) = v389;
        v388 -= 16;
        *v386 = 0;
        v386[1] = 0;
      }
      while (v386 != (_QWORD *)v387);
      v390 = *(int64x2_t *)&__sz.__r_.__value_.__l.__data_;
    }
    v379 = v385 + 16;
    __sz.__r_.__value_.__r.__words[0] = v388;
    __sz.__r_.__value_.__l.__size_ = (std::string::size_type)(v385 + 16);
    *(int64x2_t *)&__p[8] = v390;
    v391 = __sz.__r_.__value_.__r.__words[2];
    __sz.__r_.__value_.__r.__words[2] = (std::string::size_type)&v383[16 * v384];
    *(_QWORD *)&__p[24] = v391;
    *(_QWORD *)__p = v390.i64[0];
    v376 = std::__split_buffer<std::shared_ptr<mediaplatform::SQLExpression const>>::~__split_buffer((uint64_t)__p);
  }
  else
  {
    *(_OWORD *)__sz.__r_.__value_.__l.__size_ = v377;
    v379 = (_QWORD *)(v378 + 16);
    *(_QWORD *)v470 = 0;
    *(_QWORD *)&v470[8] = 0;
  }
  __sz.__r_.__value_.__l.__size_ = (std::string::size_type)v379;
  if (*((char *)a1 + 183) < 0)
  {
    if (!a1[21])
      goto LABEL_567;
  }
  else if (!*((_BYTE *)a1 + 183))
  {
    goto LABEL_567;
  }
  v392 = mlcore::PlaylistItemPropertyTitle((mlcore *)v376);
  std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v500, v392, (uint64_t)(a1 + 20));
  *(_OWORD *)__p = v500;
  v500 = 0uLL;
  v394 = mlcore::PlaylistItemPropertyArtistName(v393);
  std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v490, v394, (uint64_t)(a1 + 20));
  *(_OWORD *)&__p[16] = v490;
  v490 = 0uLL;
  v396 = mlcore::PlaylistItemPropertyItemArtistName(v395);
  std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(&v489, v396, (uint64_t)(a1 + 20));
  *(_OWORD *)&__p[32] = *(_OWORD *)&v489.__r_.__value_.__l.__data_;
  *(_OWORD *)&v489.__r_.__value_.__l.__data_ = 0uLL;
  v523 = 0;
  v521 = 0;
  v522 = 0;
  *(_QWORD *)v470 = &v521;
  v470[8] = 0;
  v397 = (__int128 *)operator new(0x30uLL);
  v398 = 0;
  v521 = v397;
  v522 = v397;
  v523 = v397 + 3;
  do
  {
    v399 = *(_OWORD *)&__p[16 * v398];
    *v397 = v399;
    if (*((_QWORD *)&v399 + 1))
    {
      v400 = (unint64_t *)(*((_QWORD *)&v399 + 1) + 8);
      do
        v401 = __ldxr(v400);
      while (__stxr(v401 + 1, v400));
    }
    ++v398;
    ++v397;
  }
  while (v398 != 3);
  v522 = v397;
  mlcore::CreateOrPredicate(&v521, v503);
  v402 = __sz.__r_.__value_.__l.__size_;
  if (__sz.__r_.__value_.__l.__size_ >= __sz.__r_.__value_.__r.__words[2])
  {
    v403 = (uint64_t)(__sz.__r_.__value_.__l.__size_ - __sz.__r_.__value_.__r.__words[0]) >> 4;
    v404 = v403 + 1;
    if ((unint64_t)(v403 + 1) >> 60)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v405 = __sz.__r_.__value_.__r.__words[2] - __sz.__r_.__value_.__r.__words[0];
    if ((uint64_t)(__sz.__r_.__value_.__r.__words[2] - __sz.__r_.__value_.__r.__words[0]) >> 3 > v404)
      v404 = v405 >> 3;
    if ((unint64_t)v405 >= 0x7FFFFFFFFFFFFFF0)
      v406 = 0xFFFFFFFFFFFFFFFLL;
    else
      v406 = v404;
    v472 = &__sz.__r_.__value_.__s.__data_[16];
    v407 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mediaplatform::DatabaseParameterBase>>>(v406);
    v409 = &v407[16 * v403];
    *(_OWORD *)v409 = *(_OWORD *)v503;
    v503[1] = 0;
    v503[0] = 0;
    v410 = (_QWORD *)__sz.__r_.__value_.__l.__size_;
    v411 = __sz.__r_.__value_.__r.__words[0];
    if (__sz.__r_.__value_.__l.__size_ == __sz.__r_.__value_.__r.__words[0])
    {
      v414 = vdupq_n_s64(__sz.__r_.__value_.__l.__size_);
      v412 = (std::string::size_type)&v407[16 * v403];
    }
    else
    {
      v412 = (std::string::size_type)&v407[16 * v403];
      do
      {
        v413 = *((_OWORD *)v410 - 1);
        v410 -= 2;
        *(_OWORD *)(v412 - 16) = v413;
        v412 -= 16;
        *v410 = 0;
        v410[1] = 0;
      }
      while (v410 != (_QWORD *)v411);
      v414 = *(int64x2_t *)&__sz.__r_.__value_.__l.__data_;
    }
    v415 = (std::string::size_type)(v409 + 16);
    __sz.__r_.__value_.__r.__words[0] = v412;
    __sz.__r_.__value_.__l.__size_ = (std::string::size_type)(v409 + 16);
    *(int64x2_t *)&v470[8] = v414;
    v416 = (void *)__sz.__r_.__value_.__r.__words[2];
    __sz.__r_.__value_.__r.__words[2] = (std::string::size_type)&v407[16 * v408];
    v471 = v416;
    *(_QWORD *)v470 = v414.i64[0];
    std::__split_buffer<std::shared_ptr<mediaplatform::SQLExpression const>>::~__split_buffer((uint64_t)v470);
    v417 = (std::__shared_weak_count *)v503[1];
    __sz.__r_.__value_.__l.__size_ = v415;
    if (v503[1])
    {
      v418 = (unint64_t *)((char *)v503[1] + 8);
      do
        v419 = __ldaxr(v418);
      while (__stlxr(v419 - 1, v418));
      if (!v419)
      {
        ((void (*)(std::__shared_weak_count *))v417->__on_zero_shared)(v417);
        std::__shared_weak_count::__release_weak(v417);
      }
    }
  }
  else
  {
    *(_OWORD *)__sz.__r_.__value_.__l.__size_ = *(_OWORD *)v503;
    v503[1] = 0;
    v503[0] = 0;
    __sz.__r_.__value_.__l.__size_ = v402 + 16;
  }
  *(_QWORD *)v470 = &v521;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)v470);
  for (j = 32; j != -16; j -= 16)
    std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&__p[j]);
  v421 = (std::__shared_weak_count *)v489.__r_.__value_.__l.__size_;
  if (v489.__r_.__value_.__l.__size_)
  {
    v422 = (unint64_t *)(v489.__r_.__value_.__l.__size_ + 8);
    do
      v423 = __ldaxr(v422);
    while (__stlxr(v423 - 1, v422));
    if (!v423)
    {
      ((void (*)(std::__shared_weak_count *))v421->__on_zero_shared)(v421);
      std::__shared_weak_count::__release_weak(v421);
    }
  }
  v424 = (std::__shared_weak_count *)*((_QWORD *)&v490 + 1);
  if (*((_QWORD *)&v490 + 1))
  {
    v425 = (unint64_t *)(*((_QWORD *)&v490 + 1) + 8);
    do
      v426 = __ldaxr(v425);
    while (__stlxr(v426 - 1, v425));
    if (!v426)
    {
      ((void (*)(std::__shared_weak_count *))v424->__on_zero_shared)(v424);
      std::__shared_weak_count::__release_weak(v424);
    }
  }
  v427 = (std::__shared_weak_count *)*((_QWORD *)&v500 + 1);
  if (*((_QWORD *)&v500 + 1))
  {
    v428 = (unint64_t *)(*((_QWORD *)&v500 + 1) + 8);
    do
      v429 = __ldaxr(v428);
    while (__stlxr(v429 - 1, v428));
    if (!v429)
    {
      ((void (*)(std::__shared_weak_count *))v427->__on_zero_shared)(v427);
      std::__shared_weak_count::__release_weak(v427);
    }
  }
  v379 = (_QWORD *)__sz.__r_.__value_.__l.__size_;
LABEL_567:
  memset(v518, 0, sizeof(v518));
  std::vector<std::shared_ptr<mlcore::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<mlcore::Predicate>*,std::shared_ptr<mlcore::Predicate>*>((char *)v518, __sz.__r_.__value_.__l.__data_, v379, (uint64_t)((uint64_t)v379 - __sz.__r_.__value_.__r.__words[0]) >> 4);
  mlcore::CreateAndPredicate(v518, &v519);
  std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100](a1 + 2, v519, (uint64_t)v520);
  v430 = v520;
  v203 = v458;
  if (v520)
  {
    v431 = (unint64_t *)&v520->__shared_owners_;
    do
      v432 = __ldaxr(v431);
    while (__stlxr(v432 - 1, v431));
    if (!v432)
    {
      ((void (*)(std::__shared_weak_count *))v430->__on_zero_shared)(v430);
      std::__shared_weak_count::__release_weak(v430);
    }
  }
  *(_QWORD *)__p = v518;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v433 = (std::__shared_weak_count *)a2[1];
  v517[0] = *a2;
  v517[1] = (uint64_t)v433;
  if (v433)
  {
    v434 = (unint64_t *)&v433->__shared_owners_;
    do
      v435 = __ldxr(v434);
    while (__stxr(v435 + 1, v434));
  }
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v539, a3);
  mlcore::EntityQuery::_perform((mlcore::EntityQuery *)a1, v517, (uint64_t)v539);
  v436 = v540;
  if (v540 == v539)
  {
    v437 = 4;
    v436 = v539;
    goto LABEL_579;
  }
  if (v540)
  {
    v437 = 5;
LABEL_579:
    (*(void (**)(void))(*v436 + 8 * v437))();
  }
  if (v433)
  {
    v438 = (unint64_t *)&v433->__shared_owners_;
    do
      v439 = __ldaxr(v438);
    while (__stlxr(v439 - 1, v438));
    if (!v439)
    {
      ((void (*)(std::__shared_weak_count *))v433->__on_zero_shared)(v433);
      std::__shared_weak_count::__release_weak(v433);
    }
  }
  *(_QWORD *)__p = &__sz;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v370 = (std::__shared_weak_count *)__str.__r_.__value_.__l.__size_;
  if (__str.__r_.__value_.__l.__size_)
  {
    v440 = (unint64_t *)(__str.__r_.__value_.__l.__size_ + 8);
    do
      v372 = __ldaxr(v440);
    while (__stlxr(v372 - 1, v440));
LABEL_588:
    if (!v372)
    {
      ((void (*)(std::__shared_weak_count *))v370->__on_zero_shared)(v370);
      std::__shared_weak_count::__release_weak(v370);
    }
  }
LABEL_590:
  v441 = v536;
  if (v536)
  {
    v442 = (unint64_t *)&v536->__shared_owners_;
    do
      v443 = __ldaxr(v442);
    while (__stlxr(v443 - 1, v442));
    if (!v443)
    {
      ((void (*)(std::__shared_weak_count *))v441->__on_zero_shared)(v441);
      std::__shared_weak_count::__release_weak(v441);
    }
  }
  operator delete(v203);
  v444 = v530;
  if (v530)
  {
    v445 = (unint64_t *)&v530->__shared_owners_;
    do
      v446 = __ldaxr(v445);
    while (__stlxr(v446 - 1, v445));
    if (!v446)
    {
      ((void (*)(std::__shared_weak_count *))v444->__on_zero_shared)(v444);
      std::__shared_weak_count::__release_weak(v444);
    }
  }
  v447 = v532;
  if (v532)
  {
    v448 = (unint64_t *)&v532->__shared_owners_;
    do
      v449 = __ldaxr(v448);
    while (__stlxr(v449 - 1, v448));
    if (!v449)
    {
      ((void (*)(std::__shared_weak_count *))v447->__on_zero_shared)(v447);
      std::__shared_weak_count::__release_weak(v447);
    }
  }
}

void sub_20A8F426C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;
  uint64_t i;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x280]);
  a59 = &STACK[0x338];
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a59);
  for (i = 32; i != -16; i -= 16)
    std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x430] + i);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a63);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a67);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x250]);
  STACK[0x280] = (unint64_t)&STACK[0x3C0];
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x280]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x3A0]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x3E0]);
  operator delete(a19);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x380]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&STACK[0x390]);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<mlcore::SearchPredicate,std::allocator<mlcore::SearchPredicate>,mlcore::ModelProperty<std::string> *,std::string&,void>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  std::string *v7;
  std::string __p;

  v6 = (char *)operator new(0x48uLL);
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = 0;
  *(_QWORD *)v6 = &off_24C33CB78;
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  *((_QWORD *)v6 + 3) = off_24C338150;
  *((_QWORD *)v6 + 4) = a2;
  v7 = (std::string *)(v6 + 40);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v7, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    *((_DWORD *)v6 + 16) = 5;
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((_QWORD *)v6 + 7) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *((_DWORD *)v6 + 16) = 5;
  }
  *a1 = v6 + 24;
  a1[1] = v6;
}

void sub_20A8F4A80(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v2;
  void *v4;

  operator delete(v2);
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v4);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<mlcore::DeviceLibraryView,std::allocator<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::DeviceLibrary>,unsigned int,void>(uint64_t *a1, __int128 *a2, int *a3)
{
  char *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  __int128 v11;

  v6 = (char *)operator new(0x80uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &off_24C33CCC8;
  v7 = (uint64_t)(v6 + 24);
  v11 = *a2;
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  *a2 = 0u;
  mlcore::DeviceLibraryView::DeviceLibraryView((uint64_t)(v6 + 24), (uint64_t *)&v11, *a3);
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  *a1 = v7;
  a1[1] = (uint64_t)v6;
  std::shared_ptr<mlcore::DeviceLibraryView>::__enable_weak_this[abi:ne180100]<mlcore::DeviceLibraryView,mlcore::DeviceLibraryView,void>((uint64_t)a1, (_QWORD *)v6 + 14, v7);
}

void sub_20A8F4B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  std::__shared_weak_count *v3;
  void *v5;
  va_list va;

  va_start(va, a3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::__shared_weak_count::~__shared_weak_count(v3);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void mlcore::PlaylistItemEntityQuery::_sortDescriptorsForDisplay(mlcore::PlaylistItemEntityQuery *this@<X0>, __int128 *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  mlcore *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t ForeignPropertyBase;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int64x2_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  int64x2_t v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *p_shared_owners;
  unint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  int v67;
  uint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  unint64_t *v71;
  __int128 *v72;
  uint64_t v73;
  uint64_t *v74;
  int v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  uint64_t v78[2];
  uint64_t v79[2];
  uint64_t v80;
  int64x2_t v81;
  uint64_t v82;
  uint64_t *v83;

  v4 = *((_QWORD *)this + 7);
  if (v4 == *((_QWORD *)this + 8))
  {
    v62 = (std::__shared_weak_count *)*((_QWORD *)this + 18);
    v79[0] = *((_QWORD *)this + 17);
    v79[1] = (uint64_t)v62;
    if (v62)
    {
      p_shared_owners = (unint64_t *)&v62->__shared_owners_;
      do
        v64 = __ldxr(p_shared_owners);
      while (__stxr(v64 + 1, p_shared_owners));
    }
    mlcore::SortDescriptorsForPlaylistDisplayOrder(v79, 0, a2);
    if (v62)
    {
      v65 = (unint64_t *)&v62->__shared_owners_;
      do
        v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
LABEL_87:
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
    }
  }
  else
  {
    v5 = *(_QWORD *)(v4 + 8);
    if (v5 != mlcore::PlaylistItemPropertyPosition(this))
    {
      *(_QWORD *)a2 = 0;
      *((_QWORD *)a2 + 1) = 0;
      *((_QWORD *)a2 + 2) = 0;
      v6 = *((_QWORD *)this + 7);
      v7 = *((_QWORD *)this + 8);
      if (v6 != v7)
      {
        v73 = *((_QWORD *)this + 8);
        v74 = (uint64_t *)(a2 + 1);
        v72 = a2;
        do
        {
          v8 = *(const void **)(v6 + 8);
          v75 = *(_DWORD *)(v6 + 16);
          if (((*(uint64_t (**)(const void *))(*(_QWORD *)v8 + 88))(v8) & 1) != 0)
          {
            v10 = (const void *)(*(uint64_t (**)(void *))(*(_QWORD *)v9 + 16))(v9);
            v11 = (*(uint64_t (**)(void *))(*(_QWORD *)v9 + 24))(v9);
            v12 = (uint64_t *)operator new(8uLL);
            *v12 = v11;
            v13 = v12 + 1;
            v14 = v12 + 1;
            while (1)
            {
              v15 = (mlcore *)(*(uint64_t (**)(const void *))(*(_QWORD *)v10 + 88))(v10);
              if (!(_DWORD)v15)
                break;
              v10 = (const void *)(*(uint64_t (**)(void *))(*(_QWORD *)v16 + 16))(v16);
              v17 = (*(uint64_t (**)(void *))(*(_QWORD *)v16 + 24))(v16);
              v18 = v17;
              if (v14 >= v13)
              {
                v19 = v14 - v12;
                v20 = v19 + 1;
                if ((unint64_t)(v19 + 1) >> 61)
                  std::vector<std::string>::__throw_length_error[abi:ne180100]();
                if (((char *)v13 - (char *)v12) >> 2 > v20)
                  v20 = ((char *)v13 - (char *)v12) >> 2;
                if ((unint64_t)((char *)v13 - (char *)v12) >= 0x7FFFFFFFFFFFFFF8)
                  v21 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v21 = v20;
                if (v21)
                  v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v21);
                else
                  v22 = 0;
                v23 = (uint64_t *)(v21 + 8 * v19);
                *v23 = v18;
                v24 = v23 + 1;
                if (v14 != v12)
                {
                  v25 = 0;
                  do
                  {
                    v23[v25 - 1] = v14[v25 - 1];
                    --v25;
                  }
                  while (&v14[v25] != v12);
                  v23 = (uint64_t *)((char *)v23 + v25 * 8);
                }
                v13 = (uint64_t *)(v21 + 8 * v22);
                operator delete(v12);
                v12 = v23;
                v14 = v24;
                a2 = v72;
              }
              else
              {
                *v14++ = v17;
              }
            }
            if (v10 != (const void *)mlcore::PlaylistItemPropertyItemPersistentID(v15))
              __assert_rtn("_sortDescriptorsForDisplay", "PlaylistItemEntityQuery.cpp", 402, "baseProperty == PlaylistItemPropertyItemPersistentID()");
            if (v14 == v12)
            {
              ForeignPropertyBase = 0;
            }
            else
            {
              v29 = 0;
              do
              {
                v31 = *--v14;
                ForeignPropertyBase = v31;
                if (v29)
                {
                  (*(void (**)(uint64_t *__return_ptr, void *))(*(_QWORD *)v9 + 32))(&v76, v9);
                  ForeignPropertyBase = mlcore::GetForeignPropertyBase(v29, ForeignPropertyBase, &v76);
                  v32 = v77;
                  if (v77)
                  {
                    v33 = (unint64_t *)&v77->__shared_owners_;
                    do
                      v34 = __ldaxr(v33);
                    while (__stlxr(v34 - 1, v33));
                    if (!v34)
                    {
                      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
                      std::__shared_weak_count::__release_weak(v32);
                    }
                  }
                }
                v29 = ForeignPropertyBase;
              }
              while (v14 != v12);
            }
            v41 = *((_QWORD *)a2 + 1);
            v40 = *((_QWORD *)a2 + 2);
            if (v41 >= v40)
            {
              v43 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - *(_QWORD *)a2) >> 3);
              v44 = v43 + 1;
              v7 = v73;
              if (v43 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<std::string>::__throw_length_error[abi:ne180100]();
              v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - *(_QWORD *)a2) >> 3);
              if (2 * v45 > v44)
                v44 = 2 * v45;
              if (v45 >= 0x555555555555555)
                v46 = 0xAAAAAAAAAAAAAAALL;
              else
                v46 = v44;
              v83 = v74;
              if (v46)
                v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v46);
              else
                v47 = 0;
              v55 = v46 + 24 * v43;
              *(_QWORD *)v55 = &off_24C337670;
              *(_QWORD *)(v55 + 8) = ForeignPropertyBase;
              *(_DWORD *)(v55 + 16) = v75;
              v56 = *(_QWORD *)a2;
              v57 = *((_QWORD *)a2 + 1);
              if (v57 == *(_QWORD *)a2)
              {
                v60 = vdupq_n_s64(v57);
                v58 = v46 + 24 * v43;
              }
              else
              {
                v58 = v46 + 24 * v43;
                do
                {
                  *(_QWORD *)(v58 - 24) = &off_24C337670;
                  v58 -= 24;
                  v59 = *(_QWORD *)(v57 - 16);
                  *(_DWORD *)(v58 + 16) = *(_DWORD *)(v57 - 8);
                  *(_QWORD *)(v58 + 8) = v59;
                  v57 -= 24;
                }
                while (v57 != v56);
                v60 = (int64x2_t)*a2;
              }
              v42 = v55 + 24;
              *(_QWORD *)a2 = v58;
              *((_QWORD *)a2 + 1) = v55 + 24;
              v81 = v60;
              v61 = *((_QWORD *)a2 + 2);
              *((_QWORD *)a2 + 2) = v46 + 24 * v47;
              v82 = v61;
              v80 = v60.i64[0];
              std::__split_buffer<mlcore::SortDescriptor>::~__split_buffer((uint64_t)&v80);
            }
            else
            {
              *(_QWORD *)v41 = &off_24C337670;
              *(_QWORD *)(v41 + 8) = ForeignPropertyBase;
              v42 = v41 + 24;
              *(_DWORD *)(v41 + 16) = v75;
              v7 = v73;
            }
            *((_QWORD *)a2 + 1) = v42;
            operator delete(v12);
          }
          else
          {
            v27 = *((_QWORD *)a2 + 1);
            v26 = *((_QWORD *)a2 + 2);
            if (v27 >= v26)
            {
              v35 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - *(_QWORD *)a2) >> 3);
              v36 = v35 + 1;
              if (v35 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<std::string>::__throw_length_error[abi:ne180100]();
              v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v26 - *(_QWORD *)a2) >> 3);
              if (2 * v37 > v36)
                v36 = 2 * v37;
              if (v37 >= 0x555555555555555)
                v38 = 0xAAAAAAAAAAAAAAALL;
              else
                v38 = v36;
              v83 = v74;
              if (v38)
                v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v38);
              else
                v39 = 0;
              v48 = v38 + 24 * v35;
              *(_QWORD *)v48 = &off_24C337670;
              *(_QWORD *)(v48 + 8) = v8;
              *(_DWORD *)(v48 + 16) = v75;
              v49 = *(_QWORD *)a2;
              v50 = *((_QWORD *)a2 + 1);
              if (v50 == *(_QWORD *)a2)
              {
                v53 = vdupq_n_s64(v50);
                v51 = v38 + 24 * v35;
              }
              else
              {
                v51 = v38 + 24 * v35;
                do
                {
                  *(_QWORD *)(v51 - 24) = &off_24C337670;
                  v51 -= 24;
                  v52 = *(_QWORD *)(v50 - 16);
                  *(_DWORD *)(v51 + 16) = *(_DWORD *)(v50 - 8);
                  *(_QWORD *)(v51 + 8) = v52;
                  v50 -= 24;
                }
                while (v50 != v49);
                v53 = (int64x2_t)*a2;
              }
              v28 = v48 + 24;
              *(_QWORD *)a2 = v51;
              *((_QWORD *)a2 + 1) = v48 + 24;
              v81 = v53;
              v54 = *((_QWORD *)a2 + 2);
              *((_QWORD *)a2 + 2) = v38 + 24 * v39;
              v82 = v54;
              v80 = v53.i64[0];
              std::__split_buffer<mlcore::SortDescriptor>::~__split_buffer((uint64_t)&v80);
            }
            else
            {
              *(_QWORD *)v27 = &off_24C337670;
              *(_QWORD *)(v27 + 8) = v8;
              v28 = v27 + 24;
              *(_DWORD *)(v27 + 16) = v75;
            }
            *((_QWORD *)a2 + 1) = v28;
          }
          v6 += 24;
        }
        while (v6 != v7);
      }
      return;
    }
    v67 = *(_DWORD *)(*((_QWORD *)this + 7) + 16);
    v68 = *((_QWORD *)this + 17);
    v62 = (std::__shared_weak_count *)*((_QWORD *)this + 18);
    v78[0] = v68;
    v78[1] = (uint64_t)v62;
    if (v62)
    {
      v69 = (unint64_t *)&v62->__shared_owners_;
      do
        v70 = __ldxr(v69);
      while (__stxr(v70 + 1, v69));
    }
    mlcore::SortDescriptorsForPlaylistDisplayOrder(v78, v67 == 1, a2);
    if (v62)
    {
      v71 = (unint64_t *)&v62->__shared_owners_;
      do
        v66 = __ldaxr(v71);
      while (__stlxr(v66 - 1, v71));
      goto LABEL_87;
    }
  }
}

void sub_20A8F51C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::__introsort<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*,false>(_QWORD *result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  unint64_t v38;
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
  char v50;
  uint64_t v51;
  int64_t v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int64_t v89;
  _QWORD v90[27];
  _QWORD v91[26];
  void *v92;

  v9 = (unint64_t)result;
LABEL_2:
  v10 = v9;
  v85 = v9 + 432;
  v88 = v9 + 216;
  v84 = v9 - 216;
  while (2)
  {
    v11 = a2 - v10;
    v12 = 0x84BDA12F684BDA13 * ((uint64_t)(a2 - v10) >> 3);
    switch(v12)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v42 = *(_QWORD *)(a3 + 24);
        if (!v42)
          goto LABEL_148;
        result = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v42 + 48))(v42, a2 - 216, v10);
        if ((_DWORD)result)
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(v10, a2 - 216);
        return result;
      case 3:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v10, v10 + 216, a2 - 216, a3);
      case 4:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v10, v10 + 216, v10 + 432, a2 - 216, a3);
      case 5:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v10, v10 + 216, v10 + 432, v10 + 648, a2 - 216, a3);
      default:
        if (v11 > 5183)
        {
          if (!a4)
          {
            if (v10 != a2)
            {
              v52 = (unint64_t)(v12 - 2) >> 1;
              v86 = a2;
              v89 = v52;
              do
              {
                v53 = v52;
                if (v89 >= v52)
                {
                  v54 = (2 * v52) | 1;
                  v55 = v10 + 216 * v54;
                  if (2 * v52 + 2 < v12)
                  {
                    v56 = *(_QWORD *)(a3 + 24);
                    if (!v56)
                      goto LABEL_148;
                    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v56 + 48))(v56, v10 + 216 * v54, v55 + 216))
                    {
                      v55 += 216;
                      v54 = 2 * v53 + 2;
                    }
                  }
                  v57 = *(_QWORD *)(a3 + 24);
                  if (!v57)
                    goto LABEL_148;
                  v58 = v10 + 216 * v53;
                  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v57 + 48))(v57, v55, v58) & 1) == 0)
                  {
                    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v91, v10 + 216 * v53);
                    v91[0] = &off_24C3371C0;
                    v92 = &unk_24C3371E8;
                    do
                    {
                      v59 = v55;
                      mlcore::PropertyCache::operator=(v58, v55);
                      if (v89 < v54)
                        break;
                      v60 = (2 * v54) | 1;
                      v55 = v10 + 216 * v60;
                      v54 = 2 * v54 + 2;
                      if (v54 >= v12)
                      {
                        v54 = v60;
                      }
                      else
                      {
                        v61 = *(_QWORD *)(a3 + 24);
                        if (!v61)
                          goto LABEL_144;
                        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v61 + 48))(v61, v10 + 216 * v60, v55 + 216))
                        {
                          v55 += 216;
                        }
                        else
                        {
                          v54 = v60;
                        }
                      }
                      v62 = *(_QWORD *)(a3 + 24);
                      if (!v62)
LABEL_144:
                        std::__throw_bad_function_call[abi:ne180100]();
                      v58 = v59;
                    }
                    while (!(*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v62 + 48))(v62, v55, v91));
                    mlcore::PropertyCache::operator=(v59, (uint64_t)v91);
                    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v91);
                  }
                }
                v52 = v53 - 1;
              }
              while (v53);
              v63 = v11 / 0xD8uLL;
              v64 = v86;
              do
              {
                v87 = v64;
                mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v90, v10);
                v65 = 0;
                v90[26] = &unk_24C3371E8;
                v66 = v63 - 2;
                v90[0] = &off_24C3371C0;
                if (v63 < 2)
                  v66 = v63 - 1;
                v67 = v66 >> 1;
                v68 = v10;
                do
                {
                  v69 = v68 + 216 * v65 + 216;
                  v70 = 2 * v65;
                  v65 = (2 * v65) | 1;
                  v71 = v70 + 2;
                  if (v70 + 2 < v63)
                  {
                    v72 = *(_QWORD *)(a3 + 24);
                    if (!v72)
                      goto LABEL_143;
                    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v72 + 48))(v72, v69, v69 + 216))
                    {
                      v69 += 216;
                      v65 = v71;
                    }
                  }
                  mlcore::PropertyCache::operator=(v68, v69);
                  v68 = v69;
                }
                while (v65 <= v67);
                v64 = v87 - 216;
                if (v69 == v87 - 216)
                {
                  mlcore::PropertyCache::operator=(v69, (uint64_t)v90);
                }
                else
                {
                  mlcore::PropertyCache::operator=(v69, v87 - 216);
                  mlcore::PropertyCache::operator=(v64, (uint64_t)v90);
                  v73 = v69 - v10 + 216;
                  if (v73 >= 217)
                  {
                    v74 = *(_QWORD *)(a3 + 24);
                    if (!v74)
LABEL_143:
                      std::__throw_bad_function_call[abi:ne180100]();
                    v75 = (unint64_t)(-2 - 0x7B425ED097B425EDLL * (v73 >> 3)) >> 1;
                    v76 = v10 + 216 * v75;
                    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v74 + 48))(v74, v76, v69))
                    {
                      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v91, v69);
                      v91[0] = &off_24C3371C0;
                      v92 = &unk_24C3371E8;
                      do
                      {
                        v77 = v76;
                        mlcore::PropertyCache::operator=(v69, v76);
                        if (!v75)
                          break;
                        v78 = *(_QWORD *)(a3 + 24);
                        if (!v78)
                          std::__throw_bad_function_call[abi:ne180100]();
                        v75 = (v75 - 1) >> 1;
                        v76 = v10 + 216 * v75;
                        v69 = v77;
                      }
                      while (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v78 + 48))(v78, v76, v91) & 1) != 0);
                      mlcore::PropertyCache::operator=(v77, (uint64_t)v91);
                      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v91);
                    }
                  }
                }
                result = mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v90);
              }
              while (v63-- > 2);
            }
            return result;
          }
          v13 = (unint64_t)v12 >> 1;
          v14 = v10 + 216 * ((unint64_t)v12 >> 1);
          v15 = a2 - 216;
          if ((unint64_t)v11 < 0x6C01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v14, v10, a2 - 216, a3);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v10, v14, a2 - 216, a3);
            v16 = v10 + 216 * v13;
            v17 = v16 - 216;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v88, v16 - 216, a2 - 432, a3);
            v18 = a2;
            v19 = v16 + 216;
            v20 = v18;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v85, v19, v18 - 648, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v17, v14, v19, a3);
            mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v91, v10);
            v91[0] = &off_24C3371C0;
            v92 = &unk_24C3371E8;
            mlcore::PropertyCache::operator=(v10, v14);
            mlcore::PropertyCache::operator=(v14, (uint64_t)v91);
            mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v91);
            a2 = v20;
          }
          --a4;
          if ((a5 & 1) != 0)
            goto LABEL_12;
          v21 = *(_QWORD *)(a3 + 24);
          if (!v21)
            goto LABEL_148;
          if (((*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v21 + 48))(v21, v84, v10) & 1) != 0)
          {
LABEL_12:
            v22 = a2;
            mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v91, v10);
            v91[0] = &off_24C3371C0;
            v92 = &unk_24C3371E8;
            v23 = v10;
            do
            {
              v24 = *(_QWORD *)(a3 + 24);
              if (!v24)
                goto LABEL_141;
              v23 += 216;
            }
            while (((*(uint64_t (**)(uint64_t, unint64_t, _QWORD *))(*(_QWORD *)v24 + 48))(v24, v23, v91) & 1) != 0);
            v25 = v22;
            if (v23 - 216 != v10)
            {
              while (1)
              {
                v26 = *(_QWORD *)(a3 + 24);
                if (!v26)
                  break;
                v25 -= 216;
                if ((*(unsigned int (**)(uint64_t, unint64_t, _QWORD *))(*(_QWORD *)v26 + 48))(v26, v25, v91))
                {
                  goto LABEL_23;
                }
              }
LABEL_141:
              std::__throw_bad_function_call[abi:ne180100]();
            }
            v25 = v22;
            do
            {
              if (v23 >= v25)
                break;
              v27 = *(_QWORD *)(a3 + 24);
              if (!v27)
                goto LABEL_141;
              v25 -= 216;
            }
            while (((*(uint64_t (**)(uint64_t, unint64_t, _QWORD *))(*(_QWORD *)v27 + 48))(v27, v25, v91) & 1) == 0);
LABEL_23:
            v9 = v23;
            if (v23 < v25)
            {
              v28 = v25;
              do
              {
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(v9, v28);
                do
                {
                  v29 = *(_QWORD *)(a3 + 24);
                  if (!v29)
LABEL_140:
                    std::__throw_bad_function_call[abi:ne180100]();
                  v9 += 216;
                }
                while (((*(uint64_t (**)(uint64_t, unint64_t, _QWORD *))(*(_QWORD *)v29 + 48))(v29, v9, v91) & 1) != 0);
                do
                {
                  v30 = *(_QWORD *)(a3 + 24);
                  if (!v30)
                    goto LABEL_140;
                  v28 -= 216;
                }
                while (!(*(unsigned int (**)(uint64_t, unint64_t, _QWORD *))(*(_QWORD *)v30 + 48))(v30, v28, v91));
              }
              while (v9 < v28);
            }
            if (v9 - 216 != v10)
              mlcore::PropertyCache::operator=(v10, v9 - 216);
            mlcore::PropertyCache::operator=(v9 - 216, (uint64_t)v91);
            mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v91);
            v31 = v23 >= v25;
            a2 = v22;
            if (!v31)
              goto LABEL_39;
            v32 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v10, v9 - 216, a3);
            result = (_QWORD *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(v9, v22, a3);
            if ((_DWORD)result)
            {
              a2 = v9 - 216;
              if ((v32 & 1) != 0)
                return result;
              continue;
            }
            if ((v32 & 1) == 0)
            {
LABEL_39:
              result = (_QWORD *)std::__introsort<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*,false>(v10, v9 - 216, a3, a4, a5 & 1);
              a5 = 0;
            }
          }
          else
          {
            mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v91, v10);
            v91[0] = &off_24C3371C0;
            v92 = &unk_24C3371E8;
            v33 = *(_QWORD *)(a3 + 24);
            if (!v33)
              goto LABEL_142;
            if (((*(uint64_t (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v33 + 48))(v33, v91, v15) & 1) != 0)
            {
              v9 = v10;
              while (1)
              {
                v34 = *(_QWORD *)(a3 + 24);
                if (!v34)
                  break;
                v9 += 216;
                if (((*(uint64_t (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v34 + 48))(v34, v91, v9) & 1) != 0)goto LABEL_50;
              }
LABEL_142:
              std::__throw_bad_function_call[abi:ne180100]();
            }
            v35 = v10 + 216;
            do
            {
              v9 = v35;
              if (v35 >= a2)
                break;
              v36 = *(_QWORD *)(a3 + 24);
              if (!v36)
                goto LABEL_142;
              v37 = (*(uint64_t (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v36 + 48))(v36, v91, v35);
              v35 = v9 + 216;
            }
            while (!v37);
LABEL_50:
            v38 = a2;
            if (v9 < a2)
            {
              v38 = a2;
              do
              {
                v39 = *(_QWORD *)(a3 + 24);
                if (!v39)
                  goto LABEL_142;
                v38 -= 216;
              }
              while (((*(uint64_t (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v39 + 48))(v39, v91, v38) & 1) != 0);
            }
LABEL_60:
            if (v9 < v38)
            {
              std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(v9, v38);
              do
              {
                v40 = *(_QWORD *)(a3 + 24);
                if (!v40)
                  goto LABEL_142;
                v9 += 216;
              }
              while (!(*(unsigned int (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v40 + 48))(v40, v91, v9));
              while (1)
              {
                v41 = *(_QWORD *)(a3 + 24);
                if (!v41)
                  goto LABEL_142;
                v38 -= 216;
                if (((*(uint64_t (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v41 + 48))(v41, v91, v38) & 1) == 0)goto LABEL_60;
              }
            }
            if (v9 - 216 != v10)
              mlcore::PropertyCache::operator=(v10, v9 - 216);
            mlcore::PropertyCache::operator=(v9 - 216, (uint64_t)v91);
            result = mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v91);
            a5 = 0;
          }
          goto LABEL_2;
        }
        if ((a5 & 1) != 0)
        {
          if (v10 != a2)
          {
            v43 = v10 + 216;
            if (v10 + 216 != a2)
            {
              v44 = 0;
              v45 = v10;
              while (1)
              {
                v46 = *(_QWORD *)(a3 + 24);
                if (!v46)
                  break;
                v47 = v43;
                result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v46 + 48))(v46, v43, v45);
                if ((_DWORD)result)
                {
                  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v91, v47);
                  v91[0] = &off_24C3371C0;
                  v92 = &unk_24C3371E8;
                  v48 = v44;
                  while (1)
                  {
                    mlcore::PropertyCache::operator=(v10 + v48 + 216, v10 + v48);
                    if (!v48)
                      break;
                    v49 = *(_QWORD *)(a3 + 24);
                    if (!v49)
                      std::__throw_bad_function_call[abi:ne180100]();
                    v50 = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v49 + 48))(v49, v91, v10 + v48 - 216);
                    v48 -= 216;
                    if ((v50 & 1) == 0)
                    {
                      v51 = v10 + v48 + 216;
                      goto LABEL_83;
                    }
                  }
                  v51 = v10;
LABEL_83:
                  mlcore::PropertyCache::operator=(v51, (uint64_t)v91);
                  result = mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v91);
                }
                v43 = v47 + 216;
                v44 += 216;
                v45 = v47;
                if (v47 + 216 == a2)
                  return result;
              }
LABEL_148:
              std::__throw_bad_function_call[abi:ne180100]();
            }
          }
        }
        else if (v10 != a2)
        {
          v80 = v10 + 216;
          while (v80 != a2)
          {
            v81 = *(_QWORD *)(a3 + 24);
            if (!v81)
              goto LABEL_148;
            v82 = v80;
            result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v81 + 48))(v81, v80, v10);
            if ((_DWORD)result)
            {
              mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v91, v82);
              v91[0] = &off_24C3371C0;
              v92 = &unk_24C3371E8;
              do
              {
                mlcore::PropertyCache::operator=(v10 + 216, v10);
                v83 = *(_QWORD *)(a3 + 24);
                if (!v83)
                  std::__throw_bad_function_call[abi:ne180100]();
                v10 -= 216;
              }
              while (((*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v83 + 48))(v83, v91, v10) & 1) != 0);
              mlcore::PropertyCache::operator=(v10 + 216, (uint64_t)v91);
              result = mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v91);
            }
            v80 = v82 + 216;
            v10 = v82;
          }
        }
        return result;
    }
  }
}

void sub_20A8F5CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&a39);
  _Unwind_Resume(a1);
}

void std::__tree<std::string>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::string>::destroy(*(_QWORD *)a1);
    std::__tree<std::string>::destroy(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

void std::__shared_ptr_emplace<mlcore::SmartPlaylistEntityCache>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D160;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::SmartPlaylistEntityCache>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D160;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__shared_ptr_emplace<mlcore::SmartPlaylistEntityCache>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void ***std::unique_ptr<std::vector<std::string>>::reset[abi:ne180100](void ***result)
{
  void **v1;
  void **v2;

  v1 = *result;
  *result = 0;
  if (v1)
  {
    v2 = v1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
    JUMPOUT(0x20BD27AFCLL);
  }
  return result;
}

void std::__shared_ptr_pointer<std::vector<std::string> *,std::shared_ptr<std::vector<std::string>>::__shared_ptr_default_delete<std::vector<std::string>,std::vector<std::string>>,std::allocator<std::vector<std::string>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__shared_ptr_pointer<std::vector<std::string> *,std::shared_ptr<std::vector<std::string>>::__shared_ptr_default_delete<std::vector<std::string>,std::vector<std::string>>,std::allocator<std::vector<std::string>>>::__on_zero_shared(uint64_t result)
{
  void **v1;

  if (*(_QWORD *)(result + 24))
  {
    v1 = *(void ***)(result + 24);
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
    JUMPOUT(0x20BD27AFCLL);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<std::vector<std::string> *,std::shared_ptr<std::vector<std::string>>::__shared_ptr_default_delete<std::vector<std::string>,std::vector<std::string>>,std::allocator<std::vector<std::string>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000020A91DB48))
    return a1 + 24;
  else
    return 0;
}

_QWORD *std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(uint64_t a1, uint64_t a2)
{
  _QWORD v5[27];

  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v5, a1);
  v5[0] = &off_24C3371C0;
  v5[26] = &unk_24C3371E8;
  mlcore::PropertyCache::operator=(a1, a2);
  mlcore::PropertyCache::operator=(a2, (uint64_t)v5);
  return mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v5);
}

void sub_20A8F5FA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((uint64_t *)va);
  _Unwind_Resume(a1);
}

_QWORD *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a4 + 24);
  if (!v5)
    goto LABEL_17;
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a1);
  v10 = *(_QWORD *)(a4 + 24);
  if ((v9 & 1) == 0)
  {
    if (v10)
    {
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 48))(v10, a3, a2);
      if (!(_DWORD)result)
        return result;
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a2, a3);
      v13 = *(_QWORD *)(a4 + 24);
      if (v13)
      {
        result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v13 + 48))(v13, a2, a1);
        if ((_DWORD)result)
        {
          v11 = a1;
          v14 = a2;
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(v11, v14);
        }
        return result;
      }
    }
LABEL_17:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  if (!v10)
    goto LABEL_17;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 48))(v10, a3, a2))
  {
    v11 = a1;
LABEL_14:
    v14 = a3;
    return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(v11, v14);
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a1, a2);
  v15 = *(_QWORD *)(a4 + 24);
  if (!v15)
    goto LABEL_17;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v15 + 48))(v15, a3, a2);
  if ((_DWORD)result)
  {
    v11 = a2;
    goto LABEL_14;
  }
  return result;
}

_QWORD *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  uint64_t v13;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(a1, a2, a3, a5);
  v10 = *(_QWORD *)(a5 + 24);
  if (!v10)
    goto LABEL_9;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 48))(v10, a4, a3);
  if (!(_DWORD)result)
    return result;
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a3, a4);
  v12 = *(_QWORD *)(a5 + 24);
  if (!v12)
    goto LABEL_9;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 48))(v12, a3, a2);
  if (!(_DWORD)result)
    return result;
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a2, a3);
  v13 = *(_QWORD *)(a5 + 24);
  if (!v13)
LABEL_9:
    std::__throw_bad_function_call[abi:ne180100]();
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v13 + 48))(v13, a2, a1);
  if ((_DWORD)result)
    return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a1, a2);
  return result;
}

_QWORD *std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(a1, a2, a3, a4, a6);
  v12 = *(_QWORD *)(a6 + 24);
  if (!v12)
    goto LABEL_11;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 48))(v12, a5, a4);
  if (!(_DWORD)result)
    return result;
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a4, a5);
  v14 = *(_QWORD *)(a6 + 24);
  if (!v14)
    goto LABEL_11;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 48))(v14, a4, a3);
  if (!(_DWORD)result)
    return result;
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a3, a4);
  v15 = *(_QWORD *)(a6 + 24);
  if (!v15)
    goto LABEL_11;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v15 + 48))(v15, a3, a2);
  if (!(_DWORD)result)
    return result;
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a2, a3);
  v16 = *(_QWORD *)(a6 + 24);
  if (!v16)
LABEL_11:
    std::__throw_bad_function_call[abi:ne180100]();
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 48))(v16, a2, a1);
  if ((_DWORD)result)
    return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a1, a2);
  return result;
}

uint64_t std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD v18[27];

  v6 = 1;
  switch(0x84BDA12F684BDA13 * ((a2 - a1) >> 3))
  {
    case 0uLL:
    case 1uLL:
      return v6;
    case 2uLL:
      v7 = *(_QWORD *)(a3 + 24);
      if (!v7)
        goto LABEL_25;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 48))(v7, a2 - 216, a1))
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<mlcore::PropertyCache *&,mlcore::PropertyCache *&>(a1, a2 - 216);
      return v6;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(a1, a1 + 216, a2 - 216, a3);
      return v6;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(a1, a1 + 216, a1 + 432, a2 - 216, a3);
      return v6;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(a1, a1 + 216, a1 + 432, a1 + 648, a2 - 216, a3);
      return v6;
    default:
      v8 = a1 + 432;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::function<BOOL ()(mlcore::PropertyCache const&,mlcore::PropertyCache const&)> &,mlcore::PropertyCache*>(a1, a1 + 216, a1 + 432, a3);
      v9 = a1 + 648;
      if (a1 + 648 == a2)
        return 1;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    v12 = *(_QWORD *)(a3 + 24);
    if (!v12)
LABEL_25:
      std::__throw_bad_function_call[abi:ne180100]();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 48))(v12, v9, v8))
      goto LABEL_19;
    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v18, v9);
    v18[0] = &off_24C3371C0;
    v18[26] = &unk_24C3371E8;
    v13 = v10;
    while (1)
    {
      mlcore::PropertyCache::operator=(a1 + v13 + 648, a1 + v13 + 432);
      if (v13 == -432)
        break;
      v14 = *(_QWORD *)(a3 + 24);
      if (!v14)
        std::__throw_bad_function_call[abi:ne180100]();
      v15 = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v14 + 48))(v14, v18, a1 + v13 + 216);
      v13 -= 216;
      if ((v15 & 1) == 0)
      {
        v16 = a1 + v13 + 648;
        goto LABEL_17;
      }
    }
    v16 = a1;
LABEL_17:
    mlcore::PropertyCache::operator=(v16, (uint64_t)v18);
    if (++v11 == 8)
      break;
    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v18);
LABEL_19:
    v8 = v9;
    v10 += 216;
    v9 += 216;
    if (v9 == a2)
      return 1;
  }
  v6 = v9 + 216 == a2;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v18);
  return v6;
}

void sub_20A8F64E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((uint64_t *)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mediaplatform::DatabaseResultList,BOOL &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mediaplatform::DatabaseResultList,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x30uLL);
  *(_QWORD *)v2 = &off_24C33B668;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((_QWORD *)v2 + 5) = *(_QWORD *)(a1 + 40);
  return result;
}

__n128 std::__function::__func<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mediaplatform::DatabaseResultList,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_24C33B668;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mediaplatform::DatabaseResultList,BOOL &)>::operator()(uint64_t a1, int *a2, _BYTE *a3)
{
  mlcore *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  int v18;
  __int128 v19;
  void (**v20)(mlcore::PropertyCache *__hidden);
  __int128 v21;
  __int128 v22;
  int v23;
  __int128 v24;
  __int128 v25;
  int v26;
  __int128 v27;
  __int128 v28;
  int v29;
  __int128 v30;
  __int128 v31;
  int v32;
  __int128 v33;
  __int128 v34;
  int v35;
  void *v36;

  v18 = *a2;
  v19 = *(_OWORD *)(a2 + 2);
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  v5 = *(mlcore **)(a1 + 32);
  v21 = 0u;
  v22 = 0u;
  v23 = 1065353216;
  v24 = 0u;
  v25 = 0u;
  v26 = 1065353216;
  v27 = 0u;
  v28 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 1065353216;
  v32 = 1065353216;
  v33 = 0u;
  v34 = 0u;
  v35 = 1065353216;
  v20 = &off_24C3371C0;
  v36 = &unk_24C3371E8;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD **)v6;
  v8 = *(_QWORD **)(v6 + 8);
  if (*(_QWORD **)v6 != v8)
  {
    v9 = 0;
    do
    {
      (*(void (**)(_QWORD, void (***)(mlcore::PropertyCache *__hidden), int *, uint64_t))(*(_QWORD *)*v7 + 56))(*v7, &v20, &v18, v9);
      v9 = (v9 + 1);
      ++v7;
    }
    while (v7 != v8);
  }
  if (**(_BYTE **)(a1 + 16)
    && (v10 = **(_QWORD **)(a1 + 24),
        v11 = mlcore::PlaylistItemEntityQuery::_smartLimitingValueFromCache(v5, (uint64_t)&v20),
        **(_QWORD **)(a1 + 24) = v10 - v11,
        v10 - v11 < 0))
  {
    *a3 = 1;
  }
  else
  {
    v12 = *(uint64_t **)(a1 + 40);
    v13 = (_QWORD *)v12[1];
    if ((unint64_t)v13 >= v12[2])
    {
      v14 = std::vector<mlcore::PropertyCache>::__push_back_slow_path<mlcore::PropertyCache const&>(v12, (uint64_t)&v20);
    }
    else
    {
      mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase(v12[1], (uint64_t)&v20);
      *v13 = &off_24C3371C0;
      v13[26] = &unk_24C3371E8;
      v14 = (uint64_t)(v13 + 27);
      v12[1] = (uint64_t)(v13 + 27);
    }
    v12[1] = v14;
  }
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(&v20);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

void sub_20A8F673C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__shared_weak_count *a4, ...)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v8;
  va_list va;

  va_start(va, a4);
  *(_QWORD *)(v4 + 8) = v5;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((uint64_t *)va);
  if (a4)
  {
    p_shared_owners = (unint64_t *)&a4->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))a4->__on_zero_shared)(a4);
      std::__shared_weak_count::__release_weak(a4);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mediaplatform::DatabaseResultList,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore23PlaylistItemEntityQuery8_performENSt3__110shared_ptrINS_11TransactionEEENS1_8functionIFvNS2_INS_11QueryResultEEEEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::PlaylistItemEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mediaplatform::DatabaseResultList,BOOL &)>::target_type()
{
}

uint64_t mlcore::PlaylistItemEntityQuery::_smartLimitingValueFromCache(mlcore *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  v3 = *((_QWORD *)a1 + 17);
  v4 = mlcore::PlaylistPropertySmartLimitKind(a1);
  v5 = mlcore::Entity::valueForProperty<int>(v3, v4);
  result = 0;
  switch(v5)
  {
    case 0:
    case 3:
      v7 = mlcore::ItemPropertyTotalTime(0);
      result = (uint64_t)mlcore::PropertyCacheBase<double,std::string,mediaplatform::Data>::valueForProperty(a2, v7);
      break;
    case 1:
    case 4:
      v8 = mlcore::ItemPropertyFileSize(0);
      result = mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::valueForProperty(a2, v8);
      break;
    default:
      return result;
  }
  return result;
}

void std::__shared_ptr_emplace<mlcore::SearchPredicate>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CB78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::SearchPredicate>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CB78;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__shared_ptr_emplace<mlcore::SearchPredicate>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void **std::default_delete<std::vector<long long>>::operator()[abi:ne180100](void **result)
{
  void **v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = *result;
    if (v2)
    {
      v1[1] = v2;
      operator delete(v2);
    }
    JUMPOUT(0x20BD27AFCLL);
  }
  return result;
}

void std::__shared_ptr_pointer<std::vector<long long> *,std::shared_ptr<std::vector<long long>>::__shared_ptr_default_delete<std::vector<long long>,std::vector<long long>>,std::allocator<std::vector<long long>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void **std::__shared_ptr_pointer<std::vector<long long> *,std::shared_ptr<std::vector<long long>>::__shared_ptr_default_delete<std::vector<long long>,std::vector<long long>>,std::allocator<std::vector<long long>>>::__on_zero_shared(uint64_t a1)
{
  return std::default_delete<std::vector<long long>>::operator()[abi:ne180100](*(void ***)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<std::vector<long long> *,std::shared_ptr<std::vector<long long>>::__shared_ptr_default_delete<std::vector<long long>,std::vector<long long>>,std::allocator<std::vector<long long>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000020A91D841))
    return a1 + 24;
  else
    return 0;
}

void std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate> &,void>(_QWORD *a1, uint64_t a2, uint64_t a3, std::__shared_weak_count *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15[2];

  v8 = operator new(0x80uLL);
  v9 = v8;
  v8[1] = 0;
  v8[2] = 0;
  *v8 = &off_24C33CB40;
  v10 = v8 + 3;
  v15[0] = a3;
  v15[1] = (uint64_t)a4;
  if (a4)
  {
    p_shared_owners = (unint64_t *)&a4->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  mlcore::PropertiesQuery::PropertiesQuery((uint64_t)(v8 + 3), a2, v15);
  if (a4)
  {
    v13 = (unint64_t *)&a4->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))a4->__on_zero_shared)(a4);
      std::__shared_weak_count::__release_weak(a4);
    }
  }
  *a1 = v10;
  a1[1] = v9;
}

void sub_20A8F6A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__shared_weak_count *v9;
  void *v11;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void std::__function::__func<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1},std::allocator<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1}>,void ()(mlcore::PropertyCache const&,BOOL &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1},std::allocator<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1}>,void ()(mlcore::PropertyCache const&,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C33B820;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1},std::allocator<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1}>,void ()(mlcore::PropertyCache const&,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C33B820;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__int128 *std::__function::__func<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1},std::allocator<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1}>,void ()(mlcore::PropertyCache const&,BOOL &)>::operator()(uint64_t a1, _QWORD *a2)
{
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  __int128 *result;
  uint64_t v9;
  __int128 v10;
  __int128 *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  std::allocate_shared[abi:ne180100]<mlcore::Playlist,std::allocator<mlcore::Playlist>,long long &,void>(&v10, **(_QWORD **)(a1 + 16));
  std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100](*(_QWORD *)(a1 + 8), &v10);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = **(_QWORD **)(a1 + 8) + 8;
  *(_QWORD *)&v10 = &off_24C33B140;
  v11 = &v10;
  mlcore::PropertyCache::mergePropertiesFromCache(v7, a2, (uint64_t)&v10);
  result = v11;
  if (v11 == &v10)
  {
    v9 = 4;
    result = &v10;
  }
  else
  {
    if (!v11)
      return result;
    v9 = 5;
  }
  return (__int128 *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v9))();
}

void sub_20A8F6BD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1},std::allocator<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1}>,void ()(mlcore::PropertyCache const&,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore9GetEntityINS_8PlaylistEEENSt3__110shared_ptrIT_EENS3_INS_17DeviceLibraryViewEEENS3_INS_11TransactionEEExRKNS2_6vectorIPNS_17ModelPropertyBaseENS2_9allocatorISC_EEEEEUlRKNS_13PropertyCacheERbE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1},std::allocator<std::shared_ptr<mlcore::Playlist> mlcore::GetEntity<mlcore::Playlist>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,long long,std::vector<mlcore::ModelPropertyBase *> const&)::{lambda(mlcore::PropertyCache const&,BOOL &)#1}>,void ()(mlcore::PropertyCache const&,BOOL &)>::target_type()
{
}

void std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C33B1F0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C33B1F0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::operator()(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v3 + 1);
  std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100](*(_QWORD **)(a1 + 8), v3, *((uint64_t *)&v3 + 1));
  dispatch_semaphore_signal(**(dispatch_semaphore_t **)(a1 + 16));
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

uint64_t std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore14GetQueryResultINS_15PropertiesQueryEEENSt3__110shared_ptrINT_6ResultEEENS3_INS_17DeviceLibraryViewEEENS3_INS_11TransactionEEENS3_IS4_EEEUlNS3_INS_21PropertiesQueryResultEEEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::target_type()
{
}

void mlcore::PlaylistItemEntityQuery::_resultPropertiesToFetch(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  mlcore *v5;
  unint64_t IsLimited;
  int v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  mlcore *v11;
  mlcore *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  mlcore *v30;
  uint64_t j;
  uint64_t v32;
  mlcore *v33;
  mlcore *v34;
  mlcore *v35;
  mlcore *v36;
  mlcore *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[2];
  __int128 v42;
  _QWORD v43[2];
  _QWORD v44[2];
  void **v45;

  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_DWORD *)(a2 + 56) = 1065353216;
  *(_QWORD *)&v42 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 112))(*(_QWORD *)(a1 + 8));
  mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a2, (uint64_t *)&v42);
  v4 = *(_QWORD *)(a1 + 136);
  IsLimited = mlcore::PlaylistPropertySmartIsLimited(v5);
  v7 = mlcore::Entity::valueForProperty<int>(v4, IsLimited);
  v8 = *(std::__shared_weak_count **)(a1 + 144);
  v44[0] = *(_QWORD *)(a1 + 136);
  v44[1] = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (mlcore *)mlcore::PropertyForPlaylistSmartLimitKind((mlcore *)v44);
  v12 = v11;
  if (!v8)
    goto LABEL_8;
  v13 = (unint64_t *)&v8->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!v7)
    {
LABEL_21:
      if (!v7)
        goto LABEL_34;
      goto LABEL_22;
    }
  }
  else
  {
LABEL_8:
    if (!v7)
      goto LABEL_21;
  }
  if (!v12)
    goto LABEL_21;
  *(_QWORD *)&v42 = 0;
  v15 = *(std::__shared_weak_count **)(a1 + 144);
  v43[0] = *(_QWORD *)(a1 + 136);
  v43[1] = v15;
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v18 = mlcore::PropertyForPlaylistSmartLimitKind((mlcore *)v43);
  if (v15)
  {
    v19 = (unint64_t *)&v15->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  *(_QWORD *)&v42 = v18;
  if (v18)
    mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a2, (uint64_t *)&v42);
LABEL_22:
  v21 = *(std::__shared_weak_count **)(a1 + 144);
  v41[0] = *(_QWORD *)(a1 + 136);
  v41[1] = v21;
  if (v21)
  {
    v22 = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  mlcore::SortDescriptorsForPlaylistLimitOrder((mlcore *)v41, 0, (char *)&v42);
  if (v21)
  {
    v24 = (unint64_t *)&v21->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v27 = *((_QWORD *)&v42 + 1);
  for (i = v42; i != v27; i += 24)
  {
    v45 = *(void ***)(i + 8);
    mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a2, (uint64_t *)&v45);
  }
  v45 = (void **)&v42;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v45);
LABEL_34:
  v28 = *(_QWORD *)(a1 + 136);
  v29 = mlcore::PlaylistPropertySmartLimitKind(v11);
  v30 = (mlcore *)mlcore::Entity::valueForProperty<int>(v28, v29);
  if (!v7 || (_DWORD)v30 == 2 || v12)
  {
    mlcore::PlaylistItemEntityQuery::_sortDescriptorsForDisplay((mlcore::PlaylistItemEntityQuery *)a1, &v42);
    v32 = *((_QWORD *)&v42 + 1);
    for (j = v42; j != v32; j += 24)
    {
      v45 = *(void ***)(j + 8);
      mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a2, (uint64_t *)&v45);
    }
    v45 = (void **)&v42;
    std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v45);
  }
  v33 = (mlcore *)mlcore::ItemPropertySubscriptionStoreItemID(v30);
  v34 = (mlcore *)mlcore::ItemPropertyStoreCloudUniversalLibraryID(v33);
  v35 = (mlcore *)mlcore::ItemPropertyStoreID(v34);
  v36 = (mlcore *)mlcore::ItemPropertyStoreCloudStatus(v35);
  v37 = (mlcore *)mlcore::ItemPropertyInMyLibrary(v36);
  v38 = mlcore::ItemPropertyStorePlaybackEndpointType(v37);
  v39 = operator new(0x30uLL);
  v40 = 0;
  *v39 = v33;
  v39[1] = v34;
  v39[2] = v35;
  v39[3] = v36;
  v39[4] = v37;
  v39[5] = v38;
  do
  {
    *(_QWORD *)&v42 = v39[v40];
    mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::insert((float *)a2, (uint64_t *)&v42);
    ++v40;
  }
  while (v40 != 6);
  operator delete(v39);
}

void sub_20A8F708C(_Unwind_Exception *a1)
{
  uint64_t v1;

  mlcore::OrderedSet<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>>::~OrderedSet(v1);
  _Unwind_Resume(a1);
}

uint64_t mlcore::PlaylistItemEntityQuery::PlaylistItemEntityQuery(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *__p[2];
  char v6;

  v3 = *(_QWORD *)(*(_QWORD *)a2 + 224);
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  mlcore::PlaylistItemEntityQuery::PlaylistItemEntityQuery(a1, v3, (__int128 *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  return a1;
}

{
  uint64_t v3;
  void *__p[2];
  char v6;

  v3 = *(_QWORD *)(*(_QWORD *)a2 + 224);
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  mlcore::PlaylistItemEntityQuery::PlaylistItemEntityQuery(a1, v3, (__int128 *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_20A8F716C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t mlcore::PlaylistItemEntityQuery::PlaylistItemEntityQuery(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v6;
  std::string *v7;
  __int128 v8;
  uint64_t v10[2];

  v6 = mlcore::TypedEntityClass<mlcore::PlaylistItem>::sharedPointer();
  v10[0] = 0;
  v10[1] = 0;
  mlcore::EntityQuery::EntityQuery((_QWORD *)a1, v6, v10);
  *(_QWORD *)a1 = off_24C33A410;
  *(_QWORD *)(a1 + 128) = a2;
  *(_QWORD *)(a1 + 136) = 0;
  v7 = (std::string *)(a1 + 160);
  *(_QWORD *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 152) = 0;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v8 = *a3;
    *(_QWORD *)(a1 + 176) = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  return a1;
}

void sub_20A8F7220(_Unwind_Exception *a1)
{
  mlcore::EntityQuery *v1;
  uint64_t v2;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::EntityQuery::~EntityQuery(v1);
  _Unwind_Resume(a1);
}

void sub_20A8F72AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mlcore::BaseLocation::~BaseLocation(mlcore::BaseLocation *this)
{
  *(_QWORD *)this = off_24C33A860;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((_QWORD *)this + 1);
}

{
  *(_QWORD *)this = off_24C33A860;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((_QWORD *)this + 1);
  JUMPOUT(0x20BD27AFCLL);
}

double std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::TypedEntityClass<mlcore::BaseLocation>::sharedPointer(void)::{lambda(void)#1} &&>>()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_QWORD *)(v0 + 96) = 0;
  *(_DWORD *)(v0 + 104) = 1065353216;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_DWORD *)(v0 + 144) = 1065353216;
  *(_QWORD *)v0 = &off_24C338468;
  *(_QWORD *)(v0 + 8) = 850045863;
  mlcore::TypedEntityClass<mlcore::BaseLocation>::sharedPointer(void)::__sharedPointer = v0;
  return result;
}

void mlcore::TypedEntityClass<mlcore::BaseLocation>::~TypedEntityClass(mlcore::EntityClass *a1)
{
  mlcore::EntityClass::~EntityClass(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::description(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
}

__n128 mlcore::TypedEntityClass<mlcore::BaseLocation>::create@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, __n128 *a4@<X8>)
{
  char *v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  __n128 result;
  __n128 v13;
  unint64_t v14[3];
  unint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)operator new(0x100uLL);
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = &off_24C33C558;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *((_DWORD *)v8 + 18) = 1065353216;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 6) = 0u;
  *((_DWORD *)v8 + 28) = 1065353216;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *((_DWORD *)v8 + 38) = 1065353216;
  *((_OWORD *)v8 + 10) = 0u;
  *((_OWORD *)v8 + 11) = 0u;
  *((_DWORD *)v8 + 48) = 1065353216;
  *(_OWORD *)(v8 + 216) = 0u;
  *((_DWORD *)v8 + 58) = 1065353216;
  *((_QWORD *)v8 + 30) = &unk_24C3371E8;
  *((_QWORD *)v8 + 31) = a2;
  *(_OWORD *)(v8 + 200) = 0u;
  v9 = (uint64_t)(v8 + 200);
  *((_QWORD *)v8 + 4) = &off_24C3371C0;
  *((_QWORD *)v8 + 3) = &off_24C336D20;
  v13.n128_u64[0] = (unint64_t)(v8 + 24);
  v13.n128_u64[1] = (unint64_t)v8;
  v14[0] = (unint64_t)&off_24C33B140;
  v15 = v14;
  mlcore::PropertyCache::mergePropertiesFromCache((uint64_t)(v8 + 32), a3, (uint64_t)v14);
  v10 = v15;
  if (v15 == v14)
  {
    v11 = 4;
    v10 = v14;
    goto LABEL_5;
  }
  if (v15)
  {
    v11 = 5;
LABEL_5:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  v14[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 112))(a1);
  std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::__unordered_map_hasher<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::hash<mlcore::ModelProperty<long long> *>,std::equal_to<mlcore::ModelProperty<long long> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::equal_to<mlcore::ModelProperty<long long> *>,std::hash<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>>>::__emplace_unique_key_args<mlcore::ModelProperty<long long> *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelProperty<long long> * const&>,std::tuple<>>(v9, v14[0], v14)[3] = a2;
  result = v13;
  *a4 = v13;
  return result;
}

void sub_20A8F754C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a15;
  if (a15 == v15)
  {
    v18 = 4;
    v17 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::name(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::entityType()
{
  return 0xFFFFFFFFLL;
}

BOOL mlcore::TypedEntityClass<mlcore::BaseLocation>::isRevisionTrackable(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1) != -1;
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::isCloudUpdatable()
{
  return 0;
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::databaseTable()
{
  return *(_QWORD *)mediaplatform::Singleton<mlcore::BaseLocationTable>::sharedInstance();
}

void mlcore::TypedEntityClass<mlcore::BaseLocation>::databaseTablesToDeleteFrom(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void mlcore::TypedEntityClass<mlcore::BaseLocation>::databaseTablesToInsertInto(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::representativeItemPersistentIDProperty()
{
  return 0;
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::trackForeignPersistentIDProperty()
{
  return 0;
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::trackForeignOrderingProperty()
{
  return 0;
}

uint64_t mlcore::TypedEntityClass<mlcore::BaseLocation>::sectionPropertyForOrderingProperty()
{
  return 0;
}

uint64_t mlcore::BaseLocationPropertyPathType(mlcore *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&mlcore::BaseLocationPropertyPathType(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&mlcore::BaseLocationPropertyPathType(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::BaseLocationPropertyPathType(void)::$_0 &&>>);
  }
  return mlcore::BaseLocationPropertyPathType(void)::property;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::BaseLocationPropertyPathType(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::BaseLocationTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (uint64_t *)mediaplatform::Singleton<mlcore::BaseLocationTable>::sharedInstance();
  mlcore::MediaTable<long long,std::string>::mediaColumnAtIndex<0ul>((uint64_t)&__p, *v5);
  mlcore::DatabaseModelProperty<long long>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::BaseLocationPropertyPathType(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::BaseLocationPropertyPathType(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::BaseLocation>::sharedPointer();
  v10 = mlcore::BaseLocationPropertyPathType(void)::property;
  v11 = mediaplatform::Singleton<mlcore::BaseLocationTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "pathType");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8F7858(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

mlcore::BaseLocationTable *_ZNSt3__115allocate_sharedB8ne180100IN6mlcore17BaseLocationTableENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(mlcore::BaseLocationTable **a1)
{
  _QWORD *v2;
  mlcore::BaseLocationTable *result;

  v2 = operator new(0x148uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = &off_24C33CC90;
  result = mlcore::BaseLocationTable::BaseLocationTable((mlcore::BaseLocationTable *)(v2 + 3));
  *a1 = result;
  a1[1] = (mlcore::BaseLocationTable *)v2;
  return result;
}

void sub_20A8F7954(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<mlcore::BaseLocationTable>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CC90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::BaseLocationTable>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CC90;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__shared_ptr_emplace<mlcore::BaseLocationTable>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<mlcore::BaseLocation>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33C558;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::BaseLocation>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33C558;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__shared_ptr_emplace<mlcore::BaseLocation>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::BaseLocationPropertyFilePath(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __str;
  _QWORD v23[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::BaseLocationTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v23[0] = *v1;
  v23[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (uint64_t *)mediaplatform::Singleton<mlcore::BaseLocationTable>::sharedInstance();
  mlcore::MediaTable<long long,std::string>::mediaColumnAtIndex<1ul>((uint64_t)&__str, *v5);
  mlcore::DatabaseModelProperty<std::string>::DatabaseModelProperty(v0, v23, (uint64_t)&__str);
  mlcore::BaseLocationPropertyFilePath(void)::property = v0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&__str);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::BaseLocationPropertyFilePath(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::operator=((std::string *)(v8 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::BaseLocation>::sharedPointer();
  v10 = mlcore::BaseLocationPropertyFilePath(void)::property;
  v11 = mediaplatform::Singleton<mlcore::BaseLocationTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "filePath");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8F7BD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

double mlcore::BaseLocation::BaseLocation(mlcore::BaseLocation *this, uint64_t a2)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 1065353216;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_DWORD *)this + 32) = 1065353216;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *((_DWORD *)this + 42) = 1065353216;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_DWORD *)this + 52) = 1065353216;
  *((_QWORD *)this + 27) = &unk_24C3371E8;
  *((_QWORD *)this + 28) = a2;
  *(_QWORD *)this = &off_24C336D20;
  *((_QWORD *)this + 1) = &off_24C3371C0;
  return result;
}

{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 1065353216;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_DWORD *)this + 32) = 1065353216;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *((_DWORD *)this + 42) = 1065353216;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_DWORD *)this + 52) = 1065353216;
  *((_QWORD *)this + 27) = &unk_24C3371E8;
  *((_QWORD *)this + 28) = a2;
  *(_QWORD *)this = &off_24C336D20;
  *((_QWORD *)this + 1) = &off_24C3371C0;
  return result;
}

double mlcore::BaseLocation::BaseLocation(uint64_t a1, uint64_t a2)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = 1065353216;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = 1065353216;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_DWORD *)(a1 + 128) = 1065353216;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_DWORD *)(a1 + 168) = 1065353216;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_DWORD *)(a1 + 208) = 1065353216;
  *(_QWORD *)(a1 + 216) = &unk_24C3371E8;
  *(_QWORD *)(a1 + 224) = a2;
  *(_QWORD *)a1 = &off_24C336D20;
  *(_QWORD *)(a1 + 8) = &off_24C3371C0;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = 1065353216;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = 1065353216;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_DWORD *)(a1 + 128) = 1065353216;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_DWORD *)(a1 + 168) = 1065353216;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_DWORD *)(a1 + 208) = 1065353216;
  *(_QWORD *)(a1 + 216) = &unk_24C3371E8;
  *(_QWORD *)(a1 + 224) = a2;
  *(_QWORD *)a1 = &off_24C336D20;
  *(_QWORD *)(a1 + 8) = &off_24C3371C0;
  return result;
}

uint64_t mlcore::BaseLocation::pathType(mlcore::BaseLocation *this)
{
  unint64_t v2;

  v2 = mlcore::BaseLocationPropertyPathType(this);
  return mlcore::Entity::valueForProperty<long long>((uint64_t)this, v2);
}

void mlcore::BaseLocation::filePath(mlcore::BaseLocation *this@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v4;
  std::string __p;

  v4 = mlcore::BaseLocationPropertyFilePath(this);
  mlcore::Entity::valueForProperty<std::string>(&__p, (uint64_t)this, v4);
  mediaplatform::FilePath::FilePath(a2, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8F7E6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mlcore::BaseLocation::setFilePath(mlcore::BaseLocation *this, const mediaplatform::FilePath *a2)
{
  mlcore *v3;
  std::string::size_type v4;
  void *__p[2];
  char v6;

  mediaplatform::FilePath::str(a2, (uint64_t)__p);
  v4 = mlcore::BaseLocationPropertyFilePath(v3);
  mlcore::Entity::setValueForProperty<std::string>((uint64_t)this, (uint64_t)__p, v4);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_20A8F7EDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mlcore::LocalLibrary::~LocalLibrary(mlcore::LocalLibrary *this)
{
  mlcore::LocalLibrary::~LocalLibrary(this);
  JUMPOUT(0x20BD27AFCLL);
}

{
  __int128 *v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  __int128 *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_24C336E68;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  mediaplatform::DBCPSubpool::setDelegateCallbacks(*((mediaplatform::DBCPSubpool **)this + 33), (const mediaplatform::DatabaseConnectionCallbacks *)&v8);
  mediaplatform::DBCPSubpool::setDelegateCallbacks(*((mediaplatform::DBCPSubpool **)this + 31), (const mediaplatform::DatabaseConnectionCallbacks *)&v8);
  v2 = (__int128 *)*((_QWORD *)&v13 + 1);
  if (*((__int128 **)&v13 + 1) == &v12)
  {
    v3 = 4;
    v2 = &v12;
  }
  else
  {
    if (!*((_QWORD *)&v13 + 1))
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
LABEL_6:
  v4 = (__int128 *)*((_QWORD *)&v11 + 1);
  if (*((__int128 **)&v11 + 1) == &v10)
  {
    v5 = 4;
    v4 = &v10;
  }
  else
  {
    if (!*((_QWORD *)&v11 + 1))
      goto LABEL_11;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_11:
  v6 = (__int128 *)*((_QWORD *)&v9 + 1);
  if (*((__int128 **)&v9 + 1) == &v8)
  {
    v7 = 4;
    v6 = &v8;
  }
  else
  {
    if (!*((_QWORD *)&v9 + 1))
      goto LABEL_16;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
LABEL_16:
  if (*((char *)this + 399) < 0)
    operator delete(*((void **)this + 47));
  *(_QWORD *)&v8 = (char *)this + 352;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  if (*((char *)this + 351) < 0)
    operator delete(*((void **)this + 41));
  *(_QWORD *)&v8 = (char *)this + 304;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  *(_QWORD *)&v8 = (char *)this + 280;
  std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  mediaplatform::DatabaseConnectionPool::~DatabaseConnectionPool((mlcore::LocalLibrary *)((char *)this + 184));
  *((_QWORD *)this + 19) = &off_24C331570;
  *(_QWORD *)&v8 = (char *)this + 160;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  *(_QWORD *)this = &off_24C33AA40;
  *(_QWORD *)&v8 = (char *)this + 128;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  *((_QWORD *)this + 12) = &off_24C331570;
  *(_QWORD *)&v8 = (char *)this + 104;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  *((_QWORD *)this + 8) = &off_24C331570;
  *(_QWORD *)&v8 = (char *)this + 72;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  *((_QWORD *)this + 4) = &off_24C331570;
  *(_QWORD *)&v8 = (char *)this + 40;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

void sub_20A8F812C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void mediaplatform::DatabaseConnectionCallbacks::~DatabaseConnectionCallbacks(mediaplatform::DatabaseConnectionCallbacks *this)
{
  char *v2;
  char *v3;
  uint64_t v4;
  mediaplatform::DatabaseConnectionCallbacks *v5;
  uint64_t v6;
  mediaplatform::DatabaseConnectionCallbacks *v7;
  uint64_t v8;

  v2 = (char *)this + 64;
  v3 = (char *)*((_QWORD *)this + 11);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (mediaplatform::DatabaseConnectionCallbacks *)*((_QWORD *)this + 7);
  if (v5 == (mediaplatform::DatabaseConnectionCallbacks *)((char *)this + 32))
  {
    v6 = 4;
    v5 = (mediaplatform::DatabaseConnectionCallbacks *)((char *)this + 32);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  v7 = (mediaplatform::DatabaseConnectionCallbacks *)*((_QWORD *)this + 3);
  if (v7 == this)
  {
    v8 = 4;
    v7 = this;
  }
  else
  {
    if (!v7)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
}

void mlcore::LanguageResources::~LanguageResources(void **this)
{
  void **v2;

  if (*((char *)this + 119) < 0)
    operator delete(this[12]);
  v2 = this + 9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  v2 = this + 3;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this;
  std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void std::__function::__func<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0,std::allocator<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0>,void ()(mediaplatform::DatabaseConnection &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0,std::allocator<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0>,void ()(mediaplatform::DatabaseConnection &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C33B0E8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0,std::allocator<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0>,void ()(mediaplatform::DatabaseConnection &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore12LocalLibraryC1ERKN13mediaplatform13ContentBundleERKNS1_8FilePathERKNS_17LanguageResourcesEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0,std::allocator<mlcore::LocalLibrary::LocalLibrary(mediaplatform::ContentBundle const&,mediaplatform::FilePath const&,mlcore::LanguageResources const&)::$_0>,void ()(mediaplatform::DatabaseConnection &)>::target_type()
{
}

void std::allocate_shared[abi:ne180100]<mediaplatform::DatabaseFunction,std::allocator<mediaplatform::DatabaseFunction>,char const(&)[17],int,std::function<void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)> &,int,void>(_QWORD *a1, int *a2, uint64_t a3, int *a4)
{
  std::string *v8;
  std::string::size_type v9;
  _QWORD *v10;
  uint64_t v11;
  void *__p[2];
  char v13;
  _BYTE v14[24];
  _BYTE *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (std::string *)operator new(0x60uLL);
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C33BBB8;
  std::string::basic_string[abi:ne180100]<0>(__p, "SearchTermWeight");
  v9 = *a2;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v14, a3);
  mediaplatform::DatabaseFunction::DatabaseFunction(v8 + 1, (__int128 *)__p, v9, (uint64_t)v14, *a4);
  v10 = v15;
  if (v15 == v14)
  {
    v11 = 4;
    v10 = v14;
  }
  else
  {
    if (!v15)
      goto LABEL_6;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_6:
  if (v13 < 0)
    operator delete(__p[0]);
  *a1 = v8 + 1;
  a1[1] = v8;
}

void sub_20A8F83F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, char *a18)
{
  std::__shared_weak_count *v18;
  char *v19;
  char *v21;
  uint64_t v22;
  void *v23;

  v21 = a18;
  if (a18 == v19)
  {
    v22 = 4;
    v21 = &a15;
  }
  else
  {
    if (!a18)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  if (a14 < 0)
    operator delete(__p);
  std::__shared_weak_count::~__shared_weak_count(v18);
  operator delete(v23);
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<mediaplatform::DatabaseFunction,std::allocator<mediaplatform::DatabaseFunction>,char const(&)[22],int,std::function<void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)> &,int,void>(_QWORD *a1, char *a2, int *a3, uint64_t a4, int *a5)
{
  std::string *v10;
  std::string::size_type v11;
  _QWORD *v12;
  uint64_t v13;
  void *__p[2];
  char v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = (std::string *)operator new(0x60uLL);
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C33BBB8;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v11 = *a3;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v16, a4);
  mediaplatform::DatabaseFunction::DatabaseFunction(v10 + 1, (__int128 *)__p, v11, (uint64_t)v16, *a5);
  v12 = v17;
  if (v17 == v16)
  {
    v13 = 4;
    v12 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_6;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_6:
  if (v15 < 0)
    operator delete(__p[0]);
  *a1 = v10 + 1;
  a1[1] = v10;
}

void sub_20A8F8560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, char *a18)
{
  std::__shared_weak_count *v18;
  char *v19;
  char *v21;
  uint64_t v22;
  void *v23;

  v21 = a18;
  if (a18 == v19)
  {
    v22 = 4;
    v21 = &a15;
  }
  else
  {
    if (!a18)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  if (a14 < 0)
    operator delete(__p);
  std::__shared_weak_count::~__shared_weak_count(v18);
  operator delete(v23);
  _Unwind_Resume(a1);
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C33B090;
  return result;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::operator()(uint64_t a1, sqlite3_context **a2, uint64_t a3)
{
  sqlite3_context *v4;
  _QWORD *auxdata;
  int v6;
  std::mutex *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  sqlite3_value **v17;
  unint64_t v18;
  double v19;
  double v20;
  int8x8_t v21;
  uint8x8_t v22;
  double v23;
  double **v24;
  double *v25;
  unint64_t v26;
  int v27;

  v4 = *a2;
  auxdata = sqlite3_get_auxdata(*a2, 0);
  if (auxdata)
    goto LABEL_18;
  v6 = sqlite3_value_int(**(sqlite3_value ***)a3);
  v7 = (std::mutex *)mlcore::SharedObject<std::unordered_set<double>,int>::_mutex();
  std::mutex::lock(v7);
  v8 = (_QWORD *)mlcore::SharedObject<std::unordered_set<double>,int>::_objects();
  auxdata = std::__hash_table<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>>>::find<int>(v8, v6);
  mlcore::SharedObject<std::unordered_set<double>,int>::_objects();
  if (!auxdata)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v9 = (std::__shared_weak_count *)auxdata[4];
  if (!v9)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v10 = std::__shared_weak_count::lock(v9);
  v11 = v10;
  if (!v10)
  {
LABEL_12:
    auxdata = 0;
    goto LABEL_13;
  }
  auxdata = (_QWORD *)auxdata[3];
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_13:
  std::mutex::unlock(v7);
  sqlite3_set_auxdata(v4, 0, auxdata, 0);
  if (!v11)
    goto LABEL_17;
  v15 = (unint64_t *)&v11->__shared_owners_;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    if (!auxdata)
      goto LABEL_39;
  }
  else
  {
LABEL_17:
    if (!auxdata)
    {
LABEL_39:
      v27 = 0;
      goto LABEL_40;
    }
  }
LABEL_18:
  v17 = *(sqlite3_value ***)a3;
  if (*(_QWORD *)(a3 + 8) - *(_QWORD *)a3 < 9uLL)
    goto LABEL_39;
  v18 = 1;
  while (1)
  {
    v19 = sqlite3_value_double(v17[v18]);
    v20 = v19;
    if (v19 == 0.0)
      v20 = 0.0;
    v21 = (int8x8_t)auxdata[1];
    if (v21)
    {
      v22 = (uint8x8_t)vcnt_s8(v21);
      v22.i16[0] = vaddlv_u8(v22);
      if (v22.u32[0] > 1uLL)
      {
        v23 = v20;
        if (*(_QWORD *)&v20 >= *(_QWORD *)&v21)
          *(_QWORD *)&v23 = *(_QWORD *)&v20 % *(_QWORD *)&v21;
      }
      else
      {
        *(_QWORD *)&v23 = (*(_QWORD *)&v21 - 1) & *(_QWORD *)&v20;
      }
      v24 = *(double ***)(*auxdata + 8 * *(_QWORD *)&v23);
      if (v24)
      {
        v25 = *v24;
        if (v25)
          break;
      }
    }
LABEL_38:
    ++v18;
    v17 = *(sqlite3_value ***)a3;
    if (v18 >= (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3)
      goto LABEL_39;
  }
  while (1)
  {
    v26 = *((_QWORD *)v25 + 1);
    if (v26 == *(_QWORD *)&v20)
      break;
    if (v22.u32[0] > 1uLL)
    {
      if (v26 >= *(_QWORD *)&v21)
        v26 %= *(_QWORD *)&v21;
    }
    else
    {
      v26 &= *(_QWORD *)&v21 - 1;
    }
    if (v26 != *(_QWORD *)&v23)
      goto LABEL_38;
LABEL_37:
    v25 = *(double **)v25;
    if (!v25)
      goto LABEL_38;
  }
  if (v25[2] != v19)
    goto LABEL_37;
  v27 = 1;
LABEL_40:
  sqlite3_result_int(v4, v27);
}

void sub_20A8F8834(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore12LocalLibrary31_libraryDatabaseDidOpenCallbackERN13mediaplatform18DatabaseConnectionEE3$_5"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_5>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target_type()
{
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C33B038;
  return result;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::operator()(uint64_t a1, sqlite3_context **a2, uint64_t a3)
{
  sqlite3_context *v4;
  _QWORD *auxdata;
  int v6;
  std::mutex *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  sqlite3_value **v17;
  unint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  void *__p[2];
  char v23;

  v4 = *a2;
  auxdata = sqlite3_get_auxdata(*a2, 0);
  if (auxdata)
    goto LABEL_18;
  v6 = sqlite3_value_int(**(sqlite3_value ***)a3);
  v7 = (std::mutex *)mlcore::SharedObject<std::unordered_set<std::string>,int>::_mutex();
  std::mutex::lock(v7);
  v8 = (_QWORD *)mlcore::SharedObject<std::unordered_set<std::string>,int>::_objects();
  auxdata = std::__hash_table<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>>>::find<int>(v8, v6);
  mlcore::SharedObject<std::unordered_set<std::string>,int>::_objects();
  if (!auxdata)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v9 = (std::__shared_weak_count *)auxdata[4];
  if (!v9)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v10 = std::__shared_weak_count::lock(v9);
  v11 = v10;
  if (!v10)
  {
LABEL_12:
    auxdata = 0;
    goto LABEL_13;
  }
  auxdata = (_QWORD *)auxdata[3];
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_13:
  std::mutex::unlock(v7);
  sqlite3_set_auxdata(v4, 0, auxdata, 0);
  if (v11)
  {
    v15 = (unint64_t *)&v11->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
      if (auxdata)
        goto LABEL_18;
LABEL_28:
      sqlite3_result_int(v4, 0);
      return;
    }
  }
  if (!auxdata)
    goto LABEL_28;
LABEL_18:
  v17 = *(sqlite3_value ***)a3;
  if (*(_QWORD *)(a3 + 8) - *(_QWORD *)a3 < 9uLL)
  {
LABEL_24:
    v21 = 0;
  }
  else
  {
    v18 = 1;
    v19 = 1;
    while (1)
    {
      mediaplatform::DatabaseValue::value<std::string>(&v17[v19], __p);
      v20 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(auxdata, (unsigned __int8 *)__p);
      if (v23 < 0)
        operator delete(__p[0]);
      if (v20)
        break;
      ++v18;
      v17 = *(sqlite3_value ***)a3;
      ++v19;
      if (v18 >= (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3)
        goto LABEL_24;
    }
    v21 = 1;
  }
  sqlite3_result_int(v4, v21);
}

void sub_20A8F8AE4(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore12LocalLibrary31_libraryDatabaseDidOpenCallbackERN13mediaplatform18DatabaseConnectionEE3$_4"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_4>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target_type()
{
}

void std::__shared_ptr_emplace<mediaplatform::DatabaseFunction>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33BBB8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mediaplatform::DatabaseFunction>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33BBB8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void std::__shared_ptr_emplace<mediaplatform::DatabaseFunction>::__on_zero_shared(uint64_t a1)
{
  mediaplatform::DatabaseFunction::~DatabaseFunction((mediaplatform::DatabaseFunction *)(a1 + 24));
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C33AFE0;
  return result;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::operator()(uint64_t a1, sqlite3_context **a2, uint64_t a3)
{
  sqlite3_context *v4;
  _QWORD *auxdata;
  int v6;
  std::mutex *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  sqlite3_value **v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t v20;
  uint8x8_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  int v26;

  v4 = *a2;
  auxdata = sqlite3_get_auxdata(*a2, 0);
  if (auxdata)
    goto LABEL_18;
  v6 = sqlite3_value_int(**(sqlite3_value ***)a3);
  v7 = (std::mutex *)mlcore::SharedObject<std::unordered_set<long long>,int>::_mutex();
  std::mutex::lock(v7);
  v8 = (_QWORD *)mlcore::SharedObject<std::unordered_set<long long>,int>::_objects();
  auxdata = std::__hash_table<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>>>::find<int>(v8, v6);
  mlcore::SharedObject<std::unordered_set<long long>,int>::_objects();
  if (!auxdata)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v9 = (std::__shared_weak_count *)auxdata[4];
  if (!v9)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v10 = std::__shared_weak_count::lock(v9);
  v11 = v10;
  if (!v10)
  {
LABEL_12:
    auxdata = 0;
    goto LABEL_13;
  }
  auxdata = (_QWORD *)auxdata[3];
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_13:
  std::mutex::unlock(v7);
  sqlite3_set_auxdata(v4, 0, auxdata, 0);
  if (!v11)
    goto LABEL_17;
  v15 = (unint64_t *)&v11->__shared_owners_;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    if (!auxdata)
      goto LABEL_37;
  }
  else
  {
LABEL_17:
    if (!auxdata)
    {
LABEL_37:
      v26 = 0;
      goto LABEL_38;
    }
  }
LABEL_18:
  v17 = *(sqlite3_value ***)a3;
  if (*(_QWORD *)(a3 + 8) - *(_QWORD *)a3 < 9uLL)
    goto LABEL_37;
  v18 = 1;
  while (1)
  {
    v19 = sqlite3_value_int64(v17[v18]);
    v20 = (int8x8_t)auxdata[1];
    if (v20)
    {
      v21 = (uint8x8_t)vcnt_s8(v20);
      v21.i16[0] = vaddlv_u8(v21);
      if (v21.u32[0] > 1uLL)
      {
        v22 = v19;
        if (v19 >= *(_QWORD *)&v20)
          v22 = v19 % *(_QWORD *)&v20;
      }
      else
      {
        v22 = (*(_QWORD *)&v20 - 1) & v19;
      }
      v23 = *(_QWORD **)(*auxdata + 8 * v22);
      if (v23)
      {
        v24 = (_QWORD *)*v23;
        if (v24)
          break;
      }
    }
LABEL_36:
    ++v18;
    v17 = *(sqlite3_value ***)a3;
    if (v18 >= (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3)
      goto LABEL_37;
  }
  while (1)
  {
    v25 = v24[1];
    if (v25 == v19)
      break;
    if (v21.u32[0] > 1uLL)
    {
      if (v25 >= *(_QWORD *)&v20)
        v25 %= *(_QWORD *)&v20;
    }
    else
    {
      v25 &= *(_QWORD *)&v20 - 1;
    }
    if (v25 != v22)
      goto LABEL_36;
LABEL_35:
    v24 = (_QWORD *)*v24;
    if (!v24)
      goto LABEL_36;
  }
  if (v24[2] != v19)
    goto LABEL_35;
  v26 = 1;
LABEL_38:
  sqlite3_result_int(v4, v26);
}

void sub_20A8F8E2C(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore12LocalLibrary31_libraryDatabaseDidOpenCallbackERN13mediaplatform18DatabaseConnectionEE3$_3"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_3>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target_type()
{
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C33AF88;
  return result;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::operator()(uint64_t a1, sqlite3_context **a2, uint64_t a3)
{
  sqlite3_context *v4;
  _QWORD *auxdata;
  int v6;
  std::mutex *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  sqlite3_value **v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  uint8x8_t v21;
  unint64_t v22;
  uint64_t **v23;
  uint64_t *v24;
  unint64_t v25;
  int v26;

  v4 = *a2;
  auxdata = sqlite3_get_auxdata(*a2, 0);
  if (auxdata)
    goto LABEL_18;
  v6 = sqlite3_value_int(**(sqlite3_value ***)a3);
  v7 = (std::mutex *)mlcore::SharedObject<std::unordered_set<int>,int>::_mutex();
  std::mutex::lock(v7);
  v8 = (_QWORD *)mlcore::SharedObject<std::unordered_set<int>,int>::_objects();
  auxdata = std::__hash_table<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>>>::find<int>(v8, v6);
  mlcore::SharedObject<std::unordered_set<int>,int>::_objects();
  if (!auxdata)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v9 = (std::__shared_weak_count *)auxdata[4];
  if (!v9)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v10 = std::__shared_weak_count::lock(v9);
  v11 = v10;
  if (!v10)
  {
LABEL_12:
    auxdata = 0;
    goto LABEL_13;
  }
  auxdata = (_QWORD *)auxdata[3];
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_13:
  std::mutex::unlock(v7);
  sqlite3_set_auxdata(v4, 0, auxdata, 0);
  if (!v11)
    goto LABEL_17;
  v15 = (unint64_t *)&v11->__shared_owners_;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    if (!auxdata)
      goto LABEL_37;
  }
  else
  {
LABEL_17:
    if (!auxdata)
    {
LABEL_37:
      v26 = 0;
      goto LABEL_38;
    }
  }
LABEL_18:
  v17 = *(sqlite3_value ***)a3;
  if (*(_QWORD *)(a3 + 8) - *(_QWORD *)a3 < 9uLL)
    goto LABEL_37;
  v18 = 1;
  while (1)
  {
    v19 = sqlite3_value_int(v17[v18]);
    v20 = auxdata[1];
    if (v20)
    {
      v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
      v21.i16[0] = vaddlv_u8(v21);
      if (v21.u32[0] > 1uLL)
      {
        v22 = v19;
        if (v20 <= v19)
          v22 = v19 % v20;
      }
      else
      {
        v22 = (v20 - 1) & v19;
      }
      v23 = *(uint64_t ***)(*auxdata + 8 * v22);
      if (v23)
      {
        v24 = *v23;
        if (v24)
          break;
      }
    }
LABEL_36:
    ++v18;
    v17 = *(sqlite3_value ***)a3;
    if (v18 >= (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3)
      goto LABEL_37;
  }
  while (1)
  {
    v25 = v24[1];
    if (v25 == v19)
      break;
    if (v21.u32[0] > 1uLL)
    {
      if (v25 >= v20)
        v25 %= v20;
    }
    else
    {
      v25 &= v20 - 1;
    }
    if (v25 != v22)
      goto LABEL_36;
LABEL_35:
    v24 = (uint64_t *)*v24;
    if (!v24)
      goto LABEL_36;
  }
  if (*((_DWORD *)v24 + 4) != v19)
    goto LABEL_35;
  v26 = 1;
LABEL_38:
  sqlite3_result_int(v4, v26);
}

void sub_20A8F912C(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore12LocalLibrary31_libraryDatabaseDidOpenCallbackERN13mediaplatform18DatabaseConnectionEE3$_2"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_2>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target_type()
{
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C33AF30;
  result[1] = v3;
  return result;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::operator()(uint64_t a1, sqlite3_context **a2, sqlite3_value ***a3)
{
  sqlite3_context *v4;
  uint64_t v5;
  int v6;
  std::vector<std::string> *auxdata;
  _BOOL4 v8;
  void *__p[2];
  char v10;
  std::string v11;

  v4 = *a2;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = sqlite3_value_int64(**a3);
  mediaplatform::DatabaseValue::value<std::string>(*a3 + 1, &v11);
  mediaplatform::DatabaseValue::value<std::string>(*a3 + 2, __p);
  auxdata = (std::vector<std::string> *)sqlite3_get_auxdata(v4, 0);
  if (!auxdata)
  {
    auxdata = (std::vector<std::string> *)operator new();
    mediaplatform::SearchMatcher::SearchMatcher(auxdata, &v11, v5 + 376, 7);
    sqlite3_set_auxdata(v4, 0, auxdata, (void (__cdecl *)(void *))mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1::operator() const(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)::{lambda(void *)#1}::__invoke);
  }
  v8 = mediaplatform::SearchMatcher::matches((std::string *)auxdata, (uint64_t)__p, v6);
  sqlite3_result_int(v4, v8);
  if (v10 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
}

void sub_20A8F9310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore12LocalLibrary31_libraryDatabaseDidOpenCallbackERN13mediaplatform18DatabaseConnectionEE3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target_type()
{
}

uint64_t mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_1::operator() const(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C33AED8;
  return result;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C33AED8;
}

void std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::operator()(uint64_t a1, sqlite3_context **a2, uint64_t a3)
{
  sqlite3_context *v4;
  _QWORD *auxdata;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  sqlite3_value **v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  int8x8_t v14;
  uint8x8_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  _DWORD *shared_owners;
  char *v22;
  unint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  int v29;
  unint64_t v30;
  int *v31;
  int *v32;
  unint64_t v33;
  int v34;
  int v35;
  _QWORD *i;
  int v37;
  std::mutex *v38;
  _QWORD *v39;
  std::__shared_weak_count *v40;
  std::__shared_weak_count *v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  unint64_t v45;
  int v46;
  int v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  sqlite3_context *v52;
  _BYTE v53[40];
  int v54;
  _BYTE v55[16];
  _QWORD *v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60[6];

  v4 = *a2;
  auxdata = sqlite3_get_auxdata(*a2, 0);
  if (!auxdata)
  {
    v37 = sqlite3_value_int(**(sqlite3_value ***)a3);
    v38 = (std::mutex *)mlcore::SharedObject<mlcore::LocalizedSearchQuery::SearchWeightContext,int>::_mutex();
    std::mutex::lock(v38);
    v39 = (_QWORD *)mlcore::SharedObject<mlcore::LocalizedSearchQuery::SearchWeightContext,int>::_objects();
    auxdata = std::__hash_table<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::weak_ptr<std::unordered_set<long long>>>>>::find<int>(v39, v37);
    mlcore::SharedObject<mlcore::LocalizedSearchQuery::SearchWeightContext,int>::_objects();
    if (auxdata)
    {
      v40 = (std::__shared_weak_count *)auxdata[4];
      if (v40)
      {
        v41 = std::__shared_weak_count::lock(v40);
        v42 = v41;
        if (v41)
        {
          auxdata = (_QWORD *)auxdata[3];
          p_shared_owners = (unint64_t *)&v41->__shared_owners_;
          do
            v44 = __ldxr(p_shared_owners);
          while (__stxr(v44 + 1, p_shared_owners));
          do
            v45 = __ldaxr(p_shared_owners);
          while (__stlxr(v45 - 1, p_shared_owners));
          if (!v45)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v42);
          }
          goto LABEL_86;
        }
      }
      else
      {
        v42 = 0;
      }
      auxdata = 0;
    }
    else
    {
      v42 = 0;
    }
LABEL_86:
    std::mutex::unlock(v38);
    sqlite3_set_auxdata(v4, 0, auxdata, 0);
    if (v42)
    {
      v50 = (unint64_t *)&v42->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
  }
  v6 = (std::__shared_weak_count *)operator new(0x30uLL);
  v6->__shared_owners_ = 0;
  v7 = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D748;
  v6[1].__shared_owners_ = 0;
  v6[1].__shared_weak_owners_ = 0;
  v8 = *(sqlite3_value ***)a3;
  v9 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
  if ((unint64_t)v9 <= 8)
  {
    do
      v26 = __ldxr(v7);
    while (__stxr(v26 + 1, v7));
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = auxdata[5];
    memset(v53, 0, 32);
    *(_DWORD *)&v53[32] = 1065353216;
    goto LABEL_71;
  }
  v52 = v4;
  v10 = v9 >> 3;
  v11 = 1;
  do
  {
    if (v10 <= v11 + 1)
      __assert_rtn("operator()", "LocalLibrary.cpp", 84, "values.size() > i + 1");
    v12 = sqlite3_value_int(v8[v11]);
    v13 = sqlite3_value_int64(*(sqlite3_value **)(*(_QWORD *)a3 + 8 * (v11 + 1)));
    if (!v13)
      goto LABEL_23;
    v14 = (int8x8_t)auxdata[1];
    if (!*(_QWORD *)&v14)
      goto LABEL_23;
    v15 = (uint8x8_t)vcnt_s8(v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      v16 = v13;
      if (v13 >= *(_QWORD *)&v14)
        v16 = v13 % *(_QWORD *)&v14;
    }
    else
    {
      v16 = (*(_QWORD *)&v14 - 1) & v13;
    }
    v17 = *(_QWORD **)(*auxdata + 8 * v16);
    if (!v17 || (v18 = (_QWORD *)*v17) == 0)
    {
LABEL_23:
      memset(&v53[8], 0, 32);
      *(_DWORD *)v53 = 0;
      v54 = 1065353216;
      v58 = 0;
      v59 = 0;
      std::unordered_set<unsigned long>::unordered_set((uint64_t)v60, (uint64_t)&v53[8]);
      shared_owners = (_DWORD *)v6[1].__shared_owners_;
      if ((unint64_t)shared_owners >= v6[1].__shared_weak_owners_)
        goto LABEL_25;
LABEL_24:
      *shared_owners = v58;
      shared_owners[2] = v59;
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__hash_table((uint64_t)(shared_owners + 4), v60);
      v22 = (char *)(shared_owners + 14);
      goto LABEL_26;
    }
    v19 = *(_QWORD *)&v14 - 1;
    while (1)
    {
      v20 = v18[1];
      if (v13 == v20)
        break;
      if (v15.u32[0] > 1uLL)
      {
        if (v20 >= *(_QWORD *)&v14)
          v20 %= *(_QWORD *)&v14;
      }
      else
      {
        v20 &= v19;
      }
      if (v20 != v16)
        goto LABEL_23;
LABEL_22:
      v18 = (_QWORD *)*v18;
      if (!v18)
        goto LABEL_23;
    }
    if (v18[2] != v13)
      goto LABEL_22;
    if (v15.u32[0] > 1uLL)
    {
      v23 = v13;
      if (v13 >= *(_QWORD *)&v14)
        v23 = v13 % *(_QWORD *)&v14;
    }
    else
    {
      v23 = v19 & v13;
    }
    v24 = *(uint64_t **)(*auxdata + 8 * v23);
    if (!v24)
LABEL_92:
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    do
    {
      while (1)
      {
        v24 = (uint64_t *)*v24;
        if (!v24)
          goto LABEL_92;
        v25 = v24[1];
        if (v25 == v13)
          break;
        if (v15.u32[0] > 1uLL)
        {
          if (v25 >= *(_QWORD *)&v14)
            v25 %= *(_QWORD *)&v14;
        }
        else
        {
          v25 &= v19;
        }
        if (v25 != v23)
          goto LABEL_92;
      }
    }
    while (v24[2] != v13);
    *(_DWORD *)v53 = *((_DWORD *)v24 + 6);
    std::unordered_set<unsigned long>::unordered_set((uint64_t)&v53[8], (uint64_t)(v24 + 4));
    v58 = v12;
    v59 = *(_DWORD *)v53;
    std::unordered_set<unsigned long>::unordered_set((uint64_t)v60, (uint64_t)&v53[8]);
    shared_owners = (_DWORD *)v6[1].__shared_owners_;
    if ((unint64_t)shared_owners < v6[1].__shared_weak_owners_)
      goto LABEL_24;
LABEL_25:
    v22 = std::vector<std::pair<int,mediaplatform::SearchMatcher::ReasonResult>>::__push_back_slow_path<std::pair<int,mediaplatform::SearchMatcher::ReasonResult>>((char **)&v6[1], (uint64_t)&v58);
LABEL_26:
    v6[1].__shared_owners_ = (uint64_t)v22;
    std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)v60);
    std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)&v53[8]);
    v11 += 2;
    v8 = *(sqlite3_value ***)a3;
    v10 = (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3;
  }
  while (v10 > v11);
  v31 = (int *)v6[1].__vftable;
  v32 = (int *)v6[1].__shared_owners_;
  do
    v33 = __ldxr(v7);
  while (__stxr(v33 + 1, v7));
  v30 = auxdata[5];
  memset(v53, 0, 32);
  *(_DWORD *)&v53[32] = 1065353216;
  if (v31 == v32)
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
  }
  else
  {
    v29 = 0;
    v28 = 0;
    do
    {
      v34 = v31[2];
      v58 = *v31;
      v59 = v34;
      std::unordered_set<unsigned long>::unordered_set((uint64_t)v60, (uint64_t)(v31 + 4));
      if (v59 == 1)
        v35 = v58;
      else
        v35 = 0;
      v29 += v35;
      if (v59 == 2)
      {
        v29 = (int)(float)((float)v29 + (float)((float)v58 * 0.75));
      }
      else if (v59 == 3)
      {
        std::unordered_set<unsigned long>::unordered_set((uint64_t)v55, (uint64_t)v60);
        for (i = v56; i; i = (_QWORD *)*i)
          std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)v53, i[2], i[2]);
        v28 = (int)((double)v28 + (double)(v57 * v58 / v30) * 0.5);
        std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)v55);
      }
      std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)v60);
      v31 += 14;
    }
    while (v31 != v32);
    v27 = *(_QWORD *)&v53[24];
  }
  v4 = v52;
LABEL_71:
  if (v27 >= v30)
    v46 = v28;
  else
    v46 = 0;
  v47 = v46 + v29;
  std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)v53);
  do
    v48 = __ldaxr(v7);
  while (__stlxr(v48 - 1, v7));
  if (!v48)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  sqlite3_result_int(v4, v47);
  do
    v49 = __ldaxr(v7);
  while (__stlxr(v49 - 1, v7));
  if (!v49)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_20A8F99F0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v6;

  std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table(v3);
  std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table(v2);
  do
    v6 = __ldaxr(v4);
  while (__stlxr(v6 - 1, v4));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore12LocalLibrary31_libraryDatabaseDidOpenCallbackERN13mediaplatform18DatabaseConnectionEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0,std::allocator<mlcore::LocalLibrary::_libraryDatabaseDidOpenCallback(mediaplatform::DatabaseConnection &)::$_0>,void ()(mediaplatform::DatabaseContext,std::vector<mediaplatform::DatabaseValue> &)>::target_type()
{
}

uint64_t std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = *a2;
  *a2 = 0;
  *(_QWORD *)result = v2;
  *(_QWORD *)(result + 8) = a2[1];
  a2[1] = 0;
  v5 = a2[2];
  v3 = a2 + 2;
  v4 = v5;
  *(_QWORD *)(result + 16) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 16;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

char *std::vector<std::pair<int,mediaplatform::SearchMatcher::ReasonResult>>::__push_back_slow_path<std::pair<int,mediaplatform::SearchMatcher::ReasonResult>>(char **a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  char *v14;
  char *v15;

  v2 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) > 0x492492492492492)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 3) > v3)
    v3 = 0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 3);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((a1[2] - *a1) >> 3)) >= 0x249249249249249)
    v6 = 0x492492492492492;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0x492492492492492)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(56 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[56 * v2];
  v9 = &v7[56 * v6];
  *(_DWORD *)v8 = *(_DWORD *)a2;
  *((_DWORD *)v8 + 2) = *(_DWORD *)(a2 + 8);
  std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__hash_table((uint64_t)(v8 + 16), (uint64_t *)(a2 + 16));
  v10 = v8 + 56;
  v12 = *a1;
  v11 = a1[1];
  if (v11 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    if (!v11)
      return v10;
    goto LABEL_16;
  }
  do
  {
    v13 = *((_DWORD *)v11 - 14);
    v11 -= 56;
    *((_DWORD *)v8 - 14) = v13;
    v8 -= 56;
    *((_DWORD *)v8 + 2) = *((_DWORD *)v11 + 2);
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__hash_table((uint64_t)(v8 + 16), (uint64_t *)v11 + 2);
  }
  while (v11 != v12);
  v11 = *a1;
  v14 = a1[1];
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v9;
  if (v14 != v11)
  {
    do
    {
      v15 = v14 - 56;
      std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table((uint64_t)(v14 - 40));
      v14 = v15;
    }
    while (v15 != v11);
  }
  if (v11)
LABEL_16:
    operator delete(v11);
  return v10;
}

void std::__shared_ptr_emplace<std::vector<std::pair<int,mediaplatform::SearchMatcher::ReasonResult>>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D748;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<std::pair<int,mediaplatform::SearchMatcher::ReasonResult>>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D748;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void std::__shared_ptr_emplace<std::vector<std::pair<int,mediaplatform::SearchMatcher::ReasonResult>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 24);
    if (v3 != v1)
    {
      do
      {
        v5 = v3 - 56;
        std::__hash_table<mlcore::ModelPropertyBase *,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,std::allocator<mlcore::ModelPropertyBase *>>::~__hash_table(v3 - 40);
        v3 = v5;
      }
      while (v5 != v1);
      v4 = *(void **)(a1 + 24);
    }
    *(_QWORD *)(a1 + 32) = v1;
    operator delete(v4);
  }
}

void std::__function::__func<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL),std::allocator<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL)>,std::shared_ptr<mediaplatform::DatabaseConnection> ()(mediaplatform::FilePath const&,BOOL)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL),std::allocator<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL)>,std::shared_ptr<mediaplatform::DatabaseConnection> ()(mediaplatform::FilePath const&,BOOL)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C33AC70;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL),std::allocator<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL)>,std::shared_ptr<mediaplatform::DatabaseConnection> ()(mediaplatform::FilePath const&,BOOL)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000020A91DE5ELL))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL),std::allocator<std::shared_ptr<mediaplatform::DatabaseConnection> (*)(mediaplatform::FilePath const&,BOOL)>,std::shared_ptr<mediaplatform::DatabaseConnection> ()(mediaplatform::FilePath const&,BOOL)>::target_type()
{
}

uint64_t mlcore::LocalLibrary::databasePath(mlcore::LocalLibrary *this)
{
  return (uint64_t)this + 152;
}

uint64_t mlcore::LocalLibrary::connectionPool(mlcore::LocalLibrary *this)
{
  return (uint64_t)this + 184;
}

uint64_t mlcore::LocalLibrary::languageResources(mlcore::LocalLibrary *this)
{
  return (uint64_t)this + 280;
}

void mlcore::SQLShortColumnNameFromProperty(mlcore *this@<X0>, const mlcore::ModelPropertyBase *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  std::string __p;

  v4 = (*(uint64_t (**)(mlcore *, const mlcore::ModelPropertyBase *))(*(_QWORD *)this + 72))(this, a2);
  if (*(char *)(v4 + 31) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v4 + 8), *(_QWORD *)(v4 + 16));
  else
    __p = *(std::string *)(v4 + 8);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,void>(a3, (__int128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8F9F1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,void>(_QWORD *a1, __int128 *a2)
{
  _QWORD *v4;
  void *__p[2];
  char v6;
  void *v7[2];
  char v8;
  void *v9[2];
  char v10;

  v4 = operator new(0x88uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24C33C130;
  std::string::basic_string[abi:ne180100]<0>(v9, "");
  std::string::basic_string[abi:ne180100]<0>(v7, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  mediaplatform::SQLColumnNameExpression::SQLColumnNameExpression((uint64_t)(v4 + 3), a2, (__int128 *)v9, (__int128 *)v7, (__int128 *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  if (v8 < 0)
    operator delete(v7[0]);
  if (v10 < 0)
    operator delete(v9[0]);
  *a1 = v4 + 3;
  a1[1] = v4;
}

void sub_20A8FA004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  std::__shared_weak_count *v27;
  void *v29;

  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  std::__shared_weak_count::~__shared_weak_count(v27);
  operator delete(v29);
  _Unwind_Resume(a1);
}

void mlcore::SQLColumnNameFromDatabaseTablePrimaryKey(mlcore *this@<X0>, _QWORD *a2@<X8>)
{
  __int128 *v4;
  __int128 *v5[3];
  __int128 **v6;

  v4 = (__int128 *)((char *)this + 8);
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)this + 24))(v5);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string &,std::string const&,void>(a2, v5[0], v4);
  v6 = v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
}

void sub_20A8FA0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::SQLShortColumnNameFromDatabaseTablePrimaryKey(mlcore *this@<X0>, _QWORD *a2@<X8>)
{
  __int128 *v4;
  __int128 *v5[3];
  __int128 **v6;

  v4 = (__int128 *)((char *)this + 8);
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)this + 24))(v5);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string &,std::string const&,void>(a2, v5[0], v4);
  v6 = v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
}

void sub_20A8FA13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::SQLBindParameterFromPersistentID(mlcore *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  char *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;

  v4 = operator new(0x28uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24C33BD40;
  v4[4] = this;
  *((_QWORD *)&v9 + 1) = v4;
  v4[3] = &off_24C335D48;
  *(_QWORD *)&v9 = v4 + 3;
  v5 = (char *)operator new(0x30uLL);
  *(_OWORD *)(v5 + 8) = 0u;
  *((_QWORD *)v5 + 3) = &off_24C3311D8;
  *(_QWORD *)v5 = &off_24C33BFE0;
  *((_OWORD *)v5 + 2) = v9;
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    do
      v8 = __ldaxr(v6);
    while (__stlxr(v8 - 1, v6));
    if (!v8)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v9 + 1) + 16))(*((_QWORD *)&v9 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v9 + 1));
    }
  }
  *a2 = v5 + 24;
  a2[1] = v5;
}

void sub_20A8FA284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void **mlcore::OrderedSet<std::shared_ptr<mediaplatform::SQLJoinClause const>,mlcore::hash,mlcore::equal>::~OrderedSet(void **a1)
{
  void **v3;

  std::__hash_table<std::shared_ptr<mediaplatform::SQLJoinClause const>,mlcore::hash,mlcore::equal,std::allocator<std::shared_ptr<mediaplatform::SQLJoinClause const>>>::~__hash_table((uint64_t)(a1 + 3));
  v3 = a1;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  return a1;
}

uint64_t mediaplatform::ContentBundle::ContentBundle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 **a5)
{
  *(_QWORD *)a1 = &off_24C331570;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 8), *(__int128 **)(a2 + 8), *(__int128 **)(a2 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3));
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 32) = &off_24C331570;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 40), *(__int128 **)(a3 + 8), *(__int128 **)(a3 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8)) >> 3));
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 64) = &off_24C331570;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 72), *(__int128 **)(a4 + 8), *(__int128 **)(a4 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 16) - *(_QWORD *)(a4 + 8)) >> 3));
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 96), *a5, a5[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a5[1] - (char *)*a5) >> 3));
  return a1;
}

void sub_20A8FA3D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _QWORD *v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  v2[8] = v3;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v2[4] = v3;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  *v2 = v3;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::ContentBundle::cachePath(mediaplatform::ContentBundle *this)
{
  return (uint64_t)this + 32;
}

uint64_t mediaplatform::ContentBundle::resourcesPath(mediaplatform::ContentBundle *this)
{
  return (uint64_t)this + 64;
}

uint64_t mediaplatform::ContentBundle::languageOrdering(mediaplatform::ContentBundle *this)
{
  return (uint64_t)this + 96;
}

uint64_t *mediaplatform::ContentBundle::pathForResource@<X0>(uint64_t a1@<X0>, std::string *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  mediaplatform::PlatformErrorCondition *exception;
  int v8;
  void (**v9)(mediaplatform::FilePath *__hidden);
  uint64_t v10;
  std::string v11;
  void (**v12)(mediaplatform::File *__hidden);
  uint64_t v13;

  mediaplatform::FilePath::operator+(a1 + 64, a2, (uint64_t)&v9);
  mediaplatform::File::File((mediaplatform::File *)&v12, (const mediaplatform::FilePath *)&v9);
  v9 = &off_24C331570;
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
  if (!mediaplatform::File::exists((mediaplatform::FilePath **)&v12))
  {
    mediaplatform::FormatString<std::string>(&v11, (std::string *)"Cannot find resource file named {0}", (uint64_t)a2);
    v8 = 2;
    mediaplatform::PlatformErrorCondition::PlatformErrorCondition((uint64_t)&v9, &v8, (__int128 *)&v11);
    exception = (mediaplatform::PlatformErrorCondition *)__cxa_allocate_exception(0x40uLL);
    mediaplatform::PlatformErrorCondition::PlatformErrorCondition(exception, (const mediaplatform::PlatformErrorCondition *)&v9);
  }
  v5 = v13;
  *(_QWORD *)a3 = &off_24C331570;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a3 + 8), *(__int128 **)(v5 + 8), *(__int128 **)(v5 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v5 + 16) - *(_QWORD *)(v5 + 8)) >> 3));
  v12 = &off_24C331550;
  return std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100](&v13);
}

void sub_20A8FA558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(&a10);
  if (a23 < 0)
    operator delete(__p);
  *(_QWORD *)(v23 - 48) = &off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100]((uint64_t *)(v23 - 40));
  _Unwind_Resume(a1);
}

void mlcore::Album::~Album(mlcore::Album *this)
{
  *(_QWORD *)this = off_24C33A860;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((_QWORD *)this + 1);
}

{
  *(_QWORD *)this = off_24C33A860;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((_QWORD *)this + 1);
  JUMPOUT(0x20BD27AFCLL);
}

{
  *(_QWORD *)this = off_24C33A860;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((_QWORD *)this + 1);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyPersistentID(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::persistentIDColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<long long>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyPersistentID(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyPersistentID(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyPersistentID(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "persistentID");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FA824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyTitle(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __str;
  _QWORD v23[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v23[0] = *v1;
  v23[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::titleColumn(*v5, (uint64_t)&__str);
  mlcore::DatabaseModelProperty<std::string>::DatabaseModelProperty(v0, v23, (uint64_t)&__str);
  mlcore::AlbumPropertyTitle(void)::property = v0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&__str);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyTitle(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::operator=((std::string *)(v8 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyTitle(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "title");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FAAAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t mlcore::AlbumPropertySortTitle(mlcore *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&mlcore::AlbumPropertySortTitle(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&mlcore::AlbumPropertySortTitle(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertySortTitle(void)::$_0 &&>>);
  }
  return mlcore::AlbumPropertySortTitle(void)::property;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertySortTitle(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __str;
  _QWORD v23[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v23[0] = *v1;
  v23[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::sortTitleColumn(*v5, (uint64_t)&__str);
  mlcore::DatabaseModelProperty<std::string>::DatabaseModelProperty(v0, v23, (uint64_t)&__str);
  mlcore::AlbumPropertySortTitle(void)::property = v0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&__str);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertySortTitle(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::operator=((std::string *)(v8 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertySortTitle(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "sortTitle");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FAD88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyHasTitle(void)::$_0 &&>>()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::string __str;

  v0 = operator new();
  v1 = mlcore::AlbumPropertyOrder((mlcore *)v0);
  v2 = (char *)operator new(0x48uLL);
  v3 = (std::__shared_weak_count *)v2;
  *(_OWORD *)(v2 + 8) = 0u;
  v4 = (unint64_t *)(v2 + 8);
  *(_QWORD *)v2 = &off_24C33CE88;
  *((_QWORD *)v2 + 4) = v1;
  *((_QWORD *)v2 + 5) = 0x100000000;
  *((_QWORD *)v2 + 3) = &unk_24C339CA8;
  *((_QWORD *)v2 + 6) = 0;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C3398B8;
  *(_QWORD *)(v0 + 64) = v2 + 24;
  *(_QWORD *)(v0 + 72) = v2;
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  mlcore::AlbumPropertyHasTitle(void)::property = v0;
  do
    v6 = __ldaxr(v4);
  while (__stlxr(v6 - 1, v4));
  if (!v6)
  {
    (*(void (**)(char *))(*(_QWORD *)v2 + 16))(v2);
    std::__shared_weak_count::__release_weak(v3);
  }
  v7 = mlcore::AlbumPropertyHasTitle(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "has_title");
  std::string::operator=((std::string *)(v7 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v8 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v9 = mlcore::AlbumPropertyHasTitle(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "hasTitle");
  mlcore::EntityClass::setPropertyForName(v8, v9, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_20A8FAFA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyRepresentativeItemPersistentID(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::representativeItemPersistentIDColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<long long>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyRepresentativeItemPersistentID(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyRepresentativeItemPersistentID(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyRepresentativeItemPersistentID(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "representativeItemPersistentID");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FB1B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyArtistPersistentID(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::albumArtistPersistentIDColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<long long>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyArtistPersistentID(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyArtistPersistentID(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyArtistPersistentID(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "albumArtist");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FB448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t mlcore::AlbumPropertyUserRating(mlcore *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&mlcore::AlbumPropertyUserRating(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&mlcore::AlbumPropertyUserRating(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyUserRating(void)::$_0 &&>>);
  }
  return mlcore::AlbumPropertyUserRating(void)::property;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyUserRating(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::userRatingColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyUserRating(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyUserRating(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyUserRating(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "userRating");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FB734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyAllCompilations(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::allCompilationsColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyAllCompilations(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyAllCompilations(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyAllCompilations(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "allCompilations");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FB9C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyFeedURL(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __str;
  _QWORD v23[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v23[0] = *v1;
  v23[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::feedURLColumn(*v5, (uint64_t)&__str);
  mlcore::DatabaseModelProperty<std::string>::DatabaseModelProperty(v0, v23, (uint64_t)&__str);
  mlcore::AlbumPropertyFeedURL(void)::property = v0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&__str);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyFeedURL(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::operator=((std::string *)(v8 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyFeedURL(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "feedURL");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FBC4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertySeasonNumber(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::seasonNumberColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertySeasonNumber(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertySeasonNumber(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertySeasonNumber(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "seasonNumber");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FBED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t mlcore::AlbumPropertyGroupingKey(mlcore *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&mlcore::AlbumPropertyGroupingKey(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&mlcore::AlbumPropertyGroupingKey(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyGroupingKey(void)::$_0 &&>>);
  }
  return mlcore::AlbumPropertyGroupingKey(void)::property;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyGroupingKey(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __str;
  _QWORD v23[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v23[0] = *v1;
  v23[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::groupingKeyColumn(*v5, (uint64_t)&__str);
  mlcore::DatabaseModelProperty<mediaplatform::Data>::DatabaseModelProperty(v0, v23, (uint64_t)&__str);
  mlcore::AlbumPropertyGroupingKey(void)::property = v0;
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn((uint64_t)&__str);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyGroupingKey(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::operator=((std::string *)(v8 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyGroupingKey(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "groupingKey");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FC1B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyYear(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::albumYearColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyYear(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyYear(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyYear(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "year");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FC440(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyLikedState(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::likedStateColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyLikedState(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyLikedState(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyLikedState(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "likedState");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FC6D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyLikedStateChangedDate(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::likedStateChangedDateColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<long long>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyLikedStateChangedDate(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyLikedStateChangedDate(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyLikedStateChangedDate(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "likedStateChangedDate");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FC960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyAppData(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __str;
  _QWORD v23[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v23[0] = *v1;
  v23[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::appDataColumn(*v5, (uint64_t)&__str);
  mlcore::DatabaseModelProperty<mediaplatform::Data>::DatabaseModelProperty(v0, v23, (uint64_t)&__str);
  mlcore::AlbumPropertyAppData(void)::property = v0;
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn((uint64_t)&__str);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyAppData(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::operator=((std::string *)(v8 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyAppData(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "appData");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FCBE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyItemCount(void)::$_0 &&>>()
{
  uint64_t v0;
  mlcore *v1;
  mlcore *v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  std::__shared_weak_count *size;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::string __p;
  __int128 v18;

  v0 = operator new();
  v1 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
  v2 = (mlcore *)mlcore::ItemPropertyAlbumPersistentID(v1);
  v3 = mlcore::AlbumPropertyPersistentID(v2);
  v4 = operator new(0x38uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24C33D240;
  v4[4] = v2;
  v4[5] = 0;
  v4[3] = &off_24C33A5A8;
  v4[6] = v3;
  *(_QWORD *)&v18 = v4 + 3;
  *((_QWORD *)&v18 + 1) = v4;
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::ComparisonPropertyPredicate>,void>(&__p, (uint64_t)v1, 0, &v18);
  v5 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C337228;
  *(_OWORD *)(v0 + 64) = v5;
  if (*((_QWORD *)&v5 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v5 + 1) + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    mlcore::AlbumPropertyItemCount(void)::property = v0;
    do
      v8 = __ldaxr(v6);
    while (__stlxr(v8 - 1, v6));
    if (!v8)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v5 + 1) + 16))(*((_QWORD *)&v5 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v5 + 1));
    }
  }
  else
  {
    mlcore::AlbumPropertyItemCount(void)::property = v0;
  }
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v10 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v16 = mlcore::AlbumPropertyItemCount(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "itemCount");
  mlcore::EntityClass::setPropertyForName(v15, v16, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8FCE64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyKeepLocal(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::keepLocalColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyKeepLocal(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyKeepLocal(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyKeepLocal(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "keepLocal");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FD0BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyKeepLocalStatus(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::keepLocalStatusColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyKeepLocalStatus(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyKeepLocalStatus(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyKeepLocalStatus(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "keepLocalStatus");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FD34C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyKeepLocalStatusReason(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::keepLocalStatusReasonColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyKeepLocalStatusReason(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyKeepLocalStatusReason(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyKeepLocalStatusReason(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "keepLocalStatusReason");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FD5DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyKeepLocalConstraints(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::keepLocalConstraintsColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyKeepLocalConstraints(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyKeepLocalConstraints(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyKeepLocalConstraints(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "keepLocalConstraints");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FD86C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t mlcore::AlbumPropertyIsKeepLocalEnabled(mlcore *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&mlcore::AlbumPropertyIsKeepLocalEnabled(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&mlcore::AlbumPropertyIsKeepLocalEnabled(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyIsKeepLocalEnabled(void)::$_0 &&>>);
  }
  return mlcore::AlbumPropertyIsKeepLocalEnabled(void)::property;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyIsKeepLocalEnabled(void)::$_0 &&>>()
{
  mlcore *v0;
  uint64_t v1;
  _QWORD *v2;
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::string __p;
  __int128 v15;

  v0 = (mlcore *)operator new();
  v1 = mlcore::AlbumPropertyKeepLocal(v0);
  v2 = operator new(8uLL);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v2;
  *v2 = 0x200000001;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v2 + 1);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v2 + 1);
  std::allocate_shared[abi:ne180100]<mlcore::InPredicate<int>,std::allocator<mlcore::InPredicate<int>>,mlcore::ModelProperty<int> *&,std::vector<int> const&,void>((uint64_t *)&v15, v1, (int **)&__p);
  v3 = v15;
  v15 = 0uLL;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *(_QWORD *)v0 = &off_24C3398B8;
  *((_OWORD *)v0 + 3) = 0u;
  *((_OWORD *)v0 + 4) = v3;
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v3 + 1);
  if (*((_QWORD *)&v3 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v3 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
    mlcore::AlbumPropertyIsKeepLocalEnabled(void)::property = (uint64_t)v0;
    do
      v7 = __ldaxr(v5);
    while (__stlxr(v7 - 1, v5));
    if (!v7)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v3 + 1) + 16))(*((_QWORD *)&v3 + 1));
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  else
  {
    mlcore::AlbumPropertyIsKeepLocalEnabled(void)::property = (uint64_t)v0;
  }
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
  if (*((_QWORD *)&v15 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v11 = mlcore::AlbumPropertyIsKeepLocalEnabled(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "is_keeplocal_enabled");
  std::string::operator=((std::string *)(v11 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v12 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v13 = mlcore::AlbumPropertyIsKeepLocalEnabled(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "isKeepLocalEnabled");
  mlcore::EntityClass::setPropertyForName(v12, v13, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8FDB28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyContainsClassicalWork(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::containsClassicalWorkColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyContainsClassicalWork(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyContainsClassicalWork(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyContainsClassicalWork(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "containsClassicalWork");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FDD58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyDatePlayedLocal(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::datePlayedLocalColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<long long>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyDatePlayedLocal(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyDatePlayedLocal(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyDatePlayedLocal(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "datePlayedLocal");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FDFE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertySyncID(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::syncIDColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<long long>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertySyncID(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertySyncID(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertySyncID(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "syncID");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FE278(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyClassicalExperienceAvailable(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __p;
  char v23;
  _QWORD v24[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v24[0] = *v1;
  v24[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::classicalExperienceAvailableColumn(*v5, (uint64_t)&__p);
  mlcore::DatabaseModelProperty<int>::DatabaseModelProperty(v0, v24, (uint64_t)&__p);
  mlcore::AlbumPropertyClassicalExperienceAvailable(void)::property = v0;
  if (v23 < 0)
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyClassicalExperienceAvailable(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::operator=((std::string *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyClassicalExperienceAvailable(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "classicalExperienceAvailable");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FE508(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, void *a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyCloudLibraryID(void)::$_0 &&>>()
{
  uint64_t v0;
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  mlcore::AlbumTable **v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  std::string *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  std::string v21;
  std::string __str;
  _QWORD v23[2];

  v0 = operator new();
  v1 = (_QWORD *)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v2 = (std::__shared_weak_count *)v1[1];
  v23[0] = *v1;
  v23[1] = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v5 = (mlcore::AlbumTable **)mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  mlcore::AlbumTable::cloudLibraryIDColumn(*v5, (uint64_t)&__str);
  mlcore::DatabaseModelProperty<std::string>::DatabaseModelProperty(v0, v23, (uint64_t)&__str);
  mlcore::AlbumPropertyCloudLibraryID(void)::property = v0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&__str);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v8 = mlcore::AlbumPropertyCloudLibraryID(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::operator=((std::string *)(v8 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v9 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v10 = mlcore::AlbumPropertyCloudLibraryID(void)::property;
  v11 = mediaplatform::Singleton<mlcore::AlbumTable>::sharedInstance();
  v12 = *(_QWORD *)v11;
  if (*(char *)(*(_QWORD *)v11 + 31) >= 0)
    v13 = *(unsigned __int8 *)(*(_QWORD *)v11 + 31);
  else
    v13 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  v14 = &v21;
  std::string::basic_string[abi:ne180100]((uint64_t)&v21, v13 + 1);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if (v13)
  {
    v17 = *(char **)(v12 + 8);
    v16 = (char *)(v12 + 8);
    v15 = v17;
    if (v16[23] >= 0)
      v18 = v16;
    else
      v18 = v15;
    memmove(v14, v18, v13);
  }
  *(_WORD *)((char *)&v14->__r_.__value_.__l.__data_ + v13) = 46;
  v19 = std::string::append(&v21, "cloudLibraryID");
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  mlcore::EntityClass::setPropertyForName(v9, v10, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_20A8FE790(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyLatestItemDateAdded(void)::$_0 &&>>()
{
  uint64_t v0;
  mlcore *v1;
  mlcore *v2;
  mlcore *v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *size;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::string __p;
  __int128 v19;

  v0 = operator new();
  v1 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
  v2 = (mlcore *)mlcore::ItemPropertyDateAdded(v1);
  v3 = (mlcore *)mlcore::ItemPropertyAlbumPersistentID(v2);
  v4 = mlcore::AlbumPropertyPersistentID(v3);
  v5 = operator new(0x38uLL);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = &off_24C33D240;
  v5[4] = v3;
  v5[5] = 0;
  v5[3] = &off_24C33A5A8;
  v5[6] = v4;
  *(_QWORD *)&v19 = v5 + 3;
  *((_QWORD *)&v19 + 1) = v5;
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,mlcore::ModelProperty<long long> *,std::shared_ptr<mlcore::ComparisonPropertyPredicate>,void>(&__p, (uint64_t)v1, 2, (uint64_t)v2, &v19);
  v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C337228;
  *(_OWORD *)(v0 + 64) = v6;
  if (*((_QWORD *)&v6 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    mlcore::AlbumPropertyLatestItemDateAdded(void)::property = v0;
    do
      v9 = __ldaxr(v7);
    while (__stlxr(v9 - 1, v7));
    if (!v9)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v6 + 1) + 16))(*((_QWORD *)&v6 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v6 + 1));
    }
  }
  else
  {
    mlcore::AlbumPropertyLatestItemDateAdded(void)::property = v0;
  }
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v11 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v17 = mlcore::AlbumPropertyLatestItemDateAdded(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "latestItemDateAdded");
  mlcore::EntityClass::setPropertyForName(v16, v17, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8FEA20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyVolumeNormalization(void)::$_0 &&>>()
{
  uint64_t v0;
  mlcore *v1;
  mlcore *v2;
  mlcore *v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *size;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::string __p;
  __int128 v19;

  v0 = operator new();
  v1 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
  v2 = (mlcore *)mlcore::ItemPropertyVolumeNormalization(v1);
  v3 = (mlcore *)mlcore::ItemPropertyAlbumPersistentID(v2);
  v4 = mlcore::AlbumPropertyPersistentID(v3);
  v5 = operator new(0x38uLL);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = &off_24C33D240;
  v5[4] = v3;
  v5[5] = 0;
  v5[3] = &off_24C33A5A8;
  v5[6] = v4;
  *(_QWORD *)&v19 = v5 + 3;
  *((_QWORD *)&v19 + 1) = v5;
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,mlcore::ModelProperty<int> *,std::shared_ptr<mlcore::ComparisonPropertyPredicate>,void>(&__p, (uint64_t)v1, 3, (uint64_t)v2, &v19);
  v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C337228;
  *(_OWORD *)(v0 + 64) = v6;
  if (*((_QWORD *)&v6 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    mlcore::AlbumPropertyVolumeNormalization(void)::property = v0;
    do
      v9 = __ldaxr(v7);
    while (__stlxr(v9 - 1, v7));
    if (!v9)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v6 + 1) + 16))(*((_QWORD *)&v6 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v6 + 1));
    }
  }
  else
  {
    mlcore::AlbumPropertyVolumeNormalization(void)::property = v0;
  }
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v11 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v17 = mlcore::AlbumPropertyVolumeNormalization(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "volumeNormalization");
  mlcore::EntityClass::setPropertyForName(v16, v17, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8FEC84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,mlcore::ModelProperty<int> *,std::shared_ptr<mlcore::ComparisonPropertyPredicate>,void>(_QWORD *a1, uint64_t a2, int a3, uint64_t a4, __int128 *a5)
{
  char *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  __int128 v14;

  v10 = (char *)operator new(0x60uLL);
  *(_OWORD *)(v10 + 8) = 0u;
  *(_QWORD *)v10 = &off_24C33D080;
  v14 = *a5;
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
  *a5 = 0u;
  mlcore::AggregateFunctionQuery::AggregateFunctionQuery((uint64_t)(v10 + 24), a2, a3, a4, (uint64_t *)&v14, 0);
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  *a1 = v10 + 24;
  a1[1] = v10;
}

void sub_20A8FEDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  std::__shared_weak_count *v3;
  void *v5;
  va_list va;

  va_start(va, a3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::__shared_weak_count::~__shared_weak_count(v3);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyMaximumItemTrackNumber(void)::$_0 &&>>()
{
  uint64_t v0;
  mlcore *v1;
  mlcore *v2;
  mlcore *v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *size;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::string __p;
  __int128 v19;

  v0 = operator new();
  v1 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
  v2 = (mlcore *)mlcore::ItemPropertyTrackNumber(v1);
  v3 = (mlcore *)mlcore::ItemPropertyAlbumPersistentID(v2);
  v4 = mlcore::AlbumPropertyPersistentID(v3);
  v5 = operator new(0x38uLL);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = &off_24C33D240;
  v5[4] = v3;
  v5[5] = 0;
  v5[3] = &off_24C33A5A8;
  v5[6] = v4;
  *(_QWORD *)&v19 = v5 + 3;
  *((_QWORD *)&v19 + 1) = v5;
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,mlcore::ModelProperty<int> *,std::shared_ptr<mlcore::ComparisonPropertyPredicate>,void>(&__p, (uint64_t)v1, 2, (uint64_t)v2, &v19);
  v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C337228;
  *(_OWORD *)(v0 + 64) = v6;
  if (*((_QWORD *)&v6 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    mlcore::AlbumPropertyMaximumItemTrackNumber(void)::property = v0;
    do
      v9 = __ldaxr(v7);
    while (__stlxr(v9 - 1, v7));
    if (!v9)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v6 + 1) + 16))(*((_QWORD *)&v6 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v6 + 1));
    }
  }
  else
  {
    mlcore::AlbumPropertyMaximumItemTrackNumber(void)::property = v0;
  }
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v11 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v17 = mlcore::AlbumPropertyMaximumItemTrackNumber(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "maximumItemTrackNumber");
  mlcore::EntityClass::setPropertyForName(v16, v17, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8FEFE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyDateDownloaded(void)::$_0 &&>>()
{
  uint64_t v0;
  mlcore *v1;
  mlcore *v2;
  mlcore *v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  std::__shared_weak_count *size;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::string __p;
  __int128 v19;

  v0 = operator new();
  v1 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
  v2 = (mlcore *)mlcore::ItemPropertyDateDownloaded(v1);
  v3 = (mlcore *)mlcore::ItemPropertyAlbumPersistentID(v2);
  v4 = mlcore::AlbumPropertyPersistentID(v3);
  v5 = operator new(0x38uLL);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = &off_24C33D240;
  v5[4] = v3;
  v5[5] = 0;
  v5[3] = &off_24C33A5A8;
  v5[6] = v4;
  *(_QWORD *)&v19 = v5 + 3;
  *((_QWORD *)&v19 + 1) = v5;
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,mlcore::ModelProperty<long long> *,std::shared_ptr<mlcore::ComparisonPropertyPredicate>,void>(&__p, (uint64_t)v1, 2, (uint64_t)v2, &v19);
  v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C337228;
  *(_OWORD *)(v0 + 64) = v6;
  if (*((_QWORD *)&v6 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    mlcore::AlbumPropertyDateDownloaded(void)::property = v0;
    do
      v9 = __ldaxr(v7);
    while (__stlxr(v9 - 1, v7));
    if (!v9)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v6 + 1) + 16))(*((_QWORD *)&v6 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v6 + 1));
    }
  }
  else
  {
    mlcore::AlbumPropertyDateDownloaded(void)::property = v0;
  }
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v11 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v17 = mlcore::AlbumPropertyDateDownloaded(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "dateDownloaded");
  mlcore::EntityClass::setPropertyForName(v16, v17, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8FF244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyPreOrderItemCount(void)::$_0 &&>>()
{
  uint64_t v0;
  mlcore *v1;
  mlcore *v2;
  uint64_t v3;
  mlcore *v4;
  __int128 v5;
  uint64_t IsPreorder;
  char *v7;
  __int128 v8;
  __int128 *v9;
  char v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  __int128 **v35;
  char v36;
  void *__p[2];
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v0 = operator new();
  v1 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
  v2 = (mlcore *)mlcore::ItemPropertyAlbumPersistentID(v1);
  v3 = mlcore::AlbumPropertyPersistentID(v2);
  v4 = (mlcore *)operator new(0x38uLL);
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = &off_24C33D240;
  *((_QWORD *)v4 + 4) = v2;
  *((_QWORD *)v4 + 5) = 0;
  *((_QWORD *)v4 + 3) = &off_24C33A5A8;
  *((_QWORD *)v4 + 6) = v3;
  *(_QWORD *)&v5 = (char *)v4 + 24;
  *((_QWORD *)&v5 + 1) = v4;
  *(_OWORD *)__p = v5;
  IsPreorder = mlcore::ItemPropertyIsPreorder(v4);
  v7 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v7 + 8) = 0u;
  *(_QWORD *)v7 = &off_24C33CE50;
  *((_QWORD *)v7 + 4) = IsPreorder;
  *((_QWORD *)v7 + 5) = 0;
  *((_QWORD *)v7 + 3) = &unk_24C339C50;
  *((_DWORD *)v7 + 12) = 1;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_QWORD *)&v8 = v7 + 24;
  *((_QWORD *)&v8 + 1) = v7;
  v38 = v8;
  v30 = 0;
  v31 = 0u;
  v35 = &v30;
  v36 = 0;
  v9 = (__int128 *)operator new(0x20uLL);
  v10 = 0;
  v11 = 0;
  v30 = v9;
  *(_QWORD *)&v31 = v9;
  *((_QWORD *)&v31 + 1) = v9 + 2;
  do
  {
    v12 = v10;
    v13 = *(_OWORD *)&__p[2 * v11];
    *v9 = v13;
    if (*((_QWORD *)&v13 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    ++v9;
    v10 = 1;
    v11 = 1;
  }
  while ((v12 & 1) == 0);
  *(_QWORD *)&v31 = v9;
  mlcore::CreateAndPredicate(&v30, &v32);
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::Predicate>,void>(&v33, (uint64_t)v1, 0, &v32);
  v16 = v33;
  v17 = v34;
  v33 = 0;
  v34 = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C337228;
  *(_QWORD *)(v0 + 64) = v16;
  *(_QWORD *)(v0 + 72) = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
    mlcore::AlbumPropertyPreOrderItemCount(void)::property = v0;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  else
  {
    mlcore::AlbumPropertyPreOrderItemCount(void)::property = v0;
  }
  v21 = v34;
  if (v34)
  {
    v22 = (unint64_t *)&v34->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v35 = &v30;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
  for (i = 2; i != -2; i -= 2)
    std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&__p[i]);
  v28 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v29 = mlcore::AlbumPropertyPreOrderItemCount(void)::property;
  std::string::basic_string[abi:ne180100]<0>(__p, "preOrderItemCount");
  mlcore::EntityClass::setPropertyForName(v28, v29, (std::string *)__p);
  if (SBYTE7(v38) < 0)
    operator delete(__p[0]);
}

void sub_20A8FF5C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyIsPreOrder(void)::$_0 &&>>()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::string __str;

  v0 = operator new();
  v1 = mlcore::AlbumPropertyPreOrderItemCount((mlcore *)v0);
  v2 = (char *)operator new(0x48uLL);
  v3 = (std::__shared_weak_count *)v2;
  *(_OWORD *)(v2 + 8) = 0u;
  v4 = (unint64_t *)(v2 + 8);
  *(_QWORD *)v2 = &off_24C33CE88;
  *((_QWORD *)v2 + 4) = v1;
  *((_QWORD *)v2 + 5) = 0x200000000;
  *((_QWORD *)v2 + 3) = &unk_24C339CA8;
  *((_QWORD *)v2 + 6) = 0;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)v0 = &off_24C3398B8;
  *(_QWORD *)(v0 + 64) = v2 + 24;
  *(_QWORD *)(v0 + 72) = v2;
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  mlcore::AlbumPropertyIsPreOrder(void)::property = v0;
  do
    v6 = __ldaxr(v4);
  while (__stlxr(v6 - 1, v4));
  if (!v6)
  {
    (*(void (**)(char *))(*(_QWORD *)v2 + 16))(v2);
    std::__shared_weak_count::__release_weak(v3);
  }
  v7 = mlcore::AlbumPropertyIsPreOrder(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "is_album_preorder");
  std::string::operator=((std::string *)(v7 + 40), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v8 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v9 = mlcore::AlbumPropertyIsPreOrder(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__str, "isPreOrder");
  mlcore::EntityClass::setPropertyForName(v8, v9, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_20A8FF834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<mlcore::AlbumPropertyStoreID(void)::$_0 &&>>()
{
  uint64_t v0;
  mlcore *v1;
  mlcore *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  __int128 v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  mlcore *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  std::string __p;

  v0 = operator new();
  v1 = (mlcore *)mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
  v2 = (mlcore *)mlcore::ItemPropertyAlbumPersistentID(v1);
  v3 = mlcore::AlbumPropertyPersistentID(v2);
  v4 = (std::__shared_weak_count *)operator new(0x38uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D240;
  v4[1].__shared_owners_ = (uint64_t)v2;
  v4[1].__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)&off_24C33A5A8;
  v4[2].__vftable = (std::__shared_weak_count_vtbl *)v3;
  *(_QWORD *)&v6 = v4 + 1;
  *((_QWORD *)&v6 + 1) = v4;
  v17 = v6;
  v7 = (std::__shared_weak_count *)operator new(0x80uLL);
  v7->__shared_owners_ = 0;
  v8 = (unint64_t *)&v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CB40;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v17;
  v9 = (mlcore *)mlcore::PropertiesQuery::PropertiesQuery((uint64_t)&v7[1], (uint64_t)v1, (uint64_t *)&__p);
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  v11 = mlcore::ItemPropertyStorePlaylistID(v9);
  v12 = (char *)operator new(8uLL);
  *(_QWORD *)v12 = v11;
  std::vector<mlcore::ModelPropertyBase *>::__assign_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>((char *)&v7[4].__shared_owners_, v12, (uint64_t)(v12 + 8), 1uLL);
  operator delete(v12);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_QWORD *)v0 = &off_24C337228;
  *(_QWORD *)(v0 + 64) = v7 + 1;
  *(_QWORD *)(v0 + 72) = v7;
  do
    v13 = __ldxr(v8);
  while (__stxr(v13 + 1, v8));
  mlcore::AlbumPropertyStoreID(void)::property = v0;
  do
    v14 = __ldaxr(v8);
  while (__stlxr(v14 - 1, v8));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  v15 = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
  v16 = mlcore::AlbumPropertyStoreID(void)::property;
  std::string::basic_string[abi:ne180100]<0>(&__p, "storeID");
  mlcore::EntityClass::setPropertyForName(v15, v16, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A8FFA68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t mlcore::AlbumPropertyOrderSection(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(this);
  v2 = mlcore::ItemPropertyAlbumOrderSection(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<int>((uint64_t)v1, v2, v4);
}

void sub_20A8FFB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyDateAdded(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(this);
  v2 = mlcore::ItemPropertyDateAdded(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<long long>((uint64_t)v1, v2, v4);
}

void sub_20A8FFBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemStoreCloudID(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(this);
  v2 = mlcore::ItemPropertyStoreCloudID(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<long long>((uint64_t)v1, v2, v4);
}

void sub_20A8FFC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyArtistName(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyArtistPersistentID(this);
  v2 = mlcore::ArtistPropertyName(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<std::string>((uint64_t)v1, v2, v4);
}

void sub_20A8FFC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyArtistSortName(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyArtistPersistentID(this);
  v2 = mlcore::ArtistPropertySortName(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<std::string>((uint64_t)v1, v2, v4);
}

void sub_20A8FFCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyGenreName(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyGenrePersistentID(this);
  v2 = mlcore::ItemPropertyGenreName(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<std::string>((uint64_t)v1, v2, v4);
}

void sub_20A8FFD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyArtistOrder(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(this);
  v2 = mlcore::ItemPropertyArtistOrder(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<long long>((uint64_t)v1, v2, v4);
}

void sub_20A8FFD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyArtistOrderSection(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(this);
  v2 = mlcore::ItemPropertyArtistOrderSection(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<int>((uint64_t)v1, v2, v4);
}

void sub_20A8FFDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t mlcore::AlbumPropertyRepresentativeItemInMyLibrary(mlcore *this)
{
  mlcore *v1;
  uint64_t v2;
  uint64_t v4[2];

  v1 = (mlcore *)mlcore::AlbumPropertyRepresentativeItemPersistentID(this);
  v2 = mlcore::ItemPropertyInMyLibrary(v1);
  v4[0] = 0;
  v4[1] = 0;
  return mlcore::GetForeignProperty<int>((uint64_t)v1, v2, v4);
}

void sub_20A8FFE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

double mlcore::Album::Album(mlcore::Album *this, uint64_t a2)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 1065353216;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_DWORD *)this + 32) = 1065353216;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *((_DWORD *)this + 42) = 1065353216;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_DWORD *)this + 52) = 1065353216;
  *((_QWORD *)this + 27) = &unk_24C3371E8;
  *((_QWORD *)this + 28) = a2;
  *(_QWORD *)this = &off_24C33A6A8;
  *((_QWORD *)this + 1) = &off_24C3371C0;
  return result;
}

{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 1065353216;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_DWORD *)this + 32) = 1065353216;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *((_DWORD *)this + 42) = 1065353216;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_DWORD *)this + 52) = 1065353216;
  *((_QWORD *)this + 27) = &unk_24C3371E8;
  *((_QWORD *)this + 28) = a2;
  *(_QWORD *)this = &off_24C33A6A8;
  *((_QWORD *)this + 1) = &off_24C3371C0;
  return result;
}

void mlcore::Album::title(mlcore::Album *this@<X0>, std::string *a2@<X8>)
{
  unint64_t v4;

  v4 = mlcore::AlbumPropertyTitle(this);
  mlcore::Entity::valueForProperty<std::string>(a2, (uint64_t)this, v4);
}

void mlcore::Album::setTitle(mlcore *a1, uint64_t a2)
{
  std::string::size_type v4;

  v4 = mlcore::AlbumPropertyTitle(a1);
  mlcore::Entity::setValueForProperty<std::string>((uint64_t)a1, a2, v4);
}

uint64_t mlcore::TypedEntityClass<mlcore::Album>::isCloudUpdatable()
{
  return 1;
}

uint64_t mlcore::TypedEntityClass<mlcore::Album>::sectionPropertyForOrderingProperty(mlcore *a1, mlcore *a2)
{
  mlcore *HasTitle;

  HasTitle = (mlcore *)mlcore::AlbumPropertyOrder(a1);
  if (HasTitle == a2)
    return mlcore::AlbumPropertyOrderSection(HasTitle);
  HasTitle = (mlcore *)mlcore::AlbumPropertyHasTitle(HasTitle);
  if (HasTitle == a2)
    return mlcore::AlbumPropertyOrderSection(HasTitle);
  else
    return 0;
}

void mlcore::TypedEntityClass<mlcore::Album>::databaseTablesToDeleteFrom(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void mlcore::TypedEntityClass<mlcore::Album>::databaseTablesToInsertInto(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void mediaplatform::SQLNullExpression::~SQLNullExpression(mediaplatform::SQLNullExpression *this)
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *mediaplatform::SQLNullExpression::sql@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "NULL");
}

void mediaplatform::SQLBindParameter::~SQLBindParameter(mediaplatform::SQLBindParameter *this)
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *mediaplatform::SQLBindParameter::sql@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "?");
}

void mediaplatform::SQLIndexedBindParameter::~SQLIndexedBindParameter(mediaplatform::SQLIndexedBindParameter *this)
{
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::SQLIndexedBindParameter::sql()
{
  _QWORD v1[11];
  char v2;
  uint64_t v3;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)"?", 1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v1 + *(_QWORD *)(v1[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v1[1] = MEMORY[0x24BEDB848] + 16;
  if (v2 < 0)
    operator delete((void *)v1[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x20BD27A84](&v3);
}

void sub_20A900110(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void mediaplatform::SQLNamedBindParameter::~SQLNamedBindParameter(void **this)
{
  *this = off_24C3312D8;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_24C3312D8;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::SQLNamedBindParameter::sql()
{
  return std::operator+<char>();
}

void mediaplatform::SQLColumnNameExpression::~SQLColumnNameExpression(void **this)
{
  *this = off_24C3313F0;
  if (*((char *)this + 103) < 0)
    operator delete(this[10]);
  if (*((char *)this + 79) < 0)
    operator delete(this[7]);
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_24C3313F0;
  if (*((char *)this + 103) < 0)
    operator delete(this[10]);
  if (*((char *)this + 79) < 0)
    operator delete(this[7]);
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLColumnNameExpression::sql(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v5;
  _OWORD *v6;
  int v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  int *v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  uint64_t v18;
  void *__p;
  char v20;
  _BYTE v21[152];

  if (*(char *)(a1 + 103) < 0)
  {
    v5 = *(_QWORD *)(a1 + 88);
    if (!a2)
    {
LABEL_10:
      mediaplatform::SQLColumnNameExpression::_unaliasedSQL(a1, &v17);
      std::stringbuf::str();
      v17 = *MEMORY[0x24BEDB800];
      *(uint64_t *)((char *)&v17 + *(_QWORD *)(v17 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
      v18 = MEMORY[0x24BEDB848] + 16;
      if (v20 < 0)
        operator delete(__p);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x20BD27A84](v21);
      return;
    }
  }
  else
  {
    v5 = *(unsigned __int8 *)(a1 + 103);
    if (!a2)
      goto LABEL_10;
  }
  if (!v5)
    goto LABEL_10;
  v6 = (_OWORD *)(a1 + 80);
  (*(void (**)(int **__return_ptr, uint64_t))(*(_QWORD *)a2 + 8))(&v15, a2);
  v7 = *v15;
  v8 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)v15 + 1, (unsigned __int8 *)(a1 + 80));
  if (!v7)
  {
    mediaplatform::SQLColumnNameExpression::_unaliasedSQL(a1, &v17);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)" AS ", 4);
    v9 = *(char *)(a1 + 103);
    if (v9 >= 0)
      v10 = a1 + 80;
    else
      v10 = *(_QWORD *)(a1 + 80);
    if (v9 >= 0)
      v11 = *(unsigned __int8 *)(a1 + 103);
    else
      v11 = *(_QWORD *)(a1 + 88);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, v10, v11);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)(v15 + 2), (unsigned __int8 *)(a1 + 80), a1 + 80);
    std::stringbuf::str();
    v17 = *MEMORY[0x24BEDB800];
    *(uint64_t *)((char *)&v17 + *(_QWORD *)(v17 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v18 = MEMORY[0x24BEDB848] + 16;
    if (v20 < 0)
      operator delete(__p);
    goto LABEL_24;
  }
  if (!v8)
  {
    mediaplatform::SQLColumnNameExpression::_unaliasedSQL(a1, &v17);
    std::stringbuf::str();
    v17 = *MEMORY[0x24BEDB800];
    *(uint64_t *)((char *)&v17 + *(_QWORD *)(v17 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v18 = MEMORY[0x24BEDB848] + 16;
    if (v20 < 0)
      operator delete(__p);
LABEL_24:
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x20BD27A84](v21);
    goto LABEL_25;
  }
  if (*(char *)(a1 + 103) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)(a1 + 80), *(_QWORD *)(a1 + 88));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *v6;
    a3->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 96);
  }
LABEL_25:
  v12 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_20A900550(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *mediaplatform::SQLColumnNameExpression::_unaliasedSQL@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)a2);
  if (!*(_BYTE *)(a1 + 104))
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"+", 1);
  v4 = *(_BYTE *)(a1 + 79);
  if (v4 < 0)
  {
    if (*(_QWORD *)(a1 + 64))
      goto LABEL_5;
  }
  else if (*(_BYTE *)(a1 + 79))
  {
LABEL_5:
    if (v4 >= 0)
      v5 = a1 + 56;
    else
      v5 = *(_QWORD *)(a1 + 56);
    if (v4 >= 0)
      v6 = *(unsigned __int8 *)(a1 + 79);
    else
      v6 = *(_QWORD *)(a1 + 64);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, v5, v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)".", 1);
    v7 = *(char *)(a1 + 55);
    if (v7 >= 0)
      v8 = a1 + 32;
    else
      v8 = *(_QWORD *)(a1 + 32);
    if (v7 >= 0)
      v9 = *(unsigned __int8 *)(a1 + 55);
    else
      v9 = *(_QWORD *)(a1 + 40);
LABEL_28:
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, v8, v9);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)".", 1);
    goto LABEL_29;
  }
  v10 = *(_BYTE *)(a1 + 55);
  if (v10 < 0)
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_29;
    goto LABEL_22;
  }
  if (*(_BYTE *)(a1 + 55))
  {
LABEL_22:
    if (v10 >= 0)
      v8 = a1 + 32;
    else
      v8 = *(_QWORD *)(a1 + 32);
    if (v10 >= 0)
      v9 = *(unsigned __int8 *)(a1 + 55);
    else
      v9 = *(_QWORD *)(a1 + 40);
    goto LABEL_28;
  }
LABEL_29:
  v13 = *(_QWORD *)(a1 + 8);
  v12 = a1 + 8;
  v11 = v13;
  v14 = *(char *)(v12 + 23);
  if (v14 >= 0)
    v15 = v12;
  else
    v15 = v11;
  if (v14 >= 0)
    v16 = *(unsigned __int8 *)(v12 + 23);
  else
    v16 = *(_QWORD *)(v12 + 8);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, v15, v16);
}

void sub_20A9006C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostringstream::~ostringstream(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::SQLNotExpression::~SQLNotExpression(mediaplatform::SQLNotExpression *this)
{
  *(_QWORD *)this = &off_24C330EC8;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  *(_QWORD *)this = &off_24C330EC8;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLNotExpression::sql(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::string *v3;
  __int128 v4;
  std::string *v5;
  std::string v6;
  std::string v7;

  (*(void (**)(std::string *__return_ptr))(**(_QWORD **)(a1 + 8) + 16))(&v6);
  v3 = std::string::insert(&v6, 0, "NOT (");
  v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v7.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v7.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  v5 = std::string::append(&v7, ")");
  *a2 = *v5;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v6.__r_.__value_.__l.__data_);
}

void sub_20A9007F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void mediaplatform::SQLAliasExpression::~SQLAliasExpression(void **this)
{
  *this = off_24C331000;
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)(this + 1));
}

{
  *this = off_24C331000;
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)(this + 1));
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLAliasExpression::sql(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  int v9;
  unsigned __int8 *v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  __int128 v14;
  int v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::string v23;
  std::string v24;
  std::string v25;
  int *v26;
  std::__shared_weak_count *v27;

  if (*(char *)(a1 + 47) < 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!a2)
    {
LABEL_10:
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), a2);
      return;
    }
  }
  else
  {
    v6 = *(unsigned __int8 *)(a1 + 47);
    if (!a2)
      goto LABEL_10;
  }
  if (!v6)
    goto LABEL_10;
  v7 = (_OWORD *)(a1 + 24);
  (*(void (**)(int **__return_ptr, uint64_t))(*(_QWORD *)a2 + 8))(&v26, a2);
  v8 = (uint64_t)(v26 + 2);
  v9 = *v26;
  v10 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)v26 + 1, (unsigned __int8 *)(a1 + 24));
  if (v9)
  {
    if (v10)
    {
      if (*(char *)(a1 + 47) < 0)
      {
        std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)(a1 + 24), *(_QWORD *)(a1 + 32));
      }
      else
      {
        *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *v7;
        a3->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 40);
      }
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), a2);
    }
  }
  else
  {
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>(v8, (unsigned __int8 *)(a1 + 24), a1 + 24);
    (*(void (**)(std::string *__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 16))(&v23, *(_QWORD *)(a1 + 8), a2);
    v11 = std::string::insert(&v23, 0, "(");
    v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v24.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    v13 = std::string::append(&v24, ") AS ");
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v25.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    v15 = *(char *)(a1 + 47);
    if (v15 >= 0)
      v16 = (const std::string::value_type *)(a1 + 24);
    else
      v16 = *(const std::string::value_type **)(a1 + 24);
    if (v15 >= 0)
      v17 = *(unsigned __int8 *)(a1 + 47);
    else
      v17 = *(_QWORD *)(a1 + 32);
    v18 = std::string::append(&v25, v16, v17);
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    a3->__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v23.__r_.__value_.__l.__data_);
  }
  v20 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

void sub_20A900ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a15 < 0)
    operator delete(a10);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v28 - 64);
  _Unwind_Resume(a1);
}

void mediaplatform::SQLExpressionList::~SQLExpressionList(mediaplatform::SQLExpressionList *this)
{
  void **v1;

  *(_QWORD *)this = &off_24C330FB0;
  v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_24C330FB0;
  v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLExpressionList::sql(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  uint64_t **v5;
  std::string *v6;
  __int128 v7;
  std::string *v8;
  void *__p[2];
  char v10;
  std::string v11;
  std::string v12;

  v5 = (uint64_t **)(a1 + 8);
  std::string::basic_string[abi:ne180100]<0>(__p, ", ");
  mediaplatform::SQLStringWithStatementList<mediaplatform::SQLExpression>((uint64_t)&v11, v5, a2, (uint64_t)__p);
  v6 = std::string::insert(&v11, 0, "(");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  v8 = std::string::append(&v12, ")");
  *a3 = *v8;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  if (v10 < 0)
    operator delete(__p[0]);
}

void sub_20A900CB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void mediaplatform::SQLFunctionExpression::~SQLFunctionExpression(mediaplatform::SQLFunctionExpression *this)
{
  void **v2;

  *(_QWORD *)this = off_24C3312B0;
  *((_QWORD *)this + 4) = &off_24C330FB0;
  v2 = (void **)((char *)this + 40);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  void **v2;

  *(_QWORD *)this = off_24C3312B0;
  *((_QWORD *)this + 4) = &off_24C330FB0;
  v2 = (void **)((char *)this + 40);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLFunctionExpression::sql(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  const std::string::value_type *v5;
  uint64_t v6;
  const std::string::value_type *v7;
  int v8;
  const std::string::value_type *v9;
  std::string::size_type v10;
  std::string *v11;
  std::string v12;

  mediaplatform::SQLExpressionList::sql(a1 + 32, a2, &v12);
  v7 = *(const std::string::value_type **)(a1 + 8);
  v6 = a1 + 8;
  v5 = v7;
  v8 = *(char *)(v6 + 23);
  if (v8 >= 0)
    v9 = (const std::string::value_type *)v6;
  else
    v9 = v5;
  if (v8 >= 0)
    v10 = *(unsigned __int8 *)(v6 + 23);
  else
    v10 = *(_QWORD *)(v6 + 8);
  v11 = std::string::insert(&v12, 0, v9, v10);
  *a3 = *v11;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_20A900E50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mediaplatform::SQLSelectExpression::~SQLSelectExpression(mediaplatform::SQLSelectExpression *this)
{
  *(_QWORD *)this = &off_24C3311B0;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  *(_QWORD *)this = &off_24C3311B0;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLSelectExpression::sql(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::string *v3;
  __int128 v4;
  std::string *v5;
  std::string v6;
  std::string v7;

  (*(void (**)(std::string *__return_ptr))(**(_QWORD **)(a1 + 8) + 16))(&v6);
  v3 = std::string::insert(&v6, 0, "(");
  v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v7.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v7.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  v5 = std::string::append(&v7, ")");
  *a2 = *v5;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v6.__r_.__value_.__l.__data_);
}

void sub_20A900F88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void mediaplatform::SQLBinaryExpression::~SQLBinaryExpression(mediaplatform::SQLBinaryExpression *this)
{
  char *v1;

  *(_QWORD *)this = &off_24C331138;
  v1 = (char *)this + 16;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 32);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v1;

  *(_QWORD *)this = &off_24C331138;
  v1 = (char *)this + 16;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 32);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLBinaryExpression::sql(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  mediaplatform::SQLBinaryExpression *v6;
  uint64_t *v7;
  unsigned int v8;
  uint64_t v9;
  void *__p[2];
  char v11;
  void *v12[2];
  char v13;
  uint64_t v14[3];

  v6 = (mediaplatform::SQLBinaryExpression *)(*(_QWORD *(**)(void **__return_ptr))(**(_QWORD **)(a1 + 16)
                                                                                            + 16))(v12);
  v7 = (uint64_t *)mediaplatform::SQLBinaryExpression::operatorStrings(v6);
  v8 = *(_DWORD *)(a1 + 8);
  v9 = *v7;
  (*(void (**)(void **__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(a1 + 32) + 16))(__p, *(_QWORD *)(a1 + 32), a2);
  v14[0] = (uint64_t)__p;
  v14[1] = v9 + 24 * v8;
  v14[2] = (uint64_t)v12;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  a3->__r_.__value_.__r.__words[0] = 0;
  mediaplatform::FormatImplementation<std::string,std::string,std::string>((std::string *)"({0} {1} {2})", a3, 0, v14);
  if (v11 < 0)
    operator delete(__p[0]);
  if (v13 < 0)
    operator delete(v12[0]);
}

void sub_20A901118(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (*(char *)(v21 + 23) < 0)
    operator delete(*(void **)v21);
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t mediaplatform::SQLBinaryExpression::operatorStrings(mediaplatform::SQLBinaryExpression *this)
{
  unsigned __int8 v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  if ((v1 & 1) == 0
  {
    v3 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&v5, "||");
    std::string::basic_string[abi:ne180100]<0>(v6, "AND");
    std::string::basic_string[abi:ne180100]<0>(v7, "OR");
    std::string::basic_string[abi:ne180100]<0>(v8, "+");
    std::string::basic_string[abi:ne180100]<0>(v9, "-");
    std::string::basic_string[abi:ne180100]<0>(v10, "*");
    std::string::basic_string[abi:ne180100]<0>(v11, "/");
    std::string::basic_string[abi:ne180100]<0>(v12, "%");
    std::string::basic_string[abi:ne180100]<0>(v13, "<<");
    std::string::basic_string[abi:ne180100]<0>(v14, ">>");
    std::string::basic_string[abi:ne180100]<0>(v15, "&");
    std::string::basic_string[abi:ne180100]<0>(v16, "|");
    std::string::basic_string[abi:ne180100]<0>(v17, "=");
    std::string::basic_string[abi:ne180100]<0>(v18, "==");
    std::string::basic_string[abi:ne180100]<0>(v19, "!=");
    std::string::basic_string[abi:ne180100]<0>(v20, "<");
    std::string::basic_string[abi:ne180100]<0>(v21, "<=");
    std::string::basic_string[abi:ne180100]<0>(v22, ">");
    std::string::basic_string[abi:ne180100]<0>(v23, ">=");
    std::string::basic_string[abi:ne180100]<0>(v24, "IS");
    std::string::basic_string[abi:ne180100]<0>(v25, "IS NOT");
    std::string::basic_string[abi:ne180100]<0>(v26, "IN");
    std::string::basic_string[abi:ne180100]<0>(v27, "LIKE");
    std::string::basic_string[abi:ne180100]<0>(v28, "GLOB");
    std::string::basic_string[abi:ne180100]<0>(v29, "MATCH");
    std::vector<std::string>::vector[abi:ne180100](v3, &v5, 0x19uLL);
    v4 = 75;
    do
    {
      if (*((char *)&v6[v4 - 1] - 1) < 0)
        operator delete((void *)v6[v4 - 4]);
      v4 -= 3;
    }
    while (v4 * 8);
    mediaplatform::SQLBinaryExpression::operatorStrings(void)::__operatorStrings = v3;
  }
  return mediaplatform::SQLBinaryExpression::operatorStrings(void)::__operatorStrings;
}

void sub_20A90146C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = 600;
  while (1)
  {
    if (*(char *)(v2 + v4 - 1) < 0)
      operator delete(*(void **)(v2 + v4 - 24));
    v4 -= 24;
    if (!v4)
    {
      MEMORY[0x20BD27AFC](v1, 0x20C40960023A9);
      _Unwind_Resume(a1);
    }
  }
}

void mediaplatform::FormatImplementation<std::string,std::string,std::string>(std::string *a1, std::string *a2, std::string::size_type a3, uint64_t *a4)
{
  char v8;
  char *v9;
  std::string::size_type i;
  int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  char *v18;
  char *v19;
  unsigned __int8 *v20;
  int v21;
  std::runtime_error *exception;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v8 = 0;
  v9 = (char *)a1;
  for (i = a3; ; ++i)
  {
    v27 = v9;
    if (*v9 == 123)
      break;
    if (!*v9)
    {
      std::string::resize(a2, i, 0);
      if (i != a3)
        mediaplatform::CopyFormatSectionToResult(a1, a2, a3, i - a3, v8 & 1);
      return;
    }
LABEL_7:
    ++v9;
  }
  v11 = v9[1];
  if (v11 == 123)
  {
    v27 = v9 + 1;
    v8 = 1;
    ++v9;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v27 = v9 + 2;
    v16 = v9[2];
    if ((v16 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v17 = 0;
      v18 = v9 + 3;
      do
      {
        v19 = v18;
        v27 = v18;
        v17 = (v16 - 48) + 10 * v17;
        ++v18;
        v21 = *v19;
        v20 = (unsigned __int8 *)(v19 - 1);
        v16 = v21;
      }
      while ((v21 - 58) >= 0xFFFFFFF6);
      v27 = (char *)(v20 + 2);
      if (*(v18 - 1) == 125)
        mediaplatform::FormatterParameters<0ul,std::string,std::string,std::string>::formatOptionsAtIndex<std::string,std::string,std::string>(v17);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  mediaplatform::FormatOptions::FormatOptions((uint64_t)&v23, (const char **)&v27);
  if (*((_QWORD *)&v23 + 1))
  {
    if (*((_QWORD *)&v23 + 1) == 1)
    {
      v12 = a4[1];
    }
    else
    {
      if (*((_QWORD *)&v23 + 1) != 2)
        mediaplatform::FormatterParameters<3ul>::formatParameterAtIndex<mediaplatform::FormatterParameters<0ul,std::string,std::string,std::string>>();
      v12 = *a4;
    }
  }
  else
  {
    v12 = a4[2];
  }
  v28 = v12;
  v29 = v23;
  v30 = v24;
  v31 = v25;
  v32 = v26;
  if (*(char *)(v12 + 23) < 0)
    v13 = *(_QWORD *)(v12 + 8);
  else
    v13 = *(unsigned __int8 *)(v12 + 23);
  v14 = *((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1) <= v13)
    v14 = v13;
  if ((_BYTE)v24)
    v13 = v14;
  mediaplatform::FormatImplementation<std::string,std::string,std::string>(v27, a2, v13 + i, a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v15 = (char *)a2;
  else
    v15 = (char *)a2->__r_.__value_.__r.__words[0];
  mediaplatform::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,std::string>(&v23, &v15[i], (uint64_t)&v28);
  if (i != a3)
    mediaplatform::CopyFormatSectionToResult(a1, a2, a3, i - a3, v8 & 1);
}

void sub_20A90174C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<0ul,std::string,std::string,std::string>::formatOptionsAtIndex<std::string,std::string,std::string>(uint64_t a1)
{
  std::runtime_error *exception;

  if (!a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  mediaplatform::FormatterParameters<1ul,std::string,std::string>::formatOptionsAtIndex<std::string,std::string,std::string>(a1);
}

void sub_20A9017A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<3ul>::formatParameterAtIndex<mediaplatform::FormatterParameters<0ul,std::string,std::string,std::string>>()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A9017F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<1ul,std::string,std::string>::formatOptionsAtIndex<std::string,std::string,std::string>(uint64_t a1)
{
  std::runtime_error *exception;

  if (a1 == 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  mediaplatform::FormatterParameters<2ul,std::string>::formatOptionsAtIndex<std::string,std::string,std::string>(a1);
}

void sub_20A901854(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<2ul,std::string>::formatOptionsAtIndex<std::string,std::string,std::string>(uint64_t a1)
{
  std::runtime_error *exception;

  if (a1 == 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  mediaplatform::FormatterParameters<3ul>::formatOptionsAtIndex<std::string,std::string,std::string>();
}

void sub_20A9018B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<3ul>::formatOptionsAtIndex<std::string,std::string,std::string>()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A901900(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::vector[abi:ne180100](uint64_t a1, __int128 *a2, unint64_t a3)
{
  uint64_t v4;

  *(_QWORD *)(a1 + 16) = 0;
  v4 = a1 + 16;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (a3)
  {
    std::vector<mlcore::SortDescriptor>::__vallocate[abi:ne180100]((_QWORD *)a1, a3);
    *(_QWORD *)(a1 + 8) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(v4, a2, (__int128 *)((char *)a2 + 24 * a3), *(std::string **)(a1 + 8));
  }
  return a1;
}

void sub_20A901990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void mediaplatform::SQLBinaryExpressionList::~SQLBinaryExpressionList(mediaplatform::SQLBinaryExpressionList *this)
{
  char *v2;
  void **v3;

  *(_QWORD *)this = &off_24C3313C8;
  v2 = (char *)this + 32;
  v3 = (void **)((char *)this + 48);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  *(_QWORD *)this = &off_24C331138;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

{
  char *v2;
  void **v3;

  *(_QWORD *)this = &off_24C3313C8;
  v2 = (char *)this + 32;
  v3 = (void **)((char *)this + 48);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  *(_QWORD *)this = &off_24C331138;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::SQLBinaryExpressionList::sql(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void **v7;
  uint64_t v8;
  unint64_t v9;
  mediaplatform::SQLBinaryExpression *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  unsigned __int8 v18;
  _QWORD v19[11];
  char v20;
  uint64_t v21;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v19);
  if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(a1 + 56))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" (", 2);
    v4 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56) != v4)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        (*(void (**)(void **__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(v4 + v5) + 16))(__p, *(_QWORD *)(v4 + v5), a2);
        if ((v18 & 0x80u) == 0)
          v7 = __p;
        else
          v7 = (void **)__p[0];
        if ((v18 & 0x80u) == 0)
          v8 = v18;
        else
          v8 = (uint64_t)__p[1];
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v7, v8);
        if ((char)v18 < 0)
          operator delete(__p[0]);
        v4 = *(_QWORD *)(a1 + 48);
        v9 = (*(_QWORD *)(a1 + 56) - v4) >> 4;
        if (v6 < v9 - 1)
        {
          v10 = (mediaplatform::SQLBinaryExpression *)std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" ", 1);
          v11 = (_QWORD *)mediaplatform::SQLBinaryExpression::operatorStrings(v10);
          v12 = *v11 + 24 * *(unsigned int *)(a1 + 8);
          v13 = *(char *)(v12 + 23);
          if (v13 >= 0)
            v14 = *v11 + 24 * *(unsigned int *)(a1 + 8);
          else
            v14 = *(_QWORD *)v12;
          if (v13 >= 0)
            v15 = *(unsigned __int8 *)(v12 + 23);
          else
            v15 = *(_QWORD *)(v12 + 8);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, v14, v15);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" ", 1);
          v4 = *(_QWORD *)(a1 + 48);
          v9 = (*(_QWORD *)(a1 + 56) - v4) >> 4;
        }
        ++v6;
        v5 += 16;
      }
      while (v6 < v9);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)") ", 2);
  }
  std::stringbuf::str();
  v19[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v19 + *(_QWORD *)(v19[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v19[1] = MEMORY[0x24BEDB848] + 16;
  if (v20 < 0)
    operator delete((void *)v19[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x20BD27A84](&v21);
}

void sub_20A901C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void mediaplatform::SQLUnaryExpression::~SQLUnaryExpression(mediaplatform::SQLUnaryExpression *this)
{
  *(_QWORD *)this = &off_24C331078;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  *(_QWORD *)this = &off_24C331078;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLUnaryExpression::sql(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  unsigned __int8 v6;
  uint64_t v7;
  void *__p[2];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((v6 & 1) == 0
  {
    v7 = operator new();
    std::string::basic_string[abi:ne180100]<0>(__p, "ISNULL");
    std::vector<std::string>::vector[abi:ne180100](v7, (__int128 *)__p, 1uLL);
    if (v9 < 0)
      operator delete(__p[0]);
    mediaplatform::SQLUnaryExpression::sql(mediaplatform::SQLRendering *)const::__operatorStrings = v7;
  }
  (*(void (**)(void **__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 16))(__p, *(_QWORD *)(a1 + 8), a2);
  mediaplatform::FormatString<std::string,std::string>(a3, (std::string *)"{0} {1}", (uint64_t)__p, *(_QWORD *)mediaplatform::SQLUnaryExpression::sql(mediaplatform::SQLRendering *)const::__operatorStrings+ 24 * *(unsigned int *)(a1 + 24));
  if (v9 < 0)
    operator delete(__p[0]);
}

void sub_20A901E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  MEMORY[0x20BD27AFC](v14, 0x20C40960023A9);
  _Unwind_Resume(a1);
}

void mediaplatform::SQLExistsExpression::~SQLExistsExpression(mediaplatform::SQLExistsExpression *this)
{
  *(_QWORD *)this = &off_24C3311B0;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
}

{
  *(_QWORD *)this = &off_24C3311B0;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::SQLExistsExpression::sql(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  mediaplatform::SQLSelectExpression::sql(a1, &v4);
  v3 = std::string::insert(&v4, 0, "EXISTS ");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_20A901FAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mediaplatform::SQLCaseExpression::~SQLCaseExpression(mediaplatform::SQLCaseExpression *this)
{
  char *v2;

  *(_QWORD *)this = &off_24C330F88;
  v2 = (char *)this + 8;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v2);
}

{
  char *v2;

  *(_QWORD *)this = &off_24C330F88;
  v2 = (char *)this + 8;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::SQLCaseExpression::sql(_QWORD **a1, uint64_t a2)
{
  void **v4;
  uint64_t v5;
  void *p_p;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  void *v13[2];
  unsigned __int8 v14;
  void *__p;
  uint64_t v16;
  unsigned __int8 v17;
  _QWORD v18[11];
  char v19;
  uint64_t v20;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v18);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"CASE", 4);
  if (a1[7])
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" ", 1);
    (*(void (**)(void **__return_ptr, _QWORD *, uint64_t))(*a1[7] + 16))(&__p, a1[7], a2);
    v4 = (v17 & 0x80u) == 0 ? &__p : (void **)__p;
    v5 = (v17 & 0x80u) == 0 ? v17 : v16;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v4, v5);
    if ((char)v17 < 0)
      operator delete(__p);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" WHEN ", 6);
  (*(void (**)(void **__return_ptr, _QWORD *, uint64_t))(*a1[1] + 16))(&__p, a1[1], a2);
  if ((v17 & 0x80u) == 0)
    p_p = &__p;
  else
    p_p = __p;
  if ((v17 & 0x80u) == 0)
    v7 = v17;
  else
    v7 = v16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)p_p, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" THEN ", 6);
  (*(void (**)(void **__return_ptr, _QWORD *, uint64_t))(*a1[3] + 16))(v13, a1[3], a2);
  if ((v14 & 0x80u) == 0)
    v8 = v13;
  else
    v8 = (void **)v13[0];
  if ((v14 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (uint64_t)v13[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v8, v9);
  if ((char)v14 < 0)
    operator delete(v13[0]);
  if ((char)v17 < 0)
    operator delete(__p);
  if (a1[5])
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" ELSE ", 6);
    (*(void (**)(void **__return_ptr, _QWORD *, uint64_t))(*a1[5] + 16))(&__p, a1[5], a2);
    v10 = (v17 & 0x80u) == 0 ? &__p : (void **)__p;
    v11 = (v17 & 0x80u) == 0 ? v17 : v16;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v10, v11);
    if ((char)v17 < 0)
      operator delete(__p);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" END", 4);
  std::stringbuf::str();
  v18[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v18 + *(_QWORD *)(v18[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v18[1] = MEMORY[0x24BEDB848] + 16;
  if (v19 < 0)
    operator delete((void *)v18[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x20BD27A84](&v20);
}

void sub_20A9022E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a21 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a22);
  _Unwind_Resume(a1);
}

_QWORD *mediaplatform::SQLNullExpression::SQLNullExpression(_QWORD *this)
{
  *this = &off_24C330FD8;
  return this;
}

{
  *this = &off_24C330FD8;
  return this;
}

_QWORD *mediaplatform::SQLBindParameter::SQLBindParameter(_QWORD *this)
{
  *this = &off_24C330E78;
  return this;
}

{
  *this = &off_24C330E78;
  return this;
}

_QWORD *mediaplatform::SQLIndexedBindParameter::SQLIndexedBindParameter(_QWORD *this, uint64_t a2)
{
  *this = &off_24C331418;
  this[1] = a2;
  return this;
}

{
  *this = &off_24C331418;
  this[1] = a2;
  return this;
}

_QWORD *mediaplatform::SQLNamedBindParameter::SQLNamedBindParameter(_QWORD *a1, __int128 *a2)
{
  std::string *v3;
  __int128 v4;

  *a1 = off_24C3312D8;
  v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

{
  std::string *v3;
  __int128 v4;

  *a1 = off_24C3312D8;
  v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

uint64_t mediaplatform::SQLColumnNameExpression::SQLColumnNameExpression(uint64_t a1, __int128 *a2, __int128 *a3, __int128 *a4, __int128 *a5)
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  std::string *v12;
  __int128 v13;

  *(_QWORD *)a1 = off_24C3313F0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v9 = *a2;
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 8) = v9;
  }
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 32), *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v10 = *a3;
    *(_QWORD *)(a1 + 48) = *((_QWORD *)a3 + 2);
    *(_OWORD *)(a1 + 32) = v10;
  }
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 56), *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v11 = *a4;
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a4 + 2);
    *(_OWORD *)(a1 + 56) = v11;
  }
  v12 = (std::string *)(a1 + 80);
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)a5, *((_QWORD *)a5 + 1));
  }
  else
  {
    v13 = *a5;
    *(_QWORD *)(a1 + 96) = *((_QWORD *)a5 + 2);
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
  }
  *(_BYTE *)(a1 + 104) = 1;
  return a1;
}

void sub_20A902548(_Unwind_Exception *exception_object)
{
  char *v1;
  void **v2;
  void **v3;
  void **v4;

  if (v1[79] < 0)
    operator delete(*v4);
  if (v1[55] < 0)
    operator delete(*v3);
  if (v1[31] < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

uint64_t mediaplatform::SQLColumnNameExpression::columnName(mediaplatform::SQLColumnNameExpression *this)
{
  return (uint64_t)this + 8;
}

uint64_t mediaplatform::SQLColumnNameExpression::tableName(mediaplatform::SQLColumnNameExpression *this)
{
  return (uint64_t)this + 32;
}

uint64_t mediaplatform::SQLColumnNameExpression::databaseName(mediaplatform::SQLColumnNameExpression *this)
{
  return (uint64_t)this + 56;
}

uint64_t mediaplatform::SQLColumnNameExpression::aliasName(mediaplatform::SQLColumnNameExpression *this)
{
  return (uint64_t)this + 80;
}

uint64_t mediaplatform::SQLColumnNameExpression::setShouldConstrainIndices(uint64_t this, char a2)
{
  *(_BYTE *)(this + 104) = a2;
  return this;
}

void mediaplatform::SQLColumnNameExpression::createUnqualifiedExpression(mediaplatform::SQLColumnNameExpression *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  void *__p[2];
  char v6;
  void *v7[2];
  char v8;
  void *v9[2];
  char v10;

  v4 = operator new(0x88uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24C33C130;
  std::string::basic_string[abi:ne180100]<0>(v9, "");
  std::string::basic_string[abi:ne180100]<0>(v7, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  mediaplatform::SQLColumnNameExpression::SQLColumnNameExpression((uint64_t)(v4 + 3), (__int128 *)((char *)this + 8), (__int128 *)v9, (__int128 *)v7, (__int128 *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  if (v8 < 0)
    operator delete(v7[0]);
  if (v10 < 0)
    operator delete(v9[0]);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_20A90268C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  std::__shared_weak_count *v27;
  void *v29;

  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  std::__shared_weak_count::~__shared_weak_count(v27);
  operator delete(v29);
  _Unwind_Resume(a1);
}

_QWORD *mediaplatform::SQLNotExpression::SQLNotExpression(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C330EC8;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C330EC8;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

std::string *mediaplatform::SQLAliasExpression::SQLAliasExpression(std::string *a1, std::string::size_type *a2, __int128 *a3)
{
  std::string::size_type v4;
  unint64_t *v5;
  unint64_t v6;
  std::string *v7;
  __int128 v8;

  a1->__r_.__value_.__r.__words[0] = (std::string::size_type)off_24C331000;
  v4 = a2[1];
  a1->__r_.__value_.__l.__size_ = *a2;
  a1->__r_.__value_.__r.__words[2] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = a1 + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v8 = *a3;
    a1[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  return a1;
}

void sub_20A9027C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::SQLExpressionList::SQLExpressionList(uint64_t a1, _QWORD **a2)
{
  *(_QWORD *)a1 = &off_24C330FB0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLExpression const>*,std::shared_ptr<mediaplatform::SQLExpression const>*>((char *)(a1 + 8), *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

{
  *(_QWORD *)a1 = &off_24C330FB0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLExpression const>*,std::shared_ptr<mediaplatform::SQLExpression const>*>((char *)(a1 + 8), *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

_QWORD *mediaplatform::SQLExpressionList::SQLExpressionList(_QWORD *a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;

  *a1 = &off_24C330FB0;
  v4 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  v7 = operator new(0x10uLL);
  a1[1] = v7;
  a1[2] = v7;
  v8 = v7 + 2;
  a1[3] = v7 + 2;
  *v7 = v4;
  v7[1] = v3;
  if (v3)
  {
    v9 = (unint64_t *)&v3->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    a1[2] = v8;
    do
      v11 = __ldaxr(v9);
    while (__stlxr(v11 - 1, v9));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  else
  {
    a1[2] = v8;
  }
  return a1;
}

void sub_20A902974(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void **v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, void **);
  v5 = va_arg(va1, _QWORD);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::SQLFunctionExpression::SQLFunctionExpression(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v5;

  *(_QWORD *)a1 = off_24C3312B0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 8) = v5;
  }
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 32) = &off_24C330FB0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLExpression const>*,std::shared_ptr<mediaplatform::SQLExpression const>*>((char *)(a1 + 40), *(_QWORD **)(a3 + 8), *(_QWORD **)(a3 + 16), (uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8)) >> 4);
  return a1;
}

void sub_20A902A24(_Unwind_Exception *exception_object)
{
  void **v1;
  uint64_t v2;

  if (*(char *)(v2 + 31) < 0)
    operator delete(*v1);
  _Unwind_Resume(exception_object);
}

_QWORD *mediaplatform::SQLSelectExpression::SQLSelectExpression(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C3311B0;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C3311B0;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t mediaplatform::SQLSelectExpression::selectStatement(mediaplatform::SQLSelectExpression *this)
{
  return (uint64_t)this + 8;
}

double mediaplatform::SQLBinaryExpression::SQLBinaryExpression(uint64_t a1, int a2)
{
  double result;

  *(_QWORD *)a1 = &off_24C331138;
  *(_DWORD *)(a1 + 8) = a2;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_24C331138;
  *(_DWORD *)(a1 + 8) = a2;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  return result;
}

uint64_t mediaplatform::SQLBinaryExpression::SQLBinaryExpression(uint64_t result, _QWORD *a2, int a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  *(_QWORD *)result = &off_24C331138;
  *(_DWORD *)(result + 8) = a3;
  v4 = a2[1];
  *(_QWORD *)(result + 16) = *a2;
  *(_QWORD *)(result + 24) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = a4[1];
  *(_QWORD *)(result + 32) = *a4;
  *(_QWORD *)(result + 40) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  return result;
}

{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  *(_QWORD *)result = &off_24C331138;
  *(_DWORD *)(result + 8) = a3;
  v4 = a2[1];
  *(_QWORD *)(result + 16) = *a2;
  *(_QWORD *)(result + 24) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = a4[1];
  *(_QWORD *)(result + 32) = *a4;
  *(_QWORD *)(result + 40) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  return result;
}

uint64_t mediaplatform::SQLBinaryExpression::sqlOperator(mediaplatform::SQLBinaryExpression *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t mediaplatform::SQLBinaryExpression::leftExpression@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 24);
  *a2 = *(_QWORD *)(this + 16);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

uint64_t mediaplatform::SQLBinaryExpression::rightExpression@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 40);
  *a2 = *(_QWORD *)(this + 32);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

uint64_t mediaplatform::SQLBinaryExpressionList::SQLBinaryExpressionList(uint64_t a1, _QWORD **a2, int a3)
{
  *(_DWORD *)(a1 + 8) = a3;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)a1 = &off_24C3313C8;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLExpression const>*,std::shared_ptr<mediaplatform::SQLExpression const>*>((char *)(a1 + 48), *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

void sub_20A902C40(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = &off_24C331138;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)(v1 + 4));
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::SQLBinaryExpressionList::expressions(mediaplatform::SQLBinaryExpressionList *this)
{
  return (uint64_t)this + 48;
}

uint64_t mediaplatform::SQLUnaryExpression::SQLUnaryExpression(uint64_t result, uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v4 = *a2;
  v3 = a2[1];
  *(_QWORD *)result = &off_24C331078;
  *(_QWORD *)(result + 8) = v4;
  *(_QWORD *)(result + 16) = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *(_DWORD *)(result + 24) = a3;
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v4 = *a2;
  v3 = a2[1];
  *(_QWORD *)result = &off_24C331078;
  *(_QWORD *)(result + 8) = v4;
  *(_QWORD *)(result + 16) = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *(_DWORD *)(result + 24) = a3;
  return result;
}

uint64_t mediaplatform::SQLUnaryExpression::expression@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 16);
  *a2 = *(_QWORD *)(this + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

_QWORD *mediaplatform::SQLUnaryExpression::setExpression(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100]((_QWORD *)(a1 + 8), *a2, a2[1]);
}

uint64_t mediaplatform::SQLUnaryExpression::unaryOperator(mediaplatform::SQLUnaryExpression *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t mediaplatform::SQLUnaryExpression::setUnaryOperator(uint64_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return result;
}

_QWORD *mediaplatform::SQLExistsExpression::SQLExistsExpression(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C3311B0;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *result = &off_24C331160;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C3311B0;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *result = &off_24C331160;
  return result;
}

_QWORD *mediaplatform::SQLCaseExpression::SQLCaseExpression(_QWORD *result, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  const char *v13;
  int v14;

  *result = &off_24C330F88;
  v4 = a2[1];
  result[1] = *a2;
  result[2] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = a3[1];
  result[3] = *a3;
  result[4] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = a4[1];
  result[5] = *a4;
  result[6] = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  result[7] = 0;
  result[8] = 0;
  if (!result[1])
  {
    v13 = "_evaluationExpression";
    v14 = 326;
    goto LABEL_15;
  }
  if (!result[3])
  {
    v13 = "_thenResultExpression";
    v14 = 327;
LABEL_15:
    __assert_rtn("SQLCaseExpression", "SQLExpression.cpp", v14, v13);
  }
  return result;
}

void sub_20A902E88(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v4);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::SQLCaseExpression::evaluationExpression@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 16);
  *a2 = *(_QWORD *)(this + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

_QWORD *mediaplatform::SQLCaseExpression::setEvaluationExpression(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100]((_QWORD *)(a1 + 8), *a2, a2[1]);
}

uint64_t mediaplatform::SQLCaseExpression::thenResultExpression@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 32);
  *a2 = *(_QWORD *)(this + 24);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

_QWORD *mediaplatform::SQLCaseExpression::setThenResultExpression(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100]((_QWORD *)(a1 + 24), *a2, a2[1]);
}

uint64_t mediaplatform::SQLCaseExpression::elseResultExpression@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 48);
  *a2 = *(_QWORD *)(this + 40);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

_QWORD *mediaplatform::SQLCaseExpression::setElseResultExpression(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100]((_QWORD *)(a1 + 40), *a2, a2[1]);
}

uint64_t mediaplatform::SQLCaseExpression::baseExpression@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 64);
  *a2 = *(_QWORD *)(this + 56);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

_QWORD *mediaplatform::SQLCaseExpression::setBaseExpression(uint64_t a1, uint64_t *a2)
{
  return std::shared_ptr<mlcore::Predicate>::operator=[abi:ne180100]((_QWORD *)(a1 + 56), *a2, a2[1]);
}

uint64_t mlcore::EntityCache::isSmartPlaylist(mlcore::EntityCache *this)
{
  return 0;
}

_QWORD *std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_24C33AE28;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_24C33AE28;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C33AE28;
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore11LibraryView12performQueryINS_21EntityPropertiesQueryEEEvNSt3__110shared_ptrIT_EENS4_INS_11TransactionEEENS3_8functionIFvNS4_INS5_6ResultEEEEEEEUlNS4_INS_11QueryResultEEEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::EntityPropertiesQuery>(std::shared_ptr<mlcore::EntityPropertiesQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::EntityPropertiesQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::target_type()
{
}

void std::__function::__func<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0,std::allocator<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0,std::allocator<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_24C33AD20;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0,std::allocator<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore11EntityCache29entityForClassAndPersistentIDEPNS_11EntityClassExNS_13PropertyCacheEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0,std::allocator<mlcore::EntityCache::entityForClassAndPersistentID(mlcore::EntityClass *,long long,mlcore::PropertyCache)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::target_type()
{
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,void *>>>::operator()[abi:ne180100](char a1, _QWORD *__p)
{
  void *v3;

  if (a1)
  {
    v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__shared_ptr_emplace<mlcore::EntityPropertiesQuery>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D010;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::EntityPropertiesQuery>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D010;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *mlcore::EntityCache::propertiesToFetchForEntityClass(mlcore::EntityCache *this, mlcore::EntityClass *a2)
{
  mlcore::EntityClass *v3;

  v3 = a2;
  return std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>>>::__emplace_unique_key_args<mlcore::EntityClass *,std::piecewise_construct_t const&,std::tuple<mlcore::EntityClass * const&>,std::tuple<>>((uint64_t)this + 8, (unint64_t)a2, &v3)+ 3;
}

void mediaplatform::FilePath::~FilePath(mediaplatform::FilePath *this)
{
  void **v1;

  *(_QWORD *)this = &off_24C331570;
  v1 = (void **)((char *)this + 8);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(_QWORD *)this = &off_24C331570;
  v1 = (void **)((char *)this + 8);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::FilePath::str(mediaplatform::FilePath *this@<X0>, uint64_t a2@<X8>)
{
  __int128 *v3;
  uint64_t v4;
  std::vector<std::string> *v5;
  uint64_t v6;
  uint64_t v7;
  void ***v8;
  unsigned __int8 *v9;
  __int128 *v10;
  unint64_t v11;
  uint64_t v12;
  const std::string::value_type *v13;
  std::string::size_type v14;
  std::string *v15;
  __int128 v16;
  std::vector<std::string> __p;
  void **__s2[2];
  char v19;
  std::vector<std::string> v20;
  std::vector<std::string> *p_p;
  char v22;

  memset(&v20, 0, sizeof(v20));
  v19 = 1;
  LOWORD(__s2[0]) = 47;
  v4 = *((_QWORD *)this + 1);
  v3 = (__int128 *)*((_QWORD *)this + 2);
  v5 = (std::vector<std::string> *)((char *)this + 8);
  if (v3 != (__int128 *)v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 23);
    v7 = (v6 & 0x80u) == 0 ? *(unsigned __int8 *)(v4 + 23) : *(_QWORD *)(v4 + 8);
    if (v7 == 1)
    {
      if ((v6 & 0x80) == 0)
      {
        if (*(_BYTE *)(v4 + 23))
        {
          v8 = __s2;
          v9 = (unsigned __int8 *)*((_QWORD *)this + 1);
          while (*v9 == *(unsigned __int8 *)v8)
          {
            ++v9;
            v8 = (void ***)((char *)v8 + 1);
            if (!--v6)
              goto LABEL_19;
          }
          goto LABEL_13;
        }
LABEL_19:
        v10 = (__int128 *)(v4 + 24);
        memset(&__p, 0, sizeof(__p));
        p_p = &__p;
        v22 = 0;
        if (v3 != v10)
        {
          v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v3 - (char *)v10) >> 3);
          if (v11 >= 0xAAAAAAAAAAAAAABLL)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          __p.__begin_ = (std::vector<std::string>::pointer)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v11);
          __p.__end_ = __p.__begin_;
          __p.__end_cap_.__value_ = &__p.__begin_[v12];
          __p.__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&__p.__end_cap_, v10, v3, __p.__begin_);
        }
        std::vector<std::string>::__vdeallocate(&v20);
        v20 = __p;
        memset(&__p, 0, sizeof(__p));
        p_p = &__p;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
        mediaplatform::ComponentsJoinedByString<std::string>((uint64_t)&__p, (uint64_t *)&v20, (uint64_t)__s2);
        if (v19 >= 0)
          v13 = (const std::string::value_type *)__s2;
        else
          v13 = (const std::string::value_type *)__s2[0];
        if (v19 >= 0)
          v14 = v19;
        else
          v14 = (std::string::size_type)__s2[1];
        v15 = std::string::insert((std::string *)&__p, 0, v13, v14);
        v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
        *(_QWORD *)(a2 + 16) = *((_QWORD *)&v15->__r_.__value_.__l + 2);
        *(_OWORD *)a2 = v16;
        v15->__r_.__value_.__l.__size_ = 0;
        v15->__r_.__value_.__r.__words[2] = 0;
        v15->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(__p.__end_cap_.__value_) < 0)
          operator delete(__p.__begin_);
        goto LABEL_16;
      }
      if (!memcmp(*(const void **)v4, __s2, *(_QWORD *)(v4 + 8)))
        goto LABEL_19;
    }
  }
LABEL_13:
  if (&v20 != v5)
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(&v20, (std::string *)v4, v3, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - v4) >> 3));
  mediaplatform::ComponentsJoinedByString<std::string>(a2, (uint64_t *)&v20, (uint64_t)__s2);
LABEL_16:
  if (v19 < 0)
    operator delete(__s2[0]);
  __s2[0] = (void **)&v20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](__s2);
}

void sub_20A9037C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, char *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  uint64_t v21;

  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 64));
  if (a20 < 0)
    operator delete(__p);
  __p = &a21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::FilePath::FilePath(uint64_t a1, uint64_t a2)
{
  __int128 *v3;
  unint64_t v4;
  _QWORD *v5;

  *(_QWORD *)a1 = &off_24C331570;
  v3 = *(__int128 **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  v5 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (v4)
  {
    std::vector<mlcore::SortDescriptor>::__vallocate[abi:ne180100](v5, v4);
    *(_QWORD *)(a1 + 16) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(a1 + 24, v3, (__int128 *)((char *)v3 + 24 * v4), *(std::string **)(a1 + 16));
  }
  return a1;
}

void sub_20A9038B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 16) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *mediaplatform::FilePath::FilePath(_QWORD *a1, std::string *__str)
{
  std::vector<std::string> *v4;
  std::string *v5;
  std::string::size_type v6;
  std::vector<std::string>::pointer v7;
  std::string::size_type size;
  int v9;
  std::string *v10;
  std::vector<std::string>::pointer end;
  std::string::size_type i;
  std::string::size_type v13;
  std::string::size_type v14;
  int v15;
  std::vector<std::string>::pointer v16;
  std::string *v17;
  std::string __sz;
  std::string v20;
  std::string __s;
  std::string __p;
  std::vector<std::string> v23;

  *a1 = &off_24C331570;
  a1[1] = 0;
  v4 = (std::vector<std::string> *)(a1 + 1);
  a1[2] = 0;
  a1[3] = 0;
  memset(&v23, 0, sizeof(v23));
  if ((SHIBYTE(__str->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!*((_BYTE *)&__str->__r_.__value_.__s + 23))
      goto LABEL_46;
    __p = *__str;
    *((_BYTE *)&__s.__r_.__value_.__s + 23) = 1;
    LOWORD(__s.__r_.__value_.__l.__data_) = 47;
    v5 = __str;
    goto LABEL_4;
  }
  size = __str->__r_.__value_.__l.__size_;
  if (!size)
    goto LABEL_46;
  std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, size);
  v9 = SHIBYTE(__str->__r_.__value_.__r.__words[2]);
  *((_BYTE *)&__s.__r_.__value_.__s + 23) = 1;
  strcpy((char *)&__s, "/");
  if (v9 < 0)
  {
    if (!__str->__r_.__value_.__l.__size_)
      goto LABEL_18;
    v5 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  else
  {
    v5 = __str;
    if (!v9)
    {
LABEL_18:
      end = v23.__end_;
      if (v23.__end_ >= v23.__end_cap_.__value_)
      {
        v10 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v23, (__int128 *)&__s);
      }
      else
      {
        *v23.__end_ = __s;
        v10 = end + 1;
      }
      goto LABEL_23;
    }
  }
LABEL_4:
  if (v5->__r_.__value_.__s.__data_[0] != 47)
  {
    std::string::operator=(&__p, __str);
    goto LABEL_24;
  }
  std::string::basic_string(&v20, __str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&__sz);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = v20;
  v7 = v23.__end_;
  if (v23.__end_ >= v23.__end_cap_.__value_)
  {
    v10 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v23, (__int128 *)&__s);
  }
  else
  {
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(v23.__end_, __s.__r_.__value_.__l.__data_, v6);
    else
      *v23.__end_ = __s;
    v10 = v7 + 1;
  }
LABEL_23:
  v23.__end_ = v10;
LABEL_24:
  mediaplatform::ComponentsSeparatedByString(&__p, (char *)&__s, (std::vector<std::string> *)&v20);
  v13 = v20.__r_.__value_.__l.__size_;
  for (i = v20.__r_.__value_.__r.__words[0]; i != v13; i += 24)
  {
    if (*(char *)(i + 23) < 0)
      std::string::__init_copy_ctor_external(&__sz, *(const std::string::value_type **)i, *(_QWORD *)(i + 8));
    else
      __sz = *(std::string *)i;
    v14 = HIBYTE(__sz.__r_.__value_.__r.__words[2]);
    v15 = SHIBYTE(__sz.__r_.__value_.__r.__words[2]);
    if ((__sz.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v14 = __sz.__r_.__value_.__l.__size_;
    if (v14)
    {
      v16 = v23.__end_;
      if (v23.__end_ >= v23.__end_cap_.__value_)
      {
        v17 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v23, (__int128 *)&__sz);
      }
      else
      {
        if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v23.__end_, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
        }
        else
        {
          *(_OWORD *)v23.__end_ = *(_OWORD *)&__sz.__r_.__value_.__l.__data_;
          v16->__r_.__value_.__r.__words[2] = __sz.__r_.__value_.__r.__words[2];
        }
        v17 = v16 + 1;
      }
      v23.__end_ = v17;
    }
    if (v15 < 0)
      operator delete(__sz.__r_.__value_.__l.__data_);
  }
  __sz.__r_.__value_.__r.__words[0] = (std::string::size_type)&v20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__sz);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_46:
  if (v4 != &v23)
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(v4, v23.__begin_, (__int128 *)v23.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v23.__end_ - (char *)v23.__begin_) >> 3));
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return a1;
}

void sub_20A903B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  *(_QWORD *)(v29 - 64) = v28;
  if (a21 < 0)
    operator delete(__p);
  if (a27 < 0)
    operator delete(a22);
  a22 = (void *)(v29 - 72);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a22);
  *(_QWORD *)(v29 - 72) = v27;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v29 - 72));
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::FilePath::FilePath(uint64_t a1, __int128 **a2)
{
  *(_QWORD *)a1 = &off_24C331570;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 8), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

{
  *(_QWORD *)a1 = &off_24C331570;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 8), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

uint64_t mediaplatform::FilePath::operator+=(uint64_t a1, uint64_t a2)
{
  std::string v4;
  std::string *v5;

  memset(&v4, 0, sizeof(v4));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v4, *(__int128 **)(a2 + 8), *(__int128 **)(a2 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3));
  std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>((std::vector<std::string> *)(a1 + 8), *(std::string **)(a1 + 16), (__int128 *)v4.__r_.__value_.__l.__data_, (__int128 *)v4.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4.__r_.__value_.__l.__size_ - v4.__r_.__value_.__r.__words[0]) >> 3));
  v5 = &v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
  return a1;
}

void sub_20A903D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>(std::vector<std::string> *a1, std::string *a2, __int128 *a3, __int128 *a4, uint64_t a5)
{
  __int128 *v6;
  std::string *v7;
  std::allocator<std::string> *p_end_cap;
  std::string *v10;
  std::string *value;
  std::string *v12;
  std::vector<std::string>::pointer begin;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  std::string *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  std::string *v23;
  uint64_t v24;
  std::string *v25;
  uint64_t v26;
  __int128 v27;
  std::__split_buffer<std::string> __v;

  if (a5 >= 1)
  {
    v6 = a3;
    v7 = a2;
    value = a1->__end_cap_.__value_;
    p_end_cap = (std::allocator<std::string> *)&a1->__end_cap_;
    v10 = value;
    v12 = (std::string *)*((_QWORD *)p_end_cap - 1);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v12) >> 3)) >= a5)
    {
      v21 = (char *)v12 - (char *)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)a2) >> 3)) >= a5)
      {
        v22 = (__int128 *)((char *)a3 + 24 * a5);
      }
      else
      {
        v22 = (__int128 *)((char *)a3 + 8 * (((char *)v12 - (char *)a2) >> 3));
        a1->__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)p_end_cap, v22, a4, *((std::string **)p_end_cap - 1));
        if (v21 < 1)
          return;
      }
      std::vector<std::string>::__move_range(a1, v7, v12, &v7[a5]);
      for (; v6 != v22; ++v7)
      {
        std::string::operator=(v7, (const std::string *)v6);
        v6 = (__int128 *)((char *)v6 + 24);
      }
    }
    else
    {
      begin = a1->__begin_;
      v14 = a5 - 0x5555555555555555 * (((char *)v12 - (char *)a1->__begin_) >> 3);
      if (v14 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)begin) >> 3);
      v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)begin) >> 3);
      v17 = 2 * v16;
      if (2 * v16 <= v14)
        v17 = v14;
      if (v16 >= 0x555555555555555)
        v18 = 0xAAAAAAAAAAAAAAALL;
      else
        v18 = v17;
      __v.__end_cap_.__value_ = p_end_cap;
      if (v18)
      {
        v19 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v18);
      }
      else
      {
        v19 = 0;
        v20 = 0;
      }
      v23 = v19 + v15;
      __v.__first_ = v19;
      __v.__begin_ = v23;
      __v.__end_ = v23;
      __v.__end_cap_.__value_ = &v19[v20];
      v24 = 3 * a5;
      v25 = &v23[a5];
      v26 = 8 * v24;
      do
      {
        if (*((char *)v6 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v23, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        }
        else
        {
          v27 = *v6;
          v23->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
          *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v27;
        }
        ++v23;
        v6 = (__int128 *)((char *)v6 + 24);
        v26 -= 24;
      }
      while (v26);
      __v.__end_ = v25;
      std::vector<std::string>::__swap_out_circular_buffer(a1, &__v, v7);
      std::__split_buffer<std::string>::~__split_buffer(&__v);
    }
  }
}

void sub_20A903F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__split_buffer<std::string> *a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

std::string *mediaplatform::FilePath::pathComponents@<X0>(__int128 **this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, this[1], this[2], 0xAAAAAAAAAAAAAAABLL * (((char *)this[2] - (char *)this[1]) >> 3));
}

uint64_t mediaplatform::FilePath::operator+=(uint64_t a1, std::string *a2)
{
  std::string v4;
  void (**v5)(mediaplatform::FilePath *__hidden);
  __int128 *v6;
  __int128 *v7;
  std::string *v8;

  mediaplatform::FilePath::FilePath(&v5, a2);
  memset(&v4, 0, sizeof(v4));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v4, v6, v7, 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)v6) >> 3));
  std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>((std::vector<std::string> *)(a1 + 8), *(std::string **)(a1 + 16), (__int128 *)v4.__r_.__value_.__l.__data_, (__int128 *)v4.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4.__r_.__value_.__l.__size_ - v4.__r_.__value_.__r.__words[0]) >> 3));
  v8 = &v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  v5 = &off_24C331570;
  v4.__r_.__value_.__r.__words[0] = (std::string::size_type)&v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v4);
  return a1;
}

void sub_20A904068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, void (**a12)(mediaplatform::FilePath *__hidden this))
{
  uint64_t v12;

  *(_QWORD *)(v12 - 40) = &a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v12 - 40));
  a12 = &off_24C331570;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void mediaplatform::FilePath::operator+(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  std::string v5;
  std::string v6;
  std::string *v7;

  memset(&v6, 0, sizeof(v6));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v6, *(__int128 **)(a1 + 8), *(__int128 **)(a1 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3));
  memset(&v5, 0, sizeof(v5));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v5, *(__int128 **)(a2 + 8), *(__int128 **)(a2 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3));
  std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>((std::vector<std::string> *)&v6, (std::string *)v6.__r_.__value_.__l.__size_, (__int128 *)v5.__r_.__value_.__l.__data_, (__int128 *)v5.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5.__r_.__value_.__l.__size_ - v5.__r_.__value_.__r.__words[0]) >> 3));
  v7 = &v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  *(_QWORD *)a3 = &off_24C331570;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a3 + 8), (__int128 *)v6.__r_.__value_.__l.__data_, (__int128 *)v6.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6.__r_.__value_.__l.__size_ - v6.__r_.__value_.__r.__words[0]) >> 3));
  v5.__r_.__value_.__r.__words[0] = (std::string::size_type)&v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void sub_20A90418C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, char a13)
{
  a10 = (void **)&a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void mediaplatform::FilePath::operator+(uint64_t a1@<X0>, std::string *a2@<X1>, uint64_t a3@<X8>)
{
  std::string v5;
  std::string v6;
  void (**v7)(mediaplatform::FilePath *__hidden);
  __int128 *v8;
  __int128 *v9;
  std::string *v10;

  mediaplatform::FilePath::FilePath(&v7, a2);
  memset(&v6, 0, sizeof(v6));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v6, *(__int128 **)(a1 + 8), *(__int128 **)(a1 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3));
  memset(&v5, 0, sizeof(v5));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v5, v8, v9, 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)v8) >> 3));
  std::vector<std::string>::__insert_with_size[abi:ne180100]<std::__wrap_iter<std::string const*>,std::__wrap_iter<std::string const*>>((std::vector<std::string> *)&v6, (std::string *)v6.__r_.__value_.__l.__size_, (__int128 *)v5.__r_.__value_.__l.__data_, (__int128 *)v5.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5.__r_.__value_.__l.__size_ - v5.__r_.__value_.__r.__words[0]) >> 3));
  v10 = &v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
  *(_QWORD *)a3 = &off_24C331570;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a3 + 8), (__int128 *)v6.__r_.__value_.__l.__data_, (__int128 *)v6.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6.__r_.__value_.__l.__size_ - v6.__r_.__value_.__r.__words[0]) >> 3));
  v5.__r_.__value_.__r.__words[0] = (std::string::size_type)&v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
  v7 = &off_24C331570;
  v6.__r_.__value_.__r.__words[0] = (std::string::size_type)&v8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
}

void sub_20A9042C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void ***a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, void (**a16)(mediaplatform::FilePath *__hidden this), uint64_t a17)
{
  a10 = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  a16 = &off_24C331570;
  a13 = (void **)&a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

BOOL mediaplatform::FilePath::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 **v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  _BOOL8 result;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned __int8 ***)(a2 + 8);
  if (v2 - v3 != *(_QWORD *)(a2 + 16) - (_QWORD)v4)
    return 0;
  if (v3 != v2)
  {
    while (1)
    {
      v5 = *(unsigned __int8 *)(v3 + 23);
      if ((v5 & 0x80u) == 0)
        v6 = (unsigned __int8 *)*(unsigned __int8 *)(v3 + 23);
      else
        v6 = *(unsigned __int8 **)(v3 + 8);
      v7 = (unsigned __int8 *)*((unsigned __int8 *)v4 + 23);
      v8 = (char)v7;
      if ((char)v7 < 0)
        v7 = v4[1];
      if (v6 != v7)
        break;
      if (v8 >= 0)
        v9 = (unsigned __int8 *)v4;
      else
        v9 = *v4;
      if ((v5 & 0x80) != 0)
      {
        result = memcmp(*(const void **)v3, v9, *(_QWORD *)(v3 + 8)) == 0;
      }
      else if (*(_BYTE *)(v3 + 23))
      {
        v10 = 0;
        v11 = v5 - 1;
        do
        {
          v12 = *(unsigned __int8 *)(v3 + v10);
          v13 = v9[v10];
          result = v12 == v13;
        }
        while (v12 == v13 && v11 != v10++);
      }
      else
      {
        result = 1;
      }
      v3 += 24;
      v4 += 3;
      if (!result || v3 == v2)
        return result;
    }
    return 0;
  }
  return 1;
}

BOOL mediaplatform::FilePath::operator!=(uint64_t a1, uint64_t a2)
{
  return !mediaplatform::FilePath::operator==(a1, a2);
}

BOOL mediaplatform::FilePath::empty(mediaplatform::FilePath *this)
{
  return *((_QWORD *)this + 2) == *((_QWORD *)this + 1);
}

void mediaplatform::FilePath::lastPathComponent(mediaplatform::FilePath *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 2);
  if (v2 == *((_QWORD *)this + 1))
  {
    *(_BYTE *)(a2 + 23) = 1;
    *(_WORD *)a2 = 47;
  }
  else if (*(char *)(v2 - 1) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a2, *(const std::string::value_type **)(v2 - 24), *(_QWORD *)(v2 - 16));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)(v2 - 24);
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(v2 - 8);
  }
}

mediaplatform::FilePath *mediaplatform::FilePath::removeLastPathComponent(mediaplatform::FilePath *this)
{
  uint64_t v2;
  void **v3;

  v2 = *((_QWORD *)this + 2);
  if (v2 != *((_QWORD *)this + 1))
  {
    v3 = (void **)(v2 - 24);
    if (*(char *)(v2 - 1) < 0)
      operator delete(*v3);
    *((_QWORD *)this + 2) = v3;
  }
  return this;
}

mediaplatform::FilePath *mediaplatform::FilePath::removeLastPathComponents(mediaplatform::FilePath *this, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int128 v9;

  v3 = *((_QWORD *)this + 2);
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *((_QWORD *)this + 1)) >> 3);
  if (v4 >= a2)
    v4 = a2;
  if (8 * v4 != 32 * v4)
  {
    v5 = v3 - 24 * v4;
    v6 = 3 * v4;
    if (v5 + 8 * v6 != v3)
    {
      v7 = 8 * ((8 * v6) >> 3);
      do
      {
        if (*(char *)(v5 + 23) < 0)
          operator delete(*(void **)v5);
        v8 = (_BYTE *)(v5 + v7);
        v9 = *(_OWORD *)(v5 + v7);
        *(_QWORD *)(v5 + 16) = *(_QWORD *)(v5 + v7 + 16);
        *(_OWORD *)v5 = v9;
        v5 += 24;
        v8[23] = 0;
        *v8 = 0;
      }
      while (v5 + v7 != v3);
      v3 = *((_QWORD *)this + 2);
    }
    while (v3 != v5)
    {
      if (*(char *)(v3 - 1) < 0)
        operator delete(*(void **)(v3 - 24));
      v3 -= 24;
    }
    *((_QWORD *)this + 2) = v5;
  }
  return this;
}

unint64_t mediaplatform::FilePath::pathComponentsCount(mediaplatform::FilePath *this)
{
  return 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)this + 2) - *((_QWORD *)this + 1)) >> 3);
}

_QWORD *mediaplatform::operator<<(_QWORD *a1, mediaplatform::FilePath *this)
{
  void **v3;
  uint64_t v4;
  void *__p[2];
  unsigned __int8 v7;

  mediaplatform::FilePath::str(this, (uint64_t)__p);
  if ((v7 & 0x80u) == 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  if ((v7 & 0x80u) == 0)
    v4 = v7;
  else
    v4 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v3, v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_20A904628(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mediaplatform::UnicodeSearch::~UnicodeSearch(uint64_t **this)
{
  *this = (uint64_t *)&off_24C330DC8;
  std::unique_ptr<mediaplatform::UnicodeSearch::Context>::reset[abi:ne180100](this + 1);
}

{
  *this = (uint64_t *)&off_24C330DC8;
  std::unique_ptr<mediaplatform::UnicodeSearch::Context>::reset[abi:ne180100](this + 1);
  JUMPOUT(0x20BD27AFCLL);
}

{
  *this = (uint64_t *)&off_24C330DC8;
  std::unique_ptr<mediaplatform::UnicodeSearch::Context>::reset[abi:ne180100](this + 1);
}

uint64_t **std::unique_ptr<mediaplatform::UnicodeSearch::Context>::reset[abi:ne180100](uint64_t **result)
{
  uint64_t *v1;
  UText *v2;
  uint64_t v3;

  v1 = *result;
  *result = 0;
  if (v1)
  {
    usearch_close();
    ubrk_close();
    v2 = (UText *)v1[3];
    if (v2)
      utext_close(v2);
    if (*((char *)v1 + 111) < 0)
      operator delete((void *)v1[11]);
    if (*((char *)v1 + 87) < 0)
      operator delete((void *)v1[8]);
    if (*((char *)v1 + 63) < 0)
      operator delete((void *)v1[5]);
    v3 = *v1;
    *v1 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    JUMPOUT(0x20BD27AFCLL);
  }
  return result;
}

_QWORD *mediaplatform::UnicodeSearch::UnicodeSearch(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v6;
  mediaplatform::UnicodeCollator *v7;
  uint64_t v8;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *__p[2];
  char v15;
  int v16;

  *a1 = &off_24C330DC8;
  v6 = operator new();
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 88) = 0u;
  *(_QWORD *)(v6 + 104) = 0;
  v16 = 0;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  LOWORD(__p[0]) = 65;
  MEMORY[0x20BD277B4](v6 + 40, __p, 2);
  *(_QWORD *)(v6 + 24) = 0;
  *(_BYTE *)(v6 + 112) = 1;
  *(_DWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 16) = ubrk_open();
  v7 = (mediaplatform::UnicodeCollator *)operator new();
  std::string::basic_string[abi:ne180100]<0>(&v12, "collation");
  std::string::basic_string[abi:ne180100]<0>(&v10, "search");
  mediaplatform::LocaleIdentifierWithOption(a2, __p);
  mediaplatform::UnicodeCollator::UnicodeCollator(v7);
  v8 = *(_QWORD *)v6;
  *(_QWORD *)v6 = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  if (v15 < 0)
    operator delete(__p[0]);
  if (v11 < 0)
    operator delete(v10);
  if (v13 < 0)
    operator delete(v12);
  mediaplatform::UnicodeCollator::setAttribute();
  *(_QWORD *)(v6 + 8) = usearch_openFromCollator();
  mediaplatform::UnicodeSearch::Context::updateSearchCollator(v6, a3);
  a1[1] = v6;
  return a1;
}

void sub_20A904930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t *v26;
  void **v27;
  uint64_t v28;
  uint64_t v30;

  if (a26 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (a20 < 0)
    operator delete(a15);
  MEMORY[0x20BD27AFC](v28, 0xA1C40BD48D6D6);
  if (*((char *)v26 + 111) < 0)
    operator delete((void *)v26[11]);
  if (*((char *)v26 + 87) < 0)
    operator delete((void *)v26[8]);
  if (*((char *)v26 + 63) < 0)
    operator delete(*v27);
  v30 = *v26;
  *v26 = 0;
  if (v30)
    (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
  MEMORY[0x20BD27AFC](v26, 0x1032C406F2108EFLL);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::UnicodeSearch::Context::updateSearchCollator(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 || (mediaplatform::UnicodeCollator::setAttribute(), (a2 & 2) == 0))
    mediaplatform::UnicodeCollator::setAttribute();
  mediaplatform::UnicodeCollator::setAttribute();
  return usearch_reset();
}

BOOL mediaplatform::UnicodeSearch::matches(uint64_t a1, uint64_t a2, std::string *__str, int a4)
{
  size_t v5;
  size_t size;
  size_t v7;
  uint64_t v11;
  _BOOL8 result;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;
  std::string *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t MatchedLength;
  uint64_t v34;
  uint64_t v35;
  int v36;
  _BOOL4 v37;
  int v38;
  BOOL v39;
  char v40;
  uint64_t v41;
  const UChar *v42;
  uint64_t v43;
  UChar32 v44;
  int isUUppercase;
  UChar32 v46;
  int v47;
  UChar32 v48;
  BOOL v49;
  int v50;
  BOOL v51;
  int isBoundary;
  __int128 v53;
  uint64_t v54;
  UErrorCode status;

  v5 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  size = __str->__r_.__value_.__l.__size_;
  if ((v5 & 0x80u) == 0)
    v7 = v5;
  else
    v7 = size;
  if (!v7)
    return 0;
  status = U_ZERO_ERROR;
  v11 = *(_QWORD *)(a1 + 8);
  if (*(char *)(v11 + 87) < 0)
  {
    if (!*(_QWORD *)(v11 + 72))
      goto LABEL_23;
  }
  else if (!*(_BYTE *)(v11 + 87))
  {
    goto LABEL_23;
  }
  v13 = *(unsigned __int8 *)(v11 + 63);
  v14 = (char)v13;
  if ((v13 & 0x80u) != 0)
    v13 = *(_QWORD *)(v11 + 48);
  if (v7 == v13)
  {
    if (v14 >= 0)
      v15 = (unsigned __int8 *)(v11 + 40);
    else
      v15 = *(unsigned __int8 **)(v11 + 40);
    if ((v5 & 0x80) != 0)
    {
      if (!memcmp(__str->__r_.__value_.__l.__data_, v15, size))
        goto LABEL_48;
    }
    else
    {
      if (!(_DWORD)v5)
        goto LABEL_48;
      v16 = __str;
      while (v16->__r_.__value_.__s.__data_[0] == *v15)
      {
        v16 = (std::string *)((char *)v16 + 1);
        ++v15;
        if (!--v5)
          goto LABEL_48;
      }
    }
  }
LABEL_23:
  std::string::operator=((std::string *)(v11 + 40), __str);
  mediaplatform::StringToUCharString((uint64_t)__str, &v53);
  v17 = *(_QWORD *)(a1 + 8);
  v18 = v17 + 64;
  if (*(char *)(v17 + 87) < 0)
    operator delete(*(void **)v18);
  *(_OWORD *)v18 = v53;
  *(_QWORD *)(v18 + 16) = v54;
  usearch_setPattern();
  v19 = 0;
  v20 = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(v20 + 112) = 1;
  v21 = *(unsigned __int8 *)(v20 + 87);
  if ((v21 & 0x80) != 0)
    goto LABEL_28;
  while (1)
  {
    v22 = v20 + 64;
    if (v19 >= v21)
      break;
    while (1)
    {
      v23 = *(_WORD *)(v22 + 2 * v19);
      if ((unsigned __int16)(v23 + 160) < 0x50u
        || (v23 & 0xFF80) == 0xE00
        || (unsigned __int16)((unsigned __int16)(v23 - 11904) >> 7) <= 0x196u)
      {
        *(_BYTE *)(v20 + 112) = 0;
      }
      ++v19;
      if ((v21 & 0x80) == 0)
        break;
LABEL_28:
      v24 = *(_QWORD *)(v20 + 72);
      if (v24 <= v19)
        goto LABEL_36;
      v22 = *(_QWORD *)(v20 + 64);
    }
  }
  v24 = v21;
LABEL_36:
  if (v24 && (*(_BYTE *)(v20 + 32) & 4) != 0)
  {
    usearch_setText();
    LOBYTE(v25) = 1;
    do
      v25 = ((int)usearch_getMatchedLength() < 1) & v25;
    while (usearch_next() != -1);
    v26 = *(_QWORD *)(a1 + 8);
    if (v25)
      v27 = *(_DWORD *)(v26 + 32) & 0xFB;
    else
      v27 = *(_DWORD *)(v26 + 32);
    mediaplatform::UnicodeSearch::Context::updateSearchCollator(v26, v27);
  }
  if (status >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    v28 = *(_QWORD *)(a1 + 8);
    v29 = (_QWORD *)(v28 + 40);
    if (*(char *)(v28 + 63) < 0)
      v29 = (_QWORD *)*v29;
    result = 0;
    *(_BYTE *)v29 = 0;
    return result;
  }
LABEL_48:
  mediaplatform::StringToUCharString(a2, &v53);
  v30 = *(_QWORD *)(a1 + 8);
  v31 = v30 + 88;
  if (*(char *)(v30 + 111) < 0)
    operator delete(*(void **)v31);
  *(_OWORD *)v31 = v53;
  *(_QWORD *)(v31 + 16) = v54;
  usearch_setText();
  if (a4 != 3)
  {
    v36 = usearch_first();
    v37 = 0;
    v38 = v36;
    switch(a4)
    {
      case 0:
        goto LABEL_64;
      case 1:
        v39 = v36 == -1;
        goto LABEL_61;
      case 2:
        v39 = v36 == 0;
        goto LABEL_61;
      case 4:
        if (v36)
          goto LABEL_70;
        MatchedLength = (int)usearch_getMatchedLength();
        goto LABEL_53;
      case 5:
      case 6:
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 8) + 112))
        {
LABEL_64:
          v37 = v36 != -1;
          return status < U_ILLEGAL_ARGUMENT_ERROR && v37;
        }
        if (v36 == -1)
          goto LABEL_70;
        ubrk_setText();
        if (status > U_ZERO_ERROR)
          goto LABEL_70;
        v40 = 0;
        break;
      default:
        return status < U_ILLEGAL_ARGUMENT_ERROR && v37;
    }
    while (1)
    {
      if ((int)usearch_getMatchedLength() >= 1)
      {
        if (ubrk_isBoundary())
        {
          if (a4 == 5 || (usearch_getMatchedLength(), ubrk_isBoundary()))
          {
LABEL_101:
            v37 = 1;
            return status < U_ILLEGAL_ARGUMENT_ERROR && v37;
          }
        }
        else
        {
          if ((v40 & 1) == 0)
          {
            v41 = *(_QWORD *)(a1 + 8);
            if (*(char *)(v41 + 111) < 0)
            {
              v42 = *(const UChar **)(v41 + 88);
              v43 = *(_QWORD *)(v41 + 96);
            }
            else
            {
              v42 = (const UChar *)(v41 + 88);
              LODWORD(v43) = *(unsigned __int8 *)(v41 + 111);
            }
            *(_QWORD *)(*(_QWORD *)(a1 + 8) + 24) = utext_openUChars(*(UText **)(v41 + 24), v42, (int)v43, &status);
          }
          utext_setNativeIndex(*(UText **)(*(_QWORD *)(a1 + 8) + 24), v38);
          utext_moveIndex32(*(UText **)(*(_QWORD *)(a1 + 8) + 24), -1);
          v44 = utext_next32(*(UText **)(*(_QWORD *)(a1 + 8) + 24));
          isUUppercase = u_isUUppercase(v44);
          v46 = utext_next32(*(UText **)(*(_QWORD *)(a1 + 8) + 24));
          v47 = u_isUUppercase(v46);
          v48 = utext_next32(*(UText **)(*(_QWORD *)(a1 + 8) + 24));
          if (u_isUUppercase(v48))
            v49 = isUUppercase == 0;
          else
            v49 = 1;
          v50 = v49;
          if (v47)
            v51 = v50 == 0;
          else
            v51 = 1;
          if (v51)
          {
            v40 = 1;
          }
          else
          {
            if (a4 == 5)
              goto LABEL_101;
            usearch_getMatchedLength();
            isBoundary = ubrk_isBoundary();
            v40 = 1;
            v37 = 1;
            if (isBoundary)
              return status < U_ILLEGAL_ARGUMENT_ERROR && v37;
          }
        }
      }
      v38 = usearch_next();
      v37 = 0;
      if (v38 == -1)
        return status < U_ILLEGAL_ARGUMENT_ERROR && v37;
    }
  }
  v32 = usearch_last();
  if (v32 == -1)
  {
LABEL_70:
    v37 = 0;
  }
  else
  {
    MatchedLength = (int)(usearch_getMatchedLength() + v32);
LABEL_53:
    v34 = *(_QWORD *)(a1 + 8);
    if (*(char *)(v34 + 111) < 0)
      v35 = *(_QWORD *)(v34 + 96);
    else
      v35 = *(unsigned __int8 *)(v34 + 111);
    v39 = v35 == MatchedLength;
LABEL_61:
    v37 = v39;
  }
  return status < U_ILLEGAL_ARGUMENT_ERROR && v37;
}

uint64_t mlcore::LocalizedSectionHeader::LocalizedSectionHeader(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  std::vector<std::string> *v6;
  void *v7;
  void *v8;
  void *v10[2];
  char v11;
  std::wstring v12;
  std::wstring __p;
  void *v14[2];
  char v15;
  std::wstring *v16;

  *(_OWORD *)(a1 + 8) = 0u;
  v6 = (std::vector<std::string> *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  std::string::basic_string[abi:ne180100]<0>(&__p, "FirstCharacterAfterLanguage");
  mediaplatform::PropertyList::valueForKey<std::string>(v14, a2, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  mediaplatform::UTF8ToUTF16String((uint64_t)v14, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    v7 = (void *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)a1 = *__p.__r_.__value_.__l.__data_;
    operator delete(v7);
  }
  else
  {
    *(_DWORD *)a1 = __p.__r_.__value_.__s.__data_[0];
  }
  std::string::basic_string[abi:ne180100]<0>(&v12, "LastCharacter");
  mediaplatform::PropertyList::valueForKey<std::string>(&__p, a2, (uint64_t)&v12);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  mediaplatform::UTF8ToUTF16String((uint64_t)&__p, &v12);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
  {
    v8 = (void *)v12.__r_.__value_.__r.__words[0];
    *(_DWORD *)(a1 + 4) = *v12.__r_.__value_.__l.__data_;
    operator delete(v8);
  }
  else
  {
    *(_DWORD *)(a1 + 4) = v12.__r_.__value_.__s.__data_[0];
  }
  std::string::basic_string[abi:ne180100]<0>(v10, "Headers");
  mediaplatform::PropertyList::arrayValueForKey<std::string>((uint64_t)&v12, a2, (uint64_t)v10);
  std::vector<std::string>::__vdeallocate(v6);
  *(std::wstring *)(a1 + 8) = v12;
  memset(&v12, 0, sizeof(v12));
  v16 = &v12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  if (v11 < 0)
    operator delete(v10[0]);
  mlcore::LocalizedSectionHeader::_initializeLocalizedHeaderTitles(a1, a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v15 < 0)
    operator delete(v14[0]);
  return a1;
}

void sub_20A90519C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (a27 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);
  a28 = (void *)(v33 + 32);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a28);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a28);
  _Unwind_Resume(a1);
}

uint64_t mlcore::LocalizedSectionHeader::firstCharacterAfterLanguage(mlcore::LocalizedSectionHeader *this)
{
  return *(unsigned int *)this;
}

uint64_t mlcore::LocalizedSectionHeader::lastCharacterInLanguage(mlcore::LocalizedSectionHeader *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t mlcore::LocalizedSectionHeader::headerTitles(mlcore::LocalizedSectionHeader *this)
{
  return (uint64_t)this + 8;
}

uint64_t mlcore::LocalizedSectionHeader::localizedHeaderTitles(mlcore::LocalizedSectionHeader *this)
{
  return (uint64_t)this + 32;
}

uint64_t mlcore::EntityClass::classFromType(mlcore::EntityClass *this)
{
  uint64_t result;

  switch((int)this)
  {
    case 0:
      result = mlcore::TypedEntityClass<mlcore::Item>::sharedPointer();
      break;
    case 1:
      result = mlcore::TypedEntityClass<mlcore::Playlist>::sharedPointer();
      break;
    case 2:
      result = mlcore::TypedEntityClass<mlcore::ItemArtist>::sharedPointer();
      break;
    case 3:
      result = mlcore::TypedEntityClass<mlcore::Genre>::sharedPointer();
      break;
    case 4:
      result = mlcore::TypedEntityClass<mlcore::Album>::sharedPointer();
      break;
    case 5:
      result = mlcore::TypedEntityClass<mlcore::Composer>::sharedPointer();
      break;
    case 7:
      result = mlcore::TypedEntityClass<mlcore::Artist>::sharedPointer();
      break;
    case 8:
      result = mlcore::TypedEntityClass<mlcore::LibraryProperty>::sharedPointer();
      break;
    case 9:
      result = mlcore::TypedEntityClass<mlcore::PlaylistItem>::sharedPointer();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t mlcore::EntityClass::propertyForName(uint64_t a1, __int128 *a2)
{
  std::mutex *v4;
  uint64_t v5;
  __int128 *v7;

  v4 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  v7 = a2;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)(a1 + 72), (unsigned __int8 *)a2, &v7)+ 5);
  std::mutex::unlock(v4);
  return v5;
}

void sub_20A905314(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void mlcore::EntityClass::databaseTablesToDeleteFrom(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void mlcore::EntityClass::databaseTablesToInsertInto(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t mlcore::EntityClass::classForForeignPropertyName(uint64_t a1, unsigned __int8 *a2)
{
  std::mutex *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unint64_t v8;

  v4 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  v5 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)(a1 + 72), a2);
  if (v5)
  {
    v8 = *((_QWORD *)v5 + 5);
    v6 = std::__hash_table<std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::__unordered_map_hasher<mlcore::ModelPropertyBase *,std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,true>,std::__unordered_map_equal<mlcore::ModelPropertyBase *,std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::equal_to<mlcore::ModelPropertyBase *>,std::hash<mlcore::ModelPropertyBase *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelPropertyBase * const&>,std::tuple<>>((float *)(a1 + 112), v8, &v8)[3];
  }
  else
  {
    v6 = 0;
  }
  std::mutex::unlock(v4);
  return v6;
}

void sub_20A9053B8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::__unordered_map_hasher<mlcore::ModelPropertyBase *,std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,true>,std::__unordered_map_equal<mlcore::ModelPropertyBase *,std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::equal_to<mlcore::ModelPropertyBase *>,std::hash<mlcore::ModelPropertyBase *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelPropertyBase * const&>,std::tuple<>>(float *a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD **v11;
  _QWORD *i;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  _QWORD *v35;

  v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = *((_QWORD *)a1 + 1);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v3 = v8 % v9;
    }
    else
    {
      v3 = v8 & (v9 - 1);
    }
    v11 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == a2)
            return i;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v8;
  i[2] = *a3;
  i[3] = 0;
  v14 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v15 = a1[8];
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    v16 = 1;
    if (v9 >= 3)
      v16 = (v9 & (v9 - 1)) != 0;
    v17 = v16 | (2 * v9);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      prime = (int8x8_t)v18;
    else
      prime = (int8x8_t)v17;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v9 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v9)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v9)
    {
      v26 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (*(_QWORD *)&prime <= v26)
        prime = (int8x8_t)v26;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v20 = operator new(8 * *(_QWORD *)&prime);
          v21 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v20;
          if (v21)
            operator delete(v21);
          v22 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v22++) = 0;
          while (*(_QWORD *)&prime != v22);
          v23 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v23)
          {
            v24 = v23[1];
            v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(_QWORD *)&prime)
                v24 %= *(_QWORD *)&prime;
            }
            else
            {
              v24 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = a1 + 4;
            v29 = (_QWORD *)*v23;
            if (*v23)
            {
              do
              {
                v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(_QWORD *)&prime)
                    v30 %= *(_QWORD *)&prime;
                }
                else
                {
                  v30 &= *(_QWORD *)&prime - 1;
                }
                if (v30 != v24)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v30))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *v23 = *v29;
                  *v29 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v30);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v30) = v29;
                  v29 = v23;
                }
                v30 = v24;
LABEL_55:
                v23 = v29;
                v29 = (_QWORD *)*v29;
                v24 = v30;
              }
              while (v29);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        v35 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v35)
          operator delete(v35);
        v9 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v31 = *(_QWORD **)a1;
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v32)
  {
    *i = *v32;
LABEL_72:
    *v32 = i;
    goto LABEL_73;
  }
  *i = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = i;
  v31[v3] = a1 + 4;
  if (*i)
  {
    v33 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v33 >= v9)
        v33 %= v9;
    }
    else
    {
      v33 &= v9 - 1;
    }
    v32 = (_QWORD *)(*(_QWORD *)a1 + 8 * v33);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
  return i;
}

void sub_20A9057D4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void mlcore::EntityClass::setClassForForeignPropertyName(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  std::mutex *v6;
  unsigned __int8 *v7;
  std::runtime_error *exception;
  std::string v9;

  v6 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  v7 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((_QWORD *)(a1 + 72), a2);
  if (!v7)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    std::runtime_error::runtime_error(exception, &v9);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v9.__r_.__value_.__r.__words[0] = *((_QWORD *)v7 + 5);
  std::__hash_table<std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::__unordered_map_hasher<mlcore::ModelPropertyBase *,std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::hash<mlcore::ModelPropertyBase *>,std::equal_to<mlcore::ModelPropertyBase *>,true>,std::__unordered_map_equal<mlcore::ModelPropertyBase *,std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>,std::equal_to<mlcore::ModelPropertyBase *>,std::hash<mlcore::ModelPropertyBase *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelPropertyBase *,mlcore::EntityClass *>>>::__emplace_unique_key_args<mlcore::ModelPropertyBase *,std::piecewise_construct_t const&,std::tuple<mlcore::ModelPropertyBase * const&>,std::tuple<>>((float *)(a1 + 112), v9.__r_.__value_.__r.__words[0], &v9)[3] = a3;
  std::mutex::unlock(v6);
}

void sub_20A9058A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  std::mutex *v15;
  void *v16;
  int v17;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
    {
LABEL_6:
      std::mutex::unlock(v15);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

void std::vector<std::pair<mlcore::EntityClass *,mlcore::PropertyCache>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 224;
        mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((_QWORD *)v4 - 27);
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void mlcore::MultiEntityQueryResult::~MultiEntityQueryResult(std::exception *this)
{
  std::exception *v2;

  this->__vftable = (std::exception_vtbl *)&off_24C33A358;
  v2 = this + 23;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[39]);
  std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>>>::~__hash_table((uint64_t)&this[34]);
  this->__vftable = (std::exception_vtbl *)&off_24C339748;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[32]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[27]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[25]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[20]);
  mlcore::QueryResult::~QueryResult(this);
}

{
  std::exception *v2;

  this->__vftable = (std::exception_vtbl *)&off_24C33A358;
  v2 = this + 23;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[39]);
  std::__hash_table<std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::__unordered_map_hasher<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::hash<mlcore::EntityClass *>,std::equal_to<mlcore::EntityClass *>,true>,std::__unordered_map_equal<mlcore::EntityClass *,std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>,std::equal_to<mlcore::EntityClass *>,std::hash<mlcore::EntityClass *>,true>,std::allocator<std::__hash_value_type<mlcore::EntityClass *,std::vector<mlcore::ModelPropertyBase *>>>>::~__hash_table((uint64_t)&this[34]);
  this->__vftable = (std::exception_vtbl *)&off_24C339748;
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[32]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[27]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[25]);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&this[20]);
  mlcore::QueryResult::~QueryResult(this);
  JUMPOUT(0x20BD27AFCLL);
}

void **std::default_delete<std::vector<mlcore::EntityClass *>>::operator()[abi:ne180100](void **result)
{
  void **v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = *result;
    if (v2)
    {
      v1[1] = v2;
      operator delete(v2);
    }
    JUMPOUT(0x20BD27AFCLL);
  }
  return result;
}

void std::__shared_ptr_pointer<std::vector<mlcore::EntityClass *> *,std::shared_ptr<std::vector<mlcore::EntityClass *>>::__shared_ptr_default_delete<std::vector<mlcore::EntityClass *>,std::vector<mlcore::EntityClass *>>,std::allocator<std::vector<mlcore::EntityClass *>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void **std::__shared_ptr_pointer<std::vector<mlcore::EntityClass *> *,std::shared_ptr<std::vector<mlcore::EntityClass *>>::__shared_ptr_default_delete<std::vector<mlcore::EntityClass *>,std::vector<mlcore::EntityClass *>>,std::allocator<std::vector<mlcore::EntityClass *>>>::__on_zero_shared(uint64_t a1)
{
  return std::default_delete<std::vector<mlcore::EntityClass *>>::operator()[abi:ne180100](*(void ***)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<std::vector<mlcore::EntityClass *> *,std::shared_ptr<std::vector<mlcore::EntityClass *>>::__shared_ptr_default_delete<std::vector<mlcore::EntityClass *>,std::vector<mlcore::EntityClass *>>,std::allocator<std::vector<mlcore::EntityClass *>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000020A91F9DFLL))
    return a1 + 24;
  else
    return 0;
}

_QWORD *std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[27];

  v2 = *a1;
  *a1 = *a2;
  v3 = (uint64_t)(a1 + 1);
  *a2 = v2;
  v4 = (uint64_t)(a2 + 1);
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v6, (uint64_t)(a1 + 1));
  v6[0] = &off_24C3371C0;
  v6[26] = &unk_24C3371E8;
  mlcore::PropertyCache::operator=(v3, v4);
  mlcore::PropertyCache::operator=(v4, (uint64_t)v6);
  return mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v6);
}

void sub_20A905C88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase((uint64_t *)va);
  _Unwind_Resume(a1);
}

_QWORD *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t *v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;

  v5 = *(_QWORD *)(*(_QWORD *)a4 + 24);
  if (!v5)
    goto LABEL_17;
  v9 = a2 + 1;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v5 + 48))(v5, a2 + 1, a1 + 1);
  v11 = *(_QWORD *)(*(_QWORD *)a4 + 24);
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v11 + 48))(v11, a3 + 1, v9);
      if (!(_DWORD)result)
        return result;
      std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a2, a3);
      v14 = *(_QWORD *)(*(_QWORD *)a4 + 24);
      if (v14)
      {
        result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v14 + 48))(v14, v9, a1 + 1);
        if ((_DWORD)result)
        {
          v12 = a1;
          v15 = a2;
          return std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](v12, v15);
        }
        return result;
      }
    }
LABEL_17:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  if (!v11)
    goto LABEL_17;
  if ((*(unsigned int (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v11 + 48))(v11, a3 + 1, v9))
  {
    v12 = a1;
LABEL_14:
    v15 = a3;
    return std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](v12, v15);
  }
  std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a1, a2);
  v16 = *(_QWORD *)(*(_QWORD *)a4 + 24);
  if (!v16)
    goto LABEL_17;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v16 + 48))(v16, a3 + 1, v9);
  if ((_DWORD)result)
  {
    v12 = a2;
    goto LABEL_14;
  }
  return result;
}

_QWORD *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  uint64_t v13;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(a1, a2, a3, a5);
  v10 = *(_QWORD *)(*(_QWORD *)a5 + 24);
  if (!v10)
    goto LABEL_9;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v10 + 48))(v10, a4 + 1, a3 + 1);
  if (!(_DWORD)result)
    return result;
  std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a3, a4);
  v12 = *(_QWORD *)(*(_QWORD *)a5 + 24);
  if (!v12)
    goto LABEL_9;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v12 + 48))(v12, a3 + 1, a2 + 1);
  if (!(_DWORD)result)
    return result;
  std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a2, a3);
  v13 = *(_QWORD *)(*(_QWORD *)a5 + 24);
  if (!v13)
LABEL_9:
    std::__throw_bad_function_call[abi:ne180100]();
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v13 + 48))(v13, a2 + 1, a1 + 1);
  if ((_DWORD)result)
    return std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a1, a2);
  return result;
}

_QWORD *std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *,0>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(a1, a2, a3, a4, a6);
  v12 = *(_QWORD *)(*(_QWORD *)a6 + 24);
  if (!v12)
    goto LABEL_11;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v12 + 48))(v12, a5 + 1, a4 + 1);
  if (!(_DWORD)result)
    return result;
  std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a4, a5);
  v14 = *(_QWORD *)(*(_QWORD *)a6 + 24);
  if (!v14)
    goto LABEL_11;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v14 + 48))(v14, a4 + 1, a3 + 1);
  if (!(_DWORD)result)
    return result;
  std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a3, a4);
  v15 = *(_QWORD *)(*(_QWORD *)a6 + 24);
  if (!v15)
    goto LABEL_11;
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v15 + 48))(v15, a3 + 1, a2 + 1);
  if (!(_DWORD)result)
    return result;
  std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a2, a3);
  v16 = *(_QWORD *)(*(_QWORD *)a6 + 24);
  if (!v16)
LABEL_11:
    std::__throw_bad_function_call[abi:ne180100]();
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v16 + 48))(v16, a2 + 1, a1 + 1);
  if ((_DWORD)result)
    return std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a1, a2);
  return result;
}

uint64_t std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[27];

  v6 = 1;
  switch(0x6DB6DB6DB6DB6DB7 * (((char *)a2 - (char *)a1) >> 5))
  {
    case 0:
    case 1:
      return v6;
    case 2:
      v7 = *(_QWORD *)(*(_QWORD *)a3 + 24);
      if (!v7)
        goto LABEL_25;
      if ((*(unsigned int (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v7 + 48))(v7, a2 - 27, a1 + 1))
        std::pair<mlcore::EntityClass *,mlcore::PropertyCache>::swap[abi:ne180100](a1, a2 - 28);
      return v6;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(a1, a1 + 28, a2 - 28, a3);
      return v6;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(a1, a1 + 28, a1 + 56, a2 - 28, a3);
      return v6;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *,0>(a1, a1 + 28, a1 + 56, a1 + 84, a2 - 28, a3);
      return v6;
    default:
      v8 = a1 + 56;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_1 &,std::pair<mlcore::EntityClass *,mlcore::PropertyCache> *>(a1, a1 + 28, a1 + 56, a3);
      v9 = a1 + 84;
      if (a1 + 84 == a2)
        return 1;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    v12 = *(_QWORD *)(*(_QWORD *)a3 + 24);
    if (!v12)
LABEL_25:
      std::__throw_bad_function_call[abi:ne180100]();
    if (!(*(unsigned int (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v12 + 48))(v12, v9 + 1, v8 + 1))
      goto LABEL_19;
    v21 = *v9;
    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::PropertyCacheBase((uint64_t)v22, (uint64_t)(v9 + 1));
    v22[0] = &off_24C3371C0;
    v22[26] = &unk_24C3371E8;
    v13 = v10;
    while (1)
    {
      v14 = v13;
      v15 = (char *)a1 + v13;
      *((_QWORD *)v15 + 84) = *((_QWORD *)v15 + 56);
      mlcore::PropertyCache::operator=((uint64_t)(v15 + 680), (uint64_t)(v15 + 456));
      if (v14 == -448)
        break;
      v16 = *(_QWORD *)(*(_QWORD *)a3 + 24);
      if (!v16)
        std::__throw_bad_function_call[abi:ne180100]();
      v17 = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v16 + 48))(v16, v22, (uint64_t)a1 + v14 + 232);
      v13 = v14 - 224;
      if ((v17 & 1) == 0)
      {
        v18 = (uint64_t *)((char *)a1 + v13 + 672);
        v19 = (uint64_t)a1 + v14 + 456;
        goto LABEL_17;
      }
    }
    v19 = (uint64_t)(a1 + 1);
    v18 = a1;
LABEL_17:
    *v18 = v21;
    mlcore::PropertyCache::operator=(v19, (uint64_t)v22);
    if (++v11 == 8)
      break;
    mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v22);
LABEL_19:
    v8 = v9;
    v10 += 224;
    v9 += 28;
    if (v9 == a2)
      return 1;
  }
  v6 = v9 + 28 == a2;
  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v22);
  return v6;
}

void sub_20A906274(_Unwind_Exception *a1)
{
  _QWORD *v1;

  mlcore::PropertyCacheBase<long long,int,double,std::string,mediaplatform::Data>::~PropertyCacheBase(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mlcore::PropertyCache const&,BOOL &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mlcore::PropertyCache const&,BOOL &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C33B2F8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mlcore::PropertyCache const&,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C33B2F8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mlcore::PropertyCache const&,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore16MultiEntityQuery8_performENSt3__110shared_ptrINS_11TransactionEEENS1_8functionIFvNS2_INS_11QueryResultEEEEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0,std::allocator<mlcore::MultiEntityQuery::_perform(std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::QueryResult>)>)::$_0>,void ()(mlcore::PropertyCache const&,BOOL &)>::target_type()
{
}

void std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C33B198;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore14GetQueryResultINS_15PropertiesQueryEEENSt3__110shared_ptrINT_6ResultEEENS3_INS_11TransactionEEENS3_IS4_EEEUlNS3_INS_21PropertiesQueryResultEEEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::PropertiesQuery::Result> mlcore::GetQueryResult<mlcore::PropertiesQuery>(std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::PropertiesQuery::Result>)::{lambda(std::shared_ptr<mlcore::PropertiesQueryResult>)#1})>::target_type()
{
}

void std::__shared_ptr_emplace<mlcore::Transaction>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33C440;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::Transaction>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33C440;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void std::vector<mlcore::MultiSortDescriptor>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  void (**v8)(char *);
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = v4 - 56;
      v7 = v4 - 56;
      do
      {
        v8 = *(void (***)(char *))v7;
        v7 -= 56;
        (*v8)(v6);
        v9 = v6 == v2;
        v6 = v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *mlcore::MultiEntityQuery::propertiesToFetchForEntityClass(int8x8_t *this, unint64_t a2)
{
  int8x8_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v2 = this[27];
  if (!*(_QWORD *)&v2)
    goto LABEL_17;
  v3 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v3 >> 47) ^ v3);
  v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v5;
    if (v5 >= *(_QWORD *)&v2)
      v7 = v5 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v5 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(_QWORD **)(*(_QWORD *)&this[26] + 8 * v7);
  if (!v8 || (v9 = (_QWORD *)*v8) == 0)
LABEL_17:
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  while (1)
  {
    v10 = v9[1];
    if (v5 == v10)
      break;
    if (v6.u32[0] > 1uLL)
    {
      if (v10 >= *(_QWORD *)&v2)
        v10 %= *(_QWORD *)&v2;
    }
    else
    {
      v10 &= *(_QWORD *)&v2 - 1;
    }
    if (v10 != v7)
      goto LABEL_17;
LABEL_16:
    v9 = (_QWORD *)*v9;
    if (!v9)
      goto LABEL_17;
  }
  if (v9[2] != a2)
    goto LABEL_16;
  return v9 + 3;
}

uint64_t mlcore::MultiEntityQuery::multiSortDescriptors(mlcore::MultiEntityQuery *this)
{
  return (uint64_t)this + 288;
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<mlcore::MultiSortDescriptor *,mlcore::MultiSortDescriptor *,mlcore::MultiSortDescriptor *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  _QWORD *v10;
  _OWORD *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      if (a3 != v5)
      {
        *(_DWORD *)(a3 + 40) = *(_DWORD *)(v5 + 40);
        v6 = *(_QWORD **)(v5 + 24);
        v7 = *(_QWORD *)(a3 + 16);
        if (!v7)
          goto LABEL_12;
        for (i = 0; i != v7; *(_QWORD *)(*(_QWORD *)(a3 + 8) + 8 * i++) = 0)
          ;
        v9 = *(_QWORD **)(a3 + 24);
        *(_QWORD *)(a3 + 24) = 0;
        *(_QWORD *)(a3 + 32) = 0;
        if (v9)
        {
          while (v6)
          {
            v9[2] = v6[2];
            v9[3] = v6[3];
            v10 = (_QWORD *)*v9;
            std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::__unordered_map_hasher<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::hash<mlcore::ModelProperty<long long> *>,std::equal_to<mlcore::ModelProperty<long long> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::equal_to<mlcore::ModelProperty<long long> *>,std::hash<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>>>::__node_insert_multi(a3 + 8, v9);
            v6 = (_QWORD *)*v6;
            v9 = v10;
            if (!v10)
              goto LABEL_12;
          }
          do
          {
            v15 = (_QWORD *)*v9;
            operator delete(v9);
            v9 = v15;
          }
          while (v15);
        }
        else
        {
LABEL_12:
          while (v6)
          {
            v11 = operator new(0x20uLL);
            *(_QWORD *)v11 = 0;
            v11[1] = *((_OWORD *)v6 + 1);
            v12 = *((_QWORD *)v11 + 2);
            v13 = HIDWORD(v12);
            v14 = 0x9DDFEA08EB382D69 * (((8 * v12) + 8) ^ HIDWORD(v12));
            *((_QWORD *)v11 + 1) = 0x9DDFEA08EB382D69
                                 * ((0x9DDFEA08EB382D69 * (v13 ^ (v14 >> 47) ^ v14)) ^ ((0x9DDFEA08EB382D69
                                                                                         * (v13 ^ (v14 >> 47) ^ v14)) >> 47));
            std::__hash_table<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::__unordered_map_hasher<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::hash<mlcore::ModelProperty<long long> *>,std::equal_to<mlcore::ModelProperty<long long> *>,true>,std::__unordered_map_equal<mlcore::ModelProperty<long long> *,std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>,std::equal_to<mlcore::ModelProperty<long long> *>,std::hash<mlcore::ModelProperty<long long> *>,true>,std::allocator<std::__hash_value_type<mlcore::ModelProperty<long long> *,long long>>>::__node_insert_multi(a3 + 8, v11);
            v6 = (_QWORD *)*v6;
          }
        }
      }
      *(_DWORD *)(a3 + 48) = *(_DWORD *)(v5 + 48);
      v5 += 56;
      a3 += 56;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_20A906708(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_20A906728(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<mlcore::MultiSortDescriptor>,mlcore::MultiSortDescriptor*,mlcore::MultiSortDescriptor*,mlcore::MultiSortDescriptor*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    v6 = 0;
    do
    {
      *(_QWORD *)(a3 + v6) = &off_24C339DC0;
      std::unordered_map<mlcore::EntityClass *,mlcore::ModelPropertyBase *>::unordered_map(a3 + v6 + 8, a1 + v6 + 8);
      *(_DWORD *)(a3 + v6 + 48) = *(_DWORD *)(a1 + v6 + 48);
      v6 += 56;
    }
    while (a1 + v6 != a2);
    a3 += v6;
  }
  return a3;
}

uint64_t mlcore::MultiEntityQueryResult::MultiEntityQueryResult(uint64_t a1, uint64_t a2)
{
  std::exception v5;
  __int128 v6;
  void *v7;
  int v8;
  std::string v9;
  std::exception v10[8];
  std::string __p;

  v6 = *(_OWORD *)(a2 + 8);
  v5.__vftable = (std::exception_vtbl *)off_24C335E70;
  v7 = &unk_24C335EA0;
  v8 = *(_DWORD *)(a2 + 32);
  if (*(char *)(a2 + 63) < 0)
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
  else
    v9 = *(std::string *)(a2 + 40);
  mediaplatform::PlatformErrorCondition::PlatformErrorCondition((mediaplatform::PlatformErrorCondition *)v10, (const mediaplatform::PlatformErrorCondition *)(a2 + 64));
  if (*(char *)(a2 + 151) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 128), *(_QWORD *)(a2 + 136));
  else
    __p = *(std::string *)(a2 + 128);
  mlcore::EntityQueryResult::EntityQueryResult(a1, (uint64_t)&v5);
  v5.__vftable = (std::exception_vtbl *)off_24C335E70;
  v7 = &unk_24C335EA0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(v10);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
  std::exception::~exception(&v5);
  *(_QWORD *)a1 = &off_24C33A358;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_DWORD *)(a1 + 304) = 1065353216;
  *(_QWORD *)(a1 + 312) = 0;
  *(_QWORD *)(a1 + 320) = 0;
  return a1;
}

void sub_20A906940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  std::exception *v20;

  mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(v20);
  if (a20 < 0)
    operator delete(__p);
  std::exception::~exception(&a10);
  _Unwind_Resume(a1);
}

void mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(std::exception *this)
{
  mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(this);
  JUMPOUT(0x20BD27AFCLL);
}

{
  this->__vftable = (std::exception_vtbl *)&off_24C331320;
  this[3].__vftable = (std::exception_vtbl *)&unk_24C331350;
  if (SHIBYTE(this[7].__vftable) < 0)
    operator delete(this[5].__vftable);
  std::exception::~exception(this);
}

const char *mediaplatform::PlatformErrorCondition::what(mediaplatform::PlatformErrorCondition *this)
{
  uint64_t v2;

  mediaplatform::_GlobalPlatformErrorCategory(this);
  v2 = *((unsigned int *)this + 2);
  if (v2 > 0x23)
    return "An unknown database error occurred.";
  else
    return (&off_24C33DBD8)[v2];
}

void mediaplatform::PlatformErrorCondition::toString(mediaplatform::PlatformErrorCondition *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *__p[2];
  char v9;

  v5 = mediaplatform::_GlobalPlatformErrorCategory(this);
  (*(void (**)(void **__return_ptr, uint64_t, _QWORD))(*(_QWORD *)v5 + 48))(__p, v5, *((unsigned int *)this + 2));
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)this - 8) + 8) & 0x7FFFFFFFFFFFFFFFLL;
  v6 = *((_DWORD *)this + 2);
  mediaplatform::FormatString<char const*,int,std::string,std::string>(a2, (std::string *)"<{0}: ({1}) {2} \"{3}\">", (uint64_t)&v7, (uint64_t)&v6, (uint64_t)__p, (uint64_t)this + 40);
  if (v9 < 0)
    operator delete(__p[0]);
}

void sub_20A906A8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void `non-virtual thunk to'mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(std::exception *this)
{
  mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(this - 3);
}

{
  mediaplatform::PlatformErrorCondition::~PlatformErrorCondition(this - 3);
  JUMPOUT(0x20BD27AFCLL);
}

void `non-virtual thunk to'mediaplatform::PlatformErrorCondition::toString(mediaplatform::PlatformErrorCondition *this@<X0>, std::string *a2@<X8>)
{
  mediaplatform::PlatformErrorCondition::toString((mediaplatform::PlatformErrorCondition *)((char *)this - 24), a2);
}

uint64_t mediaplatform::_GlobalPlatformErrorCategory(mediaplatform *this)
{
  unsigned __int8 v1;
  _QWORD *v3;

  if ((v1 & 1) == 0
  {
    v3 = (_QWORD *)operator new();
    *v3 = &off_24C331268;
    mediaplatform::_GlobalPlatformErrorCategory(void)::__category = (uint64_t)v3;
  }
  return mediaplatform::_GlobalPlatformErrorCategory(void)::__category;
}

void sub_20A906B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void mediaplatform::PlatformErrorCategory::~PlatformErrorCategory(std::error_category *this)
{
  std::error_category::~error_category(this);
  JUMPOUT(0x20BD27AFCLL);
}

const char *mediaplatform::PlatformErrorCategory::name(mediaplatform::PlatformErrorCategory *this)
{
  return "MediaPlatform";
}

_QWORD *mediaplatform::PlatformErrorCategory::message@<X0>(unsigned int a1@<W1>, _QWORD *a2@<X8>)
{
  char *v3;

  if (a1 > 0x23)
    v3 = "An unknown database error occurred.";
  else
    v3 = (&off_24C33DBD8)[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

const char *mediaplatform::PlatformErrorCategory::message_c_str(mediaplatform::PlatformErrorCategory *this, unsigned int a2)
{
  if (a2 > 0x23)
    return "An unknown database error occurred.";
  else
    return (&off_24C33DBD8)[a2];
}

uint64_t mediaplatform::PlatformErrorCondition::PlatformErrorCondition(uint64_t a1, int *a2, __int128 *a3)
{
  int v6;
  uint64_t v7;
  std::string *v8;
  __int128 v9;

  v6 = *a2;
  v7 = mediaplatform::_GlobalPlatformErrorCategory((mediaplatform *)a1);
  *(_DWORD *)(a1 + 8) = v6;
  *(_QWORD *)a1 = &off_24C331320;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = &unk_24C331350;
  *(_DWORD *)(a1 + 32) = *a2;
  v8 = (std::string *)(a1 + 40);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v9 = *a3;
    *(_QWORD *)(a1 + 56) = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
  }
  return a1;
}

void sub_20A906CB4(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

mediaplatform::PlatformErrorCondition *mediaplatform::PlatformErrorCondition::PlatformErrorCondition(mediaplatform::PlatformErrorCondition *this, const mediaplatform::PlatformErrorCondition *a2)
{
  int v4;
  uint64_t v5;
  std::string *v6;
  __int128 v7;

  v4 = *((_DWORD *)a2 + 2);
  v5 = mediaplatform::_GlobalPlatformErrorCategory(this);
  *((_DWORD *)this + 2) = v4;
  *(_QWORD *)this = &off_24C331320;
  *((_QWORD *)this + 2) = v5;
  *((_QWORD *)this + 3) = &unk_24C331350;
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  v6 = (std::string *)((char *)this + 40);
  if (*((char *)a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 5), *((_QWORD *)a2 + 6));
  }
  else
  {
    v7 = *(_OWORD *)((char *)a2 + 40);
    *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_20A906D4C(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void mlcore::ContainerItemReactionTable::~ContainerItemReactionTable(mlcore::ContainerItemReactionTable *this)
{
  *(_QWORD *)this = off_24C336590;
  *((_QWORD *)this + 68) = off_24C335D90;
  if (*((char *)this + 575) < 0)
    operator delete(*((void **)this + 69));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 480);
  *((_QWORD *)this + 54) = off_24C335D90;
  if (*((char *)this + 463) < 0)
    operator delete(*((void **)this + 55));
  *((_QWORD *)this + 48) = off_24C335D90;
  if (*((char *)this + 415) < 0)
    operator delete(*((void **)this + 49));
  *((_QWORD *)this + 42) = off_24C335D90;
  if (*((char *)this + 367) < 0)
    operator delete(*((void **)this + 43));
  mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::~DatabaseTable((uint64_t)this);
}

{
  *(_QWORD *)this = off_24C336590;
  *((_QWORD *)this + 68) = off_24C335D90;
  if (*((char *)this + 575) < 0)
    operator delete(*((void **)this + 69));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 480);
  *((_QWORD *)this + 54) = off_24C335D90;
  if (*((char *)this + 463) < 0)
    operator delete(*((void **)this + 55));
  *((_QWORD *)this + 48) = off_24C335D90;
  if (*((char *)this + 415) < 0)
    operator delete(*((void **)this + 49));
  *((_QWORD *)this + 42) = off_24C335D90;
  if (*((char *)this + 367) < 0)
    operator delete(*((void **)this + 43));
  mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::~DatabaseTable((uint64_t)this);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::columnCount()
{
  return 5;
}

void mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::columnNames(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 288);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 240);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 192);
  mediaplatform::ColumnNamesApplier::operator()<std::string>((uint64_t)a2, a1 + 128);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 80);
}

void sub_20A906F04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::ContainerItemReactionTable::targetColumnExpression(mlcore::ContainerItemReactionTable *this@<X0>, const mediaplatform::DatabaseColumnBase *a2@<X2>, _QWORD *a3@<X8>)
{
  std::string __p;

  if (*((char *)a2 + 31) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
  else
    __p = *(std::string *)((char *)a2 + 8);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,std::string const&,void>(a3, (__int128 *)&__p, (__int128 *)((char *)this + 8));
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A906F9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::~DatabaseTable(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24C335A28;
  *(_QWORD *)(a1 + 288) = off_24C335D90;
  if (*(char *)(a1 + 319) < 0)
    operator delete(*(void **)(a1 + 296));
  *(_QWORD *)(a1 + 240) = off_24C335D90;
  if (*(char *)(a1 + 271) < 0)
    operator delete(*(void **)(a1 + 248));
  *(_QWORD *)(a1 + 192) = off_24C335D90;
  if (*(char *)(a1 + 223) < 0)
    operator delete(*(void **)(a1 + 200));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 128);
  *(_QWORD *)(a1 + 80) = off_24C335D90;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

{
  mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::targetColumnExpression(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  __int128 *v3;
  __int128 *v4[3];
  __int128 **v5;

  v3 = (__int128 *)(a1 + 8);
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)a1 + 24))(v4);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string &,std::string const&,void>(a2, v4[0], v3);
  v5 = v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void sub_20A9070DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::MediaTable<long long,long long,long long,std::string,long long>::~MediaTable(uint64_t a1)
{
  *(_QWORD *)a1 = off_24C336590;
  *(_QWORD *)(a1 + 544) = off_24C335D90;
  if (*(char *)(a1 + 575) < 0)
    operator delete(*(void **)(a1 + 552));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 480);
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  *(_QWORD *)(a1 + 384) = off_24C335D90;
  if (*(char *)(a1 + 415) < 0)
    operator delete(*(void **)(a1 + 392));
  *(_QWORD *)(a1 + 336) = off_24C335D90;
  if (*(char *)(a1 + 367) < 0)
    operator delete(*(void **)(a1 + 344));
  mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::~DatabaseTable(a1);
}

{
  *(_QWORD *)a1 = off_24C336590;
  *(_QWORD *)(a1 + 544) = off_24C335D90;
  if (*(char *)(a1 + 575) < 0)
    operator delete(*(void **)(a1 + 552));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 480);
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  *(_QWORD *)(a1 + 384) = off_24C335D90;
  if (*(char *)(a1 + 415) < 0)
    operator delete(*(void **)(a1 + 392));
  *(_QWORD *)(a1 + 336) = off_24C335D90;
  if (*(char *)(a1 + 367) < 0)
    operator delete(*(void **)(a1 + 344));
  mediaplatform::DatabaseTable<long long,long long,long long,std::string,long long>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mlcore::ContainerItemReactionTable::persistentIDColumn(mlcore::ContainerItemReactionTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 367) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 43), *((_QWORD *)this + 44));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 344);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 45);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 92);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 95);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 372);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemReactionTable::containerItemPersistentIDColumn(mlcore::ContainerItemReactionTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 415) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 49), *((_QWORD *)this + 50));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 392);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 51);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 104);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 107);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 420);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemReactionTable::personPersistentIDColumn(mlcore::ContainerItemReactionTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 463) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 55), *((_QWORD *)this + 56));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 440);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 57);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 116);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 119);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 468);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemReactionTable::reactionTextColumn(mlcore::ContainerItemReactionTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 511) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 61), *((_QWORD *)this + 62));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 488);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 63);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 128);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 516);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 543) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 65), *((_QWORD *)this + 66));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 520);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 67);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A907460(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ContainerItemReactionTable::dateColumn(mlcore::ContainerItemReactionTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 575) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 69), *((_QWORD *)this + 70));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 552);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 71);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 144);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 147);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 580);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::DeviceLibraryView::checkoutWriter(mlcore::DeviceLibraryView *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  mlcore::DeviceLibraryView::library(this, &v12);
  v3 = *(_QWORD *)(v12 + 152);
  v4 = *(std::__shared_weak_count **)(v12 + 160);
  v14 = v3;
  v15 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  mediaplatform::DatabaseConnectionPool::_checkoutConnection((mediaplatform::DatabaseConnectionPool *)(v3 + 184), 0, a2);
  if (v4)
  {
    v7 = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void sub_20A9075DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<mlcore::DeviceLibraryView>::shared_ptr[abi:ne180100]<mlcore::DeviceLibraryView,void>(_QWORD *a1, uint64_t a2, std::__shared_weak_count *this)
{
  std::__shared_weak_count *v4;

  *a1 = a2;
  if (!this)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v4 = std::__shared_weak_count::lock(this);
  a1[1] = v4;
  if (!v4)
    goto LABEL_5;
  return a1;
}

uint64_t mlcore::DeviceLibraryView::currentContentTasteRevision(mlcore::DeviceLibraryView *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  std::ios_base *v7;
  uint64_t v8;
  void *__p[2];
  _QWORD v11[10];
  char v12;
  uint64_t v13[19];
  std::string v14;
  unsigned int v15;

  v15 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "MLContentTasteRevision");
  mlcore::DeviceLibraryView::databaseValue(this, (uint64_t)__p, &v14);
  if (SHIBYTE(v11[0]) < 0)
    operator delete(__p[0]);
  v2 = MEMORY[0x24BEDB868];
  v3 = MEMORY[0x24BEDB868] + 64;
  v4 = MEMORY[0x24BEDB7F8];
  v5 = *(void **)(MEMORY[0x24BEDB7F8] + 8);
  v6 = *(void **)(MEMORY[0x24BEDB7F8] + 16);
  v13[0] = MEMORY[0x24BEDB868] + 64;
  __p[0] = v5;
  *(void **)((char *)__p + *((_QWORD *)v5 - 3)) = v6;
  __p[1] = 0;
  v7 = (std::ios_base *)((char *)__p + *((_QWORD *)__p[0] - 3));
  std::ios_base::init(v7, v11);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  __p[0] = (void *)(v2 + 24);
  v13[0] = v3;
  std::stringbuf::basic_stringbuf[abi:ne180100]((uint64_t)v11, &v14, 8);
  MEMORY[0x20BD278B0](__p, &v15);
  __p[0] = *(void **)v4;
  *(void **)((char *)__p + *((_QWORD *)__p[0] - 3)) = *(void **)(v4 + 24);
  v11[0] = MEMORY[0x24BEDB848] + 16;
  if (v12 < 0)
    operator delete((void *)v11[8]);
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x20BD27A84](v13);
  v8 = v15;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return v8;
}

void sub_20A90779C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  std::istringstream::~istringstream((uint64_t)&__p);
  if (*(char *)(v14 - 73) < 0)
    operator delete(*(void **)(v14 - 96));
  _Unwind_Resume(a1);
}

void mlcore::DeviceLibraryView::databaseValue(mlcore *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  std::string::size_type v6;
  uint64_t v7;
  uint64_t v8;
  mlcore *v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t (***v22)();
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  __int128 v32;
  std::__shared_weak_count *v33;
  dispatch_semaphore_t dsema;
  uint64_t v35;
  std::__shared_weak_count *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t (**v42)();
  _QWORD *v43;
  dispatch_semaphore_t *p_dsema;
  uint64_t (***v45)();
  __int128 v46;
  __int128 *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v6 = mlcore::DatabasePropertyPropertyKey(a1);
  std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<std::string>,std::allocator<mlcore::ComparisonPredicate<std::string>>,mlcore::ModelProperty<std::string> *&,mlcore::ComparisonOperator &,std::string const&,mlcore::ComparisonOptions &,void>(&v46, v6, 0, a2, 0);
  v32 = v46;
  v37 = v46;
  v7 = mlcore::TypedEntityClass<mlcore::DatabaseProperty>::sharedPointer();
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate> &,void>(&v35, v7, v32, *((std::__shared_weak_count **)&v32 + 1));
  v8 = v35;
  v10 = mlcore::DatabasePropertyPropertyValue(v9);
  v11 = (char *)operator new(8uLL);
  *(_QWORD *)v11 = v10;
  std::vector<mlcore::ModelPropertyBase *>::__assign_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>((char *)(v8 + 80), v11, (uint64_t)(v11 + 8), 1uLL);
  operator delete(v11);
  v12 = dispatch_semaphore_create(0);
  v13 = v36;
  v33 = v36;
  dsema = v12;
  if (!v36)
  {
    v42 = &off_24C33B350;
    v43 = a3;
    p_dsema = &dsema;
    v45 = &v42;
    v40 = v8;
    v41 = 0;
    v38 = 0;
    v39 = 0;
LABEL_10:
    v47 = &v46;
    std::__function::__func<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0,std::allocator<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::__clone((uint64_t)&v42, (uint64_t)&v46);
    goto LABEL_12;
  }
  p_shared_owners = (unint64_t *)&v36->__shared_owners_;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  v42 = &off_24C33B350;
  v43 = a3;
  p_dsema = &dsema;
  v45 = &v42;
  v40 = v8;
  v41 = v13;
  v16 = (unint64_t *)&v13->__shared_owners_;
  do
    v17 = __ldxr(v16);
  while (__stxr(v17 + 1, v16));
  v38 = 0;
  v39 = 0;
  if (v45)
  {
    if (v45 != &v42)
    {
      v47 = (__int128 *)(*v45)[2]();
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v47 = 0;
LABEL_12:
  mlcore::LibraryView::performQuery<mlcore::PropertiesQuery>((void (***)(_QWORD, uint64_t *, uint64_t *, _BYTE *))a1, v8, v13, &v38, (uint64_t)&v46);
  v18 = v47;
  if (v47 == &v46)
  {
    v19 = 4;
    v18 = &v46;
    goto LABEL_16;
  }
  if (v47)
  {
    v19 = 5;
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
  }
  if (v13)
  {
    v20 = (unint64_t *)&v13->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v22 = v45;
  if (v45 == &v42)
  {
    v23 = 4;
    v22 = &v42;
    goto LABEL_26;
  }
  if (v45)
  {
    v23 = 5;
LABEL_26:
    (*v22)[v23]();
  }
  if (v33)
  {
    v24 = (unint64_t *)&v33->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(dsema);
  v26 = v36;
  if (v36)
  {
    v27 = (unint64_t *)&v36->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
  if (*((_QWORD *)&v37 + 1))
  {
    v30 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
}

void sub_20A907B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, dispatch_object_t object, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,char *a26)
{
  uint64_t v26;
  char *v28;
  uint64_t v29;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
  v28 = a26;
  if (a26 == &a23)
  {
    v29 = 4;
    v28 = &a23;
  }
  else
  {
    if (!a26)
      goto LABEL_6;
    v29 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v28 + 8 * v29))();
LABEL_6:
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  dispatch_release(object);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  if (*(char *)(v26 + 23) < 0)
    operator delete(*(void **)v26);
  _Unwind_Resume(a1);
}

uint64_t std::istringstream::~istringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7F8];
  v3 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x20BD27A84](a1 + 120);
  return a1;
}

void std::__function::__func<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0,std::allocator<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0,std::allocator<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C33B350;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0,std::allocator<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C33B350;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0,std::allocator<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  mlcore *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::string v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *a2;
  v4 = (std::__shared_weak_count *)a2[1];
  *a2 = 0;
  a2[1] = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v5 = (mlcore *)std::vector<mlcore::PropertyCache>::__init_with_size[abi:ne180100]<mlcore::PropertyCache*,mlcore::PropertyCache*>((uint64_t)&v12, *(_QWORD *)(v3 + 160), *(_QWORD *)(v3 + 168), 0x84BDA12F684BDA13 * ((uint64_t)(*(_QWORD *)(v3 + 168) - *(_QWORD *)(v3 + 160)) >> 3));
  v6 = v12;
  if (v13 != v12)
  {
    v7 = mlcore::DatabasePropertyPropertyValue(v5);
    mlcore::PropertyCacheBase<std::string,mediaplatform::Data>::valueForProperty(&v11, v6, v7);
    v8 = *(_QWORD *)(a1 + 8);
    if (*(char *)(v8 + 23) < 0)
      operator delete(*(void **)v8);
    *(std::string *)v8 = v11;
  }
  dispatch_semaphore_signal(**(dispatch_semaphore_t **)(a1 + 16));
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&v12;
  std::vector<mlcore::PropertyCache>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_20A907DD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v15;

  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0,std::allocator<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore17DeviceLibraryView13databaseValueERKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0,std::allocator<mlcore::DeviceLibraryView::databaseValue(std::string const&)::$_0>,void ()(std::shared_ptr<mlcore::PropertiesQueryResult>)>::target_type()
{
}

BOOL mlcore::DeviceLibraryView::entityExists(mlcore *a1, _QWORD **a2, uint64_t *a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  uint64_t v14;
  std::__shared_weak_count *v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  void (***v22)(_QWORD, std::__shared_weak_count **, uint64_t *, __int128 *);
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD *v29;
  __int128 *v30;
  _QWORD *v31;
  __int128 *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v68;
  void (***v69)(_QWORD, std::__shared_weak_count **, uint64_t *, __int128 *);
  std::__shared_weak_count *v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  std::__shared_weak_count *v73;
  std::__shared_weak_count *v74;
  __int128 v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  std::__shared_weak_count *v78;
  std::__shared_weak_count *v79;
  dispatch_semaphore_t dsema;
  uint64_t v81;
  std::__shared_weak_count *v82;
  std::__shared_weak_count *v83;
  std::__shared_weak_count *v84;
  _QWORD v85[3];
  _QWORD *v86;
  _QWORD v87[3];
  _QWORD *v88;
  __int128 v89;
  __int128 *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v6 = mlcore::ItemPropertyPersistentID(a1);
  v7 = *a2;
  v8 = v7[28];
  v9 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v9 + 8) = 0u;
  *(_QWORD *)v9 = &off_24C33CE88;
  *((_QWORD *)v9 + 4) = v6;
  *((_QWORD *)v9 + 5) = 0;
  *((_QWORD *)v9 + 3) = &unk_24C339CA8;
  *((_QWORD *)v9 + 6) = v8;
  *(_OWORD *)(v9 + 56) = 0u;
  *(_QWORD *)&v10 = v9 + 24;
  *((_QWORD *)&v10 + 1) = v9;
  v75 = v10;
  v11 = (*(uint64_t (**)(_QWORD *))(*v7 + 48))(v7);
  v12 = (std::__shared_weak_count *)operator new(0x60uLL);
  *(_OWORD *)&v12->__shared_owners_ = 0u;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33D080;
  v89 = 0u;
  mlcore::AggregateFunctionQuery::AggregateFunctionQuery((uint64_t)&v12[1], v11, 0, 0, (uint64_t *)&v89, 0);
  v14 = *((_QWORD *)a1 + 11);
  v15 = (std::__shared_weak_count *)*((_QWORD *)a1 + 12);
  v73 = v12 + 1;
  v74 = v12;
  std::shared_ptr<mlcore::DeviceLibraryView>::shared_ptr[abi:ne180100]<mlcore::DeviceLibraryView,void>(&v69, v14, v15);
  v17 = *a3;
  v16 = (std::__shared_weak_count *)a3[1];
  if (v16)
  {
    v18 = (unint64_t *)&v16->__shared_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v68 = v12;
  do
    v20 = __ldxr(p_shared_owners);
  while (__stxr(v20 + 1, p_shared_owners));
  v71 = 0;
  v72 = 0;
  v21 = dispatch_semaphore_create(0);
  v79 = v12;
  dsema = v21;
  v22 = v69;
  v78 = v12 + 1;
  do
    v23 = __ldxr(p_shared_owners);
  while (__stxr(v23 + 1, p_shared_owners));
  v76 = v17;
  v77 = v16;
  if (v16)
  {
    v24 = (unint64_t *)&v16->__shared_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  v85[0] = &off_24C33B248;
  v85[1] = &v71;
  v85[2] = &dsema;
  v86 = v85;
  v83 = v12 + 1;
  v84 = v12;
  do
    v26 = __ldxr(p_shared_owners);
  while (__stxr(v26 + 1, p_shared_owners));
  v81 = v17;
  v82 = v16;
  if (!v16)
  {
LABEL_19:
    v88 = v87;
    std::__function::__func<std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1})>::__clone((uint64_t)v85, (uint64_t)v87);
    goto LABEL_21;
  }
  v27 = (unint64_t *)&v16->__shared_owners_;
  do
    v28 = __ldxr(v27);
  while (__stxr(v28 + 1, v27));
  if (v86)
  {
    if (v86 != v85)
    {
      v88 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v86 + 16))(v86);
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  v88 = 0;
LABEL_21:
  v90 = 0;
  v29 = operator new(0x28uLL);
  v30 = (__int128 *)v29;
  *v29 = &off_24C33AE80;
  if (!v88)
  {
    v31 = v29 + 4;
    goto LABEL_25;
  }
  if (v88 != v87)
  {
    v31 = &v88;
    v29[4] = v88;
LABEL_25:
    *v31 = 0;
    goto LABEL_27;
  }
  v29[4] = v29 + 1;
  (*(void (**)(_QWORD *))(v87[0] + 24))(v87);
LABEL_27:
  v90 = v30;
  (**v22)(v22, &v83, &v81, &v89);
  v32 = v90;
  if (v90 == &v89)
  {
    v33 = 4;
    v32 = &v89;
  }
  else
  {
    if (!v90)
      goto LABEL_32;
    v33 = 5;
  }
  (*(void (**)(__int128 *))(*(_QWORD *)v32 + 8 * v33))(v32);
LABEL_32:
  v34 = v88;
  if (v88 == v87)
  {
    v35 = 4;
    v34 = v87;
    goto LABEL_36;
  }
  if (v88)
  {
    v35 = 5;
LABEL_36:
    (*(void (**)(_QWORD *))(*v34 + 8 * v35))(v34);
  }
  v36 = v82;
  if (v82)
  {
    v37 = (unint64_t *)&v82->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v39 = v84;
  if (v84)
  {
    v40 = (unint64_t *)&v84->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  v42 = v86;
  if (v86 == v85)
  {
    v43 = 4;
    v42 = v85;
    goto LABEL_51;
  }
  if (v86)
  {
    v43 = 5;
LABEL_51:
    (*(void (**)(_QWORD *))(*v42 + 8 * v43))(v42);
  }
  v44 = v77;
  if (v77)
  {
    v45 = (unint64_t *)&v77->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  v47 = v79;
  if (v79)
  {
    v48 = (unint64_t *)&v79->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(dsema);
  v50 = v72;
  v51 = *(_QWORD *)(v71 + 160);
  if (v72)
  {
    v52 = (unint64_t *)&v72->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  if (v68)
  {
    v54 = (unint64_t *)&v68->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  if (v16)
  {
    v56 = (unint64_t *)&v16->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v58 = v70;
  if (v70)
  {
    v59 = (unint64_t *)&v70->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  v61 = v74;
  if (v74)
  {
    v62 = (unint64_t *)&v74->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  v64 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
  if (*((_QWORD *)&v75 + 1))
  {
    v65 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 - 1, v65));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }
  return v51 != 0;
}

void sub_20A908410(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,char a21,uint64_t a22,char a23,uint64_t a24,dispatch_object_t object,char a26,uint64_t a27,char a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_24C33AE80;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_24C33AE80;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::__clone(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x28uLL);
  *v2 = &off_24C33AE80;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_20A908658(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C33AE80;
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

void std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  *a2 = 0;
  a2[1] = 0;
  v12 = v2;
  v13 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v6 + 48))(v6, &v12);
  v7 = v13;
  if (v13)
  {
    v8 = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v3)
  {
    v10 = (unint64_t *)&v3->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_20A9087E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;

  if (a10)
  {
    p_shared_owners = (unint64_t *)&a10->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  if (v10)
  {
    v14 = (unint64_t *)&v10->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore11LibraryView12performQueryINS_22AggregateFunctionQueryEEEvNSt3__110shared_ptrIT_EENS4_INS_11TransactionEEENS3_8functionIFvNS4_INS5_6ResultEEEEEEEUlNS4_INS_11QueryResultEEEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1},std::allocator<void mlcore::LibraryView::performQuery<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::AggregateFunctionQuery>,std::shared_ptr<mlcore::Transaction>,std::function<void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)>)::{lambda(std::shared_ptr<mlcore::QueryResult>)#1}>,void ()(std::shared_ptr<mlcore::QueryResult>)>::target_type()
{
}

void std::__function::__func<std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1})>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

__n128 std::__function::__func<std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1})>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24C33B248;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1})>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24C33B248;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1})>::operator()(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v3 + 1);
  if (*((_QWORD *)&v3 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v3 + 1) + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = *(std::__shared_weak_count **)(v4 + 8);
  *(_OWORD *)v4 = v3;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  dispatch_semaphore_signal(**(dispatch_semaphore_t **)(a1 + 16));
  if (v5)
  {
    v11 = (unint64_t *)&v5->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

uint64_t std::__function::__func<std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1})>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore14GetQueryResultINS_22AggregateFunctionQueryEEENSt3__110shared_ptrINT_6ResultEEENS3_INS_17DeviceLibraryViewEEENS3_INS_11TransactionEEENS3_IS4_EEEUlNS3_INS_28AggregateFunctionQueryResultEEEE_"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1},std::allocator<std::allocator>,void ()(std::shared_ptr<mlcore::AggregateFunctionQuery::Result> mlcore::GetQueryResult<mlcore::AggregateFunctionQuery>(std::shared_ptr<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::Transaction>,std::shared_ptr<mlcore::AggregateFunctionQuery::Result>)::{lambda(std::shared_ptr<mlcore::AggregateFunctionQueryResult>)#1})>::target_type()
{
}

mlcore::ArtworkTokenTable *mlcore::ArtworkTokenTable::ArtworkTokenTable(mlcore::ArtworkTokenTable *this)
{
  int v2;
  uint64_t v3;
  std::string *v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  std::string *v9;
  int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  int v14;
  std::string *v15;
  std::string *v16;
  char v17;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  std::string __str;
  void *v38[2];
  char v39;
  void (**v40)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string __p;
  int v42;
  uint64_t v43;
  void *v44[2];
  char v45;
  void (**v46)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v47;
  int v48;
  uint64_t v49;
  int v50;
  void *v51[2];
  char v52;
  void (**v53)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v54;
  int v55;
  uint64_t v56;
  void *v57[2];
  char v58;
  void (**v59)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v60;
  int v61;
  uint64_t v62;
  void *v63[2];
  char v64;
  void *v65[2];
  char v66;
  _BYTE v67[8];
  std::string v68;
  int v69;
  char v70;
  std::string v71;
  std::string __s;
  uint64_t (**v73)();
  std::string v74;
  int v75;
  uint64_t v76;
  uint64_t (**v77)();
  std::string v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t (**v82)();
  std::string v83;
  int v84;
  uint64_t v85;
  uint64_t (**v86)();
  std::string v87;
  int v88;
  uint64_t v89;
  uint64_t (**v90)();
  std::string v91;
  int v92;
  char v93;
  std::string v94;
  std::string v95;
  uint64_t (**v96)();
  std::string v97;
  int v98;
  uint64_t v99;
  uint64_t (**v100)();
  std::string v101;
  int v102;
  uint64_t v103;
  int v104;
  uint64_t (**v105)();
  std::string v106;
  int v107;
  uint64_t v108;
  uint64_t (**v109)();
  std::string v110;
  int v111;
  uint64_t v112;
  uint64_t (**v113)();
  std::string v114;
  int v115;
  char v116;
  std::string v117;
  uint64_t (**v118)();
  std::string v119;
  int v120;
  uint64_t v121;
  uint64_t (**v122)();
  std::string v123;
  int v124;
  uint64_t v125;
  int v126;
  uint64_t (**v127)();
  std::string v128;
  int v129;
  uint64_t v130;
  uint64_t (**v131)();
  std::string v132;
  int v133;
  uint64_t v134;
  uint64_t (**v135)();
  std::string v136;
  int v137;
  uint64_t v138;
  uint64_t (**v139)();
  std::string v140;
  int v141;
  uint64_t v142;
  int v143;
  uint64_t (**v144)();
  std::string v145;
  int v146;
  uint64_t v147;
  void (**v148)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v149;
  int v150;
  uint64_t v151;
  void (**v152)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v153;
  int v154;
  uint64_t v155;
  int v156;
  void (**v157)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v158;
  int v159;
  uint64_t v160;

  std::string::basic_string[abi:ne180100]<0>(&__s, "artwork_token");
  std::string::basic_string[abi:ne180100]<0>(v65, "artwork_token");
  std::string::basic_string[abi:ne180100]<0>(v63, "");
  mlcore::MediaColumn<std::string>::MediaColumn((uint64_t)v67, (uint64_t)v65, (uint64_t)v63);
  std::string::basic_string[abi:ne180100]<0>(v57, "artwork_source_type");
  mlcore::MediaColumn<int>::MediaColumn((uint64_t)&v59, (uint64_t)v57, 0);
  std::string::basic_string[abi:ne180100]<0>(v51, "artwork_type");
  mlcore::MediaColumn<int>::MediaColumn((uint64_t)&v53, (uint64_t)v51, 0);
  std::string::basic_string[abi:ne180100]<0>(v44, "entity_pid");
  mlcore::MediaColumn<long long>::MediaColumn((uint64_t)&v46, (uint64_t)v44);
  std::string::basic_string[abi:ne180100]<0>(v38, "entity_type");
  mlcore::MediaColumn<int>::MediaColumn((uint64_t)&v40, (uint64_t)v38, 0);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v95, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  else
    v95 = __s;
  v90 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v91, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
  else
    v91 = v68;
  v92 = v69;
  v90 = &off_24C335AB8;
  v93 = v70;
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v94, v71.__r_.__value_.__l.__data_, v71.__r_.__value_.__l.__size_);
  else
    v94 = v71;
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v87, v60.__r_.__value_.__l.__data_, v60.__r_.__value_.__l.__size_);
  else
    v87 = v60;
  v33 = v61;
  v88 = v61;
  v86 = off_24C335AF8;
  v32 = v62;
  v89 = v62;
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v83, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
  else
    v83 = v54;
  v35 = v55;
  v84 = v55;
  v82 = off_24C335AF8;
  v34 = v56;
  v85 = v56;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v78, v47.__r_.__value_.__l.__data_, v47.__r_.__value_.__l.__size_);
  else
    v78 = v47;
  v77 = off_24C335B18;
  v80 = v49;
  v36 = v48;
  v79 = v48;
  v81 = v50;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v74, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v74 = __p;
  v2 = v42;
  v75 = v42;
  v73 = off_24C335AF8;
  v3 = v43;
  v76 = v43;
  *(_QWORD *)this = &off_24C330F50;
  v4 = (std::string *)((char *)this + 8);
  v31 = SHIBYTE(v95.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v4, v95.__r_.__value_.__l.__data_, v95.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)&v95.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 3) = *((_QWORD *)&v95.__r_.__value_.__l + 2);
  }
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *(_QWORD *)this = &off_24C3353D0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  v113 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v114, v91.__r_.__value_.__l.__data_, v91.__r_.__value_.__l.__size_);
  else
    v114 = v91;
  v115 = v92;
  v113 = &off_24C335AB8;
  v116 = v93;
  if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v117, v94.__r_.__value_.__l.__data_, v94.__r_.__value_.__l.__size_);
  else
    v117 = v94;
  v30 = SHIBYTE(v87.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v110, v87.__r_.__value_.__l.__data_, v87.__r_.__value_.__l.__size_);
  else
    v110 = v87;
  v111 = v33;
  v109 = off_24C335AF8;
  v112 = v32;
  v28 = SHIBYTE(v83.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v106, v83.__r_.__value_.__l.__data_, v83.__r_.__value_.__l.__size_);
  else
    v106 = v83;
  v107 = v35;
  v105 = off_24C335AF8;
  v108 = v34;
  v27 = SHIBYTE(v78.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v101, v78.__r_.__value_.__l.__data_, v78.__r_.__value_.__l.__size_);
  else
    v101 = v78;
  v100 = off_24C335B18;
  v103 = v80;
  v102 = v36;
  v104 = v81;
  v25 = SHIBYTE(v74.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v97, v74.__r_.__value_.__l.__data_, v74.__r_.__value_.__l.__size_);
  else
    v97 = v74;
  v98 = v2;
  v96 = off_24C335AF8;
  v99 = v3;
  v5 = SHIBYTE(v110.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v132, v110.__r_.__value_.__l.__data_, v110.__r_.__value_.__l.__size_);
  else
    v132 = v110;
  v133 = v33;
  v131 = off_24C335AF8;
  v134 = v32;
  v23 = SHIBYTE(v106.__r_.__value_.__r.__words[2]);
  v24 = v5;
  if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v128, v106.__r_.__value_.__l.__data_, v106.__r_.__value_.__l.__size_);
  else
    v128 = v106;
  v129 = v35;
  v127 = off_24C335AF8;
  v130 = v34;
  v22 = SHIBYTE(v101.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v123, v101.__r_.__value_.__l.__data_, v101.__r_.__value_.__l.__size_);
  else
    v123 = v101;
  v122 = off_24C335B18;
  v125 = v80;
  v124 = v36;
  v126 = v81;
  v21 = SHIBYTE(v97.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v119, v97.__r_.__value_.__l.__data_, v97.__r_.__value_.__l.__size_);
  else
    v119 = v97;
  v120 = v2;
  v118 = off_24C335AF8;
  v121 = v3;
  v6 = SHIBYTE(v128.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v128.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v145, v128.__r_.__value_.__l.__data_, v128.__r_.__value_.__l.__size_);
  else
    v145 = v128;
  v146 = v35;
  v144 = off_24C335AF8;
  v147 = v34;
  v20 = SHIBYTE(v123.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v123.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v140, v123.__r_.__value_.__l.__data_, v123.__r_.__value_.__l.__size_);
  else
    v140 = v123;
  v139 = off_24C335B18;
  v142 = v80;
  v141 = v36;
  v143 = v81;
  v19 = SHIBYTE(v119.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v136, v119.__r_.__value_.__l.__data_, v119.__r_.__value_.__l.__size_);
  else
    v136 = v119;
  v137 = v2;
  v135 = off_24C335AF8;
  v138 = v3;
  v152 = off_24C335D90;
  v29 = SHIBYTE(v140.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v153, v140.__r_.__value_.__l.__data_, v140.__r_.__value_.__l.__size_);
  else
    v153 = v140;
  v155 = v80;
  v154 = v36;
  v156 = v81;
  v148 = off_24C335D90;
  v26 = SHIBYTE(v136.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v149, v136.__r_.__value_.__l.__data_, v136.__r_.__value_.__l.__size_);
  else
    v149 = v136;
  v150 = v2;
  v151 = v3;
  v157 = off_24C335D90;
  v7 = SHIBYTE(v149.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v149.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v158, v149.__r_.__value_.__l.__data_, v149.__r_.__value_.__l.__size_);
  else
    v158 = v149;
  v159 = v2;
  v160 = v3;
  *((_QWORD *)this + 10) = off_24C335D90;
  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0)
  {
    v8 = (void *)v158.__r_.__value_.__r.__words[0];
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 88), v158.__r_.__value_.__l.__data_, v158.__r_.__value_.__l.__size_);
    *((_DWORD *)this + 28) = v2;
    *((_QWORD *)this + 10) = off_24C335AF8;
    *(_QWORD *)((char *)this + 116) = v3;
    v157 = off_24C335D90;
    operator delete(v8);
  }
  else
  {
    *(std::string *)((char *)this + 88) = v158;
    *((_DWORD *)this + 28) = v2;
    *((_QWORD *)this + 10) = off_24C335AF8;
    *(_QWORD *)((char *)this + 116) = v3;
    v157 = off_24C335D90;
  }
  *((_QWORD *)this + 16) = off_24C335D90;
  v9 = (std::string *)((char *)this + 136);
  v10 = SHIBYTE(v153.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v9, v153.__r_.__value_.__l.__data_, v153.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)&v153.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 19) = *((_QWORD *)&v153.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 40) = v36;
  *((_QWORD *)this + 16) = off_24C335B18;
  *(_QWORD *)((char *)this + 164) = v80;
  *((_DWORD *)this + 43) = v81;
  v148 = off_24C335D90;
  if (v7 < 0)
    operator delete(v149.__r_.__value_.__l.__data_);
  v152 = off_24C335D90;
  if (v10 < 0)
    operator delete(v153.__r_.__value_.__l.__data_);
  *((_QWORD *)this + 22) = off_24C335D90;
  v11 = (std::string *)((char *)this + 184);
  v12 = SHIBYTE(v145.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v145.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v11, v145.__r_.__value_.__l.__data_, v145.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)&v145.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 25) = *((_QWORD *)&v145.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 52) = v35;
  *((_QWORD *)this + 22) = off_24C335AF8;
  *(_QWORD *)((char *)this + 212) = v34;
  if (v26 < 0)
    operator delete(v136.__r_.__value_.__l.__data_);
  if (v29 < 0)
  {
    operator delete(v140.__r_.__value_.__l.__data_);
    if ((v12 & 0x80000000) == 0)
      goto LABEL_90;
  }
  else if ((v12 & 0x80000000) == 0)
  {
    goto LABEL_90;
  }
  operator delete(v145.__r_.__value_.__l.__data_);
LABEL_90:
  *((_QWORD *)this + 28) = off_24C335D90;
  v13 = (std::string *)((char *)this + 232);
  v14 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v13, v132.__r_.__value_.__l.__data_, v132.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = *(_OWORD *)&v132.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 31) = *((_QWORD *)&v132.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 64) = v33;
  *((_QWORD *)this + 28) = off_24C335AF8;
  *(_QWORD *)((char *)this + 260) = v32;
  v118 = (uint64_t (**)())off_24C335D90;
  if (v19 < 0)
    operator delete(v119.__r_.__value_.__l.__data_);
  v122 = (uint64_t (**)())off_24C335D90;
  if (v20 < 0)
    operator delete(v123.__r_.__value_.__l.__data_);
  v127 = (uint64_t (**)())off_24C335D90;
  if (v6 < 0)
  {
    operator delete(v128.__r_.__value_.__l.__data_);
    if ((v14 & 0x80000000) == 0)
      goto LABEL_101;
  }
  else if ((v14 & 0x80000000) == 0)
  {
    goto LABEL_101;
  }
  operator delete(v132.__r_.__value_.__l.__data_);
LABEL_101:
  *((_QWORD *)this + 34) = off_24C335D90;
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 280), v114.__r_.__value_.__l.__data_, v114.__r_.__value_.__l.__size_);
  else
    *(std::string *)((char *)this + 280) = v114;
  *((_DWORD *)this + 76) = v115;
  *((_QWORD *)this + 34) = &off_24C335AB8;
  *((_BYTE *)this + 308) = v116;
  v15 = (std::string *)((char *)this + 312);
  if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v15, v117.__r_.__value_.__l.__data_, v117.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v15->__r_.__value_.__l.__data_ = *(_OWORD *)&v117.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 41) = *((_QWORD *)&v117.__r_.__value_.__l + 2);
  }
  if (v21 < 0)
    operator delete(v97.__r_.__value_.__l.__data_);
  if (v22 < 0)
    operator delete(v101.__r_.__value_.__l.__data_);
  if (v23 < 0)
    operator delete(v106.__r_.__value_.__l.__data_);
  if (v24 < 0)
    operator delete(v110.__r_.__value_.__l.__data_);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v113);
  v73 = (uint64_t (**)())off_24C335D90;
  if (v25 < 0)
    operator delete(v74.__r_.__value_.__l.__data_);
  v77 = (uint64_t (**)())off_24C335D90;
  if (v27 < 0)
    operator delete(v78.__r_.__value_.__l.__data_);
  v82 = (uint64_t (**)())off_24C335D90;
  if (v28 < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  v86 = (uint64_t (**)())off_24C335D90;
  if (v30 < 0)
    operator delete(v87.__r_.__value_.__l.__data_);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v90);
  if (v31 < 0)
    operator delete(v95.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_24C335F38;
  std::__tuple_leaf<0ul,mlcore::MediaColumn<std::string>,false>::__tuple_leaf[abi:ne180100]<mlcore::MediaColumn<std::string>&,void>((uint64_t)this + 336, (uint64_t)v67);
  *((_QWORD *)this + 50) = off_24C335D90;
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)this + 17, v60.__r_.__value_.__l.__data_, v60.__r_.__value_.__l.__size_);
  else
    *((std::string *)this + 17) = v60;
  *((_DWORD *)this + 108) = v61;
  *(_QWORD *)((char *)this + 436) = v62;
  *((_QWORD *)this + 50) = off_24C336AA0;
  *((_QWORD *)this + 56) = off_24C335D90;
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)this + 19, v54.__r_.__value_.__l.__data_, v54.__r_.__value_.__l.__size_);
  else
    *((std::string *)this + 19) = v54;
  *((_DWORD *)this + 120) = v55;
  *(_QWORD *)((char *)this + 484) = v56;
  *((_QWORD *)this + 56) = off_24C336AA0;
  *((_QWORD *)this + 62) = off_24C335D90;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)this + 21, v47.__r_.__value_.__l.__data_, v47.__r_.__value_.__l.__size_);
  else
    *((std::string *)this + 21) = v47;
  *((_DWORD *)this + 132) = v48;
  *(_QWORD *)((char *)this + 532) = v49;
  *((_DWORD *)this + 135) = v50;
  *((_QWORD *)this + 62) = off_24C336AC0;
  *((_QWORD *)this + 68) = off_24C335D90;
  v16 = (std::string *)((char *)this + 552);
  v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else
  {
    *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 71) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 144) = v42;
  *(_QWORD *)((char *)this + 580) = v43;
  *((_QWORD *)this + 68) = off_24C336AA0;
  v40 = off_24C335D90;
  if (v17 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v39 < 0)
    operator delete(v38[0]);
  v46 = off_24C335D90;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  if (v45 < 0)
    operator delete(v44[0]);
  v53 = off_24C335D90;
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v54.__r_.__value_.__l.__data_);
  if (v52 < 0)
    operator delete(v51[0]);
  v59 = off_24C335D90;
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v60.__r_.__value_.__l.__data_);
  if (v58 < 0)
    operator delete(v57[0]);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)v67);
  if (v64 < 0)
    operator delete(v63[0]);
  if (v66 < 0)
    operator delete(v65[0]);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_24C339620;
  std::string::basic_string[abi:ne180100]<0>(&__str, "UNIQUE (artwork_source_type, artwork_type, entity_pid, entity_type)");
  std::string::operator=((std::string *)((char *)this + 56), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  return this;
}

void sub_20A9098B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,uint64_t a62,uint64_t a63)
{
  void *a64;
  char a69;
  void *a71;
  char a72;
  void *a73;
  char a74;
  void *a75;
  char a76;
  void *a77;
  char a78;
  uint64_t v78;
  uint64_t v79;
  void **v80;
  void **v81;
  void **v82;
  uint64_t v83;

  *(_QWORD *)(v78 + 496) = v83;
  if (*(char *)(v78 + 527) < 0)
    operator delete(*v82);
  *(_QWORD *)(v78 + 448) = off_24C335D90;
  if (*(char *)(v78 + 479) < 0)
    operator delete(*v81);
  *(_QWORD *)(v78 + 400) = off_24C335D90;
  if (*(char *)(v78 + 431) < 0)
    operator delete(*v80);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(v79);
  mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable(v78);
  if (a46 < 0)
    operator delete(__p);
  if (a39 < 0)
    operator delete(a34);
  if (a61 < 0)
    operator delete(a56);
  if (a54 < 0)
    operator delete(a49);
  if (a72 < 0)
    operator delete(a71);
  if (a69 < 0)
    operator delete(a64);
  if (a76 < 0)
    operator delete(a75);
  if (a74 < 0)
    operator delete(a73);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&STACK[0x218]);
  if (a78 < 0)
    operator delete(a77);
  if (SLOBYTE(STACK[0x217]) < 0)
    operator delete((void *)STACK[0x200]);
  if (SLOBYTE(STACK[0x26F]) < 0)
    operator delete((void *)STACK[0x258]);
  _Unwind_Resume(a1);
}

void sub_20A909D5C()
{
  JUMPOUT(0x20A909C88);
}

void sub_20A909D64()
{
  JUMPOUT(0x20A909C98);
}

void sub_20A909D6C()
{
  JUMPOUT(0x20A909CB4);
}

void sub_20A909D74()
{
  JUMPOUT(0x20A909CC4);
}

void sub_20A909D7C()
{
  JUMPOUT(0x20A909CE0);
}

void sub_20A909D84()
{
  JUMPOUT(0x20A909CF0);
}

void sub_20A909D8C()
{
  JUMPOUT(0x20A909D0CLL);
}

void sub_20A909D94()
{
  JUMPOUT(0x20A909D1CLL);
}

void sub_20A909D9C()
{
  JUMPOUT(0x20A909D24);
}

void sub_20A909DA4()
{
  JUMPOUT(0x20A909D34);
}

void sub_20A909DAC()
{
  JUMPOUT(0x20A909D44);
}

void mlcore::MediaTable<std::string,int,int,long long,int>::~MediaTable(uint64_t a1)
{
  *(_QWORD *)a1 = off_24C335F38;
  *(_QWORD *)(a1 + 544) = off_24C335D90;
  if (*(char *)(a1 + 575) < 0)
    operator delete(*(void **)(a1 + 552));
  *(_QWORD *)(a1 + 496) = off_24C335D90;
  if (*(char *)(a1 + 527) < 0)
    operator delete(*(void **)(a1 + 504));
  *(_QWORD *)(a1 + 448) = off_24C335D90;
  if (*(char *)(a1 + 479) < 0)
    operator delete(*(void **)(a1 + 456));
  *(_QWORD *)(a1 + 400) = off_24C335D90;
  if (*(char *)(a1 + 431) < 0)
    operator delete(*(void **)(a1 + 408));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 336);
  mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable(a1);
}

{
  *(_QWORD *)a1 = off_24C335F38;
  *(_QWORD *)(a1 + 544) = off_24C335D90;
  if (*(char *)(a1 + 575) < 0)
    operator delete(*(void **)(a1 + 552));
  *(_QWORD *)(a1 + 496) = off_24C335D90;
  if (*(char *)(a1 + 527) < 0)
    operator delete(*(void **)(a1 + 504));
  *(_QWORD *)(a1 + 448) = off_24C335D90;
  if (*(char *)(a1 + 479) < 0)
    operator delete(*(void **)(a1 + 456));
  *(_QWORD *)(a1 + 400) = off_24C335D90;
  if (*(char *)(a1 + 431) < 0)
    operator delete(*(void **)(a1 + 408));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 336);
  mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable(a1);
}

{
  *(_QWORD *)a1 = off_24C335F38;
  *(_QWORD *)(a1 + 544) = off_24C335D90;
  if (*(char *)(a1 + 575) < 0)
    operator delete(*(void **)(a1 + 552));
  *(_QWORD *)(a1 + 496) = off_24C335D90;
  if (*(char *)(a1 + 527) < 0)
    operator delete(*(void **)(a1 + 504));
  *(_QWORD *)(a1 + 448) = off_24C335D90;
  if (*(char *)(a1 + 479) < 0)
    operator delete(*(void **)(a1 + 456));
  *(_QWORD *)(a1 + 400) = off_24C335D90;
  if (*(char *)(a1 + 431) < 0)
    operator delete(*(void **)(a1 + 408));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 336);
  mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24C3353D0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 272);
  *(_QWORD *)(a1 + 224) = off_24C335D90;
  if (*(char *)(a1 + 255) < 0)
    operator delete(*(void **)(a1 + 232));
  *(_QWORD *)(a1 + 176) = off_24C335D90;
  if (*(char *)(a1 + 207) < 0)
    operator delete(*(void **)(a1 + 184));
  *(_QWORD *)(a1 + 128) = off_24C335D90;
  if (*(char *)(a1 + 159) < 0)
    operator delete(*(void **)(a1 + 136));
  *(_QWORD *)(a1 + 80) = off_24C335D90;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

{
  mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseTable<std::string,int,int,long long,int>::columnCount()
{
  return 5;
}

void mediaplatform::DatabaseTable<std::string,int,int,long long,int>::columnNames(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  mediaplatform::ColumnNamesApplier::operator()<std::string>((uint64_t)a2, a1 + 272);
  mediaplatform::ColumnNamesApplier::operator()<int>((uint64_t)a2, a1 + 224);
  mediaplatform::ColumnNamesApplier::operator()<int>((uint64_t)a2, a1 + 176);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 128);
  mediaplatform::ColumnNamesApplier::operator()<int>((uint64_t)a2, a1 + 80);
}

void sub_20A909F78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mediaplatform::DatabaseTable<std::string,int,int,long long,int>::targetColumnExpression(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  __int128 *v3;
  __int128 *v4[3];
  __int128 **v5;

  v3 = (__int128 *)(a1 + 8);
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)a1 + 24))(v4);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string &,std::string const&,void>(a2, v4[0], v3);
  v5 = v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void sub_20A909FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::ArtworkTokenTable::~ArtworkTokenTable(mlcore::ArtworkTokenTable *this)
{
  *(_QWORD *)this = off_24C335F38;
  *((_QWORD *)this + 68) = off_24C335D90;
  if (*((char *)this + 575) < 0)
    operator delete(*((void **)this + 69));
  *((_QWORD *)this + 62) = off_24C335D90;
  if (*((char *)this + 527) < 0)
    operator delete(*((void **)this + 63));
  *((_QWORD *)this + 56) = off_24C335D90;
  if (*((char *)this + 479) < 0)
    operator delete(*((void **)this + 57));
  *((_QWORD *)this + 50) = off_24C335D90;
  if (*((char *)this + 431) < 0)
    operator delete(*((void **)this + 51));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 336);
  mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable((uint64_t)this);
}

{
  *(_QWORD *)this = off_24C335F38;
  *((_QWORD *)this + 68) = off_24C335D90;
  if (*((char *)this + 575) < 0)
    operator delete(*((void **)this + 69));
  *((_QWORD *)this + 62) = off_24C335D90;
  if (*((char *)this + 527) < 0)
    operator delete(*((void **)this + 63));
  *((_QWORD *)this + 56) = off_24C335D90;
  if (*((char *)this + 479) < 0)
    operator delete(*((void **)this + 57));
  *((_QWORD *)this + 50) = off_24C335D90;
  if (*((char *)this + 431) < 0)
    operator delete(*((void **)this + 51));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 336);
  mediaplatform::DatabaseTable<std::string,int,int,long long,int>::~DatabaseTable((uint64_t)this);
  JUMPOUT(0x20BD27AFCLL);
}

void mlcore::ArtworkTokenTable::artworkTokenColumn(mlcore::ArtworkTokenTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 367) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 43), *((_QWORD *)this + 44));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 344);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 45);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 92);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 372);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 399) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 47), *((_QWORD *)this + 48));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 376);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 49);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A90A31C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ArtworkTokenTable::artworkSourceTypeColumn(mlcore::ArtworkTokenTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 431) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 51), *((_QWORD *)this + 52));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 408);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 53);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 108);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 436);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::ArtworkTokenTable::artworkTypeColumn(mlcore::ArtworkTokenTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 479) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 57), *((_QWORD *)this + 58));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 456);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 59);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 120);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 484);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::ArtworkTokenTable::entityPersistentIDColumn(mlcore::ArtworkTokenTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 527) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 63), *((_QWORD *)this + 64));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 504);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 65);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 132);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 135);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 532);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ArtworkTokenTable::entityTypeColumn(mlcore::ArtworkTokenTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 575) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 69), *((_QWORD *)this + 70));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 552);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 71);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 144);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 580);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::NotPredicate::description(mlcore::NotPredicate *this@<X0>, std::string *a2@<X8>)
{
  void **v4;
  std::string::size_type v5;
  std::string *v6;
  __int128 v7;
  void **v8;
  std::string::size_type v9;
  std::string *v10;
  void *__p[2];
  unsigned __int8 v12;
  void *v13[2];
  unsigned __int8 v14;
  std::string v15;
  std::string v16;

  std::string::basic_string[abi:ne180100]<0>(&v15, "!(");
  (*(void (**)(void **__return_ptr))(**((_QWORD **)this + 1) + 40))(v13);
  if ((v14 & 0x80u) == 0)
    v4 = v13;
  else
    v4 = (void **)v13[0];
  if ((v14 & 0x80u) == 0)
    v5 = v14;
  else
    v5 = (std::string::size_type)v13[1];
  v6 = std::string::append(&v15, (const std::string::value_type *)v4, v5);
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, ")");
  if ((v12 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v12 & 0x80u) == 0)
    v9 = v12;
  else
    v9 = (std::string::size_type)__p[1];
  v10 = std::string::append(&v16, (const std::string::value_type *)v8, v9);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if ((char)v12 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if ((char)v14 < 0)
    operator delete(v13[0]);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
}

void sub_20A90A67C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v27;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v27 - 25) < 0)
    operator delete(*(void **)(v27 - 48));
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

uint64_t mlcore::NotPredicate::matches(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  int v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = (std::__shared_weak_count *)a2[1];
  v11 = *a2;
  v12 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 48))(v2, &v11);
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v6 ^ 1u;
}

void sub_20A90A774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *mlcore::NotPredicate::NotPredicate(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C336E90;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *a2;
  v2 = a2[1];
  *result = &off_24C336E90;
  result[1] = v3;
  result[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t mlcore::NotPredicate::subpredicate(mlcore::NotPredicate *this)
{
  return (uint64_t)this + 8;
}

void mlcore::FilterEntitiesMatchingPredicate(uint64_t *a1@<X0>, uint64_t **a2@<X1>, char **a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  __int128 v38;
  int64x2_t v39;
  char *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  __int128 v46;
  uint64_t v47;
  int64x2_t v48;
  char *v49;
  _QWORD *v50;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    v7 = a3 + 2;
    do
    {
      v8 = *v3;
      v9 = (std::__shared_weak_count *)v3[1];
      *(_QWORD *)&v46 = *v3;
      *((_QWORD *)&v46 + 1) = v9;
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
        v12 = *a1;
        v44 = v8;
        v45 = v9;
        do
          v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }
      else
      {
        v12 = *a1;
        v44 = v8;
        v45 = 0;
      }
      v14 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v12 + 48))(v12, &v44);
      v15 = v14;
      v16 = v45;
      if (!v45)
        goto LABEL_14;
      v17 = (unint64_t *)&v45->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
        if (v15)
        {
LABEL_15:
          v19 = a3[1];
          v20 = (unint64_t)a3[2];
          if ((unint64_t)v19 >= v20)
          {
            v25 = (v19 - *a3) >> 4;
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 60)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v27 = v20 - (_QWORD)*a3;
            if (v27 >> 3 > v26)
              v26 = v27 >> 3;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
              v28 = 0xFFFFFFFFFFFFFFFLL;
            else
              v28 = v26;
            v50 = v7;
            v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<mediaplatform::DatabaseParameterBase>>>(v28);
            v31 = &v29[16 * v25];
            v32 = *((_QWORD *)&v46 + 1);
            *(_OWORD *)v31 = v46;
            if (v32)
            {
              v33 = (unint64_t *)(v32 + 8);
              do
                v34 = __ldxr(v33);
              while (__stxr(v34 + 1, v33));
            }
            v36 = *a3;
            v35 = a3[1];
            if (v35 == *a3)
            {
              v39 = vdupq_n_s64((unint64_t)v35);
              v37 = &v29[16 * v25];
            }
            else
            {
              v37 = &v29[16 * v25];
              do
              {
                v38 = *((_OWORD *)v35 - 1);
                v35 -= 16;
                *((_OWORD *)v37 - 1) = v38;
                v37 -= 16;
                *(_QWORD *)v35 = 0;
                *((_QWORD *)v35 + 1) = 0;
              }
              while (v35 != v36);
              v39 = *(int64x2_t *)a3;
            }
            v24 = v31 + 16;
            *a3 = v37;
            a3[1] = v31 + 16;
            v48 = v39;
            v40 = a3[2];
            a3[2] = &v29[16 * v30];
            v49 = v40;
            v47 = v39.i64[0];
            std::__split_buffer<std::shared_ptr<mediaplatform::SQLExpression const>>::~__split_buffer((uint64_t)&v47);
          }
          else
          {
            *(_QWORD *)v19 = v46;
            v21 = *((_QWORD *)&v46 + 1);
            *((_QWORD *)v19 + 1) = *((_QWORD *)&v46 + 1);
            if (v21)
            {
              v22 = (unint64_t *)(v21 + 8);
              do
                v23 = __ldxr(v22);
              while (__stxr(v23 + 1, v22));
            }
            v24 = v19 + 16;
          }
          a3[1] = v24;
        }
      }
      else
      {
LABEL_14:
        if (v14)
          goto LABEL_15;
      }
      v41 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
      if (*((_QWORD *)&v46 + 1))
      {
        v42 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
        do
          v43 = __ldaxr(v42);
        while (__stlxr(v43 - 1, v42));
        if (!v43)
        {
          ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
          std::__shared_weak_count::__release_weak(v41);
        }
      }
      v3 += 2;
    }
    while (v3 != v4);
  }
}

void sub_20A90AA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<mlcore::NotPredicate>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33C638;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::NotPredicate>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33C638;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mlcore::ComposerTable::~ComposerTable(mlcore::ComposerTable *this)
{
  mlcore::MediaTable<long long,std::string,std::string,mediaplatform::Data,int,long long,int,int,int,int,long long>::~MediaTable((uint64_t)this);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,int,int,int,int,long long>::columnCount()
{
  return 11;
}

void mlcore::MediaTable<long long,std::string,std::string,mediaplatform::Data,int,long long,int,int,int,int,long long>::~MediaTable(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24C3360F8;
  *(_QWORD *)(a1 + 1216) = off_24C335D90;
  if (*(char *)(a1 + 1247) < 0)
    operator delete(*(void **)(a1 + 1224));
  *(_QWORD *)(a1 + 1168) = off_24C335D90;
  if (*(char *)(a1 + 1199) < 0)
    operator delete(*(void **)(a1 + 1176));
  *(_QWORD *)(a1 + 1120) = off_24C335D90;
  if (*(char *)(a1 + 1151) < 0)
    operator delete(*(void **)(a1 + 1128));
  *(_QWORD *)(a1 + 1072) = off_24C335D90;
  if (*(char *)(a1 + 1103) < 0)
    operator delete(*(void **)(a1 + 1080));
  *(_QWORD *)(a1 + 1024) = off_24C335D90;
  if (*(char *)(a1 + 1055) < 0)
    operator delete(*(void **)(a1 + 1032));
  *(_QWORD *)(a1 + 976) = off_24C335D90;
  if (*(char *)(a1 + 1007) < 0)
    operator delete(*(void **)(a1 + 984));
  *(_QWORD *)(a1 + 928) = off_24C335D90;
  if (*(char *)(a1 + 959) < 0)
    operator delete(*(void **)(a1 + 936));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 848);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 784);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 720);
  *(_QWORD *)(a1 + 672) = off_24C335D90;
  if (*(char *)(a1 + 703) < 0)
    operator delete(*(void **)(a1 + 680));
  *(_QWORD *)a1 = off_24C335590;
  *(_QWORD *)(a1 + 624) = off_24C335D90;
  if (*(char *)(a1 + 655) < 0)
    operator delete(*(void **)(a1 + 632));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 560);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 496);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 416);
  *(_QWORD *)(a1 + 368) = off_24C335D90;
  if (*(char *)(a1 + 399) < 0)
    operator delete(*(void **)(a1 + 376));
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>>::~__tuple_impl(a1 + 80);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

{
  mlcore::MediaTable<long long,std::string,std::string,mediaplatform::Data,int,long long,int,int,int,int,long long>::~MediaTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,int,int,int,int,long long>::~DatabaseTable(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_24C335590;
  v2 = a1 + 80;
  *(_QWORD *)(a1 + 624) = off_24C335D90;
  if (*(char *)(a1 + 655) < 0)
    operator delete(*(void **)(a1 + 632));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 560);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 496);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 416);
  *(_QWORD *)(a1 + 368) = off_24C335D90;
  if (*(char *)(a1 + 399) < 0)
    operator delete(*(void **)(a1 + 376));
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>>::~__tuple_impl(v2);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

{
  uint64_t v2;

  *(_QWORD *)a1 = off_24C335590;
  v2 = a1 + 80;
  *(_QWORD *)(a1 + 624) = off_24C335D90;
  if (*(char *)(a1 + 655) < 0)
    operator delete(*(void **)(a1 + 632));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 560);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 496);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 416);
  *(_QWORD *)(a1 + 368) = off_24C335D90;
  if (*(char *)(a1 + 399) < 0)
    operator delete(*(void **)(a1 + 376));
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>>::~__tuple_impl(v2);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
  JUMPOUT(0x20BD27AFCLL);
}

{
  uint64_t v2;

  *(_QWORD *)a1 = off_24C335590;
  v2 = a1 + 80;
  *(_QWORD *)(a1 + 624) = off_24C335D90;
  if (*(char *)(a1 + 655) < 0)
    operator delete(*(void **)(a1 + 632));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 560);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 496);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 416);
  *(_QWORD *)(a1 + 368) = off_24C335D90;
  if (*(char *)(a1 + 399) < 0)
    operator delete(*(void **)(a1 + 376));
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>>::~__tuple_impl(v2);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

uint64_t std::__tuple_leaf<3ul,mlcore::MediaColumn<mediaplatform::Data>,false>::__tuple_leaf[abi:ne180100]<mlcore::MediaColumn<mediaplatform::Data>&,void>(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = off_24C335D90;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 8), *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v4;
  }
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)a1 = &off_24C335A98;
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  mediaplatform::Data::Data((mediaplatform::Data *)(a1 + 40), (const mediaplatform::Data *)(a2 + 40));
  *(_QWORD *)a1 = &off_24C336A40;
  return a1;
}

void sub_20A90AEDC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

uint64_t mediaplatform::DatabaseColumnTuple<1ul,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>>::~DatabaseColumnTuple(uint64_t a1)
{
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 480);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 416);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 336);
  *(_QWORD *)(a1 + 288) = off_24C335D90;
  if (*(char *)(a1 + 319) < 0)
    operator delete(*(void **)(a1 + 296));
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>>::~__tuple_impl(a1);
}

void mlcore::ComposerTable::persistentIDColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 703) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 85), *((_QWORD *)this + 86));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 680);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 87);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 176);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 179);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 708);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ComposerTable::nameColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 751) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 91), *((_QWORD *)this + 92));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 728);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 93);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 188);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 756);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 783) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 95), *((_QWORD *)this + 96));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 760);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 97);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A90B098(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ComposerTable::sortNameColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 815) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 99), *((_QWORD *)this + 100));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 792);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 101);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 204);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 820);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 847) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 103), *((_QWORD *)this + 104));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 824);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 105);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A90B178(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

mediaplatform::Data *mlcore::ComposerTable::groupingKeyColumn@<X0>(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  mediaplatform::Data *result;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 879) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 107), *((_QWORD *)this + 108));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 856);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 109);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 220);
  *(_QWORD *)a2 = &off_24C335A98;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 884);
  result = mediaplatform::Data::Data((mediaplatform::Data *)(a2 + 40), (mlcore::ComposerTable *)((char *)this + 888));
  *(_QWORD *)a2 = &off_24C336A40;
  return result;
}

void sub_20A90B234(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ComposerTable::cloudStatusColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 959) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 117), *((_QWORD *)this + 118));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 936);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 119);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 240);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 964);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::ComposerTable::representativeItemPersistentIDColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1007) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 123), *((_QWORD *)this + 124));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 984);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 125);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 252);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 255);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1012);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ComposerTable::keepLocalColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1055) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 129), *((_QWORD *)this + 130));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1032);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 131);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 264);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1060);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::ComposerTable::keepLocalStatusColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1103) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 135), *((_QWORD *)this + 136));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1080);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 137);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 276);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1108);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::ComposerTable::keepLocalStatusReasonColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1151) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 141), *((_QWORD *)this + 142));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1128);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 143);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 288);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1156);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::ComposerTable::keepLocalConstraintsColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1199) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 147), *((_QWORD *)this + 148));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1176);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 149);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 300);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1204);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::ComposerTable::syncIDColumn(mlcore::ComposerTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1247) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 153), *((_QWORD *)this + 154));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1224);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 155);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 312);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 315);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1252);
  *(_QWORD *)a2 = off_24C336AC0;
}

uint64_t mlcore::ContentRestrictions::restrictExplicitLyrics(mlcore::ContentRestrictions *this)
{
  return *(unsigned __int8 *)this;
}

uint64_t mlcore::ContentRestrictions::restrictEroticContent(mlcore::ContentRestrictions *this)
{
  return *((unsigned __int8 *)this + 1);
}

uint64_t mlcore::ContentRestrictions::setRestrictEroticContent(uint64_t this, char a2)
{
  *(_BYTE *)(this + 1) = a2;
  return this;
}

uint64_t mlcore::ContentRestrictions::restrictMusicVideos(mlcore::ContentRestrictions *this)
{
  return *((unsigned __int8 *)this + 2);
}

uint64_t mlcore::ContentRestrictions::restrictedMoviesRank(mlcore::ContentRestrictions *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t mlcore::ContentRestrictions::restrictedTVShowsRank(mlcore::ContentRestrictions *this)
{
  return *((unsigned int *)this + 2);
}

void mlcore::ContentRestrictions::itemPredicate(mlcore::ContentRestrictions *this@<X0>, _QWORD *a2@<X8>)
{
  mlcore::ContentRestrictions::_predicate(this, 0, a2);
}

void mlcore::ContentRestrictions::playlistItemPredicate(mlcore::ContentRestrictions *this@<X0>, _QWORD *a2@<X8>)
{
  mlcore::ContentRestrictions::_predicate(this, 1, a2);
}

uint64_t *mlcore::EntityRevisionController::EntityRevisionController(uint64_t *a1, uint64_t a2)
{
  std::allocate_shared[abi:ne180100]<mlcore::DeviceLibraryView,std::allocator<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::DeviceLibrary> &,void>(a1, *(_QWORD *)a2, *(std::__shared_weak_count **)(a2 + 8));
  a1[2] = 0;
  a1[3] = 0;
  return a1;
}

{
  std::allocate_shared[abi:ne180100]<mlcore::DeviceLibraryView,std::allocator<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::DeviceLibrary> &,void>(a1, *(_QWORD *)a2, *(std::__shared_weak_count **)(a2 + 8));
  a1[2] = 0;
  a1[3] = 0;
  return a1;
}

void std::allocate_shared[abi:ne180100]<mlcore::DeviceLibraryView,std::allocator<mlcore::DeviceLibraryView>,std::shared_ptr<mlcore::DeviceLibrary> &,void>(uint64_t *a1, uint64_t a2, std::__shared_weak_count *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13[2];

  v6 = operator new(0x80uLL);
  v7 = v6;
  v6[1] = 0;
  v6[2] = 0;
  *v6 = &off_24C33CCC8;
  v8 = (uint64_t)(v6 + 3);
  v13[0] = a2;
  v13[1] = (uint64_t)a3;
  if (a3)
  {
    p_shared_owners = (unint64_t *)&a3->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  mlcore::DeviceLibraryView::DeviceLibraryView((uint64_t)(v6 + 3), v13, 1);
  if (a3)
  {
    v11 = (unint64_t *)&a3->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))a3->__on_zero_shared)(a3);
      std::__shared_weak_count::__release_weak(a3);
    }
  }
  *a1 = v8;
  a1[1] = (uint64_t)v7;
  std::shared_ptr<mlcore::DeviceLibraryView>::__enable_weak_this[abi:ne180100]<mlcore::DeviceLibraryView,mlcore::DeviceLibraryView,void>((uint64_t)a1, v7 + 14, v8);
}

void sub_20A90B718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__shared_weak_count *v9;
  void *v11;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

_QWORD *mlcore::EntityRevisionController::EntityRevisionController(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = *a2;
  v3 = *(_QWORD *)(*a2 + 24);
  *result = *(_QWORD *)(*a2 + 16);
  result[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    v2 = *a2;
  }
  v6 = a2[1];
  result[2] = v2;
  result[3] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = *a2;
  v3 = *(_QWORD *)(*a2 + 24);
  *result = *(_QWORD *)(*a2 + 16);
  result[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    v2 = *a2;
  }
  v6 = a2[1];
  result[2] = v2;
  result[3] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return result;
}

void mlcore::EntityRevisionController::fetchRevision(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  char *v11;
  __int128 v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t i;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _QWORD *v37;
  std::string::size_type v38;
  __int128 v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t *v54;
  std::string::size_type v55;
  unint64_t *v56;
  unint64_t v57;
  __int128 v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t *v71;
  std::mutex *v72;
  int v73;
  unint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *size;
  unint64_t *v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  mlcore::EntityRevisionTable **v101;
  void *exception;
  std::exception_ptr v103;
  std::__shared_weak_count *v104;
  uint64_t v105[2];
  _BYTE __p[32];
  std::string v107;
  __int128 v108;
  std::string::size_type v109;
  std::string v110;
  std::string v111;
  __int128 v112;
  uint64_t v113;
  std::string v114;
  std::string v115;
  __int128 v116;
  _BYTE v117[32];
  std::string v118;
  __int128 v119;
  _QWORD *v120;
  _QWORD *v121;
  _QWORD *v122;
  __int128 v123;
  mlcore::EntityRevisionTable *v124;
  std::__shared_weak_count *v125;
  _QWORD **v126;
  char v127;
  _BYTE v128[32];
  __int128 v129;
  __int128 v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  if ((v6 & 1) == 0
  {
    v101 = (mlcore::EntityRevisionTable **)operator new();
    _ZNSt3__115allocate_sharedB8ne180100IN6mlcore19EntityRevisionTableENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v101);
    mediaplatform::Singleton<mlcore::EntityRevisionTable>::sharedInstance(void)::_sharedInstance = (uint64_t)v101;
  }
  v8 = *(_QWORD *)mediaplatform::Singleton<mlcore::EntityRevisionTable>::sharedInstance(void)::_sharedInstance;
  v7 = *(std::__shared_weak_count **)(mediaplatform::Singleton<mlcore::EntityRevisionTable>::sharedInstance(void)::_sharedInstance
                                    + 8);
  v124 = *(mlcore::EntityRevisionTable **)mediaplatform::Singleton<mlcore::EntityRevisionTable>::sharedInstance(void)::_sharedInstance;
  v125 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (char *)operator new(0x50uLL);
  *(_OWORD *)(v11 + 8) = 0u;
  *(_QWORD *)v11 = &off_24C33BBF0;
  memset(v128, 0, 24);
  mediaplatform::SQLFromStatement::SQLFromStatement((uint64_t)(v11 + 24), (__int128 *)(v8 + 8), (_QWORD **)v128);
  *(_QWORD *)v117 = v128;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)v117);
  *(_QWORD *)&v12 = v11 + 24;
  *((_QWORD *)&v12 + 1) = v11;
  v123 = v12;
  mlcore::EntityRevisionTable::persistentIDColumn((mlcore::EntityRevisionTable *)v8, (uint64_t)v117);
  if ((v117[31] & 0x80000000) != 0)
    std::string::__init_copy_ctor_external(&v118, *(const std::string::value_type **)&v117[8], *(std::string::size_type *)&v117[16]);
  else
    v118 = *(std::string *)&v117[8];
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,void>(&v119, (__int128 *)&v118);
  *(_OWORD *)v128 = v119;
  v119 = 0uLL;
  mlcore::EntityRevisionTable::deletedColumn((mlcore::EntityRevisionTable *)v8, (uint64_t)&v113);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v115, v114.__r_.__value_.__l.__data_, v114.__r_.__value_.__l.__size_);
  else
    v115 = v114;
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,void>(&v116, (__int128 *)&v115);
  *(_OWORD *)&v128[16] = v116;
  v116 = 0uLL;
  mlcore::EntityRevisionTable::classColumn((mlcore::EntityRevisionTable *)v8, (uint64_t)&v109);
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v111, v110.__r_.__value_.__l.__data_, v110.__r_.__value_.__l.__size_);
  else
    v111 = v110;
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,void>(&v112, (__int128 *)&v111);
  v129 = v112;
  v112 = 0uLL;
  mlcore::EntityRevisionTable::revisionType((mlcore::EntityRevisionTable *)v8, (uint64_t)__p);
  if ((__p[31] & 0x80000000) != 0)
    std::string::__init_copy_ctor_external(&v107, *(const std::string::value_type **)&__p[8], *(std::string::size_type *)&__p[16]);
  else
    v107 = *(std::string *)&__p[8];
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,void>(&v108, (__int128 *)&v107);
  v130 = v108;
  v108 = 0uLL;
  v121 = 0;
  v122 = 0;
  v120 = 0;
  v126 = &v120;
  v127 = 0;
  v13 = operator new(0x40uLL);
  v14 = 0;
  v120 = v13;
  v121 = v13;
  v122 = v13 + 8;
  do
  {
    v15 = *(_OWORD *)&v128[16 * v14];
    *(_OWORD *)v13 = v15;
    if (*((_QWORD *)&v15 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    ++v14;
    v13 += 2;
  }
  while (v14 != 4);
  v121 = v13;
  for (i = 48; i != -16; i -= 16)
    std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&v128[i]);
  v19 = (std::__shared_weak_count *)*((_QWORD *)&v108 + 1);
  if (*((_QWORD *)&v108 + 1))
  {
    v20 = (unint64_t *)(*((_QWORD *)&v108 + 1) + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v107.__r_.__value_.__l.__data_);
  if ((__p[31] & 0x80000000) != 0)
    operator delete(*(void **)&__p[8]);
  v22 = (std::__shared_weak_count *)*((_QWORD *)&v112 + 1);
  if (*((_QWORD *)&v112 + 1))
  {
    v23 = (unint64_t *)(*((_QWORD *)&v112 + 1) + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v111.__r_.__value_.__l.__data_);
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v110.__r_.__value_.__l.__data_);
  v25 = (std::__shared_weak_count *)*((_QWORD *)&v116 + 1);
  if (*((_QWORD *)&v116 + 1))
  {
    v26 = (unint64_t *)(*((_QWORD *)&v116 + 1) + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v115.__r_.__value_.__l.__data_);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v114.__r_.__value_.__l.__data_);
  v28 = (std::__shared_weak_count *)*((_QWORD *)&v119 + 1);
  if (*((_QWORD *)&v119 + 1))
  {
    v29 = (unint64_t *)(*((_QWORD *)&v119 + 1) + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v118.__r_.__value_.__l.__data_);
  if ((v117[31] & 0x80000000) != 0)
    operator delete(*(void **)&v117[8]);
  mlcore::EntityRevisionTable::persistentIDColumn(v124, (uint64_t)v128);
  if ((v128[31] & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v117, *(const std::string::value_type **)&v128[8], *(std::string::size_type *)&v128[16]);
  }
  else
  {
    *(_OWORD *)v117 = *(_OWORD *)&v128[8];
    *(_QWORD *)&v117[16] = *(_QWORD *)&v128[24];
  }
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,void>(&v109, (__int128 *)v117);
  LODWORD(v115.__r_.__value_.__l.__data_) = 13;
  v118.__r_.__value_.__r.__words[0] = *(_QWORD *)(*(_QWORD *)a2 + 224);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLLiteralValue<long long>,std::allocator<mediaplatform::SQLLiteralValue<long long>>,long long,void>(__p, (uint64_t *)&v118);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLBinaryExpression,std::allocator<mediaplatform::SQLBinaryExpression>,std::shared_ptr<mediaplatform::SQLExpression>,mediaplatform::SQLBinaryExpression::BinaryOperator,std::shared_ptr<mediaplatform::SQLColumnNameExpression>,void>(&v113, (__int128 *)&v109, (int *)&v115, (__int128 *)__p);
  v31 = *(std::__shared_weak_count **)&__p[8];
  if (*(_QWORD *)&__p[8])
  {
    v32 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = (std::__shared_weak_count *)v110.__r_.__value_.__r.__words[0];
  if (v110.__r_.__value_.__r.__words[0])
  {
    v35 = (unint64_t *)(v110.__r_.__value_.__r.__words[0] + 8);
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  if ((v117[23] & 0x80000000) != 0)
    operator delete(*(void **)v117);
  if ((v128[31] & 0x80000000) != 0)
    operator delete(*(void **)&v128[8]);
  v37 = operator new(0x68uLL);
  v38 = (std::string::size_type)v37;
  v37[1] = 0;
  v37[2] = 0;
  *v37 = &off_24C33BE58;
  v39 = v123;
  *(_OWORD *)v128 = v123;
  if (*((_QWORD *)&v123 + 1))
  {
    v40 = (unint64_t *)(*((_QWORD *)&v123 + 1) + 8);
    do
      v41 = __ldxr(v40);
    while (__stxr(v41 + 1, v40));
  }
  v37[3] = &off_24C331050;
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLSelectCoreStatement,std::allocator<mediaplatform::SQLSelectCoreStatement>,std::vector<std::shared_ptr<mediaplatform::SQLExpression const>> const&,std::shared_ptr<mediaplatform::SQLFromStatement const> &,void>(v37 + 4, &v120, v39, *((std::__shared_weak_count **)&v39 + 1));
  v42 = v38 + 24;
  *(_QWORD *)(v38 + 96) = 0;
  *(_OWORD *)(v38 + 64) = 0u;
  *(_OWORD *)(v38 + 80) = 0u;
  *(_OWORD *)(v38 + 48) = 0u;
  if (*((_QWORD *)&v39 + 1))
  {
    v43 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v39 + 1) + 16))(*((_QWORD *)&v39 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v39 + 1));
    }
  }
  v109 = v38 + 24;
  v110.__r_.__value_.__r.__words[0] = v38;
  v45 = (std::__shared_weak_count *)v114.__r_.__value_.__r.__words[0];
  v105[0] = v113;
  v105[1] = v114.__r_.__value_.__r.__words[0];
  if (v114.__r_.__value_.__r.__words[0])
  {
    v46 = (unint64_t *)(v114.__r_.__value_.__r.__words[0] + 8);
    do
      v47 = __ldxr(v46);
    while (__stxr(v47 + 1, v46));
    mediaplatform::SQLSelectStatement::setWhereExpression(v42, v105);
    do
      v48 = __ldaxr(v46);
    while (__stlxr(v48 - 1, v46));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  else
  {
    mediaplatform::SQLSelectStatement::setWhereExpression(v42, v105);
  }
  *(_QWORD *)__p = 0;
  *(_QWORD *)&__p[8] = 0;
  v49 = *(_QWORD *)(a1 + 16);
  if (v49)
  {
    v50 = *(_OWORD *)(v49 + 48);
    v51 = *(_QWORD *)(v49 + 56);
    if (v51)
    {
      v52 = (unint64_t *)(v51 + 8);
      do
        v53 = __ldxr(v52);
      while (__stxr(v53 + 1, v52));
    }
  }
  else
  {
    mlcore::DeviceLibraryView::checkoutReader(*(mlcore::DeviceLibraryView **)a1, v128);
    v50 = *(_OWORD *)v128;
  }
  *(_OWORD *)__p = v50;
  v54 = *(uint64_t **)v50;
  v55 = v109;
  v104 = (std::__shared_weak_count *)v110.__r_.__value_.__r.__words[0];
  if (v110.__r_.__value_.__r.__words[0])
  {
    v56 = (unint64_t *)(v110.__r_.__value_.__r.__words[0] + 8);
    do
      v57 = __ldxr(v56);
    while (__stxr(v57 + 1, v56));
  }
  (*(void (**)(_BYTE *__return_ptr, std::string::size_type, _QWORD))(*(_QWORD *)v55 + 16))(v128, v55, 0);
  mediaplatform::DatabaseConnection::_ensureConnectionIsOpen(v54);
  mediaplatform::DatabaseConnection::_prepareStatement((uint64_t)v54, v128, (uint64_t *)v117);
  v58 = *(_OWORD *)v117;
  if (*(_QWORD *)&v117[8])
  {
    v59 = (unint64_t *)(*(_QWORD *)&v117[8] + 8);
    do
      v60 = __ldxr(v59);
    while (__stxr(v60 + 1, v59));
    *(_OWORD *)&v118.__r_.__value_.__l.__data_ = v58;
    do
      v61 = __ldxr(v59);
    while (__stxr(v61 + 1, v59));
    do
      v62 = __ldaxr(v59);
    while (__stlxr(v62 - 1, v59));
    if (!v62)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v58 + 1) + 16))(*((_QWORD *)&v58 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v58 + 1));
    }
  }
  else
  {
    *(_OWORD *)&v118.__r_.__value_.__l.__data_ = *(unint64_t *)v117;
  }
  v63 = *(std::__shared_weak_count **)&v117[8];
  if (*(_QWORD *)&v117[8])
  {
    v64 = (unint64_t *)(*(_QWORD *)&v117[8] + 8);
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  if ((v128[23] & 0x80000000) != 0)
    operator delete(*(void **)v128);
  if (v104)
  {
    v66 = (unint64_t *)&v104->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
      std::__shared_weak_count::__release_weak(v104);
    }
  }
  v117[0] = 0;
  *(_QWORD *)v128 = &off_24C33ACC8;
  *(_QWORD *)&v128[8] = v117;
  *(_QWORD *)&v128[24] = v128;
  mediaplatform::DatabaseResult<int,long long,int,int,int>::enumerateRows((uint64_t *)&v118, (uint64_t)v128);
  v68 = *(_QWORD **)&v128[24];
  if (*(_BYTE **)&v128[24] == v128)
  {
    v69 = 4;
    v68 = v128;
  }
  else
  {
    if (!*(_QWORD *)&v128[24])
      goto LABEL_128;
    v69 = 5;
  }
  (*(void (**)(_QWORD *))(*v68 + 8 * v69))(v68);
LABEL_128:
  if (!v117[0])
  {
    exception = __cxa_allocate_exception(0x98uLL);
    std::string::basic_string[abi:ne180100]<0>(v128, "");
    mlcore::MediaError::MediaError((uint64_t)exception, 200, (uint64_t)v128);
  }
  v70 = operator new();
  *(_QWORD *)(v70 + 8) = 0;
  v71 = (unint64_t *)(v70 + 8);
  *(_QWORD *)(v70 + 24) = 850045863;
  v72 = (std::mutex *)(v70 + 24);
  *(_QWORD *)(v70 + 16) = 0;
  *(_OWORD *)(v70 + 32) = 0u;
  *(_OWORD *)(v70 + 48) = 0u;
  *(_OWORD *)(v70 + 64) = 0u;
  *(_QWORD *)(v70 + 80) = 0;
  *(_QWORD *)(v70 + 88) = 1018212795;
  *(_OWORD *)(v70 + 96) = 0u;
  *(_OWORD *)(v70 + 112) = 0u;
  *(_OWORD *)(v70 + 124) = 0u;
  *(_QWORD *)v70 = &off_24C33B8D0;
  v111.__r_.__value_.__r.__words[0] = v70;
  std::mutex::lock((std::mutex *)(v70 + 24));
  v73 = *(_DWORD *)(v70 + 136);
  if ((v73 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  do
    v74 = __ldxr(v71);
  while (__stxr(v74 + 1, v71));
  *(_DWORD *)(v70 + 136) = v73 | 2;
  std::mutex::unlock(v72);
  *(_QWORD *)v128 = &off_24C33B6C0;
  *(_QWORD *)&v128[8] = &v111;
  *(_QWORD *)&v128[24] = v128;
  mediaplatform::DatabaseResult<int,long long,int,int,int>::enumerateRows((uint64_t *)&v118, (uint64_t)v128);
  v75 = *(_QWORD **)&v128[24];
  if (*(_BYTE **)&v128[24] == v128)
  {
    v76 = 4;
    v75 = v128;
  }
  else
  {
    if (!*(_QWORD *)&v128[24])
      goto LABEL_136;
    v76 = 5;
  }
  (*(void (**)(_QWORD *))(*v75 + 8 * v76))(v75);
LABEL_136:
  *(_QWORD *)v117 = v70 + 24;
  v117[8] = 1;
  std::mutex::lock(v72);
  std::__assoc_sub_state::__sub_wait((std::__assoc_sub_state *)v70, (std::unique_lock<std::mutex> *)v117);
  v77 = *(_QWORD *)(v70 + 16);
  v115.__r_.__value_.__r.__words[0] = 0;
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&v115);
  if (v77)
  {
    std::exception_ptr::exception_ptr((std::exception_ptr *)&v115, (const std::exception_ptr *)(v70 + 16));
    v103.__ptr_ = &v115;
    std::rethrow_exception(v103);
    __break(1u);
  }
  *(_DWORD *)v128 = *(_DWORD *)(v70 + 144);
  *(_OWORD *)&v128[8] = *(_OWORD *)(v70 + 152);
  *(_QWORD *)(v70 + 152) = 0;
  *(_QWORD *)(v70 + 160) = 0;
  *(_QWORD *)&v128[24] = *(_QWORD *)(v70 + 168);
  if (v117[8])
    std::mutex::unlock(*(std::mutex **)v117);
  do
    v78 = __ldaxr(v71);
  while (__stlxr(v78 - 1, v71));
  if (!v78)
    (*(void (**)(uint64_t))(*(_QWORD *)v70 + 16))(v70);
  v79 = *(_QWORD *)(a3 + 24);
  if (!v79)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v79 + 48))(v79, v128);
  v80 = *(std::__shared_weak_count **)&v128[16];
  if (*(_QWORD *)&v128[16])
  {
    v81 = (unint64_t *)(*(_QWORD *)&v128[16] + 8);
    do
      v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }
  size = (std::__shared_weak_count *)v118.__r_.__value_.__l.__size_;
  std::promise<mlcore::EntityRevision>::~promise((uint64_t *)&v111);
  if (size)
  {
    v84 = (unint64_t *)&size->__shared_owners_;
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v86 = *(std::__shared_weak_count **)&__p[8];
  if (*(_QWORD *)&__p[8])
  {
    v87 = (unint64_t *)(*(_QWORD *)&__p[8] + 8);
    do
      v88 = __ldaxr(v87);
    while (__stlxr(v88 - 1, v87));
    if (!v88)
    {
      ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
      std::__shared_weak_count::__release_weak(v86);
    }
  }
  v89 = (std::__shared_weak_count *)v110.__r_.__value_.__r.__words[0];
  if (v110.__r_.__value_.__r.__words[0])
  {
    v90 = (unint64_t *)(v110.__r_.__value_.__r.__words[0] + 8);
    do
      v91 = __ldaxr(v90);
    while (__stlxr(v91 - 1, v90));
    if (!v91)
    {
      ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
      std::__shared_weak_count::__release_weak(v89);
    }
  }
  v92 = (std::__shared_weak_count *)v114.__r_.__value_.__r.__words[0];
  if (v114.__r_.__value_.__r.__words[0])
  {
    v93 = (unint64_t *)(v114.__r_.__value_.__r.__words[0] + 8);
    do
      v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
  }
  *(_QWORD *)v128 = &v120;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100]((void ***)v128);
  v95 = (std::__shared_weak_count *)*((_QWORD *)&v123 + 1);
  if (*((_QWORD *)&v123 + 1))
  {
    v96 = (unint64_t *)(*((_QWORD *)&v123 + 1) + 8);
    do
      v97 = __ldaxr(v96);
    while (__stlxr(v97 - 1, v96));
    if (!v97)
    {
      ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
      std::__shared_weak_count::__release_weak(v95);
    }
  }
  v98 = v125;
  if (v125)
  {
    v99 = (unint64_t *)&v125->__shared_owners_;
    do
      v100 = __ldaxr(v99);
    while (__stlxr(v100 - 1, v99));
    if (!v100)
    {
      ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
      std::__shared_weak_count::__release_weak(v98);
    }
  }
}

void sub_20A90C42C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD27AFC](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::DatabaseResult<int,long long,int,int,int>::enumerateRows(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  sqlite3_stmt **v8;
  sqlite3_stmt *v9;
  int v10;
  sqlite3_int64 v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  uint64_t result;
  char v22;
  int v23;
  int v24;
  int v25;
  sqlite3_int64 v26;
  int v27;
  _QWORD v28[3];
  _QWORD *v29;
  _BYTE v30[24];
  _BYTE *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  while (1)
  {
    v4 = *a1;
    v5 = sqlite3_step(*(sqlite3_stmt **)(*a1 + 24));
    mediaplatform::DatabaseStatement::_checkSQLiteResult(v4, v5);
    *(_DWORD *)(v4 + 56) = v5;
    v6 = *a1;
    v7 = *(_DWORD *)(*a1 + 56);
    if (v7 != 100)
      break;
    v9 = *(sqlite3_stmt **)(v6 + 24);
    v8 = (sqlite3_stmt **)(v6 + 24);
    v10 = sqlite3_column_int(v9, 0);
    v11 = sqlite3_column_int64(*v8, 1);
    v12 = sqlite3_column_int(*v8, 2);
    v13 = sqlite3_column_int(*v8, 3);
    v14 = sqlite3_column_int(*v8, 4);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v28, a2);
    if (!v29)
    {
      v31 = 0;
      v27 = v10;
      v26 = v11;
      v24 = v13;
      v25 = v12;
      v23 = v14;
LABEL_25:
      std::__throw_bad_function_call[abi:ne180100]();
    }
    if (v29 == v28)
    {
      v31 = v30;
      (*(void (**)(_QWORD *, _BYTE *))(v28[0] + 24))(v28, v30);
      v15 = (uint64_t)v31;
    }
    else
    {
      v15 = (*(uint64_t (**)(void))(*v29 + 16))();
      v31 = (_BYTE *)v15;
    }
    v27 = v10;
    v26 = v11;
    v24 = v13;
    v25 = v12;
    v23 = v14;
    if (!v15)
      goto LABEL_25;
    (*(void (**)(uint64_t, int *, sqlite3_int64 *, int *, int *, int *, char *))(*(_QWORD *)v15 + 48))(v15, &v27, &v26, &v25, &v24, &v23, &v22);
    v16 = v31;
    if (v31 == v30)
    {
      v16 = v30;
      v17 = 4;
    }
    else
    {
      if (!v31)
        goto LABEL_13;
      v17 = 5;
    }
    (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_13:
    v18 = v29;
    if (v29 == v28)
    {
      v18 = v28;
      v19 = 4;
      goto LABEL_17;
    }
    if (v29)
    {
      v19 = 5;
LABEL_17:
      (*(void (**)(void))(*v18 + 8 * v19))();
    }
    if (v22)
    {
      v6 = *a1;
      goto LABEL_22;
    }
  }
  if (v7 == -1)
    __assert_rtn("hasColumnValueData", "DatabaseStatement.cpp", 102, "_lastStepResult != -1");
  v22 = 1;
LABEL_22:
  v20 = sqlite3_reset(*(sqlite3_stmt **)(v6 + 24));
  result = mediaplatform::DatabaseStatement::_checkSQLiteResult(v6, v20);
  *(_DWORD *)(v6 + 56) = -1;
  return result;
}

void sub_20A90CB2C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  void *v9;
  _Unwind_Exception *v10;

  __cxa_free_exception(v9);
  __cxa_end_catch();
  _Unwind_Resume(v10);
}

void sub_20A90CB4C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_20A90CB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  uint64_t v18;
  _Unwind_Exception *v19;

  v17 = a17;
  if (a17 == &a14)
  {
    v18 = 4;
    v17 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:
  _Unwind_Resume(v19);
}

uint64_t *std::promise<mlcore::EntityRevision>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  const std::error_category *v7;
  std::logic_error *exception;
  std::logic_error *v9;
  std::logic_error v10;
  std::logic_error v11;
  std::exception_ptr v12;

  v2 = *a1;
  if (v2)
  {
    if ((*(_BYTE *)(v2 + 136) & 1) == 0)
    {
      v12.__ptr_ = 0;
      v3 = *(_QWORD *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v12);
      v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        v7 = std::future_category();
        MEMORY[0x20BD27844](&v10, 4, v7);
        exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
        v9 = std::logic_error::logic_error(exception, &v10);
        v9->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB810] + 16);
        v9[1] = v11;
        __cxa_throw(v9, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
      }
    }
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
  return a1;
}

void sub_20A90CCA8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__assoc_sub_state *a10, char a11)
{
  uint64_t v11;
  std::exception_ptr v12;

  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
  v12.__ptr_ = (void *)(v11 - 32);
  std::__assoc_sub_state::set_exception(a10, v12);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v11 - 32));
  MEMORY[0x20BD27850](&a11);
  JUMPOUT(0x20A90CC18);
}

void std::__function::__func<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0,std::allocator<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0>,void ()(int,long long,int,int,int,BOOL &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0,std::allocator<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0>,void ()(int,long long,int,int,int,BOOL &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C33B6C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0,std::allocator<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0>,void ()(int,long long,int,int,int,BOOL &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C33B6C0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0,std::allocator<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0>,void ()(int,long long,int,int,int,BOOL &)>::operator()(uint64_t a1, int *a2, uint64_t *a3, unsigned int *a4, unsigned int *a5, uint64_t a6, _BYTE *a7)
{
  int v9;
  unsigned int v10;
  unsigned int v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  std::__shared_weak_count *v29;
  std::__shared_weak_count *v30;
  unint64_t v31;
  std::exception_ptr v32;

  v9 = *a2;
  v10 = *a4;
  v11 = *a5;
  mlcore::Entity::createWithType((mlcore::Entity *)*a5, *a3, &v28);
  v12 = v28;
  v13 = v29;
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
    LODWORD(v28) = 0;
    v29 = v12;
    v30 = v13;
    v16 = (unint64_t *)&v13->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
    v31 = __PAIR64__(v10, v11);
    do
      v18 = __ldaxr(v16);
    while (__stlxr(v18 - 1, v16));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  else
  {
    LODWORD(v28) = 0;
    v29 = v12;
    v30 = 0;
    v31 = __PAIR64__(v10, v11);
  }
  LODWORD(v28) = v9;
  v19 = **(_QWORD **)(a1 + 8);
  if (!v19)
    std::__throw_future_error[abi:ne180100](3u);
  std::mutex::lock((std::mutex *)(v19 + 24));
  if ((*(_BYTE *)(v19 + 136) & 1) != 0
    || (v32.__ptr_ = 0, v20 = *(_QWORD *)(v19 + 16), std::exception_ptr::~exception_ptr(&v32), v20))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_DWORD *)(v19 + 144) = v9;
  v21 = v30;
  *(_QWORD *)(v19 + 152) = v29;
  *(_QWORD *)(v19 + 160) = v21;
  if (v21)
  {
    v22 = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  *(_QWORD *)(v19 + 168) = v31;
  *(_DWORD *)(v19 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(v19 + 88));
  std::mutex::unlock((std::mutex *)(v19 + 24));
  *a7 = 1;
  if (v21)
  {
    v24 = (unint64_t *)&v21->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (v13)
  {
    v26 = (unint64_t *)&v13->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

void sub_20A90CF3C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  uint64_t v2;
  std::mutex *v3;
  unint64_t *p_shared_owners;
  unint64_t v6;

  std::mutex::unlock(v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0,std::allocator<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0>,void ()(int,long long,int,int,int,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"ZN6mlcore24EntityRevisionController13fetchRevisionENSt3__110shared_ptrIKNS_6EntityEEERKNS1_8functionIFvRKNS_14EntityRevisionEEEEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0,std::allocator<mlcore::EntityRevisionController::fetchRevision(std::shared_ptr<mlcore::Entity const>,std::function<void ()(mlcore::EntityRevision const&)> const&)::$_0>,void ()(int,long long,int,int,int,BOOL &)>::target_type()
{
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  void *exception;
  const std::error_category *v3;

  exception = __cxa_allocate_exception(0x20uLL);
  v3 = std::future_category();
  MEMORY[0x20BD27844](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_20A90D020(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<mlcore::EntityRevision>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__assoc_state<mlcore::EntityRevision>::__on_zero_shared(_BYTE *a1)
{
  if ((a1[136] & 1) != 0)
    std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 152));
  return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 8))(a1);
}

void std::__function::__func<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1},std::allocator<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1}>,void ()(int,long long,int,int,int,BOOL &)>::~__func()
{
  JUMPOUT(0x20BD27AFCLL);
}

_QWORD *std::__function::__func<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1},std::allocator<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1}>,void ()(int,long long,int,int,int,BOOL &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24C33ACC8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1},std::allocator<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1}>,void ()(int,long long,int,int,int,BOOL &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24C33ACC8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1},std::allocator<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1}>,void ()(int,long long,int,int,int,BOOL &)>::operator()(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  **(_BYTE **)(result + 8) = 1;
  *a7 = 1;
  return result;
}

uint64_t std::__function::__func<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1},std::allocator<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1}>,void ()(int,long long,int,int,int,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), 0x800000020A921A75))
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1},std::allocator<mediaplatform::DatabaseResult<int,long long,int,int,int>::hasAtLeastOneRow(void)::{lambda(int,long long,int,int,int,BOOL &)#1}>,void ()(int,long long,int,int,int,BOOL &)>::target_type()
{
}

mlcore::EntityRevisionTable *_ZNSt3__115allocate_sharedB8ne180100IN6mlcore19EntityRevisionTableENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(mlcore::EntityRevisionTable **a1)
{
  _QWORD *v2;
  mlcore::EntityRevisionTable *result;

  v2 = operator new(0x248uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = &off_24C33CEF8;
  result = mlcore::EntityRevisionTable::EntityRevisionTable((mlcore::EntityRevisionTable *)(v2 + 3));
  *a1 = result;
  a1[1] = (mlcore::EntityRevisionTable *)v2;
  return result;
}

void sub_20A90D220(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<mlcore::EntityRevisionTable>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CEF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<mlcore::EntityRevisionTable>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C33CEF8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t std::__shared_ptr_emplace<mlcore::EntityRevisionTable>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

mlcore::CategoryTable *mlcore::CategoryTable::CategoryTable(mlcore::CategoryTable *this)
{
  void *__p[2];
  char v4;
  _BYTE v5[64];
  void *v6[2];
  char v7;
  _QWORD v8[3];
  char v9;
  void *v10[2];
  char v11;

  std::string::basic_string[abi:ne180100]<0>(v10, "category");
  std::string::basic_string[abi:ne180100]<0>(v6, "category_id");
  mlcore::MediaColumn<long long>::MediaColumn((uint64_t)v8, (uint64_t)v6, 1);
  std::string::basic_string[abi:ne180100]<0>(__p, "category");
  mlcore::MediaColumn<std::string>::MediaColumn((uint64_t)v5, (uint64_t)__p, 48);
  mlcore::MediaTable<long long,std::string>::MediaTable((uint64_t)this, (uint64_t)v10, (uint64_t)v8, (uint64_t)v5);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)v5);
  if (v4 < 0)
    operator delete(__p[0]);
  v8[0] = off_24C335D90;
  if (v9 < 0)
    operator delete((void *)v8[1]);
  if (v7 < 0)
    operator delete(v6[0]);
  if (v11 < 0)
    operator delete(v10[0]);
  *(_QWORD *)this = off_24C336F38;
  return this;
}

void sub_20A90D374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;

  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&a16);
  if (a15 < 0)
    operator delete(__p);
  *(_QWORD *)(v29 - 88) = off_24C335D90;
  if (*(char *)(v29 - 57) < 0)
    operator delete(*(void **)(v29 - 80));
  if (a29 < 0)
    operator delete(a24);
  if (*(char *)(v29 - 17) < 0)
    operator delete(*(void **)(v29 - 40));
  _Unwind_Resume(a1);
}

void mlcore::CategoryTable::~CategoryTable(mlcore::CategoryTable *this)
{
  *(_QWORD *)this = off_24C336050;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 240);
  *((_QWORD *)this + 24) = off_24C335D90;
  if (*((char *)this + 223) < 0)
    operator delete(*((void **)this + 25));
  *(_QWORD *)this = off_24C3354E8;
  *((_QWORD *)this + 18) = off_24C335D90;
  if (*((char *)this + 175) < 0)
    operator delete(*((void **)this + 19));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 80);
  if (*((char *)this + 79) < 0)
    operator delete(*((void **)this + 7));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)this);
}

{
  *(_QWORD *)this = off_24C336050;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 240);
  *((_QWORD *)this + 24) = off_24C335D90;
  if (*((char *)this + 223) < 0)
    operator delete(*((void **)this + 25));
  *(_QWORD *)this = off_24C3354E8;
  *((_QWORD *)this + 18) = off_24C335D90;
  if (*((char *)this + 175) < 0)
    operator delete(*((void **)this + 19));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 80);
  if (*((char *)this + 79) < 0)
    operator delete(*((void **)this + 7));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)this);
  JUMPOUT(0x20BD27AFCLL);
}

void mlcore::CategoryTable::categoryIDColumn(mlcore::CategoryTable *this@<X0>, uint64_t a2@<X8>)
{
  mlcore::MediaTable<long long,std::string>::mediaColumnAtIndex<0ul>(a2, (uint64_t)this);
}

void mlcore::CategoryTable::categoryColumn(mlcore::CategoryTable *this@<X0>, uint64_t a2@<X8>)
{
  mlcore::MediaTable<long long,std::string>::mediaColumnAtIndex<1ul>(a2, (uint64_t)this);
}

void mlcore::ContainerItemTable::~ContainerItemTable(mlcore::ContainerItemTable *this)
{
  mlcore::MediaTable<long long,long long,long long,long long,std::string,std::string,std::string>::~MediaTable((uint64_t)this);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseTable<long long,long long,long long,long long,std::string,std::string,std::string>::columnCount()
{
  return 7;
}

void mediaplatform::DatabaseTable<long long,long long,long long,long long,std::string,std::string,std::string>::columnNames(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 416);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 368);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 320);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 272);
  mediaplatform::ColumnNamesApplier::operator()<std::string>((uint64_t)a2, a1 + 208);
  mediaplatform::ColumnNamesApplier::operator()<std::string>((uint64_t)a2, a1 + 144);
  mediaplatform::ColumnNamesApplier::operator()<std::string>((uint64_t)a2, a1 + 80);
}

void sub_20A90D5F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mediaplatform::DatabaseTable<long long,long long,long long,long long,std::string,std::string,std::string>::targetColumnExpression(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  __int128 *v3;
  __int128 *v4[3];
  __int128 **v5;

  v3 = (__int128 *)(a1 + 8);
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)a1 + 24))(v4);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string &,std::string const&,void>(a2, v4[0], v3);
  v5 = v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void sub_20A90D670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::MediaTable<long long,long long,long long,long long,std::string,std::string,std::string>::~MediaTable(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24C3315D0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 784);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 720);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 656);
  *(_QWORD *)(a1 + 608) = off_24C335D90;
  if (*(char *)(a1 + 639) < 0)
    operator delete(*(void **)(a1 + 616));
  *(_QWORD *)(a1 + 560) = off_24C335D90;
  if (*(char *)(a1 + 591) < 0)
    operator delete(*(void **)(a1 + 568));
  *(_QWORD *)(a1 + 512) = off_24C335D90;
  if (*(char *)(a1 + 543) < 0)
    operator delete(*(void **)(a1 + 520));
  *(_QWORD *)(a1 + 464) = off_24C335D90;
  if (*(char *)(a1 + 495) < 0)
    operator delete(*(void **)(a1 + 472));
  mediaplatform::DatabaseTable<long long,long long,long long,long long,std::string,std::string,std::string>::~DatabaseTable(a1);
}

{
  mlcore::MediaTable<long long,long long,long long,long long,std::string,std::string,std::string>::~MediaTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::DatabaseTable<long long,long long,long long,long long,std::string,std::string,std::string>::~DatabaseTable(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24C330D28;
  *(_QWORD *)(a1 + 416) = off_24C335D90;
  if (*(char *)(a1 + 447) < 0)
    operator delete(*(void **)(a1 + 424));
  *(_QWORD *)(a1 + 368) = off_24C335D90;
  if (*(char *)(a1 + 399) < 0)
    operator delete(*(void **)(a1 + 376));
  *(_QWORD *)(a1 + 320) = off_24C335D90;
  if (*(char *)(a1 + 351) < 0)
    operator delete(*(void **)(a1 + 328));
  *(_QWORD *)(a1 + 272) = off_24C335D90;
  if (*(char *)(a1 + 303) < 0)
    operator delete(*(void **)(a1 + 280));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 208);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 144);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 80);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

{
  mediaplatform::DatabaseTable<long long,long long,long long,long long,std::string,std::string,std::string>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mlcore::ContainerItemTable::persistentIDColumn(mlcore::ContainerItemTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 495) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 59), *((_QWORD *)this + 60));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 472);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 61);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 124);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 127);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 500);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemTable::containerPIDColumn(mlcore::ContainerItemTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 543) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 65), *((_QWORD *)this + 66));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 520);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 67);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 136);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 139);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 548);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemTable::itemPIDColumn(mlcore::ContainerItemTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 591) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 71), *((_QWORD *)this + 72));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 568);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 73);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 148);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 151);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 596);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemTable::positionColumn(mlcore::ContainerItemTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 639) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 77), *((_QWORD *)this + 78));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 616);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 79);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 160);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 163);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 644);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemTable::UUIDColumn(mlcore::ContainerItemTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 687) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 83), *((_QWORD *)this + 84));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 664);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 85);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 172);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 692);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 719) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 87), *((_QWORD *)this + 88));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 696);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 89);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A90DAFC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ContainerItemTable::positionUUIDColumn(mlcore::ContainerItemTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 751) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 91), *((_QWORD *)this + 92));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 728);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 93);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 188);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 756);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 783) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 95), *((_QWORD *)this + 96));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 760);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 97);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A90DBDC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ContainerItemTable::occurrenceIDColumn(mlcore::ContainerItemTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 815) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 99), *((_QWORD *)this + 100));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 792);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 101);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 204);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 820);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 847) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 103), *((_QWORD *)this + 104));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 824);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 105);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A90DCBC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ContainerItemPersonTable::~ContainerItemPersonTable(mlcore::ContainerItemPersonTable *this)
{
  mlcore::MediaTable<long long,long long,long long>::~MediaTable(this);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseTable<long long,long long,long long>::columnCount()
{
  return 3;
}

void mediaplatform::DatabaseTable<long long,long long,long long>::columnNames(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 176);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 128);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 80);
}

void sub_20A90DD60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::ContainerItemPersonTable::targetColumnExpression(mlcore::ContainerItemPersonTable *this@<X0>, const mediaplatform::DatabaseColumnBase *a2@<X2>, _QWORD *a3@<X8>)
{
  std::string __p;

  if (*((char *)a2 + 31) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
  else
    __p = *(std::string *)((char *)a2 + 8);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string,std::string const&,void>(a3, (__int128 *)&__p, (__int128 *)((char *)this + 8));
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20A90DDF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mlcore::MediaTable<long long,long long,long long>::~MediaTable(mediaplatform::DatabaseTableBase *this)
{
  *(_QWORD *)this = &off_24C336558;
  *((_QWORD *)this + 40) = off_24C335D90;
  if (*((char *)this + 351) < 0)
    operator delete(*((void **)this + 41));
  *((_QWORD *)this + 34) = off_24C335D90;
  if (*((char *)this + 303) < 0)
    operator delete(*((void **)this + 35));
  *((_QWORD *)this + 28) = off_24C335D90;
  if (*((char *)this + 255) < 0)
    operator delete(*((void **)this + 29));
  *(_QWORD *)this = off_24C3359F0;
  *((_QWORD *)this + 22) = off_24C335D90;
  if (*((char *)this + 207) < 0)
    operator delete(*((void **)this + 23));
  *((_QWORD *)this + 16) = off_24C335D90;
  if (*((char *)this + 159) < 0)
    operator delete(*((void **)this + 17));
  *((_QWORD *)this + 10) = off_24C335D90;
  if (*((char *)this + 111) < 0)
    operator delete(*((void **)this + 11));
  if (*((char *)this + 79) < 0)
    operator delete(*((void **)this + 7));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)this);
}

void mediaplatform::DatabaseTable<long long,long long,long long>::~DatabaseTable(mediaplatform::DatabaseTableBase *this)
{
  *(_QWORD *)this = off_24C3359F0;
  *((_QWORD *)this + 22) = off_24C335D90;
  if (*((char *)this + 207) < 0)
    operator delete(*((void **)this + 23));
  *((_QWORD *)this + 16) = off_24C335D90;
  if (*((char *)this + 159) < 0)
    operator delete(*((void **)this + 17));
  *((_QWORD *)this + 10) = off_24C335D90;
  if (*((char *)this + 111) < 0)
    operator delete(*((void **)this + 11));
  if (*((char *)this + 79) < 0)
    operator delete(*((void **)this + 7));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)this);
}

{
  *(_QWORD *)this = off_24C3359F0;
  *((_QWORD *)this + 22) = off_24C335D90;
  if (*((char *)this + 207) < 0)
    operator delete(*((void **)this + 23));
  *((_QWORD *)this + 16) = off_24C335D90;
  if (*((char *)this + 159) < 0)
    operator delete(*((void **)this + 17));
  *((_QWORD *)this + 10) = off_24C335D90;
  if (*((char *)this + 111) < 0)
    operator delete(*((void **)this + 11));
  if (*((char *)this + 79) < 0)
    operator delete(*((void **)this + 7));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)this);
  JUMPOUT(0x20BD27AFCLL);
}

{
  *(_QWORD *)this = off_24C3359F0;
  *((_QWORD *)this + 22) = off_24C335D90;
  if (*((char *)this + 207) < 0)
    operator delete(*((void **)this + 23));
  *((_QWORD *)this + 16) = off_24C335D90;
  if (*((char *)this + 159) < 0)
    operator delete(*((void **)this + 17));
  *((_QWORD *)this + 10) = off_24C335D90;
  if (*((char *)this + 111) < 0)
    operator delete(*((void **)this + 11));
  if (*((char *)this + 79) < 0)
    operator delete(*((void **)this + 7));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)this);
}

void mediaplatform::DatabaseTable<long long,long long,long long>::targetColumnExpression(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  __int128 *v3;
  __int128 *v4[3];
  __int128 **v5;

  v3 = (__int128 *)(a1 + 8);
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)a1 + 24))(v4);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string &,std::string const&,void>(a2, v4[0], v3);
  v5 = v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void sub_20A90E050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::MediaTable<long long,long long,long long>::~MediaTable(mediaplatform::DatabaseTableBase *a1)
{
  mlcore::MediaTable<long long,long long,long long>::~MediaTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mlcore::ContainerItemPersonTable::persistentIDColumn(mlcore::ContainerItemPersonTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 255) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 29), *((_QWORD *)this + 30));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 232);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 31);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 64);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 67);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 260);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemPersonTable::containerItemPersistentIDColumn(mlcore::ContainerItemPersonTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 303) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 35), *((_QWORD *)this + 36));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 280);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 37);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 76);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 79);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 308);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::ContainerItemPersonTable::personPersistentIDColumn(mlcore::ContainerItemPersonTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 351) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 41), *((_QWORD *)this + 42));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 328);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 43);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 88);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 91);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 356);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mediaplatform::File::~File(mediaplatform::File *this)
{
  *(_QWORD *)this = &off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100]((uint64_t *)this + 1);
}

{
  *(_QWORD *)this = &off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100]((uint64_t *)this + 1);
  JUMPOUT(0x20BD27AFCLL);
}

{
  *(_QWORD *)this = &off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100]((uint64_t *)this + 1);
}

uint64_t *std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1;
  void **v2;

  v1 = *result;
  *result = 0;
  if (v1)
  {
    *(_QWORD *)v1 = &off_24C331570;
    v2 = (void **)(v1 + 8);
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
    JUMPOUT(0x20BD27AFCLL);
  }
  return result;
}

void mediaplatform::TemporaryFile::~TemporaryFile(mediaplatform::FilePath **this)
{
  mediaplatform::TemporaryFile::~TemporaryFile(this);
  JUMPOUT(0x20BD27AFCLL);
}

{
  void *__p[2];
  char v3;

  *this = (mediaplatform::FilePath *)&off_24C330DA8;
  if (*((_BYTE *)this + 16))
  {
    mediaplatform::FilePath::str(this[1], (uint64_t)__p);
    mediaplatform::File::remove((const char *)__p);
    if (v3 < 0)
      operator delete(__p[0]);
  }
  *this = (mediaplatform::FilePath *)&off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100]((uint64_t *)this + 1);
}

uint64_t mediaplatform::File::remove(const char *a1)
{
  const char *v1;
  const char *v2;
  DIR *v3;
  DIR *v4;
  dirent *v5;
  dirent *v6;
  char *d_name;
  size_t v8;
  std::string *v9;
  const char *v10;
  void **v11;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  void **v15;
  uint64_t result;
  std::runtime_error *exception;
  const char *v18;
  std::runtime_error *v19;
  void *__p[2];
  unsigned __int8 v21;
  std::string v22;
  void *v23[2];
  int64_t v24;
  stat v25;

  v1 = a1;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (lstat(a1, &v25))
    goto LABEL_44;
  if (v1[23] >= 0)
    v2 = v1;
  else
    v2 = *(const char **)v1;
  if ((v25.st_mode & 0xF000) != 0x4000)
  {
    result = unlink(v2);
    if (!(_DWORD)result)
      return result;
    goto LABEL_44;
  }
  v3 = opendir(v2);
  if (!v3)
  {
LABEL_44:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    mediaplatform::POSIXException::POSIXException(exception);
    goto LABEL_53;
  }
  v4 = v3;
  while (1)
  {
    v5 = readdir(v4);
    if (!v5)
      break;
    v6 = v5;
    d_name = v5->d_name;
    if (strcmp(v5->d_name, ".") && strcmp(d_name, ".."))
    {
      if (v1[23] >= 0)
        v8 = *((unsigned __int8 *)v1 + 23);
      else
        v8 = *((_QWORD *)v1 + 1);
      std::string::basic_string[abi:ne180100]((uint64_t)&v22, v8 + 1);
      if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v9 = &v22;
      else
        v9 = (std::string *)v22.__r_.__value_.__r.__words[0];
      if (v8)
      {
        if (v1[23] >= 0)
          v10 = v1;
        else
          v10 = *(const char **)v1;
        memmove(v9, v10, v8);
      }
      *(_WORD *)((char *)&v9->__r_.__value_.__l.__data_ + v8) = 47;
      std::string::basic_string[abi:ne180100]<0>(__p, d_name);
      if ((v21 & 0x80u) == 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      if ((v21 & 0x80u) == 0)
        v12 = v21;
      else
        v12 = (std::string::size_type)__p[1];
      v13 = std::string::append(&v22, (const std::string::value_type *)v11, v12);
      v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      v24 = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)v23 = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      if ((char)v21 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v22.__r_.__value_.__l.__data_);
      if ((v6->d_type & 4) != 0)
      {
        mediaplatform::File::remove(v23);
      }
      else
      {
        if (v24 >= 0)
          v15 = v23;
        else
          v15 = (void **)v23[0];
        if (unlink((const char *)v15))
        {
          v19 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          mediaplatform::POSIXException::POSIXException(v19);
        }
      }
      if (SHIBYTE(v24) < 0)
        operator delete(v23[0]);
    }
  }
  closedir(v4);
  if (v1[23] >= 0)
    v18 = v1;
  else
    v18 = *(const char **)v1;
  result = rmdir(v18);
  if ((_DWORD)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    mediaplatform::POSIXException::POSIXException(exception);
LABEL_53:
  }
  return result;
}

void sub_20A90E6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  __cxa_free_exception(v26);
  _Unwind_Resume(a1);
}

std::runtime_error *mediaplatform::POSIXException::POSIXException(std::runtime_error *this)
{
  int *v2;
  char *v3;
  std::runtime_error *result;

  v2 = __error();
  v3 = strerror(*v2);
  result = std::runtime_error::runtime_error(this, v3);
  this->__vftable = (std::runtime_error_vtbl *)&off_24C330DE8;
  return result;
}

void mediaplatform::POSIXException::~POSIXException(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::TemporaryDirectory::~TemporaryDirectory(mediaplatform::FilePath **this)
{
  mediaplatform::TemporaryDirectory::~TemporaryDirectory(this);
  JUMPOUT(0x20BD27AFCLL);
}

{
  void *__p[2];
  char v3;

  *this = (mediaplatform::FilePath *)&off_24C3310A0;
  if (*((_BYTE *)this + 16))
  {
    mediaplatform::FilePath::str(this[1], (uint64_t)__p);
    mediaplatform::File::remove((const char *)__p);
    if (v3 < 0)
      operator delete(__p[0]);
  }
  *this = (mediaplatform::FilePath *)&off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100]((uint64_t *)this + 1);
}

mediaplatform::File *mediaplatform::File::File(mediaplatform::File *this, const mediaplatform::FilePath *a2)
{
  _QWORD *v4;
  std::string __p;

  *(_QWORD *)this = &off_24C331550;
  v4 = (_QWORD *)operator new();
  mediaplatform::FilePath::str(a2, (uint64_t)&__p);
  mediaplatform::FilePath::FilePath(v4, &__p);
  *((_QWORD *)this + 1) = v4;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return this;
}

void sub_20A90E8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x20BD27AFC](v15, 0xA0C4030951706);
  _Unwind_Resume(a1);
}

_QWORD *mediaplatform::File::File(_QWORD *a1, std::string *a2)
{
  _QWORD *v4;

  *a1 = &off_24C331550;
  v4 = (_QWORD *)operator new();
  mediaplatform::FilePath::FilePath(v4, a2);
  a1[1] = v4;
  return a1;
}

void sub_20A90E948(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD27AFC](v1, 0xA0C4030951706);
  _Unwind_Resume(a1);
}

mediaplatform::File *mediaplatform::File::File(mediaplatform::File *this, mediaplatform::FilePath **a2)
{
  _QWORD *v4;
  std::string __p;

  *(_QWORD *)this = &off_24C331550;
  v4 = (_QWORD *)operator new();
  mediaplatform::FilePath::str(a2[1], (uint64_t)&__p);
  mediaplatform::FilePath::FilePath(v4, &__p);
  *((_QWORD *)this + 1) = v4;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return this;
}

void sub_20A90E9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x20BD27AFC](v15, 0xA0C4030951706);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::File::path(mediaplatform::File *this)
{
  return *((_QWORD *)this + 1);
}

BOOL mediaplatform::File::isDirectory(mediaplatform::FilePath **this)
{
  void **v1;
  int v2;
  std::runtime_error *exception;
  void *__p[2];
  char v6;
  stat v7;

  mediaplatform::FilePath::str(this[1], (uint64_t)__p);
  if (v6 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  v2 = lstat((const char *)v1, &v7);
  if (v6 < 0)
    operator delete(__p[0]);
  if (v2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    mediaplatform::POSIXException::POSIXException(exception);
  }
  return (v7.st_mode & 0xF000) == 0x4000;
}

void sub_20A90EB08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  _Unwind_Resume(a1);
}

BOOL mediaplatform::File::exists(mediaplatform::FilePath **this)
{
  void **v1;
  int v2;
  void *__p[2];
  char v5;

  mediaplatform::FilePath::str(this[1], (uint64_t)__p);
  if (v5 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  v2 = access((const char *)v1, 0);
  if (v5 < 0)
    operator delete(__p[0]);
  return v2 != -1;
}

BOOL mediaplatform::File::isReadable(mediaplatform::FilePath **this)
{
  void **v1;
  int v2;
  void *__p[2];
  char v5;

  mediaplatform::FilePath::str(this[1], (uint64_t)__p);
  if (v5 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  v2 = access((const char *)v1, 4);
  if (v5 < 0)
    operator delete(__p[0]);
  return v2 != -1;
}

BOOL mediaplatform::File::isWritable(mediaplatform::FilePath **this)
{
  void **v1;
  int v2;
  void *__p[2];
  char v5;

  mediaplatform::FilePath::str(this[1], (uint64_t)__p);
  if (v5 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  v2 = access((const char *)v1, 2);
  if (v5 < 0)
    operator delete(__p[0]);
  return v2 != -1;
}

off_t mediaplatform::File::fileSize(mediaplatform::FilePath **this)
{
  void **v1;
  void *__p[2];
  char v4;
  stat v5;

  mediaplatform::FilePath::str(this[1], (uint64_t)__p);
  if (v4 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  stat((const char *)v1, &v5);
  if (v4 < 0)
    operator delete(__p[0]);
  return v5.st_size;
}

void sub_20A90ECBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t mediaplatform::File::create(const char *a1, unsigned __int8 *a2)
{
  FILE *v3;
  FILE *v4;
  size_t v5;
  std::runtime_error *exception;
  int v8;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v3 = fopen(a1, "w");
  if (!v3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    mediaplatform::POSIXException::POSIXException(exception);
    goto LABEL_13;
  }
  v4 = v3;
  if (((char)a2[23] & 0x80000000) == 0)
  {
    v5 = a2[23];
    if (!a2[23])
      return fclose(v4);
    goto LABEL_9;
  }
  v5 = *((_QWORD *)a2 + 1);
  if (v5)
  {
    a2 = *(unsigned __int8 **)a2;
LABEL_9:
    if (fwrite(a2, 1uLL, v5, v3) >= v5)
      return fclose(v4);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v8 = ferror(v4);
    mediaplatform::POSIXException::POSIXException(exception, v8);
LABEL_13:
  }
  return fclose(v4);
}

void sub_20A90EDAC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *mediaplatform::POSIXException::POSIXException(std::runtime_error *this, int __errnum)
{
  char *v3;
  std::runtime_error *result;

  v3 = strerror(__errnum);
  result = std::runtime_error::runtime_error(this, v3);
  this->__vftable = (std::runtime_error_vtbl *)&off_24C330DE8;
  return result;
}

void mediaplatform::File::move(const std::__fs::filesystem::path *a1, const std::__fs::filesystem::path *a2, std::error_code *a3)
{
  int v3;
  std::runtime_error *exception;

  if ((a1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    a1 = (const std::__fs::filesystem::path *)a1->__pn_.__r_.__value_.__r.__words[0];
  if ((a2->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    a2 = (const std::__fs::filesystem::path *)a2->__pn_.__r_.__value_.__r.__words[0];
  rename(a1, a2, a3);
  if (v3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    mediaplatform::POSIXException::POSIXException(exception);
  }
}

void sub_20A90EE68(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::File::truncate(const char *a1, off_t a2)
{
  uint64_t result;
  std::runtime_error *exception;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  result = truncate(a1, a2);
  if ((_DWORD)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    mediaplatform::POSIXException::POSIXException(exception);
  }
  return result;
}

void sub_20A90EED4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::File::link(const char *a1, const char *a2, int a3)
{
  uint64_t result;
  std::runtime_error *exception;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (a2[23] < 0)
    a2 = *(const char **)a2;
  if (a3)
    result = symlink(a1, a2);
  else
    result = link(a1, a2);
  if ((_DWORD)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    mediaplatform::POSIXException::POSIXException(exception);
  }
  return result;
}

void sub_20A90EF5C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t mediaplatform::File::copyDatabase(const char *a1, uint64_t a2, uint64_t a3)
{
  int v5;
  const char *v6;
  int v7;
  sqlite3_backup *v8;
  sqlite3_backup *v9;
  unsigned int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v16;
  void *exception;
  char *v18;
  int v19;
  void *v20;
  char *v21;
  void *v22;
  int v23;
  char *v24;
  int v25;
  void *v26;
  char *v27;
  __int128 v28;
  sqlite3 *ppDb;
  sqlite3 *db;
  int v31;

  ppDb = 0;
  db = 0;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v5 = sqlite3_open(a1, &ppDb);
  if (v5)
  {
    v16 = v5;
    exception = __cxa_allocate_exception(0x40uLL);
    v31 = 8;
    v18 = (char *)sqlite3_errstr(v16);
    std::string::basic_string[abi:ne180100]<0>(&v28, v18);
    mediaplatform::PlatformErrorCondition::PlatformErrorCondition((uint64_t)exception, &v31, &v28);
  }
  if (*(char *)(a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  v7 = sqlite3_open(v6, &db);
  if (v7)
  {
    v19 = v7;
    v20 = __cxa_allocate_exception(0x40uLL);
    v31 = 8;
    v21 = (char *)sqlite3_errstr(v19);
    std::string::basic_string[abi:ne180100]<0>(&v28, v21);
    mediaplatform::PlatformErrorCondition::PlatformErrorCondition((uint64_t)v20, &v31, &v28);
  }
  v8 = sqlite3_backup_init(db, "main", ppDb, "main");
  if (!v8)
  {
    v22 = __cxa_allocate_exception(0x40uLL);
    v31 = 8;
    v23 = sqlite3_errcode(db);
    v24 = (char *)sqlite3_errstr(v23);
    std::string::basic_string[abi:ne180100]<0>(&v28, v24);
    mediaplatform::PlatformErrorCondition::PlatformErrorCondition((uint64_t)v22, &v31, &v28);
  }
  v9 = v8;
  do
  {
    v10 = sqlite3_backup_step(v9, 100);
    v11 = sqlite3_backup_remaining(v9);
    v12 = sqlite3_backup_pagecount(v9);
    LODWORD(v28) = v11;
    v31 = v12;
    v13 = *(_QWORD *)(a3 + 24);
    if (!v13)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, __int128 *, int *))(*(_QWORD *)v13 + 48))(v13, &v28, &v31);
    if (v10 - 5 <= 1)
      sqlite3_sleep(250);
  }
  while (v10 <= 6 && ((1 << v10) & 0x61) != 0);
  v14 = sqlite3_backup_finish(v9);
  if (v14)
  {
    v25 = v14;
    v26 = __cxa_allocate_exception(0x40uLL);
    v31 = 8;
    v27 = (char *)sqlite3_errstr(v25);
    std::string::basic_string[abi:ne180100]<0>(&v28, v27);
    mediaplatform::PlatformErrorCondition::PlatformErrorCondition((uint64_t)v26, &v31, &v28);
  }
  sqlite3_close(db);
  return sqlite3_close(ppDb);
}

void sub_20A90F218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  char v15;

  if (a14 < 0)
    operator delete(__p);
  if ((v15 & 1) != 0)
    __cxa_free_exception(v14);
  _Unwind_Resume(exception_object);
}

void mediaplatform::File::createDirectory(__int128 **this, const mediaplatform::FilePath *a2, __int16 a3)
{
  int v4;
  std::string *p_p;
  int v7;
  int v8;
  void **v9;
  std::string *v10;
  int v11;
  std::runtime_error *exception;
  int *v13;
  std::string __p;
  uint64_t v15;
  std::string::size_type *p_size;

  if (this[2] != this[1])
  {
    v4 = (int)a2;
    mediaplatform::FilePath::str((mediaplatform::FilePath *)this, (uint64_t)&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v7 = access((const char *)p_p, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v7 == -1)
    {
      if (v4)
      {
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C331570;
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
        v15 = 0;
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&__p.__r_.__value_.__r.__words[1], this[1], this[2], 0xAAAAAAAAAAAAAAABLL * (((char *)this[2] - (char *)this[1]) >> 3));
        if (__p.__r_.__value_.__r.__words[2] != __p.__r_.__value_.__l.__size_)
        {
          v9 = (void **)(__p.__r_.__value_.__r.__words[2] - 24);
          if (*(char *)(__p.__r_.__value_.__r.__words[2] - 1) < 0)
            operator delete(*v9);
          __p.__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
        }
        mediaplatform::File::createDirectory((mediaplatform::File *)&__p, (const mediaplatform::FilePath *)1, a3, v8);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C331570;
        p_size = &__p.__r_.__value_.__l.__size_;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_size);
      }
      mediaplatform::FilePath::str((mediaplatform::FilePath *)this, (uint64_t)&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = &__p;
      else
        v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
      v11 = mkdir((const char *)v10, a3);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v11)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        mediaplatform::FormatString<mediaplatform::FilePath>(&__p, (std::string *)"Unable to create directory at '{0}'", (uint64_t)this);
        v13 = __error();
        mediaplatform::POSIXException::POSIXException(exception, *v13, (uint64_t)&__p);
      }
    }
  }
}

void sub_20A90F400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  int v18;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v18 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v18)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v17);
  goto LABEL_6;
}

std::runtime_error *mediaplatform::POSIXException::POSIXException(std::runtime_error *a1, int __errnum, uint64_t a3)
{
  char *v6;
  std::string v7;
  _QWORD v8[2];

  v6 = strerror(__errnum);
  memset(&v7, 0, sizeof(v7));
  v8[0] = &v6;
  v8[1] = a3;
  mediaplatform::FormatImplementation<std::string,char *>((std::string *)"{0}: {1}", &v7, 0, (uint64_t)v8);
  std::runtime_error::runtime_error(a1, &v7);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
  a1->__vftable = (std::runtime_error_vtbl *)&off_24C330DE8;
  return a1;
}

void sub_20A90F4D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void mediaplatform::FormatImplementation<std::string,char *>(std::string *a1, std::string *a2, std::string::size_type a3, uint64_t a4)
{
  char v8;
  char *v9;
  std::string::size_type i;
  int v11;
  const char *v12;
  size_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  size_t v18;
  size_t v19;
  std::string *v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  int v31;
  uint64_t v32;
  char *v33;
  char *v34;
  unsigned __int8 *v35;
  int v36;
  std::runtime_error *exception;
  const char *__src;
  unint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v8 = 0;
  v9 = (char *)a1;
  for (i = a3; ; ++i)
  {
    v44 = v9;
    if (*v9 == 123)
      break;
    if (!*v9)
    {
      std::string::resize(a2, i, 0);
      if (i != a3)
        mediaplatform::CopyFormatSectionToResult(a1, a2, a3, i - a3, v8 & 1);
      return;
    }
LABEL_7:
    ++v9;
  }
  v11 = v9[1];
  if (v11 == 123)
  {
    v44 = v9 + 1;
    v8 = 1;
    ++v9;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v44 = v9 + 2;
    v31 = v9[2];
    if ((v31 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v32 = 0;
      v33 = v9 + 3;
      do
      {
        v34 = v33;
        v44 = v33;
        v32 = (v31 - 48) + 10 * v32;
        ++v33;
        v36 = *v34;
        v35 = (unsigned __int8 *)(v34 - 1);
        v31 = v36;
      }
      while ((v36 - 58) >= 0xFFFFFFF6);
      v44 = (char *)(v35 + 2);
      if (*(v33 - 1) == 125)
        mediaplatform::FormatterParameters<0ul,std::string,char *>::formatOptionsAtIndex<std::string,char *>(v32);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  mediaplatform::FormatOptions::FormatOptions((uint64_t)&v39, (const char **)&v44);
  if (v40)
  {
    if (v40 != 1)
      mediaplatform::FormatterParameters<2ul>::formatParameterAtIndex<mediaplatform::FormatterParameters<0ul,std::string,char *>>();
    v12 = **(const char ***)a4;
    __src = v12;
    if (v12)
      v13 = strlen(v12);
    else
      v13 = 0;
    v18 = *((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1) <= v13)
      v18 = v13;
    if ((_BYTE)v41)
      v19 = v18;
    else
      v19 = v13;
    mediaplatform::FormatImplementation<std::string,char *>(v44, a2, v19 + i, a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = a2;
    else
      v20 = (std::string *)a2->__r_.__value_.__r.__words[0];
    v21 = (char *)v20 + i;
    if ((_BYTE)v41 && (v22 = *((_QWORD *)&v41 + 1), v23 = *((_QWORD *)&v41 + 1) - v13, *((_QWORD *)&v41 + 1) > v13))
    {
      if ((_DWORD)v39)
      {
        if ((_DWORD)v39 == 1)
        {
          v25 = v23 >> 1;
          if (v23 >= 2)
          {
            if (v25 <= 1)
              v26 = 1;
            else
              v26 = v23 >> 1;
            do
            {
              *v21++ = BYTE4(v43);
              --v26;
            }
            while (v26);
          }
          if (v13)
            memmove(v21, __src, v13);
          if (v23 != v25)
          {
            v27 = v23 - (v23 >> 1);
            v28 = &v21[v13];
            if (v27 <= 1)
              v27 = 1;
            v29 = -(uint64_t)v27;
            do
              *v28++ = BYTE4(v43);
            while (!__CFADD__(v29++, 1));
          }
        }
        else if ((_DWORD)v39 == 2)
        {
          if (*((_QWORD *)&v41 + 1) != v13)
          {
            do
            {
              *v21++ = BYTE4(v43);
              --v23;
            }
            while (v23);
          }
          goto LABEL_42;
        }
      }
      else
      {
        if (v13)
          memmove((char *)v20 + i, __src, v13);
        if (v22 != v13)
        {
          v24 = (size_t)v20 + v13;
          do
          {
            *(_BYTE *)(v24 + i) = BYTE4(v43);
            ++v24;
            --v23;
          }
          while (v23);
        }
      }
    }
    else
    {
LABEL_42:
      if (v13)
        memmove(v21, __src, v13);
    }
  }
  else
  {
    v14 = *(_QWORD *)(a4 + 8);
    v45 = v14;
    v46 = v39;
    v47 = v41;
    v48 = v42;
    v49 = v43;
    if (*(char *)(v14 + 23) < 0)
      v15 = *(_QWORD *)(v14 + 8);
    else
      v15 = *(unsigned __int8 *)(v14 + 23);
    v16 = *((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1) <= v15)
      v16 = v15;
    if ((_BYTE)v41)
      v15 = v16;
    mediaplatform::FormatImplementation<std::string,char *>(v44, a2, v15 + i, a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = (char *)a2;
    else
      v17 = (char *)a2->__r_.__value_.__r.__words[0];
    mediaplatform::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,std::string>(&v39, &v17[i], (uint64_t)&v45);
  }
  if (i != a3)
    mediaplatform::CopyFormatSectionToResult(a1, a2, a3, i - a3, v8 & 1);
}

void sub_20A90F8AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<0ul,std::string,char *>::formatOptionsAtIndex<std::string,char *>(uint64_t a1)
{
  std::runtime_error *exception;

  if (!a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  mediaplatform::FormatterParameters<1ul,char *>::formatOptionsAtIndex<std::string,char *>(a1);
}

void sub_20A90F908(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<2ul>::formatParameterAtIndex<mediaplatform::FormatterParameters<0ul,std::string,char *>>()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A90F958(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<1ul,char *>::formatOptionsAtIndex<std::string,char *>(uint64_t a1)
{
  std::runtime_error *exception;

  if (a1 == 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  mediaplatform::FormatterParameters<2ul>::formatOptionsAtIndex<std::string,char *>();
}

void sub_20A90F9B4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mediaplatform::FormatterParameters<2ul>::formatOptionsAtIndex<std::string,char *>()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A90FA04(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

mediaplatform::TemporaryFile *mediaplatform::TemporaryFile::TemporaryFile(mediaplatform::TemporaryFile *this, const mediaplatform::FilePath *a2, char a3)
{
  char *v6;
  void *v7;
  int v8;
  uint64_t v9;
  std::string v11;
  std::string __s1;
  std::string __p;
  std::string::size_type *p_size;

  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  mediaplatform::File::File(this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = &off_24C330DA8;
  *((_BYTE *)this + 16) = a3;
  std::string::basic_string[abi:ne180100]<0>(&__s1, "temporary.XXXXXXXX");
  mediaplatform::FilePath::operator+((uint64_t)a2, &__s1, (uint64_t)&__p);
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s1.__r_.__value_.__l.__data_);
  mediaplatform::FilePath::str((mediaplatform::FilePath *)&__p, (uint64_t)&__s1);
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
  {
    v7 = (void *)__s1.__r_.__value_.__r.__words[0];
    v6 = strdup(__s1.__r_.__value_.__l.__data_);
    operator delete(v7);
  }
  else
  {
    v6 = strdup((const char *)&__s1);
  }
  v8 = mkstemp(v6);
  v9 = *((_QWORD *)this + 1);
  std::string::basic_string[abi:ne180100]<0>(&v11, v6);
  mediaplatform::FilePath::FilePath(&__s1, &v11);
  if ((std::string *)v9 != &__s1)
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((std::vector<std::string> *)(v9 + 8), (std::string *)__s1.__r_.__value_.__l.__size_, (__int128 *)__s1.__r_.__value_.__r.__words[2], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__s1.__r_.__value_.__r.__words[2] - __s1.__r_.__value_.__l.__size_) >> 3));
  __s1.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C331570;
  p_size = &__s1.__r_.__value_.__l.__size_;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_size);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  free(v6);
  if (v8)
    close(v8);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C331570;
  __s1.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__s1);
  return this;
}

void sub_20A90FBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void (**a22)(mediaplatform::FilePath *__hidden this),uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;

  a15 = (uint64_t *)&off_24C331570;
  *(_QWORD *)(v29 - 56) = v28;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v29 - 56));
  if (a14 < 0)
    operator delete(__p);
  a22 = &off_24C331570;
  a15 = &a23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a15);
  *v27 = &off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100](v27 + 1);
  _Unwind_Resume(a1);
}

mediaplatform::TemporaryFile *mediaplatform::TemporaryFile::TemporaryFile(mediaplatform::TemporaryFile *this, char a2)
{
  std::string __p;
  void (**v6)(mediaplatform::FilePath *__hidden);
  uint64_t v7;
  void **v8;

  std::string::basic_string[abi:ne180100]<0>(&__p, "/tmp");
  mediaplatform::FilePath::FilePath(&v6, &__p);
  mediaplatform::TemporaryFile::TemporaryFile(this, (const mediaplatform::FilePath *)&v6, a2);
  v6 = &off_24C331570;
  v8 = (void **)&v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return this;
}

{
  std::string __p;
  void (**v6)(mediaplatform::FilePath *__hidden);
  uint64_t v7;
  void **v8;

  std::string::basic_string[abi:ne180100]<0>(&__p, "/tmp");
  mediaplatform::FilePath::FilePath(&v6, &__p);
  mediaplatform::TemporaryFile::TemporaryFile(this, (const mediaplatform::FilePath *)&v6, a2);
  v6 = &off_24C331570;
  v8 = (void **)&v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return this;
}

void sub_20A90FD04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v16 - 40) = v15 + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v16 - 40));
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_20A90FDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v16 - 40) = v15 + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v16 - 40));
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

mediaplatform::File *mediaplatform::TemporaryFile::TemporaryFile(mediaplatform::TemporaryFile *this, const mediaplatform::FilePath **a2)
{
  mediaplatform::File *result;

  result = mediaplatform::File::File(this, a2[1]);
  *(_QWORD *)result = &off_24C330DA8;
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = 0;
  return result;
}

{
  mediaplatform::File *result;

  result = mediaplatform::File::File(this, a2[1]);
  *(_QWORD *)result = &off_24C330DA8;
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = 0;
  return result;
}

mediaplatform::TemporaryDirectory *mediaplatform::TemporaryDirectory::TemporaryDirectory(mediaplatform::TemporaryDirectory *this, const mediaplatform::FilePath *a2, char a3)
{
  std::string *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  std::string v11;
  std::string v12;
  std::string __p;
  std::string::size_type *p_size;

  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  mediaplatform::File::File(this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = &off_24C3310A0;
  *((_BYTE *)this + 16) = a3;
  std::string::basic_string[abi:ne180100]<0>(&v12, "temporary.XXXXXXXX");
  mediaplatform::FilePath::operator+((uint64_t)a2, &v12, (uint64_t)&__p);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  mediaplatform::FilePath::str((mediaplatform::FilePath *)&__p, (uint64_t)&v12);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v12;
  else
    v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
  v7 = strdup((const char *)v6);
  v8 = mkdtemp(v7);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  v9 = *((_QWORD *)this + 1);
  std::string::basic_string[abi:ne180100]<0>(&v11, v8);
  mediaplatform::FilePath::FilePath(&v12, &v11);
  if ((std::string *)v9 != &v12)
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((std::vector<std::string> *)(v9 + 8), (std::string *)v12.__r_.__value_.__l.__size_, (__int128 *)v12.__r_.__value_.__r.__words[2], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12.__r_.__value_.__r.__words[2] - v12.__r_.__value_.__l.__size_) >> 3));
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C331570;
  p_size = &v12.__r_.__value_.__l.__size_;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_size);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  free(v8);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C331570;
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  return this;
}

void sub_20A91000C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void (**a15)(mediaplatform::FilePath *__hidden this), uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void (**a22)(mediaplatform::FilePath *__hidden this),uint64_t a23)
{
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  a15 = &off_24C331570;
  *(_QWORD *)(v25 - 40) = v24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v25 - 40));
  if (a14 < 0)
    operator delete(__p);
  a22 = &off_24C331570;
  a15 = (void (**)(mediaplatform::FilePath *__hidden))&a23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a15);
  *v23 = &off_24C331550;
  std::unique_ptr<mediaplatform::File::FilePrivate>::reset[abi:ne180100](v23 + 1);
  _Unwind_Resume(a1);
}

void sub_20A91009C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  JUMPOUT(0x20A910080);
}

void sub_20A9100B4()
{
  JUMPOUT(0x20A910080);
}

void sub_20A9100BC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  JUMPOUT(0x20A910094);
}

mediaplatform::TemporaryDirectory *mediaplatform::TemporaryDirectory::TemporaryDirectory(mediaplatform::TemporaryDirectory *this, char a2)
{
  std::string __p;
  void (**v6)(mediaplatform::FilePath *__hidden);
  uint64_t v7;
  void **v8;

  std::string::basic_string[abi:ne180100]<0>(&__p, "/tmp");
  mediaplatform::FilePath::FilePath(&v6, &__p);
  mediaplatform::TemporaryDirectory::TemporaryDirectory(this, (const mediaplatform::FilePath *)&v6, a2);
  v6 = &off_24C331570;
  v8 = (void **)&v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return this;
}

{
  std::string __p;
  void (**v6)(mediaplatform::FilePath *__hidden);
  uint64_t v7;
  void **v8;

  std::string::basic_string[abi:ne180100]<0>(&__p, "/tmp");
  mediaplatform::FilePath::FilePath(&v6, &__p);
  mediaplatform::TemporaryDirectory::TemporaryDirectory(this, (const mediaplatform::FilePath *)&v6, a2);
  v6 = &off_24C331570;
  v8 = (void **)&v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return this;
}

void sub_20A910168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v16 - 40) = v15 + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v16 - 40));
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_20A910238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v16 - 40) = v15 + 8;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v16 - 40));
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

mediaplatform::File *mediaplatform::TemporaryDirectory::TemporaryDirectory(mediaplatform::TemporaryDirectory *this, const mediaplatform::FilePath **a2)
{
  mediaplatform::File *result;

  result = mediaplatform::File::File(this, a2[1]);
  *(_QWORD *)result = &off_24C3310A0;
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = 0;
  return result;
}

{
  mediaplatform::File *result;

  result = mediaplatform::File::File(this, a2[1]);
  *(_QWORD *)result = &off_24C3310A0;
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = 0;
  return result;
}

void mlcore::AlbumArtistTable::~AlbumArtistTable(mlcore::AlbumArtistTable *this)
{
  *(_QWORD *)this = &off_24C336130;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul,12ul,13ul,14ul,15ul,16ul,17ul,18ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>>::~__tuple_impl((uint64_t)this + 1104);
  mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::~DatabaseTable((uint64_t)this);
}

{
  *(_QWORD *)this = &off_24C336130;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul,12ul,13ul,14ul,15ul,16ul,17ul,18ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>>::~__tuple_impl((uint64_t)this + 1104);
  mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::~DatabaseTable((uint64_t)this);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::columnCount()
{
  return 19;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul,12ul,13ul,14ul,15ul,16ul,17ul,18ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>>::~__tuple_impl(uint64_t a1)
{
  *(_QWORD *)(a1 + 976) = off_24C335D90;
  if (*(char *)(a1 + 1007) < 0)
    operator delete(*(void **)(a1 + 984));
  *(_QWORD *)(a1 + 928) = off_24C335D90;
  if (*(char *)(a1 + 959) < 0)
    operator delete(*(void **)(a1 + 936));
  *(_QWORD *)(a1 + 880) = off_24C335D90;
  if (*(char *)(a1 + 911) < 0)
    operator delete(*(void **)(a1 + 888));
  *(_QWORD *)(a1 + 832) = off_24C335D90;
  if (*(char *)(a1 + 863) < 0)
    operator delete(*(void **)(a1 + 840));
  *(_QWORD *)(a1 + 784) = off_24C335D90;
  if (*(char *)(a1 + 815) < 0)
    operator delete(*(void **)(a1 + 792));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 720);
  *(_QWORD *)(a1 + 672) = off_24C335D90;
  if (*(char *)(a1 + 703) < 0)
    operator delete(*(void **)(a1 + 680));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 592);
  *(_QWORD *)(a1 + 544) = off_24C335D90;
  if (*(char *)(a1 + 575) < 0)
    operator delete(*(void **)(a1 + 552));
  *(_QWORD *)(a1 + 496) = off_24C335D90;
  if (*(char *)(a1 + 527) < 0)
    operator delete(*(void **)(a1 + 504));
  *(_QWORD *)(a1 + 448) = off_24C335D90;
  if (*(char *)(a1 + 479) < 0)
    operator delete(*(void **)(a1 + 456));
  *(_QWORD *)(a1 + 400) = off_24C335D90;
  if (*(char *)(a1 + 431) < 0)
    operator delete(*(void **)(a1 + 408));
  *(_QWORD *)(a1 + 352) = off_24C335D90;
  if (*(char *)(a1 + 383) < 0)
    operator delete(*(void **)(a1 + 360));
  *(_QWORD *)(a1 + 304) = off_24C335D90;
  if (*(char *)(a1 + 335) < 0)
    operator delete(*(void **)(a1 + 312));
  *(_QWORD *)(a1 + 256) = off_24C335D90;
  if (*(char *)(a1 + 287) < 0)
    operator delete(*(void **)(a1 + 264));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 176);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 112);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 48);
  *(_QWORD *)a1 = off_24C335D90;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

void mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::~DatabaseTable(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24C3355C8;
  *(_QWORD *)(a1 + 1056) = off_24C335D90;
  if (*(char *)(a1 + 1087) < 0)
    operator delete(*(void **)(a1 + 1064));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 992);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 928);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 848);
  *(_QWORD *)(a1 + 800) = off_24C335D90;
  if (*(char *)(a1 + 831) < 0)
    operator delete(*(void **)(a1 + 808));
  *(_QWORD *)(a1 + 752) = off_24C335D90;
  if (*(char *)(a1 + 783) < 0)
    operator delete(*(void **)(a1 + 760));
  mediaplatform::DatabaseColumnTuple<6ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1 + 80);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

{
  mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseColumnTuple<6ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 624) = off_24C335D90;
  if (*(char *)(a1 + 655) < 0)
    operator delete(*(void **)(a1 + 632));
  *(_QWORD *)(a1 + 576) = off_24C335D90;
  if (*(char *)(a1 + 607) < 0)
    operator delete(*(void **)(a1 + 584));
  *(_QWORD *)(a1 + 528) = off_24C335D90;
  if (*(char *)(a1 + 559) < 0)
    operator delete(*(void **)(a1 + 536));
  *(_QWORD *)(a1 + 480) = off_24C335D90;
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 352);
  return mediaplatform::DatabaseColumnTuple<12ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<12ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 304) = off_24C335D90;
  if (*(char *)(a1 + 335) < 0)
    operator delete(*(void **)(a1 + 312));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 240);
  *(_QWORD *)(a1 + 192) = off_24C335D90;
  if (*(char *)(a1 + 223) < 0)
    operator delete(*(void **)(a1 + 200));
  *(_QWORD *)(a1 + 144) = off_24C335D90;
  if (*(char *)(a1 + 175) < 0)
    operator delete(*(void **)(a1 + 152));
  *(_QWORD *)(a1 + 96) = off_24C335D90;
  if (*(char *)(a1 + 127) < 0)
    operator delete(*(void **)(a1 + 104));
  *(_QWORD *)(a1 + 48) = off_24C335D90;
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  *(_QWORD *)a1 = off_24C335D90;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

void mlcore::MediaTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::~MediaTable(_QWORD *a1)
{
  *a1 = &off_24C336130;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul,12ul,13ul,14ul,15ul,16ul,17ul,18ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>>::~__tuple_impl((uint64_t)(a1 + 138));
  mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::~DatabaseTable((uint64_t)a1);
}

{
  *a1 = &off_24C336130;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul,12ul,13ul,14ul,15ul,16ul,17ul,18ul>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<mediaplatform::Data>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<std::string>,mlcore::MediaColumn<int>,mlcore::MediaColumn<int>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<long long>,mlcore::MediaColumn<int>>::~__tuple_impl((uint64_t)(a1 + 138));
  mediaplatform::DatabaseTable<long long,std::string,std::string,mediaplatform::Data,int,long long,long long,int,int,int,int,mediaplatform::Data,long long,std::string,int,int,long long,long long,int>::~DatabaseTable((uint64_t)a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseColumnTuple<1ul,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 912);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 848);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 768);
  *(_QWORD *)(a1 + 720) = off_24C335D90;
  if (*(char *)(a1 + 751) < 0)
    operator delete(*(void **)(a1 + 728));
  *(_QWORD *)(a1 + 672) = off_24C335D90;
  if (*(char *)(a1 + 703) < 0)
    operator delete(*(void **)(a1 + 680));
  return mediaplatform::DatabaseColumnTuple<6ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<2ul,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 848);
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 768);
  *(_QWORD *)(a1 + 720) = off_24C335D90;
  if (*(char *)(a1 + 751) < 0)
    operator delete(*(void **)(a1 + 728));
  *(_QWORD *)(a1 + 672) = off_24C335D90;
  if (*(char *)(a1 + 703) < 0)
    operator delete(*(void **)(a1 + 680));
  return mediaplatform::DatabaseColumnTuple<6ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<3ul,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 768);
  *(_QWORD *)(a1 + 720) = off_24C335D90;
  if (*(char *)(a1 + 751) < 0)
    operator delete(*(void **)(a1 + 728));
  *(_QWORD *)(a1 + 672) = off_24C335D90;
  if (*(char *)(a1 + 703) < 0)
    operator delete(*(void **)(a1 + 680));
  return mediaplatform::DatabaseColumnTuple<6ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<4ul,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 720) = off_24C335D90;
  if (*(char *)(a1 + 751) < 0)
    operator delete(*(void **)(a1 + 728));
  *(_QWORD *)(a1 + 672) = off_24C335D90;
  if (*(char *)(a1 + 703) < 0)
    operator delete(*(void **)(a1 + 680));
  return mediaplatform::DatabaseColumnTuple<6ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<5ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 672) = off_24C335D90;
  if (*(char *)(a1 + 703) < 0)
    operator delete(*(void **)(a1 + 680));
  return mediaplatform::DatabaseColumnTuple<6ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<7ul,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 576) = off_24C335D90;
  if (*(char *)(a1 + 607) < 0)
    operator delete(*(void **)(a1 + 584));
  *(_QWORD *)(a1 + 528) = off_24C335D90;
  if (*(char *)(a1 + 559) < 0)
    operator delete(*(void **)(a1 + 536));
  *(_QWORD *)(a1 + 480) = off_24C335D90;
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 352);
  return mediaplatform::DatabaseColumnTuple<12ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<8ul,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 528) = off_24C335D90;
  if (*(char *)(a1 + 559) < 0)
    operator delete(*(void **)(a1 + 536));
  *(_QWORD *)(a1 + 480) = off_24C335D90;
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 352);
  return mediaplatform::DatabaseColumnTuple<12ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<9ul,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 480) = off_24C335D90;
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 352);
  return mediaplatform::DatabaseColumnTuple<12ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<10ul,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<mediaplatform::Data>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  mediaplatform::DatabaseColumn<mediaplatform::Data>::~DatabaseColumn(a1 + 352);
  return mediaplatform::DatabaseColumnTuple<12ul,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(a1);
}

uint64_t mediaplatform::DatabaseColumnTuple<13ul,mediaplatform::DatabaseColumn<std::string>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<int>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<long long>,mediaplatform::DatabaseColumn<int>>::~DatabaseColumnTuple(uint64_t a1)
{
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 240);
  *(_QWORD *)(a1 + 192) = off_24C335D90;
  if (*(char *)(a1 + 223) < 0)
    operator delete(*(void **)(a1 + 200));
  *(_QWORD *)(a1 + 144) = off_24C335D90;
  if (*(char *)(a1 + 175) < 0)
    operator delete(*(void **)(a1 + 152));
  *(_QWORD *)(a1 + 96) = off_24C335D90;
  if (*(char *)(a1 + 127) < 0)
    operator delete(*(void **)(a1 + 104));
  *(_QWORD *)(a1 + 48) = off_24C335D90;
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  *(_QWORD *)a1 = off_24C335D90;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

void mlcore::AlbumArtistTable::persistentIDColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1135) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 139), *((_QWORD *)this + 140));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1112);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 141);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 284);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 287);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1140);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::AlbumArtistTable::nameColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1183) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 145), *((_QWORD *)this + 146));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1160);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 147);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 296);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 1188);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 1215) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 149), *((_QWORD *)this + 150));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1192);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 151);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A910C78(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::AlbumArtistTable::sortNameColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1247) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 153), *((_QWORD *)this + 154));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1224);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 155);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 312);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 1252);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 1279) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 157), *((_QWORD *)this + 158));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1256);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 159);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A910D58(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

mediaplatform::Data *mlcore::AlbumArtistTable::groupingKeyColumn@<X0>(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  mediaplatform::Data *result;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1311) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 161), *((_QWORD *)this + 162));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1288);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 163);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 328);
  *(_QWORD *)a2 = &off_24C335A98;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 1316);
  result = mediaplatform::Data::Data((mediaplatform::Data *)(a2 + 40), (mlcore::AlbumArtistTable *)((char *)this + 1320));
  *(_QWORD *)a2 = &off_24C336A40;
  return result;
}

void sub_20A910E14(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::AlbumArtistTable::cloudStatusColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1391) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 171), *((_QWORD *)this + 172));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1368);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 173);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 348);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1396);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::AlbumArtistTable::storeIDColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1439) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 177), *((_QWORD *)this + 178));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1416);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 179);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 360);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 363);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1444);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::AlbumArtistTable::representativeItemPersistentIDColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1487) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 183), *((_QWORD *)this + 184));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1464);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 185);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 372);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 375);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1492);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::AlbumArtistTable::keepLocalColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1535) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 189), *((_QWORD *)this + 190));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1512);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 191);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 384);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1540);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::AlbumArtistTable::keepLocalStatusColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1583) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 195), *((_QWORD *)this + 196));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1560);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 197);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 396);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1588);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::AlbumArtistTable::keepLocalStatusReasonColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1631) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 201), *((_QWORD *)this + 202));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1608);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 203);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 408);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1636);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::AlbumArtistTable::keepLocalConstraintsColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1679) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 207), *((_QWORD *)this + 208));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1656);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 209);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 420);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1684);
  *(_QWORD *)a2 = off_24C336AA0;
}

mediaplatform::Data *mlcore::AlbumArtistTable::appDataColumn@<X0>(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  mediaplatform::Data *result;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1727) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 213), *((_QWORD *)this + 214));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1704);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 215);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 432);
  *(_QWORD *)a2 = &off_24C335A98;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 1732);
  result = mediaplatform::Data::Data((mediaplatform::Data *)(a2 + 40), (mlcore::AlbumArtistTable *)((char *)this + 1736));
  *(_QWORD *)a2 = &off_24C336A40;
  return result;
}

void sub_20A911244(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::AlbumArtistTable::syncIDColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1807) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 223), *((_QWORD *)this + 224));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1784);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 225);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 452);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 455);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1812);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::AlbumArtistTable::cloudUniversalLibraryIDColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1855) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 229), *((_QWORD *)this + 230));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1832);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 231);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 464);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 1860);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 1887) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 233), *((_QWORD *)this + 234));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1864);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 235);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A9113A8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::AlbumArtistTable::classicalExperienceAvailableColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1919) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 237), *((_QWORD *)this + 238));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1896);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 239);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 480);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1924);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::AlbumArtistTable::likedStateColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 1967) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 243), *((_QWORD *)this + 244));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1944);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 245);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 492);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 1972);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::AlbumArtistTable::likedStateChangedDateColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 2015) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 249), *((_QWORD *)this + 250));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 1992);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 251);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 504);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 507);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 2020);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::AlbumArtistTable::sortOrderColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 2063) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 255), *((_QWORD *)this + 256));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 2040);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 257);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 516);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 519);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 2068);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::AlbumArtistTable::sortOrderSectionColumn(mlcore::AlbumArtistTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 2111) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 261), *((_QWORD *)this + 262));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 2088);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 263);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 528);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 2116);
  *(_QWORD *)a2 = off_24C336AA0;
}

mlcore::EntityChangeTable *mlcore::EntityChangeTable::EntityChangeTable(mlcore::EntityChangeTable *this)
{
  int v2;
  std::string *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  std::string *v9;
  std::string *v10;
  int v11;
  std::string *v12;
  int v13;
  std::string *v14;
  int v15;
  std::string *v16;
  int v17;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  std::string __str;
  void *__p[2];
  char v35;
  void *v36[2];
  char v37;
  _BYTE v38[8];
  std::string v39;
  int v40;
  char v41;
  std::string v42;
  void *v43[2];
  char v44;
  void (**v45)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v46;
  int v47;
  uint64_t v48;
  void *v49[2];
  char v50;
  void (**v51)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v52;
  int v53;
  uint64_t v54;
  int v55;
  void *v56[2];
  char v57;
  void (**v58)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v59;
  int v60;
  uint64_t v61;
  int v62;
  void *v63[2];
  char v64;
  void (**v65)(mediaplatform::DatabaseColumnBase *__hidden);
  std::string v66;
  int v67;
  uint64_t v68;
  std::string __s;
  uint64_t (**v70)();
  std::string v71;
  int v72;
  char v73;
  std::string v74;
  uint64_t (**v75)();
  std::string v76;
  int v77;
  uint64_t v78;
  uint64_t (**v79)();
  std::string v80;
  int v81;
  uint64_t v82;
  int v83;
  uint64_t (**v84)();
  std::string v85;
  int v86;
  uint64_t v87;
  int v88;
  uint64_t (**v89)();
  std::string v90;
  int v91;
  uint64_t v92;
  std::string v93;
  uint64_t (**v94)();
  std::string v95;
  int v96;
  char v97;
  std::string v98;
  uint64_t (**v99)();
  std::string v100;
  int v101;
  uint64_t v102;
  uint64_t (**v103)();
  std::string v104;
  int v105;
  uint64_t v106;
  int v107;
  uint64_t (**v108)();
  std::string v109;
  int v110;
  uint64_t v111;
  int v112;
  uint64_t (**v113)();
  std::string v114;
  int v115;
  uint64_t v116;
  uint64_t (**v117)();
  std::string v118;
  int v119;
  char v120;
  std::string v121;
  uint64_t (**v122)();
  std::string v123;
  int v124;
  uint64_t v125;
  uint64_t (**v126)();
  std::string v127;
  int v128;
  uint64_t v129;
  int v130;
  uint64_t (**v131)();
  std::string v132;
  int v133;
  uint64_t v134;
  int v135;
  uint64_t (**v136)();
  std::string v137;
  int v138;
  char v139;
  std::string v140;
  uint64_t (**v141)();
  std::string v142;
  int v143;
  uint64_t v144;
  uint64_t (**v145)();
  std::string v146;
  int v147;
  uint64_t v148;
  int v149;
  uint64_t (**v150)();
  std::string v151;
  int v152;
  char v153;
  std::string v154;
  uint64_t (**v155)();
  std::string v156;
  int v157;
  uint64_t v158;
  uint64_t (**v159)();
  std::string v160;
  int v161;
  char v162;
  std::string v163;

  std::string::basic_string[abi:ne180100]<0>(&__s, "entity_changes");
  std::string::basic_string[abi:ne180100]<0>(v63, "class");
  mlcore::MediaColumn<int>::MediaColumn((uint64_t)&v65, (uint64_t)v63, 16);
  std::string::basic_string[abi:ne180100]<0>(v56, "entity_pid");
  mlcore::MediaColumn<long long>::MediaColumn((uint64_t)&v58, (uint64_t)v56, 16);
  std::string::basic_string[abi:ne180100]<0>(v49, "source_pid");
  mlcore::MediaColumn<long long>::MediaColumn((uint64_t)&v51, (uint64_t)v49, 16);
  std::string::basic_string[abi:ne180100]<0>(v43, "change_type");
  mlcore::MediaColumn<int>::MediaColumn((uint64_t)&v45, (uint64_t)v43, 16);
  std::string::basic_string[abi:ne180100]<0>(v36, "changes");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  mlcore::MediaColumn<std::string>::MediaColumn((uint64_t)v38, (uint64_t)v36, (uint64_t)__p);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v93, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  else
    v93 = __s;
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v90, v66.__r_.__value_.__l.__data_, v66.__r_.__value_.__l.__size_);
  else
    v90 = v66;
  v2 = v67;
  v91 = v67;
  v89 = off_24C335AF8;
  v28 = v68;
  v92 = v68;
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v85, v59.__r_.__value_.__l.__data_, v59.__r_.__value_.__l.__size_);
  else
    v85 = v59;
  v84 = off_24C335B18;
  v87 = v61;
  v30 = v60;
  v86 = v60;
  v88 = v62;
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v80, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
  else
    v80 = v52;
  v79 = off_24C335B18;
  v82 = v54;
  v29 = v53;
  v81 = v53;
  v83 = v55;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v76, v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
  else
    v76 = v46;
  v32 = v47;
  v77 = v47;
  v75 = off_24C335AF8;
  v31 = v48;
  v78 = v48;
  v70 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v71, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
  else
    v71 = v39;
  v72 = v40;
  v70 = &off_24C335AB8;
  v73 = v41;
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v74, v42.__r_.__value_.__l.__data_, v42.__r_.__value_.__l.__size_);
  else
    v74 = v42;
  *(_QWORD *)this = &off_24C330F50;
  v3 = (std::string *)((char *)this + 8);
  v4 = SHIBYTE(v93.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v3, v93.__r_.__value_.__l.__data_, v93.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = *(_OWORD *)&v93.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 3) = *((_QWORD *)&v93.__r_.__value_.__l + 2);
  }
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *(_QWORD *)this = &off_24C335478;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  v5 = SHIBYTE(v90.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v114, v90.__r_.__value_.__l.__data_, v90.__r_.__value_.__l.__size_);
  else
    v114 = v90;
  v26 = v5;
  v27 = v2;
  v115 = v2;
  v113 = off_24C335AF8;
  v116 = v28;
  v25 = SHIBYTE(v85.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v109, v85.__r_.__value_.__l.__data_, v85.__r_.__value_.__l.__size_);
  else
    v109 = v85;
  v108 = off_24C335B18;
  v111 = v87;
  v110 = v30;
  v112 = v88;
  v24 = SHIBYTE(v80.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v104, v80.__r_.__value_.__l.__data_, v80.__r_.__value_.__l.__size_);
  else
    v104 = v80;
  v103 = off_24C335B18;
  v106 = v82;
  v105 = v29;
  v107 = v83;
  v23 = SHIBYTE(v76.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v100, v76.__r_.__value_.__l.__data_, v76.__r_.__value_.__l.__size_);
  else
    v100 = v76;
  v101 = v32;
  v99 = off_24C335AF8;
  v102 = v31;
  v94 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v95, v71.__r_.__value_.__l.__data_, v71.__r_.__value_.__l.__size_);
  else
    v95 = v71;
  v96 = v72;
  v94 = &off_24C335AB8;
  v97 = v73;
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v98, v74.__r_.__value_.__l.__data_, v74.__r_.__value_.__l.__size_);
  else
    v98 = v74;
  v21 = SHIBYTE(v109.__r_.__value_.__r.__words[2]);
  v22 = v4;
  if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v132, v109.__r_.__value_.__l.__data_, v109.__r_.__value_.__l.__size_);
  else
    v132 = v109;
  v131 = off_24C335B18;
  v134 = v87;
  v133 = v30;
  v135 = v88;
  v20 = SHIBYTE(v104.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v127, v104.__r_.__value_.__l.__data_, v104.__r_.__value_.__l.__size_);
  else
    v127 = v104;
  v126 = off_24C335B18;
  v129 = v82;
  v128 = v29;
  v130 = v83;
  v6 = SHIBYTE(v100.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v123, v100.__r_.__value_.__l.__data_, v100.__r_.__value_.__l.__size_);
  else
    v123 = v100;
  v124 = v32;
  v122 = off_24C335AF8;
  v125 = v31;
  v117 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v118, v95.__r_.__value_.__l.__data_, v95.__r_.__value_.__l.__size_);
  else
    v118 = v95;
  v119 = v96;
  v117 = &off_24C335AB8;
  v120 = v97;
  if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v121, v98.__r_.__value_.__l.__data_, v98.__r_.__value_.__l.__size_);
  else
    v121 = v98;
  v19 = SHIBYTE(v127.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v146, v127.__r_.__value_.__l.__data_, v127.__r_.__value_.__l.__size_);
  else
    v146 = v127;
  v145 = off_24C335B18;
  v148 = v82;
  v147 = v29;
  v149 = v83;
  v7 = SHIBYTE(v123.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v123.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v142, v123.__r_.__value_.__l.__data_, v123.__r_.__value_.__l.__size_);
  else
    v142 = v123;
  v143 = v32;
  v141 = off_24C335AF8;
  v144 = v31;
  v136 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v137, v118.__r_.__value_.__l.__data_, v118.__r_.__value_.__l.__size_);
  else
    v137 = v118;
  v138 = v119;
  v136 = &off_24C335AB8;
  v139 = v120;
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v140, v121.__r_.__value_.__l.__data_, v121.__r_.__value_.__l.__size_);
  else
    v140 = v121;
  v8 = SHIBYTE(v142.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v156, v142.__r_.__value_.__l.__data_, v142.__r_.__value_.__l.__size_);
  else
    v156 = v142;
  v157 = v32;
  v155 = off_24C335AF8;
  v158 = v31;
  v150 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v151, v137.__r_.__value_.__l.__data_, v137.__r_.__value_.__l.__size_);
  else
    v151 = v137;
  v152 = v138;
  v150 = &off_24C335AB8;
  v153 = v139;
  if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v154, v140.__r_.__value_.__l.__data_, v140.__r_.__value_.__l.__size_);
  else
    v154 = v140;
  v159 = (uint64_t (**)())off_24C335D90;
  if (SHIBYTE(v151.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v160, v151.__r_.__value_.__l.__data_, v151.__r_.__value_.__l.__size_);
  else
    v160 = v151;
  v161 = v152;
  v159 = &off_24C335AB8;
  v162 = v153;
  if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v163, v154.__r_.__value_.__l.__data_, v154.__r_.__value_.__l.__size_);
  else
    v163 = v154;
  *((_QWORD *)this + 10) = off_24C335D90;
  if (SHIBYTE(v160.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 88), v160.__r_.__value_.__l.__data_, v160.__r_.__value_.__l.__size_);
  else
    *(std::string *)((char *)this + 88) = v160;
  *((_DWORD *)this + 28) = v161;
  *((_QWORD *)this + 10) = &off_24C335AB8;
  *((_BYTE *)this + 116) = v162;
  v9 = (std::string *)((char *)this + 120);
  if (SHIBYTE(v163.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v9, v163.__r_.__value_.__l.__data_, v163.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)&v163.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 17) = *((_QWORD *)&v163.__r_.__value_.__l + 2);
  }
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v159);
  *((_QWORD *)this + 18) = off_24C335D90;
  v10 = (std::string *)((char *)this + 152);
  v11 = SHIBYTE(v156.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v156.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v10, v156.__r_.__value_.__l.__data_, v156.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)&v156.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 21) = *((_QWORD *)&v156.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 44) = v32;
  *((_QWORD *)this + 18) = off_24C335AF8;
  *(_QWORD *)((char *)this + 180) = v31;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v150);
  if (v11 < 0)
    operator delete(v156.__r_.__value_.__l.__data_);
  *((_QWORD *)this + 24) = off_24C335D90;
  v12 = (std::string *)((char *)this + 200);
  v13 = SHIBYTE(v146.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v146.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v12, v146.__r_.__value_.__l.__data_, v146.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = *(_OWORD *)&v146.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 27) = *((_QWORD *)&v146.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 56) = v29;
  *((_QWORD *)this + 24) = off_24C335B18;
  *(_QWORD *)((char *)this + 228) = v148;
  *((_DWORD *)this + 59) = v149;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v136);
  if (v8 < 0)
  {
    operator delete(v142.__r_.__value_.__l.__data_);
    if ((v13 & 0x80000000) == 0)
      goto LABEL_101;
  }
  else if ((v13 & 0x80000000) == 0)
  {
    goto LABEL_101;
  }
  operator delete(v146.__r_.__value_.__l.__data_);
LABEL_101:
  *((_QWORD *)this + 30) = off_24C335D90;
  v14 = (std::string *)((char *)this + 248);
  v15 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v14, v132.__r_.__value_.__l.__data_, v132.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = *(_OWORD *)&v132.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 33) = *((_QWORD *)&v132.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 68) = v30;
  *((_QWORD *)this + 30) = off_24C335B18;
  *(_QWORD *)((char *)this + 276) = v134;
  *((_DWORD *)this + 71) = v135;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v117);
  if (v7 < 0)
    operator delete(v123.__r_.__value_.__l.__data_);
  if (v19 < 0)
  {
    operator delete(v127.__r_.__value_.__l.__data_);
    if ((v15 & 0x80000000) == 0)
      goto LABEL_110;
  }
  else if ((v15 & 0x80000000) == 0)
  {
    goto LABEL_110;
  }
  operator delete(v132.__r_.__value_.__l.__data_);
LABEL_110:
  *((_QWORD *)this + 36) = off_24C335D90;
  v16 = (std::string *)((char *)this + 296);
  v17 = SHIBYTE(v114.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v16, v114.__r_.__value_.__l.__data_, v114.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)&v114.__r_.__value_.__l.__data_;
    *((_QWORD *)this + 39) = *((_QWORD *)&v114.__r_.__value_.__l + 2);
  }
  *((_DWORD *)this + 80) = v27;
  *((_QWORD *)this + 36) = off_24C335AF8;
  *(_QWORD *)((char *)this + 324) = v28;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v94);
  if (v6 < 0)
    operator delete(v100.__r_.__value_.__l.__data_);
  if (v20 < 0)
    operator delete(v104.__r_.__value_.__l.__data_);
  if (v21 < 0)
  {
    operator delete(v109.__r_.__value_.__l.__data_);
    if ((v17 & 0x80000000) == 0)
      goto LABEL_121;
  }
  else if ((v17 & 0x80000000) == 0)
  {
    goto LABEL_121;
  }
  operator delete(v114.__r_.__value_.__l.__data_);
LABEL_121:
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&v70);
  v75 = (uint64_t (**)())off_24C335D90;
  if (v23 < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  v79 = (uint64_t (**)())off_24C335D90;
  if (v24 < 0)
    operator delete(v80.__r_.__value_.__l.__data_);
  v84 = (uint64_t (**)())off_24C335D90;
  if (v25 < 0)
    operator delete(v85.__r_.__value_.__l.__data_);
  v89 = (uint64_t (**)())off_24C335D90;
  if (v26 < 0)
    operator delete(v90.__r_.__value_.__l.__data_);
  if (v22 < 0)
    operator delete(v93.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_24C335FE0;
  *((_QWORD *)this + 42) = off_24C335D90;
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 344), v66.__r_.__value_.__l.__data_, v66.__r_.__value_.__l.__size_);
  else
    *(std::string *)((char *)this + 344) = v66;
  *((_DWORD *)this + 92) = v67;
  *(_QWORD *)((char *)this + 372) = v68;
  *((_QWORD *)this + 42) = off_24C336AA0;
  *((_QWORD *)this + 48) = off_24C335D90;
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 392), v59.__r_.__value_.__l.__data_, v59.__r_.__value_.__l.__size_);
  else
    *(std::string *)((char *)this + 392) = v59;
  *((_DWORD *)this + 104) = v60;
  *(_QWORD *)((char *)this + 420) = v61;
  *((_DWORD *)this + 107) = v62;
  *((_QWORD *)this + 48) = off_24C336AC0;
  *((_QWORD *)this + 54) = off_24C335D90;
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 440), v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
  else
    *(std::string *)((char *)this + 440) = v52;
  *((_DWORD *)this + 116) = v53;
  *(_QWORD *)((char *)this + 468) = v54;
  *((_DWORD *)this + 119) = v55;
  *((_QWORD *)this + 54) = off_24C336AC0;
  *((_QWORD *)this + 60) = off_24C335D90;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 488), v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
  else
    *(std::string *)((char *)this + 488) = v46;
  *((_DWORD *)this + 128) = v47;
  *(_QWORD *)((char *)this + 516) = v48;
  *((_QWORD *)this + 60) = off_24C336AA0;
  std::__tuple_leaf<4ul,mlcore::MediaColumn<std::string>,false>::__tuple_leaf[abi:ne180100]<mlcore::MediaColumn<std::string>&,void>((uint64_t)this + 528, (uint64_t)v38);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)v38);
  if (v35 < 0)
    operator delete(__p[0]);
  if (v37 < 0)
    operator delete(v36[0]);
  v45 = off_24C335D90;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  if (v44 < 0)
    operator delete(v43[0]);
  v51 = off_24C335D90;
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  if (v50 < 0)
    operator delete(v49[0]);
  v58 = off_24C335D90;
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);
  if (v57 < 0)
    operator delete(v56[0]);
  v65 = off_24C335D90;
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v66.__r_.__value_.__l.__data_);
  if (v64 < 0)
    operator delete(v63[0]);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_24C339710;
  std::string::basic_string[abi:ne180100]<0>(&__str, "UNIQUE (class, entity_pid, source_pid, change_type)");
  std::string::operator=((std::string *)((char *)this + 56), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  return this;
}

void sub_20A9125C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53,void (**a54)(mediaplatform::DatabaseColumnBase *__hidden this),void *a55,uint64_t a56,int a57,__int16 a58,char a59,char a60,uint64_t a61,uint64_t a62,void *a63)
{
  char a68;
  void (**a69)(mediaplatform::DatabaseColumnBase *__hidden);
  void *a70;
  char a72;
  void *a73;
  char a74;
  void (**a75)(mediaplatform::DatabaseColumnBase *__hidden);
  void *a76;
  char a77;
  void *a78;
  char a79;
  void (**a80)(mediaplatform::DatabaseColumnBase *__hidden);
  uint64_t v80;
  void **v81;
  void **v82;
  void **v83;

  *(_QWORD *)(v80 + 432) = off_24C335D90;
  if (*(char *)(v80 + 463) < 0)
    operator delete(*v83);
  *(_QWORD *)(v80 + 384) = off_24C335D90;
  if (*(char *)(v80 + 415) < 0)
    operator delete(*v82);
  *(_QWORD *)(v80 + 336) = off_24C335D90;
  if (*(char *)(v80 + 367) < 0)
    operator delete(*v81);
  mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable(v80);
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)&a40);
  if (a33 < 0)
    operator delete(__p);
  if (a39 < 0)
    operator delete(a34);
  a54 = off_24C335D90;
  if (a60 < 0)
    operator delete(a55);
  if (a53 < 0)
    operator delete(a48);
  a69 = off_24C335D90;
  if (a72 < 0)
    operator delete(a70);
  if (a68 < 0)
    operator delete(a63);
  a75 = off_24C335D90;
  if (a77 < 0)
    operator delete(a76);
  if (a74 < 0)
    operator delete(a73);
  a80 = off_24C335D90;
  if (SLOBYTE(STACK[0x217]) < 0)
    operator delete((void *)STACK[0x200]);
  if (a79 < 0)
    operator delete(a78);
  if (SLOBYTE(STACK[0x23F]) < 0)
    operator delete((void *)STACK[0x228]);
  _Unwind_Resume(a1);
}

void sub_20A912AC0()
{
  JUMPOUT(0x20A9129D8);
}

void sub_20A912AC8()
{
  JUMPOUT(0x20A9129E8);
}

void sub_20A912AD0()
{
  JUMPOUT(0x20A9129F8);
}

void sub_20A912AD8()
{
  JUMPOUT(0x20A912A14);
}

void sub_20A912AE0()
{
  JUMPOUT(0x20A912A24);
}

void sub_20A912AE8()
{
  JUMPOUT(0x20A912A40);
}

void sub_20A912AF0()
{
  JUMPOUT(0x20A912A50);
}

void sub_20A912AF8()
{
  JUMPOUT(0x20A912A6CLL);
}

void sub_20A912B00()
{
  JUMPOUT(0x20A912A7CLL);
}

void sub_20A912B08()
{
  JUMPOUT(0x20A912A98);
}

void sub_20A912B10()
{
  JUMPOUT(0x20A912AA8);
}

void mlcore::MediaTable<int,long long,long long,int,std::string>::~MediaTable(uint64_t a1)
{
  *(_QWORD *)a1 = off_24C335FE0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 528);
  *(_QWORD *)(a1 + 480) = off_24C335D90;
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  *(_QWORD *)(a1 + 384) = off_24C335D90;
  if (*(char *)(a1 + 415) < 0)
    operator delete(*(void **)(a1 + 392));
  *(_QWORD *)(a1 + 336) = off_24C335D90;
  if (*(char *)(a1 + 367) < 0)
    operator delete(*(void **)(a1 + 344));
  mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable(a1);
}

{
  *(_QWORD *)a1 = off_24C335FE0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 528);
  *(_QWORD *)(a1 + 480) = off_24C335D90;
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  *(_QWORD *)(a1 + 384) = off_24C335D90;
  if (*(char *)(a1 + 415) < 0)
    operator delete(*(void **)(a1 + 392));
  *(_QWORD *)(a1 + 336) = off_24C335D90;
  if (*(char *)(a1 + 367) < 0)
    operator delete(*(void **)(a1 + 344));
  mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable(a1);
}

{
  *(_QWORD *)a1 = off_24C335FE0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 528);
  *(_QWORD *)(a1 + 480) = off_24C335D90;
  if (*(char *)(a1 + 511) < 0)
    operator delete(*(void **)(a1 + 488));
  *(_QWORD *)(a1 + 432) = off_24C335D90;
  if (*(char *)(a1 + 463) < 0)
    operator delete(*(void **)(a1 + 440));
  *(_QWORD *)(a1 + 384) = off_24C335D90;
  if (*(char *)(a1 + 415) < 0)
    operator delete(*(void **)(a1 + 392));
  *(_QWORD *)(a1 + 336) = off_24C335D90;
  if (*(char *)(a1 + 367) < 0)
    operator delete(*(void **)(a1 + 344));
  mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

void mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24C335478;
  *(_QWORD *)(a1 + 288) = off_24C335D90;
  if (*(char *)(a1 + 319) < 0)
    operator delete(*(void **)(a1 + 296));
  *(_QWORD *)(a1 + 240) = off_24C335D90;
  if (*(char *)(a1 + 271) < 0)
    operator delete(*(void **)(a1 + 248));
  *(_QWORD *)(a1 + 192) = off_24C335D90;
  if (*(char *)(a1 + 223) < 0)
    operator delete(*(void **)(a1 + 200));
  *(_QWORD *)(a1 + 144) = off_24C335D90;
  if (*(char *)(a1 + 175) < 0)
    operator delete(*(void **)(a1 + 152));
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn(a1 + 80);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  mediaplatform::DatabaseTableBase::~DatabaseTableBase((void **)a1);
}

{
  mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::columnCount()
{
  return 5;
}

void mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::columnNames(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  mediaplatform::ColumnNamesApplier::operator()<int>((uint64_t)a2, a1 + 288);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 240);
  mediaplatform::ColumnNamesApplier::operator()<long long>((uint64_t)a2, a1 + 192);
  mediaplatform::ColumnNamesApplier::operator()<int>((uint64_t)a2, a1 + 144);
  mediaplatform::ColumnNamesApplier::operator()<std::string>((uint64_t)a2, a1 + 80);
}

void sub_20A912CE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::targetColumnExpression(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  __int128 *v3;
  __int128 *v4[3];
  __int128 **v5;

  v3 = (__int128 *)(a1 + 8);
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)a1 + 24))(v4);
  std::allocate_shared[abi:ne180100]<mediaplatform::SQLColumnNameExpression,std::allocator<mediaplatform::SQLColumnNameExpression>,std::string &,std::string const&,void>(a2, v4[0], v3);
  v5 = v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void sub_20A912D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void mlcore::EntityChangeTable::~EntityChangeTable(mlcore::EntityChangeTable *this)
{
  *(_QWORD *)this = off_24C335FE0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 528);
  *((_QWORD *)this + 60) = off_24C335D90;
  if (*((char *)this + 511) < 0)
    operator delete(*((void **)this + 61));
  *((_QWORD *)this + 54) = off_24C335D90;
  if (*((char *)this + 463) < 0)
    operator delete(*((void **)this + 55));
  *((_QWORD *)this + 48) = off_24C335D90;
  if (*((char *)this + 415) < 0)
    operator delete(*((void **)this + 49));
  *((_QWORD *)this + 42) = off_24C335D90;
  if (*((char *)this + 367) < 0)
    operator delete(*((void **)this + 43));
  mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable((uint64_t)this);
}

{
  *(_QWORD *)this = off_24C335FE0;
  mediaplatform::DatabaseColumn<std::string>::~DatabaseColumn((uint64_t)this + 528);
  *((_QWORD *)this + 60) = off_24C335D90;
  if (*((char *)this + 511) < 0)
    operator delete(*((void **)this + 61));
  *((_QWORD *)this + 54) = off_24C335D90;
  if (*((char *)this + 463) < 0)
    operator delete(*((void **)this + 55));
  *((_QWORD *)this + 48) = off_24C335D90;
  if (*((char *)this + 415) < 0)
    operator delete(*((void **)this + 49));
  *((_QWORD *)this + 42) = off_24C335D90;
  if (*((char *)this + 367) < 0)
    operator delete(*((void **)this + 43));
  mediaplatform::DatabaseTable<int,long long,long long,int,std::string>::~DatabaseTable((uint64_t)this);
  JUMPOUT(0x20BD27AFCLL);
}

void mlcore::EntityChangeTable::classColumn(mlcore::EntityChangeTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 367) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 43), *((_QWORD *)this + 44));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 344);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 45);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 92);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 372);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::EntityChangeTable::persistentIDColumn(mlcore::EntityChangeTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 415) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 49), *((_QWORD *)this + 50));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 392);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 51);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 104);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 107);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 420);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::EntityChangeTable::sourcePersistentIDColumn(mlcore::EntityChangeTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 463) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 55), *((_QWORD *)this + 56));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 440);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 57);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 116);
  *(_DWORD *)(a2 + 44) = *((_DWORD *)this + 119);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 468);
  *(_QWORD *)a2 = off_24C336AC0;
}

void mlcore::EntityChangeTable::changeTypeColumn(mlcore::EntityChangeTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 511) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 61), *((_QWORD *)this + 62));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 488);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 63);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 128);
  *(_QWORD *)(a2 + 36) = *(_QWORD *)((char *)this + 516);
  *(_QWORD *)a2 = off_24C336AA0;
}

void mlcore::EntityChangeTable::changesColumn(mlcore::EntityChangeTable *this@<X0>, uint64_t a2@<X8>)
{
  std::string *v4;
  std::string *v5;

  *(_QWORD *)a2 = off_24C335D90;
  v4 = (std::string *)(a2 + 8);
  if (*((char *)this + 559) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *((const std::string::value_type **)this + 67), *((_QWORD *)this + 68));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 536);
    *(_QWORD *)(a2 + 24) = *((_QWORD *)this + 69);
  }
  *(_DWORD *)(a2 + 32) = *((_DWORD *)this + 140);
  *(_QWORD *)a2 = &off_24C335AB8;
  *(_BYTE *)(a2 + 36) = *((_BYTE *)this + 564);
  v5 = (std::string *)(a2 + 40);
  if (*((char *)this + 591) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)this + 71), *((_QWORD *)this + 72));
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 568);
    *(_QWORD *)(a2 + 56) = *((_QWORD *)this + 73);
  }
  *(_QWORD *)a2 = &off_24C336A60;
}

void sub_20A913284(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  uint64_t v3;

  *(_QWORD *)v1 = v3;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void mlcore::ComplexProperty<int>::~ComplexProperty(void **a1)
{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337A00;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
}

{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337A00;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mlcore::ComplexProperty<int>::description(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
}

void mlcore::ComplexProperty<int>::databaseTables()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database table");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A9133B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mlcore::ComplexProperty<int>::databaseColumn()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database column");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A913400(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double mlcore::ComplexProperty<int>::_SQLExpression@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  std::allocate_shared[abi:ne180100]<mediaplatform::SQLAliasExpression,std::allocator<mediaplatform::SQLAliasExpression>,std::shared_ptr<mediaplatform::SQLExpression> &,std::string const&,void>((std::string **)&v4, *(_QWORD *)(a1 + 64), *(std::__shared_weak_count **)(a1 + 72), (__int128 *)(a1 + 40));
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

_QWORD *mlcore::ComplexProperty<int>::_SQLJoinClauses@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>(a2, *(_QWORD **)(a1 + 80), *(_QWORD **)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 88) - *(_QWORD *)(a1 + 80)) >> 4);
}

void std::allocate_shared[abi:ne180100]<mediaplatform::SQLAliasExpression,std::allocator<mediaplatform::SQLAliasExpression>,std::shared_ptr<mediaplatform::SQLExpression> &,std::string const&,void>(std::string **a1, std::string::size_type a2, std::__shared_weak_count *a3, __int128 *a4)
{
  std::string *v8;
  std::string *v9;
  std::string *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::string::size_type v15[2];

  v8 = (std::string *)operator new(0x48uLL);
  v9 = v8;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24C33BE20;
  v10 = v8 + 1;
  v15[0] = a2;
  v15[1] = (std::string::size_type)a3;
  if (a3)
  {
    p_shared_owners = (unint64_t *)&a3->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  mediaplatform::SQLAliasExpression::SQLAliasExpression(v8 + 1, v15, a4);
  if (a3)
  {
    v13 = (unint64_t *)&a3->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))a3->__on_zero_shared)(a3);
      std::__shared_weak_count::__release_weak(a3);
    }
  }
  *a1 = v10;
  a1[1] = v9;
}

void sub_20A913530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__shared_weak_count *v9;
  void *v11;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v11);
  _Unwind_Resume(a1);
}

void mlcore::ComplexProperty<long long>::~ComplexProperty(void **a1)
{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337A88;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
}

{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337A88;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mlcore::ComplexProperty<long long>::description(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
}

void mlcore::ComplexProperty<long long>::databaseTables()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database table");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A91365C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mlcore::ComplexProperty<long long>::databaseColumn()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database column");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A9136AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double mlcore::ComplexProperty<long long>::_SQLExpression@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  std::allocate_shared[abi:ne180100]<mediaplatform::SQLAliasExpression,std::allocator<mediaplatform::SQLAliasExpression>,std::shared_ptr<mediaplatform::SQLExpression> &,std::string const&,void>((std::string **)&v4, *(_QWORD *)(a1 + 64), *(std::__shared_weak_count **)(a1 + 72), (__int128 *)(a1 + 40));
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

_QWORD *mlcore::ComplexProperty<long long>::_SQLJoinClauses@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>(a2, *(_QWORD **)(a1 + 80), *(_QWORD **)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 88) - *(_QWORD *)(a1 + 80)) >> 4);
}

void mlcore::ComplexProperty<double>::~ComplexProperty(void **a1)
{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337978;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
}

{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337978;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mlcore::ComplexProperty<double>::description(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
}

void mlcore::ComplexProperty<double>::databaseTables()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database table");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A913824(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mlcore::ComplexProperty<double>::databaseColumn()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database column");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A913874(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double mlcore::ComplexProperty<double>::_SQLExpression@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  std::allocate_shared[abi:ne180100]<mediaplatform::SQLAliasExpression,std::allocator<mediaplatform::SQLAliasExpression>,std::shared_ptr<mediaplatform::SQLExpression> &,std::string const&,void>((std::string **)&v4, *(_QWORD *)(a1 + 64), *(std::__shared_weak_count **)(a1 + 72), (__int128 *)(a1 + 40));
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

_QWORD *mlcore::ComplexProperty<double>::_SQLJoinClauses@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>(a2, *(_QWORD **)(a1 + 80), *(_QWORD **)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 88) - *(_QWORD *)(a1 + 80)) >> 4);
}

void mlcore::ComplexProperty<std::string>::~ComplexProperty(void **a1)
{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C3378F0;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
}

{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C3378F0;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mlcore::ComplexProperty<std::string>::description(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
}

void mlcore::ComplexProperty<std::string>::databaseTables()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database table");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A9139EC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mlcore::ComplexProperty<std::string>::databaseColumn()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database column");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A913A3C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double mlcore::ComplexProperty<std::string>::_SQLExpression@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  std::allocate_shared[abi:ne180100]<mediaplatform::SQLAliasExpression,std::allocator<mediaplatform::SQLAliasExpression>,std::shared_ptr<mediaplatform::SQLExpression> &,std::string const&,void>((std::string **)&v4, *(_QWORD *)(a1 + 64), *(std::__shared_weak_count **)(a1 + 72), (__int128 *)(a1 + 40));
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

_QWORD *mlcore::ComplexProperty<std::string>::_SQLJoinClauses@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>(a2, *(_QWORD **)(a1 + 80), *(_QWORD **)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 88) - *(_QWORD *)(a1 + 80)) >> 4);
}

void mlcore::ComplexProperty<mediaplatform::Data>::~ComplexProperty(void **a1)
{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337868;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
}

{
  uint64_t v2;
  void **v3;

  *a1 = &unk_24C337868;
  v2 = (uint64_t)(a1 + 8);
  v3 = a1 + 10;
  std::vector<std::shared_ptr<mediaplatform::SQLExpression const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(a1);
  JUMPOUT(0x20BD27AFCLL);
}

uint64_t mlcore::ComplexProperty<mediaplatform::Data>::description(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
}

void mlcore::ComplexProperty<mediaplatform::Data>::databaseTables()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database table");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A913BB4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void mlcore::ComplexProperty<mediaplatform::Data>::databaseColumn()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "This property has no database column");
  __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
}

void sub_20A913C04(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double mlcore::ComplexProperty<mediaplatform::Data>::_SQLExpression@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  std::allocate_shared[abi:ne180100]<mediaplatform::SQLAliasExpression,std::allocator<mediaplatform::SQLAliasExpression>,std::shared_ptr<mediaplatform::SQLExpression> &,std::string const&,void>((std::string **)&v4, *(_QWORD *)(a1 + 64), *(std::__shared_weak_count **)(a1 + 72), (__int128 *)(a1 + 40));
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

_QWORD *mlcore::ComplexProperty<mediaplatform::Data>::_SQLJoinClauses@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>(a2, *(_QWORD **)(a1 + 80), *(_QWORD **)(a1 + 88), (uint64_t)(*(_QWORD *)(a1 + 88) - *(_QWORD *)(a1 + 80)) >> 4);
}

uint64_t mlcore::ComplexProperty<long long>::ComplexProperty(uint64_t a1, _QWORD *a2, _QWORD **a3)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &unk_24C337A88;
  v4 = a2[1];
  *(_QWORD *)(a1 + 64) = *a2;
  *(_QWORD *)(a1 + 72) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>((_QWORD *)(a1 + 80), *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  return __ZN6mlcore15ComplexPropertyIxEC2ENSt3__110shared_ptrIN13mediaplatform13SQLExpressionEEENS2_6vectorINS3_IKNS4_13SQLJoinClauseEEENS2_9allocatorISA_EEEE(a1, a2, a3);
}

void sub_20A913D04(_Unwind_Exception *a1)
{
  void **v1;
  uint64_t v2;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(v1);
  _Unwind_Resume(a1);
}

uint64_t mlcore::ComplexProperty<double>::ComplexProperty(uint64_t a1, _QWORD *a2, _QWORD **a3)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &unk_24C337978;
  v4 = a2[1];
  *(_QWORD *)(a1 + 64) = *a2;
  *(_QWORD *)(a1 + 72) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>((_QWORD *)(a1 + 80), *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  return __ZN6mlcore15ComplexPropertyIdEC2ENSt3__110shared_ptrIN13mediaplatform13SQLExpressionEEENS2_6vectorINS3_IKNS4_13SQLJoinClauseEEENS2_9allocatorISA_EEEE(a1, a2, a3);
}

void sub_20A913DB4(_Unwind_Exception *a1)
{
  void **v1;
  uint64_t v2;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(v1);
  _Unwind_Resume(a1);
}

uint64_t mlcore::ComplexProperty<std::string>::ComplexProperty(uint64_t a1, _QWORD *a2, _QWORD **a3)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &unk_24C3378F0;
  v4 = a2[1];
  *(_QWORD *)(a1 + 64) = *a2;
  *(_QWORD *)(a1 + 72) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>((_QWORD *)(a1 + 80), *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  return __ZN6mlcore15ComplexPropertyINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEC2ENS1_10shared_ptrIN13mediaplatform13SQLExpressionEEENS1_6vectorINS9_IKNSA_13SQLJoinClauseEEENS5_ISG_EEEE(a1, a2, a3);
}

void sub_20A913E64(_Unwind_Exception *a1)
{
  void **v1;
  uint64_t v2;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(v1);
  _Unwind_Resume(a1);
}

uint64_t mlcore::ComplexProperty<mediaplatform::Data>::ComplexProperty(uint64_t a1, _QWORD *a2, _QWORD **a3)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &unk_24C337868;
  v4 = a2[1];
  *(_QWORD *)(a1 + 64) = *a2;
  *(_QWORD *)(a1 + 72) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  std::vector<std::shared_ptr<mediaplatform::SQLJoinClause const>>::__init_with_size[abi:ne180100]<std::shared_ptr<mediaplatform::SQLJoinClause const>*,std::shared_ptr<mediaplatform::SQLJoinClause const>*>((_QWORD *)(a1 + 80), *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  return __ZN6mlcore15ComplexPropertyIN13mediaplatform4DataEEC2ENSt3__110shared_ptrINS1_13SQLExpressionEEENS4_6vectorINS5_IKNS1_13SQLJoinClauseEEENS4_9allocatorISB_EEEE(a1, a2, a3);
}

void sub_20A913F14(_Unwind_Exception *a1)
{
  void **v1;
  uint64_t v2;

  std::shared_ptr<mlcore::Predicate>::~shared_ptr[abi:ne180100](v2);
  mlcore::ModelPropertyBase::~ModelPropertyBase(v1);
  _Unwind_Resume(a1);
}

mediaplatform::Semaphore *mediaplatform::Semaphore::Semaphore(mediaplatform::Semaphore *this, int a2)
{
  *(_QWORD *)this = dispatch_semaphore_create(a2);
  return this;
}

{
  *(_QWORD *)this = dispatch_semaphore_create(a2);
  return this;
}

void mediaplatform::Semaphore::~Semaphore(dispatch_object_t *this)
{
  dispatch_release(*this);
}

{
  dispatch_release(*this);
}

intptr_t mediaplatform::Semaphore::signal(dispatch_semaphore_t *this)
{
  return dispatch_semaphore_signal(*this);
}

intptr_t mediaplatform::Semaphore::wait(dispatch_semaphore_t *a1, double a2)
{
  dispatch_time_t v3;

  if (a2 == 1.79769313e308)
    v3 = -1;
  else
    v3 = dispatch_time(0, (unint64_t)(a2 * 1000000000.0));
  return dispatch_semaphore_wait(*a1, v3);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x24BDBBA68](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x24BDBBB88](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB98](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x24BDBBBA0](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x24BDBBBD8](calendar, tz);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC770](allocator, ti);
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  CFTimeInterval result;

  MEMORY[0x24BDBC780](tz, at);
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

std::string *__cdecl std::error_condition::message(std::string *__return_ptr retstr, const std::error_condition *this)
{
  return (std::string *)MEMORY[0x24BEDA9E8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB0](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB50](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
  MEMORY[0x24BEDABD8](__ns);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC60](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x24BEDACA8](this, __pos, __n1, __s, __n2);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::wstring *__cdecl std::wstring::append(std::wstring *this, const std::wstring::value_type *__s, std::wstring::size_type __n)
{
  return (std::wstring *)MEMORY[0x24BEDAD20](this, __s, __n);
}

void std::wstring::resize(std::wstring *this, std::wstring::size_type __n, std::wstring::value_type __c)
{
  MEMORY[0x24BEDAD40](this, __n, *(_QWORD *)&__c);
}

void std::wstring::__grow_by(std::wstring *this, std::wstring::size_type __old_cap, std::wstring::size_type __delta_cap, std::wstring::size_type __old_sz, std::wstring::size_type __n_copy, std::wstring::size_type __n_del, std::wstring::size_type __n_add)
{
  MEMORY[0x24BEDAD48](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE98]();
}

{
  return MEMORY[0x24BEDAEC8]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF18]();
}

{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF78]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

void std::error_category::~error_category(std::error_category *this)
{
  MEMORY[0x24BEDB028](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB088](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB090](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x24BEDB0A0](this);
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

std::codecvt<wchar_t, char, mbstate_t> *__cdecl std::codecvt<wchar_t,char,__mbstate_t>::codecvt(std::codecvt<wchar_t, char, mbstate_t> *this, size_t __refs)
{
  return (std::codecvt<wchar_t, char, mbstate_t> *)MEMORY[0x24BEDB4A0](this, __refs);
}

void std::codecvt<wchar_t,char,__mbstate_t>::~codecvt(std::codecvt<wchar_t, char, mbstate_t> *this)
{
  MEMORY[0x24BEDB4A8](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB628](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C32FD58();
}

void operator delete(void *__p)
{
  off_24C32FD60(__p);
}

uint64_t operator delete()
{
  return off_24C32FD68();
}

uint64_t operator new[]()
{
  return off_24C32FD70();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C32FD78(__sz);
}

uint64_t operator new()
{
  return off_24C32FD80();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void __cxa_bad_typeid(void)
{
  MEMORY[0x24BEDB908]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_call_unexpected(void *a1)
{
  MEMORY[0x24BEDB918](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADC68](when, queue, context, work);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAEA70](a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF38](a1);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x24BEDDF20](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x24BEDDF28](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_pagecount(sqlite3_backup *p)
{
  return MEMORY[0x24BEDDF30](p);
}

int sqlite3_backup_remaining(sqlite3_backup *p)
{
  return MEMORY[0x24BEDDF38](p);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x24BEDDF40](p, *(_QWORD *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDFA0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

const void *__cdecl sqlite3_column_text16(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE070](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B0](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module_v2(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData, void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B8](db, zName, p, pClientData, xDestroy);
}

sqlite3 *__cdecl sqlite3_db_handle(sqlite3_stmt *a1)
{
  return (sqlite3 *)MEMORY[0x24BEDE0D8](a1);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE100](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x24BEDE130](a1, *(_QWORD *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x24BEDE138](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void *__cdecl sqlite3_get_auxdata(sqlite3_context *a1, int N)
{
  return (void *)MEMORY[0x24BEDE158](a1, *(_QWORD *)&N);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x24BEDE1B8](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE1E8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x24BEDE1F8](a1, a2);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x24BEDE200](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x24BEDE210](a1, *(_QWORD *)&a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x24BEDE218](a1, a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x24BEDE220](a1);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE238](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_text16(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE240](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_value(sqlite3_context *a1, sqlite3_value *a2)
{
  MEMORY[0x24BEDE250](a1, a2);
}

void sqlite3_set_auxdata(sqlite3_context *a1, int N, void *a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE268](a1, *(_QWORD *)&N, a3, a4);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x24BEDE278](*(_QWORD *)&a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int sqlite3_stmt_busy(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2B0](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE2B8](pStmt);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x24BEDE300](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x24BEDE308](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE310](a1);
}

int sqlite3_value_bytes16(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE318](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x24BEDE320](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE338](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE340](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE358](a1);
}

const void *__cdecl sqlite3_value_text16(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x24BEDE360](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE368](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x24BDB0090](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x24BDB0290](a1, a2);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x24BEDBF60](*(_QWORD *)&code);
}

UBool u_isUUppercase(UChar32 c)
{
  return MEMORY[0x24BEDBF88](*(_QWORD *)&c);
}

UBool u_isalnum(UChar32 c)
{
  return MEMORY[0x24BEDBFA0](*(_QWORD *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x24BEDBFC0](*(_QWORD *)&c);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x24BEDBFE8](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

UChar *__cdecl u_strFromWCS(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const __int32 *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x24BEDBFF0](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x24BEDC000](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

__int32 *__cdecl u_strToWCS(__int32 *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (__int32 *)MEMORY[0x24BEDC010](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

UChar32 u_tolower(UChar32 c)
{
  return MEMORY[0x24BEDC038](*(_QWORD *)&c);
}

uint64_t ubrk_close()
{
  return MEMORY[0x24BEDC070]();
}

uint64_t ubrk_getRuleStatus()
{
  return MEMORY[0x24BEDC088]();
}

uint64_t ubrk_isBoundary()
{
  return MEMORY[0x24BEDC090]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x24BEDC0A0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x24BEDC0A8]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x24BEDC0C0]();
}

uint64_t ucol_close()
{
  return MEMORY[0x24BEDC0D8]();
}

uint64_t ucol_getAttribute()
{
  return MEMORY[0x24BEDC0E0]();
}

uint64_t ucol_getSortKey()
{
  return MEMORY[0x24BEDC0E8]();
}

uint64_t ucol_getStrength()
{
  return MEMORY[0x24BEDC0F0]();
}

uint64_t ucol_getVersion()
{
  return MEMORY[0x24BEDC0F8]();
}

uint64_t ucol_nextSortKeyPart()
{
  return MEMORY[0x24BEDC100]();
}

uint64_t ucol_open()
{
  return MEMORY[0x24BEDC108]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x24BEDC110]();
}

uint64_t ucol_setStrength()
{
  return MEMORY[0x24BEDC118]();
}

void uiter_setString(UCharIterator *iter, const UChar *s, int32_t length)
{
  MEMORY[0x24BEDC170](iter, s, *(_QWORD *)&length);
}

uint64_t uloc_setKeywordValue()
{
  return MEMORY[0x24BEDC188]();
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

uint64_t usearch_close()
{
  return MEMORY[0x24BEDC280]();
}

uint64_t usearch_first()
{
  return MEMORY[0x24BEDC288]();
}

uint64_t usearch_getMatchedLength()
{
  return MEMORY[0x24BEDC290]();
}

uint64_t usearch_last()
{
  return MEMORY[0x24BEDC298]();
}

uint64_t usearch_next()
{
  return MEMORY[0x24BEDC2A0]();
}

uint64_t usearch_openFromCollator()
{
  return MEMORY[0x24BEDC2A8]();
}

uint64_t usearch_reset()
{
  return MEMORY[0x24BEDC2B0]();
}

uint64_t usearch_setPattern()
{
  return MEMORY[0x24BEDC2B8]();
}

uint64_t usearch_setText()
{
  return MEMORY[0x24BEDC2C0]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x24BEDC328](ut);
}

UBool utext_moveIndex32(UText *ut, int32_t delta)
{
  return MEMORY[0x24BEDC330](ut, *(_QWORD *)&delta);
}

UChar32 utext_next32(UText *ut)
{
  return MEMORY[0x24BEDC338](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x24BEDC340](ut, s, length, status);
}

void utext_setNativeIndex(UText *ut, int64_t nativeIndex)
{
  MEMORY[0x24BEDC348](ut, nativeIndex);
}

uint64_t utrans_close()
{
  return MEMORY[0x24BEDC358]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x24BEDC360]();
}

uint64_t utrans_transUChars()
{
  return MEMORY[0x24BEDC368]();
}

