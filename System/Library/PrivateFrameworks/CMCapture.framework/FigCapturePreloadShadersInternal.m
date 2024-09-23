@implementation FigCapturePreloadShadersInternal

void __FigCapturePreloadShadersInternal_block_invoke()
{
  FigSampleBufferProcessorCreateForCustom();
  os_unfair_lock_lock(&nonThreadSafeVideoProcessorsPreloadOperationQueueLock);

  nonThreadSafeVideoProcessorsPreloadOperationQueue = 0;
  os_unfair_lock_unlock(&nonThreadSafeVideoProcessorsPreloadOperationQueueLock);
}

uint64_t __FigCapturePreloadShadersInternal_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char ****v9;
  char **v10;
  const char *v11;
  const char *v12;
  char *v13;
  char *v14;
  GLchar *v15;
  GLuint Shader;
  GLuint v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  GLuint v22;
  GLuint v23;
  GLuint Program;
  GLuint v25;
  const GLchar **v26;
  const GLchar *v27;
  _QWORD *v28;
  const GLchar *v29;
  const GLchar **v30;
  const GLchar *v31;
  _QWORD *v32;
  GLint UniformLocation;
  const GLchar *v34;
  const GLchar **v35;
  const GLchar *v36;
  _QWORD *v37;
  GLuint AttribLocation;
  const GLchar *v39;
  GLenum *v40;
  uint64_t v41;
  GLenum v42;
  char **v43;
  NSDictionary *v44;
  id v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  double v66;
  int v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSDictionary *v73;
  const __CFString *v74;
  id v75;
  double v76;
  id v77;
  double v78;
  uint64_t v79;
  id v80;
  double v81;
  void *v82;
  int v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  id v98;
  id v99;
  BWMattingInferenceConfiguration *v100;
  double v101;
  BWSensorConfiguration *v102;
  BWSensorConfiguration *v103;
  BWMattingV2InferenceConfiguration *v104;
  double v105;
  BWLearnedMattingInferenceConfiguration *v106;
  double v107;
  void *v108;
  char v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  uint64_t v118;
  NSDictionary *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  double v133;
  id v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  double v141;
  id v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t k;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t m;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  BWDeepZoomInferenceConfiguration *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t n;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t ii;
  void *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  char v177;
  uint64_t v178;
  uint64_t jj;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t kk;
  void *v192;
  void *v193;
  int v194;
  const void *v195;
  void (*v196)(const void *);
  uint64_t FigBaseObject;
  uint64_t v198;
  void (*v199)(uint64_t);
  id v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  __objc2_class **v205;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t mm;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  double v237;
  id v238;
  void *v239;
  uint64_t v240;
  void *v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t nn;
  void *v247;
  FigMetalHistogram *v248;
  NSDictionary *v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t i1;
  void *v255;
  void *v256;
  NSString *v257;
  const __CFString *v258;
  uint64_t v259;
  id v260;
  id v261;
  void *v262;
  void *v263;
  void *v264;
  GLvoid *pixels;
  GLvoid *pixelsa;
  uint64_t v268;
  uint64_t v269;
  void *context;
  void *v271;
  int v272;
  BWInferenceEngine *v273;
  FigCaptureCameraParameters *v274;
  void *v275;
  id v276;
  id v277;
  uint64_t v278;
  unsigned int v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  unsigned int v283;
  id v284;
  uint64_t v285;
  void *v286;
  void *v287;
  NSDictionary *v288;
  char ****obj;
  id obja;
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
  _QWORD v335[2];
  _QWORD v336[2];
  _QWORD v337[2];
  _QWORD v338[2];
  _QWORD v339[3];
  _QWORD v340[3];
  _QWORD v341[3];
  _QWORD v342[3];
  _BYTE v343[128];
  _QWORD v344[3];
  _QWORD v345[3];
  _QWORD v346[2];
  _QWORD v347[2];
  uint64_t v348;
  uint64_t v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  _QWORD v354[3];
  _QWORD v355[3];
  _BYTE v356[128];
  _QWORD v357[3];
  _QWORD v358[3];
  _BYTE v359[128];
  _QWORD v360[3];
  _QWORD v361[3];
  _QWORD v362[3];
  _QWORD v363[3];
  _QWORD v364[3];
  _QWORD v365[3];
  _QWORD v366[3];
  _QWORD v367[3];
  _QWORD v368[3];
  _QWORD v369[3];
  _QWORD v370[2];
  _QWORD v371[2];
  _QWORD v372[3];
  _QWORD v373[3];
  _QWORD v374[2];
  _QWORD v375[2];
  _QWORD v376[3];
  _QWORD v377[3];
  _QWORD v378[3];
  _QWORD v379[3];
  _BYTE v380[128];
  _QWORD v381[16];
  uint64_t v382;
  BWSensorConfiguration *v383;
  _QWORD v384[16];
  _QWORD v385[2];
  _QWORD v386[2];
  _QWORD v387[3];
  _QWORD v388[3];
  _QWORD v389[3];
  _QWORD v390[3];
  _QWORD v391[3];
  _QWORD v392[3];
  _QWORD v393[3];
  _QWORD v394[3];
  _QWORD v395[3];
  _QWORD v396[3];
  const __CFString *v397;
  const __CFString *v398;
  const __CFString *v399;
  uint64_t v400;
  const __CFString *v401;
  id v402;
  const __CFString *v403;
  const __CFString *v404;
  const __CFString *v405;
  uint64_t v406;
  const __CFString *v407;
  id v408;
  const __CFString *v409;
  const __CFString *v410;
  const __CFString *v411;
  uint64_t v412;
  const __CFString *v413;
  id v414;
  _QWORD v415[2];
  _QWORD v416[2];
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  _QWORD v421[2];
  _QWORD v422[2];
  _QWORD v423[3];
  _QWORD v424[3];
  _QWORD v425[2];
  _QWORD v426[2];
  _QWORD v427[2];
  _QWORD v428[2];
  uint64_t v429;
  NSDictionary *v430;
  mach_timebase_info info;
  uint64_t v432;

  v432 = *MEMORY[0x1E0C80C00];
  v271 = (void *)FigOSTransactionCreate();
  v3 = mach_absolute_time();
  if (*(_BYTE *)(a1 + 40))
  {
    DMPerformMigrationIfNeeded();
    mach_absolute_time();
    info = 0;
    mach_timebase_info(&info);
    v3 = mach_absolute_time();
  }
  if ((sDeviceUsesSISSampleBufferProcessor & 1) != 0
    || (sDeviceUsesTMBNRSampleBufferProcessor & 1) != 0
    || sDeviceUsesHDRSampleBufferProcessor)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    info.numer = 1;
    if (!v4
      || (v5 = v4,
          objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD0D20]),
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0958]), "initWithAPI:properties:", 3, v5),
          v5,
          !v6))
    {
      fig_log_get_emitter();
      v268 = v1;
      LODWORD(pixels) = 0;
      v3 = FigDebugAssert3();
      goto LABEL_45;
    }
    if (objc_msgSend(v6, "setParameter:to:", 608, &info))
    {

      goto LABEL_45;
    }
    v287 = v6;
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v6);
    v7 = 0;
    v8 = 0;
    v9 = programs_es3;
    v10 = NoiseReductionChromaDenoiseX2_prog;
    v11 = "com.apple.cameracapture";
    v12 = "";
    while (1)
    {
      v13 = *v10;
      if (*v10)
      {
        v14 = v10[1];
        if (v14)
        {
          v15 = *(GLchar **)v14;
          Shader = gl_UtilsCreateShader(0x8B31u, *(GLchar **)v13);
          if (Shader)
          {
            v17 = Shader;
            obj = v9;
            v18 = v7;
            v19 = v8;
            v20 = v12;
            v21 = v11;
            v22 = gl_UtilsCreateShader(0x8B30u, v15);
            if (v22)
            {
              v23 = v22;
              info.numer = 0;
              Program = glCreateProgram();
              v25 = Program;
              if (Program)
              {
                glAttachShader(Program, v17);
                glAttachShader(v25, v23);
                glLinkProgram(v25);
                glGetProgramiv(v25, 0x8B82u, (GLint *)&info);
                if (!info.numer)
                {
                  glDeleteProgram(v25);
                  v25 = 0;
                }
              }
              else
              {
                fig_log_get_emitter();
                v268 = v1;
                LODWORD(pixels) = 0;
                FigDebugAssert3();
              }
              glDeleteShader(v17);
              glDeleteShader(v23);
              v11 = v21;
              v12 = v20;
              v8 = v19;
              v7 = v18;
              v9 = obj;
              if (v25)
              {
                glUseProgram(v25);
                v26 = (const GLchar **)*((_QWORD *)v13 + 2);
                v27 = *v26;
                if (*v26)
                {
                  v28 = v26 + 2;
                  do
                  {
                    glBindAttribLocation(v25, *((_DWORD *)v28 - 2), v27);
                    v29 = (const GLchar *)*v28;
                    v28 += 2;
                    v27 = v29;
                  }
                  while (v29);
                  glLinkProgram(v25);
                }
                v30 = (const GLchar **)*((_QWORD *)v14 + 1);
                v31 = *v30;
                if (*v30)
                {
                  v32 = v30 + 2;
                  do
                  {
                    UniformLocation = glGetUniformLocation(v25, v31);
                    glUniform1i(UniformLocation, *((_DWORD *)v32 - 2));
                    v34 = (const GLchar *)*v32;
                    v32 += 2;
                    v31 = v34;
                  }
                  while (v34);
                }
                v35 = (const GLchar **)*((_QWORD *)v13 + 1);
                v36 = *v35;
                if (*v35)
                {
                  v37 = v35 + 2;
                  do
                  {
                    AttribLocation = glGetAttribLocation(v25, v36);
                    glVertexAttribPointer(AttribLocation, *((_DWORD *)v37 - 2), *((_DWORD *)v37 - 1), 0, 0, &PreloadOneShader_vertices);
                    glEnableVertexAttribArray(AttribLocation);
                    v39 = (const GLchar *)*v37;
                    v37 += 2;
                    v36 = v39;
                  }
                  while (v39);
                }
                v8 = (v8 + 1);
                glBindFramebuffer(0x8D40u, v8);
                v40 = (GLenum *)*((_QWORD *)v14 + 2);
                v41 = v7;
                if (v40[2])
                {
                  do
                  {
                    v41 = (v41 + 1);
                    glBindTexture(0xDE1u, v41);
                    glTexImage2D(0xDE1u, 0, v40[1], 1, 1, 0, v40[2], 0x1401u, 0);
                    glFramebufferTexture2D(0x8D40u, *v40, 0xDE1u, v41, 0);
                    v42 = v40[5];
                    v40 += 3;
                  }
                  while (v42);
                }
                glDrawBuffers(v41 - v7, draw_buffers);
                glDrawArrays(5u, 0, 3);
                glFlush();
                glDeleteProgram(v25);
                v7 = v41;
                goto LABEL_32;
              }
            }
            else
            {
              v12 = v20;
              fig_log_get_emitter();
              FigDebugAssert3();
              glDeleteShader(v17);
              v8 = v19;
              v7 = v18;
              v9 = obj;
            }
          }
          else
          {
            fig_log_get_emitter();
            FigDebugAssert3();
          }
        }
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      fig_log_get_emitter();
      v268 = v1;
      LODWORD(pixels) = 0;
      FigDebugAssert3();
LABEL_32:
      v43 = (char **)v9[1];
      ++v9;
      v10 = v43;
      if (!v43)
      {
        glGetError();
        for (info.numer = 1; info.numer <= v7; ++info.numer)
          glDeleteTextures(1, (const GLuint *)&info);
        for (info.numer = 1; info.numer <= v8; ++info.numer)
          glDeleteFramebuffers(1, (const GLuint *)&info);

        break;
      }
    }
  }
