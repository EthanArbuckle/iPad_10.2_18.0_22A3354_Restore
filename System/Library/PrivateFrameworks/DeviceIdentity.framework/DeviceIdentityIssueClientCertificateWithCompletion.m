@implementation DeviceIdentityIssueClientCertificateWithCompletion

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t result;
  _BYTE v14[12];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 703, CFSTR("com.apple.MobileActivation.ErrorDomain"), -25, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("Client is not supported."), a7, a8, *(uint64_t *)v14);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)v14 = 138543362;
    *(_QWORD *)&v14[4] = v12;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", v14, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_143(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t result;
  _BYTE v14[12];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 717, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("Not supported on this device (VM support disabled)."), a7, a8, *(uint64_t *)v14);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)v14 = 138543362;
    *(_QWORD *)&v14[4] = v12;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", v14, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  __SecTask *v11;
  uint64_t v12;
  uint64_t v13;
  __SecTask *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  CFDataRef v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t *v44;
  const void *v45;
  uint64_t *v46;
  const void *v47;
  uint64_t *v48;
  const void *v49;
  CFTypeRef *v50;
  CFTypeRef v51;
  uint64_t *v52;
  const void *v53;
  id v54;
  id *v55;
  CFErrorRef v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  CFErrorRef v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  __CFString *v74;
  void *v75;
  _BOOL4 v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  CFTypeID v94;
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
  _BOOL4 v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  BOOL v135;
  char v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  id *v144;
  void *v145;
  double v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  int v153;
  void *v154;
  uint64_t v155;
  CFTypeRef v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const __CFData *v169;
  SecCertificateRef v170;
  uint64_t v171;
  uint64_t v172;
  const __CFData *v173;
  SecCertificateRef v174;
  uint64_t v175;
  uint64_t v176;
  const void *v177;
  __SecKey *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  __SecKey *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  __SecKey *v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  __CFString *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  id v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  CFDataRef v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  char v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const void *v223;
  CFTypeRef v224;
  NSObject *v225;
  id v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  uint64_t v232;
  NSObject *v233;
  id v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  void *v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  void *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  void *v264;
  id v265;
  uint64_t v266;
  void *v267;
  int v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  uint64_t *v272;
  int v273;
  __SecKey *v274;
  uint64_t v275;
  int valid;
  __SecKey *v277;
  uint64_t v278;
  int v279;
  __SecKey *v280;
  __SecCertificate *v281;
  uint64_t v282;
  char v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  NSObject *v287;
  id v288;
  void *v289;
  uint64_t *v290;
  const void *v291;
  CFTypeRef *v292;
  CFTypeRef v293;
  uint64_t *v294;
  const void *v295;
  uint64_t v296;
  void *v297;
  double v298;
  char v299;
  void *v300;
  uint64_t v301;
  char v302;
  void *v303;
  uint64_t v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  int v312;
  int v313;
  void *v314;
  void *v315;
  void *v316;
  BOOL v317;
  void *v318;
  void *v319;
  void *v320;
  BOOL v321;
  NSObject *v322;
  id v323;
  void *v324;
  id v325;
  uint64_t v326;
  uint64_t *v327;
  uint64_t *v328;
  NSObject *v329;
  id v330;
  void *v331;
  uint64_t v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  int v338;
  int v339;
  void *v340;
  int v341;
  id v342;
  char v343;
  id v344;
  void *queue;
  dispatch_queue_t queueb[2];
  int queuea;
  NSObject *queuec;
  id queued;
  id v350;
  void *v351;
  void *v352;
  char v353;
  void *v354;
  void *v355;
  void *v356;
  id v357;
  id v358;
  id v359;
  __CFString *v360;
  id v361;
  id v362;
  id v363;
  void *v364;
  id v365;
  void *v366;
  __CFString *v367;
  void *cf;
  id v369;
  _QWORD block[4];
  __int128 v371;
  uint64_t *v372;
  uint64_t *v373;
  _QWORD v374[4];
  id v375;
  __CFString *v376;
  id v377;
  id v378;
  id v379;
  id v380;
  __CFString *v381;
  id v382;
  id v383;
  id v384;
  id v385;
  id v386;
  id v387;
  id v388;
  id v389;
  uint64_t v390;
  _QWORD *v391;
  uint64_t *v392;
  uint64_t *v393;
  uint64_t *v394;
  uint64_t *v395;
  uint64_t *v396;
  uint64_t *v397;
  uint64_t *v398;
  uint64_t *v399;
  uint64_t *v400;
  uint64_t *v401;
  uint64_t *v402;
  uint64_t *v403;
  uint64_t *v404;
  uint64_t *v405;
  uint64_t *v406;
  uint64_t *v407;
  char v408;
  char v409;
  id v410;
  id v411;
  id v412;
  id v413;
  id v414;
  id v415;
  id v416;
  id v417;
  id v418;
  id v419;
  id v420;
  id v421;
  id v422;
  id v423;
  id v424;
  id v425;
  id v426;
  id obj;
  uint64_t v428;
  double *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t *v433;
  uint64_t v434;
  int v435;
  int v436;
  double v437;
  uint64_t v438;
  double *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t *v443;
  uint64_t v444;
  uint64_t (*v445)(uint64_t, uint64_t);
  void (*v446)(uint64_t);
  id v447;
  uint64_t v448;
  uint64_t *v449;
  uint64_t v450;
  uint64_t (*v451)(uint64_t, uint64_t);
  void (*v452)(uint64_t);
  id v453;
  uint64_t v454;
  uint64_t *v455;
  uint64_t v456;
  uint64_t (*v457)(uint64_t, uint64_t);
  void (*v458)(uint64_t);
  id v459;
  uint64_t v460;
  uint64_t *v461;
  uint64_t v462;
  uint64_t (*v463)(uint64_t, uint64_t);
  void (*v464)(uint64_t);
  id v465;
  uint64_t v466;
  uint64_t *v467;
  uint64_t v468;
  uint64_t (*v469)(uint64_t, uint64_t);
  void (*v470)(uint64_t);
  id v471;
  uint64_t v472;
  uint64_t *v473;
  uint64_t v474;
  uint64_t (*v475)(uint64_t, uint64_t);
  void (*v476)(uint64_t);
  id v477;
  int v478;
  uint64_t v479;
  uint64_t *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  CFTypeRef *v484;
  uint64_t v485;
  uint64_t v486;
  CFErrorRef error;
  uint64_t v488;
  uint64_t *v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  id *v505;
  uint64_t v506;
  uint64_t (*v507)(uint64_t, uint64_t);
  void (*v508)(uint64_t);
  id v509;
  _QWORD v510[5];
  id v511;
  uint8_t buf[4];
  id v513;
  __int16 v514;
  id v515;
  __int16 v516;
  id v517;
  __int16 v518;
  void *v519;
  __int16 v520;
  id v521;
  __int16 v522;
  id v523;
  __int16 v524;
  uint64_t v525;
  CFTypeRef v526;
  _QWORD v527[3];
  uint64_t v528;
  char v529[24];
  const __CFString *v530;
  uint64_t v531;
  const __CFString *v532;
  _QWORD v533[4];

  v533[1] = *MEMORY[0x1E0C80C00];
  v510[0] = 0;
  v510[1] = v510;
  v510[2] = 0x3032000000;
  v510[3] = __Block_byref_object_copy_;
  v510[4] = __Block_byref_object_dispose_;
  v511 = 0;
  v504 = 0;
  v505 = (id *)&v504;
  v506 = 0x3032000000;
  v507 = __Block_byref_object_copy_;
  v508 = __Block_byref_object_dispose_;
  v509 = 0;
  v500 = 0;
  v501 = &v500;
  v502 = 0x2020000000;
  v503 = 0;
  v496 = 0;
  v497 = &v496;
  v498 = 0x2020000000;
  v499 = 0;
  v492 = 0;
  v493 = &v492;
  v494 = 0x2020000000;
  v495 = 0;
  v488 = 0;
  v489 = &v488;
  v490 = 0x2020000000;
  v491 = 0;
  error = 0;
  v483 = 0;
  v484 = (CFTypeRef *)&v483;
  v485 = 0x2020000000;
  v486 = 0;
  v479 = 0;
  v480 = &v479;
  v481 = 0x2020000000;
  v482 = 0;
  v478 = -1;
  v472 = 0;
  v473 = &v472;
  v474 = 0x3032000000;
  v475 = __Block_byref_object_copy_;
  v476 = __Block_byref_object_dispose_;
  v477 = 0;
  v466 = 0;
  v467 = &v466;
  v468 = 0x3032000000;
  v469 = __Block_byref_object_copy_;
  v470 = __Block_byref_object_dispose_;
  v471 = 0;
  v460 = 0;
  v461 = &v460;
  v462 = 0x3032000000;
  v463 = __Block_byref_object_copy_;
  v464 = __Block_byref_object_dispose_;
  v465 = 0;
  v454 = 0;
  v455 = &v454;
  v456 = 0x3032000000;
  v457 = __Block_byref_object_copy_;
  v458 = __Block_byref_object_dispose_;
  v459 = 0;
  v448 = 0;
  v449 = &v448;
  v450 = 0x3032000000;
  v451 = __Block_byref_object_copy_;
  v452 = __Block_byref_object_dispose_;
  v453 = 0;
  v442 = 0;
  v443 = &v442;
  v444 = 0x3032000000;
  v445 = __Block_byref_object_copy_;
  v446 = __Block_byref_object_dispose_;
  v447 = 0;
  v438 = 0;
  v439 = (double *)&v438;
  v440 = 0x2020000000;
  v441 = 0;
  v437 = 0.0;
  v436 = 0;
  v432 = 0;
  v433 = &v432;
  v434 = 0x2020000000;
  v435 = 0;
  v428 = 0;
  v429 = (double *)&v428;
  v430 = 0x2020000000;
  v431 = 0;
  if (!*(_QWORD *)(a1 + 48))
  {
    createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 807, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."), a7, a8, v332);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v369 = 0;
LABEL_24:
    v34 = 0;
    v366 = 0;
    v35 = 0;
    v36 = 0;
    v354 = 0;
    v350 = 0;
    v14 = 0;
LABEL_25:
    v367 = 0;
    cf = 0;
    goto LABEL_26;
  }
  v369 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v369)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 813, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate array."), v9, v10, v332);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v11 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v14 = v11;
  if (!v11)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 821, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create task."), v12, v13, v332);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v367 = (__CFString *)SecTaskCopySigningIdentifier(v11, &error);
  if (!v367)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 827, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to query code signing identifier."), v15, v16, v332);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v366 = 0;
    v35 = 0;
    v36 = 0;
    v354 = 0;
    v350 = 0;
    goto LABEL_25;
  }
  v366 = (void *)SecTaskCopyValueForEntitlement(v14, CFSTR("com.apple.mobileactivationd.spi"), &error);
  isNSNumber(v366);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17 || (v18 = objc_msgSend(v366, "BOOLValue"), v17, (v18 & 1) == 0))
  {
    v56 = error;
    v532 = CFSTR("com.apple.mobileactivationd.spi");
    v533[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v533, &v532, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 833, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, v56, CFSTR("Missing required entitlement: %@"), v57, v58, (uint64_t)v41);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v61 = *(void **)(v60 + 40);
    *(_QWORD *)(v60 + 40) = v59;

    v34 = 0;
    v35 = 0;
    v36 = 0;
    v352 = 0;
    v354 = 0;
    v350 = 0;
    v351 = 0;
    cf = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v363 = 0;
    v364 = 0;
    v357 = 0;
    v358 = 0;
    v359 = 0;
    v360 = 0;
    v361 = 0;
    v362 = 0;
    v355 = 0;
    v356 = 0;
    v365 = 0;
    goto LABEL_28;
  }
  v365 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v365)
  {
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(v365, "addEntriesFromDictionary:");
    v21 = is_virtual_machine();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "setObject:forKeyedSubscript:", v22, CFSTR("scrtAttestation"));

    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    isNSArray(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v364 = (void *)objc_msgSend(v25, "initWithArray:", v26);

      if ((objc_msgSend(v364, "containsObject:", CFSTR("1.2.840.113635.100.10.1")) & 1) != 0
        || (objc_msgSend(v364, "containsObject:", CFSTR("1.2.840.113635.100.8.1")) & 1) != 0
        || objc_msgSend(v364, "containsObject:", CFSTR("1.2.840.113635.100.8.3")))
      {
        queue = (void *)SecTaskCopyValueForEntitlement(v14, CFSTR("com.apple.mobileactivationd.device-identifiers"), &error);

        isNSNumber(queue);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27 || (v28 = objc_msgSend(queue, "BOOLValue"), v27, (v28 & 1) == 0))
        {
          v62 = error;
          v530 = CFSTR("com.apple.mobileactivationd.device-identifiers");
          v531 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v531, &v530, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 865, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, v62, CFSTR("Missing required entitlement: %@"), v63, v64, (uint64_t)v41);
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v67 = *(void **)(v66 + 40);
          *(_QWORD *)(v66 + 40) = v65;

          v34 = 0;
          v35 = 0;
          v36 = 0;
          v352 = 0;
          v354 = 0;
          v350 = 0;
          v351 = 0;
          cf = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v357 = 0;
          v358 = 0;
          v359 = 0;
          v360 = 0;
          v361 = 0;
          v362 = 0;
          v355 = 0;
          v356 = 0;
          v363 = 0;
          v366 = queue;
          goto LABEL_28;
        }
        v366 = queue;
      }
      copy_supported_eda_oids();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v364, "intersectsSet:", v29);

      if (v30)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 871, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("This API does not support Enterprise Device Attestation OIDs: %@"), v31, v32, (uint64_t)v364);
        v33 = objc_claimAutoreleasedReturnValue();
