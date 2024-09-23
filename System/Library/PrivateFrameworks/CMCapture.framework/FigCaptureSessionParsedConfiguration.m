@implementation FigCaptureSessionParsedConfiguration

- (uint64_t)_parseConfiguration:(char)a3 clientSetsUserInitiatedCaptureRequestTime:(void *)a4 restrictions:
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const void *v31;
  int v32;
  uint64_t (*v33)(const void *, const __CFString *, _QWORD, objc_super *);
  uint64_t v34;
  int v35;
  void *v36;
  FigCaptureSourceConfiguration *v37;
  void *v38;
  objc_class *v39;
  uint64_t (*v40)(const void *, const __CFString *, uint64_t, __int128 *);
  int v41;
  double v42;
  float v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  FigPointCloudDataCaptureConnectionConfiguration *PointCloudConnectionConfigurationForLiDARDepth;
  int v51;
  uint64_t v52;
  uint64_t v53;
  FigPointCloudDataCaptureConnectionConfiguration *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  FigPointCloudDataCaptureConnectionConfiguration *v58;
  int v59;
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
  int v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, const __CFString *, uint64_t, __int128 *);
  void *v81;
  void *v82;
  uint64_t v83;
  unsigned int (*v84)(uint64_t, const __CFString *, uint64_t, objc_super *);
  void *v85;
  float v86;
  FigCaptureSourceConfiguration *v87;
  void *v88;
  objc_class *v89;
  double v90;
  FigPointCloudDataCaptureConnectionConfiguration *v91;
  void *v92;
  objc_class *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  char v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t k;
  void *v103;
  BOOL v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t m;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t n;
  FigPointCloudDataCaptureConnectionConfiguration *v114;
  FigCaptureSourceConfiguration *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v119;
  uint64_t v120;
  FigCaptureSourceConfiguration *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  int v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t jj;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t kk;
  void *v142;
  id v143;
  uint64_t mm;
  int v145;
  uint64_t v146;
  uint64_t v147;
  FigCaptureSessionParsedVideoDataSinkConfiguration *v148;
  uint64_t v149;
  uint64_t nn;
  FigCaptureSessionParsedVideoDataSinkConfiguration *v151;
  int v152;
  char IsSecureMetadataSource;
  char v154;
  FigCaptureSessionParsedVideoDataSinkConfiguration *v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t ii;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  _QWORD *v175;
  void *v176;
  void *v177;
  int v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t i1;
  void *v185;
  _QWORD *v186;
  void *v187;
  uint64_t v188;
  _QWORD *v189;
  uint64_t v190;
  uint64_t v191;
  FigPointCloudDataCaptureConnectionConfiguration *v192;
  FigPointCloudDataCaptureConnectionConfiguration *v193;
  uint64_t v194;
  uint64_t i2;
  FigPointCloudDataCaptureConnectionConfiguration *v196;
  FigPointCloudDataCaptureConnectionConfiguration *v197;
  _BOOL4 v198;
  void *v199;
  void *v200;
  _QWORD *v201;
  void *v202;
  _QWORD *v203;
  void *v204;
  void *v205;
  void *v206;
  _QWORD *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  uint64_t i3;
  void *v218;
  void *v219;
  _QWORD *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  _QWORD *v232;
  FigPointCloudDataCaptureConnectionConfiguration *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v244;
  void *v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  void *v249;
  uint64_t v250;
  void *v251;
  void *v252;
  void *v253;
  char *v254;
  id v255;
  id v256;
  void *v258;
  void *v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  void *v263;
  FigCaptureSourceConfiguration *v264;
  uint64_t v265;
  id obj;
  id obja;
  FigPointCloudDataCaptureConnectionConfiguration *v268;
  void *v269;
  uint64_t v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  unsigned int v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  int v348;
  _BYTE v349[128];
  _BYTE v350[128];
  _BYTE v351[128];
  _BYTE v352[128];
  _BYTE v353[128];
  _BYTE v354[128];
  _BYTE v355[128];
  _BYTE v356[128];
  _BYTE v357[128];
  _BYTE v358[128];
  _BYTE v359[128];
  _BYTE v360[128];
  _BYTE v361[128];
  _BYTE v362[128];
  _BYTE v363[128];
  _BYTE v364[128];
  _BYTE v365[128];
  _BYTE v366[128];
  objc_super v367;
  uint64_t v368;

  v368 = *MEMORY[0x1E0C80C00];
  v231 = result;
  if (!result)
    return result;
  v343 = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v251 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v252 = v5;
  v253 = v6;
  if ((objc_msgSend(a4, "allowAllConfigurations") & 1) == 0)
  {
    v342 = 0u;
    v341 = 0u;
    v340 = 0u;
    v339 = 0u;
    v7 = (void *)objc_msgSend(a2, "connectionConfigurations");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v339, v366, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v340;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v340 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v339 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "mediaType");
          v14 = (void *)objc_msgSend(a4, "allowedConnectionMediaTypes");
          if ((objc_msgSend(v14, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13)) & 1) == 0)
            return -12780;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v338 = 0u;
            v337 = 0u;
            v336 = 0u;
            v335 = 0u;
            v15 = (void *)objc_msgSend(v12, "metadataIdentifiers");
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v335, v365, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v336;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v336 != v18)
                    objc_enumerationMutation(v15);
                  if (!objc_msgSend((id)objc_msgSend(a4, "allowedConnectionMetadataIdentifiers"), "containsObject:", *(_QWORD *)(*((_QWORD *)&v335 + 1) + 8 * j)))return -12780;
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v335, v365, 16);
              }
              while (v17);
            }
          }
          v5 = v252;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v339, v366, 16);
        v6 = v253;
      }
      while (v9);
    }
  }
  v20 = (void *)objc_msgSend(a2, "connectionConfigurations");
  v21 = (void *)objc_msgSend(v20, "indexesOfObjectsPassingTest:", &__block_literal_global_31);
  if (objc_msgSend(v21, "count"))
    v22 = (void *)objc_msgSend(v20, "objectsAtIndexes:", v21);
  else
    v22 = 0;
  if (!objc_msgSend(v22, "count"))
  {
    v60 = 0;
    v61 = 0;
    v254 = 0;
    v255 = 0;
    v247 = 0;
    v249 = 0;
    v258 = 0;
    v259 = 0;
    v62 = 0;
    v242 = 0;
    v63 = 0;
    v261 = 0;
    v263 = 0;
    v245 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    *(_BYTE *)(v231 + 8) = 1;
    goto LABEL_441;
  }
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v22);
  v331 = 0u;
  v332 = 0u;
  v333 = 0u;
  v334 = 0u;
  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v331, v364, 16);
  if (!v24)
  {
LABEL_86:
    PointCloudConnectionConfigurationForLiDARDepth = 0;
LABEL_87:
    v268 = 0;
    goto LABEL_88;
  }
  v25 = v24;
  v26 = *(_QWORD *)v332;
