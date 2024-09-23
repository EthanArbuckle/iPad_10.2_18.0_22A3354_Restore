@implementation CSContentCutoutBoundsCalculator

+ (CGRect)contentCutoutBoundsForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "_contentCutoutBoundsForPortrait:forModal:", (unint64_t)(a3 - 1) < 2, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)contentCutoutBoundsForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "_contentCutoutBoundsForPortrait:forModal:", (unint64_t)(a3 - 1) < 2, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)normalizedContentCutoutBoundsForOrientation:(int64_t)a3
{
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v4 = (unint64_t)(a3 - 1) < 2;
  objc_msgSend(a1, "contentCutoutBoundsForOrientation:", v4);
  objc_msgSend(a1, "_screenBoundsForPortrait:", v4);
  objc_msgSend(a1, "_normalizedContentCutoutForScreenBounds:contentBoundingRect:");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)modalContentCutoutBoundsForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "_contentCutoutBoundsForPortrait:forModal:", (unint64_t)(a3 - 1) < 2, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)modalContentCutoutBoundsForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "_contentCutoutBoundsForPortrait:forModal:", (unint64_t)(a3 - 1) < 2, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)modalNormalizedContentCutoutBoundsForOrientation:(int64_t)a3
{
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v4 = (unint64_t)(a3 - 1) < 2;
  objc_msgSend(a1, "modalContentCutoutBoundsForOrientation:", v4);
  objc_msgSend(a1, "_screenBoundsForPortrait:", v4);
  objc_msgSend(a1, "_normalizedContentCutoutForScreenBounds:contentBoundingRect:");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)_contentCutoutBoundsForPortrait:(BOOL)a3 forModal:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  double x;
  double y;
  double width;
  double height;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  double v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t *v41;
  double v42;
  int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  int v51;
  int v52;
  uint64_t *v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  int v63;
  int v64;
  double v65;
  int v66;
  double v67;
  int v68;
  double v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  uint64_t *v77;
  double v78;
  int v79;
  double v80;
  int v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  int v95;
  double v96;
  int v97;
  double v98;
  int v99;
  double v100;
  double v101;
  int v102;
  double v103;
  int v104;
  double v105;
  int v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  int v112;
  double v113;
  int v114;
  int v115;
  double v116;
  int v117;
  int v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  int v125;
  double v126;
  int v127;
  double v128;
  int v129;
  int v130;
  int v131;
  double v132;
  int v133;
  double v134;
  double v135;
  double v136;
  int v137;
  double v138;
  int v139;
  double v140;
  double v141;
  int v142;
  double v143;
  int v144;
  double v145;
  int v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  int v152;
  double v153;
  int v154;
  double v155;
  int v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  int v163;
  double v164;
  int v165;
  double v166;
  uint64_t *v167;
  int v168;
  double v169;
  uint64_t *v170;
  double v171;
  double v172;
  uint64_t *v173;
  uint64_t *v174;
  uint64_t *v175;
  uint64_t *v176;
  double v177;
  int v178;
  int v179;
  int v180;
  int v181;
  double v182;
  double v183;
  double v184;
  int v185;
  double v186;
  int v187;
  int v188;
  int v189;
  int v190;
  double v191;
  uint64_t *v192;
  double v193;
  double v194;
  uint64_t *v195;
  double v196;
  double v197;
  uint64_t *v198;
  double v199;
  int v200;
  double v201;
  uint64_t *v202;
  int v203;
  double v204;
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
  int v256;
  void *v257;
  int v258;
  int v259;
  int v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  int v269;
  uint64_t v270;
  int v271;
  uint64_t v272;
  int v273;
  int v274;
  int v275;
  int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  _BYTE v281[68];
  uint64_t v282;
  _OWORD v283[2];
  uint64_t v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect result;

  v4 = a4;
  v5 = a3;
  objc_msgSend(a1, "_screenBoundsForPortrait:");
  x = v285.origin.x;
  y = v285.origin.y;
  width = v285.size.width;
  height = v285.size.height;
  v10 = CGRectGetWidth(v285);
  v286.origin.x = x;
  v286.origin.y = y;
  v286.size.width = width;
  v286.size.height = height;
  v11 = CGRectGetHeight(v286);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v5)
  {
    objc_msgSend(MEMORY[0x1E0DA9DE0], "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 1, x, y, width, height);
    v15 = CGRectGetMaxY(v287) + 0.0;
    if (objc_msgSend(MEMORY[0x1E0DA9E40], "showAlternateDate"))
    {
      objc_msgSend(MEMORY[0x1E0DA9E48], "subtitleLabelToLunarDateLabelBaselineDifferenceY");
      v15 = v15 + v16;
    }
    if (!+[CSQuickActionsViewController deviceSupportsButtons](CSQuickActionsViewController, "deviceSupportsButtons"))
    {
      v23 = 0.0;
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "userInterfaceIdiom");

        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          +[CSModalView _bottomBaselineOffsetForPortrait:](CSModalView, "_bottomBaselineOffsetForPortrait:", v5);
          v23 = v26 + 0.0;
        }
      }
      goto LABEL_430;
    }
    v17 = __sb__runningInSpringBoard();
    if (v17)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v284 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v255, "userInterfaceIdiom") != 1)
      {
        v284 = 0x100000000;
        goto LABEL_23;
      }
    }
    HIDWORD(v284) = v17 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v27 = __sb__runningInSpringBoard();
      if ((_DWORD)v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v246, "_referenceBounds");
      }
      BSSizeRoundForScale();
      LODWORD(v284) = v27 ^ 1;
      if (v45 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v44 == *(double *)(MEMORY[0x1E0DAB260] + 280))
      {
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v259 = 0;
        v261 = 0;
        v263 = 0;
        v265 = 0;
        v267 = 0;
        v272 = 0;
        v271 = 0;
        v275 = 0;
        v279 = 0;
        v269 = 0;
        v277 = 0;
        memset(v281, 0, sizeof(v281));
        v282 = 0;
        memset(v283, 0, sizeof(v283));
        v41 = &qword_1D048F9A8;
        goto LABEL_77;
      }
    }
    else
    {
      LODWORD(v284) = 0;
    }
LABEL_23:
    v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v283[0]) = 0;
        HIDWORD(v283[1]) = 0;
        goto LABEL_32;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v254, "userInterfaceIdiom") != 1)
      {
        LODWORD(v283[0]) = 0;
        HIDWORD(v283[1]) = 1;
        goto LABEL_32;
      }
    }
    HIDWORD(v283[1]) = v28 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v27 = __sb__runningInSpringBoard();
      if ((_DWORD)v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "_referenceBounds");
      }
      BSSizeRoundForScale();
      LODWORD(v283[0]) = v27 ^ 1;
      if (v46 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
      {
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v259 = 0;
        v261 = 0;
        v263 = 0;
        v265 = 0;
        v267 = 0;
        v272 = 0;
        v271 = 0;
        v275 = 0;
        v279 = 0;
        v269 = 0;
        v277 = 0;
        memset(v281, 0, sizeof(v281));
        v282 = 0;
        *(_QWORD *)((char *)v283 + 4) = 0;
        *(_QWORD *)((char *)v283 + 12) = 0;
        *(_QWORD *)((char *)&v283[1] + 4) = 0;
        v41 = &qword_1D048F9D0;
        goto LABEL_77;
      }
    }
    else
    {
      LODWORD(v283[0]) = 0;
    }
LABEL_32:
    v29 = __sb__runningInSpringBoard();
    if (v29)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)((char *)&v283[1] + 4) = 0;
        goto LABEL_41;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v253, "userInterfaceIdiom") != 1)
      {
        *(_QWORD *)((char *)&v283[1] + 4) = 0x100000000;
        goto LABEL_41;
      }
    }
    DWORD2(v283[1]) = v29 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v27 = __sb__runningInSpringBoard();
      if ((_DWORD)v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v245, "_referenceBounds");
      }
      DWORD1(v283[1]) = v27 ^ 1;
      BSSizeRoundForScale();
      if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
      {
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v259 = 0;
        v261 = 0;
        v263 = 0;
        v265 = 0;
        v267 = 0;
        v272 = 0;
        v271 = 0;
        v275 = 0;
        v279 = 0;
        v269 = 0;
        v277 = 0;
        memset(v281, 0, sizeof(v281));
        v282 = 0;
        *(_QWORD *)((char *)v283 + 4) = 0;
        *(_QWORD *)((char *)v283 + 12) = 0;
        v41 = &qword_1D048F9C0;
        goto LABEL_77;
      }
    }
    else
    {
      DWORD1(v283[1]) = 0;
    }
LABEL_41:
    v30 = __sb__runningInSpringBoard();
    if (v30)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)((char *)v283 + 12) = 0;
        goto LABEL_50;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v252, "userInterfaceIdiom") != 1)
      {
        *(_QWORD *)((char *)v283 + 12) = 0x100000000;
        goto LABEL_50;
      }
    }
    LODWORD(v283[1]) = v30 ^ 1;
    v27 = __sb__runningInSpringBoard();
    if ((_DWORD)v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "_referenceBounds");
    }
    HIDWORD(v283[0]) = v27 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v259 = 0;
      v261 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v272 = 0;
      v271 = 0;
      v275 = 0;
      v279 = 0;
      v269 = 0;
      v277 = 0;
      memset(v281, 0, sizeof(v281));
      v282 = 0;
      *(_QWORD *)((char *)v283 + 4) = 0;
      v41 = &qword_1D048F9C8;
      goto LABEL_77;
    }
LABEL_50:
    v32 = __sb__runningInSpringBoard();
    if (v32)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)((char *)v283 + 4) = 0;
        goto LABEL_60;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v251, "userInterfaceIdiom") != 1)
      {
        *(_QWORD *)((char *)v283 + 4) = 0x100000000;
        goto LABEL_60;
      }
    }
    DWORD2(v283[0]) = v32 ^ 1;
    v27 = __sb__runningInSpringBoard();
    if ((_DWORD)v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "_referenceBounds");
    }
    DWORD1(v283[0]) = v27 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
    {
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v259 = 0;
      v261 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v272 = 0;
      v271 = 0;
      v275 = 0;
      v279 = 0;
      v269 = 0;
      v277 = 0;
      memset(v281, 0, sizeof(v281));
      v282 = 0;
      v41 = &qword_1D048F9B8;
      goto LABEL_77;
    }
LABEL_60:
    v43 = __sb__runningInSpringBoard();
    if (v43)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v282 = 0;
        goto LABEL_255;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v250, "userInterfaceIdiom") != 1)
      {
        v282 = 0x100000000;
        goto LABEL_255;
      }
    }
    HIDWORD(v282) = v43 ^ 1;
    v27 = __sb__runningInSpringBoard();
    if ((_DWORD)v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v282) = v27 ^ 1;
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
    {
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v259 = 0;
      v261 = 0;
      v263 = 0;
      v265 = 0;
      v267 = 0;
      v272 = 0;
      v271 = 0;
      v275 = 0;
      v279 = 0;
      v269 = 0;
      v277 = 0;
      memset(v281, 0, sizeof(v281));
      v41 = &qword_1D048F9B0;
      goto LABEL_77;
    }
LABEL_255:
    v27 = __sb__runningInSpringBoard();
    if ((_DWORD)v27)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_257;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v248, "userInterfaceIdiom") != 1)
      {
LABEL_257:
        *(_DWORD *)&v281[64] = v27 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_261:
          *(_QWORD *)&v281[44] = 0;
          goto LABEL_467;
        }
        v66 = __sb__runningInSpringBoard();
        if (v66)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_261;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v242, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v281[44] = 0;
            *(_DWORD *)&v281[48] = 1;
            goto LABEL_467;
          }
        }
        *(_DWORD *)&v281[48] = v66 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v235 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v235, "_referenceBounds");
          }
          *(_DWORD *)&v281[44] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v100 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            v261 = 0;
            v263 = 0;
            v265 = 0;
            v267 = 0;
            v272 = 0;
            v271 = 0;
            v275 = 0;
            v279 = 0;
            v269 = 0;
            v277 = 0;
            memset(v281, 0, 44);
            *(_QWORD *)&v281[52] = 0;
            *(_DWORD *)&v281[60] = 0;
            v41 = &qword_1D048F980;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[44] = 0;
        }
LABEL_467:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[40] = 0;
            *(_DWORD *)&v281[60] = 0;
            goto LABEL_477;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v243, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v281[40] = 0;
            *(_DWORD *)&v281[60] = 1;
            goto LABEL_477;
          }
        }
        *(_DWORD *)&v281[60] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "_referenceBounds");
          }
          *(_DWORD *)&v281[40] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v98 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
            goto LABEL_481;
        }
        else
        {
          *(_DWORD *)&v281[40] = 0;
        }
