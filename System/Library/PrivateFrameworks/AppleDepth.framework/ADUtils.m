@implementation ADUtils

+ (BOOL)updatePixelBufferAllocationWithNewSize:(CGSize)a3 pixelFormat:(unsigned int)a4 pixelBuffer:(__CVBuffer *)a5
{
  double height;
  double width;
  const __CFAllocator *v10;
  const __CFDictionary *BufferAttributes;
  CVReturn v12;
  __CVBuffer *v13;
  CVPixelBufferRef pixelBufferOut;

  height = a3.height;
  width = a3.width;
  if (*a5)
  {
    if (a3.width == (double)CVPixelBufferGetWidth(*a5)
      && height == (double)CVPixelBufferGetHeight(*a5)
      && CVPixelBufferGetPixelFormatType(*a5) == a4)
    {
      return 0;
    }
    if (*a5)
      CVPixelBufferRelease(*a5);
  }
  pixelBufferOut = 0;
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  v12 = CVPixelBufferCreate(v10, (unint64_t)width, (unint64_t)height, a4, BufferAttributes, &pixelBufferOut);
  v13 = pixelBufferOut;
  if (v12)
    v13 = 0;
  *a5 = v13;
  return 1;
}

+ (void)updatePixelBufferIOSurfaceLabel:(id)a3 pixelBuffer:(__CVBuffer *)a4
{
  __IOSurface *IOSurface;
  id value;

  value = a3;
  IOSurface = CVPixelBufferGetIOSurface(a4);
  IOSurfaceSetValue(IOSurface, (CFStringRef)*MEMORY[0x24BDD8EE0], value);

}

+ (id)getStandardNameForBufferOfType:(id)a3 moduleName:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  unint64_t v8;
  void *v9;
  int v11;

  v5 = a3;
  v6 = a4;
  v8 = 0x24BDD1000uLL;
  if ((v7 & 1) == 0)
  {
    v8 = 0x24BDD1000uLL;
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", getprogname());
      +[ADUtils getStandardNameForBufferOfType:moduleName:]::progname = objc_claimAutoreleasedReturnValue();
      v8 = 0x24BDD1000;
    }
  }
  objc_msgSend(*(id *)(v8 + 1992), "stringWithFormat:", CFSTR("%@/AppleDepth ; %@/%@ ; 1/1"),
    +[ADUtils getStandardNameForBufferOfType:moduleName:]::progname,
    v5,
    v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)scaleConvertRotateImage:(__CVBuffer *)a3 rotateBy:(unsigned __int8)a4 cropBy:(CGRect)a5 scaleInto:(__CVBuffer *)a6 intermediateScalingBuffer:(__CVBuffer *)a7 intermediateRotatingBuffer:(__CVBuffer *)a8
{
  return +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, a4, a6, a7, a8, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (int64_t)scaleConvertRotateImage:(__CVBuffer *)a3 rotateBy:(unsigned __int8)a4 cropBy:(CGRect)a5 scaleInto:(__CVBuffer *)a6 intermediateScalingBuffer:(__CVBuffer *)a7 intermediateRotatingBuffer:(__CVBuffer *)a8 useVT:(BOOL)a9
{
  if (PixelBufferUtils::scaleConvertRotatePixelBuffer(a3, (__CVBuffer *)a4, a6, a5, a7, a8, (__CVBuffer **)a9))return -22966;
  else
    return 0;
}

+ (int64_t)convertToLevelsConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 confidenceLevelRanges:(id)a5
{
  id v7;
  unint64_t PixelFormatType;
  unint64_t v9;
  unint64_t v10;
  int32x2_t v11;
  int32x2_t v12;
  uint64_t v13;
  int64_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  size_t v18;
  float16x4_t *v19;
  int8x8_t *v20;
  unint64_t v27;
  unint64_t v28;
  float16x4_t v29;
  float16x4_t v30;
  uint64_t v31;
  uint64_t v34;
  float v37;
  size_t v38;
  size_t v39;
  size_t v40;
  size_t v41;
  float *v42;
  float *v43;
  unint64_t v44;
  unint64_t v45;
  float32x4_t v46;
  float32x4_t v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  float v51;
  float v52;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v56;
  float16x4_t *BaseAddress;
  float *v58;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  float16x4_t v66;
  float16x4_t v67;
  uint64_t v68;
  uint64_t v71;
  float v74;
  float v75;
  size_t v76;
  size_t v77;
  size_t v78;
  size_t v79;
  float *v80;
  int8x16_t *v81;
  float v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  float32x4_t v86;
  float32x4_t v87;
  uint64_t v88;
  uint64_t v89;
  float v90;
  float v91;
  size_t v92;
  size_t v93;
  size_t v94;
  size_t v95;
  float16x4_t *v96;
  _BYTE *v97;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  float16x4_t v105;
  float16x4_t v106;
  uint64_t v107;
  uint64_t v110;
  char v113;
  size_t v114;
  size_t v115;
  size_t v116;
  size_t v117;
  float *v118;
  int8x16_t *v119;
  uint64_t v120;
  unint64_t v121;
  float32x4_t v122;
  float32x4_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  float v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  float v133;
  float v134;
  float v135;
  uint64_t v136;
  uint64_t v137;
  float v138;
  float v139;
  uint64_t v140;
  uint64_t v143;
  float v146;
  unint64_t v147;
  float32x4_t *v148;
  int8x16_t *v149;
  int8x16_t v150;
  float *v152;
  float *v153;
  int v154;
  int8x16_t *v155;
  float32x4_t *v156;
  unint64_t v157;
  int8x16_t v158;
  unsigned int v159;
  float v160;
  float v161;
  float v162;
  float v163;
  BOOL v164;
  unint64_t v165;
  float32x4_t *v166;
  int8x16_t *v167;
  int8x16_t v168;
  int8x16_t v169;
  char *v170;
  int8x16_t *v171;
  float32x4_t *v172;
  unint64_t v173;
  float32x4_t v174;
  float32x4_t v175;
  float32x4_t v176;
  float32x4_t v177;
  int8x16_t v178;
  int8x16_t v179;
  int8x16_t v180;
  float *v181;
  unsigned int v182;
  float v183;
  float v184;
  unint64_t v185;
  float16x4_t *v187;
  int8x8_t *v188;
  float32x4_t v190;
  float32x4_t v191;
  char *v192;
  char *v193;
  int v194;
  int8x8_t *v195;
  float16x4_t *v196;
  unint64_t v197;
  float32x4_t v198;
  float32x4_t v199;
  unsigned int v200;
  __int16 v201;
  uint64_t v204;
  uint64_t v207;
  float v210;
  float v211;
  int v212;
  uint8_t *v213;
  uint8_t *v214;
  void **v215;
  unint64_t v216;
  float32x4_t *v217;
  int8x16_t *v218;
  int8x16_t v219;
  float *v221;
  float *v222;
  int v223;
  int8x16_t *v224;
  float32x4_t *v225;
  unint64_t v226;
  int8x16_t v227;
  unsigned int v228;
  float v229;
  float v230;
  float v231;
  float v232;
  unint64_t v233;
  float32x4_t *v234;
  int8x16_t *v235;
  int8x16_t v236;
  int8x16_t v237;
  char *v238;
  int8x16_t *v239;
  float32x4_t *v240;
  unint64_t v241;
  float32x4_t v242;
  float32x4_t v243;
  float32x4_t v244;
  float32x4_t v245;
  int8x16_t v246;
  int8x16_t v247;
  int8x16_t v248;
  float *v249;
  unsigned int v250;
  float v251;
  float v252;
  unint64_t v253;
  float32x4_t v254;
  float32x4_t v255;
  float16x4_t *v256;
  int8x16_t v257;
  int8x16_t *v258;
  float *v262;
  int8x16_t *v263;
  float16x4_t *v264;
  unint64_t v265;
  float32x4_t v266;
  float32x4_t v267;
  char *v268;
  unsigned int v269;
  __int16 v270;
  float v273;
  float v274;
  unint64_t v275;
  float16x4_t *v277;
  int8x8_t *v278;
  float32x4_t v280;
  float32x4_t v281;
  char *v282;
  char *v283;
  int v284;
  int8x8_t *v285;
  float16x4_t *v286;
  unint64_t v287;
  float32x4_t v288;
  float32x4_t v289;
  unsigned int v290;
  __int16 v291;
  uint64_t v294;
  uint64_t v295;
  float v296;
  float v297;
  float v298;
  uint64_t v299;
  uint64_t v300;
  float v301;
  float v302;
  uint64_t v303;
  uint64_t v306;
  float v309;
  uint64_t v310;
  uint64_t v311;
  float v312;
  char v313;
  uint64_t v314;
  uint64_t v317;
  char v320;
  unint64_t v321;
  float32x4_t v322;
  float32x4_t v323;
  float16x4_t *v324;
  int8x16_t v325;
  int8x16_t *v326;
  float *v330;
  int8x16_t *v331;
  float16x4_t *v332;
  unint64_t v333;
  float32x4_t v334;
  float32x4_t v335;
  char *v336;
  unsigned int v337;
  __int16 v338;
  float v341;
  float v342;
  unint64_t v343;
  float32x4_t *v344;
  int8x16_t *v345;
  int8x16_t v346;
  int8x16_t *v347;
  float *v348;
  char *v349;
  float *v350;
  unint64_t v352;
  int v353;
  int8x16_t *v354;
  float32x4_t *v355;
  unint64_t v356;
  float32x4_t v357;
  float32x4_t v358;
  float32x4_t v359;
  float32x4_t v360;
  float32x4_t v361;
  float32x4_t v362;
  float32x4_t v363;
  float32x4_t v364;
  int8x16_t v365;
  int8x16_t v366;
  int8x16_t v367;
  unint64_t v368;
  int8x8_t *v369;
  float32x4_t *v370;
  float32x4_t v371;
  float32x4_t v372;
  int8x8_t v373;
  unsigned int v374;
  float v375;
  float v376;
  char v377;
  uint64_t v378;
  uint64_t v379;
  float v380;
  float v381;
  float v382;
  uint64_t v383;
  uint64_t v384;
  float v385;
  float v386;
  unint64_t v387;
  float16x4_t *v388;
  char *v389;
  float32x4_t v390;
  float32x4_t v391;
  char *v394;
  char *v395;
  char *v397;
  float16x4_t *v398;
  unint64_t v399;
  float32x4_t v400;
  int8x8_t v401;
  float32x4_t v402;
  int8x8_t v403;
  int16x8_t v404;
  int16x8_t v405;
  int v406;
  unsigned int v407;
  __int16 v408;
  char v411;
  uint64_t v412;
  uint64_t v415;
  float v418;
  float v419;
  uint64_t v420;
  uint64_t v423;
  float v426;
  unint64_t v427;
  float32x4_t *v428;
  int8x16_t *v429;
  int8x16_t v430;
  int8x16_t *v431;
  float *v432;
  char *v433;
  float *v434;
  unint64_t v436;
  int v437;
  int8x16_t *v438;
  float32x4_t *v439;
  unint64_t v440;
  float32x4_t v441;
  float32x4_t v442;
  float32x4_t v443;
  float32x4_t v444;
  float32x4_t v445;
  float32x4_t v446;
  float32x4_t v447;
  float32x4_t v448;
  int8x16_t v449;
  int8x16_t v450;
  int8x16_t v451;
  unint64_t v452;
  int8x8_t *v453;
  float32x4_t *v454;
  float32x4_t v455;
  float32x4_t v456;
  int8x8_t v457;
  unsigned int v458;
  float v459;
  float v460;
  char v461;
  unint64_t v462;
  float16x4_t *v463;
  char *v464;
  float32x4_t v465;
  float32x4_t v466;
  char *v469;
  char *v470;
  char *v472;
  float16x4_t *v473;
  unint64_t v474;
  float32x4_t v475;
  int8x8_t v476;
  float32x4_t v477;
  int8x8_t v478;
  int16x8_t v479;
  int16x8_t v480;
  int v481;
  unsigned int v482;
  __int16 v483;
  char v486;
  uint64_t v487;
  uint64_t v490;
  float v493;
  float v494;
  uint64_t v495;
  uint64_t v496;
  float v497;
  char v498;
  uint64_t v499;
  uint64_t v502;
  char v505;
  uint64_t v506;
  uint64_t v507;
  float v508;
  char v509;
  uint64_t v510;
  uint64_t v513;
  char v516;
  int32x2_t v518;
  int32x2_t v519;
  void *__p[2];
  char v521;
  uint8_t buf[8];
  char v523;
  uint8_t v524[4];
  uint8_t *v525;
  __int16 v526;
  void **v527;
  uint64_t v528;

  v528 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v9 = CVPixelBufferGetPixelFormatType(a4);
  if (v7)
  {
    v10 = v9;
    objc_msgSend(v7, "highLevel");
    v519 = v11;
    objc_msgSend(v7, "lowLevel");
    v518 = v12;
    v13 = objc_msgSend(v7, "confidenceUnits");
    if ((int)PixelFormatType > 1717856626)
    {
      if ((_DWORD)PixelFormatType != 1717856627)
      {
        if ((_DWORD)PixelFormatType != 1751410032 && (_DWORD)PixelFormatType != 1751411059)
          goto LABEL_94;
LABEL_13:
        if ((int)v10 > 1717856626)
        {
          if ((_DWORD)v10 == 1717856627)
          {
LABEL_61:
            if (a3 != a4)
              CVPixelBufferLockBaseAddress(a3, 1uLL);
            CVPixelBufferLockBaseAddress(a4, 0);
            Width = CVPixelBufferGetWidth(a3);
            Height = CVPixelBufferGetHeight(a3);
            BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
            v56 = CVPixelBufferGetBytesPerRow(a4);
            BaseAddress = (float16x4_t *)CVPixelBufferGetBaseAddress(a3);
            v58 = (float *)CVPixelBufferGetBaseAddress(a4);
            if (Height && Width)
            {
              _S0 = v518.i32[0];
              __asm { FCVT            H1, S0 }
              _S0 = v519.i32[0];
              __asm { FCVT            H5, S0 }
              v63 = Width & 0xFFFFFFFFFFFFFFF8;
              v64 = 4 * (Width & 0xFFFFFFFFFFFFFFF8);
              v65 = 2 * (Width & 0xFFFFFFFFFFFFFFF8);
              v66 = (float16x4_t)vdup_lane_s16(_D1, 0);
              v67 = (float16x4_t)vdup_lane_s16(_D5, 0);
              if (v13)
              {
                if (Width > 7)
                {
                  if (!(_DWORD)Width || (v253 = (Width - 1) >> 32) != 0)
                  {
                    v412 = 0;
                    __asm
                    {
                      FCVT            S0, H5
                      FCVT            S1, H1
                    }
                    do
                    {
                      v415 = 0;
                      do
                      {
                        _H5 = BaseAddress->i16[v415];
                        __asm { FCVT            S5, H5 }
                        if (_S5 <= _S0)
                          v418 = 2.0;
                        else
                          v418 = 1.0;
                        if (_S5 <= _S1)
                          v419 = v418;
                        else
                          v419 = 0.0;
                        v58[v415++] = v419;
                      }
                      while (Width > v415);
                      ++v412;
                      v58 = (float *)((char *)v58 + v56);
                      BaseAddress = (float16x4_t *)((char *)BaseAddress + BytesPerRow);
                    }
                    while (Height > v412);
                  }
                  else
                  {
                    v254 = vcvtq_f32_f16(v66);
                    v255 = vcvtq_f32_f16(v67);
                    v256 = BaseAddress + 1;
                    v257.i64[0] = 0x4000000040000000;
                    v257.i64[1] = 0x4000000040000000;
                    v258 = (int8x16_t *)(v58 + 4);
                    __asm
                    {
                      FMOV            V4.4S, #1.0
                      FCVT            S5, H5
                      FCVT            S1, H1
                    }
                    do
                    {
                      v262 = (float *)((char *)v58 + v253 * v56 + v64);
                      v263 = v258;
                      v264 = v256;
                      v265 = Width & 0xFFFFFFFFFFFFFFF8;
                      do
                      {
                        v266 = vcvtq_f32_f16(v264[-1]);
                        v267 = vcvtq_f32_f16(*v264);
                        v263[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v266, v255), _Q4, v257), (int8x16_t)vcgtq_f32(v266, v254));
                        *v263 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v267, v255), _Q4, v257), (int8x16_t)vcgtq_f32(v267, v254));
                        v264 += 2;
                        v263 += 2;
                        v265 -= 8;
                      }
                      while (v265);
                      if (Width != v63)
                      {
                        v268 = (char *)BaseAddress + v253 * BytesPerRow + v65;
                        v269 = v63 + 1;
                        do
                        {
                          v270 = *(_WORD *)v268;
                          v268 += 2;
                          _H17 = v270;
                          __asm { FCVT            S17, H17 }
                          if (_S17 <= _S5)
                            v273 = 2.0;
                          else
                            v273 = 1.0;
                          if (_S17 <= _S1)
                            v274 = v273;
                          else
                            v274 = 0.0;
                          *v262++ = v274;
                          v164 = Width > v269++;
                        }
                        while (v164);
                      }
                      ++v253;
                      v256 = (float16x4_t *)((char *)v256 + BytesPerRow);
                      v258 = (int8x16_t *)((char *)v258 + v56);
                    }
                    while (Height > v253);
                  }
                }
                else
                {
                  v68 = 0;
                  __asm
                  {
                    FCVT            S0, H5
                    FCVT            S1, H1
                  }
                  do
                  {
                    v71 = 0;
                    do
                    {
                      _H5 = BaseAddress->i16[v71];
                      __asm { FCVT            S5, H5 }
                      if (_S5 <= _S0)
                        v74 = 2.0;
                      else
                        v74 = 1.0;
                      if (_S5 <= _S1)
                        v75 = v74;
                      else
                        v75 = 0.0;
                      v58[v71++] = v75;
                    }
                    while (v71 < Width);
                    ++v68;
                    v58 = (float *)((char *)v58 + v56);
                    BaseAddress = (float16x4_t *)((char *)BaseAddress + BytesPerRow);
                  }
                  while (Height > v68);
                }
              }
              else if (Width > 7)
              {
                if (!(_DWORD)Width || (v321 = (Width - 1) >> 32) != 0)
                {
                  v487 = 0;
                  __asm
                  {
                    FCVT            S0, H5
                    FCVT            S1, H1
                  }
                  do
                  {
                    v490 = 0;
                    do
                    {
                      _H5 = BaseAddress->i16[v490];
                      __asm { FCVT            S5, H5 }
                      if (_S5 >= _S0)
                        v493 = 2.0;
                      else
                        v493 = 1.0;
                      if (_S5 >= _S1)
                        v494 = v493;
                      else
                        v494 = 0.0;
                      v58[v490++] = v494;
                    }
                    while (Width > v490);
                    ++v487;
                    v58 = (float *)((char *)v58 + v56);
                    BaseAddress = (float16x4_t *)((char *)BaseAddress + BytesPerRow);
                  }
                  while (Height > v487);
                }
                else
                {
                  v322 = vcvtq_f32_f16(v66);
                  v323 = vcvtq_f32_f16(v67);
                  v324 = BaseAddress + 1;
                  v325.i64[0] = 0x4000000040000000;
                  v325.i64[1] = 0x4000000040000000;
                  v326 = (int8x16_t *)(v58 + 4);
                  __asm
                  {
                    FMOV            V4.4S, #1.0
                    FCVT            S5, H5
                    FCVT            S1, H1
                  }
                  do
                  {
                    v330 = (float *)((char *)v58 + v321 * v56 + v64);
                    v331 = v326;
                    v332 = v324;
                    v333 = Width & 0xFFFFFFFFFFFFFFF8;
                    do
                    {
                      v334 = vcvtq_f32_f16(v332[-1]);
                      v335 = vcvtq_f32_f16(*v332);
                      v331[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v323, v334), _Q4, v325), (int8x16_t)vcgtq_f32(v322, v334));
                      *v331 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v323, v335), _Q4, v325), (int8x16_t)vcgtq_f32(v322, v335));
                      v332 += 2;
                      v331 += 2;
                      v333 -= 8;
                    }
                    while (v333);
                    if (Width != v63)
                    {
                      v336 = (char *)BaseAddress + v321 * BytesPerRow + v65;
                      v337 = v63 + 1;
                      do
                      {
                        v338 = *(_WORD *)v336;
                        v336 += 2;
                        _H17 = v338;
                        __asm { FCVT            S17, H17 }
                        if (_S17 >= _S5)
                          v341 = 2.0;
                        else
                          v341 = 1.0;
                        if (_S17 >= _S1)
                          v342 = v341;
                        else
                          v342 = 0.0;
                        *v330++ = v342;
                        v164 = Width > v337++;
                      }
                      while (v164);
                    }
                    ++v321;
                    v324 = (float16x4_t *)((char *)v324 + BytesPerRow);
                    v326 = (int8x16_t *)((char *)v326 + v56);
                  }
                  while (Height > v321);
                }
              }
              else
              {
                v204 = 0;
                __asm
                {
                  FCVT            S0, H5
                  FCVT            S1, H1
                }
                do
                {
                  v207 = 0;
                  do
                  {
                    _H5 = BaseAddress->i16[v207];
                    __asm { FCVT            S5, H5 }
                    if (_S5 >= _S0)
                      v210 = 2.0;
                    else
                      v210 = 1.0;
                    if (_S5 >= _S1)
                      v211 = v210;
                    else
                      v211 = 0.0;
                    v58[v207++] = v211;
                  }
                  while (v207 < Width);
                  ++v204;
                  v58 = (float *)((char *)v58 + v56);
                  BaseAddress = (float16x4_t *)((char *)BaseAddress + BytesPerRow);
                }
                while (Height > v204);
              }
            }
            goto LABEL_540;
          }
          if ((_DWORD)v10 != 1751411059 && (_DWORD)v10 != 1751410032)
            goto LABEL_94;
          goto LABEL_26;
        }
        if ((_DWORD)v10 != 1278226488)
        {
          if ((_DWORD)v10 != 1278226536)
          {
            if ((_DWORD)v10 != 1717855600)
              goto LABEL_94;
            goto LABEL_61;
          }
LABEL_26:
          if (a3 != a4)
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          v15 = CVPixelBufferGetWidth(a3);
          v16 = CVPixelBufferGetHeight(a3);
          v17 = CVPixelBufferGetBytesPerRow(a3);
          v18 = CVPixelBufferGetBytesPerRow(a4);
          v19 = (float16x4_t *)CVPixelBufferGetBaseAddress(a3);
          v20 = (int8x8_t *)CVPixelBufferGetBaseAddress(a4);
          if (!v16 || !v15)
            goto LABEL_540;
          _S0 = v518.i32[0];
          __asm { FCVT            H2, S0 }
          _D0 = (int16x4_t)v519;
          __asm { FCVT            H0, S0 }
          v27 = v15 & 0xFFFFFFFFFFFFFFF8;
          v28 = 2 * (v15 & 0xFFFFFFFFFFFFFFF8);
          v29 = (float16x4_t)vdup_lane_s16(_D2, 0);
          v30 = (float16x4_t)vdup_lane_s16(_D0, 0);
          if (v13)
          {
            if (v15 <= 7)
            {
              v31 = 0;
              __asm
              {
                FCVT            S0, H0
                FCVT            S2, H2
              }
              do
              {
                v34 = 0;
                do
                {
                  _H3 = v19->i16[v34];
                  __asm { FCVT            S3, H3 }
                  if (_S3 <= _S2)
                  {
                    v30.i16[0] = word_20B6D3A80[_S3 > _S0];
                    v37 = *(float *)v30.i32;
                  }
                  else
                  {
                    v37 = 0.0;
                  }
                  v20->i16[v34++] = LOWORD(v37);
                }
                while (v34 < v15);
                ++v31;
                v20 = (int8x8_t *)((char *)v20 + v18);
                v19 = (float16x4_t *)((char *)v19 + v17);
              }
              while (v16 > v31);
              goto LABEL_540;
            }
            if (!(_DWORD)v15 || (v185 = (v15 - 1) >> 32) != 0)
            {
              v303 = 0;
              __asm
              {
                FCVT            S0, H0
                FCVT            S2, H2
              }
              do
              {
                v306 = 0;
                do
                {
                  _H3 = v19->i16[v306];
                  __asm { FCVT            S3, H3 }
                  if (_S3 <= _S2)
                  {
                    v30.i16[0] = word_20B6D3A80[_S3 > _S0];
                    v309 = *(float *)v30.i32;
                  }
                  else
                  {
                    v309 = 0.0;
                  }
                  v20->i16[v306++] = LOWORD(v309);
                }
                while (v15 > v306);
                ++v303;
                v20 = (int8x8_t *)((char *)v20 + v18);
                v19 = (float16x4_t *)((char *)v19 + v17);
              }
              while (v16 > v303);
              goto LABEL_540;
            }
            __asm { FCVT            S0, H0 }
            v187 = v19 + 1;
            v188 = v20 + 1;
            __asm { FCVT            S2, H2 }
            v190 = vcvtq_f32_f16(v29);
            v191 = vcvtq_f32_f16(v30);
            while (1)
            {
              v192 = (char *)v20 + v18 * v185;
              v193 = (char *)v19 + v17 * v185;
              if ((unint64_t)(v192 - v193) < 0x10)
                break;
              v192 += v28;
              v195 = v188;
              v196 = v187;
              v197 = v15 & 0xFFFFFFFFFFFFFFF8;
              do
              {
                v198 = vcvtq_f32_f16(v196[-1]);
                v199 = vcvtq_f32_f16(*v196);
                v195[-1] = vbic_s8(vbsl_s8((int8x8_t)vmovn_s32(vcgtq_f32(v198, v191)), (int8x8_t)0x3C003C003C003C00, (int8x8_t)0x4000400040004000), (int8x8_t)vmovn_s32(vcgtq_f32(v198, v190)));
                *v195 = vbic_s8(vbsl_s8((int8x8_t)vmovn_s32(vcgtq_f32(v199, v191)), (int8x8_t)0x3C003C003C003C00, (int8x8_t)0x4000400040004000), (int8x8_t)vmovn_s32(vcgtq_f32(v199, v190)));
                v196 += 2;
                v195 += 2;
                v197 -= 8;
              }
              while (v197);
              if (v15 != v27)
              {
                v193 += v28;
                v194 = v15 & 0xFFFFFFF8;
LABEL_200:
                v200 = v194 + 1;
                do
                {
                  v201 = *(_WORD *)v193;
                  v193 += 2;
                  _H7 = v201;
                  __asm { FCVT            S7, H7 }
                  v164 = _S7 <= _S2;
                  LOWORD(_S7) = word_20B6D3A80[_S7 > _S0];
                  if (!v164)
                    _S7 = 0.0;
                  *(_WORD *)v192 = LOWORD(_S7);
                  v192 += 2;
                  v164 = v15 > v200++;
                }
                while (v164);
              }
              ++v185;
              v187 = (float16x4_t *)((char *)v187 + v17);
              v188 = (int8x8_t *)((char *)v188 + v18);
              if (v16 <= v185)
                goto LABEL_540;
            }
            v194 = 0;
            goto LABEL_200;
          }
          if (v15 <= 7)
          {
            v140 = 0;
            __asm
            {
              FCVT            S0, H0
              FCVT            S2, H2
            }
            do
            {
              v143 = 0;
              do
              {
                _H3 = v19->i16[v143];
                __asm { FCVT            S3, H3 }
                if (_S3 >= _S2)
                {
                  v30.i16[0] = word_20B6D3A80[_S3 < _S0];
                  v146 = *(float *)v30.i32;
                }
                else
                {
                  v146 = 0.0;
                }
                v20->i16[v143++] = LOWORD(v146);
              }
              while (v143 < v15);
              ++v140;
              v20 = (int8x8_t *)((char *)v20 + v18);
              v19 = (float16x4_t *)((char *)v19 + v17);
            }
            while (v16 > v140);
            goto LABEL_540;
          }
          if (!(_DWORD)v15 || (v275 = (v15 - 1) >> 32) != 0)
          {
            v420 = 0;
            __asm
            {
              FCVT            S0, H0
              FCVT            S2, H2
            }
            do
            {
              v423 = 0;
              do
              {
                _H3 = v19->i16[v423];
                __asm { FCVT            S3, H3 }
                if (_S3 >= _S2)
                {
                  v30.i16[0] = word_20B6D3A80[_S3 < _S0];
                  v426 = *(float *)v30.i32;
                }
                else
                {
                  v426 = 0.0;
                }
                v20->i16[v423++] = LOWORD(v426);
              }
              while (v15 > v423);
              ++v420;
              v20 = (int8x8_t *)((char *)v20 + v18);
              v19 = (float16x4_t *)((char *)v19 + v17);
            }
            while (v16 > v420);
            goto LABEL_540;
          }
          __asm { FCVT            S0, H0 }
          v277 = v19 + 1;
          v278 = v20 + 1;
          __asm { FCVT            S2, H2 }
          v280 = vcvtq_f32_f16(v29);
          v281 = vcvtq_f32_f16(v30);
          while (1)
          {
            v282 = (char *)v20 + v18 * v275;
            v283 = (char *)v19 + v17 * v275;
            if ((unint64_t)(v282 - v283) < 0x10)
              break;
            v282 += v28;
            v285 = v278;
            v286 = v277;
            v287 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v288 = vcvtq_f32_f16(v286[-1]);
              v289 = vcvtq_f32_f16(*v286);
              v285[-1] = vbic_s8(vbsl_s8((int8x8_t)vmovn_s32(vcgtq_f32(v281, v288)), (int8x8_t)0x3C003C003C003C00, (int8x8_t)0x4000400040004000), (int8x8_t)vmovn_s32(vcgtq_f32(v280, v288)));
              *v285 = vbic_s8(vbsl_s8((int8x8_t)vmovn_s32(vcgtq_f32(v281, v289)), (int8x8_t)0x3C003C003C003C00, (int8x8_t)0x4000400040004000), (int8x8_t)vmovn_s32(vcgtq_f32(v280, v289)));
              v286 += 2;
              v285 += 2;
              v287 -= 8;
            }
            while (v287);
            if (v15 != v27)
            {
              v283 += v28;
              v284 = v15 & 0xFFFFFFF8;
LABEL_284:
              v290 = v284 + 1;
              do
              {
                v291 = *(_WORD *)v283;
                v283 += 2;
                _H7 = v291;
                __asm { FCVT            S7, H7 }
                _NF = _S7 < _S2;
                LOWORD(_S7) = word_20B6D3A80[_S7 < _S0];
                if (_NF)
                  _S7 = 0.0;
                *(_WORD *)v282 = LOWORD(_S7);
                v282 += 2;
                v164 = v15 > v290++;
              }
              while (v164);
            }
            ++v275;
            v277 = (float16x4_t *)((char *)v277 + v17);
            v278 = (int8x8_t *)((char *)v278 + v18);
            if (v16 <= v275)
              goto LABEL_540;
          }
          v284 = 0;
          goto LABEL_284;
        }
        if (a3 != a4)
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 0);
        v92 = CVPixelBufferGetWidth(a3);
        v93 = CVPixelBufferGetHeight(a3);
        v94 = CVPixelBufferGetBytesPerRow(a3);
        v95 = CVPixelBufferGetBytesPerRow(a4);
        v96 = (float16x4_t *)CVPixelBufferGetBaseAddress(a3);
        v97 = CVPixelBufferGetBaseAddress(a4);
        if (!v93 || !v92)
          goto LABEL_540;
        _S0 = v518.i32[0];
        __asm { FCVT            H4, S0 }
        _S0 = v519.i32[0];
        __asm { FCVT            H3, S0 }
        v102 = 2 * v92;
        v103 = v92 & 0xFFFFFFFFFFFFFFF8;
        v104 = 2 * (v92 & 0xFFFFFFFFFFFFFFF8);
        v105 = (float16x4_t)vdup_lane_s16(_D4, 0);
        v106 = (float16x4_t)vdup_lane_s16(_D3, 0);
        if (v13)
        {
          if (v92 <= 7)
          {
            v107 = 0;
            __asm
            {
              FCVT            S0, H3
              FCVT            S1, H4
            }
            do
            {
              v110 = 0;
              do
              {
                _H2 = v96->i16[v110];
                __asm { FCVT            S2, H2 }
                if (_S2 > _S0)
                  v113 = 1;
                else
                  v113 = 2;
                if (_S2 > _S1)
                  v113 = 0;
                v97[v110++] = v113;
              }
              while (v110 < v92);
              ++v107;
              v97 += v95;
              v96 = (float16x4_t *)((char *)v96 + v94);
            }
            while (v93 > v107);
            goto LABEL_540;
          }
          if (!(_DWORD)v92 || (v387 = (v92 - 1) >> 32) != 0)
          {
            v499 = 0;
            __asm
            {
              FCVT            S0, H3
              FCVT            S1, H4
            }
            do
            {
              v502 = 0;
              do
              {
                _H2 = v96->i16[v502];
                __asm { FCVT            S2, H2 }
                if (_S2 > _S0)
                  v505 = 1;
                else
                  v505 = 2;
                if (_S2 > _S1)
                  v505 = 0;
                v97[v502++] = v505;
              }
              while (v92 > v502);
              ++v499;
              v97 += v95;
              v96 = (float16x4_t *)((char *)v96 + v94);
            }
            while (v93 > v499);
            goto LABEL_540;
          }
          v388 = v96 + 1;
          v389 = v97 + 4;
          v390 = vcvtq_f32_f16(v105);
          v391 = vcvtq_f32_f16(v106);
          __asm
          {
            FCVT            S3, H3
            FCVT            S4, H4
          }
          while (1)
          {
            v394 = &v97[v95 * v387];
            v395 = (char *)v96 + v94 * v387;
            if (v394 < (char *)v96 + v102 + v94 * v387 && v395 < &v97[v92 + v95 * v387])
              break;
            v394 += v103;
            v397 = v389;
            v398 = v388;
            v399 = v92 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v400 = vcvtq_f32_f16(v398[-1]);
              v401 = (int8x8_t)vmovn_s32(vcgtq_f32(v400, v390));
              v402 = vcvtq_f32_f16(*v398);
              v403 = (int8x8_t)vmovn_s32(vcgtq_f32(v402, v390));
              v404 = (int16x8_t)vcgtq_f32(v400, v391);
              *(int16x4_t *)v404.i8 = vmovn_s32((int32x4_t)v404);
              v405 = (int16x8_t)vcgtq_f32(v402, v391);
              *(int16x4_t *)v405.i8 = vmovn_s32((int32x4_t)v405);
              *(int8x8_t *)v404.i8 = vbic_s8((int8x8_t)vsub_s16((int16x4_t)vbic_s8((int8x8_t)0x2000200020002, *(int8x8_t *)v404.i8), *(int16x4_t *)v404.i8), v401);
              *(int8x8_t *)v405.i8 = vbic_s8((int8x8_t)vsub_s16((int16x4_t)vbic_s8((int8x8_t)0x2000200020002, *(int8x8_t *)v405.i8), *(int16x4_t *)v405.i8), v403);
              v404.i32[0] = vmovn_s16(v404).u32[0];
              v404.i32[1] = vmovn_s16(v405).u32[0];
              *(_QWORD *)(v397 - 4) = v404.i64[0];
              v398 += 2;
              v397 += 8;
              v399 -= 8;
            }
            while (v399);
            if (v92 != v103)
            {
              v395 += v104;
              v406 = v92 & 0xFFFFFFF8;
LABEL_414:
              v407 = v406 + 1;
              do
              {
                v408 = *(_WORD *)v395;
                v395 += 2;
                _H5 = v408;
                __asm { FCVT            S5, H5 }
                if (_S5 > _S3)
                  v411 = 1;
                else
                  v411 = 2;
                if (_S5 > _S4)
                  v411 = 0;
                *v394++ = v411;
                v164 = v92 > v407++;
              }
              while (v164);
            }
            ++v387;
            v388 = (float16x4_t *)((char *)v388 + v94);
            v389 += v95;
            if (v93 <= v387)
              goto LABEL_540;
          }
          v406 = 0;
          goto LABEL_414;
        }
        if (v92 <= 7)
        {
          v314 = 0;
          __asm
          {
            FCVT            S0, H3
            FCVT            S1, H4
          }
          do
          {
            v317 = 0;
            do
            {
              _H2 = v96->i16[v317];
              __asm { FCVT            S2, H2 }
              if (_S2 < _S0)
                v320 = 1;
              else
                v320 = 2;
              if (_S2 < _S1)
                v320 = 0;
              v97[v317++] = v320;
            }
            while (v317 < v92);
            ++v314;
            v97 += v95;
            v96 = (float16x4_t *)((char *)v96 + v94);
          }
          while (v93 > v314);
          goto LABEL_540;
        }
        if (!(_DWORD)v92 || (v462 = (v92 - 1) >> 32) != 0)
        {
          v510 = 0;
          __asm
          {
            FCVT            S0, H3
            FCVT            S1, H4
          }
          do
          {
            v513 = 0;
            do
            {
              _H2 = v96->i16[v513];
              __asm { FCVT            S2, H2 }
              if (_S2 < _S0)
                v516 = 1;
              else
                v516 = 2;
              if (_S2 < _S1)
                v516 = 0;
              v97[v513++] = v516;
            }
            while (v92 > v513);
            ++v510;
            v97 += v95;
            v96 = (float16x4_t *)((char *)v96 + v94);
          }
          while (v93 > v510);
          goto LABEL_540;
        }
        v463 = v96 + 1;
        v464 = v97 + 4;
        v465 = vcvtq_f32_f16(v105);
        v466 = vcvtq_f32_f16(v106);
        __asm
        {
          FCVT            S3, H3
          FCVT            S4, H4
        }
        while (1)
        {
          v469 = &v97[v95 * v462];
          v470 = (char *)v96 + v94 * v462;
          if (v469 < (char *)v96 + v102 + v94 * v462 && v470 < &v97[v92 + v95 * v462])
            break;
          v469 += v103;
          v472 = v464;
          v473 = v463;
          v474 = v92 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v475 = vcvtq_f32_f16(v473[-1]);
            v476 = (int8x8_t)vmovn_s32(vcgtq_f32(v465, v475));
            v477 = vcvtq_f32_f16(*v473);
            v478 = (int8x8_t)vmovn_s32(vcgtq_f32(v465, v477));
            v479 = (int16x8_t)vcgtq_f32(v466, v475);
            *(int16x4_t *)v479.i8 = vmovn_s32((int32x4_t)v479);
            v480 = (int16x8_t)vcgtq_f32(v466, v477);
            *(int16x4_t *)v480.i8 = vmovn_s32((int32x4_t)v480);
            *(int8x8_t *)v479.i8 = vbic_s8((int8x8_t)vsub_s16((int16x4_t)vbic_s8((int8x8_t)0x2000200020002, *(int8x8_t *)v479.i8), *(int16x4_t *)v479.i8), v476);
            *(int8x8_t *)v480.i8 = vbic_s8((int8x8_t)vsub_s16((int16x4_t)vbic_s8((int8x8_t)0x2000200020002, *(int8x8_t *)v480.i8), *(int16x4_t *)v480.i8), v478);
            v479.i32[0] = vmovn_s16(v479).u32[0];
            v479.i32[1] = vmovn_s16(v480).u32[0];
            *(_QWORD *)(v472 - 4) = v479.i64[0];
            v473 += 2;
            v472 += 8;
            v474 -= 8;
          }
          while (v474);
          if (v92 != v103)
          {
            v470 += v104;
            v481 = v92 & 0xFFFFFFF8;
LABEL_482:
            v482 = v481 + 1;
            do
            {
              v483 = *(_WORD *)v470;
              v470 += 2;
              _H5 = v483;
              __asm { FCVT            S5, H5 }
              if (_S5 < _S3)
                v486 = 1;
              else
                v486 = 2;
              if (_S5 < _S4)
                v486 = 0;
              *v469++ = v486;
              v164 = v92 > v482++;
            }
            while (v164);
          }
          ++v462;
          v463 = (float16x4_t *)((char *)v463 + v94);
          v464 += v95;
          if (v93 <= v462)
            goto LABEL_540;
        }
        v481 = 0;
        goto LABEL_482;
      }
    }
    else if ((_DWORD)PixelFormatType != 1278226534)
    {
      if ((_DWORD)PixelFormatType != 1278226536)
      {
        if ((_DWORD)PixelFormatType != 1717855600)
        {
LABEL_94:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            PixelBufferUtils::pixelFormatAsString(PixelFormatType, (char *)buf);
            v212 = v523;
            v213 = *(uint8_t **)buf;
            PixelBufferUtils::pixelFormatAsString(v10, (char *)__p);
            v214 = buf;
            if (v212 < 0)
              v214 = v213;
            if (v521 >= 0)
              v215 = __p;
            else
              v215 = (void **)__p[0];
            *(_DWORD *)v524 = 136446466;
            v525 = v214;
            v526 = 2082;
            v527 = v215;
            _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unsupported confidence map format (%{public}s, %{public}s)", v524, 0x16u);
            if (v521 < 0)
              operator delete(__p[0]);
            if (v523 < 0)
              operator delete(*(void **)buf);
          }
          v14 = -22956;
          goto LABEL_543;
        }
        goto LABEL_18;
      }
      goto LABEL_13;
    }
