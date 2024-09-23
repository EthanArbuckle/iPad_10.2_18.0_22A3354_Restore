@implementation MPCPlaybackEngineLoggingConsumer

- (void)subscribeToEventStream:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  void *v163;
  id v164;
  void *v165;
  id v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  void *v189;
  id v190;
  void *v191;
  id v192;
  void *v193;
  id v194;
  void *v195;
  id v196;
  _QWORD v197[5];
  id v198;
  _QWORD v199[5];
  id v200;
  _QWORD v201[5];
  id v202;
  _QWORD v203[5];
  id v204;
  _QWORD v205[5];
  id v206;
  _QWORD v207[5];
  id v208;
  _QWORD v209[5];
  id v210;
  _QWORD v211[5];
  id v212;
  _QWORD v213[5];
  id v214;
  _QWORD v215[5];
  id v216;
  _QWORD v217[5];
  id v218;
  _QWORD v219[5];
  id v220;
  _QWORD v221[5];
  id v222;
  _QWORD v223[5];
  id v224;
  _QWORD v225[5];
  id v226;
  _QWORD v227[5];
  id v228;
  _QWORD v229[5];
  id v230;
  _QWORD v231[5];
  id v232;
  _QWORD v233[5];
  id v234;
  _QWORD v235[5];
  id v236;
  _QWORD v237[5];
  id v238;
  _QWORD v239[5];
  id v240;
  _QWORD v241[5];
  id v242;
  _QWORD v243[5];
  id v244;
  _QWORD v245[5];
  id v246;
  _QWORD v247[5];
  id v248;
  _QWORD v249[5];
  id v250;
  _QWORD v251[5];
  id v252;
  _QWORD v253[5];
  id v254;
  _QWORD v255[5];
  id v256;
  _QWORD v257[5];
  id v258;
  _QWORD v259[5];
  id v260;
  _QWORD v261[5];
  id v262;
  _QWORD v263[5];
  id v264;
  _QWORD v265[5];
  id v266;
  _QWORD v267[5];
  id v268;
  _QWORD v269[5];
  id v270;
  _QWORD v271[5];
  id v272;
  _QWORD v273[5];
  id v274;
  _QWORD v275[5];
  id v276;
  _QWORD v277[5];
  id v278;
  _QWORD v279[5];
  id v280;
  _QWORD v281[5];
  id v282;
  _QWORD v283[5];
  id v284;
  _QWORD v285[5];
  id v286;
  _QWORD v287[5];
  id v288;
  _QWORD v289[5];
  id v290;
  _QWORD v291[5];
  id v292;
  _QWORD v293[5];
  id v294;
  _QWORD v295[5];
  id v296;
  _QWORD v297[5];
  id v298;
  _QWORD v299[5];
  id v300;
  _QWORD v301[5];
  id v302;
  _QWORD v303[5];
  id v304;
  _QWORD v305[5];
  id v306;
  _QWORD v307[5];
  id v308;
  _QWORD v309[5];
  id v310;
  _QWORD v311[5];
  id v312;
  _QWORD v313[5];
  id v314;
  _QWORD v315[5];
  id v316;
  _QWORD v317[5];
  id v318;
  _QWORD v319[5];
  id v320;
  _QWORD v321[5];
  id v322;
  _QWORD v323[5];
  id v324;
  _QWORD v325[5];
  id v326;
  _QWORD v327[5];
  id v328;
  _QWORD v329[5];
  id v330;
  _QWORD v331[5];
  id v332;
  _QWORD v333[5];
  id v334;
  _QWORD v335[5];
  id v336;
  _QWORD v337[5];
  id v338;
  _QWORD v339[5];
  id v340;
  _QWORD v341[5];
  id v342;
  _QWORD v343[5];
  id v344;
  _QWORD v345[5];
  id v346;
  _QWORD v347[5];
  id v348;
  _QWORD v349[5];
  id v350;
  _QWORD v351[5];
  id v352;
  _QWORD v353[5];
  id v354;
  _QWORD v355[5];
  id v356;
  _QWORD v357[5];
  id v358;
  _QWORD v359[5];
  id v360;
  _QWORD v361[5];
  id v362;
  _QWORD v363[5];
  id v364;
  _QWORD v365[5];
  id v366;
  _QWORD v367[5];
  id v368;
  _QWORD v369[5];
  id v370;
  _QWORD v371[5];
  id v372;
  _QWORD v373[5];
  id v374;
  _QWORD v375[5];
  id v376;
  uint8_t buf[4];
  void *v378;
  __int16 v379;
  void *v380;
  __int16 v381;
  void *v382;
  __int16 v383;
  pid_t v384;
  uint64_t v385;

  v3 = MEMORY[0x24BDAC7A8](self, a2, a3);
  v5 = v4;
  v6 = v3;
  v385 = *MEMORY[0x24BDAC8D0];
  v7 = v4;
  objc_storeStrong((id *)(v6 + 64), v5);
  *(_QWORD *)(v6 + 56) = -1;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    MSVLogDateFormatter();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCE60];
    MSVGetProcessLaunchTime();
    objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "infoDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDBD298]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v378 = v12;
    v379 = 2114;
    v380 = v13;
    v381 = 2114;
    v382 = v16;
    v383 = 1024;
    v384 = getpid();
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@  ═════ STREAM START ═══════════ %{public}@ [%d] ══════════════════════════", buf, 0x26u);

  }
  v17 = MEMORY[0x24BDAC760];
  v18 = *(void **)(v6 + 64);
  v375[0] = MEMORY[0x24BDAC760];
  v375[1] = 3221225472;
  v375[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke;
  v375[3] = &unk_24CAB1B98;
  v375[4] = v6;
  v19 = v7;
  v376 = v19;
  objc_msgSend(v18, "subscribeToEventType:handler:", CFSTR("session-begin"), v375);
  v20 = *(void **)(v6 + 64);
  v373[0] = v17;
  v373[1] = 3221225472;
  v373[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_3;
  v373[3] = &unk_24CAB1B98;
  v373[4] = v6;
  v21 = v19;
  v374 = v21;
  objc_msgSend(v20, "subscribeToEventType:handler:", CFSTR("session-reuse"), v373);
  v22 = *(void **)(v6 + 64);
  v371[0] = v17;
  v371[1] = 3221225472;
  v371[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_4;
  v371[3] = &unk_24CAB1B98;
  v371[4] = v6;
  v23 = v21;
  v372 = v23;
  objc_msgSend(v22, "subscribeToEventType:handler:", CFSTR("session-end"), v371);
  v24 = *(void **)(v6 + 64);
  v369[0] = v17;
  v369[1] = 3221225472;
  v369[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_5;
  v369[3] = &unk_24CAB1B98;
  v369[4] = v6;
  v25 = v23;
  v370 = v25;
  objc_msgSend(v24, "subscribeToEventType:handler:", CFSTR("session-restore-begin"), v369);
  v26 = *(void **)(v6 + 64);
  v367[0] = v17;
  v367[1] = 3221225472;
  v367[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_6;
  v367[3] = &unk_24CAB1B98;
  v367[4] = v6;
  v27 = v25;
  v368 = v27;
  objc_msgSend(v26, "subscribeToEventType:handler:", CFSTR("session-restore-end"), v367);
  v28 = *(void **)(v6 + 64);
  v365[0] = v17;
  v365[1] = 3221225472;
  v365[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_10;
  v365[3] = &unk_24CAB1B98;
  v365[4] = v6;
  v29 = v27;
  v366 = v29;
  objc_msgSend(v28, "subscribeToEventType:handler:", CFSTR("session-reset"), v365);
  v30 = *(void **)(v6 + 64);
  v363[0] = v17;
  v363[1] = 3221225472;
  v363[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_11;
  v363[3] = &unk_24CAB1B98;
  v363[4] = v6;
  v31 = v29;
  v364 = v31;
  objc_msgSend(v30, "subscribeToEventType:handler:", CFSTR("application-termination"), v363);
  v32 = *(void **)(v6 + 64);
  v361[0] = v17;
  v361[1] = 3221225472;
  v361[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_12;
  v361[3] = &unk_24CAB1B98;
  v361[4] = v6;
  v33 = v31;
  v362 = v33;
  objc_msgSend(v32, "subscribeToEventType:handler:", CFSTR("application-foreground"), v361);
  v34 = *(void **)(v6 + 64);
  v359[0] = v17;
  v359[1] = 3221225472;
  v359[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_13;
  v359[3] = &unk_24CAB1B98;
  v359[4] = v6;
  v35 = v33;
  v360 = v35;
  objc_msgSend(v34, "subscribeToEventType:handler:", CFSTR("application-background"), v359);
  v36 = *(void **)(v6 + 64);
  v357[0] = v17;
  v357[1] = 3221225472;
  v357[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_14;
  v357[3] = &unk_24CAB1B98;
  v357[4] = v6;
  v37 = v35;
  v358 = v37;
  objc_msgSend(v36, "subscribeToEventType:handler:", CFSTR("device-changed"), v357);
  v38 = *(void **)(v6 + 64);
  v355[0] = v17;
  v355[1] = 3221225472;
  v355[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_17;
  v355[3] = &unk_24CAB1B98;
  v355[4] = v6;
  v39 = v37;
  v356 = v39;
  objc_msgSend(v38, "subscribeToEventType:handler:", CFSTR("network-reachability-changed"), v355);
  v40 = *(void **)(v6 + 64);
  v353[0] = v17;
  v353[1] = 3221225472;
  v353[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_18;
  v353[3] = &unk_24CAB1B98;
  v353[4] = v6;
  v41 = v39;
  v354 = v41;
  objc_msgSend(v40, "subscribeToEventType:handler:", CFSTR("network-type-changed"), v353);
  v42 = *(void **)(v6 + 64);
  v351[0] = v17;
  v351[1] = 3221225472;
  v351[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_26;
  v351[3] = &unk_24CAB1B98;
  v351[4] = v6;
  v43 = v41;
  v352 = v43;
  objc_msgSend(v42, "subscribeToEventType:handler:", CFSTR("account-begin"), v351);
  v44 = *(void **)(v6 + 64);
  v349[0] = v17;
  v349[1] = 3221225472;
  v349[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_2;
  v349[3] = &unk_24CAB1B98;
  v349[4] = v6;
  v45 = v43;
  v350 = v45;
  objc_msgSend(v44, "subscribeToEventType:handler:", CFSTR("account-update"), v349);
  v46 = *(void **)(v6 + 64);
  v347[0] = v17;
  v347[1] = 3221225472;
  v347[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_3;
  v347[3] = &unk_24CAB1B98;
  v347[4] = v6;
  v47 = v45;
  v348 = v47;
  objc_msgSend(v46, "subscribeToEventType:handler:", CFSTR("remote-control-begin"), v347);
  v48 = *(void **)(v6 + 64);
  v345[0] = v17;
  v345[1] = 3221225472;
  v345[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_27;
  v345[3] = &unk_24CAB1B98;
  v345[4] = v6;
  v49 = v47;
  v346 = v49;
  objc_msgSend(v48, "subscribeToEventType:handler:", CFSTR("remote-control-timeout"), v345);
  v50 = *(void **)(v6 + 64);
  v343[0] = v17;
  v343[1] = 3221225472;
  v343[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_38;
  v343[3] = &unk_24CAB1B98;
  v343[4] = v6;
  v51 = v49;
  v344 = v51;
  objc_msgSend(v50, "subscribeToEventType:handler:", CFSTR("remote-control-end"), v343);
  v52 = *(void **)(v6 + 64);
  v341[0] = v17;
  v341[1] = 3221225472;
  v341[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_39;
  v341[3] = &unk_24CAB1B98;
  v341[4] = v6;
  v53 = v51;
  v342 = v53;
  objc_msgSend(v52, "subscribeToEventType:handler:", CFSTR("remote-control-commands-changed"), v341);
  v54 = *(void **)(v6 + 64);
  v339[0] = v17;
  v339[1] = 3221225472;
  v339[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_68;
  v339[3] = &unk_24CAB1B98;
  v339[4] = v6;
  v55 = v53;
  v340 = v55;
  objc_msgSend(v54, "subscribeToEventType:handler:", CFSTR("queue-add"), v339);
  v56 = *(void **)(v6 + 64);
  v337[0] = v17;
  v337[1] = 3221225472;
  v337[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_73;
  v337[3] = &unk_24CAB1B98;
  v337[4] = v6;
  v57 = v55;
  v338 = v57;
  objc_msgSend(v56, "subscribeToEventType:handler:", CFSTR("queue-item-add"), v337);
  v58 = *(void **)(v6 + 64);
  v335[0] = v17;
  v335[1] = 3221225472;
  v335[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_74;
  v335[3] = &unk_24CAB1B98;
  v335[4] = v6;
  v59 = v57;
  v336 = v59;
  objc_msgSend(v58, "subscribeToEventType:handler:", CFSTR("queue-item-remove"), v335);
  v60 = *(void **)(v6 + 64);
  v333[0] = v17;
  v333[1] = 3221225472;
  v333[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_75;
  v333[3] = &unk_24CAB1B98;
  v333[4] = v6;
  v61 = v59;
  v334 = v61;
  objc_msgSend(v60, "subscribeToEventType:handler:", CFSTR("queue-item-reorder"), v333);
  v62 = *(void **)(v6 + 64);
  v331[0] = v17;
  v331[1] = 3221225472;
  v331[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_76;
  v331[3] = &unk_24CAB1B98;
  v331[4] = v6;
  v63 = v61;
  v332 = v63;
  objc_msgSend(v62, "subscribeToEventType:handler:", CFSTR("queue-load-begin"), v331);
  v64 = *(void **)(v6 + 64);
  v329[0] = v17;
  v329[1] = 3221225472;
  v329[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_77;
  v329[3] = &unk_24CAB1B98;
  v329[4] = v6;
  v65 = v63;
  v330 = v65;
  objc_msgSend(v64, "subscribeToEventType:handler:", CFSTR("queue-load-end"), v329);
  v66 = *(void **)(v6 + 64);
  v327[0] = v17;
  v327[1] = 3221225472;
  v327[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_78;
  v327[3] = &unk_24CAB1B98;
  v327[4] = v6;
  v67 = v65;
  v328 = v67;
  objc_msgSend(v66, "subscribeToEventType:handler:", CFSTR("container-begin"), v327);
  v68 = *(void **)(v6 + 64);
  v325[0] = v17;
  v325[1] = 3221225472;
  v325[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_79;
  v325[3] = &unk_24CAB1B98;
  v325[4] = v6;
  v69 = v67;
  v326 = v69;
  objc_msgSend(v68, "subscribeToEventType:handler:", CFSTR("container-end"), v325);
  v70 = *(void **)(v6 + 64);
  v323[0] = v17;
  v323[1] = 3221225472;
  v323[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_80;
  v323[3] = &unk_24CAB1B98;
  v323[4] = v6;
  v71 = v69;
  v324 = v71;
  objc_msgSend(v70, "subscribeToEventType:handler:", CFSTR("item-begin"), v323);
  v72 = *(void **)(v6 + 64);
  v321[0] = v17;
  v321[1] = 3221225472;
  v321[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_81;
  v321[3] = &unk_24CAB1B98;
  v321[4] = v6;
  v73 = v71;
  v322 = v73;
  objc_msgSend(v72, "subscribeToEventType:handler:", CFSTR("item-update"), v321);
  v74 = *(void **)(v6 + 64);
  v319[0] = v17;
  v319[1] = 3221225472;
  v319[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_82;
  v319[3] = &unk_24CAB1B98;
  v319[4] = v6;
  v75 = v73;
  v320 = v75;
  objc_msgSend(v74, "subscribeToEventType:handler:", CFSTR("item-position-jump"), v319);
  v76 = *(void **)(v6 + 64);
  v317[0] = v17;
  v317[1] = 3221225472;
  v317[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_83;
  v317[3] = &unk_24CAB1B98;
  v317[4] = v6;
  v77 = v75;
  v318 = v77;
  objc_msgSend(v76, "subscribeToEventType:handler:", CFSTR("item-position-tick"), v317);
  v78 = *(void **)(v6 + 64);
  v315[0] = v17;
  v315[1] = 3221225472;
  v315[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_84;
  v315[3] = &unk_24CAB1B98;
  v315[4] = v6;
  v79 = v77;
  v316 = v79;
  objc_msgSend(v78, "subscribeToEventType:handler:", CFSTR("item-pause"), v315);
  v80 = *(void **)(v6 + 64);
  v313[0] = v17;
  v313[1] = 3221225472;
  v313[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_85;
  v313[3] = &unk_24CAB1B98;
  v313[4] = v6;
  v81 = v79;
  v314 = v81;
  objc_msgSend(v80, "subscribeToEventType:handler:", CFSTR("item-rate-changed"), v313);
  v82 = *(void **)(v6 + 64);
  v311[0] = v17;
  v311[1] = 3221225472;
  v311[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_86;
  v311[3] = &unk_24CAB1B98;
  v311[4] = v6;
  v83 = v81;
  v312 = v83;
  objc_msgSend(v82, "subscribeToEventType:handler:", CFSTR("item-first-audio-frame"), v311);
  if (MSVDeviceOSIsInternalInstall())
  {
    v84 = *(void **)(v6 + 64);
    v309[0] = v17;
    v309[1] = 3221225472;
    v309[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_90;
    v309[3] = &unk_24CAB1B98;
    v309[4] = v6;
    v310 = v83;
    objc_msgSend(v84, "subscribeToEventType:handler:", CFSTR("item-ready-for-metrics"), v309);

  }
  v85 = *(void **)(v6 + 64);
  v307[0] = v17;
  v307[1] = 3221225472;
  v307[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_91;
  v307[3] = &unk_24CAB1B98;
  v307[4] = v6;
  v86 = v83;
  v308 = v86;
  objc_msgSend(v85, "subscribeToEventType:handler:", CFSTR("item-resume"), v307);
  v87 = *(void **)(v6 + 64);
  v305[0] = v17;
  v305[1] = 3221225472;
  v305[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_92;
  v305[3] = &unk_24CAB1B98;
  v305[4] = v6;
  v88 = v86;
  v306 = v88;
  objc_msgSend(v87, "subscribeToEventType:handler:", CFSTR("item-ready-to-play"), v305);
  v89 = *(void **)(v6 + 64);
  v303[0] = v17;
  v303[1] = 3221225472;
  v303[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_93;
  v303[3] = &unk_24CAB1B98;
  v303[4] = v6;
  v90 = v88;
  v304 = v90;
  objc_msgSend(v89, "subscribeToEventType:handler:", CFSTR("item-buffer-ready"), v303);
  v91 = *(void **)(v6 + 64);
  v301[0] = v17;
  v301[1] = 3221225472;
  v301[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_94;
  v301[3] = &unk_24CAB1B98;
  v301[4] = v6;
  v92 = v90;
  v302 = v92;
  objc_msgSend(v91, "subscribeToEventType:handler:", CFSTR("item-buffer-stall"), v301);
  v93 = *(void **)(v6 + 64);
  v299[0] = v17;
  v299[1] = 3221225472;
  v299[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_95;
  v299[3] = &unk_24CAB1B98;
  v299[4] = v6;
  v94 = v92;
  v300 = v94;
  objc_msgSend(v93, "subscribeToEventType:handler:", CFSTR("item-buffer-finish"), v299);
  v95 = *(void **)(v6 + 64);
  v297[0] = v17;
  v297[1] = 3221225472;
  v297[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_96;
  v297[3] = &unk_24CAB1B98;
  v297[4] = v6;
  v96 = v94;
  v298 = v96;
  objc_msgSend(v95, "subscribeToEventType:handler:", CFSTR("item-key-request-begin"), v297);
  v97 = *(void **)(v6 + 64);
  v295[0] = v17;
  v295[1] = 3221225472;
  v295[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_97;
  v295[3] = &unk_24CAB1B98;
  v295[4] = v6;
  v98 = v96;
  v296 = v98;
  objc_msgSend(v97, "subscribeToEventType:handler:", CFSTR("item-key-request-end"), v295);
  v99 = *(void **)(v6 + 64);
  v293[0] = v17;
  v293[1] = 3221225472;
  v293[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_98;
  v293[3] = &unk_24CAB1B98;
  v293[4] = v6;
  v100 = v98;
  v294 = v100;
  objc_msgSend(v99, "subscribeToEventType:handler:", CFSTR("item-timed-metadata-ping"), v293);
  v101 = *(void **)(v6 + 64);
  v291[0] = v17;
  v291[1] = 3221225472;
  v291[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_99;
  v291[3] = &unk_24CAB1B98;
  v291[4] = v6;
  v102 = v100;
  v292 = v102;
  objc_msgSend(v101, "subscribeToEventType:handler:", CFSTR("item-end"), v291);
  v103 = *(void **)(v6 + 64);
  v289[0] = v17;
  v289[1] = 3221225472;
  v289[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_100;
  v289[3] = &unk_24CAB1B98;
  v289[4] = v6;
  v104 = v102;
  v290 = v104;
  objc_msgSend(v103, "subscribeToEventType:handler:", CFSTR("audio-format-changed"), v289);
  v105 = *(void **)(v6 + 64);
  v287[0] = v17;
  v287[1] = 3221225472;
  v287[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_101;
  v287[3] = &unk_24CAB1B98;
  v287[4] = v6;
  v106 = v104;
  v288 = v106;
  objc_msgSend(v105, "subscribeToEventType:handler:", CFSTR("asset-selection"), v287);
  v107 = *(void **)(v6 + 64);
  v285[0] = v17;
  v285[1] = 3221225472;
  v285[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_105;
  v285[3] = &unk_24CAB1B98;
  v285[4] = v6;
  v108 = v106;
  v286 = v108;
  objc_msgSend(v107, "subscribeToEventType:handler:", CFSTR("audio-format-selection"), v285);
  v109 = *(void **)(v6 + 64);
  v283[0] = v17;
  v283[1] = 3221225472;
  v283[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_108;
  v283[3] = &unk_24CAB1B98;
  v283[4] = v6;
  v110 = v108;
  v284 = v110;
  objc_msgSend(v109, "subscribeToEventType:handler:", CFSTR("asset-load-begin"), v283);
  v111 = *(void **)(v6 + 64);
  v281[0] = v17;
  v281[1] = 3221225472;
  v281[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_109;
  v281[3] = &unk_24CAB1B98;
  v281[4] = v6;
  v112 = v110;
  v282 = v112;
  objc_msgSend(v111, "subscribeToEventType:handler:", CFSTR("asset-load-end"), v281);
  v113 = *(void **)(v6 + 64);
  v279[0] = v17;
  v279[1] = 3221225472;
  v279[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_110;
  v279[3] = &unk_24CAB1B98;
  v279[4] = v6;
  v114 = v112;
  v280 = v114;
  objc_msgSend(v113, "subscribeToEventType:handler:", CFSTR("item-configuration-begin"), v279);
  v115 = *(void **)(v6 + 64);
  v277[0] = v17;
  v277[1] = 3221225472;
  v277[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_111;
  v277[3] = &unk_24CAB1B98;
  v277[4] = v6;
  v116 = v114;
  v278 = v116;
  objc_msgSend(v115, "subscribeToEventType:handler:", CFSTR("item-configuration-end"), v277);
  v117 = *(void **)(v6 + 64);
  v275[0] = v17;
  v275[1] = 3221225472;
  v275[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_113;
  v275[3] = &unk_24CAB1B98;
  v275[4] = v6;
  v118 = v116;
  v276 = v118;
  objc_msgSend(v117, "subscribeToEventType:handler:", CFSTR("item-failed"), v275);
  v119 = *(void **)(v6 + 64);
  v273[0] = v17;
  v273[1] = 3221225472;
  v273[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_114;
  v273[3] = &unk_24CAB1B98;
  v273[4] = v6;
  v120 = v118;
  v274 = v120;
  objc_msgSend(v119, "subscribeToEventType:handler:", CFSTR("item-placeholder-begin"), v273);
  v121 = *(void **)(v6 + 64);
  v271[0] = v17;
  v271[1] = 3221225472;
  v271[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_115;
  v271[3] = &unk_24CAB1B98;
  v271[4] = v6;
  v122 = v120;
  v272 = v122;
  objc_msgSend(v121, "subscribeToEventType:handler:", CFSTR("item-placeholder-end"), v271);
  v123 = *(void **)(v6 + 64);
  v269[0] = v17;
  v269[1] = 3221225472;
  v269[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_116;
  v269[3] = &unk_24CAB1B98;
  v269[4] = v6;
  v124 = v122;
  v270 = v124;
  objc_msgSend(v123, "subscribeToEventType:handler:", CFSTR("item-hls-stream-begin"), v269);
  v125 = *(void **)(v6 + 64);
  v267[0] = v17;
  v267[1] = 3221225472;
  v267[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_117;
  v267[3] = &unk_24CAB1B98;
  v267[4] = v6;
  v126 = v124;
  v268 = v126;
  objc_msgSend(v125, "subscribeToEventType:handler:", CFSTR("item-hls-stream-end"), v267);
  v127 = *(void **)(v6 + 64);
  v265[0] = v17;
  v265[1] = 3221225472;
  v265[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_118;
  v265[3] = &unk_24CAB1B98;
  v265[4] = v6;
  v128 = v126;
  v266 = v128;
  objc_msgSend(v127, "subscribeToEventType:handler:", CFSTR("item-hls-timed-metadata-begin"), v265);
  v129 = *(void **)(v6 + 64);
  v263[0] = v17;
  v263[1] = 3221225472;
  v263[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_119;
  v263[3] = &unk_24CAB1B98;
  v263[4] = v6;
  v130 = v128;
  v264 = v130;
  objc_msgSend(v129, "subscribeToEventType:handler:", CFSTR("item-hls-timed-metadata-end"), v263);
  v131 = *(void **)(v6 + 64);
  v261[0] = v17;
  v261[1] = 3221225472;
  v261[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_120;
  v261[3] = &unk_24CAB1B98;
  v261[4] = v6;
  v132 = v130;
  v262 = v132;
  objc_msgSend(v131, "subscribeToEventType:handler:", CFSTR("item-transition-created"), v261);
  v133 = *(void **)(v6 + 64);
  v259[0] = v17;
  v259[1] = 3221225472;
  v259[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_163;
  v259[3] = &unk_24CAB1B98;
  v259[4] = v6;
  v134 = v132;
  v260 = v134;
  objc_msgSend(v133, "subscribeToEventType:handler:", CFSTR("item-transition-cancelled"), v259);
  v135 = *(void **)(v6 + 64);
  v257[0] = v17;
  v257[1] = 3221225472;
  v257[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_164;
  v257[3] = &unk_24CAB1B98;
  v257[4] = v6;
  v136 = v134;
  v258 = v136;
  objc_msgSend(v135, "subscribeToEventType:handler:", CFSTR("transition-will-start"), v257);
  v137 = *(void **)(v6 + 64);
  v255[0] = v17;
  v255[1] = 3221225472;
  v255[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_165;
  v255[3] = &unk_24CAB1B98;
  v255[4] = v6;
  v138 = v136;
  v256 = v138;
  objc_msgSend(v137, "subscribeToEventType:handler:", CFSTR("transition-did-end"), v255);
  v139 = *(void **)(v6 + 64);
  v253[0] = v17;
  v253[1] = 3221225472;
  v253[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_166;
  v253[3] = &unk_24CAB1B98;
  v253[4] = v6;
  v140 = v138;
  v254 = v140;
  objc_msgSend(v139, "subscribeToEventType:handler:", CFSTR("overlapped-playback-will-start"), v253);
  v141 = *(void **)(v6 + 64);
  v251[0] = v17;
  v251[1] = 3221225472;
  v251[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_167;
  v251[3] = &unk_24CAB1B98;
  v251[4] = v6;
  v142 = v140;
  v252 = v142;
  objc_msgSend(v141, "subscribeToEventType:handler:", CFSTR("overlapped-playback-did-end"), v251);
  v143 = *(void **)(v6 + 64);
  v249[0] = v17;
  v249[1] = 3221225472;
  v249[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_168;
  v249[3] = &unk_24CAB1B98;
  v249[4] = v6;
  v144 = v142;
  v250 = v144;
  objc_msgSend(v143, "subscribeToEventType:handler:", CFSTR("error-resolution"), v249);
  v145 = *(void **)(v6 + 64);
  v247[0] = v17;
  v247[1] = 3221225472;
  v247[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_169;
  v247[3] = &unk_24CAB1B98;
  v247[4] = v6;
  v146 = v144;
  v248 = v146;
  objc_msgSend(v145, "subscribeToEventType:handler:", CFSTR("interrupt-begin"), v247);
  v147 = *(void **)(v6 + 64);
  v245[0] = v17;
  v245[1] = 3221225472;
  v245[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_170;
  v245[3] = &unk_24CAB1B98;
  v245[4] = v6;
  v148 = v146;
  v246 = v148;
  objc_msgSend(v147, "subscribeToEventType:handler:", CFSTR("interrupt-end"), v245);
  v149 = *(void **)(v6 + 64);
  v243[0] = v17;
  v243[1] = 3221225472;
  v243[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_171;
  v243[3] = &unk_24CAB1B98;
  v243[4] = v6;
  v150 = v148;
  v244 = v150;
  objc_msgSend(v149, "subscribeToEventType:handler:", CFSTR("policy-begin"), v243);
  v151 = *(void **)(v6 + 64);
  v241[0] = v17;
  v241[1] = 3221225472;
  v241[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_172;
  v241[3] = &unk_24CAB1B98;
  v241[4] = v6;
  v152 = v150;
  v242 = v152;
  objc_msgSend(v151, "subscribeToEventType:handler:", CFSTR("policy-end"), v241);
  v153 = *(void **)(v6 + 64);
  v239[0] = v17;
  v239[1] = 3221225472;
  v239[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_173;
  v239[3] = &unk_24CAB1B98;
  v239[4] = v6;
  v154 = v152;
  v240 = v154;
  objc_msgSend(v153, "subscribeToEventType:handler:", CFSTR("playback-behavior-changed"), v239);
  v155 = *(void **)(v6 + 64);
  v237[0] = v17;
  v237[1] = 3221225472;
  v237[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_174;
  v237[3] = &unk_24CAB1B98;
  v237[4] = v6;
  v156 = v154;
  v238 = v156;
  objc_msgSend(v155, "subscribeToEventType:handler:", CFSTR("media-server-died"), v237);
  v157 = *(void **)(v6 + 64);
  v235[0] = v17;
  v235[1] = 3221225472;
  v235[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_175;
  v235[3] = &unk_24CAB1B98;
  v235[4] = v6;
  v158 = v156;
  v236 = v158;
  objc_msgSend(v157, "subscribeToEventType:handler:", CFSTR("media-server-reset"), v235);
  v159 = *(void **)(v6 + 64);
  v233[0] = v17;
  v233[1] = 3221225472;
  v233[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_176;
  v233[3] = &unk_24CAB1B98;
  v233[4] = v6;
  v160 = v158;
  v234 = v160;
  objc_msgSend(v159, "subscribeToEventType:handler:", CFSTR("media-server-purge"), v233);
  v161 = *(void **)(v6 + 64);
  v231[0] = v17;
  v231[1] = 3221225472;
  v231[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_177;
  v231[3] = &unk_24CAB1B98;
  v231[4] = v6;
  v162 = v160;
  v232 = v162;
  objc_msgSend(v161, "subscribeToEventType:handler:", CFSTR("audio-route-changed"), v231);
  v163 = *(void **)(v6 + 64);
  v229[0] = v17;
  v229[1] = 3221225472;
  v229[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_178;
  v229[3] = &unk_24CAB1B98;
  v229[4] = v6;
  v164 = v162;
  v230 = v164;
  objc_msgSend(v163, "subscribeToEventType:handler:", CFSTR("audio-rendering-mode-changed"), v229);
  v165 = *(void **)(v6 + 64);
  v227[0] = v17;
  v227[1] = 3221225472;
  v227[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_179;
  v227[3] = &unk_24CAB1B98;
  v227[4] = v6;
  v166 = v164;
  v228 = v166;
  objc_msgSend(v165, "subscribeToEventType:handler:", CFSTR("time-control-status-changed"), v227);
  v167 = *(void **)(v6 + 64);
  v225[0] = v17;
  v225[1] = 3221225472;
  v225[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_181;
  v225[3] = &unk_24CAB1B98;
  v225[4] = v6;
  v168 = v166;
  v226 = v168;
  objc_msgSend(v167, "subscribeToEventType:handler:", CFSTR("network-operation"), v225);
  v169 = *(void **)(v6 + 64);
  v223[0] = v17;
  v223[1] = 3221225472;
  v223[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_182;
  v223[3] = &unk_24CAB1B98;
  v223[4] = v6;
  v170 = v168;
  v224 = v170;
  objc_msgSend(v169, "subscribeToEventType:handler:", CFSTR("player-operation-begin"), v223);
  v171 = *(void **)(v6 + 64);
  v221[0] = v17;
  v221[1] = 3221225472;
  v221[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_183;
  v221[3] = &unk_24CAB1B98;
  v221[4] = v6;
  v172 = v170;
  v222 = v172;
  objc_msgSend(v171, "subscribeToEventType:handler:", CFSTR("player-operation-end"), v221);
  v173 = *(void **)(v6 + 64);
  v219[0] = v17;
  v219[1] = 3221225472;
  v219[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_184;
  v219[3] = &unk_24CAB1B98;
  v219[4] = v6;
  v174 = v172;
  v220 = v174;
  objc_msgSend(v173, "subscribeToEventType:handler:", CFSTR("reload-current-item-begin"), v219);
  v175 = *(void **)(v6 + 64);
  v217[0] = v17;
  v217[1] = 3221225472;
  v217[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_185;
  v217[3] = &unk_24CAB1B98;
  v217[4] = v6;
  v176 = v174;
  v218 = v176;
  objc_msgSend(v175, "subscribeToEventType:handler:", CFSTR("reload-current-item-end"), v217);
  v177 = *(void **)(v6 + 64);
  v215[0] = v17;
  v215[1] = 3221225472;
  v215[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_186;
  v215[3] = &unk_24CAB1B98;
  v215[4] = v6;
  v178 = v176;
  v216 = v178;
  objc_msgSend(v177, "subscribeToEventType:handler:", CFSTR("session-activation-begin"), v215);
  v179 = *(void **)(v6 + 64);
  v213[0] = v17;
  v213[1] = 3221225472;
  v213[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_187;
  v213[3] = &unk_24CAB1B98;
  v213[4] = v6;
  v180 = v178;
  v214 = v180;
  objc_msgSend(v179, "subscribeToEventType:handler:", CFSTR("session-activation-end"), v213);
  v181 = *(void **)(v6 + 64);
  v211[0] = v17;
  v211[1] = 3221225472;
  v211[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_188;
  v211[3] = &unk_24CAB1B98;
  v211[4] = v6;
  v182 = v180;
  v212 = v182;
  objc_msgSend(v181, "subscribeToEventType:handler:", CFSTR("shared-session-begin"), v211);
  v183 = *(void **)(v6 + 64);
  v209[0] = v17;
  v209[1] = 3221225472;
  v209[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_189;
  v209[3] = &unk_24CAB1B98;
  v209[4] = v6;
  v184 = v182;
  v210 = v184;
  objc_msgSend(v183, "subscribeToEventType:handler:", CFSTR("shared-session-end"), v209);
  v185 = *(void **)(v6 + 64);
  v207[0] = v17;
  v207[1] = 3221225472;
  v207[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_190;
  v207[3] = &unk_24CAB1B98;
  v207[4] = v6;
  v186 = v184;
  v208 = v186;
  objc_msgSend(v185, "subscribeToEventType:handler:", CFSTR("shared-session-participants-changed"), v207);
  v187 = *(void **)(v6 + 64);
  v205[0] = v17;
  v205[1] = 3221225472;
  v205[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_191;
  v205[3] = &unk_24CAB1B98;
  v205[4] = v6;
  v188 = v186;
  v206 = v188;
  objc_msgSend(v187, "subscribeToEventType:handler:", CFSTR("shared-session-synchronization-begin"), v205);
  v189 = *(void **)(v6 + 64);
  v203[0] = v17;
  v203[1] = 3221225472;
  v203[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_192;
  v203[3] = &unk_24CAB1B98;
  v203[4] = v6;
  v190 = v188;
  v204 = v190;
  objc_msgSend(v189, "subscribeToEventType:handler:", CFSTR("shared-session-synchronization-end"), v203);
  v191 = *(void **)(v6 + 64);
  v201[0] = v17;
  v201[1] = 3221225472;
  v201[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_193;
  v201[3] = &unk_24CAB1B98;
  v201[4] = v6;
  v192 = v190;
  v202 = v192;
  objc_msgSend(v191, "subscribeToEventType:handler:", CFSTR("item-vocal-attenuation-changed"), v201);
  v193 = *(void **)(v6 + 64);
  v199[0] = v17;
  v199[1] = 3221225472;
  v199[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_194;
  v199[3] = &unk_24CAB1B98;
  v199[4] = v6;
  v194 = v192;
  v200 = v194;
  objc_msgSend(v193, "subscribeToEventType:handler:", CFSTR("vocal-attenuation-statistics"), v199);
  v195 = *(void **)(v6 + 64);
  v197[0] = v17;
  v197[1] = 3221225472;
  v197[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_195;
  v197[3] = &unk_24CAB1B98;
  v197[4] = v6;
  v198 = v194;
  v196 = v194;
  objc_msgSend(v195, "subscribeToEventType:handler:", CFSTR("perf-report"), v197);

}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/logging");
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-start-position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  MSVLogDateFormatter();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544642;
    v24 = v14;
    v25 = 2114;
    v26 = v17;
    v27 = 1024;
    v28 = objc_msgSend(v3, "threadPriority");
    v29 = 2114;
    v30 = v15;
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v7;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀺸 ITEM BUFFER READY          %{public}@ %{public}@", (uint8_t *)&v23, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v3, "threadPriority");
    v23 = 138544386;
    v24 = v14;
    v25 = 2114;
    v26 = v20;
    v27 = 1024;
    v28 = v21;
    v29 = 2114;
    v30 = v18;
    v31 = 2048;
    v32 = v11;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f", (uint8_t *)&v23, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
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
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  v48 = CFSTR("queue-section-id");
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("container-metadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("container-title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("container-ids"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v36 = v14;
    v37 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v16;
    v24 = objc_msgSend(v5, "threadPriority");
    objc_msgSend(v5, "payload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v19;
    v40 = 2114;
    v41 = v22;
    v42 = 1024;
    v43 = v24;
    v16 = v23;
    v44 = 2114;
    v45 = v20;
    v46 = 2114;
    v47 = v26;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈰 CONTAINER END              %{public}@", buf, 0x30u);

    v14 = v36;
    v11 = v37;
  }

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v39 = v19;
    v40 = 2114;
    v41 = v29;
    v42 = 1024;
    v43 = v30;
    v44 = 2114;
    v45 = v27;
    v46 = 2114;
    v47 = v14;
    _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@", buf, 0x30u);

  }
  v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v5, "threadPriority");
    objc_msgSend(v16, "humanDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v19;
    v40 = 2114;
    v41 = v32;
    v42 = 1024;
    v43 = v33;
    v44 = 2114;
    v45 = v27;
    v46 = 2114;
    v47 = v34;
    _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ identifiers: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("session-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈅 SESSION END                %{public}@", (uint8_t *)&v14, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("network-reachability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = CFSTR("Unreachable");
  if (v6 == 1)
    v7 = CFSTR("Likely Reachable");
  if (v6 == 2)
    v8 = CFSTR("Reachable");
  else
    v8 = v7;
  MSVLogDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544386;
    v17 = v11;
    v18 = 2114;
    v19 = v14;
    v20 = 1024;
    v21 = objc_msgSend(v3, "threadPriority");
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀤆 NET REACHABILITY CHANGED   %{public}@", (uint8_t *)&v16, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  int v16;
  void *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  __CFString *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("behavior-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (*(_QWORD *)(a1 + 32))
  {
    if (v6 > 5)
      v7 = CFSTR("􀿪");
    else
      v7 = off_24CAB1CF8[v6];
  }
  else
  {
    v7 = 0;
  }
  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v15 = v7;
    v16 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v25 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("session-id"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v27 = v10;
    v28 = 2114;
    v29 = v13;
    v30 = 1024;
    v31 = v16;
    v7 = v15;
    v6 = v14;
    v32 = 2114;
    v33 = v11;
    v34 = 2114;
    v35 = v18;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈄 SESSION BEGIN              %{public}@", buf, 0x30u);

    v3 = v25;
  }

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "threadPriority");
    if (v6 >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown/%lld"), v6);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_24CAB1CC8[v6];
    }
    *(_DWORD *)buf = 138544642;
    v27 = v10;
    v28 = 2114;
    v29 = v21;
    v30 = 1024;
    v31 = v22;
    v32 = 2114;
    v33 = v19;
    v34 = 2114;
    v35 = v7;
    v36 = 2114;
    v37 = v23;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ behaviorType: %{public}@  %{public}@", buf, 0x3Au);

  }
  return 1;
}

- (void)_updateChartWithEvent:(uint64_t)a1
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  int v21;
  void *v22;
  int v23;
  __CFString *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  __CFString *v46;
  int v47;
  void *v48;
  char v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  char v54;
  _QWORD v55[2];
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  const __CFString *v62;
  const __CFString *v63;
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "type");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v65[0] = CFSTR("remote-control-begin");
    v65[1] = CFSTR("shared-session-synchronization-begin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if ((v7 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v64[0] = CFSTR("remote-control-end");
      v64[1] = CFSTR("shared-session-synchronization-end");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v5);

      if ((v10 & 1) == 0)
      {
        v63 = CFSTR("session-begin");
        v8 = 1;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsObject:", v5);

        if ((v30 & 1) == 0)
        {
          v62 = CFSTR("session-end");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "containsObject:", v5);

          if ((v32 & 1) == 0)
          {
            v61[0] = CFSTR("container-begin");
            v61[1] = CFSTR("item-placeholder-begin");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "containsObject:", v5);

            if ((v37 & 1) != 0)
            {
              v8 = 1;
            }
            else
            {
              v60[0] = CFSTR("container-end");
              v60[1] = CFSTR("item-placeholder-end");
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "containsObject:", v5);

              if ((v41 & 1) == 0)
              {
                v59 = CFSTR("item-begin");
                v8 = 1;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "containsObject:", v5);

                if ((v43 & 1) == 0)
                {
                  v58 = CFSTR("item-end");
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v44, "containsObject:", v5);

                  if ((v45 & 1) == 0)
                  {
                    v57 = CFSTR("asset-load-begin");
                    v8 = 1;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = objc_msgSend(v48, "containsObject:", v5);

                    if ((v49 & 1) == 0)
                    {
                      v56 = CFSTR("asset-load-end");
                      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = objc_msgSend(v50, "containsObject:", v5);

                      if (!v51)
                      {
LABEL_8:
                        objc_msgSend(v4, "payload");
                        v12 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("time-control-status"));
                        v13 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v13)
                        {
                          objc_msgSend(v4, "payload");
                          v14 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("time-control-status"));
                          v15 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_QWORD *)(a1 + 56) = objc_msgSend(v15, "integerValue");

                        }
                        v16 = CFSTR("remote-control-begin");
                        if (v5 == CFSTR("remote-control-begin"))
                        {

                        }
                        else
                        {
                          v17 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("remote-control-begin"));

                          if (!v17)
                          {
                            v18 = CFSTR("audio-route-changed");
                            if (v5 == CFSTR("audio-route-changed"))
                            {

                            }
                            else
                            {
                              v19 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("audio-route-changed"));

                              if (!v19)
                              {
                                v20 = CFSTR("item-rate-changed");
                                if (v5 == CFSTR("item-rate-changed"))
                                {

                                }
                                else
                                {
                                  v21 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("item-rate-changed"));

                                  if (!v21)
                                  {
                                    v55[0] = CFSTR("session-reset");
                                    v55[1] = CFSTR("media-server-died");
                                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
                                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                                    v23 = objc_msgSend(v22, "containsObject:", v5);

                                    if (!v23)
                                    {
                                      v24 = CFSTR("interrupt-begin");
                                      if (v5 == CFSTR("interrupt-begin"))
                                      {

                                      }
                                      else
                                      {
                                        v25 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("interrupt-begin"));

                                        if (!v25)
                                        {
LABEL_54:
                                          v46 = CFSTR("interrupt-end");
                                          if (v5 == CFSTR("interrupt-end"))
                                          {

                                            goto LABEL_62;
                                          }
                                          v47 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("interrupt-end"));

                                          if (v47)
                                          {
LABEL_62:
                                            if (*(_BYTE *)(a1 + 49))
                                            {
                                              objc_msgSend(v4, "payload");
                                              v52 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("interrupt-should-resume"));
                                              v53 = (void *)objc_claimAutoreleasedReturnValue();
                                              v54 = objc_msgSend(v53, "BOOLValue");

                                              *(_BYTE *)(a1 + 48) = v54;
LABEL_35:
                                              *(_BYTE *)(a1 + 49) = 0;
                                            }
                                          }
LABEL_42:

                                          goto LABEL_43;
                                        }
                                      }
                                      if (*(_BYTE *)(a1 + 48))
                                      {
                                        *(_WORD *)(a1 + 48) = 256;
                                        goto LABEL_42;
                                      }
                                      goto LABEL_54;
                                    }
LABEL_33:
                                    *(_WORD *)(a1 + 48) = 0;
                                    goto LABEL_42;
                                  }
                                }
                                objc_msgSend(v4, "payload");
                                v38 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("item-rate-change-participant-id"));
                                v39 = (void *)objc_claimAutoreleasedReturnValue();

                                if (objc_msgSend(v39, "length"))
                                  *(_WORD *)(a1 + 48) = 0;

                                goto LABEL_42;
                              }
                            }
                            objc_msgSend(v4, "payload");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("route-should-pause"));
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            v35 = objc_msgSend(v34, "BOOLValue");

                            if (!v35)
                              goto LABEL_42;
                            goto LABEL_33;
                          }
                        }
                        objc_msgSend(v4, "payload");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = objc_msgSend(v27, "integerValue");

                        switch(v28)
                        {
                          case 0:
                            goto LABEL_26;
                          case 1:
                          case 3:
                            goto LABEL_33;
                          case 2:
                            *(_BYTE *)(a1 + 48) ^= 1u;
                            goto LABEL_35;
                          default:
                            if ((v28 - 121) > 0xA || ((1 << (v28 - 121)) & 0x403) == 0)
                              goto LABEL_42;
LABEL_26:
                            *(_BYTE *)(a1 + 48) = 1;
                            break;
                        }
                        goto LABEL_42;
                      }
                      v8 = -1;
                    }
                    v11 = 40;
LABEL_7:
                    *(_QWORD *)(a1 + v11) += v8;
                    goto LABEL_8;
                  }
                  v8 = -1;
                }
                v11 = 32;
                goto LABEL_7;
              }
              v8 = -1;
            }
            v11 = 24;
            goto LABEL_7;
          }
          v8 = -1;
        }
        v11 = 16;
        goto LABEL_7;
      }
      v8 = -1;
    }
    v11 = 8;
    goto LABEL_7;
  }
LABEL_43:

}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  const __CFString *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  int v58;
  void *v59;
  NSObject *v60;
  void *v61;
  int v62;
  id v63;
  void (**v64)(void *, const __CFString *, _QWORD);
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  void *v80;
  NSObject *v81;
  void *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  char v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  id obj;
  id obja;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD aBlock[4];
  id v123;
  id v124;
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  id v136;
  __int16 v137;
  void *v138;
  __int16 v139;
  int v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  v98 = v6;
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-commands-changed"), 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remote-control-commands"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v132 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("commandType"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
    }
    while (v12);
  }
  v99 = a1;
  v96 = v10;

  v100 = v5;
  objc_msgSend(v5, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("remote-control-commands"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v95 = v18;
  objc_msgSend(v18, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
  if (v19)
  {
    v20 = v19;
    v21 = CFSTR("commandType");
    v22 = 0x24BDD1000uLL;
    v23 = *(_QWORD *)v128;
    v105 = v9;
    v106 = *(_QWORD *)v128;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v128 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v24);
        objc_msgSend(v25, "objectForKeyedSubscript:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "integerValue");

        objc_msgSend(*(id *)(v22 + 1760), "numberWithUnsignedInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if ((_DWORD)v27 != 99990)
        {
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("supported"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "BOOLValue");

          if (v29)
          {
            v32 = v21;
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("supported"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "BOOLValue");

            if (v31 != v34)
            {
              v21 = v32;
              if (v31)
                v35 = v104;
              else
                v35 = v103;
              objc_msgSend(v35, "addObject:", v25);
              goto LABEL_26;
            }
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("enabled"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "BOOLValue");

            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("enabled"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "BOOLValue");

            if (v38 != v40)
            {
              objc_msgSend(v102, "addObject:", v25);
              v21 = v32;
LABEL_26:
              v9 = v105;
              v23 = v106;
              goto LABEL_27;
            }
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("unsupportedReasons"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("unsupportedReasons"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v106;
            if (v41 == v42)
              v43 = 1;
            else
              v43 = objc_msgSend(v41, "isEqual:", v42);

            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("disabledReasons"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("disabledReasons"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44 == v45)
              v46 = 1;
            else
              v46 = objc_msgSend(v44, "isEqual:", v45);

            if ((v43 & v46 & 1) == 0)
            {
              objc_msgSend(v102, "addObject:", v25);
              v21 = v32;
              goto LABEL_42;
            }
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("options"));
            v47 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("options"));
            v48 = (id)objc_claimAutoreleasedReturnValue();
            v21 = v32;
            if (v47 == v48)
            {

LABEL_42:
              v9 = v105;
LABEL_27:
              v22 = 0x24BDD1000;
              goto LABEL_28;
            }
            v49 = v48;
            v101 = objc_msgSend(v47, "isEqual:", v48);

            v9 = v105;
            v22 = 0x24BDD1000;
            if ((v101 & 1) == 0)
              objc_msgSend(v102, "addObject:", v25);
          }
          else
          {
            if (v31)
              v36 = v104;
            else
              v36 = v103;
            objc_msgSend(v36, "addObject:", v25);
            v23 = v106;
          }
        }
LABEL_28:

        ++v24;
      }
      while (v20 != v24);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
      v20 = v50;
    }
    while (v50);
  }

  v51 = v104;
  if (objc_msgSend(v104, "count") || objc_msgSend(v103, "count") || objc_msgSend(v102, "count"))
  {
    MSVLogDateFormatter();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "date");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringFromDate:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v99 + 32));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v99 + 40), "streamID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v100, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v136 = v54;
      v137 = 2114;
      v138 = v57;
      v139 = 1024;
      v140 = v58;
      v141 = 2114;
      v142 = v55;
      _os_log_impl(&dword_210BD8000, v56, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪂 COMMANDS CHANGED", buf, 0x26u);

    }
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v99 + 32));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v99 + 40), "streamID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v100, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v136 = v54;
      v137 = 2114;
      v138 = v61;
      v139 = 1024;
      v140 = v62;
      v141 = 2114;
      v142 = v59;
      _os_log_impl(&dword_210BD8000, v60, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ commands:", buf, 0x26u);

    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_55;
    aBlock[3] = &unk_24CAB1C00;
    obja = v54;
    v123 = obja;
    v124 = *(id *)(v99 + 40);
    v107 = v100;
    v125 = v107;
    v63 = v59;
    v126 = v63;
    v64 = (void (**)(void *, const __CFString *, _QWORD))_Block_copy(aBlock);
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v65 = v104;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v119;
      do
      {
        for (j = 0; j != v67; ++j)
        {
          if (*(_QWORD *)v119 != v68)
            objc_enumerationMutation(v65);
          v64[2](v64, CFSTR("􀃝"), *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * j));
        }
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
      }
      while (v67);
    }

    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v70 = v102;
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v114, v150, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v115;
      do
      {
        for (k = 0; k != v72; ++k)
        {
          if (*(_QWORD *)v115 != v73)
            objc_enumerationMutation(v70);
          v64[2](v64, CFSTR("􀃩"), *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * k));
        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v114, v150, 16);
      }
      while (v72);
    }

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v75 = v103;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v110, v149, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v111;
      do
      {
        for (m = 0; m != v77; ++m)
        {
          if (*(_QWORD *)v111 != v78)
            objc_enumerationMutation(v75);
          v64[2](v64, CFSTR("􀃞"), *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * m));
        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v110, v149, 16);
      }
      while (v77);
    }

    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v99 + 32));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v99 + 40), "streamID");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v107, "threadPriority");
      v84 = objc_msgSend(v65, "count");
      v85 = objc_msgSend(v75, "count");
      v86 = objc_msgSend(v70, "count");
      *(_DWORD *)buf = 138544898;
      v87 = obja;
      v136 = obja;
      v137 = 2114;
      v138 = v82;
      v139 = 1024;
      v140 = v83;
      v141 = 2114;
      v142 = v80;
      v143 = 2048;
      v144 = v84;
      v145 = 2048;
      v146 = v85;
      v147 = 2048;
      v148 = v86;
      _os_log_impl(&dword_210BD8000, v81, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ added: %lld; removed: %lld; updated: %lld",
        buf,
        0x44u);

      v88 = v100;
      v89 = v96;
      v51 = v104;
    }
    else
    {
      v88 = v100;
      v89 = v96;
      v51 = v104;
      v87 = obja;
    }
  }
  else
  {
    MSVLogDateFormatter();
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v100;
    objc_msgSend(v100, "date");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "stringFromDate:", v92);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v99 + 32));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    v89 = v96;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v99 + 40), "streamID");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v100, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v136 = v87;
      v137 = 2114;
      v138 = v93;
      v139 = 1024;
      v140 = v94;
      v141 = 2114;
      v142 = v80;
      _os_log_impl(&dword_210BD8000, v81, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪂 COMMANDS CHANGED           [no change]", buf, 0x26u);

    }
  }

  return 1;
}

- (BOOL)_logAccountEvent:(id)a3 subscription:(id)a4 cursor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  int v49;
  int v51;
  int v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  _BYTE v64[10];
  void *v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("account-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("account-metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("store-account-id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("store-front-id"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("delegated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v16, "BOOLValue");

  MSVLogDateFormatter();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate:", v18);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "type");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v19, "isEqualToString:", CFSTR("account-begin"));

  if ((_DWORD)v18)
  {
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:]((unsigned __int8 *)self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "streamID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v56 = v54;
      v57 = 2114;
      v58 = v22;
      v59 = 1024;
      v60 = objc_msgSend(v7, "threadPriority");
      v61 = 2114;
      v62 = v20;
      v63 = 2114;
      *(_QWORD *)v64 = v10;
      v23 = "|%{public}@ %{public}@ %2i %{public}@􀉯 ACCOUNT BEGIN              %{public}@";
LABEL_7:
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x30u);

    }
  }
  else
  {
    objc_msgSend(v7, "type");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("account-update"));

    if (!v25)
      goto LABEL_9;
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:]((unsigned __int8 *)self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "streamID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v56 = v54;
      v57 = 2114;
      v58 = v22;
      v59 = 1024;
      v60 = objc_msgSend(v7, "threadPriority");
      v61 = 2114;
      v62 = v20;
      v63 = 2114;
      *(_QWORD *)v64 = v10;
      v23 = "|%{public}@ %{public}@ %2i %{public}@􀉷 ACCOUNT UPDATE             %{public}@";
      goto LABEL_7;
    }
  }

LABEL_9:
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:]((unsigned __int8 *)self);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "streamID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v7, "threadPriority");
    v30 = objc_msgSend(v13, "unsignedLongLongValue");
    *(_DWORD *)buf = 138544899;
    v56 = v54;
    v57 = 2114;
    v58 = v28;
    v59 = 1024;
    v60 = v29;
    v61 = 2114;
    v62 = v26;
    v63 = 2049;
    *(_QWORD *)v64 = v30;
    *(_WORD *)&v64[8] = 2114;
    v65 = v53;
    v66 = 1024;
    v67 = v15;
    _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ store-id: %{private}llu; storefront: %{public}@; delegated: %{BOOL}u",
      buf,
      0x40u);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("household-id"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
  {
    v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "streamID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v7, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v56 = v54;
      v57 = 2114;
      v58 = v33;
      v59 = 1024;
      v60 = v34;
      v61 = 2114;
      v62 = v26;
      v63 = 2114;
      *(_QWORD *)v64 = v31;
      _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ household-id: %{public}@", buf, 0x30u);

    }
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("subscription-status"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("explicit-allowed"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v36, "BOOLValue");

  if (v35)
  {
    v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "streamID");
      v38 = v26;
      v39 = v13;
      v40 = v8;
      v41 = v10;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v7, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v56 = v54;
      v57 = 2114;
      v58 = v42;
      v59 = 1024;
      v60 = v43;
      v61 = 2114;
      v62 = v38;
      v63 = 2114;
      *(_QWORD *)v64 = v35;
      _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ subscription: %{public}@", buf, 0x30u);

      v10 = v41;
      v8 = v40;
      v13 = v39;
      v26 = v38;
    }

  }
  v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "streamID");
    v45 = v13;
    v46 = v8;
    v47 = v10;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v7, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v56 = v54;
    v57 = 2114;
    v58 = v48;
    v59 = 1024;
    v60 = v49;
    v61 = 2114;
    v62 = v26;
    v63 = 1024;
    *(_DWORD *)v64 = v52;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = v51;
    _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ private-listening: %{BOOL}u; explicitContentAllowed: %{BOOL}u",
      buf,
      0x32u);

    v10 = v47;
    v8 = v46;
    v13 = v45;
  }

  return 1;
}

- (unsigned)_chartWithLevel:(unsigned __int8 *)a1 type:
{
  unsigned __int8 *v1;
  void *v2;
  uint64_t v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v1 = a1;
  if (!a1)
    return v1;
  MSVTimelineChartPrefix();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *((_QWORD *)v1 + 7);
  if (v3 == 2)
  {
    v4 = v1[48];
    v5 = CFSTR("🟩");
    v6 = CFSTR("🟧");
  }
  else
  {
    if (v3 == 1)
    {
      v4 = v1[48];
      v5 = CFSTR("🟧");
    }
    else
    {
      if (v3)
      {
        v4 = v1[48];
        v5 = CFSTR("🟥");
        v6 = CFSTR("⬛️");
        goto LABEL_10;
      }
      v4 = v1[48];
      v5 = CFSTR("🟥");
    }
    v6 = CFSTR("⬜️");
  }
LABEL_10:
  if (v4)
    v7 = (__CFString *)v5;
  else
    v7 = (__CFString *)v6;
  v8 = v7;
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v2);
  v1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  int v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  const __CFString *v53;
  int v54;
  NSObject *v55;
  void *v56;
  int v57;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  _BYTE v93[18];
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device-metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("device-name"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("device-model"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("application-bundle-id"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("application-name"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("application-version"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("system-name"));
  v62 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("device-software-variant"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("system-version"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("system-build"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("application-source-version"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("application-uuid"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("internal-carry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v59) = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v59) = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("focus-mode-private-listening-enabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v12, "integerValue");

  MSVLogDateFormatter();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v3;
  objc_msgSend(v3, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:", v14);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v85 = v76;
    v86 = 2114;
    v87 = v17;
    v88 = 1024;
    v89 = objc_msgSend(v77, "threadPriority");
    v90 = 2114;
    v91 = v15;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁄩 DEVICE CHANGED", buf, 0x26u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v77, "threadPriority");
    *(_DWORD *)buf = 138544643;
    v85 = v76;
    v86 = 2114;
    v87 = v19;
    v88 = 1024;
    v89 = v20;
    v90 = 2114;
    v91 = v75;
    v92 = 2113;
    *(_QWORD *)v93 = v6;
    *(_WORD *)&v93[8] = 2114;
    *(_QWORD *)&v93[10] = v7;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ name: %{private}@; model: %{public}@",
      buf,
      0x3Au);

  }
  v65 = (void *)v7;
  v60 = (void *)v6;

  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v77, "threadPriority");
    *(_DWORD *)buf = 138545410;
    v85 = v76;
    v86 = 2114;
    v87 = v22;
    v88 = 1024;
    v89 = v23;
    v90 = 2114;
    v91 = v75;
    v92 = 2114;
    *(_QWORD *)v93 = v9;
    *(_WORD *)&v93[8] = 2114;
    *(_QWORD *)&v93[10] = v72;
    v94 = 2114;
    v95 = v8;
    v96 = 2114;
    v97 = v67;
    v98 = 2114;
    v99 = v68;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ application: %{public}@/%{public}@; bundleID: %{public}@; uuid: %{public}"
      "@; version: %{public}@",
      buf,
      0x58u);

  }
  v63 = (void *)v9;
  v64 = (void *)v8;

  v61 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("media-frameworks"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortedArrayUsingComparator:", &__block_literal_global_1574);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v80;
    v30 = "PlaybackEvents";
    v73 = *(_QWORD *)v80;
    v74 = v26;
    do
    {
      v31 = 0;
      v78 = v28;
      do
      {
        if (*(_QWORD *)v80 != v29)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v31);
        if (objc_msgSend(v32, "isRoot", v59))
        {
          v33 = os_log_create("com.apple.amp.mediaplaybackcore", v30);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v30;
            v36 = a1;
            v37 = objc_msgSend(v77, "threadPriority");
            objc_msgSend(v32, "name");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "uuid");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "UUIDString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "version");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v85 = v76;
            v86 = 2114;
            v87 = v34;
            v88 = 1024;
            v89 = v37;
            a1 = v36;
            v30 = v35;
            v28 = v78;
            v90 = 2114;
            v91 = v75;
            v92 = 2114;
            *(_QWORD *)v93 = v38;
            *(_WORD *)&v93[8] = 2114;
            *(_QWORD *)&v93[10] = v40;
            v94 = 2114;
            v95 = (uint64_t)v41;
            _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ root: %{public}-26@; uuid: %{public}@; version: %{public}@",
              buf,
              0x44u);

            v29 = v73;
            v26 = v74;
          }

        }
        ++v31;
      }
      while (v28 != v31);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    }
    while (v28);
  }

  if (v66 == 2)
  {
    v53 = CFSTR("Disabled");
    v47 = v60;
    v43 = v64;
    v42 = v65;
    v45 = (void *)v62;
    v44 = v63;
  }
  else
  {
    v43 = v64;
    v42 = v65;
    v45 = (void *)v62;
    v44 = v63;
    if (!v66)
    {
      v46 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      v47 = v60;
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v77, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v85 = v76;
      v86 = 2114;
      v87 = v48;
      v88 = 1024;
      v89 = v49;
      v90 = 2114;
      v91 = v75;
      v92 = 1024;
      *(_DWORD *)v93 = v59;
      v50 = "|%{public}@ %{public}@ %2i %{public}@  │ private-listening: %{BOOL}u";
      v51 = v46;
      v52 = 44;
      goto LABEL_26;
    }
    v53 = CFSTR("Enabled");
    v47 = v60;
  }
  v46 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    goto LABEL_27;
  objc_msgSend(*(id *)(a1 + 40), "streamID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v77, "threadPriority");
  *(_DWORD *)buf = 138544642;
  v85 = v76;
  v86 = 2114;
  v87 = v48;
  v88 = 1024;
  v89 = v54;
  v90 = 2114;
  v91 = v75;
  v92 = 1024;
  *(_DWORD *)v93 = v59;
  *(_WORD *)&v93[4] = 2114;
  *(_QWORD *)&v93[6] = v53;
  v50 = "|%{public}@ %{public}@ %2i %{public}@  │ private-listening: %{BOOL}u; focus-mode-private-listening: %{public}@";
  v51 = v46;
  v52 = 54;
LABEL_26:
  _os_log_impl(&dword_210BD8000, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);

LABEL_27:
  v55 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v77, "threadPriority");
    *(_DWORD *)buf = 138545410;
    v85 = v76;
    v86 = 2114;
    v87 = v56;
    v88 = 1024;
    v89 = v57;
    v90 = 2114;
    v91 = v75;
    v92 = 2114;
    *(_QWORD *)v93 = v45;
    *(_WORD *)&v93[8] = 2114;
    *(_QWORD *)&v93[10] = v71;
    v94 = 2114;
    v95 = (uint64_t)v70;
    v96 = 2114;
    v97 = v69;
    v98 = 1024;
    LODWORD(v99) = HIDWORD(v59);
    _os_log_impl(&dword_210BD8000, v55, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ os: %{public}@ [%{public}@]/%{public}@ %{public}@; internalCarry: %{BOOL}u",
      buf,
      0x54u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v5, v7);
  v8 = objc_msgSend(*(id *)(a1 + 32), "_logAccountEvent:subscription:cursor:", v7, *(_QWORD *)(a1 + 40), v6);

  return v8;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("av-player-item-performance-metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544642;
    v22 = v12;
    v23 = 2114;
    v24 = v15;
    v25 = 1024;
    v26 = objc_msgSend(v3, "threadPriority");
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v5;
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍾 ITEM READY FOR METRICS     %{public}@ %{public}@ ", (uint8_t *)&v21, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v3, "threadPriority");
    v21 = 138544386;
    v22 = v12;
    v23 = 2114;
    v24 = v18;
    v25 = 1024;
    v26 = v19;
    v27 = 2114;
    v28 = v16;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ accessLog: %{public}@", (uint8_t *)&v21, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t i;
  const __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  int v41;
  const __CFString *v43;
  int v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  _BYTE v54[10];
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("network-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = CFSTR("Unknown");
  if (v6 <= 99)
  {
    if ((unint64_t)(v6 - 1) >= 8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6 > 1000)
  {
    switch(v6)
    {
      case 1001:
        v7 = CFSTR("Bridged WiFi");
        break;
      case 2000:
        v7 = CFSTR("Wired Ethernet");
        break;
      case 3000:
        v7 = CFSTR("Other");
        break;
    }
  }
  else
  {
    switch(v6)
    {
      case 100:
LABEL_3:
        v7 = CFSTR("Cellular");
        break;
      case 500:
        v7 = CFSTR("Bluetooth");
        break;
      case 1000:
        v7 = CFSTR("WiFi");
        break;
    }
  }
LABEL_4:
  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("network-constrained"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("network-expensive"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("network-high-quality"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v3, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("network-signal-strength"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (int)v12;
  v43 = v7;
  if (!objc_msgSend(v17, "count"))
  {
    v22 = v10;
LABEL_24:
    v26 = CFSTR("<unknown>");
    goto LABEL_25;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BEC8570]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BEC8578]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");

  if ((unint64_t)v21 > 0xA || v19 < 0 || v19 > v21)
  {
    v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v17;
      _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_FAULT, "Unexpected signalStrength values: %{public}@", buf, 0xCu);
    }
    v22 = v10;

    goto LABEL_24;
  }
  v22 = v10;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    for (i = 0; i != v21; ++i)
    {
      if (i >= v19)
        v25 = CFSTR("○");
      else
        v25 = CFSTR("●");
      objc_msgSend(v23, "appendString:", v25, v43);
    }
  }
  v26 = (__CFString *)objc_msgSend(v23, "copy", v43);

LABEL_25:
  MSVLogDateFormatter();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringFromDate:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v46 = v30;
    v47 = 2114;
    v48 = v33;
    v49 = 1024;
    v50 = v34;
    v51 = 2114;
    v52 = v31;
    v53 = 2114;
    *(_QWORD *)v54 = v43;
    _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀤆 NETWORK TYPE CHANGED       %{public}@", buf, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v46 = v30;
    v47 = 2114;
    v48 = v37;
    v49 = 1024;
    v50 = v38;
    v51 = 2114;
    v52 = v35;
    v53 = 2114;
    *(_QWORD *)v54 = v26;
    _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ strength: %{public}@", buf, 0x30u);

  }
  v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544898;
    v46 = v30;
    v47 = 2114;
    v48 = v40;
    v49 = 1024;
    v50 = v41;
    v51 = 2114;
    v52 = v35;
    v53 = 1024;
    *(_DWORD *)v54 = v22;
    *(_WORD *)&v54[4] = 1024;
    *(_DWORD *)&v54[6] = v44;
    v55 = 1024;
    v56 = v13;
    _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ constrained: %{BOOL}u; high quality: %{BOOL}u; expensive: %{BOOL}u",
      buf,
      0x38u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v3, "threadPriority");
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀑐 APPLICATION FOREGROUND", (uint8_t *)&v11, 0x26u);

  }
  return 1;
}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;
  MPCPlaybackEngineEvent *lastTimeControlStatusEvent;

  subscription = self->_subscription;
  self->_subscription = 0;

  lastTimeControlStatusEvent = self->_lastTimeControlStatusEvent;
  self->_lastTimeControlStatusEvent = 0;

}

- (id)_playbackBarWithElapsedTime:(double)a3 duration:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;

  if (a4 <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    if (_playbackBarWithElapsedTime_duration__onceToken != -1)
      dispatch_once(&_playbackBarWithElapsedTime_duration__onceToken, &__block_literal_global_341);
    v6 = (void *)MEMORY[0x24BDD16A8];
    objc_msgSend(CFSTR(" "), "stringByPaddingToLength:withString:startingAtIndex:", 29, CFSTR("━"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 >= a4)
      v9 = a4;
    else
      v9 = a3;
    objc_msgSend(v8, "insertString:atIndex:", CFSTR("●"), (unint64_t)(round(v9 / a4 * 28.0) + 1.0));
    objc_msgSend(v8, "appendString:", CFSTR(" -"));
    objc_msgSend((id)_playbackBarWithElapsedTime_duration____elapsedTimeFormatter, "stringFromSeconds:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertString:atIndex:", v10, 0);

    objc_msgSend((id)_playbackBarWithElapsedTime_duration____remainingTimeFormatter, "stringFromSeconds:", fmax(a4 - a3, 0.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v11);

  }
  return v8;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (MPCPlaybackEngineEvent)lastTimeControlStatusEvent
{
  return self->_lastTimeControlStatusEvent;
}

- (void)setLastTimeControlStatusEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastTimeControlStatusEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimeControlStatusEvent, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

uint64_t __73__MPCPlaybackEngineLoggingConsumer__playbackBarWithElapsedTime_duration___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDB26B8]);
  v1 = (void *)_playbackBarWithElapsedTime_duration____elapsedTimeFormatter;
  _playbackBarWithElapsedTime_duration____elapsedTimeFormatter = (uint64_t)v0;

  objc_msgSend((id)_playbackBarWithElapsedTime_duration____elapsedTimeFormatter, "setStyle:", 3);
  v2 = objc_alloc_init(MEMORY[0x24BDB26B8]);
  v3 = (void *)_playbackBarWithElapsedTime_duration____remainingTimeFormatter;
  _playbackBarWithElapsedTime_duration____remainingTimeFormatter = (uint64_t)v2;

  return objc_msgSend((id)_playbackBarWithElapsedTime_duration____remainingTimeFormatter, "setStyle:", 3);
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session-reuse-reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("session-id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544386;
    v21 = v8;
    v22 = 2114;
    v23 = v11;
    v24 = 1024;
    v25 = v12;
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v14;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􂅟 SESSION REUSE              %{public}@", (uint8_t *)&v20, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v3, "threadPriority");
    v20 = 138544386;
    v21 = v8;
    v22 = 2114;
    v23 = v17;
    v24 = 1024;
    v25 = v18;
    v26 = 2114;
    v27 = v15;
    v28 = 2114;
    v29 = v5;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ reason: %{public}@", (uint8_t *)&v20, 0x30u);

  }
  return 1;
}

{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  unint64_t i;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  int v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  -[MPCPlaybackEngineLoggingConsumer _symbolForCommand:](*(const __CFString **)(a1 + 32), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MPCRemoteCommandDescriptionCopy(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("remote-control-source"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("remote-control-associated-participant-id"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = *MEMORY[0x24BE65928];
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE65928]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BE658A0];
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE658A0]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v17);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v18);
  v65 = v16;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE658E8]);
  MSVLogDateFormatter();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v20);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v69 = v67;
    v70 = 2114;
    v71 = v23;
    v72 = 1024;
    v73 = objc_msgSend(v3, "threadPriority");
    v74 = 2114;
    v75 = v21;
    v76 = 2114;
    v77 = v10;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀩿 COMMAND BEGIN              %{public}@", buf, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v69 = v67;
    v70 = 2114;
    v71 = v25;
    v72 = 1024;
    v73 = v26;
    v74 = 2114;
    v75 = v66;
    v76 = 2114;
    v77 = v12;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭  source: %{public}@", buf, 0x30u);

  }
  if (v63)
  {
    v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v69 = v67;
      v70 = 2114;
      v71 = v28;
      v72 = 1024;
      v73 = v29;
      v74 = 2114;
      v75 = v66;
      v76 = 2114;
      v77 = v63;
      _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ associatedParticipantID: %{public}@", buf, 0x30u);

    }
  }
  v60 = v12;
  v61 = v7;
  if (objc_msgSend(v65, "count"))
  {
    v59 = v10;
    objc_msgSend(v65, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("\n"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v31, "count"))
    {
      for (i = 0; i < objc_msgSend(v31, "count"); ++i)
      {
        objc_msgSend(v31, "objectAtIndexedSubscript:", i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v34 = objc_msgSend(v31, "count") - 1;
          v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
          if (i == v34)
          {
            if (v36)
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v3, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v69 = v67;
              v70 = 2114;
              v71 = v37;
              v72 = 1024;
              v73 = v38;
              v74 = 2114;
              v75 = v66;
              v76 = 2114;
              v77 = v33;
              v39 = v35;
              v40 = "|%{public}@ %{public}@ %2i %{public}@  │   ╰ %{public}@";
LABEL_20:
              _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0x30u);

            }
          }
          else if (v36)
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v3, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v69 = v67;
            v70 = 2114;
            v71 = v37;
            v72 = 1024;
            v73 = v42;
            v74 = 2114;
            v75 = v66;
            v76 = 2114;
            v77 = v33;
            v39 = v35;
            v40 = "|%{public}@ %{public}@ %2i %{public}@  │   │ %{public}@";
            goto LABEL_20;
          }
        }
        else
        {
          v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v3, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v69 = v67;
            v70 = 2114;
            v71 = v37;
            v72 = 1024;
            v73 = v41;
            v74 = 2114;
            v75 = v66;
            v76 = 2114;
            v77 = v33;
            v39 = v35;
            v40 = "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ options: %{public}@";
            goto LABEL_20;
          }
        }

      }
    }

    v7 = v61;
    v10 = v59;
  }
  if (v62)
  {
    v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v69 = v67;
      v70 = 2114;
      v71 = v44;
      v72 = 1024;
      v73 = v45;
      v74 = 2114;
      v75 = v66;
      v76 = 2114;
      v77 = v62;
      _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ nowPlayingContentItemID: %{public}@", buf, 0x30u);

    }
  }
  if (v64)
  {
    v46 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v64, "doubleValue");
    objc_msgSend(v46, "dateWithTimeIntervalSinceReferenceDate:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v8;
      v51 = objc_msgSend(v3, "threadPriority");
      MSVLogDateFormatter();
      v52 = v10;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringFromDate:", v47);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v69 = v67;
      v70 = 2114;
      v71 = v49;
      v72 = 1024;
      v73 = v51;
      v8 = v50;
      v74 = 2114;
      v75 = v66;
      v76 = 2114;
      v77 = v54;
      _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ sendTime: %{public}@", buf, 0x30u);

      v10 = v52;
      v7 = v61;

      v12 = v60;
    }

  }
  v55 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v69 = v67;
    v70 = 2114;
    v71 = v56;
    v72 = 1024;
    v73 = v57;
    v74 = 2114;
    v75 = v66;
    v76 = 2114;
    v77 = v7;
    v78 = 2114;
    v79 = v8;
    _os_log_impl(&dword_210BD8000, v55, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ command: %{public}@  %{public}@", buf, 0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("session-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈈 SESSION RESTORE BEGIN      %{public}@", (uint8_t *)&v14, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t i;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  int v32;
  int v33;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("session-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = CFSTR("session-id");
  v53[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("session-restore-begin"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "durationSinceEvent:", v10);
  v12 = v11;
  objc_msgSend(v5, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("session-restoration-error"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = a1;
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v41 = v39;
    v42 = 2114;
    v43 = v19;
    v44 = 1024;
    v45 = objc_msgSend(v5, "threadPriority");
    v46 = 2114;
    v47 = v17;
    v48 = 2114;
    v49 = v8;
    v50 = 2048;
    v51 = v12;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈉 SESSION RESTORE END        %{public}@ [%.3fs]", buf, 0x3Au);

  }
  if (v14)
  {
    v36 = v8;
    v37 = v6;
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v38 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v14;
    objc_msgSend(v14, "msv_description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("\n"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      for (i = 0; i < objc_msgSend(v22, "count"); ++i)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v25 = objc_msgSend(v22, "count") - 1;
          v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (i == v25)
          {
            if (v27)
            {
              objc_msgSend(*(id *)(v38 + 40), "streamID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v5, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v41 = v39;
              v42 = 2114;
              v43 = v28;
              v44 = 1024;
              v45 = v29;
              v46 = 2114;
              v47 = v20;
              v48 = 2114;
              v49 = v24;
              v30 = v26;
              v31 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);

            }
          }
          else if (v27)
          {
            objc_msgSend(*(id *)(v38 + 40), "streamID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v41 = v39;
            v42 = 2114;
            v43 = v28;
            v44 = 1024;
            v45 = v33;
            v46 = 2114;
            v47 = v20;
            v48 = 2114;
            v49 = v24;
            v30 = v26;
            v31 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(v38 + 40), "streamID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v41 = v39;
            v42 = 2114;
            v43 = v28;
            v44 = 1024;
            v45 = v32;
            v46 = 2114;
            v47 = v20;
            v48 = 2114;
            v49 = v24;
            v30 = v26;
            v31 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }

      }
    }

    v8 = v36;
    v6 = v37;
    v14 = v35;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544386;
    v14 = v8;
    v15 = 2114;
    v16 = v11;
    v17 = 1024;
    v18 = objc_msgSend(v3, "threadPriority");
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈃 SESSION RESET [BOUNDARY]   %{public}@", (uint8_t *)&v13, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v3, "threadPriority");
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀭨 APPLICATION TERMINATION", (uint8_t *)&v11, 0x26u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v3, "threadPriority");
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀑏 APPLICATION BACKGROUND", (uint8_t *)&v11, 0x26u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v5, v7);
  v8 = objc_msgSend(*(id *)(a1 + 32), "_logAccountEvent:subscription:cursor:", v7, *(_QWORD *)(a1 + 40), v6);

  return v8;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  int v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  int v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  unint64_t v64;
  const __CFString *v65;
  NSObject *v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  int v76;
  NSObject *v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  __CFString *v84;
  uint64_t v85;
  NSObject *v86;
  _BOOL4 v87;
  void *v88;
  int v89;
  NSObject *v90;
  const char *v91;
  int v92;
  int v93;
  __CFString *v95;
  __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  uint64_t v104;
  void *obj;
  void *v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  int v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  const __CFString *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  const __CFString *v126;
  _BYTE v127[128];
  const __CFString *v128;
  _QWORD v129[3];

  v129[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  v128 = CFSTR("remote-control-id");
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, &v128, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-begin"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "unsignedIntValue");

  MPCRemoteCommandDescriptionCopy(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlaybackEngineLoggingConsumer _symbolForCommand:](*(const __CFString **)(a1 + 32), (int)v9);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v108 = v5;
  v17 = v5;
  v18 = a1;
  objc_msgSend(v17, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remote-control-status"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "statusCode");
  v22 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus();
  v103 = v6;
  if (*(_QWORD *)(v18 + 32))
  {
    if (v22 > 9)
    {
      if (v22 == 10)
      {
        v23 = CFSTR("🚷");
        goto LABEL_11;
      }
      if (v22 == 20)
      {
LABEL_5:
        v23 = CFSTR("📵");
LABEL_11:
        v102 = v23;
        goto LABEL_12;
      }
    }
    else
    {
      if (!v22)
      {
        v23 = CFSTR("✅");
        goto LABEL_11;
      }
      if (v22 == 1)
        goto LABEL_5;
    }
    v23 = CFSTR("🚫");
    goto LABEL_11;
  }
  v102 = 0;
LABEL_12:
  v24 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
  objc_msgSend(v108, "durationSinceEvent:", v10);
  v26 = v25;
  MSVLogDateFormatter();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringFromDate:", v28);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v18 + 32));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v18 + 40), "streamID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v114 = v107;
    v115 = 2114;
    v116 = v31;
    v117 = 1024;
    v118 = objc_msgSend(v108, "threadPriority");
    v119 = 2114;
    v120 = v29;
    v121 = 2114;
    v122 = v16;
    v123 = 2048;
    v124 = v26;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀹷 COMMAND TIMEOUT            %{public}@ [%.3fs]", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v18 + 32));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v18 + 40), "streamID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v108, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v114 = v107;
    v115 = 2114;
    v116 = v33;
    v117 = 1024;
    v118 = v34;
    v119 = 2114;
    v120 = v106;
    v121 = 2114;
    v122 = v14;
    v123 = 2114;
    v124 = (uint64_t)v13;
    _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ command: %{public}@  %{public}@ 💢", buf, 0x3Au);

  }
  v35 = objc_msgSend(v21, "type");
  if (v35 <= 2)
  {
    if ((unint64_t)v35 < 2)
    {
      v36 = v18;
      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_61:

        goto LABEL_62;
      }
      objc_msgSend(*(id *)(v36 + 40), "streamID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v108, "threadPriority");
      *(_DWORD *)buf = 138544642;
      v114 = v107;
      v115 = 2114;
      v116 = v38;
      v117 = 1024;
      v118 = v39;
      v119 = 2114;
      v120 = v106;
      v121 = 2114;
      v122 = v102;
      v123 = 2114;
      v124 = (uint64_t)v24;
      v40 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@";
LABEL_26:
      _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, v40, buf, 0x3Au);

      goto LABEL_61;
    }
    if (v35 == 2)
    {
      v101 = v24;
      v104 = v18;
      v95 = v16;
      v96 = v14;
      v97 = v13;
      v98 = v10;
      v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v18 + 40), "streamID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v21;
        v52 = objc_msgSend(v108, "threadPriority");
        objc_msgSend(v51, "dialog");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedTitle");
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "dialog");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedMessage");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v114 = v107;
        v115 = 2114;
        v116 = v50;
        v117 = 1024;
        v118 = v52;
        v21 = v51;
        v119 = 2114;
        v120 = v106;
        v121 = 2114;
        v122 = v54;
        v123 = 2114;
        v124 = (uint64_t)v56;
        _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.title: %{public}@; dialog.message: %{public}@",
          buf,
          0x3Au);

      }
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v100 = v21;
      objc_msgSend(v21, "dialog");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "actions");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v58;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v110;
        do
        {
          for (i = 0; i != v60; ++i)
          {
            if (*(_QWORD *)v110 != v61)
              objc_enumerationMutation(obj);
            v63 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
            v64 = objc_msgSend(v63, "type", v95, v96, v97, v98);
            v65 = CFSTR("􀿨 ");
            if (v64 <= 2)
              v65 = off_24CAB1D28[v64];
            v66 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(v104 + 40), "streamID");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = objc_msgSend(v108, "threadPriority");
              objc_msgSend(v63, "title");
              v69 = v60;
              v70 = v61;
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "event");
              v72 = objc_claimAutoreleasedReturnValue();
              v73 = (void *)v72;
              *(_DWORD *)buf = 138544898;
              v74 = &stru_24CABB5D0;
              if (v72)
                v74 = (const __CFString *)v72;
              v114 = v107;
              v115 = 2114;
              v116 = v67;
              v117 = 1024;
              v118 = v68;
              v119 = 2114;
              v120 = v106;
              v121 = 2114;
              v122 = v65;
              v123 = 2114;
              v124 = (uint64_t)v71;
              v125 = 2114;
              v126 = v74;
              _os_log_impl(&dword_210BD8000, v66, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.action[%{public}@]: %{public}@ %{public}@", buf, 0x44u);

              v61 = v70;
              v60 = v69;

            }
          }
          v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
        }
        while (v60);
      }

      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v104 + 40), "streamID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v108, "threadPriority");
        *(_DWORD *)buf = 138544642;
        v114 = v107;
        v115 = 2114;
        v116 = v75;
        v117 = 1024;
        v118 = v76;
        v119 = 2114;
        v120 = v106;
        v121 = 2114;
        v24 = v101;
        v122 = v102;
        v123 = 2114;
        v124 = (uint64_t)v101;
        _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@", buf, 0x3Au);

        v13 = v97;
        v10 = v98;
        v16 = v95;
        v14 = v96;
        v21 = v100;
        goto LABEL_61;
      }
LABEL_59:
      v13 = v97;
      v10 = v98;
      v16 = v95;
      v14 = v96;
      v21 = v100;
      goto LABEL_60;
    }
    goto LABEL_62;
  }
  if (v35 == 3)
  {
    v77 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v18 + 40), "streamID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v108, "threadPriority");
      *(_DWORD *)buf = 138544642;
      v114 = v107;
      v115 = 2114;
      v116 = v78;
      v117 = 1024;
      v118 = v79;
      v119 = 2114;
      v120 = v106;
      v121 = 2114;
      v122 = v102;
      v123 = 2114;
      v124 = (uint64_t)v24;
      _os_log_impl(&dword_210BD8000, v77, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │  status: %{public}@ %{public}@", buf, 0x3Au);

    }
    v101 = v24;
    v80 = v18;

    objc_msgSend(v21, "error");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "msv_description");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "componentsSeparatedByString:", CFSTR("\n"));
    v37 = objc_claimAutoreleasedReturnValue();

    if (!-[NSObject count](v37, "count"))
      goto LABEL_60;
    v98 = v10;
    v100 = v21;
    v95 = v16;
    v96 = v14;
    v97 = v13;
    v83 = 0;
    while (1)
    {
      -[NSObject objectAtIndexedSubscript:](v37, "objectAtIndexedSubscript:", v83, v95, v96, v97, v98);
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        v85 = -[NSObject count](v37, "count") - 1;
        v86 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        v87 = os_log_type_enabled(v86, OS_LOG_TYPE_ERROR);
        if (v83 == v85)
        {
          if (v87)
          {
            objc_msgSend(*(id *)(v80 + 40), "streamID");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend(v108, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v114 = v107;
            v115 = 2114;
            v116 = v88;
            v117 = 1024;
            v118 = v89;
            v119 = 2114;
            v120 = v106;
            v121 = 2114;
            v122 = v84;
            v90 = v86;
            v91 = "|%{public}@ %{public}@ %2i %{public}@  ╰             %{public}@";
LABEL_57:
            _os_log_impl(&dword_210BD8000, v90, OS_LOG_TYPE_ERROR, v91, buf, 0x30u);

          }
        }
        else if (v87)
        {
          objc_msgSend(*(id *)(v80 + 40), "streamID");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v108, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v114 = v107;
          v115 = 2114;
          v116 = v88;
          v117 = 1024;
          v118 = v93;
          v119 = 2114;
          v120 = v106;
          v121 = 2114;
          v122 = v84;
          v90 = v86;
          v91 = "|%{public}@ %{public}@ %2i %{public}@  │             %{public}@";
          goto LABEL_57;
        }
      }
      else
      {
        v86 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(v80 + 40), "streamID");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v108, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v114 = v107;
          v115 = 2114;
          v116 = v88;
          v117 = 1024;
          v118 = v92;
          v119 = 2114;
          v120 = v106;
          v121 = 2114;
          v122 = v84;
          v90 = v86;
          v91 = "|%{public}@ %{public}@ %2i %{public}@  │   error: ❌ %{public}@";
          goto LABEL_57;
        }
      }

      if (++v83 >= (unint64_t)-[NSObject count](v37, "count"))
        goto LABEL_59;
    }
  }
  if (v35 == 999)
  {
    v101 = v24;
    v41 = v18;
    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v18 + 40), "streamID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v108, "threadPriority");
      objc_msgSend(v21, "customDataType");
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "customData");
      v99 = v21;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "length");
      *(_DWORD *)buf = 138544642;
      v114 = v107;
      v115 = 2114;
      v116 = v43;
      v117 = 1024;
      v118 = v44;
      v119 = 2114;
      v120 = v106;
      v121 = 2114;
      v122 = v45;
      v123 = 2048;
      v124 = v47;
      _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ customDataType: %{public}@; customDataSize: %llu",
        buf,
        0x3Au);

      v21 = v99;
    }

    v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v41 + 40), "streamID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v108, "threadPriority");
      *(_DWORD *)buf = 138544642;
      v114 = v107;
      v115 = 2114;
      v116 = v38;
      v117 = 1024;
      v118 = v48;
      v119 = 2114;
      v120 = v106;
      v121 = 2114;
      v24 = v101;
      v122 = v102;
      v123 = 2114;
      v124 = (uint64_t)v101;
      v40 = "|%{public}@ %{public}@ %2i %{public}@  ╰ status: %{public}@ %{public}@";
      goto LABEL_26;
    }
LABEL_60:
    v24 = v101;
    goto LABEL_61;
  }
LABEL_62:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
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
  void *v18;
  int v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  int v46;
  const char *v47;
  void *v48;
  NSObject *v49;
  __CFString *v50;
  id v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  unint64_t v73;
  const __CFString *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  int v78;
  const char *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  const __CFString *v83;
  _BOOL4 v84;
  int v85;
  NSObject *v86;
  uint32_t v87;
  NSObject *v88;
  _BOOL4 v89;
  void *v90;
  int v91;
  const char *v92;
  NSObject *v93;
  uint32_t v94;
  int v95;
  int v96;
  int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  _BOOL4 v105;
  void *v106;
  int v107;
  NSObject *v108;
  const char *v109;
  int v110;
  int v111;
  const __CFString *v113;
  __CFString *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  const __CFString *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *obja;
  void *obj;
  void *v130;
  void *v131;
  void *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t v137[128];
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  int v143;
  __int16 v144;
  void *v145;
  __int16 v146;
  uint64_t v147;
  __int16 v148;
  uint64_t v149;
  __int16 v150;
  const __CFString *v151;
  const __CFString *v152;
  _QWORD v153[4];

  v153[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  v152 = CFSTR("remote-control-id");
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v153, &v152, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-begin"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = v10;
  objc_msgSend(v10, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "unsignedIntValue");

  -[MPCPlaybackEngineLoggingConsumer _symbolForCommand:](*(const __CFString **)(a1 + 32), (int)v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MPCRemoteCommandDescriptionCopy(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
  v123 = objc_claimAutoreleasedReturnValue();

  v132 = v5;
  objc_msgSend(v5, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("remote-control-status"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "statusCode");
  v19 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus();
  if (*(_QWORD *)(a1 + 32))
  {
    if (v19 > 9)
    {
      v20 = v124;
      if (v19 == 10)
      {
        v21 = CFSTR("🚷");
        goto LABEL_11;
      }
      if (v19 == 20)
      {
LABEL_5:
        v21 = CFSTR("📵");
LABEL_11:
        v121 = v21;
        goto LABEL_12;
      }
    }
    else
    {
      v20 = v124;
      if (!v19)
      {
        v21 = CFSTR("✅");
        goto LABEL_11;
      }
      if (v19 == 1)
        goto LABEL_5;
    }
    v21 = CFSTR("🚫");
    goto LABEL_11;
  }
  v121 = 0;
  v20 = v124;
LABEL_12:
  v22 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
  objc_msgSend(v132, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("remote-control-internal-status"));
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v132, "durationSinceEvent:", v20);
  v26 = v25;
  MSVLogDateFormatter();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringFromDate:", v28);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v31 = v14;
    v32 = v13;
    v33 = v24;
    v34 = v6;
    v35 = a1;
    v36 = v22;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v139 = v131;
    v140 = 2114;
    v141 = v37;
    v142 = 1024;
    v143 = objc_msgSend(v132, "threadPriority");
    v144 = 2114;
    v145 = v29;
    v146 = 2114;
    v147 = v123;
    v148 = 2048;
    v149 = v26;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪀 COMMAND END                %{public}@ [%.3fs]", buf, 0x3Au);

    v22 = v36;
    a1 = v35;
    v6 = v34;
    v24 = v33;
    v13 = v32;
    v14 = v31;
    v20 = v124;
  }

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v132, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v139 = v131;
    v140 = 2114;
    v141 = v39;
    v142 = 1024;
    v143 = v40;
    v144 = 2114;
    v145 = v130;
    v146 = 2114;
    v147 = (uint64_t)v13;
    v148 = 2114;
    v149 = (uint64_t)v14;
    _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ command: %{public}@  %{public}@", buf, 0x3Au);

  }
  v41 = objc_msgSend(v18, "type");
  if (v41 > 2)
  {
    if (v41 != 3)
    {
      v48 = (void *)v123;
      if (v41 == 999)
      {
        v125 = a1;
        v122 = v18;
        v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          obja = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v24;
          v51 = v6;
          v52 = v22;
          v53 = objc_msgSend(v132, "threadPriority");
          objc_msgSend(v18, "customDataType");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "customData");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "length");
          *(_DWORD *)buf = 138544642;
          v139 = v131;
          v140 = 2114;
          v141 = obja;
          v142 = 1024;
          v143 = v53;
          v22 = v52;
          v6 = v51;
          v24 = v50;
          v144 = 2114;
          v145 = v130;
          v146 = 2114;
          v147 = (uint64_t)v54;
          v148 = 2048;
          v149 = v56;
          _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ customDataType: %{public}@; customDataSize: %llu",
            buf,
            0x3Au);

          v20 = v124;
        }

        v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          goto LABEL_74;
        objc_msgSend(*(id *)(v125 + 40), "streamID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v132, "threadPriority");
        *(_DWORD *)buf = 138544642;
        v139 = v131;
        v140 = 2114;
        v141 = v45;
        v142 = 1024;
        v143 = v57;
        v144 = 2114;
        v145 = v130;
        v146 = 2114;
        v147 = (uint64_t)v121;
        v148 = 2114;
        v149 = (uint64_t)v22;
        v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰ status: %{public}@ %{public}@";
        goto LABEL_54;
      }
      goto LABEL_75;
    }
    v88 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    v89 = os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);
    v120 = v6;
    if (v24)
    {
      if (v89)
      {
        objc_msgSend(*(id *)(a1 + 40), "streamID");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v132, "threadPriority");
        *(_DWORD *)buf = 138544898;
        v139 = v131;
        v140 = 2114;
        v141 = v90;
        v142 = 1024;
        v143 = v91;
        v144 = 2114;
        v145 = v130;
        v146 = 2114;
        v147 = (uint64_t)v121;
        v148 = 2114;
        v149 = (uint64_t)v22;
        v150 = 2114;
        v151 = v24;
        v92 = "|%{public}@ %{public}@ %2i %{public}@  │  status: %{public}@ %{public}@; internalStatus: %{public}@";
        v93 = v88;
        v94 = 68;
LABEL_58:
        _os_log_impl(&dword_210BD8000, v93, OS_LOG_TYPE_DEFAULT, v92, buf, v94);

      }
    }
    else if (v89)
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v132, "threadPriority");
      *(_DWORD *)buf = 138544642;
      v139 = v131;
      v140 = 2114;
      v141 = v90;
      v142 = 1024;
      v143 = v97;
      v144 = 2114;
      v145 = v130;
      v146 = 2114;
      v147 = (uint64_t)v121;
      v148 = 2114;
      v149 = (uint64_t)v22;
      v92 = "|%{public}@ %{public}@ %2i %{public}@  │  status: %{public}@ %{public}@";
      v93 = v88;
      v94 = 58;
      goto LABEL_58;
    }
    v98 = a1;

    v122 = v18;
    objc_msgSend(v18, "error");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "msv_description");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "componentsSeparatedByString:", CFSTR("\n"));
    v43 = objc_claimAutoreleasedReturnValue();

    if (!-[NSObject count](v43, "count"))
    {
      v20 = v124;
LABEL_73:
      v6 = v120;
      goto LABEL_74;
    }
    v114 = v24;
    v116 = v22;
    v118 = v14;
    v101 = 0;
    while (1)
    {
      -[NSObject objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (v101)
      {
        v103 = -[NSObject count](v43, "count") - 1;
        v104 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        v105 = os_log_type_enabled(v104, OS_LOG_TYPE_ERROR);
        if (v101 == v103)
        {
          if (v105)
          {
            objc_msgSend(*(id *)(v98 + 40), "streamID");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = objc_msgSend(v132, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v139 = v131;
            v140 = 2114;
            v141 = v106;
            v142 = 1024;
            v143 = v107;
            v144 = 2114;
            v145 = v130;
            v146 = 2114;
            v147 = (uint64_t)v102;
            v108 = v104;
            v109 = "|%{public}@ %{public}@ %2i %{public}@  ╰             %{public}@";
LABEL_69:
            _os_log_impl(&dword_210BD8000, v108, OS_LOG_TYPE_ERROR, v109, buf, 0x30u);

          }
        }
        else if (v105)
        {
          objc_msgSend(*(id *)(v98 + 40), "streamID");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v132, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v139 = v131;
          v140 = 2114;
          v141 = v106;
          v142 = 1024;
          v143 = v111;
          v144 = 2114;
          v145 = v130;
          v146 = 2114;
          v147 = (uint64_t)v102;
          v108 = v104;
          v109 = "|%{public}@ %{public}@ %2i %{public}@  │             %{public}@";
          goto LABEL_69;
        }
      }
      else
      {
        v104 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(v98 + 40), "streamID");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v132, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v139 = v131;
          v140 = 2114;
          v141 = v106;
          v142 = 1024;
          v143 = v110;
          v144 = 2114;
          v145 = v130;
          v146 = 2114;
          v147 = (uint64_t)v102;
          v108 = v104;
          v109 = "|%{public}@ %{public}@ %2i %{public}@  │   error: ❌ %{public}@";
          goto LABEL_69;
        }
      }

      if (++v101 >= (unint64_t)-[NSObject count](v43, "count"))
      {
        v20 = v124;
        v14 = v118;
        v24 = v114;
        v22 = v116;
        goto LABEL_73;
      }
    }
  }
  if ((unint64_t)v41 < 2)
  {
    v42 = a1;
    v122 = v18;
    v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v44)
      {
        objc_msgSend(*(id *)(v42 + 40), "streamID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v132, "threadPriority");
        *(_DWORD *)buf = 138544898;
        v139 = v131;
        v140 = 2114;
        v141 = v45;
        v142 = 1024;
        v143 = v46;
        v144 = 2114;
        v145 = v130;
        v146 = 2114;
        v147 = (uint64_t)v121;
        v148 = 2114;
        v149 = (uint64_t)v22;
        v150 = 2114;
        v151 = v24;
        v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@; internalStatus: %{public}@";
LABEL_46:
        v86 = v43;
        v87 = 68;
LABEL_55:
        _os_log_impl(&dword_210BD8000, v86, OS_LOG_TYPE_DEFAULT, v47, buf, v87);

        goto LABEL_74;
      }
      goto LABEL_74;
    }
    if (!v44)
      goto LABEL_74;
    objc_msgSend(*(id *)(v42 + 40), "streamID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v132, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v139 = v131;
    v140 = 2114;
    v141 = v45;
    v142 = 1024;
    v143 = v95;
    v144 = 2114;
    v145 = v130;
    v146 = 2114;
    v147 = (uint64_t)v121;
    v148 = 2114;
    v149 = (uint64_t)v22;
    v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@";
    goto LABEL_54;
  }
  v48 = (void *)v123;
  if (v41 == 2)
  {
    v126 = a1;
    v113 = v24;
    v115 = v22;
    v117 = v14;
    v119 = v6;
    v58 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v132, "threadPriority");
      objc_msgSend(v18, "dialog");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedTitle");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dialog");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "localizedMessage");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v139 = v131;
      v140 = 2114;
      v141 = v59;
      v142 = 1024;
      v143 = v60;
      v144 = 2114;
      v145 = v130;
      v146 = 2114;
      v147 = (uint64_t)v62;
      v148 = 2114;
      v149 = (uint64_t)v64;
      _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.title: %{public}@; dialog.message: %{public}@",
        buf,
        0x3Au);

    }
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v122 = v18;
    objc_msgSend(v18, "dialog");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "actions");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v66;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v133, v137, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v134;
      v70 = "PlaybackEvents";
      do
      {
        v71 = 0;
        v127 = v68;
        do
        {
          if (*(_QWORD *)v134 != v69)
            objc_enumerationMutation(obj);
          v72 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v71);
          v73 = objc_msgSend(v72, "type");
          v74 = CFSTR("􀿨 ");
          if (v73 <= 2)
            v74 = off_24CAB1D28[v73];
          v75 = os_log_create("com.apple.amp.mediaplaybackcore", v70);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(v126 + 40), "streamID");
            v76 = v69;
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v132, "threadPriority");
            objc_msgSend(v72, "title");
            v79 = v70;
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "event");
            v81 = objc_claimAutoreleasedReturnValue();
            v82 = (void *)v81;
            *(_DWORD *)buf = 138544898;
            v83 = &stru_24CABB5D0;
            if (v81)
              v83 = (const __CFString *)v81;
            v139 = v131;
            v140 = 2114;
            v141 = v77;
            v142 = 1024;
            v143 = v78;
            v144 = 2114;
            v145 = v130;
            v146 = 2114;
            v147 = (uint64_t)v74;
            v148 = 2114;
            v149 = (uint64_t)v80;
            v150 = 2114;
            v151 = v83;
            _os_log_impl(&dword_210BD8000, v75, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.action[%{public}@]: %{public}@ %{public}@", buf, 0x44u);

            v70 = v79;
            v69 = v76;
            v68 = v127;
          }

          ++v71;
        }
        while (v68 != v71);
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v137, 16);
      }
      while (v68);
    }

    v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    v84 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    v24 = (__CFString *)v113;
    v22 = v115;
    if (v113)
    {
      v6 = v119;
      v20 = v124;
      v14 = v117;
      if (v84)
      {
        objc_msgSend(*(id *)(v126 + 40), "streamID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v132, "threadPriority");
        *(_DWORD *)buf = 138544898;
        v139 = v131;
        v140 = 2114;
        v141 = v45;
        v142 = 1024;
        v143 = v85;
        v144 = 2114;
        v145 = v130;
        v146 = 2114;
        v147 = (uint64_t)v121;
        v148 = 2114;
        v149 = (uint64_t)v115;
        v150 = 2114;
        v151 = v113;
        v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@; internalStatus: %{public}@";
        goto LABEL_46;
      }
LABEL_74:

      v18 = v122;
      v48 = (void *)v123;
      goto LABEL_75;
    }
    v6 = v119;
    v20 = v124;
    v14 = v117;
    if (!v84)
      goto LABEL_74;
    objc_msgSend(*(id *)(v126 + 40), "streamID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v132, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v139 = v131;
    v140 = 2114;
    v141 = v45;
    v142 = 1024;
    v143 = v96;
    v144 = 2114;
    v145 = v130;
    v146 = 2114;
    v147 = (uint64_t)v121;
    v148 = 2114;
    v149 = (uint64_t)v115;
    v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@";
LABEL_54:
    v86 = v43;
    v87 = 58;
    goto LABEL_55;
  }
LABEL_75:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  int v46;
  __CFString *v47;
  void *v48;
  __CFString *v49;
  NSObject *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  int v60;
  NSObject *v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  NSObject *v66;
  void *v67;
  int v68;
  const __CFString *v69;
  int v70;
  const __CFString *v71;
  __CFString *v73;
  void *v74;
  uint64_t v75;
  __CFString *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  int v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  const __CFString *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("private-listening-source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("application-bundle-id"));
  v77 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("application-version"));
  v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-delegated-account-metadata"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("device-metadata"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v17 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    v84 = 2114;
    v85 = v14;
    v86 = 1024;
    v87 = v15;
    v88 = 2114;
    v89 = v12;
    v90 = 2114;
    v91 = (uint64_t)v18;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀋾 QUEUE ADD                  %{public}@", buf, 0x30u);

    v8 = v17;
  }

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("queue-description"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    v84 = 2114;
    v85 = v21;
    v86 = 1024;
    v87 = v22;
    v88 = 2114;
    v89 = v19;
    v90 = 2114;
    v91 = (uint64_t)v24;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ queue: %{public}@", buf, 0x30u);

  }
  v25 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("queue-start-item-ids"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    v84 = 2114;
    v85 = v26;
    v86 = 1024;
    v87 = v27;
    v88 = 2114;
    v89 = v19;
    v90 = 2114;
    v91 = (uint64_t)v29;
    _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ start-item: %{public}@", buf, 0x30u);

  }
  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("feature-name"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    v84 = 2114;
    v85 = v31;
    v86 = 1024;
    v87 = v32;
    v88 = 2114;
    v89 = v19;
    v90 = 2114;
    v91 = (uint64_t)v33;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ feature: %{public}@", buf, 0x30u);

  }
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queue-grouping-id"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    v84 = 2114;
    v85 = v35;
    v86 = 1024;
    v87 = v36;
    v88 = 2114;
    v89 = v19;
    v90 = 2114;
    v91 = (uint64_t)v37;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ queue-grouping-id: %{public}@", buf, 0x30u);

  }
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("account-id"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    v84 = 2114;
    v85 = v39;
    v86 = 1024;
    v87 = v40;
    v88 = 2114;
    v89 = v19;
    v90 = 2114;
    v91 = (uint64_t)v42;
    _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ account: %{public}@", buf, 0x30u);

  }
  v43 = (void *)v77;
  if (v77)
  {
    v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544642;
      v83 = v81;
      v84 = 2114;
      v85 = v45;
      v86 = 1024;
      v87 = v46;
      v88 = 2114;
      v89 = v19;
      v90 = 2114;
      v91 = v77;
      v92 = 2114;
      v93 = v76;
      _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ requesting-application: %{public}@/%{public}@", buf, 0x3Au);

    }
  }
  v78 = v19;
  if (v80)
  {
    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("device-name"));
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("device-software-variant"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("user-agent"));
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v50 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v3, "threadPriority");
      objc_msgSend(v3, "payload");
      v74 = v7;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("queue-delegated-account-id"));
      v73 = v49;
      v54 = v48;
      v55 = a1;
      v56 = v8;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v83 = v81;
      v84 = 2114;
      v85 = v51;
      v86 = 1024;
      v87 = v52;
      v88 = 2114;
      v89 = v78;
      v90 = 2114;
      v91 = (uint64_t)v57;
      v92 = 2114;
      v93 = v47;
      _os_log_impl(&dword_210BD8000, v50, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ delegatedAccount: %{public}@; delegatedDeviceName: %{public}@",
        buf,
        0x3Au);

      v8 = v56;
      a1 = v55;
      v48 = v54;
      v49 = v73;

      v7 = v74;
    }

    v58 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544642;
      v83 = v81;
      v84 = 2114;
      v85 = v59;
      v86 = 1024;
      v87 = v60;
      v88 = 2114;
      v89 = v78;
      v90 = 2114;
      v91 = (uint64_t)v48;
      v92 = 2114;
      v93 = v49;
      _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ delegatedDeviceOSVariant: %{public}@; delegatedDeviceUserAgent: %{public}@",
        buf,
        0x3Au);

    }
    v43 = (void *)v77;
    v19 = v78;
  }
  if (v79)
  {
    v61 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v3, "threadPriority");
      objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "BOOLValue");
      *(_DWORD *)buf = 138544386;
      v83 = v81;
      v84 = 2114;
      v85 = v62;
      v86 = 1024;
      v87 = v63;
      v19 = v78;
      v88 = 2114;
      v89 = v78;
      v90 = 1024;
      LODWORD(v91) = v65;
      _os_log_impl(&dword_210BD8000, v61, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ delegated-private-listening: %{BOOL}u", buf, 0x2Cu);

    }
  }
  v66 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v3, "threadPriority");
    if ((unint64_t)(v75 - 1) > 2)
    {
      v69 = CFSTR("Unknown");
      if (v8)
      {
LABEL_30:
        v70 = objc_msgSend(v8, "BOOLValue");
        v71 = CFSTR("NO");
        if (v70)
          v71 = CFSTR("YES");
        goto LABEL_35;
      }
    }
    else
    {
      v69 = off_24CAB1D40[v75 - 1];
      if (v8)
        goto LABEL_30;
    }
    v71 = 0;
