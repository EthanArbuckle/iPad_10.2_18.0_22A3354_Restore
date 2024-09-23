@implementation NTKPhotosColorPalette

- (id)imageAsset
{
  return NTKImageNamed(CFSTR("PhotosColorRamps"));
}

- (id)colorRampImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (-[NTKPhotosColorPalette isOriginalColor](self, "isOriginalColor"))
  {
    v3 = 0;
  }
  else
  {
    -[NTKPhotosColorPalette imageAsset](self, "imageAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPhotosColorPalette colorRampsIndex](self, "colorRampsIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "intValue");
    }
    else
    {
      objc_msgSend(v4, "size");
      v9 = v8;
      objc_msgSend(v4, "scale");
      v7 = (int)(v9 * v10 + -1.0);
    }
    objc_msgSend(v4, "size");
    NTKCropImage(v4, 0.0, (double)v7, v11, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)monocolorRampImage
{
  void *v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  if (-[NTKPhotosColorPalette isOriginalColor](self, "isOriginalColor"))
  {
    v3 = 0;
  }
  else
  {
    -[NTKPhotosColorPalette monocolorRampColor](self, "monocolorRampColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6.width = 1.0;
    v6.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v6, 1, 1.0);
    objc_msgSend(v4, "setFill");
    v7.origin.x = 0.0;
    v7.origin.y = 0.0;
    v7.size.width = 1.0;
    v7.size.height = 1.0;
    UIRectFill(v7);
    UIGraphicsGetImageFromCurrentImageContext();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v3;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height;
  double width;
  double v7;
  double v8;
  id v9;
  CGContext *CurrentContext;
  CGContext *v11;
  CGImage *Image;
  CGContext *v13;
  id v14;
  CGImage *v15;
  void *v16;
  void *v17;
  double v19;
  double v20;
  CGContext *v21;
  void *v22;
  CGContext *v23;
  CGImage *v24;
  CGContext *v25;
  CGImage *v26;
  objc_super v28;
  CGAffineTransform transform;
  CGSize v30;
  CGSize v31;
  CGSize v32;
  CGSize v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.height;
  width = a3.width;
  if (-[NTKPhotosColorPalette isOriginalColor](self, "isOriginalColor"))
  {
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", 0);
      width = v7;
      height = v8;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v30.width = width;
    v30.height = height;
    UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(v9, "set");
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = width;
    v34.size.height = height;
    CGContextFillEllipseInRect(CurrentContext, v34);
    v11 = UIGraphicsGetCurrentContext();
    Image = CGBitmapContextCreateImage(v11);
    UIGraphicsEndImageContext();
    v31.width = width;
    v31.height = height;
    UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
    v13 = UIGraphicsGetCurrentContext();
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.width = width;
    v35.size.height = height;
    CGContextClipToMask(v13, v35, Image);
    objc_msgSend(v9, "set");
    transform.b = 0.0;
    transform.c = 0.0;
    transform.a = 1.0;
    *(_OWORD *)&transform.d = xmmword_1B755F9E0;
    transform.ty = height;
    CGContextConcatCTM(v13, &transform);
    NTKImageNamed(CFSTR("NoneSwatch"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (CGImage *)objc_msgSend(v14, "CGImage");
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.width = width;
    v36.size.height = height;
    CGContextDrawImage(v13, v36, v15);
    UIGraphicsGetImageFromCurrentImageContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    CGImageRelease(Image);

  }
  else
  {
    if (!-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
    {
      v28.receiver = self;
      v28.super_class = (Class)NTKPhotosColorPalette;
      -[NTKFaceColorPalette swatchImageForSize:](&v28, sel_swatchImageForSize_, width, height);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      return v16;
    }
    -[NTKPhotosColorPalette colorRampImage](self, "colorRampImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", 0);
      width = v19;
      height = v20;
    }
    v32.width = width;
    v32.height = height;
    UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
    v21 = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "set");

    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v37.size.width = width;
    v37.size.height = height;
    CGContextFillEllipseInRect(v21, v37);
    v23 = UIGraphicsGetCurrentContext();
    v24 = CGBitmapContextCreateImage(v23);
    UIGraphicsEndImageContext();
    v33.width = width;
    v33.height = height;
    UIGraphicsBeginImageContextWithOptions(v33, 0, 0.0);
    v25 = UIGraphicsGetCurrentContext();
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v38.size.width = width;
    v38.size.height = height;
    CGContextClipToMask(v25, v38, v24);
    CGContextTranslateCTM(v25, width * 0.5, height * 0.5);
    CGContextRotateCTM(v25, -2.35619449);
    CGContextTranslateCTM(v25, width * -0.5, height * -0.5);
    v9 = objc_retainAutorelease(v17);
    v26 = (CGImage *)objc_msgSend(v9, "CGImage");
    v39.origin.x = 0.0;
    v39.origin.y = 0.0;
    v39.size.width = width;
    v39.size.height = height;
    CGContextDrawImage(v25, v39, v26);
    UIGraphicsGetImageFromCurrentImageContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    CGImageRelease(v24);
  }

  return v16;
}

- (id)swatchPrimaryColor
{
  objc_super v4;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)NTKPhotosColorPalette;
  -[NTKFaceColorPalette swatchPrimaryColor](&v4, sel_swatchPrimaryColor);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)colorRampsIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NTKPhotosColorPalette colorRampsIndexByColorName](self, "colorRampsIndexByColorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NTKPhotosColorPalette colorRampsIndexByColorName](self, "colorRampsIndexByColorName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorOption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)colorRampsIndexByColorName
{
  id v2;
  _QWORD block[5];
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKPhotosColorPalette_colorRampsIndexByColorName__block_invoke;
  block[3] = &unk_1E6BCF200;
  block[4] = v5;
  if (colorRampsIndexByColorName_once != -1)
    dispatch_once(&colorRampsIndexByColorName_once, block);
  v2 = (id)colorRampsIndexByColorName___d;
  _Block_object_dispose(v5, 8);
  return v2;
}