LABEL_57:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v352 = 0;
        v354 = 0;
        v350 = 0;
        v351 = 0;
        cf = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v357 = 0;
        v358 = 0;
        v359 = 0;
        v360 = 0;
        v361 = 0;
        v362 = 0;
        v355 = 0;
        v356 = 0;
        v363 = 0;
        goto LABEL_27;
      }
      if (objc_msgSend(v364, "containsObject:", CFSTR("1.2.840.113635.100.8.6")))
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AccessControls"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v75 == 0;

        if (v76)
        {
          createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 876, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing required option: %@"), v77, v78, (uint64_t)CFSTR("AccessControls"));
          v33 = objc_claimAutoreleasedReturnValue();
          goto LABEL_57;
        }
      }
    }
    else
    {
      v364 = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("KeychainLabel"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      if ((isRunningInRecovery() & 1) != 0 || isRunningInDiagnosticsMode())
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 883, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Option (%@) not allowed for processes running in recoveryOS or diagnostics mode."), v70, v71, (uint64_t)CFSTR("KeychainLabel"));
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_57;
      }
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      isNSData(v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if (v86)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 888, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Keychain (%@) not supported with %@."), v87, v88, (uint64_t)CFSTR("KeychainLabel"));
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_57;
      }
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("KeychainLabel"));
      v363 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-rk"), v363);
      v362 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-leaf"), v363);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-intermediate"), v363);
      v355 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-combined"), v363);
      v361 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-monotonic-clock"), v363);
      v359 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-server-timestamp"), v363);
      v357 = (id)objc_claimAutoreleasedReturnValue();
      v332 = (uint64_t)v363;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-rtc-reset-count"));
      v358 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v362 = 0;
      v363 = 0;
      v361 = 0;
      v355 = 0;
      v356 = 0;
      v358 = 0;
      v359 = 0;
      v357 = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("KeychainAccessGroup"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("KeychainAccessGroup"));
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = 0;
    }
    if (v363 && !v74)
      v74 = v367;
    v360 = v74;
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("IgnoreExistingKeychainItems"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("IgnoreExistingKeychainItems"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v353 = objc_msgSend(v81, "BOOLValue");

    }
    else
    {
      v353 = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("AccessControls"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v82)
      goto LABEL_85;
    if ((isRunningInRecovery() & 1) != 0 || isRunningInDiagnosticsMode())
    {
      createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 917, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Option (%@) not allowed for processes running in recoveryOS or diagnostics mode."), v83, v84, (uint64_t)CFSTR("AccessControls"));
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_75:
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v354 = 0;
      v350 = 0;
LABEL_76:
      cf = 0;
LABEL_77:
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v351 = 0;
      v352 = 0;
      goto LABEL_27;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 922, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("ACLs (%@) not supported with %@."), v91, v92, (uint64_t)CFSTR("AccessControls"));
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_75;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("AccessControls"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = CFGetTypeID(v93);
    LODWORD(v94) = v94 == SecAccessControlGetTypeID();

    if ((_DWORD)v94)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("AccessControls"));
      cf = (void *)objc_claimAutoreleasedReturnValue();

      CFRetain(cf);
    }
    else
    {
LABEL_85:
      cf = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("reuseExistingKey"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("reuseExistingKey"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      queuea = objc_msgSend(v97, "BOOLValue");

    }
    else
    {
      queuea = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("UseSoftwareGeneratedKey"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("UseSoftwareGeneratedKey"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v343 = objc_msgSend(v100, "BOOLValue");

    }
    else
    {
      v343 = 1;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v103, "BOOLValue");

    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    if (v105)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ClientAttestationPublicKey"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      isNSData(v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v107 == 0;

      if (v108)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 946, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing required option for %@."), v109, v110, (uint64_t)CFSTR("ClientAttestationPublicKey"));
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v354 = 0;
        v350 = 0;
        goto LABEL_77;
      }
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ClientAttestationPublicKey"));
      v350 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v350 = 0;
      v354 = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ReturnReferenceDate"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("ReturnReferenceDate"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v339 = objc_msgSend(v113, "BOOLValue");

    }
    else
    {
      v339 = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("SkipNetworkRequest"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    if (v115)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("SkipNetworkRequest"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v341 = objc_msgSend(v116, "BOOLValue");

    }
    else
    {
      v341 = 0;
    }
    objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("DeleteExistingKeysAndCerts"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
    {
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("DeleteExistingKeysAndCerts"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v119, "BOOLValue");

    }
    else
    {
      v120 = 0;
    }
    if (v362)
    {
      if (v21)
      {
        objc_msgSend(v362, "stringByAppendingString:", CFSTR("-scrt"));
        v121 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v356, "stringByAppendingString:", CFSTR("-scrt"));
        v122 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v355, "stringByAppendingString:", CFSTR("-scrt"));
        v123 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v361, "stringByAppendingString:", CFSTR("-scrt"));
        v124 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v359, "stringByAppendingString:", CFSTR("-scrt"));
        v125 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v357, "stringByAppendingString:", CFSTR("-scrt"));
        v126 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v358, "stringByAppendingString:", CFSTR("-scrt"));
      }
      else
      {
        objc_msgSend(v362, "stringByAppendingString:", CFSTR("-ucrt"));
        v121 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v356, "stringByAppendingString:", CFSTR("-ucrt"));
        v122 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v355, "stringByAppendingString:", CFSTR("-ucrt"));
        v123 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v361, "stringByAppendingString:", CFSTR("-ucrt"));
        v124 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v359, "stringByAppendingString:", CFSTR("-ucrt"));
        v125 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v357, "stringByAppendingString:", CFSTR("-ucrt"));
        v126 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v358, "stringByAppendingString:", CFSTR("-ucrt"));
      }
      v127 = objc_claimAutoreleasedReturnValue();
      v361 = (id)v124;
      v362 = (id)v121;
      v355 = (void *)v123;
      v356 = (void *)v122;
      v359 = (id)v125;
      v357 = (id)v126;

      v358 = (id)v127;
    }
    else
    {
      v362 = 0;
    }
    if (v120)
    {
      v34 = 0;
      if (v363 && v360)
      {
        delete_keychain_data(v360, v359, 0);
        delete_keychain_data(v360, v358, 0);
        delete_keychain_data(v360, v357, 0);
        delete_keychain_data(v360, v361, 0);
        delete_keychain_item(v360, v362, 0);
        delete_certificate(v360, v356, 0);
        delete_certificate(v360, v355, 0);
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v351 = 0;
        v352 = 0;
      }
      else
      {
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v351 = 0;
        v352 = 0;
      }
      goto LABEL_29;
    }
    if (v354)
    {
      if (cf)
        CFRelease(cf);
      cf = (void *)SecAccessControlCreate();
      if (!cf)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1019, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to create access control."), v128, v129, v332);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v35 = 0;
        v36 = 0;
        goto LABEL_76;
      }
      v130 = *MEMORY[0x1E0CD68D8];
      if ((SecAccessControlSetProtection() & 1) == 0)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1024, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to set ACL protection to %@."), v131, v132, v130);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_165;
      }
    }
    if ((isRunningInRecovery() & 1) != 0)
    {
      v135 = 0;
    }
    else
    {
      v139 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v139 + 40);
      v135 = isAutomaticTimeEnabledWithError(&obj);
      objc_storeStrong((id *)(v139 + 40), obj);
      v142 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v145 = *(void **)(v142 + 40);
      v144 = (id *)(v142 + 40);
      v143 = v145;
      if (!v135 && v143)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1036, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v143, CFSTR("Failed to query automatic time state."), v140, v141, v332);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_165;
      }
      v426 = v143;
      v146 = copyMonotonicClock(&v426);
      objc_storeStrong(v144, v426);
      v439[3] = v146;
      v149 = v146 != 0.0 || v135;
      if ((v149 & 1) == 0)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1047, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query monotonic clock."), v147, v148, v332);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_165;
      }
      v150 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v151 = *(void **)(v150 + 40);
      *(_QWORD *)(v150 + 40) = 0;

      if (v439[3] != 0.0)
      {
        v152 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v425 = *(id *)(v152 + 40);
        v153 = copyRTCResetCountWithError(&v425);
        objc_storeStrong((id *)(v152 + 40), v425);
        *((_DWORD *)v433 + 6) = v153;
        if (!v153)
        {
          v154 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          if (v154)
          {
            createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1056, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v154, CFSTR("Failed to query RTC reset count."), v133, v134, v332);
            v33 = objc_claimAutoreleasedReturnValue();
            goto LABEL_165;
          }
        }
      }
    }
    v136 = v353;
    if (!v363)
      v136 = 1;
    if ((v136 & 1) != 0)
    {
      v137 = 0;
      v351 = 0;
      v39 = 0;
      v38 = 0;
      v37 = 0;
      v338 = 0;
      v34 = 0;
      goto LABEL_128;
    }
    v155 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v424 = *(id *)(v155 + 40);
    v156 = copy_keychain_item(v360, v362, v365, &v478, &v424);
    objc_storeStrong((id *)(v155 + 40), v424);
    v489[3] = (uint64_t)v156;
    if (v478 != -25300 && v478)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1067, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query existing reference key (%@/%@): %d"), v157, v158, (uint64_t)v360);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v159 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v160 = *(void **)(v159 + 40);
      *(_QWORD *)(v159 + 40) = 0;

      v161 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v423 = *(id *)(v161 + 40);
      copy_keychain_data(v360, v361, &v478, &v423);
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v161 + 40), v423);
      if (v478 != -25300 && v478)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1075, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query existing leaf/intermediate certificates (%@/%@): %d"), v162, v163, (uint64_t)v360);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_167;
      }
      v164 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v165 = *(void **)(v164 + 40);
      *(_QWORD *)(v164 + 40) = 0;

      if (v352)
      {
        v166 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v422 = *(id *)(v166 + 40);
        parseDERCertificatesFromChain(v352, &v422);
        v351 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v166 + 40), v422);
        if (!v351 || objc_msgSend(v351, "count") != 2)
        {
          createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1088, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to parse DER certificate chain."), v167, v168, v332);
          v33 = objc_claimAutoreleasedReturnValue();
          goto LABEL_169;
        }
        objc_msgSend(v351, "objectAtIndexedSubscript:", 0);
        v169 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v170 = SecCertificateCreateWithData(0, v169);
        v484[3] = v170;

        if (!v484[3])
        {
          createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1094, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate from DER data."), v171, v172, v332);
          v33 = objc_claimAutoreleasedReturnValue();
          goto LABEL_169;
        }
        objc_msgSend(v351, "objectAtIndexedSubscript:", 1);
        v173 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v174 = SecCertificateCreateWithData(0, v173);
        v480[3] = (uint64_t)v174;

        if (!v480[3])
        {
          createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1100, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate from DER data."), v175, v176, v332);
          v33 = objc_claimAutoreleasedReturnValue();
LABEL_169:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          goto LABEL_27;
        }