LABEL_45:
  context = (void *)MEMORY[0x1A858DD40](v3);
  v274 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v44 = -[FigCaptureCameraParameters cameraTuningParameters](v274, "cameraTuningParameters");
  v45 = -[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs"));
  v276 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v277 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0x1E0C99000uLL;
  if (sDeviceUsesGNRSampleBufferProcessor == 1)
  {
    v429 = *MEMORY[0x1E0D06188];
    v430 = v44;
    v427[0] = CFSTR("sbpName");
    v427[1] = CFSTR("sbpOpts");
    v428[0] = CFSTR("GNR");
    v428[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v430, &v429, 1);
    objc_msgSend(v276, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v428, v427, 2));
  }
  v47 = -[FigCaptureCameraParameters videoStabilizationProcessorVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance", pixels, v268), "videoStabilizationProcessorVersion");
  v48 = 0x1E0CB3000uLL;
  if ((int)v47 >= 1)
  {
    v49 = v47;
    v50 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VISProcessorV%d"), v47);
    v425[0] = CFSTR("bundlePath");
    v425[1] = CFSTR("classname");
    v426[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/VideoStabilizationV%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), v49);
    v426[1] = v50;
    objc_msgSend(v277, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v426, v425, 2));
  }
  v51 = *MEMORY[0x1E0D05A30];
  v52 = objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]);
  v53 = (_QWORD *)MEMORY[0x1E0D05A18];
  v54 = *MEMORY[0x1E0D05A28];
  v55 = (uint64_t *)MEMORY[0x1E0D05A38];
  v288 = v44;
  obja = v45;
  if (v52)
  {
    v56 = *MEMORY[0x1E0D05A38];
  }
  else
  {
    v57 = objc_msgSend(v45, "objectForKeyedSubscript:", v54);
    v56 = *v55;
    if (v57)
    {
      v53 = (_QWORD *)MEMORY[0x1E0D05A18];
    }
    else if (!objc_msgSend(v45, "objectForKeyedSubscript:", *v55)
           || (v83 = -[FigCaptureCameraParameters depthProcessorVersion](v274, "depthProcessorVersion"),
               v53 = (_QWORD *)MEMORY[0x1E0D05A18],
               v83 < 1))
    {
      v272 = 0;
      v273 = 0;
      v84 = v277;
      goto LABEL_113;
    }
  }
  v58 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", *v53), "objectForKeyedSubscript:", objc_msgSend(v45, "objectForKeyedSubscript:", *v53));
  v59 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v51), "objectForKeyedSubscript:", objc_msgSend(v45, "objectForKeyedSubscript:", v51));
  v60 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A40]), "objectForKeyedSubscript:", objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A40]));
  v61 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v54), "objectForKeyedSubscript:", objc_msgSend(v45, "objectForKeyedSubscript:", v54));
  v62 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v56), "objectForKeyedSubscript:", objc_msgSend(v45, "objectForKeyedSubscript:", v56));
  v63 = objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("StereoFusionParameters"));
  if (sDeviceUsesStereoFusionSampleBufferProcessor == 1 && v63)
  {
    v64 = *MEMORY[0x1E0D087C8];
    v423[0] = *MEMORY[0x1E0D06188];
    v423[1] = v64;
    v424[0] = v63;
    v424[1] = &unk_1E49F8E50;
    v423[2] = *MEMORY[0x1E0D06158];
    v424[2] = MEMORY[0x1E0C9AAB0];
    v421[0] = CFSTR("sbpName");
    v421[1] = CFSTR("sbpOpts");
    v422[0] = CFSTR("StereoFusion");
    v422[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v424, v423, 3);
    objc_msgSend(v276, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v422, v421, 2));
  }
  v273 = -[BWInferenceEngine initWithScheduler:priority:]([BWInferenceEngine alloc], "initWithScheduler:priority:", 0, 29);
  v65 = -[FigCaptureCameraParameters disparityVersion](v274, "disparityVersion");
  if (!v65)
  {
    v325 = 0u;
    v326 = 0u;
    v323 = 0u;
    v324 = 0u;
    v69 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v323, &v417, 16);
    if (!v69)
      goto LABEL_78;
    v70 = v69;
    v71 = *(_QWORD *)v324;