LABEL_477:
        if ((_SBF_Private_IsD94Like() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v259 = 0;
          v261 = 0;
          v263 = 0;
          v265 = 0;
          v267 = 0;
          v272 = 0;
          v271 = 0;
          v275 = 0;
          v279 = 0;
          v269 = 0;
          v277 = 0;
          memset(v281, 0, 40);
          *(_QWORD *)&v281[52] = 0;
          v41 = &qword_1D048F988;
          goto LABEL_77;
        }
LABEL_481:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_485:
          *(_QWORD *)&v281[32] = 0;
          goto LABEL_495;
        }
        v99 = __sb__runningInSpringBoard();
        if (v99)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_485;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v239, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v281[32] = 0x100000000;
            goto LABEL_495;
          }
        }
        *(_DWORD *)&v281[36] = v99 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v230, "_referenceBounds");
          }
          *(_DWORD *)&v281[32] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v108 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            v261 = 0;
            v263 = 0;
            v265 = 0;
            v267 = 0;
            v272 = 0;
            v271 = 0;
            v275 = 0;
            v279 = 0;
            v269 = 0;
            v277 = 0;
            memset(v281, 0, 32);
            *(_QWORD *)&v281[52] = 0;
            v41 = &qword_1D048F990;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[32] = 0;
        }
LABEL_495:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[28] = 0;
            *(_DWORD *)&v281[56] = 0;
            goto LABEL_505;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v241, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v281[28] = 0;
            *(_DWORD *)&v281[56] = 1;
            goto LABEL_505;
          }
        }
        *(_DWORD *)&v281[56] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v234, "_referenceBounds");
          }
          *(_DWORD *)&v281[28] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v101 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_509;
        }
        else
        {
          *(_DWORD *)&v281[28] = 0;
        }
LABEL_505:
        if ((_SBF_Private_IsD64Like() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v259 = 0;
          v261 = 0;
          v263 = 0;
          v265 = 0;
          v267 = 0;
          v272 = 0;
          v271 = 0;
          v275 = 0;
          v279 = 0;
          v269 = 0;
          v277 = 0;
          memset(v281, 0, 28);
          *(_DWORD *)&v281[52] = 0;
          v41 = &qword_1D048F998;
          goto LABEL_77;
        }
LABEL_509:
        v102 = __sb__runningInSpringBoard();
        if (v102)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[24] = 0;
            *(_DWORD *)&v281[52] = 0;
            goto LABEL_519;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v240, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v281[24] = 0;
            *(_DWORD *)&v281[52] = 1;
            goto LABEL_519;
          }
        }
        *(_DWORD *)&v281[52] = v102 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "_referenceBounds");
          }
          BSSizeRoundForScale();
          *(_DWORD *)&v281[24] = v27 ^ 1;
          if (v107 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            v261 = 0;
            v263 = 0;
            v265 = 0;
            v267 = 0;
            v272 = 0;
            v271 = 0;
            v275 = 0;
            v279 = 0;
            v269 = 0;
            v277 = 0;
            memset(v281, 0, 24);
            v41 = &qword_1D048F970;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[24] = 0;
        }
LABEL_519:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[4] = 0;
            *(_DWORD *)&v281[20] = 0;
            goto LABEL_579;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v237, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v281[4] = 0;
            *(_DWORD *)&v281[20] = 1;
            goto LABEL_579;
          }
        }
        *(_DWORD *)&v281[20] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v229, "_referenceBounds");
          }
          *(_DWORD *)&v281[4] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v111 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_595;
        }
        else
        {
          *(_DWORD *)&v281[4] = 0;
        }
LABEL_579:
        if ((_SBF_Private_IsD54() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v259 = 0;
          v261 = 0;
          v263 = 0;
          v265 = 0;
          v267 = 0;
          v272 = 0;
          v271 = 0;
          v275 = 0;
          v279 = 0;
          v269 = 0;
          v277 = 0;
          *(_DWORD *)v281 = 0;
          *(_QWORD *)&v281[8] = 0;
          *(_DWORD *)&v281[16] = 0;
          v41 = &qword_1D048F978;
          goto LABEL_77;
        }
LABEL_595:
        v112 = __sb__runningInSpringBoard();
        if (v112)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)&v281[12] = 0;
            goto LABEL_605;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v236, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v281[12] = 0x100000000;
            goto LABEL_605;
          }
        }
        *(_DWORD *)&v281[16] = v112 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "_referenceBounds");
          }
          *(_DWORD *)&v281[12] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v121 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            v261 = 0;
            v263 = 0;
            v265 = 0;
            v267 = 0;
            v272 = 0;
            v271 = 0;
            v275 = 0;
            v279 = 0;
            v269 = 0;
            v277 = 0;
            *(_DWORD *)v281 = 0;
            *(_DWORD *)&v281[8] = 0;
            v41 = &qword_1D048F940;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[12] = 0;
        }
LABEL_605:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v281 = 0;
            *(_DWORD *)&v281[8] = 0;
            goto LABEL_683;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v233, "userInterfaceIdiom"))
          {
            *(_DWORD *)v281 = 0;
            *(_DWORD *)&v281[8] = 1;
            goto LABEL_683;
          }
        }
        *(_DWORD *)&v281[8] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v225, "_referenceBounds");
          }
          *(_DWORD *)v281 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_716;
        }
        else
        {
          *(_DWORD *)v281 = 0;
        }
LABEL_683:
        if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v259 = 0;
          v261 = 0;
          v263 = 0;
          v265 = 0;
          v267 = 0;
          v272 = 0;
          v271 = 0;
          v275 = 0;
          v279 = 0;
          v269 = 0;
          v277 = 0;
          v41 = &qword_1D048F948;
          goto LABEL_77;
        }
LABEL_716:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_720:
          v269 = 0;
          v277 = 0;
          goto LABEL_777;
        }
        v125 = __sb__runningInSpringBoard();
        if (v125)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_720;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v228, "userInterfaceIdiom"))
          {
            v269 = 0;
            v277 = 1;
            goto LABEL_777;
          }
        }
        v277 = v125 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v219 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v219, "_referenceBounds");
          }
          BSSizeRoundForScale();
          v269 = v27 ^ 1;
          if (v140 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            v261 = 0;
            v263 = 0;
            v265 = 0;
            v267 = 0;
            v272 = 0;
            v271 = 0;
            v275 = 0;
            v279 = 0;
            v41 = &qword_1D048F930;
            goto LABEL_77;
          }
        }
        else
        {
          v269 = 0;
        }
LABEL_777:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v275 = 0;
            v279 = 0;
            goto LABEL_787;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v232, "userInterfaceIdiom"))
          {
            v275 = 0;
            v279 = 1;
            goto LABEL_787;
          }
        }
        v279 = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v222, "_referenceBounds");
          }
          v275 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v132 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
            goto LABEL_791;
        }
        else
        {
          v275 = 0;
        }
LABEL_787:
        if ((_SBF_Private_IsD93Like() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v259 = 0;
          v261 = 0;
          v263 = 0;
          v265 = 0;
          v267 = 0;
          v272 = 0;
          v271 = 0;
          v41 = &qword_1D048F938;
          goto LABEL_77;
        }
LABEL_791:
        if (!_SBF_Private_IsD63Like())
        {
LABEL_795:
          HIDWORD(v267) = 0;
          v271 = 0;
          goto LABEL_831;
        }
        v133 = __sb__runningInSpringBoard();
        if (v133)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_795;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v223, "userInterfaceIdiom"))
          {
            HIDWORD(v267) = 0;
            v271 = 1;
            goto LABEL_831;
          }
        }
        v271 = v133 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v215, "_referenceBounds");
          }
          HIDWORD(v267) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v148 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            v261 = 0;
            v263 = 0;
            v265 = 0;
            LODWORD(v267) = 0;
            v272 = 0;
            v41 = &qword_1D048F960;
            goto LABEL_77;
          }
        }
        else
        {
          HIDWORD(v267) = 0;
        }
LABEL_831:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v272 = 0;
            goto LABEL_841;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v227, "userInterfaceIdiom"))
          {
            v272 = 0x100000000;
            goto LABEL_841;
          }
        }
        HIDWORD(v272) = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v218 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v218, "_referenceBounds");
          }
          LODWORD(v272) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v141 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_845;
        }
        else
        {
          LODWORD(v272) = 0;
        }
LABEL_841:
        if ((_SBF_Private_IsD63Like() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v259 = 0;
          v261 = 0;
          v263 = 0;
          v265 = 0;
          LODWORD(v267) = 0;
          v41 = &qword_1D048F968;
          goto LABEL_77;
        }
LABEL_845:
        v142 = __sb__runningInSpringBoard();
        if (v142)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v265) = 0;
            LODWORD(v267) = 0;
            goto LABEL_855;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v224, "userInterfaceIdiom"))
          {
            LODWORD(v265) = 0;
            LODWORD(v267) = 1;
            goto LABEL_855;
          }
        }
        LODWORD(v267) = v142 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v216, "_referenceBounds");
          }
          BSSizeRoundForScale();
          LODWORD(v265) = v27 ^ 1;
          if (v147 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            v261 = 0;
            v263 = 0;
            HIDWORD(v265) = 0;
            v41 = &qword_1D048F950;
            goto LABEL_77;
          }
        }
        else
        {
          LODWORD(v265) = 0;
        }
LABEL_855:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v263) = 0;
            HIDWORD(v265) = 0;
            goto LABEL_915;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v221, "userInterfaceIdiom"))
          {
            HIDWORD(v263) = 0;
            HIDWORD(v265) = 1;
            goto LABEL_915;
          }
        }
        HIDWORD(v265) = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v214, "_referenceBounds");
          }
          HIDWORD(v263) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v151 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_931;
        }
        else
        {
          HIDWORD(v263) = 0;
        }
LABEL_915:
        if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v259 = 0;
          v261 = 0;
          LODWORD(v263) = 0;
          v41 = &qword_1D048F958;
          goto LABEL_77;
        }
LABEL_931:
        v152 = __sb__runningInSpringBoard();
        if (v152)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v261) = 0;
            LODWORD(v263) = 0;
            goto LABEL_941;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v220, "userInterfaceIdiom"))
          {
            HIDWORD(v261) = 0;
            LODWORD(v263) = 1;
            goto LABEL_941;
          }
        }
        LODWORD(v263) = v152 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v213, "_referenceBounds");
          }
          HIDWORD(v261) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v159 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v259 = 0;
            LODWORD(v261) = 0;
            v41 = &qword_1D048F920;
            goto LABEL_77;
          }
        }
        else
        {
          HIDWORD(v261) = 0;
        }
LABEL_941:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v259 = 0;
            LODWORD(v261) = 0;
            goto LABEL_1031;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v217, "userInterfaceIdiom"))
          {
            v259 = 0;
            LODWORD(v261) = 1;
            goto LABEL_1031;
          }
        }
        LODWORD(v261) = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v212, "_referenceBounds");
          }
          v259 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v166 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_1066;
        }
        else
        {
          v259 = 0;
        }
LABEL_1031:
        if ((_SBF_Private_IsD53() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = &qword_1D048F928;
          goto LABEL_77;
        }
LABEL_1066:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = &qword_1D048F900;
          goto LABEL_77;
        }
        if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = &qword_1D048F908;
          goto LABEL_77;
        }
        if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = &qword_1D048F8F0;
          goto LABEL_77;
        }
        if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = &qword_1D048F8F8;
          goto LABEL_77;
        }
        v168 = __sb__runningInSpringBoard();
        if (v168)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v39 = 0;
            v40 = 0;
            goto LABEL_1166;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v211, "userInterfaceIdiom"))
          {
            v39 = 0;
            v40 = 1;
            goto LABEL_1166;
          }
        }
        v40 = v168 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v206, "_referenceBounds");
          }
          v39 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v183 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v41 = &qword_1D048F910;
            goto LABEL_77;
          }
        }
        else
        {
          v39 = 0;
        }
LABEL_1166:
        v180 = __sb__runningInSpringBoard();
        if (v180)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v37 = 0;
            v38 = 0;
            goto LABEL_1176;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v210, "userInterfaceIdiom"))
          {
            v37 = 0;
            v38 = 1;
            goto LABEL_1176;
          }
        }
        v38 = v180 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v27 = __sb__runningInSpringBoard();
          if ((_DWORD)v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v205, "_referenceBounds");
          }
          v37 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v184 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0;
            v41 = &qword_1D048F918;
            goto LABEL_77;
          }
        }
        else
        {
          v37 = 0;
        }