LABEL_197:
        if ((isRunningInRecovery() & 1) == 0)
        {
          v241 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v418 = *(id *)(v241 + 40);
          copy_keychain_data(v360, v359, &v478, &v418);
          v242 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v241 + 40), v418);
          v243 = (void *)v443[5];
          v443[5] = v242;

          if (v478 != -25300 && v478)
          {
            createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1159, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query existing motononic time (%@/%@): %d"), v244, v245, (uint64_t)v360);
            v33 = objc_claimAutoreleasedReturnValue();
            goto LABEL_169;
          }
          v246 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v247 = *(void **)(v246 + 40);
          *(_QWORD *)(v246 + 40) = 0;

          v248 = (void *)v443[5];
          if (v248)
            objc_msgSend(v248, "getBytes:length:", &v437, 8);
          v249 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v417 = *(id *)(v249 + 40);
          copy_keychain_data(v360, v358, &v478, &v417);
          v250 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v249 + 40), v417);
          v251 = (void *)v467[5];
          v467[5] = v250;

          if (v478 != -25300 && v478)
          {
            createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1171, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query existing RTC reset count (%@/%@): %d"), v252, v253, (uint64_t)v360);
            v33 = objc_claimAutoreleasedReturnValue();
            goto LABEL_169;
          }
          v254 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v255 = *(void **)(v254 + 40);
          *(_QWORD *)(v254 + 40) = 0;

          v256 = (void *)v467[5];
          if (v256)
            objc_msgSend(v256, "getBytes:length:", &v436, 4);
          v257 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v416 = *(id *)(v257 + 40);
          copy_keychain_data(v360, v357, &v478, &v416);
          v258 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v257 + 40), v416);
          v259 = (void *)v461[5];
          v461[5] = v258;

          if (v478 != -25300 && v478)
          {
            createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1183, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query existing server timestamp (%@/%@): %d"), v260, v261, (uint64_t)v360);
            v33 = objc_claimAutoreleasedReturnValue();
            goto LABEL_169;
          }
          v262 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v263 = *(void **)(v262 + 40);
          *(_QWORD *)(v262 + 40) = 0;

          v264 = (void *)v461[5];
          if (v264)
          {
            objc_msgSend(v264, "getBytes:length:", v429 + 3, 8);
            v265 = objc_alloc(MEMORY[0x1E0C99D68]);
            v266 = objc_msgSend(v265, "initWithTimeIntervalSinceReferenceDate:", v429[3]);
            v267 = (void *)v449[5];
            v449[5] = v266;

            if (!v449[5])
            {
              createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1194, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create date from server timestamp."), v133, v134, v332);
              v33 = objc_claimAutoreleasedReturnValue();
              goto LABEL_169;
            }
          }
        }
        if (v489[3] && (v239 = (uint64_t)v484[3]) != 0)
        {
          if (v364)
          {
            objc_msgSend(v364, "allObjects");
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            copyCertificateOIDsThatDiffer(v239, v240);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v39 = 0;
          }
          if (objc_msgSend(v39, "count"))
          {
            createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1212, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Mismatch in requested OIDs and existing certificate's OIDs (%@)."), v133, v134, (uint64_t)v39);
            v269 = objc_claimAutoreleasedReturnValue();
            v270 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v271 = *(void **)(v270 + 40);
            *(_QWORD *)(v270 + 40) = v269;

            v268 = 1;
            goto LABEL_225;
          }
        }
        else
        {
          v39 = 0;
        }
        v268 = 0;