LABEL_64:
    v72 = 0;
    while (1)
    {
      if (*(_QWORD *)v324 != v71)
        objc_enumerationMutation(obja);
      v65 = -[FigCaptureCameraParameters disparityVersionForPortType:sensorIDString:](v274, "disparityVersionForPortType:sensorIDString:", *(_QWORD *)(*((_QWORD *)&v323 + 1) + 8 * v72), objc_msgSend(obja, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v323 + 1) + 8 * v72)));
      if (v65)
        break;
      if (v70 == ++v72)
      {
        v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v323, &v417, 16);
        if (v70)
          goto LABEL_64;
        goto LABEL_78;
      }
    }
  }
  v67 = v65 - 2;
  if (v65 >= 2
    && +[BWLandmarksInferenceConfiguration isPortraitPrewarmingRequired](BWLandmarksInferenceConfiguration, "isPortraitPrewarmingRequired"))
  {
    -[BWInferenceEngine addInferenceOfType:version:configuration:](v273, "addInferenceOfType:version:configuration:", 801, -[FigCaptureCameraParameters landmarksVersionForInferenceType:](v274, "landmarksVersionForInferenceType:", 801) & 0xFFFFFFFFFFFFLL, 0);
  }
  switch(v67)
  {
    case 0:
      v68 = &unk_1E4A03020;
      goto LABEL_77;
    case 1:
      v73 = (NSDictionary *)objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("DisparityParameters"));
      if (!v73)
        goto LABEL_78;
      v74 = CFSTR("/System/Library/VideoProcessors/DisparityV3.bundle");
      break;
    case 2:
      v68 = &unk_1E4A03048;
      goto LABEL_77;
    case 3:
      v73 = -[FigCaptureCameraParameters stereoDisparityParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "stereoDisparityParameters");
      if (!v73)
        goto LABEL_78;
      v74 = CFSTR("/System/Library/VideoProcessors/DisparityV5.bundle");
      break;
    default:
      goto LABEL_78;
  }
  v415[0] = CFSTR("bundlePath");
  v415[1] = CFSTR("tuningParameters");
  v416[0] = v74;
  v416[1] = v73;
  v68 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v416, v415, 2);
LABEL_77:
  objc_msgSend(v277, "addObject:", v68);
LABEL_78:
  LODWORD(v66) = 1.0;
  v75 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v59, v66);
  LODWORD(v76) = 2.0;
  v77 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v58, v76);
  if (v60)
    v79 = v60;
  else
    v79 = v62;
  LODWORD(v78) = 1.0;
  v80 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v79, v78);
  LODWORD(v81) = 1.0;
  v284 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v61, v81);
  if (v75)
  {
    v82 = (void *)objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x1E0D06190]);
    v46 = 0x1E0C99000;
    v48 = 0x1E0CB3000;
    v44 = v288;
    goto LABEL_85;
  }
  v46 = 0x1E0C99000uLL;
  v48 = 0x1E0CB3000uLL;
  v44 = v288;
  if (v80)
  {
    v82 = (void *)objc_msgSend(v80, "objectForKeyedSubscript:", *MEMORY[0x1E0D06190]);
LABEL_85:
    if (v82)
      LODWORD(v82) = objc_msgSend(v82, "intValue");
    goto LABEL_91;
  }
  LODWORD(v82) = 0;
LABEL_91:
  if ((int)v82 >= 5)
    v85 = 5;
  else
    v85 = v82;
  v86 = objc_msgSend(*(id *)(v48 + 2368), "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), CFSTR("SDOFRendering"), v85);
  v87 = v86;
  if ((v85 - 3) >= 3)
  {
    if ((_DWORD)v85 == 2)
    {
      v397 = CFSTR("bundlePath");
      v398 = CFSTR("classname");
      v400 = v86;
      v401 = CFSTR("FigSDOFBlurMapRendering");
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", &v400, &v397, 2));
      if (v75)
      {
        v409 = CFSTR("bundlePath");
        v410 = CFSTR("classname");
        v412 = v87;
        v413 = CFSTR("FigSDOFEffectRendering");
        v411 = CFSTR("tuningParameters");
        v414 = v75;
        objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", &v412, &v409, 3));
      }
      if (v80)
      {
        v403 = CFSTR("bundlePath");
        v404 = CFSTR("classname");
        v406 = v87;
        v407 = CFSTR("FigSDOFEffectRendering");
        v405 = CFSTR("tuningParameters");
        v408 = v80;
        objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", &v406, &v403, 3));
      }
    }
  }
  else
  {
    if (+[BWPersonSegmentationConfiguration isPortraitPrewarmingRequired](BWPersonSegmentationConfiguration, "isPortraitPrewarmingRequired"))
    {
      -[BWInferenceEngine addInferenceOfType:version:configuration:](v273, "addInferenceOfType:version:configuration:", 102, +[BWPersonSegmentationConfiguration portraitVersion](BWPersonSegmentationConfiguration, "portraitVersion") & 0xFFFFFFFFFFFFLL, 0);
    }
    if (v75)
    {
      v409 = CFSTR("bundlePath");
      v410 = CFSTR("classname");
      v412 = v87;
      v413 = CFSTR("FigSDOFBlurMapRendering");
      v411 = CFSTR("tuningParameters");
      v414 = v75;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", &v412, &v409, 3));
      v403 = CFSTR("bundlePath");
      v404 = CFSTR("classname");
      v406 = v87;
      v407 = CFSTR("FigSDOFEffectRendering");
      v405 = CFSTR("tuningParameters");
      v408 = v75;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", &v406, &v403, 3));
    }
    if (v77)
    {
      v397 = CFSTR("bundlePath");
      v398 = CFSTR("classname");
      v400 = v87;
      v401 = CFSTR("FigSDOFBlurMapRendering");
      v399 = CFSTR("tuningParameters");
      v402 = v77;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", &v400, &v397, 3));
      v395[0] = CFSTR("bundlePath");
      v395[1] = CFSTR("classname");
      v396[0] = v87;
      v396[1] = CFSTR("FigSDOFEffectRendering");
      v395[2] = CFSTR("tuningParameters");
      v396[2] = v77;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v396, v395, 3));
    }
    if (v80)
    {
      v393[0] = CFSTR("bundlePath");
      v393[1] = CFSTR("classname");
      v394[0] = v87;
      v394[1] = CFSTR("FigSDOFBlurMapRendering");
      v393[2] = CFSTR("tuningParameters");
      v394[2] = v80;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v394, v393, 3));
      v391[0] = CFSTR("bundlePath");
      v391[1] = CFSTR("classname");
      v392[0] = v87;
      v392[1] = CFSTR("FigSDOFEffectRendering");
      v391[2] = CFSTR("tuningParameters");
      v392[2] = v80;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v392, v391, 3));
    }
    if (v284)
    {
      v389[0] = CFSTR("bundlePath");
      v389[1] = CFSTR("classname");
      v390[0] = v87;
      v390[1] = CFSTR("FigSDOFBlurMapRendering");
      v389[2] = CFSTR("tuningParameters");
      v390[2] = v284;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v390, v389, 3));
      v387[0] = CFSTR("bundlePath");
      v387[1] = CFSTR("classname");
      v388[0] = v87;
      v388[1] = CFSTR("FigSDOFEffectRendering");
      v387[2] = CFSTR("tuningParameters");
      v388[2] = v284;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v388, v387, 3));
    }
    if (+[BWRGBPersonSegmentationInferenceConfiguration isPortraitPrewarmingRequired](BWRGBPersonSegmentationInferenceConfiguration, "isPortraitPrewarmingRequired"))
    {
      -[BWInferenceEngine addInferenceOfType:version:configuration:](v273, "addInferenceOfType:version:configuration:", 103, +[BWRGBPersonSegmentationInferenceConfiguration portraitVersion](BWRGBPersonSegmentationInferenceConfiguration, "portraitVersion") & 0xFFFFFFFFFFFFLL, 0);
    }
  }
  v88 = objc_msgSend(*(id *)(v48 + 2368), "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), CFSTR("DepthProcessor"), -[FigCaptureCameraParameters depthProcessorVersion](v274, "depthProcessorVersion"));
  v385[0] = CFSTR("bundlePath");
  v385[1] = CFSTR("classname");
  v386[0] = v88;
  v386[1] = CFSTR("FigStreamingDepthProcessorCPU");
  v84 = v277;
  objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v386, v385, 2));
  v272 = 1;
  v45 = obja;
