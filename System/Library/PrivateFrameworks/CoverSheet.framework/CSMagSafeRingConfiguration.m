@implementation CSMagSafeRingConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken_0 != -1)
    dispatch_once(&defaultConfiguration_onceToken_0, &__block_literal_global_19);
  return (id)defaultConfiguration___defaultConfiguration_0;
}

void __50__CSMagSafeRingConfiguration_defaultConfiguration__block_invoke()
{
  CSMagSafeRingConfiguration *v0;
  void *v1;
  _OWORD v2[16];
  _OWORD v3[16];
  _OWORD v4[16];

  v4[12] = xmmword_1D04903F8;
  memset(&v4[13], 0, 48);
  v4[8] = xmmword_1D04903B8;
  v4[9] = unk_1D04903C8;
  v4[10] = xmmword_1D04903D8;
  v4[11] = unk_1D04903E8;
  v4[4] = xmmword_1D0490378;
  v4[5] = unk_1D0490388;
  v4[6] = xmmword_1D0490398;
  v4[7] = unk_1D04903A8;
  v4[0] = CSMagSafeRingDiameter;
  v4[1] = unk_1D0490348;
  v4[2] = xmmword_1D0490358;
  v4[3] = unk_1D0490368;
  v3[12] = xmmword_1D04905F8;
  memset(&v3[13], 0, 48);
  v3[8] = xmmword_1D04905B8;
  v3[9] = unk_1D04905C8;
  v3[10] = xmmword_1D04905D8;
  v3[11] = unk_1D04905E8;
  v3[4] = xmmword_1D0490578;
  v3[5] = unk_1D0490588;
  v3[6] = xmmword_1D0490598;
  v3[7] = unk_1D04905A8;
  v3[0] = CSMagSafeLineWidth;
  v3[1] = unk_1D0490548;
  v3[2] = xmmword_1D0490558;
  v3[3] = unk_1D0490568;
  v2[12] = xmmword_1D04909F8;
  memset(&v2[13], 0, 48);
  v2[8] = xmmword_1D04909B8;
  v2[9] = unk_1D04909C8;
  v2[10] = xmmword_1D04909D8;
  v2[11] = unk_1D04909E8;
  v2[4] = xmmword_1D0490978;
  v2[5] = unk_1D0490988;
  v2[6] = xmmword_1D0490998;
  v2[7] = unk_1D04909A8;
  v2[0] = CSMagSafeSplashRingDiameter;
  v2[1] = unk_1D0490948;
  v2[2] = xmmword_1D0490958;
  v2[3] = unk_1D0490968;
  v0 = -[CSMagSafeRingConfiguration initWithRingDiameter:lineWidth:splashRingDiamter:]([CSMagSafeRingConfiguration alloc], "initWithRingDiameter:lineWidth:splashRingDiamter:", v4, v3, v2);
  v1 = (void *)defaultConfiguration___defaultConfiguration_0;
  defaultConfiguration___defaultConfiguration_0 = (uint64_t)v0;

}

+ (id)staticConfiguration
{
  if (staticConfiguration_onceToken != -1)
    dispatch_once(&staticConfiguration_onceToken, &__block_literal_global_1_0);
  return (id)staticConfiguration___staticConfiguration;
}

void __49__CSMagSafeRingConfiguration_staticConfiguration__block_invoke()
{
  CSMagSafeRingConfiguration *v0;
  void *v1;
  _OWORD v2[16];
  _OWORD v3[16];
  _OWORD v4[16];

  v4[12] = xmmword_1D04907F8;
  memset(&v4[13], 0, 48);
  v4[8] = xmmword_1D04907B8;
  v4[9] = unk_1D04907C8;
  v4[10] = xmmword_1D04907D8;
  v4[11] = unk_1D04907E8;
  v4[4] = xmmword_1D0490778;
  v4[5] = unk_1D0490788;
  v4[6] = xmmword_1D0490798;
  v4[7] = unk_1D04907A8;
  v4[0] = CSMagSafeStaticViewRingDiameter;
  v4[1] = unk_1D0490748;
  v4[2] = xmmword_1D0490758;
  v4[3] = unk_1D0490768;
  v3[12] = xmmword_1D04908F8;
  memset(&v3[13], 0, 48);
  v3[8] = xmmword_1D04908B8;
  v3[9] = unk_1D04908C8;
  v3[10] = xmmword_1D04908D8;
  v3[11] = unk_1D04908E8;
  v3[4] = xmmword_1D0490878;
  v3[5] = unk_1D0490888;
  v3[6] = xmmword_1D0490898;
  v3[7] = unk_1D04908A8;
  v3[0] = CSMagSafeStaticViewRingLineWidth;
  v3[1] = unk_1D0490848;
  v3[2] = xmmword_1D0490858;
  v3[3] = unk_1D0490868;
  v2[12] = xmmword_1D04909F8;
  memset(&v2[13], 0, 48);
  v2[8] = xmmword_1D04909B8;
  v2[9] = unk_1D04909C8;
  v2[10] = xmmword_1D04909D8;
  v2[11] = unk_1D04909E8;
  v2[4] = xmmword_1D0490978;
  v2[5] = unk_1D0490988;
  v2[6] = xmmword_1D0490998;
  v2[7] = unk_1D04909A8;
  v2[0] = CSMagSafeSplashRingDiameter;
  v2[1] = unk_1D0490948;
  v2[2] = xmmword_1D0490958;
  v2[3] = unk_1D0490968;
  v0 = -[CSMagSafeRingConfiguration initWithRingDiameter:lineWidth:splashRingDiamter:]([CSMagSafeRingConfiguration alloc], "initWithRingDiameter:lineWidth:splashRingDiamter:", v4, v3, v2);
  v1 = (void *)staticConfiguration___staticConfiguration;
  staticConfiguration___staticConfiguration = (uint64_t)v0;

}

+ (id)auxiliaryConfiguration
{
  if (auxiliaryConfiguration_onceToken != -1)
    dispatch_once(&auxiliaryConfiguration_onceToken, &__block_literal_global_2);
  return (id)auxiliaryConfiguration___auxiliaryConfiguration;
}

void __52__CSMagSafeRingConfiguration_auxiliaryConfiguration__block_invoke()
{
  CSMagSafeRingConfiguration *v0;
  void *v1;
  _OWORD v2[16];
  _OWORD v3[16];
  _OWORD v4[16];

  v4[12] = xmmword_1D04904F8;
  memset(&v4[13], 0, 48);
  v4[8] = xmmword_1D04904B8;
  v4[9] = unk_1D04904C8;
  v4[10] = xmmword_1D04904D8;
  v4[11] = unk_1D04904E8;
  v4[4] = xmmword_1D0490478;
  v4[5] = unk_1D0490488;
  v4[6] = xmmword_1D0490498;
  v4[7] = unk_1D04904A8;
  v4[0] = CSMagSafeAuxiliaryRingDiameter;
  v4[1] = unk_1D0490448;
  v4[2] = xmmword_1D0490458;
  v4[3] = unk_1D0490468;
  v3[12] = xmmword_1D04906F8;
  memset(&v3[13], 0, 48);
  v3[8] = xmmword_1D04906B8;
  v3[9] = unk_1D04906C8;
  v3[10] = xmmword_1D04906D8;
  v3[11] = unk_1D04906E8;
  v3[4] = xmmword_1D0490678;
  v3[5] = unk_1D0490688;
  v3[6] = xmmword_1D0490698;
  v3[7] = unk_1D04906A8;
  v3[0] = CSMagSafeAuxiliaryLineWidth;
  v3[1] = unk_1D0490648;
  v3[2] = xmmword_1D0490658;
  v3[3] = unk_1D0490668;
  v2[12] = xmmword_1D04909F8;
  memset(&v2[13], 0, 48);
  v2[8] = xmmword_1D04909B8;
  v2[9] = unk_1D04909C8;
  v2[10] = xmmword_1D04909D8;
  v2[11] = unk_1D04909E8;
  v2[4] = xmmword_1D0490978;
  v2[5] = unk_1D0490988;
  v2[6] = xmmword_1D0490998;
  v2[7] = unk_1D04909A8;
  v2[0] = CSMagSafeSplashRingDiameter;
  v2[1] = unk_1D0490948;
  v2[2] = xmmword_1D0490958;
  v2[3] = unk_1D0490968;
  v0 = -[CSMagSafeRingConfiguration initWithRingDiameter:lineWidth:splashRingDiamter:]([CSMagSafeRingConfiguration alloc], "initWithRingDiameter:lineWidth:splashRingDiamter:", v4, v3, v2);
  v1 = (void *)auxiliaryConfiguration___auxiliaryConfiguration;
  auxiliaryConfiguration___auxiliaryConfiguration = (uint64_t)v0;

}

+ (double)staticScaleFactor
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  int v13;
  int v14;
  double v15;
  double v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t v37;
  double v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v53;
  int v54;
  int v55;
  double v56;
  int v57;
  int v58;
  int v59;
  uint64_t *v60;
  int v61;
  double v62;
  int v63;
  double v64;
  int v65;
  double v66;
  double v67;
  int v68;
  int v69;
  int v70;
  double v71;
  int v72;
  int v73;
  int v74;
  double v75;
  int v76;
  int v77;
  int v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  int v84;
  double v85;
  int v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  int v91;
  double v92;
  double v93;
  double v94;
  int v95;
  double v96;
  int v97;
  int v98;
  int v99;
  int v100;
  double v101;
  int v102;
  int v103;
  int v104;
  int v105;
  double v106;
  int v107;
  double v108;
  double v109;
  int v110;
  int v111;
  int v112;
  double v113;
  int v114;
  int v115;
  int v116;
  double v117;
  int v118;
  int v119;
  int v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  int v126;
  double v127;
  int v128;
  int v129;
  int v130;
  int v131;
  double v132;
  double v133;
  double v134;
  double v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  double v144;
  double v145;
  int v146;
  double v147;
  int v148;
  int v149;
  double v150;
  uint64_t v151;
  double v152;
  double v153;
  int v154;
  int v155;
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
  uint64_t *v199;
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
  void *v213;
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
  int v258;
  int v259;
  uint64_t v260;
  int v261;
  int v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  int v270;
  int v271;
  uint64_t v272;
  int v273;
  int v274;
  uint64_t v275;
  int v276;
  int v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  int v281;
  int v282;
  uint64_t v283;
  int v284;
  int v285;
  uint64_t v286;
  uint64_t v287;
  int v288;
  int v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  int v294;
  int v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  int v299;
  __int128 v300;
  int v301;
  int v302;
  int v303;
  int v304;
  uint64_t v305;
  int v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  unint64_t v310;
  unint64_t v311;
  unint64_t v312;
  uint64_t v313;
  int v314;
  uint64_t v315;
  uint64_t v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;

  v3 = __sb__runningInSpringBoard();
  v4 = (void *)0x1E0CEA000;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v318 = 0;
      v321 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v248, "userInterfaceIdiom") != 1)
    {
      v318 = 0;
      v321 = 1;
      goto LABEL_10;
    }
  }
  v321 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "_referenceBounds");
    }
    v19 = v5 ^ 1;
    BSSizeRoundForScale();
    v22 = v21 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v20 == *(double *)(MEMORY[0x1E0DAB260] + 280);
    v318 = v19;
    if (v22)
    {
      v280 = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      v286 = 0;
      v264 = 0;
      v260 = 0;
      v282 = 0;
      v263 = 0;
      v289 = 0;
      v259 = 0;
      v290 = 0;
      v262 = 0;
      v293 = 0;
      v294 = 0;
      v299 = 0;
      v295 = 0;
      v300 = 0uLL;
      v305 = 0;
      v303 = 0;
      v301 = 0;
      v307 = 0;
      v309 = 0;
      v316 = 0;
      v313 = 0;
      v317 = 0;
      v314 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    v318 = 0;
  }
LABEL_10:
  v6 = __sb__runningInSpringBoard();
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v305) = 0;
      HIDWORD(v307) = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v246, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v305) = 0;
      HIDWORD(v307) = 1;
      goto LABEL_19;
    }
  }
  HIDWORD(v307) = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v305) = v7 ^ 1;
    if (v23 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v280 = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      v286 = 0;
      v264 = 0;
      v260 = 0;
      v282 = 0;
      v263 = 0;
      v289 = 0;
      v259 = 0;
      v290 = 0;
      v262 = 0;
      v293 = 0;
      v294 = 0;
      v299 = 0;
      v295 = 0;
      v300 = 0uLL;
      LODWORD(v305) = 0;
      v303 = 0;
      v301 = 0;
      LODWORD(v307) = 0;
      v309 = 0;
      v316 = 0;
      v313 = 0;
      v317 = 0;
      v314 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v305) = 0;
  }
LABEL_19:
  v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v317 = 0;
      v314 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v244, "userInterfaceIdiom") != 1)
    {
      v317 = 0;
      v314 = 1;
      goto LABEL_28;
    }
  }
  v314 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v9 = __sb__runningInSpringBoard();
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "_referenceBounds");
    }
    v317 = v9 ^ 1;
    BSSizeRoundForScale();
    if (v24 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v280 = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      v286 = 0;
      v264 = 0;
      v260 = 0;
      v282 = 0;
      v263 = 0;
      v289 = 0;
      v259 = 0;
      v290 = 0;
      v262 = 0;
      v293 = 0;
      v294 = 0;
      v299 = 0;
      v295 = 0;
      v300 = 0uLL;
      LODWORD(v305) = 0;
      v303 = 0;
      v301 = 0;
      LODWORD(v307) = 0;
      v309 = 0;
      v316 = 0;
      v313 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    v317 = 0;
  }
LABEL_28:
  v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v313 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v242, "userInterfaceIdiom") != 1)
    {
      v313 = 0x100000000;
      goto LABEL_37;
    }
  }
  HIDWORD(v313) = v10 ^ 1;
  v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "_referenceBounds");
  }
  LODWORD(v313) = v11 ^ 1;
  BSSizeRoundForScale();
  if (v12 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    v286 = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v289 = 0;
    v259 = 0;
    v290 = 0;
    v262 = 0;
    v293 = 0;
    v294 = 0;
    v299 = 0;
    v295 = 0;
    v300 = 0uLL;
    LODWORD(v305) = 0;
    v303 = 0;
    v301 = 0;
    LODWORD(v307) = 0;
    v309 = 0;
    v316 = 0;
    v15 = 0.0;
    goto LABEL_67;
  }