LABEL_27:
  v27 = 0;
  while (1)
  {
    if (*(_QWORD *)v332 != v26)
      objc_enumerationMutation(v22);
    v28 = *(void **)(*((_QWORD *)&v331 + 1) + 8 * v27);
    if (objc_msgSend((id)objc_msgSend(v28, "sourceConfiguration"), "sourceDeviceType") == 13)
      break;
    if (v25 == ++v27)
    {
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v331, v364, 16);
      if (v25)
        goto LABEL_27;
      goto LABEL_86;
    }
  }
  v29 = (void *)objc_msgSend(v28, "sourceConfiguration");
  v348 = 0;
  if (objc_msgSend(v29, "sourceDeviceType") != 13)
  {
    fig_log_get_emitter();
    v228 = v235;
    LODWORD(v226) = 0;
    FigDebugAssert3();
    goto LABEL_86;
  }
  v30 = objc_msgSend(v29, "source");
  v31 = (const void *)FigVideoCaptureSourceCopyUnderlyingCaptureSourceForPortType(v30, *MEMORY[0x1E0D05A20], &v348);
  v32 = v348;
  if (v348)
  {
    fig_log_get_emitter();
    v228 = v235;
    LODWORD(v226) = v32;
LABEL_58:
    FigDebugAssert3();
    v37 = 0;
    if (!v31)
      goto LABEL_45;
    goto LABEL_44;
  }
  v367.receiver = 0;
  v33 = *(uint64_t (**)(const void *, const __CFString *, _QWORD, objc_super *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                         + 48);
  if (!v33)
  {
    v51 = -12782;
    v348 = -12782;
LABEL_57:
    fig_log_get_emitter();
    v228 = v235;
    LODWORD(v226) = v51;
    goto LABEL_58;
  }
  v34 = *MEMORY[0x1E0C9AE00];
  v35 = v33(v31, CFSTR("Formats"), *MEMORY[0x1E0C9AE00], &v367);
  v348 = v35;
  if (v35)
  {
    v51 = v35;
    goto LABEL_57;
  }
  v36 = cspc_timeOfFlightFormatWithMaximumPoints(v367.receiver);
  v37 = -[FigCaptureSourceConfiguration initWithSource:]([FigCaptureSourceConfiguration alloc], "initWithSource:", v31);
  v38 = (void *)MEMORY[0x1E0CB3940];
  v39 = (objc_class *)objc_opt_class();
  -[FigCaptureSourceConfiguration setSourceID:](v37, "setSourceID:", objc_msgSend(v38, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v39), v37));
  -[FigCaptureSourceConfiguration setRequiredFormat:](v37, "setRequiredFormat:", v36);

  *(_QWORD *)&v344 = 0;
  v40 = *(uint64_t (**)(const void *, const __CFString *, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
  if (!v40)
  {
    v59 = -12782;
    v348 = -12782;
    goto LABEL_82;
  }
  v41 = v40(v31, CFSTR("AttributesDictionary"), v34, &v344);
  v348 = v41;
  if (v41)
  {
    v59 = v41;
LABEL_82:
    fig_log_get_emitter();
    v228 = v235;
    LODWORD(v226) = v59;
    FigDebugAssert3();
    if (!v31)
      goto LABEL_45;
LABEL_44:
    CFRelease(v31);
    goto LABEL_45;
  }
  if (objc_msgSend((id)objc_msgSend((id)v344, "objectForKeyedSubscript:", CFSTR("TimeOfFlightCameraType")), "intValue") == 2)v43 = 60.0;
  else
    v43 = 30.0;
  *(float *)&v42 = v43;
  -[FigCaptureSourceConfiguration setRequiredMinFrameRate:](v37, "setRequiredMinFrameRate:", v42);
  *(float *)&v44 = v43;
  -[FigCaptureSourceConfiguration setRequiredMaxFrameRate:](v37, "setRequiredMaxFrameRate:", v44);
  objc_msgSend(v36, "maxSupportedFrameRate");
  -[FigCaptureSourceConfiguration setMaxFrameRateClientOverride:](v37, "setMaxFrameRateClientOverride:");

  if (v31)
    goto LABEL_44;
LABEL_45:
  if (!v37)
    goto LABEL_86;
  v344 = 0u;
  v345 = 0u;
  v346 = 0u;
  v347 = 0u;
  v45 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v344, &v367, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v345;
LABEL_48:
    v48 = 0;
    while (1)
    {
      if (*(_QWORD *)v345 != v47)
        objc_enumerationMutation(v22);
      v49 = *(void **)(*((_QWORD *)&v344 + 1) + 8 * v48);
      if (objc_msgSend((id)objc_msgSend(v49, "sourceConfiguration", v226, v228), "sourceDeviceType") == 13
        && objc_msgSend((id)objc_msgSend(v49, "sinkConfiguration"), "sinkType") == 11)
      {
        break;
      }
      if (v46 == ++v48)
      {
        v46 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v344, &v367, 16);
        if (v46)
          goto LABEL_48;
        goto LABEL_55;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      PointCloudConnectionConfigurationForLiDARDepth = cspc_getPointCloudConnectionConfigurationForLiDARDepth(v49, v37);
      goto LABEL_62;
    }
    fig_log_get_emitter();
    v228 = v235;
    LODWORD(v226) = 0;
    FigDebugAssert3();
  }
LABEL_55:
  PointCloudConnectionConfigurationForLiDARDepth = 0;
LABEL_62:
  v344 = 0u;
  v345 = 0u;
  v346 = 0u;
  v347 = 0u;
  v52 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v344, &v367, 16, v226, v228);
  if (v52)
  {
    v53 = v52;
    v54 = PointCloudConnectionConfigurationForLiDARDepth;
    v55 = *(_QWORD *)v345;
LABEL_64:
    v56 = 0;
    while (1)
    {
      if (*(_QWORD *)v345 != v55)
        objc_enumerationMutation(v22);
      v57 = *(void **)(*((_QWORD *)&v344 + 1) + 8 * v56);
      if (objc_msgSend((id)objc_msgSend(v57, "sourceConfiguration"), "sourceDeviceType") == 13
        && objc_msgSend((id)objc_msgSend(v57, "sinkConfiguration"), "sinkType") == 10
        && objc_msgSend((id)objc_msgSend(v57, "sinkConfiguration"), "depthDataDeliveryEnabled"))
      {
        break;
      }
      if (v53 == ++v56)
      {
        v53 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v344, &v367, 16);
        if (v53)
          goto LABEL_64;
        goto LABEL_72;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      fig_log_get_emitter();
      v228 = v235;
      LODWORD(v226) = 0;
      FigDebugAssert3();
LABEL_72:
      v58 = 0;
      goto LABEL_75;
    }
    v58 = cspc_getPointCloudConnectionConfigurationForLiDARDepth(v57, v37);
LABEL_75:
    PointCloudConnectionConfigurationForLiDARDepth = v54;
    if (!v54)
      goto LABEL_77;
  }
  else
  {
    v58 = 0;
    if (!PointCloudConnectionConfigurationForLiDARDepth)
      goto LABEL_77;
  }
  objc_msgSend(v23, "addObject:", PointCloudConnectionConfigurationForLiDARDepth, v226, v228);
LABEL_77:
  if (!v58)
    goto LABEL_87;
  v268 = v58;
  objc_msgSend(v23, "addObject:", v58);