LABEL_113:
  objc_msgSend(v84, "addObject:", &unk_1E4A03070);
  v321 = 0u;
  v322 = 0u;
  v319 = 0u;
  v320 = 0u;
  v89 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v319, v384, 16);
  if (v89)
  {
    v90 = v89;
    v91 = *(_QWORD *)v320;
    while (2)
    {
      for (i = 0; i != v90; ++i)
      {
        if (*(_QWORD *)v320 != v91)
          objc_enumerationMutation(obja);
        v93 = *(_QWORD *)(*((_QWORD *)&v319 + 1) + 8 * i);
        v94 = objc_msgSend(obja, "objectForKeyedSubscript:", v93);
        v95 = -[FigCaptureCameraParameters mattingVersionForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "mattingVersionForPortType:sensorIDString:", v93, v94);
        v96 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", v93), "objectForKeyedSubscript:", v94);
        LODWORD(v97) = 1.0;
        v98 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v96, v97);
        if ((_DWORD)v95)
        {
          v99 = v98;
          if ((_DWORD)v95 == 1)
          {
            v100 = -[BWInferenceConfiguration initWithInferenceType:]([BWMattingInferenceConfiguration alloc], "initWithInferenceType:", 201);
            -[BWInferenceConfiguration setPriority:](v100, "setPriority:", 14);
            -[BWInferenceConfiguration setTuningParameters:](v100, "setTuningParameters:", v96);
            -[BWMattingInferenceConfiguration setSdofRenderingTuningParameters:](v100, "setSdofRenderingTuningParameters:", v99);
            LODWORD(v101) = 2.0;
            -[BWMattingInferenceConfiguration setMainImageDownscalingFactor:](v100, "setMainImageDownscalingFactor:", v101);
            -[BWInferenceEngine addInferenceOfType:version:configuration:](v273, "addInferenceOfType:version:configuration:", 201, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v100);
            v44 = v288;
            v48 = 0x1E0CB3000;
          }
          else
          {
            v102 = [BWSensorConfiguration alloc];
            v103 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:](v102, "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v93, v94, v96, MEMORY[0x1E0C9AA70]);
            v104 = -[BWInferenceConfiguration initWithInferenceType:]([BWMattingV2InferenceConfiguration alloc], "initWithInferenceType:", 201);
            v382 = -[BWSensorConfiguration portType](v103, "portType");
            v383 = v103;
            -[BWMattingV2InferenceConfiguration setSensorConfigurationsByPortType:](v104, "setSensorConfigurationsByPortType:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", &v383, &v382, 1));
            -[BWInferenceConfiguration setPriority:](v104, "setPriority:", 14);
            -[BWMattingV2InferenceConfiguration setSdofRenderingTuningParameters:](v104, "setSdofRenderingTuningParameters:", v99);
            LODWORD(v105) = 2.0;
            -[BWMattingV2InferenceConfiguration setMainImageDownscalingFactor:](v104, "setMainImageDownscalingFactor:", v105);
            -[BWInferenceEngine addInferenceOfType:version:configuration:](v273, "addInferenceOfType:version:configuration:", 201, BWInferenceVersionMakeMajor(v95) & 0xFFFFFFFFFFFFLL, v104);
            v44 = v288;
            v48 = 0x1E0CB3000;
            if (-[FigCaptureCameraParameters learnedMattingVersion](v274, "learnedMattingVersion") >= 1)
            {
              v106 = -[BWInferenceConfiguration initWithInferenceType:]([BWLearnedMattingInferenceConfiguration alloc], "initWithInferenceType:", 107);
              -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v106, "setMetalCommandQueue:", 0);
              LODWORD(v107) = 2.0;
              -[BWLearnedMattingInferenceConfiguration setMainImageDownscalingFactor:](v106, "setMainImageDownscalingFactor:", v107);
              -[BWInferenceEngine addInferenceOfType:version:configuration:](v273, "addInferenceOfType:version:configuration:", 107, BWInferenceVersionMakeMajor(-[FigCaptureCameraParameters learnedMattingVersion](v274, "learnedMattingVersion")) & 0xFFFFFFFFFFFFLL, v106);
            }
          }
          goto LABEL_126;
        }
      }
      v90 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v319, v384, 16);
      v44 = v288;
      v48 = 0x1E0CB3000;
      if (v90)
        continue;
      break;
    }
  }
