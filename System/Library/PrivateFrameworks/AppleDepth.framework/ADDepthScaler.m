@implementation ADDepthScaler

- (int64_t)scaleDepthBuffer:(__CVBuffer *)a3 withCropRect:(CGRect)a4 toBuffer:(__CVBuffer *)a5
{
  double height;
  double width;
  double y;
  double x;
  float v12;
  size_t v13;
  signed int PixelFormatType;
  float v15;
  float v16;
  unint64_t v17;
  size_t v18;
  CGRect *v19;
  uint64_t v20;
  vImagePixelCount v21;
  vImagePixelCount v22;
  unsigned int v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float *v31;
  size_t v32;
  char *v33;
  int v34;
  int v35;
  size_t v36;
  int v37;
  int v38;
  uint64_t v39;
  float v40;
  float v41;
  char *v42;
  char *v43;
  float v44;
  float v45;
  BOOL v46;
  float *v47;
  unsigned int v48;
  BOOL v50;
  float v51;
  float v52;
  int v53;
  BOOL v55;
  float v56;
  float v57;
  float *v59;
  float v60;
  float v61;
  int v62;
  float v63;
  int v64;
  BOOL v66;
  float v67;
  float v68;
  float *v70;
  int v73;
  float v76;
  int v77;
  BOOL v78;
  BOOL v79;
  float v80;
  float v81;
  float v83;
  float v84;
  int v85;
  BOOL v86;
  BOOL v87;
  float v88;
  float v89;
  float v91;
  float *v92;
  float v93;
  int v94;
  float *v95;
  int v98;
  int v101;
  int v104;
  int v107;
  int v110;
  NSObject *v115;
  const char *v116;
  float interpThreshold;
  unint64_t v120;
  size_t v121;
  CGRect *v122;
  uint64_t v123;
  vImagePixelCount v124;
  vImagePixelCount v125;
  unsigned int v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  char *data;
  size_t rowBytes;
  char *v137;
  int v142;
  int v143;
  size_t v144;
  int v145;
  int v146;
  uint64_t v147;
  float v148;
  float v149;
  char *v150;
  char *v151;
  float v153;
  char *v155;
  int v157;
  BOOL v158;
  float v160;
  int v163;
  BOOL v165;
  float v166;
  char *v168;
  int v173;
  int v176;
  float v181;
  int v182;
  BOOL v184;
  float v185;
  char *v187;
  int v192;
  int v195;
  int v199;
  BOOL v201;
  float v202;
  int v205;
  BOOL v207;
  float v208;
  char *v210;
  int v214;
  int v217;
  char *v220;
  int v224;
  int v227;
  int v230;
  BOOL v231;
  int v233;
  float v236;
  int v237;
  BOOL v238;
  int v240;
  int v243;
  BOOL v244;
  int v246;
  float v249;
  int v250;
  BOOL v251;
  int v253;
  float noDepthOutputValue;
  float v260;
  unint64_t v261;
  size_t v262;
  CGRect *v263;
  uint64_t v264;
  vImagePixelCount v265;
  vImagePixelCount v266;
  unsigned int v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  float v273;
  float v274;
  float *v275;
  size_t v276;
  char *v277;
  int v278;
  int v279;
  size_t v280;
  int v281;
  int v282;
  uint64_t v283;
  float v284;
  float v285;
  char *v286;
  char *v287;
  float v288;
  float v289;
  BOOL v290;
  float *v291;
  unsigned int v292;
  BOOL v293;
  BOOL v294;
  float v295;
  float v296;
  int v297;
  BOOL v299;
  float v300;
  float *v302;
  float v303;
  float v304;
  int v305;
  float v306;
  int v307;
  BOOL v309;
  float v310;
  float *v312;
  int v315;
  float v318;
  int v319;
  BOOL v320;
  BOOL v321;
  float v322;
  float v324;
  float v325;
  int v326;
  BOOL v327;
  BOOL v328;
  float v329;
  float v331;
  float *v332;
  float v333;
  int v334;
  float *v335;
  int v338;
  int v341;
  int v344;
  int v347;
  int v350;
  float v355;
  unint64_t v357;
  size_t v358;
  CGRect *v359;
  uint64_t v360;
  vImagePixelCount v361;
  vImagePixelCount v362;
  unsigned int v363;
  float v364;
  float v365;
  float v366;
  float v367;
  float v368;
  float v369;
  float v370;
  float v371;
  char *v372;
  size_t v373;
  char *v374;
  int v376;
  int v377;
  size_t v378;
  int v379;
  int v380;
  uint64_t v381;
  float v382;
  float v383;
  char *v384;
  char *v385;
  float v387;
  char *v389;
  int v391;
  BOOL v392;
  float v394;
  int v397;
  BOOL v399;
  float v400;
  float v401;
  char *v403;
  int v407;
  BOOL v409;
  float v410;
  float v411;
  int v416;
  int v419;
  int v424;
  BOOL v426;
  float v427;
  float v428;
  float v430;
  int v433;
  BOOL v435;
  float v436;
  float v437;
  float v439;
  char *v440;
  int v444;
  int v447;
  int v450;
  int v453;
  int v456;
  int v459;
  vImage_Buffer v465;
  vImage_Buffer buf;
  CGRect v467;
  CGRect v468;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = (float)CVPixelBufferGetWidth(a3);
  v13 = CVPixelBufferGetHeight(a3);
  v467.size.width = v12;
  v467.size.height = (float)v13;
  v467.origin.x = 0.0;
  v467.origin.y = 0.0;
  v468.origin.x = x;
  v468.origin.y = y;
  v468.size.width = width;
  v468.size.height = height;
  if (!CGRectContainsRect(v467, v468))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return -22953;
    LOWORD(buf.data) = 0;
    v115 = MEMORY[0x24BDACB70];
    v116 = "Crop rect must be within the source dimensions";
LABEL_737:
    _os_log_error_impl(&dword_20B62B000, v115, OS_LOG_TYPE_ERROR, v116, (uint8_t *)&buf, 2u);
    return -22953;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a5))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return -22953;
    LOWORD(buf.data) = 0;
    v115 = MEMORY[0x24BDACB70];
    v116 = "Input and output buffer formats must match";
    goto LABEL_737;
  }
  if (PixelFormatType > 1751410031)
  {
    if (PixelFormatType != 1751411059)
    {
      if (PixelFormatType != 1751410032)
        goto LABEL_733;
      interpThreshold = self->_interpThreshold;
      _S13 = self->_noDepthOutputValue;
      v120 = CVPixelBufferGetWidth(a5);
      v121 = CVPixelBufferGetHeight(a5);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a5, 0);
      memset(&buf, 0, sizeof(buf));
      v122 = (CGRect *)MEMORY[0x24BDBF090];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
      memset(&v465, 0, sizeof(v465));
      PixelBufferUtils::asVImageBuffer(a5, *v122, &v465);
      v124 = v465.height;
      if (!v465.height)
        goto LABEL_732;
      v125 = v465.width;
      if (!v465.width)
        goto LABEL_732;
      v126 = 0;
      v127 = width;
      v128 = v127 / (float)v120;
      v129 = height;
      v130 = v129 / (float)v121;
      v131 = x;
      v132 = v131 + (float)((float)(1.0 - v128) * -0.5);
      v133 = y;
      v134 = v133 + (float)((float)(1.0 - v130) * -0.5);
      data = (char *)v465.data;
      rowBytes = v465.rowBytes;
      v137 = (char *)buf.data;
      __asm { FCVT            H4, S13 }
      v142 = buf.width;
      v143 = buf.height;
      v144 = buf.rowBytes;
      v145 = LODWORD(buf.width) - 1;
      v146 = LODWORD(buf.height) - 1;
LABEL_179:
      v147 = 0;
      v148 = v134 + (float)((float)(v130 * (float)v126) + 0.0);
      LODWORD(v123) = llroundf(v148);
      v149 = (float)(int)roundf(v148) - v148;
      v150 = &v137[v144 * (v123 + 1)];
      v151 = &v137[v144 * (v123 - 1)];
      while (1)
      {
        v153 = v132 + (float)((float)(v128 * (float)v147) + 0.0);
        LODWORD(v120) = llroundf(v153);
        if ((v120 & 0x80000000) == 0 && (v123 & 0x80000000) == 0 && (int)v120 < v142 && (int)v123 < v143)
        {
          v155 = &v137[2 * v120 + v144 * v123];
          _H17 = *(_WORD *)v155;
          __asm { FCVT            S16, H17 }
          v157 = LODWORD(_S16) & 0x7FFFFFFF;
          v158 = (LODWORD(_S16) & 0x7FFFFFFFu) > 0x7F800000 || v157 == 2139095040;
          if (!v158 && v157 != 0)
            break;
        }
LABEL_180:
        _H17 = _H4;
LABEL_181:
        *(_WORD *)&data[2 * v147++] = _H17;
        if (v125 <= v147)
        {
          ++v126;
          data += rowBytes;
          if (v124 <= v126)
            goto LABEL_732;
          goto LABEL_179;
        }
      }
      v160 = (float)(int)v120 - v153;
      if (v160 > 0.0)
      {
        if ((_DWORD)v120)
        {
          _H17 = *((_WORD *)v155 - 1);
          __asm { FCVT            S17, H17 }
          v163 = LODWORD(_S17) & 0x7FFFFFFF;
          v165 = (LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v163 == 2139095040 || v163 == 0;
          v166 = vabds_f32(_S16, _S17);
          if (v165 || v166 > interpThreshold)
          {
            if (v149 <= 0.0)
            {
LABEL_283:
              if (v146 <= (int)v123)
                goto LABEL_394;
              v210 = &v150[2 * v120];
              _H17 = *((_WORD *)v210 - 1);
              __asm { FCVT            S19, H17 }
              _H17 = *(_WORD *)v210;
              __asm { FCVT            S17, H17 }
              v214 = LODWORD(_S19) & 0x7FFFFFFF;
              if ((LODWORD(_S19) & 0x7FFFFFFFu) <= 0x7F800000 && v214 != 2139095040 && v214 != 0)
              {
                v217 = LODWORD(_S17) & 0x7FFFFFFF;
                if ((LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v217 == 2139095040 || v217 == 0)
                {
                  _S17 = _S19;
                }
                else if (vabds_f32(_S17, _S19) <= interpThreshold)
                {
                  _S17 = _S17 + (float)((float)(_S19 - _S17) * v160);
                }
              }
              v243 = LODWORD(_S17) & 0x7FFFFFFF;
              v244 = (LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v243 == 2139095040;
              if (v244 || v243 == 0)
                goto LABEL_394;
              v246 = LODWORD(_S16) & 0x7FFFFFFF;
              if ((LODWORD(_S16) & 0x7FFFFFFFu) <= 0x7F800000 && v246 != 2139095040 && v246 != 0)
              {
                if (vabds_f32(_S16, _S17) <= interpThreshold)
                {
LABEL_374:
                  v249 = _S17 - _S16;
LABEL_375:
                  _S16 = _S16 + (float)(v249 * (float)-v149);
                }
LABEL_394:
                __asm { FCVT            H17, S16 }
LABEL_395:
                __asm { FCVT            S16, H17 }
                v120 = _S16 & 0x7FFFFFFF;
                if ((_S16 & 0x7FFFFFFFu) < 0x7F800001 && (_DWORD)v120 != 2139095040 && (_DWORD)v120 != 0)
                  goto LABEL_181;
                goto LABEL_180;
              }
LABEL_372:
              _S16 = _S17;
              goto LABEL_394;
            }
          }
          else
          {
            _S16 = _S16 + (float)((float)(_S17 - _S16) * v160);
            if (v149 <= 0.0)
              goto LABEL_283;
          }
          if (!(_DWORD)v123)
            goto LABEL_394;
          v168 = &v151[2 * v120];
          _H17 = *((_WORD *)v168 - 1);
          __asm { FCVT            S19, H17 }
          _H17 = *(_WORD *)v168;
          __asm { FCVT            S17, H17 }
          v173 = LODWORD(_S19) & 0x7FFFFFFF;
          if ((LODWORD(_S19) & 0x7FFFFFFFu) <= 0x7F800000 && v173 != 2139095040 && v173 != 0)
          {
            v176 = LODWORD(_S17) & 0x7FFFFFFF;
            if ((LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v176 == 2139095040 || v176 == 0)
            {
              _S17 = _S19;
            }
            else if (vabds_f32(_S17, _S19) <= interpThreshold)
            {
              _S17 = _S17 + (float)((float)(_S19 - _S17) * v160);
            }
          }
          v230 = LODWORD(_S17) & 0x7FFFFFFF;
          v231 = (LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v230 == 2139095040;
          if (v231 || v230 == 0)
            goto LABEL_394;
          v233 = LODWORD(_S16) & 0x7FFFFFFF;
          if ((LODWORD(_S16) & 0x7FFFFFFFu) > 0x7F800000 || v233 == 2139095040 || v233 == 0)
            goto LABEL_372;
          if (vabds_f32(_S16, _S17) > interpThreshold)
            goto LABEL_394;
          goto LABEL_335;
        }
LABEL_257:
        if (v149 <= 0.0)
        {
          if (v146 <= (int)v123)
            goto LABEL_395;
          _H17 = *(_WORD *)&v150[2 * v120];
          __asm { FCVT            S17, H17 }
          v205 = LODWORD(_S17) & 0x7FFFFFFF;
          v207 = (LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v205 == 2139095040 || v205 == 0;
          v208 = vabds_f32(_S16, _S17);
          if (!v207 && v208 <= interpThreshold)
            goto LABEL_374;
          goto LABEL_394;
        }
        if (!(_DWORD)v123)
          goto LABEL_395;
        _H17 = *(_WORD *)&v151[2 * v120];
        __asm { FCVT            S17, H17 }
        v199 = LODWORD(_S17) & 0x7FFFFFFF;
        v201 = (LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v199 == 2139095040 || v199 == 0;
        v202 = vabds_f32(_S16, _S17);
        if (v201 || v202 > interpThreshold)
          goto LABEL_394;
LABEL_335:
        v236 = _S17 - _S16;
LABEL_336:
        _S16 = _S16 + (float)(v236 * v149);
        goto LABEL_394;
      }
      if (v145 <= (int)v120)
        goto LABEL_257;
      _H17 = *((_WORD *)v155 + 1);
      __asm { FCVT            S19, H17 }
      v181 = -v160;
      v182 = LODWORD(_S19) & 0x7FFFFFFF;
      v184 = (LODWORD(_S19) & 0x7FFFFFFFu) > 0x7F800000 || v182 == 2139095040 || v182 == 0;
      v185 = vabds_f32(_S16, _S19);
      if (v184 || v185 > interpThreshold)
      {
        if (v149 <= 0.0)
        {
LABEL_301:
          if (v146 <= (int)v123)
            goto LABEL_394;
          v220 = &v150[2 * v120];
          _H18 = *((_WORD *)v220 + 1);
          __asm { FCVT            S19, H18 }
          _H18 = *(_WORD *)v220;
          __asm { FCVT            S18, H18 }
          v224 = LODWORD(_S19) & 0x7FFFFFFF;
          if ((LODWORD(_S19) & 0x7FFFFFFFu) <= 0x7F800000 && v224 != 2139095040 && v224 != 0)
          {
            v227 = LODWORD(_S18) & 0x7FFFFFFF;
            if ((LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v227 == 2139095040 || v227 == 0)
            {
              _S18 = _S19;
            }
            else if (vabds_f32(_S18, _S19) <= interpThreshold)
            {
              _S18 = _S18 + (float)((float)(_S19 - _S18) * v181);
            }
          }
          v250 = LODWORD(_S18) & 0x7FFFFFFF;
          v251 = (LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v250 == 2139095040;
          if (v251 || v250 == 0)
            goto LABEL_394;
          v253 = LODWORD(_S16) & 0x7FFFFFFF;
          if ((LODWORD(_S16) & 0x7FFFFFFFu) <= 0x7F800000 && v253 != 2139095040 && v253 != 0)
          {
            if (vabds_f32(_S16, _S18) > interpThreshold)
              goto LABEL_394;
            v249 = _S18 - _S16;
            goto LABEL_375;
          }
          goto LABEL_393;
        }
      }
      else
      {
        _S16 = _S16 + (float)((float)(_S19 - _S16) * v181);
        if (v149 <= 0.0)
          goto LABEL_301;
      }
      if (!(_DWORD)v123)
        goto LABEL_394;
      v187 = &v151[2 * v120];
      _H18 = *((_WORD *)v187 + 1);
      __asm { FCVT            S19, H18 }
      _H18 = *(_WORD *)v187;
      __asm { FCVT            S18, H18 }
      v192 = LODWORD(_S19) & 0x7FFFFFFF;
      if ((LODWORD(_S19) & 0x7FFFFFFFu) <= 0x7F800000 && v192 != 2139095040 && v192 != 0)
      {
        v195 = LODWORD(_S18) & 0x7FFFFFFF;
        if ((LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v195 == 2139095040 || v195 == 0)
        {
          _S18 = _S19;
        }
        else if (vabds_f32(_S18, _S19) <= interpThreshold)
        {
          _S18 = _S18 + (float)((float)(_S19 - _S18) * v181);
        }
      }
      v237 = LODWORD(_S18) & 0x7FFFFFFF;
      v238 = (LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v237 == 2139095040;
      if (v238 || v237 == 0)
        goto LABEL_394;
      v240 = LODWORD(_S16) & 0x7FFFFFFF;
      if ((LODWORD(_S16) & 0x7FFFFFFFu) <= 0x7F800000 && v240 != 2139095040 && v240 != 0)
      {
        if (vabds_f32(_S16, _S18) > interpThreshold)
          goto LABEL_394;
        v236 = _S18 - _S16;
        goto LABEL_336;
      }
LABEL_393:
      _S16 = _S18;
      goto LABEL_394;
    }
    v355 = self->_interpThreshold;
    _S13 = self->_noDepthOutputValue;
    v357 = CVPixelBufferGetWidth(a5);
    v358 = CVPixelBufferGetHeight(a5);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a5, 0);
    memset(&buf, 0, sizeof(buf));
    v359 = (CGRect *)MEMORY[0x24BDBF090];
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
    memset(&v465, 0, sizeof(v465));
    PixelBufferUtils::asVImageBuffer(a5, *v359, &v465);
    v361 = v465.height;
    if (!v465.height)
      goto LABEL_732;
    v362 = v465.width;
    if (!v465.width)
      goto LABEL_732;
    v363 = 0;
    v364 = width;
    v365 = v364 / (float)v357;
    v366 = height;
    v367 = v366 / (float)v358;
    v368 = x;
    v369 = v368 + (float)((float)(1.0 - v365) * -0.5);
    v370 = y;
    v371 = v370 + (float)((float)(1.0 - v367) * -0.5);
    v372 = (char *)v465.data;
    v373 = v465.rowBytes;
    v374 = (char *)buf.data;
    __asm { FCVT            H4, S13 }
    v376 = buf.width;
    v377 = buf.height;
    v378 = buf.rowBytes;
    v379 = LODWORD(buf.width) - 1;
    v380 = LODWORD(buf.height) - 1;
LABEL_572:
    v381 = 0;
    v382 = v371 + (float)((float)(v367 * (float)v363) + 0.0);
    LODWORD(v360) = llroundf(v382);
    v383 = (float)(int)roundf(v382) - v382;
    v384 = &v374[v378 * (v360 + 1)];
    v385 = &v374[v378 * (v360 - 1)];
    while (1)
    {
      v387 = v369 + (float)((float)(v365 * (float)v381) + 0.0);
      LODWORD(v357) = llroundf(v387);
      if ((v357 & 0x80000000) == 0 && (v360 & 0x80000000) == 0 && (int)v357 < v376 && (int)v360 < v377)
      {
        v389 = &v374[2 * v357 + v378 * v360];
        _H18 = *(_WORD *)v389;
        __asm { FCVT            S16, H18 }
        v391 = LODWORD(_S16) & 0x7FFFFFFF;
        v392 = (LODWORD(_S16) & 0x7FFFFFFFu) > 0x7F800000 || v391 == 2139095040;
        if (!v392 && v391 != 0)
          break;
      }
LABEL_573:
      _H18 = _H4;
LABEL_574:
      *(_WORD *)&v372[2 * v381++] = _H18;
      if (v362 <= v381)
      {
        ++v363;
        v372 += v373;
        if (v361 <= v363)
          goto LABEL_732;
        goto LABEL_572;
      }
    }
    v394 = (float)(int)v357 - v387;
    if (v394 > 0.0)
    {
      if ((_DWORD)v357)
      {
        _H18 = *((_WORD *)v389 - 1);
        __asm { FCVT            S18, H18 }
        v397 = LODWORD(_S18) & 0x7FFFFFFF;
        v399 = (LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v397 == 2139095040 || v397 == 0;
        v400 = vabds_f32(_S18, _S16);
        v401 = v355 * fabsf(_S16 * _S18);
        if (v399 || v400 > v401)
        {
          if (v383 <= 0.0)
          {
LABEL_662:
            if (v380 <= (int)v360)
              goto LABEL_723;
            v440 = &v384[2 * v357];
            _H18 = *((_WORD *)v440 - 1);
LABEL_667:
            __asm { FCVT            S19, H18 }
            _H18 = *(_WORD *)v440;
            __asm { FCVT            S18, H18 }
            v444 = LODWORD(_S19) & 0x7FFFFFFF;
            if ((LODWORD(_S19) & 0x7FFFFFFFu) <= 0x7F800000 && v444 != 2139095040 && v444 != 0)
            {
              v447 = LODWORD(_S18) & 0x7FFFFFFF;
              if ((LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v447 == 2139095040 || v447 == 0)
              {
                _S18 = _S19;
              }
              else if (vabds_f32(_S19, _S18) <= (float)(v355 * fabsf(_S19 * _S18)))
              {
                _S18 = _S18 + (float)((float)(_S19 - _S18) * v394);
              }
            }
            v456 = LODWORD(_S18) & 0x7FFFFFFF;
            if ((LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v456 == 2139095040 || v456 == 0)
              goto LABEL_723;
            v459 = LODWORD(_S16) & 0x7FFFFFFF;
            if ((LODWORD(_S16) & 0x7FFFFFFFu) <= 0x7F800000 && v459 != 2139095040 && v459 != 0)
            {
              if (vabds_f32(_S18, _S16) <= (float)(v355 * fabsf(_S16 * _S18)))
              {
                v439 = _S18 - _S16;
                goto LABEL_722;
              }
              goto LABEL_723;
            }
LABEL_719:
            _S16 = _S18;
            goto LABEL_723;
          }
        }
        else
        {
          _S16 = _S16 + (float)((float)(_S18 - _S16) * v394);
          if (v383 <= 0.0)
            goto LABEL_662;
        }
        if (!(_DWORD)v360)
          goto LABEL_723;
        v403 = &v385[2 * v357];
        _H18 = *((_WORD *)v403 - 1);
        goto LABEL_620;
      }
LABEL_636:
      if (v383 <= 0.0)
      {
        if (v380 <= (int)v360)
          goto LABEL_724;
        _H17 = *(_WORD *)&v384[2 * v357];
        __asm { FCVT            S17, H17 }
        v433 = LODWORD(_S17) & 0x7FFFFFFF;
        v435 = (LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v433 == 2139095040 || v433 == 0;
        v436 = vabds_f32(_S17, _S16);
        v437 = v355 * fabsf(_S16 * _S17);
        if (!v435 && v436 <= v437)
        {
          v439 = _S17 - _S16;
LABEL_722:
          _S16 = _S16 + (float)(v439 * (float)-v383);
        }
LABEL_723:
        __asm { FCVT            H18, S16 }
LABEL_724:
        __asm { FCVT            S16, H18 }
        v357 = _S16 & 0x7FFFFFFF;
        if ((_S16 & 0x7FFFFFFFu) < 0x7F800001 && (_DWORD)v357 != 2139095040 && (_DWORD)v357 != 0)
          goto LABEL_574;
        goto LABEL_573;
      }
      if (!(_DWORD)v360)
        goto LABEL_724;
      _H17 = *(_WORD *)&v385[2 * v357];
      __asm { FCVT            S17, H17 }
      v424 = LODWORD(_S17) & 0x7FFFFFFF;
      v426 = (LODWORD(_S17) & 0x7FFFFFFFu) > 0x7F800000 || v424 == 2139095040 || v424 == 0;
      v427 = vabds_f32(_S17, _S16);
      v428 = v355 * fabsf(_S16 * _S17);
      if (v426 || v427 > v428)
        goto LABEL_723;
      v430 = _S17 - _S16;
      goto LABEL_701;
    }
    if (v379 <= (int)v357)
      goto LABEL_636;
    _H18 = *((_WORD *)v389 + 1);
    __asm { FCVT            S18, H18 }
    v394 = -v394;
    v407 = LODWORD(_S18) & 0x7FFFFFFF;
    v409 = (LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v407 == 2139095040 || v407 == 0;
    v410 = vabds_f32(_S18, _S16);
    v411 = v355 * fabsf(_S16 * _S18);
    if (v409 || v410 > v411)
    {
      if (v383 <= 0.0)
      {
LABEL_665:
        if (v380 <= (int)v360)
          goto LABEL_723;
        v440 = &v384[2 * v357];
        _H18 = *((_WORD *)v440 + 1);
        goto LABEL_667;
      }
    }
    else
    {
      _S16 = _S16 + (float)((float)(_S18 - _S16) * v394);
      if (v383 <= 0.0)
        goto LABEL_665;
    }
    if (!(_DWORD)v360)
      goto LABEL_723;
    v403 = &v385[2 * v357];
    _H18 = *((_WORD *)v403 + 1);
LABEL_620:
    __asm { FCVT            S19, H18 }
    _H18 = *(_WORD *)v403;
    __asm { FCVT            S18, H18 }
    v416 = LODWORD(_S19) & 0x7FFFFFFF;
    if ((LODWORD(_S19) & 0x7FFFFFFFu) <= 0x7F800000 && v416 != 2139095040 && v416 != 0)
    {
      v419 = LODWORD(_S18) & 0x7FFFFFFF;
      if ((LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v419 == 2139095040 || v419 == 0)
      {
        _S18 = _S19;
      }
      else if (vabds_f32(_S19, _S18) <= (float)(v355 * fabsf(_S19 * _S18)))
      {
        _S18 = _S18 + (float)((float)(_S19 - _S18) * v394);
      }
    }
    v450 = LODWORD(_S18) & 0x7FFFFFFF;
    if ((LODWORD(_S18) & 0x7FFFFFFFu) > 0x7F800000 || v450 == 2139095040 || v450 == 0)
      goto LABEL_723;
    v453 = LODWORD(_S16) & 0x7FFFFFFF;
    if ((LODWORD(_S16) & 0x7FFFFFFFu) > 0x7F800000 || v453 == 2139095040 || v453 == 0)
      goto LABEL_719;
    if (vabds_f32(_S18, _S16) > (float)(v355 * fabsf(_S16 * _S18)))
      goto LABEL_723;
    v430 = _S18 - _S16;
LABEL_701:
    _S16 = _S16 + (float)(v430 * v383);
    goto LABEL_723;
  }
  if (PixelFormatType == 1717855600)
  {
    v260 = self->_interpThreshold;
    noDepthOutputValue = self->_noDepthOutputValue;
    v261 = CVPixelBufferGetWidth(a5);
    v262 = CVPixelBufferGetHeight(a5);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a5, 0);
    memset(&buf, 0, sizeof(buf));
    v263 = (CGRect *)MEMORY[0x24BDBF090];
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
    memset(&v465, 0, sizeof(v465));
    PixelBufferUtils::asVImageBuffer(a5, *v263, &v465);
    v265 = v465.height;
    if (v465.height)
    {
      v266 = v465.width;
      if (v465.width)
      {
        v267 = 0;
        v268 = width;
        v269 = v268 / (float)v261;
        v270 = height;
        v271 = v270 / (float)v262;
        v272 = x;
        v273 = v272 + (float)((float)(1.0 - v269) * -0.5);
        v275 = (float *)v465.data;
        v276 = v465.rowBytes;
        v277 = (char *)buf.data;
        v278 = buf.width;
        v279 = buf.height;
        v280 = buf.rowBytes;
        v281 = LODWORD(buf.width) - 1;
        v282 = LODWORD(buf.height) - 1;
        do
        {
          v283 = 0;
          v274 = y;
          v284 = (float)(v274 + (float)((float)(1.0 - v271) * -0.5)) + (float)((float)(v271 * (float)v267) + 0.0);
          LODWORD(v264) = llroundf(v284);
          v285 = (float)(int)roundf(v284) - v284;
          v286 = &v277[v280 * (v264 + 1)];
          v287 = &v277[v280 * (v264 - 1)];
          do
          {
            v289 = v273 + (float)((float)(v269 * (float)v283) + 0.0);
            LODWORD(v261) = llroundf(v289);
            if ((v261 & 0x80000000) != 0
              || (v264 & 0x80000000) != 0
              || ((int)v261 < v278 ? (v290 = (int)v264 < v279) : (v290 = 0),
                  !v290
               || ((v291 = (float *)&v277[4 * v261 + v280 * v264],
                    v288 = *v291,
                    v292 = *(_DWORD *)v291 & 0x7FFFFFFF,
                    v292 <= 0x7F800000)
                 ? (v293 = v292 == 2139095040)
                 : (v293 = 1),
                   !v293 ? (v294 = v292 == 0) : (v294 = 1),
                   v294)))
            {
LABEL_410:
              v288 = noDepthOutputValue;
              goto LABEL_411;
            }
            v295 = (float)(int)v261 - v289;
            if (v295 <= 0.0)
            {
              if (v281 > (int)v261)
              {
                v306 = v291[1];
                v295 = -v295;
                v307 = LODWORD(v306) & 0x7FFFFFFF;
                v309 = (LODWORD(v306) & 0x7FFFFFFFu) > 0x7F800000 || v307 == 2139095040 || v307 == 0;
                v310 = vabds_f32(v288, v306);
                if (v309 || v310 > v260)
                {
                  if (v285 > 0.0)
                    goto LABEL_455;
                }
                else
                {
                  v288 = v288 + (float)((float)(v306 - v288) * v295);
                  if (v285 > 0.0)
                  {
LABEL_455:
                    if (!(_DWORD)v264)
                      goto LABEL_560;
                    v312 = (float *)&v287[4 * v261];
                    v303 = *v312;
                    v304 = v312[1];
                    v305 = LODWORD(v304) & 0x7FFFFFFF;
LABEL_457:
                    if (v305 <= 2139095040 && v305 != 2139095040 && v305 != 0)
                    {
                      v315 = LODWORD(v303) & 0x7FFFFFFF;
                      if ((LODWORD(v303) & 0x7FFFFFFFu) > 0x7F800000 || v315 == 2139095040 || v315 == 0)
                      {
                        v303 = v304;
                      }
                      else if (vabds_f32(v303, v304) <= v260)
                      {
                        v303 = v303 + (float)((float)(v304 - v303) * v295);
                      }
                    }
                    v341 = LODWORD(v303) & 0x7FFFFFFF;
                    if ((LODWORD(v303) & 0x7FFFFFFFu) <= 0x7F800000 && v341 != 2139095040 && v341 != 0)
                    {
                      v344 = LODWORD(v288) & 0x7FFFFFFF;
                      if ((LODWORD(v288) & 0x7FFFFFFFu) <= 0x7F800000 && v344 != 2139095040 && v344 != 0)
                      {
                        if (vabds_f32(v288, v303) > v260)
                          goto LABEL_560;
                        v324 = v303 - v288;
                        goto LABEL_538;
                      }
LABEL_556:
                      v288 = v303;
                      goto LABEL_560;
                    }
                    goto LABEL_560;
                  }
                }
                if (v282 <= (int)v264)
                  goto LABEL_560;
                v335 = (float *)&v286[4 * v261];
                v303 = *v335;
                v333 = v335[1];
                v334 = LODWORD(v333) & 0x7FFFFFFF;
                goto LABEL_504;
              }
            }
            else if ((_DWORD)v261)
            {
              v296 = *(v291 - 1);
              v297 = LODWORD(v296) & 0x7FFFFFFF;
              v299 = (LODWORD(v296) & 0x7FFFFFFFu) > 0x7F800000 || v297 == 2139095040 || v297 == 0;
              v300 = vabds_f32(v288, v296);
              if (v299 || v300 > v260)
              {
                if (v285 > 0.0)
                  goto LABEL_440;
              }
              else
              {
                v288 = v288 + (float)((float)(v296 - v288) * v295);
                if (v285 > 0.0)
                {
LABEL_440:
                  if (!(_DWORD)v264)
                    goto LABEL_560;
                  v302 = (float *)&v287[4 * v261];
                  v304 = *(v302 - 1);
                  v303 = *v302;
                  v305 = LODWORD(v304) & 0x7FFFFFFF;
                  goto LABEL_457;
                }
              }
              if (v282 <= (int)v264)
                goto LABEL_560;
              v332 = (float *)&v286[4 * v261];
              v333 = *(v332 - 1);
              v303 = *v332;
              v334 = LODWORD(v333) & 0x7FFFFFFF;
LABEL_504:
              if (v334 <= 2139095040 && v334 != 2139095040 && v334 != 0)
              {
                v338 = LODWORD(v303) & 0x7FFFFFFF;
                if ((LODWORD(v303) & 0x7FFFFFFFu) > 0x7F800000 || v338 == 2139095040 || v338 == 0)
                {
                  v303 = v333;
                }
                else if (vabds_f32(v303, v333) <= v260)
                {
                  v303 = v303 + (float)((float)(v333 - v303) * v295);
                }
              }
              v347 = LODWORD(v303) & 0x7FFFFFFF;
              if ((LODWORD(v303) & 0x7FFFFFFFu) <= 0x7F800000 && v347 != 2139095040 && v347 != 0)
              {
                v350 = LODWORD(v288) & 0x7FFFFFFF;
                if ((LODWORD(v288) & 0x7FFFFFFFu) > 0x7F800000 || v350 == 2139095040 || v350 == 0)
                  goto LABEL_556;
                if (vabds_f32(v288, v303) <= v260)
                {
                  v331 = v303 - v288;
                  goto LABEL_559;
                }
              }
              goto LABEL_560;
            }
            if (v285 <= 0.0)
            {
              if (v282 > (int)v264)
              {
                v325 = *(float *)&v286[4 * v261];
                v326 = LODWORD(v325) & 0x7FFFFFFF;
                v327 = (LODWORD(v325) & 0x7FFFFFFFu) > 0x7F800000 || v326 == 2139095040;
                v328 = v327 || v326 == 0;
                v329 = vabds_f32(v288, v325);
                if (!v328 && v329 <= v260)
                {
                  v331 = v325 - v288;
LABEL_559:
                  v288 = v288 + (float)(v331 * (float)-v285);
                }
              }
            }
            else if ((_DWORD)v264)
            {
              v318 = *(float *)&v287[4 * v261];
              v319 = LODWORD(v318) & 0x7FFFFFFF;
              v320 = (LODWORD(v318) & 0x7FFFFFFFu) > 0x7F800000 || v319 == 2139095040;
              v321 = v320 || v319 == 0;
              v322 = vabds_f32(v288, v318);
              if (!v321 && v322 <= v260)
              {
                v324 = v318 - v288;
LABEL_538:
                v288 = v288 + (float)(v324 * v285);
              }
            }
LABEL_560:
            v261 = LODWORD(v288) & 0x7FFFFFFF;
            if ((LODWORD(v288) & 0x7FFFFFFFu) >= 0x7F800001 || (_DWORD)v261 == 2139095040 || (_DWORD)v261 == 0)
              goto LABEL_410;
LABEL_411:
            v275[v283++] = v288;
          }
          while (v266 > v283);
          ++v267;
          v275 = (float *)((char *)v275 + v276);
        }
        while (v265 > v267);
      }
    }
LABEL_732:
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(a5, 0);
    return 0;
  }
  if (PixelFormatType == 1717856627)
  {
    v16 = self->_interpThreshold;
    v15 = self->_noDepthOutputValue;
    v17 = CVPixelBufferGetWidth(a5);
    v18 = CVPixelBufferGetHeight(a5);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a5, 0);
    memset(&buf, 0, sizeof(buf));
    v19 = (CGRect *)MEMORY[0x24BDBF090];
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
    memset(&v465, 0, sizeof(v465));
    PixelBufferUtils::asVImageBuffer(a5, *v19, &v465);
    v21 = v465.height;
    if (v465.height)
    {
      v22 = v465.width;
      if (v465.width)
      {
        v23 = 0;
        v24 = width;
        v25 = v24 / (float)v17;
        v26 = height;
        v27 = v26 / (float)v18;
        v28 = x;
        v29 = v28 + (float)((float)(1.0 - v25) * -0.5);
        v31 = (float *)v465.data;
        v32 = v465.rowBytes;
        v33 = (char *)buf.data;
        v34 = buf.width;
        v35 = buf.height;
        v36 = buf.rowBytes;
        v37 = LODWORD(buf.width) - 1;
        v38 = LODWORD(buf.height) - 1;
        while (1)
        {
          v39 = 0;
          v30 = y;
          v40 = (float)(v30 + (float)((float)(1.0 - v27) * -0.5)) + (float)((float)(v27 * (float)v23) + 0.0);
          LODWORD(v20) = llroundf(v40);
          v41 = (float)(int)roundf(v40) - v40;
          v42 = &v33[v36 * (v20 + 1)];
          v43 = &v33[v36 * (v20 - 1)];
          do
          {
            v45 = v29 + (float)((float)(v25 * (float)v39) + 0.0);
            LODWORD(v17) = llroundf(v45);
            if ((v17 & 0x80000000) != 0
              || (v20 & 0x80000000) != 0
              || ((int)v17 < v34 ? (v46 = (int)v20 < v35) : (v46 = 0),
                  !v46
               || ((v47 = (float *)&v33[4 * v17 + v36 * v20],
                    v44 = *v47,
                    v48 = *(_DWORD *)v47 & 0x7FFFFFFF,
                    v48 <= 0x7F800000)
                 ? (_ZF = v48 == 2139095040)
                 : (_ZF = 1),
                   !_ZF ? (v50 = v48 == 0) : (v50 = 1),
                   v50)))
            {
LABEL_11:
              v44 = v15;
              goto LABEL_12;
            }
            v51 = (float)(int)v17 - v45;
            if (v51 <= 0.0)
            {
              if (v37 > (int)v17)
              {
                v63 = v47[1];
                v51 = -v51;
                v64 = LODWORD(v63) & 0x7FFFFFFF;
                v66 = (LODWORD(v63) & 0x7FFFFFFFu) > 0x7F800000 || v64 == 2139095040 || v64 == 0;
                v67 = vabds_f32(v63, v44);
                v68 = v16 * fabsf(v44 * v63);
                if (v66 || v67 > v68)
                {
                  if (v41 > 0.0)
                    goto LABEL_56;
                }
                else
                {
                  v44 = v44 + (float)((float)(v63 - v44) * v51);
                  if (v41 > 0.0)
                  {
LABEL_56:
                    if (!(_DWORD)v20)
                      goto LABEL_161;
                    v70 = (float *)&v43[4 * v17];
                    v60 = *v70;
                    v61 = v70[1];
                    v62 = LODWORD(v61) & 0x7FFFFFFF;
LABEL_58:
                    if (v62 <= 2139095040 && v62 != 2139095040 && v62 != 0)
                    {
                      v73 = LODWORD(v60) & 0x7FFFFFFF;
                      if ((LODWORD(v60) & 0x7FFFFFFFu) > 0x7F800000 || v73 == 2139095040 || v73 == 0)
                      {
                        v60 = v61;
                      }
                      else if (vabds_f32(v61, v60) <= (float)(v16 * fabsf(v61 * v60)))
                      {
                        v60 = v60 + (float)((float)(v61 - v60) * v51);
                      }
                    }
                    v101 = LODWORD(v60) & 0x7FFFFFFF;
                    if ((LODWORD(v60) & 0x7FFFFFFFu) <= 0x7F800000 && v101 != 2139095040 && v101 != 0)
                    {
                      v104 = LODWORD(v44) & 0x7FFFFFFF;
                      if ((LODWORD(v44) & 0x7FFFFFFFu) <= 0x7F800000 && v104 != 2139095040 && v104 != 0)
                      {
                        if (vabds_f32(v60, v44) > (float)(v16 * fabsf(v44 * v60)))
                          goto LABEL_161;
                        v83 = v60 - v44;
                        goto LABEL_139;
                      }
LABEL_157:
                      v44 = v60;
                      goto LABEL_161;
                    }
                    goto LABEL_161;
                  }
                }
                if (v38 <= (int)v20)
                  goto LABEL_161;
                v95 = (float *)&v42[4 * v17];
                v60 = *v95;
                v93 = v95[1];
                v94 = LODWORD(v93) & 0x7FFFFFFF;
                goto LABEL_105;
              }
            }
            else if ((_DWORD)v17)
            {
              v52 = *(v47 - 1);
              v53 = LODWORD(v52) & 0x7FFFFFFF;
              v55 = (LODWORD(v52) & 0x7FFFFFFFu) > 0x7F800000 || v53 == 2139095040 || v53 == 0;
              v56 = vabds_f32(v52, v44);
              v57 = v16 * fabsf(v44 * v52);
              if (v55 || v56 > v57)
              {
                if (v41 > 0.0)
                  goto LABEL_41;
              }
              else
              {
                v44 = v44 + (float)((float)(v52 - v44) * v51);
                if (v41 > 0.0)
                {
LABEL_41:
                  if (!(_DWORD)v20)
                    goto LABEL_161;
                  v59 = (float *)&v43[4 * v17];
                  v61 = *(v59 - 1);
                  v60 = *v59;
                  v62 = LODWORD(v61) & 0x7FFFFFFF;
                  goto LABEL_58;
                }
              }
              if (v38 <= (int)v20)
                goto LABEL_161;
              v92 = (float *)&v42[4 * v17];
              v93 = *(v92 - 1);
              v60 = *v92;
              v94 = LODWORD(v93) & 0x7FFFFFFF;
LABEL_105:
              if (v94 <= 2139095040 && v94 != 2139095040 && v94 != 0)
              {
                v98 = LODWORD(v60) & 0x7FFFFFFF;
                if ((LODWORD(v60) & 0x7FFFFFFFu) > 0x7F800000 || v98 == 2139095040 || v98 == 0)
                {
                  v60 = v93;
                }
                else if (vabds_f32(v93, v60) <= (float)(v16 * fabsf(v93 * v60)))
                {
                  v60 = v60 + (float)((float)(v93 - v60) * v51);
                }
              }
              v107 = LODWORD(v60) & 0x7FFFFFFF;
              if ((LODWORD(v60) & 0x7FFFFFFFu) <= 0x7F800000 && v107 != 2139095040 && v107 != 0)
              {
                v110 = LODWORD(v44) & 0x7FFFFFFF;
                if ((LODWORD(v44) & 0x7FFFFFFFu) > 0x7F800000 || v110 == 2139095040 || v110 == 0)
                  goto LABEL_157;
                if (vabds_f32(v60, v44) <= (float)(v16 * fabsf(v44 * v60)))
                {
                  v91 = v60 - v44;
                  goto LABEL_160;
                }
              }
              goto LABEL_161;
            }
            if (v41 <= 0.0)
            {
              if (v38 > (int)v20)
              {
                v84 = *(float *)&v42[4 * v17];
                v85 = LODWORD(v84) & 0x7FFFFFFF;
                v86 = (LODWORD(v84) & 0x7FFFFFFFu) > 0x7F800000 || v85 == 2139095040;
                v87 = v86 || v85 == 0;
                v88 = vabds_f32(v84, v44);
                v89 = v16 * fabsf(v44 * v84);
                if (!v87 && v88 <= v89)
                {
                  v91 = v84 - v44;
LABEL_160:
                  v44 = v44 + (float)(v91 * (float)-v41);
                }
              }
            }
            else if ((_DWORD)v20)
            {
              v76 = *(float *)&v43[4 * v17];
              v77 = LODWORD(v76) & 0x7FFFFFFF;
              v78 = (LODWORD(v76) & 0x7FFFFFFFu) > 0x7F800000 || v77 == 2139095040;
              v79 = v78 || v77 == 0;
              v80 = vabds_f32(v76, v44);
              v81 = v16 * fabsf(v44 * v76);
              if (!v79 && v80 <= v81)
              {
                v83 = v76 - v44;
LABEL_139:
                v44 = v44 + (float)(v83 * v41);
              }
            }
LABEL_161:
            v17 = LODWORD(v44) & 0x7FFFFFFF;
            if ((LODWORD(v44) & 0x7FFFFFFFu) >= 0x7F800001 || (_DWORD)v17 == 2139095040 || (_DWORD)v17 == 0)
              goto LABEL_11;
LABEL_12:
            v31[v39++] = v44;
          }
          while (v22 > v39);
          ++v23;
          v31 = (float *)((char *)v31 + v32);
          if (v21 <= v23)
            goto LABEL_732;
        }
      }
    }
    goto LABEL_732;
  }
LABEL_733:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.data) = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported buffer format", (uint8_t *)&buf, 2u);
  }
  return -22951;
}

- (int64_t)scaleDepthBuffer:(__CVBuffer *)a3 withZoomFactor:(float)a4 toBuffer:(__CVBuffer *)a5
{
  float Width;
  size_t Height;
  uint8_t v12[16];

  if (a4 >= 1.0)
  {
    Width = (float)CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    return -[ADDepthScaler scaleDepthBuffer:withCropRect:toBuffer:](self, "scaleDepthBuffer:withCropRect:toBuffer:", a3, a5, (float)((float)(Width * 0.5) - (float)((float)(Width / a4) * 0.5)), (float)((float)((float)Height * 0.5) - (float)((float)((float)Height / a4) * 0.5)), (float)(Width / a4), (float)((float)Height / a4));
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Zoom factor must be >= 1", v12, 2u);
    }
    return -22953;
  }
}

- (float)interpThreshold
{
  return self->_interpThreshold;
}

- (float)noDepthOutputValue
{
  return self->_noDepthOutputValue;
}

+ (id)scalerWithInterpThreshold:(float)a3 andNoDepthOutputValue:(float)a4
{
  float *v6;

  v6 = (float *)objc_opt_new();
  v6[2] = a3;
  v6[3] = a4;
  return v6;
}

+ (id)defaultScaler
{
  id v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (id)_defaultScaler;
  objc_sync_enter(v2);
  v5 = (void *)_defaultScaler;
  if (!_defaultScaler)
  {
    LODWORD(v3) = 1036831949;
    LODWORD(v4) = 0;
    +[ADDepthScaler scalerWithInterpThreshold:andNoDepthOutputValue:](ADDepthScaler, "scalerWithInterpThreshold:andNoDepthOutputValue:", v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_defaultScaler;
    _defaultScaler = v6;

    v5 = (void *)_defaultScaler;
  }
  v8 = v5;
  objc_sync_exit(v2);

  return v8;
}

@end