LABEL_88:
  v67 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v23, v226, v228);
  v348 = 0;
  v68 = FigCaptureConnectionConfigurationWithSinkTypeAndMediaType(v67, 1, 1986618469);
  obj = v67;
  v69 = FigCaptureConnectionConfigurationWithSinkTypeAndMediaType(v67, 10, 1986618469);
  v70 = (void *)objc_msgSend(v69, "sourceConfiguration");
  v71 = (void *)objc_msgSend(v69, "sinkConfiguration");
  v72 = 0;
  if ((objc_msgSend(v71, "digitalFlashCaptureEnabled") & 1) == 0)
    v72 = objc_msgSend((id)objc_msgSend(v70, "requiredFormat"), "configureForDigitalFlashSupport") ^ 1;
  if ((objc_msgSend(v71, "depthDataDeliveryEnabled") & 1) != 0)
    v73 = 0;
  else
    v73 = objc_msgSend((id)objc_msgSend(v70, "requiredFormat"), "configureForDepthDataDelivery") ^ 1;
  if ((objc_msgSend((id)objc_msgSend(v70, "requiredFormat"), "isSupplementalTimeOfFlightCameraSupported") & 1) != 0)
    v74 = 0;
  else
    v74 = objc_msgSend((id)objc_msgSend(v70, "requiredFormat"), "configureForSupplementalTimeOfFlightCameraSupport") ^ 1;
  if ((objc_msgSend(v68, "portraitAutoSuggestEnabled") & 1) != 0)
    v75 = 1;
  else
    v75 = objc_msgSend((id)objc_msgSend(v70, "requiredFormat"), "isPortraitAutoSuggestSupported");
  v233 = PointCloudConnectionConfigurationForLiDARDepth;
  if (((v72 | v73 | v74) & 1) == 0 && (objc_msgSend(v71, "irisMovieCaptureEnabled") ^ 1 | v75) == 1)
  {
    v76 = FigVideoCaptureSourceCopySupplementalTimeOfFlightCaptureSource(objc_msgSend(v70, "source"), &v348);
    v77 = v348;
    if (!v348)
    {
      v78 = v76;
      if (!v76)
      {
        v343 = 0;
        goto LABEL_127;
      }
      *(_QWORD *)&v344 = 0;
      v79 = *MEMORY[0x1E0C9AE00];
      v80 = *(void (**)(uint64_t, const __CFString *, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
      if (v80)
      {
        v80(v78, CFSTR("AttributesDictionary"), v79, &v344);
        v81 = (void *)v344;
      }
      else
      {
        v81 = 0;
      }
      v82 = (void *)objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("SupportedTimeOfFlightProjectorModes"));
      if ((objc_msgSend(v82, "containsObject:", &unk_1E49F8DF0) & 1) != 0)
      {
        v83 = 3;
      }
      else if ((objc_msgSend(v82, "containsObject:", &unk_1E49F8E08) & 1) != 0)
      {
        v83 = 5;
      }
      else
      {
        if (!objc_msgSend(v82, "containsObject:", &unk_1E49F8DD8))
          goto LABEL_119;
        v83 = 1;
      }

      v367.receiver = 0;
      v84 = *(unsigned int (**)(uint64_t, const __CFString *, uint64_t, objc_super *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                              + 48);
      if (!v84
        || v84(v78, CFSTR("Formats"), v79, &v367)
        || (v85 = cspc_timeOfFlightFormatWithMaximumPoints(v367.receiver),
            objc_msgSend(v85, "minSupportedFrameRate"),
            v86 > 0.0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        v87 = -[FigCaptureSourceConfiguration initWithSource:]([FigCaptureSourceConfiguration alloc], "initWithSource:", v78);
        v88 = (void *)MEMORY[0x1E0CB3940];
        v89 = (objc_class *)objc_opt_class();
        -[FigCaptureSourceConfiguration setSourceID:](v87, "setSourceID:", objc_msgSend(v88, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v89), v78));
        -[FigCaptureSourceConfiguration setRequiredFormat:](v87, "setRequiredFormat:", v85);
        LODWORD(v90) = 0;
        -[FigCaptureSourceConfiguration setRequiredMinFrameRate:](v87, "setRequiredMinFrameRate:", v90);
        objc_msgSend(v85, "maxSupportedFrameRate");
        -[FigCaptureSourceConfiguration setRequiredMaxFrameRate:](v87, "setRequiredMaxFrameRate:");
        objc_msgSend(v85, "maxSupportedFrameRate");
        -[FigCaptureSourceConfiguration setMaxFrameRateClientOverride:](v87, "setMaxFrameRateClientOverride:");

        v91 = objc_alloc_init(FigPointCloudDataCaptureConnectionConfiguration);
        -[FigCaptureConnectionConfiguration setMediaType:](v91, "setMediaType:", 1885564004);
        -[FigPointCloudDataCaptureConnectionConfiguration setProjectorMode:](v91, "setProjectorMode:", v83);
        v92 = (void *)MEMORY[0x1E0CB3940];
        v93 = (objc_class *)objc_opt_class();
        -[FigCaptureConnectionConfiguration setConnectionID:](v91, "setConnectionID:", objc_msgSend(v92, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v93), v91));
        -[FigCaptureConnectionConfiguration setSourceConfiguration:](v91, "setSourceConfiguration:", v87);
        -[FigCaptureConnectionConfiguration setUnderlyingDeviceType:](v91, "setUnderlyingDeviceType:", 10);
        if (v91)
        {
          -[FigPointCloudDataCaptureConnectionConfiguration setSupplementalPointCloudData:](v91, "setSupplementalPointCloudData:", 1);
          -[FigCaptureConnectionConfiguration setSinkConfiguration:](v91, "setSinkConfiguration:", v71);
          objc_msgSend((id)objc_msgSend(v70, "requiredFormat"), "isSupplementalTimeOfFlightCameraSupported");
          -[FigPointCloudDataCaptureConnectionConfiguration setPointCloudOutputDisabled:](v91, "setPointCloudOutputDisabled:", 0);
          goto LABEL_124;
        }
      }
LABEL_119:
      v343 = -12780;
LABEL_120:
      fig_log_get_emitter();
LABEL_419:
      FigDebugAssert3();
      return v343;
    }
    fig_log_get_emitter();
    v229 = v235;
    LODWORD(v227) = v77;
    FigDebugAssert3();
  }
  v91 = 0;
LABEL_124:
  v343 = v348;
  if (v348)
    goto LABEL_120;
  if (v91)
  {
    v94 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", obj);
    objc_msgSend(v94, "addObject:", v91);
    goto LABEL_128;
  }
LABEL_127:
  v94 = obj;
LABEL_128:
  v330 = 0u;
  v329 = 0u;
  v328 = 0u;
  v327 = 0u;
  obja = v94;
  v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v327, v363, 16, v227, v229);
  if (!v95)
    goto LABEL_163;
  v96 = v95;
  v97 = 0;
  v98 = 0;
  v99 = 0;
  v100 = 0;
  v101 = *(_QWORD *)v328;
  while (2)
  {
    for (k = 0; k != v96; ++k)
    {
      if (*(_QWORD *)v328 != v101)
        objc_enumerationMutation(obja);
      v103 = *(void **)(*((_QWORD *)&v327 + 1) + 8 * k);
      if ((objc_msgSend((id)objc_msgSend(v103, "sourceConfiguration"), "sourceDeviceType") == 7
         || objc_msgSend((id)objc_msgSend(v103, "sourceConfiguration"), "sourceDeviceType") == 8)
        && (objc_msgSend((id)objc_msgSend(v103, "sourceConfiguration"), "sourcePosition") == 1
          ? (v104 = v97 == 0)
          : (v104 = 0),
            v104))
      {
        v97 = (id)objc_msgSend((id)objc_msgSend(v103, "sourceConfiguration"), "copy");
        v98 = 1;
      }
      else
      {
        if (objc_msgSend((id)objc_msgSend(v103, "sourceConfiguration"), "sourceDeviceType") == 14)
        {
          v100 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "sourceConfiguration"), "requiredFormat"), "cinematicFramingOutputDimensions");
          objc_msgSend((id)objc_msgSend(v103, "sourceConfiguration"), "setDeskCamOutputDimensions:", v100);
          v99 = 1;
        }
        if ((v98 & 1) == 0)
          continue;
      }
      if ((v99 & 1) != 0)
      {
        v98 = 1;
        v99 = 1;
        goto LABEL_149;
      }
    }
    v96 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v327, v363, 16);
    if (v96)
      continue;
    break;
  }
LABEL_149:
  PointCloudConnectionConfigurationForLiDARDepth = v233;
  if ((v98 & 1) != 0 && (v99 & 1) != 0)
  {
    v326 = 0u;
    v325 = 0u;
    v324 = 0u;
    v323 = 0u;
    v105 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v323, v362, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v324;
      do
      {
        for (m = 0; m != v106; ++m)
        {
          if (*(_QWORD *)v324 != v107)
            objc_enumerationMutation(obja);
          v109 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * m);
          if (objc_msgSend((id)objc_msgSend(v109, "sourceConfiguration"), "sourceDeviceType") == 14)
          {
            objc_msgSend(v109, "setSourceConfiguration:", v97);
LABEL_160:
            objc_msgSend((id)objc_msgSend(v109, "sourceConfiguration"), "setDeskCamEnabled:", 1);
            objc_msgSend((id)objc_msgSend(v109, "sourceConfiguration"), "setDeskCamOutputDimensions:", v100);
            continue;
          }
          if (objc_msgSend((id)objc_msgSend(v109, "sourceConfiguration"), "sourceDeviceType") == 7
            || objc_msgSend((id)objc_msgSend(v109, "sourceConfiguration"), "sourceDeviceType") == 8)
          {
            goto LABEL_160;
          }
        }
        v106 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v323, v362, 16);
      }
      while (v106);
    }
  }