LABEL_35:
    *(_DWORD *)buf = 138544642;
    v83 = v81;
    v84 = 2114;
    v85 = v67;
    v86 = 1024;
    v87 = v68;
    v88 = 2114;
    v89 = v78;
    v90 = 2114;
    v91 = (uint64_t)v69;
    v19 = v78;
    v92 = 2114;
    v93 = v71;
    _os_log_impl(&dword_210BD8000, v66, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ private-listening-source: %{public}@; private-listening-override: %{public}@",
      buf,
      0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v14;
  if (v9 == v17)
  {

  }
  else
  {
    v18 = objc_msgSend(v9, "isEqual:", v17);

    if (!v18)
      goto LABEL_12;
  }
  v19 = v16;
  if (v11 == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = objc_msgSend(v11, "isEqual:", v19);

    if (!v21)
      goto LABEL_12;
  }
  MSVLogDateFormatter();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringFromDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544642;
    v30 = v24;
    v31 = 2114;
    v32 = v27;
    v33 = 1024;
    v34 = objc_msgSend(v5, "threadPriority");
    v35 = 2114;
    v36 = v25;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v11;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀃜 QUEUE ITEM ADD             %{public}@ %{public}@", (uint8_t *)&v29, 0x3Au);

  }
LABEL_12:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v14;
  if (v9 == v17)
  {

  }
  else
  {
    v18 = objc_msgSend(v9, "isEqual:", v17);

    if (!v18)
      goto LABEL_12;
  }
  v19 = v16;
  if (v11 == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = objc_msgSend(v11, "isEqual:", v19);

    if (!v21)
      goto LABEL_12;
  }
  MSVLogDateFormatter();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringFromDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544642;
    v30 = v24;
    v31 = 2114;
    v32 = v27;
    v33 = 1024;
    v34 = objc_msgSend(v5, "threadPriority");
    v35 = 2114;
    v36 = v25;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v11;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀃞 QUEUE ITEM REMOVE          %{public}@ %{public}@", (uint8_t *)&v29, 0x3Au);

  }