LABEL_37:
  v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v316 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v240, "userInterfaceIdiom") != 1)
    {
      v316 = 0x100000000;
      goto LABEL_47;
    }
  }
  HIDWORD(v316) = v13 ^ 1;
  v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "_referenceBounds");
  }
  LODWORD(v316) = v14 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    v286 = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v289 = 0;
    v259 = 0;
    v290 = 0;
    v262 = 0;
    v293 = 0;
    v294 = 0;
    v299 = 0;
    v295 = 0;
    v300 = 0uLL;
    LODWORD(v305) = 0;
    v303 = 0;
    v301 = 0;
    LODWORD(v307) = 0;
    v309 = 0;
    v15 = 0.0;
    goto LABEL_67;
  }
LABEL_47:
  v17 = __sb__runningInSpringBoard();
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v309 = 0;
      goto LABEL_344;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v238, "userInterfaceIdiom") != 1)
    {
      v309 = 0x100000000;
      goto LABEL_344;
    }
  }
  HIDWORD(v309) = v17 ^ 1;
  v18 = __sb__runningInSpringBoard();
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "_referenceBounds");
  }
  LODWORD(v309) = v18 ^ 1;
  BSSizeRoundForScale();
  if (v53 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    v286 = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v289 = 0;
    v259 = 0;
    v290 = 0;
    v262 = 0;
    v293 = 0;
    v294 = 0;
    v299 = 0;
    v295 = 0;
    v300 = 0uLL;
    LODWORD(v305) = 0;
    v303 = 0;
    v301 = 0;
    LODWORD(v307) = 0;
    v15 = 0.0;
    goto LABEL_67;
  }
LABEL_344:
  v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_346;
LABEL_352:
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    v286 = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v289 = 0;
    v259 = 0;
    v290 = 0;
    v262 = 0;
    v293 = 0;
    v294 = 0;
    v299 = 0;
    v295 = 0;
    v300 = 0uLL;
    LODWORD(v305) = 0;
    v303 = 0;
    v301 = 0;
    v15 = 0.0;
    LODWORD(v307) = v54 ^ 1;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v234, "userInterfaceIdiom") == 1)
    goto LABEL_352;
LABEL_346:
  LODWORD(v307) = v54 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_350:
    v303 = 0;
    v301 = 0;
    goto LABEL_375;
  }
  v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_350;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom"))
    {
      v257 = v2;
      v303 = 0;
      v301 = 1;
      goto LABEL_375;
    }
  }
  v301 = v55 ^ 1;
  v257 = v2;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "_referenceBounds");
    }
    v303 = v58 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v280 = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      v286 = 0;
      v264 = 0;
      v260 = 0;
      v282 = 0;
      v263 = 0;
      v289 = 0;
      v259 = 0;
      v290 = 0;
      v262 = 0;
      v293 = 0;
      v294 = 0;
      v299 = 0;
      v295 = 0;
      v300 = 0uLL;
      LODWORD(v305) = 0;
      v15 = 52.0;
      goto LABEL_67;
    }
  }
  else
  {
    v303 = 0;
  }
LABEL_375:
  v59 = __sb__runningInSpringBoard();
  v60 = &qword_1D0490000;
  if (v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v300) = 0;
      LODWORD(v305) = 0;
      goto LABEL_385;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v222, "userInterfaceIdiom"))
    {
      HIDWORD(v300) = 0;
      LODWORD(v305) = 1;
      goto LABEL_385;
    }
  }
  LODWORD(v305) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v61 = __sb__runningInSpringBoard();
    if (v61)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "_referenceBounds");
    }
    HIDWORD(v300) = v61 ^ 1;
    BSSizeRoundForScale();
    if (v62 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_389;
  }
  else
  {
    HIDWORD(v300) = 0;
  }
LABEL_385:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    v286 = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v289 = 0;
    v259 = 0;
    v290 = 0;
    v262 = 0;
    v293 = 0;
    v294 = 0;
    v299 = 0;
    v295 = 0;
    *(_QWORD *)&v300 = 0;
    DWORD2(v300) = 0;
    v15 = 45.66666;
    goto LABEL_67;
  }
LABEL_389:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_393:
    *(_QWORD *)((char *)&v300 + 4) = 0;
    goto LABEL_431;
  }
  v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_393;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v214, "userInterfaceIdiom"))
    {
      *(_QWORD *)((char *)&v300 + 4) = 0x100000000;
      goto LABEL_431;
    }
  }
  DWORD2(v300) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "_referenceBounds");
    }
    DWORD1(v300) = v68 ^ 1;
    BSSizeRoundForScale();
    if (v81 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v280 = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      v286 = 0;
      v264 = 0;
      v260 = 0;
      v282 = 0;
      v263 = 0;
      v289 = 0;
      v259 = 0;
      v290 = 0;
      v262 = 0;
      v293 = 0;
      v294 = 0;
      v299 = 0;
      v295 = 0;
      LODWORD(v300) = 0;
      v15 = 24.0;
      goto LABEL_67;
    }
  }
  else
  {
    DWORD1(v300) = 0;
  }
LABEL_431:
  v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v295 = 0;
      LODWORD(v300) = 0;
      goto LABEL_441;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v219, "userInterfaceIdiom"))
    {
      v295 = 0;
      LODWORD(v300) = 1;
      goto LABEL_441;
    }
  }
  LODWORD(v300) = v69 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "_referenceBounds");
    }
    v295 = v70 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_445;
  }
  else
  {
    v295 = 0;
  }
LABEL_441:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    v286 = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v289 = 0;
    v259 = 0;
    v290 = 0;
    v262 = 0;
    v293 = 0;
    v294 = 0;
    v299 = 0;
    v15 = 45.66666;
    goto LABEL_67;
  }
LABEL_445:
  v72 = __sb__runningInSpringBoard();
  if (v72)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v294 = 0;
      v299 = 0;
      goto LABEL_455;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v217, "userInterfaceIdiom"))
    {
      v294 = 0;
      v299 = 1;
      goto LABEL_455;
    }
  }
  v299 = v72 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v73 = __sb__runningInSpringBoard();
    if (v73)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v294 = v73 ^ 1;
    if (v79 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v280 = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      v286 = 0;
      v264 = 0;
      v260 = 0;
      v282 = 0;
      v263 = 0;
      v289 = 0;
      v259 = 0;
      v290 = 0;
      v262 = 0;
      v293 = 0;
      v15 = 52.0;
      goto LABEL_67;
    }
  }
  else
  {
    v294 = 0;
  }
LABEL_455:
  v74 = __sb__runningInSpringBoard();
  if (v74)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v286) = 0;
      HIDWORD(v290) = 0;
      goto LABEL_499;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v210, "userInterfaceIdiom"))
    {
      HIDWORD(v286) = 0;
      HIDWORD(v290) = 1;
      goto LABEL_499;
    }
  }
  HIDWORD(v290) = v74 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v78 = __sb__runningInSpringBoard();
    if (v78)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "_referenceBounds");
    }
    HIDWORD(v286) = v78 ^ 1;
    BSSizeRoundForScale();
    if (v83 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_521;
  }
  else
  {
    HIDWORD(v286) = 0;
  }
LABEL_499:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    LODWORD(v286) = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v289 = 0;
    v259 = 0;
    LODWORD(v290) = 0;
    v262 = 0;
    v293 = 0;
    v15 = 45.66666;
    goto LABEL_67;
  }
LABEL_521:
  v84 = __sb__runningInSpringBoard();
  if (v84)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v293 = 0;
      goto LABEL_539;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v208, "userInterfaceIdiom"))
    {
      v293 = 0x100000000;
      goto LABEL_539;
    }
  }
  HIDWORD(v293) = v84 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v88 = __sb__runningInSpringBoard();
    if (v88)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v293) = v88 ^ 1;
    if (v92 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      v280 = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      LODWORD(v286) = 0;
      v264 = 0;
      v260 = 0;
      v282 = 0;
      v263 = 0;
      v289 = 0;
      v259 = 0;
      LODWORD(v290) = 0;
      v262 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v293) = 0;
  }
LABEL_539:
  v89 = __sb__runningInSpringBoard();
  if (v89)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v289 = 0;
      LODWORD(v290) = 0;
      goto LABEL_559;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v203, "userInterfaceIdiom"))
    {
      v289 = 0;
      LODWORD(v290) = 1;
      goto LABEL_559;
    }
  }
  LODWORD(v290) = v89 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v91 = __sb__runningInSpringBoard();
    if (v91)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "_referenceBounds");
    }
    v289 = v91 ^ 1;
    BSSizeRoundForScale();
    if (v94 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_579;
  }
  else
  {
    v289 = 0;
  }
LABEL_559:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v280 = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v285 = 0;
    v271 = 0;
    v267 = 0;
    LODWORD(v286) = 0;
    v264 = 0;
    v260 = 0;
    v282 = 0;
    v263 = 0;
    v259 = 0;
    v262 = 0;
    v15 = 0.0;
    goto LABEL_67;
  }
LABEL_579:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_583:
    HIDWORD(v280) = 0;
    v282 = 0;
    goto LABEL_599;
  }
  v95 = __sb__runningInSpringBoard();
  if (v95)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_583;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v60 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "userInterfaceIdiom"))
    {
      v199 = v60;
      HIDWORD(v280) = 0;
      v282 = 1;
      goto LABEL_599;
    }
  }
  v282 = v95 ^ 1;
  v199 = v60;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v98 = __sb__runningInSpringBoard();
    if (v98)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v280) = v98 ^ 1;
    if (v108 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      LODWORD(v280) = 0;
      v277 = 0;
      v278 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v285 = 0;
      v271 = 0;
      v267 = 0;
      LODWORD(v286) = 0;
      v264 = 0;
      v260 = 0;
      v263 = 0;
      v259 = 0;
      v262 = 0;
      v15 = 45.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v280) = 0;
  }
LABEL_599:
  v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v285 = 0;
      LODWORD(v286) = 0;
      goto LABEL_609;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v201, "userInterfaceIdiom"))
    {
      v285 = 0;
      LODWORD(v286) = 1;
      goto LABEL_609;
    }
  }
  LODWORD(v286) = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v100 = __sb__runningInSpringBoard();
    if (v100)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "_referenceBounds");
    }
    v285 = v100 ^ 1;
    BSSizeRoundForScale();
    if (v101 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_613;
  }
  else
  {
    v285 = 0;
  }
LABEL_609:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v280) = 0;
    v277 = 0;
    v278 = 0;
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v271 = 0;
    v267 = 0;
    v264 = 0;
    v260 = 0;
    v263 = 0;
    v259 = 0;
    v262 = 0;
    v15 = 37.0;
    goto LABEL_67;
  }
LABEL_613:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_617:
    v278 = 0;
    goto LABEL_655;
  }
  v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_617;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v182, "userInterfaceIdiom"))
    {
      v278 = 0x100000000;
      goto LABEL_655;
    }
  }
  HIDWORD(v278) = v102 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v110 = __sb__runningInSpringBoard();
    if (v110)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "_referenceBounds");
    }
    LODWORD(v278) = v110 ^ 1;
    BSSizeRoundForScale();
    if (v123 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v280) = 0;
      v277 = 0;
      v274 = 0;
      v268 = 0;
      v272 = 0;
      v271 = 0;
      v267 = 0;
      v264 = 0;
      v260 = 0;
      v263 = 0;
      v259 = 0;
      v262 = 0;
      v15 = 45.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v278) = 0;
  }
LABEL_655:
  v111 = __sb__runningInSpringBoard();
  if (v111)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v280) = 0;
      v277 = 0;
      goto LABEL_665;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v191, "userInterfaceIdiom"))
    {
      v277 = 0;
      LODWORD(v280) = 1;
      goto LABEL_665;
    }
  }
  LODWORD(v280) = v111 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v112 = __sb__runningInSpringBoard();
    if (v112)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "_referenceBounds");
    }
    v277 = v112 ^ 1;
    BSSizeRoundForScale();
    if (v113 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_669;
  }
  else
  {
    v277 = 0;
  }
LABEL_665:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v274 = 0;
    v268 = 0;
    v272 = 0;
    v271 = 0;
    v267 = 0;
    v264 = 0;
    v260 = 0;
    v263 = 0;
    v259 = 0;
    v262 = 0;
    v15 = 37.0;
    goto LABEL_67;
  }
LABEL_669:
  v114 = __sb__runningInSpringBoard();
  if (v114)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v274 = 0;
      HIDWORD(v268) = 0;
      goto LABEL_679;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v185, "userInterfaceIdiom"))
    {
      HIDWORD(v268) = 0;
      v274 = 1;
      goto LABEL_679;
    }
  }
  v274 = v114 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v115 = __sb__runningInSpringBoard();
    if (v115)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v268) = v115 ^ 1;
    if (v121 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v272 = 0;
      v271 = 0;
      LODWORD(v268) = 0;
      v267 = 0;
      v264 = 0;
      v260 = 0;
      v263 = 0;
      v259 = 0;
      v262 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v268) = 0;
  }
LABEL_679:
  v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v272 = 0;
      goto LABEL_723;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v178, "userInterfaceIdiom"))
    {
      v272 = 0x100000000;
      goto LABEL_723;
    }
  }
  HIDWORD(v272) = v116 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v120 = __sb__runningInSpringBoard();
    if (v120)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "_referenceBounds");
    }
    LODWORD(v272) = v120 ^ 1;
    BSSizeRoundForScale();
    if (v125 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_745;
  }
  else
  {
    LODWORD(v272) = 0;
  }
LABEL_723:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v271 = 0;
    LODWORD(v268) = 0;
    v267 = 0;
    v264 = 0;
    v260 = 0;
    v263 = 0;
    v259 = 0;
    v262 = 0;
    v15 = 0.0;
    goto LABEL_67;
  }
LABEL_745:
  v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v271 = 0;
      LODWORD(v268) = 0;
      goto LABEL_763;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v176, "userInterfaceIdiom"))
    {
      LODWORD(v268) = 0;
      v271 = 1;
      goto LABEL_763;
    }
  }
  v271 = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v129 = __sb__runningInSpringBoard();
    if (v129)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "_referenceBounds");
    }
    LODWORD(v268) = v129 ^ 1;
    BSSizeRoundForScale();
    if (v132 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v267 = 0;
      v264 = 0;
      v260 = 0;
      v263 = 0;
      v259 = 0;
      v262 = 0;
      v15 = 45.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v268) = 0;
  }