LABEL_1176:
        v181 = __sb__runningInSpringBoard();
        if (v181)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v33 = 0;
            v36 = 0;
            goto LABEL_1186;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v209, "userInterfaceIdiom"))
          {
            v33 = 0;
            v36 = 1;
            goto LABEL_1186;
          }
        }
        v36 = v181 ^ 1;
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v207, "_referenceBounds");
        }
        v33 = v27 ^ 1;
        BSSizeRoundForScale();
        if (v182 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
        {
          v34 = 0;
          v35 = 0;
          v41 = &qword_1D048F8E8;
          goto LABEL_77;
        }
LABEL_1186:
        v27 = __sb__runningInSpringBoard();
        if ((_DWORD)v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v34 = 0;
            v35 = 0;
            goto LABEL_1203;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v208, "userInterfaceIdiom"))
          {
            v35 = 0;
            v34 = 1;
            goto LABEL_1203;
          }
        }
        v34 = v27 ^ 1;
        v185 = __sb__runningInSpringBoard();
        if (v185)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v27 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v27, "_referenceBounds");
        }
        v35 = v185 ^ 1;
        BSSizeRoundForScale();
        if (v186 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
        {
          v41 = &qword_1D048F8E0;
LABEL_77:
          v48 = *(double *)v41;
          if (v35)

          if (v34)
          v49 = (void *)0x1E0CEA000;
          if ((_DWORD)v33)
          {

            if (!v36)
              goto LABEL_83;
          }
          else if (!v36)
          {
LABEL_83:
            if (!v37)
              goto LABEL_85;
            goto LABEL_84;
          }

          if (!v37)
          {
LABEL_85:
            if (v38)
            {

              if (!v39)
                goto LABEL_87;
            }
            else if (!v39)
            {
LABEL_87:
              if (!v40)
                goto LABEL_89;
              goto LABEL_88;
            }

            if (!v40)
            {
LABEL_89:
              if (v259)

              if ((_DWORD)v261)
              if (HIDWORD(v261))

              if ((_DWORD)v263)
              if (HIDWORD(v263))

              if (HIDWORD(v265))
              if ((_DWORD)v265)

              if ((_DWORD)v267)
              if ((_DWORD)v272)

              if (HIDWORD(v272))
              if (HIDWORD(v267))

              if (v271)
              if (v275)

              if (v279)
              if (v269)

              if (v277)
              if (*(_DWORD *)v281)

              if (*(_DWORD *)&v281[8])
              if (*(_DWORD *)&v281[12])

              if (*(_DWORD *)&v281[16])
              if (*(_DWORD *)&v281[4])

              if (*(_DWORD *)&v281[20])
              if (*(_DWORD *)&v281[24])

              if (*(_DWORD *)&v281[52])
              if (*(_DWORD *)&v281[28])

              if (*(_DWORD *)&v281[56])
              if (*(_DWORD *)&v281[32])

              if (*(_DWORD *)&v281[36])
              if (*(_DWORD *)&v281[40])

              if (*(_DWORD *)&v281[60])
              if (*(_DWORD *)&v281[44])

              if (*(_DWORD *)&v281[48])
              if (*(_DWORD *)&v281[64])

              if ((_DWORD)v282)
              if (HIDWORD(v282))

              if (DWORD1(v283[0]))
              if (DWORD2(v283[0]))

              if (HIDWORD(v283[0]))
              if (LODWORD(v283[1]))

              if (DWORD1(v283[1]))
              if (DWORD2(v283[1]))

              if (LODWORD(v283[0]))
              if (HIDWORD(v283[1]))

              if ((_DWORD)v284)
              if (HIDWORD(v284))

              v50 = v48 + 0.0;
              v51 = __sb__runningInSpringBoard();
              v52 = v51;
              if (v5)
              {
                v53 = &CSQuickActionButtonInsetY;
                if (v51)
                {
                  if (SBFEffectiveDeviceClass() != 2)
                  {
                    v284 = 0;
LABEL_202:
                    v56 = __sb__runningInSpringBoard();
                    if (v56)
                    {
                      if (SBFEffectiveDeviceClass() != 2)
                      {
                        LODWORD(v282) = 0;
                        *(_DWORD *)&v281[60] = 0;
LABEL_220:
                        v60 = __sb__runningInSpringBoard();
                        if (v60)
                        {
                          if (SBFEffectiveDeviceClass() != 2)
                          {
                            *((_QWORD *)&v283[1] + 1) = 0;
LABEL_238:
                            v63 = __sb__runningInSpringBoard();
                            if (v63)
                            {
                              if (SBFEffectiveDeviceClass() != 2)
                              {
                                *(_QWORD *)&v283[1] = 0;
LABEL_268:
                                v68 = __sb__runningInSpringBoard();
                                if (v68)
                                {
                                  if (SBFEffectiveDeviceClass() != 2)
                                  {
                                    *((_QWORD *)&v283[0] + 1) = 0;
LABEL_287:
                                    v79 = __sb__runningInSpringBoard();
                                    if (v79)
                                    {
                                      if (SBFEffectiveDeviceClass() != 2)
                                      {
                                        *(_QWORD *)&v283[0] = 0;
LABEL_435:
                                        v61 = __sb__runningInSpringBoard();
                                        if ((_DWORD)v61)
                                        {
                                          if (SBFEffectiveDeviceClass() == 2)
                                            goto LABEL_456;
LABEL_439:
                                          HIDWORD(v282) = v61 ^ 1;
                                          if (!_SBF_Private_IsD94Like())
                                          {
LABEL_443:
                                            *(_QWORD *)&v281[52] = 0;
                                            goto LABEL_529;
                                          }
                                          v95 = __sb__runningInSpringBoard();
                                          if (v95)
                                          {
                                            if (SBFEffectiveDeviceClass()
                                              && SBFEffectiveDeviceClass() != 1)
                                            {
                                              goto LABEL_443;
                                            }
                                          }
                                          else
                                          {
                                            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                            v240 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (objc_msgSend(v240, "userInterfaceIdiom"))
                                            {
                                              *(_DWORD *)&v281[52] = 0;
                                              *(_DWORD *)&v281[56] = 1;
                                              goto LABEL_529;
                                            }
                                          }
                                          *(_DWORD *)&v281[56] = v95 ^ 1;
                                          if (SBFEffectiveHomeButtonType() == 2)
                                          {
                                            v61 = __sb__runningInSpringBoard();
                                            if ((_DWORD)v61)
                                            {
                                              __sb__mainScreenReferenceBounds();
                                            }
                                            else
                                            {
                                              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                              v233 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v233, "_referenceBounds");
                                            }
                                            *(_DWORD *)&v281[52] = v61 ^ 1;
                                            BSSizeRoundForScale();
                                            if (v109 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
                                            {
LABEL_592:
                                              *(_DWORD *)&v281[64] = 0;
                                              memset(v281, 0, 52);
                                              v276 = 0;
                                              v274 = 0;
                                              v280 = 0;
                                              v278 = 0;
                                              v268 = 0;
                                              v270 = 0;
                                              v273 = 0;
                                              v264 = 0;
                                              v266 = 0;
                                              v262 = 0;
                                              v260 = 0;
                                              v258 = 0;
                                              v256 = 0;
                                              v71 = 0;
                                              v72 = 0;
                                              v73 = 0;
                                              v74 = 0;
                                              v75 = 0;
                                              v76 = 0;
                                              v77 = v53 + 21;
                                              goto LABEL_323;
                                            }
                                          }
                                          else
                                          {
                                            *(_DWORD *)&v281[52] = 0;
                                          }
LABEL_529:
                                          v61 = __sb__runningInSpringBoard();
                                          if ((_DWORD)v61)
                                          {
                                            if (SBFEffectiveDeviceClass()
                                              && SBFEffectiveDeviceClass() != 1)
                                            {
                                              *(_DWORD *)&v281[64] = 0;
                                              *(_DWORD *)&v281[48] = 0;
                                              goto LABEL_539;
                                            }
                                          }
                                          else
                                          {
                                            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                            v241 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (objc_msgSend(v241, "userInterfaceIdiom"))
                                            {
                                              *(_DWORD *)&v281[48] = 0;
                                              *(_DWORD *)&v281[64] = 1;
LABEL_539:
                                              if ((_SBF_Private_IsD94Like() & 1) == 0)
                                                goto LABEL_543;
LABEL_565:
                                              memset(v281, 0, 48);
                                              v276 = 0;
                                              v274 = 0;
                                              v280 = 0;
                                              v278 = 0;
                                              v268 = 0;
                                              v270 = 0;
                                              v273 = 0;
                                              v264 = 0;
                                              v266 = 0;
                                              v262 = 0;
                                              v260 = 0;
                                              v258 = 0;
                                              v256 = 0;
                                              v71 = 0;
                                              v72 = 0;
                                              v73 = 0;
                                              v74 = 0;
                                              v75 = 0;
                                              v76 = 0;
                                              v77 = v53 + 22;
                                              goto LABEL_323;
                                            }
                                          }
                                          *(_DWORD *)&v281[64] = v61 ^ 1;
                                          if (SBFEffectiveHomeButtonType() == 2)
                                          {
                                            v61 = __sb__runningInSpringBoard();
                                            if ((_DWORD)v61)
                                            {
                                              __sb__mainScreenReferenceBounds();
                                            }
                                            else
                                            {
                                              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                              v236 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v236, "_referenceBounds");
                                            }
                                            *(_DWORD *)&v281[48] = v61 ^ 1;
                                            BSSizeRoundForScale();
                                            if (v103 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
                                            {
LABEL_543:
                                              if (!_SBF_Private_IsD64Like())
                                              {
LABEL_547:
                                                *(_QWORD *)&v281[40] = 0;
                                                goto LABEL_615;
                                              }
                                              v104 = __sb__runningInSpringBoard();
                                              if (v104)
                                              {
                                                if (SBFEffectiveDeviceClass()
                                                  && SBFEffectiveDeviceClass() != 1)
                                                {
                                                  goto LABEL_547;
                                                }
                                              }
                                              else
                                              {
                                                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                v237 = (void *)objc_claimAutoreleasedReturnValue();
                                                if (objc_msgSend(v237, "userInterfaceIdiom"))
                                                {
                                                  *(_DWORD *)&v281[40] = 0;
                                                  *(_DWORD *)&v281[44] = 1;
                                                  goto LABEL_615;
                                                }
                                              }
                                              *(_DWORD *)&v281[44] = v104 ^ 1;
                                              if (SBFEffectiveHomeButtonType() == 2)
                                              {
                                                v61 = __sb__runningInSpringBoard();
                                                if ((_DWORD)v61)
                                                {
                                                  __sb__mainScreenReferenceBounds();
                                                }
                                                else
                                                {
                                                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v228, "_referenceBounds");
                                                }
                                                *(_DWORD *)&v281[40] = v61 ^ 1;
                                                BSSizeRoundForScale();
                                                if (v122 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                                                {
LABEL_713:
                                                  memset(v281, 0, 40);
                                                  v276 = 0;
                                                  v274 = 0;
                                                  v280 = 0;
                                                  v278 = 0;
                                                  v268 = 0;
                                                  v270 = 0;
                                                  v273 = 0;
                                                  v264 = 0;
                                                  v266 = 0;
                                                  v262 = 0;
                                                  v260 = 0;
                                                  v258 = 0;
                                                  v256 = 0;
                                                  v71 = 0;
                                                  v72 = 0;
                                                  v73 = 0;
                                                  v74 = 0;
                                                  v75 = 0;
                                                  v76 = 0;
                                                  v77 = v53 + 23;
                                                  goto LABEL_323;
                                                }
                                              }
                                              else
                                              {
                                                *(_DWORD *)&v281[40] = 0;
                                              }
LABEL_615:
                                              v61 = __sb__runningInSpringBoard();
                                              if ((_DWORD)v61)
                                              {
                                                if (SBFEffectiveDeviceClass()
                                                  && SBFEffectiveDeviceClass() != 1)
                                                {
                                                  *(_DWORD *)&v281[36] = 0;
                                                  *(_DWORD *)&v281[28] = 0;
                                                  goto LABEL_625;
                                                }
                                              }
                                              else
                                              {
                                                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                v239 = (void *)objc_claimAutoreleasedReturnValue();
                                                if (objc_msgSend(v239, "userInterfaceIdiom"))
                                                {
                                                  *(_DWORD *)&v281[28] = 0;
                                                  *(_DWORD *)&v281[36] = 1;
LABEL_625:
                                                  if ((_SBF_Private_IsD64Like() & 1) == 0)
                                                    goto LABEL_629;
LABEL_660:
                                                  *(_DWORD *)&v281[32] = 0;
                                                  memset(v281, 0, 28);
                                                  v276 = 0;
                                                  v274 = 0;
                                                  v280 = 0;
                                                  v278 = 0;
                                                  v268 = 0;
                                                  v270 = 0;
                                                  v273 = 0;
                                                  v264 = 0;
                                                  v266 = 0;
                                                  v262 = 0;
                                                  v260 = 0;
                                                  v258 = 0;
                                                  v256 = 0;
                                                  v71 = 0;
                                                  v72 = 0;
                                                  v73 = 0;
                                                  v74 = 0;
                                                  v75 = 0;
                                                  v76 = 0;
                                                  v77 = v53 + 24;
                                                  goto LABEL_323;
                                                }
                                              }
                                              *(_DWORD *)&v281[36] = v61 ^ 1;
                                              if (SBFEffectiveHomeButtonType() == 2)
                                              {
                                                v61 = __sb__runningInSpringBoard();
                                                if ((_DWORD)v61)
                                                {
                                                  __sb__mainScreenReferenceBounds();
                                                }
                                                else
                                                {
                                                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                  v232 = (void *)objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v232, "_referenceBounds");
                                                }
                                                *(_DWORD *)&v281[28] = v61 ^ 1;
                                                BSSizeRoundForScale();
                                                if (v113 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                                                {
LABEL_629:
                                                  v114 = __sb__runningInSpringBoard();
                                                  if (v114)
                                                  {
                                                    if (SBFEffectiveDeviceClass()
                                                      && SBFEffectiveDeviceClass() != 1)
                                                    {
                                                      *(_DWORD *)&v281[32] = 0;
                                                      *(_DWORD *)&v281[24] = 0;
                                                      goto LABEL_639;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                    v238 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if (objc_msgSend(v238, "userInterfaceIdiom"))
                                                    {
                                                      *(_DWORD *)&v281[24] = 0;
                                                      *(_DWORD *)&v281[32] = 1;
                                                      goto LABEL_639;
                                                    }
                                                  }
                                                  *(_DWORD *)&v281[32] = v114 ^ 1;
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
                                                      v229 = (void *)objc_claimAutoreleasedReturnValue();
                                                      objc_msgSend(v229, "_referenceBounds");
                                                    }
                                                    v61 = v115 ^ 1u;
                                                    BSSizeRoundForScale();
                                                    *(_DWORD *)&v281[24] = v61;
                                                    if (v119 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                                                    {
LABEL_703:
                                                      memset(v281, 0, 24);
                                                      v276 = 0;
                                                      v274 = 0;
                                                      v280 = 0;
                                                      v278 = 0;
                                                      v268 = 0;
                                                      v270 = 0;
                                                      v273 = 0;
                                                      v264 = 0;
                                                      v266 = 0;
                                                      v262 = 0;
                                                      v260 = 0;
                                                      v258 = 0;
                                                      v256 = 0;
                                                      v71 = 0;
                                                      v72 = 0;
                                                      v73 = 0;
                                                      v74 = 0;
                                                      v75 = 0;
                                                      v76 = 0;
                                                      v77 = v53 + 19;
                                                      goto LABEL_323;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    *(_DWORD *)&v281[24] = 0;
                                                  }
LABEL_639:
                                                  v61 = __sb__runningInSpringBoard();
                                                  if ((_DWORD)v61)
                                                  {
                                                    if (SBFEffectiveDeviceClass()
                                                      && SBFEffectiveDeviceClass() != 1)
                                                    {
                                                      *(_DWORD *)&v281[12] = 0;
                                                      *(_DWORD *)v281 = 0;
                                                      goto LABEL_690;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                    v235 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if (objc_msgSend(v235, "userInterfaceIdiom"))
                                                    {
                                                      *(_DWORD *)v281 = 0;
                                                      *(_DWORD *)&v281[12] = 1;
LABEL_690:
                                                      if ((_SBF_Private_IsD54() & 1) == 0)
                                                        goto LABEL_725;
LABEL_697:
                                                      *(_QWORD *)&v281[16] = 0;
                                                      *(_QWORD *)&v281[4] = 0;
                                                      v276 = 0;
                                                      v274 = 0;
                                                      v280 = 0;
                                                      v278 = 0;
                                                      v268 = 0;
                                                      v270 = 0;
                                                      v273 = 0;
                                                      v264 = 0;
                                                      v266 = 0;
                                                      v262 = 0;
                                                      v260 = 0;
                                                      v258 = 0;
                                                      v256 = 0;
                                                      v71 = 0;
                                                      v72 = 0;
                                                      v73 = 0;
                                                      v74 = 0;
                                                      v75 = 0;
                                                      v76 = 0;
                                                      v77 = v53 + 20;
                                                      goto LABEL_323;
                                                    }
                                                  }
                                                  *(_DWORD *)&v281[12] = v61 ^ 1;
                                                  if (SBFEffectiveHomeButtonType() == 2)
                                                  {
                                                    v61 = __sb__runningInSpringBoard();
                                                    if ((_DWORD)v61)
                                                    {
                                                      __sb__mainScreenReferenceBounds();
                                                    }
                                                    else
                                                    {
                                                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                      v227 = (void *)objc_claimAutoreleasedReturnValue();
                                                      objc_msgSend(v227, "_referenceBounds");
                                                    }
                                                    *(_DWORD *)v281 = v61 ^ 1;
                                                    BSSizeRoundForScale();
                                                    if (v126 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                                                    {
LABEL_725:
                                                      v127 = __sb__runningInSpringBoard();
                                                      if (v127)
                                                      {
                                                        if (SBFEffectiveDeviceClass()
                                                          && SBFEffectiveDeviceClass() != 1)
                                                        {
                                                          *(_QWORD *)&v281[16] = 0;
                                                          goto LABEL_743;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                        v234 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if (objc_msgSend(v234, "userInterfaceIdiom"))
                                                        {
                                                          *(_DWORD *)&v281[16] = 0;
                                                          *(_DWORD *)&v281[20] = 1;
                                                          goto LABEL_743;
                                                        }
                                                      }
                                                      *(_DWORD *)&v281[20] = v127 ^ 1;
                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                      {
                                                        v130 = __sb__runningInSpringBoard();
                                                        if (v130)
                                                        {
                                                          __sb__mainScreenReferenceBounds();
                                                        }
                                                        else
                                                        {
                                                          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                          v224 = (void *)objc_claimAutoreleasedReturnValue();
                                                          objc_msgSend(v224, "_referenceBounds");
                                                        }
                                                        v61 = v130 ^ 1u;
                                                        BSSizeRoundForScale();
                                                        *(_DWORD *)&v281[16] = v61;
                                                        if (v134 >= *(double *)(MEMORY[0x1E0DAB260] + 120)
                                                          && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
                                                        {
LABEL_805:
                                                          *(_QWORD *)&v281[4] = 0;
                                                          v276 = 0;
                                                          v274 = 0;
                                                          v280 = 0;
                                                          v278 = 0;
                                                          v268 = 0;
                                                          v270 = 0;
                                                          v273 = 0;
                                                          v264 = 0;
                                                          v266 = 0;
                                                          v262 = 0;
                                                          v260 = 0;
                                                          v258 = 0;
                                                          v256 = 0;
                                                          v71 = 0;
                                                          v72 = 0;
                                                          v73 = 0;
                                                          v74 = 0;
                                                          v75 = 0;
                                                          v76 = 0;
                                                          v77 = v53 + 13;
                                                          goto LABEL_323;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        *(_DWORD *)&v281[16] = 0;
                                                      }
LABEL_743:
                                                      v61 = __sb__runningInSpringBoard();
                                                      if ((_DWORD)v61)
                                                      {
                                                        if (SBFEffectiveDeviceClass()
                                                          && SBFEffectiveDeviceClass() != 1)
                                                        {
                                                          *(_QWORD *)&v281[4] = 0;
LABEL_763:
                                                          if (!_SBF_Private_IsD33OrSimilarDevice()
                                                            || (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) == 0)
                                                          {
                                                            goto LABEL_808;
                                                          }
LABEL_772:
                                                          v276 = 0;
                                                          v274 = 0;
                                                          v280 = 0;
                                                          v278 = 0;
                                                          v268 = 0;
                                                          v270 = 0;
                                                          v273 = 0;
                                                          v264 = 0;
                                                          v266 = 0;
                                                          v262 = 0;
                                                          v260 = 0;
                                                          v258 = 0;
                                                          v256 = 0;
                                                          v71 = 0;
                                                          v72 = 0;
                                                          v73 = 0;
                                                          v74 = 0;
                                                          v75 = 0;
                                                          v76 = 0;
                                                          v77 = v53 + 14;
                                                          goto LABEL_323;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                        v231 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if (objc_msgSend(v231, "userInterfaceIdiom"))
                                                        {
                                                          *(_DWORD *)&v281[4] = 0;
                                                          *(_DWORD *)&v281[8] = 1;
                                                          goto LABEL_763;
                                                        }
                                                      }
                                                      *(_DWORD *)&v281[8] = v61 ^ 1;
                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                      {
                                                        v61 = __sb__runningInSpringBoard();
                                                        if ((_DWORD)v61)
                                                        {
                                                          __sb__mainScreenReferenceBounds();
                                                        }
                                                        else
                                                        {
                                                          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                          v223 = (void *)objc_claimAutoreleasedReturnValue();
                                                          objc_msgSend(v223, "_referenceBounds");
                                                        }
                                                        *(_DWORD *)&v281[4] = v61 ^ 1;
                                                        BSSizeRoundForScale();
                                                        if (v136 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                                                        {
LABEL_808:
                                                          if (!_SBF_Private_IsD93Like())
                                                          {
LABEL_812:
                                                            v276 = 0;
                                                            v274 = 0;
                                                            goto LABEL_865;
                                                          }
                                                          v137 = __sb__runningInSpringBoard();
                                                          if (v137)
                                                          {
                                                            if (SBFEffectiveDeviceClass()
                                                              && SBFEffectiveDeviceClass() != 1)
                                                            {
                                                              goto LABEL_812;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                            v226 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if (objc_msgSend(v226, "userInterfaceIdiom"))
                                                            {
                                                              v274 = 0;
                                                              v276 = 1;
                                                              goto LABEL_865;
                                                            }
                                                          }
                                                          v276 = v137 ^ 1;
                                                          if (SBFEffectiveHomeButtonType() == 2)
                                                          {
                                                            v61 = __sb__runningInSpringBoard();
                                                            if ((_DWORD)v61)
                                                            {
                                                              __sb__mainScreenReferenceBounds();
                                                            }
                                                            else
                                                            {
                                                              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                              v217 = (void *)objc_claimAutoreleasedReturnValue();
                                                              objc_msgSend(v217, "_referenceBounds");
                                                            }
                                                            v274 = v61 ^ 1;
                                                            BSSizeRoundForScale();
                                                            if (v149 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
                                                            {
LABEL_928:
                                                              v280 = 0;
                                                              v278 = 0;
                                                              v268 = 0;
                                                              v270 = 0;
                                                              v273 = 0;
                                                              v264 = 0;
                                                              v266 = 0;
                                                              v262 = 0;
                                                              v260 = 0;
                                                              v258 = 0;
                                                              v256 = 0;
                                                              v71 = 0;
                                                              v72 = 0;
                                                              v73 = 0;
                                                              v74 = 0;
                                                              v75 = 0;
                                                              v76 = 0;
                                                              v77 = v53 + 11;
                                                              goto LABEL_323;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v274 = 0;
                                                          }
LABEL_865:
                                                          v61 = __sb__runningInSpringBoard();
                                                          if ((_DWORD)v61)
                                                          {
                                                            if (SBFEffectiveDeviceClass()
                                                              && SBFEffectiveDeviceClass() != 1)
                                                            {
                                                              v280 = 0;
                                                              v278 = 0;
                                                              goto LABEL_875;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                            v230 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if (objc_msgSend(v230, "userInterfaceIdiom"))
                                                            {
                                                              v278 = 0;
                                                              v280 = 1;
LABEL_875:
                                                              if ((_SBF_Private_IsD93Like() & 1) == 0)
                                                                goto LABEL_879;
LABEL_901:
                                                              v268 = 0;
                                                              v270 = 0;
                                                              v273 = 0;
                                                              v264 = 0;
                                                              v266 = 0;
                                                              v262 = 0;
                                                              v260 = 0;
                                                              v258 = 0;
                                                              v256 = 0;
                                                              v71 = 0;
                                                              v72 = 0;
                                                              v73 = 0;
                                                              v74 = 0;
                                                              v75 = 0;
                                                              v76 = 0;
                                                              v77 = v53 + 12;
                                                              goto LABEL_323;
                                                            }
                                                          }
                                                          v280 = v61 ^ 1;
                                                          if (SBFEffectiveHomeButtonType() == 2)
                                                          {
                                                            v61 = __sb__runningInSpringBoard();
                                                            if ((_DWORD)v61)
                                                            {
                                                              __sb__mainScreenReferenceBounds();
                                                            }
                                                            else
                                                            {
                                                              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                              v220 = (void *)objc_claimAutoreleasedReturnValue();
                                                              objc_msgSend(v220, "_referenceBounds");
                                                            }
                                                            v278 = v61 ^ 1;
                                                            BSSizeRoundForScale();
                                                            if (v143 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
                                                            {
LABEL_879:
                                                              if (!_SBF_Private_IsD63Like())
                                                              {
LABEL_883:
                                                                v270 = 0;
                                                                goto LABEL_951;
                                                              }
                                                              v144 = __sb__runningInSpringBoard();
                                                              if (v144)
                                                              {
                                                                if (SBFEffectiveDeviceClass()
                                                                  && SBFEffectiveDeviceClass() != 1)
                                                                {
                                                                  goto LABEL_883;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                v221 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (objc_msgSend(v221, "userInterfaceIdiom"))
                                                                {
                                                                  v270 = 0x100000000;
                                                                  goto LABEL_951;
                                                                }
                                                              }
                                                              HIDWORD(v270) = v144 ^ 1;
                                                              if (SBFEffectiveHomeButtonType() == 2)
                                                              {
                                                                v61 = __sb__runningInSpringBoard();
                                                                if ((_DWORD)v61)
                                                                {
                                                                  __sb__mainScreenReferenceBounds();
                                                                }
                                                                else
                                                                {
                                                                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                  v213 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  objc_msgSend(v213, "_referenceBounds");
                                                                }
                                                                LODWORD(v270) = v61 ^ 1;
                                                                BSSizeRoundForScale();
                                                                if (v160 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                                                                {
LABEL_1047:
                                                                  v273 = 0;
                                                                  v266 = 0;
                                                                  v268 = 0;
                                                                  v262 = 0;
                                                                  v264 = 0;
                                                                  v260 = 0;
                                                                  v258 = 0;
                                                                  v256 = 0;
                                                                  v71 = 0;
                                                                  v72 = 0;
                                                                  v73 = 0;
                                                                  v74 = 0;
                                                                  v75 = 0;
                                                                  v76 = 0;
                                                                  v77 = v53 + 17;
                                                                  goto LABEL_323;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                LODWORD(v270) = 0;
                                                              }
LABEL_951:
                                                              v61 = __sb__runningInSpringBoard();
                                                              if ((_DWORD)v61)
                                                              {
                                                                if (SBFEffectiveDeviceClass()
                                                                  && SBFEffectiveDeviceClass() != 1)
                                                                {
                                                                  v273 = 0;
                                                                  HIDWORD(v268) = 0;
                                                                  goto LABEL_961;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                v225 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (objc_msgSend(v225, "userInterfaceIdiom"))
                                                                {
                                                                  HIDWORD(v268) = 0;
                                                                  v273 = 1;
LABEL_961:
                                                                  if ((_SBF_Private_IsD63Like() & 1) == 0)
                                                                    goto LABEL_965;
LABEL_996:
                                                                  LODWORD(v268) = 0;
                                                                  v264 = 0;
                                                                  v266 = 0;
                                                                  v262 = 0;
                                                                  v260 = 0;
                                                                  v258 = 0;
                                                                  v256 = 0;
                                                                  v71 = 0;
                                                                  v72 = 0;
                                                                  v73 = 0;
                                                                  v74 = 0;
                                                                  v75 = 0;
                                                                  v76 = 0;
                                                                  v77 = v53 + 18;
                                                                  goto LABEL_323;
                                                                }
                                                              }
                                                              v273 = v61 ^ 1;
                                                              if (SBFEffectiveHomeButtonType() == 2)
                                                              {
                                                                v61 = __sb__runningInSpringBoard();
                                                                if ((_DWORD)v61)
                                                                {
                                                                  __sb__mainScreenReferenceBounds();
                                                                }
                                                                else
                                                                {
                                                                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  objc_msgSend(v216, "_referenceBounds");
                                                                }
                                                                HIDWORD(v268) = v61 ^ 1;
                                                                BSSizeRoundForScale();
                                                                if (v153 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                                                                {
LABEL_965:
                                                                  v154 = __sb__runningInSpringBoard();
                                                                  if (v154)
                                                                  {
                                                                    if (SBFEffectiveDeviceClass()
                                                                      && SBFEffectiveDeviceClass() != 1)
                                                                    {
                                                                      LODWORD(v268) = 0;
                                                                      LODWORD(v264) = 0;
                                                                      goto LABEL_975;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if (objc_msgSend(v222, "userInterfaceIdiom"))
                                                                    {
                                                                      LODWORD(v264) = 0;
                                                                      LODWORD(v268) = 1;
                                                                      goto LABEL_975;
                                                                    }
                                                                  }
                                                                  LODWORD(v268) = v154 ^ 1;
                                                                  if (SBFEffectiveHomeButtonType() == 2)
                                                                  {
                                                                    v61 = __sb__runningInSpringBoard();
                                                                    if ((_DWORD)v61)
                                                                    {
                                                                      __sb__mainScreenReferenceBounds();
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                      v214 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      objc_msgSend(v214, "_referenceBounds");
                                                                    }
                                                                    LODWORD(v264) = v61 ^ 1;
                                                                    BSSizeRoundForScale();
                                                                    if (v157 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                                                                    {
LABEL_1038:
                                                                      v266 = 0;
                                                                      HIDWORD(v264) = 0;
                                                                      v262 = 0;
                                                                      v260 = 0;
                                                                      v258 = 0;
                                                                      v256 = 0;
                                                                      v71 = 0;
                                                                      v72 = 0;
                                                                      v73 = 0;
                                                                      v74 = 0;
                                                                      v75 = 0;
                                                                      v76 = 0;
                                                                      v77 = v53 + 15;
                                                                      goto LABEL_323;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    LODWORD(v264) = 0;
                                                                  }
LABEL_975:
                                                                  v61 = __sb__runningInSpringBoard();
                                                                  if ((_DWORD)v61)
                                                                  {
                                                                    if (SBFEffectiveDeviceClass()
                                                                      && SBFEffectiveDeviceClass() != 1)
                                                                    {
                                                                      v266 = 0;
                                                                      goto LABEL_1019;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                    v219 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if (objc_msgSend(v219, "userInterfaceIdiom"))
                                                                    {
                                                                      v266 = 0x100000000;
LABEL_1019:
                                                                      if ((_SBF_Private_IsD33OrSimilarDevice() & 1) == 0)
                                                                        goto LABEL_1050;
LABEL_1026:
                                                                      HIDWORD(v264) = 0;
                                                                      v262 = 0;
                                                                      v260 = 0;
                                                                      v258 = 0;
                                                                      v256 = 0;
                                                                      v71 = 0;
                                                                      v72 = 0;
                                                                      v73 = 0;
                                                                      v74 = 0;
                                                                      v75 = 0;
                                                                      v76 = 0;
                                                                      v77 = v53 + 16;
                                                                      goto LABEL_323;
                                                                    }
                                                                  }
                                                                  HIDWORD(v266) = v61 ^ 1;
                                                                  if (SBFEffectiveHomeButtonType() == 2)
                                                                  {
                                                                    v61 = __sb__runningInSpringBoard();
                                                                    if ((_DWORD)v61)
                                                                    {
                                                                      __sb__mainScreenReferenceBounds();
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                      v212 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      objc_msgSend(v212, "_referenceBounds");
                                                                    }
                                                                    LODWORD(v266) = v61 ^ 1;
                                                                    BSSizeRoundForScale();
                                                                    if (v162 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                                                                    {
LABEL_1050:
                                                                      v163 = __sb__runningInSpringBoard();
                                                                      if (v163)
                                                                      {
                                                                        if (SBFEffectiveDeviceClass()
                                                                          && SBFEffectiveDeviceClass() != 1)
                                                                        {
                                                                          HIDWORD(v264) = 0;
                                                                          HIDWORD(v262) = 0;
                                                                          goto LABEL_1080;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                        v218 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        if (objc_msgSend(v218, "userInterfaceIdiom"))
                                                                        {
                                                                          HIDWORD(v262) = 0;
                                                                          HIDWORD(v264) = 1;
                                                                          goto LABEL_1080;
                                                                        }
                                                                      }
                                                                      HIDWORD(v264) = v163 ^ 1;
                                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                                      {
                                                                        v61 = __sb__runningInSpringBoard();
                                                                        if ((_DWORD)v61)
                                                                        {
                                                                          __sb__mainScreenReferenceBounds();
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                          v211 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          objc_msgSend(v211, "_referenceBounds");
                                                                        }
                                                                        HIDWORD(v262) = v61 ^ 1;
                                                                        BSSizeRoundForScale();
                                                                        if (v169 >= *(double *)(MEMORY[0x1E0DAB260]
                                                                                               + 104))
                                                                        {
                                                                          LODWORD(v262) = 0;
                                                                          v260 = 0;
                                                                          v258 = 0;
                                                                          v256 = 0;
                                                                          v71 = 0;
                                                                          v72 = 0;
                                                                          v73 = 0;
                                                                          v74 = 0;
                                                                          v75 = 0;
                                                                          v76 = 0;
                                                                          v170 = &CSQuickActionButtonInsetY;
LABEL_1119:
                                                                          v77 = v170 + 9;
                                                                          goto LABEL_323;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        HIDWORD(v262) = 0;
                                                                      }
LABEL_1080:
                                                                      v61 = __sb__runningInSpringBoard();
                                                                      if ((_DWORD)v61)
                                                                      {
                                                                        if (SBFEffectiveDeviceClass()
                                                                          && SBFEffectiveDeviceClass() != 1)
                                                                        {
                                                                          LODWORD(v262) = 0;
                                                                          v260 = 0;
                                                                          goto LABEL_1100;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                        v215 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        if (objc_msgSend(v215, "userInterfaceIdiom"))
                                                                        {
                                                                          v260 = 0;
                                                                          LODWORD(v262) = 1;
                                                                          goto LABEL_1100;
                                                                        }
                                                                      }
                                                                      LODWORD(v262) = v61 ^ 1;
                                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                                      {
                                                                        v61 = __sb__runningInSpringBoard();
                                                                        if ((_DWORD)v61)
                                                                        {
                                                                          __sb__mainScreenReferenceBounds();
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                          v210 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          objc_msgSend(v210, "_referenceBounds");
                                                                        }
                                                                        v260 = v61 ^ 1;
                                                                        BSSizeRoundForScale();
                                                                        if (v172 >= *(double *)(MEMORY[0x1E0DAB260]
                                                                                               + 104))
                                                                        {
LABEL_1122:
                                                                          if (_SBF_Private_IsD16()
                                                                            && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
                                                                          {
                                                                            v258 = 0;
                                                                            v256 = 0;
                                                                            v71 = 0;
                                                                            v72 = 0;
                                                                            v73 = 0;
                                                                            v74 = 0;
                                                                            v75 = 0;
                                                                            v76 = 0;
                                                                            v173 = &CSQuickActionButtonInsetY;
LABEL_1137:
                                                                            v77 = v173 + 5;
                                                                            goto LABEL_323;
                                                                          }
                                                                          if (_SBF_Private_IsD52ZoomedOrSimilarDevice()
                                                                            && (_SBF_Private_IsD16() & 1) != 0)
                                                                          {
                                                                            v258 = 0;
                                                                            v256 = 0;
                                                                            v71 = 0;
                                                                            v72 = 0;
                                                                            v73 = 0;
                                                                            v74 = 0;
                                                                            v75 = 0;
                                                                            v76 = 0;
                                                                            v174 = &CSQuickActionButtonInsetY;
LABEL_1141:
                                                                            v77 = v174 + 6;
                                                                            goto LABEL_323;
                                                                          }
                                                                          if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
                                                                          {
                                                                            v258 = 0;
                                                                            v256 = 0;
                                                                            v71 = 0;
                                                                            v72 = 0;
                                                                            v73 = 0;
                                                                            v74 = 0;
                                                                            v75 = 0;
                                                                            v76 = 0;
                                                                            v175 = &CSQuickActionButtonInsetY;
LABEL_1144:
                                                                            v77 = v175 + 3;
                                                                            goto LABEL_323;
                                                                          }
                                                                          if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
                                                                          {
                                                                            v258 = 0;
                                                                            v256 = 0;
                                                                            v71 = 0;
                                                                            v72 = 0;
                                                                            v73 = 0;
                                                                            v74 = 0;
                                                                            v75 = 0;
                                                                            v76 = 0;
                                                                            v176 = &CSQuickActionButtonInsetY;
LABEL_1147:
                                                                            v77 = v176 + 4;
                                                                            goto LABEL_323;
                                                                          }
                                                                          v178 = __sb__runningInSpringBoard();
                                                                          if (v178)
                                                                          {
                                                                            if (SBFEffectiveDeviceClass()
                                                                              && SBFEffectiveDeviceClass() != 1)
                                                                            {
                                                                              v258 = 0;
                                                                              v256 = 0;
LABEL_1209:
                                                                              v187 = __sb__runningInSpringBoard();
                                                                              if (v187)
                                                                              {
                                                                                if (SBFEffectiveDeviceClass()
                                                                                  && SBFEffectiveDeviceClass() != 1)
                                                                                {
                                                                                  v71 = 0;
                                                                                  v72 = 0;
LABEL_1229:
                                                                                  v189 = __sb__runningInSpringBoard();
                                                                                  if (v189)
                                                                                  {
                                                                                    if (SBFEffectiveDeviceClass()
                                                                                      && SBFEffectiveDeviceClass() != 1)
                                                                                    {
                                                                                      v73 = 0;
                                                                                      v74 = 0;
LABEL_1249:
                                                                                      v61 = __sb__runningInSpringBoard();
                                                                                      if ((_DWORD)v61)
                                                                                      {
                                                                                        if (SBFEffectiveDeviceClass()
                                                                                          && SBFEffectiveDeviceClass() != 1)
                                                                                        {
                                                                                          v75 = 0;
                                                                                          v76 = 0;
LABEL_1286:
                                                                                          v77 = &CSQuickActionButtonInsetY;
                                                                                          goto LABEL_323;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                                        v53 = (uint64_t *)objc_claimAutoreleasedReturnValue();
                                                                                        if (objc_msgSend(v53, "userInterfaceIdiom"))
                                                                                        {
                                                                                          v76 = 0;
                                                                                          v75 = 1;
                                                                                          goto LABEL_1286;
                                                                                        }
                                                                                      }
                                                                                      v75 = v61 ^ 1;
                                                                                      v200 = __sb__runningInSpringBoard();
                                                                                      if (v200)
                                                                                      {
                                                                                        __sb__mainScreenReferenceBounds();
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                                        v61 = objc_claimAutoreleasedReturnValue();
                                                                                        objc_msgSend((id)v61, "_referenceBounds");
                                                                                      }
                                                                                      v76 = v200 ^ 1;
                                                                                      BSSizeRoundForScale();
                                                                                      if (v201 < *(double *)(MEMORY[0x1E0DAB260] + 40))
                                                                                        goto LABEL_1286;
                                                                                      v202 = &CSQuickActionButtonInsetY;
                                                                                      goto LABEL_1294;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    if (objc_msgSend(v49, "userInterfaceIdiom"))
                                                                                    {
                                                                                      v74 = 0;
                                                                                      v73 = 1;
                                                                                      goto LABEL_1249;
                                                                                    }
                                                                                  }
                                                                                  v73 = v189 ^ 1;
                                                                                  v61 = __sb__runningInSpringBoard();
                                                                                  if ((_DWORD)v61)
                                                                                  {
                                                                                    __sb__mainScreenReferenceBounds();
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                                    v33 = objc_claimAutoreleasedReturnValue();
                                                                                    objc_msgSend((id)v33, "_referenceBounds");
                                                                                  }
                                                                                  v74 = v61 ^ 1;
                                                                                  BSSizeRoundForScale();
                                                                                  if (v191 < *(double *)(MEMORY[0x1E0DAB260] + 56))
                                                                                    goto LABEL_1249;
                                                                                  v75 = 0;
                                                                                  v76 = 0;
                                                                                  v192 = &CSQuickActionButtonInsetY;
LABEL_1267:
                                                                                  v77 = v192 + 2;
                                                                                  goto LABEL_323;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                                v208 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                if (objc_msgSend(v208, "userInterfaceIdiom"))
                                                                                {
                                                                                  v72 = 0;
                                                                                  v71 = 1;
                                                                                  goto LABEL_1229;
                                                                                }
                                                                              }
                                                                              v71 = v187 ^ 1;
                                                                              if (SBFEffectiveHomeButtonType() != 2)
                                                                              {
                                                                                v72 = 0;
                                                                                goto LABEL_1229;
                                                                              }
                                                                              v61 = __sb__runningInSpringBoard();
                                                                              if ((_DWORD)v61)
                                                                              {
                                                                                __sb__mainScreenReferenceBounds();
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                                v206 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                objc_msgSend(v206, "_referenceBounds");
                                                                              }
                                                                              v72 = v61 ^ 1;
                                                                              BSSizeRoundForScale();
                                                                              if (v197 < *(double *)(MEMORY[0x1E0DAB260] + 72))
                                                                                goto LABEL_1229;
                                                                              v73 = 0;
                                                                              v74 = 0;
                                                                              v75 = 0;
                                                                              v76 = 0;
                                                                              v198 = &CSQuickActionButtonInsetY;
LABEL_1281:
                                                                              v77 = v198 + 8;
                                                                              goto LABEL_323;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                                                            v209 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            if (objc_msgSend(v209, "userInterfaceIdiom"))
                                                                            {
                                                                              v256 = 0;
                                                                              v258 = 1;
                                                                              goto LABEL_1209;
                                                                            }
                                                                          }
                                                                          v258 = v178 ^ 1;
                                                                          if (SBFEffectiveHomeButtonType() != 2)
                                                                          {
                                                                            v256 = 0;
                                                                            goto LABEL_1209;
                                                                          }
                                                                          v61 = __sb__runningInSpringBoard();
                                                                          if ((_DWORD)v61)
                                                                          {
                                                                            __sb__mainScreenReferenceBounds();
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                                                            v207 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            objc_msgSend(v207, "_referenceBounds");
                                                                          }
                                                                          v256 = v61 ^ 1;
                                                                          BSSizeRoundForScale();
                                                                          if (v194 < *(double *)(MEMORY[0x1E0DAB260]
                                                                                                + 88))
                                                                            goto LABEL_1209;
                                                                          v71 = 0;
                                                                          v72 = 0;
                                                                          v73 = 0;
                                                                          v74 = 0;
                                                                          v75 = 0;
                                                                          v76 = 0;
                                                                          v195 = &CSQuickActionButtonInsetY;
LABEL_1274:
                                                                          v77 = v195 + 7;
                                                                          goto LABEL_323;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v260 = 0;
                                                                      }
LABEL_1100:
                                                                      if ((_SBF_Private_IsD53() & 1) != 0)
                                                                      {
                                                                        v258 = 0;
                                                                        v256 = 0;
                                                                        v71 = 0;
                                                                        v72 = 0;
                                                                        v73 = 0;
                                                                        v74 = 0;
                                                                        v75 = 0;
                                                                        v76 = 0;
                                                                        v167 = &CSQuickActionButtonInsetY;
LABEL_1108:
                                                                        v77 = v167 + 10;
                                                                        goto LABEL_323;
                                                                      }
                                                                      goto LABEL_1122;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    LODWORD(v266) = 0;
                                                                  }
                                                                  goto LABEL_1019;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                HIDWORD(v268) = 0;
                                                              }
                                                              goto LABEL_961;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v278 = 0;
                                                          }
                                                          goto LABEL_875;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        *(_DWORD *)&v281[4] = 0;
                                                      }
                                                      goto LABEL_763;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    *(_DWORD *)v281 = 0;
                                                  }
                                                  goto LABEL_690;
                                                }
                                              }
                                              else
                                              {
                                                *(_DWORD *)&v281[28] = 0;
                                              }
                                              goto LABEL_625;
                                            }
                                          }
                                          else
                                          {
                                            *(_DWORD *)&v281[48] = 0;
                                          }
                                          goto LABEL_539;
                                        }
                                        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                        v247 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (objc_msgSend(v247, "userInterfaceIdiom") != 1)
                                          goto LABEL_439;
LABEL_456:
                                        *(_DWORD *)&v281[64] = 0;
                                        memset(v281, 0, 60);
                                        v276 = 0;
                                        v274 = 0;
                                        v280 = 0;
                                        v278 = 0;
                                        v268 = 0;
                                        v270 = 0;
                                        v273 = 0;
                                        v264 = 0;
                                        v266 = 0;
                                        v262 = 0;
                                        v260 = 0;
                                        v258 = 0;
                                        v256 = 0;
                                        v71 = 0;
                                        v72 = 0;
                                        v73 = 0;
                                        v74 = 0;
                                        v75 = 0;
                                        v76 = 0;
                                        v77 = v53 + 25;
                                        HIDWORD(v282) = v61 ^ 1;
                                        goto LABEL_323;
                                      }
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                      v249 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (objc_msgSend(v249, "userInterfaceIdiom") != 1)
                                      {
                                        *(_QWORD *)&v283[0] = 0x100000000;
                                        goto LABEL_435;
                                      }
                                    }
                                    DWORD1(v283[0]) = v79 ^ 1;
                                    v61 = __sb__runningInSpringBoard();
                                    if ((_DWORD)v61)
                                    {
                                      __sb__mainScreenReferenceBounds();
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                      v242 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v242, "_referenceBounds");
                                    }
                                    LODWORD(v283[0]) = v61 ^ 1;
                                    BSSizeRoundForScale();
                                    if (v94 < *(double *)(MEMORY[0x1E0DAB260] + 232))
                                      goto LABEL_435;
LABEL_454:
                                    HIDWORD(v282) = 0;
                                    *(_DWORD *)&v281[64] = 0;
                                    memset(v281, 0, 60);
                                    v276 = 0;
                                    v274 = 0;
                                    v280 = 0;
                                    v278 = 0;
                                    v268 = 0;
                                    v270 = 0;
                                    v273 = 0;
                                    v264 = 0;
                                    v266 = 0;
                                    v262 = 0;
                                    v260 = 0;
                                    v258 = 0;
                                    v256 = 0;
                                    v71 = 0;
                                    v72 = 0;
                                    v73 = 0;
                                    v74 = 0;
                                    v75 = 0;
                                    v76 = 0;
                                    v77 = v53 + 27;
                                    goto LABEL_323;
                                  }
                                }
                                else
                                {
                                  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                                  v250 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (objc_msgSend(v250, "userInterfaceIdiom") != 1)
                                  {
                                    *((_QWORD *)&v283[0] + 1) = 0x100000000;
                                    goto LABEL_287;
                                  }
                                }
                                HIDWORD(v283[0]) = v68 ^ 1;
                                v61 = __sb__runningInSpringBoard();
                                if ((_DWORD)v61)
                                {
                                  __sb__mainScreenReferenceBounds();
                                }
                                else
                                {
                                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                                  v246 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v246, "_referenceBounds");
                                }
                                DWORD2(v283[0]) = v61 ^ 1;
                                BSSizeRoundForScale();
                                if (v78 < *(double *)(MEMORY[0x1E0DAB260] + 248))
                                  goto LABEL_287;
LABEL_299:
                                *(_QWORD *)&v283[0] = 0;
                                HIDWORD(v282) = 0;
                                *(_DWORD *)&v281[64] = 0;
                                memset(v281, 0, 60);
                                v276 = 0;
                                v274 = 0;
                                v280 = 0;
                                v278 = 0;
                                v268 = 0;
                                v270 = 0;
                                v273 = 0;
                                v264 = 0;
                                v266 = 0;
                                v262 = 0;
                                v260 = 0;
                                v258 = 0;
                                v256 = 0;
                                v71 = 0;
                                v72 = 0;
                                v73 = 0;
                                v74 = 0;
                                v75 = 0;
                                v76 = 0;
                                v77 = v53 + 28;
                                goto LABEL_323;
                              }
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                              v251 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v251, "userInterfaceIdiom") != 1)
                              {
                                *(_QWORD *)&v283[1] = 0x100000000;
                                goto LABEL_268;
                              }
                            }
                            DWORD1(v283[1]) = v63 ^ 1;
                            v61 = __sb__runningInSpringBoard();
                            if ((_DWORD)v61)
                            {
                              __sb__mainScreenReferenceBounds();
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                              v248 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v248, "_referenceBounds");
                            }
                            LODWORD(v283[1]) = v61 ^ 1;
                            BSSizeRoundForScale();
                            if (v67 < *(double *)(MEMORY[0x1E0DAB260] + 264))
                              goto LABEL_268;
LABEL_280:
                            v283[0] = 0uLL;
                            HIDWORD(v282) = 0;
                            *(_DWORD *)&v281[64] = 0;
                            memset(v281, 0, 60);
                            v276 = 0;
                            v274 = 0;
                            v280 = 0;
                            v278 = 0;
                            v268 = 0;
                            v270 = 0;
                            v273 = 0;
                            v264 = 0;
                            v266 = 0;
                            v262 = 0;
                            v260 = 0;
                            v258 = 0;
                            v256 = 0;
                            v71 = 0;
                            v72 = 0;
                            v73 = 0;
                            v74 = 0;
                            v75 = 0;
                            v76 = 0;
                            v77 = v53 + 30;
                            goto LABEL_323;
                          }
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                          v252 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v252, "userInterfaceIdiom") != 1)
                          {
                            *((_QWORD *)&v283[1] + 1) = 0x100000000;
                            goto LABEL_238;
                          }
                        }
                        HIDWORD(v283[1]) = v60 ^ 1;
                        if (SBFEffectiveHomeButtonType() != 2)
                        {
                          DWORD2(v283[1]) = 0;
                          goto LABEL_238;
                        }
                        v61 = __sb__runningInSpringBoard();
                        if ((_DWORD)v61)
                        {
                          __sb__mainScreenReferenceBounds();
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                          v243 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v243, "_referenceBounds");
                        }
                        DWORD2(v283[1]) = v61 ^ 1;
                        BSSizeRoundForScale();
                        if (v88 < *(double *)(MEMORY[0x1E0DAB260] + 360))
                          goto LABEL_238;
LABEL_322:
                        memset(v283, 0, 24);
                        HIDWORD(v282) = 0;
                        *(_DWORD *)&v281[64] = 0;
                        memset(v281, 0, 60);
                        v276 = 0;
                        v274 = 0;
                        v280 = 0;
                        v278 = 0;
                        v268 = 0;
                        v270 = 0;
                        v273 = 0;
                        v264 = 0;
                        v266 = 0;
                        v262 = 0;
                        v260 = 0;
                        v258 = 0;
                        v256 = 0;
                        v71 = 0;
                        v72 = 0;
                        v73 = 0;
                        v74 = 0;
                        v75 = 0;
                        v76 = 0;
                        v77 = v53 + 29;
                        goto LABEL_323;
                      }
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                      v253 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v253, "userInterfaceIdiom") != 1)
                      {
                        *(_DWORD *)&v281[60] = 0;
                        LODWORD(v282) = 1;
                        goto LABEL_220;
                      }
                    }
                    LODWORD(v282) = v56 ^ 1;
                    if (SBFEffectiveHomeButtonType() != 2)
                    {
                      *(_DWORD *)&v281[60] = 0;
                      goto LABEL_220;
                    }
                    v57 = __sb__runningInSpringBoard();
                    if (v57)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                      v244 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v244, "_referenceBounds");
                    }
                    v61 = v57 ^ 1u;
                    BSSizeRoundForScale();
                    *(_DWORD *)&v281[60] = v61;
                    if (v86 < *(double *)(MEMORY[0x1E0DAB260] + 424))
                      goto LABEL_220;
LABEL_316:
                    memset(v283, 0, sizeof(v283));
                    HIDWORD(v282) = 0;
                    *(_DWORD *)&v281[64] = 0;
                    memset(v281, 0, 60);
                    v276 = 0;
                    v274 = 0;
                    v280 = 0;
                    v278 = 0;
                    v268 = 0;
                    v270 = 0;
                    v273 = 0;
                    v264 = 0;
                    v266 = 0;
                    v262 = 0;
                    v260 = 0;
                    v258 = 0;
                    v256 = 0;
                    v71 = 0;
                    v72 = 0;
                    v73 = 0;
                    v74 = 0;
                    v75 = 0;
                    v76 = 0;
                    v77 = v53 + 31;
                    goto LABEL_323;
                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                  v254 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v254, "userInterfaceIdiom") != 1)
                  {
                    v284 = 0x100000000;
                    goto LABEL_202;
                  }
                }
                HIDWORD(v284) = v52 ^ 1;
                if (SBFEffectiveHomeButtonType() != 2)
                {
                  LODWORD(v284) = 0;
                  goto LABEL_202;
                }
                v54 = __sb__runningInSpringBoard();
                if (v54)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v245, "_referenceBounds");
                }
                v61 = v54 ^ 1u;
                BSSizeRoundForScale();
                LODWORD(v284) = v61;
                if (v83 != *(double *)(MEMORY[0x1E0DAB260] + 272) || v82 != *(double *)(MEMORY[0x1E0DAB260] + 280))
                  goto LABEL_202;
LABEL_310:
                v282 = 0;
                memset(v283, 0, sizeof(v283));
                memset(v281, 0, sizeof(v281));
                v276 = 0;
                v274 = 0;
                v280 = 0;
                v278 = 0;
                v268 = 0;
                v270 = 0;
                v273 = 0;
                v264 = 0;
                v266 = 0;
                v262 = 0;
                v260 = 0;
                v258 = 0;
                v256 = 0;
                v71 = 0;
                v72 = 0;
                v73 = 0;
                v74 = 0;
                v75 = 0;
                v76 = 0;
                v77 = v53 + 26;
                goto LABEL_323;
              }
              v53 = &CSQuickActionButtonInsetX;
              if (v51)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  v284 = 0;
                  goto LABEL_211;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v254 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v254, "userInterfaceIdiom") != 1)
                {
                  v284 = 0x100000000;
                  goto LABEL_211;
                }
              }
              HIDWORD(v284) = v52 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v55 = __sb__runningInSpringBoard();
                if (v55)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v245, "_referenceBounds");
                }
                v61 = v55 ^ 1u;
                BSSizeRoundForScale();
                LODWORD(v284) = v61;
                if (v85 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v84 == *(double *)(MEMORY[0x1E0DAB260] + 280))
                  goto LABEL_310;
              }
              else
              {
                LODWORD(v284) = 0;
              }
LABEL_211:
              v58 = __sb__runningInSpringBoard();
              if (v58)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  LODWORD(v282) = 0;
                  *(_DWORD *)&v281[60] = 0;
                  goto LABEL_229;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v253 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v253, "userInterfaceIdiom") != 1)
                {
                  *(_DWORD *)&v281[60] = 0;
                  LODWORD(v282) = 1;
                  goto LABEL_229;
                }
              }
              LODWORD(v282) = v58 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v59 = __sb__runningInSpringBoard();
                if (v59)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v244 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v244, "_referenceBounds");
                }
                v61 = v59 ^ 1u;
                BSSizeRoundForScale();
                *(_DWORD *)&v281[60] = v61;
                if (v87 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
                  goto LABEL_316;
              }
              else
              {
                *(_DWORD *)&v281[60] = 0;
              }
LABEL_229:
              v62 = __sb__runningInSpringBoard();
              if (v62)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *((_QWORD *)&v283[1] + 1) = 0;
                  goto LABEL_246;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v252 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v252, "userInterfaceIdiom") != 1)
                {
                  *((_QWORD *)&v283[1] + 1) = 0x100000000;
                  goto LABEL_246;
                }
              }
              HIDWORD(v283[1]) = v62 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v243 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v243, "_referenceBounds");
                }
                DWORD2(v283[1]) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v89 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
                  goto LABEL_322;
              }
              else
              {
                DWORD2(v283[1]) = 0;
              }
LABEL_246:
              v64 = __sb__runningInSpringBoard();
              if (v64)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *(_QWORD *)&v283[1] = 0;
                  goto LABEL_277;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v251 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v251, "userInterfaceIdiom") != 1)
                {
                  *(_QWORD *)&v283[1] = 0x100000000;
                  goto LABEL_277;
                }
              }
              DWORD1(v283[1]) = v64 ^ 1;
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v248, "_referenceBounds");
              }
              LODWORD(v283[1]) = v61 ^ 1;
              BSSizeRoundForScale();
              if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
                goto LABEL_280;
LABEL_277:
              v70 = __sb__runningInSpringBoard();
              if (v70)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *((_QWORD *)&v283[0] + 1) = 0;
                  goto LABEL_296;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v250, "userInterfaceIdiom") != 1)
                {
                  *((_QWORD *)&v283[0] + 1) = 0x100000000;
                  goto LABEL_296;
                }
              }
              HIDWORD(v283[0]) = v70 ^ 1;
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v246 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v246, "_referenceBounds");
              }
              DWORD2(v283[0]) = v61 ^ 1;
              BSSizeRoundForScale();
              if (v80 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
                goto LABEL_299;
LABEL_296:
              v81 = __sb__runningInSpringBoard();
              if (v81)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *(_QWORD *)&v283[0] = 0;
                  goto LABEL_447;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v249 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v249, "userInterfaceIdiom") != 1)
                {
                  *(_QWORD *)&v283[0] = 0x100000000;
                  goto LABEL_447;
                }
              }
              DWORD1(v283[0]) = v81 ^ 1;
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v242, "_referenceBounds");
              }
              LODWORD(v283[0]) = v61 ^ 1;
              BSSizeRoundForScale();
              if (v96 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
                goto LABEL_454;
LABEL_447:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() == 2)
                  goto LABEL_456;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v247 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v247, "userInterfaceIdiom") == 1)
                  goto LABEL_456;
              }
              HIDWORD(v282) = v61 ^ 1;
              if (!_SBF_Private_IsD94Like())
                goto LABEL_453;
              v97 = __sb__runningInSpringBoard();
              if (v97)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