LABEL_12:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v14;
  if (v9 == v17)
  {

  }
  else
  {
    v18 = objc_msgSend(v9, "isEqual:", v17);

    if (!v18)
      goto LABEL_12;
  }
  v19 = v16;
  if (v11 == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = objc_msgSend(v11, "isEqual:", v19);

    if (!v21)
      goto LABEL_12;
  }
  MSVLogDateFormatter();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringFromDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544642;
    v30 = v24;
    v31 = 2114;
    v32 = v27;
    v33 = 1024;
    v34 = objc_msgSend(v5, "threadPriority");
    v35 = 2114;
    v36 = v25;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v11;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀄎 QUEUE ITEM REORDER         %{public}@ %{public}@", (uint8_t *)&v29, 0x3Au);

  }
LABEL_12:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈽 QUEUE LOAD BEGIN           %{public}@", (uint8_t *)&v14, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t i;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  int v32;
  int v33;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queue-load-error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = CFSTR("queue-section-id");
  v53[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-load-begin"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "durationSinceEvent:", v12);
  v14 = v13;
  MSVLogDateFormatter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = a1;
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v41 = v39;
    v42 = 2114;
    v43 = v19;
    v44 = 1024;
    v45 = objc_msgSend(v5, "threadPriority");
    v46 = 2114;
    v47 = v17;
    v48 = 2114;
    v49 = v10;
    v50 = 2048;
    v51 = v14;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈾 QUEUE LOAD END             %{public}@ [%.3fs]", buf, 0x3Au);

  }
  if (v8)
  {
    v35 = v12;
    v36 = v10;
    v37 = v6;
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v38 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "msv_description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("\n"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      for (i = 0; i < objc_msgSend(v22, "count"); ++i)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", i, v35, v36);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v25 = objc_msgSend(v22, "count") - 1;
          v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (i == v25)
          {
            if (v27)
            {
              objc_msgSend(*(id *)(v38 + 40), "streamID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v5, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v41 = v39;
              v42 = 2114;
              v43 = v28;
              v44 = 1024;
              v45 = v29;
              v46 = 2114;
              v47 = v20;
              v48 = 2114;
              v49 = v24;
              v30 = v26;
              v31 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);

            }
          }
          else if (v27)
          {
            objc_msgSend(*(id *)(v38 + 40), "streamID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v41 = v39;
            v42 = 2114;
            v43 = v28;
            v44 = 1024;
            v45 = v33;
            v46 = 2114;
            v47 = v20;
            v48 = 2114;
            v49 = v24;
            v30 = v26;
            v31 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(v38 + 40), "streamID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v41 = v39;
            v42 = 2114;
            v43 = v28;
            v44 = 1024;
            v45 = v32;
            v46 = 2114;
            v47 = v20;
            v48 = 2114;
            v49 = v24;
            v30 = v26;
            v31 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }

      }
    }

    v6 = v37;
    v12 = v35;
    v10 = v36;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  int v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("container-metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("container-title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("container-kind"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("container-ids"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v53 = objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v55 = v53;
    v56 = 2114;
    v57 = v13;
    v58 = 1024;
    v59 = v14;
    v60 = 2114;
    v61 = (uint64_t)v11;
    v62 = 2114;
    v63 = (uint64_t)v16;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈯 CONTAINER BEGIN            %{public}@", buf, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  v19 = (void *)v53;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v55 = v53;
    v56 = 2114;
    v57 = v20;
    v58 = 1024;
    v59 = v21;
    v60 = 2114;
    v61 = v17;
    v62 = 2114;
    v63 = (uint64_t)v6;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@", buf, 0x30u);

  }
  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v52, "humanDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v55 = v53;
    v56 = 2114;
    v57 = v23;
    v58 = 1024;
    v59 = v24;
    v60 = 2114;
    v61 = v17;
    v62 = 2114;
    v63 = (uint64_t)v25;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ kind: %{public}@", buf, 0x30u);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("container-playlist-version-hash"));
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v55 = v53;
      v56 = 2114;
      v57 = v28;
      v58 = 1024;
      v59 = v29;
      v60 = 2114;
      v61 = v17;
      v62 = 2114;
      v63 = v26;
      _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ playlistVersionHash: %{public}@", buf, 0x30u);

    }
  }
  v50 = (void *)v26;
  v30 = (void *)v17;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("container-is-collaborative-playlist"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v3, "threadPriority");
      v35 = objc_msgSend(v31, "BOOLValue");
      *(_DWORD *)buf = 138544386;
      v55 = v53;
      v56 = 2114;
      v57 = v33;
      v58 = 1024;
      v59 = v34;
      v60 = 2114;
      v61 = (uint64_t)v30;
      v62 = 1024;
      LODWORD(v63) = v35;
      _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ isCollaborative: %{BOOL}u", buf, 0x2Cu);

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("container-radio-type"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "integerValue");

  if (v37)
  {
    v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v49 = v6;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v3, "threadPriority");
      NSStringFromMPModelRadioStationType();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromMPModelRadioStationSubtype();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v53;
      v56 = 2114;
      v57 = v40;
      v58 = 1024;
      v59 = v41;
      v19 = (void *)v53;
      v60 = 2114;
      v61 = (uint64_t)v30;
      v62 = 2114;
      v63 = (uint64_t)v42;
      v64 = 2114;
      v65 = v43;
      _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ stationType: %{public}@; stationSubtype: %{public}@",
        buf,
        0x3Au);

      v6 = v49;
    }

  }
  v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v51, "humanDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v55 = (uint64_t)v19;
    v56 = 2114;
    v57 = v45;
    v58 = 1024;
    v59 = v46;
    v60 = 2114;
    v61 = (uint64_t)v30;
    v62 = 2114;
    v63 = (uint64_t)v47;
    _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ identifiers: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  const __CFString *v40;
  NSObject *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  int v49;
  void *v50;
  int v52;
  int v53;
  void *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  _BYTE v67[10];
  const __CFString *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v56 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-title"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("explicit-treatment"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("item-ids"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-duration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-initial-position"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-start-boundary"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("requires-mpaf"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v26, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-has-video"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v27, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-artist-uploaded"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  MSVLogDateFormatter();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringFromDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v59 = v32;
    v60 = 2114;
    v61 = v35;
    v62 = 1024;
    v63 = objc_msgSend(v3, "threadPriority");
    v64 = 2114;
    v65 = v33;
    v66 = 2114;
    *(_QWORD *)v67 = v57;
    *(_WORD *)&v67[8] = 2114;
    v68 = v56;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀀀 ITEM BEGIN                 %{public}@ %{public}@", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v3, "threadPriority");
    v40 = &stru_24CABB5D0;
    *(_DWORD *)buf = 138544642;
    if (v10)
      v40 = v10;
    v59 = v32;
    v60 = 2114;
    v61 = v38;
    v62 = 1024;
    v63 = v39;
    v64 = 2114;
    v65 = v36;
    v66 = 2114;
    *(_QWORD *)v67 = v55;
    *(_WORD *)&v67[8] = 2114;
    v68 = v40;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@ %{public}@", buf, 0x3Au);

  }
  v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138545154;
    v59 = v32;
    v60 = 2114;
    v61 = v42;
    v62 = 1024;
    v63 = v43;
    v64 = 2114;
    v65 = v36;
    v66 = 2048;
    *(_QWORD *)v67 = v16;
    *(_WORD *)&v67[8] = 2048;
    v68 = v19;
    v69 = 2048;
    v70 = v22;
    v71 = 2048;
    v72 = v25;
    _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ duration: %0.2f; initialPosition: %0.2f; startBoundary: %0.2f; endBoundary: %0.2f",
      buf,
      0x4Eu);

  }
  v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544898;
    v59 = v32;
    v60 = 2114;
    v61 = v45;
    v62 = 1024;
    v63 = v46;
    v64 = 2114;
    v65 = v36;
    v66 = 1024;
    *(_DWORD *)v67 = v53;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v52;
    LOWORD(v68) = 1024;
    *(_DWORD *)((char *)&v68 + 2) = v29;
    _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ requiresPAF: %{BOOL}u; video: %{BOOL}u; artistUploaded: %{BOOL}u",
      buf,
      0x38u);

  }
  v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v54, "humanDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v59 = v32;
    v60 = 2114;
    v61 = v48;
    v62 = 1024;
    v63 = v49;
    v64 = 2114;
    v65 = v36;
    v66 = 2114;
    *(_QWORD *)v67 = v50;
    _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ identifiers: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-ids"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544642;
    v23 = v12;
    v24 = 2114;
    v25 = v15;
    v26 = 1024;
    v27 = objc_msgSend(v3, "threadPriority");
    v28 = 2114;
    v29 = v13;
    v30 = 2114;
    v31 = v5;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍷 ITEM UPDATE                %{public}@ %{public}@", (uint8_t *)&v22, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v9, "humanDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544386;
    v23 = v12;
    v24 = 2114;
    v25 = v18;
    v26 = 1024;
    v27 = v19;
    v28 = 2114;
    v29 = v16;
    v30 = 2114;
    v31 = v20;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ identifiers: %{public}@", (uint8_t *)&v22, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
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
  double v18;
  double v19;
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
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  int v49;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  double v66;
  __int16 v67;
  void *v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-start-position"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v5, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("item-end-position"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v5, "payload");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("item-jump-identifier"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("item-jump-user-initiated"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v22, "BOOLValue");

  v71[0] = CFSTR("queue-section-id");
  v71[1] = CFSTR("queue-item-id");
  v72[0] = v9;
  v72[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v69[0] = CFSTR("queue-section-id");
  v69[1] = CFSTR("queue-item-id");
  v70[0] = v9;
  v70[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-update"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v24;
  objc_msgSend(v24, "payload");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item-duration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  v52 = v26;
  if (v30 == 0.0)
  {
    objc_msgSend(v26, "payload");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("item-duration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

  }
  else
  {
    v35 = v30;
  }

  objc_msgSend(*(id *)(a1 + 32), "_playbackBarWithElapsedTime:duration:", v19, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringFromDate:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v56 = v39;
    v57 = 2114;
    v58 = v42;
    v59 = 1024;
    v60 = objc_msgSend(v5, "threadPriority");
    v61 = 2114;
    v62 = v40;
    v63 = 2114;
    v64 = v9;
    v65 = 2114;
    v66 = *(double *)&v11;
    v67 = 2114;
    v68 = v36;
    _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘨 ITEM JUMP                  %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v56 = v39;
    v57 = 2114;
    v58 = v45;
    v59 = 1024;
    v60 = v46;
    v61 = 2114;
    v62 = v43;
    v63 = 2048;
    v64 = v15;
    v65 = 2048;
    v66 = v19;
    _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f; end: %0.2f",
      buf,
      0x3Au);

  }
  v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v56 = v39;
    v57 = 2114;
    v58 = v48;
    v59 = 1024;
    v60 = v49;
    v61 = 2114;
    v62 = v43;
    v63 = 2114;
    v64 = v54;
    v65 = 1024;
    LODWORD(v66) = v51;
    _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ jumpIdentifier: %{public}@; userInitiated: %{BOOL}u",
      buf,
      0x36u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = CFSTR("queue-section-id");
  v54[1] = CFSTR("queue-item-id");
  v55[0] = v8;
  v55[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-end-position"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v37 = v12;
  objc_msgSend(v12, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("item-duration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  if (v21 == 0.0)
  {
    v52[0] = CFSTR("queue-section-id");
    v52[1] = CFSTR("queue-item-id");
    v22 = (void *)v8;
    v53[0] = v8;
    v53[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-update"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "payload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("item-duration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v21 = v28;

  }
  else
  {
    v22 = (void *)v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "_playbackBarWithElapsedTime:duration:", v16, v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringFromDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v39 = v32;
    v40 = 2114;
    v41 = v35;
    v42 = 1024;
    v43 = objc_msgSend(v5, "threadPriority");
    v44 = 2114;
    v45 = v33;
    v46 = 2114;
    v47 = v22;
    v48 = 2114;
    v49 = v10;
    v50 = 2114;
    v51 = v29;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀡐 ITEM TICK                  %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  NSObject *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  int v49;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  double v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[4];

  v73[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v51 = a1;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-end-position"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v5, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("item-rate-change-reason"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("item-rate-change-source"));
  v55 = objc_claimAutoreleasedReturnValue();

  v72[0] = CFSTR("queue-section-id");
  v72[1] = CFSTR("queue-item-id");
  v73[0] = v9;
  v73[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-update"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v70[0] = CFSTR("queue-section-id");
  v70[1] = CFSTR("queue-item-id");
  v20 = (void *)v9;
  v71[0] = v9;
  v71[1] = v11;
  v53 = (void *)v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("item-duration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v52 = v19;
  if (v26 == 0.0)
  {
    objc_msgSend(v19, "payload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item-duration"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

  }
  else
  {
    v31 = v26;
  }

  objc_msgSend(*(id *)(v51 + 32), "_playbackBarWithElapsedTime:duration:", v15, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringFromDate:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v51 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v51 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v57 = v35;
    v58 = 2114;
    v59 = v38;
    v60 = 1024;
    v61 = objc_msgSend(v5, "threadPriority");
    v62 = 2114;
    v63 = v36;
    v64 = 2114;
    v65 = *(double *)&v20;
    v66 = 2114;
    v67 = v53;
    v68 = 2114;
    v69 = v32;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀊘 ITEM PAUSE                 %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v51 + 32));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v51 + 40), "streamID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v57 = v35;
    v58 = 2114;
    v59 = v41;
    v60 = 1024;
    v61 = v42;
    v62 = 2114;
    v63 = v39;
    v64 = 2048;
    v65 = v15;
    _os_log_impl(&dword_210BD8000, v40, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ end: %0.2f", buf, 0x30u);

  }
  v43 = (void *)v55;
  if (objc_msgSend(v54, "length"))
  {
    v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v51 + 40), "streamID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v5, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v57 = v35;
      v58 = 2114;
      v59 = v45;
      v60 = 1024;
      v61 = v46;
      v62 = 2114;
      v63 = v39;
      v64 = 2114;
      v65 = *(double *)&v54;
      _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ reason: %{public}@", buf, 0x30u);

      v43 = (void *)v55;
    }

  }
  if (objc_msgSend(v43, "length"))
  {
    v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v51 + 40), "streamID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v5, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v57 = v35;
      v58 = 2114;
      v59 = v48;
      v60 = 1024;
      v61 = v49;
      v62 = 2114;
      v63 = v39;
      v64 = 2114;
      v65 = *(double *)&v43;
      _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ source: %{public}@", buf, 0x30u);

    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  float v37;
  void *v38;
  int v39;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  double v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-rate-change-position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v3, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-rate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v3, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("item-rate-change-reason"));
  v17 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  objc_msgSend(v3, "payload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("item-rate-change-participant-id"));
  v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  MSVLogDateFormatter();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringFromDate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138544642;
    v42 = v22;
    v43 = 2114;
    v44 = v25;
    v45 = 1024;
    v46 = objc_msgSend(v3, "threadPriority");
    v47 = 2114;
    v48 = v23;
    v49 = 2114;
    v50 = v5;
    v51 = 2114;
    v52 = v7;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀊕 RATE CHANGED               %{public}@ %{public}@ ", (uint8_t *)&v41, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v3, "threadPriority");
    v41 = 138544386;
    v42 = v22;
    v43 = 2114;
    v44 = v28;
    v45 = 1024;
    v46 = v29;
    v47 = 2114;
    v48 = v26;
    v49 = 2048;
    v50 = v11;
    _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ position: %0.2f", (uint8_t *)&v41, 0x30u);

  }
  if (objc_msgSend(*(id *)&v17, "length"))
  {
    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v3, "threadPriority");
      v41 = 138544386;
      v42 = v22;
      v43 = 2114;
      v44 = v31;
      v45 = 1024;
      v46 = v32;
      v47 = 2114;
      v48 = v26;
      v49 = 2114;
      v50 = v17;
      _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ reason: %{public}@", (uint8_t *)&v41, 0x30u);

    }
  }
  if (objc_msgSend(*(id *)&v19, "length"))
  {
    v33 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v3, "threadPriority");
      v41 = 138544386;
      v42 = v22;
      v43 = 2114;
      v44 = v34;
      v45 = 1024;
      v46 = v35;
      v47 = 2114;
      v48 = v26;
      v49 = 2114;
      v50 = v19;
      _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ participant: %{public}@", (uint8_t *)&v41, 0x30u);

    }
  }
  v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v15;
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v3, "threadPriority");
    v41 = 138544386;
    v42 = v22;
    v43 = 2114;
    v44 = v38;
    v45 = 1024;
    v46 = v39;
    v47 = 2114;
    v48 = v26;
    v49 = 2048;
    v50 = v37;
    _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ rate: %0.2f", (uint8_t *)&v41, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  void *v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  double v68;
  __int16 v69;
  void *v70;
  _QWORD v71[4];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v51 = a1;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("event-time-offset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v5, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", v14);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__1387;
  v57 = __Block_byref_object_dispose__1388;
  v58 = 0;
  v71[0] = CFSTR("remote-control-begin");
  v71[1] = CFSTR("item-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_88;
  v52[3] = &unk_24CABA670;
  v52[4] = &v53;
  objc_msgSend(v6, "enumeratePreviousEventsWithTypes:usingBlock:", v16, v52);

  objc_msgSend((id)v54[5], "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v17, "isEqualToString:", CFSTR("remote-control-begin"));

  v18 = (void *)v54[5];
  if ((_DWORD)v12)
  {
    objc_msgSend(v18, "payload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BE658A0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    if (v23 <= 0.0)
    {
      objc_msgSend((id)v54[5], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "timeIntervalSinceDate:", v28);
      v25 = v29;

    }
    else
    {
      objc_msgSend(v50, "timeIntervalSinceReferenceDate");
      v25 = v24 - v23;
    }
  }
  else
  {
    objc_msgSend(v18, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("item-end"));

    if (!v27)
    {
      v25 = NAN;
      goto LABEL_9;
    }
    objc_msgSend((id)v54[5], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "timeIntervalSinceDate:", v20);
    v25 = NAN;
  }

LABEL_9:
  MSVLogDateFormatter();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringFromDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v51 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v51 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v60 = v32;
    v61 = 2114;
    v62 = v35;
    v63 = 1024;
    v64 = v36;
    v65 = 2114;
    v66 = v33;
    v67 = 2114;
    v68 = *(double *)&v8;
    v69 = 2114;
    v70 = v10;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀀻 FIRST AUDIO FRAME          %{public}@ %{public}@ ", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v51 + 32));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v10;
    v39 = v8;
    v40 = v6;
    objc_msgSend(*(id *)(v51 + 40), "streamID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v5, "threadPriority");
    MSVLogDateFormatter();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringFromDate:", v50);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v60 = v32;
    v61 = 2114;
    v62 = v41;
    v63 = 1024;
    v64 = v42;
    v65 = 2114;
    v66 = v37;
    v67 = 2114;
    v68 = *(double *)&v44;
    _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ actual: %{public}@", buf, 0x30u);

    v6 = v40;
    v8 = v39;
    v10 = v49;

  }
  v45 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v51 + 40), "streamID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v60 = v32;
    v61 = 2114;
    v62 = v46;
    v63 = 1024;
    v64 = v47;
    v65 = 2114;
    v66 = v37;
    v67 = 2048;
    v68 = v25;
    _os_log_impl(&dword_210BD8000, v45, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ waitTime: %0.2fs", buf, 0x30u);

  }
  _Block_object_dispose(&v53, 8);

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
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
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  int v69;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  int v76;
  int v77;
  void *v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  _BYTE v89[10];
  void *v90;
  _BYTE v91[14];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[4];

  v95[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v9;
  objc_msgSend(v5, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-start-position"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v5, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("event-time-offset"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v5, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("supports-vocal-attenuation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v22, "BOOLValue");

  objc_msgSend(v5, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-available"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v24, "BOOLValue");

  objc_msgSend(v5, "payload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-enabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v26, "BOOLValue");

  objc_msgSend(v5, "payload");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-configured"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v28, "BOOLValue");

  objc_msgSend(v5, "payload");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-processing-delay"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = v31;

  v94[0] = CFSTR("queue-section-id");
  v94[1] = CFSTR("queue-item-id");
  v95[0] = v9;
  v95[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v92[0] = CFSTR("queue-section-id");
  v92[1] = CFSTR("queue-item-id");
  v93[0] = v9;
  v93[1] = v12;
  v79 = (void *)v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-update"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v34;
  objc_msgSend(v34, "payload");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("item-duration"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  if (v40 == 0.0)
  {
    objc_msgSend(v36, "payload");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("item-duration"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    v45 = v44;

  }
  else
  {
    v45 = v40;
  }

  objc_msgSend(*(id *)(a1 + 32), "_playbackBarWithElapsedTime:duration:", v16, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringFromDate:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v81 = v49;
    v82 = 2114;
    v83 = v52;
    v84 = 1024;
    v85 = objc_msgSend(v5, "threadPriority");
    v86 = 2114;
    v87 = v50;
    v88 = 2114;
    *(_QWORD *)v89 = v10;
    *(_WORD *)&v89[8] = 2114;
    v90 = v79;
    *(_WORD *)v91 = 2114;
    *(_QWORD *)&v91[2] = v46;
    _os_log_impl(&dword_210BD8000, v51, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀊕 ITEM RESUME                %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v81 = v49;
    v82 = 2114;
    v83 = v55;
    v84 = 1024;
    v85 = v56;
    v86 = 2114;
    v87 = v53;
    v88 = 2048;
    *(double *)v89 = v16;
    _os_log_impl(&dword_210BD8000, v54, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f", buf, 0x30u);

  }
  if (fabs(v20) > 0.1)
  {
    objc_msgSend(v5, "date");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dateByAddingTimeInterval:", v20);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v46;
      v62 = objc_msgSend(v5, "threadPriority");
      MSVLogDateFormatter();
      v72 = v36;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringFromDate:", v58);
      v73 = v10;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v81 = v49;
      v82 = 2114;
      v83 = v61;
      v84 = 1024;
      v85 = v62;
      v46 = v71;
      v86 = 2114;
      v87 = v59;
      v88 = 2114;
      *(_QWORD *)v89 = v64;
      _os_log_impl(&dword_210BD8000, v60, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲| actual: %{public}@", buf, 0x30u);

      v36 = v72;
      v10 = v73;
    }

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v67 = v36;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138545410;
    v81 = v49;
    v82 = 2114;
    v83 = v68;
    v84 = 1024;
    v85 = v69;
    v86 = 2114;
    v87 = v65;
    v88 = 1024;
    *(_DWORD *)v89 = v77;
    *(_WORD *)&v89[4] = 1024;
    *(_DWORD *)&v89[6] = v74;
    LOWORD(v90) = 1024;
    *(_DWORD *)((char *)&v90 + 2) = v76;
    HIWORD(v90) = 1024;
    *(_DWORD *)v91 = v75;
    *(_WORD *)&v91[4] = 2048;
    *(_QWORD *)&v91[6] = v32;
    _os_log_impl(&dword_210BD8000, v66, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ vocal control supported:%{BOOL}u configured:%{BOOL}u available:%{BOOL}u enabled:%{BOOL}u delay:%.0fms", buf, 0x48u);

    v36 = v67;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544642;
    v16 = v10;
    v17 = 2114;
    v18 = v13;
    v19 = 1024;
    v20 = objc_msgSend(v3, "threadPriority");
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀁣 READY TO PLAY              %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-end-position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  MSVLogDateFormatter();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544642;
    v24 = v14;
    v25 = 2114;
    v26 = v17;
    v27 = 1024;
    v28 = objc_msgSend(v3, "threadPriority");
    v29 = 2114;
    v30 = v15;
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v7;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀛪 ITEM BUFFER STALL          %{public}@ %{public}@", (uint8_t *)&v23, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v3, "threadPriority");
    v23 = 138544386;
    v24 = v14;
    v25 = 2114;
    v26 = v20;
    v27 = 1024;
    v28 = v21;
    v29 = 2114;
    v30 = v18;
    v31 = 2048;
    v32 = v11;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ end: %0.2f", (uint8_t *)&v23, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544642;
    v16 = v10;
    v17 = 2114;
    v18 = v13;
    v19 = 1024;
    v20 = objc_msgSend(v3, "threadPriority");
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀛨 ITEM BUFFER FINISH         %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544642;
    v22 = v10;
    v23 = 2114;
    v24 = v13;
    v25 = 1024;
    v26 = objc_msgSend(v3, "threadPriority");
    v27 = 2114;
    v28 = v11;
    v29 = 2114;
    v30 = v5;
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀢕 ITEM SECKEY BEGIN          %{public}@ %{public}@", (uint8_t *)&v21, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("asset-skd"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544386;
    v22 = v10;
    v23 = 2114;
    v24 = v16;
    v25 = 1024;
    v26 = v17;
    v27 = 2114;
    v28 = v14;
    v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ skd: %{public}@", (uint8_t *)&v21, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
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
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v47[0] = CFSTR("queue-section-id");
  objc_msgSend(v5, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = CFSTR("queue-item-id");
  v48[0] = v12;
  objc_msgSend(v5, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-key-request-begin"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "durationSinceEvent:", v16);
  v18 = v17;
  MSVLogDateFormatter();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v34 = v21;
    v35 = 2114;
    v36 = v24;
    v37 = 1024;
    v38 = objc_msgSend(v5, "threadPriority");
    v39 = 2114;
    v40 = v22;
    v41 = 2114;
    v42 = v32;
    v43 = 2114;
    v44 = v10;
    v45 = 2048;
    v46 = v18;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀢖 ITEM SECKEY END            %{public}@ %{public}@ [%.3fs]", buf, 0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v5, "threadPriority");
    objc_msgSend(v5, "payload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("asset-skd"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v21;
    v35 = 2114;
    v36 = v27;
    v37 = 1024;
    v38 = v28;
    v39 = 2114;
    v40 = v25;
    v41 = 2114;
    v42 = v30;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ skd: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-timed-metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544642;
    v22 = v12;
    v23 = 2114;
    v24 = v15;
    v25 = 1024;
    v26 = objc_msgSend(v3, "threadPriority");
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v5;
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀢊 ITEM METADATA PING          %{public}@ %{public}@", (uint8_t *)&v21, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v3, "threadPriority");
    v21 = 138544386;
    v22 = v12;
    v23 = 2114;
    v24 = v18;
    v25 = 1024;
    v26 = v19;
    v27 = 2114;
    v28 = v16;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ data: %{public}@", (uint8_t *)&v21, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  int v44;
  int v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-end-position"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v5, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v17, "BOOLValue");

  v65[0] = CFSTR("queue-section-id");
  v65[1] = CFSTR("queue-item-id");
  v66[0] = v9;
  v66[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v63[0] = CFSTR("queue-section-id");
  v63[1] = CFSTR("queue-item-id");
  v64[0] = v9;
  v64[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-update"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v19;
  objc_msgSend(v19, "payload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-duration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v47 = v21;
  if (v25 == 0.0)
  {
    objc_msgSend(v21, "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("item-duration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

  }
  else
  {
    v30 = v25;
  }

  objc_msgSend(*(id *)(a1 + 32), "_playbackBarWithElapsedTime:duration:", v15, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringFromDate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v50 = v34;
    v51 = 2114;
    v52 = v37;
    v53 = 1024;
    v54 = objc_msgSend(v5, "threadPriority");
    v55 = 2114;
    v56 = v35;
    v57 = 2114;
    v58 = *(double *)&v9;
    v59 = 2114;
    v60 = v11;
    v61 = 2114;
    v62 = v31;
    _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀀁 ITEM END                   %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v50 = v34;
    v51 = 2114;
    v52 = v40;
    v53 = 1024;
    v54 = v41;
    v55 = 2114;
    v56 = v38;
    v57 = 2048;
    v58 = v15;
    _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ end: %0.2f", buf, 0x30u);

  }
  v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v50 = v34;
    v51 = 2114;
    v52 = v43;
    v53 = 1024;
    v54 = v44;
    v55 = 2114;
    v56 = v38;
    v57 = 1024;
    LODWORD(v58) = v46;
    _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ didPlayToEnd: %{BOOL}u", buf, 0x2Cu);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t i;
  void *v42;
  NSObject *v43;
  const char *v44;
  void *v45;
  id v46;
  int v47;
  void *v48;
  NSObject *v49;
  void *v50;
  int v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id obj;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-audio-format-metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("active-format"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("target-format"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("active-format-justification"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  NSStringFromMPCPlayerAudioFormatJustification(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("preferred-tiers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  NSStringComponentsFromMPCPlayerAudioFormatTierPreference(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "msv_compactDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("alternate-formats"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("route"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v59 = v20;
    v60 = v18;
    v61 = v14;
    v62 = v19;
    v56 = v9;
    MSVLogDateFormatter();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromDate:", v22);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v73 = v65;
      v74 = 2114;
      v75 = v25;
      v76 = 1024;
      v77 = objc_msgSend(v3, "threadPriority");
      v78 = 2114;
      v79 = v23;
      v80 = 2114;
      v81 = v5;
      v82 = 2114;
      v83 = v7;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒿 AUDIO CHANGE               %{public}@ %{public}@", buf, 0x3Au);

    }
    v58 = v5;

    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v3, "threadPriority");
      objc_msgSend(v10, "humanDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v73 = v65;
      v74 = 2114;
      v75 = v27;
      v76 = 1024;
      v77 = v28;
      v78 = 2114;
      v79 = v64;
      v80 = 2114;
      v81 = v29;
      _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ activeFormat: %{public}@", buf, 0x30u);

    }
    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v3, "threadPriority");
      objc_msgSend(v11, "humanDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v73 = v65;
      v74 = 2114;
      v75 = v31;
      v76 = 1024;
      v77 = v32;
      v78 = 2114;
      v79 = v64;
      v80 = 2114;
      v81 = v33;
      _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ targetFormat: %{public}@", buf, 0x30u);

    }
    v54 = v11;
    v55 = v10;
    v57 = v7;

    v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544642;
      v73 = v65;
      v74 = 2114;
      v75 = v35;
      v76 = 1024;
      v77 = v36;
      v78 = 2114;
      v79 = v64;
      v80 = 2114;
      v81 = v61;
      v82 = 2114;
      v83 = v60;
      _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ justification: %{public}@; preferences: %{public}@",
        buf,
        0x3Au);

    }
    v63 = a1;

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v62;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v68;
      v40 = "com.apple.amp.mediaplaybackcore";
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v68 != v39)
            objc_enumerationMutation(obj);
          v42 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v43 = os_log_create(v40, "PlaybackEvents");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(v63 + 40), "streamID");
            v44 = v40;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v3;
            v47 = objc_msgSend(v3, "threadPriority");
            objc_msgSend(v42, "humanDescription");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v73 = v65;
            v74 = 2114;
            v75 = v45;
            v76 = 1024;
            v77 = v47;
            v3 = v46;
            v78 = 2114;
            v79 = v64;
            v80 = 2114;
            v81 = v48;
            _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_DEBUG, "|%{public}@ %{public}@ %2i %{public}@  │ alternate: %{public}@", buf, 0x30u);

            v40 = v44;
          }

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v38);
    }

    v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    v11 = v54;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v63 + 40), "streamID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v3, "threadPriority");
      objc_msgSend(v59, "humanDescription");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v73 = v65;
      v74 = 2114;
      v75 = v50;
      v76 = 1024;
      v77 = v51;
      v78 = 2114;
      v79 = v64;
      v80 = 2114;
      v81 = v52;
      _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ audioRoute: %{public}@", buf, 0x30u);

    }
    v7 = v57;
    v5 = v58;
    v10 = v55;
    v9 = v56;
    v18 = v60;
    v14 = v61;
    v19 = v62;
    v20 = v59;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  NSObject *v30;
  void *v31;
  int v32;
  const __CFString *v33;
  const __CFString *v34;
  NSObject *v35;
  void *v36;
  int v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const __CFString *v53;
  NSObject *v54;
  void *v55;
  int v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  void *v61;
  int v62;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  __CFString *v68;
  void *v69;
  __CFString *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  _BYTE v94[14];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asset-load-info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-asset-type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-asset-endpoint-type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-asset-is-delegated-playback"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-asset-source"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("player-item-identifier"));
  v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-asset-url"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("item-audio-asset-type-selection-metadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("audio-asset-type-selection-explanation"));
  v67 = v18;
  v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("audio-asset-type-selection-justification"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v3;
  v20 = v3;
  v21 = a1;
  objc_msgSend(v20, "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v22);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v21 + 32));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v21 + 40), "streamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v84 = v74;
    v85 = 2114;
    v86 = v25;
    v87 = 1024;
    v88 = objc_msgSend(v75, "threadPriority");
    v89 = 2114;
    v90 = v23;
    v91 = 2114;
    v92 = v5;
    v93 = 2114;
    *(_QWORD *)v94 = v7;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒿 AUDIO ASSET SELECTION      %{public}@ %{public}@", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v21 + 32));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  v71 = v21;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v21 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v75, "threadPriority");
    if ((unint64_t)(v11 - 1) > 4)
      v29 = CFSTR("Unspecified");
    else
      v29 = off_24CAB1D58[v11 - 1];
    *(_DWORD *)buf = 138544386;
    v84 = v74;
    v85 = 2114;
    v86 = v27;
    v87 = 1024;
    v88 = v28;
    v89 = 2114;
    v90 = v73;
    v91 = 2114;
    v92 = v29;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", buf, 0x30u);

  }
  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v21 + 40), "streamID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v75, "threadPriority");
    if ((unint64_t)(v13 - 1) > 2)
      v33 = CFSTR("Unknown");
    else
      v33 = off_24CAB1D80[v13 - 1];
    if ((unint64_t)(v16 - 1) > 5)
      v34 = CFSTR("Unknown");
    else
      v34 = off_24CAB1D98[v16 - 1];
    *(_DWORD *)buf = 138544898;
    v84 = v74;
    v85 = 2114;
    v86 = v31;
    v87 = 1024;
    v88 = v32;
    v89 = 2114;
    v90 = v73;
    v91 = 2114;
    v92 = v33;
    v93 = 1024;
    *(_DWORD *)v94 = v76;
    *(_WORD *)&v94[4] = 2114;
    *(_QWORD *)&v94[6] = v34;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ endpoint: %{public}@; delegated: %{BOOL}u; source: %{public}@",
      buf,
      0x40u);

  }
  v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v21 + 40), "streamID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v75, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v84 = v74;
    v85 = 2114;
    v86 = v36;
    v87 = 1024;
    v88 = v37;
    v89 = 2114;
    v90 = v73;
    v91 = 2114;
    v92 = v70;
    v93 = 2114;
    *(_QWORD *)v94 = v69;
    _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ AVPlayerItem: %{public}@; url: %{public}@",
      buf,
      0x3Au);

  }
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
  if (v72)
  {
    if (v39)
    {
      objc_msgSend(*(id *)(v21 + 40), "streamID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v75, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v84 = v74;
      v85 = 2114;
      v86 = v40;
      v87 = 1024;
      v88 = v41;
      v89 = 2114;
      v90 = v73;
      v91 = 2114;
      v92 = v68;
      _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ explanation: %{public}@", buf, 0x30u);

    }
    v64 = v9;
    v65 = v7;
    v66 = v5;

    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v21 + 40), "streamID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v75, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v84 = v74;
      v85 = 2114;
      v86 = v43;
      v87 = 1024;
      v88 = v44;
      v89 = 2114;
      v90 = v73;
      _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ justification:", buf, 0x26u);

    }
    objc_msgSend(v72, "allKeys");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "sortedArrayUsingComparator:", &__block_literal_global_104);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v38 = v46;
    v47 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v79;
      v50 = "com.apple.amp.mediaplaybackcore";
      v51 = "PlaybackEvents";
      do
      {
        v52 = 0;
        v77 = v48;
        do
        {
          if (*(_QWORD *)v79 != v49)
            objc_enumerationMutation(v38);
          v53 = *(const __CFString **)(*((_QWORD *)&v78 + 1) + 8 * v52);
          v54 = os_log_create(v50, v51);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(v21 + 40), "streamID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v75, "threadPriority");
            objc_msgSend(v72, "objectForKeyedSubscript:", v53);
            v57 = v51;
            v58 = v49;
            v59 = v50;
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v84 = v74;
            v85 = 2114;
            v86 = v55;
            v87 = 1024;
            v88 = v56;
            v89 = 2114;
            v90 = v73;
            v91 = 2114;
            v92 = v53;
            v93 = 2114;
            *(_QWORD *)v94 = v60;
            _os_log_impl(&dword_210BD8000, v54, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@", buf, 0x3Au);

            v50 = v59;
            v49 = v58;
            v51 = v57;
            v48 = v77;

            v21 = v71;
          }

          ++v52;
        }
        while (v48 != v52);
        v48 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
      }
      while (v48);
    }

    v7 = v65;
    v5 = v66;
    v9 = v64;
  }
  else if (v39)
  {
    objc_msgSend(*(id *)(v21 + 40), "streamID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v75, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v84 = v74;
    v85 = 2114;
    v86 = v61;
    v87 = 1024;
    v88 = v62;
    v89 = 2114;
    v90 = v73;
    v91 = 2114;
    v92 = v68;
    _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ explanation: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t i;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  int v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-audio-format-selection-metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("audio-format-selection-format"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("audio-format-selection-explanation"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("audio-format-selection-justification"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  MSVLogDateFormatter();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v3;
  objc_msgSend(v3, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v12);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v62 = v54;
    v63 = 2114;
    v64 = v15;
    v65 = 1024;
    v66 = objc_msgSend(v55, "threadPriority");
    v67 = 2114;
    v68 = v13;
    v69 = 2114;
    v70 = v5;
    v71 = 2114;
    v72 = v7;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒿 AUDIO FORMAT SELECTION     %{public}@ %{public}@", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v55, "threadPriority");
    objc_msgSend(v10, "humanDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v62 = v54;
    v63 = 2114;
    v64 = v17;
    v65 = 1024;
    v66 = v18;
    v67 = 2114;
    v68 = v52;
    v69 = 2114;
    v70 = v19;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ format: %{public}@", buf, 0x30u);

  }
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v53)
  {
    v49 = v5;
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v55, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v62 = v54;
      v63 = 2114;
      v64 = v22;
      v65 = 1024;
      v66 = v23;
      v67 = 2114;
      v68 = v52;
      v69 = 2114;
      v70 = v50;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ explanation: %{public}@", buf, 0x30u);

    }
    v46 = v10;
    v47 = v9;
    v48 = v7;

    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v55, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v62 = v54;
      v63 = 2114;
      v64 = v25;
      v65 = 1024;
      v66 = v26;
      v67 = 2114;
      v68 = v52;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ justification:", buf, 0x26u);

    }
    objc_msgSend(v53, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_107);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v20 = v28;
    v29 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v57;
      v32 = "com.apple.amp.mediaplaybackcore";
      v51 = a1;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v57 != v31)
            objc_enumerationMutation(v20);
          v34 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v35 = os_log_create(v32, "PlaybackEvents");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v55, "threadPriority");
            objc_msgSend(v53, "objectForKeyedSubscript:", v34);
            v38 = v30;
            v39 = v32;
            v40 = v31;
            v41 = v20;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v62 = v54;
            v63 = 2114;
            v64 = v36;
            v65 = 1024;
            v66 = v37;
            v67 = 2114;
            v68 = v52;
            v69 = 2114;
            v70 = v34;
            v71 = 2114;
            v72 = v42;
            _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@", buf, 0x3Au);

            v20 = v41;
            v31 = v40;
            v32 = v39;
            v30 = v38;

            a1 = v51;
          }

        }
        v30 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v30);
    }

    v7 = v48;
    v5 = v49;
    v10 = v46;
    v9 = v47;
  }
  else if (v21)
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v55, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v62 = v54;
    v63 = 2114;
    v64 = v43;
    v65 = 1024;
    v66 = v44;
    v67 = 2114;
    v68 = v52;
    v69 = 2114;
    v70 = v50;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ explanation: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544642;
    v16 = v10;
    v17 = 2114;
    v18 = v13;
    v19 = 1024;
    v20 = objc_msgSend(v3, "threadPriority");
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀌕 ITEM ASSET BEGIN           %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t i;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  int v34;
  int v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v56[0] = CFSTR("queue-section-id");
  v56[1] = CFSTR("queue-item-id");
  v57[0] = v8;
  v57[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-begin"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "durationSinceEvent:", v12);
  v14 = v13;
  objc_msgSend(v5, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate:", v18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v43 = v41;
    v44 = 2114;
    v45 = v21;
    v46 = 1024;
    v47 = objc_msgSend(v5, "threadPriority");
    v48 = 2114;
    v49 = v19;
    v50 = 2114;
    v51 = v8;
    v52 = 2114;
    v53 = v10;
    v54 = 2048;
    v55 = v14;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀌖 ITEM ASSET END             %{public}@ %{public}@ [%.3fs]", buf, 0x44u);

  }
  if (v16)
  {
    v38 = v12;
    v39 = v8;
    v40 = v6;
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v16;
    objc_msgSend(v16, "msv_description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("\n"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "count"))
    {
      for (i = 0; i < objc_msgSend(v24, "count"); ++i)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", i);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v27 = objc_msgSend(v24, "count") - 1;
          v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
          if (i == v27)
          {
            if (v29)
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v5, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v43 = v41;
              v44 = 2114;
              v45 = v30;
              v46 = 1024;
              v47 = v31;
              v48 = 2114;
              v49 = v22;
              v50 = 2114;
              v51 = v26;
              v32 = v28;
              v33 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);

            }
          }
          else if (v29)
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v43 = v41;
            v44 = 2114;
            v45 = v30;
            v46 = 1024;
            v47 = v35;
            v48 = 2114;
            v49 = v22;
            v50 = 2114;
            v51 = v26;
            v32 = v28;
            v33 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v43 = v41;
            v44 = 2114;
            v45 = v30;
            v46 = 1024;
            v47 = v34;
            v48 = 2114;
            v49 = v22;
            v50 = 2114;
            v51 = v26;
            v32 = v28;
            v33 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }

      }
    }

    v8 = v39;
    v6 = v40;
    v12 = v38;
    v16 = v37;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544642;
    v16 = v10;
    v17 = 2114;
    v18 = v13;
    v19 = 1024;
    v20 = objc_msgSend(v3, "threadPriority");
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍺 ITEM CONFIG BEGIN          %{public}@ %{public}@ ", (uint8_t *)&v15, 0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  void *v48;
  NSObject *v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  int v54;
  void *v55;
  NSObject *v56;
  void *v57;
  int v58;
  NSObject *v59;
  void *v60;
  int v61;
  NSObject *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  _BYTE v85[10];
  uint64_t v86;
  _DWORD v87[5];
  _QWORD v88[2];
  _QWORD v89[4];

  v89[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-configured-eq"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (int)objc_msgSend(v13, "intValue");

  objc_msgSend(MEMORY[0x24BDDCB20], "settingWithPreset:", v14);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("item-configured-sc-vol-normalization"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v5, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("item-configured-loudness"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("hls-metadata-wait-time"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  objc_msgSend(v5, "payload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("audio-route"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v88[0] = CFSTR("queue-section-id");
  v88[1] = CFSTR("queue-item-id");
  v74 = (void *)v11;
  v75 = (void *)v9;
  v89[0] = v9;
  v89[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-configuration-begin"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "durationSinceEvent:", v27);
  v29 = v28;
  objc_msgSend(v5, "payload");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("supports-vocal-attenuation"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v31, "BOOLValue");

  objc_msgSend(v5, "payload");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-available"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v33, "BOOLValue");

  objc_msgSend(v5, "payload");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-enabled"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v68) = objc_msgSend(v35, "BOOLValue");

  objc_msgSend(v5, "payload");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-configured"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v68) = objc_msgSend(v37, "BOOLValue");

  MSVLogDateFormatter();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringFromDate:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v77 = v40;
    v78 = 2114;
    v79 = v43;
    v80 = 1024;
    v81 = objc_msgSend(v5, "threadPriority");
    v82 = 2114;
    v83 = v41;
    v84 = 2114;
    *(_QWORD *)v85 = v75;
    *(_WORD *)&v85[8] = 2114;
    v86 = v11;
    LOWORD(v87[0]) = 2048;
    *(_QWORD *)((char *)v87 + 2) = v29;
    _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪑 ITEM CONFIG END            %{public}@ %{public}@ [%.3fs]", buf, 0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v5, "threadPriority");
    objc_msgSend(v73, "name");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v77 = v40;
    v78 = 2114;
    v79 = v46;
    v80 = 1024;
    v81 = v47;
    v82 = 2114;
    v83 = v44;
    v84 = 2114;
    *(_QWORD *)v85 = v48;
    _os_log_impl(&dword_210BD8000, v45, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ EQ: %{public}@", buf, 0x30u);

  }
  if (v18 > 0.0)
  {
    v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v5, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v77 = v40;
      v78 = 2114;
      v79 = v50;
      v80 = 1024;
      v81 = v51;
      v82 = 2114;
      v83 = v44;
      v84 = 2048;
      *(double *)v85 = v18;
      _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ soundCheckVolumeNormalization: %.3f", buf, 0x30u);

    }
  }
  if (objc_msgSend(v20, "count", v68))
  {
    v52 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v5, "threadPriority");
      objc_msgSend(v20, "msv_compactDescription");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v77 = v40;
      v78 = 2114;
      v79 = v53;
      v80 = 1024;
      v81 = v54;
      v82 = 2114;
      v83 = v44;
      v84 = 2114;
      *(_QWORD *)v85 = v55;
      _os_log_impl(&dword_210BD8000, v52, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ loudnessInfo: %{public}@", buf, 0x30u);

    }
  }
  if (v24 > 0.0)
  {
    v56 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v5, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v77 = v40;
      v78 = 2114;
      v79 = v57;
      v80 = 1024;
      v81 = v58;
      v82 = 2114;
      v83 = v44;
      v84 = 2048;
      *(double *)v85 = v24;
      _os_log_impl(&dword_210BD8000, v56, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ hlsMetadataWaitTime: %0.3fs", buf, 0x30u);

    }
  }
  v59 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138545154;
    v77 = v40;
    v78 = 2114;
    v79 = v60;
    v80 = 1024;
    v81 = v61;
    v82 = 2114;
    v83 = v44;
    v84 = 1024;
    *(_DWORD *)v85 = v71;
    *(_WORD *)&v85[4] = 1024;
    *(_DWORD *)&v85[6] = v69;
    LOWORD(v86) = 1024;
    *(_DWORD *)((char *)&v86 + 2) = v70;
    HIWORD(v86) = 1024;
    v87[0] = HIDWORD(v69);
    _os_log_impl(&dword_210BD8000, v59, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ vocal control supported:%{BOOL}u configured:%{BOOL}u available:%{BOOL}u enabled:%{BOOL}u", buf, 0x3Eu);

  }
  v62 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v5, "threadPriority");
    objc_msgSend(v72, "name");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMPCPlayerAudioRouteType(objc_msgSend(v72, "type"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v77 = v40;
    v78 = 2114;
    v79 = v63;
    v80 = 1024;
    v81 = v64;
    v82 = 2114;
    v83 = v44;
    v84 = 2114;
    *(_QWORD *)v85 = v65;
    *(_WORD *)&v85[8] = 2114;
    v86 = (uint64_t)v66;
    _os_log_impl(&dword_210BD8000, v62, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ route: %{public}@ (%{public}@)", buf, 0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_113(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t i;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  NSObject *v25;
  const char *v26;
  int v27;
  int v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v35 = v33;
    v36 = 2114;
    v37 = v14;
    v38 = 1024;
    v39 = objc_msgSend(v3, "threadPriority");
    v40 = 2114;
    v41 = v12;
    v42 = 2114;
    v43 = v5;
    v44 = 2114;
    v45 = v7;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀌔 ITEM FAILED                %{public}@ %{public}@", buf, 0x3Au);

  }
  if (v9)
  {
    v31 = v7;
    v32 = v5;
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9;
    objc_msgSend(v9, "msv_description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      for (i = 0; i < objc_msgSend(v17, "count"); ++i)
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v20 = objc_msgSend(v17, "count") - 1;
          v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          if (i == v20)
          {
            if (v22)
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v3, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v35 = v33;
              v36 = 2114;
              v37 = v23;
              v38 = 1024;
              v39 = v24;
              v40 = 2114;
              v41 = v15;
              v42 = 2114;
              v43 = v19;
              v25 = v21;
              v26 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x30u);

            }
          }
          else if (v22)
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v3, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v35 = v33;
            v36 = 2114;
            v37 = v23;
            v38 = 1024;
            v39 = v28;
            v40 = 2114;
            v41 = v15;
            v42 = 2114;
            v43 = v19;
            v25 = v21;
            v26 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v3, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v35 = v33;
            v36 = 2114;
            v37 = v23;
            v38 = 1024;
            v39 = v27;
            v40 = 2114;
            v41 = v15;
            v42 = 2114;
            v43 = v19;
            v25 = v21;
            v26 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }

      }
    }

    v7 = v31;
    v5 = v32;
    v9 = v30;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544642;
    v23 = v13;
    v24 = 2114;
    v25 = v16;
    v26 = 1024;
    v27 = objc_msgSend(v3, "threadPriority");
    v28 = 2114;
    v29 = v14;
    v30 = 2114;
    v31 = v5;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀓞 PLACEHOLDER BEGIN          %{public}@ %{public}@", (uint8_t *)&v22, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v3, "threadPriority");
    v22 = 138544386;
    v23 = v13;
    v24 = 2114;
    v25 = v19;
    v26 = 1024;
    v27 = v20;
    v28 = 2114;
    v29 = v17;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@", (uint8_t *)&v22, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544642;
    v16 = v10;
    v17 = 2114;
    v18 = v13;
    v19 = 1024;
    v20 = objc_msgSend(v3, "threadPriority");
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀧒 PLACEHOLDER END            %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-start-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-stream-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v28 = v12;
    v29 = 2114;
    v30 = v15;
    v31 = 1024;
    v32 = objc_msgSend(v3, "threadPriority");
    v33 = 2114;
    v34 = v13;
    v35 = 2114;
    v36 = v5;
    v37 = 2114;
    v38 = v7;
    v39 = 2114;
    v40 = v9;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒙 HLS BEGIN                  %{public}@ %{public}@ %{public}@", buf, 0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("container-indeterminate-duration"));
    v26 = v9;
    v21 = v7;
    v22 = v5;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");
    *(_DWORD *)buf = 138544386;
    v28 = v12;
    v29 = 2114;
    v30 = v18;
    v31 = 1024;
    v32 = v19;
    v33 = 2114;
    v34 = v16;
    v35 = 1024;
    LODWORD(v36) = v24;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ hasIndeterminateDuration: %{BOOL}u", buf, 0x2Cu);

    v5 = v22;
    v7 = v21;
    v9 = v26;

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-end-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-stream-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544898;
    v18 = v12;
    v19 = 2114;
    v20 = v15;
    v21 = 1024;
    v22 = objc_msgSend(v3, "threadPriority");
    v23 = 2114;
    v24 = v13;
    v25 = 2114;
    v26 = v5;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒚 HLS END                    %{public}@ %{public}@ %{public}@", (uint8_t *)&v17, 0x44u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item-stream-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544386;
    v14 = v8;
    v15 = 2114;
    v16 = v11;
    v17 = 1024;
    v18 = objc_msgSend(v3, "threadPriority");
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀭹 TIMED METADATA BEGIN       %{public}@", (uint8_t *)&v13, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_119(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item-stream-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544386;
    v14 = v8;
    v15 = 2114;
    v16 = v11;
    v17 = 1024;
    v18 = objc_msgSend(v3, "threadPriority");
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀭺 TIMED METADATA END         %{public}@", (uint8_t *)&v13, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_120(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  unint64_t i;
  __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  unint64_t j;
  __CFString *v48;
  uint64_t v49;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  int v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  NSObject *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  NSObject *v69;
  _BOOL4 v70;
  void *v71;
  int v72;
  void *v73;
  NSObject *v74;
  const char *v75;
  void *v76;
  int v77;
  void *v78;
  int v79;
  void *v81;
  void *v82;
  __CFString *v83;
  __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  void *v93;
  _QWORD v94[4];
  id v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  __CFString *v105;
  __int16 v106;
  void *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outgoing-item-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("incoming-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transition-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transition-parameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("outgoing"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v12;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("incoming"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("􀠊  Gapless");
  if (v10 == 1)
    v13 = CFSTR("􀟧  Crossfade");
  if (v10 == 2)
    v13 = CFSTR("􀠉  Unmanaged");
  if (*(_QWORD *)(a1 + 32))
    v14 = (__CFString *)v13;
  else
    v14 = 0;
  v84 = v14;
  MSVLogDateFormatter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v3;
  objc_msgSend(v3, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v16);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v97 = v90;
    v98 = 2114;
    v99 = v19;
    v100 = 1024;
    v101 = objc_msgSend(v3, "threadPriority");
    v102 = 2114;
    v103 = v17;
    v104 = 2114;
    v105 = v5;
    v106 = 2114;
    v107 = v7;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀉘 ITEM TRANSITION SETUP      %{public}@ => %{public}@", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v97 = v90;
    v98 = 2114;
    v99 = v21;
    v100 = 1024;
    v101 = v22;
    v102 = 2114;
    v103 = v89;
    v104 = 2114;
    v105 = v84;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", buf, 0x30u);

  }
  v88 = a1;
  if (v10 != 1)
  {
    v62 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v97 = v90;
      v98 = 2114;
      v99 = v63;
      v100 = 1024;
      v101 = v64;
      v102 = 2114;
      v103 = v89;
      _os_log_impl(&dword_210BD8000, v62, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ parameters:", buf, 0x26u);

    }
    if (!objc_msgSend(v87, "count"))
      goto LABEL_64;
    objc_msgSend(v87, "allKeys");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "sortedArrayUsingComparator:", &__block_literal_global_162);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v61, "count"))
    {
LABEL_63:

      goto LABEL_64;
    }
    v82 = v7;
    v83 = v5;
    v66 = 0;
    while (1)
    {
      objc_msgSend(v61, "objectAtIndexedSubscript:", v66);
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v66)
      {
        v69 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v3, "threadPriority");
          objc_msgSend(v87, "objectForKeyedSubscript:", v67);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v97 = v90;
          v98 = 2114;
          v99 = v76;
          v100 = 1024;
          v101 = v77;
          v102 = 2114;
          v103 = v89;
          v104 = 2114;
          v105 = v67;
          v106 = 2114;
          v107 = v78;
          _os_log_impl(&dword_210BD8000, v69, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@     ╲╭ %{public}@: %{public}@", buf, 0x3Au);

          a1 = v88;
        }
        goto LABEL_61;
      }
      v68 = objc_msgSend(v61, "count") - 1;
      v69 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
      if (v66 == v68)
      {
        if (v70)
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v3, "threadPriority");
          objc_msgSend(v87, "objectForKeyedSubscript:", v67);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v97 = v90;
          v98 = 2114;
          v99 = v71;
          v100 = 1024;
          v101 = v72;
          a1 = v88;
          v102 = 2114;
          v103 = v89;
          v104 = 2114;
          v105 = v67;
          v106 = 2114;
          v107 = v73;
          v74 = v69;
          v75 = "|%{public}@ %{public}@ %2i %{public}@      ╰ %{public}@: %{public}@";