LABEL_163:
  v322 = 0u;
  v321 = 0u;
  v320 = 0u;
  v319 = 0u;
  v110 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v319, v361, 16);
  if (v110)
  {
    v111 = v110;
    v264 = 0;
    v112 = *(_QWORD *)v320;
    do
    {
      for (n = 0; n != v111; ++n)
      {
        if (*(_QWORD *)v320 != v112)
          objc_enumerationMutation(obja);
        v114 = *(FigPointCloudDataCaptureConnectionConfiguration **)(*((_QWORD *)&v319 + 1) + 8 * n);
        if (!-[FigCaptureConnectionConfiguration connectionID](v114, "connectionID")
          || (v115 = -[FigCaptureConnectionConfiguration sourceConfiguration](v114, "sourceConfiguration"),
              (v116 = -[FigCaptureSourceConfiguration sourceID](v115, "sourceID")) == 0))
        {
LABEL_420:
          fig_log_get_emitter();
          goto LABEL_433;
        }
        v117 = v116;
        if (!objc_msgSend(v5, "objectForKeyedSubscript:", v116))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v117);
        objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", v117), "addObject:", v114);
        if (v114 != PointCloudConnectionConfigurationForLiDARDepth && v114 != v268)
        {
          if (-[FigCaptureConnectionConfiguration smartCameraRequired](v114, "smartCameraRequired"))
            -[FigCaptureSourceConfiguration setSmartCameraEnabled:](-[FigCaptureConnectionConfiguration sourceConfiguration](v114, "sourceConfiguration"), "setSmartCameraEnabled:", 1);
          if (objc_msgSend(a2, "smartStyleRenderingEnabled")
            && (-[FigCaptureConnectionConfiguration videoPreviewSinkConfiguration](v114, "videoPreviewSinkConfiguration")|| -[FigCaptureConnectionConfiguration videoDataSinkConfiguration](v114, "videoDataSinkConfiguration")|| -[FigCaptureConnectionConfiguration movieFileSinkConfiguration](v114, "movieFileSinkConfiguration")|| -[FigCaptureConnectionConfiguration stillImageSinkConfiguration](v114, "stillImageSinkConfiguration")))
          {
            -[FigCaptureSourceConfiguration setSmartCameraEnabled:](-[FigCaptureConnectionConfiguration sourceConfiguration](v114, "sourceConfiguration"), "setSmartCameraEnabled:", 1);
          }
          v119 = -[FigCaptureSinkConfiguration sinkID](-[FigCaptureConnectionConfiguration sinkConfiguration](v114, "sinkConfiguration"), "sinkID");
          if (!v119)
            goto LABEL_420;
          v120 = v119;
          if (!objc_msgSend(v6, "objectForKeyedSubscript:", v119))
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v120);
          objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", v120), "addObject:", v114);
          if (!v264)
          {
            if (-[FigCaptureSourceConfiguration sourceType](v115, "sourceType") == 1)
              v121 = v115;
            else
              v121 = 0;
            v264 = v121;
          }
        }
      }
      v111 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v319, v361, 16);
    }
    while (v111);
  }
  else
  {
    v264 = 0;
  }
  v317 = 0u;
  v318 = 0u;
  v315 = 0u;
  v316 = 0u;
  v246 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v315, v360, 16);
  v63 = 0;
  if (v246)
  {
    v230 = 0;
    v263 = 0;
    v232 = 0;
    v234 = 0;
    v248 = *(_QWORD *)v316;
    do
    {
      v122 = 0;
      do
      {
        if (*(_QWORD *)v316 != v248)
        {
          v123 = v122;
          objc_enumerationMutation(v5);
          v122 = v123;
        }
        v250 = v122;
        v124 = *(_QWORD *)(*((_QWORD *)&v315 + 1) + 8 * v122);
        v125 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v124);
        v126 = (void *)objc_msgSend((id)objc_msgSend(v125, "firstObject"), "sourceConfiguration");
        v127 = objc_msgSend(v126, "sourceType");
        if (v127 == 4)
        {
          if (!v263)
            v263 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v293 = 0u;
          v294 = 0u;
          v291 = 0u;
          v292 = 0u;
          v162 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v291, v354, 16);
          v6 = v253;
          if (v162)
          {
            v163 = v162;
            v164 = *(_QWORD *)v292;
            do
            {
              for (ii = 0; ii != v163; ++ii)
              {
                if (*(_QWORD *)v292 != v164)
                  objc_enumerationMutation(v125);
                v166 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * ii);
                if (!objc_msgSend(v166, "formatDescription")
                  || !-[__CFArray count](CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend(v166, "formatDescription")), "count"))
                {
                  fig_log_get_emitter();
                  goto LABEL_433;
                }
                objc_msgSend(v263, "addObject:", v166);
              }
              v163 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v291, v354, 16);
            }
            while (v163);
          }
        }
        else if (v127 == 2)
        {
          if (v232)
            return FigSignalErrorAt();
          if (v264)
          {
            v156 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", -[FigCaptureSourceConfiguration sourceID](v264, "sourceID"));
            v295 = 0u;
            v296 = 0u;
            v297 = 0u;
            v298 = 0u;
            v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v295, v355, 16);
            v6 = v253;
            if (v157)
            {
              v158 = v157;
              v159 = *(_QWORD *)v296;
LABEL_271:
              v160 = 0;
              while (1)
              {
                if (*(_QWORD *)v296 != v159)
                  objc_enumerationMutation(v156);
                v161 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * v160);
                if (objc_msgSend((id)objc_msgSend(v161, "sinkConfiguration"), "sinkType") == 4
                  && objc_msgSend(v161, "mediaType") == 1986618469)
                {
                  break;
                }
                if (v158 == ++v160)
                {
                  v158 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v295, v355, 16);
                  if (v158)
                    goto LABEL_271;
                  goto LABEL_278;
                }
              }
            }
            else
            {
LABEL_278:
              v161 = 0;
            }
          }
          else
          {
            v161 = 0;
            v6 = v253;
          }
          v232 = -[FigCaptureSessionParsedMicSourceConfiguration initWithMicConnectionConfigurations:cameraConfigurationForStereoAudioCapture:movieFileVideoConnectionConfigurationForStereoAudioCapture:]([FigCaptureSessionParsedMicSourceConfiguration alloc], v125, v264, v161);
        }
        else
        {
          if (v127 == 1)
          {
            if (!v234)
              v234 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            *(_QWORD *)&v344 = 0;
            v128 = -[FigCaptureSessionParsedCameraSourceConfiguration initWithConnectionConfigurations:clientSetsUserInitiatedCaptureRequestTime:smartStyleEnabled:sceneClassifierConnectionConfigurationOut:]([FigCaptureSessionParsedCameraSourceConfiguration alloc], v125, a3, objc_msgSend(a2, "smartStyleRenderingEnabled"), (FigVideoCaptureConnectionConfiguration **)&v344);
            v129 = v230;
            if (!v128)
              return FigSignalErrorAt();
            v130 = v128;
            objc_msgSend(v234, "addObject:", v128);
            if ((_QWORD)v344)
              objc_msgSend(v251, "setObject:forKeyedSubscript:", (_QWORD)v344, objc_msgSend(v126, "sourceID"));
            v131 = FigCaptureUnderlyingDeviceTypesFromConnectionConfigurations((void *)objc_msgSend(v130, "previewDerivedConnectionConfigurations"));
            v311 = 0u;
            v312 = 0u;
            v313 = 0u;
            v314 = 0u;
            v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v311, v359, 16);
            if (v132)
            {
              v133 = v132;
              v134 = *(_QWORD *)v312;
              do
              {
                for (jj = 0; jj != v133; ++jj)
                {
                  if (*(_QWORD *)v312 != v134)
                    objc_enumerationMutation(v131);
                  v136 = *(void **)(*((_QWORD *)&v311 + 1) + 8 * jj);
                  if (!v129)
                    v129 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  objc_msgSend(v129, "addObject:", -[FigCaptureSessionParsedPreviewSinkConfiguration initWithParsedCameraSourceConfiguration:sourceDeviceType:]([FigCaptureSessionParsedPreviewSinkConfiguration alloc], v130, objc_msgSend(v136, "intValue")));
                }
                v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v311, v359, 16);
              }
              while (v133);
            }
            v309 = 0u;
            v310 = 0u;
            v307 = 0u;
            v308 = 0u;
            v137 = (void *)objc_msgSend(v130, "videoDataConnectionConfigurations");
            v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v307, v358, 16);
            if (v138)
            {
              v139 = v138;
              v140 = *(_QWORD *)v308;
              do
              {
                for (kk = 0; kk != v139; ++kk)
                {
                  if (*(_QWORD *)v308 != v140)
                    objc_enumerationMutation(v137);
                  v142 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * kk);
                  if ((int)objc_msgSend(v142, "outputWidth") < 1 || (int)objc_msgSend(v142, "outputHeight") < 1)
                    return v343;
                  v143 = -[FigCaptureSessionParsedVideoDataSinkConfiguration initWithVideoDataConnectionConfiguration:]([FigCaptureSessionParsedVideoDataSinkConfiguration alloc], v142);
                  if (!v63)
                    v63 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  objc_msgSend(v63, "addObject:", v143);
                }
                v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v307, v358, 16);
              }
              while (v139);
            }
            v230 = v129;
            v305 = 0u;
            v306 = 0u;
            v303 = 0u;
            v304 = 0u;
            v256 = (id)objc_msgSend(v130, "metadataObjectConnectionConfigurations");
            v262 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v303, v357, 16);
            if (v262)
            {
              v260 = *(_QWORD *)v304;
              do
              {
                for (mm = 0; mm != v262; ++mm)
                {
                  if (*(_QWORD *)v304 != v260)
                    objc_enumerationMutation(v256);
                  v269 = *(void **)(*((_QWORD *)&v303 + 1) + 8 * mm);
                  v145 = objc_msgSend(v269, "underlyingDeviceType");
                  v299 = 0u;
                  v300 = 0u;
                  v301 = 0u;
                  v302 = 0u;
                  v146 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v299, v356, 16);
                  if (v146)
                  {
                    v147 = v146;
                    v148 = 0;
                    v149 = *(_QWORD *)v300;
                    do
                    {
                      for (nn = 0; nn != v147; ++nn)
                      {
                        if (*(_QWORD *)v300 != v149)
                          objc_enumerationMutation(v63);
                        v151 = *(FigCaptureSessionParsedVideoDataSinkConfiguration **)(*((_QWORD *)&v299 + 1) + 8 * nn);
                        if (-[NSString isEqualToString:](-[FigCaptureSourceConfiguration sourceID](-[FigCaptureSessionParsedVideoDataSinkConfiguration cameraConfiguration](v151, "cameraConfiguration"), "sourceID"), "isEqualToString:", v124)&& -[FigCaptureSessionParsedVideoDataSinkConfiguration sourceDeviceType](v151, "sourceDeviceType") == v145)
                        {
                          if (v148)
                          {
                            v152 = -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](-[FigCaptureSessionParsedVideoDataSinkConfiguration videoDataConnectionConfiguration](v151, "videoDataConnectionConfiguration"), "videoStabilizationMethod");
                            if (v152 < -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](-[FigCaptureSessionParsedVideoDataSinkConfiguration videoDataConnectionConfiguration](v148, "videoDataConnectionConfiguration"), "videoStabilizationMethod"))v148 = v151;
                          }
                          else
                          {
                            v148 = v151;
                          }
                        }
                      }
                      v147 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v299, v356, 16);
                    }
                    while (v147);
                  }
                  else
                  {
                    v148 = 0;
                  }
                  if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v269))
                    IsSecureMetadataSource = FigCaptureSourceIsSecureMetadataSource(objc_msgSend((id)objc_msgSend(v269, "sourceConfiguration"), "source"), &v343);
                  else
                    IsSecureMetadataSource = 1;
                  if (v343)
                  {
                    fig_log_get_emitter();
                    goto LABEL_419;
                  }
                  if (v148)
                    v154 = 1;
                  else
                    v154 = IsSecureMetadataSource;
                  if ((v154 & 1) == 0)
                  {
                    v155 = [FigCaptureSessionParsedVideoDataSinkConfiguration alloc];
                    if (v155)
                    {
                      v367.receiver = v155;
                      v367.super_class = (Class)FigCaptureSessionParsedVideoDataSinkConfiguration;
                      v155 = (FigCaptureSessionParsedVideoDataSinkConfiguration *)objc_msgSendSuper2(&v367, sel_init);
                    }
                    v148 = v155;
                    if (!v63)
                      v63 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    objc_msgSend(v63, "addObject:", v148);
                  }
                  -[FigCaptureSessionParsedVideoDataSinkConfiguration _setMetadataObjectConnectionConfiguration:]((id *)&v148->super.isa, v269);
                }
                v262 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v303, v357, 16);
              }
              while (v262);
            }
            v5 = v252;
          }
          v6 = v253;
        }
        v122 = v250 + 1;
      }
      while (v250 + 1 != v246);
      v246 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v315, v360, 16);
    }
    while (v246);
  }
  else
  {
    v230 = 0;
    v263 = 0;
    v232 = 0;
    v234 = 0;
  }
  v289 = 0u;
  v290 = 0u;
  v287 = 0u;
  v288 = 0u;
  v167 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v287, v353, 16);
  if (!v167)
  {
    v254 = 0;
    v255 = 0;
    v247 = 0;
    v249 = 0;
    v258 = 0;
    v259 = 0;
    v242 = 0;
    v244 = 0;
    v261 = 0;
    v245 = 0;
    goto LABEL_401;
  }
  v168 = v167;
  v254 = 0;
  v255 = 0;
  v247 = 0;
  v249 = 0;
  v258 = 0;
  v259 = 0;
  v242 = 0;
  v244 = 0;
  v261 = 0;
  v245 = 0;
  v169 = *(_QWORD *)v288;
  v241 = *(_QWORD *)v288;