LABEL_453:
                  *(_QWORD *)&v281[52] = 0;
                  goto LABEL_554;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v240, "userInterfaceIdiom"))
                {
                  *(_DWORD *)&v281[52] = 0;
                  *(_DWORD *)&v281[56] = 1;
                  goto LABEL_554;
                }
              }
              *(_DWORD *)&v281[56] = v97 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v233 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v233, "_referenceBounds");
                }
                *(_DWORD *)&v281[52] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v110 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
                  goto LABEL_592;
              }
              else
              {
                *(_DWORD *)&v281[52] = 0;
              }
LABEL_554:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[64] = 0;
                  *(_DWORD *)&v281[48] = 0;
                  goto LABEL_564;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v241 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v241, "userInterfaceIdiom"))
                {
                  *(_DWORD *)&v281[48] = 0;
                  *(_DWORD *)&v281[64] = 1;
                  goto LABEL_564;
                }
              }
              *(_DWORD *)&v281[64] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v236 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v236, "_referenceBounds");
                }
                *(_DWORD *)&v281[48] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v105 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
                  goto LABEL_568;
              }
              else
              {
                *(_DWORD *)&v281[48] = 0;
              }
LABEL_564:
              if ((_SBF_Private_IsD94Like() & 1) != 0)
                goto LABEL_565;
