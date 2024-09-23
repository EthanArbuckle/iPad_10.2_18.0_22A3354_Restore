@implementation CIRedEyeRaw

- (id)irisProtectionMaskWithThresholdIris:(float)a3 thresholdSclera:(float)a4 thresholdSkin:(float)a5
{
  CIColorKernel *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v9 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_extract_iris);
  -[CIImage extent](-[CIRedEyeRaw inputIrisMask](self, "inputIrisMask"), "extent");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v22[0] = -[CIRedEyeRaw inputIrisMask](self, "inputIrisMask");
  v22[1] = -[CIRedEyeRaw inputScleraMask](self, "inputScleraMask");
  v22[2] = -[CIRedEyeRaw inputSkinMask](self, "inputSkinMask");
  *(float *)&v18 = a3;
  v22[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  *(float *)&v19 = a4;
  v22[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  *(float *)&v20 = a5;
  v22[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  return -[CIColorKernel applyWithExtent:arguments:](v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6), v11, v13, v15, v17);
}

- (id)skinProtectionMaskWithThreshold:(float)a3
{
  CIColorKernel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_extract_skin);
  -[CIImage extent](-[CIRedEyeRaw inputSkinMask](self, "inputSkinMask"), "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v16[0] = -[CIRedEyeRaw inputSkinMask](self, "inputSkinMask");
  *(float *)&v14 = a3;
  v16[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  return -[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2), v7, v9, v11, v13);
}

- (id)outputImage
{
  CIRedEyeRaw *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  const __CFString *v19;
  NSObject *v20;
  int v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  double v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  int v49;
  int v50;
  float v51;
  float v52;
  int v53;
  int v54;
  int v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  int v64;
  int v65;
  float v66;
  float v67;
  float v68;
  float v69;
  _BOOL4 v70;
  double v71;
  int *v72;
  int *v73;
  int *v74;
  int *v75;
  int *v76;
  int *v77;
  int *v78;
  CIImage *v79;
  CIImage *v80;
  CIImage *v81;
  double v82;
  double v83;
  uint64_t v84;
  int *v85;
  void *v86;
  CIColorKernel *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CIImage *inputPrimary;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  double v100;
  uint64_t v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  char v107;
  char v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  int v114;
  float v115;
  int v116;
  NSObject *v117;
  CIImage *v118;
  CIImage *v119;
  double v120;
  CIImage *v121;
  double v122;
  CIImage *v123;
  double v124;
  float v125;
  NSObject *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  double v137;
  CIImage *v138;
  CIImage *v139;
  int v140;
  uint64_t v141;
  int v142;
  char v143;
  int v144;
  double v145;
  double v146;
  double v147;
  double v148;
  int *v149;
  uint64_t v150;
  CIVector **v151;
  CIVector *v152;
  CIImage *v153;
  Class isa;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  uint64_t v161;
  CIImage *v162;
  objc_object *v163;
  double v164;
  double v165;
  double v166;
  double v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  uint64_t v189;
  char v190;
  double v191;
  double v192;
  char v193;
  BOOL v194;
  double v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  CIVector **v199;
  CIVector *v200;
  void **p_isa;
  void *v202;
  float v203;
  float v204;
  float v205;
  float v206;
  float v207;
  float v208;
  NSObject *v209;
  CIImage *v210;
  CIImage *v211;
  CIImage *v212;
  void *v213;
  int v214;
  int v215;
  uint64_t v216;
  CIImage *v217;
  uint64_t v218;
  char v219;
  int v220;
  CIImage *v221;
  double v222;
  double v223;
  double v224;
  double v225;
  CIVector *v226;
  NSNumber *inputFalloffSpecular;
  double v228;
  uint64_t v229;
  CIImage *v230;
  CIImage *v231;
  CIImage *v232;
  CIImage *v233;
  CIImage *v234;
  CIImage *v235;
  float v236;
  float v237;
  CIImage *v238;
  double v239;
  double v240;
  double v241;
  CIImage *v242;
  float v243;
  CIVector *v244;
  double v245;
  double v246;
  double v247;
  CIVector *v248;
  CIImage *v249;
  uint64_t v250;
  uint64_t v251;
  CIImage *v252;
  CIRedEyeRaw *v253;
  double v254;
  CIImage *v255;
  double v256;
  double v257;
  double v258;
  NSNumber *inputInterPeakMin;
  NSNumber *inputSpecAreaScale;
  double v261;
  double v262;
  double v263;
  uint64_t v264;
  NSNumber *inputFalloffDensity;
  double v266;
  double v267;
  double v268;
  uint64_t v269;
  NSNumber *inputParam2;
  CIImage *v271;
  CIImage *v272;
  CIImage *v273;
  CIImage *v274;
  CIImage *v275;
  CIImage *v276;
  uint64_t v277;
  NSObject *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  double v286;
  float v287;
  CIImage *v288;
  float v289;
  CIImage *v290;
  CIImage *v291;
  uint64_t v292;
  void *v293;
  double v295;
  double v296;
  CIImage *v297;
  CIImage *v298;
  double v299;
  CIImage *v300;
  double v301;
  void *v302;
  CIVector **v303;
  const __CFString **v304;
  CIImage *v305;
  CIImage *v306;
  CIImage *v307;
  CIImage *v308;
  CIImage *v309;
  CIImage *v310;
  CIImage *v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  double v315;
  double v316;
  CIImage *v317;
  CIImage *v318;
  CIImage *v319;
  CIRedEyeRaw *v320;
  CIImage *v321;
  CIImage *v322;
  CIImage *v323;
  void *v324;
  _QWORD *v325;
  _QWORD *v326;
  double v327;
  CIImage *v328;
  CIImage *v329;
  CIImage *v330;
  CIRedEyeRaw *v331;
  CIImage *v332;
  uint64_t v333;
  double v334;
  int *v335;
  uint64_t v336;
  char v337;
  char v338;
  double v339;
  double v340;
  double v341;
  double v342;
  CIImage *v343;
  CIImage *v344;
  CIImage *v345;
  CIVector *v346;
  CIImage *v347;
  double v348;
  CIImage *v349;
  float v350;
  CIImage *v351;
  float v352;
  uint64_t v353;
  CIImage *v354;
  CIImage *v355;
  double v356;
  double v357;
  CIImage *v358;
  void *v359;
  NSObject *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  double v368;
  float v369;
  double v370;
  float v371;
  float v372;
  float v373;
  CIImage *v374;
  CIImage *v375;
  float v376;
  float v377;
  float v378;
  float v379;
  float v380;
  double v381;
  CGFloat v382;
  CIImage *v383;
  CIImage *v384;
  CIImage *v385;
  CIImage *v386;
  CIRedEyeRaw *v387;
  float v388;
  float v389;
  CIImage *v390;
  double v391;
  CIImage *v392;
  CIImage *v393;
  CIImage *v394;
  CIImage *v395;
  unint64_t v396;
  double v397;
  double v398;
  CGFloat v399;
  float v400;
  double v401;
  float v402;
  float v403;
  double v404;
  double v405;
  double v406;
  CIImage *v407;
  CIImage *v408;
  double v409;
  float v410;
  CIImage *v411;
  double v412;
  double v413;
  void *v414;
  double v415;
  CIImage *v416;
  CIImage *v417;
  uint64_t v418;
  char v419;
  double v420;
  CIImage *v421;
  double v422;
  double v423;
  double v424;
  double v425;
  CIImage *v426;
  CIImage *v427;
  CIImage *v428;
  double v429;
  CIImage *v430;
  CIImage *v431;
  CIImage *v432;
  double v433;
  double v434;
  uint64_t v435;
  NSNumber *inputRecover;
  double v437;
  double v438;
  uint64_t v439;
  void *v440;
  void *v441;
  double v442;
  uint64_t v443;
  char v444;
  char v445;
  void *v446;
  CIColorKernel *v447;
  double v448;
  CGFloat v449;
  double v450;
  CGFloat v451;
  double v452;
  CGFloat v453;
  double v454;
  CGFloat v455;
  CGFloat v456;
  CGFloat v457;
  CGFloat v458;
  CGFloat v459;
  double x;
  double y;
  double width;
  double height;
  uint64_t v464;
  CIImage *v465;
  CIImage *inputSecondary;
  uint64_t v467;
  CIImage *v468;
  CIImage *v469;
  float v470;
  int v471;
  int v472;
  CIImage *v473;
  uint64_t v474;
  CIColorKernel *v475;
  double v476;
  double v477;
  double v478;
  double v479;
  double v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  double v486;
  double v487;
  double v488;
  double v489;
  double v490;
  double v491;
  void *v492;
  float v493;
  float v494;
  float v495;
  CIImage *v496;
  float v497;
  CIImage *v498;
  CIImage *v499;
  CIImage *v500;
  double v501;
  float v502;
  float v503;
  float v504;
  float v505;
  float v506;
  float v507;
  float v508;
  int v509;
  int v510;
  int v511;
  int v512;
  float v513;
  double v514;
  float v515;
  CIImage *v516;
  float v517;
  float v518;
  int v519;
  int v520;
  float v521;
  CIVector **p_inputAxisLongRight;
  double v523;
  float v524;
  double v525;
  CIImage *v526;
  float v527;
  double v528;
  float v529;
  uint64_t v530;
  float v531;
  float v532;
  float v533;
  float v534;
  float v535;
  float v536;
  float v537;
  float v538;
  float v539;
  double v540;
  float v541;
  double v542;
  float v543;
  float v544;
  float v545;
  float v546;
  int v547;
  CIImage *v548;
  CIImage *v549;
  float v550;
  int v551;
  CIImage *v552;
  float v553;
  CIVector **p_inputAxisLongLeft;
  void *v555;
  CIImage *p_inputAxisShortRight;
  CIImage *v557;
  CIImage *v558;
  CIImage *v559;
  CIImage *p_inputAxisShortLeft;
  CIImage *v561;
  CIImage *v562;
  double v563;
  double v564;
  double v565;
  double v566;
  double v567;
  double v568;
  CGFloat v569;
  CIRedEyeRaw *v570;
  float v571;
  CGAffineTransform v572;
  CGAffineTransform v573;
  CGAffineTransform v574;
  CGAffineTransform v575;
  _OWORD v576[3];
  _OWORD v577[3];
  _OWORD v578[3];
  CGAffineTransform v579;
  CGAffineTransform v580;
  _QWORD v581[3];
  _QWORD v582[3];
  const __CFString *v583;
  CIVector *v584;
  _QWORD v585[5];
  _QWORD v586[5];
  _QWORD v587[3];
  _QWORD v588[2];
  _QWORD v589[8];
  _QWORD v590[8];
  const __CFString *v591;
  void *v592;
  const __CFString *v593;
  void *v594;
  const __CFString *v595;
  uint64_t v596;
  const __CFString *v597;
  void *v598;
  const __CFString *v599;
  void *v600;
  _QWORD v601[2];
  const __CFString *v602;
  void *v603;
  const __CFString *v604;
  void *v605;
  const __CFString *v606;
  uint64_t v607;
  const __CFString *v608;
  uint64_t v609;
  const __CFString *v610;
  uint64_t v611;
  const __CFString *v612;
  uint64_t v613;
  _QWORD v614[4];
  _QWORD v615[4];
  _QWORD v616[2];
  _QWORD v617[2];
  _QWORD v618[2];
  _QWORD v619[2];
  _QWORD v620[2];
  _QWORD v621[2];
  _QWORD v622[2];
  _QWORD v623[2];
  _QWORD v624[2];
  _QWORD v625[2];
  _QWORD v626[2];
  const __CFString *v627;
  CIVector *v628;
  const __CFString *v629;
  CIVector *v630;
  const __CFString *v631;
  CIVector *v632;
  const __CFString *v633;
  CIVector *v634;
  _QWORD v635[24];
  _QWORD v636[24];
  _QWORD v637[5];
  _QWORD v638[5];
  CIImage *v639[2];
  uint8_t buf[32];
  _BYTE v641[20];
  _QWORD v642[2];
  _QWORD v643[13];
  _QWORD v644[13];
  _QWORD v645[2];
  _QWORD v646[2];
  _QWORD v647[5];
  CGRect v648;
  CGRect v649;
  CGRect v650;
  CGRect v651;
  CGRect v652;
  CGRect v653;
  CGRect v654;
  CGRect v655;
  CGRect v656;
  CGRect v657;
  CGRect v658;
  CGRect v659;
  CGRect v660;

  v2 = self;
  v647[2] = *MEMORY[0x1E0C80C00];
  -[CIVector X](self->inputOriginLeft, "X");
  v569 = v3;
  -[CIVector Y](v2->inputOriginLeft, "Y");
  v566 = v4;
  -[CIVector X](v2->inputSize, "X");
  v567 = v5;
  -[CIVector Y](v2->inputSize, "Y");
  v568 = v6;
  -[CIVector X](v2->inputOriginRight, "X");
  v563 = v7;
  -[CIVector Y](v2->inputOriginRight, "Y");
  v565 = v8;
  -[CIVector X](v2->inputSize, "X");
  v564 = v9;
  -[CIVector Y](v2->inputSize, "Y");
  v542 = v10;
  -[CIVector _norm](v2->inputAxisLongLeft, "_norm");
  v12 = v11;
  -[CIVector _norm](v2->inputAxisLongRight, "_norm");
  v14 = v13;
  -[CIVector _norm](v2->inputAxisShortLeft, "_norm");
  v531 = v15;
  -[CIVector _norm](v2->inputAxisShortRight, "_norm");
  v571 = v16;
  if (v12 > v14)
    v14 = v12;
  -[NSNumber floatValue](v2->inputScale, "floatValue");
  v18 = CIRedEyeUtilsSizeFromScale(v14 * v17);
  v19 = tagForEye(v18);
  if (CI_LOG_DUALRED())
  {
    v20 = ci_logger_api();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CIRedEyeRaw outputImage].cold.4((uint64_t)v19, v20, v14);
  }
  -[NSNumber floatValue](v2->inputAbortDensityDiff, "floatValue");
  v512 = v21;
  -[NSNumber floatValue](v2->inputAbortDensityLo, "floatValue");
  v541 = v22;
  -[NSNumber floatValue](v2->inputSpecMax, "floatValue");
  v503 = v23;
  -[NSNumber floatValue](v2->inputSpecular, "floatValue");
  v534 = v24;
  -[NSNumber floatValue](v2->inputSpecMin, "floatValue");
  v535 = v25;
  -[NSNumber floatValue](v2->inputClosingErosion, "floatValue");
  v508 = v26;
  -[NSNumber floatValue](v2->inputClosingDilation, "floatValue");
  v553 = v27;
  -[NSNumber floatValue](v2->inputSplat, "floatValue");
  v529 = v28;
  -[CIVector X](v2->inputSize, "X");
  v540 = v29;
  -[CIVector Y](v2->inputSize, "Y");
  v528 = v30;
  -[NSNumber floatValue](v2->inputRepairDarken, "floatValue");
  v32 = v31;
  -[NSNumber floatValue](v2->inputRepairDither, "floatValue");
  v34 = v33;
  -[NSNumber floatValue](v2->inputRepairChroma, "floatValue");
  v536 = v35;
  -[NSNumber floatValue](v2->inputRadiusRepair, "floatValue");
  v544 = v36;
  -[NSNumber floatValue](v2->inputRepairPercentile, "floatValue");
  v539 = v37;
  -[NSNumber floatValue](v2->inputRepairPercent, "floatValue");
  v39 = v38;
  -[NSNumber floatValue](v2->inputClipMin, "floatValue");
  v538 = v40;
  -[NSNumber floatValue](v2->inputCircularity, "floatValue");
  v537 = v41;
  -[NSNumber floatValue](v2->inputFalloffRepair, "floatValue");
  v543 = v42;
  -[NSNumber floatValue](v2->inputWhiteCutoff, "floatValue");
  v44 = v43;
  -[NSNumber floatValue](v2->inputSpecArea, "floatValue");
  v527 = v45;
  -[NSNumber floatValue](v2->inputSpecularCutoff, "floatValue");
  v546 = v46;
  -[NSNumber floatValue](v2->inputCentroidGamma, "floatValue");
  v48 = v47;
  -[NSNumber floatValue](v2->inputCentroidRadius, "floatValue");
  v50 = v49;
  -[NSNumber floatValue](v2->inputSpecIntensity, "floatValue");
  v533 = v51;
  -[NSNumber floatValue](v2->inputScleraThreshold, "floatValue");
  v505 = v52;
  -[NSNumber floatValue](v2->inputMinInterDispersion, "floatValue");
  v509 = v53;
  -[NSNumber floatValue](v2->inputMaxInterDispersion, "floatValue");
  v510 = v54;
  -[NSNumber floatValue](v2->inputMinMaskDiff, "floatValue");
  v511 = v55;
  -[NSNumber floatValue](v2->inputGlintThreshold, "floatValue");
  v502 = v56;
  v501 = v56;
  if (v56 <= 0.00001)
    v57 = v44;
  else
    v57 = 4.0;
  -[NSNumber floatValue](v2->inputTargetClosing, "floatValue");
  v506 = v58;
  if (v18 == 90)
  {
    v525 = v34 * 0.5;
    v523 = v39 + -0.02;
    v553 = v553 * 10.0;
    v57 = v57 * 0.5;
    v513 = 0.0;
    v514 = 1.0;
    v517 = 1.0;
    v64 = 1028443341;
    v546 = 0.0;
LABEL_16:
    v504 = 0.0;
    goto LABEL_18;
  }
  if (v18 == 35)
  {
    v525 = v34 * 0.3;
    v59 = v537 * 0.4;
    v517 = (float)(v14 + -35.0) / 55.0;
    v537 = interpolate(v59, v537 * 0.75, v517);
    v60 = v538 * 0.55;
    v538 = v60;
    v48 = v48 * 0.75;
    v523 = v39 * 0.95;
    v61 = v539 * 0.9;
    v539 = v61;
    v62 = v544 * 0.9;
    v544 = v62;
    v536 = v536 * 0.75;
    if ((float)(v32 + v32) <= 1.0)
      v32 = v32 + v32;
    else
      v32 = 1.0;
    v63 = v543 + 0.3;
    v543 = v63;
    v535 = 0.0;
    v514 = 2.0;
    v64 = 1036831949;
    v513 = 0.8;
    goto LABEL_16;
  }
  v517 = v14 / 35.0;
  -[NSNumber floatValue](v2->inputCentroidRadiusSmall, "floatValue");
  v50 = v65;
  v525 = v34 * 0.3;
  v537 = v537 * 0.25;
  v523 = v39 * 0.2;
  v66 = v539 * 0.9;
  v539 = v66;
  v67 = v534 * 0.2;
  v504 = v67;
  v544 = v544 * 0.75;
  v538 = v538 * 0.75;
  v32 = v32 * 0.75;
  v533 = v533 * 0.75;
  v68 = v543 + 0.2;
  v543 = v68;
  v536 = 0.0;
  v514 = 2.0;
  v64 = 1036831949;
  v513 = 0.8;
  v535 = 0.0;
  v534 = 0.0;
LABEL_18:
  if (v57 <= 1.0)
    v69 = v57;
  else
    v69 = 1.0;
  v70 = -[NSNumber BOOLValue](v2->inputUseFaceSegmentationMask, "BOOLValue");
  p_inputAxisShortRight = (CIImage *)&v2->inputAxisShortRight;
  p_inputAxisShortLeft = (CIImage *)&v2->inputAxisShortLeft;
  v507 = v32;
  v532 = v14;
  p_inputAxisLongLeft = &v2->inputAxisLongLeft;
  p_inputAxisLongRight = &v2->inputAxisLongRight;
  v520 = v50;
  v521 = v48;
  v519 = v64;
  LODWORD(v71) = 1.0;
  if (v70)
  {
    if (v18 == 90)
    {
      v550 = 1.0;
      v72 = &OBJC_IVAR___CIRedEyeRaw_inputSkinProtectionThresholdLarge;
      v73 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdSkinLarge;
      v74 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdScleraLarge;
      v75 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdIrisLarge;
      v76 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdSkinLarge;
      v77 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdScleraLarge;
      v78 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdIrisLarge;
    }
    else
    {
      v550 = 1.0;
      if (v18 == 35)
      {
        v72 = &OBJC_IVAR___CIRedEyeRaw_inputSkinProtectionThresholdMedium;
        v73 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdSkinMedium;
        v74 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdScleraMedium;
        v75 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdIrisMedium;
        v76 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdSkinMedium;
        v77 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdScleraMedium;
        v78 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdIrisMedium;
      }
      else
      {
        v72 = &OBJC_IVAR___CIRedEyeRaw_inputSkinProtectionThresholdSmall;
        v73 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdSkinSmall;
        v74 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdScleraSmall;
        v75 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdIrisSmall;
        v76 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdSkinSmall;
        v77 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdScleraSmall;
        v78 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdIrisSmall;
      }
    }
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v78), "floatValue", v71);
    v169 = v168;
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v77), "floatValue");
    v171 = v170;
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v76), "floatValue");
    v173 = v172;
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v75), "floatValue");
    v175 = v174;
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v74), "floatValue");
    v177 = v176;
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v73), "floatValue");
    v179 = v178;
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v72), "floatValue");
    v181 = v180;
    LODWORD(v182) = v169;
    LODWORD(v183) = v171;
    LODWORD(v184) = v173;
    v81 = -[CIRedEyeRaw irisProtectionMaskWithThresholdIris:thresholdSclera:thresholdSkin:](v2, "irisProtectionMaskWithThresholdIris:thresholdSclera:thresholdSkin:", v182, v183, v184);
    LODWORD(v185) = v175;
    LODWORD(v186) = v177;
    LODWORD(v187) = v179;
    v80 = -[CIRedEyeRaw irisProtectionMaskWithThresholdIris:thresholdSclera:thresholdSkin:](v2, "irisProtectionMaskWithThresholdIris:thresholdSclera:thresholdSkin:", v185, v186, v187);
    LODWORD(v188) = v181;
    v79 = -[CIRedEyeRaw skinProtectionMaskWithThreshold:](v2, "skinProtectionMaskWithThreshold:", v188);
    if (-[NSNumber intValue](v2->inputShowMask, "intValue") == 14)
    {
      v134 = -[CIImage imageByCroppingToRect:](v81, "imageByCroppingToRect:", v569, v566, v567, v568);
      v135 = v81;
      v164 = v563;
LABEL_111:
      v166 = v564;
      v165 = v565;
      v167 = v542;
      goto LABEL_149;
    }
    if (-[NSNumber intValue](v2->inputShowMask, "intValue") == 15)
    {
      v134 = -[CIImage imageByCroppingToRect:](v80, "imageByCroppingToRect:", v569, v566, v567, v568);
      v135 = v80;
LABEL_114:
      v164 = v563;
      v166 = v564;
      v165 = v565;
      v167 = v542;
      goto LABEL_149;
    }
    if (-[NSNumber intValue](v2->inputShowMask, "intValue") == 16)
    {
      v134 = -[CIImage imageByCroppingToRect:](v79, "imageByCroppingToRect:", v569, v566, v567, v568);
      v135 = v79;
      goto LABEL_114;
    }
  }
  else
  {
    v550 = 1.0;
    v79 = 0;
    v80 = 0;
    v81 = 0;
  }
  v516 = v79;
  v82 = dbl_192494550[v18 == 35] * v541;
  v83 = v529 * 0.015 * v540 * v528;
  v84 = -[NSNumber integerValue](v2->inputRepairSource, "integerValue");
  v85 = &OBJC_IVAR___CIRedEyeRaw_inputSecondary;
  if (!v84)
    v85 = &OBJC_IVAR___CIRedEyeRaw_inputPrimary;
  v86 = *(Class *)((char *)&v2->super.super.isa + *v85);
  v87 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_boost);
  objc_msgSend(v86, "extent");
  v647[0] = v86;
  v647[1] = &unk_1E2F1D9D8;
  inputPrimary = -[CIColorKernel applyWithExtent:arguments:](v87, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v647, 2), v88, v89, v90, v91);
  -[NSNumber floatValue](v2->inputMidSpectrumWhiteOffsetsX, "floatValue");
  v94 = v93;
  -[NSNumber floatValue](v2->inputMidSpectrumWhiteOffsetsY, "floatValue");
  v530 = v18;
  v494 = v69;
  v498 = inputPrimary;
  v496 = v80;
  v499 = v81;
  if (v18 == 90)
  {
    inputPrimary = v2->inputPrimary;
    -[NSNumber floatValue](v2->inputDetectWhite, "floatValue");
    v97 = v98;
    -[NSNumber floatValue](v2->inputDetectRed, "floatValue");
    v550 = v99;
  }
  else if (v18 == 35)
  {
    v96 = v94 + 0.3;
    v550 = interpolate(v96, v95 + 0.0, v517);
    v97 = interpolate(0.3, 0.7, v517);
  }
  else
  {
    v97 = 0.6272;
  }
  v100 = v523;
  v101 = 0;
  v102 = v82;
  v524 = v102;
  v103 = v83;
  v495 = v103;
  v104 = v527 * 0.1;
  v497 = v104;
  v105 = v525;
  v493 = v105;
  v106 = v100;
  v518 = v106;
  v107 = 1;
  v570 = v2;
  do
  {
    v108 = v107;
    if ((v107 & 1) != 0)
      v109 = v531;
    else
      v109 = v571;
    v110 = v109 * 0.0;
    -[NSNumber floatValue](v2->inputFlooding, "floatValue");
    v112 = (v111 + v111) * 0.5 * v109;
    v113 = v110 * 3.14159265 * v110;
    v114 = llroundf(v113);
    v115 = v112 * 3.14159265 * v112;
    v116 = llroundf(v115);
    v646[v101] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (double)v114, (double)v116);
    if (CI_LOG_DUALRED())
    {
      v117 = ci_logger_api();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "-[CIRedEyeRaw outputImage]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (int)v112;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v114;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v116;
        _os_log_error_impl(&dword_1921E4000, v117, OS_LOG_TYPE_ERROR, "%{public}s Convex area threshold range for radius %d = [%d, %d]", buf, 0x1Eu);
      }
    }
    v107 = 0;
    v101 = 1;
    v2 = v570;
  }
  while ((v108 & 1) != 0);
  v118 = (CIImage *)v646[0];
  v119 = (CIImage *)v646[1];
  v120 = v532 * 0.1;
  if (v18 == 90)
    v121 = RRrawRedWhiteResponseLarge(inputPrimary, v97, v550);
  else
    v121 = RRrawRedWhiteResponseSmallMedium(inputPrimary, v97, v550);
  v123 = v121;
  v124 = v563;
  *(float *)&v122 = v553;
  if (v553 > 0.0)
  {
    v125 = v120;
    v123 = RRcloseByDilation(v121, roundf(v553 * v125));
  }
  if (v79)
  {
    if (CI_LOG_DUALRED())
    {
      v126 = ci_logger_api();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        -[CIRedEyeRaw outputImage].cold.3(v126, v127, v128, v129, v130, v131, v132, v133);
    }
    v123 = RRmultiplyRh(v123, v499);
  }
  if (-[NSNumber intValue](v570->inputShowMask, "intValue", v122) == 1)
  {
    v134 = -[CIImage imageByCroppingToRect:](v123, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v123;
LABEL_79:
    v164 = v124;
    v166 = v564;
    v165 = v565;
    v167 = v542;
LABEL_149:
    v292 = objc_msgSend(v135, "imageByCroppingToRect:", v164, v165, v166, v167);
    v293 = (void *)v134;
    return (id)objc_msgSend(v293, "imageByCompositingOverImage:", v292);
  }
  v500 = v118;
  -[NSNumber floatValue](v570->inputCentroidIterations, "floatValue");
  v136 = (int)(float)(*(float *)&v137 * 5.0);
  *(float *)&v137 = v546;
  v526 = v123;
  if (v546 > 0.0)
  {
    v138 = RRspecularMask(v570->inputPrimary, v570->inputSecondary, v546, v513);
    v139 = v138;
    if (fabs(v514 + -1.0) > 0.01)
      v139 = -[CIImage _imageByApplyingGamma:](v138, "_imageByApplyingGamma:");
    v123 = RRmultiplyRh(v123, v139);
  }
  v515 = v120;
  -[NSNumber floatValue](v570->inputSearchLong, "floatValue", v137);
  v551 = v140;
  -[NSNumber floatValue](v570->inputSearchShort, "floatValue");
  v141 = 0;
  v547 = v142;
  v143 = 1;
  do
  {
    v144 = v143 & 1;
    if ((v143 & 1) != 0)
      v145 = v569;
    else
      v145 = v124;
    if ((v143 & 1) != 0)
      v146 = v566;
    else
      v146 = v565;
    if ((v143 & 1) != 0)
      v147 = v567;
    else
      v147 = v564;
    if ((v143 & 1) != 0)
      v148 = v568;
    else
      v148 = v542;
    v149 = &OBJC_IVAR___CIRedEyeRaw_inputPupilCenterRight;
    if (v144)
      v149 = &OBJC_IVAR___CIRedEyeRaw_inputPupilCenterLeft;
    v150 = *(uint64_t *)((char *)&v570->super.super.isa + *v149);
    v151 = p_inputAxisLongLeft;
    if (!v144)
      v151 = p_inputAxisLongRight;
    v152 = *v151;
    v153 = p_inputAxisShortLeft;
    if (!v144)
      v153 = p_inputAxisShortRight;
    isa = v153->super.isa;
    v643[0] = CFSTR("inputIterations");
    v644[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v136);
    v644[1] = &unk_1E2F1D9E8;
    v643[1] = CFSTR("inputScale");
    v643[2] = CFSTR("inputDecay");
    v644[2] = &unk_1E2F1D9F8;
    v643[3] = CFSTR("inputGamma");
    *(float *)&v155 = v521;
    v644[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v155);
    v643[4] = CFSTR("inputClip");
    LODWORD(v156) = v519;
    v644[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v156);
    v643[5] = CFSTR("inputLocalizationRadius");
    LODWORD(v157) = v520;
    v644[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v157);
    v643[6] = CFSTR("inputExtent");
    v158 = v146;
    v124 = v563;
    v644[6] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v145, v158, v147, v148);
    v643[7] = CFSTR("inputDebug");
    v644[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSNumber intValue](v570->inputShowMask, "intValue") == 2);
    v644[8] = v152;
    v643[8] = CFSTR("inputAxisLong");
    v643[9] = CFSTR("inputAxisShort");
    v644[9] = isa;
    v644[10] = v150;
    v643[10] = CFSTR("inputPupilCenter");
    v643[11] = CFSTR("inputSearchAxisLong");
    LODWORD(v159) = v551;
    v644[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v159);
    v643[12] = CFSTR("inputSearchAxisShort");
    LODWORD(v160) = v547;
    v644[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v160);
    v161 = -[CIImage imageByApplyingFilter:withInputParameters:](v123, "imageByApplyingFilter:withInputParameters:", CFSTR("RedPupilLocalizer"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v644, v643, 13));
    v143 = 0;
    v645[v141] = v161;
    v141 = 1;
  }
  while (v144);
  v163 = (objc_object *)v645[0];
  v162 = (CIImage *)v645[1];
  if (-[NSNumber intValue](v570->inputShowMask, "intValue") == 2)
  {
    v134 = -[objc_object imageByCroppingToRect:](v163, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v162;
    goto LABEL_79;
  }
  v189 = 0;
  v190 = 1;
  v192 = v566;
  v191 = v567;
  v548 = (CIImage *)v163;
  v552 = v162;
  do
  {
    v193 = v190;
    v194 = (v190 & 1) == 0;
    if ((v190 & 1) != 0)
    {
      v195 = v569;
    }
    else
    {
      v163 = (objc_object *)v162;
      v195 = v124;
    }
    if ((v190 & 1) != 0)
      v196 = v192;
    else
      v196 = v565;
    if ((v190 & 1) != 0)
      v197 = v191;
    else
      v197 = v564;
    if ((v190 & 1) != 0)
      v198 = v568;
    else
      v198 = v542;
    if ((v190 & 1) != 0)
      v199 = p_inputAxisLongLeft;
    else
      v199 = p_inputAxisLongRight;
    v200 = *v199;
    p_isa = (void **)&p_inputAxisShortLeft->super.isa;
    if (v194)
      p_isa = (void **)&p_inputAxisShortRight->super.isa;
    v202 = *p_isa;
    -[CIVector _norm](v200, "_norm");
    v204 = v203;
    objc_msgSend(v202, "_norm");
    v206 = v205;
    v207 = v205 / v204;
    v208 = stretch(v205 / v204, 0.0, 0.4, 0.25, 0.8);
    if (CI_LOG_DUALRED())
    {
      v209 = ci_logger_api();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "-[CIRedEyeRaw outputImage]";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v204;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v206;
        *(_WORD *)v641 = 2048;
        *(double *)&v641[2] = (float)(v207 * 100.0);
        *(_WORD *)&v641[10] = 2048;
        *(double *)&v641[12] = v208;
        _os_log_error_impl(&dword_1921E4000, v209, OS_LOG_TYPE_ERROR, "%{public}s Long %.2f | Short %.2f | Ratio %.0f | Conf %.2f", buf, 0x34u);
      }
    }
    v648.origin.x = v195;
    v648.origin.y = v196;
    v648.size.width = v197;
    v648.size.height = v198;
    v210 = RRradialEllipticalMask(v648, v200, v163, v544, v544 * v208, v543, 1.0);
    v211 = RRmultiplyRh(v526, v210);
    v190 = 0;
    v642[v189] = v211;
    v189 = 1;
    v124 = v563;
    v192 = v566;
    v191 = v567;
    v163 = (objc_object *)v548;
    v162 = v552;
  }
  while ((v193 & 1) != 0);
  v212 = (CIImage *)v642[0];
  v213 = (void *)v642[1];
  if (-[NSNumber intValue](v570->inputShowMask, "intValue") == 3)
  {
    v134 = -[CIImage imageByCroppingToRect:](v212, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v213;
    v164 = v563;
    goto LABEL_111;
  }
  v557 = v212;
  -[NSNumber floatValue](v570->inputRadiusSpecular, "floatValue");
  v215 = v214;
  v216 = -[NSNumber integerValue](v570->inputRepairSource, "integerValue");
  v217 = v498;
  if (!v216)
    v217 = v570->inputPrimary;
  v561 = RRspecularResponse(v217);
  v218 = 0;
  v219 = 1;
  do
  {
    v220 = v219 & 1;
    if ((v219 & 1) != 0)
      v221 = v548;
    else
      v221 = v552;
    v222 = v569;
    if (v220)
    {
      v223 = v566;
    }
    else
    {
      v222 = v563;
      v223 = v565;
    }
    if (v220)
      v224 = v567;
    else
      v224 = v564;
    if (v220)
      v225 = v568;
    else
      v225 = v542;
    v638[0] = v221;
    v637[0] = CFSTR("inputCenter");
    v637[1] = CFSTR("inputExtent");
    v226 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v222, v223, v224, v225);
    inputFalloffSpecular = v570->inputFalloffSpecular;
    v638[1] = v226;
    v638[2] = inputFalloffSpecular;
    v637[2] = CFSTR("inputFalloff");
    v637[3] = CFSTR("inputRadius");
    LODWORD(v228) = v215;
    v229 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v228);
    v637[4] = CFSTR("inputAnisotropic");
    v638[3] = v229;
    v638[4] = MEMORY[0x1E0C9AAA0];
    v230 = -[CIFilter outputImage](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("RadialFalloffFilter"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v638, v637, 5)), "outputImage");
    v219 = 0;
    v639[v218] = v230;
    v218 = 1;
  }
  while (v220);
  v231 = v639[1];
  v232 = RRmultiplyRh(v561, v639[0]);
  v233 = RRmultiplyRh(v561, v231);
  v234 = RRmaxRhScalar(v232, 0.001);
  v235 = RRmaxRhScalar(v233, 0.001);
  -[NSNumber floatValue](v570->inputCenterSpecRad, "floatValue");
  if (v236 <= 0.0)
  {
    v239 = v564;
    v240 = v565;
    v243 = v535;
    v241 = v542;
  }
  else
  {
    v237 = v236;
    v649.size.height = v568;
    v649.origin.x = v569;
    v649.origin.y = v566;
    v649.size.width = v567;
    v238 = RRradialMask(v570->inputPupilCenterLeft, v649, v237, -0.8, 1);
    v234 = RRmultiplyRh(v234, v238);
    v650.origin.x = v563;
    v239 = v564;
    v240 = v565;
    v650.origin.y = v565;
    v650.size.width = v564;
    v241 = v542;
    v650.size.height = v542;
    v242 = RRradialMask(v570->inputPupilCenterRight, v650, v237, -0.8, 1);
    v235 = RRmultiplyRh(v235, v242);
    v243 = v535;
  }
  if (-[NSNumber intValue](v570->inputShowMask, "intValue") == 6)
  {
    v134 = -[CIImage imageByCroppingToRect:](v234, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v235;
    v164 = v563;
    v165 = v240;
    v166 = v239;
LABEL_148:
    v167 = v241;
    goto LABEL_149;
  }
  v244 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v538, v243, v538, v243);
  -[CIVector X](v570->inputSize, "X");
  v246 = v245;
  -[CIVector Y](v570->inputSize, "Y");
  *(float *)&v247 = v246 * v247;
  v248 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, (double)(unint64_t)(float)(v497 * *(float *)&v247), 0.0, (double)(unint64_t)(float)(v497 * *(float *)&v247));
  *(_OWORD *)v641 = 0u;
  memset(buf, 0, sizeof(buf));
  CGAffineTransformMakeTranslation((CGAffineTransform *)buf, -(v563 - v569), -(v240 - v566));
  *(_OWORD *)&v579.a = *(_OWORD *)buf;
  *(_OWORD *)&v579.c = *(_OWORD *)&buf[16];
  *(_OWORD *)&v579.tx = *(_OWORD *)v641;
  memset(&v580, 0, sizeof(v580));
  CGAffineTransformInvert(&v580, &v579);
  v578[0] = *(_OWORD *)buf;
  v578[1] = *(_OWORD *)&buf[16];
  v578[2] = *(_OWORD *)v641;
  v249 = (CIImage *)objc_msgSend(v213, "imageByApplyingTransform:", v578);
  v577[0] = *(_OWORD *)buf;
  v577[1] = *(_OWORD *)&buf[16];
  v577[2] = *(_OWORD *)v641;
  v250 = -[CIImage imageByApplyingTransform:](v235, "imageByApplyingTransform:", v577);
  v576[0] = *(_OWORD *)buf;
  v576[1] = *(_OWORD *)&buf[16];
  v576[2] = *(_OWORD *)v641;
  v251 = -[CIImage imageByApplyingTransform:](v526, "imageByApplyingTransform:", v576);
  v252 = (CIImage *)v250;
  v253 = v570;
  v254 = v567;
  v255 = -[CIImage imageByCroppingToRect:](RRcombineRGBA(v557, v234, v249, v252), "imageByCroppingToRect:", v569, v566, v567, v568);
  v635[0] = CFSTR("inputPercentileRepair");
  *(float *)&v256 = v539;
  v636[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v256);
  v635[1] = CFSTR("inputPercentileSpecular");
  *(float *)&v257 = v534;
  v636[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v257);
  v635[2] = CFSTR("inputPercentRepair");
  *(float *)&v258 = v518;
  v636[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v258);
  v636[3] = &unk_1E2F1B788;
  inputInterPeakMin = v570->inputInterPeakMin;
  v635[3] = CFSTR("inputPercentSpecular");
  v635[4] = CFSTR("inputInterPeakMinRepair");
  v636[4] = inputInterPeakMin;
  v636[5] = v244;
  v635[5] = CFSTR("inputMinimum");
  v635[6] = CFSTR("inputMaxArea");
  inputSpecAreaScale = v570->inputSpecAreaScale;
  v636[6] = v248;
  v636[7] = inputSpecAreaScale;
  v635[7] = CFSTR("inputMaxAreaRatio");
  v635[8] = CFSTR("inputCenterLeft");
  v636[8] = v548;
  v636[9] = v552;
  v635[9] = CFSTR("inputCenterRight");
  v635[10] = CFSTR("inputCenterExtentLeft");
  v261 = v564;
  v241 = v542;
  v636[10] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v567, v568);
  v635[11] = CFSTR("inputCenterExtentRight");
  v636[11] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v563, v240, v564, v542);
  v635[12] = CFSTR("inputCenterOffsetLeft");
  v636[12] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v635[13] = CFSTR("inputCenterOffsetRight");
  v636[13] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v563 - v569, v240 - v566);
  v636[14] = &unk_1E2F1DA08;
  v635[14] = CFSTR("inputAbortMaxCenterDist");
  v635[15] = CFSTR("inputMinDensity");
  *(float *)&v262 = v524;
  v636[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v262);
  v635[16] = CFSTR("inputMaxRelDensity");
  LODWORD(v263) = v512;
  v264 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v263);
  inputFalloffDensity = v570->inputFalloffDensity;
  v636[16] = v264;
  v636[17] = inputFalloffDensity;
  v635[17] = CFSTR("inputDensityRadius");
  v635[18] = CFSTR("inputDetectionLeft");
  v636[18] = v526;
  v636[19] = v251;
  v635[19] = CFSTR("inputDetectionRight");
  v635[20] = CFSTR("inputMinInterDispersion");
  LODWORD(v266) = v509;
  v636[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v266);
  v635[21] = CFSTR("inputMaxInterDispersion");
  LODWORD(v267) = v510;
  v636[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v267);
  v635[22] = CFSTR("inputMinGobalLocalMeanDiff");
  LODWORD(v268) = v511;
  v269 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v268);
  v635[23] = CFSTR("inputTuning");
  inputParam2 = v570->inputParam2;
  v636[22] = v269;
  v636[23] = inputParam2;
  v271 = -[CIImage imageByApplyingFilter:withInputParameters:](v255, "imageByApplyingFilter:withInputParameters:", CFSTR("HistoClip_RGBA8_CPU"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v636, v635, 24));
  v272 = RRextractR8(v271);
  v273 = RRextractG8(v271);
  v274 = RRextractB8(v271);
  v575 = v580;
  v275 = -[CIImage imageByApplyingTransform:](v274, "imageByApplyingTransform:", &v575);
  v276 = RRextractA8(v271);
  v574 = v580;
  v277 = -[CIImage imageByApplyingTransform:](v276, "imageByApplyingTransform:", &v574);
  if (v516)
  {
    if (CI_LOG_DUALRED())
    {
      v278 = ci_logger_api();
      if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
        -[CIRedEyeRaw outputImage].cold.1(v278, v279, v280, v281, v282, v283, v284, v285);
    }
    v272 = RRminimumRh(v272, v496);
    v275 = RRminimumRh(v275, v496);
  }
  if (-[NSNumber intValue](v570->inputShowMask, "intValue") == 7)
  {
    v134 = -[CIImage imageByCroppingToRect:](v273, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = (void *)v277;
LABEL_147:
    v164 = v563;
    v165 = v565;
    v166 = v564;
    goto LABEL_148;
  }
  *(float *)&v286 = v508;
  if (v508 > 0.0)
  {
    v287 = roundf(v508 * v515);
    v288 = RRcloseByErosion(v272, v287);
    v289 = v287;
    v254 = v567;
    v290 = RRcloseByErosion(v275, v289);
    v272 = RRmaxIfGreaterThanZeroRh(v288, v272);
    v291 = v290;
    v253 = v570;
    v275 = RRmaxIfGreaterThanZeroRh(v291, v275);
  }
  if (-[NSNumber intValue](v253->inputShowMask, "intValue", v286) == 4)
  {
    v134 = -[CIImage imageByCroppingToRect:](v272, "imageByCroppingToRect:", v569, v566, v254, v568);
    v135 = v275;
    goto LABEL_147;
  }
  if (-[NSNumber intValue](v253->inputShowMask, "intValue") == 10)
  {
    v295 = v568;
    v296 = v254;
    v297 = RRbinarizeAlphaInverse(v253->inputPrimary, -[CIImage imageByClampingToExtent](v272, "imageByClampingToExtent"), 0.2);
    v298 = RRbinarizeAlphaInverse(v253->inputPrimary, -[CIImage imageByClampingToExtent](v275, "imageByClampingToExtent"), 0.2);
    v633 = CFSTR("inputExtent");
    v299 = v569;
    v634 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v296, v568);
    v300 = -[CIImage imageByApplyingFilter:withInputParameters:](v297, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v634, &v633, 1));
    v631 = CFSTR("inputExtent");
    v301 = v565;
    v632 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v563, v565, v564, v542);
    v302 = (void *)MEMORY[0x1E0C99D80];
    v303 = &v632;
    v304 = &v631;