LABEL_18:
    if ((int)v10 > 1717855599)
    {
      if ((int)v10 <= 1751410031)
      {
        if ((_DWORD)v10 != 1717855600 && (_DWORD)v10 != 1717856627)
          goto LABEL_94;
        goto LABEL_44;
      }
      if ((_DWORD)v10 != 1751411059 && (_DWORD)v10 != 1751410032)
        goto LABEL_94;
      goto LABEL_80;
    }
    if ((_DWORD)v10 != 1278226488)
    {
      if ((_DWORD)v10 == 1278226534)
      {
LABEL_44:
        if (a3 != a4)
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 0);
        v38 = CVPixelBufferGetWidth(a3);
        v39 = CVPixelBufferGetHeight(a3);
        v40 = CVPixelBufferGetBytesPerRow(a3);
        v41 = CVPixelBufferGetBytesPerRow(a4);
        v42 = (float *)CVPixelBufferGetBaseAddress(a3);
        v43 = (float *)CVPixelBufferGetBaseAddress(a4);
        if (!v39 || !v38)
          goto LABEL_540;
        v44 = v38 & 0xFFFFFFFFFFFFFFF8;
        v45 = 4 * (v38 & 0xFFFFFFFFFFFFFFF8);
        v46 = (float32x4_t)vdupq_lane_s32(v518, 0);
        v47 = (float32x4_t)vdupq_lane_s32(v519, 0);
        if (v13)
        {
          if (v38 <= 7)
          {
            v48 = 0;
            do
            {
              v49 = 0;
              do
              {
                v50 = v42[v49];
                if (v50 <= *(float *)v519.i32)
                  v51 = 2.0;
                else
                  v51 = 1.0;
                if (v50 <= *(float *)v518.i32)
                  v52 = v51;
                else
                  v52 = 0.0;
                v43[v49++] = v52;
              }
              while (v49 < v38);
              ++v48;
              v43 = (float *)((char *)v43 + v41);
              v42 = (float *)((char *)v42 + v40);
            }
            while (v39 > v48);
LABEL_540:
            if (a3 != a4)
              CVPixelBufferUnlockBaseAddress(a3, 1uLL);
            CVPixelBufferUnlockBaseAddress(a4, 0);
            v14 = 0;
            goto LABEL_543;
          }
          if (!(_DWORD)v38 || (v147 = (v38 - 1) >> 32) != 0)
          {
            v294 = 0;
            do
            {
              v295 = 0;
              do
              {
                v296 = v42[v295];
                if (v296 <= *(float *)v519.i32)
                  v297 = 2.0;
                else
                  v297 = 1.0;
                if (v296 <= *(float *)v518.i32)
                  v298 = v297;
                else
                  v298 = 0.0;
                v43[v295++] = v298;
              }
              while (v38 > v295);
              ++v294;
              v43 = (float *)((char *)v43 + v41);
              v42 = (float *)((char *)v42 + v40);
            }
            while (v39 > v294);
            goto LABEL_540;
          }
          v148 = (float32x4_t *)(v42 + 4);
          v149 = (int8x16_t *)(v43 + 4);
          v150.i64[0] = 0x4000000040000000;
          v150.i64[1] = 0x4000000040000000;
          __asm { FMOV            V6.4S, #1.0 }
          while (1)
          {
            v152 = (float *)((char *)v43 + v41 * v147);
            v153 = (float *)((char *)v42 + v40 * v147);
            if ((unint64_t)((char *)v152 - (char *)v153) < 0x20)
              break;
            v152 = (float *)((char *)v152 + v45);
            v155 = v149;
            v156 = v148;
            v157 = v38 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v158 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(*v156, v47), _Q6, v150), (int8x16_t)vcgtq_f32(*v156, v46));
              v155[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v156[-1], v47), _Q6, v150), (int8x16_t)vcgtq_f32(v156[-1], v46));
              *v155 = v158;
              v156 += 2;
              v155 += 2;
              v157 -= 8;
            }
            while (v157);
            if (v38 != v44)
            {
              v153 = (float *)((char *)v153 + v45);
              v154 = v38 & 0xFFFFFFF8;
LABEL_168:
              v159 = v154 + 1;
              do
              {
                v160 = *v153++;
                v161 = v160;
                if (v160 <= *(float *)v519.i32)
                  v162 = 2.0;
                else
                  v162 = 1.0;
                if (v161 <= *(float *)v518.i32)
                  v163 = v162;
                else
                  v163 = 0.0;
                *v152++ = v163;
                v164 = v38 > v159++;
              }
              while (v164);
            }
            ++v147;
            v148 = (float32x4_t *)((char *)v148 + v40);
            v149 = (int8x16_t *)((char *)v149 + v41);
            if (v39 <= v147)
              goto LABEL_540;
          }
          v154 = 0;
          goto LABEL_168;
        }
        if (v38 <= 7)
        {
          v131 = 0;
          do
          {
            v132 = 0;
            do
            {
              v133 = v42[v132];
              if (v133 >= *(float *)v519.i32)
                v134 = 2.0;
              else
                v134 = 1.0;
              if (v133 >= *(float *)v518.i32)
                v135 = v134;
              else
                v135 = 0.0;
              v43[v132++] = v135;
            }
            while (v132 < v38);
            ++v131;
            v43 = (float *)((char *)v43 + v41);
            v42 = (float *)((char *)v42 + v40);
          }
          while (v39 > v131);
          goto LABEL_540;
        }
        if (!(_DWORD)v38 || (v216 = (v38 - 1) >> 32) != 0)
        {
          v378 = 0;
          do
          {
            v379 = 0;
            do
            {
              v380 = v42[v379];
              if (v380 >= *(float *)v519.i32)
                v381 = 2.0;
              else
                v381 = 1.0;
              if (v380 >= *(float *)v518.i32)
                v382 = v381;
              else
                v382 = 0.0;
              v43[v379++] = v382;
            }
            while (v38 > v379);
            ++v378;
            v43 = (float *)((char *)v43 + v41);
            v42 = (float *)((char *)v42 + v40);
          }
          while (v39 > v378);
          goto LABEL_540;
        }
        v217 = (float32x4_t *)(v42 + 4);
        v218 = (int8x16_t *)(v43 + 4);
        v219.i64[0] = 0x4000000040000000;
        v219.i64[1] = 0x4000000040000000;
        __asm { FMOV            V6.4S, #1.0 }
        while (1)
        {
          v221 = (float *)((char *)v43 + v41 * v216);
          v222 = (float *)((char *)v42 + v40 * v216);
          if ((unint64_t)((char *)v221 - (char *)v222) < 0x20)
            break;
          v221 = (float *)((char *)v221 + v45);
          v224 = v218;
          v225 = v217;
          v226 = v38 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v227 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v47, *v225), _Q6, v219), (int8x16_t)vcgtq_f32(v46, *v225));
            v224[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v47, v225[-1]), _Q6, v219), (int8x16_t)vcgtq_f32(v46, v225[-1]));
            *v224 = v227;
            v225 += 2;
            v224 += 2;
            v226 -= 8;
          }
          while (v226);
          if (v38 != v44)
          {
            v222 = (float *)((char *)v222 + v45);
            v223 = v38 & 0xFFFFFFF8;
LABEL_236:
            v228 = v223 + 1;
            do
            {
              v229 = *v222++;
              v230 = v229;
              if (v229 >= *(float *)v519.i32)
                v231 = 2.0;
              else
                v231 = 1.0;
              if (v230 >= *(float *)v518.i32)
                v232 = v231;
              else
                v232 = 0.0;
              *v221++ = v232;
              v164 = v38 > v228++;
            }
            while (v164);
          }
          ++v216;
          v217 = (float32x4_t *)((char *)v217 + v40);
          v218 = (int8x16_t *)((char *)v218 + v41);
          if (v39 <= v216)
            goto LABEL_540;
        }
        v223 = 0;
        goto LABEL_236;
      }
      if ((_DWORD)v10 != 1278226536)
        goto LABEL_94;
LABEL_80:
      if (a3 != a4)
        CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      v76 = CVPixelBufferGetWidth(a3);
      v77 = CVPixelBufferGetHeight(a3);
      v78 = CVPixelBufferGetBytesPerRow(a3);
      v79 = CVPixelBufferGetBytesPerRow(a4);
      v80 = (float *)CVPixelBufferGetBaseAddress(a3);
      v81 = (int8x16_t *)CVPixelBufferGetBaseAddress(a4);
      if (v77 && v76)
      {
        v83 = v76 & 0xFFFFFFFFFFFFFFF0;
        v84 = 2 * (v76 & 0xFFFFFFFFFFFFFFF0);
        v85 = 4 * (v76 & 0xFFFFFFFFFFFFFFF0);
        v86 = (float32x4_t)vdupq_lane_s32(v518, 0);
        v87 = (float32x4_t)vdupq_lane_s32(v519, 0);
        if (v13)
        {
          if (v76 > 0xF)
          {
            if (!(_DWORD)v76 || (v165 = (v76 - 1) >> 32) != 0)
            {
              v299 = 0;
              do
              {
                v300 = 0;
                do
                {
                  v301 = v80[v300];
                  if (v301 <= *(float *)v518.i32)
                  {
                    LOWORD(v82) = word_20B6D3A80[v301 > *(float *)v519.i32];
                    v302 = v82;
                  }
                  else
                  {
                    v302 = 0.0;
                  }
                  v81->i16[v300++] = LOWORD(v302);
                }
                while (v76 > v300);
                ++v299;
                v81 = (int8x16_t *)((char *)v81 + v79);
                v80 = (float *)((char *)v80 + v78);
              }
              while (v77 > v299);
            }
            else
            {
              v166 = (float32x4_t *)(v80 + 8);
              v167 = v81 + 1;
              v168.i64[0] = 0x4000400040004000;
              v168.i64[1] = 0x4000400040004000;
              v169.i64[0] = 0x3C003C003C003C00;
              v169.i64[1] = 0x3C003C003C003C00;
              do
              {
                v170 = &v81->i8[v165 * v79 + v84];
                v171 = v167;
                v172 = v166;
                v173 = v76 & 0xFFFFFFFFFFFFFFF0;
                do
                {
                  v174 = v172[-2];
                  v175 = v172[-1];
                  v176 = *v172;
                  v177 = v172[1];
                  v172 += 4;
                  v178 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v174, v86), (int16x8_t)vcgtq_f32(v175, v86));
                  v179 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v174, v87), (int16x8_t)vcgtq_f32(v175, v87));
                  v180 = vbicq_s8(vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v176, v87), (int16x8_t)vcgtq_f32(v177, v87)), v169, v168), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v176, v86), (int16x8_t)vcgtq_f32(v177, v86)));
                  v171[-1] = vbicq_s8(vbslq_s8(v179, v169, v168), v178);
                  *v171 = v180;
                  v171 += 2;
                  v173 -= 16;
                }
                while (v173);
                if (v76 != v83)
                {
                  v181 = (float *)((char *)v80 + v165 * v78 + v85);
                  v182 = v83 + 1;
                  do
                  {
                    v183 = *v181++;
                    v180.i16[0] = word_20B6D3A80[v183 > *(float *)v519.i32];
                    if (v183 <= *(float *)v518.i32)
                      v184 = *(float *)v180.i32;
                    else
                      v184 = 0.0;
                    *(_WORD *)v170 = LOWORD(v184);
                    v170 += 2;
                    v164 = v76 > v182++;
                  }
                  while (v164);
                }
                ++v165;
                v166 = (float32x4_t *)((char *)v166 + v78);
                v167 = (int8x16_t *)((char *)v167 + v79);
              }
              while (v77 > v165);
            }
          }
          else
          {
            v88 = 0;
            do
            {
              v89 = 0;
              do
              {
                v90 = v80[v89];
                if (v90 <= *(float *)v518.i32)
                {
                  LOWORD(v82) = word_20B6D3A80[v90 > *(float *)v519.i32];
                  v91 = v82;
                }
                else
                {
                  v91 = 0.0;
                }
                v81->i16[v89++] = LOWORD(v91);
              }
              while (v89 < v76);
              ++v88;
              v81 = (int8x16_t *)((char *)v81 + v79);
              v80 = (float *)((char *)v80 + v78);
            }
            while (v77 > v88);
          }
        }
        else if (v76 > 0xF)
        {
          if (!(_DWORD)v76 || (v233 = (v76 - 1) >> 32) != 0)
          {
            v383 = 0;
            do
            {
              v384 = 0;
              do
              {
                v385 = v80[v384];
                if (v385 >= *(float *)v518.i32)
                {
                  LOWORD(v82) = word_20B6D3A80[v385 < *(float *)v519.i32];
                  v386 = v82;
                }
                else
                {
                  v386 = 0.0;
                }
                v81->i16[v384++] = LOWORD(v386);
              }
              while (v76 > v384);
              ++v383;
              v81 = (int8x16_t *)((char *)v81 + v79);
              v80 = (float *)((char *)v80 + v78);
            }
            while (v77 > v383);
          }
          else
          {
            v234 = (float32x4_t *)(v80 + 8);
            v235 = v81 + 1;
            v236.i64[0] = 0x4000400040004000;
            v236.i64[1] = 0x4000400040004000;
            v237.i64[0] = 0x3C003C003C003C00;
            v237.i64[1] = 0x3C003C003C003C00;
            do
            {
              v238 = &v81->i8[v233 * v79 + v84];
              v239 = v235;
              v240 = v234;
              v241 = v76 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                v242 = v240[-2];
                v243 = v240[-1];
                v244 = *v240;
                v245 = v240[1];
                v240 += 4;
                v246 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v86, v242), (int16x8_t)vcgtq_f32(v86, v243));
                v247 = (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v87, v242), (int16x8_t)vcgtq_f32(v87, v243));
                v248 = vbicq_s8(vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v87, v244), (int16x8_t)vcgtq_f32(v87, v245)), v237, v236), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v86, v244), (int16x8_t)vcgtq_f32(v86, v245)));
                v239[-1] = vbicq_s8(vbslq_s8(v247, v237, v236), v246);
                *v239 = v248;
                v239 += 2;
                v241 -= 16;
              }
              while (v241);
              if (v76 != v83)
              {
                v249 = (float *)((char *)v80 + v233 * v78 + v85);
                v250 = v83 + 1;
                do
                {
                  v251 = *v249++;
                  v248.i16[0] = word_20B6D3A80[v251 < *(float *)v519.i32];
                  if (v251 >= *(float *)v518.i32)
                    v252 = *(float *)v248.i32;
                  else
                    v252 = 0.0;
                  *(_WORD *)v238 = LOWORD(v252);
                  v238 += 2;
                  v164 = v76 > v250++;
                }
                while (v164);
              }
              ++v233;
              v234 = (float32x4_t *)((char *)v234 + v78);
              v235 = (int8x16_t *)((char *)v235 + v79);
            }
            while (v77 > v233);
          }
        }
        else
        {
          v136 = 0;
          do
          {
            v137 = 0;
            do
            {
              v138 = v80[v137];
              if (v138 >= *(float *)v518.i32)
              {
                LOWORD(v82) = word_20B6D3A80[v138 < *(float *)v519.i32];
                v139 = v82;
              }
              else
              {
                v139 = 0.0;
              }
              v81->i16[v137++] = LOWORD(v139);
            }
            while (v137 < v76);
            ++v136;
            v81 = (int8x16_t *)((char *)v81 + v79);
            v80 = (float *)((char *)v80 + v78);
          }
          while (v77 > v136);
        }
      }
      goto LABEL_540;
    }
    if (a3 != a4)
      CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 0);
    v114 = CVPixelBufferGetWidth(a3);
    v115 = CVPixelBufferGetHeight(a3);
    v116 = CVPixelBufferGetBytesPerRow(a3);
    v117 = CVPixelBufferGetBytesPerRow(a4);
    v118 = (float *)CVPixelBufferGetBaseAddress(a3);
    v119 = (int8x16_t *)CVPixelBufferGetBaseAddress(a4);
    if (!v115 || !v114)
      goto LABEL_540;
    v120 = v114;
    v121 = v114 & 0xFFFFFFFFFFFFFFE0;
    v122 = (float32x4_t)vdupq_lane_s32(v518, 0);
    v123 = (float32x4_t)vdupq_lane_s32(v519, 0);
    v124 = 4 * (v114 & 0xFFFFFFFFFFFFFFE0);
    v125 = v114 & 0xFFFFFFFFFFFFFFF8;
    v126 = 4 * (v114 & 0xFFFFFFFFFFFFFFF8);
    if (v13)
    {
      if (v114 <= 7)
      {
        v127 = 0;
        do
        {
          v128 = 0;
          do
          {
            v129 = v118[v128];
            if (v129 > *(float *)v519.i32)
              v130 = 1;
            else
              v130 = 2;
            if (v129 > *(float *)v518.i32)
              v130 = 0;
            v119->i8[v128++] = v130;
          }
          while (v128 < v114);
          ++v127;
          v119 = (int8x16_t *)((char *)v119 + v117);
          v118 = (float *)((char *)v118 + v116);
        }
        while (v115 > v127);
        goto LABEL_540;
      }
      if (!(_DWORD)v114 || (v343 = (v114 - 1) >> 32) != 0)
      {
        v495 = 0;
        do
        {
          v496 = 0;
          do
          {
            v497 = v118[v496];
            if (v497 > *(float *)v519.i32)
              v498 = 1;
            else
              v498 = 2;
            if (v497 > *(float *)v518.i32)
              v498 = 0;
            v119->i8[v496++] = v498;
          }
          while (v114 > v496);
          ++v495;
          v119 = (int8x16_t *)((char *)v119 + v117);
          v118 = (float *)((char *)v118 + v116);
        }
        while (v115 > v495);
        goto LABEL_540;
      }
      v344 = (float32x4_t *)(v118 + 16);
      v345 = v119 + 1;
      v346.i64[0] = 0x202020202020202;
      v346.i64[1] = 0x202020202020202;
      v347 = v119;
      v348 = v118;
      while (1)
      {
        v349 = &v119->i8[v117 * v343];
        v350 = (float *)((char *)v118 + v116 * v343);
        if (v349 < (char *)&v118[v120] + v116 * v343 && v350 < (float *)((char *)v119->i32 + v114 + v117 * v343))
        {
          v353 = 0;
          goto LABEL_374;
        }
        if (v114 >= 0x20)
        {
          v354 = v345;
          v355 = v344;
          v356 = v114 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v358 = v355[-2];
            v357 = v355[-1];
            v359 = v355[-4];
            v360 = v355[-3];
            v362 = v355[2];
            v361 = v355[3];
            v363 = *v355;
            v364 = v355[1];
            v355 += 8;
            v365 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v359, v122), (int16x8_t)vcgtq_f32(v360, v122)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v358, v122), (int16x8_t)vcgtq_f32(v357, v122)));
            v366 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v359, v123), (int16x8_t)vcgtq_f32(v360, v123)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v358, v123), (int16x8_t)vcgtq_f32(v357, v123)));
            v367 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v363, v123), (int16x8_t)vcgtq_f32(v364, v123)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v362, v123), (int16x8_t)vcgtq_f32(v361, v123)));
            v354[-1] = vbicq_s8(vsubq_s8(vbicq_s8(v346, v366), v366), v365);
            *v354 = vbicq_s8(vsubq_s8(vbicq_s8(v346, v367), v367), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v363, v122), (int16x8_t)vcgtq_f32(v364, v122)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v362, v122), (int16x8_t)vcgtq_f32(v361, v122))));
            v354 += 2;
            v356 -= 32;
          }
          while (v356);
          if (v114 == v121)
            goto LABEL_357;
          v352 = v114 & 0xFFFFFFFFFFFFFFE0;
          if ((v114 & 0x18) == 0)
          {
            v350 = (float *)((char *)v350 + v124);
            v349 += v121;
            v353 = v114 & 0xFFFFFFE0;
LABEL_374:
            v374 = v353 + 1;
            do
            {
              v375 = *v350++;
              v376 = v375;
              if (v375 > *(float *)v519.i32)
                v377 = 1;
              else
                v377 = 2;
              if (v376 > *(float *)v518.i32)
                v377 = 0;
              *v349++ = v377;
              v164 = v114 > v374++;
            }
            while (v164);
            goto LABEL_357;
          }
        }
        else
        {
          v352 = 0;
        }
        v349 += v125;
        v368 = v352 - (v114 & 0xFFFFFFFFFFFFFFF8);
        v369 = (int8x8_t *)&v347->i8[v352];
        v370 = (float32x4_t *)&v348[v352];
        do
        {
          v371 = *v370;
          v372 = v370[1];
          v370 += 2;
          v373 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v371, v122), (int16x8_t)vcgtq_f32(v372, v122)));
          *(int8x8_t *)v371.f32 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v371, v123), (int16x8_t)vcgtq_f32(v372, v123)));
          *v369++ = vbic_s8(vsub_s8(vbic_s8((int8x8_t)0x202020202020202, *(int8x8_t *)v371.f32), *(int8x8_t *)v371.f32), v373);
          v368 += 8;
        }
        while (v368);
        if (v114 != v125)
        {
          v350 = (float *)((char *)v350 + v126);
          v353 = v114 & 0xFFFFFFF8;
          goto LABEL_374;
        }