LABEL_568:
              if (!_SBF_Private_IsD64Like())
              {
LABEL_572:
                *(_QWORD *)&v281[40] = 0;
                goto LABEL_649;
              }
              v106 = __sb__runningInSpringBoard();
              if (v106)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                  goto LABEL_572;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v237, "userInterfaceIdiom"))
                {
                  *(_DWORD *)&v281[40] = 0;
                  *(_DWORD *)&v281[44] = 1;
                  goto LABEL_649;
                }
              }
              *(_DWORD *)&v281[44] = v106 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v228, "_referenceBounds");
                }
                *(_DWORD *)&v281[40] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v123 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                  goto LABEL_713;
              }
              else
              {
                *(_DWORD *)&v281[40] = 0;
              }
LABEL_649:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[36] = 0;
                  *(_DWORD *)&v281[28] = 0;
                  goto LABEL_659;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v239 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v239, "userInterfaceIdiom"))
                {
                  *(_DWORD *)&v281[28] = 0;
                  *(_DWORD *)&v281[36] = 1;
                  goto LABEL_659;
                }
              }
              *(_DWORD *)&v281[36] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v232 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v232, "_referenceBounds");
                }
                *(_DWORD *)&v281[28] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v116 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                  goto LABEL_663;
              }
              else
              {
                *(_DWORD *)&v281[28] = 0;
              }