LABEL_155:
    v306 = -[CIImage imageByApplyingFilter:withInputParameters:](v298, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(v302, "dictionaryWithObjects:forKeys:count:", v303, v304, 1));
    v307 = -[CIImage imageByUnpremultiplyingAlpha](v300, "imageByUnpremultiplyingAlpha");
    v308 = -[CIImage imageByUnpremultiplyingAlpha](v306, "imageByUnpremultiplyingAlpha");
    -[CIImage extent](v307, "extent");
    v309 = -[CIImage imageBySettingAlphaOneInExtent:](v307, "imageBySettingAlphaOneInExtent:");
    -[CIImage extent](v308, "extent");
    v310 = -[CIImage imageBySettingAlphaOneInExtent:](v308, "imageBySettingAlphaOneInExtent:");
    v311 = -[CIImage imageByClampingToExtent](v309, "imageByClampingToExtent");
    v312 = -[CIImage imageByClampingToExtent](v310, "imageByClampingToExtent");
    v313 = -[CIImage imageByCroppingToRect:](v311, "imageByCroppingToRect:", v299, v566, v296, v295);
    v314 = (void *)v312;
    v315 = v563;
    v316 = v301;
LABEL_161:
    v292 = objc_msgSend(v314, "imageByCroppingToRect:", v315, v316, v564, v542);
    v293 = (void *)v313;
    return (id)objc_msgSend(v293, "imageByCompositingOverImage:", v292);
  }
  if (-[NSNumber intValue](v253->inputShowMask, "intValue") == 11)
  {
    v295 = v568;
    v296 = v254;
    v305 = RRbinarizeAlpha(v253->inputPrimary, -[CIImage imageByClampingToExtent](v272, "imageByClampingToExtent"), 0.2);
    v298 = RRbinarizeAlpha(v253->inputPrimary, -[CIImage imageByClampingToExtent](v275, "imageByClampingToExtent"), 0.2);
    v629 = CFSTR("inputExtent");
    v299 = v569;
    v630 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v296, v568);
    v300 = -[CIImage imageByApplyingFilter:withInputParameters:](v305, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v630, &v629, 1));
    v627 = CFSTR("inputExtent");
    v301 = v565;
    v628 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v563, v565, v564, v542);
    v302 = (void *)MEMORY[0x1E0C99D80];
    v303 = &v628;
    v304 = &v627;
    goto LABEL_155;
  }
  if (-[NSNumber intValue](v253->inputShowMask, "intValue") == 12)
  {
    v317 = RRbinarize(v272);
    v318 = RRbinarize(v275);
    v319 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor blackColor](CIColor, "blackColor"));
    v320 = v253;
    v321 = v253->inputPrimary;
    v625[0] = CFSTR("inputBackgroundImage");
    v625[1] = CFSTR("inputMaskImage");
    v626[0] = v319;
    v626[1] = v317;
    v322 = -[CIImage imageByApplyingFilter:withInputParameters:](v321, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlendWithRedMask"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v626, v625, 2));
    v323 = v320->inputPrimary;
    v623[0] = CFSTR("inputBackgroundImage");
    v623[1] = CFSTR("inputMaskImage");
    v624[0] = v319;
    v624[1] = v318;
    v324 = (void *)MEMORY[0x1E0C99D80];
    v325 = v624;
    v326 = v623;
LABEL_160:
    v333 = -[CIImage imageByApplyingFilter:withInputParameters:](v323, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlendWithRedMask"), objc_msgSend(v324, "dictionaryWithObjects:forKeys:count:", v325, v326, 2));
    v313 = -[CIImage imageByCroppingToRect:](v322, "imageByCroppingToRect:", v569, v566, v254, v568);
    v314 = (void *)v333;
    v315 = v563;
    v316 = v565;
    goto LABEL_161;
  }
  if (-[NSNumber intValue](v253->inputShowMask, "intValue") == 13)
  {
    v328 = RRbinarizeInverse(v272);
    v329 = RRbinarizeInverse(v275);
    v330 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor blackColor](CIColor, "blackColor"));
    v331 = v253;
    v332 = v253->inputPrimary;
    v621[0] = CFSTR("inputBackgroundImage");
    v621[1] = CFSTR("inputMaskImage");
    v622[0] = v330;
    v622[1] = v328;
    v322 = -[CIImage imageByApplyingFilter:withInputParameters:](v332, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlendWithRedMask"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v622, v621, 2));
    v323 = v331->inputPrimary;
    v619[0] = CFSTR("inputBackgroundImage");
    v619[1] = CFSTR("inputMaskImage");
    v620[0] = v330;
    v620[1] = v329;
    v324 = (void *)MEMORY[0x1E0C99D80];
    v325 = v620;
    v326 = v619;
    goto LABEL_160;
  }
  if (v530 == 35)
  {
    v335 = &OBJC_IVAR___CIRedEyeRaw_inputSkinThresholdMed;
    v334 = v565;
    goto LABEL_166;
  }
  LODWORD(v327) = 1.0;
  v334 = v565;
  if (v530 == 90)
  {
    v335 = &OBJC_IVAR___CIRedEyeRaw_inputSkinThreshold;
LABEL_166:
    objc_msgSend(*(id *)((char *)&v253->super.super.isa + *v335), "floatValue", v327);
  }
  v545 = *(float *)&v327;
  v558 = v273;
  v562 = v275;
  v555 = (void *)v277;
  v336 = 0;
  v337 = 1;
  do
  {
    v338 = v337;
    if ((v337 & 1) != 0)
      v339 = v569;
    else
      v339 = v563;
    if ((v337 & 1) != 0)
      v340 = v566;
    else
      v340 = v334;
    if ((v337 & 1) != 0)
      v341 = v567;
    else
      v341 = v261;
    if ((v337 & 1) != 0)
      v342 = v568;
    else
      v342 = v542;
    if ((v337 & 1) != 0)
      v343 = v500;
    else
      v343 = v119;
    if ((v337 & 1) != 0)
      v344 = v272;
    else
      v344 = v275;
    if ((v337 & 1) != 0)
      v345 = v548;
    else
      v345 = v552;
    v616[0] = CFSTR("inputExtent");
    -[CIImage extent](v344, "extent");
    v346 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v616[1] = CFSTR("inputCentroid");
    v617[0] = v346;
    v617[1] = v345;
    v347 = RRconditionalZero(v344, -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v344, "imageByApplyingFilter:withInputParameters:", CFSTR("CICircularityDescriptor"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v617, v616, 2)), "imageByClampingToExtent"), v537);
    v614[0] = CFSTR("inputCenter");
    v614[1] = CFSTR("inputThreshold");
    v615[0] = v345;
    v615[1] = &unk_1E2F1B7A0;
    v615[2] = v343;
    v614[2] = CFSTR("inputAreaThresholdLoHi");
    v614[3] = CFSTR("inputSplat");
    *(float *)&v348 = v495;
    v615[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v348);
    v349 = -[CIImage imageByApplyingFilter:withInputParameters:](v347, "imageByApplyingFilter:withInputParameters:", CFSTR("CIConvexFill"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v615, v614, 4));
    -[NSNumber floatValue](v570->inputGamma, "floatValue");
    if (v350 > 0.0 && fabs(v350 + -1.0) > 0.001)
    {
      v351 = -[CIImage _imageByApplyingGamma:](v349, "_imageByApplyingGamma:");
      -[NSNumber floatValue](v570->inputCutoff, "floatValue");
      v349 = RRsmoothstep(v351, v352);
    }
    v353 = -[CIImage imageByCroppingToRect:](v349, "imageByCroppingToRect:", v339, v340, v341, v342);
    v337 = 0;
    v618[v336] = v353;
    v336 = 1;
    v261 = v564;
    v334 = v565;
  }
  while ((v338 & 1) != 0);
  v354 = (CIImage *)v618[0];
  v355 = (CIImage *)v618[1];
  if (v516)
  {
    v356 = v542;
    v357 = v567;
    v359 = v555;
    v358 = v558;
    if (CI_LOG_DUALRED())
    {
      v360 = ci_logger_api();
      if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
        -[CIRedEyeRaw outputImage].cold.1(v360, v361, v362, v363, v364, v365, v366, v367);
    }
    v354 = RRminimumRh(v354, v516);
    v355 = RRminimumRh(v355, v516);
  }
  else
  {
    v356 = v542;
    v357 = v567;
    v359 = v555;
    v358 = v558;
  }
  if (v357 >= v568)
    v368 = v568;
  else
    v368 = v357;
  v369 = v368;
  if (v564 >= v356)
    v370 = v356;
  else
    v370 = v564;
  v371 = v370;
  -[NSNumber floatValue](v570->inputFeathering, "floatValue");
  v651.size.width = v357;
  v373 = v372;
  v651.origin.x = v569;
  v651.origin.y = v566;
  v651.size.height = v568;
  v374 = feather(v354, v651, v369, v373, 0.5);
  v652.origin.x = v563;
  v652.origin.y = v565;
  v652.size.width = v564;
  v652.size.height = v356;
  v375 = feather(v355, v652, v371, v373, 0.5);
  -[NSNumber floatValue](v570->inputRefilterSpace, "floatValue");
  v377 = 50.0;
  if ((float)(v532 * v376) <= 50.0)
  {
    -[NSNumber floatValue](v570->inputRefilterSpace, "floatValue");
    v377 = v532 * v378;
  }
  -[NSNumber floatValue](v570->inputRefilterRange, "floatValue");
  v380 = v379 * 0.1;
  if (v530 == 90)
  {
    v380 = v380 * 1.5;
    v381 = 2.5;
    v382 = v563;
  }
  else
  {
    v381 = 1.0;
    v382 = v563;
    if (v530 == 35)
    {
      v380 = v380 * 5.0;
      v377 = v377 * 1.5;
      v383 = -[CIImage _imageByApplyingGamma:](refilterChannel(v570->inputPrimary), "_imageByApplyingGamma:", 0.400000006);
      goto LABEL_212;
    }
  }
  v383 = -[CIImage _imageByApplyingGamma:](v526, "_imageByApplyingGamma:", v381);