LABEL_357:
        ++v343;
        v344 = (float32x4_t *)((char *)v344 + v116);
        v345 = (int8x16_t *)((char *)v345 + v117);
        v348 = (float *)((char *)v348 + v116);
        v347 = (int8x16_t *)((char *)v347 + v117);
        if (v115 <= v343)
          goto LABEL_540;
      }
    }
    if (v114 <= 7)
    {
      v310 = 0;
      do
      {
        v311 = 0;
        do
        {
          v312 = v118[v311];
          if (v312 < *(float *)v519.i32)
            v313 = 1;
          else
            v313 = 2;
          if (v312 < *(float *)v518.i32)
            v313 = 0;
          v119->i8[v311++] = v313;
        }
        while (v311 < v114);
        ++v310;
        v119 = (int8x16_t *)((char *)v119 + v117);
        v118 = (float *)((char *)v118 + v116);
      }
      while (v115 > v310);
      goto LABEL_540;
    }
    if (!(_DWORD)v114 || (v427 = (v114 - 1) >> 32) != 0)
    {
      v506 = 0;
      do
      {
        v507 = 0;
        do
        {
          v508 = v118[v507];
          if (v508 < *(float *)v519.i32)
            v509 = 1;
          else
            v509 = 2;
          if (v508 < *(float *)v518.i32)
            v509 = 0;
          v119->i8[v507++] = v509;
        }
        while (v114 > v507);
        ++v506;
        v119 = (int8x16_t *)((char *)v119 + v117);
        v118 = (float *)((char *)v118 + v116);
      }
      while (v115 > v506);
      goto LABEL_540;
    }
    v428 = (float32x4_t *)(v118 + 16);
    v429 = v119 + 1;
    v430.i64[0] = 0x202020202020202;
    v430.i64[1] = 0x202020202020202;
    v431 = v119;
    v432 = v118;
    while (1)
    {
      v433 = &v119->i8[v117 * v427];
      v434 = (float *)((char *)v118 + v116 * v427);
      if (v433 < (char *)&v118[v120] + v116 * v427 && v434 < (float *)((char *)v119->i32 + v114 + v117 * v427))
      {
        v437 = 0;
        goto LABEL_461;
      }
      if (v114 >= 0x20)
      {
        v438 = v429;
        v439 = v428;
        v440 = v114 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v442 = v439[-2];
          v441 = v439[-1];
          v443 = v439[-4];
          v444 = v439[-3];
          v446 = v439[2];
          v445 = v439[3];
          v447 = *v439;
          v448 = v439[1];
          v439 += 8;
          v449 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v122, v443), (int16x8_t)vcgtq_f32(v122, v444)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v122, v442), (int16x8_t)vcgtq_f32(v122, v441)));
          v450 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v123, v443), (int16x8_t)vcgtq_f32(v123, v444)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v123, v442), (int16x8_t)vcgtq_f32(v123, v441)));
          v451 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v123, v447), (int16x8_t)vcgtq_f32(v123, v448)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v123, v446), (int16x8_t)vcgtq_f32(v123, v445)));
          v438[-1] = vbicq_s8(vsubq_s8(vbicq_s8(v430, v450), v450), v449);
          *v438 = vbicq_s8(vsubq_s8(vbicq_s8(v430, v451), v451), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v122, v447), (int16x8_t)vcgtq_f32(v122, v448)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v122, v446), (int16x8_t)vcgtq_f32(v122, v445))));
          v438 += 2;
          v440 -= 32;
        }
        while (v440);
        if (v114 == v121)
          goto LABEL_444;
        v436 = v114 & 0xFFFFFFFFFFFFFFE0;
        if ((v114 & 0x18) == 0)
        {
          v434 = (float *)((char *)v434 + v124);
          v433 += v121;
          v437 = v114 & 0xFFFFFFE0;
LABEL_461:
          v458 = v437 + 1;
          do
          {
            v459 = *v434++;
            v460 = v459;
            if (v459 < *(float *)v519.i32)
              v461 = 1;
            else
              v461 = 2;
            if (v460 < *(float *)v518.i32)
              v461 = 0;
            *v433++ = v461;
            v164 = v114 > v458++;
          }
          while (v164);
          goto LABEL_444;
        }
      }
      else
      {
        v436 = 0;
      }
      v433 += v125;
      v452 = v436 - (v114 & 0xFFFFFFFFFFFFFFF8);
      v453 = (int8x8_t *)&v431->i8[v436];
      v454 = (float32x4_t *)&v432[v436];
      do
      {
        v455 = *v454;
        v456 = v454[1];
        v454 += 2;
        v457 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v122, v455), (int16x8_t)vcgtq_f32(v122, v456)));
        *(int8x8_t *)v455.f32 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v123, v455), (int16x8_t)vcgtq_f32(v123, v456)));
        *v453++ = vbic_s8(vsub_s8(vbic_s8((int8x8_t)0x202020202020202, *(int8x8_t *)v455.f32), *(int8x8_t *)v455.f32), v457);
        v452 += 8;
      }
      while (v452);
      if (v114 != v125)
      {
        v434 = (float *)((char *)v434 + v126);
        v437 = v114 & 0xFFFFFFF8;
        goto LABEL_461;
      }
LABEL_444:
      ++v427;
      v428 = (float32x4_t *)((char *)v428 + v116);
      v429 = (int8x16_t *)((char *)v429 + v117);
      v432 = (float *)((char *)v432 + v116);
      v431 = (int8x16_t *)((char *)v431 + v117);
      if (v115 <= v427)
        goto LABEL_540;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot create confidence levels: thresholds are not defined.", buf, 2u);
  }
  v14 = -22953;
LABEL_543:

  return v14;
}

+ (int64_t)copyModifyNormalsPixelBuffer:(__CVBuffer *)a3 output:(__CVBuffer *)a4 normalsRotation:(int64_t)a5
{
  int Width;
  int Height;
  float *BaseAddress;
  float32x4_t *v11;
  size_t DataSize;
  float32x4_t v13;
  int v14;
  unint64_t v15;
  float v16;
  int32x4_t v17;
  float32x2_t v18;
  float32x2_t v19;
  int v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  v11 = (float32x4_t *)CVPixelBufferGetBaseAddress(a4);
  DataSize = CVPixelBufferGetDataSize(a3);
  v14 = Height * Width;
  if (!(Height * Width))
  {
LABEL_12:
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(a4, 0);
    return 0;
  }
  if ((unint64_t)a5 <= 3)
  {
    v15 = DataSize / 0xC;
    do
    {
      if (a5)
      {
        if (a5 == 3)
        {
          v13.f32[0] = -BaseAddress[v15];
          v16 = *BaseAddress;
        }
        else if (a5 == 1)
        {
          v13.f32[0] = BaseAddress[v15];
          v16 = -*BaseAddress;
        }
        else
        {
          v13.f32[0] = -*BaseAddress;
          v16 = -BaseAddress[v15];
        }
      }
      else
      {
        v13.f32[0] = *BaseAddress;
        v16 = BaseAddress[v15];
      }
      v13.f32[1] = v16;
      v13.f32[2] = BaseAddress[2 * (DataSize / 0xC)];
      v17 = (int32x4_t)vmulq_f32(v13, v13);
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
      v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
      v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
      v13 = vmulq_n_f32(v13, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]);
      v13.i32[3] = 1.0;
      *v11++ = v13;
      ++BaseAddress;
      --v14;
    }
    while (v14);
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v21 = 134217984;
    v22 = a5;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Rotating normals is not implemented for %ld.", (uint8_t *)&v21, 0xCu);
  }
  return -22952;
}

+ (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  return +[ADUtils postProcessDepth:depthOutput:inputRoi:](ADUtils, "postProcessDepth:depthOutput:inputRoi:", a3, a4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

+ (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4 inputRoi:(CGRect)a5
{
  int64_t result;
  double height;
  double width;
  double y;
  double x;
  OSType PixelFormatType;
  OSType v13;
  int v15;
  int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  char *v27;
  char *v28;
  unsigned int v29;
  uint64_t v30;
  float v31;
  int v37;
  int v38;
  char *v39;
  char *v40;
  unsigned int v41;
  uint64_t v42;
  float v43;
  float v44;
  int v45;
  int v46;
  char *v47;
  char *v48;
  unsigned int v49;
  uint64_t v50;
  float v53;
  int BytesPerRow;
  int v55;
  NSObject *v56;
  const char *v57;
  uint32_t v58;
  char *BaseAddress;
  char *v60;
  unsigned int v61;
  uint64_t v62;
  float v66;
  int v67;
  _BYTE *v68;
  _BYTE *v69;
  void **v70;
  void *__p[2];
  char v72;
  uint8_t v73[4];
  _BYTE *v74;
  __int16 v75;
  void **v76;
  _BYTE buf[12];
  __int16 v78;
  double v79;
  __int16 v80;
  _BYTE v81[10];
  double v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v87 = *MEMORY[0x24BDAC8D0];
  result = -22950;
  if (!a3 || !a4)
    return result;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v13 = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType == v13)
  {
    v92.origin.x = x;
    v92.origin.y = y;
    v92.size.width = width;
    v92.size.height = height;
    if (copyPixelBufferVImage(a4, *MEMORY[0x24BDBEFB0], a3, v92))
      return -22950;
    else
      return 0;
  }
  v15 = PixelFormatType == 1717856627 || PixelFormatType == 1751411059;
  v17 = v13 == 1717856627 || v13 == 1751411059;
  if (v15 == v17)
    return copyModifyPixelBuffer<&(postProcessingNone(float))>(a3, a4, x, y, width, height);
  v18 = CVPixelBufferGetPixelFormatType(a3);
  v19 = CVPixelBufferGetPixelFormatType(a4);
  v20 = v19;
  if ((int)v18 > 1717856626)
  {
    if ((_DWORD)v18 == 1717856627)
      goto LABEL_34;
    if ((_DWORD)v18 != 1751411059 && (_DWORD)v18 != 1751410032)
      goto LABEL_98;
LABEL_29:
    if ((int)v19 <= 1717856626)
    {
      if ((_DWORD)v19 == 1278226536)
        goto LABEL_100;
      if ((_DWORD)v19 != 1717855600)
      {
LABEL_98:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          PixelBufferUtils::pixelFormatAsString(v18, buf);
          v67 = SHIBYTE(v80);
          v68 = *(_BYTE **)buf;
          PixelBufferUtils::pixelFormatAsString(v20, (char *)__p);
          v69 = buf;
          if (v67 < 0)
            v69 = v68;
          if (v72 >= 0)
            v70 = __p;
          else
            v70 = (void **)__p[0];
          *(_DWORD *)v73 = 136446466;
          v74 = v69;
          v75 = 2082;
          v76 = v70;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unsupported map format (%{public}s, %{public}s)", v73, 0x16u);
          if (v72 < 0)
            operator delete(__p[0]);
          if (SHIBYTE(v80) < 0)
            operator delete(*(void **)buf);
        }
        return -22956;
      }
    }
    else if ((_DWORD)v19 != 1717856627)
    {
      if ((_DWORD)v19 != 1751411059 && (_DWORD)v19 != 1751410032)
        goto LABEL_98;
LABEL_100:
      v21 = CVPixelBufferGetWidth(a3);
      v22 = CVPixelBufferGetHeight(a3);
      v23 = CVPixelBufferGetWidth(a4);
      v24 = CVPixelBufferGetHeight(a4);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v55 = CVPixelBufferGetBytesPerRow(a4);
      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = width;
      v91.size.height = height;
      if (CGRectIsEmpty(v91))
      {
        x = *MEMORY[0x24BDBEFB0];
        y = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        width = (double)v21;
        height = (double)v22;
      }
      if (width <= (double)v23 && height <= (double)v24)
      {
        if (x + width <= (double)v21 && y + height <= (double)v22)
        {
          if (a3 != a4)
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
          v60 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (width > 0.0 && height > 0.0)
          {
            v61 = 0;
            do
            {
              v62 = 0;
              do
              {
                _H2 = *(_WORD *)&BaseAddress[2 * (unint64_t)x
                                           + 2 * v62
                                           + BytesPerRow * ((unint64_t)y + v61)];
                __asm { FCVT            S2, H2 }
                _S3 = 1.0 / _S2;
                __asm { FCVT            H3, S3 }
                if (_S2 == 0.0)
                  v66 = 0.0;
                else
                  v66 = _S3;
                *(_WORD *)&v60[2 * v62++ + v55 * (unint64_t)v61] = LOWORD(v66);
              }
              while (width > (double)v62);
              ++v61;
            }
            while (height > (double)v61);
          }
          goto LABEL_122;
        }
        goto LABEL_106;
      }
LABEL_108:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218752;
        *(double *)&buf[4] = width;
        v78 = 2048;
        v79 = height;
        v80 = 1024;
        *(_DWORD *)v81 = v23;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v24;
        v56 = MEMORY[0x24BDACB70];
        v57 = "Dimensions mismatch. Cannot fit ROI (%f,%f) inside output (%d,%d)";
        v58 = 34;
        goto LABEL_126;
      }
      return -22957;
    }
    v21 = CVPixelBufferGetWidth(a3);
    v22 = CVPixelBufferGetHeight(a3);
    v23 = CVPixelBufferGetWidth(a4);
    v24 = CVPixelBufferGetHeight(a4);
    v45 = CVPixelBufferGetBytesPerRow(a3);
    v46 = CVPixelBufferGetBytesPerRow(a4);
    v90.origin.x = x;
    v90.origin.y = y;
    v90.size.width = width;
    v90.size.height = height;
    if (CGRectIsEmpty(v90))
    {
      x = *MEMORY[0x24BDBEFB0];
      y = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      height = (double)v22;
      width = (double)v21;
    }
    if (width <= (double)v23 && height <= (double)v24)
    {
      if (x + width <= (double)v21 && y + height <= (double)v22)
      {
        if (a3 != a4)
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 0);
        v47 = (char *)CVPixelBufferGetBaseAddress(a3);
        v48 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (width > 0.0 && height > 0.0)
        {
          v49 = 0;
          do
          {
            v50 = 0;
            do
            {
              _H2 = *(_WORD *)&v47[2 * (unint64_t)x + 2 * v50 + v45 * ((unint64_t)y + v49)];
              __asm { FCVT            S2, H2 }
              if (_S2 == 0.0)
                v53 = 0.0;
              else
                v53 = 1.0 / _S2;
              *(float *)&v48[4 * v50++ + v46 * (unint64_t)v49] = v53;
            }
            while (width > (double)v50);
            ++v49;
          }
          while (height > (double)v49);
        }
        goto LABEL_122;
      }
      goto LABEL_106;
    }
    goto LABEL_108;
  }
  if ((_DWORD)v18 == 1278226534)
    goto LABEL_34;
  if ((_DWORD)v18 == 1278226536)
    goto LABEL_29;
  if ((_DWORD)v18 != 1717855600)
    goto LABEL_98;
LABEL_34:
  if ((int)v19 > 1717856626)
  {
    if ((_DWORD)v19 == 1717856627)
      goto LABEL_60;
    if ((_DWORD)v19 != 1751411059 && (_DWORD)v19 != 1751410032)
      goto LABEL_98;
LABEL_42:
    v21 = CVPixelBufferGetWidth(a3);
    v22 = CVPixelBufferGetHeight(a3);
    v23 = CVPixelBufferGetWidth(a4);
    v24 = CVPixelBufferGetHeight(a4);
    v25 = CVPixelBufferGetBytesPerRow(a3);
    v26 = CVPixelBufferGetBytesPerRow(a4);
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    if (CGRectIsEmpty(v88))
    {
      x = *MEMORY[0x24BDBEFB0];
      y = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      height = (double)v22;
      width = (double)v21;
    }
    if (width <= (double)v23 && height <= (double)v24)
    {
      if (x + width <= (double)v21 && y + height <= (double)v22)
      {
        if (a3 != a4)
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 0);
        v27 = (char *)CVPixelBufferGetBaseAddress(a3);
        v28 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (width > 0.0 && height > 0.0)
        {
          v29 = 0;
          do
          {
            v30 = 0;
            do
            {
              v31 = *(float *)&v27[4 * (unint64_t)x + 4 * v30 + v25 * ((unint64_t)y + v29)];
              if (v31 == 0.0)
                _S2 = 0.0;
              else
                _S2 = 1.0 / v31;
              __asm { FCVT            H2, S2 }
              *(_WORD *)&v28[2 * v30++ + v26 * (unint64_t)v29] = _H2;
            }
            while (width > (double)v30);
            ++v29;
          }
          while (height > (double)v29);
        }
        goto LABEL_122;
      }
LABEL_106:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219264;
        *(double *)&buf[4] = x;
        v78 = 2048;
        v79 = y;
        v80 = 2048;
        *(double *)v81 = width;
        *(_WORD *)&v81[8] = 2048;
        v82 = height;
        v83 = 1024;
        v84 = v21;
        v85 = 1024;
        v86 = v22;
        v56 = MEMORY[0x24BDACB70];
        v57 = "Dimensions mismatch. Cannot fit ROI (%f,%f,%f,%f) inside input (%d,%d)";
        v58 = 54;
LABEL_126:
        _os_log_error_impl(&dword_20B62B000, v56, OS_LOG_TYPE_ERROR, v57, buf, v58);
        return -22957;
      }
      return -22957;
    }
    goto LABEL_108;
  }
  if ((_DWORD)v19 == 1278226534)
    goto LABEL_60;
  if ((_DWORD)v19 == 1278226536)
    goto LABEL_42;
  if ((_DWORD)v19 != 1717855600)
    goto LABEL_98;
LABEL_60:
  v21 = CVPixelBufferGetWidth(a3);
  v22 = CVPixelBufferGetHeight(a3);
  v23 = CVPixelBufferGetWidth(a4);
  v24 = CVPixelBufferGetHeight(a4);
  v37 = CVPixelBufferGetBytesPerRow(a3);
  v38 = CVPixelBufferGetBytesPerRow(a4);
  v89.origin.x = x;
  v89.origin.y = y;
  v89.size.width = width;
  v89.size.height = height;
  if (CGRectIsEmpty(v89))
  {
    x = *MEMORY[0x24BDBEFB0];
    y = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    height = (double)v22;
    width = (double)v21;
  }
  if (width > (double)v23 || height > (double)v24)
    goto LABEL_108;
  if (x + width > (double)v21 || y + height > (double)v22)
    goto LABEL_106;
  if (a3 != a4)
    CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  v39 = (char *)CVPixelBufferGetBaseAddress(a3);
  v40 = (char *)CVPixelBufferGetBaseAddress(a4);
  if (width > 0.0 && height > 0.0)
  {
    v41 = 0;
    do
    {
      v42 = 0;
      do
      {
        v43 = *(float *)&v39[4 * (unint64_t)x + 4 * v42 + v37 * ((unint64_t)y + v41)];
        if (v43 == 0.0)
          v44 = 0.0;
        else
          v44 = 1.0 / v43;
        *(float *)&v40[4 * v42++ + v38 * (unint64_t)v41] = v44;
      }
      while (width > (double)v42);
      ++v41;
    }
    while (height > (double)v41);
  }
LABEL_122:
  if (a3 != a4)
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  return 0;
}