LABEL_60:
          _os_log_impl(&dword_210BD8000, v74, OS_LOG_TYPE_DEFAULT, v75, buf, 0x3Au);

        }
      }
      else if (v70)
      {
        objc_msgSend(*(id *)(a1 + 40), "streamID");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v3, "threadPriority");
        objc_msgSend(v87, "objectForKeyedSubscript:", v67);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v97 = v90;
        v98 = 2114;
        v99 = v71;
        v100 = 1024;
        v101 = v79;
        a1 = v88;
        v102 = 2114;
        v103 = v89;
        v104 = 2114;
        v105 = v67;
        v106 = 2114;
        v107 = v73;
        v74 = v69;
        v75 = "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@";
        goto LABEL_60;
      }
LABEL_61:

      if (++v66 >= (unint64_t)objc_msgSend(v61, "count"))
        goto LABEL_62;
    }
  }
  if (objc_msgSend(v86, "count"))
  {
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v97 = v90;
      v98 = 2114;
      v99 = v24;
      v100 = 1024;
      v101 = v25;
      v102 = 2114;
      v103 = v89;
      _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing:", buf, 0x26u);

    }
    if (objc_msgSend(v86, "count"))
    {
      v81 = v7;
      objc_msgSend(v86, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = MEMORY[0x24BDAC760];
      v94[1] = 3221225472;
      v94[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_159;
      v94[3] = &unk_24CAB1C68;
      v95 = &unk_24CB17350;
      objc_msgSend(v26, "sortedArrayUsingComparator:", v94);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "count"))
      {
        for (i = 0; i < objc_msgSend(v27, "count"); ++i)
        {
          objc_msgSend(v27, "objectAtIndexedSubscript:", i);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!i)
          {
            v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v91, "threadPriority");
              objc_msgSend(v86, "objectForKeyedSubscript:", v29);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v97 = v90;
              v98 = 2114;
              v99 = v38;
              v100 = 1024;
              v101 = v39;
              v102 = 2114;
              v103 = v89;
              v104 = 2114;
              v105 = v29;
              v106 = 2114;
              v107 = v40;
              _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ %{public}@: %{public}@", buf, 0x3Au);

              a1 = v88;
            }
            goto LABEL_28;
          }
          v30 = objc_msgSend(v27, "count") - 1;
          v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          if (i == v30)
          {
            if (v32)
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v91, "threadPriority");
              objc_msgSend(v86, "objectForKeyedSubscript:", v29);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v97 = v90;
              v98 = 2114;
              v99 = v33;
              v100 = 1024;
              v101 = v34;
              v102 = 2114;
              v103 = v89;
              v104 = 2114;
              v105 = v29;
              v106 = 2114;
              v107 = v35;
              v36 = v31;
              v37 = "|%{public}@ %{public}@ %2i %{public}@  │   ╰ %{public}@: %{public}@";