LABEL_212:
  v384 = v383;
  v385 = refilter(v374, v383, v377, v380);
  v386 = refilter(v375, v384, v377, v380);
  v387 = v570;
  -[NSNumber floatValue](v570->inputFSmooth, "floatValue");
  v389 = v388;
  v653.origin.x = v569;
  v653.origin.y = v566;
  v653.size.width = v567;
  v653.size.height = v568;
  v390 = feather(v385, v653, v369, 0.0, v389);
  v654.origin.x = v382;
  v654.origin.y = v565;
  v654.size.width = v564;
  v391 = v542;
  v654.size.height = v542;
  v392 = feather(v386, v654, v371, 0.0, v389);
  if (v545 >= 1.0)
  {
    v396 = 0x1E0C99000uLL;
  }
  else
  {
    v655.origin.x = v569;
    v655.origin.y = v566;
    v655.size.width = v567;
    v655.size.height = v568;
    v393 = chromaExclusion(v570->inputPrimary, v272, v655, v545, 0.2, v505, 0.35);
    v656.origin.x = v382;
    v656.origin.y = v565;
    v656.size.width = v564;
    v656.size.height = v542;
    v394 = v392;
    v395 = chromaExclusion(v570->inputPrimary, v562, v656, v545, 0.2, v505, 0.35);
    v390 = RRmultiplyRh(v390, v393);
    v387 = v570;
    v392 = RRmultiplyRh(v394, v395);
    v396 = 0x1E0C99000;
  }
  v397 = v565;
  if (-[NSNumber intValue](v387->inputShowMask, "intValue") == 5)
  {
    v134 = -[CIImage imageByCroppingToRect:](v390, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v392;
LABEL_230:
    v164 = v563;
LABEL_231:
    v165 = v397;
    v166 = v564;
    v167 = v391;
    goto LABEL_149;
  }
  v398 = v566;
  v399 = v569;
  v559 = v392;
  if (v504 <= 0.0)
  {
    *(float *)&v399 = v503;
    if (v503 > 0.0)
    {
      v409 = v532 * 0.5 * v503;
      v410 = v409;
      v612 = CFSTR("inputRadius");
      *(float *)&v409 = v410;
      v613 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v409);
      v411 = -[CIImage imageByApplyingFilter:withInputParameters:](v358, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyMaximum"), objc_msgSend(*(id *)(v396 + 3456), "dictionaryWithObjects:forKeys:count:", &v613, &v612, 1));
      v610 = CFSTR("inputRadius");
      *(float *)&v412 = v410;
      v611 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v412);
      v358 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v411, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyMinimum"), objc_msgSend(*(id *)(v396 + 3456), "dictionaryWithObjects:forKeys:count:", &v611, &v610, 1)), "imageByCroppingToRect:", v569, v566, v567, v568);
      v608 = CFSTR("inputRadius");
      *(float *)&v413 = v410;
      v609 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v413);
      v414 = (void *)objc_msgSend(v359, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyMaximum"), objc_msgSend(*(id *)(v396 + 3456), "dictionaryWithObjects:forKeys:count:", &v609, &v608, 1));
      v606 = CFSTR("inputRadius");
      *(float *)&v415 = v410;
      v607 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v415);
      v359 = (void *)objc_msgSend((id)objc_msgSend(v414, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyMinimum"), objc_msgSend(*(id *)(v396 + 3456), "dictionaryWithObjects:forKeys:count:", &v607, &v606, 1)), "imageByCroppingToRect:", v563, v565, v564, v542);
    }
    v604 = CFSTR("inputRadius");
    v605 = &unk_1E2F1D9D8;
    v407 = -[CIImage imageByApplyingFilter:withInputParameters:](v358, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(*(id *)(v396 + 3456), "dictionaryWithObjects:forKeys:count:", &v605, &v604, 1, v399));
    v602 = CFSTR("inputRadius");
    v603 = &unk_1E2F1D9D8;
    v408 = (CIImage *)objc_msgSend(v359, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(*(id *)(v396 + 3456), "dictionaryWithObjects:forKeys:count:", &v603, &v602, 1));
    v387 = v570;
  }
  else
  {
    if (v531 <= v571)
      v400 = v571;
    else
      v400 = v531;
    v401 = 2.0 / v400;
    if (v401 >= v504)
    {
      v402 = v401;
      v403 = v402;
    }
    else
    {
      v403 = v504;
    }
    v404 = v566;
    v405 = v567;
    v406 = v568;
    v407 = RRradialCenterMask(v548, *(CGRect *)&v399, v400, v403, -0.5);
    v657.origin.x = v563;
    v657.origin.y = v565;
    v657.size.width = v564;
    v657.size.height = v542;
    v408 = RRradialCenterMask(v552, v657, v400, v403, -0.5);
  }
  v416 = RRmultiplyRh(v407, v390);
  v417 = RRmultiplyRh(v408, v392);
  if (-[NSNumber intValue](v387->inputShowMask, "intValue") == 8)
  {
    v134 = -[CIImage imageByCroppingToRect:](v416, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v417;
    goto LABEL_230;
  }
  v549 = v416;
  v418 = 0;
  v419 = 1;
  v420 = v563;
  do
  {
    LOBYTE(v571) = v419;
    if ((v419 & 1) != 0)
      v421 = v390;
    else
      v421 = v559;
    if ((v419 & 1) != 0)
      v420 = v569;
    v422 = v397;
    if ((v419 & 1) != 0)
      v423 = v398;
    else
      v423 = v397;
    if ((v419 & 1) != 0)
      v424 = v567;
    else
      v424 = v564;
    v425 = v391;
    if ((v419 & 1) != 0)
      v391 = v568;
    v426 = v387->inputPrimary;
    if (v506 > 0.0)
    {
      v599 = CFSTR("inputRadius");
      v600 = &unk_1E2F1D9D8;
      v427 = -[CIImage imageByApplyingFilter:withInputParameters:](v426, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v600, &v599, 1));
      v597 = CFSTR("inputRadius");
      v598 = &unk_1E2F1D9D8;
      v428 = -[CIImage imageByApplyingFilter:withInputParameters:](v427, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v598, &v597, 1));
      v595 = CFSTR("inputRadius");
      *(float *)&v429 = v506;
      v596 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v429);
      v426 = -[CIImage imageByApplyingFilter:withInputParameters:](v428, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyMinimum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v596, &v595, 1));
    }
    v593 = CFSTR("inputRadius");
    v594 = &unk_1E2F1D9D8;
    v430 = -[CIImage imageByApplyingFilter:withInputParameters:](v426, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v594, &v593, 1));
    v591 = CFSTR("inputRadius");
    v592 = &unk_1E2F1D9D8;
    v431 = -[CIImage imageByApplyingFilter:withInputParameters:](v430, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v592, &v591, 1));
    v387 = v570;
    v432 = v570->inputPrimary;
    v589[0] = CFSTR("inputSource");
    v589[1] = CFSTR("inputMask");
    v590[0] = v432;
    v590[1] = v421;
    v589[2] = CFSTR("inputNoiseAmount");
    *(float *)&v433 = v493;
    v590[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v433);
    v589[3] = CFSTR("inputBrightness");
    *(float *)&v434 = v507;
    v435 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v434);
    inputRecover = v570->inputRecover;
    v590[3] = v435;
    v590[4] = inputRecover;
    v589[4] = CFSTR("inputRecovery");
    v589[5] = CFSTR("inputExtent");
    v590[5] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v420, v423, v424, v391);
    v589[6] = CFSTR("inputWhiteCutoff");
    *(float *)&v437 = v494;
    v590[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v437);
    v589[7] = CFSTR("inputChroma");
    *(float *)&v438 = v536;
    v590[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v438);
    v439 = -[CIImage imageByApplyingFilter:withInputParameters:](v431, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeRecolor"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v590, v589, 8));
    v419 = 0;
    v601[v418] = v439;
    v418 = 1;
    v420 = v563;
    v398 = v566;
    v391 = v425;
    v397 = v422;
  }
  while ((LOBYTE(v571) & 1) != 0);
  v440 = (void *)v601[0];
  v441 = (void *)v601[1];
  if (-[NSNumber intValue](v570->inputShowMask, "intValue") == 9)
  {
    v134 = objc_msgSend(v440, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v441;
    v164 = v563;
    goto LABEL_231;
  }
  v443 = 0;
  v444 = 1;
  do
  {
    v445 = v444;
    if ((v444 & 1) != 0)
      v446 = v440;
    else
      v446 = v441;
    if (v501 <= 0.00001)
    {
      v465 = v417;
      if ((v445 & 1) != 0)
        v465 = v549;
      inputSecondary = v570->inputSecondary;
      v585[0] = CFSTR("inputSource");
      v585[1] = CFSTR("inputSpecularMask");
      v586[0] = inputSecondary;
      v586[1] = v465;
      v586[2] = &unk_1E2F1DA18;
      v585[2] = CFSTR("inputSpecularThreshold");
      v585[3] = CFSTR("inputSpecIntensity");
      *(float *)&v442 = v533;
      v467 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v442);
      v585[4] = CFSTR("inputDebugFlag");
      v586[3] = v467;
      v586[4] = &unk_1E2F1B7B8;
      v464 = objc_msgSend(v446, "imageByApplyingFilter:withInputParameters:", CFSTR("RedEyeSpecular"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v586, v585, 5));
    }
    else
    {
      v447 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_rer_glint);
      -[CIImage extent](v570->inputPrimary, "extent");
      v449 = v448;
      v451 = v450;
      v453 = v452;
      v455 = v454;
      objc_msgSend(v446, "extent");
      v660.origin.x = v456;
      v660.origin.y = v457;
      v660.size.width = v458;
      v660.size.height = v459;
      v658.origin.x = v449;
      v658.origin.y = v451;
      v658.size.width = v453;
      v658.size.height = v455;
      v659 = CGRectUnion(v658, v660);
      x = v659.origin.x;
      y = v659.origin.y;
      width = v659.size.width;
      height = v659.size.height;
      v587[0] = v570->inputPrimary;
      v587[1] = v446;
      *(float *)&v659.origin.x = v502;
      v587[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v659.origin.x);
      v464 = -[CIColorKernel applyWithExtent:arguments:](v447, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v587, 3), x, y, width, height);
    }
    v444 = 0;
    v588[v443] = v464;
    v443 = 1;
  }
  while ((v445 & 1) != 0);
  v468 = (CIImage *)v588[0];
  v469 = (CIImage *)v588[1];
  -[NSNumber floatValue](v570->inputIntersect, "floatValue");
  if (v470 > 0.0)
  {
    -[NSNumber floatValue](v570->inputIntersect, "floatValue");
    v472 = v471;
    memset(&v573, 0, sizeof(v573));
    CGAffineTransformMakeTranslation(&v573, v569 - v563, v566 - v565);
    v572 = v573;
    v473 = RRmultiplyRh(v390, -[CIImage imageByApplyingTransform:](v559, "imageByApplyingTransform:", &v572));
    v583 = CFSTR("inputExtent");
    v584 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v567, v568);
    v474 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v473, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v584, &v583, 1)), "imageByClampingToExtent");
    v475 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_threshold);
    -[CIImage extent](v468, "extent");
    v477 = v476;
    v479 = v478;
    v481 = v480;
    v483 = v482;
    v582[0] = v468;
    v582[1] = v474;
    LODWORD(v476) = v472;
    v582[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v476);
    v468 = -[CIColorKernel applyWithExtent:arguments:](v475, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v582, 3), v477, v479, v481, v483);
    -[CIImage extent](v469, "extent");
    v485 = v484;
    v487 = v486;
    v489 = v488;
    v491 = v490;
    v581[0] = v469;
    v581[1] = v474;
    LODWORD(v484) = v472;
    v581[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v484);
    v469 = -[CIColorKernel applyWithExtent:arguments:](v475, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v581, 3), v485, v487, v489, v491);
  }
  v492 = (void *)objc_msgSend((id)objc_msgSend(-[CIImage _imageByRenderingToIntermediate](v468, "_imageByRenderingToIntermediate"), "imageByCroppingToRect:", v569, v566, v567, v568), "imageByCompositingOverImage:", objc_msgSend(-[CIImage _imageByRenderingToIntermediate](v469, "_imageByRenderingToIntermediate"), "imageByCroppingToRect:", v563, v565, v564, v542));
  -[CIImage extent](v570->inputPrimary, "extent");
  return (id)objc_msgSend(v492, "imageByCroppingToRect:");
}