LABEL_659:
              if ((_SBF_Private_IsD64Like() & 1) != 0)
                goto LABEL_660;
LABEL_663:
              v117 = __sb__runningInSpringBoard();
              if (v117)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[32] = 0;
                  *(_DWORD *)&v281[24] = 0;
                  goto LABEL_673;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v238, "userInterfaceIdiom"))
                {
                  *(_DWORD *)&v281[24] = 0;
                  *(_DWORD *)&v281[32] = 1;
                  goto LABEL_673;
                }
              }
              *(_DWORD *)&v281[32] = v117 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v118 = __sb__runningInSpringBoard();
                if (v118)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v229 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "_referenceBounds");
                }
                v61 = v118 ^ 1u;
                BSSizeRoundForScale();
                *(_DWORD *)&v281[24] = v61;
                if (v120 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                  goto LABEL_703;
              }
              else
              {
                *(_DWORD *)&v281[24] = 0;
              }
LABEL_673:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[12] = 0;
                  *(_DWORD *)v281 = 0;
                  goto LABEL_696;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v235 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v235, "userInterfaceIdiom"))
                {
                  *(_DWORD *)v281 = 0;
                  *(_DWORD *)&v281[12] = 1;
                  goto LABEL_696;
                }
              }
              *(_DWORD *)&v281[12] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v227, "_referenceBounds");
                }
                *(_DWORD *)v281 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v128 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
                  goto LABEL_733;
              }
              else
              {
                *(_DWORD *)v281 = 0;
              }