LABEL_27:
              _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0x3Au);

              a1 = v88;
            }
          }
          else if (v32)
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v91, "threadPriority");
            objc_msgSend(v86, "objectForKeyedSubscript:", v29);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v97 = v90;
            v98 = 2114;
            v99 = v33;
            v100 = 1024;
            v101 = v41;
            v102 = 2114;
            v103 = v89;
            v104 = 2114;
            v105 = v29;
            v106 = 2114;
            v107 = v35;
            v36 = v31;
            v37 = "|%{public}@ %{public}@ %2i %{public}@  │   │ %{public}@: %{public}@";
            goto LABEL_27;
          }
LABEL_28:

        }
      }

      v7 = v81;
    }
  }
  if (objc_msgSend(v85, "count"))
  {
    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v91, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v97 = v90;
      v98 = 2114;
      v99 = v43;
      v100 = 1024;
      v101 = v44;
      v102 = 2114;
      v103 = v89;
      _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming:", buf, 0x26u);

    }
    if (objc_msgSend(v85, "count"))
    {
      v82 = v7;
      v83 = v5;
      objc_msgSend(v85, "allKeys");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = MEMORY[0x24BDAC760];
      v92[1] = 3221225472;
      v92[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_160;
      v92[3] = &unk_24CAB1C68;
      v93 = &unk_24CB17350;
      objc_msgSend(v45, "sortedArrayUsingComparator:", v92);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v46, "count"))
      {
        for (j = 0; j < objc_msgSend(v46, "count"); ++j)
        {
          objc_msgSend(v46, "objectAtIndexedSubscript:", j);
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!j)
          {
            v50 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v91, "threadPriority");
              objc_msgSend(v85, "objectForKeyedSubscript:", v48);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v97 = v90;
              v98 = 2114;
              v99 = v57;
              v100 = 1024;
              v101 = v58;
              v102 = 2114;
              v103 = v89;
              v104 = 2114;
              v105 = v48;
              v106 = 2114;
              v107 = v59;
              _os_log_impl(&dword_210BD8000, v50, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@     ╲╭ %{public}@: %{public}@", buf, 0x3Au);

              a1 = v88;
            }
            goto LABEL_45;
          }
          v49 = objc_msgSend(v46, "count") - 1;
          v50 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (j == v49)
          {
            if (v51)
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v91, "threadPriority");
              objc_msgSend(v85, "objectForKeyedSubscript:", v48);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v97 = v90;
              v98 = 2114;
              v99 = v52;
              v100 = 1024;
              v101 = v53;
              v102 = 2114;
              v103 = v89;
              v104 = 2114;
              v105 = v48;
              v106 = 2114;
              v107 = v54;
              v55 = v50;
              v56 = "|%{public}@ %{public}@ %2i %{public}@      ╰ %{public}@: %{public}@";
