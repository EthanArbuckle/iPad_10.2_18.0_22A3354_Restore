@implementation DOCKeyCommandController

+ (id)cancellingKeyCommandsWithAction:(SEL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEBD6B8];
  v5 = *MEMORY[0x24BEBE3E0];
  v15 = CFSTR("com.apple.DocumentManager.keyCommands.cancel");
  v16 = &unk_24C0FD068;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_24C0F2058, 0, a3, v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v8 = (void *)MEMORY[0x24BEBD6B8];
  v13 = CFSTR("com.apple.DocumentManager.keyCommands.cancel");
  v14 = &unk_24C0FD080;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_24C0F2058, 0, a3, CFSTR("."), 0x100000, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)dismissingKeyCommandsWithAction:(SEL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEBD6B8];
  v5 = *MEMORY[0x24BEBE3E0];
  v20 = CFSTR("com.apple.DocumentManager.keyCommands.dismiss");
  v21 = &unk_24C0FD068;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_24C0F2058, 0, a3, v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v8 = (void *)MEMORY[0x24BEBD6B8];
  v18 = CFSTR("com.apple.DocumentManager.keyCommands.dismiss");
  v19 = &unk_24C0FD080;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_24C0F2058, 0, a3, CFSTR("."), 0x100000, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  v11 = (void *)MEMORY[0x24BEBD6B8];
  v16 = CFSTR("com.apple.DocumentManager.keyCommands.dismiss");
  v17 = &unk_24C0FD098;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_24C0F2058, 0, a3, CFSTR("w"), 0x100000, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_menuDefinition
{
  void *v2;
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
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
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
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
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
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
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
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
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
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
  void *v234;
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
  unint64_t v265;
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
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  _QWORD v410[13];
  _QWORD v411[17];
  void *v412;
  void *v413;
  _QWORD v414[5];
  _QWORD v415[2];
  void *v416;
  _QWORD v417[20];
  _QWORD v418[4];
  _QWORD v419[6];

  v419[4] = *MEMORY[0x24BDAC8D0];
  v418[0] = *MEMORY[0x24BEBE5B0];
  if (DOCDebugMenuEnabled())
  {
    objc_msgSend(MEMORY[0x24BEBD6B8], "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_24C0F2058, 0, sel_performShowDebugMenu_, CFSTR("\\"), 0x100000, MEMORY[0x24BDBD1B8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDiscoverabilityTitle:", &stru_24C0F2058);
    objc_msgSend(v2, "setAttributes:", 4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v409 = v2;
  v417[0] = v2;
  v3 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Create Document"), CFSTR("Create Document"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, sel_performCreateDocumentOrOpenNewWindow_, CFSTR("n"), 0x100000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Create Document"), CFSTR("Create Document"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDiscoverabilityTitle:", v8);

  v408 = v6;
  v417[1] = v6;
  v9 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("New Folder"), CFSTR("New Folder"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, 0, sel_performCreateFolder_, CFSTR("n"), 1179648, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("New Folder"), CFSTR("New Folder"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDiscoverabilityTitle:", v14);

  v407 = v12;
  v417[2] = v12;
  v15 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("New Folder with Selection"), CFSTR("New Folder with Selection"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v17, 0, sel_performCreateFolderWithSelection_, CFSTR("n"), 1310720, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("New Folder with Selection"), CFSTR("New Folder with Selection"), CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDiscoverabilityTitle:", v20);

  v406 = v18;
  v417[3] = v18;
  v21 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Open"), CFSTR("Open"), CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDBD1B8];
  objc_msgSend(v21, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v23, 0, sel_performOpen_, *MEMORY[0x24BEBE3D8], 0x100000, MEMORY[0x24BDBD1B8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Open"), CFSTR("Open"), CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDiscoverabilityTitle:", v27);

  objc_msgSend(v25, "setAttributes:", 4);
  v405 = v25;
  v417[4] = v25;
  v28 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Open"), CFSTR("Open"), CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v30, 0, sel_performOpen_, CFSTR("o"), 0x100000, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Open"), CFSTR("Open"), CFSTR("Localizable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDiscoverabilityTitle:", v33);

  v404 = v31;
  v417[5] = v31;
  objc_msgSend(MEMORY[0x24BEBD6B8], "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_24C0F2058, 0, sel_performCommandReturnKey_, CFSTR("\r"), 0x100000, v24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDiscoverabilityTitle:", &stru_24C0F2058);
  objc_msgSend(v34, "setAttributes:", 4);
  v35 = v34;
  objc_msgSend(v35, "setWantsPriorityOverSystemBehavior:", 1);
  v403 = v35;
  v417[6] = v35;
  v36 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Save"), CFSTR("Save"), CFSTR("Localizable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v38, 0, sel_performConfirmPickerExportOrDrillIn_, CFSTR("s"), 0x100000, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Save"), CFSTR("Save"), CFSTR("Localizable"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDiscoverabilityTitle:", v41);

  v402 = v39;
  v417[7] = v39;
  v42 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Get Info"), CFSTR("Get Info"), CFSTR("Localizable"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v44, 0, sel_performGetInfo_, CFSTR("i"), 0x100000, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Get Info"), CFSTR("Get Info"), CFSTR("Localizable"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setDiscoverabilityTitle:", v47);

  v401 = v45;
  v417[8] = v45;
  v48 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Rename"), CFSTR("Rename"), CFSTR("Localizable"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v50, 0, sel_performRename_, CFSTR("\r"), 0, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("Rename"), CFSTR("Rename"), CFSTR("Localizable"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setDiscoverabilityTitle:", v53);

  v54 = v51;
  objc_msgSend(v54, "setWantsPriorityOverSystemBehavior:", 1);
  v400 = v54;
  v417[9] = v54;
  v55 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("Duplicate"), CFSTR("Duplicate"), CFSTR("Localizable"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v57, 0, sel_performDuplicate_, CFSTR("d"), 0x100000, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("Duplicate"), CFSTR("Duplicate"), CFSTR("Localizable"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setDiscoverabilityTitle:", v60);

  v399 = v58;
  v417[10] = v58;
  v61 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Quick Look"), CFSTR("Quick Look"), CFSTR("Localizable"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v63, 0, sel_performPreview_, CFSTR("y"), 0x100000, 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("Quick Look"), CFSTR("Quick Look"), CFSTR("Localizable"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setDiscoverabilityTitle:", v66);

  v398 = v64;
  v417[11] = v64;
  v67 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("Quick Look"), CFSTR("Quick Look"), CFSTR("Localizable"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v69, 0, sel_performPreview_, CFSTR(" "), 0, v24);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("Quick Look"), CFSTR("Quick Look"), CFSTR("Localizable"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setDiscoverabilityTitle:", v72);

  objc_msgSend(v70, "setAttributes:", 4);
  v73 = v70;
  objc_msgSend(v73, "setWantsPriorityOverSystemBehavior:", 1);
  v397 = v73;
  v417[12] = v73;
  v74 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("Show in Enclosing Folder"), CFSTR("Show in Enclosing Folder"), CFSTR("Localizable"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v76, 0, sel_performRevealItem_, CFSTR("r"), 0x100000, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("Show in Enclosing Folder"), CFSTR("Show in Enclosing Folder"), CFSTR("Localizable"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setDiscoverabilityTitle:", v79);

  v396 = v77;
  v417[13] = v77;
  v80 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("Show in Folder"), CFSTR("Show in Folder"), CFSTR("Localizable"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v82, 0, sel_performRevealItem_, CFSTR("a"), 1835008, v24);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("Show in Folder"), CFSTR("Show in Folder"), CFSTR("Localizable"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setDiscoverabilityTitle:", v85);

  objc_msgSend(v83, "setAttributes:", 4);
  v395 = v83;
  v417[14] = v83;
  v86 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("Favorite"), CFSTR("Favorite"), CFSTR("Localizable"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v88, 0, sel_performMarkAsFavorite_, CFSTR("t"), 1310720, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("Favorite"), CFSTR("Favorite"), CFSTR("Localizable"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setDiscoverabilityTitle:", v91);

  v394 = v89;
  v417[15] = v89;
  v92 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("Delete"), CFSTR("Delete"), CFSTR("Localizable"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)MEMORY[0x24BEBD4D8];
  _DocumentManagerBundle();
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("Delete Immediately…"), CFSTR("Delete Immediately…"), CFSTR("Localizable"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "alternateWithTitle:action:modifierFlags:", v97, sel_performDeleteNow_, 1572864);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v416 = v98;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v416, 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v94, 0, sel_performDelete_, CFSTR("\b"), 0x100000, 0, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "localizedStringForKey:value:table:", CFSTR("Delete"), CFSTR("Delete"), CFSTR("Localizable"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setDiscoverabilityTitle:", v102);

  v393 = v100;
  v417[16] = v100;
  v389 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v391, "localizedStringForKey:value:table:", CFSTR("Eject"), CFSTR("Eject"), CFSTR("Localizable"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)MEMORY[0x24BEBD4D8];
  _DocumentManagerBundle();
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "localizedStringForKey:value:table:", CFSTR("Eject"), CFSTR("Eject"), CFSTR("Localizable"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "alternateWithTitle:action:modifierFlags:", v106, sel_performEjectMedium_, 1310720);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v415[0] = v107;
  v108 = (void *)MEMORY[0x24BEBD4D8];
  _DocumentManagerBundle();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "localizedStringForKey:value:table:", CFSTR("Eject"), CFSTR("Eject"), CFSTR("Localizable"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "alternateWithTitle:action:modifierFlags:", v110, sel_performEjectMedium_, 1572864);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v415[1] = v111;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v415, 2);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v389, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v103, 0, sel_performEjectMedium_, CFSTR("e"), 0x100000, 0, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "localizedStringForKey:value:table:", CFSTR("Eject"), CFSTR("Eject"), CFSTR("Localizable"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setDiscoverabilityTitle:", v115);

  v392 = v113;
  v417[17] = v113;
  v116 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "localizedStringForKey:value:table:", CFSTR("Find"), CFSTR("Find"), CFSTR("Localizable"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v118, 0, sel_performFind_, CFSTR("f"), 0x100000, 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "localizedStringForKey:value:table:", CFSTR("Find"), CFSTR("Find"), CFSTR("Localizable"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setDiscoverabilityTitle:", v121);

  v390 = v119;
  v417[18] = v119;
  v122 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "localizedStringForKey:value:table:", CFSTR("Find"), CFSTR("Find"), CFSTR("Localizable"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v124, 0, sel_performFind_, CFSTR("f"), 1572864, MEMORY[0x24BDBD1B8]);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "localizedStringForKey:value:table:", CFSTR("Find"), CFSTR("Find"), CFSTR("Localizable"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setDiscoverabilityTitle:", v127);

  objc_msgSend(v125, "setAttributes:", 4);
  v388 = v125;
  v417[19] = v125;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v417, 20);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v419[0] = v387;
  v418[1] = *MEMORY[0x24BEBE5A8];
  v128 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "localizedStringForKey:value:table:", CFSTR("Undo"), CFSTR("Undo"), CFSTR("Localizable"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v130, 0, sel_undo_, CFSTR("z"), 0x100000, 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "localizedStringForKey:value:table:", CFSTR("Undo"), CFSTR("Undo"), CFSTR("Localizable"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setDiscoverabilityTitle:", v133);

  v386 = v131;
  v414[0] = v131;
  v134 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("Redo"), CFSTR("Redo"), CFSTR("Localizable"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v136, 0, sel_redo_, CFSTR("z"), 1179648, 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "localizedStringForKey:value:table:", CFSTR("Redo"), CFSTR("Redo"), CFSTR("Localizable"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setDiscoverabilityTitle:", v139);

  v385 = v137;
  v414[1] = v137;
  v140 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "localizedStringForKey:value:table:", CFSTR("Copy"), CFSTR("Copy"), CFSTR("Localizable"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v142, 0, sel_copy_, CFSTR("c"), 0x100000, 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "localizedStringForKey:value:table:", CFSTR("Copy"), CFSTR("Copy"), CFSTR("Localizable"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "setDiscoverabilityTitle:", v145);

  v384 = v143;
  v414[2] = v143;
  v146 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "localizedStringForKey:value:table:", CFSTR("Paste"), CFSTR("Paste"), CFSTR("Localizable"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = (void *)MEMORY[0x24BEBD4D8];
  _DocumentManagerBundle();
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "localizedStringForKey:value:table:", CFSTR("Move Here"), CFSTR("Move Here"), CFSTR("Localizable"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "alternateWithTitle:action:modifierFlags:", v151, sel_performMoveHere_, 1572864);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v413 = v152;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v413, 1);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v148, 0, sel_paste_, CFSTR("v"), 0x100000, 0, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "localizedStringForKey:value:table:", CFSTR("Paste"), CFSTR("Paste"), CFSTR("Localizable"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "setDiscoverabilityTitle:", v156);

  v383 = v154;
  v414[3] = v154;
  v157 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "localizedStringForKey:value:table:", CFSTR("Select All"), CFSTR("Select All"), CFSTR("Localizable"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = (void *)MEMORY[0x24BEBD4D8];
  _DocumentManagerBundle();
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "localizedStringForKey:value:table:", CFSTR("Deselect All"), CFSTR("Deselect All"), CFSTR("Localizable"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "alternateWithTitle:action:modifierFlags:", v162, sel_performDeselectAll_, 1572864);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v412 = v163;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v412, 1);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v159, 0, sel_selectAll_, CFSTR("a"), 0x100000, 0, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "localizedStringForKey:value:table:", CFSTR("Select All"), CFSTR("Select All"), CFSTR("Localizable"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "setDiscoverabilityTitle:", v167);

  v382 = v165;
  v414[4] = v165;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v414, 5);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v419[1] = v381;
  v418[2] = *MEMORY[0x24BEBE5D8];
  v168 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "localizedStringForKey:value:table:", CFSTR("View as Icons"), CFSTR("View as Icons"), CFSTR("Localizable"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v170, 0, sel_performViewAsIcons_, CFSTR("1"), 0x100000, 0);
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "localizedStringForKey:value:table:", CFSTR("View as Icons"), CFSTR("View as Icons"), CFSTR("Localizable"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "setDiscoverabilityTitle:", v173);

  v380 = v171;
  v411[0] = v171;
  v174 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "localizedStringForKey:value:table:", CFSTR("View as List"), CFSTR("View as List"), CFSTR("Localizable"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v176, 0, sel_performViewAsList_, CFSTR("2"), 0x100000, 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "localizedStringForKey:value:table:", CFSTR("View as List"), CFSTR("View as List"), CFSTR("Localizable"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "setDiscoverabilityTitle:", v179);

  v379 = v177;
  v411[1] = v177;
  v180 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "localizedStringForKey:value:table:", CFSTR("View as Column"), CFSTR("View as Column"), CFSTR("Localizable"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v182, 0, sel_performViewAsColumns_, CFSTR("3"), 0x100000, 0);
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "localizedStringForKey:value:table:", CFSTR("View as Column"), CFSTR("View as Column"), CFSTR("Localizable"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "setDiscoverabilityTitle:", v185);

  v378 = v183;
  v411[2] = v183;
  v186 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "localizedStringForKey:value:table:", CFSTR("Use Groups"), CFSTR("Use Groups"), CFSTR("Localizable"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v188, 0, sel_performUseGrouping_, CFSTR("0"), 1310720, 0);
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "localizedStringForKey:value:table:", CFSTR("Use Groups"), CFSTR("Use Groups"), CFSTR("Localizable"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "setDiscoverabilityTitle:", v191);

  v377 = v189;
  v411[3] = v189;
  v192 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "localizedStringForKey:value:table:", CFSTR("Sort by Name"), CFSTR("Sort by Name"), CFSTR("Localizable"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v194, 0, sel_performSortByName_, CFSTR("1"), 1835008, 0);
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "localizedStringForKey:value:table:", CFSTR("Sort by Name"), CFSTR("Sort by Name"), CFSTR("Localizable"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "setDiscoverabilityTitle:", v197);

  v376 = v195;
  v411[4] = v195;
  v198 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "localizedStringForKey:value:table:", CFSTR("Sort by Kind"), CFSTR("Sort by Kind"), CFSTR("Localizable"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v200, 0, sel_performSortByKind_, CFSTR("2"), 1835008, 0);
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "localizedStringForKey:value:table:", CFSTR("Sort by Kind"), CFSTR("Sort by Kind"), CFSTR("Localizable"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "setDiscoverabilityTitle:", v203);

  v375 = v201;
  v411[5] = v201;
  v204 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "localizedStringForKey:value:table:", CFSTR("Sort by Date"), CFSTR("Sort by Date"), CFSTR("Localizable"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v206, 0, sel_performSortByDate_, CFSTR("5"), 1835008, 0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "localizedStringForKey:value:table:", CFSTR("Sort by Date"), CFSTR("Sort by Date"), CFSTR("Localizable"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "setDiscoverabilityTitle:", v209);

  v374 = v207;
  v411[6] = v207;
  v210 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "localizedStringForKey:value:table:", CFSTR("Sort by Date"), CFSTR("Sort by Date"), CFSTR("Localizable"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = MEMORY[0x24BDBD1B8];
  objc_msgSend(v210, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v212, 0, sel_performSortByDate_, CFSTR("3"), 1835008, MEMORY[0x24BDBD1B8]);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "localizedStringForKey:value:table:", CFSTR("Sort by Date"), CFSTR("Sort by Date"), CFSTR("Localizable"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "setDiscoverabilityTitle:", v216);

  objc_msgSend(v214, "setAttributes:", 4);
  v373 = v214;
  v411[7] = v214;
  v217 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "localizedStringForKey:value:table:", CFSTR("Sort by Size"), CFSTR("Sort by Size"), CFSTR("Localizable"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v219, 0, sel_performSortBySize_, CFSTR("6"), 1835008, 0);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "localizedStringForKey:value:table:", CFSTR("Sort by Size"), CFSTR("Sort by Size"), CFSTR("Localizable"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "setDiscoverabilityTitle:", v222);

  v372 = v220;
  v411[8] = v220;
  v223 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "localizedStringForKey:value:table:", CFSTR("Sort by Tags"), CFSTR("Sort by Tags"), CFSTR("Localizable"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v225, 0, sel_performSortByTags_, CFSTR("7"), 1835008, 0);
  v226 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "localizedStringForKey:value:table:", CFSTR("Sort by Tags"), CFSTR("Sort by Tags"), CFSTR("Localizable"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "setDiscoverabilityTitle:", v228);

  v371 = v226;
  v411[9] = v226;
  v229 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "localizedStringForKey:value:table:", CFSTR("Group by Kind"), CFSTR("Group by Kind"), CFSTR("Localizable"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v231, 0, sel_performGroupByKind_, CFSTR("2"), 1310720, 0);
  v232 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "localizedStringForKey:value:table:", CFSTR("Group by Kind"), CFSTR("Group by Kind"), CFSTR("Localizable"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "setDiscoverabilityTitle:", v234);

  v370 = v232;
  v411[10] = v232;
  v235 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "localizedStringForKey:value:table:", CFSTR("Group by Date"), CFSTR("Group by Date"), CFSTR("Localizable"));
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v237, 0, sel_performGroupByDate_, CFSTR("5"), 1310720, 0);
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "localizedStringForKey:value:table:", CFSTR("Group by Date"), CFSTR("Group by Date"), CFSTR("Localizable"));
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "setDiscoverabilityTitle:", v240);

  v369 = v238;
  v411[11] = v238;
  v241 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "localizedStringForKey:value:table:", CFSTR("Group by Date"), CFSTR("Group by Date"), CFSTR("Localizable"));
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v243, 0, sel_performGroupByDate_, CFSTR("3"), 1310720, v213);
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "localizedStringForKey:value:table:", CFSTR("Group by Date"), CFSTR("Group by Date"), CFSTR("Localizable"));
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setDiscoverabilityTitle:", v246);

  objc_msgSend(v244, "setAttributes:", 4);
  v368 = v244;
  v411[12] = v244;
  v247 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "localizedStringForKey:value:table:", CFSTR("Group by Size"), CFSTR("Group by Size"), CFSTR("Localizable"));
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v249, 0, sel_performGroupBySize_, CFSTR("6"), 1310720, 0);
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "localizedStringForKey:value:table:", CFSTR("Group by Size"), CFSTR("Group by Size"), CFSTR("Localizable"));
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "setDiscoverabilityTitle:", v252);

  v367 = v250;
  v411[13] = v250;
  v253 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "localizedStringForKey:value:table:", CFSTR("Group by Shared by"), CFSTR("Group by Shared by"), CFSTR("Localizable"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v255, 0, sel_performGroupBySharedBy_, CFSTR("8"), 1310720, 0);
  v256 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "localizedStringForKey:value:table:", CFSTR("Group by Shared by"), CFSTR("Group by Shared by"), CFSTR("Localizable"));
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "setDiscoverabilityTitle:", v258);

  v366 = v256;
  v411[14] = v256;
  objc_msgSend(MEMORY[0x24BE2DEF0], "viewOptionsSizeSetting");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v365, "isEnabled"))
  {
    v259 = (void *)MEMORY[0x24BEBD6B8];
    _DocumentManagerBundle();
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v260, "localizedStringForKey:value:table:", CFSTR("Make Icons Smaller"), CFSTR("Make Icons Smaller"), CFSTR("Localizable"));
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v261, 0, sel_performViewAsUserSizeSmaller_, CFSTR("-"), 0x100000, 0);
    v262 = (void *)objc_claimAutoreleasedReturnValue();

    _DocumentManagerBundle();
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "localizedStringForKey:value:table:", CFSTR("Make Icons Smaller"), CFSTR("Make Icons Smaller"), CFSTR("Localizable"));
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v262, "setDiscoverabilityTitle:", v264);

    v265 = 0x24BDBC000;
  }
  else
  {
    v265 = 0x24BDBC000uLL;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v411[15] = v262;
  objc_msgSend(MEMORY[0x24BE2DEF0], "viewOptionsSizeSetting");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v363, "isEnabled"))
  {
    v266 = (void *)MEMORY[0x24BEBD6B8];
    _DocumentManagerBundle();
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "localizedStringForKey:value:table:", CFSTR("Make Icons Bigger"), CFSTR("Make Icons Bigger"), CFSTR("Localizable"));
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v268, 0, sel_performViewAsUserSizeLarger_, CFSTR("+"), 0x100000, 0);
    v269 = (void *)objc_claimAutoreleasedReturnValue();

    _DocumentManagerBundle();
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v270, "localizedStringForKey:value:table:", CFSTR("Make Icons Bigger"), CFSTR("Make Icons Bigger"), CFSTR("Localizable"));
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "setDiscoverabilityTitle:", v271);

  }
  else
  {
    objc_msgSend(*(id *)(v265 + 3832), "null");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v362 = v269;
  v411[16] = v269;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v411, 17);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v419[2] = v361;
  v418[3] = CFSTR("com.apple.DocumentManager.menu.main.go");
  v272 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "localizedStringForKey:value:table:", CFSTR("Go to Enclosing Folder"), CFSTR("Go to Enclosing Folder"), CFSTR("Localizable"));
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v274, 0, sel_performGoToEnclosingFolder_, *MEMORY[0x24BEBE3F8], 0x100000, 0);
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "localizedStringForKey:value:table:", CFSTR("Go to Enclosing Folder"), CFSTR("Go to Enclosing Folder"), CFSTR("Localizable"));
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "setDiscoverabilityTitle:", v277);

  v360 = v275;
  v410[0] = v275;
  v278 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "localizedStringForKey:value:table:", CFSTR("Go Back"), CFSTR("Go Back"), CFSTR("Localizable"));
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v280, 0, sel_performGoBackInHistory_, CFSTR("["), 0x100000, 0);
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "localizedStringForKey:value:table:", CFSTR("Go Back"), CFSTR("Go Back"), CFSTR("Localizable"));
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "setDiscoverabilityTitle:", v283);

  v359 = v281;
  v410[1] = v281;
  v284 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "localizedStringForKey:value:table:", CFSTR("Go Forward"), CFSTR("Go Forward"), CFSTR("Localizable"));
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v286, 0, sel_performGoForwardInHistory_, CFSTR("]"), 0x100000, 0);
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v288, "localizedStringForKey:value:table:", CFSTR("Go Forward"), CFSTR("Go Forward"), CFSTR("Localizable"));
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v287, "setDiscoverabilityTitle:", v289);

  v358 = v287;
  v410[2] = v287;
  v290 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v291, "localizedStringForKey:value:table:", CFSTR("Go to Recents"), CFSTR("Go to Recents"), CFSTR("Localizable"));
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v292, 0, sel_performGoToRecents_, CFSTR("f"), 1179648, 0);
  v293 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "localizedStringForKey:value:table:", CFSTR("Go to Recents"), CFSTR("Go to Recents"), CFSTR("Localizable"));
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "setDiscoverabilityTitle:", v295);

  v357 = v293;
  v410[3] = v293;
  v296 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "localizedStringForKey:value:table:", CFSTR("Go to Recents"), CFSTR("Go to Recents"), CFSTR("Localizable"));
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v298, 0, sel_performGoToRecents_, CFSTR("r"), 1179648, MEMORY[0x24BDBD1B8]);
  v299 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v300, "localizedStringForKey:value:table:", CFSTR("Go to Recents"), CFSTR("Go to Recents"), CFSTR("Localizable"));
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "setDiscoverabilityTitle:", v301);

  objc_msgSend(v299, "setAttributes:", 4);
  v356 = v299;
  v410[4] = v299;
  v364 = v262;
  if (DOCUsePadIdiomForTraits(0))
  {
    objc_msgSend(*(id *)(v265 + 3832), "null");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v303 = (void *)MEMORY[0x24BEBD6B8];
    _DocumentManagerBundle();
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v304, "localizedStringForKey:value:table:", CFSTR("Go to Browse"), CFSTR("Go to Browse"), CFSTR("Localizable"));
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v303, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v305, 0, sel_performGoToBrowse_, CFSTR("b"), 1179648, 0);
    v302 = (void *)objc_claimAutoreleasedReturnValue();

    _DocumentManagerBundle();
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v306, "localizedStringForKey:value:table:", CFSTR("Go to Browse"), CFSTR("Go to Browse"), CFSTR("Localizable"));
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v302, "setDiscoverabilityTitle:", v307);

  }
  v355 = v302;
  v410[5] = v302;
  v308 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v309, "localizedStringForKey:value:table:", CFSTR("Go to Documents"), CFSTR("Go to Documents"), CFSTR("Localizable"));
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v310, 0, sel_performGoToDocuments_, CFSTR("o"), 1179648, 0);
  v311 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "localizedStringForKey:value:table:", CFSTR("Go to Documents"), CFSTR("Go to Documents"), CFSTR("Localizable"));
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v354 = v311;
  objc_msgSend(v311, "setDiscoverabilityTitle:", v313);

  v410[6] = v311;
  v314 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "localizedStringForKey:value:table:", CFSTR("Go to Desktop"), CFSTR("Go to Desktop"), CFSTR("Localizable"));
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v314, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v316, 0, sel_performGoToDesktop_, CFSTR("d"), 1179648, 0);
  v317 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "localizedStringForKey:value:table:", CFSTR("Go to Desktop"), CFSTR("Go to Desktop"), CFSTR("Localizable"));
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v353 = v317;
  objc_msgSend(v317, "setDiscoverabilityTitle:", v319);

  v410[7] = v317;
  v320 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v321, "localizedStringForKey:value:table:", CFSTR("Go to Downloads"), CFSTR("Go to Downloads"), CFSTR("Localizable"));
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v322, 0, sel_performGoToDownloads_, CFSTR("l"), 1572864, 0);
  v323 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v324, "localizedStringForKey:value:table:", CFSTR("Go to Downloads"), CFSTR("Go to Downloads"), CFSTR("Localizable"));
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v323, "setDiscoverabilityTitle:", v325);

  v410[8] = v323;
  v326 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v327, "localizedStringForKey:value:table:", CFSTR("Go to Shared"), CFSTR("Go to Shared"), CFSTR("Localizable"));
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v326, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v328, 0, sel_performGoToShared_, CFSTR("s"), 1179648, 0);
  v329 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v330, "localizedStringForKey:value:table:", CFSTR("Go to Shared"), CFSTR("Go to Shared"), CFSTR("Localizable"));
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "setDiscoverabilityTitle:", v331);

  v410[9] = v329;
  v332 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v333, "localizedStringForKey:value:table:", CFSTR("Go to iCloud Drive"), CFSTR("Go to iCloud Drive"), CFSTR("Localizable"));
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v332, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v334, 0, sel_performGoToICloudDrive_, CFSTR("i"), 1179648, 0);
  v335 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "localizedStringForKey:value:table:", CFSTR("Go to iCloud Drive"), CFSTR("Go to iCloud Drive"), CFSTR("Localizable"));
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v335, "setDiscoverabilityTitle:", v337);

  v410[10] = v335;
  v338 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v339, "localizedStringForKey:value:table:", CFSTR("Go to Folder…"), CFSTR("Go to Folder…"), CFSTR("Localizable"));
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v338, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v340, 0, sel_performGoToLocation_, CFSTR("g"), 1179648, 0);
  v341 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v342, "localizedStringForKey:value:table:", CFSTR("Go to Folder…"), CFSTR("Go to Folder…"), CFSTR("Localizable"));
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "setDiscoverabilityTitle:", v343);

  v410[11] = v341;
  v344 = (void *)MEMORY[0x24BEBD6B8];
  _DocumentManagerBundle();
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v345, "localizedStringForKey:value:table:", CFSTR("Connect to Server…"), CFSTR("Connect to Server…"), CFSTR("Localizable"));
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v346, 0, sel_performConnectToServer_, CFSTR("k"), 0x100000, 0);
  v347 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "localizedStringForKey:value:table:", CFSTR("Connect to Server…"), CFSTR("Connect to Server…"), CFSTR("Localizable"));
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v347, "setDiscoverabilityTitle:", v349);

  v410[12] = v347;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v410, 13);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  v419[3] = v350;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v419, v418, 4);
  v351 = (void *)objc_claimAutoreleasedReturnValue();

  return v351;
}