LABEL_299:
  v170 = 0;
  v265 = v168;
  while (2)
  {
    if (*(_QWORD *)v288 != v169)
      objc_enumerationMutation(v6);
    v270 = v170;
    v171 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v287 + 1) + 8 * v170));
    v172 = (void *)objc_msgSend(v171, "firstObject");
    v173 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType((void *)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v172, "sourceConfiguration"), "sourceID")), objc_msgSend(v172, "underlyingDeviceType"));
    switch(objc_msgSend((id)objc_msgSend(v172, "sinkConfiguration"), "sinkType"))
    {
      case 3u:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v174 = FigCaptureConnectionConfigurationWithSinkType(v173, 4);
        v175 = -[FigCaptureSessionParsedStillImageSinkConfiguration initWithStillImageConnectionConfiguration:movieFileVideoConnectionConfiguration:pointCloudDataConnectionConfiguration:]([FigCaptureSessionParsedStillImageSinkConfiguration alloc], v172, v174, 0);
        v176 = v261;
        if (!v261)
          v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v261 = v176;
        goto LABEL_391;
      case 4u:
        v204 = FigCaptureConnectionConfigurationWithSourceType(v171, 1);
        v205 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType((void *)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v204, "sourceConfiguration"), "sourceID")), objc_msgSend(v204, "underlyingDeviceType"));
        v206 = FigCaptureConnectionConfigurationWithSinkType(v205, 3);
        if (!v206)
          v206 = FigCaptureConnectionConfigurationWithSinkType(v205, 10);
        v207 = -[FigCaptureSessionParsedMovieFileSinkConfiguration initWithCaptureConnectionConfigurations:stillImageConnectionConfiguration:sceneClassifierConnectionConfigurationsBySourceID:]([FigCaptureSessionParsedMovieFileSinkConfiguration alloc], v171, v206, v251);
        if (!v207)
          return FigSignalErrorAt();
        v203 = v207;
        v208 = v259;
        if (!v259)
          goto LABEL_369;
        goto LABEL_370;
      case 5u:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v176 = v247;
        if (!v247)
          v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v247 = v176;
        goto LABEL_385;
      case 7u:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v176 = v249;
        if (!v249)
          v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v249 = v176;
        goto LABEL_385;
      case 8u:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v240 = FigCaptureConnectionConfigurationWithSinkType(v173, 6);
        v239 = FigCaptureConnectionConfigurationWithSinkType(v173, 1);
        v236 = FigCaptureConnectionConfigurationWithSinkType(v173, 11);
        v238 = FigCaptureConnectionConfigurationWithSinkType(v173, 4);
        v177 = (void *)objc_msgSend(v251, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v172, "sourceConfiguration"), "sourceID"));
        v178 = objc_msgSend(v177, "underlyingDeviceType");
        if (v178 == objc_msgSend(v172, "underlyingDeviceType"))
          v179 = v177;
        else
          v179 = 0;
        v237 = v179;
        v180 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v283 = 0u;
        v284 = 0u;
        v285 = 0u;
        v286 = 0u;
        v181 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v283, v352, 16);
        if (v181)
        {
          v182 = v181;
          v183 = *(_QWORD *)v284;
          do
          {
            for (i1 = 0; i1 != v182; ++i1)
            {
              if (*(_QWORD *)v284 != v183)
                objc_enumerationMutation(v173);
              v185 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * i1);
              if ((objc_msgSend((id)objc_msgSend(v185, "sinkConfiguration"), "sinkType") == 4
                 || objc_msgSend((id)objc_msgSend(v185, "sinkConfiguration"), "sinkType") == 10)
                && objc_msgSend(v185, "mediaType") == 1835365473
                && FigMetadataItemConnectionConfigurationRequiresObjectDetection(v185))
              {
                objc_msgSend(v180, "addObject:", v185);
              }
            }
            v182 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v283, v352, 16);
          }
          while (v182);
        }
        v186 = -[FigCaptureSessionParsedMetadataSinkConfiguration initWithMetadataObjectConnectionConfiguration:sceneClassifierConnectionConfiguration:videoDataConnectionConfiguration:videoPreviewSinkConnectionConfiguration:movieFileVideoConnectionConfiguration:movieFileDetectedObjectMetadataConnectionConfigurations:]([FigCaptureSessionParsedMetadataSinkConfiguration alloc], v172, v237, v240, v239, v238, v180);
        v187 = v244;
        if (!v244)
          v187 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v244 = v187;
        objc_msgSend(v187, "addObject:", v186);
        v5 = v252;
        v169 = v241;
        v168 = v265;
        if (!FigCaptureMetadataObjectConfigurationRequiresFaceTracking(v172)
          || !objc_msgSend((id)objc_msgSend(v172, "sourceConfiguration"), "depthDataDeliveryEnabled")
          || v236)
        {
          goto LABEL_393;
        }
        v188 = (uint64_t)v258;
        if (!v258)
          v188 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v189 = -[FigCaptureSessionParsedDepthDataSinkConfiguration initWithDepthDataConnectionConfiguration:videoDataConnectionConfiguration:metadataObjectConnectionConfiguration:]([FigCaptureSessionParsedDepthDataSinkConfiguration alloc], 0, v240, v172);
        v258 = (void *)v188;
        v176 = (void *)v188;
        goto LABEL_392;
      case 0xAu:
        v281 = 0u;
        v282 = 0u;
        v279 = 0u;
        v280 = 0u;
        v190 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v279, v351, 16);
        if (!v190)
          return FigSignalErrorAt();
        v191 = v190;
        v192 = 0;
        v193 = 0;
        v194 = *(_QWORD *)v280;
        do
        {
          for (i2 = 0; i2 != v191; ++i2)
          {
            if (*(_QWORD *)v280 != v194)
              objc_enumerationMutation(v171);
            v196 = *(FigPointCloudDataCaptureConnectionConfiguration **)(*((_QWORD *)&v279 + 1) + 8 * i2);
            if (-[FigCaptureConnectionConfiguration mediaType](v196, "mediaType") == 1986618469)
            {
              v192 = v196;
            }
            else if (-[FigCaptureConnectionConfiguration mediaType](v196, "mediaType") == 1885564004)
            {
              v193 = v196;
            }
          }
          v191 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v279, v351, 16);
        }
        while (v191);
        v197 = v268 ? v268 : v193;
        v5 = v252;
        if (!v192)
          return FigSignalErrorAt();
        v198 = -[FigCaptureIrisSinkConfiguration irisMovieCaptureEnabled](-[FigCaptureConnectionConfiguration irisSinkConfiguration](v192, "irisSinkConfiguration"), "irisMovieCaptureEnabled");
        v199 = v192;
        if (!v198)
        {
          v200 = (void *)FigCaptureConnectionConfigurationsFilterWithUnderlyingDeviceType((void *)objc_msgSend(v252, "objectForKeyedSubscript:", -[FigCaptureSourceConfiguration sourceID](-[FigCaptureConnectionConfiguration sourceConfiguration](v192, "sourceConfiguration"), "sourceID")), -[FigCaptureConnectionConfiguration underlyingDeviceType](v192, "underlyingDeviceType"));
          v199 = FigCaptureConnectionConfigurationWithSinkType(v200, 4);
        }
        v201 = -[FigCaptureSessionParsedStillImageSinkConfiguration initWithStillImageConnectionConfiguration:movieFileVideoConnectionConfiguration:pointCloudDataConnectionConfiguration:]([FigCaptureSessionParsedStillImageSinkConfiguration alloc], v192, v199, v197);
        v202 = v261;
        if (!v261)
          v202 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        objc_msgSend(v202, "addObject:", v201);
        v261 = v202;
        if (v198)
        {
          v169 = v241;
          if (v259)
            return FigSignalErrorAt();
          v203 = -[FigCaptureSessionParsedMovieFileSinkConfiguration initWithCaptureConnectionConfigurations:stillImageConnectionConfiguration:sceneClassifierConnectionConfigurationsBySourceID:]([FigCaptureSessionParsedMovieFileSinkConfiguration alloc], v171, v192, v251);
LABEL_369:
          v208 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
LABEL_370:
          v259 = v208;
LABEL_375:
          objc_msgSend(v208, "addObject:", v203);
        }
        else
        {
          v169 = v241;
        }
        v168 = v265;
        goto LABEL_393;
      case 0xBu:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v209 = FigCaptureConnectionConfigurationWithSinkType(v173, 6);
        v210 = FigCaptureConnectionConfigurationWithSinkType(v173, 8);
        v203 = -[FigCaptureSessionParsedDepthDataSinkConfiguration initWithDepthDataConnectionConfiguration:videoDataConnectionConfiguration:metadataObjectConnectionConfiguration:]([FigCaptureSessionParsedDepthDataSinkConfiguration alloc], v172, v209, v210);
        v208 = v258;
        if (!v258)
          v208 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v258 = v208;
        goto LABEL_375;
      case 0xCu:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v176 = v245;
        if (!v245)
          v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v245 = v176;
        goto LABEL_385;
      case 0xDu:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v211 = FigCaptureConnectionConfigurationWithSinkType(v173, 6);
        if (!v211)
        {
          fig_log_get_emitter();
LABEL_433:
          FigDebugAssert3();
          return FigSignalErrorAt();
        }
        v175 = -[FigCaptureSessionParsedVisionDataSinkConfiguration initWithVisionDataConnectionConfiguration:videoDataConnectionConfiguration:]([FigCaptureSessionParsedVisionDataSinkConfiguration alloc], v172, v211);
        v176 = v242;
        if (!v242)
          v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v242 = v176;