LABEL_44:
              _os_log_impl(&dword_210BD8000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0x3Au);

              a1 = v88;
            }
          }
          else if (v51)
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v91, "threadPriority");
            objc_msgSend(v85, "objectForKeyedSubscript:", v48);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v97 = v90;
            v98 = 2114;
            v99 = v52;
            v100 = 1024;
            v101 = v60;
            v102 = 2114;
            v103 = v89;
            v104 = 2114;
            v105 = v48;
            v106 = 2114;
            v107 = v54;
            v55 = v50;
            v56 = "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@";
            goto LABEL_44;
          }
LABEL_45:

        }
      }

      v61 = v93;
LABEL_62:
      v7 = v82;
      v5 = v83;
      goto LABEL_63;
    }
  }
LABEL_64:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_163(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outgoing-item-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("incoming-item-id"));
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transition-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transition-cancellation-reason"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = CFSTR("􀠊  Gapless");
  if (v10 == 1)
    v13 = CFSTR("􀟧  Crossfade");
  if (v10 == 2)
    v13 = CFSTR("􀠉  Unmanaged");
  if (*(_QWORD *)(a1 + 32))
    v14 = (__CFString *)v13;
  else
    v14 = 0;
  v15 = v14;
  MSVLogDateFormatter();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v36 = v18;
    v37 = 2114;
    v38 = v21;
    v39 = 1024;
    v40 = objc_msgSend(v3, "threadPriority");
    v41 = 2114;
    v42 = v19;
    v43 = 2114;
    v44 = v5;
    v45 = 2114;
    v46 = v7;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀉘 ITEM TRANSITION CANCELLED  %{public}@ => %{public}@", buf, 0x3Au);

  }
  v34 = (void *)v7;

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v36 = v18;
    v37 = 2114;
    v38 = v24;
    v39 = 1024;
    v40 = v25;
    v41 = 2114;
    v42 = v22;
    v43 = 2114;
    v44 = v15;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", buf, 0x30u);

  }
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v12, "msv_description");
    v29 = v15;
    v30 = v12;
    v31 = v5;
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v36 = v18;
    v37 = 2114;
    v38 = v27;
    v39 = 1024;
    v40 = v28;
    v41 = 2114;
    v42 = v22;
    v43 = 2114;
    v44 = v32;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ reason: %{public}@", buf, 0x30u);

    v5 = v31;
    v12 = v30;
    v15 = v29;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_164(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  int v49;
  int v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  __CFString *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outgoing-item-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("incoming-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transition-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-source-time"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v3, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-target-time"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v3, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-source-time"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v3, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-target-time"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  objc_msgSend(v3, "payload");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("transition-average-rate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;

  v31 = CFSTR("􀠊  Gapless");
  if (v10 == 1)
    v31 = CFSTR("􀟧  Crossfade");
  if (v10 == 2)
    v31 = CFSTR("􀠉  Unmanaged");
  if (*(_QWORD *)(a1 + 32))
    v32 = (__CFString *)v31;
  else
    v32 = 0;
  v33 = v32;
  MSVLogDateFormatter();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringFromDate:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 138544642;
    v52 = v36;
    v53 = 2114;
    v54 = v39;
    v55 = 1024;
    v56 = objc_msgSend(v3, "threadPriority");
    v57 = 2114;
    v58 = v37;
    v59 = 2114;
    v60 = v5;
    v61 = 2114;
    v62 = v7;
    _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀉘 ITEM TRANSITION START      %{public}@ => %{public}@", (uint8_t *)&v51, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v3, "threadPriority");
    v51 = 138544386;
    v52 = v36;
    v53 = 2114;
    v54 = v42;
    v55 = 1024;
    v56 = v43;
    v57 = 2114;
    v58 = v40;
    v59 = 2114;
    v60 = v33;
    _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v51, 0x30u);

  }
  v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v3, "threadPriority");
    v51 = 138544898;
    v52 = v36;
    v53 = 2114;
    v54 = v45;
    v55 = 1024;
    v56 = v46;
    v57 = 2114;
    v58 = v40;
    v59 = 2048;
    v60 = v18;
    v61 = 2048;
    v62 = v14;
    v63 = 2048;
    v64 = v30;
    _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f averageRate: %3.2f }",
      (uint8_t *)&v51,
      0x44u);

  }
  v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v3, "threadPriority");
    v51 = 138544642;
    v52 = v36;
    v53 = 2114;
    v54 = v48;
    v55 = 1024;
    v56 = v49;
    v57 = 2114;
    v58 = v40;
    v59 = 2048;
    v60 = v26;
    v61 = 2048;
    v62 = v22;
    _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v51,
      0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  const __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  int v45;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outgoing-item-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("incoming-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transition-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-source-time"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v3, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-target-time"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v3, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-source-time"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v3, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-target-time"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  v27 = CFSTR("􀠊  Gapless");
  if (v10 == 1)
    v27 = CFSTR("􀟧  Crossfade");
  if (v10 == 2)
    v27 = CFSTR("􀠉  Unmanaged");
  if (*(_QWORD *)(a1 + 32))
    v28 = (__CFString *)v27;
  else
    v28 = 0;
  v29 = v28;
  MSVLogDateFormatter();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringFromDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v35;
    v51 = 1024;
    v52 = objc_msgSend(v3, "threadPriority");
    v53 = 2114;
    v54 = v33;
    v55 = 2114;
    v56 = v5;
    v57 = 2114;
    v58 = v7;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀰧 ITEM TRANSITION END      %{public}@ => %{public}@", (uint8_t *)&v47, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v3, "threadPriority");
    v47 = 138544386;
    v48 = v32;
    v49 = 2114;
    v50 = v38;
    v51 = 1024;
    v52 = v39;
    v53 = 2114;
    v54 = v36;
    v55 = 2114;
    v56 = v29;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v47, 0x30u);

  }
  v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v3, "threadPriority");
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v41;
    v51 = 1024;
    v52 = v42;
    v53 = 2114;
    v54 = v36;
    v55 = 2048;
    v56 = v18;
    v57 = 2048;
    v58 = v14;
    _os_log_impl(&dword_210BD8000, v40, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);

  }
  v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v3, "threadPriority");
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v44;
    v51 = 1024;
    v52 = v45;
    v53 = 2114;
    v54 = v36;
    v55 = 2048;
    v56 = v26;
    v57 = 2048;
    v58 = v22;
    _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_166(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  const __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  int v45;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outgoing-item-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("incoming-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transition-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-source-time"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v3, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-target-time"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v3, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-source-time"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v3, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-target-time"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  v27 = CFSTR("􀠊  Gapless");
  if (v10 == 1)
    v27 = CFSTR("􀟧  Crossfade");
  if (v10 == 2)
    v27 = CFSTR("􀠉  Unmanaged");
  if (*(_QWORD *)(a1 + 32))
    v28 = (__CFString *)v27;
  else
    v28 = 0;
  v29 = v28;
  MSVLogDateFormatter();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringFromDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v35;
    v51 = 1024;
    v52 = objc_msgSend(v3, "threadPriority");
    v53 = 2114;
    v54 = v33;
    v55 = 2114;
    v56 = v5;
    v57 = 2114;
    v58 = v7;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀯮 OVERLAP START            %{public}@ => %{public}@", (uint8_t *)&v47, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v3, "threadPriority");
    v47 = 138544386;
    v48 = v32;
    v49 = 2114;
    v50 = v38;
    v51 = 1024;
    v52 = v39;
    v53 = 2114;
    v54 = v36;
    v55 = 2114;
    v56 = v29;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v47, 0x30u);

  }
  v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v3, "threadPriority");
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v41;
    v51 = 1024;
    v52 = v42;
    v53 = 2114;
    v54 = v36;
    v55 = 2048;
    v56 = v18;
    v57 = 2048;
    v58 = v14;
    _os_log_impl(&dword_210BD8000, v40, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);

  }
  v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v3, "threadPriority");
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v44;
    v51 = 1024;
    v52 = v45;
    v53 = 2114;
    v54 = v36;
    v55 = 2048;
    v56 = v26;
    v57 = 2048;
    v58 = v22;
    _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  const __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  int v45;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outgoing-item-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("incoming-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transition-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-source-time"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v3, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("transition-outgoing-item-target-time"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v3, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-source-time"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v3, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("transition-incoming-item-target-time"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  v27 = CFSTR("􀠊  Gapless");
  if (v10 == 1)
    v27 = CFSTR("􀟧  Crossfade");
  if (v10 == 2)
    v27 = CFSTR("􀠉  Unmanaged");
  if (*(_QWORD *)(a1 + 32))
    v28 = (__CFString *)v27;
  else
    v28 = 0;
  v29 = v28;
  MSVLogDateFormatter();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringFromDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v35;
    v51 = 1024;
    v52 = objc_msgSend(v3, "threadPriority");
    v53 = 2114;
    v54 = v33;
    v55 = 2114;
    v56 = v5;
    v57 = 2114;
    v58 = v7;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀯯 OVERLAP END              %{public}@ => %{public}@", (uint8_t *)&v47, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v3, "threadPriority");
    v47 = 138544386;
    v48 = v32;
    v49 = 2114;
    v50 = v38;
    v51 = 1024;
    v52 = v39;
    v53 = 2114;
    v54 = v36;
    v55 = 2114;
    v56 = v29;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v47, 0x30u);

  }
  v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v3, "threadPriority");
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v41;
    v51 = 1024;
    v52 = v42;
    v53 = 2114;
    v54 = v36;
    v55 = 2048;
    v56 = v18;
    v57 = 2048;
    v58 = v14;
    _os_log_impl(&dword_210BD8000, v40, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);

  }
  v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v3, "threadPriority");
    v47 = 138544642;
    v48 = v32;
    v49 = 2114;
    v50 = v44;
    v51 = 1024;
    v52 = v45;
    v53 = 2114;
    v54 = v36;
    v55 = 2048;
    v56 = v26;
    v57 = 2048;
    v58 = v22;
    _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_168(uint64_t a1, void *a2)
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t i;
  __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  int v34;
  NSObject *v35;
  const char *v36;
  int v37;
  int v38;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  __CFString *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  v4 = *(const __CFString **)(a1 + 32);
  objc_msgSend(v3, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resolution-type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  if (v4)
  {
    if (v7 > 2)
      v4 = CFSTR("Unknown");
    else
      v4 = off_24CAB1DC8[v7];
  }

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("error-for-resolution"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_24CABB5D0;
  v14 = v13;

  objc_msgSend(v3, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = &stru_24CABB5D0;
  v19 = v18;

  MSVLogDateFormatter();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringFromDate:", v21);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v45 = v43;
    v46 = 2114;
    v47 = v24;
    v48 = 1024;
    v49 = objc_msgSend(v3, "threadPriority");
    v50 = 2114;
    v51 = v22;
    v52 = 2114;
    v53 = v14;
    v54 = 2114;
    v55 = v19;
    v56 = 2114;
    v57 = v4;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘯 ERROR RESOLUTION           %{public}@ %{public}@ %{public}@", buf, 0x44u);

  }
  v40 = v19;
  v41 = v14;

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v9;
  objc_msgSend(v9, "msv_description");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("\n"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "count"))
  {
    for (i = 0; i < objc_msgSend(v27, "count"); ++i)
    {
      objc_msgSend(v27, "objectAtIndexedSubscript:", i);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (i)
      {
        v30 = objc_msgSend(v27, "count") - 1;
        v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        if (i == v30)
        {
          if (v32)
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v3, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v45 = v43;
            v46 = 2114;
            v47 = v33;
            v48 = 1024;
            v49 = v34;
            v50 = 2114;
            v51 = v25;
            v52 = 2114;
            v53 = v29;
            v35 = v31;
            v36 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_23:
            _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_ERROR, v36, buf, 0x30u);

          }
        }
        else if (v32)
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v3, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v45 = v43;
          v46 = 2114;
          v47 = v33;
          v48 = 1024;
          v49 = v38;
          v50 = 2114;
          v51 = v25;
          v52 = 2114;
          v53 = v29;
          v35 = v31;
          v36 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
          goto LABEL_23;
        }
      }
      else
      {
        v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v3, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v45 = v43;
          v46 = 2114;
          v47 = v33;
          v48 = 1024;
          v49 = v37;
          v50 = 2114;
          v51 = v25;
          v52 = 2114;
          v53 = v29;
          v35 = v31;
          v36 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
          goto LABEL_23;
        }
      }

    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_169(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interrupt-name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544386;
    v14 = v8;
    v15 = 2114;
    v16 = v11;
    v17 = 1024;
    v18 = objc_msgSend(v3, "threadPriority");
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘰 INTERRUPT BEGIN            %{public}@", (uint8_t *)&v13, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_170(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interrupt-name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interrupt-should-resume"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  MSVLogDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544386;
    v21 = v11;
    v22 = 2114;
    v23 = v14;
    v24 = 1024;
    v25 = objc_msgSend(v3, "threadPriority");
    v26 = 2114;
    v27 = v12;
    v28 = 2114;
    v29 = v5;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘯 INTERRUPT END              %{public}@", (uint8_t *)&v20, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v3, "threadPriority");
    v20 = 138544386;
    v21 = v11;
    v22 = 2114;
    v23 = v17;
    v24 = 1024;
    v25 = v18;
    v26 = 2114;
    v27 = v15;
    v28 = 1024;
    LODWORD(v29) = v8;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ resume: %{BOOL}u", (uint8_t *)&v20, 0x2Cu);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v3, "threadPriority");
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀞠 POLICY BEGIN", (uint8_t *)&v11, 0x26u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v6;
    v13 = 2114;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v3, "threadPriority");
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀞟 POLICY END", (uint8_t *)&v11, 0x26u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_173(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  int v43;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playback-behavior-metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shuffle-type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("repeat-type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("autoplay-mode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "integerValue");

  if (!*(_QWORD *)(a1 + 32))
  {
    v21 = 0;
    v16 = 0;
    goto LABEL_34;
  }
  MPNSStringFromShuffleType();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((unint64_t)(v7 - 1) < 2)
  {
    v14 = CFSTR("􀵊  ");
LABEL_6:
    -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v7)
  {
    v14 = CFSTR("􀵉  ");
    goto LABEL_6;
  }
  v15 = v12;
LABEL_8:
  v16 = v15;

  if (!*(_QWORD *)(a1 + 32))
  {
    v21 = 0;
    goto LABEL_34;
  }
  MPNSStringFromRepeatType();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  switch(v9)
  {
    case 2:
      v19 = CFSTR("􀵌  ");
      goto LABEL_15;
    case 1:
      v19 = CFSTR("􀵎  ");
      goto LABEL_15;
    case 0:
      v19 = CFSTR("􀵋  ");
LABEL_15:
      -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v18);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
  }
  v20 = v17;