LABEL_696:
              if ((_SBF_Private_IsD54() & 1) != 0)
                goto LABEL_697;
LABEL_733:
              v129 = __sb__runningInSpringBoard();
              if (v129)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_QWORD *)&v281[16] = 0;
                  goto LABEL_753;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v234, "userInterfaceIdiom"))
                {
                  *(_DWORD *)&v281[16] = 0;
                  *(_DWORD *)&v281[20] = 1;
                  goto LABEL_753;
                }
              }
              *(_DWORD *)&v281[20] = v129 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v131 = __sb__runningInSpringBoard();
                if (v131)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v224, "_referenceBounds");
                }
                v61 = v131 ^ 1u;
                BSSizeRoundForScale();
                *(_DWORD *)&v281[16] = v61;
                if (v135 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
                  goto LABEL_805;
              }
              else
              {
                *(_DWORD *)&v281[16] = 0;
              }
LABEL_753:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_QWORD *)&v281[4] = 0;
                  goto LABEL_770;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v231 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v231, "userInterfaceIdiom"))
                {
                  *(_DWORD *)&v281[4] = 0;
                  *(_DWORD *)&v281[8] = 1;
                  goto LABEL_770;
                }
              }
              *(_DWORD *)&v281[8] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v223 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v223, "_referenceBounds");
                }
                *(_DWORD *)&v281[4] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v138 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                  goto LABEL_817;
              }
              else
              {
                *(_DWORD *)&v281[4] = 0;
              }
LABEL_770:
              if (_SBF_Private_IsD33OrSimilarDevice()
                && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
              {
                goto LABEL_772;
              }
LABEL_817:
              if (!_SBF_Private_IsD93Like())
              {
LABEL_821:
                v276 = 0;
                v274 = 0;
                goto LABEL_890;
              }
              v139 = __sb__runningInSpringBoard();
              if (v139)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                  goto LABEL_821;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v226 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v226, "userInterfaceIdiom"))
                {
                  v274 = 0;
                  v276 = 1;
                  goto LABEL_890;
                }
              }
              v276 = v139 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v217, "_referenceBounds");
                }
                v274 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v150 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
                  goto LABEL_928;
              }
              else
              {
                v274 = 0;
              }
LABEL_890:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  v280 = 0;
                  v278 = 0;
                  goto LABEL_900;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v230 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v230, "userInterfaceIdiom"))
                {
                  v278 = 0;
                  v280 = 1;
                  goto LABEL_900;
                }
              }
              v280 = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v220 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v220, "_referenceBounds");
                }
                v278 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v145 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
                  goto LABEL_904;
              }
              else
              {
                v278 = 0;
              }