- (id)_menuOrder
{
  uint64_t v2;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEBE5A8];
  v4[0] = *MEMORY[0x24BEBE5B0];
  v4[1] = v2;
  v4[2] = *MEMORY[0x24BEBE5D8];
  v4[3] = CFSTR("com.apple.DocumentManager.menu.main.go");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_unwantedMenuIdentifiers
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEBE5B8];
  v4[0] = *MEMORY[0x24BEBE5C0];
  v4[1] = v2;
  v4[2] = *MEMORY[0x24BEBE5A8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_menuTitleForCustomMenuWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.DocumentManager.menu.main.go")))
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Go [Menu title]");
    v9 = CFSTR("Go");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEBE5A8]))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCKeyCommandController.m"), 287, CFSTR("Incomplete definition of menu titles, menu identifier missing: %@"), v5);
      v10 = 0;
      goto LABEL_7;
    }
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Edit [Menu title]");
    v9 = CFSTR("Edit");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v9, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

- (void)buildWithBuilder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  DOCKeyCommandController *obj;
  id obja;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[DOCKeyCommandController _menuDefinition](self, "_menuDefinition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCKeyCommandController _menuOrder](self, "_menuOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v6;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  obj = self;
  -[DOCKeyCommandController _unwantedMenuIdentifiers](self, "_unwantedMenuIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i)) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v15 = v7;
          v16 = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("DOCKeyCommandController.m"), 301, CFSTR("Menu identifier not in _menuOrder."));

          v10 = v16;
          v7 = v15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v12);
  }
  v43 = v7;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v59 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v5, "removeMenuForIdentifier:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j), v43);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v20);
  }
  v45 = v10;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[DOCKeyCommandController _menuOrder](obj, "_menuOrder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  v44 = v18;
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v55;
    v46 = *MEMORY[0x24BEBE5D0];
    do
    {
      v28 = 0;
      v29 = v26;
      do
      {
        if (*(_QWORD *)v55 != v27)
          objc_enumerationMutation(v23);
        v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v28);
        objc_msgSend(v5, "menuForIdentifier:", v30, v43, v44, v45);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          -[DOCKeyCommandController _menuTitleForCustomMenuWithIdentifier:](obj, "_menuTitleForCustomMenuWithIdentifier:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", v32, 0, v30, 0, MEMORY[0x24BDBD1A8]);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend(v5, "insertSiblingMenu:afterMenuForIdentifier:", v33, v29);
          else
            objc_msgSend(v5, "insertChildMenu:atStartOfMenuForIdentifier:", v33, v46);

        }
        v26 = v30;

        ++v28;
        v29 = v26;
      }
      while (v25 != v28);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v25);
  }
  else
  {
    v26 = 0;
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obja = v43;
  v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(obja);
        v38 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
        objc_msgSend(v49, "objectForKeyedSubscript:", v38, v43);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_7);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "filteredArrayUsingPredicate:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", &stru_24C0F2058, 0, 0, 1, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insertChildMenu:atEndOfMenuForIdentifier:", v42, v38);

      }
      v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v35);
  }

}

BOOL __44__DOCKeyCommandController_buildWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCEF8];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

- (id)allKeyCommands
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[DOCKeyCommandController _menuDefinition](self, "_menuDefinition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[DOCKeyCommandController _menuOrder](self, "_menuOrder");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v17 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v20;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v12 != v13)
                objc_msgSend(v3, "addObject:", v12);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (id)allKeyCommandsWithAction:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[DOCKeyCommandController allKeyCommands](self, "allKeyCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "_doc_erasedKeyCommandWithWrappedAction:", a3, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

@end