LABEL_126:
  if (-[FigCaptureCameraParameters distortionCorrectionVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "distortionCorrectionVersion"))
  {
    objc_msgSend(v277, "addObject:", &unk_1E4A03098);
  }
  v275 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v315 = 0u;
  v316 = 0u;
  v317 = 0u;
  v318 = 0u;
  v108 = obja;
  v281 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v315, v381, 16);
  if (v281)
  {
    v279 = 0;
    v109 = 0;
    v278 = *(_QWORD *)v316;
    do
    {
      v110 = 0;
      do
      {
        if (*(_QWORD *)v316 != v278)
          objc_enumerationMutation(v108);
        v285 = v110;
        v111 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v315 + 1) + 8 * v110)), "objectForKeyedSubscript:", objc_msgSend(v108, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v315 + 1) + 8 * v110))), "objectForKeyedSubscript:", CFSTR("NRFParameters")), "objectForKeyedSubscript:", CFSTR("NRFParameters"));
        v112 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v311 = 0u;
        v312 = 0u;
        v313 = 0u;
        v314 = 0u;
        v113 = (void *)objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("ToneMapping"));
        v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v311, v380, 16);
        if (v114)
        {
          v115 = v114;
          v116 = *(_QWORD *)v312;
          do
          {
            for (j = 0; j != v115; ++j)
            {
              if (*(_QWORD *)v312 != v116)
                objc_enumerationMutation(v113);
              v118 = *(_QWORD *)(*((_QWORD *)&v311 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("ToneMapping")), "objectForKeyedSubscript:", v118), "objectForKeyedSubscript:", CFSTR("EnableSTF")), "BOOLValue"))
              {
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("ToneMapping")), "objectForKeyedSubscript:", v118), "objectForKeyedSubscript:", CFSTR("StfTuningParameters")))
                {
                  objc_msgSend(v112, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("ToneMapping")), "objectForKeyedSubscript:", v118), "objectForKeyedSubscript:", CFSTR("StfTuningParameters")), v118);
                }
                v109 = 1;
              }
            }
            v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v311, v380, 16);
          }
          while (v115);
        }
        if ((v109 & 1) != 0)
          objc_msgSend(v275, "setObject:forKey:", v112, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v279++));
        v44 = v288;
        v108 = obja;
        v110 = v285 + 1;
      }
      while (v285 + 1 != v281);
      v281 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v315, v381, 16);
    }
    while (v281);
    v46 = 0x1E0C99000uLL;
    v48 = 0x1E0CB3000uLL;
    if ((v109 & 1) != 0)
    {
      v378[0] = CFSTR("bundlePath");
      v378[1] = CFSTR("classname");
      v379[0] = CFSTR("/System/Library/VideoProcessors/STF.bundle");
      v379[1] = CFSTR("STFStillProcessorV1");
      v378[2] = CFSTR("tuningParameters");
      v379[2] = v275;
      objc_msgSend(v277, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v379, v378, 3));
    }
  }
  v119 = -[FigCaptureCameraParameters videoStabilizationSTFParameters](v274, "videoStabilizationSTFParameters");
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v119, "objectForKeyedSubscript:", CFSTR("Version")), "unsignedIntValue"))
  {
    v376[0] = CFSTR("bundlePath");
    v376[1] = CFSTR("classname");
    v377[0] = CFSTR("/System/Library/VideoProcessors/STF.bundle");
    v377[1] = CFSTR("STFVideoProcessorV1");
    v376[2] = CFSTR("tuningParameters");
    v377[2] = v119;
    objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v377, v376, 3));
  }
  v120 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
  v280 = *MEMORY[0x1E0D05A18];
  if (objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "objectForKeyedSubscript:", objc_msgSend(v108, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18])), "objectForKeyedSubscript:", CFSTR("SoftwareFlashRenderingParameters")))
  {
    v121 = objc_msgSend(*(id *)(v48 + 2368), "stringWithFormat:", CFSTR("%@/NRFV%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), v120);
    v122 = objc_msgSend(*(id *)(v48 + 2368), "stringWithFormat:", CFSTR("CMISoftwareFlashRenderingProcessorV%d"), sDeviceSWFRVersion);
    v374[0] = CFSTR("bundlePath");
    v374[1] = CFSTR("classname");
    v375[0] = v121;
    v375[1] = v122;
    objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v375, v374, 2));
  }
  v123 = *MEMORY[0x1E0D05A40];
  v124 = objc_msgSend(v108, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A40]);
  v125 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v123), "objectForKeyedSubscript:", v124);
  v126 = objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("DepthProcessingParameters"));
  if (v124)
  {
    v127 = v126;
    v128 = -[FigCaptureCameraParameters depthProcessorVersion](v274, "depthProcessorVersion");
    v129 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), CFSTR("DepthProcessor"), v128);
    v372[0] = CFSTR("bundlePath");
    v372[1] = CFSTR("classname");
    v373[0] = v129;
    v373[1] = CFSTR("FigStillDepthProcessorGPU");
    v372[2] = CFSTR("tuningParameters");
    v373[2] = v127;
    objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v373, v372, 3));
    v48 = 0x1E0CB3000uLL;
    v130 = -[FigCaptureCameraParameters depthProcessorVersion](v274, "depthProcessorVersion");
    v131 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), CFSTR("DepthProcessor"), v130);
    v370[0] = CFSTR("bundlePath");
    v370[1] = CFSTR("classname");
    v371[0] = v131;
    v371[1] = CFSTR("FigStreamingDepthProcessorCPU");
    v132 = objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v371, v370, 2);
    if ((objc_msgSend(v277, "containsObject:", v132) & 1) == 0)
      objc_msgSend(v277, "addObject:", v132);
    LODWORD(v133) = 1.0;
    v134 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v125, v133);
    v135 = (void *)objc_msgSend(v134, "objectForKeyedSubscript:", *MEMORY[0x1E0D06190]);
    if ((int)objc_msgSend(v135, "intValue") <= 5)
      v136 = objc_msgSend(v135, "intValue");
    else
      v136 = 5;
    v137 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), CFSTR("SDOFRendering"), v136);
    v272 = 1;
    if (v134 && (_DWORD)v136)
    {
      v138 = v137;
      v368[0] = CFSTR("bundlePath");
      v368[1] = CFSTR("classname");
      v369[0] = v137;
      v369[1] = CFSTR("FigSDOFBlurMapRendering");
      v368[2] = CFSTR("tuningParameters");
      v369[2] = v134;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v369, v368, 3));
      v366[0] = CFSTR("bundlePath");
      v366[1] = CFSTR("classname");
      v48 = 0x1E0CB3000uLL;
      v367[0] = v138;
      v367[1] = CFSTR("FigSDOFEffectRendering");
      v366[2] = CFSTR("tuningParameters");
      v367[2] = v134;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v367, v366, 3));
      v272 = 1;
    }
  }
  v139 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v280), "objectForKeyedSubscript:", objc_msgSend(v108, "objectForKeyedSubscript:", v280));
  v140 = objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("FocusPixelDisparity"));
  if (v140)
  {
    v364[0] = CFSTR("bundlePath");
    v364[1] = CFSTR("classname");
    v365[0] = CFSTR("/System/Library/VideoProcessors/FPDisparityV1.bundle");
    v365[1] = CFSTR("FigFocusPixelDisparityGenerator");
    v364[2] = CFSTR("tuningParameters");
    v365[2] = v140;
    objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v365, v364, 3));
    LODWORD(v141) = 1.0;
    v142 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v139, v141);
    v143 = (void *)objc_msgSend(v142, "objectForKeyedSubscript:", *MEMORY[0x1E0D06190]);
    if ((int)objc_msgSend(v143, "intValue") <= 5)
      v144 = objc_msgSend(v143, "intValue");
    else
      v144 = 5;
    v145 = objc_msgSend(*(id *)(v48 + 2368), "stringWithFormat:", CFSTR("%@/%@V%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), CFSTR("SDOFRendering"), v144);
    if (v142 && (_DWORD)v144)
    {
      v146 = v145;
      v362[0] = CFSTR("bundlePath");
      v362[1] = CFSTR("classname");
      v363[0] = v145;
      v363[1] = CFSTR("FigSDOFBlurMapRendering");
      v362[2] = CFSTR("tuningParameters");
      v363[2] = v142;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v363, v362, 3));
      v360[0] = CFSTR("bundlePath");
      v360[1] = CFSTR("classname");
      v361[0] = v146;
      v361[1] = CFSTR("FigSDOFEffectRendering");
      v360[2] = CFSTR("tuningParameters");
      v361[2] = v142;
      objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v361, v360, 3));
    }
    if (!v273)
      v273 = -[BWInferenceEngine initWithScheduler:priority:]([BWInferenceEngine alloc], "initWithScheduler:priority:", 0, 29);
    v272 = 1;
  }
  if (sDeviceUsesUBProcessor == 1)
  {
    v309 = 0u;
    v310 = 0u;
    v307 = 0u;
    v308 = 0u;
    v147 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v307, v359, 16);
    if (v147)
    {
      v148 = v147;
      v149 = *(_QWORD *)v308;
      while (2)
      {
        for (k = 0; k != v148; ++k)
        {
          if (*(_QWORD *)v308 != v149)
            objc_enumerationMutation(v108);
          if (objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v307 + 1) + 8 * k)), "objectForKeyedSubscript:", objc_msgSend(v108, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v307 + 1) + 8 * k))), "objectForKeyedSubscript:", CFSTR("UBParameters")))
          {
            v357[0] = CFSTR("bundlePath");
            v357[1] = CFSTR("classname");
            v358[0] = CFSTR("/System/Library/VideoProcessors/UB.bundle");
            v358[1] = CFSTR("UBProcessor");
            v357[2] = CFSTR("tuningParameters");
            v358[2] = v44;
            objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v358, v357, 3));
            goto LABEL_184;
          }
        }
        v148 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v307, v359, 16);
        if (v148)
          continue;
        break;
      }
    }
  }