LABEL_17:
  v21 = v20;

  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_34:
    v11 = 0;
    goto LABEL_24;
  }
  switch((unint64_t)v11)
  {
    case 0uLL:
      v22 = CFSTR("􀕧  ");
      v23 = CFSTR("Unknown");
      goto LABEL_23;
    case 1uLL:
      v22 = CFSTR("􀵏  ");
      v23 = CFSTR("Off");
      goto LABEL_23;
    case 2uLL:
      v22 = CFSTR("􀵐  ");
      v23 = CFSTR("On");
      goto LABEL_23;
    case 3uLL:
      v22 = CFSTR("􀁠  ");
      v23 = CFSTR("Unsupported");
LABEL_23:
      -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
LABEL_24:
  MSVLogDateFormatter();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromDate:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v46 = v16;
    v47 = v5;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v45 = v21;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("session-id"));
    v32 = v11;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v49 = v26;
    v50 = 2114;
    v51 = v29;
    v52 = 1024;
    v53 = v30;
    v54 = 2114;
    v55 = v27;
    v56 = 2114;
    v57 = v33;
    _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀵉 BEHAVIOR CHANGED           %{public}@", buf, 0x30u);

    v11 = v32;
    v21 = v45;

    v16 = v46;
    v5 = v47;
  }

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v49 = v26;
    v50 = 2114;
    v51 = v36;
    v52 = 1024;
    v53 = v37;
    v54 = 2114;
    v55 = v34;
    v56 = 2114;
    v57 = v16;
    _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ shuffle:  %{public}@", buf, 0x30u);

  }
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v49 = v26;
    v50 = 2114;
    v51 = v39;
    v52 = 1024;
    v53 = v40;
    v54 = 2114;
    v55 = v34;
    v56 = 2114;
    v57 = v21;
    _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ repeat:   %{public}@", buf, 0x30u);

  }
  v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v49 = v26;
    v50 = 2114;
    v51 = v42;
    v52 = 1024;
    v53 = v43;
    v54 = 2114;
    v55 = v34;
    v56 = 2114;
    v57 = v11;
    _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ autoplay: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("session-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀃯 ❗MEDIASERVICES LOST       %{public}@", (uint8_t *)&v14, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("session-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀃮 ❕MEDIASERVICES RESET      %{public}@", (uint8_t *)&v14, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_176(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  MSVLogDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("session-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀃮 MEDIASERVICES PURGE       %{public}@", (uint8_t *)&v14, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_177(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t i;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  int v36;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("route-metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("route-description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("route-is-airplay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("route-should-pause"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v9, "BOOLValue");

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v3, "threadPriority");
    objc_msgSend(v3, "payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("session-id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v44 = v41;
    v45 = 2114;
    v46 = v14;
    v47 = 1024;
    v48 = v15;
    v49 = 2114;
    v50 = v12;
    v51 = 2114;
    v52 = v17;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀥑 ROUTE CHANGED              %{public}@", buf, 0x30u);

  }
  v18 = a1;
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    for (i = 0; i < objc_msgSend(v20, "count"); ++i)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (i)
      {
        v23 = objc_msgSend(v20, "count") - 1;
        v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (i == v23)
        {
          if (v25)
            goto LABEL_12;
        }
        else if (v25)
        {
LABEL_12:
          objc_msgSend(*(id *)(v18 + 40), "streamID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v42, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v44 = v41;
          v45 = 2114;
          v46 = v26;
          v47 = 1024;
          v48 = v30;
          v49 = 2114;
          v50 = v19;
          v51 = 2114;
          v52 = v22;
          v28 = v24;
          v29 = "|%{public}@ %{public}@ %2i %{public}@  │ %{public}@";
          goto LABEL_13;
        }
      }
      else
      {
        v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(v18 + 40), "streamID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v42, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v44 = v41;
          v45 = 2114;
          v46 = v26;
          v47 = 1024;
          v48 = v27;
          v49 = 2114;
          v50 = v19;
          v51 = 2114;
          v52 = v22;
          v28 = v24;
          v29 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ %{public}@";
LABEL_13:
          _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x30u);

        }
      }

    }
  }

  v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v18 + 40), "streamID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v42, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v44 = v41;
    v45 = 2114;
    v46 = v32;
    v47 = 1024;
    v48 = v33;
    v49 = 2114;
    v50 = v19;
    v51 = 1024;
    LODWORD(v52) = v38;
    _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ isAirPlay: %{BOOL}u", buf, 0x2Cu);

  }
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v18 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v42, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v44 = v41;
    v45 = 2114;
    v46 = v35;
    v47 = 1024;
    v48 = v36;
    v49 = 2114;
    v50 = v19;
    v51 = 1024;
    LODWORD(v52) = v39;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ shouldPause: %{BOOL}u", buf, 0x2Cu);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_178(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audio-rendering-mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((unint64_t)(v6 - 1) > 4)
    v7 = CFSTR("Unknown");
  else
    v7 = off_24CAB8730[v6 - 1];
  v8 = v7;
  MSVLogDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544386;
    v17 = v11;
    v18 = 2114;
    v19 = v14;
    v20 = 1024;
    v21 = objc_msgSend(v3, "threadPriority");
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀥑 RENDERING MODE CHANGED     %{public}@", (uint8_t *)&v16, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  int v39;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  NSObject *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  const __CFString *v60;
  void *v61;
  _QWORD v62[4];

  v62[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v5);
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("time-control-status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v5, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("time-control-status-reason"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    if ((unint64_t)(v9 + 1) > 3)
      v11 = CFSTR("Stopped");
    else
      v11 = off_24CAB1DE0[v9 + 1];
    v41 = v11;
  }
  else
  {
    v41 = 0;
  }
  v62[0] = CFSTR("item-begin");
  v62[1] = CFSTR("item-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2, v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "type");
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v19 == CFSTR("item-end"))
  {

    goto LABEL_12;
  }
  v20 = v19;
  v21 = -[__CFString isEqual:](v19, "isEqual:", CFSTR("item-end"));

  if (v21)
  {
LABEL_12:
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v47 = v18;
    v48 = 2114;
    v49 = v27;
    v50 = 1024;
    v51 = objc_msgSend(v5, "threadPriority");
    v52 = 2114;
    v53 = v23;
    v28 = "|%{public}@ %{public}@ %2i %{public}@􁁝 TIME CONTROL CHANGED";
    v29 = v26;
    v30 = 38;
    goto LABEL_14;
  }
  if (v9 != 2)
  {
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v47 = v18;
    v48 = 2114;
    v49 = v27;
    v50 = 1024;
    v51 = objc_msgSend(v5, "threadPriority");
    v52 = 2114;
    v53 = v23;
    v54 = 2114;
    v55 = v45;
    v56 = 2114;
    v57 = v44;
    v28 = "|%{public}@ %{public}@ %2i %{public}@􁁝 TIME CONTROL CHANGED       %{public}@ %{public}@";
    v29 = v26;
    v30 = 58;
LABEL_14:
    _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);

    goto LABEL_21;
  }
  v60 = CFSTR("time-control-status");
  v61 = &unk_24CB16890;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("time-control-status-changed"), v22);
  v23 = objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v5, "durationSinceEvent:", v23);
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v26 = objc_claimAutoreleasedReturnValue();
  v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v47 = v18;
    v48 = 2114;
    v49 = v32;
    v50 = 1024;
    v51 = objc_msgSend(v5, "threadPriority");
    v52 = 2114;
    v53 = v26;
    v54 = 2114;
    v55 = v45;
    v56 = 2114;
    v57 = v44;
    v58 = 2048;
    v59 = v25;
    _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁁝 TIME CONTROL CHANGED       %{public}@ %{public}@ [%.3fs]", buf, 0x44u);

  }