LABEL_225:
        v272 = v489;
        if (v489[3])
        {
          v273 = isFactoryMFiCertificate(v360, (uint64_t)v484[3]);
          v272 = v489;
          if (v273)
          {
            v274 = (__SecKey *)v489[3];
            v275 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v415 = *(id *)(v275 + 40);
            valid = security_valid_security_enclave_reference_key(v274, 1, 0, &v415, v237, v238, v133, v134);
            objc_storeStrong((id *)(v275 + 40), v415);
            if (!valid)
              goto LABEL_236;
            v272 = v489;
          }
        }
        v277 = (__SecKey *)v272[3];
        if (!v277)
          goto LABEL_234;
        v278 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v414 = *(id *)(v278 + 40);
        v279 = security_valid_security_enclave_reference_key(v277, 0, 0, &v414, v237, v238, v133, v134);
        objc_storeStrong((id *)(v278 + 40), v414);
        if (v279)
        {
          v280 = (__SecKey *)v489[3];
          if (!v280
            || (v281 = (__SecCertificate *)v484[3]) == 0
            || (v282 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
                v413 = *(id *)(v282 + 40),
                v283 = security_certificate_matches_key(v280, 0, v281, &v413),
                objc_storeStrong((id *)(v282 + 40), v413),
                (v283 & 1) != 0))
          {
LABEL_234:
            if (!v268)
              goto LABEL_246;
            goto LABEL_237;
          }
        }
LABEL_236:
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1232, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Invalid reference key."), v133, v134, v332);
        v284 = objc_claimAutoreleasedReturnValue();
        v285 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v286 = *(void **)(v285 + 40);
        *(_QWORD *)(v285 + 40) = v284;

LABEL_237:
        v287 = MEMORY[0x1E0C81028];
        v288 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
        {
          v289 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v513 = v289;
          _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Deleting invalid keys/certificates: %@", buf, 0xCu);
        }

        delete_keychain_data(v360, v359, 0);
        delete_keychain_data(v360, v358, 0);
        delete_keychain_data(v360, v357, 0);
        delete_keychain_data(v360, v361, 0);
        delete_keychain_item(v360, v362, 0);
        delete_certificate(v360, v356, 0);
        delete_certificate(v360, v355, 0);
        v290 = v489;
        v291 = (const void *)v489[3];
        if (v291)
        {
          CFRelease(v291);
          v290 = v489;
        }
        v290[3] = 0;
        v292 = v484;
        v293 = v484[3];
        if (v293)
        {
          CFRelease(v293);
          v292 = v484;
        }
        v292[3] = 0;
        v294 = v480;
        v295 = (const void *)v480[3];
        if (v295)
        {
          CFRelease(v295);
          v294 = v480;
        }
        v294[3] = 0;
        v296 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v297 = *(void **)(v296 + 40);
        *(_QWORD *)(v296 + 40) = 0;