void __51__NTKPhotosColorPalette_colorRampsIndexByColorName__block_invoke(uint64_t a1)
{
  uint64_t v2;
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
  void *v24;
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
  void *v35;
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
  void *v54;
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
  void *v73;
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
  void *v352;
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
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)colorRampsIndexByColorName___d;
  colorRampsIndexByColorName___d = v2;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v4, "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v8, "numberWithInteger:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2019.lemonCream"), CFSTR("seasons.winter2019.beryl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v12, "numberWithInteger:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.winter2019.beryl"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v16, "numberWithInteger:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2019.lemonCream"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v20, "numberWithInteger:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v24, "numberWithInteger:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v28, "numberWithInteger:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2015.orange"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v32, "numberWithInteger:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v35);

  v36 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v36, "numberWithInteger:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v40, "numberWithInteger:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, v43);

  v44 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v44, "numberWithInteger:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2015.orange"), CFSTR("seasons.summer2020.coastalGray"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, v47);

  v48 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v48, "numberWithInteger:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, v51);

  v52 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v52, "numberWithInteger:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, v55);

  v56 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v56, "numberWithInteger:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v57, v59);

  v60 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v60, "numberWithInteger:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2020.pinkCitrus"), CFSTR("seasons.fall2020.kumquat"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, v63);

  v64 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v64, "numberWithInteger:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.spring2015.pink"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, v67);

  v68 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v68, "numberWithInteger:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, v71);

  v72 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v72, "numberWithInteger:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.summer2021.olive"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, v75);

  v76 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v76, "numberWithInteger:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, v79);

  v80 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v80, "numberWithInteger:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.summer2021.olive"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", v81, v83);

  v84 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v84, "numberWithInteger:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v85, CFSTR("seasons.spring2015.gold"));

  v86 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v86, "numberWithInteger:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v87, CFSTR("seasons.spring2015.goldRose"));

  v88 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v88, "numberWithInteger:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v89, CFSTR("seasons.spring2015.goldYellow"));

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v90 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v90, "numberWithInteger:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v91, CFSTR("seasons.fall2020.pinkCitrus"));

  v92 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v92, "numberWithInteger:");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v93, CFSTR("seasons.fall2020.deepNavy"));

  v94 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v94, "numberWithInteger:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v95, CFSTR("seasons.fall2020.cyprusGreen"));

  v96 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v96, "numberWithInteger:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v97, CFSTR("seasons.fall2020.kumquat"));

  v98 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v98, "numberWithInteger:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v99, CFSTR("seasons.fall2020.northernBlue"));

  v100 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v100, "numberWithInteger:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v101, CFSTR("seasons.fall2020.plum"));

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v102 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v102, "numberWithInteger:");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v103, CFSTR("seasons.fall2020.cream"));

  v104 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v104, "numberWithInteger:");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v105, CFSTR("seasons.spring2021.mallardGreen"));

  v106 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v106, "numberWithInteger:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v107, CFSTR("seasons.summer2021.electricOrange"));

  v108 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v108, "numberWithInteger:");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v109, CFSTR("seasons.summer2021.cloudBlue"));

  v110 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v110, "numberWithInteger:");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v111, CFSTR("seasons.spring2021.pistachio"));

  v112 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v112, "numberWithInteger:");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v113, CFSTR("seasons.spring2021.sunflower"));

  v114 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v114, "numberWithInteger:");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v115, CFSTR("seasons.spring2021.seaSalt"));

  v116 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v116, "numberWithInteger:");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v117, CFSTR("seasons.spring2021.abyss"));

  v118 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v118, "numberWithInteger:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v119);

  v120 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v120, "numberWithInteger:");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v121, CFSTR("seasons.fall2015.red"));

  v122 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v122, "numberWithInteger:");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v123, CFSTR("seasons.fall2015.orange"));

  v124 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v124, "numberWithInteger:");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v125, CFSTR("seasons.fall2019.clementine"));

  v126 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v126, "numberWithInteger:");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v127);

  v128 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v128, "numberWithInteger:");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v129, CFSTR("seasons.spring2018.peach"));

  v130 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v130, "numberWithInteger:");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v131, CFSTR("seasons.spring2019.papaya"));

  v132 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v132, "numberWithInteger:");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v133, CFSTR("seasons.spring2015.lightOrange"));

  v134 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v134, "numberWithInteger:");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v135, CFSTR("seasons.winter2018.mellowYellow"));

  v136 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v136, "numberWithInteger:");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v137, CFSTR("seasons.fall2019.lemonCream"));

  v138 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v138, "numberWithInteger:");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v139, CFSTR("seasons.spring2016.yellow"));

  v140 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v140, "numberWithInteger:");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v141, CFSTR("seasons.summer2017.pollen"));

  v142 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v142, "numberWithInteger:");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v143);

  v144 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v144, "numberWithInteger:");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v145, CFSTR("seasons.spring2018.flashLight"));

  v146 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v146, "numberWithInteger:");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v147, CFSTR("seasons.fall2017.flash"));

  v148 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v148, "numberWithInteger:");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v149, CFSTR("seasons.spring2015.green"));

  v150 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v150, "numberWithInteger:");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v151, CFSTR("seasons.spring2019.spearmint"));

  v152 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v152, "numberWithInteger:");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v153, CFSTR("seasons.spring2016.mint"));

  v154 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v154, "numberWithInteger:");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v155, CFSTR("seasons.winter2019.beryl"));

  v156 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v156, "numberWithInteger:");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v157, CFSTR("seasons.summer2020.seaFoam"));

  v158 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v158, "numberWithInteger:");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v159, CFSTR("seasons.fall2015.turquoise"));

  v160 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v160, "numberWithInteger:");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v161, CFSTR("seasons.fall2015.lightBlue"));

  v162 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v162, "numberWithInteger:");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v163, CFSTR("seasons.spring2020.surfBlue"));

  v164 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v164, "numberWithInteger:");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v165, CFSTR("seasons.spring2015.blue"));

  v166 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v166, "numberWithInteger:");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v167, CFSTR("seasons.spring2016.royalBlue"));

  v168 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v168, "numberWithInteger:");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v169, CFSTR("seasons.spring2019.cerulean"));

  v170 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v170, "numberWithInteger:");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v171, CFSTR("seasons.spring2019.lilac"));

  v172 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v172, "numberWithInteger:");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v173);

  v174 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v174, "numberWithInteger:");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v175, CFSTR("seasons.spring2017.azure"));

  v176 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v176, "numberWithInteger:");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v177, CFSTR("seasons.fall2018.stormGray"));

  v178 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v178, "numberWithInteger:");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v179, CFSTR("seasons.spring2020.cactus"));

  v180 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v180, "numberWithInteger:");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v181, CFSTR("seasons.winter2018.pacificGreen"));

  v182 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v182, "numberWithInteger:");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v183, CFSTR("seasons.fall2017.blueCobalt"));

  v184 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v184, "numberWithInteger:");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v185, CFSTR("seasons.fall2019.alaskanBlue"));

  v186 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v186, "numberWithInteger:");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v187, CFSTR("seasons.winter2017.darkTeal"));

  v188 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v188, "numberWithInteger:");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v189, CFSTR("seasons.fall2018.blueHorizon"));

  v190 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v190, "numberWithInteger:");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v191, CFSTR("seasons.summer2020.linenBlue"));

  v192 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v192, "numberWithInteger:");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v193, CFSTR("seasons.spring2018.denimBlue"));

  v194 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v194, "numberWithInteger:");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v195, CFSTR("seasons.fall2015.midnightBlue"));

  v196 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v196, "numberWithInteger:");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v197, CFSTR("seasons.fall2016.oceanBlue"));

  v198 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v198, "numberWithInteger:");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v199, CFSTR("seasons.spring2019.delftBlue"));

  v200 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v200, "numberWithInteger:");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v201, CFSTR("seasons.fall2018.indigo"));

  v202 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v202, "numberWithInteger:");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v203, CFSTR("seasons.spring2015.purple"));

  v204 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v204, "numberWithInteger:");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v205, CFSTR("seasons.fall2017.violet"));

  v206 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v206, "numberWithInteger:");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v207, CFSTR("seasons.fall2018.lavenderGray"));

  v208 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v208, "numberWithInteger:");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v209, CFSTR("seasons.fall2015.lavender"));

  v210 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v210, "numberWithInteger:");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v211, CFSTR("seasons.fall2017.pinkSand"));

  v212 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v212, "numberWithInteger:");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v213, CFSTR("seasons.spring2016.lightPink"));

  v214 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v214, "numberWithInteger:");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v215, CFSTR("seasons.fall2015.vintageRose"));

  v216 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v216, "numberWithInteger:");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v217, CFSTR("seasons.spring2020.grapefruit"));

  v218 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v218, "numberWithInteger:");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v219, CFSTR("seasons.spring2015.pink"));

  v220 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v220, "numberWithInteger:");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v221, CFSTR("seasons.fall2017.electricPink"));

  v222 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v222, "numberWithInteger:");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v223, CFSTR("seasons.spring2020.neonPink"));

  v224 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v224, "numberWithInteger:");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v225, CFSTR("seasons.summer2019.dragonFruit"));

  v226 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v226, "numberWithInteger:");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v227);

  v228 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v228, "numberWithInteger:");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v229, CFSTR("seasons.winter2019.pomegranate"));

  v230 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v230, "numberWithInteger:");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v231, CFSTR("seasons.fall2017.roseRed"));

  v232 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v232, "numberWithInteger:");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v233, CFSTR("seasons.spring2017.camellia"));

  v234 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v234, "numberWithInteger:");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v235, CFSTR("seasons.summer2017.flamingo"));

  v236 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v236, "numberWithInteger:");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v237, CFSTR("seasons.fall2019.camel"));

  v238 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v238, "numberWithInteger:");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v239, CFSTR("seasons.fall2015.walnut"));

  v240 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v240, "numberWithInteger:");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v241, CFSTR("seasons.fall2015.stone"));

  v242 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v242, "numberWithInteger:");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v243, CFSTR("seasons.fall2015.antiqueWhite"));

  v244 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v244, "numberWithInteger:");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v245, CFSTR("seasons.fall2017.softWhite"));

  v246 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v246, "numberWithInteger:");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v247, CFSTR("seasons.spring2017.pebble"));

  v248 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v248, "numberWithInteger:");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v249, CFSTR("seasons.fall2016.cocoa"));

  v250 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v250, "numberWithInteger:");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v251, CFSTR("seasons.summer2020.coastalGray"));

  v252 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v252, "numberWithInteger:");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v253, CFSTR("seasons.fall2017.darkOlive"));

  v254 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v254, "numberWithInteger:");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v255, CFSTR("seasons.winter2019.khaki"));

  v256 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v256, "numberWithInteger:");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v257, CFSTR("seasons.fall2019.pineGreen"));

  v258 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v258, "numberWithInteger:");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v259, CFSTR("seasons.summer2021.olive"));

  v260 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v260, "numberWithInteger:");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v262 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.spring2015.lightOrange"), CFSTR("seasons.fall2021.white2t"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "setObject:forKeyedSubscript:", v261, v263);

  v264 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v264, "numberWithInteger:");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v266 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2017.electricPink"), CFSTR("seasons.fall2015.walnut"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "setObject:forKeyedSubscript:", v265, v267);

  v268 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v268, "numberWithInteger:");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v270 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2020.kumquat"), CFSTR("seasons.fall2021.green6"));
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "setObject:forKeyedSubscript:", v269, v271);

  v272 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v272, "numberWithInteger:");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v274 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2021.blue11"), CFSTR("seasons.fall2021.green1"));
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "setObject:forKeyedSubscript:", v273, v275);

  v276 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v276, "numberWithInteger:");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v278 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2021.red2sg"), CFSTR("seasons.fall2021.purple1"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "setObject:forKeyedSubscript:", v277, v279);

  v280 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v280, "numberWithInteger:");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v281, CFSTR("seasons.fall2021.purple2"));

  v282 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v282, "numberWithInteger:");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v283, CFSTR("seasons.fall2021.green3"));

  v284 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v284, "numberWithInteger:");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v285);

  v286 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v286, "numberWithInteger:");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v287, CFSTR("seasons.fall2021.red2sg"));

  v288 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v288, "numberWithInteger:");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v289, CFSTR("seasons.fall2021.blue11"));

  v290 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v290, "numberWithInteger:");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v291, CFSTR("seasons.fall2021.purple1"));

  v292 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v292, "numberWithInteger:");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v293, CFSTR("seasons.spring2022.blue2"));

  v294 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v294, "numberWithInteger:");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v295, CFSTR("seasons.spring2022.green3"));

  v296 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v296, "numberWithInteger:");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v297, CFSTR("seasons.spring2022.green5"));

  v298 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v298, "numberWithInteger:");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v299, CFSTR("seasons.spring2022.orange2"));

  v300 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v300, "numberWithInteger:");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v301, CFSTR("seasons.spring2022.pink6t"));

  v302 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v302, "numberWithInteger:");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v304 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2020.deepNavy"), CFSTR("seasons.spring2016.apricot"));
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v304, "setObject:forKeyedSubscript:", v303, v305);

  v306 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v306, "numberWithInteger:");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v308 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.spring2022.lavender"), CFSTR("seasons.spring2022.lilac"));
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "setObject:forKeyedSubscript:", v307, v309);

  v310 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v310, "numberWithInteger:");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  v312 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.spring2022.oatmilk"), CFSTR("seasons.summer2019.canaryYellow"));
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "setObject:forKeyedSubscript:", v311, v313);

  v314 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v314, "numberWithInteger:");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v316 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.summer2020.linenBlue"), CFSTR("seasons.spring2022.green5"));
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v316, "setObject:forKeyedSubscript:", v315, v317);

  v318 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v318, "numberWithInteger:");
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v320 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.spring2022.orange2"), CFSTR("seasons.winter2018.hibiscus"));
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v320, "setObject:forKeyedSubscript:", v319, v321);

  v322 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v322, "numberWithInteger:");
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v323, CFSTR("seasons.fall2022.red"));

  v324 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v324, "numberWithInteger:");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v325, CFSTR("seasons.fall2022.succulent"));

  v326 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v326, "numberWithInteger:");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v327, CFSTR("seasons.fall2022.elderberry"));

  v328 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v328, "numberWithInteger:");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v329, CFSTR("seasons.fall2022.slateBlue"));

  v330 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v330, "numberWithInteger:");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v331, CFSTR("seasons.fall2022.stormBlue"));

  v332 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v332, "numberWithInteger:");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v333, CFSTR("seasons.fall2022.sunglow"));

  v334 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v334, "numberWithInteger:");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v336 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2022.red"), CFSTR("seasons.fall2020.kumquat"));
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v336, "setObject:forKeyedSubscript:", v335, v337);

  v338 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v338, "numberWithInteger:");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v340 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2017.pinkSand"), CFSTR("seasons.spring2022.orange2"));
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v340, "setObject:forKeyedSubscript:", v339, v341);

  v342 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v342, "numberWithInteger:");
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v344 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2021.stardust"), CFSTR("seasons.fall2022.sunglow"));
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "setObject:forKeyedSubscript:", v343, v345);

  v346 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v346, "numberWithInteger:");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2021.stardust"), CFSTR("seasons.summer2017.mistBlue"));
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "setObject:forKeyedSubscript:", v347, v349);

  v350 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v350, "numberWithInteger:");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v352 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2021.stardust"), CFSTR("seasons.fall2017.darkOlive"));
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v352, "setObject:forKeyedSubscript:", v351, v353);

  v354 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v354, "numberWithInteger:");
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v356 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2022.stormBlue"), CFSTR("seasons.spring2015.white"));
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v356, "setObject:forKeyedSubscript:", v355, v357);

  v358 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v358, "numberWithInteger:");
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v359, CFSTR("seasons.spring2023.sky"));

  v360 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v360, "numberWithInteger:");
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v361, CFSTR("seasons.spring2023.purpleFog"));

  v362 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v362, "numberWithInteger:");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v363, CFSTR("seasons.spring2023.sproutGreen"));

  v364 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v364, "numberWithInteger:");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v365, CFSTR("seasons.fall2023.lightPink"));

  v366 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v366, "numberWithInteger:");
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v367, CFSTR("seasons.fall2023.red"));

  v368 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v368, "numberWithInteger:");
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v369, CFSTR("seasons.fall2023.clay"));

  v370 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v370, "numberWithInteger:");
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v371, CFSTR("seasons.fall2023.mulberry"));

  v372 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v372, "numberWithInteger:");
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v373);

  v374 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v374, "numberWithInteger:");
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v375);

  v376 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v376, "numberWithInteger:");
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v377, CFSTR("seasons.fall2023.cypress"));

  v378 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v378, "numberWithInteger:");
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v379, CFSTR("seasons.fall2023.guava"));

  v380 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v380, "numberWithInteger:");
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v381, CFSTR("seasons.fall2023.taupe"));

  v382 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v382, "numberWithInteger:");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v383, CFSTR("seasons.fall2019.alaskanBlue"));

  v384 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v384, "numberWithInteger:");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v386 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2023.lightPink"), CFSTR("seasons.fall2023.guava"));
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v386, "setObject:forKeyedSubscript:", v385, v387);

  v388 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v388, "numberWithInteger:");
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v390 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2023.cypress"), CFSTR("custom.fall2023.mint"));
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v390, "setObject:forKeyedSubscript:", v389, v391);

  v392 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v392, "numberWithInteger:");
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v394 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2023.winterBlue"), CFSTR("seasons.fall2023.mulberry"));
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v394, "setObject:forKeyedSubscript:", v393, v395);

  v396 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v396, "numberWithInteger:");
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v398 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2021.stardust"), CFSTR("seasons.fall2023.orangeSorbet"));
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v398, "setObject:forKeyedSubscript:", v397, v399);

  v400 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v400, "numberWithInteger:");
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v402 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2021.stardust"), CFSTR("seasons.fall2023.winterBlue"));
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v402, "setObject:forKeyedSubscript:", v401, v403);

  v404 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v404, "numberWithInteger:");
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  v406 = (void *)colorRampsIndexByColorName___d;
  +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", CFSTR("seasons.fall2023.orangeSorbet"), CFSTR("seasons.fall2023.winterBlue"));
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v406, "setObject:forKeyedSubscript:", v405, v407);

  v408 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v408, "numberWithInteger:");
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v409, CFSTR("seasons.spring2024.lightBlue"));

  v410 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v410, "numberWithInteger:");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v411, CFSTR("seasons.spring2024.sunshine"));

  v412 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v412, "numberWithInteger:");
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v413, CFSTR("seasons.spring2024.softMint"));

  v414 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v414, "numberWithInteger:");
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v415, CFSTR("seasons.spring2024.oceanBlue"));

  v416 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v416, "numberWithInteger:");
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v417, CFSTR("seasons.spring2024.pink"));

  v418 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v418, "numberWithInteger:");
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v419, CFSTR("seasons.spring2024.raspberry"));

}

