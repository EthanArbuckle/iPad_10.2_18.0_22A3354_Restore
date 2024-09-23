@implementation HandlePlayerServerMessage

void __HandlePlayerServerMessage_block_invoke(uint64_t a1)
{
  int v2;
  const void *v3;
  uint64_t v4;
  CFTypeID v5;
  int IDByAssociatingWithClientConnection;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(const void *, uint64_t);
  const void *v10;
  __CFString **v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFTypeID v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, int64_t);
  uint64_t v19;
  int64_t v20;
  const void *v21;
  _xpc_connection_s *v22;
  uint64_t v23;
  void *v24;
  CFTypeID v25;
  uint64_t (*v26)(const void *, char *);
  uint64_t v27;
  pid_t pid;
  int v29;
  uint64_t v30;
  const void *v31;
  void *v32;
  void *v33;
  CFTypeID v34;
  int CMTime;
  uint64_t v36;
  uint64_t (*v37)(const void *, char *, uint64_t, CFTypeRef *, __int128 *);
  int v38;
  const void *v39;
  void *v40;
  uint64_t v41;
  CFTypeID v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, const __CFString *, _QWORD, char *);
  const void *v45;
  BOOL v46;
  __IOSurface *IOSurface;
  xpc_object_t XPCObject;
  const void *v49;
  void *v50;
  CFTypeID v51;
  double v52;
  uint64_t (*v53)(const void *, _QWORD, float);
  float v54;
  const void *v55;
  uint64_t v56;
  void *v57;
  CFTypeID v58;
  int64_t v59;
  _BOOL4 v60;
  uint64_t (*v61)(const void *, int64_t, char *, CFTypeRef *);
  CFTypeRef *v62;
  int v63;
  CFTypeRef v64;
  const void *v65;
  void *v66;
  uint64_t v67;
  CFTypeID v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)(const void *, uint64_t, uint64_t, __int128 *);
  uint64_t v73;
  const void *v74;
  void *v75;
  uint64_t v76;
  CFTypeID v77;
  int v78;
  uint64_t (*v79)(const void *, char *, CFDictionaryRef);
  const void *v80;
  void *v81;
  uint64_t v82;
  CFTypeID v83;
  uint64_t (*v84)(const void *, char *, CFTypeRef *);
  uint64_t v85;
  uint64_t v86;
  void *v87;
  CFTypeID v88;
  int64_t v89;
  const void *v90;
  uint64_t v91;
  uint64_t v92;
  CFTypeID v93;
  int v94;
  void *v95;
  CFTypeID v96;
  _QWORD *v97;
  const void *v98;
  void *v99;
  _xpc_connection_s *v100;
  void *v101;
  CFTypeID v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  CFDictionaryRef v106;
  uint64_t (*v107)(const void *, uint64_t, uint64_t, CFDictionaryRef, CFTypeRef *);
  CFTypeRef v108;
  const __CFString *v109;
  char *v110;
  char *v111;
  NSObject *v112;
  NSObject *v113;
  CFTypeRef v114;
  uint64_t v115;
  int v116;
  const void *v117;
  uint64_t v118;
  void *v119;
  CFTypeID v120;
  uint64_t v121;
  uint64_t (*v122)(const void *, char *, uint64_t, __int128 *);
  const void *v123;
  uint64_t v124;
  uint64_t v125;
  CFTypeID v126;
  const void *v127;
  void *v128;
  uint64_t v129;
  CFTypeID v130;
  uint64_t (*v131)(const void *, _QWORD, CFTypeRef *);
  void *v132;
  CFTypeID v133;
  uint64_t v134;
  uint64_t (*v135)(const void *, char *, uint64_t);
  const void *v136;
  uint64_t v137;
  uint64_t v138;
  CFTypeID v139;
  uint64_t (*v140)(const void *, char *);
  const void *v141;
  void *v142;
  CFTypeID v143;
  int64_t v144;
  uint64_t (*v145)(const void *, _QWORD, int64_t);
  void *v146;
  CFTypeID v147;
  uint64_t uint64;
  int64_t int64;
  uint64_t (*v150)(const void *, char *, uint64_t, CFTypeRef *, __int128 *, int64_t);
  uint64_t v151;
  uint64_t v152;
  const void *v153;
  uint64_t v154;
  void *v155;
  CFTypeID v156;
  uint64_t v157;
  uint64_t (*v158)(const void *, uint64_t, const __CFString *, _QWORD, char *);
  int v159;
  const __CFDictionary *v160;
  CFDictionaryRef v161;
  const void *v162;
  _xpc_connection_s *v163;
  uint64_t v164;
  void *v165;
  CFTypeID v166;
  uint64_t (*v167)(const void *, char *);
  CFTypeRef v168;
  const char *v169;
  const void *v170;
  uint64_t v171;
  CFTypeID v172;
  uint64_t v173;
  uint64_t (*v174)(uint64_t, const __CFString *, _QWORD, char *);
  const void *v175;
  uint64_t v176;
  void *v177;
  CFTypeID v178;
  int v179;
  const void *v180;
  uint64_t v181;
  uint64_t v182;
  CFTypeID v183;
  int CommonMetadataBinaryPListData;
  uint64_t (*v185)(const void *, _QWORD, _QWORD, CFTypeRef *);
  const __CFAllocator *v186;
  const void *v187;
  _xpc_connection_s *v188;
  uint64_t v189;
  CFTypeID v190;
  uint64_t FigBaseObject;
  uint64_t (*v192)(uint64_t, const __CFString *, _QWORD, char *);
  const void *v193;
  void *v194;
  CFTypeID v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  CFTypeID v199;
  uint64_t v200;
  uint64_t (*v201)(uint64_t);
  uint64_t v202;
  uint64_t v203;
  void *v204;
  CFTypeID v205;
  double v206;
  int64_t v207;
  uint64_t (*v208)(uint64_t, int64_t, float);
  float v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  CFTypeID v214;
  const void *SInt64;
  const void *v216;
  const void *v217;
  uint64_t (*v218)(uint64_t, const void *);
  const void *v219;
  uint64_t v220;
  void *v221;
  CFTypeID v222;
  uint64_t v223;
  uint64_t (*v224)(uint64_t, const __CFString *, _QWORD, CFTypeRef *);
  int v225;
  OpaqueCMClock *v226;
  int64_t v227;
  const void *v228;
  void *v229;
  void *v230;
  CFTypeID v231;
  int UniqueObjectIDForObjectAssociatedWithConnection;
  CFTypeID v233;
  uint64_t v234;
  const void *v235;
  void *v236;
  CFTypeID v237;
  double v238;
  uint64_t (*v239)(const void *, char *, float);
  float v240;
  const void *v241;
  void *v242;
  CFTypeID v243;
  double v244;
  uint64_t v245;
  uint64_t (*v246)(const void *, char *, CFTypeRef *, uint64_t, float);
  float v247;
  const void *v248;
  void *v249;
  CFTypeID v250;
  int v251;
  const void *v252;
  void *v253;
  CFTypeID v254;
  int v255;
  const void *HostTimeClock;
  uint64_t v257;
  const void *v258;
  uint64_t v259;
  CFTypeID v260;
  int v261;
  const void *v262;
  uint64_t v263;
  uint64_t v264;
  CFTypeID v265;
  const void *v266;
  uint64_t v267;
  CFTypeID v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  CFTypeID v272;
  double v273;
  uint64_t (*v274)(uint64_t, float);
  float v275;
  uint64_t v276;
  const void *v277;
  void *v278;
  CFTypeID v279;
  xpc_object_t array;
  size_t count;
  const __CFAllocator *v282;
  __CFArray *Mutable;
  size_t v284;
  int v285;
  uint64_t (*v286)(const void *, uint64_t, CFTypeRef *);
  uint64_t v287;
  CFDictionaryRef v288;
  int v289;
  uint64_t v290;
  CFDictionaryRef v291;
  uint64_t v292;
  uint64_t (*v293)(uint64_t, const __CFString *, CFDictionaryRef);
  uint64_t v294;
  uint64_t v295;
  CFTypeRef cf[2];
  __int128 v297;
  __int128 v298;
  uint64_t v299;
  __int128 v300;
  uint64_t v301;
  CFTypeRef v302[2];
  uint64_t v303;
  __int128 v304;
  uint64_t v305;
  void *value[2];
  uint64_t v307;
  CFDictionaryRef theDict[2];
  uint64_t v309;
  __int128 v310;
  uint64_t v311;
  char __str[16];
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  uint64_t v319;
  uint64_t v320;

  v320 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 80);
  if (v2 <= 1232303215)
  {
    if (v2 > 1231320433)
    {
      if (v2 > 1232300899)
      {
        if (v2 > 1232302696)
        {
          switch(v2)
          {
            case 1232302697:
              v30 = *(_QWORD *)(a1 + 48);
              v31 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
              v146 = *(void **)(a1 + 64);
              v32 = *(void **)(a1 + 72);
              *(_OWORD *)theDict = *MEMORY[0x1E0CA2E18];
              v309 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
              *(_OWORD *)value = *(_OWORD *)theDict;
              v307 = v309;
              v304 = *(_OWORD *)theDict;
              v305 = v309;
              if (!v31)
                goto LABEL_484;
              v147 = CFGetTypeID(v31);
              if (v147 != FigPlaybackItemGetTypeID() || !v146 || !v32)
                goto LABEL_484;
              CMTime = FigXPCMessageGetCMTime();
              if (CMTime)
                goto LABEL_385;
              uint64 = xpc_dictionary_get_uint64(v146, "TimeFlags");
              CMTime = FigXPCMessageGetCMTime();
              if (CMTime)
                goto LABEL_385;
              CMTime = FigXPCMessageGetCMTime();
              if (CMTime)
                goto LABEL_385;
              int64 = xpc_dictionary_get_int64(v146, "SeekID");
              *(_OWORD *)v302 = *(_OWORD *)theDict;
              v303 = v309;
              v300 = *(_OWORD *)value;
              v301 = v307;
              v298 = v304;
              v299 = v305;
              v150 = *(uint64_t (**)(const void *, char *, uint64_t, CFTypeRef *, __int128 *, int64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
              if (!v150)
                goto LABEL_386;
              *(_OWORD *)__str = *(_OWORD *)v302;
              *(_QWORD *)&v313 = v303;
              *(_OWORD *)cf = v300;
              *(_QWORD *)&v297 = v301;
              v310 = v298;
              v311 = v299;
              v38 = v150(v31, __str, uint64, cf, &v310, int64);
              break;
            case 1232303213:
              v30 = *(_QWORD *)(a1 + 48);
              v31 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
              v132 = *(void **)(a1 + 64);
              v32 = *(void **)(a1 + 72);
              *(_OWORD *)cf = *MEMORY[0x1E0CA2E18];
              *(_QWORD *)&v297 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
              if (!v31)
                goto LABEL_484;
              v133 = CFGetTypeID(v31);
              if (v133 != FigPlaybackItemGetTypeID() || !v132 || !v32)
                goto LABEL_484;
              CMTime = FigXPCMessageGetCMTime();
              if (CMTime)
                goto LABEL_385;
              v134 = xpc_dictionary_get_uint64(v132, "TimeFlags");
              v310 = *(_OWORD *)cf;
              v311 = v297;
              v135 = *(uint64_t (**)(const void *, char *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 24);
              if (!v135)
                goto LABEL_386;
              *(_OWORD *)__str = v310;
              *(_QWORD *)&v313 = v311;
              v38 = v135(v31, __str, v134);
              break;
            case 1232303215:
              v73 = *(_QWORD *)(a1 + 48);
              v74 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
              v76 = *(_QWORD *)(a1 + 64);
              v75 = *(void **)(a1 + 72);
              *(_OWORD *)cf = *MEMORY[0x1E0CA2E18];
              *(_QWORD *)&v297 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
              theDict[0] = 0;
              if (v74 && (v77 = CFGetTypeID(v74), v77 == FigPlaybackItemGetTypeID()) && v76 && v75)
              {
                v78 = FigXPCMessageGetCMTime();
                if (!v78)
                {
                  v78 = FigXPCMessageCopyCFDictionary();
                  if (!v78)
                  {
                    v310 = *(_OWORD *)cf;
                    v311 = v297;
                    v79 = *(uint64_t (**)(const void *, char *, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 176);
                    if (v79)
                    {
                      *(_OWORD *)__str = v310;
                      *(_QWORD *)&v313 = v311;
                      v29 = v79(v74, __str, theDict[0]);
                      if (!v29)
                        serverXPCItem_addTimeSyncUpdateToMessage(v74, v73, v75);
                    }
                    else
                    {
                      v29 = -12782;
                    }
LABEL_481:
                    v161 = theDict[0];
                    if (!theDict[0])
                      goto LABEL_483;
                    goto LABEL_482;
                  }
                }
              }
              else
              {
                v78 = FigSignalErrorAt();
              }
              v29 = v78;
              goto LABEL_481;
            default:
              goto LABEL_399;
          }
        }
        else
        {
          if (v2 == 1232300900)
          {
            v141 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            v142 = *(void **)(a1 + 64);
            *(_QWORD *)__str = 0;
            if (!v141)
              goto LABEL_484;
            v143 = CFGetTypeID(v141);
            if (v143 != FigPlaybackItemGetTypeID() || !v142)
              goto LABEL_484;
            CMTime = FigXPCMessageCopyCFDate();
            if (!CMTime)
            {
              v144 = xpc_dictionary_get_int64(v142, "SeekID");
              v145 = *(uint64_t (**)(const void *, _QWORD, int64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 128);
              if (!v145)
                goto LABEL_386;
              CMTime = v145(v141, *(_QWORD *)__str, v144);
            }
            goto LABEL_385;
          }
          if (v2 == 1232302195)
          {
            v123 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            v125 = *(_QWORD *)(a1 + 64);
            v124 = *(_QWORD *)(a1 + 72);
            LOBYTE(v304) = 0;
            *(_QWORD *)__str = 0;
            cf[0] = 0;
            *(_QWORD *)&v310 = 0;
            theDict[0] = 0;
            value[0] = 0;
            if (v123)
            {
              v126 = CFGetTypeID(v123);
              if (v126 == FigPlaybackItemGetTypeID())
              {
                if (v125)
                {
                  if (v124)
                  {
                    v94 = FigXPCMessageCopyCFDictionary();
                    if (v94)
                      goto LABEL_429;
                  }
                }
              }
            }
            goto LABEL_486;
          }
          if (v2 != 1232302695)
            goto LABEL_399;
          v30 = *(_QWORD *)(a1 + 48);
          v31 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v33 = *(void **)(a1 + 64);
          v32 = *(void **)(a1 + 72);
          *(_OWORD *)theDict = *MEMORY[0x1E0CA2E18];
          v309 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
          *(_OWORD *)value = *(_OWORD *)theDict;
          v307 = v309;
          v304 = *(_OWORD *)theDict;
          v305 = v309;
          if (!v31)
            goto LABEL_484;
          v34 = CFGetTypeID(v31);
          if (v34 != FigPlaybackItemGetTypeID() || !v33 || !v32)
            goto LABEL_484;
          CMTime = FigXPCMessageGetCMTime();
          if (CMTime)
            goto LABEL_385;
          v36 = xpc_dictionary_get_uint64(v33, "TimeFlags");
          CMTime = FigXPCMessageGetCMTime();
          if (CMTime)
            goto LABEL_385;
          CMTime = FigXPCMessageGetCMTime();
          if (CMTime)
            goto LABEL_385;
          *(_OWORD *)v302 = *(_OWORD *)theDict;
          v303 = v309;
          v300 = *(_OWORD *)value;
          v301 = v307;
          v298 = v304;
          v299 = v305;
          v37 = *(uint64_t (**)(const void *, char *, uint64_t, CFTypeRef *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 104);
          if (!v37)
            goto LABEL_386;
          *(_OWORD *)__str = *(_OWORD *)v302;
          *(_QWORD *)&v313 = v303;
          *(_OWORD *)cf = v300;
          *(_QWORD *)&v297 = v301;
          v310 = v298;
          v311 = v299;
          v38 = v37(v31, __str, v36, cf, &v310);
        }
        v29 = v38;
        if (!v38)
          serverXPCItem_addTimeSyncUpdateToMessage(v31, v30, v32);
        goto LABEL_483;
      }
      if (v2 <= 1232103782)
      {
        switch(v2)
        {
          case 1231320434:
            v136 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            v138 = *(_QWORD *)(a1 + 64);
            v137 = *(_QWORD *)(a1 + 72);
            *(_OWORD *)__str = *MEMORY[0x1E0CA2E18];
            *(_QWORD *)&v313 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
            if (!v136)
              goto LABEL_484;
            v139 = CFGetTypeID(v136);
            if (v139 != FigPlaybackItemGetTypeID() || !v138 || !v137)
              goto LABEL_484;
            v140 = *(uint64_t (**)(const void *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
            if (!v140)
              goto LABEL_386;
            CMTime = v140(v136, __str);
            if (!CMTime)
            {
              *(_OWORD *)cf = *(_OWORD *)__str;
              *(_QWORD *)&v297 = v313;
              goto LABEL_222;
            }
            break;
          case 1231515252:
            v117 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            v119 = *(void **)(a1 + 64);
            v118 = *(_QWORD *)(a1 + 72);
            *(_OWORD *)cf = *MEMORY[0x1E0CA2E18];
            *(_QWORD *)&v297 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
            v310 = *(_OWORD *)cf;
            v311 = v297;
            if (!v117)
              goto LABEL_484;
            v120 = CFGetTypeID(v117);
            if (v120 != FigPlaybackItemGetTypeID() || !v119 || !v118)
              goto LABEL_484;
            CMTime = FigXPCMessageGetCMTime();
            if (!CMTime)
            {
              v121 = xpc_dictionary_get_uint64(v119, "ThumbnailFlags");
              *(_OWORD *)theDict = *(_OWORD *)cf;
              v309 = v297;
              v122 = *(uint64_t (**)(const void *, char *, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 80);
              if (!v122)
                goto LABEL_386;
              *(_OWORD *)__str = *(_OWORD *)theDict;
              *(_QWORD *)&v313 = v309;
              CMTime = v122(v117, __str, v121, &v310);
              if (!CMTime)
              {
                *(_OWORD *)__str = v310;
                *(_QWORD *)&v313 = v311;
LABEL_222:
                CMTime = FigXPCMessageSetCMTime();
              }
            }
            break;
          case 1231647079:
            v10 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            v11 = kFigPlaybackItemProperty_ImageQueueGauge;
LABEL_230:
            CMTime = serverXPCItem_HandleCopyImageQueueGaugeMessage(v10, (uint64_t)*v11, *(_xpc_connection_s **)(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 72));
            break;
          default:
            goto LABEL_399;
        }
LABEL_385:
        v29 = CMTime;
        goto LABEL_483;
      }
      if (v2 == 1232103783)
      {
        v10 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v11 = kFigPlaybackItemProperty_PriorImageQueueGauge;
        goto LABEL_230;
      }
      if (v2 != 1232233593)
      {
        if (v2 != 1232298598)
          goto LABEL_399;
        v65 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v66 = *(void **)(a1 + 64);
        v67 = *(_QWORD *)(a1 + 72);
        *(_QWORD *)__str = 0;
        cf[0] = 0;
        *(_QWORD *)&v310 = 0;
        if (v65)
        {
          v68 = CFGetTypeID(v65);
          if (v68 == FigPlaybackItemGetTypeID() && v66 && v67)
          {
            v69 = FigXPCServerLookupAndRetainAssociatedObject();
            if (v69)
              goto LABEL_115;
            if (*((_QWORD *)cf[0] + 4))
            {
              v70 = xpc_dictionary_get_uint64(v66, "TrackID");
              v71 = xpc_dictionary_get_uint64(v66, "ExtractionID");
              v72 = *(uint64_t (**)(const void *, uint64_t, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 168);
              if (!v72)
              {
                v29 = -12782;
LABEL_425:
                v288 = *(CFDictionaryRef *)__str;
                if (!*(_QWORD *)__str)
                  goto LABEL_457;
                goto LABEL_456;
              }
              v69 = v72(v65, v70, v71, &v310);
              if (!v69)
                v69 = FigXPCMessageAddCMSampleBuffer();
LABEL_115:
              v29 = v69;
              goto LABEL_425;
            }
          }
        }
        v69 = FigSignalErrorAt();
        goto LABEL_115;
      }
      v127 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v129 = *(_QWORD *)(a1 + 64);
      v128 = *(void **)(a1 + 72);
      *(_QWORD *)__str = 0;
      LOBYTE(cf[0]) = 0;
      if (!v127)
        goto LABEL_485;
      v130 = CFGetTypeID(v127);
      if (v130 != FigPlaybackItemGetTypeID() || !v129 || !v128)
        goto LABEL_485;
      IDByAssociatingWithClientConnection = FigXPCMessageCopyCFArray();
      if (IDByAssociatingWithClientConnection)
        goto LABEL_405;
      v131 = *(uint64_t (**)(const void *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 48);
      if (!v131)
        goto LABEL_406;
      IDByAssociatingWithClientConnection = v131(v127, *(_QWORD *)__str, cf);
      if (IDByAssociatingWithClientConnection)
        goto LABEL_405;
      xpc_dictionary_set_BOOL(v128, "AlreadyReady", LOBYTE(cf[0]) != 0);
LABEL_449:
      v29 = 0;
      goto LABEL_450;
    }
    if (v2 > 1231250284)
    {
      if (v2 > 1231253604)
      {
        if (v2 != 1231253605)
        {
          if (v2 == 1231254640)
          {
            v175 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            v177 = *(void **)(a1 + 64);
            v176 = *(_QWORD *)(a1 + 72);
            *(_QWORD *)__str = 0;
            cf[0] = 0;
            if (v175)
            {
              v178 = CFGetTypeID(v175);
              if (v178 == FigPlaybackItemGetTypeID())
              {
                if (v177)
                {
                  if (v176)
                  {
                    xpc_dictionary_get_uint64(v177, "TrackID");
                    v179 = FigXPCMessageCopyCFString();
                    if (v179)
                      goto LABEL_459;
                  }
                }
              }
            }
            goto LABEL_505;
          }
          if (v2 != 1231317357)
            goto LABEL_399;
          v80 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v82 = *(_QWORD *)(a1 + 64);
          v81 = *(void **)(a1 + 72);
          *(_DWORD *)__str = 0;
          LODWORD(cf[0]) = 0;
          if (!v80)
            goto LABEL_484;
          v83 = CFGetTypeID(v80);
          if (v83 != FigPlaybackItemGetTypeID() || !v82 || !v81)
            goto LABEL_484;
          v84 = *(uint64_t (**)(const void *, char *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                            + 8);
          if (!v84)
            goto LABEL_386;
          v29 = v84(v80, __str, cf);
          if (!v29)
          {
            xpc_dictionary_set_double(v81, "Width", *(float *)__str);
            xpc_dictionary_set_double(v81, "Height", *(float *)cf);
          }
          goto LABEL_483;
        }
        v187 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v188 = *(_xpc_connection_s **)(a1 + 56);
        v189 = *(_QWORD *)(a1 + 64);
        v165 = *(void **)(a1 + 72);
        *(_QWORD *)__str = 0;
        cf[0] = 0;
        if (!v187)
          goto LABEL_485;
        v190 = CFGetTypeID(v187);
        if (v190 != FigPlaybackItemGetTypeID() || !v189 || !v165)
          goto LABEL_485;
        FigBaseObject = FigPlaybackItemGetFigBaseObject(v187);
        v192 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
        if (!v192)
          goto LABEL_406;
        IDByAssociatingWithClientConnection = v192(FigBaseObject, CFSTR("CPEProtector"), *MEMORY[0x1E0C9AE00], __str);
        if (IDByAssociatingWithClientConnection)
          goto LABEL_405;
        IDByAssociatingWithClientConnection = FigXPCCPEProtectorServerAssociateCopiedNeighborCPEProtector(v188);
        if (IDByAssociatingWithClientConnection)
          goto LABEL_405;
        v169 = (const char *)*MEMORY[0x1E0CA36A0];
        v168 = cf[0];
      }
      else
      {
        if (v2 == 1231250285)
        {
          v180 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v182 = *(_QWORD *)(a1 + 64);
          v181 = *(_QWORD *)(a1 + 72);
          *(_QWORD *)__str = 0;
          cf[0] = 0;
          *(_QWORD *)&v310 = 0;
          if (v180 && (v183 = CFGetTypeID(v180), v183 == FigPlaybackItemGetTypeID()) && v182 && v181)
          {
            CommonMetadataBinaryPListData = FigXPCMessageCopyCFArray();
            if (!CommonMetadataBinaryPListData)
            {
              v185 = *(uint64_t (**)(const void *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                         + 64);
              if (!v185)
              {
                v29 = -12782;
                goto LABEL_430;
              }
              v186 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
              CommonMetadataBinaryPListData = v185(v180, *(_QWORD *)__str, *MEMORY[0x1E0C9AE00], cf);
              if (!CommonMetadataBinaryPListData)
              {
                CommonMetadataBinaryPListData = FigRemote_CreateCommonMetadataBinaryPListData((const __CFDictionary *)cf[0], v186, (uint64_t)&v310);
                if (!CommonMetadataBinaryPListData)
                  CommonMetadataBinaryPListData = FigXPCMessageSetCFData();
              }
            }
          }
          else
          {
            CommonMetadataBinaryPListData = FigSignalErrorAt();
          }
          v29 = CommonMetadataBinaryPListData;
          goto LABEL_430;
        }
        if (v2 != 1231250804)
        {
          if (v2 != 1231251058)
            goto LABEL_399;
          v21 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v22 = *(_xpc_connection_s **)(a1 + 56);
          v23 = *(_QWORD *)(a1 + 64);
          v24 = *(void **)(a1 + 72);
          *(_QWORD *)__str = 0;
          cf[0] = 0;
          if (!v21)
            goto LABEL_485;
          v25 = CFGetTypeID(v21);
          if (v25 != FigPlaybackItemGetTypeID() || !v23 || !v24)
            goto LABEL_485;
          v26 = *(uint64_t (**)(const void *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
          if (v26)
          {
            IDByAssociatingWithClientConnection = v26(v21, __str);
            if (!IDByAssociatingWithClientConnection)
            {
              if (FigRemote_ShouldConnectToMediaparserdForFileParsing()
                && FigFormatReaderIsRemote(*(_BOOL8 *)__str))
              {
                v27 = *(_QWORD *)__str;
                pid = xpc_connection_get_pid(v22);
                v29 = FigFormatReaderXPCRemoteObtainObjectIDForOtherProcess(v27, pid, (uint64_t *)cf);
              }
              else
              {
                IDByAssociatingWithClientConnection = FigXPCFormatReaderServerAssociateCopiedNeighborFormatReader(v22, *(uint64_t *)__str);
                if (IDByAssociatingWithClientConnection)
                  goto LABEL_405;
                v29 = 0;
              }
              xpc_dictionary_set_uint64(v24, "FormatReaderObjectID", (uint64_t)cf[0]);
              goto LABEL_450;
            }
LABEL_405:
            v29 = IDByAssociatingWithClientConnection;
            goto LABEL_450;
          }
          goto LABEL_406;
        }
        v170 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v171 = *(_QWORD *)(a1 + 64);
        v165 = *(void **)(a1 + 72);
        *(_QWORD *)__str = 0;
        cf[0] = 0;
        if (!v170)
          goto LABEL_485;
        v172 = CFGetTypeID(v170);
        if (v172 != FigPlaybackItemGetTypeID() || !v171 || !v165)
          goto LABEL_485;
        v173 = FigPlaybackItemGetFigBaseObject(v170);
        v174 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
        if (!v174)
          goto LABEL_406;
        IDByAssociatingWithClientConnection = v174(v173, CFSTR("MetricEventTimeline"), *MEMORY[0x1E0C9AE00], __str);
        if (IDByAssociatingWithClientConnection)
          goto LABEL_405;
        if (*(_QWORD *)__str)
        {
          IDByAssociatingWithClientConnection = FigMetricEventTimelineGetIDByAssociatingWithClientConnection();
          if (IDByAssociatingWithClientConnection)
            goto LABEL_405;
          v168 = cf[0];
        }
        else
        {
          v168 = 0;
        }
        v169 = (const char *)*MEMORY[0x1E0CA36A0];
      }
      goto LABEL_448;
    }
    if (v2 > 1230268003)
    {
      if (v2 == 1230268004)
      {
        v153 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v155 = *(void **)(a1 + 64);
        v154 = *(_QWORD *)(a1 + 72);
        *(_QWORD *)__str = 0;
        if (!v153)
          goto LABEL_484;
        v156 = CFGetTypeID(v153);
        if (v156 != FigPlaybackItemGetTypeID() || !v155 || !v154)
          goto LABEL_484;
        v157 = xpc_dictionary_get_uint64(v155, "TrackID");
        v158 = *(uint64_t (**)(const void *, uint64_t, const __CFString *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
        if (!v158)
          goto LABEL_386;
        v159 = v158(v153, v157, CFSTR("FormatDescriptionArray"), *MEMORY[0x1E0C9AE00], __str);
        v160 = *(const __CFDictionary **)__str;
        if (v159)
        {
          v29 = v159;
          if (!*(_QWORD *)__str)
            goto LABEL_483;
        }
        else
        {
          v29 = FigXPCMessageSetFormatDescriptionArray();
          v160 = *(const __CFDictionary **)__str;
          if (!*(_QWORD *)__str)
            goto LABEL_483;
        }
        v161 = v160;
        goto LABEL_482;
      }
      if (v2 == 1231249779)
      {
        v162 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v163 = *(_xpc_connection_s **)(a1 + 56);
        v164 = *(_QWORD *)(a1 + 64);
        v165 = *(void **)(a1 + 72);
        *(_QWORD *)__str = 0;
        cf[0] = 0;
        if (!v162)
          goto LABEL_485;
        v166 = CFGetTypeID(v162);
        if (v166 != FigPlaybackItemGetTypeID() || !v164 || !v165)
          goto LABEL_485;
        v167 = *(uint64_t (**)(const void *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
        if (!v167)
          goto LABEL_406;
        IDByAssociatingWithClientConnection = v167(v162, __str);
        if (IDByAssociatingWithClientConnection)
          goto LABEL_405;
        IDByAssociatingWithClientConnection = FigXPCAssetServerAssociateCopiedNeighborAsset(v163);
        if (IDByAssociatingWithClientConnection)
          goto LABEL_405;
        v168 = cf[0];
        v169 = "AssetObjectID";
LABEL_448:
        xpc_dictionary_set_uint64(v165, v169, (uint64_t)v168);
        goto LABEL_449;
      }
      if (v2 != 1231250281)
        goto LABEL_399;
      v55 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v57 = *(void **)(a1 + 64);
      v56 = *(_QWORD *)(a1 + 72);
      *(_QWORD *)__str = 0;
      cf[0] = 0;
      if (v55 && (v58 = CFGetTypeID(v55), v58 == FigPlaybackItemGetTypeID()) && v57 && v56)
      {
        v59 = xpc_dictionary_get_int64(v57, "ChapterImageID");
        v60 = xpc_dictionary_get_BOOL(v57, "WantChapterImageFormatDesc");
        v61 = *(uint64_t (**)(const void *, int64_t, char *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 72);
        if (!v61)
        {
          v29 = -12782;
          goto LABEL_408;
        }
        if (v60)
          v62 = cf;
        else
          v62 = 0;
        v63 = v61(v55, v59, __str, v62);
        if (!v63)
        {
          v29 = FigXPCMessageSetCFData();
          v64 = cf[0];
          if (v29 || !cf[0])
          {
LABEL_409:
            if (v64)
              CFRelease(v64);
            goto LABEL_450;
          }
          v63 = FigXPCMessageSetFormatDescription();
        }
      }
      else
      {
        v63 = FigSignalErrorAt();
      }
      v29 = v63;
LABEL_408:
      v64 = cf[0];
      goto LABEL_409;
    }
    if (v2 == 778268793)
    {
      v151 = *(_QWORD *)(a1 + 64);
      v152 = *(_QWORD *)(a1 + 72);
      *(_QWORD *)&v310 = 0;
      theDict[0] = 0;
      if (v151)
      {
        if (v152)
        {
          v116 = FigXPCMessageCopyCFString();
          if (v116)
            goto LABEL_479;
        }
      }
    }
    else
    {
      if (v2 != 779314548)
        goto LABEL_399;
      v115 = *(_QWORD *)(a1 + 64);
      *(_QWORD *)&v310 = 0;
      theDict[0] = 0;
      if (v115)
      {
        v116 = FigXPCMessageCopyCFString();
        if (v116)
          goto LABEL_479;
      }
    }
    v116 = FigSignalErrorAt();
LABEL_479:
    v29 = v116;
    goto LABEL_481;
  }
  if (v2 > 1349676907)
  {
    if (v2 <= 1349743205)
    {
      if (v2 <= 1349739370)
      {
        if (v2 == 1349676908)
        {
          v202 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v203 = *(_QWORD *)(v202 + 24);
          if (v203)
          {
            v204 = *(void **)(a1 + 64);
            v205 = CFGetTypeID(*(CFTypeRef *)(v202 + 24));
            if (v205 == FigPlayerGetTypeID())
            {
              if (v204)
              {
                v206 = xpc_dictionary_get_double(v204, "Rate");
                v207 = xpc_dictionary_get_int64(v204, "PrerollID");
                v208 = *(uint64_t (**)(uint64_t, int64_t, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 64);
                if (v208)
                {
                  v209 = v206;
                  CMTime = v208(v203, v207, v209);
                  goto LABEL_385;
                }
                goto LABEL_386;
              }
            }
          }
LABEL_484:
          CMTime = FigSignalErrorAt();
          goto LABEL_385;
        }
        if (v2 != 1349677940)
        {
          if (v2 == 1349739361)
          {
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v13 = *(_QWORD *)(v12 + 24);
            if (!v13)
              goto LABEL_484;
            v14 = *(void **)(a1 + 64);
            v15 = CFGetTypeID(*(CFTypeRef *)(v12 + 24));
            if (v15 != FigPlayerGetTypeID() || !v14)
              goto LABEL_484;
            v16 = xpc_dictionary_get_BOOL(v14, "Active");
            v17 = *(_QWORD *)(CMBaseObjectGetVTable() + 24);
            if (!v17)
              goto LABEL_386;
            v18 = *(uint64_t (**)(uint64_t, int64_t))(v17 + 24);
            if (!v18)
              goto LABEL_386;
            v19 = v13;
            v20 = v16;
LABEL_146:
            CMTime = v18(v19, v20);
            goto LABEL_385;
          }
LABEL_399:
          v29 = -16158;
          goto LABEL_483;
        }
        v210 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v211 = *(_QWORD *)(v210 + 24);
        if (!v211)
          goto LABEL_484;
        v212 = *(_QWORD *)(a1 + 48);
        v213 = *(void **)(a1 + 64);
        v214 = CFGetTypeID(*(CFTypeRef *)(v210 + 24));
        if (v214 != FigPlayerGetTypeID() || !v213)
          goto LABEL_484;
        xpc_dictionary_get_int64(v213, "ExternalStartupTaskID");
        SInt64 = (const void *)FigCFNumberCreateSInt64();
        MEMORY[0x19402EEEC](*(_QWORD *)(v212 + 56));
        v216 = CFDictionaryGetValue(*(CFDictionaryRef *)(v212 + 64), SInt64);
        if (v216)
        {
          v217 = v216;
          CFRetain(v216);
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v212 + 64), SInt64);
          MEMORY[0x19402EF04](*(_QWORD *)(v212 + 56));
          v218 = *(uint64_t (**)(uint64_t, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
          if (v218)
            v29 = v218(v211, v217);
          else
            v29 = -12782;
          CFRelease(v217);
          if (!SInt64)
            goto LABEL_483;
        }
        else
        {
          v29 = FigSignalErrorAt();
          MEMORY[0x19402EF04](*(_QWORD *)(v212 + 56));
          if (!SInt64)
            goto LABEL_483;
        }
        v161 = (CFDictionaryRef)SInt64;
        goto LABEL_482;
      }
      if (v2 != 1349739371)
      {
        if (v2 != 1349739381)
        {
          if (v2 != 1349742707)
            goto LABEL_399;
          v90 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v91 = *(_QWORD *)(a1 + 64);
          v92 = *(_QWORD *)(a1 + 72);
          LOBYTE(v304) = 0;
          *(_QWORD *)__str = 0;
          cf[0] = 0;
          *(_QWORD *)&v310 = 0;
          theDict[0] = 0;
          value[0] = 0;
          if (v90)
          {
            v93 = CFGetTypeID(v90);
            if (v93 == FigPlayerGetTypeID())
            {
              if (v91)
              {
                if (v92)
                {
                  v94 = FigXPCMessageCopyCFDictionary();
                  if (v94)
                    goto LABEL_429;
                }
              }
            }
          }
LABEL_486:
          v94 = FigSignalErrorAt();
LABEL_429:
          v29 = v94;
LABEL_430:
          if (*(_QWORD *)__str)
            CFRelease(*(CFTypeRef *)__str);
LABEL_455:
          v288 = (CFDictionaryRef)cf[0];
          if (!cf[0])
            goto LABEL_457;
          goto LABEL_456;
        }
        v257 = *(_QWORD *)(a1 + 48);
        v258 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v259 = *(_QWORD *)(a1 + 64);
        *(_QWORD *)__str = 0;
        cf[0] = 0;
        if (v258 && (v260 = CFGetTypeID(v258), v260 == FigPlayerGetTypeID()) && v259)
        {
          v261 = FigXPCMessageCopyCFURL();
          if (!v261)
          {
            v261 = FigXPCMessageCopySandboxRegistration();
            if (!v261)
              v261 = serverXPCPlayer_handlePlayerSetProperty(v258, v257, CFSTR("NetworkCacheURL"), (uint64_t)cf[0]);
          }
        }
        else
        {
          v261 = FigSignalErrorAt();
        }
        v29 = v261;
LABEL_450:
        v161 = *(CFDictionaryRef *)__str;
        if (!*(_QWORD *)__str)
          goto LABEL_483;
        goto LABEL_482;
      }
      v252 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v253 = *(void **)(a1 + 64);
      *(_QWORD *)&v310 = 0;
      theDict[0] = 0;
      if (v252)
      {
        v254 = CFGetTypeID(v252);
        if (v254 == FigPlayerGetTypeID())
        {
          if (v253)
          {
            v255 = xpc_dictionary_get_int64(v253, "MasterClockType");
            if (v255 == 3)
            {
              v289 = FigXPCMessageCopyCFObject();
              if (v289)
                goto LABEL_442;
              *(_OWORD *)__str = 0u;
              v313 = 0u;
              xpc_connection_get_audit_token();
              v290 = *MEMORY[0x1E0C9AE00];
              *(_OWORD *)cf = 0u;
              v297 = 0u;
              v29 = FigAudioSessionClockCreateFromClockConfigurationAndAuditToken(v290, v310, cf, theDict);
              if (v29)
                goto LABEL_444;
LABEL_440:
              v291 = theDict[0];
              v292 = FigPlayerGetFigBaseObject(v252);
              v293 = *(uint64_t (**)(uint64_t, const __CFString *, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 56);
              if (!v293)
              {
                v29 = -12782;
LABEL_444:
                v288 = theDict[0];
                if (!theDict[0])
                {
LABEL_457:
                  v161 = (CFDictionaryRef)v310;
                  if (!(_QWORD)v310)
                    goto LABEL_483;
                  goto LABEL_482;
                }
LABEL_456:
                CFRelease(v288);
                goto LABEL_457;
              }
              v289 = v293(v292, CFSTR("MasterClock"), v291);
LABEL_442:
              v29 = v289;
              goto LABEL_444;
            }
            if (v255 != 2)
            {
              if (v255 == 1)
              {
                HostTimeClock = CMClockGetHostTimeClock();
                if (HostTimeClock)
                  HostTimeClock = CFRetain(HostTimeClock);
                theDict[0] = (CFDictionaryRef)HostTimeClock;
              }
              else
              {
                theDict[0] = 0;
              }
              goto LABEL_440;
            }
            if (xpc_dictionary_get_uint64(v253, "MasterClockObjectID"))
            {
              v289 = FigXPCAudioDeviceClockServerCopyClockForID();
              if (v289)
                goto LABEL_442;
              goto LABEL_440;
            }
          }
        }
      }
      v289 = FigSignalErrorAt();
      goto LABEL_442;
    }
    if (v2 <= 1349743219)
    {
      if (v2 == 1349743206)
      {
        v235 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v236 = *(void **)(a1 + 64);
        *(_OWORD *)cf = *MEMORY[0x1E0CA2E18];
        *(_QWORD *)&v297 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        if (v235)
        {
          v237 = CFGetTypeID(v235);
          if (v237 == FigPlayerGetTypeID())
          {
            if (v236)
            {
              v238 = xpc_dictionary_get_double(v236, "Rate");
              CMTime = FigXPCMessageGetCMTime();
              if (CMTime)
                goto LABEL_385;
              v310 = *(_OWORD *)cf;
              v311 = v297;
              v239 = *(uint64_t (**)(const void *, char *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 56);
              if (v239)
              {
                v240 = v238;
                *(_OWORD *)__str = v310;
                *(_QWORD *)&v313 = v311;
                CMTime = v239(v235, __str, v240);
                goto LABEL_385;
              }
              goto LABEL_386;
            }
          }
        }
        goto LABEL_484;
      }
      if (v2 == 1349743211)
      {
        v241 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v242 = *(void **)(a1 + 64);
        v310 = *MEMORY[0x1E0CA2E18];
        v311 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        *(_OWORD *)theDict = v310;
        v309 = v311;
        if (v241)
        {
          v243 = CFGetTypeID(v241);
          if (v243 == FigPlayerGetTypeID())
          {
            if (v242)
            {
              v244 = xpc_dictionary_get_double(v242, "Rate");
              CMTime = FigXPCMessageGetCMTime();
              if (CMTime)
                goto LABEL_385;
              CMTime = FigXPCMessageGetCMTime();
              if (CMTime)
                goto LABEL_385;
              v245 = xpc_dictionary_get_uint64(v242, "Flags");
              *(_OWORD *)value = v310;
              v307 = v311;
              v304 = *(_OWORD *)theDict;
              v305 = v309;
              v246 = *(uint64_t (**)(const void *, char *, CFTypeRef *, uint64_t, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 88);
              if (v246)
              {
                v247 = v244;
                *(_OWORD *)__str = *(_OWORD *)value;
                *(_QWORD *)&v313 = v307;
                *(_OWORD *)cf = v304;
                *(_QWORD *)&v297 = v305;
                CMTime = v246(v241, __str, cf, v245, v247);
                goto LABEL_385;
              }
              goto LABEL_386;
            }
          }
        }
        goto LABEL_484;
      }
      if (v2 != 1349743215)
        goto LABEL_399;
      v49 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v50 = *(void **)(a1 + 64);
      *(_QWORD *)__str = 0;
      if (!v49)
        goto LABEL_485;
      v51 = CFGetTypeID(v49);
      if (v51 != FigPlayerGetTypeID() || !v50)
        goto LABEL_485;
      v52 = xpc_dictionary_get_double(v50, "Rate");
      IDByAssociatingWithClientConnection = FigXPCMessageCopyCFDictionary();
      if (IDByAssociatingWithClientConnection)
        goto LABEL_405;
      v53 = *(uint64_t (**)(const void *, _QWORD, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
      if (v53)
      {
        v54 = v52;
        IDByAssociatingWithClientConnection = v53(v49, *(_QWORD *)__str, v54);
        goto LABEL_405;
      }
      goto LABEL_406;
    }
    if (v2 == 1349743220)
    {
      v269 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v270 = *(_QWORD *)(v269 + 24);
      if (v270)
      {
        v271 = *(void **)(a1 + 64);
        v272 = CFGetTypeID(*(CFTypeRef *)(v269 + 24));
        if (v272 == FigPlayerGetTypeID())
        {
          if (v271)
          {
            v273 = xpc_dictionary_get_double(v271, "Rate");
            v274 = *(uint64_t (**)(uint64_t, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
            if (v274)
            {
              v275 = v273;
              CMTime = v274(v270, v275);
              goto LABEL_385;
            }
            goto LABEL_386;
          }
        }
      }
      goto LABEL_484;
    }
    if (v2 == 1349744225)
    {
      v276 = *(_QWORD *)(a1 + 48);
      v277 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v278 = *(void **)(a1 + 64);
      *(_QWORD *)__str = 0;
      if (v277 && (v279 = CFGetTypeID(v277), v279 == FigPlayerGetTypeID()) && v278)
      {
        array = xpc_dictionary_get_array(v278, "VideoTargetIDArray");
        count = xpc_array_get_count(array);
        v282 = CFGetAllocator(v277);
        Mutable = CFArrayCreateMutable(v282, count, MEMORY[0x1E0C9B378]);
        if (Mutable)
        {
          if (count)
          {
            v284 = 0;
            while (1)
            {
              xpc_array_get_uint64(array, v284);
              v285 = FigXPCVideoTargetServerCopyVideoTargetForID();
              if (v285)
                break;
              CFArrayAppendValue(Mutable, *(const void **)__str);
              if (count == ++v284)
                goto LABEL_395;
            }
          }
          else
          {
LABEL_395:
            v285 = serverXPCPlayer_handlePlayerSetProperty(v277, v276, CFSTR("VideoTargetArray"), (uint64_t)Mutable);
          }
        }
        else
        {
          v285 = FigSignalErrorAt();
        }
        v29 = v285;
      }
      else
      {
        v29 = FigSignalErrorAt();
        Mutable = 0;
      }
      if (!Mutable)
        goto LABEL_483;
      v161 = Mutable;
LABEL_482:
      CFRelease(v161);
      goto LABEL_483;
    }
    if (v2 != 1668429889)
      goto LABEL_399;
    v97 = *(_QWORD **)(a1 + 48);
    v98 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v100 = *(_xpc_connection_s **)(a1 + 56);
    v99 = *(void **)(a1 + 64);
    v101 = *(void **)(a1 + 72);
    cf[0] = 0;
    *(_QWORD *)&v310 = 0;
    theDict[0] = 0;
    value[0] = 0;
    if (v98 && (v102 = CFGetTypeID(v98), v102 == FigPlayerGetTypeID()) && v99 && v101)
    {
      xpc_dictionary_get_uint64(v99, "AssetObjectID");
      v103 = xpc_dictionary_get_uint64(v99, "ItemCreateFlags");
      v104 = FigXPCMessageCopyCFDictionary();
      if (!v104)
      {
        v104 = FigXPCAssetServerCopyAssetForID();
        if (!v104)
        {
          v105 = v310;
          v106 = theDict[0];
          v107 = *(uint64_t (**)(const void *, uint64_t, uint64_t, CFDictionaryRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
          if (!v107)
          {
            v29 = -12782;
LABEL_465:
            if ((_QWORD)v310)
              CFRelease((CFTypeRef)v310);
            if (cf[0])
              CFRelease(cf[0]);
            goto LABEL_481;
          }
          v104 = v107(v98, v105, v103, v106, cf);
          if (!v104)
          {
            v108 = cf[0];
            v109 = (const __CFString *)value[0];
            v315 = 0u;
            v316 = 0u;
            v313 = 0u;
            v314 = 0u;
            *(_OWORD *)__str = 0u;
            v110 = (char *)malloc_type_calloc(1uLL, 0x68uLL, 0x10200404BD2C637uLL);
            v111 = v110;
            if (!v110)
              goto LABEL_516;
            v110[88] = 0;
            if (v109)
              CFStringGetCString(v109, v110 + 88, 10, 0x600u);
            v112 = v97[2];
            *((_QWORD *)v111 + 10) = v112;
            dispatch_retain(v112);
            *((_QWORD *)v111 + 1) = *v97;
            v113 = v97[3];
            *((_QWORD *)v111 + 7) = v113;
            dispatch_retain(v113);
            v114 = v108 ? CFRetain(v108) : 0;
            *((_QWORD *)v111 + 8) = v114;
            snprintf(__str, 0x50uLL, "com.apple.coremedia.playerserver.timebasesync.%s", v111 + 88);
            v294 = FigDispatchQueueCreateWithPriority();
            *((_QWORD *)v111 + 6) = v294;
            if (!v294 || (v295 = FigSimpleMutexCreate(), (*((_QWORD *)v111 + 5) = v295) == 0))
            {
LABEL_516:
              v29 = FigSignalErrorAt();
              DisposeServedItemState(v111);
              v111 = 0;
              if (v29)
                goto LABEL_511;
            }
            *((_DWORD *)v111 + 4) = xpc_connection_get_pid(v100);
            *((_QWORD *)v111 + 9) = FigCFWeakReferenceHolderCreateWithReferencedObject();
            v29 = FigXPCServerAssociateObjectWithConnection();
            if (!v29)
              xpc_dictionary_set_uint64(v101, "ItemObjectID", *(_QWORD *)v111);
            else
LABEL_511:
              DisposeServedItemState(v111);
            goto LABEL_465;
          }
        }
      }
    }
    else
    {
      v104 = FigSignalErrorAt();
    }
    v29 = v104;
    goto LABEL_465;
  }
  if (v2 > 1348694114)
  {
    if (v2 <= 1349349936)
    {
      if (v2 != 1348694115)
      {
        if (v2 != 1348694121)
        {
          if (v2 != 1349087091)
            goto LABEL_399;
          v39 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v41 = *(_QWORD *)(a1 + 64);
          v40 = *(void **)(a1 + 72);
          *(_QWORD *)__str = 0;
          if (v39 && (v42 = CFGetTypeID(v39), v42 == FigPlayerGetTypeID()) && v41 && v40)
          {
            v43 = FigPlayerGetFigBaseObject(v39);
            v44 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
            if (v44)
            {
              v29 = v44(v43, CFSTR("CurrentlyDisplayedCVPixelBuffer"), *MEMORY[0x1E0C9AE00], __str);
              v45 = *(const void **)__str;
              if (v29)
                v46 = 1;
              else
                v46 = *(_QWORD *)__str == 0;
              if (v46)
              {
                if (!*(_QWORD *)__str)
                  goto LABEL_472;
                goto LABEL_471;
              }
              IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)__str);
              if (IOSurface)
              {
                XPCObject = IOSurfaceCreateXPCObject(IOSurface);
                xpc_dictionary_set_value(v40, "CurrentlyDisplayedIOSurface", XPCObject);
              }
              v29 = 0;
            }
            else
            {
              v29 = -12782;
            }
          }
          else
          {
            v29 = FigSignalErrorAt();
          }
          v45 = *(const void **)__str;
          if (!*(_QWORD *)__str)
          {
LABEL_472:
            FigXPCRelease();
            goto LABEL_483;
          }
LABEL_471:
          CFRelease(v45);
          goto LABEL_472;
        }
        v228 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v229 = *(void **)(a1 + 64);
        v230 = *(void **)(a1 + 72);
        *(_QWORD *)__str = 0;
        cf[0] = 0;
        *(_QWORD *)&v310 = 0;
        if (v228)
        {
          v231 = CFGetTypeID(v228);
          if (v231 == FigPlayerGetTypeID() && v229 && v230)
          {
            if (!xpc_dictionary_get_uint64(v229, "AfterItemObjectID"))
            {
              v234 = 0;
LABEL_416:
              v286 = *(uint64_t (**)(const void *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 32);
              if (!v286)
              {
                v29 = -12782;
                goto LABEL_455;
              }
              UniqueObjectIDForObjectAssociatedWithConnection = v286(v228, v234, cf);
              if (!UniqueObjectIDForObjectAssociatedWithConnection)
              {
                if (!cf[0])
                {
                  v287 = 0;
                  goto LABEL_454;
                }
                UniqueObjectIDForObjectAssociatedWithConnection = FigXPCServerFindUniqueObjectIDForObjectAssociatedWithConnection();
                if (!UniqueObjectIDForObjectAssociatedWithConnection)
                {
                  v287 = *(_QWORD *)__str;
LABEL_454:
                  xpc_dictionary_set_uint64(v230, "ItemObjectID", v287);
                  v29 = 0;
                  goto LABEL_455;
                }
              }
              goto LABEL_492;
            }
            UniqueObjectIDForObjectAssociatedWithConnection = FigXPCServerLookupAndRetainAssociatedObject();
            if (UniqueObjectIDForObjectAssociatedWithConnection)
            {
LABEL_492:
              v29 = UniqueObjectIDForObjectAssociatedWithConnection;
              goto LABEL_455;
            }
            v233 = CFGetTypeID((CFTypeRef)v310);
            if (v233 == FigPlaybackItemGetTypeID())
            {
              v234 = v310;
              goto LABEL_416;
            }
          }
        }
        UniqueObjectIDForObjectAssociatedWithConnection = FigSignalErrorAt();
        goto LABEL_492;
      }
      v219 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v220 = *(_QWORD *)(a1 + 64);
      v221 = *(void **)(a1 + 72);
      *(_QWORD *)__str = 0;
      cf[0] = 0;
      if (v219)
      {
        v222 = CFGetTypeID(v219);
        if (v222 == FigPlayerGetTypeID() && v220 && v221)
        {
          v223 = FigPlayerGetFigBaseObject(v219);
          v224 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 48);
          if (!v224)
          {
            v29 = -12782;
            goto LABEL_475;
          }
          v225 = v224(v223, CFSTR("MasterClock"), *MEMORY[0x1E0C9AE00], cf);
          if (v225)
            goto LABEL_501;
          v226 = (OpaqueCMClock *)cf[0];
          if (cf[0])
          {
            if (v226 != CMClockGetHostTimeClock())
            {
              v225 = FigXPCAudioDeviceClockServerAssociateCopiedNeighborClock();
              if (!v225)
              {
                if (*(_QWORD *)__str)
                  xpc_dictionary_set_uint64(v221, "MasterClockObjectID", *(uint64_t *)__str);
                v227 = 2;
                goto LABEL_474;
              }
LABEL_501:
              v29 = v225;
LABEL_475:
              v161 = (CFDictionaryRef)cf[0];
              if (!cf[0])
                goto LABEL_483;
              goto LABEL_482;
            }
            v227 = 1;
          }
          else
          {
            v227 = 0;
          }
LABEL_474:
          xpc_dictionary_set_int64(v221, "MasterClockType", v227);
          v29 = 0;
          goto LABEL_475;
        }
      }
      v225 = FigSignalErrorAt();
      goto LABEL_501;
    }
    if (v2 == 1349349937)
    {
      v262 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v262)
      {
        v264 = *(_QWORD *)(a1 + 64);
        v263 = *(_QWORD *)(a1 + 72);
        v265 = CFGetTypeID(v262);
        if (v265 == FigPlayerGetTypeID() && v264 && v263)
        {
          CMTime = FigMemoryOriginBeginEstablishingMemoryRecipientByFillingInXPCMessage1();
          goto LABEL_385;
        }
      }
      goto LABEL_484;
    }
    if (v2 == 1349349938)
    {
      v266 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v266)
      {
        v267 = *(_QWORD *)(a1 + 64);
        v268 = CFGetTypeID(v266);
        if (v268 == FigPlayerGetTypeID())
        {
          if (v267)
          {
            CMTime = FigMemoryOriginCompleteEstablishingMemoryRecipientUsingXPCMessage2();
            goto LABEL_385;
          }
        }
      }
      goto LABEL_484;
    }
    if (v2 != 1349674349)
      goto LABEL_399;
    v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v95 = *(void **)(a1 + 64);
    *(_QWORD *)__str = 0;
    if (!v3)
      goto LABEL_485;
    v96 = CFGetTypeID(v3);
    if (v96 != FigPlayerGetTypeID() || !v95)
      goto LABEL_485;
    if (xpc_dictionary_get_uint64(v95, "ItemObjectID"))
    {
      IDByAssociatingWithClientConnection = FigXPCServerLookupAndRetainAssociatedObject();
      if (IDByAssociatingWithClientConnection)
        goto LABEL_405;
      goto LABEL_485;
    }
    v7 = 0;
    v9 = *(uint64_t (**)(const void *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v9)
    {
LABEL_404:
      IDByAssociatingWithClientConnection = v9(v3, v7);
      goto LABEL_405;
    }
LABEL_406:
    v29 = -12782;
    goto LABEL_450;
  }
  if (v2 <= 1348559971)
  {
    if (v2 != 1232303216)
    {
      if (v2 != 1346529646)
      {
        if (v2 == 1346726254)
        {
          v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v4 = *(_QWORD *)(a1 + 64);
          *(_QWORD *)__str = 0;
          if (v3)
          {
            v5 = CFGetTypeID(v3);
            if (v5 == FigPlayerGetTypeID())
            {
              if (v4)
              {
                IDByAssociatingWithClientConnection = FigXPCMessageCopyCFString();
                if (!IDByAssociatingWithClientConnection)
                {
                  v7 = *(_QWORD *)__str;
                  v8 = *(_QWORD *)(CMBaseObjectGetVTable() + 24);
                  if (!v8)
                    goto LABEL_406;
                  v9 = *(uint64_t (**)(const void *, uint64_t))(v8 + 16);
                  if (!v9)
                    goto LABEL_406;
                  goto LABEL_404;
                }
                goto LABEL_405;
              }
            }
          }
LABEL_485:
          IDByAssociatingWithClientConnection = FigSignalErrorAt();
          goto LABEL_405;
        }
        goto LABEL_399;
      }
      v196 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v197 = *(_QWORD *)(v196 + 24);
      if (v197)
      {
        v198 = *(_QWORD *)(a1 + 64);
        v199 = CFGetTypeID(*(CFTypeRef *)(v196 + 24));
        if (v199 == FigPlayerGetTypeID())
        {
          if (v198)
          {
            v200 = *(_QWORD *)(CMBaseObjectGetVTable() + 24);
            if (v200)
            {
              v201 = *(uint64_t (**)(uint64_t))(v200 + 8);
              if (v201)
              {
                CMTime = v201(v197);
                goto LABEL_385;
              }
            }
LABEL_386:
            v29 = -12782;
            goto LABEL_483;
          }
        }
      }
      goto LABEL_484;
    }
    v193 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v194 = *(void **)(a1 + 64);
    *(_QWORD *)__str = 0;
    cf[0] = 0;
    if (v193)
    {
      v195 = CFGetTypeID(v193);
      if (v195 == FigPlaybackItemGetTypeID())
      {
        if (v194)
        {
          xpc_dictionary_get_uint64(v194, "TrackID");
          v179 = FigXPCMessageCopyCFString();
          if (v179)
            goto LABEL_459;
        }
      }
    }
LABEL_505:
    v179 = FigSignalErrorAt();
LABEL_459:
    v29 = v179;
    goto LABEL_475;
  }
  if (v2 != 1348559972)
  {
    if (v2 == 1348563828)
      goto LABEL_386;
    if (v2 == 1348630894)
    {
      v85 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v86 = *(_QWORD *)(v85 + 24);
      if (!v86)
        goto LABEL_484;
      v87 = *(void **)(a1 + 64);
      v88 = CFGetTypeID(*(CFTypeRef *)(v85 + 24));
      if (v88 != FigPlayerGetTypeID() || !v87)
        goto LABEL_484;
      v89 = xpc_dictionary_get_int64(v87, "StepCount");
      v18 = *(uint64_t (**)(uint64_t, int64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
      if (!v18)
        goto LABEL_386;
      v19 = v86;
      v20 = v89;
      goto LABEL_146;
    }
    goto LABEL_399;
  }
  v248 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v249 = *(void **)(a1 + 64);
  *(_QWORD *)&v310 = 0;
  theDict[0] = 0;
  value[0] = 0;
  *(_QWORD *)&v304 = 0;
  v302[0] = 0;
  v319 = 0;
  v317 = 0u;
  v318 = 0u;
  v315 = 0u;
  v316 = 0u;
  v313 = 0u;
  v314 = 0u;
  *(_OWORD *)__str = 0u;
  if (!v248
    || (v250 = CFGetTypeID(v248), v250 != FigPlayerGetTypeID())
    || !v249
    || (xpc_dictionary_get_uint64(v249, "ItemObjectID"),
        xpc_dictionary_get_uint64(v249, "AfterItemObjectID"),
        (v251 = FigXPCServerLookupAndRetainAssociatedObject()) == 0))
  {
    v251 = FigSignalErrorAt();
  }
  v29 = v251;
LABEL_483:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v29;
}

@end