LABEL_246:
        if (!v489[3] || !v484[3] || !v480[3])
        {
          v38 = 0;
          v37 = 0;
          v338 = 0;
          v34 = 0;
LABEL_257:
          v137 = v352;
LABEL_128:
          v352 = v137;
          if (v341)
          {
            createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1340, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Missing or expired certificates, and network request explictly not attempted."), v133, v134, v332);
            v138 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (queuea && (v177 = (const void *)v489[3]) != 0)
            {
              v178 = (__SecKey *)CFRetain(v177);
              v497[3] = (uint64_t)v178;
            }
            else
            {
              v179 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v412 = *(id *)(v179 + 40);
              v178 = (__SecKey *)createReferenceKeyBlob(cf, v343, v365, &v412);
              objc_storeStrong((id *)(v179 + 40), v412);
              v497[3] = (uint64_t)v178;
              if (!v178)
              {
                createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1351, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to create reference key."), v180, v181, v332);
                v138 = objc_claimAutoreleasedReturnValue();
                goto LABEL_184;
              }
            }
            v182 = SecKeyCopyPublicKey(v178);
            v493[3] = (uint64_t)v182;
            if (v182)
            {
              v36 = SecKeyCopyExternalRepresentation(v182, &error);
              if (v36)
              {
                v190 = (__SecKey *)v497[3];
                v411 = 0;
                v191 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v410 = *(id *)(v191 + 40);
                security_create_external_representation(v190, &v411, &v410, v185, v186, v187, v188, v189);
                v192 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v411;
                objc_storeStrong((id *)(v191 + 40), v410);
                if (v192)
                {
                  objc_msgSend(v365, "setObject:forKeyedSubscript:", v35, CFSTR("SigningKeyAttributes"));
                  dispatch_get_global_queue(0, 0);
                  queuec = objc_claimAutoreleasedReturnValue();
                  v374[0] = MEMORY[0x1E0C809B0];
                  v374[1] = 3221225472;
                  v374[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_2;
                  v374[3] = &unk_1E98C7F60;
                  v365 = v365;
                  v375 = v365;
                  v195 = v367;
                  v196 = *(_QWORD *)(a1 + 56);
                  v367 = v195;
                  v376 = v195;
                  v390 = v196;
                  v54 = v192;
                  v377 = v54;
                  v391 = v510;
                  v392 = &v454;
                  v408 = v339;
                  v369 = v369;
                  v378 = v369;
                  v393 = &v472;
                  v394 = &v496;
                  v350 = v350;
                  v379 = v350;
                  v363 = v363;
                  v380 = v363;
                  v360 = v360;
                  v381 = v360;
                  v361 = v361;
                  v382 = v361;
                  v362 = v362;
                  v383 = v362;
                  v359 = v359;
                  v384 = v359;
                  v358 = v358;
                  v385 = v358;
                  v357 = v357;
                  v386 = v357;
                  v395 = &v438;
                  v396 = &v442;
                  v397 = &v466;
                  v398 = &v432;
                  v399 = &v428;
                  v400 = &v460;
                  v401 = &v500;
                  v402 = &v504;
                  v403 = &v488;
                  v404 = &v483;
                  v405 = &v479;
                  v34 = v34;
                  v387 = v34;
                  v406 = &v448;
                  v409 = v338;
                  v388 = *(id *)(a1 + 40);
                  v389 = *(id *)(a1 + 48);
                  v407 = &v492;
                  dispatch_async(queuec, v374);

                  v55 = &v375;
                  goto LABEL_40;
                }
                createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1396, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to encode RK as data."), v193, v194, v332);
                v138 = objc_claimAutoreleasedReturnValue();
                goto LABEL_185;
              }
              createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1364, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to encode RK public key as data."), v188, v189, v332);
              v138 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1358, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy RK public key."), v183, v184, v332);
              v138 = objc_claimAutoreleasedReturnValue();
            }
          }
LABEL_184:
          v36 = 0;
          v35 = 0;
LABEL_185:
          v221 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v222 = *(void **)(v221 + 40);
          *(_QWORD *)(v221 + 40) = v138;

LABEL_186:
          v223 = (const void *)v489[3];
          if (!v223 || !v34)
            goto LABEL_29;
          v224 = CFRetain(v223);
          v501[3] = (uint64_t)v224;
          objc_storeStrong(v505 + 5, v34);
          v225 = MEMORY[0x1E0C81028];
          v226 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v505[5], "objectAtIndexedSubscript:", 0);
            v335 = (void *)objc_claimAutoreleasedReturnValue();
            v227 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v505[5], "objectAtIndexedSubscript:", 0);
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            SecCertificateNotValidBefore();
            objc_msgSend(v227, "dateWithTimeIntervalSinceReferenceDate:");
            queued = (id)objc_claimAutoreleasedReturnValue();
            v228 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v505[5], "objectAtIndexedSubscript:", 0);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            SecCertificateNotValidAfter();
            objc_msgSend(v228, "dateWithTimeIntervalSinceReferenceDate:");
            v344 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v505[5], "objectAtIndexedSubscript:", 1);
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            v229 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v505[5], "objectAtIndexedSubscript:", 1);
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            SecCertificateNotValidBefore();
            objc_msgSend(v229, "dateWithTimeIntervalSinceReferenceDate:");
            v342 = (id)objc_claimAutoreleasedReturnValue();
            v230 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v505[5], "objectAtIndexedSubscript:", 1);
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            SecCertificateNotValidAfter();
            objc_msgSend(v230, "dateWithTimeIntervalSinceReferenceDate:");
            v231 = (id)objc_claimAutoreleasedReturnValue();
            v232 = v449[5];
            *(_DWORD *)buf = 138544898;
            v513 = v335;
            v514 = 2114;
            v515 = queued;
            v516 = 2114;
            v517 = v344;
            v518 = 2114;
            v519 = v333;
            v520 = 2114;
            v521 = v342;
            v522 = 2114;
            v523 = v231;
            v524 = 2114;
            v525 = v232;
            _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Returning cached certificates:\n* %{public}@\n    Not Valid Before: %{public}@\n  Not Valid After: %{public}@\n* %{public}@\n    Not Valid Before: %{public}@\n  Not Valid After: %{public}@\n* Server Timestamp: %{public}@\n", buf, 0x48u);

          }
          if (!v338)
            goto LABEL_29;
          v233 = MEMORY[0x1E0C81028];
          v234 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
          {
            v235 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138543362;
            v513 = v235;
            _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ (non-fatal, existing valid certificates)", buf, 0xCu);
          }

          v236 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v41 = *(void **)(v236 + 40);
          *(_QWORD *)(v236 + 40) = 0;
          goto LABEL_28;
        }
        v298 = v439[3];
        if (v298 == 0.0
          || (v437 == 0.0 ? (v299 = 1) : (v299 = v135), (v299 & 1) != 0 || (v300 = (void *)v449[5]) == 0))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v304 = objc_claimAutoreleasedReturnValue();
          v303 = (void *)v455[5];
          v455[5] = v304;
          v302 = 1;
        }
        else
        {
          objc_msgSend(v300, "dateByAddingTimeInterval:", v298 - v437);
          v301 = objc_claimAutoreleasedReturnValue();
          v302 = 0;
          v303 = (void *)v455[5];
          v455[5] = v301;
        }

        objc_msgSend((id)v455[5], "timeIntervalSinceReferenceDate");
        if (SecCertificateIsValid()
          && (objc_msgSend((id)v455[5], "timeIntervalSinceReferenceDate"), SecCertificateIsValid()))
        {
          SecCertificateNotValidAfter();
          v306 = v305;
          SecCertificateNotValidBefore();
          v308 = v307;
          objc_msgSend((id)v455[5], "timeIntervalSinceReferenceDate");
          v310 = v309;
          SecCertificateNotValidBefore();
          if (v310 - v311 >= (v306 - v308) * 0.9)
          {
            v313 = 1;
            v312 = 1;
            if ((v302 & 1) != 0)
              goto LABEL_267;
          }
          else
          {
            v312 = 0;
            v313 = 1;
            if ((v302 & 1) != 0)
              goto LABEL_267;
          }
        }
        else
        {
          v313 = 0;
          v312 = 0;
          if ((v302 & 1) != 0)
            goto LABEL_267;
        }
        if (*((_DWORD *)v433 + 6) != v436)
          v313 = 0;
LABEL_267:
        if (is_virtual_machine())
        {
          lockcrypto_query_certificate_properties((uint64_t)v484[3], CFSTR("1.2.840.113635.100.8.3"), 0);
          v314 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v314;
          if (v314)
          {
            objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("1021"));
            v315 = (void *)objc_claimAutoreleasedReturnValue();
            isNSData(v315);
            v316 = (void *)objc_claimAutoreleasedReturnValue();
            v317 = v316 == 0;

            if (!v317)
            {
              +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
              v318 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)objc_msgSend(v318, "copyAnswer:", CFSTR("UniqueDeviceID"));

              if (v37)
              {
                objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("1021"));
                v319 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v319, "hexString");
                v320 = (void *)objc_claimAutoreleasedReturnValue();
                v321 = objc_msgSend(v320, "caseInsensitiveCompare:", v37) == 0;

                if (v321)
                  goto LABEL_278;
                v322 = MEMORY[0x1E0C81028];
                v323 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v322, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("1021"));
                  v324 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v324, "hexString");
                  v325 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v513 = v325;
                  v514 = 2112;
                  v515 = v37;
                  _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Existing certificate's UDID (%@) does not match the current UDID (%@), VM may have moved to a new host. Treating key/certificates as invalid.", buf, 0x16u);

                }
                v313 = 0;
                queuea = 0;
              }
              else
              {
                v329 = MEMORY[0x1E0C81028];
                v330 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v329, OS_LOG_TYPE_FAULT))
                {
                  copy_current_process_name();
                  v331 = (void *)objc_claimAutoreleasedReturnValue();
                  __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_144_cold_1(v331, (uint64_t)v529);
                }
                v37 = 0;
              }