- (CIImage)inputPrimary
{
  return self->inputPrimary;
}

- (void)setInputPrimary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputSecondary
{
  return self->inputSecondary;
}

- (void)setInputSecondary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputOriginLeft
{
  return self->inputOriginLeft;
}

- (void)setInputOriginLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputOriginRight
{
  return self->inputOriginRight;
}

- (void)setInputOriginRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CIVector)inputAxisShortLeft
{
  return self->inputAxisShortLeft;
}

- (void)setInputAxisShortLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CIVector)inputAxisShortRight
{
  return self->inputAxisShortRight;
}

- (void)setInputAxisShortRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (CIVector)inputAxisLongLeft
{
  return self->inputAxisLongLeft;
}

- (void)setInputAxisLongLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (CIVector)inputAxisLongRight
{
  return self->inputAxisLongRight;
}

- (void)setInputAxisLongRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (CIVector)inputPupilCenterLeft
{
  return self->inputPupilCenterLeft;
}

- (void)setInputPupilCenterLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (CIVector)inputPupilCenterRight
{
  return self->inputPupilCenterRight;
}

- (void)setInputPupilCenterRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSNumber)inputOrientationHint
{
  return self->inputOrientationHint;
}

- (void)setInputOrientationHint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSNumber)inputOrientationScale
{
  return self->inputOrientationScale;
}