LABEL_391:
        v189 = v175;
LABEL_392:
        objc_msgSend(v176, "addObject:", v189);
LABEL_393:
        v170 = v270 + 1;
        v6 = v253;
        if (v270 + 1 != v168)
          continue;
        v212 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v287, v353, 16);
        v168 = v212;
        if (v212)
          goto LABEL_299;
LABEL_401:
        v277 = 0u;
        v278 = 0u;
        v275 = 0u;
        v276 = 0u;
        v66 = v234;
        v213 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v275, v350, 16);
        if (v213)
        {
          v214 = v213;
          v61 = 0;
          v215 = *(_QWORD *)v276;
          v216 = obja;
          do
          {
            for (i3 = 0; i3 != v214; ++i3)
            {
              if (*(_QWORD *)v276 != v215)
                objc_enumerationMutation(v234);
              v218 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * i3);
              v219 = (void *)objc_msgSend(v218, "videoPreviewSinkConnectionConfiguration");
              if (objc_msgSend(v219, "previewDepthDataDeliveryEnabled")
                && objc_msgSend(v219, "previewFilterRenderingEnabled")
                && FigCaptureConnectionConfigurationWithSinkType((void *)objc_msgSend(v218, "videoCaptureConnectionConfigurations"), 4))
              {
                if (!v61)
                  v61 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v220 = -[FigCaptureSessionParsedCinematographyConfiguration initWithVideoPreviewSinkConnectionConfiguration:]([FigCaptureSessionParsedCinematographyConfiguration alloc], (void *)objc_msgSend(v218, "videoPreviewSinkConnectionConfiguration"));
                if (!v220)
                  return FigSignalErrorAt();
                objc_msgSend(v61, "addObject:", v220);
              }
            }
            v214 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v275, v350, 16);
          }
          while (v214);
        }
        else
        {
          v61 = 0;
          v216 = obja;
        }
        if (!v233)
        {
          v60 = 0;
          goto LABEL_440;
        }
        v60 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v271 = 0u;
        v272 = 0u;
        v273 = 0u;
        v274 = 0u;
        v221 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v271, v349, 16);
        if (!v221)
        {
LABEL_432:
          fig_log_get_emitter();
          goto LABEL_433;
        }
        v222 = v221;
        v223 = *(_QWORD *)v272;