LABEL_278:
              if (v339)
              {
                v326 = v480[3];
                v527[1] = v484[3];
                v527[2] = v326;
                v327 = &v528;
                v328 = v455 + 5;
              }
              else
              {
                v526 = v484[3];
                v327 = v527;
                v328 = v480 + 3;
              }
              *v327 = *v328;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
              v34 = (id)objc_claimAutoreleasedReturnValue();
              if (v313)
              {
                v338 = 1;
                if (!v312)
                {
                  v36 = 0;
                  v35 = 0;
                  goto LABEL_186;
                }
              }
              else
              {
                v338 = 0;
              }
              goto LABEL_257;
            }
          }
        }
        else
        {
          v38 = 0;
        }
        v37 = 0;
        goto LABEL_278;
      }
      v197 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v421 = *(id *)(v197 + 40);
      load_certificate(v484 + 3, v360, v356, &v478, &v421);
      objc_storeStrong((id *)(v197 + 40), v421);
      if (v478 != -25300 && v478)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1109, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query existing leaf certificate (%@/%@): %d"), v198, v199, (uint64_t)v360);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v200 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v201 = *(void **)(v200 + 40);
        *(_QWORD *)(v200 + 40) = 0;

        v202 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v420 = *(id *)(v202 + 40);
        load_certificate((CFTypeRef *)v480 + 3, v360, v355, &v478, &v420);
        objc_storeStrong((id *)(v202 + 40), v420);
        if (v478 != -25300 && v478)
        {
          createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1117, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to query existing intermediate certificate (%@/%@): %d"), v203, v204, (uint64_t)v360);
          v33 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v205 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v206 = *(void **)(v205 + 40);
          *(_QWORD *)(v205 + 40) = 0;

          if (!v484[3] || !v480[3])
          {
            v351 = 0;
            v352 = 0;
            goto LABEL_197;
          }
          v207 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
          v208 = (void *)v473[5];
          v473[5] = (uint64_t)v207;

          if (v473[5])
          {
            v213 = SecCertificateCopyData((SecCertificateRef)v484[3]);
            if (v213)
            {
              objc_msgSend((id)v473[5], "appendData:", v213);
              v352 = SecCertificateCopyData((SecCertificateRef)v480[3]);

              if (v352)
              {
                objc_msgSend((id)v473[5], "appendData:", v352);
                v216 = (void *)v473[5];
                v217 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v419 = *(id *)(v217 + 40);
                v218 = store_keychain_data(v216, v360, v361, &v419);
                objc_storeStrong((id *)(v217 + 40), v419);
                if ((v218 & 1) != 0)
                {
                  delete_certificate(v360, v356, 0);
                  delete_certificate(v360, v355, 0);
                  v351 = 0;
                  goto LABEL_197;
                }
                createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1147, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to store leaf/intermediate certificates."), v219, v220, v332);
                v33 = objc_claimAutoreleasedReturnValue();
LABEL_167:
                v34 = 0;
                v35 = 0;
                v36 = 0;
                v37 = 0;
                v38 = 0;
                v39 = 0;
                v351 = 0;
                goto LABEL_27;
              }
              createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1140, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate data."), v214, v215, v332);
              v33 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1132, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate data."), v211, v212, v332);
              v33 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 1126, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate data."), v209, v210, v332);
            v33 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
LABEL_165:
    v34 = 0;
    v35 = 0;
    v36 = 0;
    goto LABEL_77;
  }
  createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke", 839, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."), v19, v20, v332);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v354 = 0;
  v350 = 0;
  cf = 0;
LABEL_26:
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v363 = 0;
  v364 = 0;
  v351 = 0;
  v352 = 0;
  v357 = 0;
  v358 = 0;
  v359 = 0;
  v360 = 0;
  v361 = 0;
  v362 = 0;
  v355 = 0;
  v356 = 0;
  v365 = 0;
LABEL_27:
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v41 = *(void **)(v40 + 40);
  *(_QWORD *)(v40 + 40) = v33;
LABEL_28:

LABEL_29:
  v42 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_249;
  block[3] = &unk_1E98C7F10;
  *(_OWORD *)queueb = *(_OWORD *)(a1 + 48);
  v43 = queueb[0];
  v371 = *(_OWORD *)queueb;
  v372 = &v500;
  v373 = &v504;
  dispatch_async(v42, block);
  v44 = v497;
  v45 = (const void *)v497[3];
  if (v45)
  {
    CFRelease(v45);
    v44 = v497;
  }
  v44[3] = 0;
  v46 = v493;
  v47 = (const void *)v493[3];
  if (v47)
  {
    CFRelease(v47);
    v46 = v493;
  }
  v46[3] = 0;
  v48 = v489;
  v49 = (const void *)v489[3];
  if (v49)
  {
    CFRelease(v49);
    v48 = v489;
  }
  v48[3] = 0;
  v50 = v484;
  v51 = v484[3];
  if (v51)
  {
    CFRelease(v51);
    v50 = v484;
  }
  v50[3] = 0;
  v52 = v480;
  v53 = (const void *)v480[3];
  if (v53)
  {
    CFRelease(v53);
    v52 = v480;
  }
  v54 = 0;
  v55 = (id *)&v371;
  v52[3] = 0;