- (void)setInputOrientationScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSNumber)inputRepairSource
{
  return self->inputRepairSource;
}

- (void)setInputRepairSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSNumber)inputRepairDarken
{
  return self->inputRepairDarken;
}

- (void)setInputRepairDarken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSNumber)inputRepairChroma
{
  return self->inputRepairChroma;
}

- (void)setInputRepairChroma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSNumber)inputCutoff
{
  return self->inputCutoff;
}

- (void)setInputCutoff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSNumber)inputSpecMin
{
  return self->inputSpecMin;
}

- (void)setInputSpecMin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NSNumber)inputSpecMax
{
  return self->inputSpecMax;
}

- (void)setInputSpecMax:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (NSNumber)inputSpecular
{
  return self->inputSpecular;
}

- (void)setInputSpecular:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (NSNumber)inputSpecIntensity
{
  return self->inputSpecIntensity;
}

- (void)setInputSpecIntensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSNumber)inputShowMask
{
  return self->inputShowMask;
}

- (void)setInputShowMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (NSNumber)inputRepairPercent
{
  return self->inputRepairPercent;
}

- (void)setInputRepairPercent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (NSNumber)inputInterPeakMin
{
  return self->inputInterPeakMin;
}

- (void)setInputInterPeakMin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSNumber)inputRepairPercentile
{
  return self->inputRepairPercentile;
}