LABEL_425:
        v224 = 0;
        while (1)
        {
          if (*(_QWORD *)v272 != v223)
            objc_enumerationMutation(v216);
          v225 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * v224);
          if (objc_msgSend((id)objc_msgSend(v225, "sourceConfiguration"), "sourceDeviceType") == 13
            && objc_msgSend((id)objc_msgSend(v225, "sinkConfiguration"), "sinkType") == 11)
          {
            break;
          }
          if (v222 == ++v224)
          {
            v222 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v271, v349, 16);
            if (v222)
              goto LABEL_425;
            goto LABEL_432;
          }
        }
        if (!v225)
          goto LABEL_432;
        objc_msgSend(v60, "addObject:", -[FigCaptureSessionParsedLiDARDepthPipelineConfiguration initWithTimeOfFlightCameraConfiguration:depthDataConnectionConfiguration:]([FigCaptureSessionParsedLiDARDepthPipelineConfiguration alloc], "initWithTimeOfFlightCameraConfiguration:depthDataConnectionConfiguration:", -[FigCaptureConnectionConfiguration sourceConfiguration](v233, "sourceConfiguration"), v225));
LABEL_440:
        v64 = v230;
        v65 = v232;
        v62 = v244;
LABEL_441:
        *(_QWORD *)(v231 + 40) = objc_msgSend(v66, "copy");
        *(_QWORD *)(v231 + 48) = v65;
        *(_QWORD *)(v231 + 56) = objc_msgSend(v263, "copy");
        *(_QWORD *)(v231 + 64) = objc_msgSend(v64, "copy");
        *(_QWORD *)(v231 + 72) = objc_msgSend(v245, "copy");
        *(_QWORD *)(v231 + 80) = objc_msgSend(v261, "copy");
        *(_QWORD *)(v231 + 88) = objc_msgSend(v63, "copy");
        *(_QWORD *)(v231 + 96) = objc_msgSend(v242, "copy");
        *(_QWORD *)(v231 + 104) = objc_msgSend(v258, "copy");
        *(_QWORD *)(v231 + 112) = objc_msgSend(v62, "copy");
        *(_QWORD *)(v231 + 120) = objc_msgSend(v259, "copy");
        *(_QWORD *)(v231 + 128) = objc_msgSend(v247, "copy");
        *(_QWORD *)(v231 + 136) = objc_msgSend(v249, "copy");
        *(_QWORD *)(v231 + 144) = objc_msgSend(v254, "copy");
        *(_QWORD *)(v231 + 152) = objc_msgSend(v255, "copy");
        *(_QWORD *)(v231 + 168) = objc_msgSend(v61, "copy");
        *(_QWORD *)(v231 + 160) = objc_msgSend(v60, "copy");
        -[FigCaptureSessionParsedConfiguration _computeVideoStabilizationTypes](v231);
        return v343;
      case 0xFu:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v176 = v254;
        if (!v254)
          v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v254 = (char *)v176;
        goto LABEL_385;
      case 0x10u:
        if (objc_msgSend(v171, "count") != 1)
          return FigSignalErrorAt();
        v176 = v255;
        if (!v255)
          v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v255 = v176;
LABEL_385:
        v189 = v172;
        goto LABEL_392;
      default:
        goto LABEL_393;
    }
  }
}

- (FigCaptureSessionParsedConfiguration)initWithSessionConfiguration:(id)a3 clientSetsUserInitiatedCaptureRequestTime:(BOOL)a4 restrictions:(id)a5
{
  FigCaptureSessionParsedConfiguration *v8;
  FigCaptureSessionParsedConfiguration *v9;
  int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FigCaptureSessionParsedConfiguration;
  v8 = -[FigCaptureSessionParsedConfiguration init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_useOfflineVISPipeline = 0;
    v10 = -[FigCaptureSessionParsedConfiguration _parseConfiguration:clientSetsUserInitiatedCaptureRequestTime:restrictions:]((uint64_t)v8, a3, a4, a5);
    v9->_isMultiCamSession = objc_msgSend(a3, "isMultiCamSession");
    v9->_continuityCameraIsWired = objc_msgSend(a3, "continuityCameraIsWired");
    v9->_continuityCameraClientDeviceClass = objc_msgSend(a3, "continuityCameraClientDeviceClass");
    v9->_clientIsVOIP = objc_msgSend(a3, "clientIsVOIP");
    v9->_suppressVideoEffects = objc_msgSend(a3, "suppressVideoEffects");
    v9->_smartStyleRenderingEnabled = objc_msgSend(a3, "smartStyleRenderingEnabled");
    v9->_smartStyleControlMode = objc_msgSend(a3, "smartStyleControlMode");
    v9->_smartStyle = (FigCaptureSmartStyle *)(id)objc_msgSend(a3, "smartStyle");
    if (v10)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v9;
}

- (NSArray)parsedCameraSourceConfigurations
{
  return self->_parsedCameraSourceConfigurations;
}

- (NSArray)parsedPreviewSinkConfigurations
{
  return self->_parsedPreviewSinkConfigurations;
}

- (NSArray)parsedStillImageSinkConfigurations
{
  return self->_parsedStillImageSinkConfigurations;
}

- (NSArray)parsedMovieFileSinkConfigurations
{
  return self->_parsedMovieFileSinkConfigurations;
}

- (uint64_t)_computeVideoStabilizationTypes
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  char v9;
  unsigned int v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  int v21;
  int v22;
  BOOL v23;
  unsigned __int8 v24;
  BOOL v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unsigned __int8 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
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
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v45 = result;
  if (result)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = *(id *)(result + 40);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    v41 = result;
    if (result)
    {
      v40 = *(_QWORD *)v59;
      do
      {
        v1 = 0;
        do
        {
          if (*(_QWORD *)v59 != v40)
            objc_enumerationMutation(obj);
          v2 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v1);
          if (objc_msgSend((id)objc_msgSend(v2, "stillImageConnectionConfiguration"), "irisVISEnabled"))
            objc_msgSend((id)objc_msgSend(v2, "stillImageConnectionConfiguration"), "setVideoStabilizationType:", cspc_getVideoStabilizationType((void *)objc_msgSend(v2, "stillImageConnectionConfiguration"), *(_BYTE *)(v45 + 18), 0, 0));
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v3 = *(void **)(v45 + 120);
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
          v43 = v2;
          if (v4)
          {
            v5 = v4;
            v6 = *(_QWORD *)v55;
            while (2)
            {
              for (i = 0; i != v5; ++i)
              {
                if (*(_QWORD *)v55 != v6)
                  objc_enumerationMutation(v3);
                if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "videoConnectionConfiguration"), "movieFileSinkConfiguration"), "trueVideoCaptureEnabled") & 1) != 0)
                {
                  v8 = 1;
                  goto LABEL_19;
                }
              }
              v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
              if (v5)
                continue;
              break;
            }
            v8 = 0;