LABEL_40:

  if (v14)
    CFRelease(v14);
  if (error)
    CFRelease(error);
  error = 0;
  if (cf)
    CFRelease(cf);
  _Block_object_dispose(&v428, 8);
  _Block_object_dispose(&v432, 8);
  _Block_object_dispose(&v438, 8);

  _Block_object_dispose(&v442, 8);
  _Block_object_dispose(&v448, 8);

  _Block_object_dispose(&v454, 8);
  _Block_object_dispose(&v460, 8);

  _Block_object_dispose(&v466, 8);
  _Block_object_dispose(&v472, 8);

  _Block_object_dispose(&v479, 8);
  _Block_object_dispose(&v483, 8);
  _Block_object_dispose(&v488, 8);
  _Block_object_dispose(&v492, 8);
  _Block_object_dispose(&v496, 8);
  _Block_object_dispose(&v500, 8);

  _Block_object_dispose(&v504, 8);
  _Block_object_dispose(v510, 8);

}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  _QWORD v43[4];
  __int128 v44;
  uint64_t v45;
  _QWORD v46[5];

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF012B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobileactivationd"), 4096);
  objc_msgSend(v3, "setRemoteObjectInterface:", v2);
  objc_msgSend(v3, "resume");
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v4, "objectForKey:", CFSTR("AccessControls"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("AccessControls"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("UseRKSigningInterface"));
  }
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("LocalAuthenticationContext"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("AppID"));
  v6 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_3;
  v46[3] = &unk_1E98C7E70;
  v46[4] = *(_QWORD *)(a1 + 152);
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v46);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_4;
  v43[3] = &unk_1E98C7EE8;
  v44 = *(_OWORD *)(a1 + 160);
  v45 = *(_QWORD *)(a1 + 152);
  objc_msgSend(v7, "issueClientCertificateWithReferenceKey:options:completion:", v8, v4, v43);
  objc_msgSend(v3, "invalidate");
  copyDeviceIdentitySerialQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5;
  v16[3] = &unk_1E98C7F38;
  v30 = *(_OWORD *)(a1 + 152);
  v31 = *(_QWORD *)(a1 + 168);
  v17 = *(id *)(a1 + 56);
  v41 = *(_BYTE *)(a1 + 296);
  v32 = *(_OWORD *)(a1 + 176);
  v18 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 80);
  v21 = *(id *)(a1 + 88);
  v22 = *(id *)(a1 + 96);
  v23 = *(id *)(a1 + 104);
  v24 = *(id *)(a1 + 112);
  v25 = *(id *)(a1 + 120);
  v10 = *(_OWORD *)(a1 + 208);
  v33 = *(_OWORD *)(a1 + 192);
  v34 = v10;
  v35 = *(_OWORD *)(a1 + 224);
  v26 = *(id *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 256);
  v36 = *(_OWORD *)(a1 + 240);
  v37 = v11;
  v38 = *(_QWORD *)(a1 + 272);
  v12 = *(id *)(a1 + 128);
  v13 = *(_QWORD *)(a1 + 280);
  v27 = v12;
  v39 = v13;
  v42 = *(_BYTE *)(a1 + 297);
  v28 = *(id *)(a1 + 136);
  v14 = *(id *)(a1 + 144);
  v15 = *(_QWORD *)(a1 + 288);
  v29 = v14;
  v40 = v15;
  dispatch_async(v9, v16);

}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_3", 1438, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."), a7, a8, v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RKCertification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isNSArray(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ServerResponseDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  isNSDate(v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v5;

}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFAllocator *v14;
  uint64_t i;
  SecCertificateRef v16;
  uint64_t v17;
  uint64_t v18;
  SecCertificateRef v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  NSObject *v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  const void *v35;
  uint64_t v36;
  const void *v37;
  uint64_t v38;
  const void *v39;
  void *v40;
  uint64_t v41;
  const void *v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  const void *v46;
  const void *v47;
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
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __SecKey *v73;
  void *v74;
  __SecCertificate *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  char v86;
  void *v87;
  void *v88;
  uint64_t v89;
  char v90;
  void *v91;
  void *v92;
  uint64_t v93;
  char v94;
  void *v95;
  void *v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  char v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  char v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  __CFString *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  __CFString *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  __int128 v166;
  void *v167;
  void *v168;
  _QWORD block[4];
  __int128 v170;
  __int128 v171;
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
  id obj;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  uint8_t buf[4];
  void *v188;
  __int16 v189;
  void *v190;
  __int16 v191;
  void *v192;
  __int16 v193;
  void *v194;
  __int16 v195;
  void *v196;
  __int16 v197;
  void *v198;
  __int16 v199;
  uint64_t v200;
  _BYTE v201[128];
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40))
    goto LABEL_16;
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40);
  if (!v9 || objc_msgSend(v9, "count") != 2 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40))
  {
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
    v21 = CFSTR("Invalid response.");
    v22 = 1457;
LABEL_15:
    createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", v22, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, v21, a7, a8, v159);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

LABEL_16:
    v26 = 0;
    goto LABEL_17;
  }
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v183, v201, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v184;
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v184 != v13)
          objc_enumerationMutation(v10);
        v16 = SecCertificateCreateWithData(v14, *(CFDataRef *)(*((_QWORD *)&v183 + 1) + 8 * i));
        if (!v16)
        {
          createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", 1471, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate."), v17, v18, v159);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
          v65 = *(void **)(v64 + 40);
          *(_QWORD *)(v64 + 40) = v63;

          goto LABEL_51;
        }
        v19 = v16;
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
        CFRelease(v19);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v183, v201, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_51:

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40))
    goto LABEL_16;
  if (*(_BYTE *)(a1 + 280))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40));
  v66 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v67 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
  v68 = *(void **)(v67 + 40);
  *(_QWORD *)(v67 + 40) = v66;

  v69 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40);
  if (!v69)
  {
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
    v21 = CFSTR("Failed to allocate data.");
    v22 = 1489;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "objectAtIndexedSubscript:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendData:", v70);

  v71 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "objectAtIndexedSubscript:", 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "appendData:", v72);

  v73 = *(__SecKey **)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24);
  v74 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v75 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v76 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
  obj = *(id *)(v76 + 40);
  LOBYTE(v73) = security_certificate_matches_key(v73, v74, v75, &obj);
  objc_storeStrong((id *)(v76 + 40), obj);

  if ((v73 & 1) == 0)
  {
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
    v21 = CFSTR("Invalid reference key.");
    v22 = 1497;
    goto LABEL_15;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v77 = *(void **)(a1 + 56);
    if (v77)
    {
      v78 = *(void **)(a1 + 64);
      v79 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      v181 = *(id *)(v79 + 40);
      v80 = delete_keychain_data(v77, v78, &v181);
      objc_storeStrong((id *)(v79 + 40), v181);
      if ((v80 & 1) != 0)
      {
        v83 = *(void **)(a1 + 56);
        v84 = *(void **)(a1 + 72);
        v85 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
        v180 = *(id *)(v85 + 40);
        v86 = delete_keychain_item(v83, v84, &v180);
        objc_storeStrong((id *)(v85 + 40), v180);
        if ((v86 & 1) != 0)
        {
          v87 = *(void **)(a1 + 56);
          v88 = *(void **)(a1 + 80);
          v89 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
          v179 = *(id *)(v89 + 40);
          v90 = delete_keychain_data(v87, v88, &v179);
          objc_storeStrong((id *)(v89 + 40), v179);
          if ((v90 & 1) != 0)
          {
            v91 = *(void **)(a1 + 56);
            v92 = *(void **)(a1 + 88);
            v93 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
            v178 = *(id *)(v93 + 40);
            v94 = delete_keychain_data(v91, v92, &v178);
            objc_storeStrong((id *)(v93 + 40), v178);
            if ((v94 & 1) != 0)
            {
              v95 = *(void **)(a1 + 56);
              v96 = *(void **)(a1 + 96);
              v97 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
              v177 = *(id *)(v97 + 40);
              v98 = delete_keychain_data(v95, v96, &v177);
              objc_storeStrong((id *)(v97 + 40), v177);
              if ((v98 & 1) != 0)
              {
                if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24) != 0.0)
                {
                  v99 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24, 8);
                  v100 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
                  v101 = *(void **)(v100 + 40);
                  *(_QWORD *)(v100 + 40) = v99;

                  v104 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40);
                  if (!v104)
                  {
                    v153 = CFSTR("Failed to encode monotonic time.");
                    v154 = 1537;
                    goto LABEL_89;
                  }
                  v105 = *(void **)(a1 + 56);
                  v106 = *(void **)(a1 + 80);
                  v107 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
                  v176 = *(id *)(v107 + 40);
                  v108 = store_keychain_data(v104, v105, v106, &v176);
                  objc_storeStrong((id *)(v107 + 40), v176);
                  if ((v108 & 1) == 0)
                  {
                    v155 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
                    v153 = CFSTR("Failed to store monotonic time.");
                    v154 = 1542;
                    goto LABEL_93;
                  }
                  v109 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 24, 4);
                  v110 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8);
                  v111 = *(void **)(v110 + 40);
                  *(_QWORD *)(v110 + 40) = v109;

                  v112 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 40);
                  if (!v112)
                  {
                    v153 = CFSTR("Failed to encode RTC reset count.");
                    v154 = 1548;
                    goto LABEL_89;
                  }
                  v113 = *(void **)(a1 + 56);
                  v114 = *(void **)(a1 + 88);
                  v115 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
                  v175 = *(id *)(v115 + 40);
                  v116 = store_keychain_data(v112, v113, v114, &v175);
                  objc_storeStrong((id *)(v115 + 40), v175);
                  if ((v116 & 1) == 0)
                  {
                    v155 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
                    v153 = CFSTR("Failed to store RTC reset count.");
                    v154 = 1553;
                    goto LABEL_93;
                  }
                }
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), "timeIntervalSinceReferenceDate");
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24) = v117;
                v118 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24, 8);
                v119 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8);
                v120 = *(void **)(v119 + 40);
                *(_QWORD *)(v119 + 40) = v118;

                v121 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 40);
                if (v121)
                {
                  v122 = *(void **)(a1 + 56);
                  v123 = *(void **)(a1 + 96);
                  v124 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
                  v174 = *(id *)(v124 + 40);
                  v125 = store_keychain_data(v121, v122, v123, &v174);
                  objc_storeStrong((id *)(v124 + 40), v174);
                  if ((v125 & 1) != 0)
                  {
                    v126 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24);
                    v127 = *(void **)(a1 + 56);
                    v128 = *(void **)(a1 + 72);
                    v129 = *(void **)(a1 + 104);
                    v130 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
                    v173 = *(id *)(v130 + 40);
                    v131 = store_keychain_item(v126, v127, v128, v129, &v173);
                    objc_storeStrong((id *)(v130 + 40), v173);
                    if ((v131 & 1) != 0)
                    {
                      v132 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40);
                      v133 = *(void **)(a1 + 56);
                      v134 = *(void **)(a1 + 64);
                      v135 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
                      v172 = *(id *)(v135 + 40);
                      v136 = store_keychain_data(v132, v133, v134, &v172);
                      objc_storeStrong((id *)(v135 + 40), v172);
                      if ((v136 & 1) != 0)
                      {
                        v26 = 1;
                        goto LABEL_76;
                      }
                      v155 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
                      v153 = CFSTR("Failed to store leaf/intermediate certificates.");
                      v154 = 1577;
                    }
                    else
                    {
                      v155 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
                      v153 = CFSTR("Failed to store reference key.");
                      v154 = 1572;
                    }
                  }
                  else
                  {
                    v155 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
                    v153 = CFSTR("Failed to store server timestamp.");
                    v154 = 1567;
                  }