LABEL_900:
              if ((_SBF_Private_IsD93Like() & 1) != 0)
                goto LABEL_901;
LABEL_904:
              if (!_SBF_Private_IsD63Like())
              {
LABEL_908:
                v270 = 0;
                goto LABEL_985;
              }
              v146 = __sb__runningInSpringBoard();
              if (v146)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                  goto LABEL_908;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v221, "userInterfaceIdiom"))
                {
                  v270 = 0x100000000;
                  goto LABEL_985;
                }
              }
              HIDWORD(v270) = v146 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v213 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v213, "_referenceBounds");
                }
                LODWORD(v270) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v161 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                  goto LABEL_1047;
              }
              else
              {
                LODWORD(v270) = 0;
              }
LABEL_985:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  v273 = 0;
                  HIDWORD(v268) = 0;
                  goto LABEL_995;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v225 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v225, "userInterfaceIdiom"))
                {
                  HIDWORD(v268) = 0;
                  v273 = 1;
                  goto LABEL_995;
                }
              }
              v273 = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v216, "_referenceBounds");
                }
                HIDWORD(v268) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v155 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                  goto LABEL_999;
              }
              else
              {
                HIDWORD(v268) = 0;
              }
LABEL_995:
              if ((_SBF_Private_IsD63Like() & 1) != 0)
                goto LABEL_996;
LABEL_999:
              v156 = __sb__runningInSpringBoard();
              if (v156)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  LODWORD(v268) = 0;
                  LODWORD(v264) = 0;
                  goto LABEL_1009;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v222 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v222, "userInterfaceIdiom"))
                {
                  LODWORD(v264) = 0;
                  LODWORD(v268) = 1;
                  goto LABEL_1009;
                }
              }
              LODWORD(v268) = v156 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v214 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v214, "_referenceBounds");
                }
                LODWORD(v264) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v158 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                  goto LABEL_1038;
              }
              else
              {
                LODWORD(v264) = 0;
              }
LABEL_1009:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  v266 = 0;
                  goto LABEL_1025;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v219, "userInterfaceIdiom"))
                {
                  v266 = 0x100000000;
                  goto LABEL_1025;
                }
              }
              HIDWORD(v266) = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v212, "_referenceBounds");
                }
                LODWORD(v266) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v164 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
                  goto LABEL_1058;
              }
              else
              {
                LODWORD(v266) = 0;
              }
LABEL_1025:
              if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
                goto LABEL_1026;
LABEL_1058:
              v165 = __sb__runningInSpringBoard();
              if (v165)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  HIDWORD(v264) = 0;
                  HIDWORD(v262) = 0;
                  goto LABEL_1090;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v218, "userInterfaceIdiom"))
                {
                  HIDWORD(v262) = 0;
                  HIDWORD(v264) = 1;
                  goto LABEL_1090;
                }
              }
              HIDWORD(v264) = v165 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v211, "_referenceBounds");
                }
                HIDWORD(v262) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v171 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                {
                  LODWORD(v262) = 0;
                  v260 = 0;
                  v258 = 0;
                  v256 = 0;
                  v71 = 0;
                  v72 = 0;
                  v73 = 0;
                  v74 = 0;
                  v75 = 0;
                  v76 = 0;
                  v170 = &CSQuickActionButtonInsetX;
                  goto LABEL_1119;
                }
              }
              else
              {
                HIDWORD(v262) = 0;
              }
LABEL_1090:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  LODWORD(v262) = 0;
                  v260 = 0;
                  goto LABEL_1106;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v215 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v215, "userInterfaceIdiom"))
                {
                  v260 = 0;
                  LODWORD(v262) = 1;
                  goto LABEL_1106;
                }
              }
              LODWORD(v262) = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v210, "_referenceBounds");
                }
                v260 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v177 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
                  goto LABEL_1134;
              }
              else
              {
                v260 = 0;
              }
LABEL_1106:
              if ((_SBF_Private_IsD53() & 1) != 0)
              {
                v258 = 0;
                v256 = 0;
                v71 = 0;
                v72 = 0;
                v73 = 0;
                v74 = 0;
                v75 = 0;
                v76 = 0;
                v167 = &CSQuickActionButtonInsetX;
                goto LABEL_1108;
              }
LABEL_1134:
              if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
              {
                v258 = 0;
                v256 = 0;
                v71 = 0;
                v72 = 0;
                v73 = 0;
                v74 = 0;
                v75 = 0;
                v76 = 0;
                v173 = &CSQuickActionButtonInsetX;
                goto LABEL_1137;
              }
              if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
              {
                v258 = 0;
                v256 = 0;
                v71 = 0;
                v72 = 0;
                v73 = 0;
                v74 = 0;
                v75 = 0;
                v76 = 0;
                v174 = &CSQuickActionButtonInsetX;
                goto LABEL_1141;
              }
              if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
              {
                v258 = 0;
                v256 = 0;
                v71 = 0;
                v72 = 0;
                v73 = 0;
                v74 = 0;
                v75 = 0;
                v76 = 0;
                v175 = &CSQuickActionButtonInsetX;
                goto LABEL_1144;
              }
              if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
              {
                v258 = 0;
                v256 = 0;
                v71 = 0;
                v72 = 0;
                v73 = 0;
                v74 = 0;
                v75 = 0;
                v76 = 0;
                v176 = &CSQuickActionButtonInsetX;
                goto LABEL_1147;
              }
              v179 = __sb__runningInSpringBoard();
              if (v179)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  v258 = 0;
                  v256 = 0;
                  goto LABEL_1219;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v209 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v209, "userInterfaceIdiom"))
                {
                  v256 = 0;
                  v258 = 1;
                  goto LABEL_1219;
                }
              }
              v258 = v179 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v207 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v207, "_referenceBounds");
                }
                v256 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v196 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
                {
                  v71 = 0;
                  v72 = 0;
                  v73 = 0;
                  v74 = 0;
                  v75 = 0;
                  v76 = 0;
                  v195 = &CSQuickActionButtonInsetX;
                  goto LABEL_1274;
                }
              }
              else
              {
                v256 = 0;
              }
LABEL_1219:
              v188 = __sb__runningInSpringBoard();
              if (v188)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  v71 = 0;
                  v72 = 0;
                  goto LABEL_1239;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v208 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v208, "userInterfaceIdiom"))
                {
                  v72 = 0;
                  v71 = 1;
                  goto LABEL_1239;
                }
              }
              v71 = v188 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                v61 = __sb__runningInSpringBoard();
                if ((_DWORD)v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v206, "_referenceBounds");
                }
                v72 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v199 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
                {
                  v73 = 0;
                  v74 = 0;
                  v75 = 0;
                  v76 = 0;
                  v198 = &CSQuickActionButtonInsetX;
                  goto LABEL_1281;
                }
              }
              else
              {
                v72 = 0;
              }
LABEL_1239:
              v190 = __sb__runningInSpringBoard();
              if (v190)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  v73 = 0;
                  v74 = 0;
                  goto LABEL_1260;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v49, "userInterfaceIdiom"))
                {
                  v74 = 0;
                  v73 = 1;
                  goto LABEL_1260;
                }
              }
              v73 = v190 ^ 1;
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v33 = objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v33, "_referenceBounds");
              }
              v74 = v61 ^ 1;
              BSSizeRoundForScale();
              if (v193 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
              {
                v75 = 0;
                v76 = 0;
                v192 = &CSQuickActionButtonInsetX;
                goto LABEL_1267;
              }
LABEL_1260:
              v61 = __sb__runningInSpringBoard();
              if ((_DWORD)v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  v75 = 0;
                  v76 = 0;
                  goto LABEL_1292;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                v53 = (uint64_t *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v53, "userInterfaceIdiom"))
                {
                  v76 = 0;
                  v75 = 1;
                  goto LABEL_1292;
                }
              }
              v75 = v61 ^ 1;
              v203 = __sb__runningInSpringBoard();
              if (v203)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v61 = objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v61, "_referenceBounds");
              }
              v76 = v203 ^ 1;
              BSSizeRoundForScale();
              if (v204 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
              {
                v202 = &CSQuickActionButtonInsetX;
LABEL_1294:
                v77 = v202 + 1;
LABEL_323:
                v90 = *(double *)v77;
                if (v76)

                if (v75)
                if (v74)
                {

                  if (!v73)
                    goto LABEL_329;
                }
                else if (!v73)
                {
LABEL_329:
                  if (v72)
                    goto LABEL_330;
                  goto LABEL_334;
                }

                if (v72)
                {
LABEL_330:

                  if (!v71)
                    goto LABEL_336;
                  goto LABEL_335;
                }
LABEL_334:
                if (!v71)
                {
LABEL_336:
                  if (v256)

                  if (v258)
                  if (v260)

                  if ((_DWORD)v262)
                  if (HIDWORD(v262))

                  if (HIDWORD(v264))
                  if ((_DWORD)v266)

                  if (HIDWORD(v266))
                  if ((_DWORD)v264)

                  if ((_DWORD)v268)
                  if (HIDWORD(v268))

                  if (v273)
                  if ((_DWORD)v270)

                  if (HIDWORD(v270))
                  if (v278)

                  if (v280)
                  if (v274)

                  if (v276)
                  if (*(_DWORD *)&v281[4])

                  if (*(_DWORD *)&v281[8])
                  if (*(_DWORD *)&v281[16])

                  if (*(_DWORD *)&v281[20])
                  if (*(_DWORD *)v281)

                  if (*(_DWORD *)&v281[12])
                  if (*(_DWORD *)&v281[24])

                  if (*(_DWORD *)&v281[32])
                  if (*(_DWORD *)&v281[28])

                  if (*(_DWORD *)&v281[36])
                  if (*(_DWORD *)&v281[40])

                  if (*(_DWORD *)&v281[44])
                  if (*(_DWORD *)&v281[48])

                  if (*(_DWORD *)&v281[64])
                  if (*(_DWORD *)&v281[52])

                  if (*(_DWORD *)&v281[56])
                  if (HIDWORD(v282))

                  if (LODWORD(v283[0]))
                  if (DWORD1(v283[0]))

                  if (DWORD2(v283[0]))
                  if (HIDWORD(v283[0]))

                  if (LODWORD(v283[1]))
                  if (DWORD1(v283[1]))

                  if (DWORD2(v283[1]))
                  if (HIDWORD(v283[1]))

                  if (*(_DWORD *)&v281[60])
                  if ((_DWORD)v282)

                  if ((_DWORD)v284)
                  v23 = v50 + v90;
                  if (HIDWORD(v284))

LABEL_430:
                  v11 = v11 - (v15 + v23);
                  v22 = 0.0;
                  goto LABEL_431;
                }
LABEL_335:

                goto LABEL_336;
              }
LABEL_1292:
              v77 = &CSQuickActionButtonInsetX;
              goto LABEL_323;
            }
LABEL_88:

            goto LABEL_89;
          }
LABEL_84:

          goto LABEL_85;
        }
LABEL_1203:
        v41 = &CSQuickActionButtonDiameter;
        goto LABEL_77;
      }
    }
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v259 = 0;
    v261 = 0;
    v263 = 0;
    v265 = 0;
    v267 = 0;
    v272 = 0;
    v271 = 0;
    v275 = 0;
    v279 = 0;
    v269 = 0;
    v277 = 0;
    memset(v281, 0, 64);
    v41 = &qword_1D048F9A0;
    *(_DWORD *)&v281[64] = v27 ^ 1;
    goto LABEL_77;
  }
  objc_msgSend(MEMORY[0x1E0DAC668], "idealSearchPlatterWidth");
  v19 = v18;
  v20 = CSMainPageListInsetXLandscapePhoneDeviceSpecific();
  v21 = v10 - v20 - v19 + v20 * -0.5;
  v15 = 0.0;
  v10 = v10 - (v21 + 0.0);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v22 = 0.0;
  else
    v22 = v21;
LABEL_431:
  v91 = v15;
  v92 = v10;
  v93 = v11;
  result.size.height = v93;
  result.size.width = v92;
  result.origin.y = v91;
  result.origin.x = v22;
  return result;
}

+ (CGRect)_screenBoundsForPortrait:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Height;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Height = CGRectGetHeight(v22);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  Width = CGRectGetWidth(v23);
  if (Height >= Width)
    v15 = Height;
  else
    v15 = Width;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v16 = CGRectGetHeight(v24);
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v17 = CGRectGetWidth(v25);
  if (v16 < v17)
    v17 = v16;
  if (v3)
    v18 = v17;
  else
    v18 = v15;
  if (v3)
    v19 = v15;
  else
    v19 = v17;
  v20 = 0.0;
  v21 = 0.0;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)_normalizedContentCutoutForScreenBounds:(CGRect)a3 contentBoundingRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v20 = CGRectGetWidth(a3);
  v21.origin.x = v11;
  v21.origin.y = v10;
  v21.size.width = v9;
  v21.size.height = v8;
  v12 = CGRectGetHeight(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v13 = CGRectGetMinX(v22) / v20;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v14 = CGRectGetMinY(v23) / v12;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v15 = CGRectGetWidth(v24) / v20;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v16 = CGRectGetHeight(v25) / v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