+ (int64_t)postProcessConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 rawConfidenceUnits:(unint64_t)a5 outConfidenceUnits:(unint64_t)a6 confidenceLevelRanges:(id)a7
{
  id v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t PixelFormatType;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int Width;
  int Height;
  int v26;
  int v27;
  int v28;
  int v29;
  char *v30;
  char *v31;
  unsigned int v32;
  uint64_t v33;
  float v34;
  float v35;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  int v47;
  int v48;
  char *v49;
  char *v50;
  unsigned int v51;
  uint64_t v52;
  int v54;
  int v55;
  void *v56;
  char *v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  float v61;
  float v62;
  int v65;
  int v66;
  char *v67;
  char *v68;
  unsigned int v69;
  uint64_t v70;
  float v72;
  float v74;
  float v75;
  float v76;
  int v77;
  int v78;
  char *v79;
  char *v80;
  unsigned int v81;
  uint64_t v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  int v91;
  int v92;
  char *v93;
  char *v94;
  unsigned int v95;
  uint64_t v96;
  int v97;
  int v98;
  void *v99;
  char *v100;
  unsigned int v101;
  uint64_t v102;
  unint64_t v103;
  float v104;
  float v105;
  float v106;
  int v107;
  int v108;
  char *v109;
  char *v110;
  unsigned int v111;
  uint64_t v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  int v118;
  int v119;
  char *v120;
  char *v121;
  unsigned int v122;
  uint64_t v123;
  float v124;
  float v125;
  float v126;
  float v129;
  float v130;
  float v131;
  float v132;
  int BytesPerRow;
  int v134;
  char *BaseAddress;
  char *v136;
  unsigned int v137;
  uint64_t v138;
  float v139;
  float v140;
  float v145;
  float v146;
  float v147;
  float v148;
  int v149;
  int v150;
  char *v151;
  char *v152;
  unsigned int v153;
  uint64_t v154;
  int v157;
  int v158;
  char *v159;
  char *v160;
  unsigned int v161;
  uint64_t v162;
  int v166;
  int v167;
  char *v168;
  char *v169;
  unsigned int v170;
  uint64_t v171;
  float v174;
  float v175;
  float v176;
  int v177;
  int v178;
  char *v179;
  char *v180;
  unsigned int v181;
  uint64_t v182;
  float v185;
  float v186;
  int v189;
  int v190;
  char *v191;
  char *v192;
  unsigned int v193;
  uint64_t v194;
  float v197;
  float v198;
  float v199;
  float v200;
  int v201;
  int v202;
  NSObject *v203;
  const char *v204;
  uint32_t v205;
  char *v207;
  char *v208;
  unsigned int v209;
  uint64_t v210;
  float v215;
  float v216;
  float v217;
  int v218;
  _BYTE *v219;
  _BYTE *v220;
  void **v221;
  void *__p[2];
  char v223;
  uint8_t v224[4];
  _BYTE *v225;
  __int16 v226;
  void **v227;
  _BYTE buf[12];
  __int16 v229;
  double v230;
  __int16 v231;
  _BYTE v232[10];
  double v233;
  __int16 v234;
  int v235;
  __int16 v236;
  int v237;
  uint64_t v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;

  v238 = *MEMORY[0x24BDAC8D0];
  v11 = a7;
  v12 = -22950;
  if (!a3 || !a4)
    goto LABEL_407;
  switch(a6)
  {
    case 0uLL:
      if (!a5)
        goto LABEL_22;
      if (a5 != 2)
      {
        if (a5 != 3)
          goto LABEL_407;
        v14 = *MEMORY[0x24BDBF090];
        v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
        PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        v18 = CVPixelBufferGetPixelFormatType(a4);
        v19 = v18;
        if ((int)PixelFormatType > 1717856626)
        {
          if ((_DWORD)PixelFormatType != 1717856627)
          {
            if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
              goto LABEL_273;
            goto LABEL_40;
          }
        }
        else if ((_DWORD)PixelFormatType != 1278226534)
        {
          if ((_DWORD)PixelFormatType != 1278226536)
          {
            if ((_DWORD)PixelFormatType != 1717855600)
              goto LABEL_273;
            goto LABEL_69;
          }
LABEL_40:
          if ((int)v18 <= 1717856626)
          {
            if ((_DWORD)v18 == 1278226536)
              goto LABEL_275;
            if ((_DWORD)v18 != 1717855600)
              goto LABEL_273;
          }
          else if ((_DWORD)v18 != 1717856627)
          {
            if ((_DWORD)v18 != 1751411059 && (_DWORD)v18 != 1751410032)
              goto LABEL_273;
LABEL_275:
            Width = CVPixelBufferGetWidth(a3);
            Height = CVPixelBufferGetHeight(a3);
            v26 = CVPixelBufferGetWidth(a4);
            v27 = CVPixelBufferGetHeight(a4);
            BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
            v134 = CVPixelBufferGetBytesPerRow(a4);
            v248.origin.x = v14;
            v248.origin.y = v13;
            v248.size.width = v16;
            v248.size.height = v15;
            if (CGRectIsEmpty(v248))
            {
              v14 = *MEMORY[0x24BDBEFB0];
              v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
              v15 = (double)Height;
              v16 = (double)Width;
            }
            if (v16 > (double)v26 || v15 > (double)v27)
              goto LABEL_405;
            if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
              goto LABEL_403;
            if (a3 != a4)
              CVPixelBufferLockBaseAddress(a3, 1uLL);
            CVPixelBufferLockBaseAddress(a4, 0);
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
            v136 = (char *)CVPixelBufferGetBaseAddress(a4);
            if (v16 > 0.0 && v15 > 0.0)
            {
              v137 = 0;
              do
              {
                v138 = 0;
                do
                {
                  _H3 = *(_WORD *)&BaseAddress[2 * (unint64_t)v14
                                             + 2 * v138
                                             + BytesPerRow * ((unint64_t)v13 + v137)];
                  __asm { FCVT            S4, H3 }
                  v145 = 1.0;
                  if (_S4 <= 0.0)
                  {
                    v146 = (float)((float)(_S4 * 0.0019531) + 1.0) * (float)((float)(_S4 * 0.0019531) + 1.0);
                    v147 = (float)((float)(v146 * v146) * (float)(v146 * v146))
                         * (float)((float)(v146 * v146) * (float)(v146 * v146));
                    v148 = (float)((float)(v147 * v147) * (float)(v147 * v147))
                         * (float)((float)(v147 * v147) * (float)(v147 * v147));
                    v145 = v148 * v148;
                  }
                  v139 = 1.0 - v145;
                  if (v139 <= 1.0)
                    v140 = v139;
                  else
                    v140 = 1.0;
                  if (v139 >= 0.0)
                    _S3 = v140;
                  else
                    _S3 = 0.0;
                  __asm { FCVT            H3, S3 }
                  *(_WORD *)&v136[2 * v138++ + v134 * (unint64_t)v137] = _H3;
                }
                while (v16 > (double)v138);
                ++v137;
              }
              while (v15 > (double)v137);
            }
            goto LABEL_420;
          }
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v118 = CVPixelBufferGetBytesPerRow(a3);
          v119 = CVPixelBufferGetBytesPerRow(a4);
          v247.origin.x = v14;
          v247.origin.y = v13;
          v247.size.width = v16;
          v247.size.height = v15;
          if (CGRectIsEmpty(v247))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v16 = (double)Width;
            v15 = (double)Height;
          }
          if (v16 > (double)v26 || v15 > (double)v27)
            goto LABEL_405;
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
            goto LABEL_403;
          if (a3 != a4)
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          v120 = (char *)CVPixelBufferGetBaseAddress(a3);
          v121 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            v122 = 0;
            do
            {
              v123 = 0;
              do
              {
                _H3 = *(_WORD *)&v120[2 * (unint64_t)v14 + 2 * v123 + v118 * ((unint64_t)v13 + v122)];
                __asm { FCVT            S4, H3 }
                v129 = 1.0;
                if (_S4 <= 0.0)
                {
                  v130 = (float)((float)(_S4 * 0.0019531) + 1.0) * (float)((float)(_S4 * 0.0019531) + 1.0);
                  v131 = (float)((float)(v130 * v130) * (float)(v130 * v130))
                       * (float)((float)(v130 * v130) * (float)(v130 * v130));
                  v132 = (float)((float)(v131 * v131) * (float)(v131 * v131))
                       * (float)((float)(v131 * v131) * (float)(v131 * v131));
                  v129 = v132 * v132;
                }
                v124 = 1.0 - v129;
                if (v124 <= 1.0)
                  v125 = v124;
                else
                  v125 = 1.0;
                if (v124 >= 0.0)
                  v126 = v125;
                else
                  v126 = 0.0;
                *(float *)&v121[4 * v123++ + v119 * (unint64_t)v122] = v126;
              }
              while (v16 > (double)v123);
              ++v122;
            }
            while (v15 > (double)v122);
          }
          goto LABEL_420;
        }
LABEL_69:
        if ((int)v18 <= 1717856626)
        {
          if ((_DWORD)v18 != 1278226534)
          {
            if ((_DWORD)v18 != 1278226536)
            {
              if ((_DWORD)v18 != 1717855600)
                goto LABEL_273;
              goto LABEL_175;
            }
LABEL_92:
            Width = CVPixelBufferGetWidth(a3);
            Height = CVPixelBufferGetHeight(a3);
            v26 = CVPixelBufferGetWidth(a4);
            v27 = CVPixelBufferGetHeight(a4);
            v28 = CVPixelBufferGetBytesPerRow(a3);
            v29 = CVPixelBufferGetBytesPerRow(a4);
            v239.origin.x = v14;
            v239.origin.y = v13;
            v239.size.width = v16;
            v239.size.height = v15;
            if (CGRectIsEmpty(v239))
            {
              v14 = *MEMORY[0x24BDBEFB0];
              v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
              v16 = (double)Width;
              v15 = (double)Height;
            }
            if (v16 > (double)v26 || v15 > (double)v27)
              goto LABEL_405;
            if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
              goto LABEL_403;
            if (a3 != a4)
              CVPixelBufferLockBaseAddress(a3, 1uLL);
            CVPixelBufferLockBaseAddress(a4, 0);
            v30 = (char *)CVPixelBufferGetBaseAddress(a3);
            v31 = (char *)CVPixelBufferGetBaseAddress(a4);
            if (v16 > 0.0 && v15 > 0.0)
            {
              v32 = 0;
              do
              {
                v33 = 0;
                do
                {
                  v42 = *(float *)&v30[4 * (unint64_t)v14 + 4 * v33 + v28 * ((unint64_t)v13 + v32)];
                  v43 = 1.0;
                  if (v42 <= 0.0)
                  {
                    v44 = (float)((float)(v42 * 0.0019531) + 1.0) * (float)((float)(v42 * 0.0019531) + 1.0);
                    v45 = (float)((float)(v44 * v44) * (float)(v44 * v44))
                        * (float)((float)(v44 * v44) * (float)(v44 * v44));
                    v46 = (float)((float)(v45 * v45) * (float)(v45 * v45))
                        * (float)((float)(v45 * v45) * (float)(v45 * v45));
                    v43 = v46 * v46;
                  }
                  v34 = 1.0 - v43;
                  if (v34 <= 1.0)
                    v35 = v34;
                  else
                    v35 = 1.0;
                  if (v34 >= 0.0)
                    _S3 = v35;
                  else
                    _S3 = 0.0;
                  __asm { FCVT            H3, S3 }
                  *(_WORD *)&v31[2 * v33++ + v29 * (unint64_t)v32] = _H3;
                }
                while (v16 > (double)v33);
                ++v32;
              }
              while (v15 > (double)v32);
            }
            goto LABEL_420;
          }
LABEL_175:
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v77 = CVPixelBufferGetBytesPerRow(a3);
          v78 = CVPixelBufferGetBytesPerRow(a4);
          v243.origin.x = v14;
          v243.origin.y = v13;
          v243.size.width = v16;
          v243.size.height = v15;
          if (CGRectIsEmpty(v243))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v16 = (double)Width;
            v15 = (double)Height;
          }
          if (v16 > (double)v26 || v15 > (double)v27)
            goto LABEL_405;
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
            goto LABEL_403;
          if (a3 != a4)
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          v79 = (char *)CVPixelBufferGetBaseAddress(a3);
          v80 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            v81 = 0;
            do
            {
              v82 = 0;
              do
              {
                v86 = *(float *)&v79[4 * (unint64_t)v14 + 4 * v82 + v77 * ((unint64_t)v13 + v81)];
                v87 = 1.0;
                if (v86 <= 0.0)
                {
                  v88 = (float)((float)(v86 * 0.0019531) + 1.0) * (float)((float)(v86 * 0.0019531) + 1.0);
                  v89 = (float)((float)(v88 * v88) * (float)(v88 * v88))
                      * (float)((float)(v88 * v88) * (float)(v88 * v88));
                  v90 = (float)((float)(v89 * v89) * (float)(v89 * v89))
                      * (float)((float)(v89 * v89) * (float)(v89 * v89));
                  v87 = v90 * v90;
                }
                v83 = 1.0 - v87;
                if (v83 <= 1.0)
                  v84 = v83;
                else
                  v84 = 1.0;
                if (v83 >= 0.0)
                  v85 = v84;
                else
                  v85 = 0.0;
                *(float *)&v80[4 * v82++ + v78 * (unint64_t)v81] = v85;
              }
              while (v16 > (double)v82);
              ++v81;
            }
            while (v15 > (double)v81);
          }
          goto LABEL_420;
        }
        if ((_DWORD)v18 == 1717856627)
          goto LABEL_175;
        if ((_DWORD)v18 == 1751411059 || (_DWORD)v18 == 1751410032)
          goto LABEL_92;
LABEL_273:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_396;
        goto LABEL_423;
      }
      v14 = *MEMORY[0x24BDBF090];
      v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      v22 = CVPixelBufferGetPixelFormatType(a4);
      v19 = v22;
      if ((int)PixelFormatType > 1717856626)
      {
        if ((_DWORD)PixelFormatType != 1717856627)
        {
          if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
            goto LABEL_354;
          goto LABEL_56;
        }
      }
      else if ((_DWORD)PixelFormatType != 1278226534)
      {
        if ((_DWORD)PixelFormatType != 1278226536)
        {
          if ((_DWORD)PixelFormatType != 1717855600)
            goto LABEL_354;
          goto LABEL_79;
        }
LABEL_56:
        if ((int)v22 <= 1717856626)
        {
          if ((_DWORD)v22 == 1278226536)
            goto LABEL_356;
          if ((_DWORD)v22 != 1717855600)
            goto LABEL_354;
        }
        else if ((_DWORD)v22 != 1717856627)
        {
          if ((_DWORD)v22 != 1751411059 && (_DWORD)v22 != 1751410032)
            goto LABEL_354;
LABEL_356:
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v177 = CVPixelBufferGetBytesPerRow(a3);
          v178 = CVPixelBufferGetBytesPerRow(a4);
          v252.origin.x = v14;
          v252.origin.y = v13;
          v252.size.width = v16;
          v252.size.height = v15;
          if (CGRectIsEmpty(v252))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v15 = (double)Height;
            v16 = (double)Width;
          }
          if (v16 > (double)v26 || v15 > (double)v27)
            goto LABEL_405;
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
            goto LABEL_403;
          if (a3 != a4)
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          v179 = (char *)CVPixelBufferGetBaseAddress(a3);
          v180 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            v181 = 0;
            do
            {
              v182 = 0;
              do
              {
                _H2 = *(_WORD *)&v179[2 * (unint64_t)v14 + 2 * v182 + v177 * ((unint64_t)v13 + v181)];
                __asm { FCVT            S2, H2 }
                v185 = 1.0 - _S2;
                if (v185 <= 1.0)
                  v186 = v185;
                else
                  v186 = 1.0;
                if (v185 >= 0.0)
                  _S2 = v186;
                else
                  _S2 = 0.0;
                __asm { FCVT            H2, S2 }
                *(_WORD *)&v180[2 * v182++ + v178 * (unint64_t)v181] = _H2;
              }
              while (v16 > (double)v182);
              ++v181;
            }
            while (v15 > (double)v181);
          }
          goto LABEL_420;
        }
        Width = CVPixelBufferGetWidth(a3);
        Height = CVPixelBufferGetHeight(a3);
        v26 = CVPixelBufferGetWidth(a4);
        v27 = CVPixelBufferGetHeight(a4);
        v166 = CVPixelBufferGetBytesPerRow(a3);
        v167 = CVPixelBufferGetBytesPerRow(a4);
        v251.origin.x = v14;
        v251.origin.y = v13;
        v251.size.width = v16;
        v251.size.height = v15;
        if (CGRectIsEmpty(v251))
        {
          v14 = *MEMORY[0x24BDBEFB0];
          v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
          v16 = (double)Width;
          v15 = (double)Height;
        }
        if (v16 > (double)v26 || v15 > (double)v27)
          goto LABEL_405;
        if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
          goto LABEL_403;
        if (a3 != a4)
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 0);
        v168 = (char *)CVPixelBufferGetBaseAddress(a3);
        v169 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (v16 > 0.0 && v15 > 0.0)
        {
          v170 = 0;
          do
          {
            v171 = 0;
            do
            {
              _H2 = *(_WORD *)&v168[2 * (unint64_t)v14 + 2 * v171 + v166 * ((unint64_t)v13 + v170)];
              __asm { FCVT            S2, H2 }
              v174 = 1.0 - _S2;
              if (v174 <= 1.0)
                v175 = v174;
              else
                v175 = 1.0;
              if (v174 >= 0.0)
                v176 = v175;
              else
                v176 = 0.0;
              *(float *)&v169[4 * v171++ + v167 * (unint64_t)v170] = v176;
            }
            while (v16 > (double)v171);
            ++v170;
          }
          while (v15 > (double)v170);
        }
        goto LABEL_420;
      }
LABEL_79:
      if ((int)v22 <= 1717856626)
      {
        if ((_DWORD)v22 == 1278226534)
          goto LABEL_212;
        if ((_DWORD)v22 != 1278226536)
        {
          if ((_DWORD)v22 != 1717855600)
            goto LABEL_354;
LABEL_212:
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v97 = CVPixelBufferGetBytesPerRow(a3);
          v98 = CVPixelBufferGetBytesPerRow(a4);
          v245.origin.x = v14;
          v245.origin.y = v13;
          v245.size.width = v16;
          v245.size.height = v15;
          if (CGRectIsEmpty(v245))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v16 = (double)Width;
            v15 = (double)Height;
          }
          if (v16 > (double)v26 || v15 > (double)v27)
            goto LABEL_405;
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
            goto LABEL_403;
          if (a3 != a4)
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          v99 = CVPixelBufferGetBaseAddress(a3);
          v100 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            v101 = 0;
            do
            {
              v102 = 0;
              do
              {
                v103 = (unint64_t)v99 + 4 * (unint64_t)v14 + v97 * ((unint64_t)v13 + v101);
                v104 = 1.0 - *(float *)(v103 + 4 * v102);
                if (v104 <= 1.0)
                  v105 = 1.0 - *(float *)(v103 + 4 * v102);
                else
                  v105 = 1.0;
                if (v104 >= 0.0)
                  v106 = v105;
                else
                  v106 = 0.0;
                *(float *)&v100[4 * v102++ + v98 * (unint64_t)v101] = v106;
              }
              while (v16 > (double)v102);
              ++v101;
            }
            while (v15 > (double)v101);
          }
          goto LABEL_420;
        }
LABEL_135:
        Width = CVPixelBufferGetWidth(a3);
        Height = CVPixelBufferGetHeight(a3);
        v26 = CVPixelBufferGetWidth(a4);
        v27 = CVPixelBufferGetHeight(a4);
        v54 = CVPixelBufferGetBytesPerRow(a3);
        v55 = CVPixelBufferGetBytesPerRow(a4);
        v241.origin.x = v14;
        v241.origin.y = v13;
        v241.size.width = v16;
        v241.size.height = v15;
        if (CGRectIsEmpty(v241))
        {
          v14 = *MEMORY[0x24BDBEFB0];
          v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
          v16 = (double)Width;
          v15 = (double)Height;
        }
        if (v16 > (double)v26 || v15 > (double)v27)
          goto LABEL_405;
        if (v14 + v16 > (double)Width || v13 + v15 > (double)Height)
          goto LABEL_403;
        if (a3 != a4)
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 0);
        v56 = CVPixelBufferGetBaseAddress(a3);
        v57 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (v16 > 0.0 && v15 > 0.0)
        {
          v58 = 0;
          do
          {
            v59 = 0;
            do
            {
              v60 = (unint64_t)v56 + 4 * (unint64_t)v14 + v54 * ((unint64_t)v13 + v58);
              v61 = 1.0 - *(float *)(v60 + 4 * v59);
              if (v61 <= 1.0)
                v62 = 1.0 - *(float *)(v60 + 4 * v59);
              else
                v62 = 1.0;
              if (v61 >= 0.0)
                _S2 = v62;
              else
                _S2 = 0.0;
              __asm { FCVT            H2, S2 }
              *(_WORD *)&v57[2 * v59++ + v55 * (unint64_t)v58] = _H2;
            }
            while (v16 > (double)v59);
            ++v58;
          }
          while (v15 > (double)v58);
        }
        goto LABEL_420;
      }
      if ((_DWORD)v22 == 1717856627)
        goto LABEL_212;
      if ((_DWORD)v22 == 1751411059 || (_DWORD)v22 == 1751410032)
        goto LABEL_135;
LABEL_354:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_396;
LABEL_423:
      PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
      v218 = SHIBYTE(v231);
      v219 = *(_BYTE **)buf;
      PixelBufferUtils::pixelFormatAsString(v19, (char *)__p);
      v220 = buf;
      if (v218 < 0)
        v220 = v219;
      if (v223 >= 0)
        v221 = __p;
      else
        v221 = (void **)__p[0];
      *(_DWORD *)v224 = 136446466;
      v225 = v220;
      v226 = 2082;
      v227 = v221;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unsupported map format (%{public}s, %{public}s)", v224, 0x16u);
      if (v223 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v231) < 0)
        operator delete(*(void **)buf);
LABEL_396:
      v12 = -22956;
      goto LABEL_407;
    case 1uLL:
      v20 = +[ADUtils convertToLevelsConfidence:confidenceOutput:confidenceLevelRanges:](ADUtils, "convertToLevelsConfidence:confidenceOutput:confidenceLevelRanges:", a3, a4, v11);
      goto LABEL_23;
    case 2uLL:
      if (a5 == 3)
      {
        v14 = *MEMORY[0x24BDBF090];
        v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
        PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        v23 = CVPixelBufferGetPixelFormatType(a4);
        v19 = v23;
        if ((int)PixelFormatType > 1717856626)
        {
          if ((_DWORD)PixelFormatType != 1717856627)
          {
            if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
              goto LABEL_395;
            goto LABEL_64;
          }
        }
        else if ((_DWORD)PixelFormatType != 1278226534)
        {
          if ((_DWORD)PixelFormatType != 1278226536)
          {
            if ((_DWORD)PixelFormatType != 1717855600)
              goto LABEL_395;
            goto LABEL_84;
          }
LABEL_64:
          if ((int)v23 <= 1717856626)
          {
            if ((_DWORD)v23 == 1278226536)
              goto LABEL_397;
            if ((_DWORD)v23 != 1717855600)
              goto LABEL_395;
          }
          else if ((_DWORD)v23 != 1717856627)
          {
            if ((_DWORD)v23 != 1751411059 && (_DWORD)v23 != 1751410032)
              goto LABEL_395;
LABEL_397:
            Width = CVPixelBufferGetWidth(a3);
            Height = CVPixelBufferGetHeight(a3);
            v26 = CVPixelBufferGetWidth(a4);
            v27 = CVPixelBufferGetHeight(a4);
            v201 = CVPixelBufferGetBytesPerRow(a3);
            v202 = CVPixelBufferGetBytesPerRow(a4);
            v254.origin.x = v14;
            v254.origin.y = v13;
            v254.size.width = v16;
            v254.size.height = v15;
            if (CGRectIsEmpty(v254))
            {
              v14 = *MEMORY[0x24BDBEFB0];
              v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
              v15 = (double)Height;
              v16 = (double)Width;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4)
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                CVPixelBufferLockBaseAddress(a4, 0);
                v207 = (char *)CVPixelBufferGetBaseAddress(a3);
                v208 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  v209 = 0;
                  do
                  {
                    v210 = 0;
                    do
                    {
                      _H2 = *(_WORD *)&v207[2 * (unint64_t)v14 + 2 * v210 + v201 * ((unint64_t)v13 + v209)];
                      __asm { FCVT            S3, H2 }
                      _S2 = 1.0;
                      if (_S3 <= 0.0)
                      {
                        v215 = (float)((float)(_S3 * 0.0019531) + 1.0) * (float)((float)(_S3 * 0.0019531) + 1.0);
                        v216 = (float)((float)(v215 * v215) * (float)(v215 * v215))
                             * (float)((float)(v215 * v215) * (float)(v215 * v215));
                        v217 = (float)((float)(v216 * v216) * (float)(v216 * v216))
                             * (float)((float)(v216 * v216) * (float)(v216 * v216));
                        _S2 = v217 * v217;
                      }
                      __asm { FCVT            H2, S2 }
                      *(_WORD *)&v208[2 * v210++ + v202 * (unint64_t)v209] = _H2;
                    }
                    while (v16 > (double)v210);
                    ++v209;
                  }
                  while (v15 > (double)v209);
                }
                goto LABEL_420;
              }
              goto LABEL_403;
            }
            goto LABEL_405;
          }
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v189 = CVPixelBufferGetBytesPerRow(a3);
          v190 = CVPixelBufferGetBytesPerRow(a4);
          v253.origin.x = v14;
          v253.origin.y = v13;
          v253.size.width = v16;
          v253.size.height = v15;
          if (CGRectIsEmpty(v253))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v16 = (double)Width;
            v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4)
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              CVPixelBufferLockBaseAddress(a4, 0);
              v191 = (char *)CVPixelBufferGetBaseAddress(a3);
              v192 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                v193 = 0;
                do
                {
                  v194 = 0;
                  do
                  {
                    _H2 = *(_WORD *)&v191[2 * (unint64_t)v14 + 2 * v194 + v189 * ((unint64_t)v13 + v193)];
                    __asm { FCVT            S3, H2 }
                    v197 = 1.0;
                    if (_S3 <= 0.0)
                    {
                      v198 = (float)((float)(_S3 * 0.0019531) + 1.0) * (float)((float)(_S3 * 0.0019531) + 1.0);
                      v199 = (float)((float)(v198 * v198) * (float)(v198 * v198))
                           * (float)((float)(v198 * v198) * (float)(v198 * v198));
                      v200 = (float)((float)(v199 * v199) * (float)(v199 * v199))
                           * (float)((float)(v199 * v199) * (float)(v199 * v199));
                      v197 = v200 * v200;
                    }
                    *(float *)&v192[4 * v194++ + v190 * (unint64_t)v193] = v197;
                  }
                  while (v16 > (double)v194);
                  ++v193;
                }
                while (v15 > (double)v193);
              }
              goto LABEL_420;
            }
            goto LABEL_403;
          }
          goto LABEL_405;
        }
LABEL_84:
        if ((int)v23 <= 1717856626)
        {
          if ((_DWORD)v23 == 1278226534)
            goto LABEL_233;
          if ((_DWORD)v23 != 1278226536)
          {
            if ((_DWORD)v23 != 1717855600)
              goto LABEL_395;
LABEL_233:
            Width = CVPixelBufferGetWidth(a3);
            Height = CVPixelBufferGetHeight(a3);
            v26 = CVPixelBufferGetWidth(a4);
            v27 = CVPixelBufferGetHeight(a4);
            v107 = CVPixelBufferGetBytesPerRow(a3);
            v108 = CVPixelBufferGetBytesPerRow(a4);
            v246.origin.x = v14;
            v246.origin.y = v13;
            v246.size.width = v16;
            v246.size.height = v15;
            if (CGRectIsEmpty(v246))
            {
              v14 = *MEMORY[0x24BDBEFB0];
              v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
              v16 = (double)Width;
              v15 = (double)Height;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4)
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                CVPixelBufferLockBaseAddress(a4, 0);
                v109 = (char *)CVPixelBufferGetBaseAddress(a3);
                v110 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  v111 = 0;
                  do
                  {
                    v112 = 0;
                    do
                    {
                      v113 = *(float *)&v109[4 * (unint64_t)v14
                                           + 4 * v112
                                           + v107 * ((unint64_t)v13 + v111)];
                      v114 = 1.0;
                      if (v113 <= 0.0)
                      {
                        v115 = (float)((float)(v113 * 0.0019531) + 1.0) * (float)((float)(v113 * 0.0019531) + 1.0);
                        v116 = (float)((float)(v115 * v115) * (float)(v115 * v115))
                             * (float)((float)(v115 * v115) * (float)(v115 * v115));
                        v117 = (float)((float)(v116 * v116) * (float)(v116 * v116))
                             * (float)((float)(v116 * v116) * (float)(v116 * v116));
                        v114 = v117 * v117;
                      }
                      *(float *)&v110[4 * v112++ + v108 * (unint64_t)v111] = v114;
                    }
                    while (v16 > (double)v112);
                    ++v111;
                  }
                  while (v15 > (double)v111);
                }
                goto LABEL_420;
              }
              goto LABEL_403;
            }
            goto LABEL_405;
          }
          goto LABEL_159;
        }
        if ((_DWORD)v23 == 1717856627)
          goto LABEL_233;
        if ((_DWORD)v23 == 1751411059 || (_DWORD)v23 == 1751410032)
        {
LABEL_159:
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v65 = CVPixelBufferGetBytesPerRow(a3);
          v66 = CVPixelBufferGetBytesPerRow(a4);
          v242.origin.x = v14;
          v242.origin.y = v13;
          v242.size.width = v16;
          v242.size.height = v15;
          if (CGRectIsEmpty(v242))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v16 = (double)Width;
            v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4)
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              CVPixelBufferLockBaseAddress(a4, 0);
              v67 = (char *)CVPixelBufferGetBaseAddress(a3);
              v68 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                v69 = 0;
                do
                {
                  v70 = 0;
                  do
                  {
                    v72 = *(float *)&v67[4 * (unint64_t)v14 + 4 * v70 + v65 * ((unint64_t)v13 + v69)];
                    _S2 = 1.0;
                    if (v72 <= 0.0)
                    {
                      v74 = (float)((float)(v72 * 0.0019531) + 1.0) * (float)((float)(v72 * 0.0019531) + 1.0);
                      v75 = (float)((float)(v74 * v74) * (float)(v74 * v74))
                          * (float)((float)(v74 * v74) * (float)(v74 * v74));
                      v76 = (float)((float)(v75 * v75) * (float)(v75 * v75))
                          * (float)((float)(v75 * v75) * (float)(v75 * v75));
                      _S2 = v76 * v76;
                    }
                    __asm { FCVT            H2, S2 }
                    *(_WORD *)&v68[2 * v70++ + v66 * (unint64_t)v69] = _H2;
                  }
                  while (v16 > (double)v70);
                  ++v69;
                }
                while (v15 > (double)v69);
              }
              goto LABEL_420;
            }
            goto LABEL_403;
          }
          goto LABEL_405;
        }