LABEL_19:
            v2 = v43;
          }
          else
          {
            v8 = 0;
          }
          v42 = v1;
          if ((unint64_t)objc_msgSend(*(id *)(v45 + 40), "count") > 1)
          {
            v9 = 1;
            goto LABEL_30;
          }
          if ((int)objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "videoStabilizationStrength") <= 2)
          {
            v10 = objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "sourceDeviceType");
            v11 = 0;
            if (v10 > 9 || ((1 << v10) & 0x310) == 0)
              goto LABEL_29;
            if ((objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "spatialOverCaptureEnabled") & 1) == 0
              && (objc_msgSend((id)objc_msgSend(v2, "cameraConfiguration"), "depthDataDeliveryEnabled") & 1) == 0)
            {
              v33 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v34 = (id)objc_msgSend((id)objc_msgSend(v2, "previewDerivedConnectionConfigurations"), "mutableCopy");
              objc_msgSend(v34, "addObjectsFromArray:", objc_msgSend(v2, "videoCaptureConnectionConfigurations"));
              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
              if (v35)
              {
                v36 = v35;
                v37 = *(_QWORD *)v63;
                while (2)
                {
                  for (j = 0; j != v36; ++j)
                  {
                    if (*(_QWORD *)v63 != v37)
                      objc_enumerationMutation(v34);
                    objc_msgSend(v33, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "underlyingDeviceType")));
                    if ((unint64_t)objc_msgSend(v33, "count") > 1)
                    {
                      v11 = 1;
                      v2 = v43;
                      goto LABEL_29;
                    }
                  }
                  v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
                  v11 = 0;
                  v2 = v43;
                  if (v36)
                    continue;
                  break;
                }
              }
              else
              {
                v11 = 0;
              }
              goto LABEL_29;
            }
          }
          v11 = 1;
LABEL_29:
          v9 = v8 | v11;
LABEL_30:
          v44 = v9;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v12 = (void *)objc_msgSend(v2, "videoCaptureConnectionConfigurations");
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = *(_QWORD *)v51;
            do
            {
              for (k = 0; k != v14; ++k)
              {
                if (*(_QWORD *)v51 != v18)
                  objc_enumerationMutation(v12);
                v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v21 = objc_msgSend((id)objc_msgSend(v20, "sinkConfiguration"), "sinkType");
                  if ((v21 | 2) == 6)
                  {
                    v22 = v21;
                    if (objc_msgSend(v20, "videoStabilizationMethod"))
                    {
                      v23 = v22 != 4 || v20 == 0;
                      if (v23
                        || !objc_msgSend((id)objc_msgSend(v43, "videoPreviewSinkConnectionConfiguration"), "previewDepthDataDeliveryEnabled"))
                      {
                        v24 = 0;
                      }
                      else
                      {
                        v24 = objc_msgSend((id)objc_msgSend(v43, "videoPreviewSinkConnectionConfiguration"), "previewDepthFilterRenderingEnabled");
                      }
                      objc_msgSend(v20, "setVideoStabilizationType:", cspc_getVideoStabilizationType(v20, *(_BYTE *)(v45 + 18), v44, v24));
                    }
                    if (objc_msgSend(v20, "videoStabilizationType") == 1)
                    {
                      ++v15;
                    }
                    else
                    {
                      if (objc_msgSend(v20, "videoStabilizationType") - 3 < 2)
                        ++v16;
                      ++v17;
                    }
                  }
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
            }
            while (v14);
          }
          else
          {
            v15 = 0;
            v16 = 0;
            v17 = 0;
          }
          if (v15)
            v25 = v17 == 0;
          else
            v25 = 1;
          v26 = !v25;
          if (!v25 || v16 >= 2)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v27 = (void *)objc_msgSend(v43, "videoCaptureConnectionConfigurations");
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v47;
              do
              {
                for (m = 0; m != v29; ++m)
                {
                  if (*(_QWORD *)v47 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && (v26 && objc_msgSend(v32, "videoStabilizationType") == 1
                     || v16 >= 2 && objc_msgSend(v32, "videoStabilizationType") - 3 <= 1))
                  {
                    objc_msgSend(v32, "setVideoStabilizationType:", 2);
                  }
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
              }
              while (v29);
            }
          }
          v1 = v42 + 1;
        }
        while (v42 + 1 != v41);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        v41 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BOOL)isMultiCamSession
{
  return self->_isMultiCamSession;
}

- (NSArray)parsedVideoDataSinkConfigurations
{
  return self->_parsedVideoDataSinkConfigurations;
}

- (NSArray)parsedMetadataSinkConfigurations
{
  return self->_parsedMetadataSinkConfigurations;
}

- (NSArray)videoThumbnailSinkConfigurations
{
  return self->_videoThumbnailSinkConfigurations;
}

- (NSArray)pointCloudDataSinkConnectionConfigurations
{
  return self->_pointCloudDataSinkConnectionConfigurations;
}

- (NSArray)parsedVisionDataSinkConfigurations
{
  return self->_parsedVisionDataSinkConfigurations;
}

- (NSArray)parsedDepthDataSinkConfigurations
{
  return self->_parsedDepthDataSinkConfigurations;
}

- (NSArray)cameraCalibrationDataSinkConnectionConfigurations
{
  return self->_cameraCalibrationDataSinkConnectionConfigurations;
}

- (NSArray)audioDataSinkConnectionConfigurations
{
  return self->_audioDataSinkConnectionConfigurations;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedConfiguration;
  -[FigCaptureSessionParsedConfiguration dealloc](&v3, sel_dealloc);
}

- (FigCaptureSessionParsedMicSourceConfiguration)parsedMicSourceConfiguration
{
  return self->_parsedMicSourceConfiguration;
}

- (BOOL)useOfflineVISPipeline
{
  return self->_useOfflineVISPipeline;
}

- (BOOL)suppressVideoEffects
{
  return self->_suppressVideoEffects;
}

- (NSArray)parsedLiDARDepthPipelineConfigurations
{
  return self->_parsedLiDARDepthPipelineConfigurations;
}

- (NSArray)parsedCinematographyConfigurations
{
  return self->_parsedCinematographyConfigurations;
}

- (NSArray)metadataSourceConfigurations
{
  return self->_metadataSourceConfigurations;
}

- (BOOL)empty
{
  return self->_empty;
}

- (BOOL)continuityCameraIsWired
{
  return self->_continuityCameraIsWired;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (NSArray)audioFileSinkConnectionConfigurations
{
  return self->_audioFileSinkConnectionConfigurations;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BOOL)clientIsVOIP
{
  return self->_clientIsVOIP;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (int64_t)smartStyleControlMode
{
  return self->_smartStyleControlMode;
}

- (FigCaptureSmartStyle)smartStyle
{
  return self->_smartStyle;
}

@end