LABEL_184:
  if (sDeviceUsesNRFProcessor == 1)
  {
    v305 = 0u;
    v306 = 0u;
    v303 = 0u;
    v304 = 0u;
    v151 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v303, v356, 16);
    if (v151)
    {
      v152 = v151;
      v153 = *(_QWORD *)v304;
      while (2)
      {
        for (m = 0; m != v152; ++m)
        {
          if (*(_QWORD *)v304 != v153)
            objc_enumerationMutation(v108);
          if (objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v303 + 1) + 8 * m)), "objectForKeyedSubscript:", objc_msgSend(v108, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v303 + 1) + 8 * m))), "objectForKeyedSubscript:", CFSTR("NRFParameters")))
          {
            v155 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
            if ((_DWORD)v155)
            {
              v156 = v155;
              v157 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/NRFV%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), v155);
              v158 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NRFProcessorV%d"), v156);
              v354[0] = CFSTR("bundlePath");
              v354[1] = CFSTR("classname");
              v355[0] = v157;
              v355[1] = v158;
              v354[2] = CFSTR("tuningParameters");
              v355[2] = v44;
              objc_msgSend(v277, "addObject:", objc_msgSend(*(id *)(v46 + 3456), "dictionaryWithObjects:forKeys:count:", v355, v354, 3));
            }
            goto LABEL_196;
          }
        }
        v152 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v303, v356, 16);
        if (v152)
          continue;
        break;
      }
    }
  }
LABEL_196:
  v159 = -[FigCaptureCameraParameters deepZoomVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deepZoomVersion");
  if ((_DWORD)v159)
  {
    v160 = v159;
    v161 = -[BWInferenceConfiguration initWithInferenceType:]([BWDeepZoomInferenceConfiguration alloc], "initWithInferenceType:", 160);
    -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v161, "setMetalCommandQueue:", 0);
    -[BWDeepZoomInferenceConfiguration setType:](v161, "setType:", 2);
    -[BWDeepZoomInferenceConfiguration setVersion:](v161, "setVersion:", v160);
    -[BWInferenceConfiguration setTuningParameters:](v161, "setTuningParameters:", v44);
    -[BWInferenceEngine addInferenceOfType:version:configuration:](v273, "addInferenceOfType:version:configuration:", 160, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v161);
  }
  v162 = -[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs"));
  v350 = 0u;
  v351 = 0u;
  v352 = 0u;
  v353 = 0u;
  v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v350, &info, 16);
  if (v163)
  {
    v164 = v163;
    v165 = *(_QWORD *)v351;
    while (2)
    {
      for (n = 0; n != v164; ++n)
      {
        if (*(_QWORD *)v351 != v165)
          objc_enumerationMutation(v162);
        if (objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * n)), "objectForKeyedSubscript:", objc_msgSend(v162, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * n))), "objectForKeyedSubscript:", CFSTR("CinematicVideoParameters")))
        {
          v167 = (void *)MEMORY[0x1A858DD40]();

          objc_msgSend((id)getPTDisparityPostProcessingClass(), "prewarmForCameraCaptured");
          objc_msgSend((id)getPTRenderPipelineClass(), "prewarmForCameraCaptured");
          objc_autoreleasePoolPop(v167);
          v108 = obja;
          goto LABEL_208;
        }
      }
      v164 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v350, &info, 16);
      v108 = obja;
      if (v164)
        continue;
      break;
    }
  }
LABEL_208:
  if (sDeviceUsesAnyVideoEffect)
    objc_msgSend((id)getPTEffectClass(), "prewarmForCameraCaptured");
  v168 = -[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs"));
  v350 = 0u;
  v351 = 0u;
  v352 = 0u;
  v353 = 0u;
  v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v350, &info, 16);
  if (v169)
  {
    v170 = v169;
    v171 = *(_QWORD *)v351;
    while (2)
    {
      for (ii = 0; ii != v170; ++ii)
      {
        if (*(_QWORD *)v351 != v171)
          objc_enumerationMutation(v168);
        if (-[FigCaptureCameraParameters chromaticDefringingEnabledForVideoForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "chromaticDefringingEnabledForVideoForPortType:sensorIDString:", *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * ii), objc_msgSend(v168, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * ii))))
        {
          objc_msgSend(v277, "addObject:", &unk_1E4A030C0);
          goto LABEL_220;
        }
      }
      v170 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v350, &info, 16);
      if (v170)
        continue;
      break;
    }
  }