LABEL_763:
  v130 = __sb__runningInSpringBoard();
  if (v130)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v267 = 0;
      goto LABEL_783;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v171, "userInterfaceIdiom"))
    {
      v267 = 0x100000000;
      goto LABEL_783;
    }
  }
  HIDWORD(v267) = v130 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v267) = 0;
    goto LABEL_783;
  }
  v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "_referenceBounds");
  }
  LODWORD(v267) = v131 ^ 1;
  BSSizeRoundForScale();
  if (v134 < *(double *)(MEMORY[0x1E0DAB260] + 104))
  {
LABEL_783:
    if ((_SBF_Private_IsD53() & 1) != 0)
    {
      v264 = 0;
      v260 = 0;
      v263 = 0;
      v259 = 0;
      v262 = 0;
      v15 = 37.0;
      goto LABEL_67;
    }
  }
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
    goto LABEL_804;
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
    goto LABEL_806;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
LABEL_804:
    v264 = 0;
    v260 = 0;
    v263 = 0;
    v259 = 0;
    v262 = 0;
    v15 = 45.0;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
LABEL_806:
    v264 = 0;
    v260 = 0;
    v263 = 0;
    v259 = 0;
    v262 = 0;
    v15 = 38.33333;
    goto LABEL_67;
  }
  v136 = __sb__runningInSpringBoard();
  if (v136)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v264) = 0;
      HIDWORD(v260) = 0;
      goto LABEL_833;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v256, "userInterfaceIdiom"))
    {
      HIDWORD(v260) = 0;
      HIDWORD(v264) = 1;
      goto LABEL_833;
    }
  }
  HIDWORD(v264) = v136 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v137 = __sb__runningInSpringBoard();
    if (v137)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "_referenceBounds");
    }
    HIDWORD(v260) = v137 ^ 1;
    BSSizeRoundForScale();
    if (v144 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      LODWORD(v264) = 0;
      v263 = 0;
      LODWORD(v260) = 0;
      v259 = 0;
      v262 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v260) = 0;
  }
LABEL_833:
  v138 = __sb__runningInSpringBoard();
  if (v138)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v264) = 0;
      HIDWORD(v263) = 0;
      goto LABEL_853;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v255, "userInterfaceIdiom"))
    {
      HIDWORD(v263) = 0;
      LODWORD(v264) = 1;
      goto LABEL_853;
    }
  }
  LODWORD(v264) = v138 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v140 = __sb__runningInSpringBoard();
    if (v140)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "_referenceBounds");
    }
    HIDWORD(v263) = v140 ^ 1;
    BSSizeRoundForScale();
    if (v152 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      LODWORD(v260) = 0;
      v259 = 0;
      LODWORD(v263) = 0;
      v262 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v263) = 0;
  }
LABEL_853:
  v141 = __sb__runningInSpringBoard();
  if (!v141)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v254, "userInterfaceIdiom"))
    {
      v259 = 0;
      LODWORD(v260) = 1;
      goto LABEL_879;
    }
LABEL_875:
    LODWORD(v260) = v141 ^ 1;
    v146 = __sb__runningInSpringBoard();
    if (v146)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    v259 = v146 ^ 1;
    BSSizeRoundForScale();
    if (v147 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_882;
    goto LABEL_879;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_875;
  LODWORD(v260) = 0;
  v259 = 0;
LABEL_879:
  v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_882:
      LODWORD(v263) = 0;
      v262 = 0;
      v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v253, "userInterfaceIdiom"))
    {
      v262 = 0;
      v15 = 0.0;
      LODWORD(v263) = 1;
      goto LABEL_67;
    }
  }
  LODWORD(v263) = v148 ^ 1;
  v155 = __sb__runningInSpringBoard();
  if (v155)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v251, "_referenceBounds");
  }
  v262 = v155 ^ 1;
  BSSizeRoundForScale();
  v15 = 0.0;
LABEL_67:
  v25 = __sb__runningInSpringBoard();
  if (v25)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v26 = 0;
      v27 = 0;
      goto LABEL_76;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v247, "userInterfaceIdiom") != 1)
    {
      v27 = 0;
      v26 = 1;
      goto LABEL_76;
    }
  }
  v26 = v25 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "_referenceBounds");
    }
    v27 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v49 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v48 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v319 = v28 ^ 1;
      v320 = v26;
      v311 = 0;
      v312 = 0;
      v310 = 0;
      v315 = 0;
      v308 = 0;
      v306 = 0;
      v298 = 0;
      v302 = 0;
      v304 = 0;
      v297 = 0;
      v296 = 0;
      v292 = 0;
      v288 = 0;
      v284 = 0;
      v291 = 0;
      v287 = 0;
      v281 = 0;
      v279 = 0;
      v283 = 0;
      v276 = 0;
      v275 = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    v27 = 0;
  }
LABEL_76:
  v29 = __sb__runningInSpringBoard();
  v319 = v27;
  v320 = v26;
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v30 = 0;
      v31 = 0;
      goto LABEL_85;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v245, "userInterfaceIdiom") != 1)
    {
      v31 = 0;
      v30 = 1;
      goto LABEL_85;
    }
  }
  v30 = v29 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "_referenceBounds");
    }
    v31 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v50 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      LODWORD(v312) = v28 ^ 1;
      HIDWORD(v312) = v30;
      v310 = 0;
      v311 = 0;
      v315 = 0;
      v308 = 0;
      v306 = 0;
      v298 = 0;
      v302 = 0;
      v304 = 0;
      v297 = 0;
      v296 = 0;
      v292 = 0;
      v288 = 0;
      v284 = 0;
      v291 = 0;
      v287 = 0;
      v281 = 0;
      v279 = 0;
      v283 = 0;
      v276 = 0;
      v275 = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    v31 = 0;
  }
LABEL_85:
  v32 = __sb__runningInSpringBoard();
  v312 = __PAIR64__(v30, v31);
  if (v32)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v33 = 0;
      v34 = 0;
      goto LABEL_94;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v243, "userInterfaceIdiom") != 1)
    {
      v34 = 0;
      v33 = 1;
      goto LABEL_94;
    }
  }
  v33 = v32 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "_referenceBounds");
    }
    v34 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v311) = v28 ^ 1;
      HIDWORD(v311) = v33;
      v310 = 0;
      v315 = 0;
      v308 = 0;
      v306 = 0;
      v298 = 0;
      v302 = 0;
      v304 = 0;
      v297 = 0;
      v296 = 0;
      v292 = 0;
      v288 = 0;
      v284 = 0;
      v291 = 0;
      v287 = 0;
      v281 = 0;
      v279 = 0;
      v283 = 0;
      v276 = 0;
      v275 = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    v34 = 0;
  }
LABEL_94:
  v35 = __sb__runningInSpringBoard();
  v311 = __PAIR64__(v33, v34);
  if (v35)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v36 = 0;
      v37 = 0;
      goto LABEL_103;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v241, "userInterfaceIdiom") != 1)
    {
      v37 = 0;
      v36 = 1;
      goto LABEL_103;
    }
  }
  v36 = v35 ^ 1;
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "_referenceBounds");
  }
  v37 = v28 ^ 1;
  BSSizeRoundForScale();
  if (v38 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v310 = __PAIR64__(v36, v37);
    v315 = 0;
    v308 = 0;
    v306 = 0;
    v298 = 0;
    v302 = 0;
    v304 = 0;
    v297 = 0;
    v296 = 0;
    v292 = 0;
    v288 = 0;
    v284 = 0;
    v291 = 0;
    v287 = 0;
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0.0;
    goto LABEL_130;
  }
LABEL_103:
  v39 = __sb__runningInSpringBoard();
  v310 = __PAIR64__(v36, v37);
  if (v39)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v315 = 0;
      goto LABEL_113;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v239, "userInterfaceIdiom") != 1)
    {
      v315 = 0x100000000;
      goto LABEL_113;
    }
  }
  HIDWORD(v315) = v39 ^ 1;
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "_referenceBounds");
  }
  LODWORD(v315) = v28 ^ 1;
  BSSizeRoundForScale();
  if (v46 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v308 = 0;
    v306 = 0;
    v298 = 0;
    v302 = 0;
    v304 = 0;
    v297 = 0;
    v296 = 0;
    v292 = 0;
    v288 = 0;
    v284 = 0;
    v291 = 0;
    v287 = 0;
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0.0;
    goto LABEL_130;
  }
LABEL_113:
  v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v308 = 0;
      goto LABEL_356;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v237, "userInterfaceIdiom") != 1)
    {
      v308 = 0x100000000;
      goto LABEL_356;
    }
  }
  HIDWORD(v308) = v47 ^ 1;
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "_referenceBounds");
  }
  LODWORD(v308) = v28 ^ 1;
  BSSizeRoundForScale();
  if (v56 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v306 = 0;
    v298 = 0;
    v302 = 0;
    v304 = 0;
    v297 = 0;
    v296 = 0;
    v292 = 0;
    v288 = 0;
    v284 = 0;
    v291 = 0;
    v287 = 0;
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0.0;
    goto LABEL_130;
  }
LABEL_356:
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_358;
LABEL_364:
    v298 = 0;
    v302 = 0;
    v304 = 0;
    v297 = 0;
    v296 = 0;
    v292 = 0;
    v288 = 0;
    v284 = 0;
    v291 = 0;
    v287 = 0;
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0.0;
    v306 = v28 ^ 1;
    goto LABEL_130;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v233, "userInterfaceIdiom") == 1)
    goto LABEL_364;
LABEL_358:
  v306 = v28 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_362:
    HIDWORD(v298) = 0;
    v302 = 0;
    goto LABEL_400;
  }
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_362;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v220, "userInterfaceIdiom"))
    {
      v302 = 0;
      HIDWORD(v298) = 1;
      goto LABEL_400;
    }
  }
  HIDWORD(v298) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v37, "_referenceBounds");
    }
    v215 = (void *)v37;
    v302 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v67 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v304 = 0;
      LODWORD(v298) = 0;
      v297 = 0;
      v296 = 0;
      v292 = 0;
      v288 = 0;
      v284 = 0;
      v291 = 0;
      v287 = 0;
      v281 = 0;
      v279 = 0;
      v283 = 0;
      v276 = 0;
      v275 = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    v302 = 0;
  }
LABEL_400:
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v304 = 0;
      LODWORD(v298) = 0;
      goto LABEL_410;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v221, "userInterfaceIdiom"))
    {
      LODWORD(v298) = 0;
      v304 = 1;
      goto LABEL_410;
    }
  }
  v304 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "_referenceBounds");
    }
    LODWORD(v298) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_414;
  }
  else
  {
    LODWORD(v298) = 0;
  }
LABEL_410:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v297 = 0;
    v296 = 0;
    v292 = 0;
    v288 = 0;
    v284 = 0;
    v291 = 0;
    v287 = 0;
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 270.66666;
    goto LABEL_130;
  }
LABEL_414:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_418:
    v297 = 0;
    goto LABEL_465;
  }
  v65 = __sb__runningInSpringBoard();
  if (v65)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_418;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v213, "userInterfaceIdiom"))
    {
      v297 = 0x100000000;
      goto LABEL_465;
    }
  }
  HIDWORD(v297) = v65 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "_referenceBounds");
    }
    LODWORD(v297) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v82 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v296 = 0;
      v292 = 0;
      v288 = 0;
      v284 = 0;
      v291 = 0;
      v287 = 0;
      v281 = 0;
      v279 = 0;
      v283 = 0;
      v276 = 0;
      v275 = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v297) = 0;
  }
LABEL_465:
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v296) = 0;
      HIDWORD(v292) = 0;
      goto LABEL_475;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v218, "userInterfaceIdiom"))
    {
      HIDWORD(v292) = 0;
      HIDWORD(v296) = 1;
      goto LABEL_475;
    }
  }
  HIDWORD(v296) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "_referenceBounds");
    }
    HIDWORD(v292) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v75 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_479;
  }
  else
  {
    HIDWORD(v292) = 0;
  }
LABEL_475:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    LODWORD(v296) = 0;
    LODWORD(v292) = 0;
    v288 = 0;
    v284 = 0;
    v291 = 0;
    v287 = 0;
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 270.66666;
    goto LABEL_130;
  }
LABEL_479:
  v76 = __sb__runningInSpringBoard();
  if (v76)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v296) = 0;
      LODWORD(v292) = 0;
      goto LABEL_489;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v216, "userInterfaceIdiom"))
    {
      LODWORD(v292) = 0;
      LODWORD(v296) = 1;
      goto LABEL_489;
    }
  }
  LODWORD(v296) = v76 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v77 = __sb__runningInSpringBoard();
    if (v77)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "_referenceBounds");
    }
    v28 = v77 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v292) = v28;
    if (v80 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v288 = 0;
      v284 = 0;
      v291 = 0;
      v287 = 0;
      v281 = 0;
      v279 = 0;
      v283 = 0;
      v276 = 0;
      v275 = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v292) = 0;
  }
LABEL_489:
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v288 = 0;
      v284 = 0;
      goto LABEL_505;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v209, "userInterfaceIdiom"))
    {
      v284 = 0;
      v288 = 1;
      goto LABEL_505;
    }
  }
  v288 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "_referenceBounds");
    }
    v284 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v85 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_529;
  }
  else
  {
    v284 = 0;
  }
LABEL_505:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v291 = 0;
    v287 = 0;
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 270.66666;
    goto LABEL_130;
  }
LABEL_529:
  v86 = __sb__runningInSpringBoard();
  if (v86)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v87 = 0;
      LODWORD(v291) = 0;
      goto LABEL_549;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v207, "userInterfaceIdiom"))
    {
      LODWORD(v291) = 0;
      v87 = 1;
      goto LABEL_549;
    }
  }
  v87 = v86 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v90 = __sb__runningInSpringBoard();
    if (v90)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "_referenceBounds");
    }
    v28 = v90 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v291) = v28;
    if (v93 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v291) = v87;
      v287 = 0;
      v281 = 0;
      v279 = 0;
      v283 = 0;
      v276 = 0;
      v275 = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v291) = 0;
  }
LABEL_549:
  v28 = __sb__runningInSpringBoard();
  HIDWORD(v291) = v87;
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v287 = 0;
      goto LABEL_566;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v202, "userInterfaceIdiom"))
    {
      v287 = 0x100000000;
      goto LABEL_566;
    }
  }
  HIDWORD(v287) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "_referenceBounds");
    }
    LODWORD(v287) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v96 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_588;
  }
  else
  {
    LODWORD(v287) = 0;
  }
LABEL_566:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v281 = 0;
    v279 = 0;
    v283 = 0;
    v276 = 0;
    v275 = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0.0;
    goto LABEL_130;
  }