LABEL_395:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_423;
        goto LABEL_396;
      }
      if (a5 != 2)
      {
        if (a5)
          goto LABEL_407;
        v14 = *MEMORY[0x24BDBF090];
        v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
        PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        v21 = CVPixelBufferGetPixelFormatType(a4);
        v19 = v21;
        if ((int)PixelFormatType > 1717856626)
        {
          if ((_DWORD)PixelFormatType != 1717856627)
          {
            if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
              goto LABEL_314;
            goto LABEL_48;
          }
        }
        else if ((_DWORD)PixelFormatType != 1278226534)
        {
          if ((_DWORD)PixelFormatType != 1278226536)
          {
            if ((_DWORD)PixelFormatType != 1717855600)
              goto LABEL_314;
            goto LABEL_74;
          }
LABEL_48:
          if ((int)v21 <= 1717856626)
          {
            if ((_DWORD)v21 == 1278226536)
              goto LABEL_316;
            if ((_DWORD)v21 != 1717855600)
              goto LABEL_314;
          }
          else if ((_DWORD)v21 != 1717856627)
          {
            if ((_DWORD)v21 != 1751411059 && (_DWORD)v21 != 1751410032)
              goto LABEL_314;
LABEL_316:
            Width = CVPixelBufferGetWidth(a3);
            Height = CVPixelBufferGetHeight(a3);
            v26 = CVPixelBufferGetWidth(a4);
            v27 = CVPixelBufferGetHeight(a4);
            v157 = CVPixelBufferGetBytesPerRow(a3);
            v158 = CVPixelBufferGetBytesPerRow(a4);
            v250.origin.x = v14;
            v250.origin.y = v13;
            v250.size.width = v16;
            v250.size.height = v15;
            if (CGRectIsEmpty(v250))
            {
              v14 = *MEMORY[0x24BDBEFB0];
              v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
              v15 = (double)Height;
              v16 = (double)Width;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4)
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                CVPixelBufferLockBaseAddress(a4, 0);
                v159 = (char *)CVPixelBufferGetBaseAddress(a3);
                v160 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  v161 = 0;
                  do
                  {
                    v162 = 0;
                    do
                    {
                      _H1 = *(_WORD *)&v159[2 * (unint64_t)v14 + 2 * v162 + v157 * ((unint64_t)v13 + v161)];
                      __asm { FCVT            S1, H1 }
                      _S1 = 1.0 - _S1;
                      __asm { FCVT            H1, S1 }
                      *(_WORD *)&v160[2 * v162++ + v158 * (unint64_t)v161] = LOWORD(_S1);
                    }
                    while (v16 > (double)v162);
                    ++v161;
                  }
                  while (v15 > (double)v161);
                }
                goto LABEL_420;
              }
              goto LABEL_403;
            }
            goto LABEL_405;
          }
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v149 = CVPixelBufferGetBytesPerRow(a3);
          v150 = CVPixelBufferGetBytesPerRow(a4);
          v249.origin.x = v14;
          v249.origin.y = v13;
          v249.size.width = v16;
          v249.size.height = v15;
          if (CGRectIsEmpty(v249))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v16 = (double)Width;
            v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4)
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              CVPixelBufferLockBaseAddress(a4, 0);
              v151 = (char *)CVPixelBufferGetBaseAddress(a3);
              v152 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                v153 = 0;
                do
                {
                  v154 = 0;
                  do
                  {
                    _H1 = *(_WORD *)&v151[2 * (unint64_t)v14 + 2 * v154 + v149 * ((unint64_t)v13 + v153)];
                    __asm { FCVT            S1, H1 }
                    *(float *)&v152[4 * v154++ + v150 * (unint64_t)v153] = 1.0 - _S1;
                  }
                  while (v16 > (double)v154);
                  ++v153;
                }
                while (v15 > (double)v153);
              }
              goto LABEL_420;
            }
            goto LABEL_403;
          }
          goto LABEL_405;
        }
LABEL_74:
        if ((int)v21 <= 1717856626)
        {
          if ((_DWORD)v21 == 1278226534)
            goto LABEL_197;
          if ((_DWORD)v21 != 1278226536)
          {
            if ((_DWORD)v21 != 1717855600)
              goto LABEL_314;
LABEL_197:
            Width = CVPixelBufferGetWidth(a3);
            Height = CVPixelBufferGetHeight(a3);
            v26 = CVPixelBufferGetWidth(a4);
            v27 = CVPixelBufferGetHeight(a4);
            v91 = CVPixelBufferGetBytesPerRow(a3);
            v92 = CVPixelBufferGetBytesPerRow(a4);
            v244.origin.x = v14;
            v244.origin.y = v13;
            v244.size.width = v16;
            v244.size.height = v15;
            if (CGRectIsEmpty(v244))
            {
              v14 = *MEMORY[0x24BDBEFB0];
              v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
              v16 = (double)Width;
              v15 = (double)Height;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4)
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                CVPixelBufferLockBaseAddress(a4, 0);
                v93 = (char *)CVPixelBufferGetBaseAddress(a3);
                v94 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  v95 = 0;
                  do
                  {
                    v96 = 0;
                    do
                    {
                      *(float *)&v94[4 * v96 + v92 * (unint64_t)v95] = 1.0
                                                                            - *(float *)&v93[4 * (unint64_t)v14
                                                                                           + 4 * v96
                                                                                           + v91
                                                                                           * ((unint64_t)v13 + v95)];
                      ++v96;
                    }
                    while (v16 > (double)v96);
                    ++v95;
                  }
                  while (v15 > (double)v95);
                }
LABEL_420:
                if (a3 != a4)
                  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
                CVPixelBufferUnlockBaseAddress(a4, 0);
                v12 = 0;
                goto LABEL_407;
              }
              goto LABEL_403;
            }
            goto LABEL_405;
          }
          goto LABEL_117;
        }
        if ((_DWORD)v21 == 1717856627)
          goto LABEL_197;
        if ((_DWORD)v21 == 1751411059 || (_DWORD)v21 == 1751410032)
        {
LABEL_117:
          Width = CVPixelBufferGetWidth(a3);
          Height = CVPixelBufferGetHeight(a3);
          v26 = CVPixelBufferGetWidth(a4);
          v27 = CVPixelBufferGetHeight(a4);
          v47 = CVPixelBufferGetBytesPerRow(a3);
          v48 = CVPixelBufferGetBytesPerRow(a4);
          v240.origin.x = v14;
          v240.origin.y = v13;
          v240.size.width = v16;
          v240.size.height = v15;
          if (CGRectIsEmpty(v240))
          {
            v14 = *MEMORY[0x24BDBEFB0];
            v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            v16 = (double)Width;
            v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4)
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              CVPixelBufferLockBaseAddress(a4, 0);
              v49 = (char *)CVPixelBufferGetBaseAddress(a3);
              v50 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                v51 = 0;
                do
                {
                  v52 = 0;
                  do
                  {
                    _S1 = 1.0
                        - *(float *)&v49[4 * (unint64_t)v14 + 4 * v52 + v47 * ((unint64_t)v13 + v51)];
                    __asm { FCVT            H1, S1 }
                    *(_WORD *)&v50[2 * v52++ + v48 * (unint64_t)v51] = LOWORD(_S1);
                  }
                  while (v16 > (double)v52);
                  ++v51;
                }
                while (v15 > (double)v51);
              }
              goto LABEL_420;
            }
LABEL_403:
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134219264;
              *(double *)&buf[4] = v14;
              v229 = 2048;
              v230 = v13;
              v231 = 2048;
              *(double *)v232 = v16;
              *(_WORD *)&v232[8] = 2048;
              v233 = v15;
              v234 = 1024;
              v235 = Width;
              v236 = 1024;
              v237 = Height;
              v203 = MEMORY[0x24BDACB70];
              v204 = "Dimensions mismatch. Cannot fit ROI (%f,%f,%f,%f) inside input (%d,%d)";
              v205 = 54;
LABEL_409:
              _os_log_error_impl(&dword_20B62B000, v203, OS_LOG_TYPE_ERROR, v204, buf, v205);
              v12 = -22957;
              goto LABEL_407;
            }
            goto LABEL_406;
          }
LABEL_405:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218752;
            *(double *)&buf[4] = v16;
            v229 = 2048;
            v230 = v15;
            v231 = 1024;
            *(_DWORD *)v232 = v26;
            *(_WORD *)&v232[4] = 1024;
            *(_DWORD *)&v232[6] = v27;
            v203 = MEMORY[0x24BDACB70];
            v204 = "Dimensions mismatch. Cannot fit ROI (%f,%f) inside output (%d,%d)";
            v205 = 34;
            goto LABEL_409;
          }
LABEL_406:
          v12 = -22957;
          goto LABEL_407;
        }
LABEL_314:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_396;
        goto LABEL_423;
      }
LABEL_22:
      v20 = copyModifyPixelBuffer<&(postProcessingNone(float))>(a3, a4, *MEMORY[0x24BDBF090], *(CGFloat *)(MEMORY[0x24BDBF090] + 8), *(CGFloat *)(MEMORY[0x24BDBF090] + 16), *(CGFloat *)(MEMORY[0x24BDBF090] + 24));
LABEL_23:
      v12 = v20;
LABEL_407:

      return v12;
    case 3uLL:
      if (a5 == 3)
        goto LABEL_22;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Conversion to kADConfidenceUnitsLogarithmicVariance from other units is not supported", buf, 2u);
      }
      v12 = -22951;
      goto LABEL_407;
    default:
      goto LABEL_407;
  }
}

+ (int64_t)postProcessNormals:(__CVBuffer *)a3 normalsOutput:(__CVBuffer *)a4 normalsRotation:(int64_t)a5
{
  int64_t result;
  unint64_t PixelFormatType;
  unint64_t v10;
  void **v11;
  void *__p[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = -22953;
  if (a3 && a4)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v10 = PixelFormatType;
    if (((_DWORD)PixelFormatType == 1717856627 || (_DWORD)PixelFormatType == 1717855600)
      && (_DWORD)PixelFormatType == CVPixelBufferGetPixelFormatType(a4))
    {
      return +[ADUtils copyModifyNormalsPixelBuffer:output:normalsRotation:](ADUtils, "copyModifyNormalsPixelBuffer:output:normalsRotation:", a3, a4, a5);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        PixelBufferUtils::pixelFormatAsString(v10, (char *)__p);
        if (v13 >= 0)
          v11 = __p;
        else
          v11 = (void **)__p[0];
        *(_DWORD *)buf = 136446210;
        v15 = v11;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "only 32bit float supported for normals (provided: %{public}s)", buf, 0xCu);
        if (v13 < 0)
          operator delete(__p[0]);
      }
      return -22956;
    }
  }
  return result;
}

+ (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 normals:(__CVBuffer *)a5 depthOutput:(__CVBuffer *)a6 confidenceOutput:(__CVBuffer *)a7 normalsOutput:(__CVBuffer *)a8 normalsRotation:(int64_t)a9 rawConfidenceUnits:(unint64_t)a10 outConfidenceUnits:(unint64_t)a11 confidenceLevelRanges:(id)a12
{
  id v18;
  int64_t v19;

  v18 = a12;
  v19 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", a3, a6);
  if (!v19
    && (!a4
     || !a7
     || (v19 = +[ADUtils postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:](ADUtils, "postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:", a4, a7, a10, a11, v18)) == 0)&& (!a5|| !a8|| (v19 = +[ADUtils postProcessNormals:normalsOutput:normalsRotation:](ADUtils, "postProcessNormals:normalsOutput:normalsRotation:", a5, a8, a9)) == 0))
  {
    v19 = 0;
  }

  return v19;
}

+ (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 currNormals:(__CVBuffer *)a5 prevNormals:(__CVBuffer *)a6 opticalFlow:(__CVBuffer *)a7 alphaMap:(__CVBuffer *)a8 defaultAlpha:(float)a9 depthOutput:(__CVBuffer *)pixelBuffer normalsOutput:(__CVBuffer *)a11
{
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
  int64_t result;
  int v20;
  unint64_t PixelFormatType;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  size_t Width;
  size_t Height;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  size_t v34;
  size_t v35;
  size_t v36;
  size_t v37;
  float v38;
  unint64_t v39;
  __int16 *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  float v53;
  float v54;
  BOOL v56;
  float v57;
  float v58;
  float32x4_t v62;
  uint64_t v64;
  int v65;
  float v70;
  float v72;
  double v73;
  double v75;
  float32x2_t *v77;
  float64x2_t v78;
  float v79;
  int32x4_t v80;
  float32x2_t v81;
  float32x2_t v82;
  float32x4_t v83;
  size_t v84;
  size_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  size_t v89;
  size_t v90;
  size_t v91;
  size_t v92;
  float v93;
  unint64_t v94;
  __int16 *v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  float v106;
  float v107;
  BOOL v109;
  float v110;
  float v111;
  float v114;
  float32x4_t v115;
  uint64_t v116;
  int v117;
  float v118;
  float v119;
  float v120;
  double v121;
  double v122;
  float v123;
  float32x2_t *v124;
  float64x2_t v125;
  float v126;
  int32x4_t v127;
  float32x2_t v128;
  float32x2_t v129;
  float32x4_t v130;
  vImage_Buffer *p_p;
  vImage_Buffer *v132;
  vImage_Buffer *v133;
  char *v138;
  char *data;
  size_t rowBytes;
  vImage_Buffer v142;
  vImage_Buffer v143;
  vImage_Buffer v144;
  vImage_Buffer __p;
  vImage_Buffer buf;
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  result = -22953;
  if (a7 && a4 && a3 && pixelBuffer)
  {
    if (a5)
      _ZF = a11 == 0;
    else
      _ZF = 1;
    v20 = !_ZF && a6 != 0;
    PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    v22 = PixelFormatType;
    if ((int)PixelFormatType <= 1717856626)
    {
      if ((_DWORD)PixelFormatType == 1278226536)
        goto LABEL_29;
      if ((_DWORD)PixelFormatType != 1717855600)
        goto LABEL_79;
    }
    else if ((_DWORD)PixelFormatType != 1717856627)
    {
      if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
      {
LABEL_79:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          PixelBufferUtils::pixelFormatAsString(v22, (char *)&__p);
          if ((__p.width & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (vImage_Buffer *)__p.data;
          LODWORD(buf.data) = 136446210;
          *(void **)((char *)&buf.data + 4) = p_p;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unsupported depth map format (%{public}s)", (uint8_t *)&buf, 0xCu);
          if (SHIBYTE(__p.width) < 0)
            operator delete(__p.data);
        }
        return -22956;
      }
LABEL_29:
      if (v20)
      {
        v26 = CVPixelBufferGetPixelFormatType(a5);
        if ((_DWORD)v26 != 1717855600)
        {
          v27 = v26;
          if ((_DWORD)v26 != 1717856627)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v11 = (size_t)&__p;
              PixelBufferUtils::pixelFormatAsString(v27, (char *)&__p);
              v132 = (__p.width & 0x8000000000000000) == 0 ? &__p : (vImage_Buffer *)__p.data;
              LODWORD(buf.data) = 136446210;
              *(void **)((char *)&buf.data + 4) = v132;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "for normals only float 32 format are supported (provided: %{public}s)", (uint8_t *)&buf, 0xCu);
              if (SHIBYTE(__p.width) < 0)
                operator delete(__p.data);
            }
            if ((_DWORD)v27 != 1717856627)
              return -22956;
          }
        }
      }
      CVPixelBufferLockBaseAddress(a7, 1uLL);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 1uLL);
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      memset(&__p, 0, sizeof(__p));
      v28 = MEMORY[0x24BDBF090];
      PixelBufferUtils::asVImageBuffer(a7, *MEMORY[0x24BDBF090], &__p);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a3, *(CGRect *)v28, &buf);
      memset(&v144, 0, sizeof(v144));
      PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)v28, &v144);
      memset(&v143, 0, sizeof(v143));
      PixelBufferUtils::asVImageBuffer(pixelBuffer, *(CGRect *)v28, &v143);
      if (v20)
      {
        CVPixelBufferLockBaseAddress(a5, 1uLL);
        CVPixelBufferLockBaseAddress(a6, 1uLL);
        CVPixelBufferLockBaseAddress(a11, 0);
        PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)v28, &v142);
        data = (char *)v142.data;
        rowBytes = v142.rowBytes;
        PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)v28, &v142);
        v138 = (char *)v142.data;
        v11 = v142.rowBytes;
        PixelBufferUtils::asVImageBuffer(a11, *(CGRect *)v28, &v142);
        v12 = (char *)v142.data;
        v14 = v142.rowBytes;
        if (!a8)
          goto LABEL_39;
      }
      else if (!a8)
      {
        goto LABEL_39;
      }
      CVPixelBufferLockBaseAddress(a8, 1uLL);
      PixelBufferUtils::asVImageBuffer(a8, *(CGRect *)v28, &v142);
      v13 = (char *)v142.data;
      v28 = v142.rowBytes;
LABEL_39:
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      if (Height && Width)
      {
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v34 = buf.rowBytes;
        v35 = __p.rowBytes;
        v36 = v143.rowBytes;
        v37 = v144.rowBytes;
        v38 = a9;
        do
        {
          v39 = 0;
          v40 = (__int16 *)((char *)__p.data + v35 * v33);
          v41 = &v13[v33 * v28];
          if (!a8)
            v41 = 0;
          v42 = &data[v33 * rowBytes];
          v43 = &v12[v33 * v14];
          if (!v20)
          {
            v42 = 0;
            v43 = 0;
          }
          v44 = (char *)v143.data + v32;
          v45 = (char *)buf.data + v31;
          v46 = v138;
          do
          {
            _H17 = *(_WORD *)&v45[2 * v39];
            *(_WORD *)&v44[2 * v39] = _H17;
            v62 = 0uLL;
            if (v20)
            {
              v62 = *(float32x4_t *)&v42[16 * v39];
              *(float32x4_t *)&v43[16 * v39] = v62;
            }
            _H18 = *v40;
            __asm { FCVT            S18, H18 }
            _H19 = v40[1];
            __asm { FCVT            S19, H19 }
            _NF = (float)(fabsf(_S18) + fabsf(_S19)) < 600.0;
            v53 = roundf(_S18);
            v54 = v53 + (float)v39;
            _NF = _NF && v54 < (float)(Width - 1);
            v56 = _NF && v54 > 1.0;
            v57 = roundf(_S19);
            v58 = v57 + (float)v33;
            if (v56 && v58 < (float)(Height - 1) && v58 > 1.0)
            {
              __asm { FCVT            S17, H17 }
              v64 = (int)v57;
              v65 = (int)v53;
              _H18 = *(_WORD *)((char *)v144.data + 2 * (int)v53 + 2 * v39 + v37 * (v33 + v64));
              if (a8)
              {
                __asm { FCVT            S6, H18 }
                _H19 = *(_WORD *)&v41[2 * v39];
                __asm { FCVT            D20, H19 }
                if (_D20 < 0.0)
                  _D20 = 0.0;
                v70 = _D20;
                __asm { FCVT            S19, H19 }
                if (_S19 <= 1.0)
                  v72 = v70;
                else
                  v72 = 1.0;
                if (vabds_f32(_S6, _S17) >= 0.5)
                  v38 = a9;
                else
                  v38 = v72;
              }
              v73 = (float)(v38 * _S17);
              __asm { FCVT            D18, H18 }
              v75 = 1.0 - v38;
              _D18 = v73 + _D18 * v75;
              __asm { FCVT            H18, D18 }
              *(_WORD *)&v44[2 * v39] = LOWORD(_D18);
              if (v20)
              {
                v77 = (float32x2_t *)&v46[16 * v65 + v11 * (v33 + v64)];
                v78 = vmlaq_n_f64(vcvtq_f64_f32(vmul_n_f32(*(float32x2_t *)v62.f32, v38)), vcvtq_f64_f32(*v77), v75);
                *(float32x2_t *)&v78.f64[0] = vcvt_f32_f64(v78);
                v79 = vmuls_lane_f32(v38, v62, 2) + v77[1].f32[0] * v75;
                *(float *)&v78.f64[1] = v79;
                v80 = (int32x4_t)vmulq_f32((float32x4_t)v78, (float32x4_t)v78);
                v80.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v80, 2), vadd_f32(*(float32x2_t *)v80.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v80.i8, 1))).u32[0];
                v81 = vrsqrte_f32((float32x2_t)v80.u32[0]);
                v82 = vmul_f32(v81, vrsqrts_f32((float32x2_t)v80.u32[0], vmul_f32(v81, v81)));
                v83 = vmulq_n_f32((float32x4_t)v78, vmul_f32(v82, vrsqrts_f32((float32x2_t)v80.u32[0], vmul_f32(v82, v82))).f32[0]);
                v83.i32[3] = 1.0;
                *(float32x4_t *)&v43[16 * v39] = v83;
              }
            }
            ++v39;
            v46 += 16;
            v40 += 2;
          }
          while (Width != v39);
          ++v33;
          v32 += v36;
          v31 += v34;
        }
        while (v33 != Height);
      }
      CVPixelBufferUnlockBaseAddress(a7, 1uLL);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      CVPixelBufferUnlockBaseAddress(a4, 1uLL);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      if (v20)
      {
        CVPixelBufferUnlockBaseAddress(a11, 0);
        CVPixelBufferUnlockBaseAddress(a5, 1uLL);
        CVPixelBufferUnlockBaseAddress(a6, 1uLL);
      }
      if (!a8)
        return 0;
      goto LABEL_122;
    }
    if (v20)
    {
      v23 = CVPixelBufferGetPixelFormatType(a5);
      if ((_DWORD)v23 != 1717855600)
      {
        v24 = v23;
        if ((_DWORD)v23 != 1717856627)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v11 = (size_t)&__p;
            PixelBufferUtils::pixelFormatAsString(v24, (char *)&__p);
            v133 = (__p.width & 0x8000000000000000) == 0 ? &__p : (vImage_Buffer *)__p.data;
            LODWORD(buf.data) = 136446210;
            *(void **)((char *)&buf.data + 4) = v133;
            _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "for normals only float 32 format are supported (provided: %{public}s)", (uint8_t *)&buf, 0xCu);
            if (SHIBYTE(__p.width) < 0)
              operator delete(__p.data);
          }
          if ((_DWORD)v24 != 1717856627)
            return -22956;
        }
      }
    }
    CVPixelBufferLockBaseAddress(a7, 1uLL);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    memset(&__p, 0, sizeof(__p));
    v25 = MEMORY[0x24BDBF090];
    PixelBufferUtils::asVImageBuffer(a7, *MEMORY[0x24BDBF090], &__p);
    memset(&buf, 0, sizeof(buf));
    PixelBufferUtils::asVImageBuffer(a3, *(CGRect *)v25, &buf);
    memset(&v144, 0, sizeof(v144));
    PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)v25, &v144);
    memset(&v143, 0, sizeof(v143));
    PixelBufferUtils::asVImageBuffer(pixelBuffer, *(CGRect *)v25, &v143);
    if (v20)
    {
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      CVPixelBufferLockBaseAddress(a6, 1uLL);
      CVPixelBufferLockBaseAddress(a11, 0);
      PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)v25, &v142);
      data = (char *)v142.data;
      rowBytes = v142.rowBytes;
      PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)v25, &v142);
      v138 = (char *)v142.data;
      v11 = v142.rowBytes;
      PixelBufferUtils::asVImageBuffer(a11, *(CGRect *)v25, &v142);
      v12 = (char *)v142.data;
      v14 = v142.rowBytes;
      if (!a8)
        goto LABEL_83;
    }
    else if (!a8)
    {
      goto LABEL_83;
    }
    CVPixelBufferLockBaseAddress(a8, 1uLL);
    PixelBufferUtils::asVImageBuffer(a8, *(CGRect *)v25, &v142);
    v13 = (char *)v142.data;
    v25 = v142.rowBytes;
LABEL_83:
    v84 = CVPixelBufferGetWidth(a3);
    v85 = CVPixelBufferGetHeight(a3);
    if (v85 && v84)
    {
      v86 = 0;
      v87 = 0;
      v88 = 0;
      v89 = buf.rowBytes;
      v90 = __p.rowBytes;
      v91 = v143.rowBytes;
      v92 = v144.rowBytes;
      v93 = a9;
      do
      {
        v94 = 0;
        v95 = (__int16 *)((char *)__p.data + v90 * v88);
        v96 = &v13[v88 * v25];
        if (!a8)
          v96 = 0;
        v97 = &data[v88 * rowBytes];
        v98 = &v12[v88 * v14];
        if (!v20)
        {
          v97 = 0;
          v98 = 0;
        }
        v99 = (char *)v143.data + v87;
        v100 = (char *)buf.data + v86;
        v101 = v138;
        do
        {
          v114 = *(float *)&v100[4 * v94];
          *(float *)&v99[4 * v94] = v114;
          v115 = 0uLL;
          if (v20)
          {
            v115 = *(float32x4_t *)&v97[16 * v94];
            *(float32x4_t *)&v98[16 * v94] = v115;
          }
          _H18 = *v95;
          __asm { FCVT            S18, H18 }
          _H19 = v95[1];
          __asm { FCVT            S19, H19 }
          _NF = (float)(fabsf(_S18) + fabsf(_S19)) < 600.0;
          v106 = roundf(_S18);
          v107 = v106 + (float)v94;
          v109 = _NF && v107 < (float)(v84 - 1) && v107 > 1.0;
          v110 = roundf(_S19);
          v111 = v110 + (float)v88;
          if (v109 && v111 < (float)(v85 - 1) && v111 > 1.0)
          {
            v116 = (int)v110;
            v117 = (int)v106;
            v118 = *(float *)((char *)v144.data + 4 * (int)v106 + 4 * v94 + v92 * (v88 + v116));
            if (a8)
            {
              v119 = *(float *)&v96[4 * v94];
              v120 = v119 >= 0.0 ? *(float *)&v96[4 * v94] : 0.0;
              v93 = v119 <= 1.0 ? v120 : 1.0;
              if (vabds_f32(v118, v114) >= 0.5)
                v93 = a9;
            }
            v121 = (float)(v114 * v93);
            v122 = 1.0 - v93;
            v123 = v121 + v118 * v122;
            *(float *)&v99[4 * v94] = v123;
            if (v20)
            {
              v124 = (float32x2_t *)&v101[16 * v117 + v11 * (v88 + v116)];
              v125 = vmlaq_n_f64(vcvtq_f64_f32(vmul_n_f32(*(float32x2_t *)v115.f32, v93)), vcvtq_f64_f32(*v124), v122);
              *(float32x2_t *)&v125.f64[0] = vcvt_f32_f64(v125);
              v126 = vmuls_lane_f32(v93, v115, 2) + v124[1].f32[0] * v122;
              *(float *)&v125.f64[1] = v126;
              v127 = (int32x4_t)vmulq_f32((float32x4_t)v125, (float32x4_t)v125);
              v127.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v127, 2), vadd_f32(*(float32x2_t *)v127.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v127.i8, 1))).u32[0];
              v128 = vrsqrte_f32((float32x2_t)v127.u32[0]);
              v129 = vmul_f32(v128, vrsqrts_f32((float32x2_t)v127.u32[0], vmul_f32(v128, v128)));
              v130 = vmulq_n_f32((float32x4_t)v125, vmul_f32(v129, vrsqrts_f32((float32x2_t)v127.u32[0], vmul_f32(v129, v129))).f32[0]);
              v130.i32[3] = 1.0;
              *(float32x4_t *)&v98[16 * v94] = v130;
            }
          }
          ++v94;
          v101 += 16;
          v95 += 2;
        }
        while (v84 != v94);
        ++v88;
        v87 += v91;
        v86 += v89;
      }
      while (v88 != v85);
    }
    CVPixelBufferUnlockBaseAddress(a7, 1uLL);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    if (v20)
    {
      CVPixelBufferUnlockBaseAddress(a11, 0);
      CVPixelBufferUnlockBaseAddress(a5, 1uLL);
      CVPixelBufferUnlockBaseAddress(a6, 1uLL);
    }
    if (!a8)
      return 0;
LABEL_122:
    CVPixelBufferUnlockBaseAddress(a8, 1uLL);
    return 0;
  }
  return result;
}

+ (int64_t)filterInvalidsFromFloatImage:(__CVBuffer *)a3 minValue:(float)a4 maxValue:(float)a5
{
  return objc_msgSend(a1, "filterInvalidsFromFloatImage:minValue:maxValue:clampToMinMax:", a3, 1);
}