- (void)setInputRepairPercentile:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (NSNumber)inputClipMin
{
  return self->inputClipMin;
}

- (void)setInputClipMin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (NSNumber)inputMidSpectrumWhiteOffsetsX
{
  return self->inputMidSpectrumWhiteOffsetsX;
}

- (void)setInputMidSpectrumWhiteOffsetsX:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (NSNumber)inputMidSpectrumWhiteOffsetsY
{
  return self->inputMidSpectrumWhiteOffsetsY;
}

- (void)setInputMidSpectrumWhiteOffsetsY:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (NSNumber)inputClosingErosion
{
  return self->inputClosingErosion;
}

- (void)setInputClosingErosion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (NSNumber)inputClosingDilation
{
  return self->inputClosingDilation;
}

- (void)setInputClosingDilation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (NSNumber)inputSplat
{
  return self->inputSplat;
}

- (void)setInputSplat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (NSNumber)inputFlooding
{
  return self->inputFlooding;
}

- (void)setInputFlooding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (NSNumber)inputGamma
{
  return self->inputGamma;
}

- (void)setInputGamma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (NSNumber)inputFeathering
{
  return self->inputFeathering;
}

- (void)setInputFeathering:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSNumber)inputFSmooth
{
  return self->inputFSmooth;
}

- (void)setInputFSmooth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (NSNumber)inputRepairDither
{
  return self->inputRepairDither;
}

