@implementation CVAVideoPipelineProperties_Impl

- (id)initForVideoPipelineDevice:(unint64_t)a3
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD **i;
  _QWORD **v8;
  _QWORD *v9;
  _QWORD **v10;
  BOOL v11;
  unint64_t v12;
  _QWORD **v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _BYTE *v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSArray *v56;
  CVAVideoPipelineProperties_Impl *v57;
  NSObject *v58;
  const char *v59;
  uint32_t v60;
  NSArray *supportedColorPixelBufferPixelFormats;
  void *v62;
  float v63;
  void *v64;
  float v65;
  void *v66;
  float v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  float v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSArray *supportedInputSegmentationPixelBufferPixelFormats;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  float v88;
  void *v89;
  float v90;
  void *v91;
  float v92;
  void *v93;
  float v94;
  void *v95;
  void *v96;
  void *v97;
  float v98;
  void *v99;
  float v100;
  void *v101;
  float v102;
  void *v103;
  float v104;
  void *v105;
  void *v106;
  void *v107;
  float v108;
  void *v109;
  float v110;
  void *v111;
  float v112;
  void *v113;
  float v114;
  void *v115;
  float v116;
  void *v117;
  float v118;
  void *v119;
  float v120;
  void *v121;
  float v122;
  void *v123;
  float v124;
  void *v125;
  float v126;
  void *v127;
  float v128;
  void *v129;
  float v130;
  void *v131;
  float v132;
  void *v133;
  float v134;
  void *v135;
  float v136;
  void *v137;
  float v138;
  void *v139;
  float v140;
  void *v141;
  float v142;
  void *v143;
  float v144;
  void *v145;
  float v146;
  void *v147;
  float v148;
  void *v149;
  float v150;
  void *v151;
  float v152;
  void *v153;
  float v154;
  void *v155;
  float v156;
  void *v157;
  float v158;
  void *v159;
  float v160;
  void *v161;
  float v162;
  void *v163;
  float v164;
  void *v165;
  float v166;
  void *v167;
  float v168;
  void *v169;
  float v170;
  void *v171;
  float v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  float v177;
  void *v178;
  float v179;
  void *v180;
  float v181;
  void *v182;
  float v183;
  void *v184;
  float v185;
  void *v186;
  float v187;
  void *v188;
  float v189;
  void *v190;
  float v191;
  void *v192;
  float v193;
  void *v194;
  float v195;
  void *v196;
  void *v197;
  float v198;
  void *v199;
  float v200;
  void *v201;
  double v202;
  void *v203;
  float v204;
  void *v205;
  double v206;
  void *v207;
  float v208;
  void *v209;
  float v210;
  void *v211;
  float v212;
  void *v213;
  float v214;
  void *v215;
  float v216;
  void *v217;
  float v218;
  void *v219;
  float v220;
  void *v221;
  void *v222;
  float v223;
  void *v224;
  float v225;
  void *v226;
  float v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  CVAVideoPipelineProperties_Impl *v302;
  _QWORD v303[3];
  id v304;
  objc_super v305;
  id v306;
  _QWORD *v307;
  _QWORD *v308;
  uint64_t v309;
  unint64_t v310;
  _QWORD v311[3];
  _QWORD v312[3];
  _QWORD v313[3];
  _QWORD v314[3];
  void *v315;
  void *v316;
  _QWORD v317[3];
  _QWORD v318[3];
  _QWORD v319[3];
  _QWORD v320[3];
  _QWORD v321[19];
  _QWORD v322[19];
  _QWORD v323[19];
  _QWORD v324[19];
  _QWORD v325[19];
  _QWORD v326[19];
  _QWORD v327[19];
  _QWORD v328[19];
  _QWORD v329[19];
  _QWORD v330[19];
  _QWORD v331[20];
  _QWORD v332[20];
  _QWORD v333[32];
  _QWORD v334[32];
  _QWORD v335[23];
  _QWORD v336[23];
  _QWORD v337[43];
  _QWORD v338[43];
  _QWORD v339[2];
  _QWORD v340[2];
  _QWORD v341[2];
  _QWORD v342[2];
  _QWORD v343[2];
  _QWORD v344[2];
  _QWORD v345[2];
  _QWORD v346[2];
  void *v347;
  void *v348;
  _QWORD v349[19];
  _QWORD v350[19];
  _QWORD v351[5];
  _QWORD v352[5];
  _QWORD v353[5];
  _QWORD v354[5];
  void *v355;
  void *v356;
  _QWORD v357[15];
  _QWORD v358[15];
  _QWORD v359[19];
  _QWORD v360[19];
  _QWORD v361[20];
  _QWORD v362[20];
  _QWORD v363[20];
  _QWORD v364[20];
  _QWORD v365[23];
  _QWORD v366[23];
  _QWORD v367[19];
  _QWORD v368[19];
  _QWORD v369[2];
  _QWORD v370[2];
  _QWORD v371[21];
  _QWORD v372[21];
  _QWORD v373[21];
  _QWORD v374[21];
  _QWORD v375[40];
  _QWORD v376[40];
  _QWORD v377[40];
  _QWORD v378[40];
  _QWORD v379[40];
  _QWORD v380[40];
  _QWORD v381[2];
  _QWORD v382[2];
  _QWORD v383[24];
  _QWORD v384[24];
  _QWORD v385[24];
  _QWORD v386[24];
  _QWORD v387[2];
  _QWORD v388[2];
  _QWORD v389[2];
  _QWORD v390[2];
  _QWORD v391[2];
  _QWORD v392[2];
  _QWORD v393[27];
  _QWORD v394[27];
  _QWORD v395[8];
  _QWORD v396[8];
  _QWORD v397[7];
  _QWORD v398[7];
  _QWORD v399[7];
  _QWORD v400[7];
  _QWORD v401[47];
  _QWORD v402[47];
  _QWORD v403[47];
  _QWORD v404[47];
  _QWORD v405[29];
  _QWORD v406[29];
  _QWORD v407[29];
  _QWORD v408[29];
  void *v409;
  void *v410;
  _QWORD v411[2];
  _QWORD v412[2];
  _QWORD v413[2];
  _QWORD v414[2];
  _QWORD v415[26];
  _QWORD v416[26];
  _QWORD v417[29];
  _QWORD v418[29];
  _QWORD v419[29];
  _QWORD v420[29];
  _QWORD v421[106];
  uint64_t v422;
  uint64_t v423;
  void *v424;
  void *v425;
  void *v426;
  uint64_t v427;
  uint64_t v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  uint64_t v444;
  void *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  void *v450;
  void *v451;
  uint64_t v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  uint64_t v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  uint64_t v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  uint64_t v522;
  void *v523;
  void *v524;
  void *v525;
  void *v526;
  void *v527;
  uint8_t buf[4];
  const __CFString *v529;
  uint64_t v530;

  v301 = (void *)MEMORY[0x1E0C80A78](self, a2, a3);
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v530 = *MEMORY[0x1E0C80C00];
  v310 = v6;
  v309 = 0;
  v308 = 0;
  v307 = &v308;
  for (i = &v308; ; i = (_QWORD **)v307)
  {
    v8 = &v308;
    if (i == &v308)
      goto LABEL_8;
    v9 = v4;
    v10 = &v308;
    if (v4)
    {
      do
      {
        v8 = (_QWORD **)v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      do
      {
        v8 = (_QWORD **)v10[2];
        v11 = *v8 == v10;
        v10 = v8;
      }
      while (v11);
    }
    v12 = qword_1B56AC748[v5];
    if ((unint64_t)v8[4] < v12)
    {
LABEL_8:
      v13 = v4 ? v8 : &v308;
      v14 = v4 ? v8 + 1 : &v308;
    }
    else
    {
      v13 = &v308;
      v14 = &v308;
      if (v4)
      {
        v14 = &v308;
        while (1)
        {
          while (1)
          {
            v13 = (_QWORD **)v4;
            v26 = v4[4];
            if (v12 >= v26)
              break;
            v4 = *v13;
            v14 = v13;
            if (!*v13)
              goto LABEL_15;
          }
          if (v26 >= v12)
            break;
          v14 = v13 + 1;
          v4 = v13[1];
          if (!v4)
            goto LABEL_15;
        }
      }
    }
    if (!*v14)
    {
LABEL_15:
      v15 = operator new(0x28uLL);
      v15[4] = qword_1B56AC748[v5];
      *v15 = 0;
      v15[1] = 0;
      v15[2] = v13;
      *v14 = v15;
      if (*v307)
      {
        v307 = (_QWORD *)*v307;
        v15 = (_QWORD *)*v14;
      }
      v16 = v308;
      v11 = v15 == v308;
      *((_BYTE *)v15 + 24) = v15 == v308;
      if (!v11)
      {
        do
        {
          v17 = v15[2];
          if (*(_BYTE *)(v17 + 24))
            break;
          v18 = *(_QWORD **)(v17 + 16);
          v19 = *v18;
          if (*v18 == v17)
          {
            v22 = v18[1];
            if (!v22 || (v23 = *(unsigned __int8 *)(v22 + 24), v20 = (_BYTE *)(v22 + 24), v23))
            {
              if (*(_QWORD **)v17 == v15)
              {
                v24 = (uint64_t *)v15[2];
              }
              else
              {
                v24 = *(uint64_t **)(v17 + 8);
                v25 = *v24;
                *(_QWORD *)(v17 + 8) = *v24;
                if (v25)
                {
                  *(_QWORD *)(v25 + 16) = v17;
                  v18 = *(_QWORD **)(v17 + 16);
                }
                v24[2] = (uint64_t)v18;
                *(_QWORD *)(*(_QWORD *)(v17 + 16) + 8 * (**(_QWORD **)(v17 + 16) != v17)) = v24;
                *v24 = v17;
                *(_QWORD *)(v17 + 16) = v24;
                v18 = (_QWORD *)v24[2];
                v17 = *v18;
              }
              *((_BYTE *)v24 + 24) = 1;
              *((_BYTE *)v18 + 24) = 0;
              v29 = *(_QWORD *)(v17 + 8);
              *v18 = v29;
              if (v29)
                *(_QWORD *)(v29 + 16) = v18;
              *(_QWORD *)(v17 + 16) = v18[2];
              *(_QWORD *)(v18[2] + 8 * (*(_QWORD *)v18[2] != (_QWORD)v18)) = v17;
              *(_QWORD *)(v17 + 8) = v18;
              goto LABEL_51;
            }
          }
          else if (!v19 || (v21 = *(unsigned __int8 *)(v19 + 24), v20 = (_BYTE *)(v19 + 24), v21))
          {
            if (*(_QWORD **)v17 == v15)
            {
              v27 = v15[1];
              *(_QWORD *)v17 = v27;
              if (v27)
              {
                *(_QWORD *)(v27 + 16) = v17;
                v18 = *(_QWORD **)(v17 + 16);
              }
              v15[2] = v18;
              *(_QWORD *)(*(_QWORD *)(v17 + 16) + 8 * (**(_QWORD **)(v17 + 16) != v17)) = v15;
              v15[1] = v17;
              *(_QWORD *)(v17 + 16) = v15;
              v18 = (_QWORD *)v15[2];
            }
            else
            {
              v15 = (_QWORD *)v15[2];
            }
            *((_BYTE *)v15 + 24) = 1;
            *((_BYTE *)v18 + 24) = 0;
            v17 = v18[1];
            v28 = *(_QWORD **)v17;
            v18[1] = *(_QWORD *)v17;
            if (v28)
              v28[2] = v18;
            *(_QWORD *)(v17 + 16) = v18[2];
            *(_QWORD *)(v18[2] + 8 * (*(_QWORD *)v18[2] != (_QWORD)v18)) = v17;
            *(_QWORD *)v17 = v18;
LABEL_51:
            v18[2] = v17;
            break;
          }
          *(_BYTE *)(v17 + 24) = 1;
          v15 = v18;
          *((_BYTE *)v18 + 24) = v18 == v16;
          *v20 = 1;
        }
        while (v18 != v16);
      }
      v309 = ++v3;
    }
    if (++v5 == 59)
      break;
    v4 = v308;
  }
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v306 = (id)objc_claimAutoreleasedReturnValue();
  v305.receiver = v301;
  v305.super_class = (Class)CVAVideoPipelineProperties_Impl;
  v302 = -[CVAVideoPipelineProperties_Impl init](&v305, sel_init);
  v421[0] = CFSTR("colorPixelBufferWidth");
  v419[0] = &unk_1E6949478;
  v419[1] = &unk_1E69494A8;
  v420[0] = &unk_1E6949490;
  v420[1] = &unk_1E69494C0;
  v419[2] = &unk_1E69494D8;
  v419[3] = &unk_1E6949508;
  v420[2] = &unk_1E69494F0;
  v420[3] = &unk_1E69494F0;
  v419[4] = &unk_1E6949520;
  v419[5] = &unk_1E6949550;
  v420[4] = &unk_1E6949538;
  v420[5] = &unk_1E6949568;
  v419[6] = &unk_1E6949580;
  v419[7] = &unk_1E69495B0;
  v420[6] = &unk_1E6949598;
  v420[7] = &unk_1E69494F0;
  v419[8] = &unk_1E69495C8;
  v419[9] = &unk_1E69495E0;
  v420[8] = &unk_1E6949598;
  v420[9] = &unk_1E69494F0;
  v419[10] = &unk_1E69495F8;
  v419[11] = &unk_1E6949610;
  v420[10] = &unk_1E69494F0;
  v420[11] = &unk_1E69494F0;
  v419[12] = &unk_1E6949628;
  v419[13] = &unk_1E6949640;
  v420[12] = &unk_1E69494F0;
  v420[13] = &unk_1E69494F0;
  v419[14] = &unk_1E6949658;
  v419[15] = &unk_1E6949670;
  v420[14] = &unk_1E6949598;
  v420[15] = &unk_1E69494F0;
  v419[16] = &unk_1E6949688;
  v419[17] = &unk_1E69496A0;
  v420[16] = &unk_1E69494F0;
  v420[17] = &unk_1E69494F0;
  v419[18] = &unk_1E69496B8;
  v419[19] = &unk_1E69496D0;
  v420[18] = &unk_1E69494F0;
  v420[19] = &unk_1E69494F0;
  v419[20] = &unk_1E69496E8;
  v419[21] = &unk_1E6949700;
  v420[20] = &unk_1E69494F0;
  v420[21] = &unk_1E69494F0;
  v419[22] = &unk_1E6949718;
  v419[23] = &unk_1E6949730;
  v420[22] = &unk_1E6949598;
  v420[23] = &unk_1E69494F0;
  v419[24] = &unk_1E6949748;
  v419[25] = &unk_1E6949760;
  v420[24] = &unk_1E69494F0;
  v420[25] = &unk_1E69494F0;
  v419[26] = &unk_1E6949778;
  v419[27] = &unk_1E6949790;
  v420[26] = &unk_1E69494F0;
  v420[27] = &unk_1E69494F0;
  v419[28] = &unk_1E69497A8;
  v420[28] = &unk_1E69494F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v420, v419, 29);
  v422 = objc_claimAutoreleasedReturnValue();
  v421[1] = CFSTR("colorPixelBufferHeight");
  v417[0] = &unk_1E6949478;
  v417[1] = &unk_1E69494A8;
  v418[0] = &unk_1E69497C0;
  v418[1] = &unk_1E69497D8;
  v417[2] = &unk_1E69494D8;
  v417[3] = &unk_1E6949508;
  v418[2] = &unk_1E69497F0;
  v418[3] = &unk_1E69497F0;
  v417[4] = &unk_1E6949520;
  v417[5] = &unk_1E6949550;
  v418[4] = &unk_1E6949808;
  v418[5] = &unk_1E6949808;
  v417[6] = &unk_1E6949580;
  v417[7] = &unk_1E69495B0;
  v418[6] = &unk_1E6949820;
  v418[7] = &unk_1E69497F0;
  v417[8] = &unk_1E69495C8;
  v417[9] = &unk_1E69495E0;
  v418[8] = &unk_1E6949820;
  v418[9] = &unk_1E69497F0;
  v417[10] = &unk_1E69495F8;
  v417[11] = &unk_1E6949610;
  v418[10] = &unk_1E69497F0;
  v418[11] = &unk_1E69497F0;
  v417[12] = &unk_1E6949628;
  v417[13] = &unk_1E6949640;
  v418[12] = &unk_1E69497F0;
  v418[13] = &unk_1E69497F0;
  v417[14] = &unk_1E6949658;
  v417[15] = &unk_1E6949670;
  v418[14] = &unk_1E6949838;
  v418[15] = &unk_1E69497F0;
  v417[16] = &unk_1E6949688;
  v417[17] = &unk_1E69496A0;
  v418[16] = &unk_1E69497F0;
  v418[17] = &unk_1E69497F0;
  v417[18] = &unk_1E69496B8;
  v417[19] = &unk_1E69496D0;
  v418[18] = &unk_1E69497F0;
  v418[19] = &unk_1E69497F0;
  v417[20] = &unk_1E69496E8;
  v417[21] = &unk_1E6949700;
  v418[20] = &unk_1E69497F0;
  v418[21] = &unk_1E69497F0;
  v417[22] = &unk_1E6949718;
  v417[23] = &unk_1E6949730;
  v418[22] = &unk_1E6949838;
  v418[23] = &unk_1E69497F0;
  v417[24] = &unk_1E6949748;
  v417[25] = &unk_1E6949760;
  v418[24] = &unk_1E69497F0;
  v418[25] = &unk_1E69497F0;
  v417[26] = &unk_1E6949778;
  v417[27] = &unk_1E6949790;
  v418[26] = &unk_1E69497F0;
  v418[27] = &unk_1E69497F0;
  v417[28] = &unk_1E69497A8;
  v418[28] = &unk_1E69497F0;
  v296 = (void *)v422;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v418, v417, 29);
  v423 = objc_claimAutoreleasedReturnValue();
  v421[2] = CFSTR("supportedColorPixelBufferPixelFormats");
  v415[0] = &unk_1E6949478;
  v415[1] = &unk_1E69495B0;
  v416[0] = &unk_1E69492C8;
  v416[1] = &unk_1E69492E0;
  v415[2] = &unk_1E6949580;
  v415[3] = &unk_1E69495C8;
  v416[2] = &unk_1E69492F8;
  v416[3] = &unk_1E6949310;
  v415[4] = &unk_1E69495E0;
  v415[5] = &unk_1E69495F8;
  v416[4] = &unk_1E6949328;
  v416[5] = &unk_1E6949340;
  v415[6] = &unk_1E6949610;
  v415[7] = &unk_1E6949628;
  v416[6] = &unk_1E6949358;
  v416[7] = &unk_1E6949370;
  v415[8] = &unk_1E6949640;
  v415[9] = &unk_1E6949658;
  v416[8] = &unk_1E6949388;
  v416[9] = &unk_1E69493A0;
  v415[10] = &unk_1E6949670;
  v415[11] = &unk_1E6949688;
  v416[10] = &unk_1E69493B8;
  v416[11] = &unk_1E69493D0;
  v415[12] = &unk_1E69496A0;
  v295 = (void *)v423;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v416[12] = v294;
  v415[13] = &unk_1E69496B8;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v416[13] = v260;
  v415[14] = &unk_1E69496D0;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v416[14] = v259;
  v415[15] = &unk_1E69496E8;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v416[15] = v293;
  v415[16] = &unk_1E6949700;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v416[16] = v292;
  v415[17] = &unk_1E6949718;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v416[17] = v291;
  v415[18] = &unk_1E6949730;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v416[18] = v258;
  v415[19] = &unk_1E6949748;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v416[19] = v257;
  v415[20] = &unk_1E6949760;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v416[20] = v290;
  v415[21] = &unk_1E6949778;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v416[21] = v289;
  v415[22] = &unk_1E6949790;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v416[22] = v288;
  v415[23] = &unk_1E69497A8;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v416[23] = v256;
  v415[24] = &unk_1E6949850;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v416[24] = v255;
  v415[25] = &unk_1E6949868;
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v416[25] = v287;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v416, v415, 26);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v424 = v286;
  v421[3] = CFSTR("colorPixelBufferFocalLength_mm");
  v413[0] = &unk_1E6949478;
  v413[1] = &unk_1E6949880;
  v414[0] = &unk_1E6949F40;
  v414[1] = &unk_1E6949F50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v414, v413, 2);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v425 = v285;
  v421[4] = CFSTR("colorPixelBufferPixelSize_um");
  v411[0] = &unk_1E6949478;
  v411[1] = &unk_1E6949880;
  v412[0] = &unk_1E6949F60;
  v412[1] = &unk_1E6949F70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v412, v411, 2);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v426 = v254;
  v421[5] = CFSTR("colorPixelBufferFocalRatio");
  v409 = &unk_1E6949478;
  v410 = &unk_1E6949F80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v410, &v409, 1);
  v30 = objc_claimAutoreleasedReturnValue();
  v421[6] = CFSTR("alphaMattePixelBufferWidth");
  v408[0] = &unk_1E6949490;
  v408[1] = &unk_1E69494C0;
  v408[4] = &unk_1E6949538;
  v408[5] = &unk_1E6949568;
  v408[6] = &unk_1E6949598;
  v408[8] = &unk_1E6949598;
  v408[14] = &unk_1E6949598;
  v408[22] = &unk_1E6949598;
  v253 = (void *)v30;
  v427 = v30;
  v407[0] = &unk_1E6949478;
  v407[1] = &unk_1E69494A8;
  v407[2] = &unk_1E69494D8;
  v407[3] = &unk_1E6949508;
  v408[2] = &unk_1E69494F0;
  v408[3] = &unk_1E69494F0;
  v407[4] = &unk_1E6949520;
  v407[5] = &unk_1E6949550;
  v407[6] = &unk_1E6949580;
  v407[7] = &unk_1E69495B0;
  v408[7] = &unk_1E69494F0;
  v407[8] = &unk_1E69495C8;
  v407[9] = &unk_1E69495E0;
  v408[9] = &unk_1E69494F0;
  v407[10] = &unk_1E69495F8;
  v407[11] = &unk_1E6949610;
  v408[10] = &unk_1E69494F0;
  v408[11] = &unk_1E69494F0;
  v407[12] = &unk_1E6949628;
  v407[13] = &unk_1E6949640;
  v408[12] = &unk_1E69494F0;
  v408[13] = &unk_1E69494F0;
  v407[14] = &unk_1E6949658;
  v407[15] = &unk_1E6949670;
  v408[15] = &unk_1E69494F0;
  v407[16] = &unk_1E6949688;
  v407[17] = &unk_1E69496A0;
  v408[16] = &unk_1E69494F0;
  v408[17] = &unk_1E69494F0;
  v407[18] = &unk_1E69496B8;
  v407[19] = &unk_1E69496D0;
  v408[18] = &unk_1E69494F0;
  v408[19] = &unk_1E69494F0;
  v407[20] = &unk_1E69496E8;
  v407[21] = &unk_1E6949700;
  v408[20] = &unk_1E69494F0;
  v408[21] = &unk_1E69494F0;
  v407[22] = &unk_1E6949718;
  v407[23] = &unk_1E6949730;
  v408[23] = &unk_1E69494F0;
  v407[24] = &unk_1E6949748;
  v407[25] = &unk_1E6949760;
  v408[24] = &unk_1E69494F0;
  v408[25] = &unk_1E69494F0;
  v407[26] = &unk_1E6949778;
  v407[27] = &unk_1E6949790;
  v408[26] = &unk_1E69494F0;
  v408[27] = &unk_1E69494F0;
  v407[28] = &unk_1E69497A8;
  v408[28] = &unk_1E69494F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v408, v407, 29);
  v31 = objc_claimAutoreleasedReturnValue();
  v421[7] = CFSTR("alphaMattePixelBufferHeight");
  v406[0] = &unk_1E69497C0;
  v406[1] = &unk_1E69497D8;
  v406[4] = &unk_1E6949808;
  v406[5] = &unk_1E6949808;
  v406[6] = &unk_1E6949820;
  v406[8] = &unk_1E6949820;
  v406[14] = &unk_1E6949838;
  v406[22] = &unk_1E6949838;
  v284 = (void *)v31;
  v428 = v31;
  v405[0] = &unk_1E6949478;
  v405[1] = &unk_1E69494A8;
  v405[2] = &unk_1E69494D8;
  v405[3] = &unk_1E6949508;
  v406[2] = &unk_1E69497F0;
  v406[3] = &unk_1E69497F0;
  v405[4] = &unk_1E6949520;
  v405[5] = &unk_1E6949550;
  v405[6] = &unk_1E6949580;
  v405[7] = &unk_1E69495B0;
  v406[7] = &unk_1E69497F0;
  v405[8] = &unk_1E69495C8;
  v405[9] = &unk_1E69495E0;
  v406[9] = &unk_1E69497F0;
  v405[10] = &unk_1E69495F8;
  v405[11] = &unk_1E6949610;
  v406[10] = &unk_1E69497F0;
  v406[11] = &unk_1E69497F0;
  v405[12] = &unk_1E6949628;
  v405[13] = &unk_1E6949640;
  v406[12] = &unk_1E69497F0;
  v406[13] = &unk_1E69497F0;
  v405[14] = &unk_1E6949658;
  v405[15] = &unk_1E6949670;
  v406[15] = &unk_1E69497F0;
  v405[16] = &unk_1E6949688;
  v405[17] = &unk_1E69496A0;
  v406[16] = &unk_1E69497F0;
  v406[17] = &unk_1E69497F0;
  v405[18] = &unk_1E69496B8;
  v405[19] = &unk_1E69496D0;
  v406[18] = &unk_1E69497F0;
  v406[19] = &unk_1E69497F0;
  v405[20] = &unk_1E69496E8;
  v405[21] = &unk_1E6949700;
  v406[20] = &unk_1E69497F0;
  v406[21] = &unk_1E69497F0;
  v405[22] = &unk_1E6949718;
  v405[23] = &unk_1E6949730;
  v406[23] = &unk_1E69497F0;
  v405[24] = &unk_1E6949748;
  v405[25] = &unk_1E6949760;
  v406[24] = &unk_1E69497F0;
  v406[25] = &unk_1E69497F0;
  v405[26] = &unk_1E6949778;
  v405[27] = &unk_1E6949790;
  v406[26] = &unk_1E69497F0;
  v406[27] = &unk_1E69497F0;
  v405[28] = &unk_1E69497A8;
  v406[28] = &unk_1E69497F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v406, v405, 29);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v429 = v300;
  v430 = &unk_1E6949898;
  v421[8] = CFSTR("alphaMattePixelBufferPixelFormat");
  v421[9] = CFSTR("inputDisparityPixelBufferWidth");
  v403[0] = &unk_1E6949478;
  v403[1] = &unk_1E69498C8;
  v404[0] = &unk_1E69498B0;
  v404[1] = &unk_1E69498E0;
  v403[2] = &unk_1E69498F8;
  v403[3] = &unk_1E6949910;
  v404[2] = &unk_1E69498E0;
  v404[3] = &unk_1E6949928;
  v403[4] = &unk_1E69494A8;
  v403[5] = &unk_1E69494D8;
  v404[4] = &unk_1E6949940;
  v404[5] = &unk_1E6949928;
  v403[6] = &unk_1E6949508;
  v403[7] = &unk_1E6949520;
  v404[6] = &unk_1E6949940;
  v404[7] = &unk_1E6949928;
  v403[8] = &unk_1E6949550;
  v403[9] = &unk_1E6949958;
  v404[8] = &unk_1E6949940;
  v404[9] = &unk_1E6949928;
  v403[10] = &unk_1E6949970;
  v403[11] = &unk_1E6949988;
  v404[10] = &unk_1E6949940;
  v404[11] = &unk_1E6949940;
  v403[12] = &unk_1E69499A0;
  v403[13] = &unk_1E69499B8;
  v404[12] = &unk_1E6949928;
  v404[13] = &unk_1E6949940;
  v403[14] = &unk_1E69499D0;
  v403[15] = &unk_1E69499E8;
  v404[14] = &unk_1E6949940;
  v404[15] = &unk_1E6949928;
  v403[16] = &unk_1E6949A00;
  v403[17] = &unk_1E6949A30;
  v404[16] = &unk_1E6949A18;
  v404[17] = &unk_1E6949928;
  v403[18] = &unk_1E6949A48;
  v403[19] = &unk_1E6949A60;
  v404[18] = &unk_1E6949928;
  v404[19] = &unk_1E6949940;
  v403[20] = &unk_1E6949A78;
  v403[21] = &unk_1E6949A90;
  v404[20] = &unk_1E6949928;
  v404[21] = &unk_1E6949A18;
  v403[22] = &unk_1E6949AA8;
  v403[23] = &unk_1E6949AD8;
  v404[22] = &unk_1E6949AC0;
  v404[23] = &unk_1E6949AC0;
  v403[24] = &unk_1E6949580;
  v403[25] = &unk_1E69495B0;
  v404[24] = &unk_1E6949928;
  v404[25] = &unk_1E6949940;
  v403[26] = &unk_1E69495C8;
  v403[27] = &unk_1E69495E0;
  v404[26] = &unk_1E6949928;
  v404[27] = &unk_1E6949940;
  v403[28] = &unk_1E69495F8;
  v403[29] = &unk_1E6949610;
  v404[28] = &unk_1E6949940;
  v404[29] = &unk_1E6949940;
  v403[30] = &unk_1E6949628;
  v403[31] = &unk_1E6949640;
  v404[30] = &unk_1E6949940;
  v404[31] = &unk_1E6949940;
  v403[32] = &unk_1E6949658;
  v403[33] = &unk_1E6949670;
  v404[32] = &unk_1E6949928;
  v404[33] = &unk_1E6949940;
  v403[34] = &unk_1E6949688;
  v403[35] = &unk_1E69496A0;
  v404[34] = &unk_1E6949940;
  v404[35] = &unk_1E6949928;
  v403[36] = &unk_1E69496B8;
  v403[37] = &unk_1E69496D0;
  v404[36] = &unk_1E6949940;
  v404[37] = &unk_1E6949940;
  v403[38] = &unk_1E69496E8;
  v403[39] = &unk_1E6949700;
  v404[38] = &unk_1E6949940;
  v404[39] = &unk_1E6949940;
  v403[40] = &unk_1E6949718;
  v403[41] = &unk_1E6949730;
  v404[40] = &unk_1E6949928;
  v404[41] = &unk_1E6949940;
  v403[42] = &unk_1E6949748;
  v403[43] = &unk_1E6949760;
  v404[42] = &unk_1E6949940;
  v404[43] = &unk_1E6949940;
  v403[44] = &unk_1E6949778;
  v403[45] = &unk_1E6949790;
  v404[44] = &unk_1E6949940;
  v404[45] = &unk_1E6949940;
  v403[46] = &unk_1E69497A8;
  v404[46] = &unk_1E69498E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v404, v403, 47);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v431 = v283;
  v421[10] = CFSTR("inputDisparityPixelBufferHeight");
  v401[0] = &unk_1E6949478;
  v401[1] = &unk_1E69498C8;
  v402[0] = &unk_1E69498B0;
  v402[1] = &unk_1E6949940;
  v401[2] = &unk_1E69498F8;
  v401[3] = &unk_1E6949910;
  v402[2] = &unk_1E6949940;
  v402[3] = &unk_1E6949A18;
  v401[4] = &unk_1E69494A8;
  v401[5] = &unk_1E69494D8;
  v402[4] = &unk_1E69498E0;
  v402[5] = &unk_1E6949A18;
  v401[6] = &unk_1E6949508;
  v401[7] = &unk_1E6949520;
  v402[6] = &unk_1E69498E0;
  v402[7] = &unk_1E6949A18;
  v401[8] = &unk_1E6949550;
  v401[9] = &unk_1E6949958;
  v402[8] = &unk_1E69498E0;
  v402[9] = &unk_1E6949A18;
  v401[10] = &unk_1E6949970;
  v401[11] = &unk_1E6949988;
  v402[10] = &unk_1E69498E0;
  v402[11] = &unk_1E69498E0;
  v401[12] = &unk_1E69499A0;
  v401[13] = &unk_1E69499B8;
  v402[12] = &unk_1E6949A18;
  v402[13] = &unk_1E69498E0;
  v401[14] = &unk_1E69499D0;
  v401[15] = &unk_1E69499E8;
  v402[14] = &unk_1E69498E0;
  v402[15] = &unk_1E6949A18;
  v401[16] = &unk_1E6949A00;
  v401[17] = &unk_1E6949A30;
  v402[16] = &unk_1E6949928;
  v402[17] = &unk_1E6949A18;
  v401[18] = &unk_1E6949A48;
  v401[19] = &unk_1E6949A60;
  v402[18] = &unk_1E6949A18;
  v402[19] = &unk_1E69498E0;
  v401[20] = &unk_1E6949A78;
  v401[21] = &unk_1E6949A90;
  v402[20] = &unk_1E6949A18;
  v402[21] = &unk_1E6949928;
  v401[22] = &unk_1E6949AA8;
  v401[23] = &unk_1E6949AD8;
  v402[22] = &unk_1E6949AF0;
  v402[23] = &unk_1E6949AF0;
  v401[24] = &unk_1E6949580;
  v401[25] = &unk_1E69495B0;
  v402[24] = &unk_1E6949A18;
  v402[25] = &unk_1E69498E0;
  v401[26] = &unk_1E69495C8;
  v401[27] = &unk_1E69495E0;
  v402[26] = &unk_1E6949A18;
  v402[27] = &unk_1E69498E0;
  v401[28] = &unk_1E69495F8;
  v401[29] = &unk_1E6949610;
  v402[28] = &unk_1E69498E0;
  v402[29] = &unk_1E69498E0;
  v401[30] = &unk_1E6949628;
  v401[31] = &unk_1E6949640;
  v402[30] = &unk_1E69498E0;
  v402[31] = &unk_1E69498E0;
  v401[32] = &unk_1E6949658;
  v401[33] = &unk_1E6949670;
  v402[32] = &unk_1E6949A18;
  v402[33] = &unk_1E69498E0;
  v401[34] = &unk_1E6949688;
  v401[35] = &unk_1E69496A0;
  v402[34] = &unk_1E69498E0;
  v402[35] = &unk_1E6949A18;
  v401[36] = &unk_1E69496B8;
  v401[37] = &unk_1E69496D0;
  v402[36] = &unk_1E69498E0;
  v402[37] = &unk_1E69498E0;
  v401[38] = &unk_1E69496E8;
  v401[39] = &unk_1E6949700;
  v402[38] = &unk_1E69498E0;
  v402[39] = &unk_1E69498E0;
  v401[40] = &unk_1E6949718;
  v401[41] = &unk_1E6949730;
  v402[40] = &unk_1E6949A18;
  v402[41] = &unk_1E69498E0;
  v401[42] = &unk_1E6949748;
  v401[43] = &unk_1E6949760;
  v402[42] = &unk_1E69498E0;
  v402[43] = &unk_1E69498E0;
  v401[44] = &unk_1E6949778;
  v401[45] = &unk_1E6949790;
  v402[44] = &unk_1E69498E0;
  v402[45] = &unk_1E69498E0;
  v401[46] = &unk_1E69497A8;
  v402[46] = &unk_1E6949940;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v402, v401, 47);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v432 = v252;
  v421[11] = CFSTR("outputDisparityPixelBufferWidth");
  v399[0] = &unk_1E6949478;
  v399[1] = &unk_1E6949730;
  v400[0] = &unk_1E6949940;
  v400[1] = &unk_1E69498E0;
  v399[2] = &unk_1E6949748;
  v399[3] = &unk_1E6949760;
  v400[2] = &unk_1E69498E0;
  v400[3] = &unk_1E69498E0;
  v399[4] = &unk_1E6949778;
  v399[5] = &unk_1E6949790;
  v400[4] = &unk_1E69498E0;
  v400[5] = &unk_1E69498E0;
  v399[6] = &unk_1E6949850;
  v400[6] = &unk_1E69498E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v400, v399, 7);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v433 = v251;
  v421[12] = CFSTR("outputDisparityPixelBufferHeight");
  v397[0] = &unk_1E6949478;
  v397[1] = &unk_1E6949730;
  v398[0] = &unk_1E69498E0;
  v398[1] = &unk_1E6949940;
  v397[2] = &unk_1E6949748;
  v397[3] = &unk_1E6949760;
  v398[2] = &unk_1E6949940;
  v398[3] = &unk_1E6949940;
  v397[4] = &unk_1E6949778;
  v397[5] = &unk_1E6949790;
  v398[4] = &unk_1E6949940;
  v398[5] = &unk_1E6949940;
  v397[6] = &unk_1E6949850;
  v398[6] = &unk_1E6949940;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v398, v397, 7);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v434 = v282;
  v421[13] = CFSTR("outputDisparityOffset");
  v395[0] = &unk_1E6949478;
  v395[1] = &unk_1E6949640;
  v396[0] = &unk_1E694A130;
  v396[1] = &unk_1E694A140;
  v395[2] = &unk_1E6949670;
  v395[3] = &unk_1E6949688;
  v396[2] = &unk_1E694A150;
  v396[3] = &unk_1E694A160;
  v395[4] = &unk_1E69496B8;
  v395[5] = &unk_1E69496E8;
  v396[4] = &unk_1E694A160;
  v396[5] = &unk_1E694A150;
  v395[6] = &unk_1E6949700;
  v395[7] = &unk_1E6949850;
  v396[6] = &unk_1E694A160;
  v396[7] = &unk_1E694A150;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v396, v395, 8);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v435 = v281;
  v421[14] = CFSTR("inputToOutputDisparityPixelBufferRotation");
  v393[0] = &unk_1E6949478;
  v393[1] = &unk_1E69498C8;
  v394[0] = &unk_1E69498C8;
  v394[1] = &unk_1E69494A8;
  v393[2] = &unk_1E69498F8;
  v393[3] = &unk_1E6949910;
  v394[2] = &unk_1E69494A8;
  v394[3] = &unk_1E69498F8;
  v393[4] = &unk_1E69494D8;
  v393[5] = &unk_1E6949520;
  v394[4] = &unk_1E69498F8;
  v394[5] = &unk_1E69498F8;
  v393[6] = &unk_1E6949958;
  v393[7] = &unk_1E69499A0;
  v394[6] = &unk_1E69498F8;
  v394[7] = &unk_1E69498F8;
  v393[8] = &unk_1E69499E8;
  v393[9] = &unk_1E6949A00;
  v394[8] = &unk_1E69498F8;
  v394[9] = &unk_1E69498C8;
  v393[10] = &unk_1E6949A30;
  v393[11] = &unk_1E6949A48;
  v394[10] = &unk_1E69498F8;
  v394[11] = &unk_1E69498F8;
  v393[12] = &unk_1E6949A78;
  v393[13] = &unk_1E6949A90;
  v394[12] = &unk_1E69498F8;
  v394[13] = &unk_1E69498C8;
  v393[14] = &unk_1E6949580;
  v393[15] = &unk_1E69495C8;
  v394[14] = &unk_1E69498F8;
  v394[15] = &unk_1E69498F8;
  v393[16] = &unk_1E6949658;
  v393[17] = &unk_1E69496A0;
  v394[16] = &unk_1E69498F8;
  v394[17] = &unk_1E69498F8;
  v393[18] = &unk_1E6949718;
  v393[19] = &unk_1E6949730;
  v394[18] = &unk_1E69498F8;
  v394[19] = &unk_1E69494A8;
  v393[20] = &unk_1E6949748;
  v393[21] = &unk_1E6949760;
  v394[20] = &unk_1E69494A8;
  v394[21] = &unk_1E69494A8;
  v393[22] = &unk_1E6949778;
  v393[23] = &unk_1E6949790;
  v394[22] = &unk_1E69494A8;
  v394[23] = &unk_1E69494A8;
  v393[24] = &unk_1E69497A8;
  v393[25] = &unk_1E6949850;
  v394[24] = &unk_1E69494A8;
  v394[25] = &unk_1E69494A8;
  v393[26] = &unk_1E6949868;
  v394[26] = &unk_1E69498F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v394, v393, 27);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v436 = v280;
  v421[15] = CFSTR("inputDisparityPixelBufferPixelFormat");
  v391[0] = &unk_1E6949478;
  v391[1] = &unk_1E69498C8;
  v392[0] = &unk_1E6949B08;
  v392[1] = &unk_1E6949B20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v392, v391, 2);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v437 = v250;
  v438 = &unk_1E6949B38;
  v421[16] = CFSTR("outputDisparityPixelBufferPixelFormat");
  v421[17] = CFSTR("supportedInputSegmentationPixelBufferPixelFormats");
  v439 = &unk_1E69493E8;
  v421[18] = CFSTR("focusStatisticsXTileCount");
  v389[0] = &unk_1E6949478;
  v389[1] = &unk_1E6949880;
  v390[0] = &unk_1E6949B80;
  v390[1] = &unk_1E6949B98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v390, v389, 2);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v440 = v249;
  v421[19] = CFSTR("focusStatisticsYTileCount");
  v387[0] = &unk_1E6949478;
  v387[1] = &unk_1E6949880;
  v388[0] = &unk_1E6949BB0;
  v388[1] = &unk_1E6949BC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v388, v387, 2);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v441 = v279;
  v442 = &unk_1E69498B0;
  v421[20] = CFSTR("depthPixelBufferXPadding");
  v421[21] = CFSTR("depthPixelBufferYPadding");
  v443 = &unk_1E69498B0;
  v421[22] = CFSTR("depthPixelBufferXReplication");
  v385[0] = &unk_1E6949478;
  v385[1] = &unk_1E69498C8;
  v386[0] = &unk_1E69498B0;
  v386[1] = &unk_1E6949BE0;
  v385[2] = &unk_1E69498F8;
  v385[3] = &unk_1E69494A8;
  v386[2] = &unk_1E6949BE0;
  v386[3] = &unk_1E6949BE0;
  v385[4] = &unk_1E6949508;
  v385[5] = &unk_1E6949550;
  v386[4] = &unk_1E6949BE0;
  v386[5] = &unk_1E6949BE0;
  v385[6] = &unk_1E6949970;
  v385[7] = &unk_1E6949988;
  v386[6] = &unk_1E6949BE0;
  v386[7] = &unk_1E6949BE0;
  v385[8] = &unk_1E69499B8;
  v385[9] = &unk_1E69499D0;
  v386[8] = &unk_1E6949BE0;
  v386[9] = &unk_1E6949BE0;
  v385[10] = &unk_1E6949A60;
  v385[11] = &unk_1E69495B0;
  v386[10] = &unk_1E6949BE0;
  v386[11] = &unk_1E6949BE0;
  v385[12] = &unk_1E69495E0;
  v385[13] = &unk_1E69495F8;
  v386[12] = &unk_1E6949BE0;
  v386[13] = &unk_1E6949BE0;
  v385[14] = &unk_1E6949610;
  v385[15] = &unk_1E6949628;
  v386[14] = &unk_1E6949BE0;
  v386[15] = &unk_1E6949BE0;
  v385[16] = &unk_1E6949640;
  v385[17] = &unk_1E6949670;
  v386[16] = &unk_1E6949BE0;
  v386[17] = &unk_1E6949BE0;
  v385[18] = &unk_1E6949688;
  v385[19] = &unk_1E69496B8;
  v386[18] = &unk_1E6949BE0;
  v386[19] = &unk_1E6949BE0;
  v385[20] = &unk_1E69496D0;
  v385[21] = &unk_1E69496E8;
  v386[20] = &unk_1E6949BE0;
  v386[21] = &unk_1E6949BE0;
  v385[22] = &unk_1E6949700;
  v385[23] = &unk_1E6949850;
  v386[22] = &unk_1E6949BE0;
  v386[23] = &unk_1E6949BE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v386, v385, 24);
  v444 = objc_claimAutoreleasedReturnValue();
  v421[23] = CFSTR("depthPixelBufferYReplication");
  v383[0] = &unk_1E6949478;
  v383[1] = &unk_1E69498C8;
  v384[0] = &unk_1E69498B0;
  v384[1] = &unk_1E6949BF8;
  v383[2] = &unk_1E69498F8;
  v383[3] = &unk_1E69494A8;
  v384[2] = &unk_1E6949BF8;
  v384[3] = &unk_1E6949BF8;
  v383[4] = &unk_1E6949508;
  v383[5] = &unk_1E6949550;
  v384[4] = &unk_1E6949BF8;
  v384[5] = &unk_1E6949BF8;
  v383[6] = &unk_1E6949970;
  v383[7] = &unk_1E6949988;
  v384[6] = &unk_1E6949BF8;
  v384[7] = &unk_1E6949BF8;
  v383[8] = &unk_1E69499B8;
  v383[9] = &unk_1E69499D0;
  v384[8] = &unk_1E6949BF8;
  v384[9] = &unk_1E6949BF8;
  v383[10] = &unk_1E69495B0;
  v383[11] = &unk_1E69495E0;
  v384[10] = &unk_1E6949BF8;
  v384[11] = &unk_1E6949BF8;
  v383[12] = &unk_1E69495F8;
  v383[13] = &unk_1E6949A60;
  v384[12] = &unk_1E6949BF8;
  v384[13] = &unk_1E6949BF8;
  v383[14] = &unk_1E6949610;
  v383[15] = &unk_1E6949628;
  v384[14] = &unk_1E6949BF8;
  v384[15] = &unk_1E6949BF8;
  v383[16] = &unk_1E6949640;
  v383[17] = &unk_1E6949670;
  v384[16] = &unk_1E6949BF8;
  v384[17] = &unk_1E6949BF8;
  v383[18] = &unk_1E6949688;
  v383[19] = &unk_1E69496B8;
  v384[18] = &unk_1E6949BF8;
  v384[19] = &unk_1E6949BF8;
  v383[20] = &unk_1E69496D0;
  v383[21] = &unk_1E69496E8;
  v384[20] = &unk_1E6949BF8;
  v384[21] = &unk_1E6949BF8;
  v383[22] = &unk_1E6949700;
  v383[23] = &unk_1E6949850;
  v384[22] = &unk_1E6949BF8;
  v384[23] = &unk_1E6949BF8;
  v278 = (void *)v444;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v384, v383, 24);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v445 = v277;
  v421[24] = CFSTR("depthPixelBufferScale");
  v381[0] = &unk_1E6949478;
  v381[1] = &unk_1E69498C8;
  v382[0] = &unk_1E6949C10;
  v382[1] = &unk_1E6949C28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v382, v381, 2);
  v32 = objc_claimAutoreleasedReturnValue();
  v421[25] = CFSTR("depthPixelBufferOffset");
  v380[1] = &unk_1E694A170;
  v380[2] = &unk_1E694A170;
  v380[3] = &unk_1E694A180;
  v380[4] = &unk_1E694A190;
  v380[6] = &unk_1E694A1B0;
  v380[8] = &unk_1E694A1B0;
  v380[16] = &unk_1E694A180;
  v380[17] = &unk_1E694A180;
  v380[18] = &unk_1E694A180;
  v380[19] = &unk_1E694A180;
  v380[20] = &unk_1E694A1E0;
  v380[21] = &unk_1E694A180;
  v380[22] = &unk_1E694A180;
  v380[24] = &unk_1E694A1F0;
  v380[28] = &unk_1E694A200;
  v380[29] = &unk_1E694A210;
  v380[32] = &unk_1E694A200;
  v380[36] = &unk_1E694A1C0;
  v380[37] = &unk_1E694A200;
  v380[13] = &unk_1E694A1C0;
  v380[26] = &unk_1E694A1C0;
  v380[30] = &unk_1E694A1C0;
  v380[10] = &unk_1E694A1C0;
  v380[11] = &unk_1E694A1D0;
  v380[14] = &unk_1E694A1D0;
  v380[27] = &unk_1E694A1D0;
  v380[33] = &unk_1E694A1D0;
  v380[35] = &unk_1E694A1D0;
  v380[38] = &unk_1E694A1D0;
  v380[0] = &unk_1E6949F90;
  v380[12] = &unk_1E694A1A0;
  v380[34] = &unk_1E694A1A0;
  v248 = (void *)v32;
  v446 = v32;
  v379[0] = &unk_1E6949478;
  v379[1] = &unk_1E69498C8;
  v379[2] = &unk_1E69498F8;
  v379[3] = &unk_1E6949910;
  v379[4] = &unk_1E69494A8;
  v379[5] = &unk_1E69494D8;
  v380[5] = &unk_1E694A1A0;
  v379[6] = &unk_1E6949508;
  v379[7] = &unk_1E6949520;
  v380[7] = &unk_1E694A1A0;
  v379[8] = &unk_1E6949550;
  v379[9] = &unk_1E6949958;
  v380[9] = &unk_1E694A1A0;
  v379[10] = &unk_1E6949970;
  v379[11] = &unk_1E6949988;
  v379[12] = &unk_1E69499A0;
  v379[13] = &unk_1E69499B8;
  v379[14] = &unk_1E69499D0;
  v379[15] = &unk_1E6949880;
  v380[15] = &unk_1E69498B0;
  v379[16] = &unk_1E69499E8;
  v379[17] = &unk_1E6949A00;
  v379[18] = &unk_1E6949A30;
  v379[19] = &unk_1E6949A48;
  v379[20] = &unk_1E6949A60;
  v379[21] = &unk_1E6949A78;
  v379[22] = &unk_1E6949A90;
  v379[23] = &unk_1E6949580;
  v380[23] = &unk_1E694A1A0;
  v379[24] = &unk_1E69495B0;
  v379[25] = &unk_1E69495C8;
  v380[25] = &unk_1E694A1A0;
  v379[26] = &unk_1E69495E0;
  v379[27] = &unk_1E69495F8;
  v379[28] = &unk_1E6949610;
  v379[29] = &unk_1E6949628;
  v379[30] = &unk_1E6949640;
  v379[31] = &unk_1E6949658;
  v380[31] = &unk_1E694A1A0;
  v379[32] = &unk_1E6949670;
  v379[33] = &unk_1E6949688;
  v379[34] = &unk_1E69496A0;
  v379[35] = &unk_1E69496B8;
  v379[36] = &unk_1E69496D0;
  v379[37] = &unk_1E69496E8;
  v379[38] = &unk_1E6949700;
  v379[39] = &unk_1E6949718;
  v380[39] = &unk_1E694A1A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v380, v379, 40);
  v33 = objc_claimAutoreleasedReturnValue();
  v421[26] = CFSTR("disparityStereoFocalLengthPixels");
  v378[4] = &unk_1E694A240;
  v378[6] = &unk_1E694A240;
  v378[8] = &unk_1E694A240;
  v378[10] = &unk_1E694A240;
  v378[13] = &unk_1E694A240;
  v378[24] = &unk_1E694A260;
  v378[1] = &unk_1E694A220;
  v378[2] = &unk_1E694A220;
  v378[12] = &unk_1E694A230;
  v378[3] = &unk_1E694A230;
  v378[5] = &unk_1E694A230;
  v378[7] = &unk_1E694A230;
  v378[9] = &unk_1E694A230;
  v378[11] = &unk_1E694A250;
  v378[14] = &unk_1E694A250;
  v378[16] = &unk_1E694A230;
  v378[17] = &unk_1E694A230;
  v378[18] = &unk_1E694A230;
  v378[19] = &unk_1E694A230;
  v378[20] = &unk_1E694A250;
  v378[21] = &unk_1E694A230;
  v378[22] = &unk_1E694A230;
  v378[23] = &unk_1E694A230;
  v378[25] = &unk_1E694A230;
  v378[26] = &unk_1E694A270;
  v378[27] = &unk_1E694A250;
  v378[30] = &unk_1E694A270;
  v378[36] = &unk_1E694A270;
  v378[32] = &unk_1E694A2A0;
  v378[37] = &unk_1E694A2A0;
  v378[28] = &unk_1E694A280;
  v378[29] = &unk_1E694A290;
  v378[33] = &unk_1E694A290;
  v378[35] = &unk_1E694A290;
  v378[38] = &unk_1E694A290;
  v378[0] = &unk_1E6949F90;
  v378[34] = &unk_1E6949A18;
  v247 = (void *)v33;
  v447 = v33;
  v377[0] = &unk_1E6949478;
  v377[1] = &unk_1E69498C8;
  v377[2] = &unk_1E69498F8;
  v377[3] = &unk_1E6949910;
  v377[4] = &unk_1E69494A8;
  v377[5] = &unk_1E69494D8;
  v377[6] = &unk_1E6949508;
  v377[7] = &unk_1E6949520;
  v377[8] = &unk_1E6949550;
  v377[9] = &unk_1E6949958;
  v377[10] = &unk_1E6949970;
  v377[11] = &unk_1E6949988;
  v377[12] = &unk_1E69499A0;
  v377[13] = &unk_1E69499B8;
  v377[14] = &unk_1E69499D0;
  v377[15] = &unk_1E6949880;
  v378[15] = &unk_1E69498B0;
  v377[16] = &unk_1E69499E8;
  v377[17] = &unk_1E6949A00;
  v377[18] = &unk_1E6949A30;
  v377[19] = &unk_1E6949A48;
  v377[20] = &unk_1E6949A60;
  v377[21] = &unk_1E6949A78;
  v377[22] = &unk_1E6949A90;
  v377[23] = &unk_1E6949580;
  v377[24] = &unk_1E69495B0;
  v377[25] = &unk_1E69495C8;
  v377[26] = &unk_1E69495E0;
  v377[27] = &unk_1E69495F8;
  v377[28] = &unk_1E6949610;
  v377[29] = &unk_1E6949628;
  v377[30] = &unk_1E6949640;
  v377[31] = &unk_1E6949658;
  v378[31] = &unk_1E6949A18;
  v377[32] = &unk_1E6949670;
  v377[33] = &unk_1E6949688;
  v377[34] = &unk_1E69496A0;
  v377[35] = &unk_1E69496B8;
  v377[36] = &unk_1E69496D0;
  v377[37] = &unk_1E69496E8;
  v377[38] = &unk_1E6949700;
  v377[39] = &unk_1E6949718;
  v378[39] = &unk_1E6949A18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v378, v377, 40);
  v34 = objc_claimAutoreleasedReturnValue();
  v421[27] = CFSTR("disparityStereoBaselineMeters");
  v376[1] = &unk_1E694A2B0;
  v376[2] = &unk_1E694A2B0;
  v376[4] = &unk_1E694A2D0;
  v376[6] = &unk_1E694A2E0;
  v376[8] = &unk_1E694A2E0;
  v376[10] = &unk_1E694A2F0;
  v376[11] = &unk_1E694A300;
  v376[13] = &unk_1E694A2F0;
  v376[14] = &unk_1E694A300;
  v376[20] = &unk_1E694A310;
  v376[24] = &unk_1E694A310;
  v376[26] = &unk_1E694A320;
  v376[27] = &unk_1E694A300;
  v376[30] = &unk_1E694A310;
  v376[36] = &unk_1E694A320;
  v376[32] = &unk_1E694A350;
  v376[37] = &unk_1E694A350;
  v376[28] = &unk_1E694A330;
  v376[29] = &unk_1E694A340;
  v376[33] = &unk_1E694A340;
  v376[35] = &unk_1E694A340;
  v376[38] = &unk_1E694A340;
  v376[0] = &unk_1E6949F90;
  v376[12] = &unk_1E694A2C0;
  v376[34] = &unk_1E694A2C0;
  v276 = (void *)v34;
  v448 = v34;
  v375[0] = &unk_1E6949478;
  v375[1] = &unk_1E69498C8;
  v375[2] = &unk_1E69498F8;
  v375[3] = &unk_1E6949910;
  v376[3] = &unk_1E694A2C0;
  v375[4] = &unk_1E69494A8;
  v375[5] = &unk_1E69494D8;
  v376[5] = &unk_1E694A2C0;
  v375[6] = &unk_1E6949508;
  v375[7] = &unk_1E6949520;
  v376[7] = &unk_1E694A2C0;
  v375[8] = &unk_1E6949550;
  v375[9] = &unk_1E6949958;
  v376[9] = &unk_1E694A2C0;
  v375[10] = &unk_1E6949970;
  v375[11] = &unk_1E6949988;
  v375[12] = &unk_1E69499A0;
  v375[13] = &unk_1E69499B8;
  v375[14] = &unk_1E69499D0;
  v375[15] = &unk_1E6949880;
  v376[15] = &unk_1E69498B0;
  v375[16] = &unk_1E69499E8;
  v375[17] = &unk_1E6949A00;
  v376[16] = &unk_1E694A2C0;
  v376[17] = &unk_1E694A2C0;
  v375[18] = &unk_1E6949A30;
  v375[19] = &unk_1E6949A48;
  v376[18] = &unk_1E694A2C0;
  v376[19] = &unk_1E694A2C0;
  v375[20] = &unk_1E6949A60;
  v375[21] = &unk_1E6949A78;
  v376[21] = &unk_1E694A2C0;
  v375[22] = &unk_1E6949A90;
  v375[23] = &unk_1E6949580;
  v376[22] = &unk_1E694A2C0;
  v376[23] = &unk_1E694A2C0;
  v375[24] = &unk_1E69495B0;
  v375[25] = &unk_1E69495C8;
  v376[25] = &unk_1E694A2C0;
  v375[26] = &unk_1E69495E0;
  v375[27] = &unk_1E69495F8;
  v375[28] = &unk_1E6949610;
  v375[29] = &unk_1E6949628;
  v375[30] = &unk_1E6949640;
  v375[31] = &unk_1E6949658;
  v376[31] = &unk_1E694A2C0;
  v375[32] = &unk_1E6949670;
  v375[33] = &unk_1E6949688;
  v375[34] = &unk_1E69496A0;
  v375[35] = &unk_1E69496B8;
  v375[36] = &unk_1E69496D0;
  v375[37] = &unk_1E69496E8;
  v375[38] = &unk_1E6949700;
  v375[39] = &unk_1E6949718;
  v376[39] = &unk_1E694A2C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v376, v375, 40);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v449 = v299;
  v421[28] = CFSTR("canSkipDisparityHoleFillingAndTemporalRejection");
  v35 = MEMORY[0x1E0C9AAA0];
  v36 = MEMORY[0x1E0C9AAB0];
  v373[0] = &unk_1E6949478;
  v373[1] = &unk_1E69495B0;
  v374[0] = MEMORY[0x1E0C9AAA0];
  v374[1] = MEMORY[0x1E0C9AAB0];
  v373[2] = &unk_1E69495E0;
  v373[3] = &unk_1E69495F8;
  v374[2] = MEMORY[0x1E0C9AAB0];
  v374[3] = MEMORY[0x1E0C9AAB0];
  v373[4] = &unk_1E6949610;
  v373[5] = &unk_1E6949628;
  v374[4] = MEMORY[0x1E0C9AAB0];
  v374[5] = MEMORY[0x1E0C9AAB0];
  v373[6] = &unk_1E6949640;
  v373[7] = &unk_1E6949670;
  v374[6] = MEMORY[0x1E0C9AAB0];
  v374[7] = MEMORY[0x1E0C9AAB0];
  v373[8] = &unk_1E6949688;
  v373[9] = &unk_1E69496B8;
  v374[8] = MEMORY[0x1E0C9AAB0];
  v374[9] = MEMORY[0x1E0C9AAB0];
  v373[10] = &unk_1E69496D0;
  v373[11] = &unk_1E69496E8;
  v374[10] = MEMORY[0x1E0C9AAB0];
  v374[11] = MEMORY[0x1E0C9AAB0];
  v373[12] = &unk_1E6949700;
  v373[13] = &unk_1E6949730;
  v374[12] = MEMORY[0x1E0C9AAB0];
  v374[13] = MEMORY[0x1E0C9AAB0];
  v373[14] = &unk_1E6949748;
  v373[15] = &unk_1E6949760;
  v374[14] = MEMORY[0x1E0C9AAB0];
  v374[15] = MEMORY[0x1E0C9AAB0];
  v373[16] = &unk_1E6949778;
  v373[17] = &unk_1E6949790;
  v374[16] = MEMORY[0x1E0C9AAB0];
  v374[17] = MEMORY[0x1E0C9AAB0];
  v373[18] = &unk_1E69497A8;
  v373[19] = &unk_1E6949850;
  v374[18] = MEMORY[0x1E0C9AAB0];
  v374[19] = MEMORY[0x1E0C9AAB0];
  v373[20] = &unk_1E6949868;
  v374[20] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v374, v373, 21);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v450 = v298;
  v421[29] = CFSTR("supportsForegroundBlur");
  v371[0] = &unk_1E6949478;
  v371[1] = &unk_1E6949640;
  v372[0] = v35;
  v372[1] = v36;
  v371[2] = &unk_1E6949658;
  v371[3] = &unk_1E6949670;
  v372[2] = v36;
  v372[3] = v36;
  v371[4] = &unk_1E6949688;
  v371[5] = &unk_1E69496B8;
  v372[4] = v36;
  v372[5] = v36;
  v371[6] = &unk_1E69496D0;
  v371[7] = &unk_1E69496E8;
  v372[6] = v36;
  v372[7] = v36;
  v371[8] = &unk_1E69496A0;
  v371[9] = &unk_1E6949700;
  v372[8] = v36;
  v372[9] = v36;
  v371[10] = &unk_1E6949718;
  v371[11] = &unk_1E6949730;
  v372[10] = v36;
  v372[11] = v36;
  v371[12] = &unk_1E6949748;
  v371[13] = &unk_1E6949760;
  v372[12] = v36;
  v372[13] = v36;
  v371[14] = &unk_1E6949778;
  v371[15] = &unk_1E6949790;
  v372[14] = v36;
  v372[15] = v36;
  v371[16] = &unk_1E69497A8;
  v371[17] = &unk_1E6949A00;
  v372[16] = v36;
  v372[17] = v36;
  v371[18] = &unk_1E6949A90;
  v371[19] = &unk_1E6949850;
  v372[18] = v36;
  v372[19] = v36;
  v371[20] = &unk_1E6949868;
  v372[20] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v372, v371, 21);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v451 = v246;
  v421[30] = CFSTR("rawShiftInvalidThreshold");
  v369[0] = &unk_1E6949478;
  v369[1] = &unk_1E69498C8;
  v370[0] = &unk_1E6949C40;
  v370[1] = &unk_1E6949C58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v370, v369, 2);
  v37 = objc_claimAutoreleasedReturnValue();
  v421[31] = CFSTR("depthPixelBufferMaxLeftOcclusionDisparityChange");
  v245 = (void *)v37;
  v452 = v37;
  v367[0] = &unk_1E6949478;
  v367[1] = &unk_1E6949910;
  v368[0] = &unk_1E6949FA0;
  v368[1] = &unk_1E694A130;
  v367[2] = &unk_1E69494D8;
  v367[3] = &unk_1E6949520;
  v368[2] = &unk_1E694A130;
  v368[3] = &unk_1E694A130;
  v367[4] = &unk_1E6949958;
  v367[5] = &unk_1E69499A0;
  v368[4] = &unk_1E694A130;
  v368[5] = &unk_1E694A130;
  v367[6] = &unk_1E6949880;
  v367[7] = &unk_1E69499E8;
  v368[6] = &unk_1E6949FB0;
  v368[7] = &unk_1E694A130;
  v367[8] = &unk_1E6949A00;
  v367[9] = &unk_1E6949A30;
  v368[8] = &unk_1E694A130;
  v368[9] = &unk_1E694A130;
  v367[10] = &unk_1E6949A48;
  v367[11] = &unk_1E6949A78;
  v368[10] = &unk_1E694A130;
  v368[11] = &unk_1E694A130;
  v367[12] = &unk_1E6949A90;
  v367[13] = &unk_1E6949580;
  v368[12] = &unk_1E694A130;
  v368[13] = &unk_1E694A130;
  v367[14] = &unk_1E69495C8;
  v367[15] = &unk_1E6949658;
  v368[14] = &unk_1E694A130;
  v368[15] = &unk_1E694A130;
  v367[16] = &unk_1E69496A0;
  v367[17] = &unk_1E6949718;
  v368[16] = &unk_1E694A130;
  v368[17] = &unk_1E694A130;
  v367[18] = &unk_1E69497A8;
  v368[18] = &unk_1E694A130;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v368, v367, 19);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v453 = v275;
  v454 = &unk_1E69498B0;
  v421[32] = CFSTR("depthPixelBufferMaxRightOcclusionDisparityChange");
  v421[33] = CFSTR("backgroundDisparityUpdateRate");
  v455 = &unk_1E694A360;
  v456 = &unk_1E694A370;
  v421[34] = CFSTR("invalidDisparityRatioUpdateRate");
  v421[35] = CFSTR("backgroundDisparityStatsWindowSize");
  v457 = &unk_1E6949C70;
  v458 = &unk_1E6949C88;
  v421[36] = CFSTR("invalidDisparityRatioStatsWindowSize");
  v421[37] = CFSTR("minDeltaCanonicalDisparity");
  v365[0] = &unk_1E6949478;
  v365[1] = &unk_1E6949910;
  v366[0] = &unk_1E694A370;
  v366[1] = &unk_1E694A150;
  v365[2] = &unk_1E69494D8;
  v365[3] = &unk_1E6949520;
  v366[2] = &unk_1E694A150;
  v366[3] = &unk_1E694A150;
  v365[4] = &unk_1E6949958;
  v365[5] = &unk_1E69499A0;
  v366[4] = &unk_1E694A150;
  v366[5] = &unk_1E694A150;
  v365[6] = &unk_1E6949880;
  v365[7] = &unk_1E69499E8;
  v366[6] = &unk_1E6949FC0;
  v366[7] = &unk_1E694A370;
  v365[8] = &unk_1E6949A00;
  v365[9] = &unk_1E6949A30;
  v366[8] = &unk_1E694A370;
  v366[9] = &unk_1E694A150;
  v365[10] = &unk_1E6949A48;
  v365[11] = &unk_1E6949A78;
  v366[10] = &unk_1E694A150;
  v366[11] = &unk_1E694A150;
  v365[12] = &unk_1E6949A90;
  v365[13] = &unk_1E6949580;
  v366[12] = &unk_1E694A150;
  v366[13] = &unk_1E694A150;
  v365[14] = &unk_1E69495C8;
  v365[15] = &unk_1E6949658;
  v366[14] = &unk_1E694A150;
  v366[15] = &unk_1E694A150;
  v365[16] = &unk_1E6949670;
  v365[17] = &unk_1E69496A0;
  v366[16] = &unk_1E694A380;
  v366[17] = &unk_1E694A150;
  v365[18] = &unk_1E69496E8;
  v365[19] = &unk_1E6949718;
  v366[18] = &unk_1E694A380;
  v366[19] = &unk_1E694A150;
  v365[20] = &unk_1E69497A8;
  v365[21] = &unk_1E6949850;
  v366[20] = &unk_1E694A150;
  v366[21] = &unk_1E694A380;
  v365[22] = &unk_1E6949868;
  v366[22] = &unk_1E694A150;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v366, v365, 23);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v459 = v274;
  v421[38] = CFSTR("maxDeltaCanonicalDisparity");
  v363[0] = &unk_1E6949478;
  v363[1] = &unk_1E6949910;
  v364[0] = &unk_1E694A390;
  v364[1] = &unk_1E694A3A0;
  v363[2] = &unk_1E69494D8;
  v363[3] = &unk_1E6949520;
  v364[2] = &unk_1E694A3A0;
  v364[3] = &unk_1E694A3A0;
  v363[4] = &unk_1E6949958;
  v363[5] = &unk_1E69499A0;
  v364[4] = &unk_1E694A3A0;
  v364[5] = &unk_1E694A3A0;
  v363[6] = &unk_1E6949880;
  v363[7] = &unk_1E69499E8;
  v364[6] = &unk_1E6949FC0;
  v364[7] = &unk_1E694A140;
  v363[8] = &unk_1E6949A00;
  v363[9] = &unk_1E6949A30;
  v364[8] = &unk_1E694A140;
  v364[9] = &unk_1E694A3A0;
  v363[10] = &unk_1E6949A48;
  v363[11] = &unk_1E6949A78;
  v364[10] = &unk_1E694A3A0;
  v364[11] = &unk_1E694A3A0;
  v363[12] = &unk_1E6949A90;
  v363[13] = &unk_1E6949580;
  v364[12] = &unk_1E694A3A0;
  v364[13] = &unk_1E694A3A0;
  v363[14] = &unk_1E69495C8;
  v363[15] = &unk_1E6949658;
  v364[14] = &unk_1E694A3A0;
  v364[15] = &unk_1E694A3A0;
  v363[16] = &unk_1E69496A0;
  v363[17] = &unk_1E6949718;
  v364[16] = &unk_1E694A3A0;
  v364[17] = &unk_1E694A3A0;
  v363[18] = &unk_1E69497A8;
  v363[19] = &unk_1E6949868;
  v364[18] = &unk_1E694A3A0;
  v364[19] = &unk_1E694A3A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v364, v363, 20);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v460 = v273;
  v421[39] = CFSTR("centerDeltaCanonicalDisparity");
  v361[0] = &unk_1E6949478;
  v361[1] = &unk_1E6949910;
  v362[0] = &unk_1E694A3B0;
  v362[1] = &unk_1E694A3C0;
  v361[2] = &unk_1E69494D8;
  v361[3] = &unk_1E6949520;
  v362[2] = &unk_1E694A3C0;
  v362[3] = &unk_1E694A3C0;
  v361[4] = &unk_1E6949958;
  v361[5] = &unk_1E69499A0;
  v362[4] = &unk_1E694A3C0;
  v362[5] = &unk_1E694A3C0;
  v361[6] = &unk_1E6949880;
  v361[7] = &unk_1E69499E8;
  v362[6] = &unk_1E6949FC0;
  v362[7] = &unk_1E694A3D0;
  v361[8] = &unk_1E6949A00;
  v361[9] = &unk_1E6949A30;
  v362[8] = &unk_1E694A3D0;
  v362[9] = &unk_1E694A3C0;
  v361[10] = &unk_1E6949A48;
  v361[11] = &unk_1E6949A78;
  v362[10] = &unk_1E694A3C0;
  v362[11] = &unk_1E694A3C0;
  v361[12] = &unk_1E6949A90;
  v361[13] = &unk_1E6949580;
  v362[12] = &unk_1E694A3C0;
  v362[13] = &unk_1E694A3C0;
  v361[14] = &unk_1E69495C8;
  v361[15] = &unk_1E6949658;
  v362[14] = &unk_1E694A3C0;
  v362[15] = &unk_1E694A3C0;
  v361[16] = &unk_1E69496A0;
  v361[17] = &unk_1E6949718;
  v362[16] = &unk_1E694A3C0;
  v362[17] = &unk_1E694A3C0;
  v361[18] = &unk_1E69497A8;
  v361[19] = &unk_1E6949868;
  v362[18] = &unk_1E694A3C0;
  v362[19] = &unk_1E694A3C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v362, v361, 20);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v461 = v244;
  v462 = &unk_1E694A3E0;
  v421[40] = CFSTR("dsCanonicalLowThld");
  v421[41] = CFSTR("dsCanonicalLowScale");
  v359[0] = &unk_1E6949478;
  v359[1] = &unk_1E6949910;
  v360[0] = &unk_1E694A3F0;
  v360[1] = &unk_1E694A400;
  v359[2] = &unk_1E69494D8;
  v359[3] = &unk_1E6949520;
  v360[2] = &unk_1E694A400;
  v360[3] = &unk_1E694A400;
  v359[4] = &unk_1E6949958;
  v359[5] = &unk_1E69499A0;
  v360[4] = &unk_1E694A400;
  v360[5] = &unk_1E694A400;
  v359[6] = &unk_1E69499E8;
  v359[7] = &unk_1E6949A00;
  v360[6] = &unk_1E694A400;
  v360[7] = &unk_1E694A400;
  v359[8] = &unk_1E6949A30;
  v359[9] = &unk_1E6949A48;
  v360[8] = &unk_1E694A400;
  v360[9] = &unk_1E694A400;
  v359[10] = &unk_1E6949A78;
  v359[11] = &unk_1E6949A90;
  v360[10] = &unk_1E694A400;
  v360[11] = &unk_1E694A400;
  v359[12] = &unk_1E6949580;
  v359[13] = &unk_1E69495C8;
  v360[12] = &unk_1E694A400;
  v360[13] = &unk_1E694A400;
  v359[14] = &unk_1E6949658;
  v359[15] = &unk_1E69496A0;
  v360[14] = &unk_1E694A400;
  v360[15] = &unk_1E694A400;
  v359[16] = &unk_1E6949718;
  v359[17] = &unk_1E69497A8;
  v360[16] = &unk_1E694A400;
  v360[17] = &unk_1E694A400;
  v359[18] = &unk_1E6949868;
  v360[18] = &unk_1E694A400;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v360, v359, 19);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v463 = v297;
  v464 = &unk_1E694A410;
  v421[42] = CFSTR("dsCanonicalHighThld");
  v421[43] = CFSTR("linearDeltaDepthMultiplier");
  v465 = &unk_1E694A420;
  v466 = &unk_1E694A430;
  v421[44] = CFSTR("linearDeltaDepthOffset");
  v421[45] = CFSTR("dsCanonicalHighScale");
  v357[0] = &unk_1E6949478;
  v357[1] = &unk_1E6949910;
  v358[0] = &unk_1E694A440;
  v358[1] = &unk_1E694A450;
  v357[2] = &unk_1E69494D8;
  v357[3] = &unk_1E6949520;
  v358[2] = &unk_1E694A450;
  v358[3] = &unk_1E694A450;
  v357[4] = &unk_1E6949958;
  v357[5] = &unk_1E69499A0;
  v358[4] = &unk_1E694A450;
  v358[5] = &unk_1E694A450;
  v357[6] = &unk_1E69499E8;
  v357[7] = &unk_1E6949A00;
  v358[6] = &unk_1E694A450;
  v358[7] = &unk_1E694A450;
  v357[8] = &unk_1E6949A30;
  v357[9] = &unk_1E6949A48;
  v358[8] = &unk_1E694A450;
  v358[9] = &unk_1E694A450;
  v357[10] = &unk_1E6949A78;
  v357[11] = &unk_1E6949A90;
  v358[10] = &unk_1E694A450;
  v358[11] = &unk_1E694A450;
  v357[12] = &unk_1E6949580;
  v357[13] = &unk_1E69495C8;
  v358[12] = &unk_1E694A450;
  v358[13] = &unk_1E694A450;
  v357[14] = &unk_1E6949658;
  v358[14] = &unk_1E694A450;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v358, v357, 15);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v467 = v272;
  v468 = &unk_1E694A150;
  v421[46] = CFSTR("foregroundPercentile");
  v421[47] = CFSTR("closeDisparityPercentile");
  v469 = &unk_1E694A140;
  v470 = &unk_1E694A150;
  v421[48] = CFSTR("deltaDepth");
  v421[49] = CFSTR("mattingUpdateRate");
  v355 = &unk_1E6949478;
  v356 = &unk_1E694A360;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v356, &v355, 1);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v471 = v271;
  v472 = &unk_1E694A150;
  v421[50] = CFSTR("mattingUpdateRateFast");
  v421[51] = CFSTR("guidedFilterUnconfidentWeight");
  v473 = &unk_1E694A460;
  v474 = &unk_1E6949C28;
  v421[52] = CFSTR("guidedFilterMinDistToDeweight");
  v421[53] = CFSTR("foregroundMaskDilationRadius");
  v475 = &unk_1E6949CA0;
  v476 = &unk_1E6949C28;
  v421[54] = CFSTR("infConvolutionDownsampling");
  v421[55] = CFSTR("laplacianLimitingDownsampling");
  v353[0] = &unk_1E6949478;
  v353[1] = &unk_1E69498C8;
  v354[0] = &unk_1E6949CA0;
  v354[1] = &unk_1E6949CB8;
  v353[2] = &unk_1E69498F8;
  v353[3] = &unk_1E6949910;
  v354[2] = &unk_1E6949CB8;
  v354[3] = &unk_1E6949CB8;
  v353[4] = &unk_1E69494A8;
  v354[4] = &unk_1E6949CB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v354, v353, 5);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v477 = v270;
  v421[56] = CFSTR("laplacianLimitingBlurSize");
  v351[0] = &unk_1E6949478;
  v351[1] = &unk_1E69498C8;
  v352[0] = &unk_1E6949CB8;
  v352[1] = &unk_1E69498B0;
  v351[2] = &unk_1E69498F8;
  v351[3] = &unk_1E6949910;
  v352[2] = &unk_1E69498B0;
  v352[3] = &unk_1E69498B0;
  v351[4] = &unk_1E69494A8;
  v352[4] = &unk_1E69498B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v352, v351, 5);
  v478 = objc_claimAutoreleasedReturnValue();
  v479 = &unk_1E6949CD0;
  v421[57] = CFSTR("referenceDisparity");
  v421[58] = CFSTR("deltaCanonicalDisparity");
  v349[0] = &unk_1E6949478;
  v349[1] = &unk_1E6949910;
  v350[0] = &unk_1E694A3B0;
  v350[1] = &unk_1E694A470;
  v349[2] = &unk_1E69494D8;
  v349[3] = &unk_1E6949520;
  v350[2] = &unk_1E694A470;
  v350[3] = &unk_1E694A470;
  v349[4] = &unk_1E6949958;
  v349[5] = &unk_1E69499A0;
  v350[4] = &unk_1E694A470;
  v350[5] = &unk_1E694A470;
  v349[6] = &unk_1E69499E8;
  v349[7] = &unk_1E6949A00;
  v350[6] = &unk_1E694A470;
  v350[7] = &unk_1E694A470;
  v349[8] = &unk_1E6949A30;
  v349[9] = &unk_1E6949A48;
  v350[8] = &unk_1E694A470;
  v350[9] = &unk_1E694A470;
  v349[10] = &unk_1E6949A78;
  v349[11] = &unk_1E6949A90;
  v350[10] = &unk_1E694A470;
  v350[11] = &unk_1E694A470;
  v349[12] = &unk_1E6949580;
  v349[13] = &unk_1E69495C8;
  v350[12] = &unk_1E694A470;
  v350[13] = &unk_1E694A470;
  v349[14] = &unk_1E6949658;
  v349[15] = &unk_1E69496A0;
  v350[14] = &unk_1E694A470;
  v350[15] = &unk_1E694A470;
  v349[16] = &unk_1E6949718;
  v349[17] = &unk_1E69497A8;
  v350[16] = &unk_1E694A470;
  v350[17] = &unk_1E694A450;
  v349[18] = &unk_1E6949868;
  v350[18] = &unk_1E694A470;
  v243 = (void *)v478;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v350, v349, 19);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v480 = v242;
  v421[59] = CFSTR("alphaCoeffFilterColorStd");
  v347 = &unk_1E6949478;
  v348 = &unk_1E6949BE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v348, &v347, 1);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v481 = v269;
  v482 = &unk_1E6949BE0;
  v421[60] = CFSTR("alphaCoeffFilterColorStdFast");
  v421[61] = CFSTR("alphaMaxLaplacian");
  v483 = &unk_1E694A480;
  v484 = &unk_1E6949CA0;
  v421[62] = CFSTR("alphaContrastExponent");
  v421[63] = CFSTR("alphaGammaExponent");
  v421[64] = CFSTR("disparityFilterColorStd");
  v485 = &unk_1E694A490;
  v486 = &unk_1E6949CE8;
  v421[65] = CFSTR("disparityFilterUpdateRate");
  v487 = &unk_1E694A150;
  v421[66] = CFSTR("minimumConfidenceToKeepDisparity");
  v488 = &unk_1E694A4A0;
  v421[67] = CFSTR("maximumSimilarityToKeepDisparity");
  v489 = &unk_1E694A3A0;
  v421[68] = CFSTR("maxDisparityFillingInconsistency");
  v490 = &unk_1E6949D00;
  v421[69] = CFSTR("maxDisparityFillingDistFromForeground");
  v491 = &unk_1E6949C28;
  v421[70] = CFSTR("maxDistToPushDisparityEdgesFwd");
  v492 = &unk_1E6949D18;
  v421[71] = CFSTR("maxDistToPushDisparityEdgesRev");
  v493 = &unk_1E6949D18;
  v421[72] = CFSTR("disparityPushingBackgroundToForegroundDisparityDifference");
  v494 = &unk_1E6949D30;
  v421[73] = CFSTR("renderingDisparityUpdateRate");
  v495 = &unk_1E694A360;
  v421[74] = CFSTR("renderingDisparityBlurRadius");
  v345[0] = &unk_1E6949478;
  v345[1] = &unk_1E6949880;
  v346[0] = &unk_1E6949CA0;
  v346[1] = &unk_1E6949BF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v346, v345, 2);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v496 = v268;
  v421[75] = CFSTR("offsetNoiseBitCalculation");
  v343[0] = &unk_1E6949478;
  v343[1] = &unk_1E6949880;
  v344[0] = &unk_1E6949FD0;
  v344[1] = &unk_1E6949FE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v344, v343, 2);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v497 = v267;
  v421[76] = CFSTR("gainMultiplierNoiseBitCalculation");
  v341[0] = &unk_1E6949478;
  v341[1] = &unk_1E6949880;
  v342[0] = &unk_1E6949FF0;
  v342[1] = &unk_1E694A000;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v342, v341, 2);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v498 = v241;
  v421[77] = CFSTR("luxMultiplierNoiseBitCalculation");
  v339[0] = &unk_1E6949478;
  v339[1] = &unk_1E6949880;
  v340[0] = &unk_1E694A010;
  v340[1] = &unk_1E694A020;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v340, v339, 2);
  v38 = objc_claimAutoreleasedReturnValue();
  v421[78] = CFSTR("renderingLensFocalLength");
  v337[1] = &unk_1E69498C8;
  v337[4] = &unk_1E69494A8;
  v337[6] = &unk_1E6949508;
  v338[4] = &unk_1E694A060;
  v338[6] = &unk_1E694A060;
  v337[8] = &unk_1E6949550;
  v338[8] = &unk_1E694A060;
  v337[10] = &unk_1E6949970;
  v337[13] = &unk_1E69499B8;
  v338[0] = &unk_1E694A030;
  v338[1] = &unk_1E694A040;
  v338[2] = &unk_1E694A040;
  v338[3] = &unk_1E694A050;
  v338[5] = &unk_1E694A050;
  v338[7] = &unk_1E694A050;
  v337[15] = &unk_1E6949880;
  v338[28] = &unk_1E694A0B0;
  v338[16] = &unk_1E694A050;
  v338[17] = &unk_1E694A050;
  v338[18] = &unk_1E694A050;
  v338[21] = &unk_1E694A050;
  v338[22] = &unk_1E694A050;
  v338[23] = &unk_1E694A050;
  v338[29] = &unk_1E694A050;
  v338[26] = &unk_1E694A0A0;
  v337[30] = &unk_1E6949610;
  v338[30] = &unk_1E694A0C0;
  v338[38] = &unk_1E694A0A0;
  v338[34] = &unk_1E694A0D0;
  v338[39] = &unk_1E694A0D0;
  v338[13] = &unk_1E694A080;
  v338[10] = &unk_1E694A080;
  v338[20] = &unk_1E694A090;
  v338[11] = &unk_1E694A090;
  v338[14] = &unk_1E694A090;
  v338[15] = &unk_1E694A090;
  v338[24] = &unk_1E694A090;
  v338[27] = &unk_1E694A090;
  v338[31] = &unk_1E694A090;
  v338[32] = &unk_1E694A090;
  v338[35] = &unk_1E694A090;
  v338[37] = &unk_1E694A090;
  v338[40] = &unk_1E694A090;
  v337[2] = &unk_1E69498F8;
  v337[0] = &unk_1E6949478;
  v337[12] = &unk_1E69499A0;
  v338[12] = &unk_1E694A070;
  v337[14] = &unk_1E69499D0;
  v338[36] = &unk_1E694A070;
  v240 = (void *)v38;
  v499 = v38;
  v337[3] = &unk_1E6949910;
  v337[5] = &unk_1E69494D8;
  v337[7] = &unk_1E6949520;
  v337[9] = &unk_1E6949958;
  v338[9] = &unk_1E694A070;
  v337[11] = &unk_1E6949988;
  v337[16] = &unk_1E69499E8;
  v337[17] = &unk_1E6949A00;
  v337[18] = &unk_1E6949A30;
  v337[19] = &unk_1E6949A48;
  v338[19] = &unk_1E694A070;
  v337[20] = &unk_1E6949A60;
  v337[21] = &unk_1E6949A78;
  v337[22] = &unk_1E6949A90;
  v337[23] = &unk_1E6949580;
  v337[24] = &unk_1E69495B0;
  v337[25] = &unk_1E69495C8;
  v338[25] = &unk_1E694A070;
  v337[26] = &unk_1E69495E0;
  v337[27] = &unk_1E69495F8;
  v337[28] = &unk_1E6949AA8;
  v337[29] = &unk_1E6949AD8;
  v337[31] = &unk_1E6949628;
  v337[32] = &unk_1E6949640;
  v337[33] = &unk_1E6949658;
  v338[33] = &unk_1E694A070;
  v337[34] = &unk_1E6949670;
  v337[35] = &unk_1E6949688;
  v337[36] = &unk_1E69496A0;
  v337[37] = &unk_1E69496B8;
  v337[38] = &unk_1E69496D0;
  v337[39] = &unk_1E69496E8;
  v337[40] = &unk_1E6949700;
  v337[41] = &unk_1E6949718;
  v338[41] = &unk_1E694A070;
  v337[42] = &unk_1E69497A8;
  v338[42] = &unk_1E694A070;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v338, v337, 43);
  v39 = objc_claimAutoreleasedReturnValue();
  v421[79] = CFSTR("fNumberMultiplier");
  v335[0] = &unk_1E6949478;
  v335[1] = &unk_1E6949988;
  v266 = (void *)v39;
  v500 = v39;
  v336[0] = &unk_1E694A4B0;
  v336[1] = &unk_1E694A4C0;
  v335[2] = &unk_1E69499D0;
  v335[3] = &unk_1E6949A60;
  v336[2] = &unk_1E694A4C0;
  v336[3] = &unk_1E694A4C0;
  v335[4] = &unk_1E6949AA8;
  v335[5] = &unk_1E6949AD8;
  v336[4] = &unk_1E694A150;
  v336[5] = &unk_1E694A4D0;
  v335[6] = &unk_1E69495E0;
  v335[7] = &unk_1E69495F8;
  v336[6] = &unk_1E694A4C0;
  v336[7] = &unk_1E694A4C0;
  v335[8] = &unk_1E69495B0;
  v335[9] = &unk_1E6949628;
  v336[8] = &unk_1E694A4C0;
  v336[9] = &unk_1E694A4C0;
  v335[10] = &unk_1E6949688;
  v335[11] = &unk_1E6949640;
  v336[10] = &unk_1E694A4C0;
  v336[11] = &unk_1E694A4C0;
  v335[12] = &unk_1E6949670;
  v335[13] = &unk_1E69496B8;
  v336[12] = &unk_1E694A4C0;
  v336[13] = &unk_1E694A4C0;
  v335[14] = &unk_1E69496D0;
  v335[15] = &unk_1E69496E8;
  v336[14] = &unk_1E694A4C0;
  v336[15] = &unk_1E694A4C0;
  v335[16] = &unk_1E6949700;
  v335[17] = &unk_1E6949730;
  v336[16] = &unk_1E694A4C0;
  v336[17] = &unk_1E694A4C0;
  v335[18] = &unk_1E6949748;
  v335[19] = &unk_1E6949760;
  v336[18] = &unk_1E694A4C0;
  v336[19] = &unk_1E694A4C0;
  v335[20] = &unk_1E6949778;
  v335[21] = &unk_1E6949790;
  v336[20] = &unk_1E694A4C0;
  v336[21] = &unk_1E694A4C0;
  v335[22] = &unk_1E6949850;
  v336[22] = &unk_1E694A4C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v336, v335, 23);
  v40 = objc_claimAutoreleasedReturnValue();
  v421[80] = CFSTR("focusThresholdHardness");
  v421[81] = CFSTR("focusUpdateRateSlow");
  v333[18] = &unk_1E6949688;
  v333[19] = &unk_1E6949670;
  v333[20] = &unk_1E6949700;
  v333[21] = &unk_1E69496B8;
  v333[22] = &unk_1E69496D0;
  v333[23] = &unk_1E69496E8;
  v333[24] = &unk_1E6949730;
  v333[25] = &unk_1E6949748;
  v333[26] = &unk_1E6949760;
  v265 = (void *)v40;
  v501 = v40;
  v333[27] = &unk_1E6949778;
  v502 = &unk_1E694A0E0;
  v333[28] = &unk_1E6949790;
  v333[0] = &unk_1E6949478;
  v333[1] = &unk_1E6949910;
  v334[0] = &unk_1E694A4E0;
  v334[1] = &unk_1E694A370;
  v333[2] = &unk_1E69494D8;
  v333[3] = &unk_1E6949520;
  v334[2] = &unk_1E694A370;
  v334[3] = &unk_1E694A370;
  v333[4] = &unk_1E6949958;
  v333[5] = &unk_1E69499A0;
  v334[4] = &unk_1E694A370;
  v334[5] = &unk_1E694A370;
  v333[6] = &unk_1E69499E8;
  v333[7] = &unk_1E6949A00;
  v334[6] = &unk_1E694A370;
  v334[7] = &unk_1E694A370;
  v333[8] = &unk_1E6949A30;
  v333[9] = &unk_1E6949A48;
  v334[8] = &unk_1E694A370;
  v334[9] = &unk_1E694A370;
  v333[10] = &unk_1E6949A78;
  v333[11] = &unk_1E6949A90;
  v334[10] = &unk_1E694A370;
  v334[11] = &unk_1E694A370;
  v333[12] = &unk_1E6949580;
  v333[13] = &unk_1E69495C8;
  v334[12] = &unk_1E694A370;
  v334[13] = &unk_1E694A370;
  v333[14] = &unk_1E6949AD8;
  v333[15] = &unk_1E6949658;
  v334[14] = &unk_1E694A370;
  v334[15] = &unk_1E694A370;
  v333[16] = &unk_1E69496A0;
  v333[17] = &unk_1E6949718;
  v334[16] = &unk_1E694A370;
  v334[17] = &unk_1E694A370;
  v334[18] = &unk_1E694A390;
  v334[19] = &unk_1E694A390;
  v334[20] = &unk_1E694A390;
  v334[21] = &unk_1E694A390;
  v334[22] = &unk_1E694A390;
  v334[23] = &unk_1E694A390;
  v334[24] = &unk_1E694A390;
  v334[25] = &unk_1E694A390;
  v334[26] = &unk_1E694A390;
  v334[27] = &unk_1E694A390;
  v333[29] = &unk_1E69497A8;
  v334[28] = &unk_1E694A390;
  v334[29] = &unk_1E694A370;
  v333[30] = &unk_1E6949850;
  v333[31] = &unk_1E6949868;
  v334[30] = &unk_1E694A390;
  v334[31] = &unk_1E694A370;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v334, v333, 32);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v503 = v264;
  v421[82] = CFSTR("focusUpdateRateFast");
  v504 = &unk_1E694A0F0;
  v421[83] = CFSTR("maxFramesWithoutFace");
  v331[0] = &unk_1E6949478;
  v331[1] = &unk_1E6949910;
  v332[0] = &unk_1E69498B0;
  v332[1] = &unk_1E6949D18;
  v331[2] = &unk_1E69494D8;
  v331[3] = &unk_1E6949520;
  v332[2] = &unk_1E6949D18;
  v332[3] = &unk_1E6949D18;
  v331[4] = &unk_1E6949958;
  v331[5] = &unk_1E69499A0;
  v332[4] = &unk_1E6949D18;
  v332[5] = &unk_1E6949D18;
  v331[6] = &unk_1E69499E8;
  v331[7] = &unk_1E6949A00;
  v332[6] = &unk_1E6949D18;
  v332[7] = &unk_1E6949D18;
  v331[8] = &unk_1E6949A30;
  v331[9] = &unk_1E6949A48;
  v332[8] = &unk_1E6949D18;
  v332[9] = &unk_1E6949D18;
  v331[10] = &unk_1E6949A78;
  v331[11] = &unk_1E6949A90;
  v332[10] = &unk_1E6949D18;
  v332[11] = &unk_1E6949D18;
  v331[12] = &unk_1E6949580;
  v331[13] = &unk_1E69495C8;
  v332[12] = &unk_1E6949D18;
  v332[13] = &unk_1E6949D18;
  v331[14] = &unk_1E6949AD8;
  v331[15] = &unk_1E6949658;
  v332[14] = &unk_1E6949D18;
  v332[15] = &unk_1E6949D18;
  v331[16] = &unk_1E69496A0;
  v331[17] = &unk_1E6949718;
  v332[16] = &unk_1E6949D18;
  v332[17] = &unk_1E6949D18;
  v331[18] = &unk_1E69497A8;
  v331[19] = &unk_1E6949868;
  v332[18] = &unk_1E6949D18;
  v332[19] = &unk_1E6949D18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v332, v331, 20);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v505 = v239;
  v421[84] = CFSTR("faceSizeRatioInFocus");
  v506 = &unk_1E694A0E0;
  v421[85] = CFSTR("stageLightStateMachineIntensityIncrement");
  v507 = &unk_1E694A100;
  v421[86] = CFSTR("stageLightStageMachineMaxOrientationDifference");
  v508 = &unk_1E694A4F0;
  v421[87] = CFSTR("sdofStateMachineIntensityIncrement");
  v509 = &unk_1E694A100;
  v421[88] = CFSTR("sdofStateMachineMaxOrientationDifference");
  v510 = &unk_1E694A4F0;
  v421[89] = CFSTR("stableBackgroundDisparitySumVariance");
  v329[0] = &unk_1E6949478;
  v329[1] = &unk_1E6949910;
  v330[0] = &unk_1E694A500;
  v330[1] = &unk_1E694A460;
  v329[2] = &unk_1E69494D8;
  v329[3] = &unk_1E6949520;
  v330[2] = &unk_1E694A460;
  v330[3] = &unk_1E694A460;
  v329[4] = &unk_1E6949958;
  v329[5] = &unk_1E69499A0;
  v330[4] = &unk_1E694A460;
  v330[5] = &unk_1E694A460;
  v329[6] = &unk_1E69499E8;
  v329[7] = &unk_1E6949A00;
  v330[6] = &unk_1E694A460;
  v330[7] = &unk_1E694A460;
  v329[8] = &unk_1E6949A30;
  v329[9] = &unk_1E6949A48;
  v330[8] = &unk_1E694A460;
  v330[9] = &unk_1E694A460;
  v329[10] = &unk_1E6949A78;
  v329[11] = &unk_1E6949A90;
  v330[10] = &unk_1E694A460;
  v330[11] = &unk_1E694A460;
  v329[12] = &unk_1E6949580;
  v329[13] = &unk_1E69495C8;
  v330[12] = &unk_1E694A460;
  v330[13] = &unk_1E694A460;
  v329[14] = &unk_1E6949658;
  v329[15] = &unk_1E69496A0;
  v330[14] = &unk_1E694A460;
  v330[15] = &unk_1E694A460;
  v329[16] = &unk_1E6949718;
  v329[17] = &unk_1E69497A8;
  v330[16] = &unk_1E694A460;
  v330[17] = &unk_1E694A460;
  v329[18] = &unk_1E6949868;
  v330[18] = &unk_1E694A460;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v330, v329, 19);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v511 = v238;
  v421[90] = CFSTR("unstableBackgroundDisparitySumVariance");
  v327[0] = &unk_1E6949478;
  v327[1] = &unk_1E6949910;
  v328[0] = &unk_1E694A460;
  v328[1] = &unk_1E694A4E0;
  v327[2] = &unk_1E69494D8;
  v327[3] = &unk_1E6949520;
  v328[2] = &unk_1E694A4E0;
  v328[3] = &unk_1E694A4E0;
  v327[4] = &unk_1E6949958;
  v327[5] = &unk_1E69499A0;
  v328[4] = &unk_1E694A4E0;
  v328[5] = &unk_1E694A4E0;
  v327[6] = &unk_1E69499E8;
  v327[7] = &unk_1E6949A00;
  v328[6] = &unk_1E694A4E0;
  v328[7] = &unk_1E694A4E0;
  v327[8] = &unk_1E6949A30;
  v327[9] = &unk_1E6949A48;
  v328[8] = &unk_1E694A4E0;
  v328[9] = &unk_1E694A4E0;
  v327[10] = &unk_1E6949A78;
  v327[11] = &unk_1E6949A90;
  v328[10] = &unk_1E694A4E0;
  v328[11] = &unk_1E694A4E0;
  v327[12] = &unk_1E6949580;
  v327[13] = &unk_1E69495C8;
  v328[12] = &unk_1E694A4E0;
  v328[13] = &unk_1E694A4E0;
  v327[14] = &unk_1E6949658;
  v327[15] = &unk_1E69496A0;
  v328[14] = &unk_1E694A4E0;
  v328[15] = &unk_1E694A4E0;
  v327[16] = &unk_1E6949718;
  v327[17] = &unk_1E69497A8;
  v328[16] = &unk_1E694A4E0;
  v328[17] = &unk_1E694A4E0;
  v327[18] = &unk_1E6949868;
  v328[18] = &unk_1E694A4E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v328, v327, 19);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v512 = v263;
  v421[91] = CFSTR("stableInvalidDisparityRatio");
  v325[0] = &unk_1E6949478;
  v325[1] = &unk_1E6949910;
  v326[0] = &unk_1E694A390;
  v326[1] = &unk_1E694A160;
  v325[2] = &unk_1E69494D8;
  v325[3] = &unk_1E6949520;
  v326[2] = &unk_1E694A160;
  v326[3] = &unk_1E694A160;
  v325[4] = &unk_1E6949958;
  v325[5] = &unk_1E69499A0;
  v326[4] = &unk_1E694A160;
  v326[5] = &unk_1E694A160;
  v325[6] = &unk_1E69499E8;
  v325[7] = &unk_1E6949A00;
  v326[6] = &unk_1E694A160;
  v326[7] = &unk_1E694A160;
  v325[8] = &unk_1E6949A30;
  v325[9] = &unk_1E6949A48;
  v326[8] = &unk_1E694A160;
  v326[9] = &unk_1E694A160;
  v325[10] = &unk_1E6949A78;
  v325[11] = &unk_1E6949A90;
  v326[10] = &unk_1E694A160;
  v326[11] = &unk_1E694A160;
  v325[12] = &unk_1E6949580;
  v325[13] = &unk_1E69495C8;
  v326[12] = &unk_1E694A160;
  v326[13] = &unk_1E694A160;
  v325[14] = &unk_1E6949658;
  v325[15] = &unk_1E69496A0;
  v326[14] = &unk_1E694A160;
  v326[15] = &unk_1E694A160;
  v325[16] = &unk_1E6949718;
  v325[17] = &unk_1E69497A8;
  v326[16] = &unk_1E694A160;
  v326[17] = &unk_1E694A160;
  v325[18] = &unk_1E6949868;
  v326[18] = &unk_1E694A160;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v326, v325, 19);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v513 = v262;
  v421[92] = CFSTR("unstableInvalidDisparityRatio");
  v323[0] = &unk_1E6949478;
  v323[1] = &unk_1E6949910;
  v324[0] = &unk_1E694A3A0;
  v324[1] = &unk_1E694A140;
  v323[2] = &unk_1E69494D8;
  v323[3] = &unk_1E6949520;
  v324[2] = &unk_1E694A140;
  v324[3] = &unk_1E694A140;
  v323[4] = &unk_1E6949958;
  v323[5] = &unk_1E69499A0;
  v324[4] = &unk_1E694A140;
  v324[5] = &unk_1E694A140;
  v323[6] = &unk_1E69499E8;
  v323[7] = &unk_1E6949A00;
  v324[6] = &unk_1E694A140;
  v324[7] = &unk_1E694A140;
  v323[8] = &unk_1E6949A30;
  v323[9] = &unk_1E6949A48;
  v324[8] = &unk_1E694A140;
  v324[9] = &unk_1E694A140;
  v323[10] = &unk_1E6949A78;
  v323[11] = &unk_1E6949A90;
  v324[10] = &unk_1E694A140;
  v324[11] = &unk_1E694A140;
  v323[12] = &unk_1E6949580;
  v323[13] = &unk_1E69495C8;
  v324[12] = &unk_1E694A140;
  v324[13] = &unk_1E694A140;
  v323[14] = &unk_1E6949658;
  v323[15] = &unk_1E69496A0;
  v324[14] = &unk_1E694A140;
  v324[15] = &unk_1E694A140;
  v323[16] = &unk_1E6949718;
  v323[17] = &unk_1E69497A8;
  v324[16] = &unk_1E694A140;
  v324[17] = &unk_1E694A140;
  v323[18] = &unk_1E6949868;
  v324[18] = &unk_1E694A140;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v324, v323, 19);
  v514 = objc_claimAutoreleasedReturnValue();
  v421[93] = CFSTR("backgroundSeparationLikelihoodLow");
  v321[0] = &unk_1E6949478;
  v321[1] = &unk_1E6949910;
  v322[0] = &unk_1E694A3B0;
  v322[1] = &unk_1E694A150;
  v321[2] = &unk_1E69494D8;
  v321[3] = &unk_1E6949520;
  v322[2] = &unk_1E694A150;
  v322[3] = &unk_1E694A150;
  v321[4] = &unk_1E6949958;
  v321[5] = &unk_1E69499A0;
  v322[4] = &unk_1E694A150;
  v322[5] = &unk_1E694A150;
  v321[6] = &unk_1E69499E8;
  v321[7] = &unk_1E6949A00;
  v322[6] = &unk_1E694A150;
  v322[7] = &unk_1E694A150;
  v321[8] = &unk_1E6949A30;
  v321[9] = &unk_1E6949A48;
  v322[8] = &unk_1E694A150;
  v322[9] = &unk_1E694A150;
  v321[10] = &unk_1E6949A78;
  v321[11] = &unk_1E6949A90;
  v322[10] = &unk_1E694A150;
  v322[11] = &unk_1E694A150;
  v321[12] = &unk_1E6949580;
  v321[13] = &unk_1E69495C8;
  v322[12] = &unk_1E694A150;
  v322[13] = &unk_1E694A150;
  v321[14] = &unk_1E6949658;
  v321[15] = &unk_1E69496A0;
  v322[14] = &unk_1E694A150;
  v322[15] = &unk_1E694A150;
  v321[16] = &unk_1E6949718;
  v321[17] = &unk_1E69497A8;
  v322[16] = &unk_1E694A150;
  v322[17] = &unk_1E694A150;
  v321[18] = &unk_1E6949868;
  v322[18] = &unk_1E694A150;
  v261 = (void *)v514;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v322, v321, 19);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v515 = v41;
  v421[94] = CFSTR("backgroundSeparationLikelihoodHigh");
  v516 = &unk_1E694A110;
  v421[95] = CFSTR("depthQualityMetricFocalPlaneOffsetMeters");
  v517 = &unk_1E694A120;
  v421[96] = CFSTR("relightDisplayMode");
  v518 = &unk_1E69498B0;
  v421[97] = CFSTR("relightEffectStrength");
  v519 = &unk_1E694A0E0;
  v421[98] = CFSTR("portraitStyleStrengthOverride");
  v520 = &unk_1E6949F90;
  v421[99] = CFSTR("focusDistanceOverride");
  v521 = &unk_1E6949F90;
  v421[100] = CFSTR("modulateFocalRatio");
  v522 = MEMORY[0x1E0C9AAA0];
  v421[101] = CFSTR("guidedFilterWidth");
  v319[0] = &unk_1E6949478;
  v319[1] = &unk_1E6949850;
  v320[0] = &unk_1E6949AC0;
  v320[1] = &unk_1E6949AF0;
  v319[2] = &unk_1E6949868;
  v320[2] = &unk_1E6949AF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v320, v319, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v523 = v42;
  v421[102] = CFSTR("guidedFilterHeight");
  v317[0] = &unk_1E6949478;
  v317[1] = &unk_1E6949850;
  v318[0] = &unk_1E6949AF0;
  v318[1] = &unk_1E6949D48;
  v317[2] = &unk_1E6949868;
  v318[2] = &unk_1E6949D48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v318, v317, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v524 = v43;
  v421[103] = CFSTR("proxyToFaceEffectLerpNumFrames");
  v315 = &unk_1E6949478;
  v316 = &unk_1E6949C88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v316, &v315, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v525 = v44;
  v421[104] = CFSTR("segmentationBinarizationThreshold");
  v313[0] = &unk_1E6949478;
  v313[1] = &unk_1E6949AA8;
  v314[0] = &unk_1E6949F90;
  v314[1] = &unk_1E6949CD0;
  v313[2] = &unk_1E6949AD8;
  v314[2] = &unk_1E6949CD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v314, v313, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v526 = v45;
  v421[105] = CFSTR("depthErosionRadius");
  v311[0] = &unk_1E6949478;
  v311[1] = &unk_1E6949AA8;
  v312[0] = &unk_1E6949F90;
  v312[1] = &unk_1E6949D60;
  v311[2] = &unk_1E6949AD8;
  v312[2] = &unk_1E6949D60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v312, v311, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v527 = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v422, v421, 106);
  v304 = (id)objc_claimAutoreleasedReturnValue();

  v303[0] = &v306;
  v303[1] = &v304;
  v303[2] = &v310;
  v47 = v308;
  if (!v308)
  {
LABEL_65:
    v57 = 0;
    goto LABEL_79;
  }
  while (1)
  {
    v48 = v47[4];
    if (v310 < v48)
      goto LABEL_58;
    if (v48 >= v310)
      break;
    ++v47;
LABEL_58:
    v47 = (_QWORD *)*v47;
    if (!v47)
      goto LABEL_65;
  }
  v302->_videoPipelineDevice = v310;
  sub_1B5673B10((uint64_t)v303, CFSTR("colorPixelBufferWidth"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_colorPixelBufferWidth = (int)objc_msgSend(v49, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("colorPixelBufferHeight"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_colorPixelBufferHeight = (int)objc_msgSend(v50, "intValue");

  objc_msgSend(v304, "objectForKeyedSubscript:", CFSTR("supportedColorPixelBufferPixelFormats"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v51)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_71:
      v56 = 0;
      goto LABEL_78;
    }
    *(_DWORD *)buf = 138412290;
    v529 = CFSTR("supportedColorPixelBufferPixelFormats");
    v58 = MEMORY[0x1E0C81028];
    v59 = "No value for parameter %@";
    v60 = 12;
LABEL_81:
    _os_log_error_impl(&dword_1B5656000, v58, OS_LOG_TYPE_ERROR, v59, buf, v60);
    v56 = 0;
    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = v51;
      goto LABEL_78;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    *(_WORD *)buf = 0;
    v58 = MEMORY[0x1E0C81028];
    v59 = "Unknown parameter type";
    v60 = 2;
    goto LABEL_81;
  }
  v52 = v51;
  objc_msgSend(v52, "objectForKeyedSubscript:", &unk_1E6949478);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v310);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    v56 = v55;
  }
  else if (v53)
  {
    v56 = v53;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v529 = CFSTR("supportedColorPixelBufferPixelFormats");
      _os_log_error_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No value for parameter %@", buf, 0xCu);
    }
    v56 = 0;
  }