+ (int64_t)filterInvalidsFromFloatImage:(__CVBuffer *)a3 minValue:(float)a4 maxValue:(float)a5 clampToMinMax:(BOOL)a6
{
  signed int PixelFormatType;
  unsigned __int16 v9;
  vImagePixelCount v10;
  vImagePixelCount v11;
  float32x4_t *v12;
  size_t v13;
  vImagePixelCount v14;
  int8x16_t v15;
  int8x16_t v16;
  float *v17;
  vImagePixelCount height;
  vImagePixelCount width;
  float16x4_t *data;
  size_t rowBytes;
  vImagePixelCount v23;
  int8x16_t v24;
  int8x16_t v25;
  uint64_t v26;
  int32x4_t v27;
  uint32x4_t v28;
  int32x4_t v29;
  float32x4_t v30;
  float16x4_t *v31;
  float16x4_t *v32;
  unint64_t v33;
  float16x4_t *v34;
  unint64_t v35;
  int8x16_t v36;
  int8x8_t v37;
  vImagePixelCount v38;
  float v47;
  float v50;
  float v51;
  float v52;
  float v54;
  float v55;
  float v56;
  float v58;
  float v59;
  float v60;
  float *v62;
  float v63;
  float v64;
  BOOL v65;
  float v66;
  float v68;
  float v69;
  float v70;
  float v73;
  float v74;
  float v75;
  _WORD *v78;
  BOOL v81;
  float v82;
  BOOL v83;
  float v84;
  BOOL v88;
  float v89;
  BOOL v94;
  float v95;
  uint64_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t *v101;
  unint64_t v102;
  int8x16_t v103;
  float32x4_t v104;
  unint64_t v105;
  float v106;
  float v107;
  float v108;
  uint64_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t *v113;
  vImagePixelCount v114;
  float32x4_t v115;
  uint64_t v116;
  int32x4_t v117;
  uint32x4_t v118;
  int32x4_t v119;
  float32x4_t v120;
  float16x4_t *v121;
  vImagePixelCount v122;
  float32x4_t v123;
  uint64_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t *v127;
  unint64_t v128;
  float32x4_t v129;
  unint64_t v130;
  float v131;
  float v132;
  float v133;
  uint64_t v136;
  int32x4_t v137;
  uint32x4_t v138;
  int32x4_t v139;
  float32x4_t v140;
  float16x4_t *v141;
  unint64_t v142;
  float32x4_t v143;
  int8x16_t v144;
  int8x16_t v145;
  unint64_t v147;
  float v149;
  BOOL v151;
  float v152;
  unint64_t v155;
  vImage_Buffer *v156;
  int32x2_t v157;
  int32x2_t v158;
  vImage_Buffer buf;
  uint8_t v160[4];
  vImage_Buffer *v161;
  uint64_t v162;

  v158 = *(int32x2_t *)&a5;
  v157 = *(int32x2_t *)&a4;
  v162 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 1717856626)
  {
    if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032)
    {
      v9 = 26995;
      goto LABEL_7;
    }
    if (!a3)
    {
LABEL_45:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Pixel buffer cannot be null", (uint8_t *)&buf, 2u);
      }
      return -22964;
    }
    CVPixelBufferLockBaseAddress(a3, 0);
    memset(&buf, 0, sizeof(buf));
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
    height = buf.height;
    if (!buf.height || (width = buf.width) == 0)
    {
LABEL_210:
      CVPixelBufferUnlockBaseAddress(a3, 0);
      return 0;
    }
    data = (float16x4_t *)buf.data;
    rowBytes = buf.rowBytes;
    v23 = buf.width & 0xFFFFFFFFFFFFFFFCLL;
    v24 = (int8x16_t)vdupq_lane_s32(v157, 0);
    v25 = (int8x16_t)vdupq_lane_s32(v158, 0);
    if (!a6)
    {
      if (buf.width > 3)
      {
        if (buf.width == v23)
        {
          v116 = 0;
          v117.i64[0] = 0x80000000800000;
          v117.i64[1] = 0x80000000800000;
          v118.i64[0] = 0x7F0000007F000000;
          v118.i64[1] = 0x7F0000007F000000;
          v119 = vdupq_n_s32(0x7F800000u);
          v120.i64[0] = 0x3400000034000000;
          v120.i64[1] = 0x3400000034000000;
          do
          {
            v121 = data;
            v122 = width;
            do
            {
              v123 = vcvtq_f32_f16(*v121);
              *v121 = (float16x4_t)vand_s8(vbic_s8((int8x8_t)*v121, (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcgtq_f32((float32x4_t)v24, v123), (int8x16_t)vcgtq_f32(v123, (float32x4_t)v25)))), (int8x8_t)vmovn_s32((int32x4_t)vandq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v123), (int8x16_t)vcgezq_f32(v123)), vbicq_s8(vorrq_s8(vorrq_s8((int8x16_t)vceqzq_s32((int32x4_t)(*(_OWORD *)&v123 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))), (int8x16_t)vcgtq_s32((int32x4_t)(*(_OWORD *)&v123 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v119)), (int8x16_t)vcgtq_u32(v118, (uint32x4_t)vsubq_s32(
                                                                                                     (int32x4_t)(*(_OWORD *)&v123 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)),
                                                                                                     v117))),
                                                                        (int8x16_t)vcgeq_f32(v120, vabsq_f32(v123))))));
              ++v121;
              v122 -= 4;
            }
            while (v122);
            ++v116;
            data = (float16x4_t *)((char *)data + rowBytes);
          }
          while (v116 != height);
        }
        else
        {
          v136 = 0;
          v137.i64[0] = 0x80000000800000;
          v137.i64[1] = 0x80000000800000;
          v138.i64[0] = 0x7F0000007F000000;
          v138.i64[1] = 0x7F0000007F000000;
          v139 = vdupq_n_s32(0x7F800000u);
          v140.i64[0] = 0x3400000034000000;
          v140.i64[1] = 0x3400000034000000;
          do
          {
            v141 = data;
            v142 = width & 0xFFFFFFFFFFFFFFFCLL;
            do
            {
              v143 = vcvtq_f32_f16(*v141);
              v144 = (int8x16_t)vcgtq_f32((float32x4_t)v24, v143);
              v145 = (int8x16_t)vcgtq_f32(v143, (float32x4_t)v25);
              _D17 = (int8x8_t)vmovn_s32((int32x4_t)vandq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v143), (int8x16_t)vcgezq_f32(v143)), vbicq_s8(vorrq_s8(vorrq_s8((int8x16_t)vceqzq_s32((int32x4_t)(*(_OWORD *)&v143 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))), (int8x16_t)vcgtq_s32((int32x4_t)(*(_OWORD *)&v143 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v139)), (int8x16_t)vcgtq_u32(v138, (uint32x4_t)vsubq_s32((int32x4_t)(*(_OWORD *)&v143 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v137))), (int8x16_t)vcgeq_f32(v140, vabsq_f32(v143)))));
              *v141 = (float16x4_t)vand_s8(vbic_s8((int8x8_t)*v141, (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8(v144, v145))), _D17);
              ++v141;
              v142 -= 4;
            }
            while (v142);
            v147 = width & 0xFFFFFFFFFFFFFFFCLL;
            do
            {
              _D17.i16[0] = data->i16[v147];
              __asm { FCVT            S18, H17 }
              LOWORD(v149) = 0;
              v151 = ((LODWORD(_S18) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                  || (LODWORD(_S18) & 0x7FFFFFFFu) >= 0x7F800001
                  || (LODWORD(_S18) & 0x7FFFFFFF) == 0;
              v152 = fabsf(_S18);
              if (v151 && v152 > 0.00000011921)
              {
                if (_S18 > *(float *)v158.i32 || _S18 < *(float *)v157.i32)
                  v149 = 0.0;
                else
                  v149 = *(float *)_D17.i32;
              }
              data->i16[v147++] = LOWORD(v149);
            }
            while (width != v147);
            ++v136;
            data = (float16x4_t *)((char *)data + rowBytes);
          }
          while (v136 != height);
        }
      }
      else
      {
        v78 = (char *)buf.data + 4;
        do
        {
          LOWORD(_S2) = *(v78 - 2);
          __asm { FCVT            S3, H2 }
          v81 = ((LODWORD(_S3) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
             || (LODWORD(_S3) & 0x7FFFFFFFu) >= 0x7F800001
             || (LODWORD(_S3) & 0x7FFFFFFF) == 0;
          v82 = fabsf(_S3);
          v83 = v81 && v82 > 0.00000011921;
          LOWORD(v84) = 0;
          if (v83)
          {
            if (_S3 > *(float *)v158.i32 || _S3 < *(float *)v157.i32)
              v84 = 0.0;
            else
              v84 = _S2;
          }
          *(v78 - 2) = LOWORD(v84);
          if (width != 1)
          {
            LOWORD(_S3) = *(v78 - 1);
            __asm { FCVT            S4, H3 }
            _S2 = 0.0;
            v88 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
               || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
               || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
            v89 = fabsf(_S4);
            if (v88 && v89 > 0.00000011921)
            {
              if (_S4 > *(float *)v158.i32 || _S4 < *(float *)v157.i32)
                _S2 = 0.0;
              else
                _S2 = _S3;
            }
            *(v78 - 1) = LOWORD(_S2);
            if (width != 2)
            {
              LOWORD(_S3) = *v78;
              __asm { FCVT            S4, H3 }
              _S2 = 0.0;
              v94 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                 || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
                 || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
              v95 = fabsf(_S4);
              if (v94 && v95 > 0.00000011921)
              {
                if (_S4 > *(float *)v158.i32 || _S4 < *(float *)v157.i32)
                  _S2 = 0.0;
                else
                  _S2 = _S3;
              }
              *v78 = LOWORD(_S2);
            }
          }
          v78 = (_WORD *)((char *)v78 + rowBytes);
          --height;
        }
        while (height);
      }
      goto LABEL_210;
    }
    v26 = 0;
    v27.i64[0] = 0x80000000800000;
    v27.i64[1] = 0x80000000800000;
    v28.i64[0] = 0x7F0000007F000000;
    v28.i64[1] = 0x7F0000007F000000;
    v29 = vdupq_n_s32(0x7F800000u);
    v30.i64[0] = 0x3400000034000000;
    v30.i64[1] = 0x3400000034000000;
    v31 = (float16x4_t *)buf.data;
    while (1)
    {
      v32 = (float16x4_t *)((char *)data + rowBytes * v26);
      if (width < 4)
        break;
      v34 = v31;
      v35 = width & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v36 = (int8x16_t)vcvtq_f32_f16(*v34);
        v37 = (int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32((float32x4_t)v36), (int8x16_t)vcgezq_f32((float32x4_t)v36)));
        *v34++ = (float16x4_t)vand_s8(vand_s8((int8x8_t)vcvt_f16_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v24, (float32x4_t)v36), v24, vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v36, (float32x4_t)v25), v25, v36))), v37), vorn_s8((int8x8_t)vmovn_s32((int32x4_t)vbicq_s8(vorrq_s8(vorrq_s8((int8x16_t)vceqzq_s32((int32x4_t)(*(_OWORD *)&v36 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))), (int8x16_t)vcgtq_s32(
                                                                                    (int32x4_t)(*(_OWORD *)&v36 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)),
                                                                                    v29)),
                                                                     (int8x16_t)vcgtq_u32(v28, (uint32x4_t)vsubq_s32((int32x4_t)(*(_OWORD *)&v36 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v27))), (int8x16_t)vcgeq_f32(v30, vabsq_f32((float32x4_t)v36)))), v37));
        v35 -= 4;
      }
      while (v35);
      if (width != v23)
      {
        v32 = (float16x4_t *)((char *)v32 + 2 * v23);
        v33 = width & 0xFFFFFFFFFFFFFFFCLL;
LABEL_26:
        v38 = width - v33;
        do
        {
          _H7 = v32->i16[0];
          __asm { FCVT            S16, H7 }
          _S7 = 0.0;
          _ZF = ((LODWORD(_S16) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
             || (LODWORD(_S16) & 0x7FFFFFFFu) >= 0x7F800001
             || (LODWORD(_S16) & 0x7FFFFFFF) == 0;
          v47 = fabsf(_S16);
          if (_ZF && v47 > 0.00000011921)
          {
            _S7 = _S16 <= *(float *)v158.i32 ? _S16 : *(float *)v158.i32;
            if (_S16 < *(float *)v157.i32)
              _S7 = *(float *)v157.i32;
          }
          __asm { FCVT            H7, S7 }
          v32->i16[0] = _H7;
          v32 = (float16x4_t *)((char *)v32 + 2);
          --v38;
        }
        while (v38);
      }
      ++v26;
      v31 = (float16x4_t *)((char *)v31 + rowBytes);
      if (v26 == height)
        goto LABEL_210;
    }
    v33 = 0;
    goto LABEL_26;
  }
  if (PixelFormatType == 1278226534)
    goto LABEL_8;
  v9 = 25968;
LABEL_7:
  if (PixelFormatType == (v9 | 0x66640000))
  {
LABEL_8:
    if (a3)
    {
      CVPixelBufferLockBaseAddress(a3, 0);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
      v10 = buf.height;
      if (buf.height)
      {
        v11 = buf.width;
        if (buf.width)
        {
          v12 = (float32x4_t *)buf.data;
          v13 = buf.rowBytes;
          v14 = buf.width & 0xFFFFFFFFFFFFFFFCLL;
          v15 = (int8x16_t)vdupq_lane_s32(v157, 0);
          v16 = (int8x16_t)vdupq_lane_s32(v158, 0);
          if (a6)
          {
            if (buf.width >= 4)
            {
              v98 = 0;
              v99 = (float32x4_t)vdupq_n_s32(0x7F800000u);
              v100.i64[0] = 0x3400000034000000;
              v100.i64[1] = 0x3400000034000000;
              do
              {
                v101 = v12;
                v102 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                do
                {
                  v103 = vorrq_s8((int8x16_t)vcltzq_f32(*v101), (int8x16_t)vcgezq_f32(*v101));
                  v104 = vabsq_f32(*v101);
                  *(int8x16_t *)v101 = vandq_s8(vandq_s8(vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v15, *v101), v15, vbslq_s8((int8x16_t)vcgtq_f32(*v101, (float32x4_t)v16), v16, *(int8x16_t *)v101)), v103), vornq_s8(vbicq_s8(vmvnq_s8((int8x16_t)vceqq_f32(v104, v99)), (int8x16_t)vcgeq_f32(v100, v104)), v103));
                  ++v101;
                  v102 -= 4;
                }
                while (v102);
                if (v11 != v14)
                {
                  v105 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                  do
                  {
                    v106 = v12->f32[v105];
                    v107 = 0.0;
                    v108 = fabsf(v106);
                    if (v108 != INFINITY && v108 > 0.00000011921)
                    {
                      v107 = v106 <= *(float *)v158.i32 ? v12->f32[v105] : *(float *)v158.i32;
                      if (v106 < *(float *)v157.i32)
                        v107 = *(float *)v157.i32;
                    }
                    v12->f32[v105++] = v107;
                  }
                  while (v11 != v105);
                }
                ++v98;
                v12 = (float32x4_t *)((char *)v12 + v13);
              }
              while (v98 != v10);
            }
            else
            {
              v17 = (float *)((char *)buf.data + 8);
              do
              {
                v50 = *(v17 - 2);
                v51 = 0.0;
                v52 = fabsf(v50);
                if (v52 != INFINITY && v52 > 0.00000011921)
                {
                  v51 = v50 <= *(float *)v158.i32 ? *(v17 - 2) : *(float *)v158.i32;
                  if (v50 < *(float *)v157.i32)
                    v51 = *(float *)v157.i32;
                }
                *(v17 - 2) = v51;
                if (v11 != 1)
                {
                  v54 = *(v17 - 1);
                  v55 = 0.0;
                  v56 = fabsf(v54);
                  if (v56 != INFINITY && v56 > 0.00000011921)
                  {
                    v55 = v54 <= *(float *)v158.i32 ? *(v17 - 1) : *(float *)v158.i32;
                    if (v54 < *(float *)v157.i32)
                      v55 = *(float *)v157.i32;
                  }
                  *(v17 - 1) = v55;
                  if (v11 != 2)
                  {
                    v58 = *v17;
                    v59 = 0.0;
                    v60 = fabsf(*v17);
                    if (v60 != INFINITY && v60 > 0.00000011921)
                    {
                      if (v58 <= *(float *)v158.i32)
                        v59 = *v17;
                      else
                        v59 = *(float *)v158.i32;
                      if (v58 < *(float *)v157.i32)
                        v59 = *(float *)v157.i32;
                    }
                    *v17 = v59;
                  }
                }
                v17 = (float *)((char *)v17 + v13);
                --v10;
              }
              while (v10);
            }
          }
          else if (buf.width > 3)
          {
            if (buf.width == v14)
            {
              v110 = 0;
              v111 = (float32x4_t)vdupq_n_s32(0x7F800000u);
              v112.i64[0] = 0x3400000034000000;
              v112.i64[1] = 0x3400000034000000;
              do
              {
                v113 = v12;
                v114 = v11;
                do
                {
                  v115 = vabsq_f32(*v113);
                  *(int8x16_t *)v113 = vandq_s8(vandq_s8(vbicq_s8(*(int8x16_t *)v113, vorrq_s8((int8x16_t)vcgtq_f32((float32x4_t)v15, *v113), (int8x16_t)vcgtq_f32(*v113, (float32x4_t)v16))), vorrq_s8((int8x16_t)vcltzq_f32(*v113), (int8x16_t)vcgezq_f32(*v113))), vbicq_s8(vmvnq_s8((int8x16_t)vceqq_f32(v115, v111)), (int8x16_t)vcgeq_f32(v112, v115)));
                  ++v113;
                  v114 -= 4;
                }
                while (v114);
                ++v110;
                v12 = (float32x4_t *)((char *)v12 + v13);
              }
              while (v110 != v10);
            }
            else
            {
              v124 = 0;
              v125 = (float32x4_t)vdupq_n_s32(0x7F800000u);
              v126.i64[0] = 0x3400000034000000;
              v126.i64[1] = 0x3400000034000000;
              do
              {
                v127 = v12;
                v128 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                do
                {
                  v129 = vabsq_f32(*v127);
                  *(int8x16_t *)v127 = vandq_s8(vandq_s8(vbicq_s8(*(int8x16_t *)v127, vorrq_s8((int8x16_t)vcgtq_f32((float32x4_t)v15, *v127), (int8x16_t)vcgtq_f32(*v127, (float32x4_t)v16))), vorrq_s8((int8x16_t)vcltzq_f32(*v127), (int8x16_t)vcgezq_f32(*v127))), vbicq_s8(vmvnq_s8((int8x16_t)vceqq_f32(v129, v125)), (int8x16_t)vcgeq_f32(v126, v129)));
                  ++v127;
                  v128 -= 4;
                }
                while (v128);
                v130 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                do
                {
                  v131 = v12->f32[v130];
                  v132 = 0.0;
                  v133 = fabsf(v131);
                  if (v133 != INFINITY && v133 > 0.00000011921)
                  {
                    if (v131 > *(float *)v158.i32 || v131 < *(float *)v157.i32)
                      v132 = 0.0;
                    else
                      v132 = v12->f32[v130];
                  }
                  v12->f32[v130++] = v132;
                }
                while (v11 != v130);
                ++v124;
                v12 = (float32x4_t *)((char *)v12 + v13);
              }
              while (v124 != v10);
            }
          }
          else
          {
            v62 = (float *)((char *)buf.data + 8);
            do
            {
              v63 = *(v62 - 2);
              v64 = fabsf(v63);
              v65 = v64 != INFINITY && v64 > 0.00000011921;
              v66 = 0.0;
              if (v65)
              {
                if (v63 > *(float *)v158.i32 || v63 < *(float *)v157.i32)
                  v66 = 0.0;
                else
                  v66 = *(v62 - 2);
              }
              *(v62 - 2) = v66;
              if (v11 != 1)
              {
                v68 = *(v62 - 1);
                v69 = 0.0;
                v70 = fabsf(v68);
                if (v70 != INFINITY && v70 > 0.00000011921)
                {
                  if (v68 > *(float *)v158.i32 || v68 < *(float *)v157.i32)
                    v69 = 0.0;
                  else
                    v69 = *(v62 - 1);
                }
                *(v62 - 1) = v69;
                if (v11 != 2)
                {
                  v73 = *v62;
                  v74 = 0.0;
                  v75 = fabsf(*v62);
                  if (v75 != INFINITY && v75 > 0.00000011921)
                  {
                    if (v73 > *(float *)v158.i32 || v73 < *(float *)v157.i32)
                      v74 = 0.0;
                    else
                      v74 = *v62;
                  }
                  *v62 = v74;
                }
              }
              v62 = (float *)((char *)v62 + v13);
              --v10;
            }
            while (v10);
          }
        }
      }
      goto LABEL_210;
    }
    goto LABEL_45;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v155 = CVPixelBufferGetPixelFormatType(a3);
    PixelBufferUtils::pixelFormatAsString(v155, (char *)&buf);
    v156 = (buf.width & 0x8000000000000000) == 0 ? &buf : (vImage_Buffer *)buf.data;
    *(_DWORD *)v160 = 136446210;
    v161 = v156;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported pixel format (%{public}s)", v160, 0xCu);
    if (SHIBYTE(buf.width) < 0)
      operator delete(buf.data);
  }
  return -22956;
}

+ (float32x2_t)calcRotationMatrix:(float32x4_t)a1
{
  float32x4_t v1;
  float v2;
  float v3;
  __float2 v4;
  float cosval;

  v1 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3A83126Fu));
  v2 = v1.f32[1];
  v3 = v1.f32[2];
  __sincosf_stret(v1.f32[0]);
  cosval = __sincosf_stret(v2).__cosval;
  v4 = __sincosf_stret(v3);
  return vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval)), cosval);
}

+ (double)calcRotationAngle:(float *)a3
{
  float v4;
  float v5;
  uint64_t v6;
  float v7;
  float32x4_t v8;
  double result;
  float v10;
  float32x4_t v11;

  v4 = a3[6];
  v5 = a3[10];
  *(float *)&v6 = atan2f(v4, v5);
  v11.i64[0] = v6;
  v10 = atan2f(-a3[2], sqrtf((float)(v5 * v5) + (float)(v4 * v4)));
  v7 = atan2f(a3[1], *a3);
  v8 = v11;
  v8.f32[1] = v10;
  v8.f32[2] = v7;
  *(_QWORD *)&result = vmulq_f32(v8, (float32x4_t)vdupq_n_s32(0x447A0000u)).u64[0];
  return result;
}

+ (double)addAnglesToRotation:(double)a3 angles:(double)a4
{
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  double result;

  objc_msgSend(a1, "calcRotationMatrix:", a5);
  *(_QWORD *)&result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, a2.f32[0]), v6, *(float32x2_t *)a2.f32, 1), v7, a2, 2).u64[0];
  return result;
}

+ (int64_t)warpMap:(__CVBuffer *)a3 toOutput:(__CVBuffer *)a4 usingOpticalFlow:(__CVBuffer *)a5
{
  int64_t result;
  unint64_t PixelFormatType;
  unint64_t v10;
  CGRect *v11;
  size_t v12;
  size_t v13;
  unint64_t v14;
  char *v15;
  size_t v16;
  size_t v17;
  char *v18;
  size_t v19;
  char *v20;
  unint64_t v21;
  char *v22;
  float v30;
  float v31;
  BOOL v33;
  float v34;
  float v35;
  CGRect *v38;
  size_t Width;
  size_t Height;
  unint64_t v41;
  char *data;
  size_t rowBytes;
  size_t v44;
  char *v45;
  size_t v46;
  char *v47;
  unint64_t v48;
  char *v49;
  float v54;
  float v55;
  BOOL v57;
  float v58;
  float v59;
  vImage_Buffer *p_p;
  vImage_Buffer v63;
  vImage_Buffer __p;
  vImage_Buffer buf;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  result = -22953;
  if (!a3 || !a4 || !a5)
    return result;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v10 = PixelFormatType;
  if ((int)PixelFormatType > 1717856626)
  {
    if ((_DWORD)PixelFormatType == 1717856627)
      goto LABEL_33;
    if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
      goto LABEL_56;
    goto LABEL_12;
  }
  switch((_DWORD)PixelFormatType)
  {
    case 0x4C303066:
LABEL_33:
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      memset(&__p, 0, sizeof(__p));
      v38 = (CGRect *)MEMORY[0x24BDBF090];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a5, *v38, &buf);
      memset(&v63, 0, sizeof(v63));
      PixelBufferUtils::asVImageBuffer(a4, *v38, &v63);
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      if (Height && Width)
      {
        v41 = 0;
        rowBytes = __p.rowBytes;
        data = (char *)buf.data;
        v44 = buf.rowBytes;
        v45 = (char *)v63.data;
        v46 = v63.rowBytes;
        v47 = (char *)__p.data;
        do
        {
          v48 = 0;
          v49 = &data[v44 * v41];
          do
          {
            *(_DWORD *)&v45[4 * v48] = 0;
            _H4 = *(_WORD *)v49;
            __asm { FCVT            S4, H4 }
            _H5 = *((_WORD *)v49 + 1);
            __asm { FCVT            S5, H5 }
            _NF = (float)(fabsf(_S4) + fabsf(_S5)) < 600.0;
            v54 = roundf(_S4);
            v55 = v54 + (float)v48;
            v57 = _NF && v55 < (float)(Width - 1) && v55 > 1.0;
            v58 = roundf(_S5);
            v59 = v58 + (float)v41;
            if (v57 && v59 < (float)(Height - 1) && v59 > 1.0)
              *(_DWORD *)&v45[4 * v48] = *(_DWORD *)&v47[4 * (int)v54 + 4 * v48 + rowBytes * (v41 + (int)v58)];
            ++v48;
            v49 += 4;
          }
          while (Width != v48);
          ++v41;
          v45 += v46;
        }
        while (v41 != Height);
      }
LABEL_54:
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      CVPixelBufferUnlockBaseAddress(a5, 1uLL);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return 0;
    case 0x4C303068:
LABEL_12:
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      memset(&__p, 0, sizeof(__p));
      v11 = (CGRect *)MEMORY[0x24BDBF090];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a5, *v11, &buf);
      memset(&v63, 0, sizeof(v63));
      PixelBufferUtils::asVImageBuffer(a4, *v11, &v63);
      v12 = CVPixelBufferGetWidth(a3);
      v13 = CVPixelBufferGetHeight(a3);
      if (v13 && v12)
      {
        v14 = 0;
        v16 = __p.rowBytes;
        v15 = (char *)buf.data;
        v17 = buf.rowBytes;
        v18 = (char *)v63.data;
        v19 = v63.rowBytes;
        v20 = (char *)__p.data;
        do
        {
          v21 = 0;
          v22 = &v15[v17 * v14];
          do
          {
            *(_WORD *)&v18[2 * v21] = 0;
            _H5 = *(_WORD *)v22;
            __asm { FCVT            S5, H5 }
            _H6 = *((_WORD *)v22 + 1);
            __asm { FCVT            S6, H6 }
            _NF = (float)(fabsf(_S5) + fabsf(_S6)) < 600.0;
            v30 = roundf(_S5);
            v31 = v30 + (float)v21;
            _NF = _NF && v31 < (float)(v12 - 1);
            v33 = _NF && v31 > 1.0;
            v34 = roundf(_S6);
            v35 = v34 + (float)v14;
            if (v33 && v35 < (float)(v13 - 1) && v35 > 1.0)
              *(_WORD *)&v18[2 * v21] = *(_WORD *)&v20[2 * (int)v30 + 2 * v21 + v16 * (v14 + (int)v34)];
            ++v21;
            v22 += 4;
          }
          while (v12 != v21);
          ++v14;
          v18 += v19;
        }
        while (v14 != v13);
      }
      goto LABEL_54;
    case 0x66646570:
      goto LABEL_33;
  }
LABEL_56:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    PixelBufferUtils::pixelFormatAsString(v10, (char *)&__p);
    if ((__p.width & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (vImage_Buffer *)__p.data;
    LODWORD(buf.data) = 136446210;
    *(void **)((char *)&buf.data + 4) = p_p;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unsupported depth map format (%{public}s)", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p.width) < 0)
      operator delete(__p.data);
  }
  return -22956;
}

+ (int64_t)warpPreviousDepth:(__CVBuffer *)a3 intoCurrentDepth:(__CVBuffer *)a4 previousConfidence:(__CVBuffer *)a5 intoCurrentConfidence:(__CVBuffer *)a6 previousNormals:(__CVBuffer *)a7 intoCurrentNormals:(__CVBuffer *)a8 usingOpticalFlow:(__CVBuffer *)a9
{
  int64_t result;
  BOOL v15;

  result = -22953;
  if (a3)
  {
    if (a4)
    {
      result = objc_msgSend(a1, "warpMap:toOutput:usingOpticalFlow:");
      if (!result)
      {
        if (a5 && a6)
          result = objc_msgSend(a1, "warpMap:toOutput:usingOpticalFlow:", a5, a6, a9);
        if (result)
          v15 = 1;
        else
          v15 = a8 == 0;
        if (!v15 && a7 != 0)
          return -22952;
      }
    }
  }
  return result;
}