- (void)setInputRepairDither:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (NSNumber)inputRecover
{
  return self->inputRecover;
}

- (void)setInputRecover:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (NSNumber)inputSpecArea
{
  return self->inputSpecArea;
}

- (void)setInputSpecArea:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (NSNumber)inputSpecAreaScale
{
  return self->inputSpecAreaScale;
}

- (void)setInputSpecAreaScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (NSNumber)inputWhiteCutoff
{
  return self->inputWhiteCutoff;
}

- (void)setInputWhiteCutoff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (NSNumber)inputSpecularCutoff
{
  return self->inputSpecularCutoff;
}

- (void)setInputSpecularCutoff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (NSNumber)inputAbortDensityLo
{
  return self->inputAbortDensityLo;
}

- (void)setInputAbortDensityLo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (NSNumber)inputAbortDensityDiff
{
  return self->inputAbortDensityDiff;
}

- (void)setInputAbortDensityDiff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (NSNumber)inputCircularity
{
  return self->inputCircularity;
}

- (void)setInputCircularity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (NSNumber)inputIntersect
{
  return self->inputIntersect;
}

- (void)setInputIntersect:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (NSNumber)inputSkinThreshold
{
  return self->inputSkinThreshold;
}

- (void)setInputSkinThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (NSNumber)inputSkinThresholdMed
{
  return self->inputSkinThresholdMed;
}