LABEL_588:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_592:
    v281 = 0;
    HIDWORD(v279) = 0;
    goto LABEL_624;
  }
  v97 = __sb__runningInSpringBoard();
  if (v97)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_592;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v192, "userInterfaceIdiom"))
    {
      HIDWORD(v279) = 0;
      v281 = 1;
      goto LABEL_624;
    }
  }
  v281 = v97 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v103 = __sb__runningInSpringBoard();
    if (v103)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v87 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v87, "_referenceBounds");
    }
    v183 = (void *)v87;
    v28 = v103 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v279) = v28;
    if (v109 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v283 = 0;
      v276 = 0;
      v275 = 0;
      LODWORD(v279) = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    HIDWORD(v279) = 0;
  }
LABEL_624:
  v104 = __sb__runningInSpringBoard();
  if (v104)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v283) = 0;
      v28 = 0;
      goto LABEL_634;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v200, "userInterfaceIdiom"))
    {
      v28 = 0;
      HIDWORD(v283) = 1;
      goto LABEL_634;
    }
  }
  HIDWORD(v283) = v104 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v105 = __sb__runningInSpringBoard();
    if (v105)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "_referenceBounds");
    }
    v28 = v105 ^ 1u;
    BSSizeRoundForScale();
    if (v106 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_638;
  }
  else
  {
    v28 = 0;
  }
LABEL_634:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v283) = v28;
    v276 = 0;
    v275 = 0;
    LODWORD(v279) = 0;
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 253.5;
    goto LABEL_130;
  }
LABEL_638:
  LODWORD(v283) = v28;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_642:
    v276 = 0;
    HIDWORD(v275) = 0;
    goto LABEL_689;
  }
  v107 = __sb__runningInSpringBoard();
  if (v107)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_642;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v181, "userInterfaceIdiom"))
    {
      HIDWORD(v275) = 0;
      v276 = 1;
      goto LABEL_689;
    }
  }
  v276 = v107 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "_referenceBounds");
    }
    HIDWORD(v275) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v279) = 0;
      LODWORD(v275) = 0;
      v273 = 0;
      v266 = 0;
      v270 = 0;
      v269 = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    HIDWORD(v275) = 0;
  }
LABEL_689:
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v279) = 0;
      LODWORD(v275) = 0;
      goto LABEL_699;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v190, "userInterfaceIdiom"))
    {
      LODWORD(v275) = 0;
      LODWORD(v279) = 1;
      goto LABEL_699;
    }
  }
  LODWORD(v279) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "_referenceBounds");
    }
    LODWORD(v275) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v117 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_703;
  }
  else
  {
    LODWORD(v275) = 0;
  }
LABEL_699:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v273 = 0;
    v266 = 0;
    v270 = 0;
    v269 = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 253.5;
    goto LABEL_130;
  }
LABEL_703:
  v118 = __sb__runningInSpringBoard();
  if (v118)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v273 = 0;
      HIDWORD(v266) = 0;
      goto LABEL_713;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v184, "userInterfaceIdiom"))
    {
      HIDWORD(v266) = 0;
      v273 = 1;
      goto LABEL_713;
    }
  }
  v273 = v118 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v119 = __sb__runningInSpringBoard();
    if (v119)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "_referenceBounds");
    }
    v28 = v119 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v266) = v28;
    if (v122 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v270 = 0;
      v269 = 0;
      LODWORD(v266) = 0;
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    HIDWORD(v266) = 0;
  }
LABEL_713:
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v270 = 0;
      HIDWORD(v269) = 0;
      goto LABEL_729;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v177, "userInterfaceIdiom"))
    {
      HIDWORD(v269) = 0;
      v270 = 1;
      goto LABEL_729;
    }
  }
  v270 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "_referenceBounds");
    }
    HIDWORD(v269) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v127 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_753;
  }
  else
  {
    HIDWORD(v269) = 0;
  }
LABEL_729:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v269) = 0;
    LODWORD(v266) = 0;
    v265 = 0;
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0.0;
    goto LABEL_130;
  }
LABEL_753:
  v128 = __sb__runningInSpringBoard();
  if (v128)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v269) = 0;
      LODWORD(v266) = 0;
      goto LABEL_773;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v175, "userInterfaceIdiom"))
    {
      LODWORD(v266) = 0;
      LODWORD(v269) = 1;
      goto LABEL_773;
    }
  }
  LODWORD(v269) = v128 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "_referenceBounds");
    }
    LODWORD(v266) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v133 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v265 = 0;
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v266) = 0;
  }
LABEL_773:
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v265 = 0;
      goto LABEL_789;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v170, "userInterfaceIdiom"))
    {
      v265 = 0x100000000;
      goto LABEL_789;
    }
  }
  HIDWORD(v265) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v265) = 0;
    goto LABEL_789;
  }
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "_referenceBounds");
  }
  LODWORD(v265) = v28 ^ 1;
  BSSizeRoundForScale();
  if (v135 < *(double *)(MEMORY[0x1E0DAB260] + 104))
  {
LABEL_789:
    if ((_SBF_Private_IsD53() & 1) != 0)
    {
      v261 = 0;
      v258 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 253.5;
      goto LABEL_130;
    }
  }
  v28 = (uint64_t)&qword_1D0490000;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
    goto LABEL_814;
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
    goto LABEL_816;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
LABEL_814:
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 309.0;
    goto LABEL_130;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
LABEL_816:
    v261 = 0;
    v258 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 263.66666;
    goto LABEL_130;
  }
  v28 = __sb__runningInSpringBoard();
  if ((_DWORD)v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v261 = 0;
      v258 = 0;
      goto LABEL_843;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v159, "userInterfaceIdiom"))
    {
      v258 = 0;
      v261 = 1;
      goto LABEL_843;
    }
  }
  v261 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v28 = __sb__runningInSpringBoard();
    if ((_DWORD)v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "_referenceBounds");
    }
    v258 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v145 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    v258 = 0;
  }
LABEL_843:
  v139 = __sb__runningInSpringBoard();
  if (v139)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v40 = 0;
      v41 = 0;
      goto LABEL_863;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v158, "userInterfaceIdiom"))
    {
      v41 = 0;
      v40 = 1;
      goto LABEL_863;
    }
  }
  v40 = v139 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v142 = __sb__runningInSpringBoard();
    if (v142)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "_referenceBounds");
    }
    v41 = v142 ^ 1;
    BSSizeRoundForScale();
    if (v153 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    v41 = 0;
  }
LABEL_863:
  v143 = __sb__runningInSpringBoard();
  if (!v143)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v28 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v28, "userInterfaceIdiom"))
    {
      v43 = 0;
      v42 = 1;
      goto LABEL_889;
    }
LABEL_885:
    v42 = v143 ^ 1;
    v149 = __sb__runningInSpringBoard();
    if (v149)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v26, "_referenceBounds");
    }
    v43 = v149 ^ 1;
    BSSizeRoundForScale();
    if (v150 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_892;
    goto LABEL_889;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_885;
  v42 = 0;
  v43 = 0;
LABEL_889:
  v151 = __sb__runningInSpringBoard();
  if ((_DWORD)v151)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_892:
      v44 = 0;
      v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom"))
    {
      v45 = 0.0;
      v44 = 1;
      goto LABEL_130;
    }
  }
  v44 = v151 ^ 1;
  v154 = __sb__runningInSpringBoard();
  if (v154)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v151 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v151, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v45 = 0.0;
  if (v154 != 1)

LABEL_130:
  if (v44)

  if (v43)
  if (v42)

  if (v41)
  if (v40)

  if (v258)
  if (v261)

  if ((_DWORD)v265)
  if (HIDWORD(v265))

  if ((_DWORD)v266)
  if ((_DWORD)v269)

  if (HIDWORD(v269))
  if (v270)

  if (HIDWORD(v266))
  if (v273)

  if ((_DWORD)v275)
  if ((_DWORD)v279)

  if (HIDWORD(v275))
  if (v276)

  if ((_DWORD)v283)
  if (HIDWORD(v283))

  if (HIDWORD(v279))
  if (v281)

  if ((_DWORD)v287)
  if (HIDWORD(v287))

  if ((_DWORD)v291)
  if (HIDWORD(v291))

  if (v284)
  if (v288)

  if ((_DWORD)v292)
  if ((_DWORD)v296)

  if (HIDWORD(v292))
  if (HIDWORD(v296))

  if ((_DWORD)v297)
  if (HIDWORD(v297))

  if ((_DWORD)v298)
  if (v304)

  if (v302)
  if (HIDWORD(v298))

  if (v306)
  if ((_DWORD)v308)

  if (HIDWORD(v308))
  if ((_DWORD)v315)

  if (HIDWORD(v315))
  if ((_DWORD)v310)

  if (HIDWORD(v310))
  if ((_DWORD)v311)

  if (HIDWORD(v311))
  if ((_DWORD)v312)

  if (HIDWORD(v312))
  if (v319)

  if (v320)
  if (v262)

  if ((_DWORD)v263)
  if (v259)

  if ((_DWORD)v260)
  if (HIDWORD(v263))

  if ((_DWORD)v264)
  if (HIDWORD(v260))

  if (HIDWORD(v264))
  if ((_DWORD)v267)

  if (HIDWORD(v267))
  if ((_DWORD)v268)

  if (v271)
  if ((_DWORD)v272)

  if (HIDWORD(v272))
  if (HIDWORD(v268))

  if (v274)
  if (v277)

  if ((_DWORD)v280)
  if ((_DWORD)v278)

  if (HIDWORD(v278))
  if (v285)

  if ((_DWORD)v286)
  if (HIDWORD(v280))

  if (v282)
  if (v289)

  if ((_DWORD)v290)
  if ((_DWORD)v293)

  if (HIDWORD(v293))
  if (HIDWORD(v286))

  if (HIDWORD(v290))
  if (v294)

  if (v299)
  if (v295)

  if ((_DWORD)v300)
  if (DWORD1(v300))

  if (DWORD2(v300))
  if (HIDWORD(v300))

  if ((_DWORD)v305)
  if (v303)

  if (v301)
  if ((_DWORD)v307)

  if ((_DWORD)v309)
  if (HIDWORD(v309))

  if ((_DWORD)v316)
  if (HIDWORD(v316))

  if ((_DWORD)v313)
  if (HIDWORD(v313))

  if (v317)
  if (v314)

  if (HIDWORD(v305))
  if (HIDWORD(v307))

  if (v318)
  if (v321)

  return v15 / v45;
}

- (CSMagSafeRingConfiguration)initWithRingDiameter:(SBFScreenSpecificCGFloatValue *)a3 lineWidth:(SBFScreenSpecificCGFloatValue *)a4 splashRingDiamter:(SBFScreenSpecificCGFloatValue *)a5
{
  CSMagSafeRingConfiguration *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  double v30;
  int v31;
  double v32;
  double v33;
  double v35;
  double v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  int v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  double v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  double *p_var26;
  double v61;
  int v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  unsigned int v74;
  int v75;
  int v76;
  unsigned int v77;
  int v78;
  int v79;
  double v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  double *p_var31;
  double v91;
  int v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CSMagSafeRingConfiguration *v97;
  double v99;
  int v100;
  double v101;
  int v102;
  double v103;
  int v104;
  double v105;
  int v106;
  double v107;
  int v108;
  double v109;
  int v110;
  double v111;
  double v112;
  double v113;
  double v114;
  int v115;
  int v116;
  double v117;
  int v118;
  int v119;
  double v120;
  int v121;
  int v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  int v130;
  double v131;
  int v132;
  double v133;
  int v134;
  int v135;
  int v136;
  int v137;
  double v138;
  double v139;
  double v140;
  double v141;
  int v142;
  double v143;
  int v144;
  double v145;
  int v146;
  int v147;
  int v148;
  int v149;
  double v150;
  int v151;
  int v152;
  int v153;
  int v154;
  double v155;
  int v156;
  int v157;
  int v158;
  int v159;
  double v160;
  int v161;
  double v162;
  double v163;
  double v164;
  double v165;
  int v166;
  int v167;
  double v168;
  int v169;
  int v170;
  double v171;
  int v172;
  int v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  int v181;
  double v182;
  int v183;
  double v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  double v206;
  int v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  int v216;
  double v217;
  int v218;
  double v219;
  int v220;
  double v221;
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
  int v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  int v295;
  int v296;
  int v297;
  int v298;
  int v299;
  int v300;
  int v301;
  int v302;
  int v303;
  int v304;
  int v305;
  int v306;
  _QWORD v307[14];
  int v308;
  SBFScreenSpecificCGFloatValue *v309;
  SBFScreenSpecificCGFloatValue *v310;
  CSMagSafeRingConfiguration *v311;
  objc_super v312;

  v309 = a4;
  v310 = a5;
  v312.receiver = self;
  v312.super_class = (Class)CSMagSafeRingConfiguration;
  v6 = -[CSMagSafeRingConfiguration init](&v312, sel_init);

  v311 = v6;
  if (!v6)
    goto LABEL_506;
  v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v273, "userInterfaceIdiom") != 1)
    {
      v8 = 0;
      v9 = 1;
      goto LABEL_11;
    }
  }
  v9 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "_referenceBounds");
    }
    v8 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v33 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v32 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      HIDWORD(v307[13]) = v10 ^ 1;
      v308 = v9;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      v292 = 0;
      v301 = 0;
      memset(v307, 0, 108);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 208);
      goto LABEL_68;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_11:
  v11 = __sb__runningInSpringBoard();
  HIDWORD(v307[13]) = v8;
  v308 = v9;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = 0;
      v13 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v272, "userInterfaceIdiom") != 1)
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_20;
    }
  }
  v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "_referenceBounds");
    }
    v12 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      HIDWORD(v307[12]) = v10 ^ 1;
      LODWORD(v307[13]) = v13;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      v292 = 0;
      v301 = 0;
      memset(v307, 0, 100);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 248);
      goto LABEL_68;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_20:
  v14 = __sb__runningInSpringBoard();
  HIDWORD(v307[12]) = v12;
  LODWORD(v307[13]) = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v15 = 0;
      v16 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v271, "userInterfaceIdiom") != 1)
    {
      v15 = 0;
      v16 = 1;
      goto LABEL_29;
    }
  }
  v16 = v14 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v262, "_referenceBounds");
    }
    v15 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      HIDWORD(v307[11]) = v10 ^ 1;
      LODWORD(v307[12]) = v16;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      v292 = 0;
      v301 = 0;
      memset(v307, 0, 92);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 232);
      goto LABEL_68;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_29:
  v17 = __sb__runningInSpringBoard();
  HIDWORD(v307[11]) = v15;
  LODWORD(v307[12]) = v16;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v307[10]) = 0;
      v18 = 0;
      goto LABEL_38;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v270, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v307[10]) = 0;
      v18 = 1;
      goto LABEL_38;
    }
  }
  v18 = v17 ^ 1;
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "_referenceBounds");
  }
  HIDWORD(v307[10]) = v10 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    LODWORD(v307[11]) = v18;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    memset(v307, 0, 84);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 240);
    goto LABEL_68;
  }