LABEL_220:
  v173 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v174 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v174, "setObject:forKeyedSubscript:", v108, CFSTR("DefaultSensorIDs"));
  objc_msgSend(v173, "setObject:forKeyedSubscript:", -[FigCaptureCameraParameters commonNRFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonNRFParameters"), CFSTR("NRFParameters"));
  objc_msgSend(v174, "setObject:forKeyedSubscript:", v173, CFSTR("Common"));
  v286 = v174;
  objc_msgSend(v174, "setObject:forKeyedSubscript:", v108, CFSTR("DefaultSensorIDs"));
  v301 = 0u;
  v302 = 0u;
  v299 = 0u;
  v300 = 0u;
  v175 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v299, &v350, 16);
  if (v175)
  {
    v176 = v175;
    v177 = 0;
    v282 = *(_QWORD *)v300;
    v178 = MEMORY[0x1E0C9AA70];
    do
    {
      for (jj = 0; jj != v176; ++jj)
      {
        if (*(_QWORD *)v300 != v282)
          objc_enumerationMutation(obja);
        v180 = *(_QWORD *)(*((_QWORD *)&v299 + 1) + 8 * jj);
        v181 = objc_msgSend(obja, "objectForKeyedSubscript:", v180);
        v182 = objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", v180), "objectForKeyedSubscript:", v181), "objectForKeyedSubscript:", CFSTR("SoftISPTuning"));
        v177 |= v182 != 0;
        if (v182)
          v183 = v182;
        else
          v183 = v178;
        v184 = objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", v180), "objectForKeyedSubscript:", v181), "objectForKeyedSubscript:", CFSTR("ModuleConfig"));
        if (v184)
          v185 = v184;
        else
          v185 = v178;
        v348 = v181;
        v346[0] = CFSTR("SoftISPTuning");
        v346[1] = CFSTR("ModuleConfig");
        v347[0] = v183;
        v347[1] = v185;
        v349 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v347, v346, 2);
        objc_msgSend(v286, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v349, &v348, 1), v180);
      }
      v176 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v299, &v350, 16);
    }
    while (v176);
  }
  else
  {
    v177 = 0;
  }
  v186 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
  if ((v177 & 1) != 0 && v186 >= 3)
  {
    v187 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/NRFV%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), v186);
    v344[0] = CFSTR("bundlePath");
    v344[1] = CFSTR("classname");
    v345[0] = v187;
    v345[1] = CFSTR("SoftISPProcessor");
    v344[2] = CFSTR("tuningParameters");
    v345[2] = v286;
    objc_msgSend(v277, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v345, v344, 3));
  }
  v297 = 0u;
  v298 = 0u;
  v295 = 0u;
  v296 = 0u;
  v188 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v295, v343, 16);
  if (v188)
  {
    v189 = v188;
    v190 = *(_QWORD *)v296;
    do
    {
      for (kk = 0; kk != v189; ++kk)
      {
        if (*(_QWORD *)v296 != v190)
          objc_enumerationMutation(v276);
        v192 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * kk);
        v193 = (void *)MEMORY[0x1A858DD40]();
        info = 0;
        objc_msgSend(v192, "objectForKeyedSubscript:", CFSTR("sbpName"));
        objc_msgSend(v192, "objectForKeyedSubscript:", CFSTR("sbpOpts"));
        v194 = FigSampleBufferProcessorCreateForCustom();
        v195 = (const void *)info;
        if (*(_QWORD *)&info && !v194)
        {
          v196 = *(void (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
          if (v196)
            v196(v195);
          FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
          if (FigBaseObject)
          {
            v198 = FigBaseObject;
            v199 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
            if (v199)
              v199(v198);
          }
          v195 = (const void *)info;
        }
        if (v195)
          CFRelease(v195);
        objc_autoreleasePoolPop(v193);
      }
      v189 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v295, v343, 16);
    }
    while (v189);
  }
  v200 = -[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs"));
  v331 = 0u;
  v332 = 0u;
  v333 = 0u;
  v334 = 0u;
  v201 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v331, &info, 16);
  if (v201)
  {
    v202 = v201;
    v203 = *(_QWORD *)v332;
LABEL_257:
    v204 = 0;
    while (1)
    {
      if (*(_QWORD *)v332 != v203)
        objc_enumerationMutation(v200);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v331 + 1) + 8 * v204)), "objectForKeyedSubscript:", objc_msgSend(v200, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v331 + 1) + 8 * v204))), "objectForKeyedSubscript:", CFSTR("NRFParameters")), "objectForKeyedSubscript:", CFSTR("NRFParameters")), "objectForKeyedSubscript:", CFSTR("SemanticStyles")))
      {
        break;
      }
      if (v202 == ++v204)
      {
        v202 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v331, &info, 16);
        if (v202)
          goto LABEL_257;
        goto LABEL_265;
      }
    }
    if (smartStyleVersion)
      goto LABEL_265;
    v206 = v277;
    objc_msgSend(v277, "addObject:", &unk_1E4A030E8);
    v283 = 1;
    v205 = off_1E4915000;
  }
  else
  {
LABEL_265:
    v283 = 0;
    v205 = off_1E4915000;
    v206 = v277;
  }
  v207 = -[__objc2_class videoGreenGhostBrightLightMitigationVersion](-[__objc2_class sharedInstance](v205[135], "sharedInstance"), "videoGreenGhostBrightLightMitigationVersion");
  if ((_DWORD)v207)
  {
    v208 = v207;
    v209 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.bundle"), CFSTR("/System/Library/VideoProcessors/"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@V%d"), CFSTR("VideoDeghosting"), v207));
    v210 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMI%@V%d"), CFSTR("VideoDeghosting"), v208);
    v341[0] = CFSTR("bundlePath");
    v341[1] = CFSTR("classname");
    v342[0] = v209;
    v342[1] = v210;
    v341[2] = CFSTR("tuningParameters");
    v342[2] = objc_msgSend((id)-[__objc2_class commonVideoGreenGhostMitigationParameters](-[__objc2_class sharedInstance](v205[135], "sharedInstance"), "commonVideoGreenGhostMitigationParameters"), "objectForKeyedSubscript:", CFSTR("BrightLightMitigationParameters"));
    objc_msgSend(v206, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v342, v341, 3));
  }
  v211 = -[__objc2_class videoGreenGhostLowLightMitigationVersion](-[__objc2_class sharedInstance](v205[135], "sharedInstance"), "videoGreenGhostLowLightMitigationVersion");
  if ((_DWORD)v211)
  {
    v212 = v211;
    v213 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.bundle"), CFSTR("/System/Library/VideoProcessors/"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@V%d"), CFSTR("VideoDeghosting"), v211));
    v214 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMI%@V%d"), CFSTR("VideoDeghosting"), v212);
    v339[0] = CFSTR("bundlePath");
    v339[1] = CFSTR("classname");
    v340[0] = v213;
    v340[1] = v214;
    v339[2] = CFSTR("tuningParameters");
    v340[2] = objc_msgSend((id)-[__objc2_class commonVideoGreenGhostMitigationParameters](-[__objc2_class sharedInstance](v205[135], "sharedInstance"), "commonVideoGreenGhostMitigationParameters"), "objectForKeyedSubscript:", CFSTR("LowLightMitigationParameters"));
    objc_msgSend(v206, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v340, v339, 3));
  }
  if (smartStyleVersion)
  {
    v215 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.bundle"), CFSTR("/System/Library/VideoProcessors/"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@V%d"), CFSTR("SmartStyle"), smartStyleVersion));
    v216 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMI%@V%d"), CFSTR("SmartStyleProcessor"), smartStyleVersion);
    v337[0] = CFSTR("bundlePath");
    v337[1] = CFSTR("classname");
    v338[0] = v215;
    v338[1] = v216;
    objc_msgSend(v206, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v338, v337, 2));
  }
  if (constantColorVersion)
  {
    v217 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.bundle"), CFSTR("/System/Library/VideoProcessors/"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@V%d"), CFSTR("ColourConstancy"), constantColorVersion));
    v218 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMI%@V%d"), CFSTR("ColourConstancyProcessor"), constantColorVersion);
    v335[0] = CFSTR("bundlePath");
    v335[1] = CFSTR("classname");
    v336[0] = v217;
    v336[1] = v218;
    objc_msgSend(v206, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v336, v335, 2));
  }
  v293 = 0u;
  v294 = 0u;
  v291 = 0u;
  v292 = 0u;
  v219 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v291, &v331, 16);
  if (v219)
  {
    v220 = v219;
    v221 = *(_QWORD *)v292;
    do
    {
      for (mm = 0; mm != v220; ++mm)
      {
        if (*(_QWORD *)v292 != v221)
          objc_enumerationMutation(v277);
        v223 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * mm);
        v224 = objc_msgSend(v223, "objectForKeyedSubscript:", CFSTR("bundlePath"));
        v225 = objc_msgSend(v223, "objectForKeyedSubscript:", CFSTR("classname"));
        v226 = objc_msgSend(v223, "objectForKeyedSubscript:", CFSTR("tuningParameters"));
        LODWORD(v327) = 0;
        info = 0;
        v227 = (void *)MEMORY[0x1A858DD40]();
        v228 = 0;
        v229 = 0;
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v224))
        {
          v230 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v224);
          v228 = v230;
          if (!v230)
            goto LABEL_296;
          if (!objc_msgSend(v230, "loadAndReturnError:", &info))
          {
LABEL_295:
            v228 = 0;
LABEL_296:
            v229 = 0;
            goto LABEL_297;
          }
          if (v225)
            v231 = (void *)objc_msgSend(v228, "classNamed:", v225);
          else
            v231 = (void *)objc_msgSend(v228, "principalClass");
          v228 = v231;
          if (!v231)
            goto LABEL_296;
          if (objc_msgSend(v231, "conformsToProtocol:", &unk_1EE71A908))
          {
            v232 = (void *)objc_opt_new();
            v228 = v232;
            if (v232)
            {
              objc_msgSend(v232, "setTuningParameters:", v226);
              objc_msgSend(v228, "setCameraInfoByPortType:", MEMORY[0x1E0C9AA70]);
              LODWORD(v327) = objc_msgSend(v228, "setup");
              if (!(_DWORD)v327)
              {
                v229 = 0;
                LODWORD(v327) = objc_msgSend(v228, "prewarm");
                goto LABEL_297;
              }
            }
            goto LABEL_296;
          }
          if (!objc_msgSend(v228, "instancesRespondToSelector:", sel_prewarmWithTuningParameters_))
            goto LABEL_295;
          v229 = (void *)objc_opt_new();
          if (v229)
          {
            v233 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C0]), "initWithTarget:selector:object:", v229, sel_prewarmWithTuningParameters_, v226);
            objc_msgSend(v233, "start");
            objc_msgSend((id)objc_msgSend(v233, "result"), "getValue:", &v327);

          }
          v228 = 0;
        }