LABEL_93:
                  createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", v154, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v155, v153, v102, v103, v159);
                  v156 = objc_claimAutoreleasedReturnValue();
                  v157 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
                  v158 = *(void **)(v157 + 40);
                  *(_QWORD *)(v157 + 40) = v156;

                  v26 = 1;
                  goto LABEL_17;
                }
                v153 = CFSTR("Failed to encode server timestamp.");
                v154 = 1562;
LABEL_89:
                v155 = 0;
                goto LABEL_93;
              }
              v147 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
              v148 = CFSTR("Failed to delete server timestamp.");
              v149 = 1530;
            }
            else
            {
              v147 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
              v148 = CFSTR("Failed to delete RTC reset count.");
              v149 = 1525;
            }
          }
          else
          {
            v147 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
            v148 = CFSTR("Failed to delete monotonic time.");
            v149 = 1520;
          }
        }
        else
        {
          v147 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
          v148 = CFSTR("Failed to delete reference key.");
          v149 = 1515;
        }
      }
      else
      {
        v147 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
        v148 = CFSTR("Failed to delete leaf/intermediate certificates.");
        v149 = 1510;
      }
      createMobileActivationError((uint64_t)"DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_5", v149, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v147, v148, v81, v82, v159);
      v150 = objc_claimAutoreleasedReturnValue();
      v151 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      v152 = *(void **)(v151 + 40);
      *(_QWORD *)(v151 + 40) = v150;

      v26 = 1;
      goto LABEL_17;
    }
  }
  v26 = 0;
LABEL_76:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24) = CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8)
                                                                                       + 24));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), *(id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 0);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 0);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    SecCertificateNotValidBefore();
    objc_msgSend(v138, "dateWithTimeIntervalSinceReferenceDate:");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 0);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    SecCertificateNotValidAfter();
    objc_msgSend(v139, "dateWithTimeIntervalSinceReferenceDate:");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 1);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 1);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    SecCertificateNotValidBefore();
    objc_msgSend(v141, "dateWithTimeIntervalSinceReferenceDate:");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 1);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    SecCertificateNotValidAfter();
    objc_msgSend(v143, "dateWithTimeIntervalSinceReferenceDate:");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40);
    *(_DWORD *)buf = 138544898;
    v188 = v137;
    v189 = 2114;
    v190 = v163;
    v191 = 2114;
    v192 = v140;
    v193 = 2114;
    v194 = v160;
    v195 = 2114;
    v196 = v142;
    v197 = 2114;
    v198 = v145;
    v199 = 2114;
    v200 = v146;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Returning newly obtained certificates:\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* Server Timestamp: %{public}@\n", buf, 0x48u);

  }
LABEL_17:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40))
  {
    if ((v26 | mobileactivationErrorHasDomainAndErrorCode(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), (void *)*MEMORY[0x1E0CA9B28], -3)) == 1&& *(_QWORD *)(a1 + 48)&& *(_QWORD *)(a1 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v188 = v40;
        _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Deleting invalid keys/certificates: %@", buf, 0xCu);
      }
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 64), 0);
      delete_keychain_item(*(void **)(a1 + 56), *(void **)(a1 + 72), 0);
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 80), 0);
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 88), 0);
      delete_keychain_data(*(void **)(a1 + 56), *(void **)(a1 + 96), 0);
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8);
      v42 = *(const void **)(v41 + 24);
      if (v42)
      {
        CFRelease(v42);
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8);
      }
      *(_QWORD *)(v41 + 24) = 0;
      v43 = *(_QWORD *)(*(_QWORD *)(a1 + 248) + 8);
      v44 = *(const void **)(v43 + 24);
      if (v44)
      {
        CFRelease(v44);
        v43 = *(_QWORD *)(*(_QWORD *)(a1 + 248) + 8);
      }
      *(_QWORD *)(v43 + 24) = 0;
      v45 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8);
      v46 = *(const void **)(v45 + 24);
      if (v46)
      {
        CFRelease(v46);
        v45 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8);
      }
      *(_QWORD *)(v45 + 24) = 0;
    }
    v47 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 24);
    if (v47 && *(_QWORD *)(a1 + 112))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24) = CFRetain(v47);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), *(id *)(a1 + 112));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 0);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        SecCertificateNotValidBefore();
        objc_msgSend(v49, "dateWithTimeIntervalSinceReferenceDate:");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 0);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        SecCertificateNotValidAfter();
        objc_msgSend(v50, "dateWithTimeIntervalSinceReferenceDate:");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        SecCertificateNotValidBefore();
        objc_msgSend(v53, "dateWithTimeIntervalSinceReferenceDate:");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40), "objectAtIndexedSubscript:", 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        SecCertificateNotValidAfter();
        objc_msgSend(v56, "dateWithTimeIntervalSinceReferenceDate:");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8) + 40);
        *(_DWORD *)buf = 138544898;
        v188 = v48;
        v189 = 2114;
        v190 = v162;
        v191 = 2114;
        v192 = v51;
        v193 = 2114;
        v194 = v52;
        v195 = 2114;
        v196 = v55;
        v197 = 2114;
        v198 = v58;
        v199 = 2114;
        v200 = v59;
        _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Returning cached certificates:\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* %{public}@\n    Not Valid Before: %{public}@\n    Not Valid After: %{public}@\n* Server Timestamp: %{public}@\n", buf, 0x48u);

      }
      if (*(_BYTE *)(a1 + 281))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v60 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
          *(_DWORD *)buf = 138543362;
          v188 = v60;
          _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ (non-fatal, existing valid certificates)", buf, 0xCu);
        }
        v61 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
        v62 = *(void **)(v61 + 40);
        *(_QWORD *)(v61 + 40) = 0;

      }
    }
  }
  v27 = *(NSObject **)(a1 + 120);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_246;
  block[3] = &unk_1E98C7F10;
  v166 = *(_OWORD *)(a1 + 128);
  v28 = (id)v166;
  v29 = *(_OWORD *)(a1 + 224);
  v170 = v166;
  v171 = v29;
  dispatch_async(v27, block);
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 168) + 8);
  v31 = *(const void **)(v30 + 24);
  if (v31)
  {
    CFRelease(v31);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 168) + 8);
  }
  *(_QWORD *)(v30 + 24) = 0;
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 272) + 8);
  v33 = *(const void **)(v32 + 24);
  if (v33)
  {
    CFRelease(v33);
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 272) + 8);
  }
  *(_QWORD *)(v32 + 24) = 0;
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8);
  v35 = *(const void **)(v34 + 24);
  if (v35)
  {
    CFRelease(v35);
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8);
  }
  *(_QWORD *)(v34 + 24) = 0;
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 248) + 8);
  v37 = *(const void **)(v36 + 24);
  if (v37)
  {
    CFRelease(v37);
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 248) + 8);
  }
  *(_QWORD *)(v36 + 24) = 0;
  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8);
  v39 = *(const void **)(v38 + 24);
  if (v39)
  {
    CFRelease(v39);
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8);
  }
  *(_QWORD *)(v38 + 24) = 0;

}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_246(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  return result;
}

uint64_t __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_249(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  return result;
}

void __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_144_cold_1(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  *(_DWORD *)a2 = 138543618;
  *(_QWORD *)(a2 + 4) = v3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = CFSTR("UniqueDeviceID");
  _os_log_fault_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%{public}@ failed to query %@ (non-fatal). Client should adopt new entitlement (com.apple.private.MobileGestalt.AllowedProtectedKeys / UniqueDeviceID).", (uint8_t *)a2, 0x16u);

}

@end