LABEL_38:
  v21 = __sb__runningInSpringBoard();
  LODWORD(v307[11]) = v18;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v307[9] + 4) = 0;
      goto LABEL_48;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v269, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v307[9] + 4) = 0x100000000;
      goto LABEL_48;
    }
  }
  LODWORD(v307[10]) = v21 ^ 1;
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v265, "_referenceBounds");
  }
  HIDWORD(v307[9]) = v10 ^ 1;
  BSSizeRoundForScale();
  if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    memset(v307, 0, 76);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 224);
    goto LABEL_68;
  }
LABEL_48:
  v31 = __sb__runningInSpringBoard();
  if (v31)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v307[8] + 4) = 0;
      goto LABEL_519;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v268, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v307[8]) = 0;
      LODWORD(v307[9]) = 1;
      goto LABEL_519;
    }
  }
  LODWORD(v307[9]) = v31 ^ 1;
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "_referenceBounds");
  }
  HIDWORD(v307[8]) = v10 ^ 1;
  BSSizeRoundForScale();
  if (v99 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    memset(v307, 0, 68);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 216);
    goto LABEL_68;
  }
LABEL_519:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_521;
LABEL_527:
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    memset(v307, 0, 64);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 200);
    LODWORD(v307[8]) = v10 ^ 1;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v266, "userInterfaceIdiom") == 1)
    goto LABEL_527;
LABEL_521:
  LODWORD(v307[8]) = v10 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_525:
    *(_QWORD *)((char *)&v307[6] + 4) = 0;
    goto LABEL_565;
  }
  v100 = __sb__runningInSpringBoard();
  if (v100)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_525;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v259, "userInterfaceIdiom"))
    {
      *(_QWORD *)((char *)&v307[6] + 4) = 0x100000000;
      goto LABEL_565;
    }
  }
  LODWORD(v307[7]) = v100 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    HIDWORD(v307[6]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v111 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      v292 = 0;
      v301 = 0;
      memset(v307, 0, 52);
      HIDWORD(v307[7]) = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 168);
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v307[6]) = 0;
  }
LABEL_565:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[6]) = 0;
      HIDWORD(v307[7]) = 0;
      goto LABEL_575;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v260, "userInterfaceIdiom"))
    {
      LODWORD(v307[6]) = 0;
      HIDWORD(v307[7]) = 1;
      goto LABEL_575;
    }
  }
  HIDWORD(v307[7]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "_referenceBounds");
    }
    LODWORD(v307[6]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v105 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_579;
  }
  else
  {
    LODWORD(v307[6]) = 0;
  }
LABEL_575:
  if (_SBF_Private_IsD94Like())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    memset(v307, 0, 48);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 176);
    goto LABEL_68;
  }
LABEL_579:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_583:
    v307[5] = 0;
    goto LABEL_649;
  }
  v106 = __sb__runningInSpringBoard();
  if (v106)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_583;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v256, "userInterfaceIdiom"))
    {
      v307[5] = 0x100000000;
      goto LABEL_649;
    }
  }
  HIDWORD(v307[5]) = v106 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "_referenceBounds");
    }
    LODWORD(v307[5]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v126 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      v292 = 0;
      v301 = 0;
      memset(v307, 0, 40);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 184);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v307[5]) = 0;
  }
LABEL_649:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 0;
      goto LABEL_659;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v258, "userInterfaceIdiom"))
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 1;
      goto LABEL_659;
    }
  }
  HIDWORD(v307[4]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "_referenceBounds");
    }
    HIDWORD(v307[3]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v114 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_663;
  }
  else
  {
    HIDWORD(v307[3]) = 0;
  }
LABEL_659:
  if (_SBF_Private_IsD64Like())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    memset(v307, 0, 28);
    LODWORD(v307[4]) = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 192);
    goto LABEL_68;
  }
LABEL_663:
  v115 = __sb__runningInSpringBoard();
  if (v115)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[3]) = 0;
      LODWORD(v307[4]) = 0;
      goto LABEL_673;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v257, "userInterfaceIdiom"))
    {
      LODWORD(v307[3]) = 0;
      LODWORD(v307[4]) = 1;
      goto LABEL_673;
    }
  }
  LODWORD(v307[4]) = v115 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v116 = __sb__runningInSpringBoard();
    if (v116)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "_referenceBounds");
    }
    v10 = v116 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[3]) = v10;
    if (v123 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      v292 = 0;
      v301 = 0;
      memset(v307, 0, 24);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 152);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v307[3]) = 0;
  }
LABEL_673:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[0]) = 0;
      HIDWORD(v307[1]) = 0;
      goto LABEL_751;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v254, "userInterfaceIdiom"))
    {
      LODWORD(v307[0]) = 0;
      HIDWORD(v307[1]) = 1;
      goto LABEL_751;
    }
  }
  HIDWORD(v307[1]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "_referenceBounds");
    }
    LODWORD(v307[0]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v129 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_785;
  }
  else
  {
    LODWORD(v307[0]) = 0;
  }
LABEL_751:
  if (_SBF_Private_IsD54())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    *(_QWORD *)((char *)v307 + 4) = 0;
    v307[2] = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 160);
    goto LABEL_68;
  }
LABEL_785:
  v130 = __sb__runningInSpringBoard();
  if (v130)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v307[2] = 0;
      goto LABEL_811;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v253, "userInterfaceIdiom"))
    {
      v307[2] = 0x100000000;
      goto LABEL_811;
    }
  }
  HIDWORD(v307[2]) = v130 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v135 = __sb__runningInSpringBoard();
    if (v135)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "_referenceBounds");
    }
    v10 = v135 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[2]) = v10;
    if (v138 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      v292 = 0;
      v301 = 0;
      *(_QWORD *)((char *)v307 + 4) = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 104);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v307[2]) = 0;
  }
LABEL_811:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)((char *)v307 + 4) = 0;
      goto LABEL_841;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "userInterfaceIdiom"))
    {
      *(_QWORD *)((char *)v307 + 4) = 0x100000000;
      goto LABEL_841;
    }
  }
  LODWORD(v307[1]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "_referenceBounds");
    }
    HIDWORD(v307[0]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_872;
  }
  else
  {
    HIDWORD(v307[0]) = 0;
  }
LABEL_841:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    v304 = 0;
    v298 = 0;
    v292 = 0;
    v301 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 112);
    goto LABEL_68;
  }
LABEL_872:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_876:
    v292 = 0;
    v301 = 0;
    goto LABEL_901;
  }
  v142 = __sb__runningInSpringBoard();
  if (v142)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_876;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v245, "userInterfaceIdiom"))
    {
      v292 = 0;
      v301 = 1;
      goto LABEL_901;
    }
  }
  v301 = v142 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v147 = __sb__runningInSpringBoard();
    if (v147)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "_referenceBounds");
    }
    v10 = v147 ^ 1u;
    BSSizeRoundForScale();
    v292 = v10;
    if (v162 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      v285 = 0;
      v288 = 0;
      v295 = 0;
      v304 = 0;
      v298 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 88);
      goto LABEL_68;
    }
  }
  else
  {
    v292 = 0;
  }
LABEL_901:
  v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v10 = 0;
      v298 = 0;
      goto LABEL_911;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v249, "userInterfaceIdiom"))
    {
      v10 = 0;
      v298 = 1;
      goto LABEL_911;
    }
  }
  v298 = v148 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v149 = __sb__runningInSpringBoard();
    if (v149)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "_referenceBounds");
    }
    v10 = v149 ^ 1u;
    BSSizeRoundForScale();
    if (v150 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_915;
  }
  else
  {
    v10 = 0;
  }
LABEL_911:
  if (_SBF_Private_IsD93Like())
  {
    v304 = v10;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    v285 = 0;
    v288 = 0;
    v295 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 96);
    goto LABEL_68;
  }
LABEL_915:
  v304 = v10;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_919:
    HIDWORD(v288) = 0;
    HIDWORD(v285) = 0;
    goto LABEL_985;
  }
  v151 = __sb__runningInSpringBoard();
  if (v151)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_919;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v240, "userInterfaceIdiom"))
    {
      HIDWORD(v288) = 0;
      HIDWORD(v285) = 1;
      goto LABEL_985;
    }
  }
  HIDWORD(v285) = v151 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "_referenceBounds");
    }
    HIDWORD(v288) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v177 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v276 = 0;
      v279 = 0;
      v275 = 0;
      v282 = 0;
      LODWORD(v285) = 0;
      LODWORD(v288) = 0;
      v295 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 136);
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v288) = 0;
  }
LABEL_985:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v288) = 0;
      v295 = 0;
      goto LABEL_995;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v244, "userInterfaceIdiom"))
    {
      LODWORD(v288) = 0;
      v295 = 1;
      goto LABEL_995;
    }
  }
  v295 = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "_referenceBounds");
    }
    LODWORD(v288) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v165 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_999;
  }
  else
  {
    LODWORD(v288) = 0;
  }
LABEL_995:
  if (_SBF_Private_IsD63Like())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v276 = 0;
    v279 = 0;
    v275 = 0;
    v282 = 0;
    LODWORD(v285) = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 144);
    goto LABEL_68;
  }
LABEL_999:
  v166 = __sb__runningInSpringBoard();
  if (v166)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v276) = 0;
      LODWORD(v285) = 0;
      goto LABEL_1009;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v241, "userInterfaceIdiom"))
    {
      HIDWORD(v276) = 0;
      LODWORD(v285) = 1;
      goto LABEL_1009;
    }
  }
  LODWORD(v285) = v166 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v167 = __sb__runningInSpringBoard();
    if (v167)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "_referenceBounds");
    }
    v10 = v167 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v276) = v10;
    if (v174 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v279 = 0;
      v282 = 0;
      v275 = 0;
      LODWORD(v276) = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 120);
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v276) = 0;
  }
LABEL_1009:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v282 = 0;
      goto LABEL_1087;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v238, "userInterfaceIdiom"))
    {
      v282 = 0x100000000;
      goto LABEL_1087;
    }
  }
  HIDWORD(v282) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "_referenceBounds");
    }
    LODWORD(v282) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v180 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1121;
  }
  else
  {
    LODWORD(v282) = 0;
  }
LABEL_1087:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v279 = 0;
    v275 = 0;
    LODWORD(v276) = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 128);
    goto LABEL_68;
  }
LABEL_1121:
  v181 = __sb__runningInSpringBoard();
  if (v181)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v276) = 0;
      HIDWORD(v279) = 0;
      goto LABEL_1147;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v237, "userInterfaceIdiom"))
    {
      LODWORD(v276) = 0;
      HIDWORD(v279) = 1;
      goto LABEL_1147;
    }
  }
  HIDWORD(v279) = v181 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "_referenceBounds");
    }
    LODWORD(v276) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v192 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      LODWORD(v279) = 0;
      v275 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 72);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v276) = 0;
  }
LABEL_1147:
  v186 = __sb__runningInSpringBoard();
  if (v186)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v10 = 0;
      v275 = 0;
      goto LABEL_1177;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v234, "userInterfaceIdiom"))
    {
      v10 = 0;
      v275 = 1;
      goto LABEL_1177;
    }
  }
  v275 = v186 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v189 = __sb__runningInSpringBoard();
    if (v189)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "_referenceBounds");
    }
    v10 = v189 ^ 1u;
    BSSizeRoundForScale();
    if (v195 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1202;
  }
  else
  {
    v10 = 0;
  }
LABEL_1177:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v279) = v10;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 80);
    goto LABEL_68;
  }
LABEL_1202:
  LODWORD(v279) = v10;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 40);
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 48);
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 24);
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 32);
    goto LABEL_68;
  }
  v198 = __sb__runningInSpringBoard();
  if (v198)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v28 = 0;
      v29 = 0;
      goto LABEL_1258;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v228, "userInterfaceIdiom"))
    {
      v28 = 0;
      v29 = 1;
      goto LABEL_1258;
    }
  }
  v29 = v198 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v10 = __sb__runningInSpringBoard();
    if ((_DWORD)v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "_referenceBounds");
    }
    v28 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v210 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 56);
      goto LABEL_68;
    }
  }
  else
  {
    v28 = 0;
  }
LABEL_1258:
  v10 = __sb__runningInSpringBoard();
  if ((_DWORD)v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v26 = 0;
      v27 = 0;
      goto LABEL_1288;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v227, "userInterfaceIdiom"))
    {
      v26 = 0;
      v27 = 1;
      goto LABEL_1288;
    }
  }
  v27 = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v203 = __sb__runningInSpringBoard();
    if (v203)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "_referenceBounds");
    }
    v26 = v203 ^ 1;
    BSSizeRoundForScale();
    if (v213 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 64);
      goto LABEL_68;
    }
  }
  else
  {
    v26 = 0;
  }
LABEL_1288:
  v204 = __sb__runningInSpringBoard();
  if (!v204)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v226, "userInterfaceIdiom"))
    {
      v24 = 0;
      v25 = 1;
      goto LABEL_1318;
    }
LABEL_1314:
    v25 = v204 ^ 1;
    v205 = __sb__runningInSpringBoard();
    if (v205)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "_referenceBounds");
    }
    v24 = v205 ^ 1;
    BSSizeRoundForScale();
    if (v206 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
    {
      v22 = 0;
      v23 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 16);
      goto LABEL_68;
    }
    goto LABEL_1318;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_1314;
  v24 = 0;
  v25 = 0;
LABEL_1318:
  v207 = __sb__runningInSpringBoard();
  if (v207)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v22 = 0;
      v23 = 0;
      goto LABEL_68;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v10 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v10, "userInterfaceIdiom"))
    {
      v22 = 0;
      v23 = 1;
      goto LABEL_68;
    }
  }
  v23 = v207 ^ 1;
  v216 = __sb__runningInSpringBoard();
  if (v216)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "_referenceBounds");
  }
  v22 = v216 ^ 1;
  BSSizeRoundForScale();
  if (v217 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 8);
  v19 = v222;