- (void)setInputSkinThresholdMed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (NSNumber)inputScleraThreshold
{
  return self->inputScleraThreshold;
}

- (void)setInputScleraThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (NSNumber)inputCenterSpecRad
{
  return self->inputCenterSpecRad;
}

- (void)setInputCenterSpecRad:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (NSNumber)inputFalloffDensity
{
  return self->inputFalloffDensity;
}

- (void)setInputFalloffDensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (NSNumber)inputFalloffRepair
{
  return self->inputFalloffRepair;
}

- (void)setInputFalloffRepair:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (NSNumber)inputFalloffSpecular
{
  return self->inputFalloffSpecular;
}

- (void)setInputFalloffSpecular:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (NSNumber)inputRadiusRepair
{
  return self->inputRadiusRepair;
}

- (void)setInputRadiusRepair:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 496);
}

- (NSNumber)inputRadiusDensity
{
  return self->inputRadiusDensity;
}

- (void)setInputRadiusDensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (NSNumber)inputRadiusSpecular
{
  return self->inputRadiusSpecular;
}

- (void)setInputRadiusSpecular:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (NSNumber)inputCentroidIterations
{
  return self->inputCentroidIterations;
}

- (void)setInputCentroidIterations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (NSNumber)inputCentroidGamma
{
  return self->inputCentroidGamma;
}

- (void)setInputCentroidGamma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (NSNumber)inputCentroidRadius
{
  return self->inputCentroidRadius;
}

- (void)setInputCentroidRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (NSNumber)inputCentroidRadiusSmall
{
  return self->inputCentroidRadiusSmall;
}

- (void)setInputCentroidRadiusSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (NSNumber)inputSearchLong
{
  return self->inputSearchLong;
}

- (void)setInputSearchLong:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (NSNumber)inputSearchShort
{
  return self->inputSearchShort;
}

- (void)setInputSearchShort:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

- (NSNumber)inputParam
{
  return self->inputParam;
}

- (void)setInputParam:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 576);
}

- (NSNumber)inputParam2
{
  return self->inputParam2;
}

- (void)setInputParam2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 584);
}

- (NSNumber)inputParam3
{
  return self->inputParam3;
}

- (void)setInputParam3:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 592);
}

- (NSNumber)inputParam4
{
  return self->inputParam4;
}

- (void)setInputParam4:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 600);
}

- (NSNumber)inputRefilterSpace
{
  return self->inputRefilterSpace;
}

- (void)setInputRefilterSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 608);
}

- (NSNumber)inputRefilterRange
{
  return self->inputRefilterRange;
}

- (void)setInputRefilterRange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 616);
}

- (NSNumber)inputDetectWhite
{
  return self->inputDetectWhite;
}

- (void)setInputDetectWhite:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 624);
}

- (NSNumber)inputDetectRed
{
  return self->inputDetectRed;
}

- (void)setInputDetectRed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 632);
}

- (NSNumber)inputMinInterDispersion
{
  return self->inputMinInterDispersion;
}

- (void)setInputMinInterDispersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 640);
}

- (NSNumber)inputMaxInterDispersion
{
  return self->inputMaxInterDispersion;
}

- (void)setInputMaxInterDispersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 648);
}

- (NSNumber)inputMinMaskDiff
{
  return self->inputMinMaskDiff;
}

- (void)setInputMinMaskDiff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 656);
}

- (NSNumber)inputGlintThreshold
{
  return self->inputGlintThreshold;
}

- (void)setInputGlintThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 664);
}

- (NSNumber)inputTargetClosing
{
  return self->inputTargetClosing;
}

- (void)setInputTargetClosing:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 672);
}

- (NSNumber)inputUseFaceSegmentationMask
{
  return self->inputUseFaceSegmentationMask;
}

- (void)setInputUseFaceSegmentationMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 680);
}

- (NSNumber)inputDetectionThresholdIrisSmall
{
  return self->inputDetectionThresholdIrisSmall;
}

- (void)setInputDetectionThresholdIrisSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 688);
}

- (NSNumber)inputDetectionThresholdScleraSmall
{
  return self->inputDetectionThresholdScleraSmall;
}

- (void)setInputDetectionThresholdScleraSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 696);
}

- (NSNumber)inputDetectionThresholdSkinSmall
{
  return self->inputDetectionThresholdSkinSmall;
}

- (void)setInputDetectionThresholdSkinSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 704);
}

- (NSNumber)inputScleraProtectionThresholdIrisSmall
{
  return self->inputScleraProtectionThresholdIrisSmall;
}

- (void)setInputScleraProtectionThresholdIrisSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 712);
}

- (NSNumber)inputScleraProtectionThresholdScleraSmall
{
  return self->inputScleraProtectionThresholdScleraSmall;
}

- (void)setInputScleraProtectionThresholdScleraSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 720);
}

- (NSNumber)inputScleraProtectionThresholdSkinSmall
{
  return self->inputScleraProtectionThresholdSkinSmall;
}

- (void)setInputScleraProtectionThresholdSkinSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 728);
}

- (NSNumber)inputSkinProtectionThresholdSmall
{
  return self->inputSkinProtectionThresholdSmall;
}

- (void)setInputSkinProtectionThresholdSmall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 736);
}

- (NSNumber)inputDetectionThresholdIrisMedium
{
  return self->inputDetectionThresholdIrisMedium;
}

- (void)setInputDetectionThresholdIrisMedium:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 744);
}

- (NSNumber)inputDetectionThresholdScleraMedium
{
  return self->inputDetectionThresholdScleraMedium;
}

- (void)setInputDetectionThresholdScleraMedium:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 752);
}

- (NSNumber)inputDetectionThresholdSkinMedium
{
  return self->inputDetectionThresholdSkinMedium;
}

- (void)setInputDetectionThresholdSkinMedium:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 760);
}

- (NSNumber)inputScleraProtectionThresholdIrisMedium
{
  return self->inputScleraProtectionThresholdIrisMedium;
}

- (void)setInputScleraProtectionThresholdIrisMedium:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 768);
}

- (NSNumber)inputScleraProtectionThresholdScleraMedium
{
  return self->inputScleraProtectionThresholdScleraMedium;
}

- (void)setInputScleraProtectionThresholdScleraMedium:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 776);
}

- (NSNumber)inputScleraProtectionThresholdSkinMedium
{
  return self->inputScleraProtectionThresholdSkinMedium;
}

- (void)setInputScleraProtectionThresholdSkinMedium:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 784);
}

- (NSNumber)inputSkinProtectionThresholdMedium
{
  return self->inputSkinProtectionThresholdMedium;
}

- (void)setInputSkinProtectionThresholdMedium:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 792);
}

- (NSNumber)inputDetectionThresholdIrisLarge
{
  return self->inputDetectionThresholdIrisLarge;
}

- (void)setInputDetectionThresholdIrisLarge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 800);
}

- (NSNumber)inputDetectionThresholdScleraLarge
{
  return self->inputDetectionThresholdScleraLarge;
}

- (void)setInputDetectionThresholdScleraLarge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 808);
}

- (NSNumber)inputDetectionThresholdSkinLarge
{
  return self->inputDetectionThresholdSkinLarge;
}

- (void)setInputDetectionThresholdSkinLarge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 816);
}

- (NSNumber)inputScleraProtectionThresholdIrisLarge
{
  return self->inputScleraProtectionThresholdIrisLarge;
}

- (void)setInputScleraProtectionThresholdIrisLarge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 824);
}

- (NSNumber)inputScleraProtectionThresholdScleraLarge
{
  return self->inputScleraProtectionThresholdScleraLarge;
}

- (void)setInputScleraProtectionThresholdScleraLarge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 832);
}

- (NSNumber)inputScleraProtectionThresholdSkinLarge
{
  return self->inputScleraProtectionThresholdSkinLarge;
}

- (void)setInputScleraProtectionThresholdSkinLarge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 840);
}

- (NSNumber)inputSkinProtectionThresholdLarge
{
  return self->inputSkinProtectionThresholdLarge;
}

- (void)setInputSkinProtectionThresholdLarge:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 848);
}

- (CIImage)inputIrisMask
{
  return self->inputIrisMask;
}

- (void)setInputIrisMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 856);
}

- (CIImage)inputScleraMask
{
  return self->inputScleraMask;
}

- (void)setInputScleraMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 864);
}

- (CIImage)inputSkinMask
{
  return self->inputSkinMask;
}

- (void)setInputSkinMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 872);
}

- (void)outputImage
{
  int v3;
  const char *v4;
  __int16 v5;
  double v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136446722;
  v4 = "-[CIRedEyeRaw outputImage]";
  v5 = 2048;
  v6 = a3;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}s Eye size: major axis %.0f -> %@", (uint8_t *)&v3, 0x20u);
}

@end