- (BOOL)isOriginalColor
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPhotosColorEditOption originalColorName](NTKPhotosColorEditOption, "originalColorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)_monocolorRampColor
{
  void *v3;
  void *v4;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKPhotosColorPalette primaryColor](self, "primaryColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (void)colorRampForMonochromeColorMatrix:(id)a3 fromPalette:(id)a4 toPalette:(id)a5 transitionFraction:(double)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, void *, double);
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22 = v11;
  v14 = (void (**)(id, void *, void *, double))a7;
  v15 = NTKIsDefaultMonochromeColorMatrix(v22);
  if (objc_msgSend(v12, "isOriginalColor"))
  {
    NTKInterpolateColorMatrixToIdentity(v22, 1.0 - a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v13;
    if (v15)
    {
LABEL_3:
      objc_msgSend(v17, "monocolorRampImage");
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v19 = (void *)v18;
      goto LABEL_12;
    }
LABEL_6:
    objc_msgSend(v17, "colorRampImage");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isOriginalColor"))
  {
    NTKInterpolateColorMatrixToIdentity(v22, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    a6 = 1.0 - a6;
    v17 = v12;
    if (v15)
      goto LABEL_3;
    goto LABEL_6;
  }
  if (v15)
  {
    objc_msgSend(v12, "monocolorRampImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "monocolorRampImage");
  }
  else
  {
    objc_msgSend(v12, "colorRampImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorRampImage");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenImages(v20, v21, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  a6 = 1.0;
  v16 = v22;
LABEL_12:
  v14[2](v14, v19, v16, a6);

}

+ (void)applyColorRamp:(id)a3 colorRampAmount:(double)a4 monochromeColorMatrix:(id)a5 toView:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0CD2780];
    v13 = *MEMORY[0x1E0CD2BF0];
    v14 = a6;
    objc_msgSend(v12, "filterWithType:", v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v11, CFSTR("inputColorMatrix"));
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E20]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("inputAmount"));

    objc_msgSend(v16, "setValue:forKey:", objc_msgSend(objc_retainAutorelease(v10), "CGImage"), CFSTR("inputColorMap"));
    v20[0] = v15;
    v20[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setFilters:", v18);
  }
  else
  {
    v15 = a6;
    objc_msgSend(a1, "removeColorRampFromView:", v15);
  }

}

+ (void)removeColorRampFromView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

}

@end