LABEL_21:

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v47 = v18;
    v48 = 2114;
    v49 = v35;
    v50 = 1024;
    v51 = v36;
    v52 = 2114;
    v53 = v33;
    v54 = 2114;
    v55 = v42;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ status: %{public}@", buf, 0x30u);

  }
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v47 = v18;
    v48 = 2114;
    v49 = v38;
    v50 = 1024;
    v51 = v39;
    v52 = 2114;
    v53 = v33;
    v54 = 2114;
    v55 = v43;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ reason: %{public}@", buf, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_181(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  int v37;
  __CFString *v38;
  NSObject *v39;
  void *v40;
  int v41;
  int v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = objc_claimAutoreleasedReturnValue();

  v50 = v3;
  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("network-operation-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  if (v10 >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedNetworkOperationType-%ld"), v10);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_24CAB1E00[v10];
  }

  objc_msgSend(v50, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("network-operation-reason"));
  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("blocks-playback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v50, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("network-metrics"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v50, "threadPriority");
    if (v5)
      v21 = v5;
    else
      v21 = &stru_24CABB5D0;
    if (v7)
      v22 = (const __CFString *)v7;
    else
      v22 = &stru_24CABB5D0;
    objc_msgSend(v47, "networkTime");
    *(_DWORD *)buf = 138544898;
    v58 = v49;
    v59 = 2114;
    v60 = v19;
    v61 = 1024;
    v62 = v20;
    v63 = 2114;
    v64 = v17;
    v65 = 2114;
    v66 = v21;
    v67 = 2114;
    v68 = v22;
    v69 = 2048;
    v70 = v23;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀤆 NETWORK OPERATION          %{public}@ %{public}@ [%.3fs]", buf, 0x44u);

  }
  v44 = (void *)v7;

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v50, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v58 = v49;
    v59 = 2114;
    v60 = v25;
    v61 = 1024;
    v62 = v26;
    v63 = 2114;
    v64 = v48;
    v65 = 2114;
    v66 = v46;
    v67 = 2114;
    v68 = v45;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@ (%{public}@)", buf, 0x3Au);

  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v47, "urlMetrics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v53;
    v30 = "com.apple.amp.mediaplaybackcore";
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v33 = os_log_create(v30, "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          v34 = v30;
          v35 = a1;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v50, "threadPriority");
          objc_msgSend(v32, "humanDescription");
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v58 = v49;
          v59 = 2114;
          v60 = v36;
          v61 = 1024;
          v62 = v37;
          v63 = 2114;
          v64 = v48;
          v65 = 2114;
          v66 = v38;
          _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ %{public}@", buf, 0x30u);

          a1 = v35;
          v30 = v34;
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v28);
  }

  v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v50, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v58 = v49;
    v59 = 2114;
    v60 = v40;
    v61 = 1024;
    v62 = v41;
    v63 = 2114;
    v64 = v48;
    v65 = 1024;
    LODWORD(v66) = v43;
    _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ blocks playback: %{BOOL}u", buf, 0x2Cu);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_182(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("player-identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("player-operation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("player-operation-reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544386;
    v25 = v12;
    v26 = 2114;
    v27 = v15;
    v28 = 1024;
    v29 = objc_msgSend(v3, "threadPriority");
    v30 = 2114;
    v31 = v13;
    v32 = 2114;
    v33 = v5;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀽍 PLAYER OPERATION BEGIN     %{public}@", (uint8_t *)&v24, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v3, "threadPriority");
    v24 = 138544386;
    v25 = v12;
    v26 = 2114;
    v27 = v18;
    v28 = 1024;
    v29 = v19;
    v30 = 2114;
    v31 = v16;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ operation: %{public}@", (uint8_t *)&v24, 0x30u);

  }
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "threadPriority");
    v24 = 138544386;
    v25 = v12;
    v26 = 2114;
    v27 = v21;
    v28 = 1024;
    v29 = v22;
    v30 = 2114;
    v31 = v16;
    v32 = 2114;
    v33 = v9;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ reason: %{public}@", (uint8_t *)&v24, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  int v29;
  void *v30;
  unint64_t i;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  const __CFString *v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("player-identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("player-items"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("player-operation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = CFSTR("player-identifier");
  v61[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("player-operation-begin"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "durationSinceEvent:", v14);
  v16 = v15;
  MSVLogDateFormatter();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate:", v18);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v49 = v47;
    v50 = 2114;
    v51 = v21;
    v52 = 1024;
    v53 = objc_msgSend(v5, "threadPriority");
    v54 = 2114;
    v55 = v19;
    v56 = 2114;
    v57 = v8;
    v58 = 2048;
    v59 = v16;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀽎 PLAYER OPERATION END       %{public}@ [%.3fs]", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v49 = v47;
    v50 = 2114;
    v51 = v23;
    v52 = 1024;
    v53 = v24;
    v54 = 2114;
    v55 = v46;
    v56 = 2114;
    v57 = v12;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ operation: %{public}@", buf, 0x30u);

  }
  if (v10)
  {
    v25 = objc_msgSend(v10, "length");
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      v43 = v14;
      v44 = v12;
      v45 = v6;
      if (v27)
      {
        objc_msgSend(*(id *)(a1 + 40), "streamID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v5, "threadPriority");
        *(_DWORD *)buf = 138544130;
        v49 = v47;
        v50 = 2114;
        v51 = v28;
        v52 = 1024;
        v53 = v29;
        v54 = 2114;
        v55 = v46;
        _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ items: [", buf, 0x26u);

      }
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "count"))
      {
        for (i = 0; i < objc_msgSend(v30, "count"); ++i)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", i);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (i)
          {
            v33 = objc_msgSend(v30, "count") - 1;
            v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            if (i == v33)
            {
              if (v35)
                goto LABEL_18;
            }
            else if (v35)
            {
LABEL_18:
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v5, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v49 = v47;
              v50 = 2114;
              v51 = v36;
              v52 = 1024;
              v53 = v37;
              v54 = 2114;
              v55 = v46;
              v56 = 2114;
              v57 = v32;
              _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@       %{public}@", buf, 0x30u);

            }
          }
          else
          {
            v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              goto LABEL_18;
          }

        }
      }

      v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "streamID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v5, "threadPriority");
        *(_DWORD *)buf = 138544130;
        v49 = v47;
        v50 = 2114;
        v51 = v38;
        v52 = 1024;
        v53 = v39;
        v54 = 2114;
        v55 = v46;
        _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@    ]", buf, 0x26u);

      }
      v6 = v45;
      v12 = v44;
      v14 = v43;
    }
    else if (v27)
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v5, "threadPriority");
      *(_DWORD *)buf = 138544130;
      v49 = v47;
      v50 = 2114;
      v51 = v40;
      v52 = 1024;
      v53 = v41;
      v54 = 2114;
      v55 = v46;
      _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ items: []", buf, 0x26u);

    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_184(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reload-current-item-reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = CFSTR("Unknown");
  if (v6 == 1)
    v7 = CFSTR("ProcessingChanged");
  if (!v6)
    v7 = CFSTR("AudioFormatChanged");
  v8 = v7;
  MSVLogDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544386;
    v17 = v11;
    v18 = 2114;
    v19 = v14;
    v20 = 1024;
    v21 = objc_msgSend(v3, "threadPriority");
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁹠 RELOAD CURRENT ITEM BEGIN  %{public}@", (uint8_t *)&v16, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t i;
  __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  int v34;
  int v35;
  __CFString *v37;
  void *v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reload-current-item-error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("reload-current-item-begin"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "durationSinceEvent:", v9);
    v11 = v10;
    objc_msgSend(v9, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("reload-current-item-reason"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    v15 = CFSTR("Unknown");
    if (v14 == 1)
      v15 = CFSTR("ProcessingChanged");
    if (!v14)
      v15 = CFSTR("AudioFormatChanged");
    v16 = v15;
    MSVLogDateFormatter();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromDate:", v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v40;
      v43 = 2114;
      v44 = v21;
      v45 = 1024;
      v46 = objc_msgSend(v5, "threadPriority");
      v47 = 2114;
      v48 = v19;
      v49 = 2114;
      v50 = v16;
      v51 = 2048;
      v52 = v11;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁹠 RELOAD CURRENT ITEM END    %{public}@ [%.3fs]", buf, 0x3Au);

    }
    if (v8)
    {
      v37 = v16;
      v38 = v9;
      v39 = v6;
      -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "msv_description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "count"))
      {
        for (i = 0; i < objc_msgSend(v24, "count"); ++i)
        {
          objc_msgSend(v24, "objectAtIndexedSubscript:", i, v37, v38);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (i)
          {
            v27 = objc_msgSend(v24, "count") - 1;
            v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
            v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
            if (i == v27)
            {
              if (v29)
              {
                objc_msgSend(*(id *)(a1 + 40), "streamID");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v5, "threadPriority");
                *(_DWORD *)buf = 138544386;
                v42 = v40;
                v43 = 2114;
                v44 = v30;
                v45 = 1024;
                v46 = v31;
                v47 = 2114;
                v48 = v22;
                v49 = 2114;
                v50 = v26;
                v32 = v28;
                v33 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_19:
                _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);

              }
            }
            else if (v29)
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v5, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v42 = v40;
              v43 = 2114;
              v44 = v30;
              v45 = 1024;
              v46 = v35;
              v47 = 2114;
              v48 = v22;
              v49 = 2114;
              v50 = v26;
              v32 = v28;
              v33 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
              goto LABEL_19;
            }
          }
          else
          {
            v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v5, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v42 = v40;
              v43 = 2114;
              v44 = v30;
              v45 = 1024;
              v46 = v34;
              v47 = 2114;
              v48 = v22;
              v49 = 2114;
              v50 = v26;
              v32 = v28;
              v33 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
              goto LABEL_19;
            }
          }

        }
      }

      v6 = v39;
      v16 = v37;
      v9 = v38;
    }

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_186(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session-activation-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("session-activation-command-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544386;
    v20 = v10;
    v21 = 2114;
    v22 = v13;
    v23 = 1024;
    v24 = objc_msgSend(v3, "threadPriority");
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v5;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀷃 SESSION ACTIVATION BEGIN   %{public}@", (uint8_t *)&v19, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v3, "threadPriority");
    v19 = 138544386;
    v20 = v10;
    v21 = 2114;
    v22 = v16;
    v23 = 1024;
    v24 = v17;
    v25 = 2114;
    v26 = v14;
    v27 = 2114;
    v28 = v7;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ commandID: %{public}@", (uint8_t *)&v19, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_187(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t i;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  int v32;
  int v33;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("session-activation-error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("session-activation-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = CFSTR("session-activation-id");
  v53[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("session-activation-begin"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "durationSinceEvent:", v12);
  v14 = v13;
  MSVLogDateFormatter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = a1;
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v41 = v39;
    v42 = 2114;
    v43 = v19;
    v44 = 1024;
    v45 = objc_msgSend(v5, "threadPriority");
    v46 = 2114;
    v47 = v17;
    v48 = 2114;
    v49 = v10;
    v50 = 2048;
    v51 = v14;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀷄 SESSION ACTIVATION END     %{public}@ [%.3fs]", buf, 0x3Au);

  }
  if (v8)
  {
    v35 = v12;
    v36 = v10;
    v37 = v6;
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(v38 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "msv_description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("\n"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      for (i = 0; i < objc_msgSend(v22, "count"); ++i)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", i, v35, v36);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v25 = objc_msgSend(v22, "count") - 1;
          v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (i == v25)
          {
            if (v27)
            {
              objc_msgSend(*(id *)(v38 + 40), "streamID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v5, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v41 = v39;
              v42 = 2114;
              v43 = v28;
              v44 = 1024;
              v45 = v29;
              v46 = 2114;
              v47 = v20;
              v48 = 2114;
              v49 = v24;
              v30 = v26;
              v31 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);

            }
          }
          else if (v27)
          {
            objc_msgSend(*(id *)(v38 + 40), "streamID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v41 = v39;
            v42 = 2114;
            v43 = v28;
            v44 = 1024;
            v45 = v33;
            v46 = 2114;
            v47 = v20;
            v48 = 2114;
            v49 = v24;
            v30 = v26;
            v31 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(v38 + 40), "streamID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v5, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v41 = v39;
            v42 = 2114;
            v43 = v28;
            v44 = 1024;
            v45 = v32;
            v46 = 2114;
            v47 = v20;
            v48 = 2114;
            v49 = v24;
            v30 = v26;
            v31 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }

      }
    }

    v6 = v37;
    v12 = v35;
    v10 = v36;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  __CFString *v27;
  NSObject *v28;
  char v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  int v37;
  const __CFString *v39;
  int v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session-id"));
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared-session-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shared-session-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("shared-session-event-reason"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("shared-session-is-reconnect"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "BOOLValue");

  v15 = *(const __CFString **)(a1 + 32);
  v40 = (int)v11;
  if (v15)
  {
    switch(v10)
    {
      case 0:
        v16 = CFSTR("Unknown");
        v39 = CFSTR("􀓔");
        goto LABEL_14;
      case 1:
        v39 = CFSTR("􁐅");
        goto LABEL_12;
      case 2:
        v39 = CFSTR("􁓵");
LABEL_13:
        v16 = CFSTR("GroupSession");
        goto LABEL_14;
    }
    v15 = CFSTR("􀿪");
  }
  v39 = v15;
  if (v10)
  {
    if (v10 == 2)
      goto LABEL_13;
    if (v10 == 1)
    {
LABEL_12:
      v16 = CFSTR("LiveLink");
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedSharedSessionType-%ld"), v10);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("Unknown");
  }
LABEL_14:
  MSVLogDateFormatter();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v42 = v19;
    v43 = 2114;
    v44 = v22;
    v45 = 1024;
    v46 = objc_msgSend(v3, "threadPriority");
    v47 = 2114;
    v48 = v20;
    v49 = 2114;
    v50 = (const __CFString *)v5;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁃑 SHARED SESSION BEGIN       %{public}@", buf, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544642;
    v42 = v19;
    v43 = 2114;
    v44 = v25;
    v45 = 1024;
    v46 = v26;
    v47 = 2114;
    v48 = v23;
    v49 = 2114;
    v50 = v39;
    v51 = 2114;
    v52 = v16;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@  %{public}@", buf, 0x3Au);

  }
  v27 = v7;
  v28 = v5;
  if (v5 != v27)
  {
    v29 = -[NSObject isEqual:](v5, "isEqual:", v27);

    if ((v29 & 1) != 0)
      goto LABEL_23;
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v42 = v19;
      v43 = 2114;
      v44 = v30;
      v45 = 1024;
      v46 = v31;
      v47 = 2114;
      v48 = v23;
      v49 = 2114;
      v50 = v27;
      _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ sharedSessionID: %{public}@", buf, 0x30u);

    }
  }

LABEL_23:
  v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v42 = v19;
    v43 = 2114;
    v44 = v33;
    v45 = 1024;
    v46 = v34;
    v47 = 2114;
    v48 = v23;
    v49 = 2114;
    v50 = v12;
    _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ reason: %{public}@", buf, 0x30u);

  }
  if (v40)
  {
    v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v3, "threadPriority");
      *(_DWORD *)buf = 138544386;
      v42 = v19;
      v43 = 2114;
      v44 = v36;
      v45 = 1024;
      v46 = v37;
      v47 = 2114;
      v48 = v23;
      v49 = 1024;
      LODWORD(v50) = 1;
      _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ isReconnect: %{BOOL}u", buf, 0x2Cu);

    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_189(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("session-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared-session-event-reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544386;
    v20 = v10;
    v21 = 2114;
    v22 = v13;
    v23 = 1024;
    v24 = objc_msgSend(v3, "threadPriority");
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v5;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁃑 SHARED SESSION END         %{public}@", (uint8_t *)&v19, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v3, "threadPriority");
    v19 = 138544386;
    v20 = v10;
    v21 = 2114;
    v22 = v16;
    v23 = 1024;
    v24 = v17;
    v25 = 2114;
    v26 = v14;
    v27 = 2114;
    v28 = v7;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ reason: %{public}@", (uint8_t *)&v19, 0x30u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shared-session-id"));
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared-session-event-route-type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("participants"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v3;
  objc_msgSend(v3, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v46 = v37;
    v47 = 2114;
    v48 = v14;
    v49 = 1024;
    v50 = objc_msgSend(v38, "threadPriority");
    v51 = 2114;
    v52 = v12;
    v53 = 2114;
    v54 = v5;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀠃 PARTICIPANTS CHANGED       %{public}@", buf, 0x30u);

  }
  v35 = (void *)v5;

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v38, "threadPriority");
    v18 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 138544386;
    v46 = v37;
    v47 = 2114;
    v48 = v16;
    v49 = 1024;
    v50 = v17;
    v51 = 2114;
    v52 = v36;
    v53 = 2048;
    v54 = v18;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ participants.count: %ld", buf, 0x30u);

  }
  if (v7)
  {
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v38, "threadPriority");
      objc_msgSend(v7, "intValue");
      MRGroupSessionRouteTypeDescription();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v46 = v37;
      v47 = 2114;
      v48 = v20;
      v49 = 1024;
      v50 = v21;
      v51 = 2114;
      v52 = v36;
      v53 = 2114;
      v54 = (uint64_t)v22;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ routeType: %{public}@", buf, 0x30u);

    }
  }
  v34 = v7;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v9;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID", v34, v35);
          v29 = a1;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v38, "threadPriority");
          -[MPCSharedSessionParticipant humanDescription](v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v46 = v37;
          v47 = 2114;
          v48 = v30;
          v49 = 1024;
          v50 = v31;
          v51 = 2114;
          v52 = v36;
          v53 = 2114;
          v54 = (uint64_t)v32;
          _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ participant: [ %{public}@ ]", buf, 0x30u);

          a1 = v29;
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v24);
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_191(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shared-session-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544386;
    v21 = v8;
    v22 = 2114;
    v23 = v11;
    v24 = 1024;
    v25 = objc_msgSend(v3, "threadPriority");
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v5;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀖊 SHARED SESSION SYNC BEGIN  %{public}@", (uint8_t *)&v20, 0x30u);

  }
  objc_msgSend(v3, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("originating-participant"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "streamID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v3, "threadPriority");
      -[MPCSharedSessionParticipant humanDescription]((uint64_t)v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544386;
      v21 = v8;
      v22 = 2114;
      v23 = v16;
      v24 = 1024;
      v25 = v17;
      v26 = 2114;
      v27 = v14;
      v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ participant: [ %{public}@ ]", (uint8_t *)&v20, 0x30u);

    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t i;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  int v25;
  int v26;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(_QWORD *)(a1 + 32), v3);
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shared-session-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared-sync-error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MSVLogDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v32 = v30;
    v33 = 2114;
    v34 = v12;
    v35 = 1024;
    v36 = objc_msgSend(v3, "threadPriority");
    v37 = 2114;
    v38 = v10;
    v39 = 2114;
    v40 = v5;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀖋 SHARED SESSION SYNC END    %{public}@", buf, 0x30u);

  }
  if (v7)
  {
    v29 = v5;
    -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v7;
    objc_msgSend(v7, "msv_description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      for (i = 0; i < objc_msgSend(v15, "count"); ++i)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v18 = objc_msgSend(v15, "count") - 1;
          v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
          if (i == v18)
          {
            if (v20)
            {
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v3, "threadPriority");
              *(_DWORD *)buf = 138544386;
              v32 = v30;
              v33 = 2114;
              v34 = v21;
              v35 = 1024;
              v36 = v22;
              v37 = 2114;
              v38 = v13;
              v39 = 2114;
              v40 = v17;
              v23 = v19;
              v24 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x30u);

            }
          }
          else if (v20)
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v3, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v32 = v30;
            v33 = 2114;
            v34 = v21;
            v35 = 1024;
            v36 = v26;
            v37 = 2114;
            v38 = v13;
            v39 = 2114;
            v40 = v17;
            v23 = v19;
            v24 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v3, "threadPriority");
            *(_DWORD *)buf = 138544386;
            v32 = v30;
            v33 = 2114;
            v34 = v21;
            v35 = 1024;
            v36 = v25;
            v37 = 2114;
            v38 = v13;
            v39 = 2114;
            v40 = v17;
            v23 = v19;
            v24 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }

      }
    }

    v7 = v28;
    v5 = v29;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  int v41;
  int v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  _BYTE v52[10];
  void *v53;
  int v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-start-position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v3, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("supports-vocal-attenuation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-available"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v3, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-enabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v3, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-configured"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v3, "payload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-processing-delay"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  MSVLogDateFormatter();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringFromDate:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v44 = v28;
    v45 = 2114;
    v46 = v31;
    v47 = 1024;
    v48 = objc_msgSend(v3, "threadPriority");
    v49 = 2114;
    v50 = v29;
    v51 = 2114;
    *(_QWORD *)v52 = v5;
    *(_WORD *)&v52[8] = 2114;
    v53 = v7;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@𝄢 ITEM VOCAL CHANGED         %{public}@ %{public}@ ", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138544386;
    v44 = v28;
    v45 = 2114;
    v46 = v34;
    v47 = 1024;
    v48 = v35;
    v49 = 2114;
    v50 = v32;
    v51 = 2048;
    *(_QWORD *)v52 = v11;
    _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f", buf, 0x30u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v3, "threadPriority");
    *(_DWORD *)buf = 138545410;
    v44 = v28;
    v45 = 2114;
    v46 = v38;
    v47 = 1024;
    v48 = v39;
    v49 = 2114;
    v50 = v36;
    v51 = 1024;
    *(_DWORD *)v52 = v42;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v21;
    LOWORD(v53) = 1024;
    *(_DWORD *)((char *)&v53 + 2) = v41;
    HIWORD(v53) = 1024;
    v54 = v18;
    v55 = 2048;
    v56 = v25;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ vocal control supported:%{BOOL}u configured:%{BOOL}u available:%{BOOL}u enabled:%{BOOL}u delay:%.0fms", buf, 0x48u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_194(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-statistics-mean"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v3, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-statistics-max"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  objc_msgSend(v3, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-statistics-stdev"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_msgSend(v3, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-statistics-glitches"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v18 = COERCE_DOUBLE(objc_msgSend(v17, "integerValue"));

  objc_msgSend(v3, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-statistics-samples"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v21 = COERCE_DOUBLE(objc_msgSend(v20, "integerValue"));

  objc_msgSend(v3, "payload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-statistics-thermal"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v24 = COERCE_DOUBLE(objc_msgSend(v23, "integerValue"));

  MSVLogDateFormatter();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringFromDate:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138544130;
    v41 = v27;
    v42 = 2114;
    v43 = v30;
    v44 = 1024;
    v45 = objc_msgSend(v3, "threadPriority");
    v46 = 2114;
    v47 = v28;
    _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀣉 VOCAL STATS", (uint8_t *)&v40, 0x26u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v3, "threadPriority");
    v40 = 138544898;
    v41 = v27;
    v42 = 2114;
    v43 = v33;
    v44 = 1024;
    v45 = v34;
    v46 = 2114;
    v47 = v31;
    v48 = 2048;
    v49 = *(double *)&v21;
    v50 = 2048;
    v51 = *(double *)&v18;
    v52 = 2048;
    v53 = *(double *)&v24;
    _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ samples: %ld; glitches: %ld; thermalLevel: %ld",
      (uint8_t *)&v40,
      0x44u);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v3, "threadPriority");
    v40 = 138544898;
    v41 = v27;
    v42 = 2114;
    v43 = v37;
    v44 = 1024;
    v45 = v38;
    v46 = 2114;
    v47 = v35;
    v48 = 2048;
    v49 = v7;
    v50 = 2048;
    v51 = v11;
    v52 = 2048;
    v53 = v15;
    _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ mean: %0.1fms; max: %0.1fms; std: %0.1fms",
      (uint8_t *)&v40,
      0x44u);

  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_195(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  double v28;
  uint64_t i;
  void *v30;
  void *v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  __CFString *v52;
  __CFString *v53;
  NSObject *v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  int v59;
  void *v60;
  NSObject *v61;
  void *v62;
  int v63;
  void *v64;
  NSObject *v65;
  void *v66;
  int v67;
  void *v69;
  __CFString *v70;
  __CFString *v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  int v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  int v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  double v111;
  __int16 v112;
  __CFString *v113;
  __int16 v114;
  double v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perf-metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_24CABB5D0;
  v71 = v9;

  objc_msgSend(v3, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_24CABB5D0;
  v70 = v13;

  MSVLogDateFormatter();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v3;
  objc_msgSend(v3, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromDate:", v15);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v103 = v84;
    v104 = 2114;
    v105 = v18;
    v106 = 1024;
    v107 = objc_msgSend(v85, "threadPriority");
    v108 = 2114;
    v109 = v16;
    v110 = 2114;
    v111 = *(double *)&v71;
    v112 = 2114;
    v113 = v70;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍾 PERFORMANCE REPORT         %{public}@ %{public}@", buf, 0x3Au);

  }
  -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(unsigned __int8 **)(a1 + 32));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v69 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metrics"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
  if (v74)
  {
    v19 = "com.apple.amp.mediaplaybackcore";
    v20 = "PlaybackEvents";
    v73 = *(_QWORD *)v98;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v98 != v73)
          objc_enumerationMutation(obj);
        v75 = v21;
        v22 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v21);
        v23 = os_log_create(v19, v20);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "threadPriority");
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("name"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("tags"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v103 = v84;
          v104 = 2114;
          v105 = v24;
          v106 = 1024;
          v107 = v86;
          v108 = 2114;
          v109 = v83;
          v110 = 2114;
          v111 = *(double *)&v25;
          v112 = 2112;
          v113 = v27;
          _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ metric: %{public}@ (%@)", buf, 0x3Au);

        }
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("segments"));
        v76 = (id)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
        if (v78)
        {
          v77 = *(_QWORD *)v94;
          v28 = 0.0;
          do
          {
            for (i = 0; i != v78; ++i)
            {
              if (*(_QWORD *)v94 != v77)
                objc_enumerationMutation(v76);
              v30 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("duration"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "doubleValue");
              v33 = v32;

              v34 = os_log_create(v19, v20);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(*(id *)(a1 + 40), "streamID");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = objc_msgSend(v85, "threadPriority");
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("component"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("subcomponent"));
                v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544898;
                v103 = v84;
                v104 = 2114;
                v105 = v35;
                v106 = 1024;
                v107 = v87;
                v108 = 2114;
                v109 = v83;
                v110 = 2114;
                v111 = *(double *)&v36;
                v112 = 2114;
                v113 = v37;
                v114 = 2048;
                v115 = v33;
                _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ├╴ %{public}@: %{public}-25@ [%0.3f]", buf, 0x44u);

              }
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("complexities"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("optimizations"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("steps"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v38, "count") || objc_msgSend(v39, "count") || objc_msgSend(v40, "count"))
              {
                v80 = v39;
                v82 = i;
                v41 = os_log_create(v19, v20);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(*(id *)(a1 + 40), "streamID");
                  v42 = v40;
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_msgSend(v85, "threadPriority");
                  objc_msgSend(v38, "msv_compactDescription");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544386;
                  v103 = v84;
                  v104 = 2114;
                  v105 = v43;
                  v106 = 1024;
                  v107 = v44;
                  v108 = 2114;
                  v109 = v83;
                  v110 = 2114;
                  v111 = *(double *)&v45;
                  _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ complexities: [%{public}@]", buf, 0x30u);

                  v40 = v42;
                }
                v81 = v38;

                v91 = 0u;
                v92 = 0u;
                v89 = 0u;
                v90 = 0u;
                v79 = v40;
                v88 = v40;
                v46 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                if (v46)
                {
                  v47 = v46;
                  v48 = *(_QWORD *)v90;
                  do
                  {
                    for (j = 0; j != v47; ++j)
                    {
                      if (*(_QWORD *)v90 != v48)
                        objc_enumerationMutation(v88);
                      v50 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("duration"));
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "doubleValue");
                      v53 = v52;

                      v54 = os_log_create(v19, v20);
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(*(id *)(a1 + 40), "streamID");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        v56 = v20;
                        v57 = v19;
                        v58 = a1;
                        v59 = objc_msgSend(v85, "threadPriority");
                        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("name"));
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544642;
                        v103 = v84;
                        v104 = 2114;
                        v105 = v55;
                        v106 = 1024;
                        v107 = v59;
                        a1 = v58;
                        v19 = v57;
                        v20 = v56;
                        v108 = 2114;
                        v109 = v83;
                        v110 = 2114;
                        v111 = *(double *)&v60;
                        v112 = 2048;
                        v113 = v53;
                        _os_log_impl(&dword_210BD8000, v54, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │   │ step: %{public}-28@ [%0.3f]", buf, 0x3Au);

                      }
                    }
                    v47 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                  }
                  while (v47);
                }

                v61 = os_log_create(v19, v20);
                v39 = v80;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(*(id *)(a1 + 40), "streamID");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = objc_msgSend(v85, "threadPriority");
                  objc_msgSend(v80, "msv_compactDescription");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544386;
                  v103 = v84;
                  v104 = 2114;
                  v105 = v62;
                  v106 = 1024;
                  v107 = v63;
                  v108 = 2114;
                  v109 = v83;
                  v110 = 2114;
                  v111 = *(double *)&v64;
                  _os_log_impl(&dword_210BD8000, v61, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │   ╰ optimizations: %{public}@", buf, 0x30u);

                }
                v38 = v81;
                i = v82;
                v40 = v79;
              }
              v28 = v28 + v33;

            }
            v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
          }
          while (v78);
        }
        else
        {
          v28 = 0.0;
        }

        v65 = os_log_create(v19, v20);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v85, "threadPriority");
          *(_DWORD *)buf = 138544386;
          v103 = v84;
          v104 = 2114;
          v105 = v66;
          v106 = 1024;
          v107 = v67;
          v108 = 2114;
          v109 = v83;
          v110 = 2048;
          v111 = v28;
          _os_log_impl(&dword_210BD8000, v65, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ totalTime: %0.3f", buf, 0x30u);

        }
        v21 = v75 + 1;
      }
      while (v75 + 1 != v74);
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
    }
    while (v74);
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);
  if (v7 >= v8)
  {
    if (v7 > v8)
      v9 = 1;
    else
      v9 = objc_msgSend(v5, "compare:", v6);
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);
  if (v7 >= v8)
  {
    if (v7 > v8)
      v9 = 1;
    else
      v9 = objc_msgSend(v5, "compare:", v6);
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBD1A8];
  v7 = objc_msgSend(MEMORY[0x24BDBD1A8], "indexOfObject:", v4);
  v8 = objc_msgSend(v6, "indexOfObject:", v5);
  if (v7 >= v8)
  {
    if (v7 > v8)
      v9 = 1;
    else
      v9 = objc_msgSend(v4, "compare:", v5);
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_106(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_102(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_88(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("item-end")) & 1) != 0)
  {
    objc_msgSend(v10, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (!v9)
      goto LABEL_6;
  }
  else
  {

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
LABEL_6:

}

void __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t i;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("commandType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  MPCRemoteCommandDescriptionCopy(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("supported"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    v11 = CFSTR("enabled");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if ((v13 & 1) != 0)
      goto LABEL_6;
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disabledReasons"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "msv_compactDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("disabled: %@"), v16);
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("unsupportedReasons"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "msv_compactDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("unsupported: %@"), v16);
  }
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "streamID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(*(id *)(a1 + 48), "threadPriority");
    v22 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544898;
    v48 = v19;
    v49 = 2114;
    v50 = v20;
    v51 = 1024;
    v52 = v21;
    v53 = 2114;
    v54 = v22;
    v55 = 2114;
    v56 = v5;
    v57 = 2114;
    v58 = v9;
    v59 = 2114;
    v60 = v11;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ├╴%{public}@ %{public}-40@ [%{public}@]", buf, 0x44u);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    v44 = v11;
    v45 = v9;
    v46 = v6;
    v43 = v23;
    objc_msgSend(v23, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsSeparatedByString:", CFSTR("\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "count"))
    {
      for (i = 0; i < objc_msgSend(v25, "count"); ++i)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", i);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (i)
        {
          v28 = objc_msgSend(v25, "count") - 1;
          v29 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
          v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (i == v28)
          {
            if (v30)
            {
              v31 = *(_QWORD *)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "streamID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(*(id *)(a1 + 48), "threadPriority");
              v34 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138544386;
              v48 = v31;
              v49 = 2114;
              v50 = v32;
              v51 = 1024;
              v52 = v33;
              v53 = 2114;
              v54 = v34;
              v55 = 2114;
              v56 = v27;
              v35 = v29;
              v36 = "|%{public}@ %{public}@ %2i %{public}@  │   ╰ %{public}@";
LABEL_19:
              _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0x30u);

            }
          }
          else if (v30)
          {
            v40 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(*(id *)(a1 + 48), "threadPriority");
            v42 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138544386;
            v48 = v40;
            v49 = 2114;
            v50 = v32;
            v51 = 1024;
            v52 = v41;
            v53 = 2114;
            v54 = v42;
            v55 = 2114;
            v56 = v27;
            v35 = v29;
            v36 = "|%{public}@ %{public}@ %2i %{public}@  │   │ %{public}@";
            goto LABEL_19;
          }
        }
        else
        {
          v29 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v37 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "streamID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(*(id *)(a1 + 48), "threadPriority");
            v39 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138544386;
            v48 = v37;
            v49 = 2114;
            v50 = v32;
            v51 = 1024;
            v52 = v38;
            v53 = 2114;
            v54 = v39;
            v55 = 2114;
            v56 = v27;
            v35 = v29;
            v36 = "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ options: %{public}@";
            goto LABEL_19;
          }
        }

      }
    }

    v6 = v46;
    v11 = v44;
    v9 = v45;
    v23 = v43;
  }

}

- (const)_symbolForCommand:(const __CFString *)result
{
  if (result)
  {
    result = CFSTR("▶️");
    switch(a2)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("⏸");
        break;
      case 2:
        result = CFSTR("⏯");
        break;
      case 3:
        result = CFSTR("⏹");
        break;
      case 4:
        result = CFSTR("⏭");
        break;
      case 5:
        result = CFSTR("⏮");
        break;
      case 6:
      case 26:
LABEL_6:
        result = CFSTR("🔀");
        break;
      case 7:
      case 25:
        result = CFSTR("🔁");
        break;
      case 8:
      case 9:
        result = CFSTR("⏩");
        break;
      case 10:
      case 11:
        result = CFSTR("⏪");
        break;
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 23:
      case 24:
LABEL_17:
        result = CFSTR("✴️");
        break;
      case 21:
        result = CFSTR("👍🏻");
        break;
      case 22:
        result = CFSTR("👎🏻");
        break;
      default:
        switch(a2)
        {
          case 122:
            result = CFSTR("🔤");
            break;
          case 125:
            result = CFSTR("🆕");
            break;
          case 129:
            result = CFSTR("🚮");
            break;
          case 130:
            result = CFSTR("#️⃣");
            break;
          case 131:
            result = CFSTR("🈁");
            break;
          case 132:
            result = CFSTR("🆙");
            break;
          case 133:
            result = CFSTR("🔠");
            break;
          case 134:
            goto LABEL_6;
          case 135:
            result = CFSTR("🔃");
            break;
          case 139:
            result = CFSTR("⏏️");
            break;
          case 140:
            result = CFSTR("ℹ️");
            break;
          case 142:
          case 143:
            result = CFSTR("🎤");
            break;
          case 144:
            result = CFSTR("🧽");
            break;
          default:
            goto LABEL_17;
        }
        break;
    }
  }
  return result;
}

@end