LABEL_68:
  v311->_ringDiameter = a3->var0;
  if (v22)

  if (v23)
  if (v24)

  if (v25)
  v37 = LODWORD(v307[11]);
  if (v26)

  if (v27)
  if (v28)

  if (v29)
  if ((_DWORD)v279)

  if (v275)
  if ((_DWORD)v276)

  if (HIDWORD(v279))
  if ((_DWORD)v282)

  if (HIDWORD(v282))
  if (HIDWORD(v276))

  if ((_DWORD)v285)
  if ((_DWORD)v288)

  if (v295)
  if (HIDWORD(v288))

  if (HIDWORD(v285))
  if (v304)

  if (v298)
  if (v292)

  if (v301)
  if (HIDWORD(v307[0]))

  if (LODWORD(v307[1]))
  if (LODWORD(v307[2]))

  if (HIDWORD(v307[2]))
  if (LODWORD(v307[0]))

  if (HIDWORD(v307[1]))
  if (LODWORD(v307[3]))

  if (LODWORD(v307[4]))
  if (HIDWORD(v307[3]))

  if (HIDWORD(v307[4]))
  if (LODWORD(v307[5]))

  if (HIDWORD(v307[5]))
  if (LODWORD(v307[6]))

  if (HIDWORD(v307[7]))
  if (HIDWORD(v307[6]))

  if (LODWORD(v307[7]))
  if (LODWORD(v307[8]))

  if (HIDWORD(v307[8]))
  if (LODWORD(v307[9]))

  if (HIDWORD(v307[9]))
  if (LODWORD(v307[10]))

  if (HIDWORD(v307[10]))
  {

    if (!LODWORD(v307[11]))
      goto LABEL_160;
  }
  else if (!LODWORD(v307[11]))
  {
LABEL_160:
    if (HIDWORD(v307[11]))
      goto LABEL_161;
    goto LABEL_169;
  }

  if (HIDWORD(v307[11]))
  {
LABEL_161:

    if (!LODWORD(v307[12]))
      goto LABEL_162;
    goto LABEL_170;
  }
LABEL_169:
  if (!LODWORD(v307[12]))
  {
LABEL_162:
    if (HIDWORD(v307[12]))
      goto LABEL_163;
    goto LABEL_171;
  }
LABEL_170:

  if (HIDWORD(v307[12]))
  {
LABEL_163:

    if (!LODWORD(v307[13]))
      goto LABEL_164;
    goto LABEL_172;
  }
LABEL_171:
  if (!LODWORD(v307[13]))
  {
LABEL_164:
    if (HIDWORD(v307[13]))
      goto LABEL_165;
LABEL_173:
    if (!v308)
      goto LABEL_175;
    goto LABEL_174;
  }
LABEL_172:

  if (!HIDWORD(v307[13]))
    goto LABEL_173;
LABEL_165:

  if (v308)
LABEL_174:

LABEL_175:
  v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v39 = 0;
      v40 = 0;
      goto LABEL_184;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v273, "userInterfaceIdiom") != 1)
    {
      v40 = 0;
      v39 = 1;
      goto LABEL_184;
    }
  }
  v39 = v38 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "_referenceBounds");
    }
    v40 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v64 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v63 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      HIDWORD(v307[13]) = v41 ^ 1;
      v308 = v39;
      memset(v307, 0, 108);
      v302 = 0;
      v293 = 0;
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var26;
      goto LABEL_238;
    }
  }
  else
  {
    v40 = 0;
  }
LABEL_184:
  v42 = __sb__runningInSpringBoard();
  HIDWORD(v307[13]) = v40;
  v308 = v39;
  if (v42)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v43 = 0;
      v44 = 0;
      goto LABEL_193;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v272, "userInterfaceIdiom") != 1)
    {
      v44 = 0;
      v43 = 1;
      goto LABEL_193;
    }
  }
  v43 = v42 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "_referenceBounds");
    }
    v44 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      HIDWORD(v307[12]) = v41 ^ 1;
      LODWORD(v307[13]) = v43;
      memset(v307, 0, 100);
      v302 = 0;
      v293 = 0;
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var31;
      goto LABEL_238;
    }
  }
  else
  {
    v44 = 0;
  }
LABEL_193:
  v45 = __sb__runningInSpringBoard();
  *(_QWORD *)((char *)&v307[12] + 4) = __PAIR64__(v43, v44);
  if (v45)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v46 = 0;
      v47 = 0;
      goto LABEL_202;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v271, "userInterfaceIdiom") != 1)
    {
      v47 = 0;
      v46 = 1;
      goto LABEL_202;
    }
  }
  v46 = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v262, "_referenceBounds");
    }
    v47 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      HIDWORD(v307[11]) = v41 ^ 1;
      LODWORD(v307[12]) = v46;
      memset(v307, 0, 92);
      v302 = 0;
      v293 = 0;
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var29;
      goto LABEL_238;
    }
  }
  else
  {
    v47 = 0;
  }
LABEL_202:
  v48 = __sb__runningInSpringBoard();
  *(_QWORD *)((char *)&v307[11] + 4) = __PAIR64__(v46, v47);
  if (v48)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v37 = 0;
      v49 = 0;
      goto LABEL_211;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v270, "userInterfaceIdiom") != 1)
    {
      v49 = 0;
      v37 = 1;
      goto LABEL_211;
    }
  }
  v37 = v48 ^ 1u;
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "_referenceBounds");
  }
  v49 = v41 ^ 1;
  BSSizeRoundForScale();
  if (v50 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    HIDWORD(v307[10]) = v41 ^ 1;
    LODWORD(v307[11]) = v37;
    memset(v307, 0, 84);
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var30;
    goto LABEL_238;
  }
LABEL_211:
  v51 = __sb__runningInSpringBoard();
  *(_QWORD *)((char *)&v307[10] + 4) = __PAIR64__(v37, v49);
  if (v51)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v307[9] + 4) = 0;
      goto LABEL_221;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v269, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v307[9] + 4) = 0x100000000;
      goto LABEL_221;
    }
  }
  LODWORD(v307[10]) = v51 ^ 1;
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v265, "_referenceBounds");
  }
  HIDWORD(v307[9]) = v41 ^ 1;
  BSSizeRoundForScale();
  if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    memset(v307, 0, 76);
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var28;
    goto LABEL_238;
  }
LABEL_221:
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v307[8] + 4) = 0;
      goto LABEL_531;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v268, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v307[8] + 4) = 0x100000000;
      goto LABEL_531;
    }
  }
  LODWORD(v307[9]) = v62 ^ 1;
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "_referenceBounds");
  }
  HIDWORD(v307[8]) = v41 ^ 1;
  BSSizeRoundForScale();
  if (v101 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v307, 0, 68);
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var27;
    goto LABEL_238;
  }
LABEL_531:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_533;
LABEL_539:
    memset(v307, 0, 64);
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var25;
    LODWORD(v307[8]) = v41 ^ 1;
    goto LABEL_238;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v266, "userInterfaceIdiom") == 1)
    goto LABEL_539;
LABEL_533:
  LODWORD(v307[8]) = v41 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_537:
    *(_QWORD *)((char *)&v307[6] + 4) = 0;
    goto LABEL_590;
  }
  v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_537;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v259, "userInterfaceIdiom"))
    {
      *(_QWORD *)((char *)&v307[6] + 4) = 0x100000000;
      goto LABEL_590;
    }
  }
  LODWORD(v307[7]) = v102 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    HIDWORD(v307[6]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v112 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      HIDWORD(v307[7]) = 0;
      memset(v307, 0, 52);
      v302 = 0;
      v293 = 0;
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var21;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v307[6]) = 0;
  }
LABEL_590:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[7]) = 0;
      LODWORD(v307[6]) = 0;
      goto LABEL_600;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v260, "userInterfaceIdiom"))
    {
      LODWORD(v307[6]) = 0;
      HIDWORD(v307[7]) = 1;
      goto LABEL_600;
    }
  }
  HIDWORD(v307[7]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "_referenceBounds");
    }
    LODWORD(v307[6]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v107 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_604;
  }
  else
  {
    LODWORD(v307[6]) = 0;
  }
LABEL_600:
  if (_SBF_Private_IsD94Like())
  {
    memset(v307, 0, 48);
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var22;
    goto LABEL_238;
  }
LABEL_604:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_608:
    v307[5] = 0;
    goto LABEL_683;
  }
  v108 = __sb__runningInSpringBoard();
  if (v108)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_608;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v256, "userInterfaceIdiom"))
    {
      v307[5] = 0x100000000;
      goto LABEL_683;
    }
  }
  HIDWORD(v307[5]) = v108 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "_referenceBounds");
    }
    LODWORD(v307[5]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v127 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v307, 0, 40);
      v302 = 0;
      v293 = 0;
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var23;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v307[5]) = 0;
  }
LABEL_683:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[4]) = 0;
      HIDWORD(v307[3]) = 0;
      goto LABEL_693;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v258, "userInterfaceIdiom"))
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 1;
      goto LABEL_693;
    }
  }
  HIDWORD(v307[4]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "_referenceBounds");
    }
    HIDWORD(v307[3]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v117 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_697;
  }
  else
  {
    HIDWORD(v307[3]) = 0;
  }
LABEL_693:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v307[4]) = 0;
    memset(v307, 0, 28);
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var24;
    goto LABEL_238;
  }
LABEL_697:
  v118 = __sb__runningInSpringBoard();
  if (v118)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[4]) = 0;
      LODWORD(v307[3]) = 0;
      goto LABEL_707;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v257, "userInterfaceIdiom"))
    {
      LODWORD(v307[3]) = 0;
      LODWORD(v307[4]) = 1;
      goto LABEL_707;
    }
  }
  LODWORD(v307[4]) = v118 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v119 = __sb__runningInSpringBoard();
    if (v119)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "_referenceBounds");
    }
    v41 = v119 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[3]) = v41;
    if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v307, 0, 24);
      v302 = 0;
      v293 = 0;
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var19;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v307[3]) = 0;
  }
LABEL_707:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[1]) = 0;
      LODWORD(v307[0]) = 0;
      goto LABEL_757;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v254, "userInterfaceIdiom"))
    {
      LODWORD(v307[0]) = 0;
      HIDWORD(v307[1]) = 1;
      goto LABEL_757;
    }
  }
  HIDWORD(v307[1]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "_referenceBounds");
    }
    LODWORD(v307[0]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_793;
  }
  else
  {
    LODWORD(v307[0]) = 0;
  }
LABEL_757:
  if (_SBF_Private_IsD54())
  {
    v307[2] = 0;
    *(_QWORD *)((char *)v307 + 4) = 0;
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var20;
    goto LABEL_238;
  }
LABEL_793:
  v132 = __sb__runningInSpringBoard();
  if (v132)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v307[2] = 0;
      goto LABEL_821;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v253, "userInterfaceIdiom"))
    {
      v307[2] = 0x100000000;
      goto LABEL_821;
    }
  }
  HIDWORD(v307[2]) = v132 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v136 = __sb__runningInSpringBoard();
    if (v136)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "_referenceBounds");
    }
    v41 = v136 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[2]) = v41;
    if (v139 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      *(_QWORD *)((char *)v307 + 4) = 0;
      v302 = 0;
      v293 = 0;
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var13;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v307[2]) = 0;
  }
LABEL_821:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)((char *)v307 + 4) = 0;
      goto LABEL_848;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "userInterfaceIdiom"))
    {
      HIDWORD(v307[0]) = 0;
      LODWORD(v307[1]) = 1;
      goto LABEL_848;
    }
  }
  LODWORD(v307[1]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "_referenceBounds");
    }
    HIDWORD(v307[0]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v143 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_881;
  }
  else
  {
    HIDWORD(v307[0]) = 0;
  }
LABEL_848:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    v302 = 0;
    v293 = 0;
    v299 = 0;
    v305 = 0;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var14;
    goto LABEL_238;
  }
LABEL_881:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_885:
    v302 = 0;
    v293 = 0;
    goto LABEL_926;
  }
  v144 = __sb__runningInSpringBoard();
  if (v144)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_885;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v245, "userInterfaceIdiom"))
    {
      v293 = 0;
      v302 = 1;
      goto LABEL_926;
    }
  }
  v302 = v144 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v152 = __sb__runningInSpringBoard();
    if (v152)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "_referenceBounds");
    }
    v41 = v152 ^ 1u;
    BSSizeRoundForScale();
    v293 = v41;
    if (v163 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v299 = 0;
      v305 = 0;
      v286 = 0;
      v289 = 0;
      v296 = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var11;
      goto LABEL_238;
    }
  }
  else
  {
    v293 = 0;
  }
LABEL_926:
  v153 = __sb__runningInSpringBoard();
  if (v153)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v299 = 0;
      v41 = 0;
      goto LABEL_936;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v249, "userInterfaceIdiom"))
    {
      v41 = 0;
      v299 = 1;
      goto LABEL_936;
    }
  }
  v299 = v153 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v154 = __sb__runningInSpringBoard();
    if (v154)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "_referenceBounds");
    }
    v41 = v154 ^ 1u;
    BSSizeRoundForScale();
    if (v155 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_940;
  }
  else
  {
    v41 = 0;
  }
LABEL_936:
  if (_SBF_Private_IsD93Like())
  {
    v305 = v41;
    v286 = 0;
    v289 = 0;
    v296 = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var12;
    goto LABEL_238;
  }
LABEL_940:
  v305 = v41;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_944:
    HIDWORD(v286) = 0;
    HIDWORD(v289) = 0;
    goto LABEL_1019;
  }
  v156 = __sb__runningInSpringBoard();
  if (v156)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_944;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v240, "userInterfaceIdiom"))
    {
      HIDWORD(v289) = 0;
      HIDWORD(v286) = 1;
      goto LABEL_1019;
    }
  }
  HIDWORD(v286) = v156 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "_referenceBounds");
    }
    HIDWORD(v289) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v178 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v296 = 0;
      LODWORD(v289) = 0;
      LODWORD(v286) = 0;
      v277 = 0;
      v280 = 0;
      v283 = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var17;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v289) = 0;
  }
LABEL_1019:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v296 = 0;
      LODWORD(v289) = 0;
      goto LABEL_1029;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v244, "userInterfaceIdiom"))
    {
      LODWORD(v289) = 0;
      v296 = 1;
      goto LABEL_1029;
    }
  }
  v296 = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "_referenceBounds");
    }
    LODWORD(v289) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v168 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1033;
  }
  else
  {
    LODWORD(v289) = 0;
  }