LABEL_297:

        objc_autoreleasePoolPop(v227);
      }
      v220 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v291, &v331, 16);
    }
    while (v220);
  }
  if (v272)
    v234 = -[FigCaptureCameraParameters coreImagePortraitFilterVersion](v274, "coreImagePortraitFilterVersion");
  else
    v234 = 0;
  v235 = (void *)MEMORY[0x1A858DD40]();
  +[BWCoreImageFilterRenderer prewarmPortraitFilterVersion:semanticStyleFilters:](BWCoreImageFilterRenderer, "prewarmPortraitFilterVersion:semanticStyleFilters:", v234, v283);
  v236 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", v280), "objectForKeyedSubscript:", objc_msgSend(obja, "objectForKeyedSubscript:", v280));
  LODWORD(v237) = 1.0;
  v238 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v236, v237);
  if (v238)
  {
    v239 = v238;
    v240 = objc_msgSend((id)objc_msgSend(v238, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
    if (objc_msgSend(v239, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HairNetV%d"), v240)))
    {
      +[BWCoreImageFilterRenderer prewarmCoreImageSDOFRenderingFilter](BWCoreImageFilterRenderer, "prewarmCoreImageSDOFRenderingFilter");
    }
  }
  objc_autoreleasePoolPop(v235);
  if (sPocketDetectionSupported)
    +[BWPocketDetectionFFTProcessor prewarmShaders](BWPocketDetectionFFTProcessor, "prewarmShaders");
  if (v272)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v241 = (void *)MEMORY[0x1A858DD40]();
      objc_msgSend(MEMORY[0x1E0CFCDA8], "prewarm");
      objc_autoreleasePoolPop(v241);
    }
    if (-[BWInferenceEngine isConfiguredForInference](v273, "isConfiguredForInference"))
      -[BWInferenceEngine prewarmInferencesUsingLimitedMemory:](v273, "prewarmInferencesUsingLimitedMemory:", 1);
  }
  v242 = -[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs"));
  v327 = 0u;
  v328 = 0u;
  v329 = 0u;
  v330 = 0u;
  v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v327, &info, 16);
  if (v243)
  {
    v244 = v243;
    v245 = *(_QWORD *)v328;
    while (2)
    {
      for (nn = 0; nn != v244; ++nn)
      {
        if (*(_QWORD *)v328 != v245)
          objc_enumerationMutation(v242);
        if (objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v288, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v327 + 1) + 8 * nn)), "objectForKeyedSubscript:", objc_msgSend(v242, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v327 + 1) + 8 * nn))), "objectForKeyedSubscript:", CFSTR("RedEyeReductionParameters")))
        {
          v247 = (void *)MEMORY[0x1A858DD40]();
          +[BWRedEyeReductionController prewarm](BWRedEyeReductionController, "prewarm");
          objc_autoreleasePoolPop(v247);
          goto LABEL_322;
        }
      }
      v244 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v327, &info, 16);
      if (v244)
        continue;
      break;
    }
  }
LABEL_322:
  v248 = -[FigMetalHistogram initWithMetalContext:]([FigMetalHistogram alloc], "initWithMetalContext:", 0);
  objc_msgSend(MEMORY[0x1E0D08AF8], "prewarmShadersForFeatures:", sDeviceSWFRVersion == 2);

  objc_autoreleasePoolPop(context);
  v249 = -[FigCaptureCameraParameters cameraTuningParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraTuningParameters");
  v250 = -[NSDictionary objectForKeyedSubscript:](v249, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs"));
  v417 = 0u;
  v418 = 0u;
  v419 = 0u;
  v420 = 0u;
  v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v417, &info, 16);
  if (v251)
  {
    v252 = v251;
    v253 = *(_QWORD *)v418;
    while (2)
    {
      for (i1 = 0; i1 != v252; ++i1)
      {
        if (*(_QWORD *)v418 != v253)
          objc_enumerationMutation(v250);
        if (objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v249, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v417 + 1) + 8 * i1)), "objectForKeyedSubscript:", objc_msgSend(v250, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v417 + 1) + 8 * i1))), "objectForKeyedSubscript:", CFSTR("DeepFusionParameters")))
        {
          info = 0;
          if (FigInitialiseDeferredShaderCacheCopySemaphore_onceToken != -1)
            dispatch_once(&FigInitialiseDeferredShaderCacheCopySemaphore_onceToken, &__block_literal_global_414);
          sysctlbyname("kern.bootsessionuuid", 0, (size_t *)&info, 0, 0);
          if (*(_QWORD *)&info && (v255 = malloc_type_malloc(*(_QWORD *)&info, 0x34947F09uLL)) != 0)
          {
            v256 = v255;
            sysctlbyname("kern.bootsessionuuid", v255, (size_t *)&info, 0, 0);
            v257 = NSTemporaryDirectory();
            if (FigCaptureCameracapturedEnabled())
              v258 = CFSTR("/cameracaptured.copysession");
            else
              v258 = CFSTR("/mediaserverd.copysession");
            v259 = -[NSString stringByAppendingPathComponent:](v257, "stringByAppendingPathComponent:", v258);
            v260 = objc_alloc(MEMORY[0x1E0C99D80]);
            v261 = (id)objc_msgSend(v260, "initWithContentsOfURL:error:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v259), 0);
            if (!v261
              || (v262 = (void *)objc_msgSend(v261, "objectForKeyedSubscript:", CFSTR("BootSessionUUID")),
                  (objc_msgSend(v262, "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v256)) & 1) == 0))
            {
              v263 = (void *)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
              objc_msgSend(v263, "unloadShaderCaches");
              if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mobile/Library/Caches/com.apple.deferredmediad/com.apple.metal"), 1, 0, 0)|| (objc_msgSend(v263, "copyShaderCacheToPath:", CFSTR("/private/var/mobile/Library/Caches/com.apple.deferredmediad/com.apple.metal")) & 1) == 0)
              {
                fig_log_get_emitter();
                v269 = v1;
                LODWORD(pixelsa) = 0;
                FigDebugAssert3();
              }
              *(_QWORD *)&v417 = 0;
              v381[0] = CFSTR("BootSessionUUID");
              v384[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v256, pixelsa, v269);
              v264 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v384, v381, 1);
              objc_msgSend(v264, "writeToURL:error:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v259), &v417);
              if ((_QWORD)v417)
              {
                fig_log_get_emitter();
                LODWORD(pixelsa) = 0;
                FigDebugAssert3();
                objc_msgSend((id)v417, "code", pixelsa, v1);
                FigSignalErrorAt();
              }
            }
          }
          else
          {
            fig_log_get_emitter();
            v269 = v1;
            LODWORD(pixelsa) = 0;
            FigDebugAssert3();
            v256 = 0;
          }
          free(v256);
          dispatch_semaphore_signal((dispatch_semaphore_t)sDeferredShaderCacheCopySemaphore);
          goto LABEL_347;
        }
      }
      v252 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v417, &info, 16);
      if (v252)
        continue;
      break;
    }
  }
LABEL_347:
  objc_msgSend(MEMORY[0x1E0C9DDD0], "clearCache", pixelsa, v269);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "clearCache");

  return mach_absolute_time();
}

@end