+ (int64_t)fuseCurrentMap:(__CVBuffer *)a3 previousMap:(__CVBuffer *)a4 intoOutputMap:(__CVBuffer *)a5 usingAlpha:(__CVBuffer *)a6 defaultAlpha:(float)a7 diffThreshold:(float)a8
{
  char *data;
  int64_t result;
  unint64_t PixelFormatType;
  unint64_t v15;
  size_t rowBytes;
  size_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  char *v21;
  size_t v22;
  char *v23;
  size_t v24;
  char *v25;
  __int16 *v26;
  _WORD *v27;
  _WORD *v28;
  __int16 *v29;
  float v39;
  float v40;
  float v48;
  float v49;
  float v57;
  float v58;
  size_t Width;
  size_t Height;
  size_t v62;
  char *v63;
  size_t v64;
  char *v65;
  size_t v66;
  char *v67;
  float *v68;
  float *v69;
  float *v70;
  float *v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  _WORD *v90;
  __int16 *v91;
  _WORD *v92;
  uint64_t v128;
  unint64_t v129;
  float32x4_t v130;
  int8x16_t v131;
  float16x4_t *v133;
  int8x8_t *v134;
  float16x4_t *v135;
  float16x4_t *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  unint64_t v143;
  float16x4_t *v144;
  int8x8_t *v145;
  float16x4_t *v146;
  float16x4_t *v147;
  unint64_t v148;
  float16x4_t v149;
  int8x8_t v150;
  float32x4_t v151;
  float16x4_t v152;
  float16x4_t v153;
  float16x4_t v154;
  float32x4_t v155;
  int8x16_t v156;
  float32x4_t v157;
  size_t v158;
  __int16 v159;
  __int16 v161;
  __int16 v163;
  float v168;
  float v169;
  float v171;
  float *v172;
  float *v173;
  float *v174;
  float v175;
  float v176;
  float v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  float v184;
  float v185;
  float v186;
  float v187;
  uint64_t v188;
  unint64_t v189;
  float32x4_t v190;
  int8x16_t v191;
  int8x16_t *v193;
  int8x16_t *v194;
  float32x4_t *v195;
  int8x16_t *v196;
  char *v197;
  char *v198;
  float *v199;
  float *v200;
  BOOL v201;
  unint64_t v203;
  int8x16_t *v204;
  int8x16_t *v205;
  float32x4_t *v206;
  int8x16_t *v207;
  unint64_t v208;
  int8x16_t v209;
  int8x16_t v210;
  float32x4_t v211;
  float32x4_t v212;
  int8x16_t v213;
  float32x4_t v214;
  size_t v215;
  float v216;
  float v217;
  float v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  float v224;
  uint64_t v225;
  unint64_t v226;
  float32x4_t v227;
  int8x8_t *v228;
  int8x8_t *v229;
  float16x4_t *v230;
  char *v231;
  char *v232;
  char *v233;
  unint64_t v235;
  float16x4_t *v236;
  int8x8_t *v237;
  int8x8_t *v238;
  unint64_t v239;
  float32x4_t v240;
  float32x4_t v241;
  int8x8_t v242;
  size_t v243;
  __int16 v244;
  __int16 v247;
  uint64_t v251;
  unint64_t v252;
  float32x4_t v253;
  int8x16_t *v254;
  int8x16_t *v255;
  float32x4_t *v256;
  unint64_t v257;
  char *v258;
  float *v259;
  float *v260;
  float32x4_t *v261;
  int8x16_t *v262;
  int8x16_t *v263;
  unint64_t v264;
  int8x16_t v265;
  size_t v266;
  float v267;
  float v268;
  float v269;
  float v270;
  vImage_Buffer *p_p;
  int32x2_t v272;
  int32x2_t v273;
  CVPixelBufferRef pixelBuffer;
  vImage_Buffer v275;
  vImage_Buffer v276;
  vImage_Buffer __p;
  vImage_Buffer buf;
  uint64_t v279;

  v279 = *MEMORY[0x24BDAC8D0];
  result = -22953;
  if (!a3 || !a4 || !a5)
    return result;
  v272 = *(int32x2_t *)&a8;
  v273 = *(int32x2_t *)&a7;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v15 = PixelFormatType;
  if ((int)PixelFormatType <= 1717856626)
  {
    if ((_DWORD)PixelFormatType == 1278226536)
      goto LABEL_13;
    if ((_DWORD)PixelFormatType != 1717855600)
    {
LABEL_54:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        PixelBufferUtils::pixelFormatAsString(v15, (char *)&__p);
        if ((__p.width & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (vImage_Buffer *)__p.data;
        LODWORD(buf.data) = 136446210;
        *(void **)((char *)&buf.data + 4) = p_p;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unsupported map format (%{public}s)", (uint8_t *)&buf, 0xCu);
        if (SHIBYTE(__p.width) < 0)
          operator delete(__p.data);
      }
      return -22956;
    }
    goto LABEL_11;
  }
  if ((_DWORD)PixelFormatType == 1717856627)
  {
LABEL_11:
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(a5, 0);
    memset(&__p, 0, sizeof(__p));
    rowBytes = MEMORY[0x24BDBF090];
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
    memset(&buf, 0, sizeof(buf));
    PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)rowBytes, &buf);
    memset(&v276, 0, sizeof(v276));
    PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)rowBytes, &v276);
    pixelBuffer = a6;
    if (a6)
    {
      CVPixelBufferLockBaseAddress(a6, 1uLL);
      PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)rowBytes, &v275);
      data = (char *)v275.data;
      rowBytes = v275.rowBytes;
    }
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (!Height || !Width)
      goto LABEL_226;
    v62 = v276.rowBytes;
    v63 = (char *)__p.data;
    v64 = __p.rowBytes;
    v65 = (char *)buf.data;
    v66 = buf.rowBytes;
    v67 = (char *)v276.data;
    if (a6)
    {
      if (Width < 4)
      {
        v68 = (float *)(data + 8);
        v69 = (float *)((char *)v276.data + 8);
        v70 = (float *)((char *)__p.data + 8);
        v71 = (float *)((char *)buf.data + 4);
        do
        {
          v72 = *(v70 - 2);
          v73 = *(v71 - 1);
          v74 = *(v68 - 2);
          if (v74 >= 0.0)
            v75 = *(v68 - 2);
          else
            v75 = 0.0;
          if (v74 <= 1.0)
            v76 = v75;
          else
            v76 = 1.0;
          if (vabds_f32(v72, v73) >= *(float *)v272.i32)
            v76 = *(float *)v273.i32;
          v77 = (float)(v73 * (float)(1.0 - v76)) + (float)(v72 * v76);
          if (v73 > 0.0)
            v72 = v77;
          *(v69 - 2) = v72;
          if (Width != 1)
          {
            v78 = *(v70 - 1);
            v79 = *v71;
            v80 = *(v68 - 1);
            if (v80 >= 0.0)
              v81 = *(v68 - 1);
            else
              v81 = 0.0;
            if (v80 <= 1.0)
              v82 = v81;
            else
              v82 = 1.0;
            if (vabds_f32(v78, v79) >= *(float *)v272.i32)
              v82 = *(float *)v273.i32;
            v83 = (float)(v79 * (float)(1.0 - v82)) + (float)(v78 * v82);
            if (v79 > 0.0)
              v78 = v83;
            *(v69 - 1) = v78;
            if (Width != 2)
            {
              v84 = *v70;
              v85 = v71[1];
              if (*v68 >= 0.0)
                v86 = *v68;
              else
                v86 = 0.0;
              if (*v68 <= 1.0)
                v87 = v86;
              else
                v87 = 1.0;
              if (vabds_f32(v84, v85) >= *(float *)v272.i32)
                v87 = *(float *)v273.i32;
              v88 = (float)(v85 * (float)(1.0 - v87)) + (float)(v84 * v87);
              if (v85 > 0.0)
                v84 = v88;
              *v69 = v84;
            }
          }
          v68 = (float *)((char *)v68 + rowBytes);
          v69 = (float *)((char *)v69 + v62);
          v70 = (float *)((char *)v70 + v64);
          v71 = (float *)((char *)v71 + v66);
          --Height;
        }
        while (Height);
        goto LABEL_226;
      }
      v188 = 0;
      v189 = 4 * (Width & 0xFFFFFFFFFFFFFFFCLL);
      v190 = (float32x4_t)vdupq_lane_s32(v272, 0);
      v191 = (int8x16_t)vdupq_lane_s32(v273, 0);
      __asm { FMOV            V4.4S, #1.0 }
      v193 = (int8x16_t *)data;
      v194 = (int8x16_t *)v276.data;
      v195 = (float32x4_t *)buf.data;
      v196 = (int8x16_t *)__p.data;
      while (1)
      {
        v197 = &v63[v64 * v188];
        v198 = &v65[v66 * v188];
        v199 = (float *)&v67[v62 * v188];
        v200 = (float *)&data[v188 * rowBytes];
        v201 = (unint64_t)((char *)v199 - v197) >= 0x10 && (unint64_t)((char *)v199 - v198) >= 0x10;
        if (!v201 || (unint64_t)((char *)v199 - (char *)v200) < 0x10)
          break;
        v200 = (float *)((char *)v200 + v189);
        v198 += v189;
        v204 = v193;
        v205 = v194;
        v206 = v195;
        v207 = v196;
        v208 = Width & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          v209 = *v207++;
          v210 = v209;
          v211 = *v206++;
          v212 = v211;
          v213 = *v204++;
          v214 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v190, vabdq_f32((float32x4_t)v210, v212)), vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v213, (float32x4_t)_Q4), _Q4, vbicq_s8(v213, (int8x16_t)vcltzq_f32((float32x4_t)v213))), v191);
          *v205++ = vbslq_s8((int8x16_t)vclezq_f32(v212), v210, (int8x16_t)vmlaq_f32(vmulq_f32(v212, vsubq_f32((float32x4_t)_Q4, v214)), v214, (float32x4_t)v210));
          v208 -= 4;
        }
        while (v208);
        if (Width != (Width & 0xFFFFFFFFFFFFFFFCLL))
        {
          v199 = (float *)((char *)v199 + v189);
          v197 += v189;
          v203 = Width & 0xFFFFFFFFFFFFFFFCLL;
LABEL_184:
          v215 = Width - v203;
          do
          {
            v216 = *(float *)v197;
            v197 += 4;
            v217 = v216;
            v218 = *(float *)v198;
            v198 += 4;
            v219 = v218;
            v220 = *v200++;
            v221 = v220;
            if (v220 >= 0.0)
              v222 = v221;
            else
              v222 = 0.0;
            if (v221 <= 1.0)
              v223 = v222;
            else
              v223 = 1.0;
            if (vabds_f32(v217, v219) >= *(float *)v272.i32)
              v223 = *(float *)v273.i32;
            v224 = (float)(v219 * (float)(1.0 - v223)) + (float)(v217 * v223);
            if (v219 > 0.0)
              v217 = v224;
            *v199++ = v217;
            --v215;
          }
          while (v215);
        }
        ++v188;
        v196 = (int8x16_t *)((char *)v196 + v64);
        v195 = (float32x4_t *)((char *)v195 + v66);
        v194 = (int8x16_t *)((char *)v194 + v62);
        v193 = (int8x16_t *)((char *)v193 + rowBytes);
        if (v188 == Height)
          goto LABEL_226;
      }
      v203 = 0;
      goto LABEL_184;
    }
    v171 = 1.0 - *(float *)v273.i32;
    if (Width < 8)
    {
      v172 = (float *)((char *)v276.data + 12);
      v173 = (float *)((char *)buf.data + 12);
      v174 = (float *)((char *)__p.data + 12);
      do
      {
        v175 = *(v174 - 3);
        v176 = *(v173 - 3);
        if (v176 > 0.0)
          v175 = (float)(v176 * v171) + (float)(v175 * *(float *)v273.i32);
        *(v172 - 3) = v175;
        if (Width != 1)
        {
          v177 = *(v174 - 2);
          v178 = *(v173 - 2);
          if (v178 > 0.0)
            v177 = (float)(v178 * v171) + (float)(v177 * *(float *)v273.i32);
          *(v172 - 2) = v177;
          if (Width != 2)
          {
            v179 = *(v174 - 1);
            v180 = *(v173 - 1);
            if (v180 > 0.0)
              v179 = (float)(v180 * v171) + (float)(v179 * *(float *)v273.i32);
            *(v172 - 1) = v179;
            if (Width != 3)
            {
              v181 = *v174;
              if (*v173 > 0.0)
                v181 = (float)(*v173 * v171) + (float)(*v174 * *(float *)v273.i32);
              *v172 = v181;
              if (Width != 4)
              {
                v182 = v174[1];
                v183 = v173[1];
                if (v183 > 0.0)
                  v182 = (float)(v183 * v171) + (float)(v182 * *(float *)v273.i32);
                v172[1] = v182;
                if (Width != 5)
                {
                  v184 = v174[2];
                  v185 = v173[2];
                  if (v185 > 0.0)
                    v184 = (float)(v185 * v171) + (float)(v184 * *(float *)v273.i32);
                  v172[2] = v184;
                  if (Width != 6)
                  {
                    v186 = v174[3];
                    v187 = v173[3];
                    if (v187 > 0.0)
                      v186 = (float)(v187 * v171) + (float)(v186 * *(float *)v273.i32);
                    v172[3] = v186;
                  }
                }
              }
            }
          }
        }
        v172 = (float *)((char *)v172 + v62);
        v173 = (float *)((char *)v173 + v66);
        v174 = (float *)((char *)v174 + v64);
        --Height;
      }
      while (Height);
      goto LABEL_226;
    }
    v251 = 0;
    v252 = 4 * (Width & 0xFFFFFFFFFFFFFFF8);
    v253 = (float32x4_t)vdupq_lane_s32(v273, 0);
    v254 = (int8x16_t *)((char *)v276.data + 16);
    v255 = (int8x16_t *)((char *)__p.data + 16);
    v256 = (float32x4_t *)((char *)buf.data + 16);
    while (1)
    {
      v257 = 0;
      v258 = &v63[v64 * v251];
      v259 = (float *)&v65[v66 * v251];
      v260 = (float *)&v67[v62 * v251];
      if ((unint64_t)((char *)v260 - v258) < 0x20 || (unint64_t)((char *)v260 - (char *)v259) < 0x20)
        goto LABEL_221;
      v259 = (float *)((char *)v259 + v252);
      v261 = v256;
      v262 = v255;
      v263 = v254;
      v264 = Width & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v265 = vbslq_s8((int8x16_t)vclezq_f32(*v261), *v262, (int8x16_t)vmlaq_f32(vmulq_n_f32(*v261, v171), v253, *(float32x4_t *)v262));
        v263[-1] = vbslq_s8((int8x16_t)vclezq_f32(v261[-1]), v262[-1], (int8x16_t)vmlaq_f32(vmulq_n_f32(v261[-1], v171), v253, (float32x4_t)v262[-1]));
        *v263 = v265;
        v263 += 2;
        v262 += 2;
        v261 += 2;
        v264 -= 8;
      }
      while (v264);
      if (Width != (Width & 0xFFFFFFFFFFFFFFF8))
        break;
LABEL_214:
      ++v251;
      v254 = (int8x16_t *)((char *)v254 + v62);
      v255 = (int8x16_t *)((char *)v255 + v64);
      v256 = (float32x4_t *)((char *)v256 + v66);
      if (v251 == Height)
        goto LABEL_226;
    }
    v260 = (float *)((char *)v260 + v252);
    v258 += v252;
    v257 = Width & 0xFFFFFFFFFFFFFFF8;
LABEL_221:
    v266 = Width - v257;
    do
    {
      v267 = *(float *)v258;
      v258 += 4;
      v268 = v267;
      v269 = *v259++;
      v270 = (float)(v269 * v171) + (float)(v268 * *(float *)v273.i32);
      if (v269 > 0.0)
        v268 = v270;
      *v260++ = v268;
      --v266;
    }
    while (v266);
    goto LABEL_214;
  }
  if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
    goto LABEL_54;
LABEL_13:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  CVPixelBufferLockBaseAddress(a5, 0);
  memset(&__p, 0, sizeof(__p));
  v17 = MEMORY[0x24BDBF090];
  PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
  memset(&buf, 0, sizeof(buf));
  PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)v17, &buf);
  memset(&v276, 0, sizeof(v276));
  PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)v17, &v276);
  pixelBuffer = a6;
  if (a6)
  {
    CVPixelBufferLockBaseAddress(a6, 1uLL);
    PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)v17, &v275);
    data = (char *)v275.data;
    v17 = v275.rowBytes;
  }
  v18 = CVPixelBufferGetWidth(a3);
  v19 = CVPixelBufferGetHeight(a3);
  if (!v19 || !v18)
    goto LABEL_226;
  v20 = v276.rowBytes;
  v21 = (char *)__p.data;
  v22 = __p.rowBytes;
  v23 = (char *)buf.data;
  v24 = buf.rowBytes;
  v25 = (char *)v276.data;
  if (!a6)
  {
    v89 = 1.0 - *(float *)v273.i32;
    if (v18 < 8)
    {
      v90 = (char *)v276.data + 6;
      v91 = (__int16 *)((char *)buf.data + 6);
      v92 = (char *)__p.data + 6;
      do
      {
        LOWORD(_S1) = *(v92 - 3);
        __asm { FCVT            S2, H1 }
        _H3 = *(v91 - 3);
        __asm { FCVT            S3, H3 }
        _S2 = (float)(v89 * _S3) + (float)(_S2 * *(float *)v273.i32);
        __asm { FCVT            H2, S2 }
        if (_S3 > 0.0)
          _S1 = _S2;
        *(v90 - 3) = LOWORD(_S1);
        if (v18 != 1)
        {
          LOWORD(_S1) = *(v92 - 2);
          __asm { FCVT            S2, H1 }
          _H3 = *(v91 - 2);
          __asm { FCVT            S3, H3 }
          _S2 = (float)(v89 * _S3) + (float)(_S2 * *(float *)v273.i32);
          __asm { FCVT            H2, S2 }
          if (_S3 > 0.0)
            _S1 = _S2;
          *(v90 - 2) = LOWORD(_S1);
          if (v18 != 2)
          {
            LOWORD(_S1) = *(v92 - 1);
            __asm { FCVT            S2, H1 }
            _H3 = *(v91 - 1);
            __asm { FCVT            S3, H3 }
            _S2 = (float)(v89 * _S3) + (float)(_S2 * *(float *)v273.i32);
            __asm { FCVT            H2, S2 }
            if (_S3 > 0.0)
              _S1 = _S2;
            *(v90 - 1) = LOWORD(_S1);
            if (v18 != 3)
            {
              LOWORD(_S1) = *v92;
              __asm { FCVT            S2, H1 }
              _H3 = *v91;
              __asm { FCVT            S3, H3 }
              _S2 = (float)(v89 * _S3) + (float)(_S2 * *(float *)v273.i32);
              __asm { FCVT            H2, S2 }
              if (_S3 > 0.0)
                _S1 = _S2;
              *v90 = LOWORD(_S1);
              if (v18 != 4)
              {
                LOWORD(_S1) = v92[1];
                __asm { FCVT            S2, H1 }
                _H3 = v91[1];
                __asm { FCVT            S3, H3 }
                _S2 = (float)(v89 * _S3) + (float)(_S2 * *(float *)v273.i32);
                __asm { FCVT            H2, S2 }
                if (_S3 > 0.0)
                  _S1 = _S2;
                v90[1] = LOWORD(_S1);
                if (v18 != 5)
                {
                  LOWORD(_S1) = v92[2];
                  __asm { FCVT            S2, H1 }
                  _H3 = v91[2];
                  __asm { FCVT            S3, H3 }
                  _S2 = (float)(v89 * _S3) + (float)(_S2 * *(float *)v273.i32);
                  __asm { FCVT            H2, S2 }
                  if (_S3 > 0.0)
                    _S1 = _S2;
                  v90[2] = LOWORD(_S1);
                  if (v18 != 6)
                  {
                    LOWORD(_S1) = v92[3];
                    __asm { FCVT            S2, H1 }
                    _H3 = v91[3];
                    __asm { FCVT            S3, H3 }
                    _S2 = (float)(v89 * _S3) + (float)(_S2 * *(float *)v273.i32);
                    __asm { FCVT            H2, S2 }
                    if (_S3 > 0.0)
                      _S1 = _S2;
                    v90[3] = LOWORD(_S1);
                  }
                }
              }
            }
          }
        }
        v90 = (_WORD *)((char *)v90 + v20);
        v91 = (__int16 *)((char *)v91 + v24);
        v92 = (_WORD *)((char *)v92 + v22);
        --v19;
      }
      while (v19);
      goto LABEL_226;
    }
    v225 = 0;
    v226 = 2 * (v18 & 0xFFFFFFFFFFFFFFF8);
    v227 = (float32x4_t)vdupq_lane_s32(v273, 0);
    v228 = (int8x8_t *)((char *)v276.data + 8);
    v229 = (int8x8_t *)((char *)__p.data + 8);
    v230 = (float16x4_t *)((char *)buf.data + 8);
    while (1)
    {
      v231 = &v21[v22 * v225];
      v232 = &v23[v24 * v225];
      v233 = &v25[v20 * v225];
      if ((unint64_t)(v233 - v231) < 0x10 || (unint64_t)(v233 - v232) < 0x10)
        break;
      v232 += v226;
      v236 = v230;
      v237 = v229;
      v238 = v228;
      v239 = v18 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v240 = vcvtq_f32_f16(v236[-1]);
        v241 = vcvtq_f32_f16(*v236);
        v242 = vbsl_s8((int8x8_t)vmovn_s32(vclezq_f32(v241)), *v237, (int8x8_t)vcvt_f16_f32(vmlaq_f32(vmulq_n_f32(v241, v89), v227, vcvtq_f32_f16((float16x4_t)*v237))));
        v238[-1] = vbsl_s8((int8x8_t)vmovn_s32(vclezq_f32(v240)), v237[-1], (int8x8_t)vcvt_f16_f32(vmlaq_f32(vmulq_n_f32(v240, v89), v227, vcvtq_f32_f16((float16x4_t)v237[-1]))));
        *v238 = v242;
        v238 += 2;
        v237 += 2;
        v236 += 2;
        v239 -= 8;
      }
      while (v239);
      if (v18 != (v18 & 0xFFFFFFFFFFFFFFF8))
      {
        v233 += v226;
        v231 += v226;
        v235 = v18 & 0xFFFFFFFFFFFFFFF8;
LABEL_208:
        v243 = v18 - v235;
        do
        {
          v244 = *(_WORD *)v231;
          v231 += 2;
          LOWORD(_S2) = v244;
          __asm { FCVT            S3, H2 }
          v247 = *(_WORD *)v232;
          v232 += 2;
          _H4 = v247;
          __asm { FCVT            S4, H4 }
          _S3 = (float)(v89 * _S4) + (float)(_S3 * *(float *)v273.i32);
          __asm { FCVT            H3, S3 }
          if (_S4 > 0.0)
            _S2 = _S3;
          *(_WORD *)v233 = LOWORD(_S2);
          v233 += 2;
          --v243;
        }
        while (v243);
      }
      ++v225;
      v228 = (int8x8_t *)((char *)v228 + v20);
      v229 = (int8x8_t *)((char *)v229 + v22);
      v230 = (float16x4_t *)((char *)v230 + v24);
      if (v225 == v19)
        goto LABEL_226;
    }
    v235 = 0;
    goto LABEL_208;
  }
  if (v18 >= 4)
  {
    v128 = 0;
    v129 = 2 * (v18 & 0xFFFFFFFFFFFFFFFCLL);
    v130 = (float32x4_t)vdupq_lane_s32(v272, 0);
    v131 = (int8x16_t)vdupq_lane_s32(v273, 0);
    __asm { FMOV            V4.4S, #1.0 }
    v133 = (float16x4_t *)data;
    v134 = (int8x8_t *)v276.data;
    v135 = (float16x4_t *)buf.data;
    v136 = (float16x4_t *)__p.data;
    while (1)
    {
      v137 = &v21[v22 * v128];
      v138 = &v23[v24 * v128];
      v139 = &v25[v20 * v128];
      v140 = &data[v128 * v17];
      _CF = (unint64_t)(v139 - v137) >= 8 && (unint64_t)(v139 - v138) >= 8;
      if (!_CF || (unint64_t)(v139 - v140) < 8)
        break;
      v140 += v129;
      v138 += v129;
      v144 = v133;
      v145 = v134;
      v146 = v135;
      v147 = v136;
      v148 = v18 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v149 = *v147++;
        v150 = (int8x8_t)v149;
        v151 = vcvtq_f32_f16(v149);
        v152 = *v146++;
        v153 = v152;
        v154 = *v144++;
        v155 = vcvtq_f32_f16(v153);
        v156 = (int8x16_t)vcvtq_f32_f16(v154);
        v157 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v130, vabdq_f32(v151, v155)), vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v156, (float32x4_t)_Q4), _Q4, vbicq_s8(v156, (int8x16_t)vcltzq_f32((float32x4_t)v156))), v131);
        *v145++ = vbsl_s8((int8x8_t)vmovn_s32(vclezq_f32(v155)), v150, (int8x8_t)vcvt_f16_f32(vmlaq_f32(vmulq_f32(vsubq_f32((float32x4_t)_Q4, v157), v155), v157, v151)));
        v148 -= 4;
      }
      while (v148);
      if (v18 != (v18 & 0xFFFFFFFFFFFFFFFCLL))
      {
        v139 += v129;
        v137 += v129;
        v143 = v18 & 0xFFFFFFFFFFFFFFFCLL;
LABEL_133:
        v158 = v18 - v143;
        do
        {
          v159 = *(_WORD *)v137;
          v137 += 2;
          LOWORD(_S5) = v159;
          v161 = *(_WORD *)v138;
          v138 += 2;
          _H6 = v161;
          v163 = *(_WORD *)v140;
          v140 += 2;
          _H7 = v163;
          __asm
          {
            FCVT            S16, H5
            FCVT            S6, H6
            FCVT            S7, H7
          }
          if (_S7 >= 0.0)
            v168 = _S7;
          else
            v168 = 0.0;
          if (_S7 <= 1.0)
            v169 = v168;
          else
            v169 = 1.0;
          if (vabds_f32(_S16, _S6) >= *(float *)v272.i32)
            v169 = *(float *)v273.i32;
          _S7 = (float)((float)(1.0 - v169) * _S6) + (float)(_S16 * v169);
          __asm { FCVT            H7, S7 }
          if (_S6 > 0.0)
            _S5 = _S7;
          *(_WORD *)v139 = LOWORD(_S5);
          v139 += 2;
          --v158;
        }
        while (v158);
      }
      ++v128;
      v136 = (float16x4_t *)((char *)v136 + v22);
      v135 = (float16x4_t *)((char *)v135 + v24);
      v134 = (int8x8_t *)((char *)v134 + v20);
      v133 = (float16x4_t *)((char *)v133 + v17);
      if (v128 == v19)
        goto LABEL_226;
    }
    v143 = 0;
    goto LABEL_133;
  }
  v26 = (__int16 *)(data + 4);
  v27 = (char *)v276.data + 4;
  v28 = (char *)__p.data + 4;
  v29 = (__int16 *)((char *)buf.data + 2);
  do
  {
    LOWORD(_S2) = *(v28 - 2);
    __asm { FCVT            S3, H2 }
    _H4 = *(v29 - 1);
    __asm { FCVT            S4, H4 }
    _H5 = *(v26 - 2);
    __asm { FCVT            S5, H5 }
    if (_S5 >= 0.0)
      v39 = _S5;
    else
      v39 = 0.0;
    if (_S5 <= 1.0)
      v40 = v39;
    else
      v40 = 1.0;
    if (vabds_f32(_S3, _S4) >= *(float *)v272.i32)
      v40 = *(float *)v273.i32;
    _S3 = (float)((float)(1.0 - v40) * _S4) + (float)(_S3 * v40);
    __asm { FCVT            H3, S3 }
    if (_S4 > 0.0)
      _S2 = _S3;
    *(v27 - 2) = LOWORD(_S2);
    if (v18 != 1)
    {
      LOWORD(_S2) = *(v28 - 1);
      __asm { FCVT            S3, H2 }
      _H4 = *v29;
      __asm { FCVT            S4, H4 }
      _H5 = *(v26 - 1);
      __asm { FCVT            S5, H5 }
      if (_S5 >= 0.0)
        v48 = _S5;
      else
        v48 = 0.0;
      if (_S5 <= 1.0)
        v49 = v48;
      else
        v49 = 1.0;
      if (vabds_f32(_S3, _S4) >= *(float *)v272.i32)
        v49 = *(float *)v273.i32;
      _S3 = (float)((float)(1.0 - v49) * _S4) + (float)(_S3 * v49);
      __asm { FCVT            H3, S3 }
      if (_S4 > 0.0)
        _S2 = _S3;
      *(v27 - 1) = LOWORD(_S2);
      if (v18 != 2)
      {
        LOWORD(_S2) = *v28;
        __asm { FCVT            S3, H2 }
        _H4 = v29[1];
        __asm { FCVT            S4, H4 }
        _H5 = *v26;
        __asm { FCVT            S5, H5 }
        if (_S5 >= 0.0)
          v57 = _S5;
        else
          v57 = 0.0;
        if (_S5 <= 1.0)
          v58 = v57;
        else
          v58 = 1.0;
        if (vabds_f32(_S3, _S4) >= *(float *)v272.i32)
          v58 = *(float *)v273.i32;
        _S3 = (float)((float)(1.0 - v58) * _S4) + (float)(_S3 * v58);
        __asm { FCVT            H3, S3 }
        if (_S4 > 0.0)
          _S2 = _S3;
        *v27 = LOWORD(_S2);
      }
    }
    v26 = (__int16 *)((char *)v26 + v17);
    v27 = (_WORD *)((char *)v27 + v20);
    v28 = (_WORD *)((char *)v28 + v22);
    v29 = (__int16 *)((char *)v29 + v24);
    --v19;
  }
  while (v19);