LABEL_1029:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v286) = 0;
    v277 = 0;
    v280 = 0;
    v283 = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var18;
    goto LABEL_238;
  }
LABEL_1033:
  v169 = __sb__runningInSpringBoard();
  if (v169)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v286) = 0;
      HIDWORD(v277) = 0;
      goto LABEL_1043;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v241, "userInterfaceIdiom"))
    {
      HIDWORD(v277) = 0;
      LODWORD(v286) = 1;
      goto LABEL_1043;
    }
  }
  LODWORD(v286) = v169 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v170 = __sb__runningInSpringBoard();
    if (v170)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "_referenceBounds");
    }
    v41 = v170 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v277) = v41;
    if (v175 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v280 = 0;
      v283 = 0;
      LODWORD(v277) = 0;
      LODWORD(v274) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var15;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v277) = 0;
  }
LABEL_1043:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v283 = 0;
      goto LABEL_1093;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v238, "userInterfaceIdiom"))
    {
      v283 = 0x100000000;
      goto LABEL_1093;
    }
  }
  HIDWORD(v283) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "_referenceBounds");
    }
    LODWORD(v283) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v182 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1129;
  }
  else
  {
    LODWORD(v283) = 0;
  }
LABEL_1093:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    v280 = 0;
    LODWORD(v277) = 0;
    LODWORD(v274) = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var16;
    goto LABEL_238;
  }
LABEL_1129:
  v183 = __sb__runningInSpringBoard();
  if (v183)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v280) = 0;
      LODWORD(v277) = 0;
      goto LABEL_1157;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v237, "userInterfaceIdiom"))
    {
      LODWORD(v277) = 0;
      HIDWORD(v280) = 1;
      goto LABEL_1157;
    }
  }
  HIDWORD(v280) = v183 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "_referenceBounds");
    }
    LODWORD(v277) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v193 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v274) = 0;
      LODWORD(v280) = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var9;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v277) = 0;
  }
LABEL_1157:
  v187 = __sb__runningInSpringBoard();
  if (v187)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v274) = 0;
      v41 = 0;
      goto LABEL_1183;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v234, "userInterfaceIdiom"))
    {
      v41 = 0;
      LODWORD(v274) = 1;
      goto LABEL_1183;
    }
  }
  LODWORD(v274) = v187 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v190 = __sb__runningInSpringBoard();
    if (v190)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "_referenceBounds");
    }
    v41 = v190 ^ 1u;
    BSSizeRoundForScale();
    if (v196 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1214;
  }
  else
  {
    v41 = 0;
  }
LABEL_1183:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v280) = v41;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var10;
    goto LABEL_238;
  }
LABEL_1214:
  LODWORD(v280) = v41;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var5;
    goto LABEL_238;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var6;
    goto LABEL_238;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var3;
    goto LABEL_238;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var4;
    goto LABEL_238;
  }
  v199 = __sb__runningInSpringBoard();
  if (v199)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v52 = 0;
      v53 = 0;
      goto LABEL_1268;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v228, "userInterfaceIdiom"))
    {
      v53 = 0;
      v52 = 1;
      goto LABEL_1268;
    }
  }
  v52 = v199 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "_referenceBounds");
    }
    v53 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v211 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var7;
      goto LABEL_238;
    }
  }
  else
  {
    v53 = 0;
  }
LABEL_1268:
  v201 = __sb__runningInSpringBoard();
  if (v201)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v54 = 0;
      v55 = 0;
      goto LABEL_1298;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v227, "userInterfaceIdiom"))
    {
      v55 = 0;
      v54 = 1;
      goto LABEL_1298;
    }
  }
  v54 = v201 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if ((_DWORD)v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "_referenceBounds");
    }
    v55 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v214 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      p_var26 = &v309->var8;
      goto LABEL_238;
    }
  }
  else
  {
    v55 = 0;
  }
LABEL_1298:
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v56 = 0;
      v57 = 0;
      goto LABEL_1329;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v226, "userInterfaceIdiom"))
    {
      v57 = 0;
      v56 = 1;
      goto LABEL_1329;
    }
  }
  v56 = v41 ^ 1;
  v41 = __sb__runningInSpringBoard();
  if ((_DWORD)v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "_referenceBounds");
  }
  v57 = v41 ^ 1;
  BSSizeRoundForScale();
  if (v208 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v58 = 0;
    v59 = 0;
    p_var26 = &v309->var2;
    goto LABEL_238;
  }
LABEL_1329:
  v37 = __sb__runningInSpringBoard();
  if ((_DWORD)v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v58 = 0;
      v59 = 0;
LABEL_1375:
      p_var26 = &v309->var0;
      goto LABEL_238;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v41 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v41, "userInterfaceIdiom"))
    {
      v59 = 0;
      v58 = 1;
      goto LABEL_1375;
    }
  }
  v58 = v37 ^ 1;
  v218 = __sb__runningInSpringBoard();
  if (v218)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v37, "_referenceBounds");
  }
  v59 = v218 ^ 1;
  BSSizeRoundForScale();
  if (v219 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_1375;
  p_var26 = &v309->var1;
LABEL_238:
  v311->_lineWidth = *p_var26;
  if (v59)

  if (v58)
  v67 = HIDWORD(v307[10]);
  if (v57)

  if (v56)
  if (v55)

  if (v54)
  if (v53)

  if (v52)
  if ((_DWORD)v280)

  if ((_DWORD)v274)
  if ((_DWORD)v277)

  if (HIDWORD(v280))
  if ((_DWORD)v283)

  if (HIDWORD(v283))
  if (HIDWORD(v277))

  if ((_DWORD)v286)
  if ((_DWORD)v289)

  if (v296)
  if (HIDWORD(v289))

  if (HIDWORD(v286))
  if (v305)

  if (v299)
  if (v293)

  if (v302)
  if (HIDWORD(v307[0]))

  if (LODWORD(v307[1]))
  if (LODWORD(v307[2]))

  if (HIDWORD(v307[2]))
  if (LODWORD(v307[0]))

  if (HIDWORD(v307[1]))
  if (LODWORD(v307[3]))

  if (LODWORD(v307[4]))
  if (HIDWORD(v307[3]))

  if (HIDWORD(v307[4]))
  if (LODWORD(v307[5]))

  if (HIDWORD(v307[5]))
  if (LODWORD(v307[6]))

  if (HIDWORD(v307[7]))
  if (HIDWORD(v307[6]))

  if (LODWORD(v307[7]))
  if (LODWORD(v307[8]))

  if (HIDWORD(v307[8]))
  if (LODWORD(v307[9]))

  if (HIDWORD(v307[9]))
  if (LODWORD(v307[10]))
  {

    if (!HIDWORD(v307[10]))
      goto LABEL_328;
  }
  else if (!HIDWORD(v307[10]))
  {
LABEL_328:
    if (LODWORD(v307[11]))
      goto LABEL_329;
    goto LABEL_341;
  }

  if (LODWORD(v307[11]))
  {
LABEL_329:

    if (!HIDWORD(v307[11]))
      goto LABEL_330;
    goto LABEL_342;
  }
LABEL_341:
  if (!HIDWORD(v307[11]))
  {
LABEL_330:
    if (LODWORD(v307[12]))
      goto LABEL_331;
    goto LABEL_343;
  }
LABEL_342:

  if (LODWORD(v307[12]))
  {
LABEL_331:

    if (!HIDWORD(v307[12]))
      goto LABEL_332;
    goto LABEL_344;
  }
LABEL_343:
  if (!HIDWORD(v307[12]))
  {
LABEL_332:
    if (LODWORD(v307[13]))
      goto LABEL_333;
    goto LABEL_345;
  }
LABEL_344:

  if (LODWORD(v307[13]))
  {
LABEL_333:

    if (!HIDWORD(v307[13]))
      goto LABEL_334;
    goto LABEL_346;
  }
LABEL_345:
  if (!HIDWORD(v307[13]))
  {
LABEL_334:
    if (!v308)
      goto LABEL_336;
    goto LABEL_335;
  }
LABEL_346:

  if (v308)
LABEL_335:

LABEL_336:
  v68 = __sb__runningInSpringBoard();
  if (v68)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v69 = 0;
      v70 = 0;
      goto LABEL_354;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v274, "userInterfaceIdiom") != 1)
    {
      v70 = 0;
      v69 = 1;
      goto LABEL_354;
    }
  }
  v69 = v68 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v265, "_referenceBounds");
    }
    v70 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v94 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v93 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v308 = v71 ^ 1;
      LODWORD(v309) = v69;
      v306 = 0;
      v297 = 0;
      v303 = 0;
      memset(v307, 0, sizeof(v307));
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var26;
      goto LABEL_408;
    }
  }
  else
  {
    v70 = 0;
  }
LABEL_354:
  v72 = __sb__runningInSpringBoard();
  v308 = v70;
  LODWORD(v309) = v69;
  if (v72)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v73 = 0;
      v74 = 0;
      goto LABEL_363;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v273, "userInterfaceIdiom") != 1)
    {
      v74 = 0;
      v73 = 1;
      goto LABEL_363;
    }
  }
  v73 = v72 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "_referenceBounds");
    }
    v74 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v95 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      LODWORD(v307[13]) = v71 ^ 1;
      HIDWORD(v307[13]) = v73;
      v306 = 0;
      v297 = 0;
      v303 = 0;
      memset(v307, 0, 104);
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var31;
      goto LABEL_408;
    }
  }
  else
  {
    v74 = 0;
  }
LABEL_363:
  v75 = __sb__runningInSpringBoard();
  v307[13] = __PAIR64__(v73, v74);
  if (v75)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v76 = 0;
      v77 = 0;
      goto LABEL_372;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v272, "userInterfaceIdiom") != 1)
    {
      v77 = 0;
      v76 = 1;
      goto LABEL_372;
    }
  }
  v76 = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "_referenceBounds");
    }
    v77 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v96 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v307[12]) = v71 ^ 1;
      HIDWORD(v307[12]) = v76;
      v306 = 0;
      v297 = 0;
      v303 = 0;
      memset(v307, 0, 96);
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var29;
      goto LABEL_408;
    }
  }
  else
  {
    v77 = 0;
  }
LABEL_372:
  v78 = __sb__runningInSpringBoard();
  v307[12] = __PAIR64__(v76, v77);
  if (v78)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v79 = 0;
      v67 = 0;
      goto LABEL_381;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v271, "userInterfaceIdiom") != 1)
    {
      v67 = 0;
      v79 = 1;
      goto LABEL_381;
    }
  }
  v79 = v78 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "_referenceBounds");
  }
  v67 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v80 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v307[11] = __PAIR64__(v79, v67);
    v306 = 0;
    v297 = 0;
    v303 = 0;
    memset(v307, 0, 88);
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var30;
    goto LABEL_408;
  }
LABEL_381:
  v81 = __sb__runningInSpringBoard();
  v307[11] = __PAIR64__(v79, v67);
  if (v81)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v307[10] = 0;
      goto LABEL_391;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v270, "userInterfaceIdiom") != 1)
    {
      v307[10] = 0x100000000;
      goto LABEL_391;
    }
  }
  HIDWORD(v307[10]) = v81 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "_referenceBounds");
  }
  LODWORD(v307[10]) = v71 ^ 1;
  BSSizeRoundForScale();
  if (v91 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v306 = 0;
    v297 = 0;
    v303 = 0;
    memset(v307, 0, 80);
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var28;
    goto LABEL_408;
  }
LABEL_391:
  v92 = __sb__runningInSpringBoard();
  if (v92)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v307[9] = 0;
      goto LABEL_543;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v269, "userInterfaceIdiom") != 1)
    {
      v307[9] = 0x100000000;
      goto LABEL_543;
    }
  }
  HIDWORD(v307[9]) = v92 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v262, "_referenceBounds");
  }
  LODWORD(v307[9]) = v71 ^ 1;
  BSSizeRoundForScale();
  if (v103 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v306 = 0;
    v297 = 0;
    v303 = 0;
    memset(v307, 0, 72);
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var27;
    goto LABEL_408;
  }
LABEL_543:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_545;
LABEL_551:
    v306 = 0;
    v297 = 0;
    v303 = 0;
    memset(v307, 0, 68);
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var25;
    HIDWORD(v307[8]) = v71 ^ 1;
    goto LABEL_408;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v267, "userInterfaceIdiom") == 1)
    goto LABEL_551;
LABEL_545:
  HIDWORD(v307[8]) = v71 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_549:
    v307[7] = 0;
    goto LABEL_615;
  }
  v104 = __sb__runningInSpringBoard();
  if (v104)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_549;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v260, "userInterfaceIdiom"))
    {
      v307[7] = 0x100000000;
      goto LABEL_615;
    }
  }
  HIDWORD(v307[7]) = v104 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "_referenceBounds");
    }
    LODWORD(v307[7]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v113 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      LODWORD(v307[8]) = 0;
      v306 = 0;
      v297 = 0;
      v303 = 0;
      memset(v307, 0, 56);
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var21;
      goto LABEL_408;
    }
  }
  else
  {
    LODWORD(v307[7]) = 0;
  }
LABEL_615:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[8]) = 0;
      HIDWORD(v307[6]) = 0;
      goto LABEL_625;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v261, "userInterfaceIdiom"))
    {
      HIDWORD(v307[6]) = 0;
      LODWORD(v307[8]) = 1;
      goto LABEL_625;
    }
  }
  LODWORD(v307[8]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "_referenceBounds");
    }
    HIDWORD(v307[6]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v109 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_629;
  }
  else
  {
    HIDWORD(v307[6]) = 0;
  }
LABEL_625:
  if (_SBF_Private_IsD94Like())
  {
    v306 = 0;
    v297 = 0;
    v303 = 0;
    memset(v307, 0, 52);
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var22;
    goto LABEL_408;
  }
LABEL_629:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_633:
    *(_QWORD *)((char *)&v307[5] + 4) = 0;
    goto LABEL_717;
  }
  v110 = __sb__runningInSpringBoard();
  if (v110)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_633;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v257, "userInterfaceIdiom"))
    {
      HIDWORD(v307[5]) = 0;
      LODWORD(v307[6]) = 1;
      goto LABEL_717;
    }
  }
  LODWORD(v307[6]) = v110 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "_referenceBounds");
    }
    HIDWORD(v307[5]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v128 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v306 = 0;
      v297 = 0;
      v303 = 0;
      memset(v307, 0, 44);
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var23;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v307[5]) = 0;
  }