LABEL_78:
  supportedColorPixelBufferPixelFormats = v302->_supportedColorPixelBufferPixelFormats;
  v302->_supportedColorPixelBufferPixelFormats = v56;

  sub_1B5673B10((uint64_t)v303, CFSTR("colorPixelBufferFocalLength_mm"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "floatValue");
  v302->_colorPixelBufferFocalLength_mm = v63;

  sub_1B5673B10((uint64_t)v303, CFSTR("colorPixelBufferPixelSize_um"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "floatValue");
  v302->_colorPixelBufferPixelSize_um = v65;

  sub_1B5673B10((uint64_t)v303, CFSTR("colorPixelBufferFocalRatio"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "floatValue");
  v302->_colorPixelBufferFocalRatio = v67;

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaMattePixelBufferWidth"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_alphaMattePixelBufferWidth = (int)objc_msgSend(v68, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaMattePixelBufferHeight"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_alphaMattePixelBufferHeight = (int)objc_msgSend(v69, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaMattePixelBufferPixelFormat"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_alphaMattePixelBufferPixelFormat = objc_msgSend(v70, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("inputDisparityPixelBufferWidth"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_inputDisparityPixelBufferWidth = (int)objc_msgSend(v71, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("inputDisparityPixelBufferHeight"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_inputDisparityPixelBufferHeight = (int)objc_msgSend(v72, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("outputDisparityPixelBufferWidth"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_outputDisparityPixelBufferWidth = (int)objc_msgSend(v73, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("outputDisparityPixelBufferHeight"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_outputDisparityPixelBufferHeight = (int)objc_msgSend(v74, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("outputDisparityOffset"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "floatValue");
  v302->_outputDisparityOffset = v76;

  sub_1B5673B10((uint64_t)v303, CFSTR("inputToOutputDisparityPixelBufferRotation"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_inputToOutputDisparityPixelBufferRotation = (int)objc_msgSend(v77, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("sceneMonitorUsesDisparityStatistics"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_sceneMonitorUsesDisparityStatistics = objc_msgSend(v78, "BOOLValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("inputDisparityPixelBufferPixelFormat"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_inputDisparityPixelBufferPixelFormat = objc_msgSend(v79, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("outputDisparityPixelBufferPixelFormat"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_outputDisparityPixelBufferPixelFormat = objc_msgSend(v80, "intValue");

  objc_msgSend(v304, "objectForKeyedSubscript:", CFSTR("supportedInputSegmentationPixelBufferPixelFormats"));
  v81 = objc_claimAutoreleasedReturnValue();
  supportedInputSegmentationPixelBufferPixelFormats = v302->_supportedInputSegmentationPixelBufferPixelFormats;
  v302->_supportedInputSegmentationPixelBufferPixelFormats = (NSArray *)v81;

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferXPadding"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_depthPixelBufferXPadding = objc_msgSend(v83, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferYPadding"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_depthPixelBufferYPadding = objc_msgSend(v84, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferXReplication"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_depthPixelBufferXReplication = objc_msgSend(v85, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferYReplication"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_depthPixelBufferYReplication = objc_msgSend(v86, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferScale"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "floatValue");
  v302->_depthPixelBufferScale = v88;

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferOffset"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "floatValue");
  v302->_depthPixelBufferOffset = v90;

  sub_1B5673B10((uint64_t)v303, CFSTR("disparityStereoFocalLengthPixels"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "floatValue");
  v302->_disparityStereoFocalLengthPixels = v92;

  sub_1B5673B10((uint64_t)v303, CFSTR("disparityStereoBaselineMeters"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "floatValue");
  v302->_disparityStereoBaselineMeters = v94;

  sub_1B5673B10((uint64_t)v303, CFSTR("canSkipDisparityHoleFillingAndTemporalRejection"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_canSkipDisparityHoleFillingAndTemporalRejection = objc_msgSend(v95, "BOOLValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("supportsForegroundBlur"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_supportsForegroundBlur = objc_msgSend(v96, "BOOLValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferMaxLeftOcclusionDisparityChange"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "floatValue");
  v302->_depthPixelBufferMaxLeftOcclusionDisparityChange = v98;

  sub_1B5673B10((uint64_t)v303, CFSTR("depthPixelBufferMaxRightOcclusionDisparityChange"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "floatValue");
  v302->_depthPixelBufferMaxRightOcclusionDisparityChange = v100;

  sub_1B5673B10((uint64_t)v303, CFSTR("backgroundDisparityUpdateRate"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "floatValue");
  v302->_backgroundDisparityUpdateRate = v102;

  sub_1B5673B10((uint64_t)v303, CFSTR("invalidDisparityRatioUpdateRate"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "floatValue");
  v302->_invalidDisparityRatioUpdateRate = v104;

  sub_1B5673B10((uint64_t)v303, CFSTR("backgroundDisparityStatsWindowSize"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_backgroundDisparityStatsWindowSize = objc_msgSend(v105, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("invalidDisparityRatioStatsWindowSize"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_invalidDisparityRatioStatsWindowSize = objc_msgSend(v106, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("minDeltaCanonicalDisparity"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "floatValue");
  v302->_minDeltaCanonicalDisparity = v108;

  sub_1B5673B10((uint64_t)v303, CFSTR("maxDeltaCanonicalDisparity"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "floatValue");
  v302->_maxDeltaCanonicalDisparity = v110;

  sub_1B5673B10((uint64_t)v303, CFSTR("centerDeltaCanonicalDisparity"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "floatValue");
  v302->_centerDeltaCanonicalDisparity = v112;

  sub_1B5673B10((uint64_t)v303, CFSTR("dsCanonicalLowThld"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "floatValue");
  v302->_dsCanonicalLowThld = v114;

  sub_1B5673B10((uint64_t)v303, CFSTR("dsCanonicalLowScale"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "floatValue");
  v302->_dsCanonicalLowScale = v116;

  sub_1B5673B10((uint64_t)v303, CFSTR("dsCanonicalHighThld"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "floatValue");
  v302->_dsCanonicalHighThld = v118;

  sub_1B5673B10((uint64_t)v303, CFSTR("linearDeltaDepthMultiplier"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "floatValue");
  v302->_linearDeltaDepthMultiplier = v120;

  sub_1B5673B10((uint64_t)v303, CFSTR("linearDeltaDepthOffset"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "floatValue");
  v302->_linearDeltaDepthOffset = v122;

  sub_1B5673B10((uint64_t)v303, CFSTR("dsCanonicalHighScale"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "floatValue");
  v302->_dsCanonicalHighScale = v124;

  sub_1B5673B10((uint64_t)v303, CFSTR("foregroundPercentile"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "floatValue");
  v302->_foregroundPercentile = v126;

  sub_1B5673B10((uint64_t)v303, CFSTR("closeDisparityPercentile"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "floatValue");
  v302->_closeDisparityPercentile = v128;

  sub_1B5673B10((uint64_t)v303, CFSTR("deltaDepth"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "floatValue");
  v302->_deltaDepth = v130;

  sub_1B5673B10((uint64_t)v303, CFSTR("mattingUpdateRate"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "floatValue");
  v302->_mattingUpdateRate = v132;

  sub_1B5673B10((uint64_t)v303, CFSTR("mattingUpdateRateFast"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "floatValue");
  v302->_mattingUpdateRateFast = v134;

  sub_1B5673B10((uint64_t)v303, CFSTR("guidedFilterUnconfidentWeight"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "floatValue");
  v302->_guidedFilterUnconfidentWeight = v136;

  sub_1B5673B10((uint64_t)v303, CFSTR("guidedFilterMinDistToDeweight"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "floatValue");
  v302->_guidedFilterMinDistToDeweight = v138;

  sub_1B5673B10((uint64_t)v303, CFSTR("foregroundMaskDilationRadius"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "floatValue");
  v302->_foregroundMaskDilationRadius = v140;

  sub_1B5673B10((uint64_t)v303, CFSTR("infConvolutionDownsampling"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "floatValue");
  v302->_infConvolutionDownsampling = v142;

  sub_1B5673B10((uint64_t)v303, CFSTR("laplacianLimitingDownsampling"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "floatValue");
  v302->_laplacianLimitingDownsampling = v144;

  sub_1B5673B10((uint64_t)v303, CFSTR("laplacianLimitingBlurSize"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "floatValue");
  v302->_laplacianLimitingBlurSize = v146;

  sub_1B5673B10((uint64_t)v303, CFSTR("referenceDisparity"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "floatValue");
  v302->_referenceDisparity = v148;

  sub_1B5673B10((uint64_t)v303, CFSTR("deltaCanonicalDisparity"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "floatValue");
  v302->_deltaCanonicalDisparity = v150;

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaCoeffFilterColorStd"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "floatValue");
  v302->_alphaCoeffFilterColorStd = v152;

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaCoeffFilterColorStdFast"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "floatValue");
  v302->_alphaCoeffFilterColorStdFast = v154;

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaMaxLaplacian"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "floatValue");
  v302->_alphaMaxLaplacian = v156;

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaContrastExponent"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "floatValue");
  v302->_alphaContrastExponent = v158;

  sub_1B5673B10((uint64_t)v303, CFSTR("alphaGammaExponent"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "floatValue");
  v302->_alphaGammaExponent = v160;

  sub_1B5673B10((uint64_t)v303, CFSTR("disparityFilterColorStd"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "floatValue");
  v302->_disparityFilterColorStd = v162;

  sub_1B5673B10((uint64_t)v303, CFSTR("disparityFilterUpdateRate"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "floatValue");
  v302->_disparityFilterUpdateRate = v164;

  sub_1B5673B10((uint64_t)v303, CFSTR("minimumConfidenceToKeepDisparity"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "floatValue");
  v302->_minimumConfidenceToKeepDisparity = v166;

  sub_1B5673B10((uint64_t)v303, CFSTR("maximumSimilarityToKeepDisparity"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "floatValue");
  v302->_maximumSimilarityToKeepDisparity = v168;

  sub_1B5673B10((uint64_t)v303, CFSTR("maxDisparityFillingInconsistency"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "floatValue");
  v302->_maxDisparityFillingInconsistency = v170;

  sub_1B5673B10((uint64_t)v303, CFSTR("maxDisparityFillingDistFromForeground"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "floatValue");
  v302->_maxDisparityFillingDistFromForeground = v172;

  sub_1B5673B10((uint64_t)v303, CFSTR("maxDistToPushDisparityEdgesFwd"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_maxDistToPushDisparityEdgesFwd = objc_msgSend(v173, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("maxDistToPushDisparityEdgesRev"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_maxDistToPushDisparityEdgesRev = objc_msgSend(v174, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("disparityPushingBackgroundToForegroundDisparityDifference"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_disparityPushingBackgroundToForegroundDisparityDifference = objc_msgSend(v175, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("renderingDisparityUpdateRate"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "floatValue");
  v302->_renderingDisparityUpdateRate = v177;

  sub_1B5673B10((uint64_t)v303, CFSTR("renderingDisparityBlurRadius"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "floatValue");
  v302->_renderingDisparityBlurRadius = v179;

  sub_1B5673B10((uint64_t)v303, CFSTR("offsetNoiseBitCalculation"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "floatValue");
  v302->_offsetNoiseBitCalculation = v181;

  sub_1B5673B10((uint64_t)v303, CFSTR("gainMultiplierNoiseBitCalculation"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "floatValue");
  v302->_gainMultiplierNoiseBitCalculation = v183;

  sub_1B5673B10((uint64_t)v303, CFSTR("luxMultiplierNoiseBitCalculation"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "floatValue");
  v302->_luxMultiplierNoiseBitCalculation = v185;

  sub_1B5673B10((uint64_t)v303, CFSTR("renderingLensFocalLength"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "floatValue");
  v302->_renderingLensFocalLength = v187;

  sub_1B5673B10((uint64_t)v303, CFSTR("fNumberMultiplier"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "floatValue");
  v302->_fNumberMultiplier = v189;

  sub_1B5673B10((uint64_t)v303, CFSTR("focusThresholdHardness"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "floatValue");
  v302->_focusThresholdHardness = v191;

  sub_1B5673B10((uint64_t)v303, CFSTR("focusUpdateRateSlow"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "floatValue");
  v302->_focusUpdateRateSlow = v193;

  sub_1B5673B10((uint64_t)v303, CFSTR("focusUpdateRateFast"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "floatValue");
  v302->_focusUpdateRateFast = v195;

  sub_1B5673B10((uint64_t)v303, CFSTR("maxFramesWithoutFace"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_maxFramesWithoutFace = objc_msgSend(v196, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("faceSizeRatioInFocus"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "floatValue");
  v302->_faceSizeRatioInFocus = v198;

  sub_1B5673B10((uint64_t)v303, CFSTR("stageLightStateMachineIntensityIncrement"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "floatValue");
  v302->_stageLightStateMachineIntensityIncrement = v200;

  sub_1B5673B10((uint64_t)v303, CFSTR("stageLightStageMachineMaxOrientationDifference"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "doubleValue");
  v302->_stageLightStageMachineMaxOrientationDifference = v202;

  sub_1B5673B10((uint64_t)v303, CFSTR("sdofStateMachineIntensityIncrement"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "floatValue");
  v302->_sdofStateMachineIntensityIncrement = v204;

  sub_1B5673B10((uint64_t)v303, CFSTR("sdofStateMachineMaxOrientationDifference"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "doubleValue");
  v302->_sdofStateMachineMaxOrientationDifference = v206;

  sub_1B5673B10((uint64_t)v303, CFSTR("stableBackgroundDisparitySumVariance"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "floatValue");
  v302->_stableBackgroundDisparitySumVariance = v208;

  sub_1B5673B10((uint64_t)v303, CFSTR("unstableBackgroundDisparitySumVariance"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "floatValue");
  v302->_unstableBackgroundDisparitySumVariance = v210;

  sub_1B5673B10((uint64_t)v303, CFSTR("stableInvalidDisparityRatio"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "floatValue");
  v302->_stableInvalidDisparityRatio = v212;

  sub_1B5673B10((uint64_t)v303, CFSTR("unstableInvalidDisparityRatio"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "floatValue");
  v302->_unstableInvalidDisparityRatio = v214;

  sub_1B5673B10((uint64_t)v303, CFSTR("backgroundSeparationLikelihoodLow"));
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "floatValue");
  v302->_backgroundSeparationLikelihoodLow = v216;

  sub_1B5673B10((uint64_t)v303, CFSTR("backgroundSeparationLikelihoodHigh"));
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "floatValue");
  v302->_backgroundSeparationLikelihoodHigh = v218;

  sub_1B5673B10((uint64_t)v303, CFSTR("depthQualityMetricFocalPlaneOffsetMeters"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "floatValue");
  v302->_depthQualityMetricFocalPlaneOffsetMeters = v220;

  sub_1B5673B10((uint64_t)v303, CFSTR("relightDisplayMode"));
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_relightDisplayMode = objc_msgSend(v221, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("relightEffectStrength"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "floatValue");
  v302->_relightEffectStrength = v223;

  sub_1B5673B10((uint64_t)v303, CFSTR("portraitStyleStrengthOverride"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "floatValue");
  v302->_portraitStyleStrengthOverride = v225;

  sub_1B5673B10((uint64_t)v303, CFSTR("focusDistanceOverride"));
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "floatValue");
  v302->_focusDistanceOverride = v227;

  sub_1B5673B10((uint64_t)v303, CFSTR("modulateFocalRatio"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_modulateFocalRatio = objc_msgSend(v228, "BOOLValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("focusStatisticsXTileCount"));
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_focusStatisticsXTileCount = (int)objc_msgSend(v229, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("focusStatisticsYTileCount"));
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_focusStatisticsYTileCount = (int)objc_msgSend(v230, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("guidedFilterWidth"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_guidedFilterWidth = objc_msgSend(v231, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("guidedFilterHeight"));
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_guidedFilterHeight = objc_msgSend(v232, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("rawShiftInvalidThreshold"));
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_rawShiftInvalidThreshold = objc_msgSend(v233, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("proxyToFaceEffectLerpNumFrames"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_proxyToFaceEffectLerpNumFrames = objc_msgSend(v234, "unsignedIntValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("segmentationBinarizationThreshold"));
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_segmentationBinarizationThreshold = objc_msgSend(v235, "intValue");

  sub_1B5673B10((uint64_t)v303, CFSTR("depthErosionRadius"));
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v302->_depthErosionRadius = objc_msgSend(v236, "intValue");

  v57 = v302;
LABEL_79:

  sub_1B5673DF4(v308);
  return v57;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  unint64_t inputToOutputDisparityPixelBufferRotation;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 360) = self->_colorPixelBufferWidth;
  *(_QWORD *)(v4 + 368) = self->_colorPixelBufferHeight;
  objc_storeStrong((id *)(v4 + 376), self->_supportedColorPixelBufferPixelFormats);
  *(float *)(v4 + 12) = self->_colorPixelBufferFocalLength_mm;
  *(float *)(v4 + 16) = self->_colorPixelBufferPixelSize_um;
  *(float *)(v4 + 20) = self->_colorPixelBufferFocalRatio;
  *(_QWORD *)(v4 + 384) = self->_alphaMattePixelBufferWidth;
  *(_QWORD *)(v4 + 392) = self->_alphaMattePixelBufferHeight;
  *(_DWORD *)(v4 + 24) = self->_alphaMattePixelBufferPixelFormat;
  *(_QWORD *)(v4 + 400) = self->_inputDisparityPixelBufferWidth;
  *(_QWORD *)(v4 + 408) = self->_inputDisparityPixelBufferHeight;
  *(_QWORD *)(v4 + 416) = self->_outputDisparityPixelBufferWidth;
  *(float *)(v4 + 28) = self->_outputDisparityOffset;
  inputToOutputDisparityPixelBufferRotation = self->_inputToOutputDisparityPixelBufferRotation;
  *(_QWORD *)(v4 + 424) = self->_outputDisparityPixelBufferHeight;
  *(_QWORD *)(v4 + 432) = inputToOutputDisparityPixelBufferRotation;
  *(_BYTE *)(v4 + 8) = self->_sceneMonitorUsesDisparityStatistics;
  *(_DWORD *)(v4 + 32) = self->_inputDisparityPixelBufferPixelFormat;
  *(_DWORD *)(v4 + 36) = self->_outputDisparityPixelBufferPixelFormat;
  objc_storeStrong((id *)(v4 + 440), self->_supportedInputSegmentationPixelBufferPixelFormats);
  *(_QWORD *)(v4 + 448) = self->_videoPipelineDevice;
  *(_DWORD *)(v4 + 40) = self->_depthPixelBufferXPadding;
  *(_DWORD *)(v4 + 44) = self->_depthPixelBufferYPadding;
  *(_DWORD *)(v4 + 48) = self->_depthPixelBufferXReplication;
  *(_DWORD *)(v4 + 52) = self->_depthPixelBufferYReplication;
  *(float *)(v4 + 56) = self->_depthPixelBufferScale;
  *(float *)(v4 + 60) = self->_depthPixelBufferOffset;
  *(float *)(v4 + 64) = self->_disparityStereoFocalLengthPixels;
  *(float *)(v4 + 68) = self->_disparityStereoBaselineMeters;
  *(_BYTE *)(v4 + 9) = self->_canSkipDisparityHoleFillingAndTemporalRejection;
  *(_BYTE *)(v4 + 10) = self->_supportsForegroundBlur;
  *(float *)(v4 + 72) = self->_depthPixelBufferMaxLeftOcclusionDisparityChange;
  *(float *)(v4 + 76) = self->_depthPixelBufferMaxRightOcclusionDisparityChange;
  *(float *)(v4 + 80) = self->_backgroundDisparityUpdateRate;
  *(float *)(v4 + 84) = self->_invalidDisparityRatioUpdateRate;
  *(_DWORD *)(v4 + 88) = self->_backgroundDisparityStatsWindowSize;
  *(_DWORD *)(v4 + 92) = self->_invalidDisparityRatioStatsWindowSize;
  *(float *)(v4 + 96) = self->_minDeltaCanonicalDisparity;
  *(float *)(v4 + 100) = self->_maxDeltaCanonicalDisparity;
  *(float *)(v4 + 104) = self->_centerDeltaCanonicalDisparity;
  *(float *)(v4 + 108) = self->_dsCanonicalLowThld;
  *(float *)(v4 + 112) = self->_dsCanonicalLowScale;
  *(float *)(v4 + 116) = self->_dsCanonicalHighThld;
  *(float *)(v4 + 120) = self->_linearDeltaDepthMultiplier;
  *(float *)(v4 + 124) = self->_linearDeltaDepthOffset;
  *(float *)(v4 + 128) = self->_dsCanonicalHighScale;
  *(float *)(v4 + 132) = self->_foregroundPercentile;
  *(float *)(v4 + 136) = self->_closeDisparityPercentile;
  *(float *)(v4 + 140) = self->_deltaDepth;
  *(float *)(v4 + 144) = self->_mattingUpdateRate;
  *(float *)(v4 + 148) = self->_mattingUpdateRateFast;
  *(float *)(v4 + 152) = self->_guidedFilterUnconfidentWeight;
  *(float *)(v4 + 156) = self->_guidedFilterMinDistToDeweight;
  *(float *)(v4 + 272) = self->_foregroundMaskDilationRadius;
  *(float *)(v4 + 276) = self->_infConvolutionDownsampling;
  *(float *)(v4 + 280) = self->_laplacianLimitingDownsampling;
  *(float *)(v4 + 284) = self->_laplacianLimitingBlurSize;
  *(float *)(v4 + 160) = self->_referenceDisparity;
  *(float *)(v4 + 164) = self->_deltaCanonicalDisparity;
  *(float *)(v4 + 168) = self->_alphaCoeffFilterColorStd;
  *(float *)(v4 + 172) = self->_alphaCoeffFilterColorStdFast;
  *(float *)(v4 + 176) = self->_alphaMaxLaplacian;
  *(float *)(v4 + 180) = self->_alphaContrastExponent;
  *(float *)(v4 + 184) = self->_alphaGammaExponent;
  *(float *)(v4 + 188) = self->_disparityFilterColorStd;
  *(float *)(v4 + 192) = self->_disparityFilterUpdateRate;
  *(float *)(v4 + 196) = self->_minimumConfidenceToKeepDisparity;
  *(float *)(v4 + 200) = self->_maximumSimilarityToKeepDisparity;
  *(float *)(v4 + 204) = self->_maxDisparityFillingInconsistency;
  *(float *)(v4 + 208) = self->_maxDisparityFillingDistFromForeground;
  *(_DWORD *)(v4 + 212) = self->_maxDistToPushDisparityEdgesFwd;
  *(_DWORD *)(v4 + 216) = self->_maxDistToPushDisparityEdgesRev;
  *(_DWORD *)(v4 + 220) = self->_disparityPushingBackgroundToForegroundDisparityDifference;
  *(float *)(v4 + 224) = self->_renderingDisparityUpdateRate;
  *(float *)(v4 + 228) = self->_renderingDisparityBlurRadius;
  *(float *)(v4 + 232) = self->_offsetNoiseBitCalculation;
  *(float *)(v4 + 236) = self->_gainMultiplierNoiseBitCalculation;
  *(float *)(v4 + 240) = self->_luxMultiplierNoiseBitCalculation;
  *(float *)(v4 + 244) = self->_renderingLensFocalLength;
  *(float *)(v4 + 248) = self->_fNumberMultiplier;
  *(float *)(v4 + 252) = self->_focusThresholdHardness;
  *(float *)(v4 + 256) = self->_focusUpdateRateSlow;
  *(float *)(v4 + 260) = self->_focusUpdateRateFast;
  *(_DWORD *)(v4 + 264) = self->_maxFramesWithoutFace;
  *(float *)(v4 + 268) = self->_faceSizeRatioInFocus;
  *(_DWORD *)(v4 + 288) = self->_relightDisplayMode;
  objc_storeStrong((id *)(v4 + 456), self->_faceKitProcessOutputOverride);
  *(float *)(v4 + 292) = self->_relightEffectStrength;
  *(float *)(v4 + 296) = self->_portraitStyleStrengthOverride;
  *(float *)(v4 + 300) = self->_focusDistanceOverride;
  *(float *)(v4 + 304) = self->_stageLightStateMachineIntensityIncrement;
  *(double *)(v4 + 464) = self->_stageLightStageMachineMaxOrientationDifference;
  *(float *)(v4 + 308) = self->_sdofStateMachineIntensityIncrement;
  *(double *)(v4 + 472) = self->_sdofStateMachineMaxOrientationDifference;
  *(_BYTE *)(v4 + 11) = self->_modulateFocalRatio;
  *(float *)(v4 + 312) = self->_stableBackgroundDisparitySumVariance;
  *(float *)(v4 + 316) = self->_unstableBackgroundDisparitySumVariance;
  *(float *)(v4 + 320) = self->_stableInvalidDisparityRatio;
  *(float *)(v4 + 324) = self->_unstableInvalidDisparityRatio;
  *(float *)(v4 + 332) = self->_backgroundSeparationLikelihoodLow;
  *(float *)(v4 + 328) = self->_backgroundSeparationLikelihoodHigh;
  *(float *)(v4 + 336) = self->_depthQualityMetricFocalPlaneOffsetMeters;
  *(_QWORD *)(v4 + 480) = self->_focusStatisticsXTileCount;
  *(_QWORD *)(v4 + 488) = self->_focusStatisticsYTileCount;
  *(_DWORD *)(v4 + 348) = self->_guidedFilterWidth;
  *(_DWORD *)(v4 + 352) = self->_guidedFilterHeight;
  *(_QWORD *)(v4 + 496) = self->_proxyToFaceEffectLerpNumFrames;
  *(_DWORD *)(v4 + 356) = self->_rawShiftInvalidThreshold;
  *(_DWORD *)(v4 + 340) = self->_segmentationBinarizationThreshold;
  *(_DWORD *)(v4 + 344) = self->_depthErosionRadius;
  return (id)v4;
}

- (BOOL)validateWithError:(id *)a3
{
  float centerDeltaCanonicalDisparity;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t outputDisparityPixelBufferHeight;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t outputDisparityPixelBufferWidth;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t depthPixelBufferXReplication;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t depthPixelBufferYReplication;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t depthPixelBufferXPadding;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t depthPixelBufferYPadding;
  _BOOL8 v38;
  void *v39;
  void *v40;
  void *v41;

  centerDeltaCanonicalDisparity = self->_centerDeltaCanonicalDisparity;
  v6 = self->_minDeltaCanonicalDisparity <= centerDeltaCanonicalDisparity
    && centerDeltaCanonicalDisparity <= self->_maxDeltaCanonicalDisparity;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected centerDeltaCanonicalDisparity <= centerDeltaCanonicalDisparity <= maxDeltaCanonicalDisparity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1558, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(!v6, a3, 0, 4294944393, v9);

  if (!v6)
    return 0;
  outputDisparityPixelBufferHeight = self->_outputDisparityPixelBufferHeight;
  v11 = 400;
  if ((self->_inputToOutputDisparityPixelBufferRotation & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v12 = 408;
  else
    v12 = 400;
  v13 = *(uint64_t *)((char *)&self->super.isa + v12);
  if ((self->_inputToOutputDisparityPixelBufferRotation & 0xFFFFFFFFFFFFFFFDLL) != 1)
    v11 = 408;
  v14 = *(uint64_t *)((char *)&self->super.isa + v11);
  outputDisparityPixelBufferWidth = self->_outputDisparityPixelBufferWidth;
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input/output disparity pixel buffers must have the same aspect ratio: %zu x %zu != %zu x %zu"), v13, outputDisparityPixelBufferHeight, v14, outputDisparityPixelBufferWidth);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1580, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = outputDisparityPixelBufferHeight * v13;
  v20 = outputDisparityPixelBufferWidth * v14;
  sub_1B5658D40(v19 != v20, a3, 0, 4294944393, v18);

  if (v19 != v20)
    return 0;
  depthPixelBufferXReplication = self->_depthPixelBufferXReplication;
  v22 = self->_outputDisparityPixelBufferWidth;
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outputDisparityPixelBufferWidth not in [2 + depthPixelBufferXReplication, inf)"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1594, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  depthPixelBufferXReplication += 2;
  sub_1B5658D40(v22 < depthPixelBufferXReplication, a3, 0, 4294944393, v25);

  if (v22 < depthPixelBufferXReplication)
    return 0;
  depthPixelBufferYReplication = self->_depthPixelBufferYReplication;
  v27 = self->_outputDisparityPixelBufferHeight;
  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outputDisparityPixelBufferHeight not in [2 + depthPixelBufferYReplication, inf)"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1608, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  depthPixelBufferYReplication += 2;
  sub_1B5658D40(v27 < depthPixelBufferYReplication, a3, 0, 4294944393, v30);

  if (v27 < depthPixelBufferYReplication)
    return 0;
  if (sub_1B5669B50(self->_videoPipelineDevice) == 2)
    return 1;
  depthPixelBufferXPadding = self->_depthPixelBufferXPadding;
  v33 = (depthPixelBufferXPadding & 0x80000000) != 0
     || (unint64_t)(self->_inputDisparityPixelBufferWidth <= depthPixelBufferXPadding);
  v34 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("depthPixelBufferXPadding not in [0, inputDisparityPixelBufferWidth)"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1623, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v33, a3, 0, 4294944393, v36);

  if (v33)
    return 0;
  depthPixelBufferYPadding = self->_depthPixelBufferYPadding;
  v38 = (depthPixelBufferYPadding & 0x80000000) != 0
     || (unint64_t)(self->_inputDisparityPixelBufferHeight <= depthPixelBufferYPadding);
  v39 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("depthPixelBufferYPadding not in [0, inputDisparityPixelBufferHeight)"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1635, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v38, a3, 0, 4294944393, v41);

  return !v38;
}

- (unint64_t)colorPixelBufferWidth
{
  return self->_colorPixelBufferWidth;
}

- (void)setColorPixelBufferWidth:(unint64_t)a3
{
  self->_colorPixelBufferWidth = a3;
}

- (unint64_t)colorPixelBufferHeight
{
  return self->_colorPixelBufferHeight;
}

- (void)setColorPixelBufferHeight:(unint64_t)a3
{
  self->_colorPixelBufferHeight = a3;
}

- (NSArray)supportedColorPixelBufferPixelFormats
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (float)colorPixelBufferFocalLength_mm
{
  return self->_colorPixelBufferFocalLength_mm;
}

- (void)setColorPixelBufferFocalLength_mm:(float)a3
{
  self->_colorPixelBufferFocalLength_mm = a3;
}

- (float)colorPixelBufferPixelSize_um
{
  return self->_colorPixelBufferPixelSize_um;
}

- (void)setColorPixelBufferPixelSize_um:(float)a3
{
  self->_colorPixelBufferPixelSize_um = a3;
}

- (float)colorPixelBufferFocalRatio
{
  return self->_colorPixelBufferFocalRatio;
}

- (void)setColorPixelBufferFocalRatio:(float)a3
{
  self->_colorPixelBufferFocalRatio = a3;
}

- (unint64_t)alphaMattePixelBufferWidth
{
  return self->_alphaMattePixelBufferWidth;
}

- (void)setAlphaMattePixelBufferWidth:(unint64_t)a3
{
  self->_alphaMattePixelBufferWidth = a3;
}

- (unint64_t)alphaMattePixelBufferHeight
{
  return self->_alphaMattePixelBufferHeight;
}

- (void)setAlphaMattePixelBufferHeight:(unint64_t)a3
{
  self->_alphaMattePixelBufferHeight = a3;
}

- (unsigned)alphaMattePixelBufferPixelFormat
{
  return self->_alphaMattePixelBufferPixelFormat;
}

- (unint64_t)inputDisparityPixelBufferWidth
{
  return self->_inputDisparityPixelBufferWidth;
}

- (void)setInputDisparityPixelBufferWidth:(unint64_t)a3
{
  self->_inputDisparityPixelBufferWidth = a3;
}

- (unint64_t)inputDisparityPixelBufferHeight
{
  return self->_inputDisparityPixelBufferHeight;
}

- (void)setInputDisparityPixelBufferHeight:(unint64_t)a3
{
  self->_inputDisparityPixelBufferHeight = a3;
}

- (unint64_t)outputDisparityPixelBufferWidth
{
  return self->_outputDisparityPixelBufferWidth;
}

- (void)setOutputDisparityPixelBufferWidth:(unint64_t)a3
{
  self->_outputDisparityPixelBufferWidth = a3;
}

- (unint64_t)outputDisparityPixelBufferHeight
{
  return self->_outputDisparityPixelBufferHeight;
}

- (void)setOutputDisparityPixelBufferHeight:(unint64_t)a3
{
  self->_outputDisparityPixelBufferHeight = a3;
}

- (float)outputDisparityOffset
{
  return self->_outputDisparityOffset;
}

- (void)setOutputDisparityOffset:(float)a3
{
  self->_outputDisparityOffset = a3;
}

- (unint64_t)inputToOutputDisparityPixelBufferRotation
{
  return self->_inputToOutputDisparityPixelBufferRotation;
}

- (void)setInputToOutputDisparityPixelBufferRotation:(unint64_t)a3
{
  self->_inputToOutputDisparityPixelBufferRotation = a3;
}

- (BOOL)sceneMonitorUsesDisparityStatistics
{
  return self->_sceneMonitorUsesDisparityStatistics;
}

- (void)setSceneMonitorUsesDisparityStatistics:(BOOL)a3
{
  self->_sceneMonitorUsesDisparityStatistics = a3;
}

- (unsigned)inputDisparityPixelBufferPixelFormat
{
  return self->_inputDisparityPixelBufferPixelFormat;
}

- (void)setInputDisparityPixelBufferPixelFormat:(unsigned int)a3
{
  self->_inputDisparityPixelBufferPixelFormat = a3;
}

- (unsigned)outputDisparityPixelBufferPixelFormat
{
  return self->_outputDisparityPixelBufferPixelFormat;
}

- (NSArray)supportedInputSegmentationPixelBufferPixelFormats
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (unint64_t)videoPipelineDevice
{
  return self->_videoPipelineDevice;
}

- (int)depthPixelBufferXPadding
{
  return self->_depthPixelBufferXPadding;
}

- (void)setDepthPixelBufferXPadding:(int)a3
{
  self->_depthPixelBufferXPadding = a3;
}

- (int)depthPixelBufferYPadding
{
  return self->_depthPixelBufferYPadding;
}

- (void)setDepthPixelBufferYPadding:(int)a3
{
  self->_depthPixelBufferYPadding = a3;
}

- (int)depthPixelBufferXReplication
{
  return self->_depthPixelBufferXReplication;
}

- (void)setDepthPixelBufferXReplication:(int)a3
{
  self->_depthPixelBufferXReplication = a3;
}

- (int)depthPixelBufferYReplication
{
  return self->_depthPixelBufferYReplication;
}

- (void)setDepthPixelBufferYReplication:(int)a3
{
  self->_depthPixelBufferYReplication = a3;
}

- (float)depthPixelBufferScale
{
  return self->_depthPixelBufferScale;
}

- (void)setDepthPixelBufferScale:(float)a3
{
  self->_depthPixelBufferScale = a3;
}

- (float)depthPixelBufferOffset
{
  return self->_depthPixelBufferOffset;
}

- (void)setDepthPixelBufferOffset:(float)a3
{
  self->_depthPixelBufferOffset = a3;
}

- (float)disparityStereoFocalLengthPixels
{
  return self->_disparityStereoFocalLengthPixels;
}

- (void)setDisparityStereoFocalLengthPixels:(float)a3
{
  self->_disparityStereoFocalLengthPixels = a3;
}

- (float)disparityStereoBaselineMeters
{
  return self->_disparityStereoBaselineMeters;
}

- (void)setDisparityStereoBaselineMeters:(float)a3
{
  self->_disparityStereoBaselineMeters = a3;
}

- (BOOL)canSkipDisparityHoleFillingAndTemporalRejection
{
  return self->_canSkipDisparityHoleFillingAndTemporalRejection;
}

- (void)setCanSkipDisparityHoleFillingAndTemporalRejection:(BOOL)a3
{
  self->_canSkipDisparityHoleFillingAndTemporalRejection = a3;
}

- (BOOL)supportsForegroundBlur
{
  return self->_supportsForegroundBlur;
}

- (void)setSupportsForegroundBlur:(BOOL)a3
{
  self->_supportsForegroundBlur = a3;
}

- (float)depthPixelBufferMaxLeftOcclusionDisparityChange
{
  return self->_depthPixelBufferMaxLeftOcclusionDisparityChange;
}

- (void)setDepthPixelBufferMaxLeftOcclusionDisparityChange:(float)a3
{
  self->_depthPixelBufferMaxLeftOcclusionDisparityChange = a3;
}

- (float)depthPixelBufferMaxRightOcclusionDisparityChange
{
  return self->_depthPixelBufferMaxRightOcclusionDisparityChange;
}

- (void)setDepthPixelBufferMaxRightOcclusionDisparityChange:(float)a3
{
  self->_depthPixelBufferMaxRightOcclusionDisparityChange = a3;
}

- (float)backgroundDisparityUpdateRate
{
  return self->_backgroundDisparityUpdateRate;
}

- (void)setBackgroundDisparityUpdateRate:(float)a3
{
  self->_backgroundDisparityUpdateRate = a3;
}

- (float)invalidDisparityRatioUpdateRate
{
  return self->_invalidDisparityRatioUpdateRate;
}

- (void)setInvalidDisparityRatioUpdateRate:(float)a3
{
  self->_invalidDisparityRatioUpdateRate = a3;
}

- (int)backgroundDisparityStatsWindowSize
{
  return self->_backgroundDisparityStatsWindowSize;
}

- (void)setBackgroundDisparityStatsWindowSize:(int)a3
{
  self->_backgroundDisparityStatsWindowSize = a3;
}

- (int)invalidDisparityRatioStatsWindowSize
{
  return self->_invalidDisparityRatioStatsWindowSize;
}

- (void)setInvalidDisparityRatioStatsWindowSize:(int)a3
{
  self->_invalidDisparityRatioStatsWindowSize = a3;
}

- (float)minDeltaCanonicalDisparity
{
  return self->_minDeltaCanonicalDisparity;
}

- (void)setMinDeltaCanonicalDisparity:(float)a3
{
  self->_minDeltaCanonicalDisparity = a3;
}

- (float)maxDeltaCanonicalDisparity
{
  return self->_maxDeltaCanonicalDisparity;
}

- (void)setMaxDeltaCanonicalDisparity:(float)a3
{
  self->_maxDeltaCanonicalDisparity = a3;
}

- (float)centerDeltaCanonicalDisparity
{
  return self->_centerDeltaCanonicalDisparity;
}

- (void)setCenterDeltaCanonicalDisparity:(float)a3
{
  self->_centerDeltaCanonicalDisparity = a3;
}

- (float)dsCanonicalLowThld
{
  return self->_dsCanonicalLowThld;
}

- (void)setDsCanonicalLowThld:(float)a3
{
  self->_dsCanonicalLowThld = a3;
}

- (float)dsCanonicalLowScale
{
  return self->_dsCanonicalLowScale;
}

- (void)setDsCanonicalLowScale:(float)a3
{
  self->_dsCanonicalLowScale = a3;
}

- (float)dsCanonicalHighThld
{
  return self->_dsCanonicalHighThld;
}

- (void)setDsCanonicalHighThld:(float)a3
{
  self->_dsCanonicalHighThld = a3;
}

- (float)linearDeltaDepthMultiplier
{
  return self->_linearDeltaDepthMultiplier;
}

- (void)setLinearDeltaDepthMultiplier:(float)a3
{
  self->_linearDeltaDepthMultiplier = a3;
}

- (float)linearDeltaDepthOffset
{
  return self->_linearDeltaDepthOffset;
}

- (void)setLinearDeltaDepthOffset:(float)a3
{
  self->_linearDeltaDepthOffset = a3;
}

- (float)dsCanonicalHighScale
{
  return self->_dsCanonicalHighScale;
}

- (void)setDsCanonicalHighScale:(float)a3
{
  self->_dsCanonicalHighScale = a3;
}

- (float)foregroundPercentile
{
  return self->_foregroundPercentile;
}

- (void)setForegroundPercentile:(float)a3
{
  self->_foregroundPercentile = a3;
}

- (float)closeDisparityPercentile
{
  return self->_closeDisparityPercentile;
}

- (void)setCloseDisparityPercentile:(float)a3
{
  self->_closeDisparityPercentile = a3;
}

- (float)deltaDepth
{
  return self->_deltaDepth;
}

- (void)setDeltaDepth:(float)a3
{
  self->_deltaDepth = a3;
}

- (float)mattingUpdateRate
{
  return self->_mattingUpdateRate;
}

- (void)setMattingUpdateRate:(float)a3
{
  self->_mattingUpdateRate = a3;
}

- (float)mattingUpdateRateFast
{
  return self->_mattingUpdateRateFast;
}

- (void)setMattingUpdateRateFast:(float)a3
{
  self->_mattingUpdateRateFast = a3;
}

- (float)guidedFilterUnconfidentWeight
{
  return self->_guidedFilterUnconfidentWeight;
}

- (void)setGuidedFilterUnconfidentWeight:(float)a3
{
  self->_guidedFilterUnconfidentWeight = a3;
}

- (float)guidedFilterMinDistToDeweight
{
  return self->_guidedFilterMinDistToDeweight;
}

- (void)setGuidedFilterMinDistToDeweight:(float)a3
{
  self->_guidedFilterMinDistToDeweight = a3;
}

- (float)referenceDisparity
{
  return self->_referenceDisparity;
}

- (void)setReferenceDisparity:(float)a3
{
  self->_referenceDisparity = a3;
}

- (float)deltaCanonicalDisparity
{
  return self->_deltaCanonicalDisparity;
}

- (void)setDeltaCanonicalDisparity:(float)a3
{
  self->_deltaCanonicalDisparity = a3;
}

- (float)alphaCoeffFilterColorStd
{
  return self->_alphaCoeffFilterColorStd;
}

- (void)setAlphaCoeffFilterColorStd:(float)a3
{
  self->_alphaCoeffFilterColorStd = a3;
}

- (float)alphaCoeffFilterColorStdFast
{
  return self->_alphaCoeffFilterColorStdFast;
}

- (void)setAlphaCoeffFilterColorStdFast:(float)a3
{
  self->_alphaCoeffFilterColorStdFast = a3;
}

- (float)alphaMaxLaplacian
{
  return self->_alphaMaxLaplacian;
}

- (void)setAlphaMaxLaplacian:(float)a3
{
  self->_alphaMaxLaplacian = a3;
}

- (float)alphaContrastExponent
{
  return self->_alphaContrastExponent;
}

- (void)setAlphaContrastExponent:(float)a3
{
  self->_alphaContrastExponent = a3;
}

- (float)alphaGammaExponent
{
  return self->_alphaGammaExponent;
}

- (void)setAlphaGammaExponent:(float)a3
{
  self->_alphaGammaExponent = a3;
}

- (float)disparityFilterColorStd
{
  return self->_disparityFilterColorStd;
}

- (void)setDisparityFilterColorStd:(float)a3
{
  self->_disparityFilterColorStd = a3;
}

- (float)disparityFilterUpdateRate
{
  return self->_disparityFilterUpdateRate;
}

- (void)setDisparityFilterUpdateRate:(float)a3
{
  self->_disparityFilterUpdateRate = a3;
}

- (float)minimumConfidenceToKeepDisparity
{
  return self->_minimumConfidenceToKeepDisparity;
}

- (void)setMinimumConfidenceToKeepDisparity:(float)a3
{
  self->_minimumConfidenceToKeepDisparity = a3;
}

- (float)maximumSimilarityToKeepDisparity
{
  return self->_maximumSimilarityToKeepDisparity;
}

- (void)setMaximumSimilarityToKeepDisparity:(float)a3
{
  self->_maximumSimilarityToKeepDisparity = a3;
}

- (float)maxDisparityFillingInconsistency
{
  return self->_maxDisparityFillingInconsistency;
}

- (void)setMaxDisparityFillingInconsistency:(float)a3
{
  self->_maxDisparityFillingInconsistency = a3;
}

- (float)maxDisparityFillingDistFromForeground
{
  return self->_maxDisparityFillingDistFromForeground;
}

- (void)setMaxDisparityFillingDistFromForeground:(float)a3
{
  self->_maxDisparityFillingDistFromForeground = a3;
}

- (int)maxDistToPushDisparityEdgesFwd
{
  return self->_maxDistToPushDisparityEdgesFwd;
}

- (void)setMaxDistToPushDisparityEdgesFwd:(int)a3
{
  self->_maxDistToPushDisparityEdgesFwd = a3;
}

- (int)maxDistToPushDisparityEdgesRev
{
  return self->_maxDistToPushDisparityEdgesRev;
}

- (void)setMaxDistToPushDisparityEdgesRev:(int)a3
{
  self->_maxDistToPushDisparityEdgesRev = a3;
}

- (int)disparityPushingBackgroundToForegroundDisparityDifference
{
  return self->_disparityPushingBackgroundToForegroundDisparityDifference;
}

- (void)setDisparityPushingBackgroundToForegroundDisparityDifference:(int)a3
{
  self->_disparityPushingBackgroundToForegroundDisparityDifference = a3;
}

- (float)renderingDisparityUpdateRate
{
  return self->_renderingDisparityUpdateRate;
}

- (void)setRenderingDisparityUpdateRate:(float)a3
{
  self->_renderingDisparityUpdateRate = a3;
}

- (float)renderingDisparityBlurRadius
{
  return self->_renderingDisparityBlurRadius;
}

- (void)setRenderingDisparityBlurRadius:(float)a3
{
  self->_renderingDisparityBlurRadius = a3;
}

- (float)offsetNoiseBitCalculation
{
  return self->_offsetNoiseBitCalculation;
}

- (void)setOffsetNoiseBitCalculation:(float)a3
{
  self->_offsetNoiseBitCalculation = a3;
}

- (float)gainMultiplierNoiseBitCalculation
{
  return self->_gainMultiplierNoiseBitCalculation;
}

- (void)setGainMultiplierNoiseBitCalculation:(float)a3
{
  self->_gainMultiplierNoiseBitCalculation = a3;
}

- (float)luxMultiplierNoiseBitCalculation
{
  return self->_luxMultiplierNoiseBitCalculation;
}

- (void)setLuxMultiplierNoiseBitCalculation:(float)a3
{
  self->_luxMultiplierNoiseBitCalculation = a3;
}

- (float)renderingLensFocalLength
{
  return self->_renderingLensFocalLength;
}

- (void)setRenderingLensFocalLength:(float)a3
{
  self->_renderingLensFocalLength = a3;
}

- (float)fNumberMultiplier
{
  return self->_fNumberMultiplier;
}

- (void)setFNumberMultiplier:(float)a3
{
  self->_fNumberMultiplier = a3;
}

- (float)focusThresholdHardness
{
  return self->_focusThresholdHardness;
}

- (void)setFocusThresholdHardness:(float)a3
{
  self->_focusThresholdHardness = a3;
}

- (float)focusUpdateRateSlow
{
  return self->_focusUpdateRateSlow;
}

- (void)setFocusUpdateRateSlow:(float)a3
{
  self->_focusUpdateRateSlow = a3;
}

- (float)focusUpdateRateFast
{
  return self->_focusUpdateRateFast;
}

- (void)setFocusUpdateRateFast:(float)a3
{
  self->_focusUpdateRateFast = a3;
}

- (int)maxFramesWithoutFace
{
  return self->_maxFramesWithoutFace;
}

- (void)setMaxFramesWithoutFace:(int)a3
{
  self->_maxFramesWithoutFace = a3;
}

- (float)faceSizeRatioInFocus
{
  return self->_faceSizeRatioInFocus;
}

- (void)setFaceSizeRatioInFocus:(float)a3
{
  self->_faceSizeRatioInFocus = a3;
}

- (float)foregroundMaskDilationRadius
{
  return self->_foregroundMaskDilationRadius;
}

- (void)setForegroundMaskDilationRadius:(float)a3
{
  self->_foregroundMaskDilationRadius = a3;
}

- (float)infConvolutionDownsampling
{
  return self->_infConvolutionDownsampling;
}

- (void)setInfConvolutionDownsampling:(float)a3
{
  self->_infConvolutionDownsampling = a3;
}

- (float)laplacianLimitingDownsampling
{
  return self->_laplacianLimitingDownsampling;
}

- (void)setLaplacianLimitingDownsampling:(float)a3
{
  self->_laplacianLimitingDownsampling = a3;
}

- (float)laplacianLimitingBlurSize
{
  return self->_laplacianLimitingBlurSize;
}

- (void)setLaplacianLimitingBlurSize:(float)a3
{
  self->_laplacianLimitingBlurSize = a3;
}

- (int)relightDisplayMode
{
  return self->_relightDisplayMode;
}

- (void)setRelightDisplayMode:(int)a3
{
  self->_relightDisplayMode = a3;
}

- (NSDictionary)faceKitProcessOutputOverride
{
  return (NSDictionary *)objc_getProperty(self, a2, 456, 1);
}

- (void)setFaceKitProcessOutputOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (float)relightEffectStrength
{
  return self->_relightEffectStrength;
}

- (void)setRelightEffectStrength:(float)a3
{
  self->_relightEffectStrength = a3;
}

- (float)portraitStyleStrengthOverride
{
  return self->_portraitStyleStrengthOverride;
}

- (void)setPortraitStyleStrengthOverride:(float)a3
{
  self->_portraitStyleStrengthOverride = a3;
}

- (float)focusDistanceOverride
{
  return self->_focusDistanceOverride;
}

- (void)setFocusDistanceOverride:(float)a3
{
  self->_focusDistanceOverride = a3;
}

- (float)stageLightStateMachineIntensityIncrement
{
  return self->_stageLightStateMachineIntensityIncrement;
}

- (void)setStageLightStateMachineIntensityIncrement:(float)a3
{
  self->_stageLightStateMachineIntensityIncrement = a3;
}

- (double)stageLightStageMachineMaxOrientationDifference
{
  return self->_stageLightStageMachineMaxOrientationDifference;
}

- (void)setStageLightStageMachineMaxOrientationDifference:(double)a3
{
  self->_stageLightStageMachineMaxOrientationDifference = a3;
}

- (float)sdofStateMachineIntensityIncrement
{
  return self->_sdofStateMachineIntensityIncrement;
}

- (void)setSdofStateMachineIntensityIncrement:(float)a3
{
  self->_sdofStateMachineIntensityIncrement = a3;
}

- (double)sdofStateMachineMaxOrientationDifference
{
  return self->_sdofStateMachineMaxOrientationDifference;
}

- (void)setSdofStateMachineMaxOrientationDifference:(double)a3
{
  self->_sdofStateMachineMaxOrientationDifference = a3;
}

- (BOOL)modulateFocalRatio
{
  return self->_modulateFocalRatio;
}

- (void)setModulateFocalRatio:(BOOL)a3
{
  self->_modulateFocalRatio = a3;
}

- (float)stableBackgroundDisparitySumVariance
{
  return self->_stableBackgroundDisparitySumVariance;
}

- (void)setStableBackgroundDisparitySumVariance:(float)a3
{
  self->_stableBackgroundDisparitySumVariance = a3;
}

- (float)unstableBackgroundDisparitySumVariance
{
  return self->_unstableBackgroundDisparitySumVariance;
}

- (void)setUnstableBackgroundDisparitySumVariance:(float)a3
{
  self->_unstableBackgroundDisparitySumVariance = a3;
}

- (float)stableInvalidDisparityRatio
{
  return self->_stableInvalidDisparityRatio;
}

- (void)setStableInvalidDisparityRatio:(float)a3
{
  self->_stableInvalidDisparityRatio = a3;
}

- (float)unstableInvalidDisparityRatio
{
  return self->_unstableInvalidDisparityRatio;
}

- (void)setUnstableInvalidDisparityRatio:(float)a3
{
  self->_unstableInvalidDisparityRatio = a3;
}

- (float)backgroundSeparationLikelihoodHigh
{
  return self->_backgroundSeparationLikelihoodHigh;
}

- (void)setBackgroundSeparationLikelihoodHigh:(float)a3
{
  self->_backgroundSeparationLikelihoodHigh = a3;
}

- (float)backgroundSeparationLikelihoodLow
{
  return self->_backgroundSeparationLikelihoodLow;
}

- (void)setBackgroundSeparationLikelihoodLow:(float)a3
{
  self->_backgroundSeparationLikelihoodLow = a3;
}

- (float)depthQualityMetricFocalPlaneOffsetMeters
{
  return self->_depthQualityMetricFocalPlaneOffsetMeters;
}

- (void)setDepthQualityMetricFocalPlaneOffsetMeters:(float)a3
{
  self->_depthQualityMetricFocalPlaneOffsetMeters = a3;
}

- (unint64_t)focusStatisticsXTileCount
{
  return self->_focusStatisticsXTileCount;
}

- (void)setFocusStatisticsXTileCount:(unint64_t)a3
{
  self->_focusStatisticsXTileCount = a3;
}

- (unint64_t)focusStatisticsYTileCount
{
  return self->_focusStatisticsYTileCount;
}

- (void)setFocusStatisticsYTileCount:(unint64_t)a3
{
  self->_focusStatisticsYTileCount = a3;
}

- (unint64_t)proxyToFaceEffectLerpNumFrames
{
  return self->_proxyToFaceEffectLerpNumFrames;
}

- (void)setProxyToFaceEffectLerpNumFrames:(unint64_t)a3
{
  self->_proxyToFaceEffectLerpNumFrames = a3;
}

- (int)segmentationBinarizationThreshold
{
  return self->_segmentationBinarizationThreshold;
}

- (void)setSegmentationBinarizationThreshold:(int)a3
{
  self->_segmentationBinarizationThreshold = a3;
}

- (int)depthErosionRadius
{
  return self->_depthErosionRadius;
}

- (void)setDepthErosionRadius:(int)a3
{
  self->_depthErosionRadius = a3;
}

- (int)guidedFilterWidth
{
  return self->_guidedFilterWidth;
}

- (void)setGuidedFilterWidth:(int)a3
{
  self->_guidedFilterWidth = a3;
}

- (int)guidedFilterHeight
{
  return self->_guidedFilterHeight;
}

- (void)setGuidedFilterHeight:(int)a3
{
  self->_guidedFilterHeight = a3;
}

- (int)rawShiftInvalidThreshold
{
  return self->_rawShiftInvalidThreshold;
}

- (void)setRawShiftInvalidThreshold:(int)a3
{
  self->_rawShiftInvalidThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceKitProcessOutputOverride, 0);
  objc_storeStrong((id *)&self->_supportedInputSegmentationPixelBufferPixelFormats, 0);
  objc_storeStrong((id *)&self->_supportedColorPixelBufferPixelFormats, 0);
}

+ (id)allSupportedYCbCrPixelFormats
{
  return &unk_1E69492B0;
}

@end