LABEL_226:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  CVPixelBufferUnlockBaseAddress(a5, 0);
  if (pixelBuffer)
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return 0;
}

+ (int64_t)fuseCurrentDepthAndConfidenceMaps:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 currentConfidence:(__CVBuffer *)a5 previousConfidence:(__CVBuffer *)a6 outputDepth:(__CVBuffer *)a7 outputConfidence:(__CVBuffer *)a8 defaultAlpha:(float)a9 depthMaxDiff:(float)a10
{
  unint64_t PixelFormatType;
  unint64_t v18;
  unint64_t v19;
  void **v20;
  NSObject *v21;
  const char *v22;
  void **v23;
  size_t v24;
  char *v25;
  char *v26;
  char *v27;
  __CVBuffer *v28;
  __CVBuffer *v29;
  char *v30;
  __CVBuffer *v31;
  char *v32;
  size_t v33;
  size_t v34;
  size_t v35;
  size_t v36;
  size_t v37;
  size_t v38;
  uint64_t m;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  size_t v45;
  char *v46;
  float v58;
  double v61;
  size_t v65;
  char *v66;
  char *v67;
  char *v68;
  __CVBuffer *v69;
  __CVBuffer *v70;
  char *v71;
  __CVBuffer *v72;
  char *v73;
  size_t v74;
  size_t v75;
  size_t v76;
  size_t v77;
  size_t v78;
  size_t v79;
  uint64_t k;
  char *v81;
  char *v82;
  char *v83;
  float *v84;
  float *v85;
  size_t v86;
  float *v87;
  float v90;
  float v92;
  double v95;
  size_t Height;
  char *v99;
  char *v100;
  char *v101;
  __CVBuffer *v102;
  __CVBuffer *v103;
  char *v104;
  __CVBuffer *v105;
  char *v106;
  size_t BytesPerRow;
  size_t v108;
  size_t v109;
  size_t v110;
  size_t v111;
  size_t v112;
  uint64_t i;
  float *v114;
  float *v115;
  float *v116;
  char *v117;
  char *v118;
  size_t v119;
  char *v120;
  float v121;
  float v126;
  double v127;
  size_t v130;
  char *v131;
  char *v132;
  char *v133;
  __CVBuffer *v134;
  __CVBuffer *v135;
  char *v136;
  __CVBuffer *v137;
  char *v138;
  size_t v139;
  size_t v140;
  size_t v141;
  size_t v142;
  size_t v143;
  size_t v144;
  uint64_t j;
  float *v146;
  float *v147;
  float *v148;
  float *v149;
  float *v150;
  size_t v151;
  float *v152;
  float v153;
  float v154;
  float v155;
  double v156;
  void **v157;
  char *v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;
  char *BaseAddress;
  char *v165;
  size_t v166;
  size_t v167;
  size_t Width;
  size_t v169;
  __CVBuffer *v170;
  CVPixelBufferRef v171;
  CVPixelBufferRef v172;
  CVPixelBufferRef v173;
  __CVBuffer *v174;
  CVPixelBufferRef pixelBuffer;
  void *__p[2];
  char v177;
  uint8_t buf[4];
  void **v179;
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v18 = CVPixelBufferGetPixelFormatType(a5);
  v19 = v18;
  if ((int)PixelFormatType <= 1717856626)
  {
    if ((_DWORD)PixelFormatType == 1278226536)
      goto LABEL_16;
    if ((_DWORD)PixelFormatType != 1717855600)
    {
LABEL_46:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        return -22956;
      PixelBufferUtils::pixelFormatAsString(PixelFormatType, (char *)__p);
      if (v177 >= 0)
        v157 = __p;
      else
        v157 = (void **)__p[0];
      *(_DWORD *)buf = 136446210;
      v179 = v157;
      v21 = MEMORY[0x24BDACB70];
      v22 = "unsupported depth map format (%{public}s)";
LABEL_75:
      _os_log_error_impl(&dword_20B62B000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
      if (v177 < 0)
        operator delete(__p[0]);
      return -22956;
    }
LABEL_8:
    if ((int)v18 > 1717855599)
    {
      if ((_DWORD)v18 != 1717855600)
      {
        if ((_DWORD)v18 != 1751410032)
        {
LABEL_11:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            PixelBufferUtils::pixelFormatAsString(v19, (char *)__p);
            if (v177 >= 0)
              v20 = __p;
            else
              v20 = (void **)__p[0];
            *(_DWORD *)buf = 136446210;
            v179 = v20;
            v21 = MEMORY[0x24BDACB70];
            v22 = "unsupported conf map format (%{public}s)";
            goto LABEL_75;
          }
          return -22956;
        }
LABEL_50:
        CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 1uLL);
        CVPixelBufferLockBaseAddress(a7, 0);
        CVPixelBufferLockBaseAddress(a5, 1uLL);
        CVPixelBufferLockBaseAddress(a6, 1uLL);
        CVPixelBufferLockBaseAddress(a8, 0);
        Width = CVPixelBufferGetWidth(a3);
        Height = CVPixelBufferGetHeight(a3);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
        v160 = (char *)CVPixelBufferGetBaseAddress(a4);
        v99 = (char *)CVPixelBufferGetBaseAddress(a7);
        v100 = (char *)CVPixelBufferGetBaseAddress(a5);
        v101 = (char *)CVPixelBufferGetBaseAddress(a6);
        v102 = a8;
        pixelBuffer = a8;
        v103 = a3;
        v104 = v101;
        v105 = a6;
        v106 = (char *)CVPixelBufferGetBaseAddress(v102);
        v170 = v103;
        BytesPerRow = CVPixelBufferGetBytesPerRow(v103);
        v171 = a4;
        v108 = CVPixelBufferGetBytesPerRow(a4);
        v172 = a7;
        v109 = CVPixelBufferGetBytesPerRow(a7);
        v173 = a5;
        v110 = CVPixelBufferGetBytesPerRow(a5);
        v174 = v105;
        v111 = CVPixelBufferGetBytesPerRow(v105);
        v112 = CVPixelBufferGetBytesPerRow(pixelBuffer);
        if (Height && Width)
        {
          for (i = 0; i != Height; ++i)
          {
            v114 = (float *)&BaseAddress[i * BytesPerRow];
            v115 = (float *)&v160[i * v108];
            v116 = (float *)&v99[i * v109];
            v117 = &v100[i * v110];
            v118 = &v104[i * v111];
            v119 = Width;
            v120 = &v106[i * v112];
            do
            {
              v121 = *v114;
              _H2 = *(_WORD *)v117;
              if (*v115 > 0.0)
              {
                __asm { FCVT            S2, H2 }
                _H4 = *(_WORD *)v118;
                __asm { FCVT            S5, H4 }
                v126 = _S2 * _S5;
                if (v126 <= a9)
                  v126 = a9;
                v127 = 1.0 - v126;
                v121 = (float)(v121 * v126) + *v115 * v127;
                __asm { FCVT            D3, H4 }
                _D2 = (float)(v126 * _S2) + _D3 * v127;
                __asm { FCVT            H2, D2 }
              }
              *v116++ = v121;
              *(_WORD *)v120 = _H2;
              v120 += 2;
              ++v114;
              ++v115;
              v117 += 2;
              v118 += 2;
              --v119;
            }
            while (v119);
          }
        }
        goto LABEL_70;
      }
    }
    else if ((_DWORD)v18 != 1278226534)
    {
      if ((_DWORD)v18 != 1278226536)
        goto LABEL_11;
      goto LABEL_50;
    }
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(a7, 0);
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    CVPixelBufferLockBaseAddress(a6, 1uLL);
    CVPixelBufferLockBaseAddress(a8, 0);
    v169 = CVPixelBufferGetWidth(a3);
    v130 = CVPixelBufferGetHeight(a3);
    v165 = (char *)CVPixelBufferGetBaseAddress(a3);
    v161 = (char *)CVPixelBufferGetBaseAddress(a4);
    v131 = (char *)CVPixelBufferGetBaseAddress(a7);
    v132 = (char *)CVPixelBufferGetBaseAddress(a5);
    v133 = (char *)CVPixelBufferGetBaseAddress(a6);
    v134 = a8;
    pixelBuffer = a8;
    v135 = a3;
    v136 = v133;
    v137 = a6;
    v138 = (char *)CVPixelBufferGetBaseAddress(v134);
    v170 = v135;
    v139 = CVPixelBufferGetBytesPerRow(v135);
    v171 = a4;
    v140 = CVPixelBufferGetBytesPerRow(a4);
    v172 = a7;
    v141 = CVPixelBufferGetBytesPerRow(a7);
    v173 = a5;
    v142 = CVPixelBufferGetBytesPerRow(a5);
    v174 = v137;
    v143 = CVPixelBufferGetBytesPerRow(v137);
    v144 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (v130 && v169)
    {
      for (j = 0; j != v130; ++j)
      {
        v146 = (float *)&v165[j * v139];
        v147 = (float *)&v161[j * v140];
        v148 = (float *)&v131[j * v141];
        v149 = (float *)&v132[j * v142];
        v150 = (float *)&v136[j * v143];
        v151 = v169;
        v152 = (float *)&v138[j * v144];
        do
        {
          v153 = *v146;
          v154 = *v149;
          if (*v147 > 0.0)
          {
            v155 = v154 * *v150;
            if (v155 <= a9)
              v155 = a9;
            v156 = 1.0 - v155;
            v153 = (float)(v153 * v155) + *v147 * v156;
            v154 = (float)(v154 * v155) + *v150 * v156;
          }
          *v148++ = v153;
          *v152++ = v154;
          ++v146;
          ++v147;
          ++v149;
          ++v150;
          --v151;
        }
        while (v151);
      }
    }
    goto LABEL_70;
  }
  if ((_DWORD)PixelFormatType == 1717856627)
    goto LABEL_8;
  if ((_DWORD)PixelFormatType != 1751411059 && (_DWORD)PixelFormatType != 1751410032)
    goto LABEL_46;
LABEL_16:
  if ((int)v18 > 1717855599)
  {
    if ((_DWORD)v18 != 1717855600)
    {
      if ((_DWORD)v18 != 1751410032)
      {
LABEL_19:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          PixelBufferUtils::pixelFormatAsString(v19, (char *)__p);
          if (v177 >= 0)
            v23 = __p;
          else
            v23 = (void **)__p[0];
          *(_DWORD *)buf = 136446210;
          v179 = v23;
          v21 = MEMORY[0x24BDACB70];
          v22 = "unsupported conf map format (%{public}s)";
          goto LABEL_75;
        }
        return -22956;
      }
      goto LABEL_26;
    }
LABEL_36:
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(a7, 0);
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    CVPixelBufferLockBaseAddress(a6, 1uLL);
    CVPixelBufferLockBaseAddress(a8, 0);
    v167 = CVPixelBufferGetWidth(a3);
    v65 = CVPixelBufferGetHeight(a3);
    v163 = (char *)CVPixelBufferGetBaseAddress(a3);
    v159 = (char *)CVPixelBufferGetBaseAddress(a4);
    v66 = (char *)CVPixelBufferGetBaseAddress(a7);
    v67 = (char *)CVPixelBufferGetBaseAddress(a5);
    v68 = (char *)CVPixelBufferGetBaseAddress(a6);
    v69 = a8;
    pixelBuffer = a8;
    v70 = a3;
    v71 = v68;
    v72 = a6;
    v73 = (char *)CVPixelBufferGetBaseAddress(v69);
    v170 = v70;
    v74 = CVPixelBufferGetBytesPerRow(v70);
    v171 = a4;
    v75 = CVPixelBufferGetBytesPerRow(a4);
    v172 = a7;
    v76 = CVPixelBufferGetBytesPerRow(a7);
    v173 = a5;
    v77 = CVPixelBufferGetBytesPerRow(a5);
    v174 = v72;
    v78 = CVPixelBufferGetBytesPerRow(v72);
    v79 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (v65 && v167)
    {
      for (k = 0; k != v65; ++k)
      {
        v81 = &v163[k * v74];
        v82 = &v159[k * v75];
        v83 = &v66[k * v76];
        v84 = (float *)&v67[k * v77];
        v85 = (float *)&v71[k * v78];
        v86 = v167;
        v87 = (float *)&v73[k * v79];
        do
        {
          _H2 = *(_WORD *)v81;
          _H3 = *(_WORD *)v82;
          v90 = *v84;
          __asm { FCVT            S4, H3 }
          if (_S4 > 0.0)
          {
            v92 = v90 * *v85;
            if (v92 <= a9)
              v92 = a9;
            __asm
            {
              FCVT            S2, H2
              FCVT            D3, H3
            }
            v95 = 1.0 - v92;
            _D2 = (float)(v92 * _S2) + _D3 * v95;
            __asm { FCVT            H2, D2 }
            v90 = (float)(v90 * v92) + *v85 * v95;
          }
          *(_WORD *)v83 = _H2;
          v83 += 2;
          *v87++ = v90;
          v81 += 2;
          v82 += 2;
          ++v84;
          ++v85;
          --v86;
        }
        while (v86);
      }
    }
    goto LABEL_70;
  }
  if ((_DWORD)v18 == 1278226534)
    goto LABEL_36;
  if ((_DWORD)v18 != 1278226536)
    goto LABEL_19;
LABEL_26:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  CVPixelBufferLockBaseAddress(a7, 0);
  CVPixelBufferLockBaseAddress(a5, 1uLL);
  CVPixelBufferLockBaseAddress(a6, 1uLL);
  CVPixelBufferLockBaseAddress(a8, 0);
  v166 = CVPixelBufferGetWidth(a3);
  v24 = CVPixelBufferGetHeight(a3);
  v162 = (char *)CVPixelBufferGetBaseAddress(a3);
  v158 = (char *)CVPixelBufferGetBaseAddress(a4);
  v25 = (char *)CVPixelBufferGetBaseAddress(a7);
  v26 = (char *)CVPixelBufferGetBaseAddress(a5);
  v27 = (char *)CVPixelBufferGetBaseAddress(a6);
  v28 = a8;
  pixelBuffer = a8;
  v29 = a3;
  v30 = v27;
  v31 = a6;
  v32 = (char *)CVPixelBufferGetBaseAddress(v28);
  v170 = v29;
  v33 = CVPixelBufferGetBytesPerRow(v29);
  v171 = a4;
  v34 = CVPixelBufferGetBytesPerRow(a4);
  v172 = a7;
  v35 = CVPixelBufferGetBytesPerRow(a7);
  v173 = a5;
  v36 = CVPixelBufferGetBytesPerRow(a5);
  v174 = v31;
  v37 = CVPixelBufferGetBytesPerRow(v31);
  v38 = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (v24 && v166)
  {
    for (m = 0; m != v24; ++m)
    {
      v40 = &v162[m * v33];
      v41 = &v158[m * v34];
      v42 = &v25[m * v35];
      v43 = &v26[m * v36];
      v44 = &v30[m * v37];
      v45 = v166;
      v46 = &v32[m * v38];
      do
      {
        _H1 = *(_WORD *)v40;
        _H3 = *(_WORD *)v41;
        _H2 = *(_WORD *)v43;
        __asm { FCVT            S4, H3 }
        if (_S4 > 0.0)
        {
          __asm { FCVT            S2, H2 }
          _H4 = *(_WORD *)v44;
          __asm { FCVT            S5, H4 }
          v58 = _S2 * _S5;
          if (v58 <= a9)
            v58 = a9;
          __asm
          {
            FCVT            S1, H1
            FCVT            D3, H3
          }
          v61 = 1.0 - v58;
          _D1 = (float)(v58 * _S1) + _D3 * v61;
          __asm
          {
            FCVT            H1, D1
            FCVT            D3, H4
          }
          _D2 = (float)(v58 * _S2) + _D3 * v61;
          __asm { FCVT            H2, D2 }
        }
        *(_WORD *)v42 = _H1;
        v42 += 2;
        *(_WORD *)v46 = _H2;
        v46 += 2;
        v40 += 2;
        v41 += 2;
        v43 += 2;
        v44 += 2;
        --v45;
      }
      while (v45);
    }
  }
LABEL_70:
  CVPixelBufferUnlockBaseAddress(v170, 1uLL);
  CVPixelBufferUnlockBaseAddress(v171, 1uLL);
  CVPixelBufferUnlockBaseAddress(v172, 0);
  CVPixelBufferUnlockBaseAddress(v173, 1uLL);
  CVPixelBufferUnlockBaseAddress(v174, 1uLL);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return 0;
}

+ (int64_t)fuseCurrentDepth:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 intoOutputDepth:(__CVBuffer *)a5 currentConfidence:(__CVBuffer *)a6 previousConfidence:(__CVBuffer *)a7 intoOutputConfidence:(__CVBuffer *)a8 currentNormals:(__CVBuffer *)a9 previousNormals:(__CVBuffer *)a10 intoOutputNormals:(__CVBuffer *)a11 usingAlpha:(__CVBuffer *)a12 defaultAlpha:(float)a13 confidenceUnits:(unint64_t)a14
{
  int64_t result;
  OSType PixelFormatType;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;

  result = -22953;
  if (a3)
  {
    if (a5)
    {
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      result = -22953;
      if (PixelFormatType != 1717856627 && PixelFormatType != 1751411059)
      {
        if (a8 && a7 && a6 && !a12)
        {
          LODWORD(v25) = 0.5;
          *(float *)&v24 = a13;
          result = objc_msgSend(a1, "fuseCurrentDepthAndConfidenceMaps:previousDepth:currentConfidence:previousConfidence:outputDepth:outputConfidence:defaultAlpha:depthMaxDiff:", a3, a4, a6, a7, a5, a8, v24, v25);
        }
        else
        {
          LODWORD(v25) = 0.5;
          *(float *)&v24 = a13;
          result = objc_msgSend(a1, "fuseCurrentMap:previousMap:intoOutputMap:usingAlpha:defaultAlpha:diffThreshold:", a3, a4, a5, a12, v24, v25);
          if (a6 && a7 && a8 && !result)
          {
            LODWORD(v27) = 1.0;
            *(float *)&v26 = a13;
            result = objc_msgSend(a1, "fuseCurrentMap:previousMap:intoOutputMap:usingAlpha:defaultAlpha:diffThreshold:", a6, a7, a8, a12, v26, v27);
          }
        }
        if (result)
          v28 = 1;
        else
          v28 = a11 == 0;
        if (!v28 && a10 != 0 && a9 != 0)
          return -22952;
      }
    }
  }
  return result;
}

+ (int64_t)ADReturnFromOSStatus:(int)a3
{
  if (a3)
    return -22950;
  else
    return 0;
}

+ (void)convertRGBAFloat:(__CVBuffer *)a3 toPlanar:(__CVBuffer *)a4
{
  CGRect *v6;
  char *data;
  vImagePixelCount v8;
  char *v9;
  char *v10;
  size_t v11;
  PixelBufferUtils *PixelFormatType;
  uint64_t v13;
  unsigned int v14;
  __int128 v15;
  BOOL v16;
  char v18;
  char *BaseAddress;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  BOOL v35;
  BOOL v37;
  BOOL v39;
  BOOL v41;
  BOOL v43;
  BOOL v45;
  BOOL v47;
  BOOL v49;
  BOOL v51;
  uint64_t v53;
  int16x8_t *v54;
  unint64_t v55;
  const __int16 *v56;
  unsigned int v57;
  unsigned int v58;
  uint64_t v59;
  CVPixelBufferRef v60;
  char v61;
  char *v62;
  vImagePixelCount height;
  CVPixelBufferRef pixelBuffer;
  vImage_Buffer v65;
  vImage_Buffer v66;
  vImage_Buffer v67;
  vImage_Buffer v68;
  vImage_Buffer v69;
  vImage_Buffer *destPlanarBuffers[4];
  void *srcChannels[6];
  int16x8x4_t v72;

  srcChannels[4] = *(void **)MEMORY[0x24BDAC8D0];
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  memset(&v69, 0, sizeof(v69));
  v6 = (CGRect *)MEMORY[0x24BDBF090];
  PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &v69);
  memset(&v68, 0, sizeof(v68));
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v68);
  v67.height = 0;
  v67.width = 0;
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v67);
  v66.height = 0;
  v66.width = 0;
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v66);
  v65.height = 0;
  v65.width = 0;
  v60 = a4;
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v65);
  data = (char *)v68.data;
  v8 = (v68.height * v68.rowBytes) >> 2;
  v9 = (char *)v68.data + v8;
  v10 = (char *)v68.data + v8 + v8;
  v11 = v68.rowBytes >> 2;
  v62 = &v10[v8];
  v65.data = &v10[v8];
  v65.rowBytes = v68.rowBytes >> 2;
  v66.data = v10;
  v66.rowBytes = v68.rowBytes >> 2;
  v67.data = (char *)v68.data + v8;
  v67.rowBytes = v68.rowBytes >> 2;
  v68.rowBytes >>= 2;
  PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  pixelBuffer = a3;
  if (PixelBufferUtils::pixelSizeForPixelFormat(PixelFormatType, 0) == 8)
  {
    height = v69.height;
    if (v69.height)
    {
      v13 = 0;
      v14 = 0;
      v15 = *(_OWORD *)&v69.width;
      if (LODWORD(v69.width))
        v16 = (v69.width - 1) >> 32 == 0;
      else
        v16 = 0;
      v18 = !v16 || v69.width < 0x18;
      v61 = v18;
      do
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if ((_QWORD)v15)
        {
          v20 = *((_QWORD *)&v15 + 1) * v13;
          v21 = &BaseAddress[*((_QWORD *)&v15 + 1) * v13];
          v22 = &data[v11 * v13];
          v23 = &v9[v11 * v13];
          v24 = &v10[v11 * v13];
          v25 = &v62[v11 * v13];
          if ((v61 & 1) != 0)
          {
            v26 = 0;
            v27 = 0;
          }
          else
          {
            v27 = 0;
            v26 = 0;
            v28 = v11 * v13 + 2 * v15;
            v29 = &data[v28];
            v30 = &v9[v28];
            v31 = &v10[v28];
            v32 = &v62[v28];
            v33 = &BaseAddress[8 * v15 + v20];
            v35 = v22 < &v10[v28] && v24 < v29;
            v37 = v22 < v32 && v25 < v29;
            v39 = v22 < v33 && v21 < v29;
            v41 = v23 < v31 && v24 < v30;
            v43 = v23 < v32 && v25 < v30;
            v45 = v23 < v33 && v21 < v30;
            v47 = v24 < v32 && v25 < v31;
            v49 = v24 < v33 && v21 < v31;
            v51 = v25 < v33 && v21 < v32;
            if ((v23 >= v29 || v22 >= v30) && !v35 && !v37 && !v39 && !v41 && !v43 && !v45 && !v47 && !v49 && !v51)
            {
              v53 = 0;
              v54 = (int16x8_t *)&data[v11 * v14];
              v55 = v15 & 0xFFFFFFFFFFFFFFF8;
              do
              {
                v56 = (const __int16 *)&v21[2 * (v53 & 0xFFFFFFE0)];
                v72 = vld4q_s16(v56);
                *v54 = v72.val[0];
                *(int16x8_t *)((char *)v54 + v8) = v72.val[1];
                *(int16x8_t *)((char *)v54 + 2 * v8) = v72.val[2];
                *(int16x8_t *)((char *)v54++ + 3 * v8) = v72.val[3];
                v53 += 32;
                v55 -= 8;
              }
              while (v55);
              v26 = v15 & 0xFFFFFFFFFFFFFFF8;
              v27 = v15 & 0xFFFFFFF8;
              if ((_QWORD)v15 == (v15 & 0xFFFFFFFFFFFFFFF8))
                goto LABEL_13;
            }
          }
          v57 = v27 + 1;
          v58 = 4 * v27;
          do
          {
            v59 = 2 * v26;
            *(_WORD *)&v22[v59] = *(_WORD *)&v21[2 * v58];
            *(_WORD *)&v23[v59] = *(_WORD *)&v21[2 * v58 + 2];
            *(_WORD *)&v24[v59] = *(_WORD *)&v21[2 * v58 + 4];
            *(_WORD *)&v25[v59] = *(_WORD *)&v21[2 * v58 + 6];
            v26 = v57++;
            v58 += 4;
          }
          while ((unint64_t)v15 > v26);
        }
LABEL_13:
        v13 = ++v14;
      }
      while (height > v14);
    }
  }
  else
  {
    srcChannels[0] = CVPixelBufferGetBaseAddress(a3);
    srcChannels[1] = (char *)srcChannels[0] + 4;
    srcChannels[2] = (char *)srcChannels[0] + 8;
    srcChannels[3] = (char *)srcChannels[0] + 12;
    destPlanarBuffers[0] = &v68;
    destPlanarBuffers[1] = &v67;
    destPlanarBuffers[2] = &v66;
    destPlanarBuffers[3] = &v65;
    vImageConvert_ChunkyToPlanarF((const void **)srcChannels, (const vImage_Buffer **)destPlanarBuffers, 4u, 0x10uLL, v69.width, v69.height, v69.rowBytes, 0);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferUnlockBaseAddress(v60, 0);
}

+ (id)undistortedCalibrationWithSameFOV:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  double v25;
  float v26;
  float v27;
  unsigned int v28;
  double v29;
  unsigned int v30;
  void *v31;
  unsigned int v33;
  uint64_t v34;
  double v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "distortionModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v3, "distortionModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "distortionModel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v31;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot calculate undistorted fov for distortion %{public}@", buf, 0xCu);

    }
    goto LABEL_11;
  }
  objc_msgSend(v3, "distortionModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "XThetaType");

  if (v10 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot calculate undistorted fov for fsintheta image", buf, 2u);
    }
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  if (!v10)
  {
    v6 = (id)objc_msgSend(v3, "mutableCopy");
    v11 = (void *)objc_opt_new();
    objc_msgSend(v6, "setDistortionModel:", v11);

    objc_msgSend(v6, "intrinsicMatrix");
    v33 = v13;
    v34 = v12;
    v35 = v14;
    objc_msgSend(v6, "referenceDimensions");
    v16 = v15;
    objc_msgSend(v6, "referenceDimensions");
    v18 = v17;
    objc_msgSend(v6, "referenceDimensions");
    v20 = v19;
    objc_msgSend(v6, "referenceDimensions");
    v22 = v21;
    v23 = *(float *)&v34 / v18;
    v24 = 0.5 / tan(0.5 / v23);
    v25 = v24;
    v26 = *(float *)&v34 / v16;
    v27 = 0.5 / tan(0.5 / v26);
    *(float *)&v28 = v20 * v27;
    v29 = COERCE_DOUBLE(__PAIR64__(HIDWORD(v34), v28));
    *(float *)&v30 = v22 * v25;
    objc_msgSend(v6, "setIntrinsicMatrix:", v29, COERCE_DOUBLE(__PAIR64__(v30, v33)), v35);
    goto LABEL_12;
  }
LABEL_2:
  v6 = v3;
LABEL_12:

  return v6;
}

+ (id)prioritizationAsString:(int64_t)a3
{
  uint8_t buf[4];
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 < 5)
    return off_24C421748[a3];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v6 = a3;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unknown prioritization numbered: %lu", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