LABEL_717:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[5]) = 0;
      LODWORD(v307[4]) = 0;
      goto LABEL_727;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v259, "userInterfaceIdiom"))
    {
      LODWORD(v307[4]) = 0;
      LODWORD(v307[5]) = 1;
      goto LABEL_727;
    }
  }
  LODWORD(v307[5]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    LODWORD(v307[4]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v120 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_731;
  }
  else
  {
    LODWORD(v307[4]) = 0;
  }
LABEL_727:
  if (_SBF_Private_IsD64Like())
  {
    HIDWORD(v307[4]) = 0;
    v306 = 0;
    v297 = 0;
    v303 = 0;
    memset(v307, 0, 32);
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var24;
    goto LABEL_408;
  }
LABEL_731:
  v121 = __sb__runningInSpringBoard();
  if (v121)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[4]) = 0;
      HIDWORD(v307[3]) = 0;
      goto LABEL_741;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v258, "userInterfaceIdiom"))
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 1;
      goto LABEL_741;
    }
  }
  HIDWORD(v307[4]) = v121 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v122 = __sb__runningInSpringBoard();
    if (v122)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "_referenceBounds");
    }
    v71 = v122 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v307[3]) = v71;
    if (v125 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v306 = 0;
      v297 = 0;
      v303 = 0;
      memset(v307, 0, 28);
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var19;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v307[3]) = 0;
  }
LABEL_741:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[2]) = 0;
      HIDWORD(v307[0]) = 0;
      goto LABEL_763;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v255, "userInterfaceIdiom"))
    {
      HIDWORD(v307[0]) = 0;
      LODWORD(v307[2]) = 1;
      goto LABEL_763;
    }
  }
  LODWORD(v307[2]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "_referenceBounds");
    }
    HIDWORD(v307[0]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v133 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_801;
  }
  else
  {
    HIDWORD(v307[0]) = 0;
  }
LABEL_763:
  if (_SBF_Private_IsD54())
  {
    *(_QWORD *)((char *)&v307[2] + 4) = 0;
    v307[1] = 0;
    v306 = 0;
    v297 = 0;
    v303 = 0;
    LODWORD(v307[0]) = 0;
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var20;
    goto LABEL_408;
  }
LABEL_801:
  v134 = __sb__runningInSpringBoard();
  if (v134)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)((char *)&v307[2] + 4) = 0;
      goto LABEL_831;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v254, "userInterfaceIdiom"))
    {
      HIDWORD(v307[2]) = 0;
      LODWORD(v307[3]) = 1;
      goto LABEL_831;
    }
  }
  LODWORD(v307[3]) = v134 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v137 = __sb__runningInSpringBoard();
    if (v137)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "_referenceBounds");
    }
    v71 = v137 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v307[2]) = v71;
    if (v140 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      v307[1] = 0;
      v306 = 0;
      v297 = 0;
      v303 = 0;
      LODWORD(v307[0]) = 0;
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var13;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v307[2]) = 0;
  }
LABEL_831:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v307[1] = 0;
      goto LABEL_855;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v251, "userInterfaceIdiom"))
    {
      v307[1] = 0x100000000;
      goto LABEL_855;
    }
  }
  HIDWORD(v307[1]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "_referenceBounds");
    }
    LODWORD(v307[1]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v145 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_890;
  }
  else
  {
    LODWORD(v307[1]) = 0;
  }
LABEL_855:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    v306 = 0;
    v297 = 0;
    v303 = 0;
    LODWORD(v307[0]) = 0;
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var14;
    goto LABEL_408;
  }
LABEL_890:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_894:
    v306 = 0;
    v297 = 0;
    goto LABEL_951;
  }
  v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_894;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v246, "userInterfaceIdiom"))
    {
      v297 = 0;
      v306 = 1;
      goto LABEL_951;
    }
  }
  v306 = v146 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v157 = __sb__runningInSpringBoard();
    if (v157)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "_referenceBounds");
    }
    v71 = v157 ^ 1u;
    BSSizeRoundForScale();
    v297 = v71;
    if (v164 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v303 = 0;
      LODWORD(v307[0]) = 0;
      v290 = 0;
      v294 = 0;
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var11;
      goto LABEL_408;
    }
  }
  else
  {
    v297 = 0;
  }
LABEL_951:
  v158 = __sb__runningInSpringBoard();
  if (v158)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v303 = 0;
      v71 = 0;
      goto LABEL_961;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "userInterfaceIdiom"))
    {
      v71 = 0;
      v303 = 1;
      goto LABEL_961;
    }
  }
  v303 = v158 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v159 = __sb__runningInSpringBoard();
    if (v159)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "_referenceBounds");
    }
    v71 = v159 ^ 1u;
    BSSizeRoundForScale();
    if (v160 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_965;
  }
  else
  {
    v71 = 0;
  }
LABEL_961:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v307[0]) = v71;
    v290 = 0;
    v294 = 0;
    v300 = 0;
    v291 = 0;
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var12;
    goto LABEL_408;
  }
LABEL_965:
  LODWORD(v307[0]) = v71;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_969:
    v290 = 0;
    v294 = 0;
    goto LABEL_1053;
  }
  v161 = __sb__runningInSpringBoard();
  if (v161)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_969;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v241, "userInterfaceIdiom"))
    {
      v294 = 0;
      v290 = 1;
      goto LABEL_1053;
    }
  }
  v290 = v161 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "_referenceBounds");
    }
    v294 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v179 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v300 = 0;
      v291 = 0;
      v284 = 0;
      v287 = 0;
      v278 = 0;
      v281 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var17;
      goto LABEL_408;
    }
  }
  else
  {
    v294 = 0;
  }
LABEL_1053:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v300 = 0;
      v291 = 0;
      goto LABEL_1063;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v245, "userInterfaceIdiom"))
    {
      v291 = 0;
      v300 = 1;
      goto LABEL_1063;
    }
  }
  v300 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "_referenceBounds");
    }
    v291 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v171 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1067;
  }
  else
  {
    v291 = 0;
  }
LABEL_1063:
  if (_SBF_Private_IsD63Like())
  {
    v284 = 0;
    v287 = 0;
    v278 = 0;
    v281 = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var18;
    goto LABEL_408;
  }
LABEL_1067:
  v172 = __sb__runningInSpringBoard();
  if (v172)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v287) = 0;
      LODWORD(v281) = 0;
      goto LABEL_1077;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v242, "userInterfaceIdiom"))
    {
      LODWORD(v281) = 0;
      HIDWORD(v287) = 1;
      goto LABEL_1077;
    }
  }
  HIDWORD(v287) = v172 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v173 = __sb__runningInSpringBoard();
    if (v173)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "_referenceBounds");
    }
    v71 = v173 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v281) = v71;
    if (v176 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      LODWORD(v287) = 0;
      v284 = 0;
      v278 = 0;
      HIDWORD(v281) = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var15;
      goto LABEL_408;
    }
  }
  else
  {
    LODWORD(v281) = 0;
  }
LABEL_1077:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v287) = 0;
      HIDWORD(v284) = 0;
      goto LABEL_1099;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v239, "userInterfaceIdiom"))
    {
      HIDWORD(v284) = 0;
      LODWORD(v287) = 1;
      goto LABEL_1099;
    }
  }
  LODWORD(v287) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "_referenceBounds");
    }
    HIDWORD(v284) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v184 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1137;
  }
  else
  {
    HIDWORD(v284) = 0;
  }
LABEL_1099:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v284) = 0;
    v278 = 0;
    HIDWORD(v281) = 0;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var16;
    goto LABEL_408;
  }
LABEL_1137:
  v185 = __sb__runningInSpringBoard();
  if (v185)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v284) = 0;
      HIDWORD(v278) = 0;
      goto LABEL_1167;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v238, "userInterfaceIdiom"))
    {
      HIDWORD(v278) = 0;
      LODWORD(v284) = 1;
      goto LABEL_1167;
    }
  }
  LODWORD(v284) = v185 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "_referenceBounds");
    }
    HIDWORD(v278) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v194 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v278) = 0;
      HIDWORD(v281) = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var9;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v278) = 0;
  }
LABEL_1167:
  v188 = __sb__runningInSpringBoard();
  if (v188)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v278) = 0;
      v71 = 0;
      goto LABEL_1189;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v235, "userInterfaceIdiom"))
    {
      v71 = 0;
      LODWORD(v278) = 1;
      goto LABEL_1189;
    }
  }
  LODWORD(v278) = v188 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v191 = __sb__runningInSpringBoard();
    if (v191)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "_referenceBounds");
    }
    v71 = v191 ^ 1u;
    BSSizeRoundForScale();
    if (v197 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1226;
  }
  else
  {
    v71 = 0;
  }
LABEL_1189:
  if (_SBF_Private_IsD53())
  {
    HIDWORD(v281) = v71;
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var10;
    goto LABEL_408;
  }
LABEL_1226:
  HIDWORD(v281) = v71;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var5;
    goto LABEL_408;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var6;
    goto LABEL_408;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var3;
    goto LABEL_408;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    v82 = 0;
    v83 = 0;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var4;
    goto LABEL_408;
  }
  v200 = __sb__runningInSpringBoard();
  if (v200)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v82 = 0;
      v83 = 0;
      goto LABEL_1278;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v229, "userInterfaceIdiom"))
    {
      v83 = 0;
      v82 = 1;
      goto LABEL_1278;
    }
  }
  v82 = v200 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "_referenceBounds");
    }
    v83 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v212 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var7;
      goto LABEL_408;
    }
  }
  else
  {
    v83 = 0;
  }
LABEL_1278:
  v202 = __sb__runningInSpringBoard();
  if (v202)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v84 = 0;
      v85 = 0;
      goto LABEL_1308;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v228, "userInterfaceIdiom"))
    {
      v85 = 0;
      v84 = 1;
      goto LABEL_1308;
    }
  }
  v84 = v202 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v71 = __sb__runningInSpringBoard();
    if ((_DWORD)v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "_referenceBounds");
    }
    v85 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v215 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = 0;
      p_var31 = &v310->var8;
      goto LABEL_408;
    }
  }
  else
  {
    v85 = 0;
  }
LABEL_1308:
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v86 = 0;
      v87 = 0;
      goto LABEL_1340;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v227, "userInterfaceIdiom"))
    {
      v87 = 0;
      v86 = 1;
      goto LABEL_1340;
    }
  }
  v86 = v71 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if ((_DWORD)v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "_referenceBounds");
  }
  v87 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v209 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v88 = 0;
    v89 = 0;
    p_var31 = &v310->var2;
    goto LABEL_408;
  }
LABEL_1340:
  v67 = __sb__runningInSpringBoard();
  if ((_DWORD)v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v88 = 0;
      v89 = 0;
LABEL_1381:
      p_var31 = &v310->var0;
      goto LABEL_408;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v71 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v71, "userInterfaceIdiom"))
    {
      v89 = 0;
      v88 = 1;
      goto LABEL_1381;
    }
  }
  v88 = v67 ^ 1;
  v220 = __sb__runningInSpringBoard();
  if (v220)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v67 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v67, "_referenceBounds");
  }
  v89 = v220 ^ 1;
  BSSizeRoundForScale();
  if (v221 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_1381;
  p_var31 = &v310->var1;
LABEL_408:
  v311->_splashRingDiameter = *p_var31;
  if (v89)

  if (v88)
  if (v87)

  if (v86)
  if (v85)

  if (v84)
  if (v83)

  if (v82)
  if (HIDWORD(v281))

  if ((_DWORD)v278)
  if (HIDWORD(v278))

  if ((_DWORD)v284)
  if (HIDWORD(v284))

  if ((_DWORD)v287)
  if ((_DWORD)v281)

  if (HIDWORD(v287))
  if (v291)

  if (v300)
  if (v294)

  if (v290)
  if (LODWORD(v307[0]))

  if (v303)
  if (v297)

  if (v306)
  if (LODWORD(v307[1]))

  if (HIDWORD(v307[1]))
  if (HIDWORD(v307[2]))

  if (LODWORD(v307[3]))
  if (HIDWORD(v307[0]))

  if (LODWORD(v307[2]))
  if (HIDWORD(v307[3]))

  if (HIDWORD(v307[4]))
  if (LODWORD(v307[4]))

  if (LODWORD(v307[5]))
  if (HIDWORD(v307[5]))

  if (LODWORD(v307[6]))
  if (HIDWORD(v307[6]))

  if (LODWORD(v307[8]))
  if (LODWORD(v307[7]))

  if (HIDWORD(v307[7]))
  if (HIDWORD(v307[8]))

  if (LODWORD(v307[9]))
  if (HIDWORD(v307[9]))

  if (LODWORD(v307[10]))
  if (HIDWORD(v307[10]))
  {

    if (!LODWORD(v307[11]))
      goto LABEL_498;
  }
  else if (!LODWORD(v307[11]))
  {
LABEL_498:
    if (HIDWORD(v307[11]))
      goto LABEL_499;
    goto LABEL_509;
  }

  if (HIDWORD(v307[11]))
  {
LABEL_499:

    if (!LODWORD(v307[12]))
      goto LABEL_500;
    goto LABEL_510;
  }
LABEL_509:
  if (!LODWORD(v307[12]))
  {
LABEL_500:
    if (HIDWORD(v307[12]))
      goto LABEL_501;
    goto LABEL_511;
  }
LABEL_510:

  if (HIDWORD(v307[12]))
  {
LABEL_501:

    if (!LODWORD(v307[13]))
      goto LABEL_502;
    goto LABEL_512;
  }
LABEL_511:
  if (!LODWORD(v307[13]))
  {
LABEL_502:
    if (HIDWORD(v307[13]))
      goto LABEL_503;
    goto LABEL_513;
  }
LABEL_512:

  if (HIDWORD(v307[13]))
  {
LABEL_503:

    if (!v308)
      goto LABEL_504;
LABEL_514:

    if (!(_DWORD)v309)
      goto LABEL_506;
    goto LABEL_505;
  }
LABEL_513:
  if (v308)
    goto LABEL_514;
LABEL_504:
  if ((_DWORD)v309)
LABEL_505:

LABEL_506:
  v97 = v311;

  return v97;
}

- (double)ringDiameter
{
  return self->_ringDiameter;
}

- (void)setRingDiameter:(double)a3
{
  self->_ringDiameter = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (CGPoint)ringCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_ringCenter.x;
  y = self->_ringCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRingCenter:(CGPoint)a3
{
  self->_ringCenter = a3;
}

- (double)splashRingDiameter
{
  return self->_splashRingDiameter;
}

- (void)setSplashRingDiameter:(double)a3
{
  self->_splashRingDiameter = a3;
}

@end
